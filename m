Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C50C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 07:49:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.3149.1660117739614484910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 00:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=djdY3fqE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 13D14C0006;
	Wed, 10 Aug 2022 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660117737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RbpK8G7IDor1Hl5J5MoqDfcusJxiBJreckQ4h2Pegzw=;
	b=djdY3fqEl48R1gXy4cDM7gLgTaRk95h5nIIY/ElDQBW+Q/T8JAeZqAJ5cv9gMv6om8b+la
	AmitaIqii/KAJtzK2E9f5ZF832Kil5dSDAq5Wzi+cbVvrNzrIZKoOaF1+6Sec8s1FefL4D
	gJDhBaMoocEgNUrUpfcTuJ/4iBpddBTfuJJQgLz342AH6q58k2qN4yy2Dq1btHvDR5t1EV
	3vQLKF6jiR4+V+Nv/G4lYY9aH+tyOj49GoOeDditLkBkrZ/mMg5f6sN3UWcc38J4n0XSDY
	Gj4S5orc+nibztQN5KVngeRfv5/LcMiBjbtWXauPb8RInI+PMWtOcdLEqvEHrA==
Date: Wed, 10 Aug 2022 09:48:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: JeongBong Seo <lifeofthanks@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	JeongBong Seo <jb.seo@lge.com>
Subject: Re: [OE-core] [PATCH] wic: add 'none' fstype for custom image
Message-ID: <YvNi59exCGgnhioM@mail.local>
References: <20220808045710.25038-1-jb.seo@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808045710.25038-1-jb.seo@lge.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 07:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169186

Hello,

On 08/08/2022 04:57:10+0000, JeongBong Seo wrote:
> It's not possible to set the label (of gpt entry) normally
> when I want to use non-listed fstype as a rawcopy.
> 
> Example)
> part ? --source rawcopy --ondisk mmcblk0 --label mypart --sourceparams file=mypart.raw
> 
> To resolve this problem, this patch addes a 'none' fstype
> and ignore do_image_label on rawcopy (that actually set the partition label.)
> 
> Signed-off-by: JeongBong Seo <jb.seo@lge.com>
> ---
>  scripts/lib/wic/ksparser.py               | 2 +-
>  scripts/lib/wic/plugins/source/rawcopy.py | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 452a160232..298e593ad4 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -157,7 +157,7 @@ class KickStart():
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fstype', default='vfat',
>                            choices=('ext2', 'ext3', 'ext4', 'btrfs',
> -                                   'squashfs', 'vfat', 'msdos', 'swap'))
> +                                   'squashfs', 'vfat', 'msdos', 'swap', 'none'))

This doesn't apply on master, can you rebase please?

>          part.add_argument('--mkfs-extraopts', default='')
>          part.add_argument('--label')
>          part.add_argument('--use-label', action='store_true')
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
> index 3c4997d8ba..a71629282d 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -21,6 +21,10 @@ class RawCopyPlugin(SourcePlugin):
>  
>      @staticmethod
>      def do_image_label(fstype, dst, label):
> +        # don't create label when fstype is none
> +        if fstype == 'none':
> +            return
> +
>          if fstype.startswith('ext'):
>              cmd = 'tune2fs -L %s %s' % (label, dst)
>          elif fstype in ('msdos', 'vfat'):
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169013): https://lists.openembedded.org/g/openembedded-core/message/169013
> Mute This Topic: https://lists.openembedded.org/mt/92886214/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

