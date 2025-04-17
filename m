Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FDEC369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:43:29 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.12086.1744904600884816181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TP34TrAb;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7023843e467so8397787b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744904600; x=1745509400; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7D3fKYpRJ+uRnd09GsjUtpejm/rzNCAHNMpkZj+uYQc=;
        b=TP34TrAbzkuzmxeEx05/idlYD5gwwX+QqsehJJTR9Pu36h5oWuu0I13bXOg+DBDaUd
         yDNZ9Yw0mSN/cLvVjxMVPEiNYVCcXo++2FJSAsU7REo83PGt6ZS93iJllVpAU3gKQMbP
         95SLtgMxiBAMMkhte/QOl6+Vv0cRSlO9qrQvT/99BtELFUqCt+OXuWVzMXLgygw5YA+E
         vCfGhjvcoVB2ElTOSUimJj3jJmUNIllTKO9yKrjS/1tDscWPhEZQTDYKbk783YGyyO8W
         KacaIMpU1hQyhFL9fuTyyxrUwOeiFRwyfqK5DObcQ5kvLUX7bklrokkkZkLfM09Y7b3J
         h9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904600; x=1745509400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7D3fKYpRJ+uRnd09GsjUtpejm/rzNCAHNMpkZj+uYQc=;
        b=RHcbA3yQTZRIyspSs1eUunOVwLCHq+lM5r9IbYK+jh9WF9O3PjY+iwT2HgbckQHkPg
         JI/N2ODayuzGeWQva/CvrgwtFmcG/fpJdxfNU0Sdlljf+s+XbjIZIklWVW2L8i1jip/5
         C5wSniR5BPsWj8f8XlEq2fkByzIm2Mh8+cPta7DKfTDnfjG+Jtk8iUTW/5uRGQqlDAzL
         6JaC3IPeOmJSwe7YZAFqRKc3gLs6OYYqP3a7zii+34hUQkTCRsB0w0+hR/IzIcNolCxz
         yKqKlwzRd4qomWWe6StCuRVUpi4kodMRHEJu+L4nD75QUScwYfMMVrKfnlQ8GfMpi9rh
         gbew==
X-Gm-Message-State: AOJu0YxlDx9HQeV8ISHiESuwwZVNrRUMNMrggk1miiH77ZO9p6eadfoZ
	oXCbuxUJRjxD6vHvKZq2Up3xMan2+VQFvJvaqEcbtmye2FfyPvubSVWyAUcgKfrd6Ofr3iSVFaX
	WtOgbSWTrxBCabx1krjn9ob2MYywBzLUJbD9Amw==
X-Gm-Gg: ASbGnct4G4eR3XqwZuueKNfG/QTVmNJaHI7Ma5io5v/ZKNxPHFpgI7/xYH+9uxiYrcF
	DJ3mA8WIVlhTFdqgrmcHGYzyvVz5sNjvfNrZ2UL0Wo2iP14B+ZSO+k9pvDX5BGlPkrKZb/2ckEo
	Cwnvn8h/HHl5JiDvSfJ7ndaAevn2TypH0V7LcZUq6zyR7+ogrJxjYj0Q==
X-Google-Smtp-Source: AGHT+IFUkUwInTf7Rar1MxhQRt2DfbKCu9KyC2tJvM9T2U2Alk8L+vuXXeiE3G41qj8/SyR9pnwK6GWGgAtVOy/2dT0=
X-Received: by 2002:a05:690c:4c11:b0:702:4eb0:6af with SMTP id
 00721157ae682-706b338e971mr95816107b3.31.1744904599908; Thu, 17 Apr 2025
 08:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250417022147.2776717-1-changqing.li@windriver.com> <CAOSpxdYfQwhauJe_qZkxXmX7n4fxjX1FrL1RAKfs7J==qLnUEA@mail.gmail.com>
In-Reply-To: <CAOSpxdYfQwhauJe_qZkxXmX7n4fxjX1FrL1RAKfs7J==qLnUEA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Apr 2025 08:43:09 -0700
X-Gm-Features: ATxdqUHxymoOg1ydpw6VW7L3lOb6YnmdRsjDGjWsHAdgQRM_9GoRRlC03jjDY3c
Message-ID: <CAOSpxdZvrcCgyRvGKpubRocvpiy1WA3_FPMw6zRtAxTxgNYgmw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] buildtools-tarball: move setting
 of envvars to respective envfile
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215103

On Thu, Apr 17, 2025 at 8:39=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> The third patch in this series seems to be missing. Is this intentional?

Also, can you add a cover letter explaining why this series is
necessary.  Is this fixing a bug?

Thanks,

Steve

