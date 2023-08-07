Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B6FC04FDF
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 12:01:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.32633.1691409661713426391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 05:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Spb3O3YH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe4b95c371so15779475e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691409660; x=1692014460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ6GKDWzuaNmIByUcvgmhiA7zCxp2Z2mOKijuj5n9pI=;
        b=Spb3O3YHYbgmR2QvLivrgW2OreM4uu1O66LhNW+iGR6G6U7/vXt4q4boeM4RU8rGQq
         jMFZ0Upioz11E2kgxlG+bBbMVFSlUDGBzl4ro13CHcjGqGXUTxtxek/ZI9igUbIQ8mo7
         gF/GfGHipsvHwKs/nuQKX4d+unM2eFFfQJT8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691409660; x=1692014460;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WQ6GKDWzuaNmIByUcvgmhiA7zCxp2Z2mOKijuj5n9pI=;
        b=kLvoLNpMd5h1uUuFiqjQCEBe8TtUVdVauq4LsJoMPQw/5Svza8fsp06FSpjxfz7U6J
         TkcX0C5XjLx5u5X57ZPFOi9Pi0THKiEmjmQnVeh+HZfIW/U6PzJwSfdrvpNJg6f8QYRt
         WkZRlWllvUIBXkN6d5BHVhQVSoZzo4XDXmtpPm7aKZte9UvRIR5z5r5/tgLVvNtfk/gk
         IRjdDsjENT1/a8F78S1f3w6d8orNzjbbQEYIoBOZAua8IrCh79CxtK2vezEQGAByLYXc
         5YTdQ3TczaPO2WhqacUFmVxAzuj1EHUSpj6XMjYHVxReItl/prqkRCfI+QwQAKDX9SYq
         8/GQ==
X-Gm-Message-State: AOJu0Yw/kdJfe/0fWnqFB7qc2WH1aWMezLPebJhyLjM9APYdYEiCNlHQ
	E7oazKYc3U2CjwurnWGeHMToDQ==
X-Google-Smtp-Source: AGHT+IGhVcHtvT8W1YH5T8UXqEWAn9/M7ySB0iLpDuWv0Khf123LSAtGklTEp2C0ljnufn2G2CMaDQ==
X-Received: by 2002:a7b:c8c4:0:b0:3fe:1c57:3be with SMTP id f4-20020a7bc8c4000000b003fe1c5703bemr5528365wml.8.1691409660107;
        Mon, 07 Aug 2023 05:01:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5? ([2001:8b0:aba:5f3c:ea0f:cf41:6751:30d5])
        by smtp.gmail.com with ESMTPSA id u3-20020adfed43000000b0031759e6b43fsm10355746wro.39.2023.08.07.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 05:00:59 -0700 (PDT)
Message-ID: <c27d2a4ca1728935daa9c828e14523e9acc8bc2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/6] arch-armv8,arch-armv9: Add sve based
 tune options
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
  Jon Mason <Jon.Mason@arm.com>
Date: Mon, 07 Aug 2023 13:00:58 +0100
In-Reply-To: <20230804170255.2784609-2-raj.khem@gmail.com>
References: <20230804170255.2784609-1-raj.khem@gmail.com>
	 <20230804170255.2784609-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 12:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185595

On Fri, 2023-08-04 at 10:02 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebased
>=20
>  meta/conf/machine/include/arm/arch-armv8-2a.inc | 7 ++++++-
>  meta/conf/machine/include/arm/arch-armv8-4a.inc | 7 ++++++-
>  meta/conf/machine/include/arm/arch-armv8-5a.inc | 7 ++++++-
>  meta/conf/machine/include/arm/arch-armv9a.inc   | 7 ++++++-
>  4 files changed, 24 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/=
machine/include/arm/arch-armv8-2a.inc
> index 95368b0af79..6f31e26e34f 100644
> --- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> @@ -6,14 +6,19 @@ TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEAT=
URES', 'armv8-2a', ' -march
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a',=
 'armv8-2a:', '', d)}"
