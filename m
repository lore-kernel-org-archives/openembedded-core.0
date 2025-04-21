Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390EC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 12:29:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.14156.1745238576234183687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 05:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P32qedKb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so29365115e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745238574; x=1745843374; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QdxzIBCxluRurPD1R1erV7426goI4M4uXhGBzFya+Uk=;
        b=P32qedKbCVVskS8Y43C/n9DHI5HupRazOC9MRAYYFKt8cOcb5uH2LM7bC0I8gEYftS
         O6Yp/TWisZVSQMsP8xsWzo42vDtBJCB9U63gavsXTqu6uzqZKS7YxMzDA14NveGVvtyc
         VX3sMMTDyXVLkto3PyqU8PatiBiHMs2pajwUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745238574; x=1745843374;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdxzIBCxluRurPD1R1erV7426goI4M4uXhGBzFya+Uk=;
        b=j2xcctWKcsXtqO3fiL6k1oa8zzMxA7nBb0dX5ApCkwYRIlZVfu7SVEwkeeZ5o8vBUS
         o7GgzayUk7z5Ajp57BEYZFcExJXFkuVXN5CZVi3au+dpgkOIeMRAnimY9DDLlhVyK07W
         xLYOSaZBocpo3eCowmlUSr16W9lYQHcrULEhv0HOByx1yaY/6RdYy6zMSdyrdW7T4p8q
         2nHy/5TU4xF5COs4kZzI/jlECqaeMuEA3uycxRVjaNCw4X8V3fHcMU3rUvVBZFMua4tE
         6oM1KEgwHGg2OPKqxHjcvjYZHsEfZ58IQ48KWsHK/xbPUPLNbuT6P0WHJy0z4SRkqK/Y
         DnRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYMIZYCKYVbNeudvUiWRZa2gxrezrmltJr/FP0/sIkiR7lY3yZ1f/NcUq2+D0zVOZRMWVkCk7xzUPfQCK5NvflAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeRpgO8krYYESsKiyZSzk9PbAcZRZa+orKUp+tMcWMJtkad6ZJ
	+MlN1/i1iwH+fWZiyCZbui0gFSOjGq2c5r4F5L3bIleEZTyd1Cvd5QqaI5ABHAt7U5v0X+N1Lcb
	1
X-Gm-Gg: ASbGncv/o+uLx9/vdYoG9zfIT49fi0MxhU/RYqSjN84ES0mGBsT3T7nG4XQAp/H4mxF
	TpwdVQBK2+K0zNDdvsg4giwouNxRVxFulhQ/iD2jQf1pZJCThDC52qkxDHxcR5+i2lFvTQZmPyW
	kjjPGiwH8DRqk2FB1J3sELdGSn9a2OylPajfm1CFsfJFXtrZOSglSkw6ruDKR6A6LZKhgtXOMAQ
	UEtHjPGdl48D21TqGRp8ZsEn9Cs2NccpUb+7xqCUMu5Bk2Nw4xslJn56otNHsqibbdgvf0zeU8J
	Xp5CutALJKemirsoGVbyR968KIeQDysY61uI/5SiZNxx5IouUUrx/r5dfK46/BgAAPG3U7Ytf9a
	HNPCAvBfaTMP9RIUCZyHqnc7X3COM9A==
X-Google-Smtp-Source: AGHT+IFSvHOVX/aq+c7973EwoREJmIYfgbIpxCxoX6qzzLyJF2l10ur7Uzev/SUVZDnbefkvcpmCGA==
X-Received: by 2002:a05:600c:1906:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-4406ac11581mr88670365e9.33.1745238574411;
        Mon, 21 Apr 2025 05:29:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1f12:50b3:e6fc:b6f8? ([2001:8b0:aba:5f3c:1f12:50b3:e6fc:b6f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44034fd8f37sm146496905e9.0.2025.04.21.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 05:29:33 -0700 (PDT)
Message-ID: <d4b89d4a37faf4afe9bcc0c3a781f125426a0351.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] bitbake.conf: Switch prefix mapping to
 use -ffile-prefix-map
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jacob Kroon <jacob.kroon@gmail.com>, Martin Jansa
 <Martin.Jansa@gmail.com>
Date: Mon, 21 Apr 2025 13:29:32 +0100
In-Reply-To: <20250418175911.4033750-2-raj.khem@gmail.com>
References: <20250418175911.4033750-1-raj.khem@gmail.com>
	 <20250418175911.4033750-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 12:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215176

On Fri, 2025-04-18 at 10:59 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> -ffile-prefix map is more comprehensive when it comes to reproducible
> builds and its superset of all prefix-mapping options in compilers
>=20
> This makes is cleaner and workable across gcc and clang, clang does not
> support -fcanon-prefix-map and it has to be explicitly omitted when using
> clang.
>=20
> There are lambdas generated in templates by clang which still get the
> absolute paths despite -fdebug-prefix-map, this helps with that as well.
>=20
> nasm is an outlier and we have fixed it by adding -fdebug-prefix-map opti=
on
> luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which use
> nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite it
> to use nasm flags syntax.
>=20
> We have discussed this in past [1]
>=20
> [1] https://patchwork.yoctoproject.org/project/oe-core/patch/202304280320=
30.2047920-1-raj.khem@gmail.com/#10281
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Jacob Kroon <jacob.kroon@gmail.com>
> Cc: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v2: Drop using --ffile-prefix in go
>=20
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 14 +++++---------
> =C2=A0meta/recipes-devtools/rust/cargo_1.85.1.bb |=C2=A0 2 +-
> =C2=A02 files changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8f90026f7c2..b4e1964f77d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_M=
AKEINST} "
> =C2=A0##################################################################
> =C2=A0TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> =C2=A0# Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> - -fmacro-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> - -fdebug-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> - -fmacro-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> - -fdebug-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> - -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> - -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
> - -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> - -fmacro-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> +DEBUG_PREFIX_MAP ?=3D "\
> + -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> + -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> + -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
> + -ffile-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> =C2=A0"
> =C2=A0DEBUG_LEVELFLAG ?=3D "-g"
> =C2=A0
> diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-de=
vtools/rust/cargo_1.85.1.bb
> index db18ecfda9a..150c2d2b801 100644
> --- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
> @@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
> =C2=A0
> =C2=A0inherit cargo pkgconfig
> =C2=A0
> -DEBUG_PREFIX_MAP +=3D "-fdebug-prefix-map=3D${RUSTSRC}/vendor=3D${TARGET=
_DBGSRC_DIR}"
> +DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TARGET_=
DBGSRC_DIR}"
> =C2=A0
> =C2=A0do_cargo_setup_snapshot () {
> =C2=A0	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh=
 --prefix=3D"${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig

I'm a supporter of cleaning this up and doing this but I think we have a se=
lftest failure that needs invesitgation:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1469
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1386

I'm thinking it comes from this patch, I'll need to confirm that though.

Cheers,

Richard

