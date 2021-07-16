Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7100.1626445572685167829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 07:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9D95B20010;
	Fri, 16 Jul 2021 14:26:10 +0000 (UTC)
Date: Fri, 16 Jul 2021 16:26:10 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] image_types: ext4 should always have large inodes
Message-ID: <YPGXApLL4WTfJHbp@piout.net>
References: <20210716122407.19416-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210716122407.19416-1-ross.burton@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

This broke at least non-gpl3:
https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3691/steps/11/logs/stdio

On 16/07/2021 13:24:07+0100, Ross Burton wrote:
> mkfs.ext4 has logic where "small" file systems use "good old" 128-byte
> inodes instead of the default 256-byte inodes.  This means that small
> filesystems are not 2038-safe as they only support 32-bit timestamps.
> 
> However, "small" is defined as "less than 500MB", which is a fair number
> of filesystems in OpenEmbedded, especially when filesystems may be
> created small and expanded later.
> 
> To avoid a discussion over how small a file system should be before
> it shouldn't be 2038-safe, simply build all filesystems with the default
> type so they all have 256-byte inodes and thus 64-bit timestamps.
> 
> [ YOCTO #14478 ]
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/image_types.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 954d6739ec..3dad86caa7 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -90,7 +90,7 @@ oe_mkext234fs () {
>  
>  IMAGE_CMD_ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
>  IMAGE_CMD_ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_ext4 = "oe_mkext234fs ext4 -T default ${EXTRA_IMAGECMD}"
>  
>  MIN_BTRFS_SIZE ?= "16384"
>  IMAGE_CMD_btrfs () {
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
