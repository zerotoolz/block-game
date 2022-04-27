// SPDX-License-Identifier: MIT
pragma solidity >=0.4.19; //solidity version

contract ZombieFactory { //contract name, the function takes zombie name and generates ramdon zombie after add it blockchain

    event NewZombie(uint zombieId, string name, uint dna); //event new zombie check

    uint dnaDigits = 16; //zombie skin
    uint dnaModulus = 10 ** dnaDigits; //zombie skin check = exact 16 digits

    struct Zombie {
        string name; //zombie name
        uint dna; // zombie skin
    }

    Zombie[] public zombies; //zombie array structure stogare with public access

    function _createZombie (string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1; // recently new zombie addedid
        NewZombie(id, _name, _dna); //new zombie event related 
    } 

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(_str)); //keccakfrom _str
        return rand % dnaModulus; // zombie skin with exact 16 digits
    }
    
        function createRandomZombie(string memory _name) public { //random, zombie creation
        uint randDna = _generateRandomDna(_name); // skin and name creation 
        _createZombie(_name, randDna); // creation
    
    }
}
