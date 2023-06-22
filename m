Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A178BEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 16:36:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.16502.1687451791194799598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 09:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QROfsd8j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687451789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ed26GAVpxS4iCjAk8u71D1bQ1FUKeIT0k8JoCAA85i4=;
	b=QROfsd8jfQqy31BODPL5oPSbds2BKNOuya4z5q/lhgLpybLaAxYffgye6j+dLE/7fSNFLD
	yoMDFDDL4ZhjxuNz5DknJodNPmiPS5GzXdLqPc0uzUu6OnOR4Ny2Sb/RChqrJ1HLJpICHY
	hDItXTgKXjJN3EzpM8uGljQHvnKkMcB3HdqhNXVGFxq1zLQWwY10cTCMhFn3kGalR7Uodl
	fvPZQD8G/JIl/2U5sRXmQ7/RRgu/VR2qdwYigY5NNQw+kj4GAFqDwzClNs7HnRFZ7RVaSO
	hRdZmnqXrCeSYhZRXtcsA1D+sFjZ/ZMdT0h5YiXmMj7U7gz7RAb49JFe6RExiw==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06DA7FF803;
	Thu, 22 Jun 2023 16:36:27 +0000 (UTC)
Date: Thu, 22 Jun 2023 18:36:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
 <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH V4 1/3] kernel-module-split: make autoload and
 probeconf distribution specific
Message-ID: <20230622183625.1d1dc9e6@booty>
In-Reply-To: <20230622084452.2026849-1-jose.quaresma@foundries.io>
References: <20230622084452.2026849-1-jose.quaresma@foundries.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183270

Hi Jose,

On Thu, 22 Jun 2023 08:44:51 +0000
"Jose Quaresma" <quaresma.jose@gmail.com> wrote:

> Also take the oportunity to only add configuration files to FILES
> and CONFFILES when they exist and are used.
> 
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

This has now turned to:

ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_package: QA Issue: linux-yocto: Files/directories were installed but not shipped in any package:
  /usr/lib

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5410/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5383/steps/15/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

