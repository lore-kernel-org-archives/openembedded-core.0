Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0653C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 20:51:05 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.82749.1723582260927478073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 13:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=VybrG0gN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b79c969329so31443456d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1723582260; x=1724187060; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OydT0n8RnlvkhHVCGxllrSIw/vVn3gR0B2p/NkkxOOM=;
        b=VybrG0gNE2wXInA0s6c7yUFXpLkW+mfrv1JpqRKqSucPvhUxsT1MZhBR+28VUXehRK
         zOyJHPRhYwVzxGJ4aMeZ66xho9rLEbz/BNEPaMhxPf4G10lDRt0AtXPwvm+OwaE9CcKx
         eykQlPIT92DY8X7EdWu7K/Cl26eiQkFOuK+/LKvlu2IbaT3bQIM6TDmi2OVmxVxE68O8
         n/YqrhNQtucjgiw/cH11B/cfrlUFPMVjjcGkVEg3Au3oO0AdZxtH2IY5NZp4jQhttoHj
         fRD9uWHxzuKV+viyjnu2UZznYiOi1Wfc5hy6ZoSm5dnu8O03+x6Cj7XFOTDPCD2zRq6/
         /2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723582260; x=1724187060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OydT0n8RnlvkhHVCGxllrSIw/vVn3gR0B2p/NkkxOOM=;
        b=wrN2eyjw4saTnbavQHygJQOQfzRYNY0O5VHtSY9Caqbk63mFm9KTGKOJEM8ap6GtyE
         gelL6hlXa5NLjJIv8T4KXqiGqq/dygoOLFZ7miLhPU951lPgYNekFJjJwMO9PiXommMM
         /ewQDeiu4jPaHhR1AF4LT7wemCyFu2dMn2fQ/rLyixCI471w5QSFdmRSdqTDHzXuHOAu
         8Y6IQWsR9SR3ew8cD01NxB8w9gGV6JjBVRj6S8t8Z/r1wy73iA+Dn+X0mh2kZXmneCZF
         /1WEEbYmpXklD/H9ft51yx3xA4naKZElm1IqV2tn62D6TBNueFLTPj1oijOAGyeWU+Ko
         D8OA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+ZVwdZcJAEG32wGTTpLGMRsXBvGFQEGMvhklTeNKNd37j0IO+p2/Zd9I12Y/EG9woSz3/RBIspVLy7KDPUVat5JavkBMHjAOja548lpigyx0DLXsrqoC
X-Gm-Message-State: AOJu0YzKH4JF5Et1bjq+uMZqJZ0HH09MPamZgeMiQKd1Ff8OBI+r2jFg
	vyVVHcgin1YfUkpncXGXBzxmApzhsiwVxx2W+8b22fO1w1iuLKT/FGyzF0fd+Q==
X-Google-Smtp-Source: AGHT+IFR8gzXdQOeEiKftdupG6VQRHPsSXmLR011HSAxBmRP8vk6erEhA4sj3cerYL45T9AZ0V5wrA==
X-Received: by 2002:a05:6214:3f91:b0:6b7:a154:8b47 with SMTP id 6a1803df08f44-6bf5d230c51mr9478226d6.48.1723582259776;
        Tue, 13 Aug 2024 13:50:59 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82c7e600sm37194426d6.50.2024.08.13.13.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:50:59 -0700 (PDT)
Date: Tue, 13 Aug 2024 16:50:57 -0400
From: Jon Mason <jdmason@kudzu.us>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, Jon.Mason@arm.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/6.6: fix genericarm64 config warning
Message-ID: <ZrvHMQCZgXQjYCj4@kudzu.us>
References: <20240813195753.576442-1-bruce.ashfield@gmail.com>
 <20240813195753.576442-2-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813195753.576442-2-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 20:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203292

