Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.2800.1623206999616730326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 19:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4Amn+t/;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id a15so2686570qtx.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 19:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EiDQ8abp97FH8rYiYO4KKW98WxNFl6d1DcGIRYX9ZsQ=;
        b=j4Amn+t/QW26QjiaO1huhCY0Shn4Qc/pYO20Voiwu39ryMGczCgoLxa88BwgrYoAKu
         rD7fxOqPC66oZdnD3ZGd2pepqp1JYcx0YNeyuwdq57z8WTaUmzqUqb0glJhDTn7ZScIk
         3lvsLkWXLwB9DbxD5LU8gh1WgyXwolRLWLj8EMM6QjkVJud3UT6FktxKxY+p2pngvYEX
         m9PyBoMz5VSCIACf39KH25vEzpF3q0FbGNww0mRA1Mec5jQEoX5lpjY1jFiIk0kowX0z
         E3xeLNY/5zKvj7RVFAIHcXGjuujZNCSTGIiN7+V4m8ZLhjpqbsDnxeNUlaqTvKn2cbaT
         r/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EiDQ8abp97FH8rYiYO4KKW98WxNFl6d1DcGIRYX9ZsQ=;
        b=ewx7o/3/ARsKulIF6ufpspkeze6fIOoLRpaumsQrBgwSzyPXV9PZwUodTJhQe67EHL
         PMcQlhP8/orMWxbkNY3BNxsLDDCX/xa5CKBFTmGOgFs09mBCw3+xq3aTCr846ZeKjy0/
         5e81NnSc/UWGve2KiQcTdCkPGYdl2K9B/gK686n2rCMDwloFKK5zo598TyDA/RaT79eI
         NSmCLhAkuv1p5BcuWJfMkjovbGxH+HhgsMNwPwOdxowBiOzXfKMOBDTLyevnd8nBvajV
         WZ4AiupAOYF99gUiYilgfqEaqrQih2DBhGN/4xen+gOASxdtfATi1v+Sa1f9WbdmzFJA
         p/oQ==
X-Gm-Message-State: AOAM532EOIuyxlC8sBtjI2b8fGIEjyKuH8Q+DjLIIpB9i16bu81eA3XJ
	FIkBZo7FVRWMszwYFJZuTZS12jWVJySCZTdUznHBjKTF7kQ=
X-Google-Smtp-Source: ABdhPJwoyoO9MS/6tkk4BJbLvXK3T+Y3zILqQ0167hdFoo8kHxmBzKy4qI4/hUcN92A+CZ0frprpHdEzCp2oPAhYUao=
X-Received: by 2002:ac8:e0c:: with SMTP id a12mr18704434qti.82.1623206998606;
 Tue, 08 Jun 2021 19:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210609023506.8344-1-changqing.li@windriver.com>
In-Reply-To: <20210609023506.8344-1-changqing.li@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 8 Jun 2021 19:49:32 -0700
Message-ID: <CAMKF1sqNZpRLGsR3g7GWTVyfsLKQ+mm2RSda9ukq_GJ_xoTkZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 7:37 PM Changqing Li <changqing.li@windriver.com> wrote:
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
> index 7f91cc02ac..9b1798b232 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.0.bb
> @@ -40,6 +40,8 @@ EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx3
>  # Work around missing non-floating point ABI support in MIPS
>  EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
>
> +EXTRA_OECMAKE_append_class-target_armv5 = " -DWITH_SIMD=False"

I think it should check for neon in machine features if its not
available then disable it on arm.

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
