Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179B2CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:27:12 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5767.1763371614300143697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=AtrPn3Uo;
 spf=none, err=SPF record not found (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7373fba6d1so369339666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1763371613; x=1763976413; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VB+THeoZOrjfczKysUAEYgFfVU7cKicnvAfMqXaACFs=;
        b=AtrPn3Uob/hI+NtTOom/+F+rAY8MEX/gwALGs04M+vbBwgv7UAFguKDQGmo/JkIdqY
         FYYYS4JKJXmvBz6ee1V51+NwO6ekvRChdjH2DRbo/XT8u/Q2MMAk5Seo3g6Lnm0DR0Q3
         2DXTfoiW1+EgUVPNcDuK2sIftlOR5UN0LtD5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371613; x=1763976413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VB+THeoZOrjfczKysUAEYgFfVU7cKicnvAfMqXaACFs=;
        b=OHzURrGg0cz67woMoM4azzu9K19OCDbxw0WoDCT8NHmG/EpqgzrYilwoSaz+ZxCF1f
         fQxE4fu3OHgMdZ2vgrrqLxK8Ta0NHv1oi4gppvR6E3BDEzBqe5HPQgxJzMpfsEZ/ABFx
         l1RCiqNmR8VxCWTwDrgwszoM6RFTd/DNLXcXkMdVQ1OdTR/R2qe9GBvgAP3cwt7Jr7zw
         kM62P3cqa/Fwc1HC+LkFy50NAb9JysF5WfZ4DloyZCvDoFJr2hb6eNxRqHEgoitjJyEk
         zXa4lWLLEOyNBdTKfw2mVYZHUWXt3UB7Rj5OVBwNqm998P8DVUV4KA11LFGiLmKFnMx2
         svVA==
X-Gm-Message-State: AOJu0YyROqS1gdD/toHtunCGn5JlVZXwbq20f6Z6lPjKZmKwjJv8z90y
	CEKxl53k3pitUFbQVOAv5/gQ/e1r4CtXddjNnKADnuh367zqRibAT+I+eZA8BBUG1KCLgT/V43q
	Utjhj5JVadq4/qX3OcmRnseoDTQQlI41/ym6WcWqZUQ==
X-Gm-Gg: ASbGnctQJ/QvREkQhYMIhS6mW54a11tc+mDJbvXABHfJH6wiVo49+soQ3nIudfzgEJ8
	gtY7WC5YNUywjTzcrOSPHHTZ0WhW36OVYX4NH0R92HLNPqb+ImqWBZW8e9TOn6FYLIm0pJK8fWE
	+ovUeQv9iVx0YB/KdZWTRN7Sce9O3fRyVSLjPuu0XjeTBxfwXD4uv1goA+v5sy/ko4e1a/lXKST
	lZv4eHYIhaLudn0XNW94zZizxz/64aZj14SyV4k0jy1ni7u6lZcM4uYn9EEObDa3ixzJF4OjS4K
	ZQTnkA8Lw5abPmA4
X-Google-Smtp-Source: AGHT+IG/IR9Nu72qri6veCC+hHdw1hpEuVn5/tcfCYSkfLSC57ViI7l5kSVIipkFt6bwdColnlaNnujh/DKOSaGZj4c=
X-Received: by 2002:a17:907:7e91:b0:b73:7715:ac83 with SMTP id
 a640c23a62f3a-b737715afd7mr996851766b.44.1763371612354; Mon, 17 Nov 2025
 01:26:52 -0800 (PST)
MIME-Version: 1.0
References: <20251023134656.2059483-1-ecordonnier@snap.com> <187122D70EFBB6A8.8642@lists.openembedded.org>
In-Reply-To: <187122D70EFBB6A8.8642@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 17 Nov 2025 10:26:41 +0100
X-Gm-Features: AWmQ_blsTYSmKpFKGyLDsg7cV5lKw3CWP2OhqSiqPFHuJdMUITU-dvOG1gVsors
Message-ID: <CAHUKmYb450p4o1-sE1TsFLUgp1iQn6D1ZAhhsZagb3L5BpeGYA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008fe2cc0643c6f270"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 09:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226488

--0000000000008fe2cc0643c6f270
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
what is the status of the patch updating to 0.9.0? I have seen that it is
not in master-next any more.

Thanks
=C3=89tienne

On Thu, Oct 23, 2025 at 3:47=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> See release notes at
> -
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&d=3DDwIDAg&c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2C=
e&s=3D2uBonUU-0L9K8QbAlNXI4M9RB2UD0ENPGEJdRWORLjg&e=3D
>
> [0.9.0] - 2025-06-27
>
> Semiannual opkg release.
> Bumping the minor version as a result of the project build tooling
> changing from autotools to cmake.
>
> - Added a Dockerfile container definition (`:docker/`) for a valid
> developer build environment for opkg.
>   - It's recommended that project contributors use this container to buil=
d
> and test their changes.
> - The AutoTools-based build framework has [been replaced](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0=
RujIuGOOp4d2Ce&s=3D7aRsLwHCTOwh-JuT30q4nwTIbBY2Yy39WpGwx9cHb1Y&e=3D
> ) with a more modern, CMake framework.
>   - Refer to the `docs/CONTRIBUTING.md` documentation for updated build
> instructions.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 +++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg/run-ptest     |  2 +-
>  .../opkg/{opkg_0.8.0.bb =3D> opkg_0.9.0.bb}     | 22 ++++++++-------
>  3 files changed, 41 insertions(+), 10 deletions(-)
>  create mode 100644
> meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>  rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb =3D> opkg_0.9.0.bb} (76=
%)
>
> diff --git
> a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
> b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
> new file mode 100644
> index 00000000000..626bbd01b68
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
> @@ -0,0 +1,27 @@
> +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001
> +From: Etienne Cordonnier <ecordonnier@snap.com>
> +Date: Mon, 20 Oct 2025 18:57:56 +0200
> +Subject: [PATCH] config.h.in: fix typo
> +
> +Upstream-Status: Backport [
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0=
RujIuGOOp4d2Ce&s=3D8_nCWNXVaTXJwaV4rr2tMRQf0ZF5eZ2V958tK8nftQ4&e=3D
> ]
> +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> +---
> + config.h.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config.h.in b/config.h.in
> +index 4fa9842..877b8c7 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -2,7 +2,7 @@
> + #cmakedefine01 WITH_XZ
> + #cmakedefine01 WITH_BZIP2
> + #cmakedefine01 WITH_LZ4
> +-#cmakedefine01 WITH_LZSTD
> ++#cmakedefine01 WITH_ZSTD
> + #cmakedefine01 WITH_CURL
> + #cmakedefine01 WITH_SSLCURL
> + #cmakedefine01 WITH_ACL
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
> b/meta/recipes-devtools/opkg/opkg/run-ptest
> index 5fb7077eec9..d485a4aace5 100644
> --- a/meta/recipes-devtools/opkg/opkg/run-ptest
> +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
> @@ -2,4 +2,4 @@
>
>  OPKG_PATH=3D$(which opkg)
>
> -make OPKG_PATH=3D$OPKG_PATH run-tests
> +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
> OPKG_PATH=3D$OPKG_PATH
> diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> similarity index 76%
> rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
> rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
> index 12e2edf7e3f..ed2f36d636b 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> @@ -15,34 +15,35 @@ PE =3D "1"
>  SRC_URI =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz=
&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_J=
A4noFr_ddic0RujIuGOOp4d2Ce&s=3DR1WHlvCpQvQrcg0MKQeBK7cOs6mJQh4CvBg6u55Ikgk&=
e=3D
> \
>             file://opkg.conf \
>
> file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> +           file://0002-config.h.in-fix-typo.patch \
>             file://run-ptest \
>             "
>
> -SRC_URI[sha256sum] =3D
> "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
> +SRC_URI[sha256sum] =3D
> "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>
>  # This needs to be before ptest inherit, otherwise all ptest files end
> packaged
>  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>  # PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
>  PACKAGES =3D+ "libopkg"
>
> -inherit autotools pkgconfig ptest
> +inherit cmake pkgconfig ptest
>
>  target_localstatedir :=3D "${localstatedir}"
>  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>
>  PACKAGECONFIG ??=3D "libsolv"
>
> -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
> +PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>      gnupg gpgme libgpg-error,\
>      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
>      "
> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
> -PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,curl
> openssl"
> -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
> -PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libsolv"
> +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl"
> +PACKAGECONFIG[ssl-curl] =3D "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF,cu=
rl
> openssl"
> +PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF"
> +PACKAGECONFIG[libsolv] =3D
> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
>
> -EXTRA_OECONF =3D "--enable-zstd"
> -EXTRA_OECONF:append:class-native =3D "
> --localstatedir=3D/${@os.path.relpath('${localstatedir}',
> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${sysconfdi=
r}',
> '${STAGING_DIR_NATIVE}')}"
> +EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
> +EXTRA_OECMAKE:append:class-native =3D "
> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}=
')}
> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE=
}')}"
>
>  do_install:append () {
>         install -d ${D}${sysconfdir}/opkg
> @@ -56,6 +57,9 @@ do_install:append () {
>  }
>
>  do_install_ptest () {
> +       # the ptest class uses a Makefile for installation, but cmake use=
s
> Ninja per default so we need to install ptests manually:
> +       cp -r ${S}/tests ${D}${PTEST_PATH}
> +
>         sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>         sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0"
> ];then echo "FAIL:"$^;else echo "PASS:"$^;fi'
> ${D}${PTEST_PATH}/tests/Makefile
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225260):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_225260&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&s=3Drog=
mgcu5LmWWO0vQG0DZBFsTFVZ-yBU08727rMNAZNY&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_115910660_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DXCL4aTZh1fTrw=
HaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&s=3DV9FHief_pTCRo1nHRLq=
GXiEHXiFtkc8vroy5Gmz0xQ4&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DXCL4aT=
Zh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&s=3DTXZ12yyEhyAC=
R_Wh4zzp2H8RKUrxhVRcbcLAnrxYdvg&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008fe2cc0643c6f270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>what is the status of the patch updating to 0.9.0? =
I have seen that it is not in master-next any more.<br><br>Thanks<br>=C3=89=
tienne</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 23, 2025 at 3:47=E2=80=AFPM Etien=
ne Cordonnier via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded=
.org">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=
=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>=
&gt;<br>
<br>
See release notes at<br>
- <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
s.yoctoproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&amp;d=3DDwIDA=
g&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF=
_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=3D2uBonUU-0L9K8QbAlNXI4M9RB2UD0ENPGEJdRW=
ORLjg&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_opkg_op=
kg-2D0.9.0.release-2Dnotes&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;=
m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=
=3D2uBonUU-0L9K8QbAlNXI4M9RB2UD0ENPGEJdRWORLjg&amp;e=3D</a> <br>
<br>
[0.9.0] - 2025-06-27<br>
<br>
Semiannual opkg release.<br>
Bumping the minor version as a result of the project build tooling changing=
 from autotools to cmake.<br>
