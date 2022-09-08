Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54761C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 13:48:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.5696.1662644903917437491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 06:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lk0WBlte;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 72587C0013;
	Thu,  8 Sep 2022 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1662644901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yi8XoDdA/Gy3Td0Wk4MHszPB1jbayJz9pwY3YVjP1UM=;
	b=lk0WBlteb81utwNtS0XhPR7cz6Jxcq3cgzFlCP2mbLfG6EXdg9LrFz1Ahg4LWxwnAKuyYs
	l47yqlcigcOUHQzjM0PHSllfVpHtBTW6qRMeL/5QxLMLKwFREWJLlrWd6ZdfgQTizOuiwu
	29/h9MwTTd0ImwGJa/+peP1aGpXhTSKMPSv3bYnpj50vUCU58HqeENccQC4m71rX5oa0sO
	/gKcQZy9fz/hdpukj9jlJP0uLn2ErirTgvowcdlqnSgFWf1izYz+rZ+7LOKJuJyVuNhhxe
	sDcCTW14yIiIRJtmYEw4Zn/B2spAr2H5h+P/CypJXqm0rKnde8tWHmWEiK10Kw==
Date: Thu, 8 Sep 2022 15:48:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Enable mdio for qemu
Message-ID: <YxnypGsRgsp6Uaxt@mail.local>
References: <20220907220535.3017588-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907220535.3017588-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 13:48:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170459

Hi,

This caused many failures like this one:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5847/steps/11/logs/stdio

On 07/09/2022 15:05:35-0700, Khem Raj wrote:
> There are package like mdio-netlink in meta-oe which need this feature
> to be available, it has started to fail with 5.19
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> index 0ff28aa952..e96395d1bb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> @@ -56,7 +56,7 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>  KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> -KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> +KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
>  KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> -- 
> 2.37.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170431): https://lists.openembedded.org/g/openembedded-core/message/170431
> Mute This Topic: https://lists.openembedded.org/mt/93535950/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

