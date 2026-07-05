Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A090C43602
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 08:21:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128130.1783239700953620745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 01:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NV2EhQAz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B3A374E40C98;
	Sun,  5 Jul 2026 08:21:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72E0F601A2;
	Sun,  5 Jul 2026 08:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 075B711BB87ED;
	Sun,  5 Jul 2026 10:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783239698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9Q4CWQsAKhkx0T+Y0PJvp4ywNVWrRmy4fmwCqAAPxvE=;
	b=NV2EhQAzWwfLNBsdvEafxITSaYlRk/4Kny/lhhh1Hj4SvIY8smGEEWJ+h5xtFTML4DZRlV
	31zMAS41k9cpipYIANxCUm30Md681Kei7tQuYeRLdxcq7NlevblU2cw0/K3jkIU//oH+4X
	9MOyYwUsLwIOti+aZqfnB5eHFU9/8oIWKeIEFGa/+qX5nmMB1ovKXeLnP8deGjg6qSMnQm
	sHs46MlJ8r8OVslQRUsLO2Dp/sJ4muTqxyBGuGArR1BHrJpsZebnofCa2aZK/28d0rQlQt
	oZogtcHut5WESF1zjuSB/yCRTaZndE7BJbNuwbTXlklbBm2MjqtN3clPGrMjFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 10:21:36 +0200
Message-Id: <DJQHPR7DZ5DC.7UI26Y5DSKJV@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] readyfd2sd: add recipe
Cc: <yocto@pengutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Lucas Stach" <l.stach@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260702182012.2240881-1-l.stach@pengutronix.de>
In-Reply-To: <20260702182012.2240881-1-l.stach@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 08:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240141

On Thu Jul 2, 2026 at 8:20 PM CEST, Lucas Stach wrote:
> Some services, such as seatd, only implement the s6 init ready notificati=
ons.
> readyfd2sd translates those notifications to the systemd-notify format, t=
o
> make them usable with the systemd init system.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Hi Lucas,

Thanks for your patch.

It looks like this is failing with non-systemd distro.

WARNING: Nothing PROVIDES 'systemd' (but /srv/pokybuild/yocto-worker/qemuar=
m64-armhost/build/layers/openembedded-core/meta/recipes-core/readyfd2sd/rea=
dyfd2sd_git.bb DEPENDS on or otherwise requires it)
systemd was skipped: using DISTRO 'poky', which is missing required DISTRO_=
FEATURES: 'systemd usrmerge'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/4108
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4095
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4133
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4314
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4097

Can eadyfd2sd be built without systemd?

Also, please add the corresponding entry in
meta/conf/distro/include/maintainers.inc.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


