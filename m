Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52411CFA44F
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 22:49:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.383.1763678940133498586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 14:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dXW7QAc3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso889618f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 14:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763678938; x=1764283738; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgxEwlwSmg87KXDgz7c2caxsAVRcWe0Hn0IjpTw04MM=;
        b=dXW7QAc3FrB2yIYxzRaR+SvO3yn/d13spGNdNsFsBQE5XGAN0P9D7olu6Zfo8F7uSk
         pY0+/ERtgyq1YJOAjMtMEptXUhgWOC+Tdg6kq7jPTjsrcUsfzJjDdv32zdVTG3D+LDiV
         za622NQToQp3cZIb/a3aOdt+XNqCCjcZAqp/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763678938; x=1764283738;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgxEwlwSmg87KXDgz7c2caxsAVRcWe0Hn0IjpTw04MM=;
        b=MNX/QG/tTrSj1zgZwaJci4aRMAgjt70EnlxHtvhIVGCNGAKmuABxFaygxSVENc1kDD
         iW1i15aYoYiQgWS+ItoHeE7bemv1cntuQhMutgEjhlOOmzoJqjGeA4A+JhdkVVEj71kA
         eAJ/rtXgie8Toervo2UpMhjsuX7yTxTbHGOFSKm0qDY1ibbzle6F4Am6ltSviSaWKqdZ
         BtAu6Nmw2Sv56rx84cypa3KS1iU1rdCzvHnd4T3m44xOgqs2KsVN2N72O9chKOXSixlS
         4z2vN38lE3v8Q3zudNugmy5u1TTZNE23daP/DEx0yDZxXe3tYrumx//JMbsy1y7TmewM
         7m1w==
X-Forwarded-Encrypted: i=1; AJvYcCV3jDqRSMIwPe83zfL2El/PqPao+SzwkRPHj3nCmnY3tm4EBjTGK1b6LBrWjINJO5ZrGJ95N+yVkQrNUYKzLM1kVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2qeoQLQpxhc5x9QmHOxx9aWKdQG37ARswCUvGt4f8xEkOcY3x
	tVOCzXTrlcukavYIzUQN09JlbG5u3qHDap8iyexSm0XhS8/QFln/WxI664bdebd2d94=
X-Gm-Gg: ASbGnctN/ogrs3SF5mZLcKWHjKw5T0M9a4PDXHTszYakotvi0Wft8jhiYB7ypvmco/G
	tAgw0/PTrms4BduHurV6f/Vrk7N8Kb5EwQk64vM2gmlkZlZWSl8kEWt2WwJBuurXwumtfu4nKG5
	t+e4GeNhL/o1Ia8NOfEETH0J/DRJ0KeS/yBg5+jX989GofbyWgf6aMesr9mv5rdL1a+10sPe5KG
	uWR7Hsp7AJO6gpuIViHRVLz7wB8o1r/tclpWZWwkUObQ8BFFcKaTBQqZRqS+VKVtgw9o2JDD99I
	VLPF30X44CBcpqcTSLmZe4JG/qntyz8/LBfzR1m1he3bcBiN9ybc8zm5pQ5cqiqBSTjcXwENhW+
	FdQjIi3LottI1v1gLUd6janSsCrKmlsAPRw4JJOjGCyykwoEk9WRNobPyosp38CwRmeWsqkSM0d
	0DwagxMpukWAHN6dDf7Po7aeBDEff/Nl9q2ZEQ3RacW06f+Mzlo1e/sQLPFsZ80Ch0KJj21Asio
	B4=
X-Google-Smtp-Source: AGHT+IH/rAW6X1Idj20XB6wAuCWsvnPC/WJKNL6g4h5MEG1CBiw3Kkmct/pw9TkmgVGA2lP1bEFOmA==
X-Received: by 2002:a05:6000:1866:b0:427:580:998c with SMTP id ffacd0b85a97d-42cc1d0cf60mr21449f8f.43.1763678938408;
        Thu, 20 Nov 2025 14:48:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d15:c0ee:cc9b:c363? ([2001:8b0:aba:5f3c:8d15:c0ee:cc9b:c363])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8e62sm7748754f8f.35.2025.11.20.14.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:48:57 -0800 (PST)
