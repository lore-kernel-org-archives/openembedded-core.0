Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B02E6E9A9;
	Fri, 31 Jan 2014 22:08:55 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id to1so4878852ieb.40
	for <multiple recipients>; Fri, 31 Jan 2014 14:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lRsw/yayEnU/XjUloNGuIJv+aIbljDCILYsfWnk1HAg=;
	b=OC2t//yf/4FL7HLqb1TJAAivXUcJpc6/4WSy1+HdtgJKS00faUUxLKs6nLIG7ckeOM
	0E32iKga8zrDlqVIrdoy+CSVUxFiyLo+U8EGu1ULdLYsck3aZSItv734LIN1Tbkwl2Hj
	7GKk6Ly6PCWq/TCoDyPpG2NP3nK67Nrg1HqZZeOU/iEmUb2FzkuR0Hd6qyrkR7wzQy/e
	sTn013jJ3owT494PUbbvM25KW0wTC8OE16JWhoEvT3TsYR1RRA/MzhlrYMGOHk7rjRk3
	bDb3OPmzgCoWNdsoKyPRnL0Tt1/hkcJ5CJtokv/QiU+mT8G7o3TGt8vlQ0KCwTJPChYC
	Stiw==
X-Received: by 10.50.147.72 with SMTP id ti8mr821251igb.20.1391206136486; Fri,
	31 Jan 2014 14:08:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Fri, 31 Jan 2014 14:08:26 -0800 (PST)
In-Reply-To: <52EC1764.8080602@linux.intel.com>
References: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
	<52B30EE5.6050901@linux.intel.com>
	<CAMKF1sqABZeBKTBP-MB3HvOFfBadofBQaaaMf8u2F5ExmCiVrw@mail.gmail.com>
	<52EC1764.8080602@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Jan 2014 14:08:26 -0800