> On Wed, Apr 16, 2025 at 7:21=E2=80=AFPM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > * make git,curl,python3-requests align with openssl, move the setting o=
f
> >   envvars into respective envfile
> > * for environment.d-openssl.sh, also check if ca-certificates.crt exist
> >   before export envvars
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  .../openssl/files/environment.d-openssl.sh            |  7 +++++--
> >  meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
> >  meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
> >  meta/recipes-devtools/git/git_2.44.1.bb               |  8 ++++++++
> >  .../environment.d-python3-requests.sh                 |  3 +++
> >  .../python/python3-requests_2.32.3.bb                 | 11 +++++++++++
> >  meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
> >  meta/recipes-support/curl/curl_8.7.1.bb               |  9 +++++++++
> >  8 files changed, 42 insertions(+), 8 deletions(-)
> >  create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
> >  create mode 100644 meta/recipes-devtools/python/python3-requests/envir=
onment.d-python3-requests.sh
> >  create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.s=
h
> >
> > diff --git a/meta/recipes-connectivity/openssl/files/environment.d-open=
ssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> > index 6f23490c87..6cb82d7386 100644
> > --- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> > +++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> > @@ -1,5 +1,8 @@
> >  export OPENSSL_CONF=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
> > -export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
> > -export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-ce=
rtificates.crt"
> > +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ]=
;then
> > +    export SSL_CERT_DIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
> > +    export SSL_CERT_FILE=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/c=
a-certificates.crt"
> > +    export BB_ENV_PASSTHROUGH_ADDITIONS=3D"${BB_ENV_PASSTHROUGH_ADDITI=
ONS:-} SSL_CERT_DIR SSL_CERT_FILE"
> > +fi
> >  export OPENSSL_MODULES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/=
"
> >  export OPENSSL_ENGINES=3D"$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
> > diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipe=
s-core/meta/buildtools-tarball.bb
> > index e2ce5b3ecf..414c266663 100644
> > --- a/meta/recipes-core/meta/buildtools-tarball.bb
> > +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> > @@ -73,12 +73,6 @@ create_sdk_files:append () {
> >         touch $script
> >         echo 'export PATH=3D"${SDKPATHNATIVE}${bindir_nativesdk}:${SDKP=
ATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${S=
DKPATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
> >         echo 'export OECORE_NATIVE_SYSROOT=3D"${SDKPATHNATIVE}"' >> $sc=
ript
> > -       if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/c=
a-certificates.crt" ]; then
> > -               echo 'export GIT_SSL_CAINFO=3D"${SDKPATHNATIVE}${syscon=
fdir}/ssl/certs/ca-certificates.crt"' >>$script
> > -               echo 'export SSL_CERT_FILE=3D"${SDKPATHNATIVE}${sysconf=
dir}/ssl/certs/ca-certificates.crt"' >>$script
> > -               echo 'export REQUESTS_CA_BUNDLE=3D"${SDKPATHNATIVE}${sy=
sconfdir}/ssl/certs/ca-certificates.crt"' >>$script
> > -               echo 'export CURL_CA_BUNDLE=3D"${SDKPATHNATIVE}${syscon=
fdir}/ssl/certs/ca-certificates.crt"' >>$script
> > -       fi
> >         echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_p=
ath pkg-config 2>/dev/null)' >>$script
> >         echo 'export PKG_CONFIG_LIBDIR=3D${SDKPATHNATIVE}/${libdir}/pkg=
config:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgc=
onfig:/usr/share/pkgconfig}' >>$script
> >         echo 'unset HOST_PKG_PATH'
> > diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/=
recipes-devtools/git/git/environment.d-git.sh
> > new file mode 100644
> > index 0000000000..18104f0528
> > --- /dev/null
> > +++ b/meta/recipes-devtools/git/git/environment.d-git.sh
> > @@ -0,0 +1,3 @@
> > +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ]=
;then
> > +    export GIT_SSL_CAINFO=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca=
-certificates.crt"
> > +fi
> > diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-dev=
tools/git/git_2.44.1.bb
> > index 53d67eb40a..7229b9ae0c 100644
> > --- a/meta/recipes-devtools/git/git_2.44.1.bb
> > +++ b/meta/recipes-devtools/git/git_2.44.1.bb
> > @@ -13,6 +13,10 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/gi=
t-${PV}.tar.gz;name=3Dtarball \
> >             file://0001-config.mak.uname-do-not-force-RHEL-7-specific-b=
uild-.patch \
> >             "
> >
> > +SRC_URI:append:class-nativesdk =3D " \
> > +           file://environment.d-git.sh \
> > +           "
> > +
> >  S =3D "${WORKDIR}/git-${PV}"
> >
> >  LIC_FILES_CHKSUM =3D "\
> > @@ -115,6 +119,9 @@ do_install:append:class-nativesdk() {
> >                 GIT_EXEC_PATH=3D'`dirname $''realpath`'/${REL_GIT_EXEC_=
PATH} \
> >                 GIT_TEMPLATE_DIR=3D'`dirname $''realpath`'/${REL_GIT_TE=
MPLATE_DIR}
> >         perl_native_fixup
> > +
> > +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> > +       install -m 644 ${WORKDIR}/environment.d-git.sh ${D}${SDKPATHNAT=
IVE}/environment-setup.d/git.sh
> >  }
> >
> >  FILES:${PN} +=3D "${datadir}/git-core ${libexecdir}/git-core/"
> > @@ -155,6 +162,7 @@ FILES:${PN}-tk =3D " \
> >
> >  PACKAGES =3D+ "gitweb"
> >  FILES:gitweb =3D "${datadir}/gitweb/"
> > +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-=
setup.d/git.sh"
> >  RDEPENDS:gitweb =3D "perl"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-devtools/python/python3-requests/environment.=
d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/envir=
onment.d-python3-requests.sh
> > new file mode 100644
> > index 0000000000..f2eee203ca
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-requests/environment.d-pytho=
n3-requests.sh
> > @@ -0,0 +1,3 @@
> > +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ]=
;then
> > +    export REQUESTS_CA_BUNDLE=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/cert=
s/ca-certificates.crt"
> > +fi
> > diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/=
meta/recipes-devtools/python/python3-requests_2.32.3.bb
> > index 4f0638b50c..36ff75f87d 100644
> > --- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
> > +++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
> > @@ -3,10 +3,19 @@ HOMEPAGE =3D "https://requests.readthedocs.io"
> >  LICENSE =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0=
d1658"
> >
> > +SRC_URI:append:class-nativesdk =3D " \
> > +           file://environment.d-python3-requests.sh \
> > +"
> > +
> >  SRC_URI[sha256sum] =3D "55365417734eb18255590a9ff9eb97e9e1da868d4ccd64=
02399eaf68af20a760"
> >
> >  inherit pypi python_setuptools_build_meta
> >
> > +do_install:append:class-nativesdk() {
> > +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> > +       install -m 644 ${WORKDIR}/environment.d-python3-requests.sh ${D=
}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
> > +}
> > +
> >  RDEPENDS:${PN} +=3D " \
> >      python3-certifi \
> >      python3-email \
> > @@ -19,6 +28,8 @@ RDEPENDS:${PN} +=3D " \
> >      python3-compression \
> >  "
> >
> > +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-=
setup.d/python3-requests.sh"
> > +
> >  CVE_PRODUCT =3D "requests"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/met=
a/recipes-support/curl/curl/environment.d-curl.sh
> > new file mode 100644
> > index 0000000000..0d53aabb8e
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
> > @@ -0,0 +1,3 @@
> > +if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ]=
;then
> > +    export CURL_CA_BUNDLE=3D"${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca=
-certificates.crt"
> > +fi
> > diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-sup=
port/curl/curl_8.7.1.bb
> > index ddd591dd96..8f074f4ff7 100644
> > --- a/meta/recipes-support/curl/curl_8.7.1.bb
> > +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> > @@ -21,6 +21,11 @@ SRC_URI =3D " \
> >      file://CVE-2024-8096.patch \
> >      file://CVE-2024-9681.patch \
> >  "
> > +
> > +SRC_URI:append:class-nativesdk =3D " \
> > +           file://environment.d-curl.sh \
> > +"
> > +
> >  SRC_URI[sha256sum] =3D "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68=
e5855ebc0c659710cd"
> >
> >  # Curl has used many names over the years...
> > @@ -104,6 +109,8 @@ do_install:append:class-target() {
> >
> >  do_install:append:class-nativesdk() {
> >         fix_absolute_paths
> > +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> > +       install -m 644 ${WORKDIR}/environment.d-curl.sh ${D}${SDKPATHNA=
TIVE}/environment-setup.d/curl.sh
> >  }
> >
> >  do_compile_ptest() {
> > @@ -152,6 +159,8 @@ RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
> >
> >  FILES:${PN} +=3D "${datadir}/zsh"
> >
> > +FILES:${PN}:append:class-nativesdk =3D " ${SDKPATHNATIVE}/environment-=
setup.d/curl.sh"
> > +
> >  inherit multilib_script
> >  MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/curl-config"
> >
> > --
> > 2.44.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#215022): https://lists.openembedded.org/g/openembed=
ded-core/message/215022
> > Mute This Topic: https://lists.openembedded.org/mt/112307271/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

