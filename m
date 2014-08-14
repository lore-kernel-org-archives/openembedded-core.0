Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3D16A6059A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:08:18 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id l13so281053iga.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HSF7rwgXJBZtCR+qZUsVOUi3Jo/KUzcAt3oo4nuYv4Y=;
	b=ZpHuoRsPxKg+38Nck1WvWJ09g/GWVkPkDjCv2vATWFiZMTM247j0SiH/lmhIqGA0xY
	9ttpEJNjX7EWwO2eu9IIwGmSnIVjno2X/uOalzC+NIsRknO1evZ6M69/XyJk2v84PT7g
	X9/RVFtYmreZ4505khH++6/tL6uCcb6fNJBIYUmB8vSGFkS1/am2pRrQxxM0QhGSwBoY
	HZHINg0rI3YTuw2YRX+7xZOvYRw0iZqZgvZTiF+1XHdwucKRQTHqUbjvCndHaj2UTpP0
	mUGusjzk1fsz0VJMpwvEufKIhzuSVjfrcb449mBUI+qFG+8OyB9X4WUmHLAcZGOsZLdw
	DUfA==
X-Received: by 10.50.61.138 with SMTP id p10mr527116igr.20.1408054099337; Thu,
	14 Aug 2014 15:08:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Thu, 14 Aug 2014 15:07:49 -0700 (PDT)
In-Reply-To: <53EC7E27.6010507@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
	<CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
	<53EBF375.1070701@pabigot.com>
	<CAMKF1srUa9tUqu7bNXZ0g=yCa0e8E2K5XrzTHUUxB6BbTwYZ6g@mail.gmail.com>
	<53EC16FC.8020109@pabigot.com>
	<CAMKF1srPpoob-sxfv_OF-5po41tAFZNaparZJ2WOrzMTjB=n2g@mail.gmail.com>
	<53EC7E27.6010507@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Aug 2014 15:07:49 -0700
Message-ID: <CAMKF1sq-x4C58AUrmY-duxO3NLQ7R7Fcv0WWBgeYELRP7+tLAQ@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
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
X-List-Received-Date: Thu, 14 Aug 2014 22:08:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 14, 2014 at 2:15 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 08/14/2014 12:32 AM, Khem Raj wrote:
>>
>> On Wed, Aug 13, 2014 at 6:55 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>>>>
>>>> EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a",
>>>> "--with-cpu=generic-armv7-a", "", d)}'
>>>>
>>> Sorry a typo there you   need  --with-arch
>>>
>>>
>>> OK, that works. So do we need to do the same thing for every
>>> TUNE_FEATURES
>>> element that ends up changing the value of -march= in TUNE_CCARGS which
>>> ends
>>> up getting passed into gcc-runtime?
>>
>> Not really but arm v6+ is an exception here due to reasons explained
>> earlier. gcc as a target package is a bit
>> different than rest of them since it has mind of its own when it comes
>> to configuring it. It encodes certain
>> defaults into its driver etc. based on the configure parameters.
>> Ideally when we pass the flags via CFLAGS
>> it does it for most of packages but not for gcc.
>
>
> tl;dr: the proposed fix to gcc-target works for my example but I'm concerned
> it's a bandaid that doesn't address a more long-term risk.
>
> I understand gcc-target is different.  I frame the issue as: bitbake (via
> toolchain-scripts.bbclass) ensures OE builds its applications with
> TARGET_CC_ARCH flags such as -march=FOO, but building gcc itself requires
> EXTRA_OECONF to pass different flags such as --with-arch=FOO which set the
> default behavior for the target compiler.
>
> There are actually a bunch of these gcc configuration options:
>
>  --with-schedule=cpu
>  --with-arch=cpu
>  --with-arch-32=cpu
>  --with-arch-64=cpu
>  --with-tune=cpu
>  --with-tune-32=cpu
>  --with-tune-64=cpu
>  --with-abi=abi
>  --with-fpu=type
>  --with-float=type
>
> all of which affect the default for the corresponding -m flags, and any of
> which may affect each other within gcc's configure script.
>
> It sounds like the intent is that the default behavior of the target gcc
> should match what bitbake is passing via TARGET_CC_ARCH.  Of course, if that
> were guaranteed there wouldn't be any need for OE to apply TARGET_CC_ARCH at
> all, but I wouldn't suggest changing that.
>
> My concern is that gcc-runtime invokes configure in subdirectories of gcc's
> source tree, bypassing the top-level configure where some of the translation
> from (e.g.) --with-arch=FOO to -march=FOO is done.  It then builds the
> libraries with TARGET_CC_ARCH flags appended to CC, CXX, and CPP.
>
> What this means is that the libraries built by gcc-runtime use
> TARGET_CC_ARCH settings that don't necessarily match the target compiler's
> defaults, and that ABI conflicts can result by linking in those libraries
> when the non-default settings were absent in non-OE application builds.  ABI
> can only be "guaranteed" if every one of the -mFOO=BAR passed in
> TARGET_CC_ARCH (*or defaulted by the compiler*) has a corresponding
> -with-FOO=BAR option passed to (*or inferred by*) gcc's configure.
>
> That's a pretty strong assumption to make.
>
> It may be that this can be worked around for the specific case I raised by
> explicitly adding --with-arch=armv7-a to gcc-target's EXTRA_OECONF. I do
> have to wonder whether the same should be done for any of armv7 armv7-m
> armv7-r armv7e-m armv7ve armv8-a armv8-a+crc which are other -march options
> that are armv6+, and whether there are other ABI issues that might be hiding
> now or in the future because TARGET_CC_ARCH makes more assumptions than
> gcc-target does.
>
> The solution I propose is to rework gcc-runtime's override of CC/CXX/CPP so
> the libraries are built the same way they would be if they had been built
> during gcc-target.
>

we are actually pulling out the target runtime out of gut of gcc-cross
and then doing the match with target gcc
so as long as we make target gcc recipe confirm to this we are good. I
dont feel like we need to engineer a general solution here. Since what
we are addressing is an anamoly not norm. So lets keep it that way.
meaning patch it for arm where needed.
one day all  < armv5 architectures will die out and we will be a happy
lot :) oh wait then aarch64-32 might spring another ABI concern who
knows

> From initial attempts this won't be easy to do.  I'd be happy to keep trying
> if this worries other people, but if I'm being too picky I'll just suck it
> up and move on.
>
> Peter

