require_relative 'spec_helper.rb'

describe PigLatin do
  it "exists" do
    expect(PigLatin).to be_a(Module)
  end

  describe '.to_pig_latin' do
    context "words that begin with consonant sounds" do
      it "moves the consonant cluster to the end and appends 'ay'" do
        expect(PigLatin.to_pig_latin('glove')).to eq('oveglay')
        expect(PigLatin.to_pig_latin('house')).to eq('ousehay')
      end
    end

    context "words that begin with vowel sounds or a silent letter" do
      it "adds 'way' to the end of the word" do
        expect(PigLatin.to_pig_latin('egg')).to eq('eggway')
      end
    end

    context "words where the first vowel-like letter encountered is 'y'" do
      context "words where 'y' is the first letter" do
        it "moves 'y' to the end of the word and appends 'ay'" do
          expect(PigLatin.to_pig_latin('yellow')).to eq('ellowyay')
        end
      end
      context "words where consonants come before 'y'" do
        it "moves the consonants to the end of the word and appends 'ay" do
          expect(PigLatin.to_pig_latin('rhythm')).to eq('ythmrhay')
        end
      end
    end
  end
end