> =20
>  require conf/machine/include/arm/arch-armv8a.inc
> +require conf/machine/include/arm/feature-arm-sve.inc
> =20
>  # Little Endian base configs
> -AVAILTUNES +=3D "armv8-2a armv8-2a-crypto"
> +AVAILTUNES +=3D "armv8-2a armv8-2a-crypto armv8-2a-crypto-sve"
>  ARMPKGARCH:tune-armv8-2a                    ?=3D "armv8-2a"
>  ARMPKGARCH:tune-armv8-2a-crypto             ?=3D "armv8-2a"
> +ARMPKGARCH:tune-armv8-2a-crypto-sve         ?=3D "armv8-2a"
>  TUNE_FEATURES:tune-armv8-2a                  =3D "aarch64 armv8-2a"
>  TUNE_FEATURES:tune-armv8-2a-crypto           =3D "${TUNE_FEATURES:tune-a=
rmv8-2a} crypto"
> +TUNE_FEATURES:tune-armv8-2a-crypto-sve       =3D "${TUNE_FEATURES:tune-a=
rmv8-2a-crypto} sve"
>  PACKAGE_EXTRA_ARCHS:tune-armv8-2a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-2a"
>  PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-2a} armv8-2a-crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-2a-crypto-sve =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-2a-crypto} armv8-2a-crypto-sve"
>  BASE_LIB:tune-armv8-2a                       =3D "lib64"
>  BASE_LIB:tune-armv8-2a-crypto                =3D "lib64"
> +BASE_LIB:tune-armv8-2a-crypto-sve            =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv8-4a.inc b/meta/conf/=
machine/include/arm/arch-armv8-4a.inc
> index 29feddb64c5..b61d50daa5e 100644
> --- a/meta/conf/machine/include/arm/arch-armv8-4a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8-4a.inc
> @@ -6,14 +6,19 @@ TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEAT=
URES', 'armv8-4a', ' -march
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a',=
 'armv8-4a:', '', d)}"
> =20
>  require conf/machine/include/arm/arch-armv8a.inc
> +require conf/machine/include/arm/feature-arm-sve.inc
> =20
>  # Little Endian base configs
> -AVAILTUNES +=3D "armv8-4a armv8-4a-crypto"
> +AVAILTUNES +=3D "armv8-4a armv8-4a-crypto armv8-4a-crypto-sve"
>  ARMPKGARCH:tune-armv8-4a                    ?=3D "armv8-4a"
>  ARMPKGARCH:tune-armv8-4a-crypto             ?=3D "armv8-4a"
> +ARMPKGARCH:tune-armv8-4a-crypto-sve         ?=3D "armv8-4a"
>  TUNE_FEATURES:tune-armv8-4a                  =3D "aarch64 armv8-4a"
>  TUNE_FEATURES:tune-armv8-4a-crypto           =3D "${TUNE_FEATURES:tune-a=
rmv8-4a} crypto"
> +TUNE_FEATURES:tune-armv8-4a-crypto-sve       =3D "${TUNE_FEATURES:tune-a=
rmv8-4a-crypto} sve"
>  PACKAGE_EXTRA_ARCHS:tune-armv8-4a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-4a"
>  PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-4a} armv8-4a-crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-4a-crypto-sve =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-4a-crypto} armv8-4a-crypto-sve"
>  BASE_LIB:tune-armv8-4a                       =3D "lib64"
>  BASE_LIB:tune-armv8-4a-crypto                =3D "lib64"
> +BASE_LIB:tune-armv8-4a-crypto-sve            =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv8-5a.inc b/meta/conf/=
machine/include/arm/arch-armv8-5a.inc
> index a1bcb7fb9a1..176bc9033c9 100644
> --- a/meta/conf/machine/include/arm/arch-armv8-5a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8-5a.inc
> @@ -6,14 +6,19 @@ TUNE_CCARGS_MARCH .=3D "${@bb.utils.contains('TUNE_FEAT=
URES', 'armv8-5a', ' -march
>  MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-5a',=
 'armv8-5a:', '', d)}"
