Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E59CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 15:10:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.23953.1761232203377266716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 08:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HB9D4kCX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so8005455e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761232202; x=1761837002; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aP/VcoDyaMAp66iJ4dJDJOJat6j23Jk01Pba+Km9Bcg=;
        b=HB9D4kCXAYgP22R3YedmEmYSSt3ZP37j6EVXAZzhH0ZjHwp+P+yxqIqqGFSTnNXERv
         ECukAm1Me+PHXWkt5GXMO9nQPx3vYA8HnzQtjh3gUEvPqObFiudgDCE0vuNHhz2AxqGG
         t6iEcFkxglLz0qVrZyegVNsDsbrQsarKiqCWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232202; x=1761837002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aP/VcoDyaMAp66iJ4dJDJOJat6j23Jk01Pba+Km9Bcg=;
        b=iR9n4d5WB782OLyyYwqh/Vn9bTTwlPA4EHMQaBUuybqyk9fXWXq+hE+X3KlKwT1Ccn
         HkplrFFP4189EQ10IvR+Hgm/aYTORhFIArD78DsAqbgPdxfL14i1Yf/gDnnIzn+tN5XK
         HIg0UuvgOZLX9UVflL8oG6i/5rhU6QAWtwj/vWKciN1vjCFmwAxnA/zjxIK/3YL5kGIg
         O6syPSQz/rXDzAHmEYpiZksJgY3dNqVfMx7uOuRun576wdwVjXLjBvf9DHW57R2tMww7
         EyK93zE45JlgaStqpLY1MIfSXJ21o9hKsDiBY4UcSjJOLs1Cct2SSZfxzLmr7zGeHFwk
         s3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzW/O5OrSz8AjrWWvPjikl/oyp+v9ezwhNu6uwVXDnY+c0iefrn2TApGhlc5WmS0mpZLfksL3h7g9NqBJswXW/Cw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwLLHyoxI/ycu50CrienAYGps0t1M12XuSnhfjZy4elG3K/rdB4
	CjruieGFcJ9c+sP5+OLJKadZoWvtLlRbRvq1XXkPYAeoKx0JLA81qfPeBmC5LjArH1g=
X-Gm-Gg: ASbGncuypuHHTEotD5JOv2ig+KaTtnEeD9xCG5CpKq08n7VwiZPedJ2PolyUhPRFs+U
	qYqlK0ILE1s2cf8wBdcaFsVv6b+mKcRfEPtSkF5ZTNRBd8zl4e+s/Jl0KsP7vzyB6YnYBiAdj6K
	FsfKjxw4AUe3h98vklIwjBDnVmOQqhrDogbM2ojUf1KwvKT+LULJiINLz0CssZsageuAR9lZGZ9
	w74ziocvlZ8tZS709qgXFHwgRFNM5JpQFx59ABkVpvJNRBRCnzoA2/kecP+hZxrQEEGTtAl5dAB
	0ek0R7Exyug2Q2OuJdXnC/Uf/t92rVqnhvUdCae8+G1uFb+23/i2MjrBpw9aYmctRBDXdmWq+7M
	Q11Z/1BRZ+YpWYH/YH7QZggZiM2WQKNZO/yPrxNa0RtornJzQs7fJ/5k4WCk1r2SjDHAx19TaXh
	VGgOIPThxaVxV6nDcE/ctiKS8CjtrXoMeLxVInhcyJ4CeNWS1FfUCiFiHpzOZCM5369g==
X-Google-Smtp-Source: AGHT+IFxCZHWxMLV6i9LfV3MuRN/BOAh1iYzIIFS4hCZaeVlUDh12kuOT2lrY0I/werALc/F+Xdd9A==
X-Received: by 2002:a05:600c:34d0:b0:470:fe41:a93d with SMTP id 5b1f17b1804b1-47117874cffmr182673305e9.4.1761232201627;
        Thu, 23 Oct 2025 08:10:01 -0700 (PDT)
Received: from [10.5.90.33] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342946sm101949695e9.10.2025.10.23.08.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:10:01 -0700 (PDT)
Message-ID: <eeffe2cc-51b7-441f-a362-bdb7cea00a84@smile.fr>
Date: Thu, 23 Oct 2025 17:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] linux-yocto: enable Rust support in kernel
 configuration
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
 <20251023112547.4044904-7-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
In-Reply-To: <20251023112547.4044904-7-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 15:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225268

Hi Harish,

Le 23/10/2025 à 13:25, Harish.Sadineni@windriver.com a écrit :
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Add initial support for building the Linux kernel with Rust enabled:
>
> - Introduce `rust.cfg` to set Rust-related kernel config options, including:
>    - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
>    - Rust sample modules and developer checks (overflow/debug assertions)
>    - Disable BTF and module versioning for compatibility
>
> - Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature stack
>
> - Update `linux-yocto_${PV}.bb` to:
>    - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
>    - Suppress `buildpaths` QA warning due to Rust path inclusion during builds
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
>   meta/recipes-kernel/linux/files/rust.scc      |  1 +
>   meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
>   3 files changed, 25 insertions(+)
>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel/linux/files/rust.cfg
> new file mode 100644
> index 0000000000..293438e8e0
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.cfg
> @@ -0,0 +1,20 @@
> +CONFIG_RUST=y
> +CONFIG_SAMPLES_RUST=y
> +CONFIG_SAMPLE_RUST_MINIMAL=y
> +CONFIG_SAMPLE_RUST_PRINT=y
> +CONFIG_SAMPLE_RUST_HOSTPROGS=y
> +CONFIG_RUST_DEBUG_ASSERTIONS=y
> +CONFIG_RUST_OVERFLOW_CHECKS=y
> +CONFIG_RUST_BUILD_ASSERT_ALLOW=y
> +# Disable module versioning
> +CONFIG_MODVERSIONS=n
> +
> +# Disable BTF debug info
> +CONFIG_DEBUG_INFO_BTF=n
> +
> +# Rust availability
> +CONFIG_RUST_IS_AVAILABLE=y
> +
> +# Indicate Rust support present
> +CONFIG_HAVE_RUST=y

Since Patch 5 correctly adds the 'make rustavailable' check

during 'do_kernel_configme', shouldn't we let the kernel's build system

determine these values automatically based on the actual toolchain 
readiness?

> +
> diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel/linux/files/rust.scc
> new file mode 100644
> index 0000000000..4686d9ce5e
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.scc
> @@ -0,0 +1 @@
> +kconf hardware rust.cfg
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> index 2188c7fed2..fda964e78d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -77,3 +77,7 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
>   # Check again during next major version upgrade
>   KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
>   INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
> +INSANE_SKIP:kernel-vmlinux = "buildpaths"
> +INSANE_SKIP:kernel-dbg = "buildpaths"
> +SRC_URI += "file://rust.scc"
> +KERNEL_FEATURES += "rust.scc"

