Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DAAC10F07
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 11:02:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.5878.1702292569601323910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 03:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=C3mL4HgJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B83DC0002;
	Mon, 11 Dec 2023 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702292567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dWzNnjWwIcHeog+2kzdDdI6nEHWtEAHonab+bMiUGrY=;
	b=C3mL4HgJO+dK5pjPekCtZjzKUvRvZjg/rjNPZ6bXT7BMOPC+XjR3WA0zhdnMTpnmJ4+551
	I/YntpBLpcg/5MmM0LfWzLNQlickeuaUDF8k8py8/PWvASbVIklgI6POq1d+tzhKxVoKky
	AEWke3hYiX+dk52pbn5YP+ugncCva8tflR0lzwhlwhDeJ30ONB2b+B8rawG8So9qyj1NZ4
	la28q9vdnM5VkBlkctMW2b9pGGzfb0D/okGU1xvczr6DlrhcC0li1DPIbQob9rBtcZedq0
	UE4ox39vzG5v0xXEwKhBMKHH2/SAkZEjrWVmL55MGs/p8QXaG+B/sEUvPENurQ==
Date: Mon, 11 Dec 2023 12:02:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lizhi.Xu@windriver.com
Cc: openembedded-core@lists.openembedded.org, anca.mihalache@windriver.com
Subject: Re: [PATCH] [OE-Core] tzdata: only the timezone subpackage
 tzdata-core is retained
Message-ID: <20231211110247ae40506c@mail.local>
References: <20231211033927.1042557-1-lizhi.xu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211033927.1042557-1-lizhi.xu@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 11:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192162

Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

On 11/12/2023 11:39:27+0800, Xu, Lizhi via lists.openembedded.org wrote:
> To reduce the size of rootfs, the subpackages contained in tzdata.bb will now 
> default to only retaining tzdata-core.
> 
> tzdata.bb by default pulls in all possible timezone data packages which increases
> size of the final root filesystem considerably.
> The customer would like to have extra timezones configurable so that only 
> tzdata-core is chosen by default and rest of the zones are optional.
> 
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  meta/recipes-extended/timezone/tzdata.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
> index dd1960ffa7..7b1d4fd460 100644
> --- a/meta/recipes-extended/timezone/tzdata.bb
> +++ b/meta/recipes-extended/timezone/tzdata.bb
> @@ -201,4 +201,4 @@ CONFFILES:tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
>  
>  ALLOW_EMPTY:${PN} = "1"
>  
> -RDEPENDS:${PN} = "${TZ_PACKAGES}"
> +RDEPENDS:${PN} = "tzdata-core"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192141): https://lists.openembedded.org/g/openembedded-core/message/192141
> Mute This Topic: https://lists.openembedded.org/mt/103102817/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

