Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F955C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:46:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.113.1749656800465923277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nA/HMewL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2524F441C6;
	Wed, 11 Jun 2025 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749656797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcBehpZexNRw3Xo8ZrEcrSGhBuPBp4fFXjgh8AVeV80=;
	b=nA/HMewLgV8SR26cOuACPjStnGK2ydo74anb33DwtB/CABmEGn/jhc7eN4DsyoBMTgWRws
	Qa5HratHqdKQwAI5pG4hn5gcRXUQRTeArQsoHRVGsOH3xMgBWPtllUZqOE4WdsXONI2rxA
	ZSVPcHAdowx3+YVkEuufP8i141ddKiaaWWoNfd4d45MxNVzSjRpn3DmQ+aubKgQU5wbH6Q
	USU8Lj3KGJERksxqocu7YZ/IgVa8VspLgqGB13bGPJaHJVwVR5d7c7ifIuX1en2fJtqhHm
	m/+zXO2XBGxuCq94vzr0PlS+MuLUKXTZP6ImHxA4I1NwKgkODh85BT2juYFJww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Jun 2025 17:46:36 +0200
Message-Id: <DAJTKK4BQAN0.1Z1I6XAIA9O2T@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>, "Jon Mason"
 <jon.mason@arm.com>, "Ross Burton via lists.openembedded.org"
 <ross.burton=arm.com@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
 specific toolchain selection
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
 <20250609095934.937987-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250609095934.937987-2-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvs
 ehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhonhdrmhgrshhonhesrghrmhdrtghomhdprhgtphhtthhopehrohhsshdrsghurhhtohhnpegrrhhmrdgtohhmsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:46:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218461

On Mon Jun 9, 2025 at 11:59 AM CEST, Richard Purdie via lists.openembedded.=
org wrote:
> This implements a toolchain selection mechanism, defaulting to gcc
> as per the existing defaults.
>
> Introduce a variable called TOOLCHAIN, which denotes the familiar
> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>
> TOOLCHAIN variable has a global fallback to "gcc" in configuration
> metadata. A distro can switch to using say "clang" as default system
> compiler by defining
>
> TOOLCHAIN ?=3D "clang"
>
> In local.conf or other distro specific global configuration metadata
>
> It is also selectable at recipe scope, since not all packages are
> buildable with either clang or gcc, a recipe can explicitly demand
> a given toolchain e.g. glibc can not be built with clang therefore
> glibc recipe sets.
>
> TOOLCHAIN =3D "gcc"
>
> Based on ideas/work by Khem Raj <raj.khem@gmail.com>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

I might be late here, but just a note about this patch: it looks like it
will require a fix in meta-arm, as it is breaking build of
edk2-firmware:

| bits.c: In function 'Efirst':
| syn.h:173:48: error: too many arguments to function 'fpReach[r->ntype]'; =
expected 0, have 3
|   173 |                                         (a) =3D (*(fpReach[(p)->n=
type]))( p, k, rk );}
|       |                                               ~^~~~~~~~~~~~~~~~~~=
~~~~~
| bits.c:224:9: note: in expansion of macro 'REACH'
|   224 |         REACH(r, 1, &rk, a);
|       |         ^~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1711

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


