Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DDDC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:35:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.11886.1745490909426322992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FlBiM6k5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so15071235e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745490908; x=1746095708; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEOu+lMZlD5JoehitWFmI9KY0NLas1f6hIiaO8hbR7k=;
        b=FlBiM6k5XCfuCTI9PmuhL06/T/ZfW0QUjSjRcgv6hV1xkCXur483NI4BSr9I67jlsr
         9symxFUmUpJBshE2CFMh3MxdCmf2t0kJ+JNpHILcpdX3EopSLQicksvx9WaJZDst6131
         JsZ+fU+KrAy8eiS+m8jCRNbWVfRMb+9C4Cpvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490908; x=1746095708;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dEOu+lMZlD5JoehitWFmI9KY0NLas1f6hIiaO8hbR7k=;
        b=w9rmwwjl8SLXLttmF9wEcSR5u9qJktkindX4dim9vaV/lFmjAdFip5GX2Vl3K1cbtp
         Ev6Vyq0rSfllTiJX5DWtRY1aHnQZmCe6za2Moy7hubBChd+0niOhFpZ/qKa74A9xaHWP
         719guvPFTVUJr9L+m5a3o9+FpaUPAbgQ40R41pqCMNU6PFf1EV6S9o6iK3dhhO9vmhsl
         8njrUrJHBVc8XpyALyHwgUr37wGbUlhBkhNduLKZzwuyvYC8Ta6U1Z3mEa6/7S2+B2U7
         fxACZme/1F2Rtaou9qvw1iAq0fDmQ2waZFnLPRLxx3lqKQI3NkOh8IeSHvnZHRfDKMUz
         7slQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmw8TFEqlwCPREz8c9KhLbCTtKcqlO+3anQ5fXA/j9Hwnk1nfrCd1+Y1p4rQxhSmY4aPcgzIRsyaF4mwNGyNowyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5mLg4EDc3RD84SI2h12qU3LKcXvnSareiy90kHc6+x17Yv75+
	/f1/7LJLGVProfjwjKwo1AGgICfTgl1So1VOFfkkKvjMvIpAyuVsg5BcCMSSOx8=
X-Gm-Gg: ASbGnctHMDROiD83CmmC0bIOrAy/zVullTdNOhtOARPZIMugA4V11eo4lHt1gF3gDrS
	RJ+2WP4lfo7VyuS39TzWz7zf4vrT5EtSuKkFNm0RbRRpgySg751S7Wun+h4EqYe9IhF6Z+M2I8y
	R99evNeX4ejVEic10OVo9I7DpGtbj60l5Ejaad3CvLvc0IhV3XZpECai/gk51g+xdTuo+I726wg
	3ERXnutdupm5nuyVwCyk3Gl57sM7aQ3JLWKptLAXez7/03hKwSANidD52EnDE/PGp96MXRlok2X
	m22k8vYdq0ANxL731vPeoFml26qGaa4C0bGp9mDdq3QodbMQHgCef6gVmrjmrzR0ustweu2Ek42
	Bj7+hsNCC7tR8gNrRY965RlLvQylrqrff2XKvU+yB
X-Google-Smtp-Source: AGHT+IFl41XZfTA4LGWC8dVppFpiKvVYqaV+OyvC8aGVNuOIx6z9SzyHbTzPGG8N4KTQhKnobMUT2g==
X-Received: by 2002:a05:600c:c092:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-4409c399b9amr14742675e9.0.1745490907851;
        Thu, 24 Apr 2025 03:35:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf751sm15657385e9.34.2025.04.24.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:35:07 -0700 (PDT)
Message-ID: <4057935e419fa4974ea429da8383f5ec37e11f08.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 9/9] image_types_wic.bbclass: depend on
 grub-efi and systemd-boot on aarch64, systemd-boot on arm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2025 11:35:05 +0100
In-Reply-To: <20250422143501.99565-10-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
	 <20250422143501.99565-10-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215349

On Tue, 2025-04-22 at 17:35 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> On x86 family builds, grub and systemd-boot are always included and thus
> get built and deployed before wic image builds. On aarch64 builds
> that was not the case. Result is that some builds added systemd-boot bina=
ries
> to the wic image ESP partition and some not, though bugs in wic plugins
> contributed here too since missing files were silently ignored.
> Boot of such images fails since firmware is not able to load the
> default EFI binaries.
>=20
> Adding EFI_PROVIDER to WKS_FILE_DEPENDS_BOOTLOADERS is not possible
> because of parsing order so adding grub-efi and systemd-boot
> to aarch64 and systemd-boot to arm depends
> which makes sure their do_deploy is always executed
> before wic image is generated. Thus systemd-boot and grub
> binaries will get copied from deploy directory to the wic
> image ESP partition, and boot of the images succeeds.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/classes-recipe/image_types_wic.bbclass | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-r=
ecipe/image_types_wic.bbclass
> index 10888bc12b..b2f450026d 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -113,6 +113,8 @@ WKS_FILE_DEPENDS_DEFAULT +=3D "bmaptool-native cdrtoo=
ls-native btrfs-tools-native
> =C2=A0# Unified kernel images need objcopy
> =C2=A0WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/cross-binutils"
> =C2=A0WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
> +WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 =3D "grub-efi systemd-boot"
> +WKS_FILE_DEPENDS_BOOTLOADERS:arm =3D "systemd-boot"
> =C2=A0WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boo=
t os-release"
> =C2=A0WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux systemd-boot os-r=
elease"
> =C2=A0WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 =3D "syslinux grub-efi"

Several of us had questions in patch review about why some entries had
os-release and some did not. We believe other uki changes have
obsoleted the need for that but it would be good to remove it if so and
keep these entries looking consistent.

Cheers,

Richard

