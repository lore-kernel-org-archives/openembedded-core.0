Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E21EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 20:22:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.539.1687378957388020749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 13:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dTGfGkqE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687378955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkDr2pamWNwBr0nglOtzb1j6+3piUmKrZj5pG8iwS7k=;
	b=dTGfGkqEYIqBehYmXOilvq1Dp0JcMOqv8IkL3NBa7lsAMD0UXOOjr7c0Bl0AGymRpeFHZd
	xKfOaj05ITweOsdRuVT1BPH7eKpLyMJaZkQG798K1VatnrdUrUT7oLQM9uFI9yWR/Dxxtu
	DBHUjDKuPzmOEfty2DceBq9081IdT7GFFCLy6LZfX30sCDso+ggCniIsJeJKPSrT065AEy
	EPEe8+MnMUP3vWBd6wtrMr1uAx6vYlpMgCVAYubCIn9J+u+rLwoqRlWug47S1P/HrzE2RO
	9ViUFDrRKdRrfuPONRUDEHy8hQ5IDYZvulRtbJ12r5+4LS2VUtRrc6xCYL8qqw==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BF7620005;
	Wed, 21 Jun 2023 20:22:33 +0000 (UTC)
Date: Wed, 21 Jun 2023 22:22:32 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
 <jose.quaresma@foundries.io>, Ola x Nilsson <Ola.x.Nilsson@axis.com>, Peter
 Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCH V3 1/3] kernel-module-split: make autoload and
 probeconf distribution specific
Message-ID: <20230621222232.6575ab6b@booty>
In-Reply-To: <20230620221942.2801107-1-jose.quaresma@foundries.io>
References: <20230620221942.2801107-1-jose.quaresma@foundries.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 20:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183198

Hi Jose,

On Tue, 20 Jun 2023 22:19:42 +0000
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

We're having this error on the autobuilders:

ERROR: linux-yocto-6.1.33+gitAUTOINC+db25e51e20_947f660bde-r0 do_package: QA Issue: linux-yocto: Files/directories were installed but not shipped in any package:
  /etc

May it be caused by this series?

Logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/7665/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7376/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

