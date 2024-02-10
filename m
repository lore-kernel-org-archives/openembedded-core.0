Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE1BC48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 14:38:22 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.14627.1707575898029004007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 06:38:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EBSfFVsw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5116b540163so2741910e87.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707575896; x=1708180696; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LHASwtVpPMPbssca4O1Dpri9LdgnVYYP1VC2zEyyVA=;
        b=EBSfFVswJAyrMz7IEAwO73RmqkxNj+6W2Xr0EObrddd9eSWsttGwJlt9ThX60iP4vd
         13x/jwTJbFD2JioNnsn8mJok538QhzKucASnE9I3NO/iEFq2cFtF6LjRJE+LD8K+KCMO
         Mh25hlVz/GUOjHMQyywJNdP2FBpQQe7i7hN+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707575896; x=1708180696;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1LHASwtVpPMPbssca4O1Dpri9LdgnVYYP1VC2zEyyVA=;
        b=HHNS+EEOf7QkDW8AJu8EOt4RtHPxRfOX5cuMKs8RRbVlPTQRjwc/eFdhygzZlodmNA
         VTmNuwGr0FjeKBlZfD3eEyeonXBFaq1rehKHKkS9n4my3sjm7ebi9TPdt7rn3ysni510
         LffJOY+XnS1jaP9o4FlXP/So056kYcm4oyrn6kvZOZIBQLTWnafJWlVpk4z5vKFGQvu3
         T/wRmyjwgOMUt+zGqgQUieN68GJAV7AtN1zlk9D4EUOf4iFseEVIq/XTMA5fEWwieMYx
         Sn9hanWcGZ7bfnPXm9vtT/dslIboi7HlnLRPZ7UjE62hXkuEHbbhy1UUBldTXh+CH0G4
         O2Zg==
X-Gm-Message-State: AOJu0Yz0e6Tpb1UkZ6JxNTBui99oTpwIRbRWnAbzjkipR3Zyqhv67SIF
	I9e9/97vQ7rU7RdMEQ/8jkTAnmC56jMhu1C+TmDOMxzh7pLjUR3azZyRbwCyxxk=
X-Google-Smtp-Source: AGHT+IEOb64QSO3tUJf2AUcc1DwxgL2yhCp1oXPdFQ62tR34kuscfJyNVvp2Gus87ubYsRHxFTerdQ==
X-Received: by 2002:a05:6512:3b28:b0:511:3a20:e116 with SMTP id f40-20020a0565123b2800b005113a20e116mr1749033lfv.11.1707575895616;
        Sat, 10 Feb 2024 06:38:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUts5Nhhf7m8qslg9UkSncOHOHVtCmcSuy8DUcz6Cb2LBB9e2UX1LHlQVtTd8FC8Zv9X64tDwfvQ2VJr5tF83eXN2ngC1hKjFA6VZia2q7UmpTktRV4ZTi
Received: from ?IPv6:2001:8b0:aba:5f3c:c350:b3c8:3bca:cef1? ([2001:8b0:aba:5f3c:c350:b3c8:3bca:cef1])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d4ac4000000b0033b43d7394bsm1993792wrs.55.2024.02.10.06.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 06:38:15 -0800 (PST)
Message-ID: <2168122ec19bface339bdb7d414f53d347fd9607.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual-" in RPROVIDES and
 RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 10 Feb 2024 14:38:14 +0000
In-Reply-To: <20240210113612.525615-1-simone.p.weiss@posteo.com>
References: <20240210113612.525615-1-simone.p.weiss@posteo.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 14:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195275

