Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28B9EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 13:32:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8324.1688045571184385653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 06:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BT5xvK5r;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688045569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1AENHX/5BkPpmh+8Vrr1zVxv3+ZLoae3qgvor0DE1gs=;
	b=BT5xvK5rixz+2zhXGOj98H8RElS+r5GxG2DVZTQJuzguTIBL+KczXaYdeOXWjcHwqwhGUs
	rDk/iCqqpMDos4jD/iWRBY2OcX86SREJFGgAt8cnoLrGOTaolWwxgmTJiRzVXMBMuCaP9L
	QjJzw1aryLmfCzwglk7JccjP/a166WUlGt744P8jVS6ZYVHCPEHkoNJy+bxhwpsaQQ6Kb7
	qbNWxf3EPOWjmFyv/0ePxeHqMZvYs+6XUfjBTB+aPoFxrPYA++H1GILG66JgVtGBNwkP8G
	cdmGzEgokzVp95b+DJli+g2m+5thHqIz7vd2Tk39vKZJ5FqERqkiuHu7FqLu5A==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D244A1BF208;
	Thu, 29 Jun 2023 13:32:48 +0000 (UTC)
Date: Thu, 29 Jun 2023 15:32:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] gcsections: apply section removal also in C++,
 not only in C
Message-ID: <202306291332488ed625f8@mail.local>
References: <20230629122808.730507-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629122808.730507-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 13:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183625

Hello Peter,

I have collected it but this patch should have gone to the poky mailing
list as this is for meta-yocto.

On 29/06/2023 14:28:08+0200, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> Currently only CFLAGS contains sections optimizations.
> This is used during C compilation.
> C++ compilation uses CXXFLAGS instead.
> 
> I did not introduce CXXFLAGS_SECTION_REMOVAL because the options
> are identical in C and C++, while adding it would add whole lot
> of additional useless lines of code to maintain.
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-poky/conf/distro/include/gcsections.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-poky/conf/distro/include/gcsections.inc b/meta-poky/conf/distro/include/gcsections.inc
> index a1f8651ae9..0e7bd2efff 100644
> --- a/meta-poky/conf/distro/include/gcsections.inc
> +++ b/meta-poky/conf/distro/include/gcsections.inc
> @@ -27,8 +27,10 @@ LDFLAGS_SECTION_REMOVAL:pn-nativesdk-mingw-w64-winpthreads = ""
>  
>  # set default for target
>  CFLAGS:append:class-target = " ${CFLAGS_SECTION_REMOVAL}"
> +CXXFLAGS:append:class-target = " ${CFLAGS_SECTION_REMOVAL}"
>  LDFLAGS:append:class-target = " ${LDFLAGS_SECTION_REMOVAL}"
>  
>  # set default for nativesdk
>  CFLAGS:append:class-nativesdk = " ${CFLAGS_SECTION_REMOVAL}"
> +CXXFLAGS:append:class-nativesdk = " ${CFLAGS_SECTION_REMOVAL}"
>  LDFLAGS:append:class-nativesdk = " ${LDFLAGS_SECTION_REMOVAL}"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183621): https://lists.openembedded.org/g/openembedded-core/message/183621
> Mute This Topic: https://lists.openembedded.org/mt/99849581/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

