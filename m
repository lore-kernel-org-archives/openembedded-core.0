Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93BFCDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 20:57:22 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.39249.1697749040956296814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 13:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZROULRsC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1A70C0003;
	Thu, 19 Oct 2023 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697749039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zveWIswIiBM5e2dE6XxozDc0tvZAr4KTIuPFvGysrv8=;
	b=ZROULRsC1tP9UvS8SrZdkcVmMA9JYm8ADn3mUhkwZUgibmLfZ0zlCSK25yMDc5riP0OczR
	+5hYR8aWyGFtPx2F94rlyob+48qceMGO5fzQTO+s0/fWWXpCbikaExKPyWVsYZHZ5Y2HM4
	cr/4FLurcsywSh8pmkL6yXkVmx7g7it+D6gKCVcjTgqYbA2UfvxYRxl1RTraz8jEazcXVE
	mqUvrThoNo0TTd1g9YM8pFcxxVtztjgyhD4EnjdqGPsdAfjJmbo34zKk3vCGuDYL55pQb1
	ezoLy0lT6Q+Cs5CLa3fxaT33WjxnIqAk9mweC8fcFYqOW6ef1TSo/MdTREoa4A==
Date: Thu, 19 Oct 2023 22:57:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: logang@deltatee.com
Cc: openembedded-core@lists.openembedded.org,
	Logan Gunthorpe <logan.gunthorpe@eideticom.com>
Subject: Re: [OE-core] [PATCH] runqemu: Add squashfs filesystem types
Message-ID: <202310192057180d3b8ab7@mail.local>
References: <20231019181051.216536-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019181051.216536-1-logang@deltatee.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 20:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189484

Hello,

On 19/10/2023 12:10:51-0600, Logan Gunthorpe via lists.openembedded.org wrote:
> From: Logan Gunthorpe <logan.gunthorpe@eideticom.com>
> 
> When using a squashfs filesystem type, runqemu requires specifying the
> full path to the image because it doesn't list squashfs types in its
> fstypes variable. Add them to provide the same support as other
> filesystem types.
> 
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

One of the SoB must match your From:

> ---
>  scripts/runqemu | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 6fca7439a1d2..18aeb7f5f0cf 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -198,7 +198,9 @@ class BaseConfig(object):
>          self.snapshot = False
>          self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
>          self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
> -                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
> +                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz',
> +                        'squashfs', 'squashfs-xz', 'squashfs-lzo',
> +                        'squashfs-lz4', 'squashfs-zst')
>          self.vmtypes = ('hddimg', 'iso')
>          self.fsinfo = {}
>          self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
> 
> base-commit: f65f100bc5379c3153ee00b2aa62ea5c9a66ec79
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189478): https://lists.openembedded.org/g/openembedded-core/message/189478
> Mute This Topic: https://lists.openembedded.org/mt/102065945/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

