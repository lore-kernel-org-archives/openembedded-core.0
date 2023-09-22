Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55819CD4843
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 16:07:29 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1536.1695398839368933355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 09:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BmUGotSw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 375E840007;
	Fri, 22 Sep 2023 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695398836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aoU4BCzXTgabxx/Py022aefkuSmMrwsB//OYaBx0440=;
	b=BmUGotSwgtTmhwvj0ipOCM0lxesJQuwrmft4eOuqE2T40h2F3UnQVxnK9JnamN3Vx4Ef2b
	GPT5YD1mpBY30RyzBzK1FMbZRkdk3e4bkAUCfEvRVqIyvdKdN/zW/vb8hWiFWqoxnsHf5C
	pto56UojmxyWbPzTVsdtKapvKTXZcTlZBmiEWfUxa6k8rECmvj06RLWmPOmLUD8wCmDN1F
	CpVkunnRl+/Z5oKENuetffXBboo4KARtA7j0gOLL9VoXAkcxDa5xB2s8Vzj6JfhxlhUp1D
	5rGQ2Tv7BJHGTfjcrYFhm4l4T79y9kuYje4un5qHmi9ORg/tJJJhtitnpJ+G7w==
Date: Fri, 22 Sep 2023 18:07:15 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
Message-ID: <20230922160715acd68410@mail.local>
References: <20230922011520.23704-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922011520.23704-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 16:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188126

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/8149/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7837/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7859/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7193/steps/13/logs/stdio

On 21/09/2023 18:15:20-0700, Khem Raj wrote:
> When using mirrors fetcher gets into a weird state when shallow clones
> are enables.
> 
> ERROR: Bitbake Fetcher Error: UnpackError('No up to date source found: clone directory not available or not up to date: /mnt/b/yoe/master/downloads/git2/git.musl-libc.org.git.musl.git; shallow clone not available: /mnt/b/yoe/master/downloads/gitshallow_git.musl-libc.org.git.musl.git_79bdacf-1_master.tar.gz', 'git://git.musl-libc.org/git/musl.git;branch=master;protocol=https')
> 
> Anyway the mirrors were added as backup when we had issues with musl git
> in past.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index dbc31e1d83b..72253636dc8 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -10,15 +10,11 @@ BASEVER = "1.2.4"
>  
>  PV = "${BASEVER}+git"
>  
> -# mirror is at git://github.com/kraj/musl.git
> -
> -SRC_URI = "git://git.musl-libc.org/git/musl.git;branch=master;protocol=https \
> +SRC_URI = "git://git.musl-libc.org/git/musl;branch=master;protocol=https \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
>            "
>  
> -MIRRORS += "git://git.musl-libc.org/git/musl.git git://github.com/kraj/musl.git"
> -
>  S = "${WORKDIR}/git"
>  
>  PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188034): https://lists.openembedded.org/g/openembedded-core/message/188034
> Mute This Topic: https://lists.openembedded.org/mt/101513420/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

