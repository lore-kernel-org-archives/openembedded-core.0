Received: from wforward1-smtp.messagingengine.com (wforward1-smtp.messagingengine.com [64.147.123.30])
 by mx.groups.io with SMTP id smtpd.web11.24528.1595744853726050995
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 23:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=S2ab7lZq;
 spf=neutral (domain: iki.fi, ip: 64.147.123.30, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.west.internal (Postfix) with ESMTP id AE41EC02;
	Sun, 26 Jul 2020 02:27:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 26 Jul 2020 02:27:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=7Es/kh0yJbN121YFBsExazW763g0KduENCvOEQXRK
	Qo=; b=S2ab7lZqUOwx0z5Jcq2jXXAiNiZFYvjQaCfaR3aokUlQGODdufKiw0vKx
	xCn6+xwQAT5MZ8DHTrBGwLUL/UkxCBEeiDpDjPwtHleB9qV3O6CVYNWgeI49BEhU
	rRewZeae5TqMX+ZUUPVqfGSOmK1yyUFJ/RcMmQ37QNOksjTmvZwHw55XcSwyMuJt
	F18DWrjgTr62h8FVqsrMWdkNzmzmnWgZOY4N9l8dj0U2W170ocCF8a7mLFTEMVYh
	872PBJXJ4pohtWHkflZsYrEht6NKWkq6j5f9C5MogPfrqi0rzkg/e8hV2nmrT42s
	fLJFVFWmrUlaQ64fpwqEOMEYtXO4g==
X-ME-Sender: <xms:UyIdXxrC6IbwUIig6brdq--YdfqzB25YB0Xdz3PiPi4UgfXsOZF53Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epgfelkefhjeevtddvledtkeelvefhfeejteegkeffffefudeugfelffeiueegveefnecu
    ffhomhgrihhnpehprghtrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukf
    hppeekvddruddtvddrvddtrddujeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:VCIdXzodbFMvawu8207Y4E5Q9FP2UVRyhhFJkIJ3AwK9-h7dBt3Msw>
    <xmx:VCIdX-PlItyXIAkMzh8xuVvnOxkMAJXpyEmSemhyUQWjhZmF_oaCHQ>
    <xmx:VCIdX84_jSEXnre1Wn3wU8jqa5lKcjzIj1I2Y5yIHYjD7aXk4oY-3w>
    <xmx:VCIdXyGWobQWmYzwK12LJrbSJ0XaON9VlENK1uY-DiM8bLvyhzfd77912U0>
Received: from laptop (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id 756F0306005F;
	Sun, 26 Jul 2020 02:27:31 -0400 (EDT)
Message-ID: <58086cc625eea86dbf35b4bdf90aaae0bb341a22.camel@iki.fi>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jul 2020 09:27:27 +0300
In-Reply-To: <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
	 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
> On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > Hi!
> > 
> > If a recipe provides NEON optimizations, should those be explicitly
> > disabled when "neon" is not in TUNE_FEATUERS, even if the software is
> > able to detect NEON availability at runtime?
> > 
> > I'm currently converting the pulseaudio recipe from Autotools to Meson,
> > and the old Autotools build system supports disabling NEON
> > optimizations but the Meson build system doesn't. So I'm wondering if I
> > should add the missing feature to the Meson build system, or just let
> > the runtime detection do its work.
> > 
> > Is there ever need for disabling NEON optimizations if the CPU
> > indicates NEON support? I guess it could be useful for testing the "no
> > NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
> > doesn't remove NEON support from the qemuarm machine), but otherwise it
> > seems unnecessary, unless there are CPUs that advertise NEON support
> > but don't actually support it.
> > 
> 
> I think the issue will result in a compiler error perhaps when neon is
> disabled via
> compiler command line which would be the case when neon is not in TUNE_FEATURES
> the compiler might warn or error out when it finds neon instructions
> being compiled via inline
> assembly.  you just can try passing something like -mfpu=vfpv3d16 or
> some such and see if
> compiler/assembler complains during build, if not then perhaps its fine.

If the last -mfpu is something else than neon, then including
arm_neon.h will succeed but compiling neon code will fail.

I did some experiments, and what I found was that when I remove neon
from TUNE_FEATURES, OE adds -mfpu=vfp to CC, not CFLAGS, so it's very
early in the compiler command line. PulseAudio adds -mfpu=neon to
CFLAGS when building neon code, and the last -mfpu wins, so the neon
code gets built without errors.

The configure check in PulseAudio only checks that the compiler accepts
-mfpu=neon and #include <arm_neon.h>, it doesn't try to compile any
actual neon code. This means that if the user adds -mfpu=vfp (or other
non-neon) to CFLAGS rather than CC, configure will pass but building
will fail. Is this something to guard against? A default qemuarm build
doesn't do this, so I don't know if this ever happens in OE.

I don't know yet how Meson behaves, I'll continue testing...

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

