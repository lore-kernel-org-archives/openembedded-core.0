Received: from wforward4-smtp.messagingengine.com (wforward4-smtp.messagingengine.com [64.147.123.34])
 by mx.groups.io with SMTP id smtpd.web10.25047.1595750385857847978
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 00:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=FcR4kTGG;
 spf=neutral (domain: iki.fi, ip: 64.147.123.34, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.west.internal (Postfix) with ESMTP id B03F0C88;
	Sun, 26 Jul 2020 03:59:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 26 Jul 2020 03:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=r/EF19jMBU80tcMn6nKu19mUReg1wY3uQ6n2+qY4F
	H4=; b=FcR4kTGG/wxDH0oxShbqZmKIiMtHadmn3PtU2lbXoRszWIk0SzKBvuXSa
	NoCF6E8grmS6ElUmTXFbwDALt5kqEhnegoFTvEu7ciTJQoUM/xwopiqhmzo/7iG7
	KAf/usDgyRrBqM3UilKdI2IxwER72OzrRWlfj5bhajTNPxptR+Rman4hi2AwSIGI
	5ULWp1iZlcr1ahYbRfWAov7H63jUe8CFqycfFYq9AvSAgyqic1I4XIApU7jUrOef
	Ikm7+X3baH4Q9tJZtmnBY/erFhXXSase/QZcPvJ63bdEVXgG0jucQVpyLzNwVB9O
	fXxoFEiDflHTbroDuZQmUu2cTVV7g==
X-ME-Sender: <xms:7zcdXyMOs11T2RVDYfV2wb1qjHyw_cgKmlrneqyz5GJWvFSyJEhfaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epgfelkefhjeevtddvledtkeelvefhfeejteegkeffffefudeugfelffeiueegveefnecu
    ffhomhgrihhnpehprghtrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukf
    hppeekvddruddtvddrvddtrddujeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:7zcdXw-TKm4GyAOQJdRIFVdrV1s9-UIUkvKnaDS1LjOs7xveL8blGA>
    <xmx:7zcdX5RvdLMDWCOlFNOau7E9H62yzXElUwbus5Zy4O5t94yE0DBJHg>
    <xmx:7zcdXyvmJX4K7BeWwTwZF5llImKplxLPES9ldIKU2QfiuCPuVdKsMA>
    <xmx:8DcdX0r6O54I52OSn_3CzshjRhWSFE_lT2FdT6tjSrsjy2aRNvDFU_9kr6g>
Received: from laptop (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id 47C3A328005E;
	Sun, 26 Jul 2020 03:59:43 -0400 (EDT)
Message-ID: <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jul 2020 10:59:39 +0300
In-Reply-To: <1625397D9F68474B.26462@lists.openembedded.org>
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
	 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
	 <1625397D9F68474B.26462@lists.openembedded.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:
> On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
> > On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > Hi!
> > > 
> > > If a recipe provides NEON optimizations, should those be explicitly
> > > disabled when "neon" is not in TUNE_FEATUERS, even if the software is
> > > able to detect NEON availability at runtime?
> > > 
> > > I'm currently converting the pulseaudio recipe from Autotools to Meson,
> > > and the old Autotools build system supports disabling NEON
> > > optimizations but the Meson build system doesn't. So I'm wondering if I
> > > should add the missing feature to the Meson build system, or just let
> > > the runtime detection do its work.
> > > 
> > > Is there ever need for disabling NEON optimizations if the CPU
> > > indicates NEON support? I guess it could be useful for testing the "no
> > > NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
> > > doesn't remove NEON support from the qemuarm machine), but otherwise it
> > > seems unnecessary, unless there are CPUs that advertise NEON support
> > > but don't actually support it.
> > > 
> > 
> > I think the issue will result in a compiler error perhaps when neon is
> > disabled via
> > compiler command line which would be the case when neon is not in TUNE_FEATURES
> > the compiler might warn or error out when it finds neon instructions
> > being compiled via inline
> > assembly.  you just can try passing something like -mfpu=vfpv3d16 or
> > some such and see if
> > compiler/assembler complains during build, if not then perhaps its fine.
> 
> If the last -mfpu is something else than neon, then including
> arm_neon.h will succeed but compiling neon code will fail.
> 
> I did some experiments, and what I found was that when I remove neon
> from TUNE_FEATURES, OE adds -mfpu=vfp to CC, not CFLAGS, so it's very
> early in the compiler command line. PulseAudio adds -mfpu=neon to
> CFLAGS when building neon code, and the last -mfpu wins, so the neon
> code gets built without errors.
> 
> The configure check in PulseAudio only checks that the compiler accepts
> -mfpu=neon and #include <arm_neon.h>, it doesn't try to compile any
> actual neon code. This means that if the user adds -mfpu=vfp (or other
> non-neon) to CFLAGS rather than CC, configure will pass but building
> will fail. Is this something to guard against? A default qemuarm build
> doesn't do this, so I don't know if this ever happens in OE.
> 
> I don't know yet how Meson behaves, I'll continue testing...

I tested Meson now. Meson too enables Neon even if -mfpu=vfp is in CC.
Unlike Autotools, Meson doesn't fail if -mfpu=vfp is added to CFLAGS (I
tried CFLAGS_append = " -mfpu=vfp" in the pulseaudio recipe). Neon is
enabled in any case.

So, Meson seems pretty safe, although I guess it would be nice not to
override the user's -mfpu setting. I think this isn't a big problem is
practice, since runtime detection works.

I haven't tested with a compiler that truly can't build Neon code,
because I don't know how to do that.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

