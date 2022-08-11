Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66965C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 09:01:48 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.4304.1660208507772295254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 02:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dM0rHFvQ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 67991240004;
	Thu, 11 Aug 2022 09:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660208505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ANQ2K/BLUL/S6pLNyB+RnX5sD5rK+9g4Q7inSnZ+0Oo=;
	b=dM0rHFvQ75FdFfp1XRJIr1QDZD5FvYXgGfZvGNRe5HGrmmBRyoW4zCg01FGz7447vD3vwp
	QE0gl5+4jKm7ploPDICtu7FeUZYqNHiYZi/DKgEOfzWFjcBierLhJe1pSw7mD/Y/C+V4AO
	t0JzOIg8+ls9qPISI2mLmb1eq+XWaVvV+d6cCRyQ9Tj61yrBlKqdW9PqL8IKj4b/adnLtI
	sGUWZihKzCRcCpVrMA+D912eMPGnSprjlXQcfdAAnwq//IGwkKkIQUoV6an7w7sBEBzeqa
	43C9umu7eNCwUIHSRimEq1WA8xt7WM0s6W75HKVvNfVpewTA+wecGEugK4rQGg==
Date: Thu, 11 Aug 2022 11:01:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [oe][OE-core][Patch 1/1] perf: depend on setuptools if building
 python scripting
Message-ID: <YvTFebDB3jqWSeER@mail.local>
References: <20220810072138.2440138-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810072138.2440138-1-max.oss.09@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 09:01:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169237

Hello Max,

On 10/08/2022 09:21:38+0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Starting with kernel 5.19-rc7 perf changed from using distutils
> to setuptools.
> Add this to the dependencies to be prepared.
> 

Unfortunately, this causes the following reproducibility issues:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220810-ikgt3whb/packages/diff-html/


> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/tools/perf?id=ee87a0841aa538ab7ad49cf5679ac5ea2682c909
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 95e7eae9fe..4b15b11462 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -13,7 +13,7 @@ PR = "r9"
>  
>  PACKAGECONFIG ??= "scripting tui libunwind"
>  PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
> -PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
> +PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
>  # gui support was added with kernel 3.6.35
>  # since 3.10 libnewt was replaced by slang
>  # to cover a wide range of kernel we add both dependencies
> -- 
> 2.35.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169185): https://lists.openembedded.org/g/openembedded-core/message/169185
> Mute This Topic: https://lists.openembedded.org/mt/92932047/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