On Sat, 2024-02-10 at 11:36 +0000, Simone Wei=C3=9F wrote:
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> Instead of using "virtual-" use "VIRTUAL-RUNTIME_" as recommended
> in insane.bbclass for RPROVIDES and RDEPENDS.
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  meta/recipes-bsp/grub/grub-bootconf_1.00.bb        | 2 +-
>  meta/recipes-bsp/grub/grub-efi_2.12.bb             | 2 +-
>  meta/recipes-core/glibc/glibc-package.inc          | 2 +-
>  meta/recipes-core/musl/musl_git.bb                 | 2 +-
>  meta/recipes-core/systemd/systemd-boot_255.1.bb    | 2 +-
>  meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-b=
sp/grub/grub-bootconf_1.00.bb
> index 783e30bf38..33a4517e5b 100644
> --- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> +++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "Grub might require different configurati=
on file for \
>  different machines."
>  HOMEPAGE =3D "https://www.gnu.org/software/grub/manual/grub/grub.html#Co=
nfiguration"
> =20
> -RPROVIDES:${PN} +=3D "virtual-grub-bootconf"
> +RPROVIDES:${PN} +=3D "VIRTUAL-RUNTIME_grub-bootconf"
> =20
>  inherit grub-efi-cfg
> =20
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.12.bb
> index 9857e8e036..078a59a465 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
> @@ -5,7 +5,7 @@ require conf/image-uefi.conf
>  GRUBPLATFORM =3D "efi"
> =20
>  DEPENDS:append =3D " grub-native"
> -RDEPENDS:${PN} =3D "grub-common virtual-grub-bootconf"
> +RDEPENDS:${PN} =3D "grub-common VIRTUAL-RUNTIME_grub-bootconf"
> =20
>  SRC_URI +=3D " \
>             file://cfg \
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index 1ef987be0a..8846934b25 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -7,7 +7,7 @@ RPROVIDES:${PN} =3D "eglibc rtld(GNU_HASH)"
>  RPROVIDES:${PN}-utils =3D "eglibc-utils"
>  RPROVIDES:${PN}-mtrace =3D "eglibc-mtrace libc-mtrace"
>  RPROVIDES:${PN}-pic =3D "eglibc-pic"
> -RPROVIDES:${PN}-dev =3D "eglibc-dev libc6-dev virtual-libc-dev"
> +RPROVIDES:${PN}-dev =3D "eglibc-dev libc6-dev VIRTUAL-RUNTIME_libc-dev"
>  RPROVIDES:${PN}-staticdev =3D "eglibc-staticdev"
>  RPROVIDES:${PN}-doc =3D "eglibc-doc"
>  RPROVIDES:glibc-extra-nss =3D "eglibc-extra-nss"
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 324269a968..54df0de913 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -76,7 +76,7 @@ FILES:${PN}-dev =3D+ "${libdir}/libcrypt.a ${libdir}/li=
bdl.a ${libdir}/libm.a \
>                     "
> =20
>  RDEPENDS:${PN}-dev +=3D "linux-libc-headers-dev bsd-headers-dev libssp-n=
onshared-staticdev"
> -RPROVIDES:${PN}-dev +=3D "libc-dev virtual-libc-dev"
> +RPROVIDES:${PN}-dev +=3D "libc-dev VIRTUAL-RUNTIME_libc-dev"
>  RPROVIDES:${PN} +=3D "ldd rtld(GNU_HASH)"
> =20
>  LEAD_SONAME =3D "libc.so"
> diff --git a/meta/recipes-core/systemd/systemd-boot_255.1.bb b/meta/recip=
es-core/systemd/systemd-boot_255.1.bb
> index 4ee25ee72f..32495c883d 100644
> --- a/meta/recipes-core/systemd/systemd-boot_255.1.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_255.1.bb
> @@ -45,7 +45,7 @@ python __anonymous () {
> =20
>  FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
> =20
> -RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
> +RDEPENDS:${PN} +=3D "VIRTUAL-RUNTIME_systemd-bootconf"
> =20
>  CFLAGS:append:libc-musl =3D " -D__DEFINED_wchar_t"
> =20
> diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/re=
cipes-core/systemd/systemd-bootconf_1.00.bb
> index 19637546a9..5017b256e7 100644
> --- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> +++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
> @@ -2,7 +2,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>  SUMMARY =3D "Basic systemd-boot configuration files"
> =20
> -RPROVIDES:${PN} +=3D "virtual-systemd-bootconf"
> +RPROVIDES:${PN} +=3D "VIRTUAL-RUNTIME_systemd-bootconf"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  inherit systemd-boot-cfg

I appreciate the intent here but I'm not sure this is quite right.

Most of the usage of VIRTUAL-RUNTIME is done as variable substitution
so ${VIRTUAL-RUNTIME_XXX} and then declared somewhere.

These cases of virtual-XXX are simple enough they don't require that. I
think the patch could therefore add more confusion rather than improve
things.

Cheers,

Richard



