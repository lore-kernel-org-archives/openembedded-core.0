Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C940C47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 13:52:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.11840.1705585968166089868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 05:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PRGej/Cv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99E2F60009;
	Thu, 18 Jan 2024 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705585965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=40kr9cgOVkSQKGQuSQbw2ZWN0h6YSuvd9p4l/Kto+aw=;
	b=PRGej/Cvnql9QH5UupReCwLckui3REodTv6abXx9e6E1wdMLuUxPHwMnMFZh1qn04agzei
	yNX2tMgp2FzK4MKTupZ3LiE89CpKI5sIsZ1fg+l4gUgaeRXmL0KEQbSR7t+ksqdH3bh8GZ
	eyt2183jtY3C+m/w78WQ37S7K1P7vAy3UTmRQ+9JDvG3oe1qh60Nd251BcfmZHSb5X3gfj
	kumw44YBcfL5xowDSK0M1RNxr87857RKeAiA24DWhYQqT3pP5+sbmf+nm8kA1goHoLA1TC
	5EBYX8FIxqqEJ5ifkjrzV+kbwT2NYAdnuM0XmYvD4pm296MKWtqLWblA2P2vMA==
Date: Thu, 18 Jan 2024 14:52:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jamin_lin@aspeedtech.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v1] uboot-sign: support to load optee-os and
 TFA images
Message-ID: <20240118135242eb1e86c8@mail.local>
References: <20240117021051.2102450-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117021051.2102450-1-jamin_lin@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 13:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193982

Hello,

This doesn't apply on top of your previous patches. Can you send a
proper series with what you want to be tested/applied?

Thanks!

