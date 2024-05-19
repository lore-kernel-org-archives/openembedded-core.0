Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22753C25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 06:37:47 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.34633.1716100657105814538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 23:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QA8d5CPo;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-23d477a1a4fso1612881fac.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 23:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716100656; x=1716705456; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3YcyKhavUyDnCTGBYKuXlW+hvqxH82sP4qKMNWh+cU=;
        b=QA8d5CPoMzeRWsM1VgMZjZ6RKKXZz9P+VMST6joS9NcUiGYmazQIJ5s6KeEehJbAsd
         4dyz/D0n3RNEiL89/eSDrrnbsGSdwP4nWo6f9cvtyU6Sf9q9xNfsDC4JKXWjXiy2Gedh
         +LPqQdxg8pACDswxocDhiMgP8Im4ejq5DvWDlSJNzT3IPFBSWKVU/81TkQxOhgLL+vnP
         /u+cc5YzRK8z8z7YgF16OgWYM7PNKfGPtqwBHXJoTarSxxtaTjPt1SpJfF07l2DaEVns
         AhfbYmyILj5DZI5MoMQsSD6v6HZRw6xsgHN24povnqM4vDNsUBspBydLQLXScY95M9Oy
         ql9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716100656; x=1716705456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3YcyKhavUyDnCTGBYKuXlW+hvqxH82sP4qKMNWh+cU=;
        b=CFxQnvTvbrmTD/fJTVgqVjuUkQmaFRek1IvnqRIrVXrt+DRy9LR7VEehKfOeagY4oA
         ZmJbILoptGbTfeoWzscZGw9ETutKiUAvmG14Yufq6Uxolb9wAvf0rYT4eIMF/OQT9X+b
         eZgo2oUZk9TBjwy9qR0igE6RRRSp6Ud62M4VLHVlK9lD7G9TDqUYc2Dr/ZI3NQ7czvf8
         XgrEk8tdYbq5JgCoqEFoFcOHj5hTq1pF0Nj5uRy/2eksnifU+OcnUFDH9nUzLSYEplNh
         vx++xrr+ASWKAdwpQfHGRS/vz4fe8i0ekcwF886RdpB+vjhYOYUE8YEE51+A6IoLSIWL
         rWUw==
X-Gm-Message-State: AOJu0YxDU3SRDtC/FGnYm9PUt4bsTyvwDDG1p7k2VBPHOUblMy3TlyYd
	yPuSyldfFhzxBOezTF3NrH8R7+TTU82HyBQB1E/kcuYY9u/krd/vSIOXRkYOEvJ5idfxaMz21wx
	8PS8QiaymsIigpRl2yunIbGBJiqg=
X-Google-Smtp-Source: AGHT+IEf9PbRVcqSiIZUsKfFK5OjnDZ0krc3xayo0Hf0FlqmiaFM7AGojwYLpUPT9+JqiGm3CoNZHQ33Gxp91cYBd7I=
X-Received: by 2002:a05:6870:8dc9:b0:23b:ed9:1f53 with SMTP id
 586e51a60fabf-24172fd265fmr35781032fac.53.1716100654922; Sat, 18 May 2024
 23:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240519055050.2331637-1-alejandro@enedino.org>
In-Reply-To: <20240519055050.2331637-1-alejandro@enedino.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 May 2024 23:37:08 -0700
Message-ID: <CAMKF1spZk=ObXUyWaFk26inN25Pdwi71fuL55RdAOpw_GmHNjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] newlib: Use mcmodel=medany for RISCV64
To: alejandro@enedino.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 06:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199548

On Sat, May 18, 2024 at 10:48=E2=80=AFPM Alejandro Hernandez Samaniego via
lists.openembedded.org <alejandro=3Denedino.org@lists.openembedded.org>
wrote:
>
> It was previously discovered that mcmodel=3Dmedany should be used for RIS=
CV64,
> however this was only being set for the applications themselves, but not =
for
> newlib, this meant that we ended up with C library that used a code model=
 and
> an application that used another one which is not something we want.
>
> Pass mcmodel=3Dmedany when building newlib for RISCV64 as well.
>
> Also, s/CFLAGS/TARGET_CFLAGS to standarize across recipes, the variable
> expansion provides no functional difference at this point.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
> ---
>  meta/classes-recipe/baremetal-image.bbclass | 2 +-
>  meta/recipes-core/newlib/newlib.inc         | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
> index b9a584351a..4e7d413626 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -103,7 +103,7 @@ QB_OPT_APPEND:append:qemuriscv32 =3D " -bios none"
>  # since medlow can only access addresses below 0x80000000 and RAM
>  # starts at 0x80000000 on RISC-V 64
>  # Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB)
> -CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
>
>
>  ## Emulate image.bbclass
> diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
> index 6113f5e831..34b0f3f747 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -28,6 +28,14 @@ B =3D "${WORKDIR}/build"
>  ## disable stdlib
>  TARGET_CC_ARCH:append =3D " -nostdlib"
>
> +# Both the C library and the application should share the same mcmodel.
> +# Use the medium-any code model for the RISC-V 64 bit implementation,
> +# since medlow can only access addresses below 0x80000000 and RAM
> +# starts at 0x80000000 on RISC-V 64
> +# Keep RISC-V 32 using -mcmodel=3Dmedlow (symbols lie between -2GB:2GB)
> +TARGET_CFLAGS:append:qemuriscv64 =3D " -mcmodel=3Dmedany"
> +
> +


medany can be slow, and medlow is default on RISCV so I wonder if the
ram address
you are mentioning is so on all RV64 baremetal apps using newlib or is
it specific to
the hardware you are testing.

>  EXTRA_OECONF =3D " \
>                  --build=3D${BUILD_SYS}  \
>                  --target=3D${TARGET_SYS} \
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199544): https://lists.openembedded.org/g/openembedde=
d-core/message/199544
> Mute This Topic: https://lists.openembedded.org/mt/106182788/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

