Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECDAC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 16:16:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.27271.1704471396696631906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 08:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Whs8dtGY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFC00FF806;
	Fri,  5 Jan 2024 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704471394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJy4QdZxWvFXKbjFc5q1sIMkbtU/8D+HteGFLJOZqpA=;
	b=Whs8dtGYPDhYPjB+BfoFhINQO7TiyvP+vFBJ4GN4Q1Da9tjxLDCy836LntcKCzJo9R5Spe
	u8C149EjCHR0uvW0OPBhIiyDy3p3jSXyPrH07ONG34yFGIBldS46AdGmBY3Z4pSVWC0vN1
	p7r2oFj/Upc9mRJNogg8bIdu1IjPQxzIS1jbBe2FgbcOWLuJNhfat2gHjAjNSszlthq4wb
	InNyhJFL9bJKNVxYARxLVoagTvM/5UsIFWOXrVe3f10L7BeHQbP1IZFSzRoXesk8BAGp6g
	KA32Iepvgh4VIhJNqFTA20Lt5Bk2ynN3wfbg+cNKhbrLbU8uUVVUsFYpjkIAEg==
Date: Fri, 5 Jan 2024 17:16:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] Revert "opkg-utils: upgrade 0.6.2 -> 0.6.3"
Message-ID: <20240105161633534ec064@mail.local>
References: <20240104021052.754030-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104021052.754030-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 16:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193370

I believe this caused:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4191/steps/12/logs/stdio

On 03/01/2024 18:10:51-0800, Khem Raj wrote:
> This reverts commit a856192be5dd78c621478ed29871191c580686c4.
> 
> It causes a regression in creating different GIDs in image and ipk as
> reported in [1]
> 
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15334
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../opkg-utils/{opkg-utils_0.6.3.bb => opkg-utils_0.6.2.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.6.3.bb => opkg-utils_0.6.2.bb} (97%)
> 
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> similarity index 97%
> rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
> rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> index b509227e1a6..eb88b9b734c 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> @@ -10,7 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
>  SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
>             file://0001-update-alternatives-correctly-match-priority.patch \
>             "
> -SRCREV = "589880d01969eb9af1e66120e731d43193504718"
> +SRCREV = "67994e62dc598282830385da75ba9b1abbbda941"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193299): https://lists.openembedded.org/g/openembedded-core/message/193299
> Mute This Topic: https://lists.openembedded.org/mt/103515671/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

