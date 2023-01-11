Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D457BC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:11:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.21137.1673435511254323200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B/muM0/i;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 02F481BF20E;
	Wed, 11 Jan 2023 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673435509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vpXJmUnmQ8VsCRcI0K7xz7JOvhIZ00J3cJTu+ygkM8w=;
	b=B/muM0/iETBBXsHFFty8q5ctiNalq4Kx0q+MPKSDQ0e60AytT7h0LaUXBtgYEJpACuGMkX
	0taSlRRgLpd2b5tu0XPPXhqQq4CuLFeacHmNKZIfHxOevKQP8n/bVRZouYOanqt76JDowH
	RJu8jNHyi1tCb0EzhHNq+sSwg9dNPdccP4HpY9NlBCXnVB5PBTVi+TzgvsnB2kGNABGICd
	NOyPu3++cLI3MffiGCwaSZcNCSOfcmBS/1YRhBfcqd2sYV33mzZKqAYlWCm1hH5C8Biwnj
	U2Hnsl9bcYbeIA1S1pJtsbLThWvXIKRaH+Nax2xtgz54TOGr4yqfhuM6AJiafw==
Date: Wed, 11 Jan 2023 12:11:48 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] libpng: Enable NEON for aarch64 to enensure
 consistency with arm32.
Message-ID: <Y76ZdCXWCTG2q97I@mail.local>
References: <1673321469-27718-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673321469-27718-1-git-send-email-leimaohui@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175730

v1 has already been applied and you didn't specify what changed since
then. Can you rebase?

On 10/01/2023 11:31:09+0800, leimaohui wrote:
> NEON is enabled for aarch64 by default, so, to ensure consistency with
> arm32, reference to libpng-1.6.38/configure, added
> enable_hardware_optimizations option for aarch64.
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-multimedia/libpng/libpng_1.6.39.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> index d9dcf37..a6c229f 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
> @@ -22,7 +22,9 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
>  inherit autotools binconfig-disabled pkgconfig
>  
>  # Work around missing symbols
> -EXTRA_OECONF:append:class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> +ARMNEON = "${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
> +ARMNEON:aarch64 = "--enable-hardware-optimizations=on"
> +EXTRA_OECONF += "${ARMNEON}"
>  
>  PACKAGES =+ "${PN}-tools"
>  
> -- 
> 1.8.3.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175704): https://lists.openembedded.org/g/openembedded-core/message/175704
> Mute This Topic: https://lists.openembedded.org/mt/96170221/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

