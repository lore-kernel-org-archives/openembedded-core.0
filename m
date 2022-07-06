Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70F5C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 14:06:23 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web12.6635.1657116375042593569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pw1lyoWa;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E91F3200007;
	Wed,  6 Jul 2022 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657116373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/TUtrkwZqdW7wrMP01Bqc09R2q2/ijnpUFHjUvv/1A8=;
	b=pw1lyoWarWZq1fEr2lnIR3Z1uf01vTPmwHMqtRQj25rFsNgOFVBb36evxH8ZjS3Sm4Yaqd
	mh4UjMsnwjfWiRjN39KBSRGf2fwdmINjTi17DoG+LhVlKPIGZpzYNdE7T8tejFoUTZDuHb
	jO3v33Di7i8pdPk/Y3b79c2Wsnjs+1JU0xYPETbl/fm1BVLcQbVjPsPphkS4UhHSWrEA0a
	i7hydkv/Ml/hkaoSFzTZmhUEVYIXoI9aV/0xszg8LpyNUlBThARnqXenXBvzCoaJRd740X
	pLmWickkvYQ/7I2EtRAumMKG2VZ9UbZ+KOa7EN/v2TFn7F4b/dC4YZ5+B1kaYA==
Date: Wed, 6 Jul 2022 16:06:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, max.krummenacher@toradex.com
Subject: Re: [OE-core] [PATCH] meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE
Message-ID: <YsWW1I3LrrA4YTv1@mail.local>
References: <20220706111028.149100-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706111028.149100-1-liu.ming50@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 14:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167728

Hello,

On 06/07/2022 13:10:28+0200, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Sometimes an end user might want to choose another kernel type argument
> for uboot-mkimage other than "kernel", for instance: "kernel_noload".
> 
> Let's introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support that,
> and it could be used by BSP layers as well.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass     | 2 +-
>  meta/classes/kernel-uboot.bbclass        | 3 +++
>  meta/classes/kernel-uimage.bbclass       | 2 +-
>  meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
>  4 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 7e09b075ff..2112ae4cfa 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -148,7 +148,7 @@ fitimage_emit_section_kernel() {
>                  kernel-$2 {
>                          description = "Linux kernel";
>                          data = /incbin/("$3");
> -                        type = "kernel";
> +                        type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
>                          arch = "${UBOOT_ARCH}";
>                          os = "linux";
>                          compression = "$4";
> diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
> index 2facade818..1bc98e042d 100644
> --- a/meta/classes/kernel-uboot.bbclass
> +++ b/meta/classes/kernel-uboot.bbclass
> @@ -2,6 +2,9 @@
>  FIT_KERNEL_COMP_ALG ?= "gzip"
>  FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
>  
> +# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
> +UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
> +
>  uboot_prep_kimage() {
>  	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
>  		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
> index cedb4fa070..e116bf0265 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -30,6 +30,6 @@ do_uboot_mkimage() {
>  			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
>  	fi
>  
> -	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
> +	uboot-mkimage -A ${UBOOT_ARCH} -O ${UBOOT_MKIMAGE_KERNEL_TYPE} -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage

I feel like you replace the wrong argument here.

>  	rm -f linux.bin
>  }
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index e6bfd1257e..7e6479c9ca 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -763,6 +763,7 @@ FIT_HASH_ALG = "sha256"
>  
>          kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
>          kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
> +        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
>          kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
>          uboot_arch = str(get_bb_var('UBOOT_ARCH'))
>          fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
> @@ -775,7 +776,7 @@ FIT_HASH_ALG = "sha256"
>              'kernel-1 {',
>              'description = "Linux kernel";',
>              'data = /incbin/("linux.bin");',
> -            'type = "kernel";',
> +            'type = "' + kernel_type + '";',
>              'arch = "' + uboot_arch + '";',
>              'os = "linux";',
>              'compression = "' + kernel_compression + '";',
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167719): https://lists.openembedded.org/g/openembedded-core/message/167719
> Mute This Topic: https://lists.openembedded.org/mt/92204115/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

