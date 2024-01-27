Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EC6C46CD2
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 15:27:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.17568.1706369263259158296
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jan 2024 07:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=XY2Y6w5M;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68c3e92d768so4521186d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 07:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706369262; x=1706974062; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7EqiqSV2xyJgtVXE+1bQe2BFL0oJhsuEKJWKDS9wrmA=;
        b=XY2Y6w5MVE8RkYNJrBikSBOwqB8XIMUGPSSqJMekjUt5BSZk7MDjFd91l6ZtOZfYhr
         p9fQ2NXdQfulpLbo02/IkpxhBzwv4iYkjEtFBO+24U5wikl4A07bXiNqWZix+eYrl+tu
         cgcRvONzM/lKB4WfR+4ry/U8Pz+78ugEnFH11FWzooq6cGOXPsHClgE2WZKgUkZL5fKu
         Zm2+Lf9GH8B2TyH63AOpkoEC5odilyvG5vpYHJt1P0NyNCala/JbsrgjZz7AQ7kfLqmY
         EUyJdBgVmleqHA4YXaAmINdWgHOyj5tVuu+mEv1u5n6qjr4mkf4QNq9Pn5cLK4087gmg
         99rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706369262; x=1706974062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EqiqSV2xyJgtVXE+1bQe2BFL0oJhsuEKJWKDS9wrmA=;
        b=ZAGGTiaD33u2kS/fPtBZEKss/u28uK7vAQmGn+wf5xFwp7puad0GfeiIuLibTFSSq+
         /kTcv2dmt3bakEVzxdsbgnWmDfutTPuU+KyZAEV5/7Z0W/WlUrrmD4S3krWXZTRMrMAP
         99I2DVn6bssohgy/8nAYvQkViJRwt4deBR3Y1CMl1DQxLP62LPbHZK8SmiJZGA30x8uH
         mhh3uWE7TvuFgziw879uW/3Ihqst8sW/GSL9Y4458piJcqhhGn7q9Bx3xTDgyvmaZLFi
         BlzJXDusDTNZJfOrHF04Ns+Irz0ftIZuGxURmlwx7rG77FZIxiR11WsgXdB9pXWlZioD
         BxNQ==
X-Gm-Message-State: AOJu0YyBmU7QLbk1ozTMatF88TfZiOM4q6KTcNqVxQiUPns6V80zikWK
	PypE25BzGb1L3OBXaKtK2n3dl+LAN0NaPBY/PDLQXEZODtH4XNT4RdcX18kP2Q==
X-Google-Smtp-Source: AGHT+IEGJPJ2IDYiB6IzUK/nEl3wG95SnTvKBTzAkqJ5uqA6aY8XuKNuBqpKBhBlLjl/ucBWHq6Zhg==
X-Received: by 2002:a05:6214:5299:b0:681:96d:9581 with SMTP id kj25-20020a056214529900b00681096d9581mr2391630qvb.74.1706369262111;
        Sat, 27 Jan 2024 07:27:42 -0800 (PST)
Received: from kudzu.us ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dh15-20020ad458cf000000b0068327aef476sm1521401qvb.108.2024.01.27.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 07:27:41 -0800 (PST)
Date: Sat, 27 Jan 2024 10:27:34 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] armv8/armv9: Avoid using -march when -mcpu is chosen
Message-ID: <ZbUg5g9U9FVMIwRZ@kudzu.us>
References: <20240126233141.1589013-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126233141.1589013-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 15:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194434

