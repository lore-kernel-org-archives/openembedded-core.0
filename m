Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1BEC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 22:27:09 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.28538.1679437628610067274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 15:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h7sEoSPt;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5CA51240008;
	Tue, 21 Mar 2023 22:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679437626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y4hSDQ3bz91Teg8YmD1ZhoyiypvljrhzR35LaQVbYQE=;
	b=h7sEoSPtNSPM9BQ0u+sPAJGIx6WosZR3UiXYxfSxCBz8y+0qjEp+BfN+CuJ+XCSCuPRmal
	8y/akLTMolepO7x6GS4nkJYNw+zqvG4hlQeDOIIp84FOrxYL5uakOFsRF4fjSsHCHLiQ1+
	Gboj6/MEBKkTyfFPT7eR64olyVMHkCRhdmH1DQ/hWPLaCxeenDGgbJOs0uiXEE/EDWRftx
	eEosDreTEsBDT6UEaNskXOrixFnGXW5mIr7ESCjbaMVILgWSj2eZJzzwU8oLMyEB6my/kN
	UOztcnlN3vsmHZ/n/rN1KhaxN7memZjjD2kwQ+WT03kQB4pGOSRcxYlKGiDsRQ==
Date: Tue, 21 Mar 2023 23:27:00 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] rng-tools: splitting the rng-tools
 systemd/sysvinit serivce as a package
Message-ID: <20230321222700281f3165@mail.local>
References: <20230321023051.1174961-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321023051.1174961-1-xiangyu.chen@eng.windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 22:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178902

Hello,

This fails with:

ERROR: /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-support/rng-tools/rng-tools_6.16.bb: /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-support/rng-tools/rng-tools_6.16.bb inherits update-rc.d but doesn't set INITSCRIPT_NAME


On 21/03/2023 10:30:51+0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Since we removed the openssh dependency[1] on rng-tools, there are no package requiring
> rng-tools in oe-core, meta-oe, meta-virt, and the /dev/random won't block anymore after
> linux-5.6[2], one of the reasons for keeping rng-tools build into the image is that it
> can be used to test[3], so splitting the rng-tools systemd/systvinit service as a package.
> If someone needs rng-tools daemon service, they can enable the rng-tools-service package by 
> directly.
> 
> Reference:
> [1] https://git.openembedded.org/openembedded-core/commit/?id=868dfb46d96a27ec9041cb902fb769330277257d
> [2] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
> [3] https://linux.die.net/man/1/rngtest
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
> V1 -> V2 changes:
> according to the review comments, using FILES/PACKAGES to split the service package instead of adding 
> a custom variable to disable the rngd daemon.
> ---
> 
>  meta/recipes-support/rng-tools/rng-tools_6.16.bb | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
> index 4e664a9145..7324e42e08 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
> @@ -31,13 +31,20 @@ PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
>  PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2"
>  PACKAGECONFIG[qrypt] = "--with-qrypt,--without-qrypt,curl"
>  
> -INITSCRIPT_NAME = "rng-tools"
> -INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
> +INITSCRIPT_NAME:${PN}-service = "rng-tools"
> +INITSCRIPT_PARAMS:${PN}-service = "start 03 2 3 4 5 . stop 30 0 6 1 ."
>  
> -SYSTEMD_SERVICE:${PN} = "rng-tools.service"
> +SYSTEMD_SERVICE:${PN}-service = "rng-tools.service"
>  
>  CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
>  
> +PACKAGES =+ "${PN}-service"
> +
> +FILES:${PN}-service += " \
> +    ${sysconfdir}/init.d/rng-tools \
> +    ${sysconfdir}/default/rng-tools \
> +"
> +
>  # Refer autogen.sh in rng-tools
>  do_configure:prepend() {
>      cp ${S}/README.md ${S}/README
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178846): https://lists.openembedded.org/g/openembedded-core/message/178846
> Mute This Topic: https://lists.openembedded.org/mt/97747528/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

