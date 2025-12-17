Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73276D65C59
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 14:47:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16636.1765982857207997845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 06:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VfFaSjIK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D5BC4E41C62;
	Wed, 17 Dec 2025 14:47:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12EDB6072F;
	Wed, 17 Dec 2025 14:47:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68402102F0AD5;
	Wed, 17 Dec 2025 15:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765982854; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M+EndEq6e1ouJVuSHiY1kLG/A75MA2JNWsKK/KcUmeU=;
	b=VfFaSjIKuYmfugjQ9lCFJN4gIVaJeldxGk24QZMrqPLJn0mhxehPbE0gGxeh/tAoB1MGo6
	vkpyZwkR0qE4cq0rJK68m1uheapRIn7H5OIKfsplEPPKi3SD/FbOVCqDLpr4cIW0DSs1/2
	ZDiMbwt4LZOtr14ok9rK9DXNcrQbtt2J/BWroJ0GIA9P0TS4MpVqvzoNA7fibWW9OD/JqU
	PqoCDhK4rYSWHjz8SEv2uWLr2q0yYeA5hCmu5PrNQwTwKC/n6Yv0KDLhOcyh2l+E3QroNX
	LU8yF4Hk7pmxTlIm0J5TPHxeYdV1eHNQyOBTWKr6cGBqEw3jOdpp2pudnFFr1Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:47:32 +0100
Message-Id: <DF0KOAGYU1ZY.399MUHSJMJ1BP@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/2] python3-pyzstd: import 0.17.0 from
 meta-python
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <koen.kooi@oss.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
 <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 14:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228046

On Wed Dec 17, 2025 at 10:34 AM CET, Koen Kooi via lists.openembedded.org w=
rote:
> From the upstream website:
> 	Pyzstd module provides classes and functions for compressing and
> 	decompressing data, using Facebook's Zstandard (or zstd as short name)
> 	algorithm.
>
> This recipe is being moved over for systemd 258.x, the 'ukify' tool
> depends on this.
>
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---

Hi Koen,

Thanks for your patch.

It look like this is failing on the autobuilder in various
configurations, probably only with poky-altcfg:

ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: Fatal QA errors were found, =
failing task.
...
ERROR: python3-pyzstd-0.17.0-r0 do_package_qa: QA Issue: supports ptests bu=
t is not included in oe-core's ptest-packagelists.inc [missing-ptest]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2848
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2837
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2894
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2848
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2829

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


