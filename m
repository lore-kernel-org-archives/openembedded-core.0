Received: from wforward1-smtp.messagingengine.com (wforward1-smtp.messagingengine.com [64.147.123.30])
 by mx.groups.io with SMTP id smtpd.web10.13379.1595149582980356042
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2020 02:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=coht63wI;
 spf=neutral (domain: iki.fi, ip: 64.147.123.30, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.west.internal (Postfix) with ESMTP id C3C25C9D
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2020 05:06:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 19 Jul 2020 05:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4D+CIQ
	sYp336Kz/FBX5nFZG6ub8f1ossIv1kmDU8gHc=; b=coht63wIDOm4cEk832P5z1
	QxKNXmFBHuRZPjzh7Cr8i19W012+PQ+KRqcQBsICtzDb2Aa5hLtv6tDDM+5pcRuA
	fS9Fa8ErN6v69hOI6U7TMJXR8B30JfDIMOxJAgwojXrTfwOZ8FrW6LXEXM86CsqD
	jk02WhF6asLEY5eEMsx0rymt1KchyBeR5ovWtEF6wg+jxZnpZoizr0SKLCcGU8DK
	pJRsr8i3JMxHa9jr+FjRNwviVkhEFYzElzcQnF0+mxMYbyiNhS10dw4M5BoS9r4f
	fZb34GXFVpAlgnFDcortcw+nvAvSnkz3K6YsthkxS7G1dt0/MxhRbkA+BHxrqZRw
	==
X-ME-Sender: <xms:Cw0UXwhirtz9JDr4c64odozrPmLox0B2d4R9M95VCudYPlJPqP_SCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgedugdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecuogfvvgigthfqnhhlhidqqdetfeejfedqtdegucdlhe
    dtmdenucfjughrpefkuffhvffftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
    uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucggtffrrghtthgvrh
    hnpefhheevtdehhfehvdffheefieekfeefieettdehheevgedtteffvdetudduvefguden
    ucffohhmrghinhepphgrthhrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenuc
    fkphepkedvrddutddvrddvtddrudejleenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:Cw0UX5AJqTnJ1Njs0aj70bkhCFj7DzxyRmgUbrb_6Vy5rhh921W5SQ>
    <xmx:Cw0UX4HKsBOQa6L7vUlfHlfYncusXGShI4DONa6hgDRtE9W4aEwwwg>
    <xmx:Cw0UXxSLBQqNBrwQ3nXhNWrrBzcjAhJwFChmZ50-vdbHENX2Xtn7KQ>
    <xmx:DA0UXxhTl_f207WlStgkZ5t_-2b0wq4haOvfgEO68jYpkLw5lzhVOsM9Ekk>
Received: from laptop (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5F099328005A
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2020 05:06:19 -0400 (EDT)
Message-ID: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
Subject: Why disable NEON support in recipes if runtime detection works?
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Jul 2020 12:06:15 +0300
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi!

If a recipe provides NEON optimizations, should those be explicitly
disabled when "neon" is not in TUNE_FEATUERS, even if the software is
able to detect NEON availability at runtime?

I'm currently converting the pulseaudio recipe from Autotools to Meson,
and the old Autotools build system supports disabling NEON
optimizations but the Meson build system doesn't. So I'm wondering if I
should add the missing feature to the Meson build system, or just let
the runtime detection do its work.

Is there ever need for disabling NEON optimizations if the CPU
indicates NEON support? I guess it could be useful for testing the "no
NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
doesn't remove NEON support from the qemuarm machine), but otherwise it
seems unnecessary, unless there are CPUs that advertise NEON support
but don't actually support it.

PulseAudio doesn't have a similar configure switch for the x86
optimizations, so in the name of consistency I would like to rely only
on the runtime CPU detection also for the NEON optimizations.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

