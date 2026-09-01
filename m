Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FE8C61DD6
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 05:35:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1230.1788240907655060375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 22:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=d+3nQDBv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 51F814E4148B
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Sep 2026 05:35:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AAA86053C;
	Tue,  1 Sep 2026 05:35:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32E6911C7923C;
	Tue,  1 Sep 2026 07:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788240900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5doyRr7TCP0sdUdNWefPFMaAds3TNdHlGxxKekO8FGs=;
	b=d+3nQDBvlX0dKRoui24i0VEHPClXZdG4/JSsRRs4vdYnlMDNb2UC2SKsjDOOLPjKpO3RSx
	27ZZaoSB+81vkxPFFC1r9WQHmQdagTdDwOaUo9+YdZsJi/xFddV5snGnu1nnbVHq25Kzz8
	cbUQ3jouE4SxVP1qfX1ulXzmGQ/T9xwMC1gPo2aiSrhIxwvnIUg1fUJGKoxb22ommmranv
	/+B8OZnjuQB3ZGPptwwP3mepsONH2pe4tHPVIie7X8Mx5+2Y3URLKlvDLCJMr9rGPGUfXv
	n/3vFz1wlQPLSUzDnDvoaJf3SciTtKkWL+pQqGbi9Yzzva4+cyddmY4TJKWPEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 07:34:58 +0200
Message-Id: <DL3QHRJANNVL.8YPDPUMNTLHZ@bootlin.com>
Subject: Re: [OE-core] [PATCH] io_uring-writev: open output file through
 io_uring
Cc: <martin.jansa@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <frezidok1@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260831080223.124050-1-frezidok1@gmail.com>
In-Reply-To: <20260831080223.124050-1-frezidok1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 05:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244784

On Mon Aug 31, 2026 at 10:02 AM CEST, Dmitry Sakhonchik via lists.openembed=
ded.org wrote:
> From: Dmitry Sakhonchik <frezidok1@gmail.com>
>
> The existing test creates the output file with open(), which ends up
> using openat() and is therefore intercepted by pseudo before the actual
> io_uring write operation happens.
>
> Use IORING_OP_OPENAT to create the output file through io_uring as well.
> This makes the test successfully bypass pseudo
>
> io-uring-writev.bb: wrynose doesn't support "S =3D ${WORKDIR}" anymore, f=
ix it
>
> [YOCTO #15244]
>
> Signed-off-by: Dmitry Sakhonchik <frezidok1@gmail.com>
> ---

Hi Dmitry,

I suspect this was targeting Martin's branch and not master? Otherwise
we are missing the commits adding the io-uring-writev recipes.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