<br>
- Added a Dockerfile container definition (`:docker/`) for a valid develope=
r build environment for opkg.<br>
=C2=A0 - It&#39;s recommended that project contributors use this container =
to build and test their changes.<br>
- The AutoTools-based build framework has [been replaced](<a href=3D"https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_=
commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwIDAg&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4no=
Fr_ddic0RujIuGOOp4d2Ce&amp;s=3D7aRsLwHCTOwh-JuT30q4nwTIbBY2Yy39WpGwx9cHb1Y&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D3f6040e=
321634471ec442fb0e80f140f1437e90b&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m6=
7E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce=
&amp;s=3D7aRsLwHCTOwh-JuT30q4nwTIbBY2Yy39WpGwx9cHb1Y&amp;e=3D</a> ) with a =
more modern, CMake framework.<br>
=C2=A0 - Refer to the `docs/CONTRIBUTING.md` documentation for updated buil=
d instructions.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0.../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0.../opkg/{<a href=3D"http://opkg_0.8.0.bb" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2=
2 ++++++++-------<br>
=C2=A03 files changed, 41 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h.in-f=
ix-typo.patch<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.8.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a href=3D"ht=
tp://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=
 (76%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patc=
h b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<br>
new file mode 100644<br>
index 00000000000..626bbd01b68<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<br>
@@ -0,0 +1,27 @@<br>
+From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001<br>
+From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" targe=
t=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
+Date: Mon, 20 Oct 2025 18:57:56 +0200<br>
+Subject: [PATCH] <a href=3D"http://config.h.in" rel=3D"noreferrer" target=
=3D"_blank">config.h.in</a>: fix typo<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe6409c=
7ad983ed911225d4aefbfd09e&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=
=3D8_nCWNXVaTXJwaV4rr2tMRQf0ZF5eZ2V958tK8nftQ4&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__g=
it.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefb=
fd09e&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaei=
GKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=3D8_nCWNXVaTXJwaV4rr2=
tMRQf0ZF5eZ2V958tK8nftQ4&amp;e=3D</a> ]<br>
+Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.c=
om" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_blank">confi=
g.h.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_=
blank">config.h.in</a> b/<a href=3D"http://config.h.in" rel=3D"noreferrer" =
target=3D"_blank">config.h.in</a><br>
+index 4fa9842..877b8c7 100644<br>
+--- a/<a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_blank">=
config.h.in</a><br>
++++ b/<a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_blank">=
config.h.in</a><br>
+@@ -2,7 +2,7 @@<br>
+ #cmakedefine01 WITH_XZ<br>
+ #cmakedefine01 WITH_BZIP2<br>
+ #cmakedefine01 WITH_LZ4<br>
+-#cmakedefine01 WITH_LZSTD<br>
++#cmakedefine01 WITH_ZSTD<br>
+ #cmakedefine01 WITH_CURL<br>
+ #cmakedefine01 WITH_SSLCURL<br>
+ #cmakedefine01 WITH_ACL<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devto=
ols/opkg/opkg/run-ptest<br>
index 5fb7077eec9..d485a4aace5 100644<br>
--- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
@@ -2,4 +2,4 @@<br>
<br>
=C2=A0OPKG_PATH=3D$(which opkg)<br>
<br>
-make OPKG_PATH=3D$OPKG_PATH run-tests<br>
+make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_PATH=
=3D$OPKG_PATH<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.9.0.bb</a><br>
similarity index 76%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
index 12e2edf7e3f..ed2f36d636b 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
@@ -15,34 +15,35 @@ PE =3D &quot;1&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v2/url=
?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-257B=
BPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m6=
7E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce=
&amp;s=3DR1WHlvCpQvQrcg0MKQeBK7cOs6mJQh4CvBg6u55Ikgk&amp;e=3D" rel=3D"noref=
errer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-=
3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2=
D-24-257BPV-257D.tar.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvab=
gGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=
=3DR1WHlvCpQvQrcg0MKQeBK7cOs6mJQh4CvBg6u55Ikgk&amp;e=3D</a>=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-config.h.in-fix-typo.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed=
5d42d5ec5f6cd413f0c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa=
81a6a85493f0c89d0f5&quot;<br>
<br>
=C2=A0# This needs to be before ptest inherit, otherwise all ptest files en=
d packaged<br>
=C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because default<br>
=C2=A0# PTEST_PATH ?=3D &quot;${libdir}/${BPN}/ptest&quot;<br>
=C2=A0PACKAGES =3D+ &quot;libopkg&quot;<br>
<br>
-inherit autotools pkgconfig ptest<br>
+inherit cmake pkgconfig ptest<br>
<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
=C2=A0OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
<br>
-PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
+PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<br>
=C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\<br>
=C2=A0 =C2=A0 =C2=A0${@ &quot;gnupg&quot; if (&quot;native&quot; in d.getVa=
r(&quot;PN&quot;)) else &quot;gnupg-gpg&quot;}\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl&quot;<br>
-PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,--disable-ssl-curl,cur=
l openssl&quot;<br>
-PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--disable-sha256&quot;<br>
-PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--without-libsolv,libsolv&=
quot;<br>
+PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl&quot=
;<br>
+PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF=
,curl openssl&quot;<br>
+PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF&quo=
t;<br>
+PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LI=
BSOLV=3DOFF,libsolv&quot;<br>
<br>
-EXTRA_OECONF =3D &quot;--enable-zstd&quot;<br>
-EXTRA_OECONF:append:class-native =3D &quot; --localstatedir=3D/${@os.path.=
relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} --sys=
confdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_N=
ATIVE}&#39;)}&quot;<br>
+EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br>
+EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.relpat=
h(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSCONFDI=
R=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NATIVE}=
&#39;)}&quot;<br>
<br>
=C2=A0do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/opkg<br>
@@ -56,6 +57,9 @@ do_install:append () {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# the ptest class uses a Makefile for installat=
ion, but cmake uses Ninja per default so we need to install ptests manually=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests ${D}${PTEST_PATH}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/@echo $^/d&#39; ${D}${PTEST_PAT=
H}/tests/Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/@PYTHONPATH=3D. $(PYTHON) $^/a\=
\t@if [ &quot;$$?&quot; !=3D &quot;0&quot; ];then echo &quot;FAIL:&quot;$^;=
else echo &quot;PASS:&quot;$^;fi&#39; ${D}${PTEST_PATH}/tests/Makefile<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225260): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
5260&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiG=
KsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=3Drogmgcu5LmWWO0vQG0DZ=
BFsTFVZ-yBU08727rMNAZNY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_225260&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2=
Ce&amp;s=3Drogmgcu5LmWWO0vQG0DZBFsTFVZ-yBU08727rMNAZNY&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_115910660_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noFr_d=
dic0RujIuGOOp4d2Ce&amp;s=3DV9FHief_pTCRo1nHRLqGXiEHXiFtkc8vroy5Gmz0xQ4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_115910660_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2w=
o-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=3DV9FHief_pTCRo1nHRLqGXiEHXiFtkc8vr=
oy5Gmz0xQ4&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKsJoqKvbWZD2wo-GXF_JA4noF=
r_ddic0RujIuGOOp4d2Ce&amp;s=3DTXZ12yyEhyACR_Wh4zzp2H8RKUrxhVRcbcLAnrxYdvg&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DXCL4aTZh1fTrwHaeiGKs=
JoqKvbWZD2wo-GXF_JA4noFr_ddic0RujIuGOOp4d2Ce&amp;s=3DTXZ12yyEhyACR_Wh4zzp2H=
8RKUrxhVRcbcLAnrxYdvg&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008fe2cc0643c6f270--

