Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2751CFA457
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 10:46:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.11679.1729766754491035797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 03:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FvjU9FaT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431688d5127so7709175e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729766753; x=1730371553; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cheudwhLr0g+6fW3IZFB/GCfbdLTixXfElZAGldpP5M=;
        b=FvjU9FaTo+zPANzaOz1D2xo8yM5j1xLL0JOa+wnjiPjE+fEILeRYHjxh8JRkoeGi66
         xPFJwNqfdgLQ+K/zyAUbPnzkNC1Up9a3jZfPpmhgCainnGC5NHPr9psHqQGEtz3Pt8Is
         VeuxMCfp8sGNm9ER7NIVnYySEqoWar0VMR4yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766753; x=1730371553;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cheudwhLr0g+6fW3IZFB/GCfbdLTixXfElZAGldpP5M=;
        b=dWThRRmXIDSvvZcfkpWEcxvHtj7TvwE21Db2cMvBxY7fv+u3+wDcduFMtUvUTpou9k
         NO50GmqgmpRU/95Y2yBD7+IJK1P13hcXX3Sr4v37BP/g+jxOo+yD8yWPcncBSGIO8Dn0
         GjG4F0nHJq0vEBda7VnsK2egjaBNSkszxxtq/b490jJoBWajv5w8WLUEVPJrDXoXN3zQ
         D52klVqQmI+eJr4OgOm7de3sp+d/Q/bCQ9gmfP5PsChp1cZbkLjEDBhCNOZAk0XoiRsW
         J9k9TpTZ0FzGKlSbHoLrToPhqXBW482tNHPda0PXdEsF6KmXqecMD7LC2L0+laYUmx5N
         Tmdg==
X-Forwarded-Encrypted: i=1; AJvYcCX9URpP/R/NH6QwcF15aLHU5DZV5SURnpfx3eKP1MPqrHHxh//H8vkEYtd4BctMFWngpV3+lD88I5/g+Fhev7KJjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywuu2TormhqVZJOGmZgRu4JFm0n6r5T3NhyNpHzujQpxU4Ed2V4
	26Q+aiKfBJ08lVpFlGo3JZ8KB9waDIebpm/Y9VFkeU8BGCMoz3qLUXZ8I43nke7hIC4V4znNwga
	9J/g=
X-Google-Smtp-Source: AGHT+IEb6YauPYHc9myxLLZUab9bVnGN81XkM/k/1wVTTd4vlp+ECgas3VUD6APaZBxWaseEiZnfAQ==
X-Received: by 2002:a05:600c:5028:b0:42f:7c9e:1f96 with SMTP id 5b1f17b1804b1-4318c6df984mr13537715e9.1.1729766752755;
        Thu, 24 Oct 2024 03:45:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bd684asm41415725e9.5.2024.10.24.03.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:45:52 -0700 (PDT)
Message-ID: <4cabf8db3630df2db2474c476745bf7ecc893f5b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagedata.py : Fix RDEPENDS Version issue
 with AUTOINC
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sreejith.ravi087@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2024 11:45:51 +0100
In-Reply-To: <20241024103906.41742-1-sreejith.ravi087@gmail.com>
References: <20241024103906.41742-1-sreejith.ravi087@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 10:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206286

On Thu, 2024-10-24 at 11:39 +0100, Sreejith Ravi via lists.openembedded.org=
 wrote:
> Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV
> in meta/conf/bitbake.conf:
> ----------------------------------
> EXTENDPKGV ?=3D "${EXTENDPKGEVER}${PKGV}-${PKGR}"
> DEV_PKG_DEPENDENCY =3D "${PN} (=3D ${EXTENDPKGV})"
> RDEPENDS:${PN}-staticdev =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> ----------------------------------
>=20
> During the do_package task, AUTOINC is replaced in PKGV
> (via package_setup_pkgv), which is used for creating the package name.
> However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage,
> resulting in the RDEPENDS field in the IPK control data containing AUTOIN=
C.
>=20
> As the IPK name is generated with the updated PKGV, but the version in
> RDEPENDS still uses AUTOINC, this mismatch leads to installation failures=
.
>=20
> Example: libnsl
> install libnsl-staticdev throws the error,=C2=A0 nothing provides
> libnsl-dev =3D 1.2.0+gitAUTOINC+4a062cf418-r0
> ----------------------------------
> IPKs available:
> libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
> libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
>=20
> control data: libnsl-staticdev
> Package: libnsl-staticdev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl-dev (=3D 1.2.0+gitAUTOINC+4a062cf418-r0)
> Provides: libnsl2-staticdev
> Source: libnsl2_git.bb
>=20
> control data: libnsl-dev
> Package: libnsl-dev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl2 (=3D 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev
> Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
> Provides: libnsl2-dev
> Source: libnsl2_git.bb
> ----------------------------------
>=20
> This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -dev a=
nd
> -staticdev packages. It replaces AUTOINC before generating the package co=
ntrol data.
>=20
> Updated control data:
> ----------------------------------
> Package: libnsl-dev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl2 (=3D 1.2.0+git0+4a062cf418-r0), libtirpc-dev
> Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
> Provides: libnsl2-dev
> Source: libnsl2_git.bb
>=20
> Package: libnsl-staticdev
> Version: 1.2.0+git0+4a062cf418-r0
> ----
> ----
> Depends: libnsl-dev (=3D 1.2.0+git0+4a062cf418-r0)
> Provides: libnsl2-staticdev
> Source: libnsl2_git.bb
> ----------------------------------
>=20
> Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
> ---
> =C2=A0meta/lib/oe/packagedata.py | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 2d1d6ddeb7..332681d3ec 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -171,8 +171,11 @@ def runtime_mapping_rename(varname, pkg, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 #bb.note("%s before: %s" % (varname, d.getVar(va=
rname)))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 new_depends =3D {}
> +=C2=A0=C2=A0=C2=A0 bb.build.exec_func("package_get_auto_pr", d)
> =C2=A0=C2=A0=C2=A0=C2=A0 deps =3D bb.utils.explode_dep_versions2(d.getVar=
(varname) or "")
> =C2=A0=C2=A0=C2=A0=C2=A0 for depend, depversions in deps.items():
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if varname =3D=3D "RDEPENDS":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deps[=
depend] =3D [ver.replace("AUTOINC", "%s"%d.getVar("PRSERV_PV_AUTOINC")) for=
 ver in deps[depend]]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_depend =3D get_packa=
ge_mapping(depend, pkg, d, depversions)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if depend !=3D new_depen=
d:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bb.note("package name mapping done: %s -> %s" % (depend, new_depend))
>=20


This is a good start at debugging the issue which is clearly there but
it doesn't feel like the right fix to me. The question is why the code
in package.bbclass isn't replacing the values and writing them into the
data which forms packagedatav. We really need to fix this at the source
of the issue rather than working around it with special case handling
of RDEPENDS.

Do you have any idea why the code in do_package doesn't catch these?

Cheers,

Richard


