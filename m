Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B80D358FD
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:13:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12534.1769685235764350632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:13:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xfRxhy+L;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 69B03C211FB
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:13:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B8C6606B6;
	Thu, 29 Jan 2026 11:13:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53586119A868D;
	Thu, 29 Jan 2026 12:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769685222; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kPqA8sLlEcXaUFne71rM/qfMKgoCsTAp4VYbKoyeUxc=;
	b=xfRxhy+Lbguuo9XPuKZh9lm0roR48cxu3Ft7llH23jSE/i7/Tp+Cmk8Fz2HIsVvszv994P
	muH9Nex9CU/ltZ0QlvzVihX+GYofMGVcdDNqidVKIqoV7gKeYJQ/qlBSQfvyksALHxr0GA
	LwZbzeq9mAzF0DIevhVQ1sPypRfJpzU9vA8yev2RjjMeDOqg29MvNZiNIIEK6wTrM/T+qn
	hGZmp2VjAodJV6aZ06m5IzF4C+RI505U5E2bmUCE3rsv/R32XkxNg7aAfc1oUtydcPC3i9
	+LYTLQC7fjAcahx364gJ3hHQyt2FJXNT+8GVgEICvz1marbEGqG4U8FyKMj67Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 12:13:39 +0100
Message-Id: <DG111YGX0CQT.2JFTQEWR8YUUJ@bootlin.com>
Subject: Re: [OE-core] [PATCH] apt: Set gid to nogroup
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jaeyoon.jung@lge.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260128022514.3257715-1-jaeyoon.jung@lge.com>
In-Reply-To: <20260128022514.3257715-1-jaeyoon.jung@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230131

On Wed Jan 28, 2026 at 3:25 AM CET, Jaeyoon Jung (LGE) via lists.openembedd=
ed.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>
> With no --no-user-group, it tries to assign "_apt" gid which ends up
> with an error when using static gid values and "_apt" is not defined in
> USERADD_GID_TABLES. Conventionally "_apt" does not have its own gid but
> rather uses "nogroup".
>
> | apt was skipped: Recipe apt, package apt: normal groupname "_apt" does =
not have a static ID defined.
>
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---

Hi Jaeyoon,

Thanks for your patch.

It looks like this is generating build errors in some condition. So far
it only shows during the reproducibility test:

2026-01-28 16:57:19,382 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'apt' (but /srv/pokybuild/yocto-worker/reproducible/build/layers/openemb=
edded-core/meta/recipes-sato/images/core-image-sato.bb, /srv/pokybuild/yoct=
o-worker/reproducible/build/layers/openembedded-core/meta/recipes-extended/=
images/core-image-full-cmdline.bb, /srv/pokybuild/yocto-worker/reproducible=
/build/layers/openembedded-core/meta/recipes-graphics/images/core-image-wes=
ton.bb RDEPENDS on or otherwise requires it)
2026-01-28 16:57:19,382 - oe-selftest - INFO -       apt was skipped: Recip=
e apt, package apt: normal groupname "nogroup" does not have a static ID de=
fined. Add nogroup to one of these files: /srv/pokybuild/yocto-worker/repro=
ducible/build/build-st/meta-selftest/files/static-group

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3270

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


