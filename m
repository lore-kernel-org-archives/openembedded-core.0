Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70A1C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 19:00:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.852.1648234850143781267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 12:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=djbjgH42;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6E08940006;
	Fri, 25 Mar 2022 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648234846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns4JcpOcyTXe51rore87GOmGf3HGuXAPWW5oOYQ9IR0=;
	b=djbjgH424d7wcY98UvboruV4ZEGiHeBTgM89M95PMkMo1FMsINrkGvLdvkq4GbfeHv0JEH
	+lY4hhkeW/GTFopKlPOA1PyyVlCAbhoR2idg5uSzwuBOtIcQJBYyd9IFsD/aEPTiPtTJn6
	AVm82/3KXyjPf1hWDoSGt/j/xETlt/ifLvlVEtFpq6Nw+iVy3hOhoThNYbsDqUomUj23Fh
	7MWgCSw64xzZKNqzp/VnIUbSVUg6hoAGFoXKgrNXQXsStjdAGy3f17kbAFKNGsW6W/hUpD
	f8Krg0WO4cF1G7+Kzx9TVjQ3ms0wKpzQ++isg4ZRJvXSNKW8aHtUmIzuP40BsQ==
Date: Fri, 25 Mar 2022 20:00:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: Re: [OE-core] [PATCH v2] zstd: add zstd-bin package
Message-ID: <Yj4RXR9b4ufCt+t4@piout.net>
References: <20220325122950.1148-1-stefan.herbrechtsmeier-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20220325122950.1148-1-stefan.herbrechtsmeier-oss@weidmueller.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 19:00:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163651

Hello,

On 25/03/2022 13:29:50+0100, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Add a zstd-bin package to remove libstdc++ runtime dependency from
> library users and reduce the dependencies and size of the library
> package.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 

I believe this is the cause of:
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/4954/steps/11/logs/stdio

Can you check?

> ---
> 
> Changes in v2:
> - Add zstd-bin package instead of libzstd package
> 
>  meta/recipes-extended/zstd/zstd_1.5.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> index 0ddff469b8..2fdb9b6950 100644
> --- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
> @@ -18,6 +18,8 @@ CVE_PRODUCT = "zstandard"
>  
>  S = "${WORKDIR}/git"
>  
> +inherit lib_package
> +
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
>  PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163639): https://lists.openembedded.org/g/openembedded-core/message/163639
> Mute This Topic: https://lists.openembedded.org/mt/90021107/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

