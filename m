Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C15CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 11:20:12 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.5635.1760613603563876258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 04:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=D79VK3wW;
 spf=pass (domain: snapchat.com, ip: 209.85.218.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b472842981fso79330166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1760613602; x=1761218402; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBBYZZ3O9vR/52RSsANEkrbmFQaFKDTOOTnRyEH5AfM=;
        b=D79VK3wW2P2Ye1lUXCBwZ0k4yZUoBT2DuGrs06AQI68i1D3/tRP9URGEsOB6fquaDG
         Tb67DLohd0cUV9XrWyJW2rciOMs2NFNv9qgdmi0zMMETgzAlZlJMO34+ljDbDJlJ6RO1
         +7HciI9HfP0Ixo2cjiql6FDmP2DXfskhM0PcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760613602; x=1761218402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBBYZZ3O9vR/52RSsANEkrbmFQaFKDTOOTnRyEH5AfM=;
        b=WpY8IrslaTF0LjrGori2ghiBcDBKywmo8+KIThFmiEvgdYuK9fAQnWT9Qsr6LIutLf
         XVqclFiGTxcufrV8cW6gW1ZLMA5ADjHhgEq7FAcjN2m0NFnIpohbdu+XWVXyoQYf4CnJ
         Jk6S6OBtBY7Dg/gUD6lUVGsHlOf/Lgp7IkXQyupuYpdcHuNSH8VwFVZx74eAv+4CoPP+
         RXEER8hwx2JtV1vnoTzHQOiigrZ0RCT4yFKw814RsOW/0j7kMT2XYn4n3U7q7iZEbLmS
         qYrnrs0/OBTuSLnNzFVTulbxVQFOQmDwxy7kK5/olD03vEq+ycSrUufC1u7Fpgztjyyh
         or8w==
X-Gm-Message-State: AOJu0YwhTm1ptzvwaKkCoJmSfXysjLzzMIgAh6mExbHq+ybg7GgIgQyA
	WuzXCt6roh4/Ukf0h0dm8oCW8wv/7YOR/vmKMi3vE3A4VSdFiS5HiNa98n5ct1/5P+8aVw+9keo
	NIDnxhoI1PhoGCUrOWnqGUQwGs1aewQcdXcZDB5BB7w==
X-Gm-Gg: ASbGncv1hlJe6bDqN1AUHiPINUrCgYQaoh1ssMDj9dDAS1dzFi/QHRyg99ku8Bry7EN
	xh99CQ2Ciknff/kN//ep0btDe3l2ybCCVA6y4hGxRBW3eRbKFvYYrMcZicIQN68903KYFyGZJr/
	2PRR5fWrG5TPUUfZHQFCwaAxkPsqGuhzPs+I4hwOIUocQTaCf1lyOdzefphfBzpJ+F+8ww4PkOz
	CHY3WspLQuZ+pinhoINOeaKASOkW2ovaZFz/X5NbcMF70htnwwhlcz0xl9NNYYGQb9lZJ23OzhS
	zDLRLnVDB1SAgaIsacPkYn6oRxbbPPMhJmBPPw==
X-Google-Smtp-Source: AGHT+IFIsX1hd2iYUHzEa/xyPeaD9HF1+nYP2JgB/kWQtk84+SQ84FRcDMdxKrkvv+CGWOkQuBsLf72JV5ub2t74zKY=
X-Received: by 2002:a17:907:7b99:b0:b3e:c7d5:4cb5 with SMTP id
 a640c23a62f3a-b50ac2cf67cmr3500377866b.31.1760613601739; Thu, 16 Oct 2025
 04:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <186EF4A30D45ACFA.16903@lists.openembedded.org>
In-Reply-To: <186EF4A30D45ACFA.16903@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 16 Oct 2025 13:19:50 +0200
X-Gm-Features: AS18NWA4t5H4guV4f4H-PE5v_-wyTMocIJK3df-J3iNu0yEybHK_bBq2zZgQvoI
Message-ID: <CAHUKmYYYDeoWwLw+30-LShW+h5EEjym1e3OEMG-W2q3r1VVZTA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] opkg: upgrade 0.7.0 -> 0.9.0
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051c1fa064144ccd7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 11:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224963

--00000000000051c1fa064144ccd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
the version 2 of this patch fixes a ptest runtime failure.

