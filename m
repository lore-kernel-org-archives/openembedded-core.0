Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C829C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 07:43:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15447.1708760622908822185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 23:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ew0D5GjE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33d26da3e15so681321f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 23:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708760621; x=1709365421; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COJPFuYWHJRxZgGw3dg9GP8/KKKYXnGNFnHJc6wcWF0=;
        b=ew0D5GjECP+HJpt3qceISKn11gbBB2uRwEqEYEZZsE+4+Z8K+q1ET4Mjya6WCviplU
         LqzWz9jl2gfaX1qdh63z38sRfN/HdgtTZOkeAJQikmzyqgc5H2ZxQCOttThozP6aJj1D
         iSVSI/bi9mU4qS07BOsvogFTZXGxafjyyL2Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708760621; x=1709365421;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COJPFuYWHJRxZgGw3dg9GP8/KKKYXnGNFnHJc6wcWF0=;
        b=vMyfA3M+Mm0BO8cSTEj2nLaOF3kbL3YyetHNrjSqt1c3t/Tod3HZ1ezwJZsr+sdIRh
         dnPNaOi771wcK/kwal/0OufOrzjY6EGxPgmcsE2IPfAVk8+BJyLP4Z0GLgLzXSaOOhLf
         zNW22AI9Eb+6TtLY9QZZMSynE2AS0z71oCvJQD1Ogt70GjbU40QNaZfJyvzKuXNmGTj/
         I+akTN7YKNxGvV8Xatwvet4DuJJLUPv85k0HK+OkCaJgccZoZnkZzK8Y7Uv4C9gKMomB
         V3jo7bOrVSEFYYohYhngkpETLHab6ESWzl53cTr0mGPx+8iOpcds8r6ij33g2kJHOgzU
         7V3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7ldLUnvpgvm6wd1a1SWiA/rpzdsY37Jbpi+cEBdNwAix7HXmS95OnZV1sTLfinkHiSlML7hDt7EQlQdlzCnPRxY8TJDPCYHu1ZvPiMKUF2hBROiL+hJry
X-Gm-Message-State: AOJu0YyKE3zT1it2A3wLuFRry72cXAirAf0GQTGzqDLE0vJM5sq3sqld
	4S+LqLKtDrPBD8PNGKkjTy/nLkHqfSKLuYyqJTeJMRfEYDE/gk02OdTBpg7dxk4=
X-Google-Smtp-Source: AGHT+IHCkLIq1J/nWn0YhxMRJEMwf8q1u4zef4foqal8LB/x4WvGHm7dnJWauT+1e68DSPSAct+KeQ==
X-Received: by 2002:a5d:4701:0:b0:33d:9d49:cfe2 with SMTP id y1-20020a5d4701000000b0033d9d49cfe2mr1514673wrq.21.1708760621061;
        Fri, 23 Feb 2024 23:43:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da76:8da9:c2c4:11d5? ([2001:8b0:aba:5f3c:da76:8da9:c2c4:11d5])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c464300b00410bc833c2csm1890005wmo.1.2024.02.23.23.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 23:43:40 -0800 (PST)
Message-ID: <48aaddfb9f0faf22a75bf9fe775ef819765db3d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: Upgrade 2.11.5 -> 2.12.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 24 Feb 2024 07:43:39 +0000
In-Reply-To: <20240223191859.6912-1-simone.p.weiss@posteo.com>
References: <20240223191859.6912-1-simone.p.weiss@posteo.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 07:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196120

On Fri, 2024-02-23 at 19:18 +0000, Simone Wei=C3=9F wrote:
> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>=20
> Upgraded to address CVE-2024-25062
>=20
> License-Update: hash.c was rewritten and now also has MIT license,
> trio was totally removed, hence remove license checksum as well.
> Files are not mentioned as exception in overall license any more,
> therefore, checksum changed there as well.
>=20
> Previous upgrades of libxml2 caused issues when building libsoup,
> this in the meantime has been adressed via commit "9f57bfb74e280827"
> ("libsoup-2.4: Fix build with clang-17 and libxml2-2.12") already.
>=20
> Changes:
> - [CVE-2024-25062] xmlreader: Don't expand XIncludes when backtracking
> - parser: Fix crash in xmlParseInNodeContext with HTML documents
>=20
> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
> =C2=A0meta/recipes-core/libxml/libxml2/install-tests.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++----
> =C2=A0.../libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +++-----
> =C2=A02 files changed, 7 insertions(+), 9 deletions(-)
> =C2=A0rename meta/recipes-core/libxml/{libxml2_2.11.5.bb =3D> libxml2_2.1=
2.5.bb} (91%)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-core/libxml/libxml2/install-tests.patch
> index 14ccce5873..4bddf9f05e 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -1,4 +1,4 @@
> -From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
> +From 582af12c9e89cd3d7c93c63756acb6e8180a776c Mon Sep 17 00:00:00 2001
> =C2=A0From: Ross Burton <ross.burton@arm.com>
> =C2=A0Date: Mon, 5 Dec 2022 17:02:32 +0000
> =C2=A0Subject: [PATCH] add yocto-specific install-ptest target
> @@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> =C2=A0 1 file changed, 10 insertions(+)
> =C2=A0
> =C2=A0diff --git a/Makefile.am b/Makefile.am
> -index 5bc4018..57d27af 100644
> +index 0a49d37..1097c63 100644
> =C2=A0--- a/Makefile.am
> =C2=A0+++ b/Makefile.am
> -@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> -=C2=A0	testlimits \
> +@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> +=C2=A0	testparser \
> =C2=A0=C2=A0	testrecurse
> =C2=A0=20
> =C2=A0+ptestdir=3D$(libexecdir)
> diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-co=
re/libxml/libxml2_2.12.5.bb
> similarity index 91%
> rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
> rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
> index 44336c25e1..01e23b21cc 100644
> --- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
> @@ -4,10 +4,8 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
> =C2=A0BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlib=
xml2"
> =C2=A0SECTION =3D "libs"
> =C2=A0LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D2044417e2e5006b65a8b9067b68=
3fcf1=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://hash.c;beginline=3D6;endl=
ine=3D15;md5=3De77f77b12cb69e203d8b4090a0eee879=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://list.c;beginline=3D4;endl=
ine=3D13;md5=3Db9c25b021ccaf287e50060602d20f3a7=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://trio.c;beginline=3D5;endl=
ine=3D14;md5=3Dcd4f61e27f88c1d43df112966b1cd28f"
> +LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d20=
0c701=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://list.c;beginline=3D4;endl=
ine=3D13;md5=3Db9c25b021ccaf287e50060602d20f3a7"
> =C2=A0
> =C2=A0DEPENDS =3D "zlib virtual/libiconv"
> =C2=A0
> @@ -19,7 +17,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/install-tests.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> -SRC_URI[archive.sha256sum] =3D "3727b078c360ec69fa869de14bd6f75d7ee8d369=
87b071e6928d4720a28df3a6"
> +SRC_URI[archive.sha256sum] =3D "a972796696afd38073e0f59c283c3a2f5a560b52=
68b4babc391b286166526b21"
> =C2=A0SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8=
d83e69a2be4722379f08702ea7273"
> =C2=A0
> =C2=A0# Disputed as a security issue, but fixed in d39f780
>=20

Unfortunately this upgrade breaks webkitgtk:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8480/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4416/ste=
ps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8643/step=
s/11/logs/stdio

and so on.

Cheers,

Richard


