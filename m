Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net
	(p3plsmtpa06-01.prod.phx3.secureserver.net [173.201.192.102])
	by mail.openembedded.org (Postfix) with ESMTP id 334A665D5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 09:15:21 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-01.prod.phx3.secureserver.net with 
	id eZFK1o00S1mTNtu01ZFLXV; Thu, 14 Aug 2014 02:15:22 -0700
Message-ID: <53EC7E27.6010507@pabigot.com>
Date: Thu, 14 Aug 2014 04:15:19 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
	<53EBF375.1070701@pabigot.com>
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
	<53EC16FC.8020109@pabigot.com>
	<CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>
In-Reply-To: <CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Thu, 14 Aug 2014 09:15:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2014 12:32 AM, Khem Raj wrote:
> On Wed, Aug 13, 2014 at 6:55 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>>> EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a",
>>> "--with-cpu=generic-armv7-a", "", d)}'
>>>
>> Sorry a typo there you   need  --with-arch
>>
>>
>> OK, that works. So do we need to do the same thing for every TUNE_FEATURES
>> element that ends up changing the value of -march= in TUNE_CCARGS which ends
>> up getting passed into gcc-runtime?
> Not really but arm v6+ is an exception here due to reasons explained
> earlier. gcc as a target package is a bit
> different than rest of them since it has mind of its own when it comes
> to configuring it. It encodes certain
> defaults into its driver etc. based on the configure parameters.
> Ideally when we pass the flags via CFLAGS
> it does it for most of packages but not for gcc.

tl;dr: the proposed fix to gcc-target works for my example but I'm 
concerned it's a bandaid that doesn't address a more long-term risk.

I understand gcc-target is different.  I frame the issue as: bitbake 
(via toolchain-scripts.bbclass) ensures OE builds its applications with 
TARGET_CC_ARCH flags such as -march=FOO, but building gcc itself 
requires EXTRA_OECONF to pass different flags such as --with-arch=FOO 
which set the default behavior for the target compiler.

There are actually a bunch of these gcc configuration options:

  --with-schedule=cpu
  --with-arch=cpu
  --with-arch-32=cpu
  --with-arch-64=cpu
  --with-tune=cpu
  --with-tune-32=cpu
  --with-tune-64=cpu
  --with-abi=abi
  --with-fpu=type
  --with-float=type

all of which affect the default for the corresponding -m flags, and any 
of which may affect each other within gcc's configure script.

It sounds like the intent is that the default behavior of the target gcc 
should match what bitbake is passing via TARGET_CC_ARCH.  Of course, if 
that were guaranteed there wouldn't be any need for OE to apply 
TARGET_CC_ARCH at all, but I wouldn't suggest changing that.

My concern is that gcc-runtime invokes configure in subdirectories of 
gcc's source tree, bypassing the top-level configure where some of the 
translation from (e.g.) --with-arch=FOO to -march=FOO is done.  It then 
builds the libraries with TARGET_CC_ARCH flags appended to CC, CXX, and CPP.

What this means is that the libraries built by gcc-runtime use 
TARGET_CC_ARCH settings that don't necessarily match the target 
compiler's defaults, and that ABI conflicts can result by linking in 
those libraries when the non-default settings were absent in non-OE 
application builds.  ABI can only be "guaranteed" if every one of the 
-mFOO=BAR passed in TARGET_CC_ARCH (*or defaulted by the compiler*) has 
a corresponding -with-FOO=BAR option passed to (*or inferred by*) gcc's 
configure.

That's a pretty strong assumption to make.

It may be that this can be worked around for the specific case I raised 
by explicitly adding --with-arch=armv7-a to gcc-target's EXTRA_OECONF. I 
do have to wonder whether the same should be done for any of armv7 
armv7-m armv7-r armv7e-m armv7ve armv8-a armv8-a+crc which are other 
-march options that are armv6+, and whether there are other ABI issues 
that might be hiding now or in the future because TARGET_CC_ARCH makes 
more assumptions than gcc-target does.

The solution I propose is to rework gcc-runtime's override of CC/CXX/CPP 
so the libraries are built the same way they would be if they had been 
built during gcc-target.

 From initial attempts this won't be easy to do.  I'd be happy to keep 
trying if this worries other people, but if I'm being too picky I'll 
just suck it up and move on.

Peter

