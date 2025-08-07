Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1A1C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 11:58:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.50110.1754567927822439995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 04:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MpCF3a1a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5794B43A17;
	Thu,  7 Aug 2025 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754567925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5SaXvq4/xEO/kIfTwcDD8bEYyTLDS+NzL+tm/z5CRk=;
	b=MpCF3a1aisagfkqrVAL1hwVS39P1evz2IYd7NuMczlAG0EnP+CVMtOvAnNelNFdOflEHvL
	np6g5Gg2zoWRT/xbd9poptct2rpJdVhA/zJWtIiJ6ZT892wB2MoX+oMAGwC9QMhJwzUuka
	/cogPGunIEqjDSXMvuZPRGAM1XrL1zWfHBeW7poBmAicIYiTeGQ7gCSOc7ZafsoJnlqECk
	UbuBobQU4TZqTAERSPFvqB/Wkt9f7/fPRFg+yleht3qgoPTdikKR/u9jRhenxNLVdxKNBP
	t04GlIqJGlDvTND6eR4VIPU3nM5oC3y2EOEGc7Jxcm9BpXDUujXOza8EFFlXvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Aug 2025 13:58:44 +0200
Message-Id: <DBW6F58396OI.1148NBNN3G87Z@bootlin.com>
Subject: Re: [OE-core] [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu
 when crypto not in features
Cc: <openembedded-core@lists.openembedded.org>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, "Ryan Eatmon" <reatmon@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <max.oss.09@gmail.com>, <raj.khem@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250724170600.1113476-1-raj.khem@gmail.com>
 <CAEHkU3V3tOfwAimXsEtj1vfKynQUB_+Ydq+x+ow5--pTYbrmHw@mail.gmail.com>
In-Reply-To: <CAEHkU3V3tOfwAimXsEtj1vfKynQUB_+Ydq+x+ow5--pTYbrmHw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiveejvedtuefgvefggfdtvefgleegtdejgfegueduvdetvefghffhvdejieeufeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpkhefrdhinhgtpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehmrgigrdhos
 hhsrddtleesghhmrghilhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehrvggrthhmohhnsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 11:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221567

On Thu Aug 7, 2025 at 1:49 PM CEST, Max Krummenacher via lists.openembedded=
.org wrote:
> This breaks machines which set `DEFAULTTUNE ?=3D "aarch64"` and use gcc
> as e.g. done for TI SoC [1].
> For that tune the `TUNE_CCARGS_MARCH` is not set at all resulting in a
> lone `+nocrypto`
> in the compiler arguments. Note that for gcc additionally
> `-march=3Daarch64` is not an allowed argument.
>
> I don't really know what is a good way forward. Of course one could
> not use aarch64 as a default tune
> to work around the issue.
>
> Any ideas?
>
> Regards
> Max
>
> | checking for aarch64-tdx-linux-gcc... aarch64-tdx-linux-gcc
> +nocrypto -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D...aarch64-tdx-linux/libgcc-initial/15.1.0/recipe-sysroot
> | checking for suffix of object files... configure: error: in
> `...aarch64-tdx-linux/libgcc-initial/15.1.0/gcc-15.1.0/build.aarch64-tdx-=
linux.aarch64-tdx-linux/libgcc':
> | configure: error: cannot compute suffix of object files: cannot compile
>
> [1] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/in=
clude/k3.inc#n6

Hi Max,

Can you try this fix commit?

https://lists.openembedded.org/g/openembedded-core/message/221498

It will probably land in master in the coming days.

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


