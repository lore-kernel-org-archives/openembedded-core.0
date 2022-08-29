X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <0f4a63bc-4be4-126d-a403-804f75140a53@berginkonsult.se>
Date: Mon, 29 Aug 2022 13:09:11 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sdk: extend rust test to also use a build script
References: <20220823085636.30868-1-peter@berginkonsult.se>
 <20220823085636.30868-2-peter@berginkonsult.se>
 <6ca1d415a0faeba53e6a3945bd1fafd89866e2e9.camel@linuxfoundation.org>
 <f7469b7e-7df2-e418-6da0-7427bbdc8cfd@berginkonsult.se>
 <af63da104ec9d91ab441d3cabfaadfe4700760fa.camel@linuxfoundation.org>
 <b6d8218a-043e-cb3a-3783-5fe1ce6e4541@berginkonsult.se>
 <093ee50ae3296829910f9c6a32209002aa7a2461.camel@linuxfoundation.org>
From: "Peter Bergin" <peter@berginkonsult.se>
In-Reply-To: <093ee50ae3296829910f9c6a32209002aa7a2461.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>

Hi Richard,

(also adding Khem Raj to CC as maintainer for gcc in oe-core)

On 2022-08-25 17:25, Richard Purdie wrote:
> On Thu, 2022-08-25 at 14:03 +0200, Peter Bergin wrote:
>> Hi Richard,
>>
>> On 2022-08-25 10:21, Richard Purdie wrote:
>>> <snip>
>>>> I've tried locally to reproduce something. I've built and tested
>>>> genericx86 and qemuarm64 now on core-image-sato sdk that I saw was the
>>>> target for the autobuilder. Both tests passes. The failure I see in the
>>>> autobuilder logs is that the build script can not be executed. On my
>>>> machine I have that file and it can clearly be executed:
>>>>
>>>> $ find
>>>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/
>>>> -name build-script-build
>>>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>>>
>>>> $
>>>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>>>
>>>> $ file
>>>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>>>
>>>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build:
>>>> ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically
>>>> linked, interpreter
>>>> /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2,
>>>> BuildID[sha1]=c5d5e70657f8342addf5343d0206c77d9d767fd8, for GNU/Linux
>>>> 3.2.0, with debug_info, not stripped
>>>>
>>>> Found one interesting link here
>>>> https://github.com/rust-lang/cargo/issues/3553. Unfortunately without
>>>> answer. But also checked the interpreter in my build which looks correct?
>>>>
>>>> $ readelf -a
>>>> tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/hello/target/debug/build/hello-4dbf26d86b93a892/build-script-build
>>>>> grep interpreter
>>>>          [Requesting program interpreter:
>>>> /storage/yocto/esp5-platform/build/genericx86/tmp/work/genericx86-poky-linux/core-image-sato/1.0-r0/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2]
>>>>
>>>>
>>>> So there are some differences between my machine and the autobuilder
>>>> setup that I can't get. I would need help here as I'm not that familiar
>>>> with the autobuilder setup. Can it still be some host dependency? I'm
>>>> running on Ubuntu 22.04. Is it possible to check in a autobuilder setup
>>>> if the file 'build-script-build' is present and possible to execute?
>>> After staring at this for an hour, I think the pattern is that is it
>>> failing on builds with:
>>>
>>> SDKMACHINE = "i686"
>>>
>>> which probably means the linker isn't linking against the libc and
>>> loader in the SDK properly.
>>>
>>> (i686 SDK binaries should run on x86_64 hosts since we provide our own
>>> loader and libc)
>> Thanks a lot for the reproducer. You are correct, with SDKMACHINE i686 I
>> was able to reproduce. I want to share some weird stuff and see if
>> someone can get a clue for a solution.
>>
>> Did same analyze on the build-script-build file as I did on a working one:
> As I suspected, the dynamic loader on binaries built using the
> toolchain in the SDK isn't working correctly.
>
> "/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-
> linux/lib/ld-linux.so.2"
>
> is the value used at build time. This is supposed to be relocated into
> the SDK's install location at runtime.
>
> The question is therefore where is rust getting this value from? You
> can specify it to the linker at compile time along the lines of:
>
> -Wl,--dynamic-linker=/path/to/ld-linux.so.2
>
> or it can be the default that comes from toolchain. It is important it
> points at the one in the SDK, not on the host system.
>
> The bit I don't understand is whether:
>
> a) the compiler in the SDK is generating the wrong loader (in which
> case buildtools-extended-tarball would break which it doesn't)
> b) rust is hardcoding some dynamic-linker option somewhere it shouldn't
> c) whether the toolchain is relocating paths correctly or some path
> isn't relocating and is being used here.
>
> I'd suggest first checking that a binary generated by nativesdk-gcc in
> the SDK has the right loader. If that is the case, see what compiler
> options are being used to create the build tool and go from there.
>
> FWIW you can see/change the interpreter with patchelf.
>
> Cheers,
>
> Richard

I've tried to narrow this down further and I can say now that this error 
when building the native rust build script is not directly related to 
cargo/rust but to the native gcc compiler shipped in the SDK. I will 
next try to dig down in the gcc build process but before spending time 
there I would like to share my finding and see if someone have ideas.

I have two SDKs one with SDKMACHINE="x86_64" and one with 
SDKMACHINE="i686". I have the hosts gcc compiler installed in them and 
use them to compile a minimal c code example with hello world. The one 
for "x86_64" works well and is using the program interpreter from the 
SDK. The executable compiled and linked with "i686" toolchain will have 
a program interpreter pointing to 
"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2". 
I will paste in output from the two experiments here below:

x86_64:

$ 
<sdk-install>/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linux-gcc 
main.c
$ ./a.out
Hello world!
$ readelf -a a.out | grep interpreter
       [Requesting program interpreter: 
<sdk-install>/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2]
$ 
<sdk-install>/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-pokysdk-linux-gcc 
-dumpspecs | grep -A 1 *dynamic_linker

i686:

$ 
<sdk-install>/sysroots/i686-pokysdk-linux/usr/bin/i686-pokysdk-linux-gcc 
main.c
$ ./a.out
-bash: ./a.out: No such file or directory
$ readelf -a a.out | grep interpreter
       [Requesting program interpreter: 
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2] 

$ 
<sdk-install>/sysroots/i686-pokysdk-linux/usr/bin/i686-pokysdk-linux-gcc 
-dumpspecs | grep -A 1 *dynamic_linker
*dynamic_linker:
%{muclibc:%rld-uClibc.so.0;:%{mbionic:/system/bin/linker;:%{mmusl:/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-musl-i386.so.1;:/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/lib/ld-linux.so.2}}} 


Noted above is that the spec-file (-dumpspecs) for i686 have a sections 
with "*dynamic_linker" but that one is missing in x86_64.

So my conclusion around the results above is that something seems 
missconfigured in the nativesdk-gcc build for i686. When cargo/rust is 
using the native compiler to build its build script it is set to use 
wrong program interpreter and when executed it fails just as my a.out 
above does. I hope this can give you some more ideas where to look next 
and ultimately how to solve this.

Best regards,
/Peter



