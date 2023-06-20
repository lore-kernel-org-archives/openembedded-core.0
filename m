Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901B9EB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 13:57:36 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.11061.1687269449073103396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 06:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=egolVS9C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687269447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMYj1VvBE4/YLaND4y/3SnSboSl0ueeg2C/7kmfuM0c=;
	b=egolVS9C0lL2Qbj6Vg5NklN/6HIm+OTxaLNW7pPIqmXKPKBcXCknQrHZmDL9/UJkDcc8Qy
	IVdQWQnxGArVH0tcBmqxAzcVJFDnyVnOCrO2Zucas9gVJVH/yiDE7adl895AbVi/u8bS2x
	JIdzVZ2MLzFtrJflk2XAECgcCM+1V/bWaYC9lT6T74J0wtdj3Ym3lwBBJEZvU4DlguPvWw
	DbBxd+YYxl15nxbm++5fVDyVIMtqOhlW9Mg1CGWk6DoGHdtabnXkizbCQ3CH/P0Cphz1t7
	+IISWj0YdmBFgzGMw0++VXcwtvxAcyElth7pZCdWLaDNsLMvxVmqZJJzW9DBog==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80902240002;
	Tue, 20 Jun 2023 13:57:26 +0000 (UTC)
Date: Tue, 20 Jun 2023 15:57:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
 <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH V2 1/2] kernel-module-split: make autoload and
 probeconf distribution specific
Message-ID: <20230620155725.73656341@booty>
In-Reply-To: <20230619231343.1683736-1-jose.quaresma@foundries.io>
References: <20230619231343.1683736-1-jose.quaresma@foundries.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 13:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183137

Hello Jose,

On Mon, 19 Jun 2023 23:13:43 +0000
"Jose Quaresma" <quaresma.jose@gmail.com> wrote:

> The modules-load.d [1] - Configure kernel modules to load at boot
> should install their configuration files in /usr/lib/modules-load.d.
> 
> The modprobe.d [2] - Configuration directory for modprobe
> should install their configuration files in /lib/modprobe.d
> 
> [1] https://www.freedesktop.org/software/systemd/man/modules-load.d.html
> [2] https://www.man7.org/linux/man-pages//man5/modprobe.d.5.html
> 
> [YOCTO #12212] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12212
> 
> CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
> CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>

This patchset is triggering some AB failures:

  Exception: NameError: name 'modprobedir' is not defined

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6229/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7658/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2935/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7369/steps/17/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

