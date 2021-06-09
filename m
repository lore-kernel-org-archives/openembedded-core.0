Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.11165.1623259770735075215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 10:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JrnH0NlM;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id m21so23545725lfg.13
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s3uUnZ5VhKAyPQTSjqaBAlDOmYu+JAvkNGeoHoIUlig=;
        b=JrnH0NlM0dgELZjuq2wzJGRVxEXZDISQ4sQH8ZSjAqUImVAKjwOpX2tozHywpZ86zZ
         2Dx+2iyNzxCFuI4gVltb9PLGG/e3ueP9xp4TDkUtyytr9L7+5f5lzR0Pzq+Y/gqF73/j
         iByv+Jjs96PJ/X1SVStqqZgi2V2aw5tsb/vWB9wPwrPPCpP8o9iZ+GQIGOUIdZ0+k/CJ
         emC/aqiksaWEzCPjoyzYIbJ5nY3HMow4rV2HyRgfeA7gWV+Pa9o0h7/XZLWsSINK++Wz
         ZDeRbsA7BBwEUYzcxBVEoL1UY8uQ3HqbQ0iKqzIb6gsPW8Ojucl3jNIXwZomN5Pc4PqT
         umWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s3uUnZ5VhKAyPQTSjqaBAlDOmYu+JAvkNGeoHoIUlig=;
        b=c2vcRrxIXRWU6REhEm4yabMhMZVrtzqsDthstq1ET4PdAnIPXcJYSv8bVECx+ZGoM/
         BfjEmEgQUnxTk8Wgbv+hdFoapxbxofUDGJCuA+UR7kOXVIKiJLqYz0qaqxJgpdeGm1ap
         6zF20VDVQQZxrCTIFvpIYolvE7bv7GC4G7/lH1VMSGmEc78elCXWyf036x3vVd1uXB5z
         YfR81WAzEqbMN1Ovh6zc5HDb5jCEMlvucCCQJ1nYhKH/iTvuU380Yrfl91SJzJ+pew4W
         IZ+5hlwRLR2Ewy4ty10NcmCRti3rmt7lfA1QCZ7PTzkPa397Tex7tMZYmJpctjusTbNx
         MkVQ==
X-Gm-Message-State: AOAM530Vj5T0ysRNeMoGFAREKntoyWU0LjZ1cWDXhO8cLTS3SsD7WtWI
	nUNCWOwboQ4QRPakLQG1R8ct2L5pfhGCsMi5M7k=
X-Google-Smtp-Source: ABdhPJyDA+SYejPtRL5gQEwOKkDtu66oPWq3Guqz5cHBgE2ssQmmqxvKCd2MQsIUnEcI8btjszSiuMmWitnyXx0MG0Y=
X-Received: by 2002:a05:6512:3ca6:: with SMTP id h38mr354567lfv.257.1623259768302;
 Wed, 09 Jun 2021 10:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210609072939.6058-1-changqing.li@windriver.com>
In-Reply-To: <20210609072939.6058-1-changqing.li@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 9 Jun 2021 10:29:16 -0700
Message-ID: <CAJ86T=X8aHodEfG2uRWsB31xDSf3OfUUhXxxL3+yY4dzTiGzfQ@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] libjpeg-turbo: fix do_compile error on armv5
To: Changqing Li <changqing.li@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 9, 2021 at 12:32 AM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below error:
> /include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> 31 | #error "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
>
> Neon is not supported by armv5, disable the simd extension build.

Drop this comment. Neon may be missing from other ISA levels too (i.e.
this fix is not specific to armv5).

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

Shouldn't this be checking for neon in TUNE_FEATURES rather than
TUNE_CCARGS_MFPU? It should also probably be conditional on the _arm
over-ride since neon will be missing from
TUNE_CCARGS_MFPU/TUNE_FEATURES for other architectures. Since big
endian ARM doesn't use the _arm over-ride you will also need a
duplicate line with the same logic with the _armeb override too. See
the lines below which do the equivalent for _powerpc / _powerpc64 as a
reference.

>  # Provide a workaround if Altivec unit is not present in PPC
>  EXTRA_OECMAKE_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
>  EXTRA_OECMAKE_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False", d)}"
> --
> 2.17.1
>
>
> 
>
