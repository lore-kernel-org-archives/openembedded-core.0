Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C6FC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:34:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.12016.1676392460300676853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lPfUVclq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 122C64000D;
	Tue, 14 Feb 2023 16:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676392458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhah2hSYYEfI5WX+24WGrAlsp/fuzyr/ir9LwcgLSpg=;
	b=lPfUVclqBTvOR1xKz5NEzeiS3Wka/XegUIq9xrIcI0LBvS5SeFub0IkcFiQAtyvJdVWSnn
	m+U07ZNLhqYigipWq9+AHzHnw5zjmBXszEfdFYcPcgf54VQgwm1NzfHmKMU7h4WLBCt0wf
	DcJ6IMUXLnMeh8IPXq46MPP6V0My0Aq4UkhiGpJy4hyvV9ebvZ46Z/Ige3/YRLW5YuJED/
	1nH33wtJXFHH+D7BkMyxAdycXv7D3PBXsIK8x35XzyIrHmNzJBHwsiAjv+Cy2ALR6fuc7V
	2BQq2mrVenDfHJPAWFXvyWSEe3sd56xZ/OcTBDQ8S8k5QxbJqmi65oB8IXIccw==
Date: Tue, 14 Feb 2023 17:34:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anton Kikin <a.kikin@tano-systems.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] busybox: Fix excluding .debug from depmod
Message-ID: <Y+u4CaQgFyDr8rqS@mail.local>
References: <20230214131734.2002-1-a.kikin@tano-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131734.2002-1-a.kikin@tano-systems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177156

Hello,

Saul sent this on Friday:
https://lore.kernel.org/openembedded-core/20230210153255.2716448-1-saul.wold@windriver.com/

On 14/02/2023 16:17:34+0300, Anton Kikin wrote:
> The previously added patch for excluding .debug from depmod has an
> invalid expression in the condition. The strstr function returns
> NULL if substring is NOT found [1]. Therefore, the existing patch,
> on the opposite, handles only modules that have a .debug substring
> in the path. This commit fixes the condition in the patch to the
> correct one.
> 
> [1]: https://man7.org/linux/man-pages/man3/strstr.3.html
> 
> Signed-off-by: Anton Kikin <a.kikin@tano-systems.com>
> ---
>  .../busybox/0001-depmod-Ignore-.debug-directories.patch    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
> index 354f83a4a5..3398a354c5 100644
> --- a/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
> +++ b/meta/recipes-core/busybox/busybox/0001-depmod-Ignore-.debug-directories.patch
> @@ -1,6 +1,6 @@
>  From 5f6ed003f10ee0bd4a508d5f59129a29f0920dfc Mon Sep 17 00:00:00 2001
> -From: Saul Wold <saul.wold@windriver.com>
> -Date: Thu, 31 Mar 2022 11:21:45 -0700
> +From: Anton Kikin <a.kikin@tano-systems.com>
> +Date: Tue, 14 Feb 2023 15:46:42 +0300
>  Subject: [PATCH] depmod: Ignore .debug directories
>  
>  The .debug/<module>.ko files do not have the correct symbol information
> @@ -9,6 +9,7 @@ since it's split away from the actual <module>.ko file. Just ignore it.
>  Upstream-Status: Pending
>  
>  Signed-off-by: Saul Wold <saul.wold@windriver.com>
> +Signed-off-by: Anton Kikin <a.kikin@tano-systems.com>
>  ---
>   modutils/depmod.c | 3 +++
>   1 file changed, 3 insertions(+)
> @@ -21,7 +22,7 @@ index bb42bbe..aa5a2de 100644
>   	/* Arbitrary. Was sb->st_size, but that breaks .gz etc */
>   	size_t len = (64*1024*1024 - 4096);
>   
> -+	if (strstr(fname, ".debug") == NULL)
> ++	if (strstr(fname, ".debug"))
>  +		return TRUE;
>  +
>   	if (strrstr(fname, ".ko") == NULL)
> -- 
> 2.34.1.windows.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177141): https://lists.openembedded.org/g/openembedded-core/message/177141
> Mute This Topic: https://lists.openembedded.org/mt/96959409/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

