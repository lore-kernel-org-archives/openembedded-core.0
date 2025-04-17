Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23272C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:39:59 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.12098.1744904390890078205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=URCsu8Xg;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e728cd7150dso386874276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744904390; x=1745509190; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/5rqQsamj3GJjZcmcxv2gwByTK/jorCtIfW6G4g+38=;
        b=URCsu8Xg7Ostetkve0QlnwewfCZRr9ouN82Hc6TI3jOg7mAU/GMTv0d1j6/YjHFSpa
         kDj5VtbE+mLdbCxhvpYhS6et7VRbqkP8agQX0RfkgiBiKjOExh0UejJKh+NoaXGEByS3
         VztsfBYd2wjrP7zqYsBft8aiWn1Y2NWHL/9ChueAQPu+OcLXdKg5oQPaDBoerYHiSfnz
         u1/uInoifMKMN7vHXnkLWjeD62kNUcekcWWYY2HQ2e3+8mk73/pyhUdOU6mvWyiJDk5h
         CEpjO48mkYt8xed5t0BPNwJAOAxSZbS5WdpelbbF/aD/j14ttLq4A8+dfwQ58obR81jX
         e6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904390; x=1745509190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/5rqQsamj3GJjZcmcxv2gwByTK/jorCtIfW6G4g+38=;
        b=Dp+ZBgYRCjD3rm7nyn88clzfdc9bNQd5AFDDKe618YzICkAjlygXDHLHJkSvU608n2
         ykuifOl8cIjPw0rDmgJLV6v+Fyn3yUmXkDe6N5kJElb/aTnBb8ypCuOeS7JmsuDGISdi
         5/Kixdc+AiY0JnmbHMoBYFZlXVaACw6i+kON1GMEegLfJ0UhcrZD/9m4YZchLUNjC3zG
         k/V2JrHL/xTuIRD8Su6ro5fywC/tBrFVxi9a13Z5ILDMlCGulzgynjKN0wC03CP39JhM
         OBcmwYrtoEKOrq5qM6Vv0B6OCzm3MYXyBucZefpiNri6kxt2zQsCd8resgZXwIlwFBu4
         cjAg==
X-Gm-Message-State: AOJu0Ywk5sXf0Cv/BSPn/kIKYbARVyVHLOWQP/abJW0mdL91KVZPv3PN
	wr9e2CoLhP3ZhBPgy2n+A9MFZipVwJreFngoG1pvOpTcC7rAWSX1RptUZevoxndn5E/7n6UnRAT
	yZ5m8eqzYTS94z0flaute75gtBWMp6lJ/sxGCyg==
X-Gm-Gg: ASbGncu+p3IRgnKabFrTSFtkF5UxbmDPeYXFuSbZGNx9Ht6xwf2njWoaS3dHEbf2ogf
	LbDbD8TXoNnwPTBRfwp1hP5qLTa9scLPPoISo5YnE/kPa8iCycg441h8FPyIRBqzWYCQtdigBOp
	apXN56SBHpff83SLmRlvLknVZJOFOzQnOFdnTZx7pkCgjs51RA+A1LXIEhdfCdT0o+
X-Google-Smtp-Source: AGHT+IGj2uxTpKEeG1xYbFV4OIaYYyPQRFgU9YeplAbx3sEyIv/YlDyakFTOo2ebTMNY+cEDz5/RKpbANX39PiaacDE=
X-Received: by 2002:a05:6902:1445:b0:e60:974a:fbde with SMTP id
 3f1490d57ef6-e7275f286d8mr8986798276.46.1744904389858; Thu, 17 Apr 2025
 08:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250417022147.2776717-1-changqing.li@windriver.com>
In-Reply-To: <20250417022147.2776717-1-changqing.li@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Apr 2025 08:39:38 -0700
X-Gm-Features: ATxdqUHHKHOmwicxA9zKguLDXvMiZiPM1lsSu9CQXgZbsczm7zzYZ3zhK1ZrhOE
Message-ID: <CAOSpxdYfQwhauJe_qZkxXmX7n4fxjX1FrL1RAKfs7J==qLnUEA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] buildtools-tarball: move setting
 of envvars to respective envfile
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215102

