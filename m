Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web12.7685.1609212593566307663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 19:29:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jl2ebiPS;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id e15so6496729vsa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 19:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1CVI0pkJBVRFDLRexUXhxkN6pG+NIVaVFD4yLLit9yg=;
        b=jl2ebiPSR7gfLNE14517ZhyzD45Jyeo/SSs6ZSFwR+xSDIIryo6xgMV4x2d6bdSgAe
         uNFSfHZ7fq+SGLZpEOgh8EywyAFHHrk+ChRlrCWbOWYGGFNGWBvKN+tMF8IEtfThZbJ7
         BLtSxRg+Yt9LnjrhItZQeqnBtyzaW6VPhq1ocvsqq+9W+JaFUroAqJkukNuPFMwOrEvO
         KtjBg7iiCnAOvcpKTijmHgwvWyBjFvMB+1Q4bJVadd5vFbLDx7YUf7UeqJl9sO+wO6Z5
         t6Wi+aEm94pFh4BASGuwhz7AX+hDNkIRAm0cj20iNP/6b1bjurJF03Op25XL6zeC2abA
         o0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1CVI0pkJBVRFDLRexUXhxkN6pG+NIVaVFD4yLLit9yg=;
        b=R9dNQRhwlX8DOT9W40YXb8jmXhvMyRYIh5dq3+WCUOC8VzswNwQYnL9QCjHzx7rwJZ
         Su7FBiTfCxlXwAzX7FHJdeyrfmtiPY6V7IzgFaFczsk4ITD8F6Gyfe2TmhNtmf58H4/5
         yTTFrqWD9OiRBulA39N8+jy6VbPTBzs4FrviXjRTB/dY9tEDumwoaIVfJO6/HCBkin8z
         8LyYmRTHUUsxOIjoCL57Dp+garm7aAogjLR5fV/RxdpDyJUQOfyLSJ+lIMTJh4fzfeXP
         Yo9W021GAk++F6lQW4NeMyRAfIInYVWbp/MxMOY1ObO+JSglUMdc79SHo6Lh8x4P61EI
         aKmg==
X-Gm-Message-State: AOAM533iFm2v5ycOJ+0ZKGVh24n2dPCGESRemP+VerwfxhKkomm2GwZM
	qSbuE+sUBD1CfaaPanUlE7lb+qz8lYFGYlhQ5n9ZYflH
X-Google-Smtp-Source: ABdhPJwMewMchXupK03y6PJSbWfjdfRPmXo6iX0mC1EkvsoSuaRcyFNwo2fELQL59d5DyQ5wUS+Q/MSZFrvk3kWaW0g=
X-Received: by 2002:a67:3354:: with SMTP id z81mr31251012vsz.18.1609212592576;
 Mon, 28 Dec 2020 19:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20201229023626.14834-1-mingli.yu@windriver.com>
In-Reply-To: <20201229023626.14834-1-mingli.yu@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 28 Dec 2020 19:29:44 -0800
Message-ID: <CAJ86T=VZtAHf2cP==VnVK1mM4XEY+DaJqyokmzPfCzGT0UvwAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: define -mfloat-abi=softfp for CC on armv5
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 6:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> After pulseaudio upgrades from 13.0 to 14.0, it also switches from autot=
ools
> to meson and there's no option for disabling Neon optimizations with mes=
on.
> And the build system adds -mfpu=3Dneon at the end of the compiler comman=
d line
> which overrids any earlier -mfpu options and result below build failure:
>
> | /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/recipe=
-sysroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/10.=
2.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available w=
ith the soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dh=
ard"
> |  31 | #error "NEON intrinsics not available with the soft-float ABI.  =
Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
>       |  ^~~~~
> | ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch2_s=
16ne_neon':
> | ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type =
name 'int32x4_t'; did you mean 'int32_t'?
> |   38 |         int32x4_t sum0, sum1;
>
> Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.

Doesn't look right. That forces the whole package to be compiled with
floating point instructions, which will break targets which need soft
float.

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/re=
cipes-multimedia/pulseaudio/pulseaudio.inc
> index e40b8c1c40..44a6a3055e 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -123,6 +123,7 @@ PACKAGECONFIG[ipv6] =3D "-Dipv6=3Dtrue,-Dipv6=3Dfals=
e,"
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,"
>
>  export TARGET_PFPU =3D "${TARGET_FPU}"
> +export CC_append_armv5 =3D " -mfloat-abi=3Dsoftfp"

Aside from the fact that the change itself looks wrong, what is export
with a conditional append supposed to do? Export unconditionally (and
so have a side effect for targets other than armv5)? Export only if
the conditional append took effect? Since most people have no idea,
it's better to keep export and the conditional append separate.

>  set_cfg_value () {
>         sed -i -e "s/\(; *\)\?$2 =3D.*/$2 =3D $3/" "$1"
> --
> 2.26.2
>
>
>=20
>
