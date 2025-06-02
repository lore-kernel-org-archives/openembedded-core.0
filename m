Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE19C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 18:51:48 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.3256.1748890299256975835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 11:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gkgP9H9j;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad74483fso46952626d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748890298; x=1749495098; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnptuz2/YsimH/cp7J2RTrwqiV6w3HfPe8AwUlcw1aE=;
        b=gkgP9H9jdHvRt7vZsFvwAQiwvUeJLVqC3ov+gqVc3Bh3P715qA4Dh7H8txFNI9icmr
         N9DkqPRwJlQ9+OG0Yi7IhHuv5y0MFMQvr/w34BLYODcSikPZVrzRz2CvaawILP80rdfv
         EPrjJfVoTpyvmV+KumePRSI1z6FzOMaZxmygGEj6tJxhbjQ3Lc32OGNbo+go2WLaRPd7
         qNJQIeqbT/ss8cHugffG6cZzRPaOfHIqI9UN+llD5sQACUt8wTdHuPlnHV5sS53oEkjf
         es3btuK4YTPDEHS2D/CIdVXdsJnJsZnKXWKV7A8fYVScZjTCbCPsB5uBK4dj8YsOnQ/Y
         05rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748890298; x=1749495098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnptuz2/YsimH/cp7J2RTrwqiV6w3HfPe8AwUlcw1aE=;
        b=i2EGsGhM4pNo+M3xrCDlT1cojnqmaNa1rB0ZMfwwsTs4c0dnI0kcRNVi3P/tI4GjVT
         Tv41rFazHNYIgwHUx4LFv1vlc2PNHa8vkKE6QiUZVMhEllCFTX0cSYDCa3NJKWqX3xyc
         t1i6TiTB3v59PcreQP76sHuJWeicfnK5D66zHK2KKtV5ab0TBhEx9xwuZsM2CQ10Hveu
         NSmuwExy7PIid96OoE5iA6+su3odTxiaJ3s6wcOj1/sRruy9B5Po/lTLNe/z+B2aKiVs
         YQ2bAvgyDD5pKn84MCTr2Vr6TfepeHPkECvwpYqF7MAxLwJf4cXutcs1NLXvPmIKgVtY
         Ac1A==
X-Gm-Message-State: AOJu0Yyp1aJSx8LktV2qV4JxSfbYq1KLECTf+DKTd73MiYQ0pVn39q6b
	Iqr16QkvIZSFibNYIeDRFJ543EwpS3UWbnbIwKCLWHfT58xNMRGVoNb2
X-Gm-Gg: ASbGncvBr0f76KPJj4srzHvgTBHNOPza/s3+ZguzRRep/S99cy+7GzCM+5cI8ftGaux
	MuvV5/U9nnuW0Yc68qAfq0PS2jjw7oSaqH1Gf+d7KAHmZF4Zi2ciusrWo0TeSqv6OCO8JqNEn5P
	FNxQYgZPMyEXzyiABOmuEnVA5DLl0XGS+nbJzJFL0V+VOvebgam7Fg+KnILvz9NzGbTximD8F91
	xWGgsWTuxz22ES1g/bluupls3b7QGNaGLgZD308y+OKYJKH/Mp/FOVQszSW+JQFsalf2P7wjYA/
	w9uWHf5oEdZKzr+htRscdpzYYMprNzrqmUWgPmr8kIw8V+PeLMa/STJ+xfcQg0CgPxGfPu0VPxG
	9e0CKF2HT6uJMdGLITllCiFnEB9I61w==
X-Google-Smtp-Source: AGHT+IH/DoCik97dZruzA2MaTENjvxeT1uRfdtgj5iKg9g57Rl7fGmRtrDISox+Bqfc9xSw9vYSwVA==
X-Received: by 2002:a05:6214:caf:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6faced60ed7mr269125156d6.42.1748890298139;
        Mon, 02 Jun 2025 11:51:38 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d3bfsm64808626d6.41.2025.06.02.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 11:51:37 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:51:36 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org, marex@denx.de,
	a.fatoum@pengutronix.de
Subject: Re: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy the
 vmlinux kernel binary
Message-ID: <aD3yuMnWwfPcUs3p@gmail.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
 <20250602075714.32122-11-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602075714.32122-11-adrian.freihofer@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 18:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217726



In message: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy the vmlinux kernel binary
on 02/06/2025 Adrian Freihofer via lists.openembedded.org wrote:

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Extend the kernel-uboot.bbclass to build and deploy the kernel binary
> intended for inclusion in a FIT image.
> Note that the kernel used in a FIT image is a stripped (and optionally
> compressed) vmlinux ELF binary - not a self-extracting format like
> zImage, which is already available in the deploy directory if needed
> separately.
> 
> The kernel.bbclass inherits all classes listed in the KERNEL_CLASSES
> variable. By default, KERNEL_CLASSES is defined as:
>   KERNEL_CLASSES ?= " kernel-uimage "
> Since kernel-uimage.bbclass inherits from kernel-uboot.bbclass, the
> creation and deployment of the kernel binary for inclusion in a FIT
> image happens automatically by default.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/kernel-uboot.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe/kernel-uboot.bbclass
> index d2a63524ece..e26ba6f0aa9 100644
> --- a/meta/classes-recipe/kernel-uboot.bbclass
> +++ b/meta/classes-recipe/kernel-uboot.bbclass
> @@ -56,4 +56,13 @@ uboot_prep_kimage() {
>  	fi
>  
>  	printf "$linux_comp" > "$output_dir/linux_comp"
> -}
> \ No newline at end of file
> +}
> +
> +kernel_do_deploy:append() {
> +	# Provide the kernel artifacts to post processing recipes e.g. for creating a FIT image
> +	uboot_prep_kimage "$deployDir"
> +	# For x86 a setup.bin needs to be include"d in a fitImage as well
> +	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
> +		install -D "${B}/${KERNEL_OUTPUT_DIR}/setup.bin" "$deployDir/"
> +	fi

Isn't this adding extra steps / overhead to a user of kernel-uboot
bbclass that isn't building or using a fitimage ?

Bruce

> +}
> -- 
> 2.49.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217701): https://lists.openembedded.org/g/openembedded-core/message/217701
> Mute This Topic: https://lists.openembedded.org/mt/113424435/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


