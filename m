Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC961C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:03:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.18254.1707213820208687775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oKaGYcQS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 141356000E;
	Tue,  6 Feb 2024 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707213817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmO00KThIN1kSdZ1cyQ8EpeX6keYWtzyDm/vhZ1Wj7I=;
	b=oKaGYcQSlmQ0bL0fU/0c8lHc4j7NE0DbWV8bfM8upKyqOjYu/25Oc+PZ4h4HklpyhTKOan
	gAWf0YxDOeBWoGWYvqa1DcqMOjl+mUcspdT1kASQgVp581lSp8gikKHuhuJZYp49p7ulpl
	E0h9zkp1/eLDkmr7e6m9F93lNTxDH0QLC20U4oxIP/KwcCzIuF+uknkzgdcoNuVbPPd32P
	NioUS1i6tWGw5ysTlSxY1U5YYJrDvbe0kKLrwuekOUnd3MjNwzIfWjQrAlSVaP2aVRfjML
	ipf1k58CkzXN2j7+kerBpXZt2tY156sV9JA+iKsmJ44UBwSL6pSN3+yE5xtXZA==
Date: Tue, 6 Feb 2024 11:03:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maanya Goenka <maanyagoenka@linux.microsoft.com>
Cc: openembedded-core@lists.openembedded.org, alhe@linux.microsoft.com,
	Maanya Goenka <maanyagoenka@microsoft.com>
Subject: Re: [OE-core] [PATCH] usrmerge: add the distro feature to nativesdk
 builds when added to target and enable symlink creation for both
Message-ID: <20240206100336ad3509f1@mail.local>
References: <20240201025621.1632547-1-maanyagoenka@linux.microsoft.com>
 <20240201025621.1632547-2-maanyagoenka@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201025621.1632547-2-maanyagoenka@linux.microsoft.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 10:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194979

Hello,

This causes failures on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8540/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5665/steps/12/logs/stdio



On 01/02/2024 02:56:22+0000, Maanya Goenka wrote:
> From: Maanya Goenka <maanyagoenka@microsoft.com>
> 
> Add usrmerge to DISTRO_FEATURES_FILTER_NATIVESDK (and DISTRO_FEATURES_FILTER_NATIVE for consistency),
> since we have come across cases where the distro feature would be required by both contexts.
> As a supplement to this change, when creating the merged usr symlinks at the do_populate_sdk stage,
> these need to be created for both the target and native sysroots within the SDK.
> 
> Signed-off-by: Maanya Goenka <maanyagoenka@microsoft.com>
> Signed-off-by : Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>  meta/classes-recipe/image.bbclass | 2 ++
>  meta/conf/bitbake.conf            | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
> index 7231fad940..df59133f77 100644
> --- a/meta/classes-recipe/image.bbclass
> +++ b/meta/classes-recipe/image.bbclass
> @@ -653,8 +653,10 @@ create_merged_usr_symlinks_rootfs() {
>      create_merged_usr_symlinks ${IMAGE_ROOTFS}
>  }
>  
> +# Create the usrmerge symlink for the host in addition to the target build
>  create_merged_usr_symlinks_sdk() {
>      create_merged_usr_symlinks ${SDK_OUTPUT}${SDKTARGETSYSROOT}
> +    create_merged_usr_symlinks ${SDK_OUTPUT}${SDKPATHNATIVE}
>  }
>  
>  ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs', '',d)}"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6f180d18b0..ff9f7ab407 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -920,8 +920,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
>  
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl wayland"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl wayland"
> +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opengl usrmerge wayland"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opengl usrmerge wayland"
>  
>  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
>  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194548): https://lists.openembedded.org/g/openembedded-core/message/194548
> Mute This Topic: https://lists.openembedded.org/mt/104089708/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