On Fri, Jan 26, 2024 at 03:31:41PM -0800, Khem Raj wrote:
> Current include logic goes into generic arm v8/v9 architecture tunes and
> adds corresponding -march option after synthesizing it from various tune
> fragments, this is fine for a machine which is using armv8/armv9 based
> tunes but cortex tunes are intentionally using -mcpu option based on
> selected tune value. So when cortex based default tune is selected for a
> machine, it will add both -mcpu and -march to the compiler commandline
> which can result in invalid combinations for this pair in gcc's own
> logic. This can then result in compiler warnings/errors reporting this
> 
> e.g.
> 
> aarch64-yoe-linux-gcc  -mcpu=cortex-a72.cortex-a53 -march=armv8-a+crc+crypto -mbranch-protection=standard
> ...
> cc1: error: switch '-mcpu=cortex-a72.cortex-a53' conflicts with '-march=armv8-a+crc+crypto' switch and resulted in options '+crc+crypto' being added [-Werror]
> 
> This is seen in lot of configure test results in glibc 2.39 and the
> warning is promoted to errors by gcc in some of these checks especially
> with gcc-14, the logs also show it as warning in other places in
> configure checks.
> 
> mcpu option will compute relevant march implicitly as it specifies a cpu
> implementation and this will be the right value to use, therefore do not
> specify -march when -mcpu is already describing the cpu.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Jon Mason <jdmason@kudzu.us>

Looks good to me.

Reviewed-by: Jon Mason <jdmason@kudzu.us>

I have some coming that I'll need to tweak to match these.  So, expect
those soon.

Thanks,
Jon


