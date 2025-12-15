Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE18D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:04:14 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47045.1765800247358824159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CCUOZ5U5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so6764034a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765800246; x=1766405046; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kVOS6to2ZnNGfg1Yfe7ZgAbcUTsOXtrZwYSGOdjsAA=;
        b=CCUOZ5U5PzPAuWefHfI+RJaG7pZB3gAcM/IcTEcoDW/PbbsZEC1U/snBNsQ1XOQeav
         WN4j8OvBfIOM2cT1n6AMm2Ae7PuVfaq3Uf7zBz307SkLc3CVZskAhQJFOoxSvUWlvCHz
         1R/vdJXpXsZrJegPCY1hO4zVVvv6DtWh9ikDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800246; x=1766405046;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kVOS6to2ZnNGfg1Yfe7ZgAbcUTsOXtrZwYSGOdjsAA=;
        b=kIjbiQwHTf4V1SE1xV+uKMHQ4lPs5dW3mr4qPtjArjONY20mS13g5ejmOJ/buVDvm5
         plPiH9y5YkjMLrcfcxQ9iEDMBXvkqY6bQepWl/cp2s8DDUVKDRWSdD+pykp/tU3g/i1l
         MA5EUGbj4i79rMutAkagsAaNPZAm1rea/OTL86/tsAOLjDKwwtQqQXVb/dyqZ3fS08p8
         BS3whqHaZLpRMWCd2Nt3jjQNdAxGkwNrjUIvE/w2BUkUn+GG0V2gL+HXKNwEcotJP7Ns
         HxBWAEH4MzCGPM+Yi6ZAG4sH4aXqBYGu3J3arqd1dLhQbV9Q0K9uE3NVH9b33i4N25Dj
         uUxA==
X-Forwarded-Encrypted: i=1; AJvYcCUYibTDVVvAKvEp94tmMGXDljVv40w1EtdFy6BeVA8fAF1o2Pkm2TLn7H02ZUCmZQnZeGUXqZrsy6PG5tPbbEVopw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyr2aEUQidZ4T8bE77wecRxnVjUAl1O5AXT9+RGIuQE85F3AMHv
	OFv5f/NcFdh9167HnRi0rXYduO/pN/faQRD/eRZRM6aJB7X3YG2PGim1GRPkRhzP7bY=
X-Gm-Gg: AY/fxX4Lvsjc5QPjyjSvzuP3FAxEgIuEaAiRbW3h6K3Pt/iNJb9LBg/s9UuS2+1Qabh
	ehhMdSzsyyF++vJv7I1fedJzXwHOTQl6yNRSMguBwylDddUw7jq9uiaF/Nri9eJdwVEHHO3dHwn
	VOJ32nsMizNZVb3Ym0gtFswMrd24rIRPruIpfNmnQMQD47KBVlXkXoCMsYWlm1ZtWMcL85BYtyB
	pRjlMF2c3imN44HPA+IUnK9GKrgADp8W40FBu8lbIF3BVjAJs69702WKsYksAIh+poqaEODCV7A
	oqWdDrnFoEmwNAe+VYP5IredZk25EVCRANxeqrWKPUIH5d/EhrR6WwpQW3nCiaPhrJkSCJTgCog
	9K+wMkpaZ4lozf66i/m0RVdXzERgLnwzs2qP4THzWZ/+3Io+q4kD/8pNCa4+uAMiEBjZcy+QTRg
	984IId4K/xJnRZAniXicaknHy9k8IJ3WCBF51HBHSFb/ZNSf8IOtjj/9tUCiQ19erSxKNPpnkwQ
	dE=
X-Google-Smtp-Source: AGHT+IGlU4fhpy7oatY0A3p0yRbSXNAUAseiAiBD3EiZT1Wqc1OEIyN/P9j7s5M2GwEy2ukB6iHI4g==
X-Received: by 2002:a17:907:a088:b0:b72:eaba:aac2 with SMTP id a640c23a62f3a-b7d23723f69mr1054732666b.26.1765800245486;
        Mon, 15 Dec 2025 04:04:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fad4:125a:6e75:b598? ([2001:8b0:aba:5f3c:fad4:125a:6e75:b598])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b0dsm1392993866b.67.2025.12.15.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:04:04 -0800 (PST)
Message-ID: <dea01c60d20fe6523604b02ecc81c20d7f9c9e59.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 5/5] debug_build.inc: override BUILD_MODE
 and BUILD_DIR for cargo.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com, 
	randy.macleod@windriver.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org, mathieu.dubois-briand@bootlin.com
Date: Mon, 15 Dec 2025 12:04:04 +0000
In-Reply-To: <20251010075258.2161972-5-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
	 <20251010075258.2161972-5-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227734

On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
> The debug_build.inc is used to collect debug build configuration,
> override BUILD_MODE and BUILD_DIR for cargo.bbclass when DEBUG_BUILD is e=
nabled
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> =C2=A0meta/classes-recipe/cargo.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> =C2=A0meta/conf/distro/include/debug_build.inc | 4 ++++
> =C2=A02 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/carg=
o.bbclass
> index 2dd28e95d3..c90b8c18f0 100644
> --- a/meta/classes-recipe/cargo.bbclass
> +++ b/meta/classes-recipe/cargo.bbclass
> @@ -31,7 +31,7 @@ B =3D "${WORKDIR}/build"
> =C2=A0export RUST_BACKTRACE =3D "1"
> =C2=A0
> =C2=A0RUSTFLAGS ??=3D ""
> -BUILD_MODE =3D "${@['--release', ''][d.getVar('DEBUG_BUILD') =3D=3D '1']=
}"
> +BUILD_MODE ??=3D "--release"
> =C2=A0# --frozen flag will prevent network access (which is required sinc=
e only
> =C2=A0# the do_fetch step is authorized to access network)
> =C2=A0# and will require an up to date Cargo.lock file.
> @@ -41,7 +41,7 @@ CARGO_BUILD_FLAGS =3D "-v --frozen --target ${RUST_HOST=
_SYS} ${BUILD_MODE} --manif
> =C2=A0
> =C2=A0# This is based on the content of CARGO_BUILD_FLAGS and generally w=
ill need to
> =C2=A0# change if CARGO_BUILD_FLAGS changes.
> -BUILD_DIR =3D "${@['release', 'debug'][d.getVar('DEBUG_BUILD') =3D=3D '1=
']}"
> +BUILD_DIR ??=3D "release"
> =C2=A0CARGO_TARGET_SUBDIR =3D "${RUST_HOST_SYS}/${BUILD_DIR}"
> =C2=A0oe_cargo_build () {
> =C2=A0	export RUSTFLAGS=3D"${RUSTFLAGS}"
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> index c8e2cf90cf..1b399b6f65 100644
> --- a/meta/conf/distro/include/debug_build.inc
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -47,3 +47,7 @@ INHIBIT_SYSROOT_STRIP:class-native ?=3D "1"
> =C2=A0
> =C2=A0# For meson.bbclass
> =C2=A0MESON_BUILDTYPE ?=3D "debug"
> +
> +# For cargo.bbclass
> +BUILD_MODE ?=3D ""
> +BUILD_DIR ?=3D "debug"

These worry me as they are generic names not specific to cargo. I'd
really like to see a more cargo specific name if we're going to call
this from generic code so we may need to do some renaming.

Cheers,

Richard