On Tue, Aug 13, 2024 at 03:57:52PM -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Integrating the following commit(s) to linux-yocto/.:
> 
> 1/1 [
>     Author: Bruce Ashfield
>     Email: bruce.ashfield@gmail.com
>     Subject: genericarm64: drop CONFIG_MTD_NAND_FSL_IFC
>     Date: Tue, 13 Aug 2024 15:17:10 -0400
> 
>     We are getting the following warning in recent 6.6+ kernels:
> 
>         WARNING: linux-yocto-6.6.45+git-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
> 
>         [NOTE]: 'CONFIG_MTD_NAND_FSL_IFC' last val (y) and .config val (n) do not match
>         [INFO]: CONFIG_MTD_NAND_FSL_IFC : n
>         [INFO]: raw config text:
> 
>             config MTD_NAND_FSL_IFC
>                     tristate "Freescale IFC NAND controller"
>                     depends on (FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST) && HAS_IOMEM && FSL_IFC && MTD_RAW_NAND && MTD
>                     help
>                       Various Freescale chips e.g P1010, include a NAND Flash machine
>                       with built-in hardware ECC capabilities.
>                       Enabling this option will enable you to use this to control
>                       external NAND devices.
> 
>             Config 'MTD_NAND_FSL_IFC' has the following Direct dependencies (MTD_NAND_FSL_IFC=n):
>                     FSL_SOC(undefined/n) || ARCH_LAYERSCAPE(=y) || SOC_LS1021A(undefined/n) || COMPILE_TEST(=n) (=y) && HAS_IOMEM(=y) && FSL_IFC(=n) && MTD_RAW_NAND(=y) && MTD(=y)
>             Parent dependencies are:
>                  SOC_LS1021A [SOC_LS1021A] MTD [y] ARCH_LAYERSCAPE [y] HAS_IOMEM [y] FSL_SOC [FSL_SOC] COMPILE_TEST [n] MTD_RAW_NAND [y] FSL_IFC [n]
>         [INFO]: config 'CONFIG_MTD_NAND_FSL_IFC' was set, but it wasn't assignable, check (parent) dependencies
> 
>     The most significant missing option that is disabling this config value
>     is FSL_SOC, which is only defined in arch/powerpc.
> 
>     As such, there's no sense keeping this option in the genericarm64 config
>     as it is only enabled via arch/powerpc.
> 
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ]
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> 
> Jon,
> 
> Let me know if these seems ok to you.

Yes, I just started seeing this in my CI today, but hadn't gotten to looking at it.
A very quick look at the kernel, I see arm64 has ARCH_LAYERSCAPE,
which references MTD_NAND_FSL_IFC.  I think this is the actual cause of the desire
to have this code.  So, we probably want to keep this in the generic
image (as layerscape is what the lx2k/honeycomb platform(s) use).
Is there a reason not to enable FSL_IFC in the config?



FYI, I'm seeing a config fragment warning (which I've also not gotten
around to fixing) with Xen and qemuarm/qemuarm64.

WARNING: linux-yocto-6.10.3+git-r0 do_kernel_configcheck: [kernel config]: This BSP contains fragments with warnings:
[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_FB_SYS_FOPS

See https://gitlab.com/jonmason00/meta-arm/-/jobs/7574214060
https://gitlab.com/jonmason00/meta-arm/-/jobs/7574213986

I think this can just be removed, as I don't see it in the kernel
anymore.

Thanks,
Jon

> 
> Bruce
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> index ae56e8a129..c3b4fc1e9b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> @@ -15,7 +15,7 @@ python () {
>  }
>  
>  SRCREV_machine ?= "9a1d7ebfd75c70dcec660e18124a37de469e68b4"
> -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> index b0e4ab71ae..1c8cfd7d74 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> @@ -18,7 +18,7 @@ KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>  
>  SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
>  
>  PV = "${LINUX_VERSION}+git"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> index 5688a4b109..948f46621b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -32,7 +32,7 @@ SRCREV_machine:qemux86 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
>  SRCREV_machine:qemux86-64 ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
>  SRCREV_machine:qemumips64 ?= "97d2336ea9ce4eac6b30a75b26f33b83827d38aa"
>  SRCREV_machine ?= "e402da9835bfae267f409a48c3a2cb6e231f9d94"
> -SRCREV_meta ?= "e55e4407942bae43ef8ba463b38e48995b023187"
> +SRCREV_meta ?= "9901a21dd1f99c833d8e1a58b3fc057e57bda598"
>  
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the same
> -- 
> 2.39.2
> 
> 

