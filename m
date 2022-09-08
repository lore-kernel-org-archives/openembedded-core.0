Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4FEC54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 13:50:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.5827.1662644995633985933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 06:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d5faNgQS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F90F60012;
	Thu,  8 Sep 2022 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662644994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VGQFWuto17Nc6bzoHx0+kj3lLHR+7GnLugvkH5no/Xs=;
	b=d5faNgQS9hckdpq0aklU6hiU2ix5nXE79SOs1cvFocmZjDj3jaMfrW1PAvzL2OQoEftqAt
	XJu7cAlXIDhNCavo8A5fKb9+QePSLGq8HwgcM5fMjeHqV/H42+tr39hF2KbPdfkdbzE7pR
	Qx8nz5rbhH4yrryHlvjbd+gE2KFxFsPILJ6Kxp1n8CPv78Lk/RaOsAVm8A1G2FSKVJJx/9
	3gRCidEKbMXlZEwkbNttAIetPoAmzDsMtZ77VAsRpbJKsldMhlzuWSSxcnh00lHG8UDSyu
	/ZzKKN8THy5Yo23wozttpsQmUiMJGlmU3FMuOYbf48DkvS2Ygd5mJo19/VoYKQ==
Date: Thu, 8 Sep 2022 15:49:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Do not package
 gprofng.rc
Message-ID: <YxnzAV6GoTKNwboH@mail.local>
References: <20220907231417.3274392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907231417.3274392-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 13:50:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170460

Hi,

This caused failures similar to this one:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4110/steps/14/logs/stdio

Full list here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4203

On 07/09/2022 16:14:16-0700, Khem Raj wrote:
> This file is already packaged via nativesdk-gprofng and can cause
> populate SDK conflicts
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index 4e8f10c1c4..c18468ad50 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -23,10 +23,9 @@ do_install () {
>  	rm -f ${D}${libdir}/libiberty*
>  	rm -f ${D}${libdir}/libopcodes*
>  	rm -f ${D}${includedir}/*.h
> +        rm -f ${D}${sysconfdir}/gprofng.rc
>  	
>  	cross_canadian_bindirlinks
>  }
>  
> -FILES:${PN} += "${sysconfdir}/gprofng.rc"
> -
>  BBCLASSEXTEND = ""
> -- 
> 2.37.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170433): https://lists.openembedded.org/g/openembedded-core/message/170433
> Mute This Topic: https://lists.openembedded.org/mt/93537151/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

