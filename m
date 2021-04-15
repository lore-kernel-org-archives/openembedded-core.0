Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.1937.1618455561193003879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 19:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kcFYje7u;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id u15so2696039plf.10
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 19:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3R9VR6mnTvFVtonbqny5xq8SmiY8amv7e4h0IxoUp2I=;
        b=kcFYje7ukK8DXjiJFqFPihvVGYU+gW+dIjD2eIr8ZuPqrnNm8jgHYmPdrFPqkbLN40
         6io/zHtLtcAV4iXYfxp6pS/Kj3FGPi73nsFUBYucWcRNGwrQTM7AXSaWqpyAO0l+fePL
         yP1kXYaF7vQ2jj6rdh/EhYMIufg3V//Y6aNJZmdC02qbTFMr/i5J1us0ZTA+336onnL+
         k7bbl4/38bx3aHONBoFd0KmDoh3Mzh2bJiK/iB+xhPLoYzmR1MQf+Q2337ZRDMRsWxli
         vFsz2rxn80r4VGv+yUxmX7Mbk911onu7Hx9tjbGAnmGq4zb4XmN8SJEunkU+fzmm0xhG
         mM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3R9VR6mnTvFVtonbqny5xq8SmiY8amv7e4h0IxoUp2I=;
        b=HDM1OYEHwmO8zCs4tcuZhVQ6oRI0V7v9rYDKwqfHkgoAgi/Xhh+Ko7YtY0J1jmSDkH
         W9Q6wTAWRQ20OmGTVw+5qE3mH/4r6bvGprxYLfli9Oa6XjQ3aMed/473OtUMytfFHhnc
         /BowpobCrbla5zrKS2dMRRWgskL0S40vGAvYsgVtrNbUUOx8/l2Fe22ANfULm0RkTx66
         /5QuOs26TXSZ9IHGPPrcQyGjvLtkrceRTITCXMkAdj8XD7zm+fzjBuOSdSDekglNXyv/
         rfVJ+WSLYZ5UBhyxMISd9M+tnxKHTSZAsSRvE4cMYMFgQTzpBppeqayC1AHle3zMlf9C
         25Yw==
X-Gm-Message-State: AOAM530T0RrRLY7D/sCmbU0pz/TezRNY9tMitC4IkwmRQXFM2UxtsYV6
	YN24LWJ0hPSjGlHREJP5x1Bh0vG5e0hSdw==
X-Google-Smtp-Source: ABdhPJzgSfgHkJDSddzUggbfzt5HDJAAl6CRIylnOLOOUILqy4FgTdWNfUJ+zgR3SPpyweKlAspnQA==
X-Received: by 2002:a17:902:e784:b029:e9:997a:6a27 with SMTP id cp4-20020a170902e784b02900e9997a6a27mr1524736plb.9.1618455560417;
        Wed, 14 Apr 2021 19:59:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b118? ([2601:646:9200:a0f0::b118])
        by smtp.gmail.com with ESMTPSA id b2sm213490pjn.56.2021.04.14.19.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 19:59:20 -0700 (PDT)
Subject: Re: [OE-core] [gatesgarth][PATCH] image_types.bbclass: tar: support EXTRA_IMGAGECMD
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
 openembedded-core@lists.openembedded.org
References: <20210415023208.GQ1189447@codepurple>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e4f66e18-9f25-d323-6512-065653246e2f@gmail.com>
Date: Wed, 14 Apr 2021 19:59:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415023208.GQ1189447@codepurple>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/14/21 7:32 PM, S. Lockwood-Childs wrote:
> The primary motivation for making tar image options configurable
> is to provide choice on a per-machine basis between gnu and posix
> formats. Neither one is suitable for all use cases.
> * gnu isn't compatible when xattrs are required
> * posix can cause locale headaches
>    https://groups.google.com/g/swupdate/c/zUOSqmkk7cA
> 
> One could say "just fix your image installer" but it's nice to be able
> to still produce images that currently-deployed systems can handle,
> for instance to make update packages to update your updater :)
> 
> Default is still posix format, so current behavior is unchanged
> unless EXTRA_IMAGECMD_tar is customized.
> 
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>   meta/classes/image_types.bbclass | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 30951ae366..c0dca351d5 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
>   
>   IMAGE_CMD_TAR ?= "tar"
>   # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
> -IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
> +IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner ${EXTRA_IMAGECMD} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>   
>   do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>   IMAGE_CMD_cpio () {
> @@ -228,6 +228,9 @@ EXTRA_IMAGECMD_ext4 ?= "-i 4096"
>   EXTRA_IMAGECMD_btrfs ?= "-n 4096"
>   EXTRA_IMAGECMD_f2fs ?= ""
>   
> +# Customize tar format if needed, since gnu and posix have different drawbacks
> +EXTRA_IMAGECMD_tar ?= "--format=posix"
> +

in local.conf maybe you can just do


IMAGE_CMD_tar_remove = "--format=posix"
IMAGE_CMD_TAR += "--format=gnu"

will that work ?

this would mean no changes would be needed in core metadata

>   do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
>   do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
>   do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
> 
> 
> 
> 
> 