The third patch in this series seems to be missing. Is this intentional?

Steve

On Wed, Apr 16, 2025 at 7:21=E2=80=AFPM Changqing Li via
lists.openembedded.org
<changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> * make git,curl,python3-requests align with openssl, move the setting of
>   envvars into respective envfile
> * for environment.d-openssl.sh, also check if ca-certificates.crt exist
>   before export envvars
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../openssl/files/environment.d-openssl.sh            |  7 +++++--
>  meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
>  meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
>  meta/recipes-devtools/git/git_2.44.1.bb               |  8 ++++++++
>  .../environment.d-python3-requests.sh                 |  3 +++
>  .../python/python3-requests_2.32.3.bb                 | 11 +++++++++++
>  meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
>  meta/recipes-support/curl/curl_8.7.1.bb               |  9 +++++++++
>  8 files changed, 42 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
>  create mode 100644 meta/recipes-devtools/python/python3-requests/environ=
ment.d-python3-requests.sh
>  create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh
>
> diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openss=
l.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> index 6f23490c87..6cb82d7386 100644
> --- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> +++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> @@ -1,5 +1,8 @@
>  export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
> -export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
> -export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-cert=
ificates.crt"
> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];t=
hen
> +    export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
> +    export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-=
certificates.crt"
> +    export BB_ENV_PASSTHROUGH_ADDITIONS=3D"${BB_ENV_PASSTHROUGH_ADDITION=
S:-} SSL_CERT_DIR SSL_CERT_FILE"
> +fi
>  export OPENSSL_MODULES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
>  export OPENSSL_ENGINES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
> index e2ce5b3ecf..414c266663 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -73,12 +73,6 @@ create_sdk_files:append () {
>         touch $script
>         echo 'export PATH=3D"${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPAT=
HNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDK=
PATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
>         echo 'export OECORE_NATIVE_SYSROOT=3D"${SDKPATHNATIVE}"' >> $scri=
pt
> -       if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-=
certificates.crt" ]; then
> -               echo 'export GIT_SSL_CAINFO=3D"${SDKPATHNATIVE}${sysconfd=
ir}/ssl/certs/ca-certificates.crt"' >>$script
> -               echo 'export SSL_CERT_FILE=3D"${SDKPATHNATIVE}${sysconfdi=
r}/ssl/certs/ca-certificates.crt"' >>$script
> -               echo 'export REQUESTS_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysc=
onfdir}/ssl/certs/ca-certificates.crt"' >>$script
> -               echo 'export CURL_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysconfd=
ir}/ssl/certs/ca-certificates.crt"' >>$script
> -       fi
>         echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_pat=
h pkg-config 2>/dev/null)' >>$script
>         echo 'export PKG_CONFIG_LIBDIR=3D${SDKPATHNATIVE}/${libdir}/pkgco=
nfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgcon=
fig:/usr/share/pkgconfig}' >>$script
>         echo 'unset HOST_PKG_PATH'
> diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/re=
cipes-devtools/git/git/environment.d-git.sh
> new file mode 100644
> index 0000000000..18104f0528
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git/environment.d-git.sh
> @@ -0,0 +1,3 @@
> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];t=
hen
> +    export GIT_SSL_CAINFO=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-c=
ertificates.crt"
> +fi
> diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-devto=
ols/git/git_2.44.1.bb
> index 53d67eb40a..7229b9ae0c 100644
> --- a/meta/recipes-devtools/git/git_2.44.1.bb
> +++ b/meta/recipes-devtools/git/git_2.44.1.bb
> @@ -13,6 +13,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-=
${PV}.tar.gz;name=3Dtarball \
>             file://0001-config.mak.uname-do-not-force-RHEL-7-specific-bui=
ld-.patch \
>             "
>
> +SRC_URI:append:class-nativesdk =3D " \
> +           file://environment.d-git.sh \
> +           "
> +
>  S =3D "${WORKDIR}/git-${PV}"
>
>  LIC_FILES_CHKSUM =3D "\
> @@ -115,6 +119,9 @@ do_install:append:class-nativesdk() {
>                 GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_PA=
TH} \
>                 GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TEMP=
LATE_DIR}
>         perl_native_fixup
> +
> +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +       install -m 644 ${WORKDIR}/environment.d-git.sh ${D}${SDKPATHNATIV=
E}/environment-setup.d/git.sh
>  }
>
>  FILES:${PN} +=3D "${datadir}/git-core ${libexecdir}/git-core/"
> @@ -155,6 +162,7 @@ FILES:${PN}-tk =3D " \
>
>  PACKAGES =3D+ "gitweb"
>  FILES:gitweb =3D "${datadir}/gitweb/"
> +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/git.sh"
>  RDEPENDS:gitweb =3D "perl"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-=
python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environ=
ment.d-python3-requests.sh
> new file mode 100644
> index 0000000000..f2eee203ca
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3=
-requests.sh
> @@ -0,0 +1,3 @@
> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];t=
hen
> +    export REQUESTS_CA_BUNDLE=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/=
ca-certificates.crt"
> +fi
> diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/me=
ta/recipes-devtools/python/python3-requests_2.32.3.bb
> index 4f0638b50c..36ff75f87d 100644
> --- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
> +++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
> @@ -3,10 +3,19 @@ HOMEPAGE =3D "https://requests.readthedocs.io"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
>
> +SRC_URI:append:class-nativesdk =3D " \
> +           file://environment.d-python3-requests.sh \
> +"
> +
>  SRC_URI[sha256sum] =3D "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402=
399eaf68af20a760"
>
>  inherit pypi python_setuptools_build_meta
>
> +do_install:append:class-nativesdk() {
> +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +       install -m 644 ${WORKDIR}/environment.d-python3-requests.sh ${D}$=
{SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
> +}
> +
>  RDEPENDS:${PN} +=3D " \
>      python3-certifi \
>      python3-email \
> @@ -19,6 +28,8 @@ RDEPENDS:${PN} +=3D " \
>      python3-compression \
>  "
>
> +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/python3-requests.sh"
> +
>  CVE_PRODUCT =3D "requests"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/=
recipes-support/curl/curl/environment.d-curl.sh
> new file mode 100644
> index 0000000000..0d53aabb8e
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
> @@ -0,0 +1,3 @@
> +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];t=
hen
> +    export CURL_CA_BUNDLE=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-c=
ertificates.crt"
> +fi
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index ddd591dd96..8f074f4ff7 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -21,6 +21,11 @@ SRC_URI =3D " \
>      file://CVE-2024-8096.patch \
>      file://CVE-2024-9681.patch \
>  "
> +
> +SRC_URI:append:class-nativesdk =3D " \
> +           file://environment.d-curl.sh \
> +"
> +
>  SRC_URI[sha256sum] =3D "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5=
855ebc0c659710cd"
>
>  # Curl has used many names over the years...
> @@ -104,6 +109,8 @@ do_install:append:class-target() {
>
>  do_install:append:class-nativesdk() {
>         fix_absolute_paths
> +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +       install -m 644 ${WORKDIR}/environment.d-curl.sh ${D}${SDKPATHNATI=
VE}/environment-setup.d/curl.sh
>  }
>
>  do_compile_ptest() {
> @@ -152,6 +159,8 @@ RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
>
>  FILES:${PN} +=3D "${datadir}/zsh"
>
> +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-se=
tup.d/curl.sh"
> +
>  inherit multilib_script
>  MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/curl-config"
>
> --
> 2.44.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215022): https://lists.openembedded.org/g/openembedde=
d-core/message/215022
> Mute This Topic: https://lists.openembedded.org/mt/112307271/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

