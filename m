Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C70C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 21:14:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.2676.1663708468944858681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 14:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gEv+wl3k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EB841C0003;
	Tue, 20 Sep 2022 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663708466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ALuhRsH3XXGCeFEI9YBVUcltvbv1ET5wgu21P368R40=;
	b=gEv+wl3kiZHj816O8uB0t8D+oS5krh56a4+GX2jc6pxHnGqIWGeEOM0Tmt8InyiRrGxjXl
	27Z475Q07QLdK3kttOubCq/3SMNvF4CorUqqpEi/qqqkRTvQvKLoOE1PxijTwalYVunkzh
	9AUuCft1LSgqN1FLEmadXVbPdXJ/+r+6uczmZ1MwFPsRs3Zumym6Z26kmZbN0ZVmzlZ/CU
	XvRne6vUrL8ZWreeIKjPuTK9uieBy7Oa0G3XlXPwCZhmPl53A81p888gFlfIipXA29C1Aj
	hBQ6g9HP2i7jMnoppmHOzxPQZtn4kjfo8nhLBRvVW2xYVlSeyB1WDkV9xNhoug==
Date: Tue, 20 Sep 2022 23:14:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Liam Beguin <liambeguin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v1] meson: make wrapper options sub-command
 specific
Message-ID: <YyotMcK5lcRp5/3X@mail.local>
References: <20220917220735.4192854-1-liambeguin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220917220735.4192854-1-liambeguin@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 21:14:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170908

Hello,

On 17/09/2022 18:07:35-0400, Liam Beguin wrote:
> The meson-wrapper adds setup options to facilitate cross-compilation.
> The current options are exclusive to the setup sub-command and might
> cause issues with other sub-commands.
> 
> Update the wrapper to make options sub-command specific.
> 

This caused many failures on the autobuilders:

buildepoxy.EpoxyTest.test_epoxy: ERROR (0.43s)

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/environment-setup-cortexa8hf-neon-poky-linux-gnueabi > /dev/null; meson -Degl=no -Dglx=no -Dx11=false /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/epoxybmd9dxec/build /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0-r0/testimage-sdk/epoxybmd9dxec/libepoxy-1.5.3;' returned non-zero exit status 1
Standard Output: sed: -e expression #1, char 10: unknown option to `s'
ERROR: Neither directory contains a build file meson.build.

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5918/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5879/steps/12/logs/stdio
and others


> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---
>  .../meson/meson/meson-wrapper                 | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
> index c62007f5077e..fae9e167a325 100755
> --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -13,7 +13,23 @@ fi
>  # config is already in meson.cross.
>  unset CC CXX CPP LD AR NM STRIP
>  
> +for arg in "${@}"; do
> +    case ${arg} in
> +    -*) continue ;;
> +    *) SUBCMD=${arg}; break ;;
> +    esac
> +done
> +
> +case ${SUBCMD} in
> +setup)
> +    MESON_SUB_OPTS=" \
> +        --cross-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> +        --native-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> +        "
> +    ;;
> +esac
> +
>  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
> -     "$@"
> +    ${SUBCMD} \
> +    ${MESON_SUB_OPTS} \
> +    $(echo $@ | sed s/${SUBCMD}//)
> 
> base-commit: 09c1cac053c2892e3af3250cc6229e8da78e7a50
> -- 
> 2.37.1.223.g6a475b71f8c4
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170842): https://lists.openembedded.org/g/openembedded-core/message/170842
> Mute This Topic: https://lists.openembedded.org/mt/93751917/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

