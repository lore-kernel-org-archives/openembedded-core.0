Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42749C64ED6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 23:34:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5190.1677195265939976644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 15:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AVUMcwVD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 522DE20004;
	Thu, 23 Feb 2023 23:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677195263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jiaCIrcRByr8OgvEJ7WHsP32a2/eeU9p1KQ9F/a2CDk=;
	b=AVUMcwVDiv0FkvdHIf+gTuPzGwXDj6B3Et238FRek4UywGIeIIuOGBKDZL4EnQ/Q6BvPKu
	+IH1V5sm28nLdqoVzzBVhZ4jBfQHA9ls2N+PB6hXROhFdX1vP29T1JhursiYiv/x4m1FpS
	TeBheCmvrgcscq+cKUFgabGLnu2JBDJCjNHWXvOCFWjRMM/Wi6oNqaPBVAvRWCkIc6jZGp
	ZLJfDCcjKFcWNJk2HCzzhYCJZgSuMApLNBZmjNWmN1Z6NzfG8ZXNp9wrUetd5bZOOrFQtD
	mxK2SsH/2H96lMuV/BMmwgmogNmRGQ0Kt+SOpa9HF1LROW3c3XOAvqgPuMjzug==
Date: Fri, 24 Feb 2023 00:34:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
Message-ID: <Y/f3/n9f4AxtHcoo@mail.local>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223065816.3151823-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 23:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177643

Could this be the cause of this?

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230223-79c9rmcw/packages/diff-html/

On 22/02/2023 22:58:16-0800, Khem Raj wrote:
> Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH is searched before
> DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> DT_RUNPATH, this order ensures that injecting
> malicious shared objects is way harder with DT_RUNPATH.
> 
> This is now default on major linux distributions already
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index b2dbf241df..c69d29448f 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -96,6 +96,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --disable-werror \
>                  --enable-deterministic-archives \
>                  --enable-plugins \
> +                --enable-new-dtags \
>                  --disable-gdb \
>                  --disable-gdbserver \
>                  --disable-libdecnumber \
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177602): https://lists.openembedded.org/g/openembedded-core/message/177602
> Mute This Topic: https://lists.openembedded.org/mt/97178429/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

