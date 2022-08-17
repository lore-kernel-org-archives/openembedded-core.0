Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBDDC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 17:44:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.32053.1660758238955833614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 10:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hy5PY3bB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B1071240004;
	Wed, 17 Aug 2022 17:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1660758237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sovRfvNmkETyBcS1A3Wer4mAxYiI4eW2AS0IOAWoAwE=;
	b=Hy5PY3bBm7bIW99cC3jJTGLM3Fhb3S/yvcI79QrRLscr5VUzaTSxLNhguXBCJ3W/1XDgKg
	4XolgO8kcpLSxnQQV+yrUVykUTlXVRzbbz/2XTJRHixpcnTO3tlkd+X8hboON9x3Y4hV81
	i9CppcnHijPTnhJUxQ5rPJFjnzaHBnmWZfjQ5g1wTUlNfXZw7isyIz4C1+fgjEhiU7A9jx
	AXFi6mXNK9rPeTsqbhPi9vfjmM0r9UbJQ+Ss4LAkXfklCDZvN4DaV9wT0CpCGU6xp6LIpA
	XAcSwoN8tiv0z5SKVCeWyU+fpY+CtwzJmwq26is7yh4RVEVeh/ImPNnYvLC3hQ==
Date: Wed, 17 Aug 2022 19:43:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Awais Belal <Awais_Belal@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [[PATCH v2] kernel-fitimage.bbclass: only package
 unique DTBs
Message-ID: <Yv0o3H/D/SbdbaTZ@mail.local>
References: <170BD7FB076CA188.19212@lists.openembedded.org>
 <e840813aa69c4b968e839da161d735c8@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e840813aa69c4b968e839da161d735c8@mentor.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 17:44:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169497

Hi,

On 17/08/2022 16:09:46+0000, Awais Belal wrote:
> Do I need to send an update here to align with https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/kernel-fitimage.bbclass?h=master-next&id=f5c128008365e141082c129417eb72d2751e8045 ?
> 

I have the patch in my master-next and I believe the merge was correct.
This is under testing right now.

> 
> BR,
> Awais
> ________________________________
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> on behalf of Belal, Awais
> Sent: Tuesday, August 16, 2022 6:58:55 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [[PATCH v2] kernel-fitimage.bbclass: only package unique DTBs
> 
> The KERNEL_DEVICETREE and related variables could potentially have a device
> tree listed multiple times and this works okay for most scenarios. However,
> when we create FIT entries for these we get duplicate nodes and uboot-mkimage
> fails with
> 
> fit-image-initramfs-image.its:219.58-229.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
> fit-image-initramfs-image.its:307.50-317.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
> fit-image-initramfs-image.its:362.54-372.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
> fit-image-initramfs-image.its:417.56-427.19: ERROR (duplicate_node_names): /images/fdt-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
> fit-image-initramfs-image.its:648.59-658.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ecspi-slave.dtb: Duplicate node name
> fit-image-initramfs-image.its:744.51-754.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-ndm.dtb: Duplicate node name
> fit-image-initramfs-image.its:804.55-814.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-rm67199.dtb: Duplicate node name
> fit-image-initramfs-image.its:864.57-874.19: ERROR (duplicate_node_names): /configurations/conf-freescale_imx8mp-evk-usdhc1-m2.dtb: Duplicate node name
> ERROR: Input tree has errors, aborting (use -f to force output)
> uboot-mkimage: Can't open arch/arm64/boot/fitImage.tmp: No such file or directory
> 
> We fix this by tracking the DTBs we're compiling in the FIT and only picking
> up unique ones.
> 
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 7e09b075ff..56d71ba8fa 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -527,6 +527,10 @@ fitimage_assemble() {
>                          fi
> 
>                          DTB=$(echo "$DTB" | tr '/' '_')
> +
> +                       # Skip DTB if we've picked it up previously
> +                       echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
> +
>                          DTBS="$DTBS $DTB"
>                          fitimage_emit_section_dtb $1 $DTB $DTB_PATH
>                  done
> @@ -536,6 +540,10 @@ fitimage_assemble() {
>                  dtbcount=1
>                  for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
>                          DTB=$(echo "$DTB" | tr '/' '_')
> +
> +                       # Skip DTB if we've picked it up previously
> +                       echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
> +
>                          DTBS="$DTBS $DTB"
>                          fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
>                  done
> --
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169493): https://lists.openembedded.org/g/openembedded-core/message/169493
> Mute This Topic: https://lists.openembedded.org/mt/93059092/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

