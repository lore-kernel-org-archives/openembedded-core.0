Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7573BC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:41:22 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web12.4071.1667832078203573468
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JDtRw2GC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A4CB1C0009;
	Mon,  7 Nov 2022 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667832076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZT8Pc5EUhK4SacqOBUs0iKnk8J2RC7ypckDm9RcLoc=;
	b=JDtRw2GCzyWnLHYkMLrZOlmuJiB5JTk0oGrWcghar09t7JbbmjPjb9f4UBxBvuKrpVbLub
	4pSaI4zbNk0Xp+lx+RM2NE0u8S7bpqapORx+mtiEGs+dh3lMUPFr2it7+utQUSmUwmcRqZ
	opP/p40U1kQ0w1q4JVw9oO+Na43G+d4NxFu7NcR6U/SfGUK7rk9G7ikMd8yHiRR41RbpNL
	extIWLdTFGK5izW9CqNbc07k7Fh9TRSSdIkQCLRIc7q6atF9iyjZ097TctyU4vkx/qJLsZ
	YFwZqXe3xWx/Pgxkf1ovRWch8CRdp1lScIDaoraPaAKoWOpzwzmpW/8cEM2D9g==
Date: Mon, 7 Nov 2022 15:41:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Livius <egyszeregy@freemail.hu>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master][PATCH v2 1/2] image_types: Add 7-Zip support
 in conversion types and commands
Message-ID: <Y2kZC0uwAuBEGtMC@mail.local>
References: <20221107123733.912-1-egyszeregy@freemail.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107123733.912-1-egyszeregy@freemail.hu>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172850

Hello,

On 07/11/2022 13:37:32+0100, Livius wrote:
> From: Benjamin Szőke <egyszeregy@freemail.hu>
> 
> Add 7-Zip support in conversion types and commands. Default arguments of 7-Zip are compression level: 9, method: BZip2, extension: zip. All these are overridable from local.con for any other use case in user side. First goal was to make an alternative zip conversion which can operate faster in multi-thread systems (on many CPU core), normal zip is just a single thread compression. 7-Zip can do a zip compression in multi-thread processing, so it is fine to use and speed up it.
> 

Could you also wrap the commit message?

Thanks!

> Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
> ---
>  meta/classes-recipe/image_types.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
> index 764e6a5574..f70c71b9d4 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -59,6 +59,10 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>  
>  ZIP_COMPRESSION_LEVEL ?= "-9"
>  
> +7ZIP_COMPRESSION_LEVEL ?= "9"
> +7ZIP_COMPRESSION_METHOD ?= "BZip2"
> +7ZIP_EXTENSION ?= "zip"
> +
>  ZSTD_COMPRESSION_LEVEL ?= "-3"
>  
>  JFFS2_SUM_EXTRA_ARGS ?= ""
> @@ -304,7 +308,7 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
>  # CONVERSION_CMD/DEPENDS.
>  COMPRESSIONTYPES ?= ""
>  
> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
>  CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>  CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> @@ -312,6 +316,7 @@ CONVERSION_CMD:xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=
>  CONVERSION_CMD:lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD:lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD:zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +CONVERSION_CMD:7zip = "7za a -mx=${7ZIP_COMPRESSION_LEVEL} -mm=${7ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD:zst = "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
>  CONVERSION_CMD:sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  CONVERSION_CMD:md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
> @@ -337,6 +342,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
>  CONVERSION_DEPENDS_lz4 = "lz4-native"
>  CONVERSION_DEPENDS_lzo = "lzop-native"
>  CONVERSION_DEPENDS_zip = "zip-native"
> +CONVERSION_DEPENDS_7zip = "p7zip-native"
>  CONVERSION_DEPENDS_zst = "zstd-native"
>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
> -- 
> 2.38.1.windows.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172837): https://lists.openembedded.org/g/openembedded-core/message/172837
> Mute This Topic: https://lists.openembedded.org/mt/94864714/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

