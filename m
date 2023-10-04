Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69760E8FDDD
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 08:43:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.13896.1696409006056689405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 01:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dftk3mxd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AF4D1C0006;
	Wed,  4 Oct 2023 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696409003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aK6thQHdlPap/KNCre4YY7ofrNkZrZR7brvHq9Ts24s=;
	b=dftk3mxd6k4+SNHiWuOnxmRfLptMcTajWHqN9+CU7826YNF9S+5hreWnbPyipigrGyC9QS
	6Pjc4YT/TInjm0C96bqYxBeHYl3sZidEifEsLOT/VPfehGPvF4IjPNYgNp/un/+Ko0Nq7+
	xgIilesru3cvraUR651ZGIs0X6tbVKQXYrXIkNOfXLsgxyh6NTXQLmHg9tX5ejspj+CnvR
	XsAI+vSM2/LfWgW4GjOJdzA44JkZU6qsvlpufErHK64r/hgZZTu8xYwj9NdZAQ7yYPZ/2C
	lNU2jxdajPZnrHXGxPwNygGwgXgm409yZhB30KOebTHzDESn8VaN9DN2+LpLuQ==
Date: Wed, 4 Oct 2023 10:43:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] multilib.conf: Remove the incorrect
 PKG_CONFIG_PATH setting
Message-ID: <20231004084322cebec764@mail.local>
References: <20230920090617.3414561-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920090617.3414561-1-mingli.yu@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 08:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188667

Hello,

This causes failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5799/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5866/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5849/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5842/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2195/steps/14/logs/stdio

On 20/09/2023 17:06:17+0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The PKG_CONFIG_PATH is set as ${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig
> in multilib.conf. But there is no ${WORKDIR}/recipe-sysroot when multilib
> enabled such as below:
>   $ bitbake lib32-php
>   There is no ${WORKDIR}/recipe-sysroot and only ${WORKDIR}/lib32-recipe-sysroot
> exists which already covered in meta/conf/bitbake.conf as below:
> export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
> 
> So remove the incorrect setting in multilib.conf.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/multilib.conf | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index ef3605a73d..09546315b8 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -22,15 +22,6 @@ MULTILIB_GLOBAL_VARIANTS ?= "lib32 lib64 libx32"
>  
>  OPKG_ARGS:append = " --force-maintainer --force-overwrite"
>  
> -# When multilib is enabled, allarch recipes will be installed into the MACHINE
> -# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-config to
> -# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only looks
> -# inside the multilib sysroot.  Fix this by explicitly adding the MACHINE's
> -# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
> -PKG_CONFIG_PATH .= ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
> -PKG_CONFIG_PATH[vardepsexclude] = "datadir WORKDIR"
> -PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
> -
>  # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
>  # ${MLPREFIX}${BPN}
>  NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187900): https://lists.openembedded.org/g/openembedded-core/message/187900
> Mute This Topic: https://lists.openembedded.org/mt/101474719/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

