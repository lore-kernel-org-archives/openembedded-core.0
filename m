Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F2CC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 07:59:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.17205.1703059189646116294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 23:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o4e+dWGe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAF88E0008;
	Wed, 20 Dec 2023 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703059187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l6bumGLu+D8C79TbX0wnHAmmvorpL6kyojVTd+6lFrY=;
	b=o4e+dWGeujBCEQ+fUqxz7JTBqyTBLJv7NwLLQMDGcz2sdgFlqI0sx5fGeaNDWWV70D83y2
	FdHrCK0rYjt3KYHtPVIBGZ1le+UvisL0iBInHNIJEw52cRn7VhOTqLa0BCyV+EKNz+FNrJ
	8csz1CfceLzMV4TRfKcmK8B6mf3vOZBIf4kusva1QsCMpqj6sdEycs7lu4MIQE9HlXMYXV
	+zwWM4uJ356rvcSw6l7dxx02QFUbWSTNFhpdoUjQUYu3LQ/RK8yK8tO4QDyQGb4lcohRBG
	MwHdW8GebjwF3Hx1DE90jRarYO42pHJkhOjPUIf3+CDzgW/0bSWBMVfSsVm02w==
Date: Wed, 20 Dec 2023 08:59:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] systemd-boot: Add recipe to compile native
Message-ID: <20231220075946976b1206@mail.local>
References: <20231216002503.3681891-1-quic_vkraleti@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231216002503.3681891-1-quic_vkraleti@quicinc.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 07:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192783

Hello,

You didn't fix this one:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
systemd-boot-native (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd-boot-native_254.4.bb)

On 16/12/2023 05:55:03+0530, Viswanath Kraleti wrote:
> systemd-boot native recipe provides ukify tool to build
> UKI images for systemd-boot
> 
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> new file mode 100644
> index 0000000000..73db59b14e
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
> @@ -0,0 +1,15 @@
> +require systemd.inc
> +
> +inherit native
> +
> +deltask do_configure
> +deltask do_compile
> +
> +do_install () {
> +       install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> +}
> +addtask install after do_unpack
> +
> +PACKAGES = "${PN}"
> +
> +FILES:${PN} = "${bindir}/ukify"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192554): https://lists.openembedded.org/g/openembedded-core/message/192554
> Mute This Topic: https://lists.openembedded.org/mt/103202155/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

