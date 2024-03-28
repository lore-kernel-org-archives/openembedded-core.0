Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8017ECD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:11:45 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.406.1711642299383002035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uzc04rDR;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2218a0f55e1so618112fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711642298; x=1712247098; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KoIdWjtrSkheC124IqSqu5g3AjIhukI/qGSssUFVrM=;
        b=Uzc04rDRiOYCjODdewpHoSsHjoAsRVDccQ35cXdLbI+p9XhFjViTcqTj4OgiPMWyJr
         e4BVtz5EwmsgS5Y9nx4QDKCOZoG1aOWnp8ZgyUuqfEIScetO+V8+E0J64ur3Qa4SRBwV
         KYIzWQz3TYHz2gCxRUiSYf7OJaBX2S+DxTDhe2v1ByY0Yk1qivXk8Y3ITa/IRUAgdCi2
         ZM9pflZboTo2m+G/G19w8zJ9IXoIAclOB9lkhfAjW+w4st01jBCnSt//vTMWS//KWLO0
         uP7E/DIKoUegn65GR9RU3ZGM3EmAgd4tvBFSdsExDn1pYuefYsX7z3z0GadyuluLqcvk
         NSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711642298; x=1712247098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KoIdWjtrSkheC124IqSqu5g3AjIhukI/qGSssUFVrM=;
        b=XwRWSYf66U6XaDqiVMUk8IAz2ggCt6MLQ6SxL33VtqefMm+uuU/Bmm13OnSr1FipF3
         fEdEVT9BFS63dWBgtQ+UT4cgrLQucWHcYKeELLed8B20aqzkJjqiZXExzTfWgV8f3xDy
         kKLZ/rFwy4/em59kYKs3tLiBF8poApL344iIN52ShgB2je4kzkwAaNukiDXzjNEA7vOa
         U3cQWc8kNJHRT6Wv66hDGuMEFUt1OMzV2zEgN40qpd2xGs+hR5/lUxtXP5mEYVaH5RSH
         w1Vqg90UctjR+hW/c7xg084+7WvF90I5BlNMKdHSzVVMPCnnjFZ0m2JPbkoraU1z8TeN
         x8bA==
X-Gm-Message-State: AOJu0YwaymASGD++r6TJ7uUJcx9pE/hz/+5rxOtGXN2EdjqaMJlNfpxs
	PtJyIO0o4Ugkv2TJxEc4PBsB0Xm3+fjLUQYrZHL5ur4zNr8/mSChZsLr4uqaXTuNhIE5BSMMFd/
	nIYvutxkgV2dU7Q84Ahathclg2IydFiT5
X-Google-Smtp-Source: AGHT+IESMtA3maRGsKZ0m61bf6hmCzwR9WTcTgUh/ZwH5UdkRh0/IKhsr/PUXYs0VQU0PcEsnHoWARbiqbZcsVwwwKc=
X-Received: by 2002:a05:6870:a187:b0:221:141:1ef0 with SMTP id
 a7-20020a056870a18700b0022101411ef0mr3446769oaf.53.1711642298504; Thu, 28 Mar
 2024 09:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240328154340.503623-1-daniel.mcgregor@vecima.com>
In-Reply-To: <20240328154340.503623-1-daniel.mcgregor@vecima.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2024 09:11:12 -0700
Message-ID: <CAMKF1sr9_08xAKaVjEFaraUZtUxcuCTowUj1yM0YKveSB0SkBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow using libc++
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Daniel McGregor <daniel.mcgregor@vecima.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197586

On Thu, Mar 28, 2024 at 8:43=E2=80=AFAM Dan McGregor <danismostlikely@gmail=
.com> wrote:
>
> With the addition of the C++ runtime setting added recently, allow
> gcc to use libc++ as its runtime. There's some minor fixes still
> required, such as allowing setting the unwinder library. But this
> allows for testing libc++ with gcc.
>
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/recipes-devtools/gcc/gcc-13.2.inc           | 6 ------
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
>  meta/recipes-devtools/gcc/gcc-cross.inc          | 1 +
>  meta/recipes-devtools/gcc/gcc-target.inc         | 1 +
>  4 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-13.2.inc
> index 603377a49a2..a19ceadeaae 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> @@ -109,11 +109,5 @@ EXTRA_OECONF_INITIAL =3D "\
>      --disable-libssp \
>  "
>
> -EXTRA_OECONF_PATHS =3D "\
> -    --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV} \
> -    --with-sysroot=3D/not/exist \
> -    --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> -"

this include is used by almost all of gcc based recipes including
runtime libraries
if we remove it here, then I guess they will be impacted in some way.
e.g. libgcc
Can you check what the effect is ?

> -
>  CVE_STATUS[CVE-2021-37322] =3D "cpe-incorrect: Is a binutils 2.26 issue,=
 not gcc"
>  CVE_STATUS[CVE-2023-4039] =3D "fixed-version: Fixed via CVE-2023-4039.pa=
tch included here. Set the status explictly to deal with all recipes that s=
hare the gcc-source"
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
> index ec87b462193..7c4233c2115 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -12,6 +12,7 @@ require gcc-configure-common.inc
>  EXTRA_OECONF +=3D "--with-plugin-ld=3Dld"
>  EXTRA_OECONF_PATHS =3D "\
>      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} =
\
> +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}/c++/v=
1 \
>      --with-build-time-tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TA=
RGET_SYS}/bin \
>      --with-sysroot=3D/not/exist \
>      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index a540fb2434a..5b0ca15d476 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -37,6 +37,7 @@ EXTRA_OECONF:remove:libc-newlib =3D "--enable-threads=
=3Dposix"
>
>  EXTRA_OECONF_PATHS =3D "\
>      --with-gxx-include-dir=3D/not/exist${target_includedir}/c++/${BINV} =
\
> +    --with-gxx-libcxx-include-dir=3D/not/exist${target_includedir}/c++/v=
1 \
>      --with-sysroot=3D/not/exist \
>      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
>  "
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index 7dac3ef422c..82da5ef82be 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -2,6 +2,7 @@ GCCMULTILIB =3D "--enable-multilib"
>  require gcc-configure-common.inc
>
>  EXTRA_OECONF_PATHS =3D "\
> +    --with-gxx-libcxx-include-dir=3D${target_includedir}/c++/v1 \
>      --with-build-sysroot=3D${STAGING_DIR_TARGET} \
>  "
>
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197582): https://lists.openembedded.org/g/openembedde=
d-core/message/197582
> Mute This Topic: https://lists.openembedded.org/mt/105199106/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

