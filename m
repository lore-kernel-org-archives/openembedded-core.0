Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CA6C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 18:02:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.732.1635357728387861547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QG2+ejju;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id z200so2557011wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DrDbO7K+ohpwH00UcyTB4iTjsbrhMCyng3dLMMYwpJk=;
        b=QG2+ejju2uJPluWKE+9NQdMThvevXHWI41rrOmAC2bONHxHghDgV9Itm2WZRkhufuW
         M+VEgllEPw/zcrdt7/9/7PFNMcbks3RulBzaTSMVEmSUQMxEupDswq88RHD/MLbrocXt
         HiIore6VjYRqzKScvGyCDgJaKRO5JO8dsNDxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DrDbO7K+ohpwH00UcyTB4iTjsbrhMCyng3dLMMYwpJk=;
        b=bhvQp4FEQkIfAYlIV/siAwLfaL9WZZFroWKaLegn/HgofHDgyEqa66Quv7XrFyMAkt
         H+3z+xy5uILKbGLlW9Z0n9Hzb1yBiHLzLyz5h4qnwDZDYDxEaGGS06CZl/Fyqk5Qyud3
         VO/w7qjsHAlhZ6grFIK6xURFHReJJ9QXA/fuIYOAUqzR1LxDFIZXowmr1O16T3E3jXfY
         cZDWWfcOCOvw6ny0/FpVxWwvjLcw19QAuRxwsNZQWtmqYmtQy/rG7f1RSd9x7xmel9yi
         1msAAe73VD2MOYDQ6vuGZeZP+8e5qGg0Oj4fAASEhWXZEe2f9Cmu29duPDVK8qnvQbTM
         svcA==
X-Gm-Message-State: AOAM532cR3/JzVFAiupkKq+2XoWeCGGJTsLXaSWodB/bJdvDxYcRybh9
	tS+1th2ihUNLwKTkFoCydKg40z8AL1S4Ag==
X-Google-Smtp-Source: 
 ABdhPJzPMsNpuAXg+OsikjaI5CFXiWDo/iYVLYiBQUX2qZRkRvq6q0lt9ScMwlWwlTR2yCjuiDHMfw==
X-Received: by 2002:a05:600c:4f08:: with SMTP id
 l8mr7332121wmq.47.1635357726836;
        Wed, 27 Oct 2021 11:02:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a2a1:45e8:949d:3f5c?
 ([2001:8b0:aba:5f3c:a2a1:45e8:949d:3f5c])
        by smtp.gmail.com with ESMTPSA id
 m35sm5799170wms.2.2021.10.27.11.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 11:02:06 -0700 (PDT)
Message-ID: 
 <2c10a8f09a5d08a41627c443774596aaf6feac82.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] uboot-sign: fix the concatenation when
 multiple U-BOOT configurations are specified
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Thomas Perrot <thomas.perrot@bootlin.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Oct 2021 19:02:05 +0100
In-Reply-To: <20211027140412.1663212-1-thomas.perrot@bootlin.com>
References: <20211027140412.1663212-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 18:02:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157562

On Wed, 2021-10-27 at 16:04 +0200, Thomas Perrot wrote:
> Some BSPs, especially those of meta-freescale and meta-ti allow to build U-Boot
> binaries using different configuration for a given target, for example:
> - UBOOT_CONFIG ??= "tfa-secure-boot tfa"
> - UBOOT_CONFIG ??= "nand sdcard spi nor"
> 
> When this is the case the public key wasn't concatenated to all U-Boot binaries
> built.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/classes/uboot-sign.bbclass | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> index bae8cada0ac3..8d136e940589 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -131,6 +131,20 @@ concat_dtb_helper() {
>  		elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
>  			cd ${DEPLOYDIR}
>  			cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
> +
> +			if [ -n "${UBOOT_CONFIG}" ]
> +			then
> +				for config in ${UBOOT_MACHINE}; do
> +					i=$(expr $i + 1);
> +					for type in ${UBOOT_CONFIG}; do
> +						j=$(expr $j + 1);
> +						if [ $j -eq $i ]
> +						then
> +							cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX}
> +						fi
> +					done
> +				done
> +			fi
>  		else
>  			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
>  		fi
> @@ -205,7 +219,7 @@ install_helper() {
>  	fi
>  }
>  
> -# Install SPL dtb and u-boot nodtb to datadir, 
> +# Install SPL dtb and u-boot nodtb to datadir,
>  install_spl_helper() {
>  	if [ -f "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
>  		install -Dm 0644 ${SPL_DIR}/${SPL_DTB_BINARY} ${D}${datadir}/${SPL_DTB_IMAGE}


We seem to be just piling more and more conditional code into these classes for
different weird corner cases.

Are there some tests we should be adding to ensure people understand why this
code is here and if/as/when something else changes it and regresses it?

Cheers,

Richard