> ---
>  meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc    | 3 ++-
>  .../machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc  | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc      | 3 ++-
>  .../machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc  | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc    | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc     | 3 ++-
>  meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc       | 3 ++-
>  meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc       | 3 ++-
>  meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc      | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc        | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc        | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc        | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc        | 3 ++-
>  .../machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc    | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc        | 3 ++-
>  .../machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc    | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc        | 3 ++-
>  .../machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc    | 3 ++-
>  .../machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc    | 3 ++-
>  meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc        | 3 ++-
>  meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc        | 3 ++-
>  meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc       | 3 ++-
>  28 files changed, 56 insertions(+), 28 deletions(-)
> 
> diff --git a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
> index 493ad67b21d..0a115be8a47 100644
> --- a/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
> +++ b/meta/conf/machine/include/arm/armv8-1m/tune-cortexm55.inc
> @@ -10,5 +10,6 @@ require conf/machine/include/arm/arch-armv8-1m-main.inc
>  
>  AVAILTUNES                            += "cortexm55"
>  ARMPKGARCH:tune-cortexm55              = "cortexm55"
> -TUNE_FEATURES:tune-cortexm55           = "${TUNE_FEATURES:tune-armv8-1m-main} cortexm55"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexm55           = "cortexm55"
>  PACKAGE_EXTRA_ARCHS:tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS:tune-armv8-1m-main} cortexm55"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> index d130b4b90ad..5e63b45ae0e 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> @@ -8,6 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES += "cortexa55"
>  ARMPKGARCH:tune-cortexa55             = "cortexa55"
> -TUNE_FEATURES:tune-cortexa55          = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa55"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa55          = "aarch64 crypto cortexa55"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa55"
>  BASE_LIB:tune-cortexa55               = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> index c7e86887b56..ba96d0452e2 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa65"
>  ARMPKGARCH:tune-cortexa65                           = "cortexa65"
> -TUNE_FEATURES:tune-cortexa65                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa65"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa65                        = "aarch64 crypto cortexa65"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa65"
>  BASE_LIB:tune-cortexa65                             = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> index dad6d1b174f..cc921474417 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa65ae"
>  ARMPKGARCH:tune-cortexa65ae                         = "cortexa65ae"
> -TUNE_FEATURES:tune-cortexa65ae                      = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa65ae"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa65ae                      = "aarch64 crypto cortexa65ae"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa65ae                = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa65ae"
>  BASE_LIB:tune-cortexa65ae                           = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> index 3a47e8278d2..e18b2cb6e0a 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> @@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  AVAILTUNES                                         += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
>  ARMPKGARCH:tune-cortexa75-cortexa55                 = "cortexa75-cortexa55"
>  ARMPKGARCH:tune-cortexa75-cortexa55-crypto          = "cortexa75-cortexa55-crypto"
> -TUNE_FEATURES:tune-cortexa75-cortexa55              = "${TUNE_FEATURES:tune-armv8-2a} cortexa75-cortexa55"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa75-cortexa55              = "aarch64 cortexa75-cortexa55"
>  TUNE_FEATURES:tune-cortexa75-cortexa55-crypto       = "${TUNE_FEATURES:tune-cortexa75-cortexa55} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa75-cortexa55        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} cortexa75-cortexa55"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa75-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> index 2d9a1159f1a..453be2e6fda 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa75"
>  ARMPKGARCH:tune-cortexa75                           = "cortexa75"
> -TUNE_FEATURES:tune-cortexa75                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa75"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa75                        = "aarch64 crypto cortexa75"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa75                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa75"
>  BASE_LIB:tune-cortexa75                             = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> index f4c99ad6bbc..7daf9d91a8f 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> @@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  AVAILTUNES                                         += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
>  ARMPKGARCH:tune-cortexa76-cortexa55                 = "cortexa76-cortexa55"
>  ARMPKGARCH:tune-cortexa76-cortexa55-crypto          = "cortexa76-cortexa55-crypto"
> -TUNE_FEATURES:tune-cortexa76-cortexa55              = "${TUNE_FEATURES:tune-armv8-2a} cortexa76-cortexa55"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa76-cortexa55              = "aarch64 cortexa76-cortexa55"
>  TUNE_FEATURES:tune-cortexa76-cortexa55-crypto       = "${TUNE_FEATURES:tune-cortexa76-cortexa55} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa76-cortexa55        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a} cortexa76-cortexa55"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa76-cortexa55-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> index 0dfdb8c5e48..14ed81214de 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa76"
>  ARMPKGARCH:tune-cortexa76                           = "cortexa76"
> -TUNE_FEATURES:tune-cortexa76                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa76"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa76                        = "aarch64 crypto cortexa76"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa76                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa76"
>  BASE_LIB:tune-cortexa76                             = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> index b2863dca682..191863bac86 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa76ae"
>  ARMPKGARCH:tune-cortexa76ae                         = "cortexa76ae"
> -TUNE_FEATURES:tune-cortexa76ae                      = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa76ae"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa76ae                      = "aarch64 crypto cortexa76ae"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa76ae                = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa76ae"
>  BASE_LIB:tune-cortexa76ae                           = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> index 654b1f6323d..1522fd6abd9 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "cortexa77"
>  ARMPKGARCH:tune-cortexa77                           = "cortexa77"
> -TUNE_FEATURES:tune-cortexa77                        = "${TUNE_FEATURES:tune-armv8-2a-crypto} cortexa77"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa77                        = "aarch64 crypto cortexa77"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa77                  = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} cortexa77"
>  BASE_LIB:tune-cortexa77                             = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
> index 15ed595bdea..e906cf965cb 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
> @@ -11,6 +11,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES                                         += "neoversee1"
>  ARMPKGARCH:tune-neoversee1                          = "neoversee1"
> -TUNE_FEATURES:tune-neoversee1                       = "${TUNE_FEATURES:tune-armv8-2a-crypto} neoversee1"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-neoversee1                       = "aarch64 crypto neoversee1"
>  PACKAGE_EXTRA_ARCHS:tune-neoversee1                 = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} neoversee1"
>  BASE_LIB:tune-neoversee1                            = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> index 2cac70ea525..e9d7a59c511 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
> @@ -8,6 +8,7 @@ require conf/machine/include/arm/arch-armv8-2a.inc
>  # Little Endian base configs
>  AVAILTUNES += "octeontx2"
>  ARMPKGARCH:tune-octeontx2             = "octeontx2"
> -TUNE_FEATURES:tune-octeontx2          = "${TUNE_FEATURES:tune-armv8-2a-crypto} octeontx2"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-octeontx2          = "aarch64 crypto octeontx2"
>  PACKAGE_EXTRA_ARCHS:tune-octeontx2    = "${PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto} octeontx2"
>  BASE_LIB:tune-octeontx2               = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
> index 25780bc0802..e83e0ba68a7 100644
> --- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
> +++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm23.inc
> @@ -10,5 +10,6 @@ require conf/machine/include/arm/arch-armv8m-base.inc
>  
>  AVAILTUNES                          += "cortexm23"
>  ARMPKGARCH:tune-cortexm23            = "cortexm23"
> -TUNE_FEATURES:tune-cortexm23         = "${TUNE_FEATURES:tune-armv8m-base} cortexm23"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexm23         = "cortexm23"
>  PACKAGE_EXTRA_ARCHS:tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-base} cortexm23"
> diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
> index 04d1fe2bde8..606900d7a21 100644
> --- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
> +++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm33.inc
> @@ -13,5 +13,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
>  # be fixed in GCC
>  AVAILTUNES                          += "cortexm33"
>  ARMPKGARCH:tune-cortexm33            = "cortexm33"
> -TUNE_FEATURES:tune-cortexm33         = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm33"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexm33         = "vfpv5spd16 dsp cortexm33"
>  PACKAGE_EXTRA_ARCHS:tune-cortexm33   = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm33e-fpv5-spd16"
> diff --git a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
> index 60e978facdc..4394adab0b1 100644
> --- a/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
> +++ b/meta/conf/machine/include/arm/armv8-m/tune-cortexm35p.inc
> @@ -13,5 +13,6 @@ require conf/machine/include/arm/arch-armv8m-main.inc
>  # be fixed in GCC
>  AVAILTUNES                          += "cortexm35p"
>  ARMPKGARCH:tune-cortexm35p           = "cortexm35p"
> -TUNE_FEATURES:tune-cortexm35p        = "${TUNE_FEATURES:tune-armv8m-maine-vfpv5spd16} cortexm35p"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexm35p        = "vfpv5spd16 dsp cortexm35p"
>  PACKAGE_EXTRA_ARCHS:tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS:tune-armv8m-maine-vfpv5spd16} cortexm35pe-fpv5-spd16"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> index c7b01a29065..25bdf12b185 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> @@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa32 cortexa32-crypto"
>  ARMPKGARCH:tune-cortexa32             = "cortexa32"
>  ARMPKGARCH:tune-cortexa32-crypto      = "cortexa32"
> -TUNE_FEATURES:tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc callconvention-hard neon"
>  TUNE_FEATURES:tune-cortexa32-crypto   = "${TUNE_FEATURES:tune-cortexa32} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> index 55dd845b005..c195d733784 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> @@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES                                += "cortexa34 cortexa34-crypto"
>  ARMPKGARCH:tune-cortexa34                  = "cortexa34"
>  ARMPKGARCH:tune-cortexa34-crypto           = "cortexa34"
> -TUNE_FEATURES:tune-cortexa34               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa34"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa34               = "aarch64 crc cortexa34"
>  TUNE_FEATURES:tune-cortexa34-crypto        = "${TUNE_FEATURES:tune-cortexa34} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa34         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa34"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa34-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa34 cortexa34-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> index 33afb193863..d811c84455c 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> @@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa35 cortexa35-crypto"
>  ARMPKGARCH:tune-cortexa35             = "cortexa35"
>  ARMPKGARCH:tune-cortexa35-crypto      = "cortexa35"
> -TUNE_FEATURES:tune-cortexa35          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa35"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa35          = "aarch64 crc cortexa35"
>  TUNE_FEATURES:tune-cortexa35-crypto   = "${TUNE_FEATURES:tune-cortexa35} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa35"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> index a534ad358d8..a88575eb156 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> @@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa53 cortexa53-crypto"
>  ARMPKGARCH:tune-cortexa53             = "cortexa53"
>  ARMPKGARCH:tune-cortexa53-crypto      = "cortexa53-crypto"
> -TUNE_FEATURES:tune-cortexa53          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa53"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa53          = "aarch64 crc cortexa53"
>  TUNE_FEATURES:tune-cortexa53-crypto   = "${TUNE_FEATURES:tune-cortexa53} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa53"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> index 7de671a2e5d..052d1173c9b 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> @@ -9,6 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # Little Endian base configs
>  AVAILTUNES += "cortexa57-cortexa53"
>  ARMPKGARCH:tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
> -TUNE_FEATURES:tune-cortexa57-cortexa53 = "${TUNE_FEATURES:tune-armv8a-crc} cortexa57-cortexa53"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa57-cortexa53"
>  BASE_LIB:tune-cortexa57-cortexa53 = "lib64"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> index 37650d8798c..b0de20f8369 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> @@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa57 cortexa57-crypto"
>  ARMPKGARCH:tune-cortexa57             = "cortexa57"
>  ARMPKGARCH:tune-cortexa57-crypto      = "cortexa57-crypto"
> -TUNE_FEATURES:tune-cortexa57          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa57"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa57          = "aarch64 crc cortexa57"
>  TUNE_FEATURES:tune-cortexa57-crypto   = "${TUNE_FEATURES:tune-cortexa57} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa57"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> index a77ef59d62d..ff188aec5fd 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> @@ -10,7 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
>  ARMPKGARCH:tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
>  ARMPKGARCH:tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53-crypto"
> -TUNE_FEATURES:tune-cortexa72-cortexa53               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72-cortexa53"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-cortexa53"
>  TUNE_FEATURES:tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES:tune-cortexa72-cortexa53} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc}        cortexa72-cortexa53"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index b0a017e444b..cbb6418c069 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -9,7 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa72 cortexa72-crypto"
>  ARMPKGARCH:tune-cortexa72             = "cortexa72"
>  ARMPKGARCH:tune-cortexa72-crypto      = "cortexa72"
> -TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa72          = "aarch64 crc cortexa72"
>  TUNE_FEATURES:tune-cortexa72-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> index 869670bf0cf..4f4f25f5119 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> @@ -13,7 +13,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES                                          += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
>  ARMPKGARCH:tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
>  ARMPKGARCH:tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
> -TUNE_FEATURES:tune-cortexa73-cortexa35               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73-cortexa35"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
>  TUNE_FEATURES:tune-cortexa73-cortexa35-crypto        = "${TUNE_FEATURES:tune-cortexa73-cortexa35} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa73-cortexa35"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> index 9cebffd54dd..1d152ed83bf 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> @@ -10,7 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
>  ARMPKGARCH:tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
>  ARMPKGARCH:tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53-crypto"
> -TUNE_FEATURES:tune-cortexa73-cortexa53               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73-cortexa53"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-cortexa53"
>  TUNE_FEATURES:tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES:tune-cortexa73-cortexa53} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc}        cortexa73-cortexa53"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> index 13876e72459..b3b06a4f09f 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> @@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES                                += "cortexa73 cortexa73-crypto"
>  ARMPKGARCH:tune-cortexa73                  = "cortexa73"
>  ARMPKGARCH:tune-cortexa73-crypto           = "cortexa73"
> -TUNE_FEATURES:tune-cortexa73               = "${TUNE_FEATURES:tune-armv8a-crc} cortexa73"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexa73               = "aarch64 crc cortexa73"
>  TUNE_FEATURES:tune-cortexa73-crypto        = "${TUNE_FEATURES:tune-cortexa73} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa73         = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa73"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa73-crypto  = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa73 cortexa73-crypto"
> diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> index 3a97cf8ee82..02507d9b78a 100644
> --- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> +++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> @@ -10,5 +10,6 @@ require conf/machine/include/arm/arch-armv8r.inc
>  
>  AVAILTUNES                             += "cortexr52"
>  ARMPKGARCH:tune-cortexr52               = "cortexr52"
> -TUNE_FEATURES:tune-cortexr52            = "${TUNE_FEATURES:tune-armv8r-crc-simd} cortexr52"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-cortexr52            = "aarch64 crc simd cortexr52"
>  PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
> diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
> index d26ab25e48f..ad60a3c9f39 100644
> --- a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
> +++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
> @@ -12,7 +12,8 @@ require conf/machine/include/arm/arch-armv9a.inc
>  AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
>  ARMPKGARCH:tune-neoversen2                          = "neoversen2"
>  ARMPKGARCH:tune-neoversen2-crypto                   = "neoversen2-crypto"
> -TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv9a} neoversen2"
> +# We do not want -march since -mcpu is added above to cover for it
> +TUNE_FEATURES:tune-neoversen2                       = "aarch64 neoversen2"
>  TUNE_FEATURES:tune-neoversen2-crypto                = "${TUNE_FEATURES:tune-neoversen2} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} neoversen2"
>  PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto} neoversen2 neoversen2-crypto"
> -- 
> 2.43.0
> 
> 

