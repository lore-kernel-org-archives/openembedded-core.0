Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62083CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 06:31:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.12130.1756017065264890044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 23:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pxwoSTsu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 55B2B4E40C5F;
	Sun, 24 Aug 2025 06:31:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10A29605F1;
	Sun, 24 Aug 2025 06:31:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53BED1C22D77F;
	Sun, 24 Aug 2025 08:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756017061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YhNp6BrHp7GaCSzM7qHabsjSXqCYpGEi+DF4JcG/oog=;
	b=pxwoSTsu0Jt5NWzjAl+xWS/6c5Oq6zlgJJA3TCn7cEQNZxI6gQfH1gLTnEpDeENsJN3tCE
	ubfyPIcc+om6zw64horr0i8yoENuf0Y+ofdyT9rqZghGj6/Y7YjLPK5N85Ks9QpxNgVzGu
	mJSHkxEuGkxyCsZQau6/PYg1ZAXSv72Sz02fztUl7bDgEvu95XtO8PwdDjHTUrVahBgY1U
	4N8KFStbjugOnDc9spQbLx4O8k08fU6s1hUDfaYpL66r/xI5lrGkoF6/ZR/YTW7z+E3xVI
	QvJwX/3o/vJOnjna06AEgVXPWxoCrHR4gAjPxyJn0n51VLYJIy5ozyYi8202fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 08:30:35 +0200
Message-Id: <DCAG35IF1F63.3RIV4DT8HB7ER@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Markus Volk"
 <f_l_k@t-online.de>, "Trevor Woerner" <twoerner@gmail.com>, "Ross Burton"
 <ross.burton@arm.com>, "Otavio Salvador"
 <otavio.salvador@ossystems.com.br>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
In-Reply-To: <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 06:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222360

On Sat Aug 23, 2025 at 8:01 PM CEST, Mathieu Dubois-Briand wrote:
> Hi Quentin,
>
> Thanks for the new version.
>
> It looks like we have a build issue for riscv platforms:
>
> ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The sstat=
e manifest for task 'expat:populate_sysroot' (multilib variant '') could no=
t be found.
> The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-natives=
dk.
> But none of these manifests exists:
>     /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-contro=
l/manifest-qemuriscv64-expat.populate_sysroot
>     /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-contro=
l/manifest-allarch-expat.populate_sysroot
>     /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-contro=
l/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/379
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/396
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/362
>
> Can you have a look at these, please?
>
> Best regards,
> Mathieu

Hi Quentin,

Some selftests are also failing:

2025-08-23 17:05:10,234 - oe-selftest - INFO - baremetal.BaremetalTest.test=
_baremetal (subunit.RemotedTestCase)
2025-08-23 17:05:10,236 - oe-selftest - INFO -  ... FAIL
...
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'ldconfig' (but /srv/pokybuild/yocto-worker/oe-sel=
ftest-armhost/build/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb RDEPENDS on =
or otherwise requires it)
nativesdk-glibc-testsuite RPROVIDES ldconfig but was skipped: glibc-testsui=
te requires that virtual/libc is glibc
glibc-testsuite RPROVIDES ldconfig but was skipped: glibc-testsuite require=
s that virtual/libc is glibc
glibc RPROVIDES ldconfig but was skipped: PREFERRED_PROVIDER_virtual/libc s=
et to musl, not glibc

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2353
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2204
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2135

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


