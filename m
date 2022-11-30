Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C746C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:48:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.13046.1669819732156318263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 06:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nkj7JTfQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 868F7FF804;
	Wed, 30 Nov 2022 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669819730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJCerAmqh3wWPyAwTZSIKHFWv57kg4+Kr5NOMtxFrg8=;
	b=nkj7JTfQNswS/5YmHhQmmKzPXeL3YV7KM00WgBZigQzlt8tYOQx4mATjH1qBGHcXPNfBQD
	AkLKw9j4us0KnS4Fcv42G3SI1R/o4cn1qPRtVWeIaYMx7uXYE4IOJBOPVIY+ctLu/Mf9b+
	lI2/sKp0WCLV3MxEQJVe8iNCBlFYCPZyf+pRrx3tl7ERkjeHoas5/OgQ+QUtoRgyZixBan
	XvyJLT76mJyd0UvnxrIyhe/qM6Qbhh+BJjc5uMTwjhgUyJhMGpcgXQXo2hCjdgWqLPOkda
	OzoG89ErbhGfvsn6X4V1C6svKpV9Xdf3z0vBsPnSeBH/O42rh0Fgo8IaBbtUcQ==
Date: Wed, 30 Nov 2022 15:48:48 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
Message-ID: <Y4dtUJH7tdNLey9w@mail.local>
References: <20221128191804.51591-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128191804.51591-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174016

Hello,

This broke a few recipes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6247/steps/12/logs/stdio

I guess this is dues to the LFS64 changes

On 28/11/2022 11:18:04-0800, Khem Raj wrote:
> Brings following changes
> 
> * 8f925945 fix return value of gethostby{name[2],addr} with no result but no error
> * 63402be2 clean up dns_parse_callback
> * 0a7b4323 dns response handling: don't treat too many addresses as an error
> * 41603c77 dns response handling: ignore presence of wrong-type RRs
> * cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
> * 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is passed
> * d8f35e29 fix AS-safety of close when aio is in use and fd map is expanded
> * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
> * aebd6a36 fix potential deadlock between multithreaded fork and aio
> * d64148a8 fix potential unsynchronized access to killlock state at thread exit
> * 36b72cd6 fix potential deadlock in dlerror buffer handling at thread exit
> * 833a4691 configure: disable TBAA optimization because most compilers are buggy
> * e6e82132 disable MADV_FREE usage in mallocng
> * 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GNU_SOURCE
> * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker remapping
> * dec8f0a4 dns query core: detect udp truncation at recv time
> * 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle long CNAMEs
> * 759bf785 arpa/nameser.h: update RR types list
> * 51d4669f dns: implement tcp fallback in __res_msend query core
> * e2e95176 res_send: use a temp buffer if caller's buffer is under 512 bytes
> * c87d75f2 adapt res_msend DNS query core for working with multiple sockets
> * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NODATA vs NxDomain
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index a72d87ea6f..29abd17771 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>  
> -SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
> +SRCREV = "8f9259450aa43a6fd539e428e61e2961b725fbae"
>  
>  BASEVER = "1.2.3"
>  
> -- 
> 2.38.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173942): https://lists.openembedded.org/g/openembedded-core/message/173942
> Mute This Topic: https://lists.openembedded.org/mt/95318179/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

