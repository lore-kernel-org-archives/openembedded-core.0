Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62D3C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:33:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11847.1745490790954244896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W9E/1JkR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso677502f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745490789; x=1746095589; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex3DIAeVRj9k2Pcfv9UeQoOgzNE0CUM0a5Tv3tLVHUk=;
        b=W9E/1JkRg+stog3ngBGb0Q9SfuzTgsxpj5mk9jGmnymUmm0KJHKIPcraNuDjDbd8Ez
         LmdANXgKC/RGuf3A6cUpYcbwlqlzEbFB8PFy/ZPlqW1udRncsLQL0pjrCSBTrSGRmyea
         vwWZMP4jG+weiVPBqLyhFzT6hJfAJar/RPoSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490789; x=1746095589;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ex3DIAeVRj9k2Pcfv9UeQoOgzNE0CUM0a5Tv3tLVHUk=;
        b=GodDreN0ZRfxWLk4kSLcxPHWlkCBvaXbYitn0Q3cW3GWZT4aGdL++zIy+8j+/2GGSV
         2SuFleflGepZWiUusfcl1ADGGTFFUSvf/kAWugM/+m7Ehly9D40ZI6Y3kb4KDUMw/6H0
         JGNDF85MurjtltXWqx9biz3+l1zrnkGQ+OEVp/UHH1bCrBTAy/VMZ551bXcg6U3aV9oZ
         cg5nghStVDzJ4m4VVJHK/dTf7SIQLIigjHn6XcPrrCQzlHMt1LaOU1dNzEHaPGiLdcAx
         zWRrFB8MijQUaCIDVh6DXQ+xvb4MFS3ikEY6UtaCoaKqMbFhZpghR+LPFADfzmTt25Tn
         JgPg==
X-Forwarded-Encrypted: i=1; AJvYcCUw/TNCfR3q4MzP+68Uzn5GQDjxQpM5VVwdEdlD6Olt5EkFE5Ue/4kHpC4dX8GV4wAi4Ej7D+zRwxE7M2lVZO+JGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxj2qnAsOmvKhiy1SGijHbPbXEvG/mjiBjyQ+MvLIiq5/1e3BsS
	a19OmMIo7VZA641tBioGw6CSOM6xeP9pQZoGlm3APjta1HPpFTNn2o5h2X+LJEGOXT0ZL7HnDta
	B
X-Gm-Gg: ASbGnctJCggJzx4z3Kr3U220hh1FwEwxZI6nQh8oeTwRXFezrUEGt8yjVnLUFtNMvjL
	t81W+sTHkjQwBFKFgL6R5lpGz/wYpjD540LamyPWWmrCAKJFXEBeNSLcJdAAJcgNkMlJyv+Koxr
	HB9Kx+93lhmtE9IOKhEHG9c0bflPLaNkOyh4TG6mWB/3oCaLBxMIqTExeNjqa3RVxUODqku6M/7
	NpmSjMXgji0TlWik88Cv5fztPAYoPGoZlCAkYUGanfDirxewLb3et/wW0RD6GOatZqQfIBdnlvh
	UQ9JhuIRxmqJU+2QWbW61F5YfbOiwxM+pDQ1PrnXtXI6wYdyNRYoW+F9k1/wFZK0znUizpgQ6iE
	XGdDpvB1ofxIwc43SLgfFQEjdu2tAjQ==
X-Google-Smtp-Source: AGHT+IFbiJx0bfdL3YW72CoXpXoScaqeIPDNEoMxzA2IkAXD5tKSnYhYqJcozt89+3i9FfTGz/o0Aw==
X-Received: by 2002:a5d:6da2:0:b0:39c:13fd:ec44 with SMTP id ffacd0b85a97d-3a06cf4ed17mr1732141f8f.5.1745490789044;
        Thu, 24 Apr 2025 03:33:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8144sm1683145f8f.19.2025.04.24.03.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:33:08 -0700 (PDT)
Message-ID: <d76232c249fa6af70c2539d14e733825bc6f1dc8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] icu: set ac_cv_path_install to install
 under hosttools
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2025 11:33:07 +0100
In-Reply-To: <20250422130702.1337476-1-changqing.li@windriver.com>
References: <20250422130702.1337476-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215348

On Tue, 2025-04-22 at 21:07 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> icu will check program install path during do_configure, eg:
> checking for a BSD-compatible install... /path/to/install -c
>=20
> And this path will be writen into pkgdata.inc:
> INSTALL_CMD=3D$(INSTALL-L)
>=20
> Decided by if install is installed into recipe-sysroot-native during
> do_configure stage, the INSTALL_CMD could be
> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bi=
n/install
> or /build/tmp/hosttools/install.
>=20
> set ac_cv_path_install to install under hosttools to make a determined
> result of INSTALL_CMD, avoid vary caused by the execute sequence of
> another task which DEPENDS on coreutils-native and independent with
> do_configure
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/recipes-support/icu/icu_76-1.bb | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/=
icu/icu_76-1.bb
> index f0890fc890..a33f48cf8e 100644
> --- a/meta/recipes-support/icu/icu_76-1.bb
> +++ b/meta/recipes-support/icu/icu_76-1.bb
> @@ -20,9 +20,9 @@ inherit autotools pkgconfig github-releases
> =C2=A0# ICU needs the native build directory as an argument to its --with=
-cross-build option when
> =C2=A0# cross-compiling. Taken the situation that different builds may sh=
are a common sstate-cache
> =C2=A0# into consideration, the native build directory needs to be staged=
.
> -EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_ICU_DIR_NATIVE} --disab=
le-icu-config"
> -EXTRA_OECONF:class-native =3D "--disable-icu-config"
> -EXTRA_OECONF:class-nativesdk =3D "--with-cross-build=3D${STAGING_ICU_DIR=
_NATIVE} --disable-icu-config"
> +EXTRA_OECONF =3D "--with-cross-build=3D${STAGING_ICU_DIR_NATIVE} --disab=
le-icu-config ac_cv_path_install=3D'${HOSTTOOLS_DIR}/install -c'"
> +EXTRA_OECONF:class-native =3D "--disable-icu-config ac_cv_path_install=
=3D'${HOSTTOOLS_DIR}/install -c'"
> +EXTRA_OECONF:class-nativesdk =3D "--with-cross-build=3D${STAGING_ICU_DIR=
_NATIVE} --disable-icu-config ac_cv_path_install=3D'${HOSTTOOLS_DIR}/instal=
l -c'"
> =C2=A0
> =C2=A0EXTRA_OECONF:append:class-target =3D "${@oe.utils.conditional('SITE=
INFO_ENDIANNESS', 'be', ' --with-data-packaging=3Darchive', '', d)}"
> =C2=A0TARGET_CXXFLAGS:append =3D "${@oe.utils.conditional('SITEINFO_ENDIA=
NNESS', 'be', ' -DICU_DATA_DIR=3D\\""${datadir}/${BPN}/${@icu_install_folde=
r(d)}\\""', '', d)}"

Does this work if you just use:

ac_cv_path_install=3D'install -c'

?

Cheers,

Richard

