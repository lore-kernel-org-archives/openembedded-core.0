Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.4862.1623225556803242464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 00:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=BsAdes7k;
 spf=pass (domain: google.com, ip: 209.85.167.41, mailfrom: wak@google.com)
Received: by mail-lf1-f41.google.com with SMTP id r198so33238044lff.11
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zbgYeF/bGQfAkvZGunsYQ/+yWmxl/IxRThkvpwKwwAU=;
        b=BsAdes7kW9D1dvyE+D7FpYRF+t7/HY9Txd+/j3SuSKrmhiJbAtEqUs8cr/hHVs/hoT
         hodIDVO/5OXSCkLjQOLuXOlytyknN1G4LzJtiwplt0g795/VZwhdEBbDasT4N/8SHxbn
         REnnHz5LkEx1l13PL8vIGOBAz8tD4WLLJHhcZv5n2bgjJoKAdlqqT/2ktGhPGle/9WZO
         RKOzuRFPOXm6XyabkL/vcKTVSCmRvJhbV4NtGSBPFfPpu4QeHiikiLFcEZakXLDXQ/GB
         Rt6b31p7iOcfWuEw/+SFjhieyWol9gyYWVm1uU82WjIYUrNDYILdBpb/r/pcm3HF6z7G
         DJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zbgYeF/bGQfAkvZGunsYQ/+yWmxl/IxRThkvpwKwwAU=;
        b=gOdOcU2lLIpLEd1mXAA48tKboS9YNaY0vDvAvv8kR2B4+zPFgLaaPK25FJk5LaDYBN
         6U02GoYlU/Z8jG2qsA1FCuGhCawvY/J6jlVRUIyhDYfkfbuWG17L3WwsWfl08netjlPI
         X/md5MMPztVrJBhBydOL5SJZZFLxBgiWIn7NhicQ/c3CeDZrF0cz+dpXUCOheiQXAX1/
         MUXpi66EbNxzCeEjeOqoWqENbBVNLiUnqS/DcYYNFRqEPKCZWgClqz7YpFXKsJbdutIu
         DhFHJpO5BVlyowhREGksaLF7lCsVvaO3YR7At0fa24tdwYDI9vHJwn8UArGZFqmdDkAG
         yeuw==
X-Gm-Message-State: AOAM533FC9VPiB5m85RMVi7Yo59Kmozi5pRb1v6piauKfgPm/jGq7TdY
	iHKMTbZVRoDgYRHNptANOhQL14oslBW8+qJdyKBt/w==
X-Google-Smtp-Source: ABdhPJyNjU6yNZnEMJkNcTuGNKmslSu/8cSvQGEjabowyziBG220IzpnKy81JeMSz9pIRpnvUM4KvEzcKdeI7zBUt/M=
X-Received: by 2002:ac2:551d:: with SMTP id j29mr15872229lfk.319.1623225554640;
 Wed, 09 Jun 2021 00:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210609072939.6058-1-changqing.li@windriver.com>
In-Reply-To: <20210609072939.6058-1-changqing.li@windriver.com>
From: "William A. Kennington III" <wak@google.com>
Date: Wed, 9 Jun 2021 00:59:03 -0700
Message-ID: <CAPnigK=hj5of9UXVu5c5C-t6qKmHS+L_yMERmApETF-vqDpRpw@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Btw, I'm hoping upstream will fix this for all arm
https://github.com/libjpeg-turbo/libjpeg-turbo/issues/523

On Wed, Jun 9, 2021 at 12:32 AM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below error:
> /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> 31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>
> Neon is not supported by armv5, disable the simd extension build.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> index 7f91cc02ac..da21971113 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
>  # Work around missing non-floating point ABI support in MIPS
>  EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
>
> +EXTRA_OECMAKE_append_class-target = " ${@ ('') if (d.getVar('TUNE_CCARGS_MFPU') != '') else '-DWITH_SIMD=False'}"
> +
>  # Provide a workaround if Altivec unit is not present in PPC
>  EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>  EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
> --
> 2.17.1
>
>
> 
>
