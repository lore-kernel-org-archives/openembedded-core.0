Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.567.1615503873369158699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 15:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LdMhLBS9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z2so719002wrl.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 15:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Bvikk//wVUGgPWGPB30C8l9ruLaUxcheYRUJxQuxfWs=;
        b=LdMhLBS9qND/jIw4K0rHhATUx5IsaB9U7l9YWUOauwWwooDHtpgYakhfdieWicvxyq
         ghLaufTFWnaeDwKxwVkY4Zt5Ll1qvaRwpEe3YruhwQ6QSpZyYA3ViqbBnBEXkVSBDaYc
         vcd+kGhRg4rgUoJiKZH3ZBzBUdHoFOyWM+ro8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Bvikk//wVUGgPWGPB30C8l9ruLaUxcheYRUJxQuxfWs=;
        b=ei9tjRBJjM/tTalatPkmR6UTrHjaa5HJghFp35HB+V7l9dPnYtR2nCd3fLKUKQ2/Be
         1vslWN/ljDDyztL11Kf3M561acBlR2HFsIDsb+S0BwQqhKqyirS8SP93dtWto6mSWDF1
         z+JxHfJZ3/Gw8xo2eI8lMJ7wH/odV8Uu7ZgFB3FSpjCg4MBEx9EncbVyI9ZKDH3ylfXH
         TffQepOFivvvEiul3FqwBfDCqWJPK4O58jK1YZVpWCWgzj4cuMf6N87MYQ8eYEZVShDo
         wXB+0qk4Lx6BX/LKrDvfjosxkcjqw+vo7KwMx2krjvkTVbTA2SPAf45YrN7qGUYlYv+4
         To2Q==
X-Gm-Message-State: AOAM5302nIlPVS0UkmKVU68oEz8acSwm9/mn+UZhNVF6NIjJrDKOOQ6k
	/tJINaAIJ7ZFUZrVSbq8cGRyKw==
X-Google-Smtp-Source: ABdhPJwIhSEvhf1aazPIMh3hyO5k0yAZwS7GUF3NtktCI59S6/5hjF7AX0zoZFR3Qd2Od2NFdR4mXg==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr10782932wrv.176.1615503871790;
        Thu, 11 Mar 2021 15:04:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7cc6:73c3:839f:86be? ([2001:8b0:aba:5f3c:7cc6:73c3:839f:86be])
        by smtp.gmail.com with ESMTPSA id s18sm6399958wrr.27.2021.03.11.15.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:04:31 -0800 (PST)
Message-ID: <c143615e770fa5b75147cb3dc82033b31ce9a034.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: Add support for building for qemuriscv32
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com
Date: Thu, 11 Mar 2021 23:04:30 +0000
In-Reply-To: <20210311143714.3294960-1-alistair.francis@wdc.com>
References: <20210311143714.3294960-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 06:37 -0800, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/machine/qemuriscv32.conf            |  7 ++--
>  ...iscv32-Use-double-float-ABI-for-rv32.patch | 42 +++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot_2021.01.bb     |  2 +
>  3 files changed, 47 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
> 
> diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemuriscv32.conf
> index 1413775ad6..d3858dc051 100644
> --- a/meta/conf/machine/qemuriscv32.conf
> +++ b/meta/conf/machine/qemuriscv32.conf
> @@ -11,7 +11,6 @@ PREFERRED_VERSION_openocd = "riscv"
>  
> 
> 
> 
>  XVISOR_PLAT = "riscv/virt32"
>  
> 
> 
> 
> -# u-boot doesn't compile, error: "can't link hard-float modules with soft-float modules"
> -# EXTRA_IMAGEDEPENDS += "u-boot"
> -# UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
> -# UBOOT_ELF = "u-boot"
> +EXTRA_IMAGEDEPENDS += "u-boot"
> +UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
> +UBOOT_ELF = "u-boot"
> diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
> new file mode 100644
> index 0000000000..55b649db50
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
> @@ -0,0 +1,42 @@
> +From 66dfe0fa886f6289add06d1af8642ce2b5302852 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 9 Feb 2021 16:40:12 -0800
> +Subject: [PATCH] riscv32: Use double-float ABI for rv32
> +
> +So it can use libgcc built with OE toolchain
> +Fixes
> +error: "can't link hard-float modules with soft-float modules"
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Inappropriate [configuration]

Is that status really correct? The patch doesn't look very configuration like to me...

Cheers,

Richard


