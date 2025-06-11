Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A079C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:57:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.500.1749657432821271923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TwN1j0NW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A436A1FD33;
	Wed, 11 Jun 2025 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749657431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OY1Y62tEgZ9cFauvDkBX0bRMTiQWtrp4hbH6mIYnrA=;
	b=TwN1j0NW8miNpclSXxrqQ2R9bDnPKFhzkzguQPdYdztgsJ9BOT28RayS/WyXeYcS876CYw
	zVwRRfWHvIcOWzIQA+4M8Jm5fXSrOneGRTWMONPyVTGXKrSURGrjliNPpklvILdb92lG+v
	+Pt66zYSh7eQJ87s6egD2kgglGQzzsxjT7YsTO316VQhcUg38MYZp8aD7pHhj5ZaQXFOj6
	qKMp/h8n8p3wykOJWu/ATKaikEiOVj70suYASEMyotyXfJrBHpSUV+fq4eeLxUILZrWNYK
	zNUxHVJo+UARxoOmVLBDCloIBvcGb/1dMmLJwM2WY5dcK0lN4HNCSJh6mMgI+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Jun 2025 17:57:10 +0200
Message-Id: <DAJTSN5YRYKS.101GDGXV8WO9Z@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/5] toolchain: Provide abstraction for recipe
 specific toolchain selection
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>, "Jon Mason"
 <jon.mason@arm.com>, "Ross Burton" <ross.burton@arm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
 <20250609095934.937987-2-richard.purdie@linuxfoundation.org>
 <DAJTKK4BQAN0.1Z1I6XAIA9O2T@bootlin.com>
In-Reply-To: <DAJTKK4BQAN0.1Z1I6XAIA9O2T@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvs
 ehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhonhdrmhgrshhonhesrghrmhdrtghomhdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218464

On Wed Jun 11, 2025 at 5:46 PM CEST, Mathieu Dubois-Briand wrote:
> On Mon Jun 9, 2025 at 11:59 AM CEST, Richard Purdie via lists.openembedde=
d.org wrote:
>> This implements a toolchain selection mechanism, defaulting to gcc
>> as per the existing defaults.
>>
>> Introduce a variable called TOOLCHAIN, which denotes the familiar
>> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
>> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>>
>> TOOLCHAIN variable has a global fallback to "gcc" in configuration
>> metadata. A distro can switch to using say "clang" as default system
>> compiler by defining
>>
>> TOOLCHAIN ?=3D "clang"
>>
>> In local.conf or other distro specific global configuration metadata
>>
>> It is also selectable at recipe scope, since not all packages are
>> buildable with either clang or gcc, a recipe can explicitly demand
>> a given toolchain e.g. glibc can not be built with clang therefore
>> glibc recipe sets.
>>
>> TOOLCHAIN =3D "gcc"
>>
>> Based on ideas/work by Khem Raj <raj.khem@gmail.com>
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>
> I might be late here, but just a note about this patch: it looks like it
> will require a fix in meta-arm, as it is breaking build of
> edk2-firmware:
>
> | bits.c: In function 'Efirst':
> | syn.h:173:48: error: too many arguments to function 'fpReach[r->ntype]'=
; expected 0, have 3
> |   173 |                                         (a) =3D (*(fpReach[(p)-=
>ntype]))( p, k, rk );}
> |       |                                               ~^~~~~~~~~~~~~~~~=
~~~~~~~
> | bits.c:224:9: note: in expansion of macro 'REACH'
> |   224 |         REACH(r, 1, &rk, a);
> |       |         ^~~~~
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1711

Sorry, I used some garbage in place of Ross address, trying again...

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


