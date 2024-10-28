Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646B2D13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 11:04:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.49099.1730113485515172715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 04:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tx+Pf0+4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so43878475e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730113484; x=1730718284; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47cGsdCnAqotcawIbWJ2cjDb20fAi55UhjVNOTFJhjI=;
        b=Tx+Pf0+4W3C/EJiOjmuT8+humjjRc5ZSsvyPcjVwvmJpP7rhPNcGcft0+sR3UE71Ir
         HLBLzfUFl+SEqowbn7XMu4FqBJGI8Yv7XbdltnxEuuMH3rNSwqRAXFUlznKrgnfHqfVp
         R6+LV38abBEtNm5LvC8/zpXVRefhDoyJ3BLfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113484; x=1730718284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47cGsdCnAqotcawIbWJ2cjDb20fAi55UhjVNOTFJhjI=;
        b=Yo/5sPsRX80q4KK8Or9uPb0zVwBKaG8J/3dK+CVnAWbVWIOC099a9lnPK8ldHe0dY4
         RfJxGE+xqeU8vda3bFIjdqP3KsZtSqCjzkdDNMp+lvKjyQNUFNoe4lHfMarJO9XA5D2j
         faEkMe/WP8C7qxPOuK1SdJOKPQGLoxJB6MoWHdKkFFG32Fz/2WqHnUB6wV76GbGqiL1r
         IWo5j1998aoAvN0Z7LmuHr4uFXJXn8+4TDuXCum1jmAyIf8FLCTGMxglzD2hGi4VGvGR
         DCfG3Uckfmzp7IL9cAJgRKDCc3wPqAMza3vCbxAOs6kKQI5ZrAMsC77BZRIIk4fiPn5Q
         m/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+5KP7jeHqWf8XmS1sYrh7CpAOMXC4sVTpxFHzfAaVLyvt3dErsyh2QrFbF0hFwIaD4FcdrDjOJLEt6W3aqyoNjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1URySXXTVE2gQqncmO3mNTrnry5REDQypRLBMpe4VWpC17HTO
	vUAf6tbDRB3RxzgnY4i6D3eSceEauFq13N+705uHoLbzA36iSaZlq1VwGF6shlo=
X-Google-Smtp-Source: AGHT+IGq9EE32HIOTsME6w4oUivLADyh2DAIuhTc5PnJIKAKBu3eKQhZDBvgMI5v1TzjxU2xHFgzwQ==
X-Received: by 2002:a05:600c:4f03:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-4319ac7078dmr69960605e9.7.1730113483637;
        Mon, 28 Oct 2024 04:04:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:73ef:5707:ed3d:2605? ([2001:8b0:aba:5f3c:73ef:5707:ed3d:2605])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47f59sm9166229f8f.54.2024.10.28.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 04:04:43 -0700 (PDT)
Message-ID: <e5078dbc15b853f94edf433891fbfe21ff077576.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagedata.py : Fix RDEPENDS Version issue
 with AUTOINC
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sreejith.ravi087@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2024 11:04:42 +0000
In-Reply-To: <20241024144845.43504-1-sreejith.ravi087@gmail.com>
References: <20241024144845.43504-1-sreejith.ravi087@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 11:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206442

On Thu, 2024-10-24 at 15:48 +0100, Sreejith Ravi via lists.openembedded.org=
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
> =C2=A0meta/classes-global/package.bbclass | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
> index 6cd8c0140f..066a7ff835 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -325,6 +325,15 @@ python package_setup_pkgv() {
> =C2=A0=C2=A0=C2=A0=C2=A0 # Adjust pkgv as necessary...
> =C2=A0=C2=A0=C2=A0=C2=A0 if 'AUTOINC' in pkgv:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("PKGV", pkgv.re=
place("AUTOINC", "${PRSERV_PV_AUTOINC}"))
> +
> +=C2=A0=C2=A0=C2=A0 # Adjust dependencies that are statically set with EX=
TENDPKGV
> +=C2=A0=C2=A0=C2=A0 vars =3D ["RDEPENDS","RPROVIDES","RRECOMMENDS","RSUGG=
ESTS","RREPLACES","RCONFLICTS"]
> +=C2=A0=C2=A0=C2=A0 packages =3D d.getVar('PACKAGES').split()
> +=C2=A0=C2=A0=C2=A0 for var in vars:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for pkg in packages:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =
=3D d.getVar("%s_%s"%(var,pkg))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if va=
l and 'AUTOINC' in val:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d.setVar("%s_%s"%(var,pkg), val.replace("AUTOINC", "${PR=
SERV_PV_AUTOINC}"))
> =C2=A0}
>=20

Something isn't adding up here. With master, if I set:

DISABLE_STATIC:pn-libnsl2 =3D ""

and put PV =3D "2.0.1+git${SRCPV}" into the recipe, then bitbake libnsl2,
I see:

dpkg --info libnsl-staticdev_2.0.1+git0+d4b22e54b5-r0_amd64.deb=20

 Package: libnsl-staticdev
 Version: 2.0.1+git0+d4b22e54b5-r0
 Architecture: amd64
 OE: libnsl2
 PackageArch: core2-64
 Depends: libnsl-dev (=3D 2.0.1+git0+d4b22e54b5-r0)
 Provides: libnsl2-staticdev (=3D 2.0.1+git0+d4b22e54b5)

which looks right to me. Similarly, the ipk looks correct.

cat kgdata/runtime/libnsl2-staticdev

PN: libnsl2
PV: 2.0.1+git
PR: r0
PKGV: 2.0.1+git@PRSERV_PV_AUTOINC@+d4b22e54b5
PKGR: r0@EXTENDPRAUTO@
LICENSE: LGPL-2.1-only
RDEPENDS:libnsl2-staticdev: libnsl2-dev (=3D 2.0.1+git@PRSERV_PV_AUTOINC@+d=
4b22e54b5-r0@EXTENDPRAUTO@)
RPROVIDES:libnsl2-staticdev:  libnsl2-staticdev (=3D2.0.1+git@PRSERV_PV_AUT=
OINC@+d4b22e54b5)
SECTION:libnsl2-staticdev: devel

which again, looks ok.

So which release are you seeing the issue on as I suspect it isn't
master?

Cheers,

Richard







