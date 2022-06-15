Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5357C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 07:26:23 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.1748.1655277974442929383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 00:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IUI3OsMw;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3CD57240005;
	Wed, 15 Jun 2022 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655277972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E65NUSv2NG1Q3zQHfBIkxpVRla4YBIuDLY+yoIJEnOY=;
	b=IUI3OsMwyCfzH4z3/lHKWS+lv0E1MokKQfXiwHTkI0smI0E32cmnl5xkJNUBOcV2q4meYj
	FVkBX6VmuBL6qOBEwUwxkn1DBKsj+Smr8xeEkn4EI7lRYDNe6NpQ7xNCJBrrkEnlkuGSNk
	5cA9ZDkdqRDlSB8vFieucEyBStDd5DegaZSNyAEOvLqMX3Rky1Xkg5HnldH54ZTMHo7DFE
	lcfb7bqYq2gurulZewhunY96BSW+R8r+p+JSPOw0FzwKhSvqtd2BstcMQuZlQ2G8QRgZLM
	+jeo8WAsUfA29Rl4T6iFU7tnhufcqn3elz+mzrpgmmPfyI3vP6u6kasCyPa+uA==
Date: Wed, 15 Jun 2022 09:26:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] wic: Use ROOTFS_DIR to locate pseudo_dir
Message-ID: <YqmJk1TfiiQwvKWl@mail.local>
References: <cover.1655274860.git.liezhi.yang@windriver.com>
 <9e7e057f730abc1b8c5f1a942618ba1303ef526d.1655274860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <9e7e057f730abc1b8c5f1a942618ba1303ef526d.1655274860.git.liezhi.yang@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 07:26:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166910

Hello,

On 14/06/2022 23:35:29-0700, Robert Yang wrote:
> Fixed when wks is:
> part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4096 --fixed-size 256M
> part / --source rootfs --exclude-path=var/ --ondisk mmcblk0 --fstype=ext4 --label root --align 4096
> part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M --fsoptions=ro,relatime,sync
> 
> $ bitbake <image>
> $ wic create <wks> -e <image>
> WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames and permissions will be invalid
> 
> The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
> ROOTFS_DIR to fix the problem.
> 
> The patch is from "Rath Anil Kumar <AnilKumar.Rath@windriver.com>"

We need a proper Signed-off-by and From: to reflect that.

> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> index 25bb41dd702..11b09c1e80e 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -95,7 +95,7 @@ class RootfsPlugin(SourcePlugin):
>  
>          part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
>          part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
> -        pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
> +        pseudo_dir = os.path.join(krootfs_dir['ROOTFS_DIR'], "../pseudo")
>          if not os.path.lexists(pseudo_dir):
>              pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
>  
> -- 
> 2.33.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166909): https://lists.openembedded.org/g/openembedded-core/message/166909
> Mute This Topic: https://lists.openembedded.org/mt/91771589/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

