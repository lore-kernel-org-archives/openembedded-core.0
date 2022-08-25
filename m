X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
Date: Thu, 25 Aug 2022 09:17:55 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a build script
References: <20220823085636.30868-1-peter@berginkonsult.se>
 <20220823085636.30868-2-peter@berginkonsult.se>
 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org

Hi Richard,

On 2022-08-24 10:52, Richard Purdie wrote:
> On Tue, 2022-08-23 at 10:56 +0200, Peter Bergin wrote:
>> The test for rust in the SDK is extended with the simplest
>> possible build script. This will make use of the host toolchain
>> for building build.rs before building the rust package for target.
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> ---
>>   meta/lib/oeqa/sdk/files/rust/hello/build.rs | 3 +++
>>   1 file changed, 3 insertions(+)
>>   create mode 100644 meta/lib/oeqa/sdk/files/rust/hello/build.rs
>>
>> diff --git a/meta/lib/oeqa/sdk/files/rust/hello/build.rs b/meta/lib/oeqa/sdk/files/rust/hello/build.rs
>> new file mode 100644
>> index 00000000000..b1a533d5dfa
>> --- /dev/null
>> +++ b/meta/lib/oeqa/sdk/files/rust/hello/build.rs
>> @@ -0,0 +1,3 @@
>> +/* This is the simplest build script just to invoke host compiler
>> +   in the build process. */
>> +fn main() {}
> This seemed to break everywhere :(
Not good. :-|
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/5773/steps/13/logs/stdio
>
> and many others.

I've tried locally to reproduce something. I've built and tested 
genericx86 and qemuarm64 now on core-image-sato sdk that I saw was the 
target for the autobuilder. Both tests passes. The failure I see in the 
autobuilder logs is that the build script can not be executed. On my 
machine I have that file and it can clearly be executed:

$ find 
tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/ 
-name build-script-build
tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build 

$ 
tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build 

$ file 
tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build 

tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build: 
ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically 
linked, interpreter 
/storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2, 
BuildID[sha1]=c5d5e70657f8342addf5343d0206c77d9d767fd8, for GNU/Linux 
3.2.0, with debug_info, not stripped

Found one interesting link here 
https://github.com/rust-lang/cargo/issues/3553. Unfortunately without 
answer. But also checked the interpreter in my build which looks correct?

$ readelf -a 
tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build 
| grep interpreter
       [Requesting program interpreter: 
/storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2] 


So there are some differences between my machine and the autobuilder 
setup that I can't get. I would need help here as I'm not that familiar 
with the autobuilder setup. Can it still be some host dependency? I'm 
running on Ubuntu 22.04. Is it possible to check in a autobuilder setup 
if the file 'build-script-build' is present and possible to execute?

Best regards,
/Peter

