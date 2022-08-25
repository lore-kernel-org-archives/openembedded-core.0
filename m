X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
Date: Thu, 25 Aug 2022 14:03:28 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a build script
References: <20220823085636.30868-1-peter@berginkonsult.se>
 <20220823085636.30868-2-peter@berginkonsult.se>
 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org

Hi Richard,

On 2022-08-25 10:21, Richard Purdie wrote:
> <snip>
>> I've tried locally to reproduce something. I've built and tested
>> genericx86 and qemuarm64 now on core-image-sato sdk that I saw was the
>> target for the autobuilder. Both tests passes. The failure I see in the
>> autobuilder logs is that the build script can not be executed. On my
>> machine I have that file and it can clearly be executed:
>>
>> $ find
>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/
>> -name build-script-build
>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>
>> $
>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>
>> $ file
>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>
>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build:
>> ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically
>> linked, interpreter
>> /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2,
>> BuildID[sha1]=c5d5e70657f8342addf5343d0206c77d9d767fd8, for GNU/Linux
>> 3.2.0, with debug_info, not stripped
>>
>> Found one interesting link here
>> https://github.com/rust-lang/cargo/issues/3553. Unfortunately without
>> answer. But also checked the interpreter in my build which looks correct?
>>
>> $ readelf -a
>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>> grep interpreter
>>         [Requesting program interpreter:
>> /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2]
>>
>>
>> So there are some differences between my machine and the autobuilder
>> setup that I can't get. I would need help here as I'm not that familiar
>> with the autobuilder setup. Can it still be some host dependency? I'm
>> running on Ubuntu 22.04. Is it possible to check in a autobuilder setup
>> if the file 'build-script-build' is present and possible to execute?
> After staring at this for an hour, I think the pattern is that is it
> failing on builds with:
>
> SDKMACHINE = "i686"
>
> which probably means the linker isn't linking against the libc and
> loader in the SDK properly.
>
> (i686 SDK binaries should run on x86_64 hosts since we provide our own
> loader and libc)

Thanks a lot for the reproducer. You are correct, with SDKMACHINE i686 I 
was able to reproduce. I want to share some weird stuff and see if 
someone can get a clue for a solution.

Did same analyze on the build-script-build file as I did on a working one:

$ 
/storage/yocto/esp5-platform/build/qemuarm64/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-2c1c69e3bd7e958d/build-script-build 

-bash: 
/storage/yocto/esp5-platform/build/qemuarm64/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-2c1c69e3bd7e958d/build-script-build: 
No such file or directory
$ file 
/storage/yocto/esp5-platform/build/qemuarm64/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-2c1c69e3bd7e958d/build-script-build 

/storage/yocto/esp5-platform/build/qemuarm64/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-2c1c69e3bd7e958d/build-script-build: 
ELF 32-bit LSB pie executable, Intel 80386, version 1 (SYSV), 
dynamically linked, interpreter 
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2, 
BuildID[sha1]=4c32d67e8597f30ce774e2bb32ea5170b9878957, for GNU/Linux 
3.2.0, with debug_info, not stripped
$ ldd 
/storage/yocto/esp5-platform/build/qemuarm64/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-2c1c69e3bd7e958d/build-script-build 

     linux-gate.so.1 (0xf7f62000)
     libgcc_s.so.1 => /lib32/libgcc_s.so.1 (0xf7ecd000)
     libc.so.6 => /lib32/libc.so.6 (0xf7c9c000)
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0xf7f64000)
$ readelf -a 
/storage/yocto/esp5-platform/build/qemuarm64/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-2c1c69e3bd7e958d/build-script-build 
| grep interpreter
       [Requesting program interpreter: 
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2] 


The interpreter is wrong and pointing to a non existing file. It has 
'/usr/local/oe-sdk-hardcoded-buildpath' in its path which seems really 
bad and is equal to SDKPATH variable.

Best regards,
/Peter


