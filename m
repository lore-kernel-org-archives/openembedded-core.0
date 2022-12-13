Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A636CC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 19:28:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.83646.1670959713462572910
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 11:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JMLEKmBb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 984FC20007;
	Tue, 13 Dec 2022 19:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670959711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hWaUKJkuDRz0riceIfHMWszfL4GguLqAHgj4QZ8Wo2Q=;
	b=JMLEKmBb/R/YZEwilwaPjw/l/700LEEnv/NnGpcWWjv8gKpBrvbiUUBP7zEBbWAZVWKZDt
	gWI+8GQt7rUWzvv9KmO/gm1opy0KrU8M+ArihW+SjC98nKXSD7SmSdqjeOwR2nzSl+IMNQ
	Hei8Y11UCInylFl33p8OWu7U12DKLNpNZLWcl7/ZD/1nq3g7FD6Rpap0wmTUzsS0KohqFL
	vmDFuEgJsgsMsYd2jsmhFYZWPAkMvq6mccyi5LgCvn8e2c8lOYOWq9msQUJJTN+ZV8SBbN
	a4dD95xkbDAdmioIaABipO0BcZq1DxQh2auSlRAiQHdGWs0TdOuQXs70OktYEA==
Date: Tue, 13 Dec 2022 20:28:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH] libpng: Added "--enable-hardware-optimizations"
 instead of "--enable-arm-neon". Because "--enable-arm-neon" only works for
 armv7, but doesn't work for aarch64. But in fact neon is also enabled for
 aarch64 by default.
Message-ID: <Y5jSXh/7S0ZFIlHw@mail.local>
References: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1670899095-3959-1-git-send-email-leimaohui@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 19:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174544

Hello,

This fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/3913/steps/11/logs/stdio

On 13/12/2022 10:38:15+0800, leimaohui wrote:
> Reference to libpng-1.6.38/configure,if enable_hardware_optimizations is
> enabled, libpng can judge whether enable enable_arm_neon according
> to $host_cpu.
> ----------------------------------------
> $ cat libpng-1.6.38/configure
> ......
> if test ${enable_hardware_optimizations+y}
> then :
> ......
>          # allow enabling hardware optimization on any system:
>          case "$host_cpu" in
>             arm*|aarch64*)
>               enable_arm_neon=yes
> 
> printf "%s\n" "#define PNG_ARM_NEON_OPT 2" >>confdefs.h
> ......
> ----------------------------------------
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.38.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> index dc627203ef..7da71d9d3b 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
> @@ -22,7 +22,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
>  inherit autotools binconfig-disabled pkgconfig
>  
>  # Work around missing symbols
> -EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> +EXTRA_OECONF:append:class-target = " --enable-hardware-optimizations=on "
>  
>  PACKAGES =+ "${PN}-tools"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174506): https://lists.openembedded.org/g/openembedded-core/message/174506
> Mute This Topic: https://lists.openembedded.org/mt/95637494/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

