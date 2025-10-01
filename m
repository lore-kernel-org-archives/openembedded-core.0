Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642D8CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:10:07 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web10.4312.1759342202648086443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 11:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X7wtypNY;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63604582e53so280681d50.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759342202; x=1759947002; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n6Iwcrec2g/XDZxyYNaLyQBgFOZPBwIXnfSXc/y2dM=;
        b=X7wtypNYESRqdbZsMOEXl6Er91SdZ/AVn5UEN3FhExKm8GzXx3vzXjB9PNNo7oaU0A
         au/Md2VWM+7vM5pH+wlSNSHebPKuvhWA/9oTWmwZHiy3h4TLrEtNEc6eHF/YDN8iC/1o
         c4Xzs9WuHyMe5OwBTmg990BjNLjrpN9RtZdIG0TAZyfJDIBR6BNKYDxrr0rK0NEqYtJm
         hBG13lsMBPABWkW85iwshvRncJ9Yr3eZ3YH1uqD6jvA0kK3kzI324tbhApzNPwbrHuL3
         Z5zrBCBEFJb4hnM4xgaaoi8V6jIo2MblegyZXWqokPOuLZQUU4avLoN2wnbr5ljLfme1
         3Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342202; x=1759947002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n6Iwcrec2g/XDZxyYNaLyQBgFOZPBwIXnfSXc/y2dM=;
        b=lr4KnjiPYiz0Zl2q5kd6vZj3YfKCmhswOeiCdRYP5QIHhcmaUR7gfrfpqRxY2uD4aY
         8xw5SNM+28ynkGdgaRllOaTDxApgJlEBbJTA+SnYey3rK/KllYSmKXpBifDZV7psaQzF
         GDsCHxZCboz/JcYEXXD5BAIJZCZYTjnHaJknJgTpfvPg577clWje4qB0wQwNwxC7lAYY
         lUNTKWTAIHEdGtGzG9HS4lKtacc5erje9HnKZbs3XtJgv96uIAI8oUtQG1fvg8FuDj23
         P0iHAPR1uKPnTCu3IyUQJe5H3lCsvvL7R3yaoJ399mJb7rNhzlc2KY5NnZgFafN61wJS
         LHeQ==
X-Gm-Message-State: AOJu0YyimaUk5sPYZaj/w/aTZZRRRm6ADcSFGflke7vQzzxoLZPDnCDV
	2CZgVvBPZuN4cZXVNuZPgIe5j0zj0J66CIBPJeCPb9DDyshNBxBGqs2OXXgGjRhahBdsJuh07Yn
	fEixitelun86Dnu6JowTALTvSAdX6Dm0fHHUe
X-Gm-Gg: ASbGncsLdQn8hohOAf3uXbgQt6HQy5ExreaqDRzAmasHvcnKBIlQ4xWx5UTgCK6DSzw
	Y7e2cX3bH5EeYz/Zpq4YUB2OQqcIqkB7mjQYZZMflqQZ1mfkHWzy7935fZFfxtsDYebS+YR0tMH
	FkVQAOTK/alowq9jGBlGiLsa3PQvVjcr+50xnBevIFHEzazqIplEzwErfdAL6xNzhcWIKla7mcd
	iQ2U2zz8gOCDWyRSJ3AkZa8B6LPQaqJoz5d8Z6GIKD970Otxl56E+9wQiAYClq+EPjIxfrScazQ
	xZX8e2QwC7UJ8I9uct+uh1XV2YEiQT6ejaPHj5q86loPByK6+NYAkMqUoq0aqOtkFtHwZUTTGGy
	4X0J287jBgsuS
X-Google-Smtp-Source: AGHT+IHuQPiD1fO21Zp+tCjNPY4RcZowG7MCE8dLmFPCpasOT4A2fY4Us3pIdkFYjCE+IG+XSfVcEdQzNj/4VE0eTa4=
X-Received: by 2002:a05:690e:1587:10b0:633:b9eb:85ff with SMTP id
 956f58d0204a3-63b6fea4f38mr6109242d50.12.1759342201527; Wed, 01 Oct 2025
 11:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251001175814.62654-1-jon.mason@arm.com>
In-Reply-To: <20251001175814.62654-1-jon.mason@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 11:09:35 -0700
X-Gm-Features: AS18NWD0XpljmwUTnGbMKU5GOMDGiIF-jW1RwhJVlF6ZT3dShExhJfT4qiRNmaQ
Message-ID: <CAMKF1spNLy87m4tKzxwctbj3MhmXiCp4-e7cNWdg2D+kzZ1wzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tunes/arm: add support for newer arm64 cores
To: jon.mason@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 18:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224318

On Wed, Oct 1, 2025 at 10:58=E2=80=AFAM Jon Mason via lists.openembedded.or=
g
<jon.mason=3Darm.com@lists.openembedded.org> wrote:
>
> Add tunes for cores that have been present since GCC 14.1.0.
> These have been present in meta-arm since mid-July, and have all been
> verified with fvp-base and testimage.  Of those present in meta-arm,
> arch-armv8-9a.inc, arch-armv9-4a.inc, and arch-armv9-5a.inc have been
> excluded from this commit, as there are currently issues compiling some
> packages (but still present in meta-arm for those that want to use them
> despite those issues).
>