Message-ID: <CAMKF1soCsegjEBaeE+Z1bzXOrLobnMkcuSWMQuVDw1yhfx-DSw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Binutils upgrade to 2.24
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2014 22:08:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 31, 2014 at 1:36 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/29/2014 08:33 PM, Khem Raj wrote:
>>
>> On Thu, Dec 19, 2013 at 7:21 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> On 12/16/2013 12:03 PM, Khem Raj wrote:
>>>>
>>>>
>>>> Hi
>>>>
>>>> I have pushed a contrib branch for binutils 2.24 upgrade here
>>>>
>>>>
>>>>
>>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.24
>>>>
>>>> I have tested it on both uclibc/eglibc and qemu machines. But it would
>>>> be nice if
>>>> it gets more testing for machines I havent tested
>>>>
>>>
>>> Looks like we tickled an LD bug of somekind, we are seeing the following
>>> failure across all machines, this was a second build using binutils 2.24,
>>> so
>>> there was some shared state usage.
>>>
>>> RP pointed out the --as-needed option was used with -lm as those symbols
>>> are
>>> math related.
>>>
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>>>>
>>>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>>>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>>>
>>>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>>>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwconfig
>>>> iwconfig.o
>>>> libiw.so.29 -lm
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>>>>
>>>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>>>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>>>
>>>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>>>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwlist iwlist.o
>>>> libiw.so.29 -lm
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>>>>
>>>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>>>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>>>
>>>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>>>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwpriv iwpriv.o
>>>> libiw.so.29 -lm
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>>>>
>>>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>>>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>>>
>>>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>>>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwspy iwspy.o
>>>> libiw.so.29 -lm
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>>>>
>>>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>>>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>>>
>>>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>>>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwgetid
>>>> iwgetid.o
>>>> libiw.so.29 -lm
>>>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>>>>
>>>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>>>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>>>>
>>>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>>>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwevent
>>>> iwevent.o
>>>> libiw.so.29 -lm
>>>> | libiw.so.29: undefined reference to `ceil'
>>>> | libiw.so.29: undefined reference to `pow'
>>>> | libiw.so.29: undefined reference to `log10'
>>>> | libiw.so.29: undefined reference to `floor'
>>>> | collect2: error: ld returned 1 exit status
>>>> | make: *** [iwconfig] Error 1
>>>> | make: *** Waiting for unfinished jobs....
>>>> | libiw.so.29: undefined reference to `ceil'
>>>> | libiw.so.29: undefined reference to `pow'
>>>> | libiw.so.29: undefined reference to `log10'
>>>> | libiw.so.29: undefined reference to `floor'
>>>> | collect2: error: ld returned 1 exit status
>>>> | make: *** [iwgetid] Error 1
>>>> | libiw.so.29: undefined reference to `ceil'
>>>> | libiw.so.29: undefined reference to `pow'
>>>> | libiw.so.29: undefined reference to `log10'
>>>> | libiw.so.29: undefined reference to `floor'
>>>> | collect2: error: ld returned 1 exit status
>>>> | make: *** [iwspy] Error 1
>>>> | libiw.so.29: undefined reference to `ceil'
>>>> | libiw.so.29: undefined reference to `pow'
>>>> | libiw.so.29: undefined reference to `log10'
>>>> | libiw.so.29: undefined reference to `floor'
>>>> | collect2: error: ld returned 1 exit status
>>>> | make: *** [iwpriv] Error 1
>>>> | libiw.so.29: undefined reference to `ceil'
>>>> | libiw.so.29: undefined reference to `pow'
>>>> | libiw.so.29: undefined reference to `log10'
>>>> | libiw.so.29: undefined reference to `floor'
>>>> | collect2: error: ld returned 1 exit status
>>>> | make: *** [iwlist] Error 1
>>>> | libiw.so.29: undefined reference to `ceil'
>>>> | libiw.so.29: undefined reference to `pow'
>>>> | libiw.so.29: undefined reference to `log10'
>>>> | libiw.so.29: undefined reference to `floor'
>>>> | collect2: error: ld returned 1 exit status
>>>> | make: *** [iwevent] Error 1
>>>> | ERROR: oe_runmake failed
>>>
>>>
>>>
>>
>> I tested OE-Core builds for qemuppc
>>
>> 1. build from scratch  ( MACHINE=qemuppc bitbake wirelesstools)
>> 2. build from sstate ( MACHINE=qemuppc bitbake -cclean wirelesstools
>> and then step 1)
>> 3. Build second time just wireless-tools ( MACHINE=qemuppc bitbake
>> -ccleanall wirelesstools and then step 1 )
>> 4. Rebuild all from sstate ( rm -rf tmp/ and then step 1)
>>
>> I could not reproduce this issue at all. The differences are I did it
>> with OE-Core and not with Poky autbuilders run with poky distro
>> policies.
>> we should also actually regress OE-Core alone
>>
>> My build machine here is debian/wheezy and ubuntu 12.04 both 64bit)
>>
>> I am on commit c3f3fed1b397b6ee6d44e7d39e63d084e4a88e30 of OE-Core
>>
>> At this point I am out of ideas how to reproduce this.
>>
>> If there is some other developer out there who can try this patch and
>> get the same errors,that would be interesting and probably we
>> will get to root of it.
>>
>>
> Sorry Khem, failed again!
>
> Build Configuration:
> BB_VERSION        = "1.21.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-13.10"
> TARGET_SYS        = "powerpc-poky-linux"
> MACHINE           = "qemuppc"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.5+snapshot-20140131"
> TUNE_FEATURES     = "m32 fpu-hard ppc7400 altivec"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    = "mut:980faeefaac3466aff38822479bf7d9fff4994eb"
>
>
> I did a bitbake -c cleansstate binutils-native eglibc wireless-tools
> followed by a bitbake of wireless-tools and I still get this same failure.
>

OK still cant get it here. For above, you did those cmds on clean tmp/
and sstate being around ? or tmp with previous build in there


> My build info above.
>
> I tried with OE-Core alone and still got the same failure (this time with
> ARM!)
>
> Build Configuration:
> BB_VERSION        = "1.21.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-13.10"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "qemuarm"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "armv5 thumb dsp"
> TARGET_FPU        = "soft"
> meta              = "binutils:e20eeca128f362d500e19c5757e13cc7dab86b3a"
>
>
> Totally clean build area.
>

and no sstate ?

>
>
> Sau!
>

