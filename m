Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F57CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:53:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151637.1781607214782317832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UUuKk3YU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6BEB31A3957;
	Tue, 16 Jun 2026 10:53:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 362F1601A9;
	Tue, 16 Jun 2026 10:53:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4059106C9B6E;
	Tue, 16 Jun 2026 12:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781607211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eTpUicbj+iwe3LiuC0vQvrH2HVQNYzGe9DeBtyf0ApY=;
	b=UUuKk3YUhE4QCZL7K+BHn9CLFuowFydrFCIZnRTZIQ5tQJt43PrG56MXBFExAPQu/q8k6O
	2Cb0Pm8xa/9ZGGAhUagmUuGw5X2602NZing+ea4YAQIYKHshxJuixCh6RQnSxR+xX0RAbL
	+wxu7+JZwJflFbja9OFbG+viKfCsGhm/74BaJNU3Jka9zjuxzToK2tGtNARDQzi5vq9KXX
	MKh3YkBfIvhWSagKNc89xnxtnrZLzkDy+EdyWHqvVR8fAb+jLd1EwbphgWDlNNbV0xCBs/
	HWJfiopIVHBUy95mX4OV+RPovortwE5y3sG10U77//93/pSU4o0ojYiHySds9w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 12:53:24 +0200
Message-Id: <DJAF1MTFSQZD.3Q7YALQ6PQU4W@bootlin.com>
Subject: Re: [oe-core][PATCH] xuser-account: convert to
 standard-user-account
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
 <alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260615191701.2736293-2-rs@ti.com>
In-Reply-To: <20260615191701.2736293-2-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 10:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238887

On Mon Jun 15, 2026 at 9:17 PM CEST, Randolph Sapp via lists.openembedded.o=
rg wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Change this single xuser account template into a generic
> standard-user-account that uses distro level variables for
> configuration.
>
> This allows for seamless configuration of multiple out-of-box scripts
> and tests across layers without having to implicitly hope that the
> username or groups haven't been changed by a bbappend or recipe
> override.
>
> This also adds a class and a variable to allow recipes to assert that
> the user is in requested groups.
>
> This was proposed specifically to remove some issues highlighted in:
> https://lists.openembedded.org/g/openembedded-core/message/230665
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

Thanks for your patch.

It looks like we have some dependency issue:

ERROR: Nothing RPROVIDES 'weston-init' (but /srv/pokybuild/yocto-worker/mus=
l-qemux86/build/layers/openembedded-core/meta/recipes-graphics/wayland/west=
on_15.0.1.bb, /srv/pokybuild/yocto-worker/musl-qemux86/build/layers/openemb=
edded-core/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb =
RDEPENDS on or otherwise requires it)
weston-init was skipped: one of 'video render input seat wayland' needs to =
be in STANDARD_USER_GROUPS or STANDARD_USER_SYSTEM_GROUPS


https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3964
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4000
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3781

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


