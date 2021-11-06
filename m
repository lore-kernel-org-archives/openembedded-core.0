X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <bcb52516-3875-6b91-0956-c2190a6bb2a1@pr.hu>
Date: Sat, 6 Nov 2021 19:30:01 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] cargo-native do_fetch error
References: <f0e5dc36-2447-1501-84da-862f43ed5f83@pr.hu>
 <AM9PR09MB4642477F746163FF39C94CAAA88F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
In-Reply-To: <AM9PR09MB4642477F746163FF39C94CAAA88F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Konrad Weihmann <kweihmann@outlook.com>, openembedded-core@lists.openembedded.org

2021. 11. 06. 14:02 keltezéssel, Konrad Weihmann írta:
> 
> 
> On 06.11.21 13:49, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> I tried building my custom OS rebased on current master.
>>
>> I got this error:
>>
>> ERROR: cargo-native-1.56.0-r0 do_fetch: No checksum specified for 
>> '/data/genericx86-64-yocto-3.5/downloads/rustc-1.56.0-src.tar.xz', please add at least 
>> one to the recipe:
>> SRC_URI[rust.sha256sum] = 
>> "f13468889833c88e744ad579c5d8fbb7ecb53216159b54481a90e5dcdaa9e320"
>> ERROR: cargo-native-1.56.0-r0 do_fetch: Bitbake Fetcher Error: NoChecksumError('Missing 
>> SRC_URI checksum', 'https://static.rust-lang.org/dist/rustc-1.56.0-src.tar.xz;name=rust')
>> ERROR: Logfile of failure stored in: 
>> /data/genericx86-64-yocto-3.5/tmp-sicom-glibc/work/x86_64-linux/cargo-native/1.56.0-r0/temp/log.do_fetch.3495409 
> 
> 
> Could you kindly double check your setup, because at 
> meta/recipes-devtools/rust/rust-source.inc one will find
> 
> SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
> SRC_URI[rust.sha256sum] = "f13468889833c88e744ad579c5d8fbb7ecb53216159b54481a90e5dcdaa9e320"
> 
> which looks okayish to me.
> And this include is direct injected in meta/recipes-devtools/cargo/cargo_1.56.0.bb right 
> at the first line

I saw that file and that's why I wondered.

> Maybe this file went missing or was otherwise masked in your setup

No, it's there and not masked.

The problem was that I didn't realize that oe-core master has merged meta-rust.
I still had the standalone meta-rust in my repo manifest xml.
After removing it, cargo(-native) can be fetched and built just fine.

Sorry for the noise.

> 
> 
>>
>> ERROR: Task 
>> (virtual:native:/data/genericx86-64-yocto-3.5/conf/../layers/openembedded-core/meta/recipes-devtools/cargo/cargo_1.56.0.bb:do_fetch) 
>> failed with exit code '1'
>>
>> I found no bbappend for cargo or rust in any layers I currently use
>> so it must be a genuine bug in Yocto 3.5 at the moment.
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>>
>> 
>>