Message-ID: <62b3ba44522521b8f0f54a88e90e9805755f379b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf, gcc toolchain: add
 -fcanon-prefix-map to map-prefixes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: skandigraun@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2025 22:48:56 +0000
In-Reply-To: <20251120121947.3473848-2-skandigraun@gmail.com>
References: <20251120121947.3473848-1-skandigraun@gmail.com>
	 <20251120121947.3473848-2-skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 22:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226641

On Thu, 2025-11-20 at 13:19 +0100, Gyorgy Sarvari via lists.openembedded.or=
g wrote:
> This patch adds -fcanon-prefix-map to the list of compile file-prefixes
> list in case at least gcc 13 is used (it's a gcc-only flag).
>=20
> This flag used to be part of this list in the past, but was removed with =
[1].
>=20
> Since then the source file paths are not canonicalized, which makes
> the system to miss some (and sometimes all) source files to include
> in the corresponding -src packages. As an example sqlite3 and audiofile
> (from meta-oe) produces empty src packages, mostly due to the pathes:
> they frequently use relative paths that don't match up with the
> absolute path specified in the file-preifx map:
> `pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but
> the first one won't match the prefix-map, so it is omitted.
>=20
> This patch adds this option again with gcc: for class-target it is uses
> always, and for class-native it is used when the host gcc is at least
> version 13.
>=20
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
> =C2=A0meta/classes/toolchain/gcc-native.bbclass | 3 +++
> =C2=A0meta/classes/toolchain/gcc.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 ++
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +=
-
> =C2=A03 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/toolchain/gcc-native.bbclass b/meta/classes/too=
lchain/gcc-native.bbclass
> index a708bd0389..8708ad0211 100644
> --- a/meta/classes/toolchain/gcc-native.bbclass
> +++ b/meta/classes/toolchain/gcc-native.bbclass
> @@ -13,3 +13,6 @@ BUILD_OBJDUMP =3D "${BUILD_PREFIX}objdump"
> =C2=A0BUILD_NM =3D "${BUILD_PREFIX}nm"
> =C2=A0BUILD_READELF =3D "${BUILD_PREFIX}readelf"
> =C2=A0
> +# gcc started to support -fcanon-prefix-map from version 13
> +DEBUG_PREFIX_MAP_EXTRA:class-native =3D \
> +=C2=A0=C2=A0=C2=A0 "${@'-fcanon-prefix-map' if bb.utils.vercmp_string_op=
(oe.utils.get_host_gcc_version(d), '13.0.0', '>=3D') else ''}"
> diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/=
gcc.bbclass
> index a5adb5ca37..0ed49ba892 100644
> --- a/meta/classes/toolchain/gcc.bbclass
> +++ b/meta/classes/toolchain/gcc.bbclass
> @@ -30,4 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cro=
ss-canadian =3D "gcc-crosss
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian=
 =3D "gcc-crosssdk-${SDK_SYS}"
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canad=
ian =3D "nativesdk-gcc-runtime"
> =C2=A0
> +DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> +
> =C2=A0TCOVERRIDE =3D "toolchain-gcc"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5406e542db..600d4baffb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_MAK=
EINST} "
> =C2=A0##################################################################
> =C2=A0TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
> =C2=A0# Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D "\
> +DEBUG_PREFIX_MAP ?=3D "${DEBUG_PREFIX_MAP_EXTRA} \
> =C2=A0 -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
> =C2=A0 -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
> =C2=A0 -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
>=20

I think we should do something like this patch but just with only the
target pieces, not the native ones.

The gcc version check is a slow function call since it execs a command
and we really don't want a call like that dropped inside a variable.

native components don't have -src packages so I'm not sure we need that
element of this. The simplest thing would be to drop that piece.

This issue was identified as a release blocker so I'll probably hack
the patch and put something into master-next for testing overnight.

Cheers,

Richard

