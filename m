Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 922156CDF2;
	Thu, 30 Jan 2014 04:34:14 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id j1so6400615iga.2
	for <multiple recipients>; Wed, 29 Jan 2014 20:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lExgPXmXdDKXz59FDqYdXeuwPyR29931s9KhJiSqW6I=;
	b=MqfMdmqGbdPC6+htewzKAnH5aMuZfeNkcwa0/XWmHg8OCFOFNzkJTP/ULl+Gl6pjyg
	+ZaOaDzL2Knd8ZZFydtvDs91xM0MSQAjJhTmRUiJGRCeC/qsOxsBguudxYhDCMJX2yox
	QQCYzS/VlP+dZWUFwUMNxtAFi1YaYeSvH3x5kFLA7fRbKZguN1UQ0T95JbSYsFnRBSH/
	WNdI1/mHJVisO3tFjy4O48nL4CBLCDnTQhYLdes2cwppPky9FF+1NNp84EMNdCpoVUV+
	/63redD8DlaMfDrDbCwteaQKxwX08C3ICUUrzMnFeQ3IyPx43Kj89L8QZ2iVuU85PUnD
	B3Eg==
X-Received: by 10.42.246.131 with SMTP id ly3mr9222583icb.8.1391056455610;
	Wed, 29 Jan 2014 20:34:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Wed, 29 Jan 2014 20:33:45 -0800 (PST)
In-Reply-To: <52B30EE5.6050901@linux.intel.com>
References: <CAMKF1spWnFvXRAp-GuoBL9vXceg29h5Numv7PYhZNWUJu8rMRw@mail.gmail.com>
	<52B30EE5.6050901@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2014 20:33:45 -0800
Message-ID: <CAMKF1sqABZeBKTBP-MB3HvOFfBadofBQaaaMf8u2F5ExmCiVrw@mail.gmail.com>
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
X-List-Received-Date: Thu, 30 Jan 2014 04:34:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 19, 2013 at 7:21 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/16/2013 12:03 PM, Khem Raj wrote:
>>
>> Hi
>>
>> I have pushed a contrib branch for binutils 2.24 upgrade here
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.24
>>
>> I have tested it on both uclibc/eglibc and qemu machines. But it would
>> be nice if
>> it gets more testing for machines I havent tested
>>
>
> Looks like we tickled an LD bug of somekind, we are seeing the following
> failure across all machines, this was a second build using binutils 2.24, so
> there was some shared state usage.
>
> RP pointed out the --as-needed option was used with -lm as those symbols are
> math related.
>
>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwconfig iwconfig.o
>> libiw.so.29 -lm
>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwlist iwlist.o
>> libiw.so.29 -lm
>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwpriv iwpriv.o
>> libiw.so.29 -lm
>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwspy iwspy.o
>> libiw.so.29 -lm
>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwgetid iwgetid.o
>> libiw.so.29 -lm
>> | powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400
>> --sysroot=/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/sysroots/qemuppc
>> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>> -I/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/tmp/work/ppc7400-poky-linux/wireless-tools/1_29-r4/wireless_tools.29
>> -O2 -pipe -g -feliminate-unused-debug-types -MMD     -o iwevent iwevent.o
>> libiw.so.29 -lm
>> | libiw.so.29: undefined reference to `ceil'
>> | libiw.so.29: undefined reference to `pow'
>> | libiw.so.29: undefined reference to `log10'
>> | libiw.so.29: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>> | make: *** [iwconfig] Error 1
>> | make: *** Waiting for unfinished jobs....
>> | libiw.so.29: undefined reference to `ceil'
>> | libiw.so.29: undefined reference to `pow'
>> | libiw.so.29: undefined reference to `log10'
>> | libiw.so.29: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>> | make: *** [iwgetid] Error 1
>> | libiw.so.29: undefined reference to `ceil'
>> | libiw.so.29: undefined reference to `pow'
>> | libiw.so.29: undefined reference to `log10'
>> | libiw.so.29: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>> | make: *** [iwspy] Error 1
>> | libiw.so.29: undefined reference to `ceil'
>> | libiw.so.29: undefined reference to `pow'
>> | libiw.so.29: undefined reference to `log10'
>> | libiw.so.29: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>> | make: *** [iwpriv] Error 1
>> | libiw.so.29: undefined reference to `ceil'
>> | libiw.so.29: undefined reference to `pow'
>> | libiw.so.29: undefined reference to `log10'
>> | libiw.so.29: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>> | make: *** [iwlist] Error 1
>> | libiw.so.29: undefined reference to `ceil'
>> | libiw.so.29: undefined reference to `pow'
>> | libiw.so.29: undefined reference to `log10'
>> | libiw.so.29: undefined reference to `floor'
>> | collect2: error: ld returned 1 exit status
>> | make: *** [iwevent] Error 1
>> | ERROR: oe_runmake failed
>
>

I tested OE-Core builds for qemuppc

1. build from scratch  ( MACHINE=qemuppc bitbake wirelesstools)
2. build from sstate ( MACHINE=qemuppc bitbake -cclean wirelesstools
and then step 1)
3. Build second time just wireless-tools ( MACHINE=qemuppc bitbake
-ccleanall wirelesstools and then step 1 )
4. Rebuild all from sstate ( rm -rf tmp/ and then step 1)

I could not reproduce this issue at all. The differences are I did it
with OE-Core and not with Poky autbuilders run with poky distro
policies.
we should also actually regress OE-Core alone

My build machine here is debian/wheezy and ubuntu 12.04 both 64bit)

I am on commit c3f3fed1b397b6ee6d44e7d39e63d084e4a88e30 of OE-Core

At this point I am out of ideas how to reproduce this.

If there is some other developer out there who can try this patch and
get the same errors,that would be interesting and probably we
will get to root of it.