I checked that these options are also available in clang 20+ as well. So
these changes are ok. It will be good to verify some builds with clang
as TOOLCHAIN
and see all holds

> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/conf/machine/include/arm/arch-armv8-7a.inc | 14 ++++++++++++++
>  meta/conf/machine/include/arm/arch-armv8-8a.inc | 14 ++++++++++++++
>  meta/conf/machine/include/arm/arch-armv9-1a.inc | 13 +++++++++++++
>  meta/conf/machine/include/arm/arch-armv9-2a.inc | 13 +++++++++++++
>  meta/conf/machine/include/arm/arch-armv9-3a.inc | 13 +++++++++++++
>  5 files changed, 67 insertions(+)
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8-7a.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv8-8a.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv9-1a.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv9-2a.inc
>  create mode 100644 meta/conf/machine/include/arm/arch-armv9-3a.inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8-7a.inc b/meta/conf/=
machine/include/arm/arch-armv8-7a.inc
> new file mode 100644
> index 000000000000..6039baca3568
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8-7a.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?=3D "armv8-7a"
> +
> +TUNEVALID[armv8-7a] =3D "Enable instructions for ARMv8.7-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a'=
, ' -march=3Darmv8.7-a', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-7a',=
 'armv8-7a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv8-7a"
> +ARMPKGARCH:tune-armv8-7a                    ?=3D "armv8-7a"
> +TUNE_FEATURES:tune-armv8-7a                  =3D "aarch64 armv8-7a"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-7a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-7a"
> +BASE_LIB:tune-armv8-7a                       =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv8-8a.inc b/meta/conf/=
machine/include/arm/arch-armv8-8a.inc
> new file mode 100644
> index 000000000000..5694330a1d22
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8-8a.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?=3D "armv8-8a"
> +
> +TUNEVALID[armv8-8a] =3D "Enable instructions for ARMv8.8-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a'=
, ' -march=3Darmv8.8-a', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-8a',=
 'armv8-8a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv8-8a"
> +ARMPKGARCH:tune-armv8-8a                    ?=3D "armv8-8a"
> +TUNE_FEATURES:tune-armv8-8a                  =3D "aarch64 armv8-8a"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-8a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-8a"
> +BASE_LIB:tune-armv8-8a                       =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv9-1a.inc b/meta/conf/=
machine/include/arm/arch-armv9-1a.inc
> new file mode 100644
> index 000000000000..f9e6dce77c82
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv9-1a.inc
> @@ -0,0 +1,13 @@
> +DEFAULTTUNE ?=3D "armv9-1a"
> +
> +TUNEVALID[armv9-1a] =3D "Enable instructions for ARMv9.1-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a'=
, ' -march=3Darmv9.1-a', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-1a',=
 'armv9-1a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                  +=3D "armv9-1a"
> +ARMPKGARCH:tune-armv9-1a                    ?=3D "armv9-1a"
> +TUNE_FEATURES:tune-armv9-1a                  =3D "aarch64 armv9-1a"
> +PACKAGE_EXTRA_ARCHS:tune-armv9-1a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-1a"
> +BASE_LIB:tune-armv9-1a                       =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv9-2a.inc b/meta/conf/=
machine/include/arm/arch-armv9-2a.inc
> new file mode 100644
> index 000000000000..4b5cf3ed156a
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv9-2a.inc
> @@ -0,0 +1,13 @@
> +DEFAULTTUNE ?=3D "armv9-2a"
> +
> +TUNEVALID[armv9-2a] =3D "Enable instructions for ARMv9.2-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a'=
, ' -march=3Darmv9.2-a', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-2a',=
 'armv9-2a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                  +=3D "armv9-2a"
> +ARMPKGARCH:tune-armv9-2a                    ?=3D "armv9-2a"
> +TUNE_FEATURES:tune-armv9-2a                  =3D "aarch64 armv9-2a"
> +PACKAGE_EXTRA_ARCHS:tune-armv9-2a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-2a"
> +BASE_LIB:tune-armv9-2a                       =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv9-3a.inc b/meta/conf/=
machine/include/arm/arch-armv9-3a.inc
> new file mode 100644
> index 000000000000..c345f1532c48
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv9-3a.inc
> @@ -0,0 +1,13 @@
> +DEFAULTTUNE ?=3D "armv9-3a"
> +
> +TUNEVALID[armv9-3a] =3D "Enable instructions for ARMv9.3-a"
> +TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a'=
, ' -march=3Darmv9.3-a', '', d)}"
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv9-3a',=
 'armv9-3a:', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv9a.inc
> +
> +AVAILTUNES                                  +=3D "armv9-3a"
> +ARMPKGARCH:tune-armv9-3a                    ?=3D "armv9-3a"
> +TUNE_FEATURES:tune-armv9-3a                  =3D "aarch64 armv9-3a"
> +PACKAGE_EXTRA_ARCHS:tune-armv9-3a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv9a} armv9-3a"
> +BASE_LIB:tune-armv9-3a                       =3D "lib64"
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224317): https://lists.openembedded.org/g/openembedde=
d-core/message/224317
> Mute This Topic: https://lists.openembedded.org/mt/115538599/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

