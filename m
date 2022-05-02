Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1C0C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 19:09:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web12.1509.1651518571029853670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 12:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EWN7u36x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B8641C0002;
	Mon,  2 May 2022 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651518569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ah4iM9rOrdIAZ+Ibli3PEgQ39FNpJ9JiinWMxrQkxEI=;
	b=EWN7u36xx/+g75OUo2ydkJFQrYovYc4TwelEJUQmTlliW/NxaaO1ABoaNbH2dTH9ovTBxJ
	hwR2iEvO7NE0cQQjnCqe/DSxvNBvEYpXoKkjffBtElK7oT7uWkp5BMFVukVtEfD1HEpS/i
	nEt0/WDebG1PFZ8klx2YNpadPp3NNWGssRQFL2VFz3uLKj1qrRAQFFao6Oe/9dsjdCpbVV
	Cr5bfzcXLhFSyJBQaAhmxwSY9ZB9vOopeJnRu6X1uluBwi8PC3JWKyYsaU1tuZwN/CncH1
	kTH4Sxro8Z+Bdxxx/gacy7NcPJvgrcoMB1spfp6QIDCXmHHaA7mu37feyVToeg==
Date: Mon, 2 May 2022 21:09:27 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Claudius Heine" <ch@denx.de>
Cc: openembedded-core@lists.openembedded.org, Stefan Herbrechtsmeier
 <stefan.herbrechtsmeier@weidmueller.com>, Vyacheslav Yurkov
 <uvv.mail@gmail.com>
Subject: Re: [OE-core] [PATCH v2] classes: rootfs-postcommands: add skip
 option to overlayfs_qa_check
Message-ID: <20220502210927.1aad92b4@melee>
In-Reply-To: <20220429081733.225481-1-ch@denx.de>
References: <20220429081733.225481-1-ch@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 19:09:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165171

Hi Claudius,

Il giorno Fri, 29 Apr 2022 10:17:33 +0200
"Claudius Heine" <ch@denx.de> ha scritto:

> The overlayfs_qa_check checks if the current root file system has a
> mount configured for each overlayfs, when the overlayfs class is used.
> 
> However there are certain instances where this mount point is created
> at runtime and not static in a fstab entry or systemd mount unit.
> 
> One such case would be if overlayfs-etc is used, where the device is
> mounted in the preinit script and not via a mount unit or fstab entry.
> 
> However there are other possibilities for this as well, like startup
> scripts that support a dynamic partition layout. For instance when
> systemd-repart is used.
> 
> This adds the `OVERLAYFS_QA_SKIP` variable, which allows to define QA
> skips via its flags. In principle it supports multiple QA skip flags
> separated by whitespace, but only one (`mount-configured`) is
> implemented here. To skip this QA check simply add `mount-configured`
> to the flag of `OVERLAYFS_QA_SKIP` with the same name. For instance
> if a overlayfs is configured as:
> 
> 	OVERLAYFS_MOUNT_POINT[data] = "/data"
> 
> Skipping this QA check can be done by setting:
> 
> 	OVERLAYFS_QA_SKIP[data] = "mount-configured"
> 
> Signed-off-by: Claudius Heine <ch@denx.de>

Failures appeared on the autobuilders with your patch applied:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3530/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3530/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3470/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3521/steps/15/logs/stdio

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