On 17/01/2024 10:10:51+0800, Jamin Lin via lists.openembedded.org wrote:
> Currently, u-boot FIT image only support to load u-boot image.
> To support optee-os and trusted-firmware-a, update ITS file generation
> scripts, so users are able to use u-boot FIT image to load
> u-boot, optee-os and treustred-firmware-a images
> 
> Add a variable "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A" to
> enable trusted-firmware-a image and it is disable by default.
> 
> Add a variable "UBOOT_FIT_OPTEE_OS" to enable optee-os image
> and it is disable by default.
> 
> The ITS file creation looks like as following.
> 1. Both optee-os and trusted-firmware-a are disabled.
> '''
> /dts-v1/;
> 
> / {
>     images {
>         uboot {
> 
>         };
>         fdt {
>         };
>     };
> 
>     configurations {
>         default = "conf";
>         conf {
>             loadables = "uboot";
>             fdt = "fdt";
>         };
>     };
> };
> '''
> 
> 2. Only enable optee-os
> '''
> /dts-v1/;
> 
> / {
>     images {
>         uboot {
>         };
>         fdt {
>         };
>         optee {
>         };
>     };
> 
>     configurations {
>         default = "conf";
>         conf {
>             firmware = "optee";
>             loadables = "uboot";
>             fdt = "fdt";
>         };
>     };
> };
> '''
> 
> 3: Both optee-os and trusted-firmware-a are enabled
> '''
> /dts-v1/;
> 
> / {
>     images {
>         uboot {
>         };
>         fdt {
>         };
>         atf {
>         };
>         optee {
>         };
>     };
> 
>     configurations {
>         default = "conf";
>         conf {
>             firmware = "atf";
>             loadables = "uboot", "optee";
>             fdt = "fdt";
>         };
>     };
> };
> '''
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  meta/classes-recipe/uboot-sign.bbclass | 91 +++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
> index ad04c82378..b874eb84db 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -88,6 +88,18 @@ UBOOT_FIT_ADDRESS_CELLS ?= "1"
>  # This is only necessary for determining the signing configuration
>  KERNEL_PN = "${PREFERRED_PROVIDER_virtual/kernel}"
>  
> +# Trusted Firmware-A (TF-A) provides a reference implementation of
> +# secure world software for Armv7-A and Armv8-A,
> +# including a Secure Monitor executing at Exception Level 3 (EL3)
> +# ATF is used as the initial start code on ARMv8-A cores for all K3 platforms
> +UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A ?= "0"
> +UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE ?= "bl31.bin"
> +
> +# OP-TEE is a Trusted Execution Environment (TEE) designed as
> +# companion to a non-secure Linux kernel running on Arm
> +UBOOT_FIT_OPTEE_OS ?= "0"
> +UBOOT_FIT_OPTEE_OS_IMAGE ?= "tee-raw.bin"
> +
>  python() {
>      # We need u-boot-tools-native if we're creating a U-Boot fitImage
>      sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
> @@ -230,6 +242,20 @@ addtask uboot_generate_rsa_keys before do_uboot_assemble_fitimage after do_compi
>  # Create a ITS file for the U-boot FIT, for use when
>  # we want to sign it so that the SPL can verify it
>  uboot_fitimage_assemble() {
> +	conf_loadables="\"uboot\""
> +	conf_firmware=""
> +
> +	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" = "1" ]; then
> +		conf_firmware="\"atf\""
> +		if [ "${UBOOT_FIT_OPTEE_OS}" = "1" ]; then
> +			conf_loadables="\"uboot\", \"optee\""
> +		fi
> +	else
> +		if [ "${UBOOT_FIT_OPTEE_OS}" = "1" ]; then
> +			conf_firmware="\"optee\""
> +		fi
> +	fi
> +
>  	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
>  
>  	# First we create the ITS script
> @@ -282,13 +308,76 @@ EOF
>  
>  	cat << EOF >> ${UBOOT_ITS}
>          };
> +EOF
> +	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" = "1" ] ; then
> +		cat << EOF >> ${UBOOT_ITS}
> +        atf {
> +            description = "ARM Trusted Firmware-A";
> +            data = /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE}");
> +            type = "firmware";
> +            arch = "${UBOOT_ARCH}";
> +            os = "arm-trusted-firmware";
> +            load = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_LOADADDRESS}>;
> +            entry = <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_ENTRYPOINT}>;
> +            compression = "none";
> +EOF
> +
> +		if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
> +			cat << EOF >> ${UBOOT_ITS}
> +            signature {
> +                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
> +                key-name-hint = "${SPL_SIGN_KEYNAME}";
> +            };
> +EOF
> +		fi
> +
> +	cat << EOF >> ${UBOOT_ITS}
> +        };
> +EOF
> +	fi
> +
> +	if [ "${UBOOT_FIT_OPTEE_OS}" = "1" ] ; then
> +		cat << EOF >> ${UBOOT_ITS}
> +        optee {
> +            description = "OPTEE OS Image";
> +            data = /incbin/("${UBOOT_FIT_OPTEE_OS_IMAGE}");
> +            type = "tee";
> +            arch = "${UBOOT_ARCH}";
> +            os = "tee";
> +            load = <${UBOOT_FIT_OPTEE_OS_LOADADDRESS}>;
> +            entry = <${UBOOT_FIT_OPTEE_OS_ENTRYPOINT}>;
> +            compression = "none";
> +EOF
> +
> +		if [ "${SPL_SIGN_ENABLE}" = "1" ] ; then
> +			cat << EOF >> ${UBOOT_ITS}
> +            signature {
> +                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
> +                key-name-hint = "${SPL_SIGN_KEYNAME}";
> +            };
> +EOF
> +		fi
> +
> +	cat << EOF >> ${UBOOT_ITS}
> +        };
> +EOF
> +	fi
> +
> +	cat << EOF >> ${UBOOT_ITS}
>      };
>  
>      configurations {
>          default = "conf";
>          conf {
>              description = "Boot with signed U-Boot FIT";
> -            loadables = "uboot";
> +EOF
> +	if [ -n "${conf_firmware}" ]; then
> +	cat << EOF >> ${UBOOT_ITS}
> +            firmware = ${conf_firmware};
> +EOF
> +	fi
> +	cat << EOF >> ${UBOOT_ITS}
> +            loadables = ${conf_loadables};
>              fdt = "fdt";
>          };
>      };
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193883): https://lists.openembedded.org/g/openembedded-core/message/193883
> Mute This Topic: https://lists.openembedded.org/mt/103778291/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