> =20
>  require conf/machine/include/arm/arch-armv8a.inc
> +require conf/machine/include/arm/feature-arm-sve.inc
> =20
>  # Little Endian base configs
> -AVAILTUNES +=3D "armv8-5a armv8-5a-crypto"
> +AVAILTUNES +=3D "armv8-5a armv8-5a-crypto armv8-5a-crypto-sve"
>  ARMPKGARCH:tune-armv8-5a                    ?=3D "armv8-5a"
>  ARMPKGARCH:tune-armv8-5a-crypto             ?=3D "armv8-5a"
> +ARMPKGARCH:tune-armv8-5a-crypto-sve         ?=3D "armv8-5a"
>  TUNE_FEATURES:tune-armv8-5a                  =3D "aarch64 armv8-5a"
>  TUNE_FEATURES:tune-armv8-5a-crypto           =3D "${TUNE_FEATURES:tune-a=
rmv8-5a} crypto"
> +TUNE_FEATURES:tune-armv8-5a-crypto-sve       =3D "${TUNE_FEATURES:tune-a=
rmv8-5a-crypto} sve"
>  PACKAGE_EXTRA_ARCHS:tune-armv8-5a            =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8a} armv8-5a"
>  PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-5a} armv8-5a-crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto-sve =3D "${PACKAGE_EXTRA_ARCHS:=
tune-armv8-5a-crypto} armv8-5a-crypto-sve"
>  BASE_LIB:tune-armv8-5a                       =3D "lib64"
>  BASE_LIB:tune-armv8-5a-crypto                =3D "lib64"
> +BASE_LIB:tune-armv8-5a-crypto-sve            =3D "lib64"
> diff --git a/meta/conf/machine/include/arm/arch-armv9a.inc b/meta/conf/ma=
chine/include/arm/arch-armv9a.inc
> index c38d6cfdf60..6945dea333b 100644
> --- a/meta/conf/machine/include/arm/arch-armv9a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv9a.inc
> @@ -7,22 +7,27 @@ MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATU=
RES', 'armv9a', 'armv9a:',
>  require conf/machine/include/arm/arch-arm64.inc
>  require conf/machine/include/arm/feature-arm-crc.inc
>  require conf/machine/include/arm/feature-arm-crypto.inc
> +require conf/machine/include/arm/feature-arm-sve.inc
> =20
>  # Little Endian base configs
> -AVAILTUNES +=3D "armv9a armv9a-crc armv9a-crc-crypto armv9a-crypto"
> +AVAILTUNES +=3D "armv9a armv9a-crc armv9a-crc-crypto armv9a-crc-crypto-s=
ve armv9a-crypto"
>  ARMPKGARCH:tune-armv9a                    ?=3D "armv9a"
>  ARMPKGARCH:tune-armv9a-crc                ?=3D "armv9a"
>  ARMPKGARCH:tune-armv9a-crypto             ?=3D "armv9a"
>  ARMPKGARCH:tune-armv9a-crc-crypto         ?=3D "armv9a"
> +ARMPKGARCH:tune-armv9a-crc-crypto-sve     ?=3D "armv9a"
>  TUNE_FEATURES:tune-armv9a                  =3D "aarch64 armv9a"
>  TUNE_FEATURES:tune-armv9a-crc              =3D "${TUNE_FEATURES:tune-arm=
v9a} crc"
>  TUNE_FEATURES:tune-armv9a-crypto           =3D "${TUNE_FEATURES:tune-arm=
v9a} crypto"
>  TUNE_FEATURES:tune-armv9a-crc-crypto       =3D "${TUNE_FEATURES:tune-arm=
v9a-crc} crypto"
> +TUNE_FEATURES:tune-armv9a-crc-crypto-sve   =3D "${TUNE_FEATURES:tune-arm=
v9a-crc-crypto} sve"
>  PACKAGE_EXTRA_ARCHS:tune-armv9a            =3D "aarch64 armv9a"
>  PACKAGE_EXTRA_ARCHS:tune-armv9a-crc        =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-armv9a} armv9a-crc"
>  PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto     =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-armv9a} armv9a-crypto"
>  PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto =3D "${PACKAGE_EXTRA_ARCHS:tu=
ne-armv9a-crc} armv9a-crypto armv9a-crc-crypto"
> +PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto-sve =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv9a-crc-crypto} armv9a-crc-crypto-sve"
>  BASE_LIB:tune-armv9a                       =3D "lib64"
>  BASE_LIB:tune-armv9a-crc                   =3D "lib64"
>  BASE_LIB:tune-armv9a-crypto                =3D "lib64"
>  BASE_LIB:tune-armv9a-crc-crypto            =3D "lib64"
> +BASE_LIB:tune-armv9a-crc-crypto-sve        =3D "lib64"

I had a look at:

https://marcin.juszkiewicz.com.pl/download/tables/arm-socs.html

which suggests that there are 7 processors that support sve and of
those, only one doesn't support crypto (assuming that is aes).

Of those I can see v8.4 and v9 versions that have it but no 8.2 or 8.5.

Perhaps we should just add this for those two for now until someone has
a real world cpu with the other combinations?

I'd also note that there are few cpus without the crc extension which
would probably let us simplify there if we correlate with the actual
hardware that exists?

Cheers,

Richard



