Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AC3C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 01:42:00 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.39106.1752716516334723844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 18:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KPr5arWN;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8bacc192e0so474704276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752716515; x=1753321315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OO3XPsGXXPy4lnyrZzVNjBa8TEWXL5qqqIwJPYA5jvc=;
        b=KPr5arWN3u2g0UMxST/V5jaF4PNbNMmD3LOzjNVo6HW9rPxnRgdGsegCpfHe6yot7n
         3D8tRDgmST/dxti73UWLSrZ4jn6Z5kxs5PsRnBCNff8zO38CFtC4cG0GBfHCkH5F/AEl
         uxletkQIfUQFtjkPkn2kUqboNEoN5lOmriKrSOJXFi7n7Rv+3W1W5i5jsp2PlYmAM/iH
         ENx0Hqe3UR11h+D9q1t39wtSfu0QgG7Urt0qPL84kGbXJZ/myva9Qh2DWkD512aQDeWr
         NUikfEo6ZlhpW2qS9d4re0ffuMXShTEZlaGfw9njlJZvwNkImRgWw511f/qNgdzO4ovw
         LinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752716515; x=1753321315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OO3XPsGXXPy4lnyrZzVNjBa8TEWXL5qqqIwJPYA5jvc=;
        b=HYVsWL+prERHPcFFsqPusTV9UT98wGmti4nR5dTPKPRktHIm8snsvBTXBWChXgq6y2
         66wDEWnZZULxLyUswFjnXMEdhVsPyLxSOTC04BvK6wZt2kFYPtPMOi0tKIJEu78bnDox
         dgsAnOmbiGNSlUuNfRbkvmv1+0TzYBTPrMlVuNiu8B+tLG8lUChH5+E/MXQsC3OLb5XK
         JOB9tsHd2ivnwPp9SLEi94XO/vDxIEwccrNQ4rt5Zgt1fNOiWawt18gKQ3H+Jh4TsDWE
         Q1ljcaHRb+LccBHEQhhJHRpvgtzQUycvoCXuU1rD3Y28B/0oMjkotM6pau8+G7F/1MnZ
         bD5Q==
X-Gm-Message-State: AOJu0Yzqno13I5XXg+pkxF9W3f8T5jksBtqdyeNof+ogNuMPEAAkuP0i
	NAkiqIKmMqz5SKgWWQwoaSzWcTWpyxkA+XmoMQb8IWWm1BIU33NZpHIiuglbEH9/e8JcElqVUq7
	vF/h13dUH8ZfZxsMFOZ0/5rjwiS5xEKwg7PXv
X-Gm-Gg: ASbGncsXQ7KTEu2hwOB/BspWOOmZ4D8x+eFRa2AmFO5yjKH2cPVDEWctaSEOjfjiA5Q
	1C75eOq6PDgKuvhyofIQei183RXMf1MNSy+M5PJ8Eq6aM4e8riyW7KlGI1nAm3/prXVpN0Ldhrw
	iCN4C3v3dREuLzAUVBWDFFjG55JeZyOS2XldX30LwNF2eR1eKq8KWpN5zozx2KO412aeCfcgzYc
	5CPcA==
X-Google-Smtp-Source: AGHT+IGG0UH6MfStTi0fnbtPHLownl8TewECa1IZ7PGqLKx1WwljklqA3p8Twy3qaSSOaTts1JUoYcMZ9lkm2HPJ7Tc=
X-Received: by 2002:a05:690c:3747:b0:717:af29:865f with SMTP id
 00721157ae682-7183747155cmr77158257b3.28.1752716515141; Wed, 16 Jul 2025
 18:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250716184002.2334552-1-skandigraun@gmail.com>
In-Reply-To: <20250716184002.2334552-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 18:41:29 -0700
X-Gm-Features: Ac12FXxXQT34WsRG1mpuS8oq5y2N1hUvx6LPjbxNDJ2exMopNZwBuDQHGNKnDdI
Message-ID: <CAMKF1spbYdVnLySweefLdwPB05rAbkHmgG4Q+OyGRw=X-=1NTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] tunes: set valid clang tune for big.LITTLE
 Arm SoCs
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220483

On Wed, Jul 16, 2025 at 11:40=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> clang doesn't have Arm big.LITTLE specific tune options - when such an op=
tion is used,
> the compilation fails with an error like this:
>
> aarch64-poky-linux-clang: error: unsupported argument 'cortex-a72.cortex-=
a53+crc+crypto' to option '-mcpu=3D'
>
> To avoid this, in case a big.LITTLE SoC is the target and the toolchain i=
s clang, select
> the tune corresponding to the LITTLE core.
>

Looks good to me.

> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/220467
> v2: Instead of manipulating these arguments in one place, in clang.bbclas=
s,
>     make these changes in the affected machine configs.
>
>  .../include/arm/armv8-2a/tune-cortexa75-cortexa55.inc       | 6 +++++-
>  .../include/arm/armv8-2a/tune-cortexa76-cortexa55.inc       | 6 +++++-
>  .../machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc | 6 +++++-
>  .../machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc | 6 +++++-
>  .../machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc | 6 +++++-
>  .../machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc | 6 +++++-
>  6 files changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortex=
a55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.i=
nc
> index e18b2cb6e0..6b9b541f9a 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> @@ -5,7 +5,11 @@ DEFAULTTUNE                                        ?=3D =
"cortexa75-cortexa55"
>
>  TUNEVALID[cortexa75-cortexa55] =3D "Enable big.LITTLE Cortex-A75.Cortex-=
A55 specific processor optimizations"
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-=
cortexa55", "cortexa75-cortexa55:", "", d)}"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-corte=
xa55", " -mcpu=3Dcortex-a75.cortex-a55", "", d)}"
> +
> +CPU_TUNE_ARG =3D "cortex-a75.cortex-a55"
> +# clang doesn't support big.LITTLE tunes, select the LITTLE tune
> +CPU_TUNE_ARG:toolchain-clang =3D "cortex-a55"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-corte=
xa55", " -mcpu=3D${CPU_TUNE_ARG}", "", d)}"
>
>  require conf/machine/include/arm/arch-armv8-2a.inc
>
> diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortex=
a55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.i=
nc
> index 7daf9d91a8..8195782cd9 100644
> --- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> +++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> @@ -5,7 +5,11 @@ DEFAULTTUNE                                        ?=3D =
"cortexa76-cortexa55"
>
>  TUNEVALID[cortexa76-cortexa55] =3D "Enable big.LITTLE Cortex-A76.Cortex-=
A55 specific processor optimizations"
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-=
cortexa55", "cortexa76-cortexa55:", "", d)}"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-corte=
xa55", " -mcpu=3Dcortex-a76.cortex-a55", "", d)}"
> +
> +CPU_TUNE_ARG =3D "cortex-a76.cortex-a55"
> +# clang doesn't support big.LITTLE tunes, select the LITTLE tune
> +CPU_TUNE_ARG:toolchain-clang =3D "cortex-a55"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-corte=
xa55", " -mcpu=3D${CPU_TUNE_ARG}", "", d)}"
>
>  require conf/machine/include/arm/arch-armv8-2a.inc
>
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa5=
3.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> index 052d1173c9..ee86c1c84b 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> @@ -1,7 +1,11 @@
>  DEFAULTTUNE ?=3D "cortexa57-cortexa53"
>
>  TUNEVALID[cortexa57-cortexa53] =3D "Enable big.LITTLE Cortex-A57.Cortex-=
A53 specific processor optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-corte=
xa53", " -mcpu=3Dcortex-a57.cortex-a53", "", d)}"
> +
> +CPU_TUNE_ARG =3D "cortex-a57.cortex-a53"
> +# clang doesn't support big.LITTLE tunes, select the LITTLE tune
> +CPU_TUNE_ARG:toolchain-clang =3D "cortex-a53"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-corte=
xa53", " -mcpu=3D${CPU_TUNE_ARG}", "", d)}"
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-=
cortexa53", "cortexa57-cortexa53:", "", d)}"
>
>  require conf/machine/include/arm/arch-armv8a.inc
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa5=
3.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> index ff188aec5f..ba92161b9f 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> @@ -1,7 +1,11 @@
>  DEFAULTTUNE ?=3D "cortexa72-cortexa53"
>
>  TUNEVALID[cortexa72-cortexa53] =3D "Enable big.LITTLE Cortex-A72.Cortex-=
A53 specific processor optimizations"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-corte=
xa53", " -mcpu=3Dcortex-a72.cortex-a53", "", d)}"
> +
> +CPU_TUNE_ARG =3D "cortex-a72.cortex-a53"
> +# clang doesn't support big.LITTLE tunes, select the LITTLE tune
> +CPU_TUNE_ARG:toolchain-clang =3D "cortex-a53"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-corte=
xa53", " -mcpu=3D${CPU_TUNE_ARG}", "", d)}"
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-=
cortexa53", "cortexa72-cortexa53:", "", d)}"
>
>  require conf/machine/include/arm/arch-armv8a.inc
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa3=
5.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> index 4f4f25f511..370882f299 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> @@ -5,7 +5,11 @@ DEFAULTTUNE ?=3D "cortexa73-cortexa35"
>
>  TUNEVALID[cortexa73-cortexa35] =3D "Enable big.LITTLE Cortex-A73.Cortex-=
A35 specific processor optimizations"
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-=
cortexa35", "cortexa73-cortexa35:", "", d)}"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-corte=
xa35", " -mcpu=3Dcortex-a73.cortex-a35", "", d)}"
> +
> +CPU_TUNE_ARG =3D "cortex-a73.cortex-a35"
> +# clang doesn't support big.LITTLE tunes, select the LITTLE tune
> +CPU_TUNE_ARG:toolchain-clang =3D "cortex-a35"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-corte=
xa35", " -mcpu=3D${CPU_TUNE_ARG}", "", d)}"
>
>  require conf/machine/include/arm/arch-armv8a.inc
>
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa5=
3.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> index 1d152ed83b..388df5fb66 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> @@ -2,7 +2,11 @@ DEFAULTTUNE ?=3D "cortexa73-cortexa53"
>
>  TUNEVALID[cortexa73-cortexa53] =3D "Enable big.LITTLE Cortex-A73.Cortex-=
A53 specific processor optimizations"
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-=
cortexa53", "cortexa73-cortexa53:", "", d)}"
> -TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-corte=
xa53", " -mcpu=3Dcortex-a73.cortex-a53", "", d)}"
> +
> +CPU_TUNE_ARG =3D "cortex-a73.cortex-a53"
> +# clang doesn't support big.LITTLE tunes, select the LITTLE tune
> +CPU_TUNE_ARG:toolchain-clang =3D "cortex-a53"
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-corte=
xa53", " -mcpu=3D${CPU_TUNE_ARG}", "", d)}"
>
>  require conf/machine/include/arm/arch-armv8a.inc
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220473): https://lists.openembedded.org/g/openembedde=
d-core/message/220473
> Mute This Topic: https://lists.openembedded.org/mt/114190363/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