On Thu, Oct 16, 2025 at 1:18=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> See release notes at
> -
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&d=3DDwIDAg&c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJE=
g&s=3DhZUODaMANi9aiNu621bcnC1P2wQoUGzQieE3UrO-UW0&e=3D
> -
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_opkg_opkg-2D0.8.0.release-2Dnotes&d=3DDwIDAg&c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJE=
g&s=3DnT31OoHLmflkDkr-EZI797LEz0If3HgMYNbyFp4uA0M&e=3D
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
ih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5s=
PqSP5JA0PhmJEg&s=3DXH-9aNMYNNr-uEe-53mF7sMVCI0mSum_YbVnZgHT-z0&e=3D
> ) with a more modern, CMake framework.
>   - Refer to the `docs/CONTRIBUTING.md` documentation for updated build
> instructions.
>
> [0.8.0] - 2025-01-10
>
> The minor version bump in this release is due to the changes to cURL erro=
r
> output line format.
>
> - [Changed](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298edae4260b8&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5s=
PqSP5JA0PhmJEg&s=3DmIPRVLqV0YtBNpvFEK2lx_yMVOKl97dZmykGZmoF5ak&e=3D
> ) the error output for the curl download backend, to now report the HTTP
> error code for failed requests.
>   - e.g. `error: log_curl_download_error: Failed to download headers of
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar_all_Packag=
es.gz&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJX=
LZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&s=3DQqLBPxORGA-2bg2AQKvBsTC67wCvqYk34YbKvGn=
_nZA&e=3D
> : The requested URL returned error: 401`
> - Enabling debug-verbosity, while using the cURL backend, [will now](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5s=
PqSP5JA0PhmJEg&s=3DWRXRmPZBnebyV5I_9lJfB3NQD9vOx9RQT-6tNCpkWQc&e=3D
> ) print cURL's verbose error log to stderr when there is a download failu=
re.
>   - The verbose output may contain confidential information about your
> cURL transactions. So this is your reminder that debug-verbosity should n=
ot
> be enabled in production systems or sensitive security environments.
> - The commandline configuration file option (`-f`) [can now](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3D36d08b93d2859992b624a4ba2f412cfa5c766050&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5s=
PqSP5JA0PhmJEg&s=3DbZCqQb2w1a0ECnz2lRCKVG3eJNJL3oHPqmyWgI3ngEE&e=3D
> ) be specified multiple times, and each configuration file will be loaded
> and their settings merged.
> - [Fixed](
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.o=
rg_opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b215602b63&d=3DDwIDAg&=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5s=
PqSP5JA0PhmJEg&s=3DvSeX1FD9VJlpr48mHM00oqMqnamxNCdeCanf6jfXIB0&e=3D
> ) a bug in control field parsing where custom fields whose keys are simil=
ar
> to other fields could be confused by the parser.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-devtools/opkg/opkg/run-ptest     |  3 +--
>  .../opkg/{opkg_0.7.0.bb =3D> opkg_0.9.0.bb}     | 21 +++++++++++--------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>  rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb =3D> opkg_0.9.0.bb} (77=
%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
> b/meta/recipes-devtools/opkg/opkg/run-ptest
> index 5fb7077eec9..8cf09adba57 100644
> --- a/meta/recipes-devtools/opkg/opkg/run-ptest
> +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
> @@ -1,5 +1,4 @@
>  #!/bin/sh
>
>  OPKG_PATH=3D$(which opkg)
> -
> -make OPKG_PATH=3D$OPKG_PATH run-tests
> +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
> OPKG_PATH=3D$OPKG_PATH
> diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> similarity index 77%
> rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
> rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
> index 95480b47164..9fa32268541 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> @@ -18,31 +18,31 @@ SRC_URI =3D "
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproj=
ect.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz=
&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUe=
pmFPXzsXMz5sPqSP5JA0PhmJEg&s=3D8vk6XZUJNngLp9vV8HMpWCe8vk4qwdGAZm8qBkBQWq0&=
e=3D
>             file://run-ptest \
>             "
>
> -SRC_URI[sha256sum] =3D
> "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
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
> +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3D0N,-DWITH_CURL=3DOFF,curl"
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
> @@ -56,6 +56,9 @@ do_install:append () {
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
> View/Reply Online (#224962):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_224962&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&s=3D45-=
3msp4QospqmXenCbyjkIwjGnmvCB-OPCJGFVG-YQ&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_115787032_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DBKCxl9ZC3AmXa=
_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&s=3DO2uu_pPIt_WagR7LgFN=
NJhModg3ZYMDGagM9BhJil4E&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DBKCxl9=
ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&s=3DldaGlN5LsJ6h=
Zp6rteo-SqYIYkNOySIiCIXEI5NwjZc&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000051c1fa064144ccd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>the version 2 of this patch fixes a ptest runtim=
e failure.</div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 16, 2025 at 1:18=E2=80=AFPM Eti=
enne Cordonnier via <a href=3D"http://lists.openembedded.org">lists.openemb=
edded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedd=
ed.org">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=
=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>=
&gt;<br>
<br>
See release notes at<br>
- <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
s.yoctoproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&amp;d=3DDwIDA=
g&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQ=
UepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DhZUODaMANi9aiNu621bcnC1P2wQoUGzQieE3Ur=
O-UW0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_opkg_op=
kg-2D0.9.0.release-2Dnotes&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;=
m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=
=3DhZUODaMANi9aiNu621bcnC1P2wQoUGzQieE3UrO-UW0&amp;e=3D</a> <br>
- <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__download=
s.yoctoproject.org_releases_opkg_opkg-2D0.8.0.release-2Dnotes&amp;d=3DDwIDA=
g&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQ=
UepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DnT31OoHLmflkDkr-EZI797LEz0If3HgMYNbyFp=
4uA0M&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_opkg_op=
kg-2D0.8.0.release-2Dnotes&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCH=
vabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;=
m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=
=3DnT31OoHLmflkDkr-EZI797LEz0If3HgMYNbyFp4uA0M&amp;e=3D</a> <br>
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
9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFP=
XzsXMz5sPqSP5JA0PhmJEg&amp;s=3DXH-9aNMYNNr-uEe-53mF7sMVCI0mSum_YbVnZgHT-z0&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D3f6040e=
321634471ec442fb0e80f140f1437e90b&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m6=
7E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg=
&amp;s=3DXH-9aNMYNNr-uEe-53mF7sMVCI0mSum_YbVnZgHT-z0&amp;e=3D</a> ) with a =
more modern, CMake framework.<br>
=C2=A0 - Refer to the `docs/CONTRIBUTING.md` documentation for updated buil=
d instructions.<br>
<br>
[0.8.0] - 2025-01-10<br>
<br>
The minor version bump in this release is due to the changes to cURL error =
output line format.<br>
<br>
- [Changed](<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__git.yoctoproject.org_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298e=
dae4260b8&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa=
_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DmIPRVLqV0YtBNpv=
FEK2lx_yMVOKl97dZmykGZmoF5ak&amp;e=3D" rel=3D"noreferrer" target=3D"_blank"=
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.or=
g_opkg_commit_-3Fid-3Dab03377868256427279b36c4b2a298edae4260b8&amp;d=3DDwID=
Ag&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIG=
RfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZ=
QUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DmIPRVLqV0YtBNpvFEK2lx_yMVOKl97dZmykGZ=
moF5ak&amp;e=3D</a> ) the error output for the curl download backend, to no=
w report the HTTP error code for failed requests.<br>
=C2=A0 - e.g. `error: log_curl_download_error: Failed to download headers o=
f <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar=
_all_Packages.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9=
ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DQqLBPxOR=
GA-2bg2AQKvBsTC67wCvqYk34YbKvGn_nZA&amp;e=3D" rel=3D"noreferrer" target=3D"=
_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__foo.bar_all_=
Packages.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckf=
diw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3Am=
Xa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DQqLBPxORGA-2b=
g2AQKvBsTC67wCvqYk34YbKvGn_nZA&amp;e=3D</a> : The requested URL returned er=
ror: 401`<br>
- Enabling debug-verbosity, while using the cURL backend, [will now](<a hre=
f=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoprojec=
t.org_opkg_commit_-3Fid-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&amp;d=3D=
DwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EO=
JXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DWRXRmPZBnebyV5I_9lJfB3NQD9vOx9RQT=
-6tNCpkWQc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fi=
d-3Dce6fede3db931bb0da70d1334cdc4101d0aec702&amp;d=3DDwIDAg&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqS=
P5JA0PhmJEg&amp;s=3DWRXRmPZBnebyV5I_9lJfB3NQD9vOx9RQT-6tNCpkWQc&amp;e=3D</a=
> ) print cURL&#39;s verbose error log to stderr when there is a download f=
ailure.<br>
=C2=A0 - The verbose output may contain confidential information about your=
 cURL transactions. So this is your reminder that debug-verbosity should no=
t be enabled in production systems or sensitive security environments.<br>
- The commandline configuration file option (`-f`) [can now](<a href=3D"htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_op=
kg_commit_-3Fid-3D36d08b93d2859992b624a4ba2f412cfa5c766050&amp;d=3DDwIDAg&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUep=
mFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DbZCqQb2w1a0ECnz2lRCKVG3eJNJL3oHPqmyWgI3ng=
EE&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D36d0=
8b93d2859992b624a4ba2f412cfa5c766050&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0Phm=
JEg&amp;s=3DbZCqQb2w1a0ECnz2lRCKVG3eJNJL3oHPqmyWgI3ngEE&amp;e=3D</a> ) be s=
pecified multiple times, and each configuration file will be loaded and the=
ir settings merged.<br>
- [Fixed](<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A_=
_git.yoctoproject.org_opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b21=
5602b63&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_o=
m0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DvSeX1FD9VJlpr48mH=
M00oqMqnamxNCdeCanf6jfXIB0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_=
opkg_commit_-3Fid-3Dc87188d7535684fddb8cf80993c147b215602b63&amp;d=3DDwIDAg=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQU=
epmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DvSeX1FD9VJlpr48mHM00oqMqnamxNCdeCanf6jf=
XIB0&amp;e=3D</a> ) a bug in control field parsing where custom fields whos=
e keys are similar to other fields could be confused by the parser.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
3 +--<br>
=C2=A0.../opkg/{<a href=3D"http://opkg_0.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2=
1 +++++++++++--------<br>
=C2=A02 files changed, 13 insertions(+), 11 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.7.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"ht=
tp://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=
 (77%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devto=
ols/opkg/opkg/run-ptest<br>
index 5fb7077eec9..8cf09adba57 100644<br>
--- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
@@ -1,5 +1,4 @@<br>
=C2=A0#!/bin/sh<br>
<br>
=C2=A0OPKG_PATH=3D$(which opkg)<br>
-<br>
-make OPKG_PATH=3D$OPKG_PATH run-tests<br>
+make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_PATH=
=3D$OPKG_PATH<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.9.0.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
index 95480b47164..9fa32268541 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
@@ -18,31 +18,31 @@ SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN=
-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwIDAg&amp;c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1D=
ULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5s=
PqSP5JA0PhmJEg&amp;s=3D8vk6XZUJNngLp9vV8HMpWCe8vk4qwdGAZm8qBkBQWq0&amp;e=3D=
" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-=
257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0Ph=
mJEg&amp;s=3D8vk6XZUJNngLp9vV8HMpWCe8vk4qwdGAZm8qBkBQWq0&amp;e=3D</a> <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee=
26704bf8fe757c54567&quot;<br>
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
+PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3D0N,-DWITH_CURL=3DOFF,curl&quot=
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
@@ -56,6 +56,9 @@ do_install:append () {<br>
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
View/Reply Online (#224962): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
4962&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0Q=
TZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3D45-3msp4QospqmXenCby=
jkIwjGnmvCB-OPCJGFVG-YQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_224962&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJ=
Eg&amp;s=3D45-3msp4QospqmXenCbyjkIwjGnmvCB-OPCJGFVG-YQ&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_115787032_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPXzsX=
Mz5sPqSP5JA0PhmJEg&amp;s=3DO2uu_pPIt_WagR7LgFNNJhModg3ZYMDGagM9BhJil4E&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_115787032_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EO=
JXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DO2uu_pPIt_WagR7LgFNNJhModg3ZYMDGa=
gM9BhJil4E&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZRhYzrs9J6EOJXLZQUepmFPX=
zsXMz5sPqSP5JA0PhmJEg&amp;s=3DldaGlN5LsJ6hZp6rteo-SqYIYkNOySIiCIXEI5NwjZc&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DBKCxl9ZC3AmXa_om0QTZ=
RhYzrs9J6EOJXLZQUepmFPXzsXMz5sPqSP5JA0PhmJEg&amp;s=3DldaGlN5LsJ6hZp6rteo-Sq=
YIYkNOySIiCIXEI5NwjZc&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000051c1fa064144ccd7--

