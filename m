Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0583DC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 12:49:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.7498.1675860595117796395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 04:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ApmSZPeY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 58304FF80B;
	Wed,  8 Feb 2023 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675860592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+lJuE3s+QrJRafnWZDyq9jo8wAUyK+HUWbrS+ihwFI8=;
	b=ApmSZPeY4Nc3zNE6bIigMrcyRXQ1AO00uoW9cutjW85yS3nUAXl0ZepSpYCpSFfJVxFom2
	EZpLIIb7zaEQLmELC+Y+VmfxVXd9PspYdVsf3c00FAiXS7lJ1WEzc1j9jcuR3vaixj+5zU
	uUvYXreEBQuXBAqd5D1C5kgExIPmpHad6ghUHwEY11leWgplLmBQ6xHws28L58yK9spSCO
	BT7fktj7HPW9uHcZ/G8ny1Pu0ubdnT3L1TYXKPNdgBgAzC8PScmW+LRZtpeAtT/AvQQkFy
	b2tOTKM6Wk/gtw+UIokF1pKRP1QIbGlj7Vnq+6XX1HBZ4zJdA3nhg/keI3aLVg==
Date: Wed, 8 Feb 2023 13:49:50 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv3] wic-imager-direct.py: use fstab update also
 for root device
Message-ID: <20230208134950.6f1f1064@booty>
In-Reply-To: <20230207124456.6091-1-f_l_k@t-online.de>
References: <20230207124456.6091-1-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 12:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176905

Hello Markus,

On Tue,  7 Feb 2023 13:44:56 +0100
"Markus Volk" <f_l_k@t-online.de> wrote:

> wic imager is able to add entries for the partitions to fstab. This patch also
> creates an entry for the root device, which was previously ignored. The root
> device entry can now optionally be uuid or label based.
> 
> The stock fstab file provided by base-files.bb already contains an entry for the
> root device. To avoid a duplicate entry in fstab, this  '/dev/root' line is removed
> during the fstab update.
> 
> The default /dev/root entry in base-files adds the value '1' for dump and passno. Add an
> argument to set dump, which formerly has been hardcoded to '0'. Like this we can provide the
> same settings if using the fstab_update.
> 
> The result looks something like this:
> 
> proc /proc proc defaults 0 0
> devpts /dev/pts devpts mode=0620,ptmxmode=0666,gid=5 0 0
> tmpfs /run tmpfs mode=0755,nodev,nosuid,strictatime 0 0
> tmpfs /var/volatile tmpfs defaults 0 0
> 
> UUID=055A-69B5 /boot vfat defaults 0 0
> UUID=0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 1 1
> 
> If neither '--on-disk' nor '--use-label' nor '--use-uuid' are set in the wks file, wic falls
> back to '/dev/sda' as the default device entry, which may or may not be valid.
> Avoid starting to guess if we don't know anything and just skip the partition in that case,
> except for the root partition where we add back '/dev/root' as a reasonable default,
> because we can rely on it in the yocto/oe environment.
> 
> The result is now like this:
> 
> proc                 /proc                proc       defaults              0  0
> devpts               /dev/pts             devpts     mode=0620,ptmxmode=0666,gid=5      0  0
> tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
> tmpfs                /var/volatile        tmpfs      defaults              0  0
> 
> /dev/root	/	ext4	defaults	1	1
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

This patch is failing on the autobuilders:

  AssertionError: False is not true : /dev/sda2 on / type ext4 (rw,relatime)

and also this, even though I'm not sure how it relates to your changes:

  AssertionError: None is not true : diff: can't stat '/data/overlay-etc/lower/lower-layer-test.txt': No such file or directory

Logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4780/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4725/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

