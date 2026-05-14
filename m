Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E37CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 16:29:46 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15561.1778776185194183067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 09:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F2eueePc;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65e15fb394bso1138786d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 09:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778776184; cv=none;
        d=google.com; s=arc-20240605;
        b=HfEPlpdZk5kEQQPAp3yFR2nzorkrUt4ZgMw2HWAPHoTc1TXSSmmxlSBsQon5AW8yvS
         Nyb/0jh0X5vee9CorUZp7izasY6V4L0OmmHdvKZtNu4H499W7UoIrrAOJQ7BwgBqSvgh
         Ms2wnK3Le18nLyHb6bqt9Q8qEi6oRMvd6CDIFOP9i1BCEJmPXWz4ilKiDV0UalNYQHkF
         mRL8bNNPG5lYGFJewJ54MV0Edm1dur6LhG5qxr0IlmMh7E1rLuhJMDWmMk6xeAVJ/bCI
         btSisNYAyppHWEt92HpJDirT1PpAjRUmoIc3mBJ7Gg1oIAXvFkCVfvWEyYdj2JjlF90K
         arzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xUVmA1aSOgyOjvjYt9novwx/YdDkXgz30Bpnj0Z+qso=;
        fh=iLKbi4EtRTLXj0PDlEuSSUEfvrkxWxR6BFalA3Tc2xg=;
        b=Dkgr4Ih2wc+txy0ujBC0/QvXVAG0x5uQfYwow5d9Jd2FqJaqpOXzAJsMhZXEFMWg0e
         nsARnIBRgCbrYgfimtqHGDMMh1fi1xRWnVA11nxiH5x0avq1TTwIVMKT3qJMUl705JWQ
         srLLorvd7olLzw8EJ0hYCKGY9BgZgxbZCLOxHvIhFqlqXtag1m7ewAQOKW8BlkzauWCD
         v3bfYbhON8qlGnSW1Tqq+OfQeqw0/HZE8wxqbqvdd3hhINcRsKKnmXfrSsCMqUOQc4Os
         QxkCj4sgGk7SNGFrIbuJOCsq8eNgnMmRAxqP9bjz5dsTlgV2P75gpzPuK1X6vuSOwAlr
         z9cA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778776184; x=1779380984; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xUVmA1aSOgyOjvjYt9novwx/YdDkXgz30Bpnj0Z+qso=;
        b=F2eueePc5Cvjrm9xjyj5En1Ed70DN0mCwIc3ahjLIX+7rdcodjR36i2ILxErquUjNx
         ov9Ky3SYyEcR1ut49OFcTQAJOB4HL3o/LCwkUukBR2W6kt7sb8qRelEb/RA48nKcsKF+
         YfeZ4gJha57/yPkzfBv2Uba2QzLctJTQue6SzG5wCOSvMTq6rokktqnXeHLgll9VvWRG
         eaiZBqYwVctMbsNElJujU0fg2UdDp7sjUk65j0Ro8EGr8+/TsA08X66f3o8sojxNrPMG
         m2YoUJXxpcHILhGBBlDcpqtAM6lRi8ur7/ArkSZpdKdFJrYrvbt85sRujniAcY6fdvtZ
         vqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778776184; x=1779380984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUVmA1aSOgyOjvjYt9novwx/YdDkXgz30Bpnj0Z+qso=;
        b=YTOILtuQDOrVWS78W+AIMY0GLovAx1wGSyzOQ9jDT/23k0k8YCG6w4y50/0hu8j3hj
         y1AgriLfaTSBcPDvY4rVDBVU2tU22m2d1kPuJxp2yKf5Z0mmaFJlT0lZ8tHm8CZfU5B5
         vDKKiScG6ERHpX+s3kdPMH6bhjjhoO+PgsCWhkbNdblBW8oOJshu9Swmdt/FiYEtsf07
         qZS2pMjaXWVvnH8ZfP30RbnPK+FQDZRjDF6H5fE/4YzsgiG7JRBhQxU1CzyTnlEat0oX
         /pT26Jgx1T6osUDEshNsFyO/RTMCIyeQ2YnqGxr+lZvGe1xyF5Sai239xlAq30QiEa64
         Rzog==
X-Gm-Message-State: AOJu0YzEx2Fx4R0ho94WXsc2xQ8fXGT9M0X2jDP3m15wjJFh9l+DOQkq
	CIeyZwwXxUY5LYmxe/WboLCOUgCK5zwhQuBaG5oNS55h+jc6oXgcbF1j8Ye1TB4bUQItU0vTh+a
	VsPZsFXH1w/kBQ2a9Z1D4Is3xinAadeI=
X-Gm-Gg: Acq92OG5PeZatTMSlfJsZmfSXKqa074/T3hvGlCExUJT7RYOVewNY5G3LUETA9eC7yB
	jjdU6akjLfNUNd0uJRyGp6+ElNSgCoyh7yGTO/Rr8L/rWGEkLlzJh3N9fsQ79tdRA46tzQBM2UL
	8OPwvDVVXvn0sDQ2pYOpH6KJrNpk01e8c+0eQD18PW2+qQWGlzQdeVIGZck/2yZs3+TFSoOy/xf
	BAxeLURJ9lzriM5k8T0Lo4HsZM0DD7X+pBerItqHiw3o+/aVzWFdQByMgWnCftEA1SBqTu21T33
	5gpc8Iwcavt3QJ/+CdlBI+uzHDPtTgXgATsziq62N5k2HL8jxrijk5pgIM8Np7a3qTCYNYyZGET
	FfxrKGFe4DVc/3o8U50rutfK8Q24E+OY6f7vStjLJ8XApB/N/tGRpLrENeQwrqY/W0AaAROInvC
	apwbioCc8LD/RSXApzyTFa0hGdgQ==
X-Received: by 2002:a05:690e:d03:b0:651:bc7e:4687 with SMTP id
 956f58d0204a3-65df82a3e6fmr7846553d50.42.1778776183703; Thu, 14 May 2026
 09:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260514133748.219486-1-ross.burton@arm.com>
In-Reply-To: <20260514133748.219486-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 May 2026 09:29:32 -0700
X-Gm-Features: AVHnY4IEib7xjRhmoX_Bqyky-nsOkqvXKjZgTejc82_kkD60TpC8RoZJ-UtrM8A
Message-ID: <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000908e7e0651c99ad3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 16:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237044

--000000000000908e7e0651c99ad3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How confident are we with the release happening on time before we release
in next 5 months time

On Thu, May 14, 2026, 6:37=E2=80=AFAM Ross Burton via lists.openembedded.or=
g
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> As per upstream[1], 0.9-rc4 is pretty much what is going to be in the
> 0.9 release, and upgrading to this now will make upgrading to the final
> release a lot simplier.
>
> As there are no tarballs for the release candidates, switch to git. This
> means we need to disable the manpages as they need xmltoman to build.
>
> Delete all of the backported CVE patches as they're included in this
> release. The cvelistv5 database has version information on all of these
> CVEs, so they don't reappear in reports.
>
> Delete invalid-service.patch, fixed upstream differently in [2].
>
> Upstream has deleted the in-tree init scripts, so copy them from before
> deletion and add alongside the recipe.
>
> Consolidate the systemd options, and depend on libsystemd as avahi links
> to that instead of duplicating the code.
>
> Pass --runstatedir so that /run is used as expected.
>
> [1] https://github.com/avahi/avahi/issues/503#issuecomment-4443016376
> [2] avahi 93b1436 ("core: no longer supply bogus services to callbacks")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../avahi/{avahi_0.8.bb =3D> avahi_0.9.bb}      |  52 ++--
>  ...01-Fix-opening-etc-resolv.conf-error.patch |   2 +-
>  .../avahi/files/CVE-2023-1981.patch           |  58 -----
>  .../avahi/files/CVE-2023-38469-1.patch        |  48 ----
>  .../avahi/files/CVE-2023-38469-2.patch        |  65 -----
>  .../avahi/files/CVE-2023-38470-1.patch        |  59 -----
>  .../avahi/files/CVE-2023-38470-2.patch        |  52 ----
>  .../avahi/files/CVE-2023-38471-1.patch        |  73 ------
>  .../avahi/files/CVE-2023-38471-2.patch        |  52 ----
>  .../avahi/files/CVE-2023-38472.patch          |  46 ----
>  .../avahi/files/CVE-2023-38473.patch          | 110 ---------
>  .../avahi/files/CVE-2024-52615.patch          | 228 ------------------
>  .../avahi/files/CVE-2024-52616.patch          | 104 --------
>  .../avahi/files/CVE-2025-68276.patch          |  68 ------
>  .../avahi/files/CVE-2025-68468.patch          |  32 ---
>  .../avahi/files/CVE-2025-68471.patch          |  36 ---
>  .../avahi/files/CVE-2026-24401.patch          |  74 ------
>  .../avahi/files/CVE-2026-34933-1.patch        | 108 ---------
>  .../avahi/files/CVE-2026-34933-2.patch        |  96 --------
>  .../avahi/files/avahi-daemon.in               | 198 +++++++++++++++
>  .../avahi/files/avahi-dnsconfd.in             | 197 +++++++++++++++
>  .../avahi/files/handle-hup.patch              |  41 ----
>  .../avahi/files/initscript.patch              |  51 ----
>  .../avahi/files/invalid-service.patch         |  29 ---
>  .../avahi/files/local-ping.patch              | 152 ------------
>  25 files changed, 416 insertions(+), 1615 deletions(-)
>  rename meta/recipes-connectivity/avahi/{avahi_0.8.bb =3D> avahi_0.9.bb}
> (83%)
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
>  create mode 100644 meta/recipes-connectivity/avahi/files/avahi-daemon.in
>  create mode 100644 meta/recipes-connectivity/avahi/files/
> avahi-dnsconfd.in
>  delete mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.patc=
h
>  delete mode 100644 meta/recipes-connectivity/avahi/files/initscript.patc=
h
>  delete mode 100644
> meta/recipes-connectivity/avahi/files/invalid-service.patch
>  delete mode 100644 meta/recipes-connectivity/avahi/files/local-ping.patc=
h
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> b/meta/recipes-connectivity/avahi/avahi_0.9.bb
> similarity index 83%
> rename from meta/recipes-connectivity/avahi/avahi_0.8.bb
> rename to meta/recipes-connectivity/avahi/avahi_0.9.bb
> index 0042c3c2e3d..b5b63cf1ee4 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.9.bb
> @@ -18,35 +18,18 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
>
>  file://avahi-daemon/main.c;endline=3D21;md5=3D9ee77368c5407af77caaef1b07=
285969
> \
>
>  file://avahi-client/client.h;endline=3D23;md5=3Df4ac741a25c4f434039ba3e1=
8c8674cf"
>
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
> +SRC_URI =3D "git://
> github.com/avahi/avahi;protocol=3Dhttps;branch=3Dmaster;tag=3Dv0.9-rc4 \
>             file://00avahi-autoipd \
>             file://99avahi-autoipd \
> -           file://initscript.patch \
> +           file://avahi-daemon.in \
> +           file://avahi-dnsconfd.in \
>             file://0001-Fix-opening-etc-resolv.conf-error.patch \
> -           file://handle-hup.patch \
> -           file://local-ping.patch \
> -           file://invalid-service.patch \
> -           file://CVE-2023-1981.patch \
> -           file://CVE-2023-38469-1.patch \
> -           file://CVE-2023-38469-2.patch \
> -           file://CVE-2023-38470-1.patch \
> -           file://CVE-2023-38470-2.patch \
> -           file://CVE-2023-38471-1.patch \
> -           file://CVE-2023-38471-2.patch \
> -           file://CVE-2023-38472.patch \
> -           file://CVE-2023-38473.patch \
> -           file://CVE-2024-52616.patch \
> -           file://CVE-2024-52615.patch \
> -           file://CVE-2025-68276.patch \
> -           file://CVE-2026-24401.patch \
> -           file://CVE-2025-68468.patch \
> -           file://CVE-2025-68471.patch \
> -           file://CVE-2026-34933-1.patch \
> -           file://CVE-2026-34933-2.patch \
>             "
>
> +PV =3D "0.9~rc4"
> +SRCREV =3D "625ca0fac19229f6dfa3a6c6b698ae657187e50c"
> +
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> -SRC_URI[sha256sum] =3D
> "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de798fedda"
>
>  CVE_STATUS[CVE-2021-26720] =3D "not-applicable-platform: Issue only affe=
cts
> Debian/SUSE"
>
> @@ -55,17 +38,20 @@ DEPENDS =3D "expat libcap libdaemon glib-2.0
> glib-2.0-native"
>  # For gtk related PACKAGECONFIGs: gtk, gtk3
>  AVAHI_GTK ?=3D ""
>
> -PACKAGECONFIG ??=3D "dbus ${@bb.utils.contains_any('DISTRO_FEATURES','x1=
1
> wayland','${AVAHI_GTK}','',d)}"
> +PACKAGECONFIG ??=3D "dbus ${@bb.utils.contains_any('DISTRO_FEATURES','x1=
1
> wayland','${AVAHI_GTK}','',d)} ${@bb.utils.filter('DISTRO_FEATURES',
> 'systemd', d)}"
>  PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
>  PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+"
>  PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[libdns_sd] =3D "--enable-compat-libdns_sd --enable-dbus,,d=
bus"
>  PACKAGECONFIG[libevent] =3D "--enable-libevent,--disable-libevent,libeve=
nt"
> +PACKAGECONFIG[systemd] =3D "--enable-libsystemd,--disable-libsystemd
> --without-systemdsystemunitdir,systemd"
>  PACKAGECONFIG[qt5] =3D "--enable-qt5,--disable-qt5,qtbase"
>
>  inherit autotools pkgconfig gettext gobject-introspection github-release=
s
>
> -EXTRA_OECONF =3D "--with-avahi-priv-access-group=3Dadm \
> +EXTRA_OECONF =3D " \
> +             --runstatedir=3D${runtimedir} \
> +             --with-avahi-priv-access-group=3Dadm \
>               --disable-stack-protector \
>               --disable-gdbm \
>               --disable-dbm \
> @@ -75,14 +61,12 @@ EXTRA_OECONF =3D "--with-avahi-priv-access-group=3Dad=
m \
>               --disable-qt4 \
>               --disable-python \
>               --disable-doxygen-doc \
> -             --enable-manpages \
> +             --disable-manpages \
>               ${EXTRA_OECONF_SYSVINIT} \
> -             ${EXTRA_OECONF_SYSTEMD} \
>             "
>
>  # The distro choice determines what init scripts are installed
>  EXTRA_OECONF_SYSVINIT =3D
> "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=3Ddebia=
n','--with-distro=3Dnone',d)}"
> -EXTRA_OECONF_SYSTEMD =3D
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemun=
itdir=3D${systemd_system_unitdir}/','--without-systemdsystemunitdir',d)}"
>
>  do_configure:prepend() {
>      # This m4 file will get in the way of our introspection.m4 with
> special cross-compilation fixes
> @@ -97,9 +81,9 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D "
> avahi-libnss-mdns"
>
>  do_install() {
>         autotools_do_install
> -       rm -rf ${D}/run
> +
> +       rm -rf ${D}${runtimedir}
>         test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty
> ${D}${datadir}/dbus-1
> -       rm -rf ${D}${libdir}/avahi
>
>         # Move example service files out of /etc/avahi/services so we don=
't
>         # advertise ssh & sftp-ssh by default
> @@ -147,9 +131,8 @@ FILES:avahi-daemon =3D "${sbindir}/avahi-daemon \
>                        ${sysconfdir}/avahi/avahi-daemon.conf \
>                        ${sysconfdir}/avahi/hosts \
>                        ${sysconfdir}/avahi/services \
> -                      ${sysconfdir}/dbus-1 \
>                        ${sysconfdir}/init.d/avahi-daemon \
> -                      ${datadir}/dbus-1/interfaces \
> +                      ${datadir}/dbus-1 \
>                        ${datadir}/avahi/avahi-service.dtd \
>                        ${datadir}/avahi/service-types \
>                        ${datadir}/dbus-1/system-services"
> @@ -194,6 +177,11 @@ do_install:append() {
>         install -d ${D}${sysconfdir}/udhcpc.d
>         install ${UNPACKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
>         install ${UNPACKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
> +
> +       install -d ${D}${sysconfdir}/init.d
> +       install ${UNPACKDIR}/avahi-daemon.in
> ${D}${sysconfdir}/init.d/avahi-daemon
> +       install ${UNPACKDIR}/avahi-dnsconfd.in
> ${D}${sysconfdir}/init.d/avahi-dnsconfd
> +       sed -i -e 's,@sbindir@,${sbindir},g' -e 's,@sysconfdir@,${sysconf=
dir},g'
> ${D}${sysconfdir}/init.d/avahi-*
>  }
>
>  # At the time the postinst runs, dbus might not be setup so only restart
> if running
> diff --git
> a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-=
error.patch
> b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-=
error.patch
> index cb8b83fd238..d46b4d88ac8 100644
> ---
> a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-=
error.patch
> +++
> b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.conf-=
error.patch
> @@ -39,7 +39,7 @@ index 548c834..63e28e4 100644
>  +After=3Dsystemd-resolved.service connman.service
>
>   [Service]
> - Type=3Ddbus
> + BusName=3Dorg.freedesktop.Avahi
>  --
>  2.11.0
>
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
> deleted file mode 100644
> index 4d7924d13a6..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -From a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat=
.com>
> -Date: Thu, 17 Nov 2022 01:51:53 +0100
> -Subject: [PATCH] Emit error if requested service is not found
> -
> -It currently just crashes instead of replying with error. Check return
> -value and emit error instead of passing NULL pointer to reply.
> -
> -Fixes #375
> -
> -Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-20=
23-1981.patch?h=3Dubuntu/jammy-security
> -Upstream
> <https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2=
023-1981.patch?h=3Dubuntu/jammy-security-Upstream>
> commit
> https://github.com/lathiat/avahi/commit/a2696da2f2c50ac43b6c4903f72290d5c=
3fa9f6f
> ]
> -CVE: CVE-2023-1981
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-daemon/dbus-protocol.c | 20 ++++++++++++++------
> - 1 file changed, 14 insertions(+), 6 deletions(-)
> -
> -diff --git a/avahi-daemon/dbus-protocol.c b/avahi-daemon/dbus-protocol.c
> -index 70d7687bc..406d0b441 100644
> ---- a/avahi-daemon/dbus-protocol.c
> -+++ b/avahi-daemon/dbus-protocol.c
> -@@ -375,10 +375,14 @@ static DBusHandlerResult
> dbus_get_alternative_host_name(DBusConnection *c, DBusM
> -     }
> -
> -     t =3D avahi_alternative_host_name(n);
> --    avahi_dbus_respond_string(c, m, t);
> --    avahi_free(t);
> -+    if (t) {
> -+        avahi_dbus_respond_string(c, m, t);
> -+        avahi_free(t);
> -
> --    return DBUS_HANDLER_RESULT_HANDLED;
> -+        return DBUS_HANDLER_RESULT_HANDLED;
> -+    } else {
> -+        return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND,
> "Hostname not found");
> -+    }
> - }
> -
> - static DBusHandlerResult
> dbus_get_alternative_service_name(DBusConnection *c, DBusMessage *m,
> DBusError *error) {
> -@@ -389,10 +393,14 @@ static DBusHandlerResult
> dbus_get_alternative_service_name(DBusConnection *c, DB
> -     }
> -
> -     t =3D avahi_alternative_service_name(n);
> --    avahi_dbus_respond_string(c, m, t);
> --    avahi_free(t);
> -+    if (t) {
> -+        avahi_dbus_respond_string(c, m, t);
> -+        avahi_free(t);
> -
> --    return DBUS_HANDLER_RESULT_HANDLED;
> -+        return DBUS_HANDLER_RESULT_HANDLED;
> -+    } else {
> -+        return avahi_dbus_respond_error(c, m, AVAHI_ERR_NOT_FOUND,
> "Service not found");
> -+    }
> - }
> -
> - static DBusHandlerResult dbus_create_new_entry_group(DBusConnection *c,
> DBusMessage *m, DBusError *error) {
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> deleted file mode 100644
> index a078f66102f..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 72842945085cc3adaccfdfa2853771b0e75ef991 Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Mon, 23 Oct 2023 20:29:31 +0000
> -Subject: [PATCH] avahi: core: reject overly long TXT resource records
> -
> -Closes https://github.com/lathiat/avahi/issues/455
> -
> -Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af=
6e3a1cf
> ]
> -CVE: CVE-2023-38469
> -
> -Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ----
> - avahi-core/rr.c | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/avahi-core/rr.c b/avahi-core/rr.c
> -index 7fa0bee..b03a24c 100644
> ---- a/avahi-core/rr.c
> -+++ b/avahi-core/rr.c
> -@@ -32,6 +32,7 @@
> - #include <avahi-common/malloc.h>
> - #include <avahi-common/defs.h>
> -
> -+#include "dns.h"
> - #include "rr.h"
> - #include "log.h"
> - #include "util.h"
> -@@ -688,11 +689,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
> -         case AVAHI_DNS_TYPE_TXT: {
> -
> -             AvahiStringList *strlst;
> -+            size_t used =3D 0;
> -
> --            for (strlst =3D r->data.txt.string_list; strlst; strlst =3D
> strlst->next)
> -+            for (strlst =3D r->data.txt.string_list; strlst; strlst =3D
> strlst->next) {
> -                 if (strlst->size > 255 || strlst->size <=3D 0)
> -                     return 0;
> -
> -+                used +=3D 1+strlst->size;
> -+                if (used > AVAHI_DNS_RDATA_MAX)
> -+                    return 0;
> -+            }
> -+
> -             return 1;
> -         }
> -     }
> ---
> -2.40.0
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> deleted file mode 100644
> index f8f60ddca1c..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Wed, 25 Oct 2023 18:15:42 +0000
> -Subject: [PATCH] tests: pass overly long TXT resource records
> -
> -to make sure they don't crash avahi any more.
> -It reproduces https://github.com/lathiat/avahi/issues/455
> -
> -Canonical notes:
> -nickgalanis> removed first hunk since there is no .github dir in this
> release
> -
> -Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-20=
23-38469-2.patch?h=3Dubuntu/jammy-security
> -Upstream
> <https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2=
023-38469-2.patch?h=3Dubuntu/jammy-security-Upstream>
> commit
> https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa51=
6166237
> ]
> -CVE: CVE-2023-38469
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-client/client-test.c       | 14 ++++++++++++++
> - 1 files changed, 14 insertions(+)
> -
> -Index: avahi-0.8/avahi-client/client-test.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- avahi-0.8.orig/avahi-client/client-test.c
> -+++ avahi-0.8/avahi-client/client-test.c
> -@@ -22,6 +22,7 @@
> - #endif
> -
> - #include <stdio.h>
> -+#include <string.h>
> - #include <assert.h>
> -
> - #include <avahi-client/client.h>
> -@@ -33,6 +34,8 @@
> - #include <avahi-common/malloc.h>
> - #include <avahi-common/timeval.h>
> -
> -+#include <avahi-core/dns.h>
> -+
> - static const AvahiPoll *poll_api =3D NULL;
> - static AvahiSimplePoll *simple_poll =3D NULL;
> -
> -@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
> -     uint32_t cookie;
> -     struct timeval tv;
> -     AvahiAddress a;
> -+    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
> -+    AvahiStringList *txt =3D NULL;
> -+    int r;
> -
> -     simple_poll =3D avahi_simple_poll_new();
> -     poll_api =3D avahi_simple_poll_get(simple_poll);
> -@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
> -     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp",
> NULL, NULL, 80, "foo=3Dbar", NULL)));
> -     printf("add_record: %d\n", avahi_entry_group_add_record (group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120,
> "\5booya", 6));
> -
> -+    memset(rdata, 1, sizeof(rdata));
> -+    r =3D avahi_string_list_parse(rdata, sizeof(rdata), &txt);
> -+    assert(r >=3D 0);
> -+    assert(avahi_string_list_serialize(txt, NULL, 0) =3D=3D sizeof(rdat=
a));
> -+    error =3D avahi_entry_group_add_service_strlst(group, AVAHI_IF_UNSP=
EC,
> AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp", NULL, NULL, 123, txt);
> -+    assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
> -+    avahi_string_list_free(txt);
> -+
> -     avahi_entry_group_commit (group);
> -
> -     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
> deleted file mode 100644
> index 91f9e677ace..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From af7bfad67ca53a7c4042a4a2d85456b847e9f249 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat=
.com>
> -Date: Tue, 11 Apr 2023 15:29:59 +0200
> -Subject: [PATCH] avahi: Ensure each label is at least one byte long
> -
> -The only allowed exception is single dot, where it should return empty
> -string.
> -
> -Fixes #454.
> -
> -Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b5=
5b5d66c
> ]
> -CVE: CVE-2023-38470
> -
> -Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ----
> - avahi-common/domain-test.c | 14 ++++++++++++++
> - avahi-common/domain.c      |  2 +-
> - 2 files changed, 15 insertions(+), 1 deletion(-)
> -
> -diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
> -index cf763ec..3acc1c1 100644
> ---- a/avahi-common/domain-test.c
> -+++ b/avahi-common/domain-test.c
> -@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED
> char *argv[]) {
> -     printf("%s\n", s =3D avahi_normalize_name_strdup("fo\\\\o\\..f oo."=
));
> -     avahi_free(s);
> -
> -+    printf("%s\n", s =3D avahi_normalize_name_strdup("."));
> -+    avahi_free(s);
> -+
> -+    s =3D
> avahi_normalize_name_strdup(",.=3D.}.=3D.?-.}.=3D.?.?.}.}.?.?.?.z.?.?.}.}=
."
> -+
> "}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.}.}.}"
> -+
> ".?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?.zM.?`"
> -+
> "?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.?."
> -+
> "?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.}."
> -+
> "??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}?"
> -+
> "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM."
> -+
> "?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.?.?."
> -+                  "}.?.?.?.}.=3D.?.?.}");
> -+    assert(s =3D=3D NULL);
> -+
> -     printf("%i\n", avahi_domain_equal("\\065aa
> bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
> -     printf("%i\n", avahi_domain_equal("A", "a"));
> -
> -diff --git a/avahi-common/domain.c b/avahi-common/domain.c
> -index 3b1ab68..e66d241 100644
> ---- a/avahi-common/domain.c
> -+++ b/avahi-common/domain.c
> -@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char
> *ret_s, size_t size) {
> -         }
> -
> -         if (!empty) {
> --            if (size < 1)
> -+            if (size < 2)
> -                 return NULL;
> -
> -             *(r++) =3D '.';
> ---
> -2.40.0
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
> deleted file mode 100644
> index e0736bf210a..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 20dec84b2480821704258bc908e7b2bd2e883b24 Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Tue, 19 Sep 2023 03:21:25 +0000
> -Subject: [PATCH] [common] bail out when escaped labels can't fit into re=
t
> -
> -Fixes:
> -```
> -=3D=3D93410=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on addre=
ss
> 0x7f9e76f14c16 at pc 0x00000047208d bp 0x7ffee90a6a00 sp 0x7ffee90a61c8
> -READ of size 1110 at 0x7f9e76f14c16 thread T0
> -    #0 0x47208c in __interceptor_strlen (out/fuzz-domain+0x47208c)
> (BuildId: 731b20c1eef22c2104e75a6496a399b10cfc7cba)
> -    #1 0x534eb0 in avahi_strdup avahi/avahi-common/malloc.c:167:12
> -    #2 0x53862c in avahi_normalize_name_strdup
> avahi/avahi-common/domain.c:226:12
> -```
> -and
> -```
> -fuzz-domain: fuzz/fuzz-domain.c:38: int LLVMFuzzerTestOneInput(const
> uint8_t *, size_t): Assertion `avahi_domain_equal(s, t)' failed.
> -=3D=3D101571=3D=3D ERROR: libFuzzer: deadly signal
> -    #0 0x501175 in __sanitizer_print_stack_trace
> (/home/vagrant/avahi/out/fuzz-domain+0x501175) (BuildId:
> 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
> -    #1 0x45ad2c in fuzzer::PrintStackTrace()
> (/home/vagrant/avahi/out/fuzz-domain+0x45ad2c) (BuildId:
> 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
> -    #2 0x43fc07 in fuzzer::Fuzzer::CrashCallback()
> (/home/vagrant/avahi/out/fuzz-domain+0x43fc07) (BuildId:
> 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
> -    #3 0x7f1581d7ebaf  (/lib64/libc.so.6+0x3dbaf) (BuildId:
> c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
> -    #4 0x7f1581dcf883 in __pthread_kill_implementation
> (/lib64/libc.so.6+0x8e883) (BuildId:
> c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
> -    #5 0x7f1581d7eafd in gsignal (/lib64/libc.so.6+0x3dafd) (BuildId:
> c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
> -    #6 0x7f1581d6787e in abort (/lib64/libc.so.6+0x2687e) (BuildId:
> c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
> -    #7 0x7f1581d6779a in __assert_fail_base.cold
> (/lib64/libc.so.6+0x2679a) (BuildId:
> c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
> -    #8 0x7f1581d77186 in __assert_fail (/lib64/libc.so.6+0x36186)
> (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
> -    #9 0x5344a4 in LLVMFuzzerTestOneInput
> /home/vagrant/avahi/fuzz/fuzz-domain.c:38:9
> -```
> -
> -It's a follow-up to 94cb6489114636940ac683515417990b55b5d66c
> -
> -Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-20=
23-38470-2.patch?h=3Dubuntu/jammy-security
> -CVE
> <https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2=
023-38470-2.patch?h=3Dubuntu/jammy-security-CVE>:
> CVE-2023-38470 #Follow-up patch
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-common/domain.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -Index: avahi-0.8/avahi-common/domain.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- avahi-0.8.orig/avahi-common/domain.c
> -+++ avahi-0.8/avahi-common/domain.c
> -@@ -210,7 +210,8 @@ char *avahi_normalize_name(const char *s
> -         } else
> -             empty =3D 0;
> -
> --        avahi_escape_label(label, strlen(label), &r, &size);
> -+        if (!(avahi_escape_label(label, strlen(label), &r, &size)))
> -+            return NULL;
> -     }
> -
> -     return ret_s;
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
> deleted file mode 100644
> index b3f716495db..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From 48d745db7fd554fc33e96ec86d3675ebd530bb8e Mon Sep 17 00:00:00 2001
> -From: Michal Sekletar <msekleta@redhat.com>
> -Date: Mon, 23 Oct 2023 13:38:35 +0200
> -Subject: [PATCH] avahi: core: extract host name using
> avahi_unescape_label()
> -
> -Previously we could create invalid escape sequence when we split the
> -string on dot. For example, from valid host name "foo\\.bar" we have
> -created invalid name "foo\\" and tried to set that as the host name
> -which crashed the daemon.
> -
> -Fixes #453
> -
> -Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd8=
8d93b09
> ]
> -CVE: CVE-2023-38471
> -
> -Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ----
> - avahi-core/server.c | 27 +++++++++++++++++++++------
> - 1 file changed, 21 insertions(+), 6 deletions(-)
> -
> -diff --git a/avahi-core/server.c b/avahi-core/server.c
> -index e507750..40f1d68 100644
> ---- a/avahi-core/server.c
> -+++ b/avahi-core/server.c
> -@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
> - }
> -
> - int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
> --    char *hn =3D NULL;
> -+    char label_escaped[AVAHI_LABEL_MAX*4+1];
> -+    char label[AVAHI_LABEL_MAX];
> -+    char *hn =3D NULL, *h;
> -+    size_t len;
> -+
> -     assert(s);
> -
> -     AVAHI_CHECK_VALIDITY(s, !host_name ||
> avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
> -@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s,
> const char *host_name) {
> -     else
> -         hn =3D avahi_normalize_name_strdup(host_name);
> -
> --    hn[strcspn(hn, ".")] =3D 0;
> -+    h =3D hn;
> -+    if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))=
)
> {
> -+        avahi_free(h);
> -+        return AVAHI_ERR_INVALID_HOST_NAME;
> -+    }
> -+
> -+    avahi_free(h);
> -+
> -+    h =3D label_escaped;
> -+    len =3D sizeof(label_escaped);
> -+    if (!avahi_escape_label(label, strlen(label), &h, &len))
> -+        return AVAHI_ERR_INVALID_HOST_NAME;
> -
> --    if (avahi_domain_equal(s->host_name, hn) && s->state !=3D
> AVAHI_SERVER_COLLISION) {
> --        avahi_free(hn);
> -+    if (avahi_domain_equal(s->host_name, label_escaped) && s->state !=
=3D
> AVAHI_SERVER_COLLISION)
> -         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
> --    }
> -
> -     withdraw_host_rrs(s);
> -
> -     avahi_free(s->host_name);
> --    s->host_name =3D hn;
> -+    s->host_name =3D avahi_strdup(label_escaped);
> -+    if (!s->host_name)
> -+        return AVAHI_ERR_NO_MEMORY;
> -
> -     update_fqdn(s);
> -
> ---
> -2.40.0
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
> deleted file mode 100644
> index 44737bfc2e1..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From b675f70739f404342f7f78635d6e2dcd85a13460 Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Tue, 24 Oct 2023 22:04:51 +0000
> -Subject: [PATCH] core: return errors from avahi_server_set_host_name
> properly
> -
> -It's a follow-up to 894f085f402e023a98cbb6f5a3d117bd88d93b09
> -
> -Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-20=
23-38471-2.patch?h=3Dubuntu/jammy-security
> -Upstream
> <https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2=
023-38471-2.patch?h=3Dubuntu/jammy-security-Upstream>
> commit
> https://github.com/lathiat/avahi/commit/b675f70739f404342f7f78635d6e2dcd8=
5a13460
> ]
> -CVE: CVE-2023-38471 #Follow-up Patch
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-core/server.c | 9 ++++++---
> - 1 file changed, 6 insertions(+), 3 deletions(-)
> -
> -Index: avahi-0.8/avahi-core/server.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- avahi-0.8.orig/avahi-core/server.c
> -+++ avahi-0.8/avahi-core/server.c
> -@@ -1309,10 +1309,13 @@ int avahi_server_set_host_name(AvahiServ
> -     else
> -         hn =3D avahi_normalize_name_strdup(host_name);
> -
> -+    if (!hn)
> -+        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
> -+
> -     h =3D hn;
> -     if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))=
)
> {
> -         avahi_free(h);
> --        return AVAHI_ERR_INVALID_HOST_NAME;
> -+        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
> -     }
> -
> -     avahi_free(h);
> -@@ -1320,7 +1323,7 @@ int avahi_server_set_host_name(AvahiServ
> -     h =3D label_escaped;
> -     len =3D sizeof(label_escaped);
> -     if (!avahi_escape_label(label, strlen(label), &h, &len))
> --        return AVAHI_ERR_INVALID_HOST_NAME;
> -+        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
> -
> -     if (avahi_domain_equal(s->host_name, label_escaped) && s->state !=
=3D
> AVAHI_SERVER_COLLISION)
> -         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
> -@@ -1330,7 +1333,7 @@ int avahi_server_set_host_name(AvahiServ
> -     avahi_free(s->host_name);
> -     s->host_name =3D avahi_strdup(label_escaped);
> -     if (!s->host_name)
> --        return AVAHI_ERR_NO_MEMORY;
> -+        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
> -
> -     update_fqdn(s);
> -
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> deleted file mode 100644
> index 85dbded73bd..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001
> -From: Michal Sekletar <msekleta@redhat.com>
> -Date: Thu, 19 Oct 2023 17:36:44 +0200
> -Subject: [PATCH] core: make sure there is rdata to process before parsin=
g
> it
> -
> -Fixes #452
> -
> -CVE-2023-38472
> -
> -Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-20=
23-38472.patch?h=3Dubuntu/jammy-security
> -Upstream
> <https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2=
023-38472.patch?h=3Dubuntu/jammy-security-Upstream>
> commit
> https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9=
c8dee40
> ]
> -CVE: CVE-2023-38472
> -Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-client/client-test.c      | 3 +++
> - avahi-daemon/dbus-entry-group.c | 2 +-
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> -Index: avahi-0.8/avahi-client/client-test.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- avahi-0.8.orig/avahi-client/client-test.c
> -+++ avahi-0.8/avahi-client/client-test.c
> -@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA
> -     assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
> -     avahi_string_list_free(txt);
> -
> -+    error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
> -+    assert(error !=3D AVAHI_OK);
> -+
> -     avahi_entry_group_commit (group);
> -
> -     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> -Index: avahi-0.8/avahi-daemon/dbus-entry-group.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- avahi-0.8.orig/avahi-daemon/dbus-entry-group.c
> -+++ avahi-0.8/avahi-daemon/dbus-entry-group.c
> -@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_g
> -         if (!(r =3D avahi_record_new_full (name, clazz, type, ttl)))
> -             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY,
> NULL);
> -
> --        if (avahi_rdata_parse (r, rdata, size) < 0) {
> -+        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
> -             avahi_record_unref (r);
> -             return avahi_dbus_respond_error(c, m,
> AVAHI_ERR_INVALID_RDATA, NULL);
> -         }
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> deleted file mode 100644
> index 707acb60fec..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 88cbbc48d5efff9726694557ca6c3f698f3affe4 Mon Sep 17 00:00:00 2001
> -From: Michal Sekletar <msekleta@redhat.com>
> -Date: Wed, 11 Oct 2023 17:45:44 +0200
> -Subject: [PATCH] avahi: common: derive alternative host name from its
> - unescaped version
> -
> -Normalization of input makes sure we don't have to deal with special
> -cases like unescaped dot at the end of label.
> -
> -Fixes #451 #487
> -
> -Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f=
8646797
> ]
> -CVE: CVE-2023-38473
> -
> -Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ----
> - avahi-common/alternative-test.c |  3 +++
> - avahi-common/alternative.c      | 27 +++++++++++++++++++--------
> - 2 files changed, 22 insertions(+), 8 deletions(-)
> -
> -diff --git a/avahi-common/alternative-test.c
> b/avahi-common/alternative-test.c
> -index 9255435..681fc15 100644
> ---- a/avahi-common/alternative-test.c
> -+++ b/avahi-common/alternative-test.c
> -@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED
> char *argv[]) {
> -     const char* const test_strings[] =3D {
> -
>  "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
> -         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=BC=
=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC",
> -+        ").",
> -+        "\\.",
> -+
> "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
> -         "gurke",
> -         "-",
> -         " #",
> -diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
> -index b3d39f0..a094e6d 100644
> ---- a/avahi-common/alternative.c
> -+++ b/avahi-common/alternative.c
> -@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
> - }
> -
> - char *avahi_alternative_host_name(const char *s) {
> -+    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
> -+    char *alt, *r, *ret;
> -     const char *e;
> --    char *r;
> -+    size_t len;
> -
> -     assert(s);
> -
> -     if (!avahi_is_valid_host_name(s))
> -         return NULL;
> -
> --    if ((e =3D strrchr(s, '-'))) {
> -+    if (!avahi_unescape_label(&s, label, sizeof(label)))
> -+        return NULL;
> -+
> -+    if ((e =3D strrchr(label, '-'))) {
> -         const char *p;
> -
> -         e++;
> -@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) {
> -
> -     if (e) {
> -         char *c, *m;
> --        size_t l;
> -         int n;
> -
> -         n =3D atoi(e)+1;
> -         if (!(m =3D avahi_strdup_printf("%i", n)))
> -             return NULL;
> -
> --        l =3D e-s-1;
> -+        len =3D e-label-1;
> -
> --        if (l >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
> --            l =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
> -+        if (len >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
> -+            len =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
> -
> --        if (!(c =3D avahi_strndup(s, l))) {
> -+        if (!(c =3D avahi_strndup(label, len))) {
> -             avahi_free(m);
> -             return NULL;
> -         }
> -@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) {
> -     } else {
> -         char *c;
> -
> --        if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
> -+        if (!(c =3D avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
> -             return NULL;
> -
> -         drop_incomplete_utf8(c);
> -@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s) {
> -         avahi_free(c);
> -     }
> -
> -+    alt =3D alternative;
> -+    len =3D sizeof(alternative);
> -+    ret =3D avahi_escape_label(r, strlen(r), &alt, &len);
> -+
> -+    avahi_free(r);
> -+    r =3D avahi_strdup(ret);
> -+
> -     assert(avahi_is_valid_host_name(r));
> -
> -     return r;
> ---
> -2.40.0
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
> deleted file mode 100644
> index 9737f528375..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
> +++ /dev/null
> @@ -1,228 +0,0 @@
> -From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001
> -From: Michal Sekletar <msekleta@redhat.com>
> -Date: Wed, 27 Nov 2024 18:07:32 +0100
> -Subject: [PATCH] core/wide-area: fix for CVE-2024-52615
> -
> -CVE: CVE-2024-52615
> -Upstream-Status: Backport [
> https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f=
8b942
> ]
> -
> -Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ----
> - avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------
> - 1 file changed, 69 insertions(+), 59 deletions(-)
> -
> -diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
> -index 00a15056e..06df7afc6 100644
> ---- a/avahi-core/wide-area.c
> -+++ b/avahi-core/wide-area.c
> -@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {
> -
> -     AvahiAddress dns_server_used;
> -
> -+    int fd;
> -+    AvahiWatch *watch;
> -+    AvahiProtocol proto;
> -+
> -     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);
> -     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);
> - };
> -@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {
> - struct AvahiWideAreaLookupEngine {
> -     AvahiServer *server;
> -
> --    int fd_ipv4, fd_ipv6;
> --    AvahiWatch *watch_ipv4, *watch_ipv6;
> --
> -     /* Cache */
> -     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
> -     AvahiHashmap *cache_by_key;
> -@@ -125,35 +126,67 @@ static AvahiWideAreaLookup*
> find_lookup(AvahiWideAreaLookupEngine *e, uint16_t i
> -     return l;
> - }
> -
> -+static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd,
> AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata);
> -+
> - static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p=
)
> {
> -+    AvahiWideAreaLookupEngine *e;
> -     AvahiAddress *a;
> -+    AvahiServer *s;
> -+    AvahiWatch *w;
> -+    int r;
> -
> -     assert(l);
> -     assert(p);
> -
> --    if (l->engine->n_dns_servers <=3D 0)
> -+    e =3D l->engine;
> -+    assert(e);
> -+
> -+    s =3D e->server;
> -+    assert(s);
> -+
> -+    if (e->n_dns_servers <=3D 0)
> -         return -1;
> -
> --    assert(l->engine->current_dns_server < l->engine->n_dns_servers);
> -+    assert(e->current_dns_server < e->n_dns_servers);
> -
> --    a =3D &l->engine->dns_servers[l->engine->current_dns_server];
> -+    a =3D &e->dns_servers[e->current_dns_server];
> -     l->dns_server_used =3D *a;
> -
> --    if (a->proto =3D=3D AVAHI_PROTO_INET) {
> -+    if (l->fd >=3D 0) {
> -+        /* We are reusing lookup object and sending packet to another
> server so let's cleanup before we establish connection to new server. */
> -+        s->poll_api->watch_free(l->watch);
> -+        l->watch =3D NULL;
> -
> --        if (l->engine->fd_ipv4 < 0)
> --            return -1;
> -+        close(l->fd);
> -+        l->fd =3D -EBADF;
> -+    }
> -
> --        return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4,
> AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
> -+    assert(a->proto =3D=3D AVAHI_PROTO_INET || a->proto =3D=3D
> AVAHI_PROTO_INET6);
> -
> --    } else {
> --        assert(a->proto =3D=3D AVAHI_PROTO_INET6);
> -+    if (a->proto =3D=3D AVAHI_PROTO_INET)
> -+        r =3D s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -=
1;
> -+    else
> -+        r =3D s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -=
1;
> -
> --        if (l->engine->fd_ipv6 < 0)
> --            return -1;
> -+    if (r < 0) {
> -+        avahi_log_error(__FILE__ ": Failed to create socket for wide
> area lookup");
> -+        return -1;
> -+    }
> -
> --        return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6,
> AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
> -+    w =3D s->poll_api->watch_new(s->poll_api, r, AVAHI_WATCH_IN,
> socket_event, l);
> -+    if (!w) {
> -+        close(r);
> -+        avahi_log_error(__FILE__ ": Failed to create socket watch for
> wide area lookup");
> -+        return -1;
> -     }
> -+
> -+    l->fd =3D r;
> -+    l->watch =3D w;
> -+    l->proto =3D a->proto;
> -+
> -+    return a->proto =3D=3D AVAHI_PROTO_INET ?
> -+                avahi_send_dns_packet_ipv4(l->fd, AVAHI_IF_UNSPEC, p,
> NULL, &a->data.ipv4, AVAHI_DNS_PORT):
> -+                avahi_send_dns_packet_ipv6(l->fd, AVAHI_IF_UNSPEC, p,
> NULL, &a->data.ipv6, AVAHI_DNS_PORT);
> - }
> -
> - static void next_dns_server(AvahiWideAreaLookupEngine *e) {
> -@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
> -     l->dead =3D 0;
> -     l->key =3D avahi_key_ref(key);
> -     l->cname_key =3D avahi_key_new_cname(l->key);
> -+    l->fd =3D -EBADF;
> -+    l->watch =3D NULL;
> -+    l->proto =3D AVAHI_PROTO_UNSPEC;
> -     l->callback =3D callback;
> -     l->userdata =3D userdata;
> -
> -@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) =
{
> -     if (l->cname_key)
> -         avahi_key_unref(l->cname_key);
> -
> -+    if (l->watch)
> -+            l->engine->server->poll_api->watch_free(l->watch);
> -+
> -+    if (l->fd >=3D 0)
> -+        close(l->fd);
> -+
> -     avahi_free(l);
> - }
> -
> -@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngin=
e
> *e, AvahiDnsPacket *p) {
> - }
> -
> - static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd,
> AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata) {
> --    AvahiWideAreaLookupEngine *e =3D userdata;
> -+    AvahiWideAreaLookup *l =3D userdata;
> -+    AvahiWideAreaLookupEngine *e =3D l->engine;
> -     AvahiDnsPacket *p =3D NULL;
> -
> --    if (fd =3D=3D e->fd_ipv4)
> --        p =3D avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL,
> NULL, NULL);
> -+    assert(l);
> -+    assert(e);
> -+    assert(l->fd =3D=3D fd);
> -+
> -+    if (l->proto =3D=3D AVAHI_PROTO_INET)
> -+        p =3D avahi_recv_dns_packet_ipv4(l->fd, NULL, NULL, NULL, NULL,
> NULL);
> -     else {
> --        assert(fd =3D=3D e->fd_ipv6);
> --        p =3D avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL,
> NULL, NULL);
> -+        assert(l->proto =3D=3D AVAHI_PROTO_INET6);
> -+
> -+        p =3D avahi_recv_dns_packet_ipv6(l->fd, NULL, NULL, NULL, NULL,
> NULL);
> -     }
> -
> -     if (p) {
> -@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine
> *avahi_wide_area_engine_new(AvahiServer *s) {
> -     e->server =3D s;
> -     e->cleanup_dead =3D 0;
> -
> --    /* Create sockets */
> --    e->fd_ipv4 =3D s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4(=
) :
> -1;
> --    e->fd_ipv6 =3D s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6(=
) :
> -1;
> --
> --    if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
> --        avahi_log_error(__FILE__": Failed to create wide area sockets:
> %s", strerror(errno));
> --
> --        if (e->fd_ipv6 >=3D 0)
> --            close(e->fd_ipv6);
> --
> --        if (e->fd_ipv4 >=3D 0)
> --            close(e->fd_ipv4);
> --
> --        avahi_free(e);
> --        return NULL;
> --    }
> --
> --    /* Create watches */
> --
> --    e->watch_ipv4 =3D e->watch_ipv6 =3D NULL;
> --
> --    if (e->fd_ipv4 >=3D 0)
> --        e->watch_ipv4 =3D s->poll_api->watch_new(e->server->poll_api,
> e->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
> --    if (e->fd_ipv6 >=3D 0)
> --        e->watch_ipv6 =3D s->poll_api->watch_new(e->server->poll_api,
> e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
> --
> -     e->n_dns_servers =3D e->current_dns_server =3D 0;
> -
> -     /* Initialize cache */
> -@@ -651,18 +673,6 @@ void
> avahi_wide_area_engine_free(AvahiWideAreaLookupEngine *e) {
> -     avahi_hashmap_free(e->lookups_by_id);
> -     avahi_hashmap_free(e->lookups_by_key);
> -
> --    if (e->watch_ipv4)
> --        e->server->poll_api->watch_free(e->watch_ipv4);
> --
> --    if (e->watch_ipv6)
> --        e->server->poll_api->watch_free(e->watch_ipv6);
> --
> --    if (e->fd_ipv6 >=3D 0)
> --        close(e->fd_ipv6);
> --
> --    if (e->fd_ipv4 >=3D 0)
> --        close(e->fd_ipv4);
> --
> -     avahi_free(e);
> - }
> -
> -@@ -680,7 +690,7 @@ void
> avahi_wide_area_set_servers(AvahiWideAreaLookupEngine *e, const AvahiAddr=
es
> -
> -     if (a) {
> -         for (e->n_dns_servers =3D 0; n > 0 && e->n_dns_servers <
> AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--)
> --            if ((a->proto =3D=3D AVAHI_PROTO_INET && e->fd_ipv4 >=3D 0)=
 ||
> (a->proto =3D=3D AVAHI_PROTO_INET6 && e->fd_ipv6 >=3D 0))
> -+            if (a->proto =3D=3D AVAHI_PROTO_INET || a->proto =3D=3D
> AVAHI_PROTO_INET6)
> -                 e->dns_servers[e->n_dns_servers++] =3D *a;
> -     } else {
> -         assert(n =3D=3D 0);
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
> deleted file mode 100644
> index a156f987280..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
> +++ /dev/null
> @@ -1,104 +0,0 @@
> -From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat=
.com>
> -Date: Mon, 11 Nov 2024 00:56:09 +0100
> -Subject: [PATCH] Properly randomize query id of DNS packets
> -
> -CVE: CVE-2024-52616
> -Upstream-Status: Backport [
> https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7=
a79f7
> ]
> -
> -Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ----
> - avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
> - configure.ac           |  3 ++-
> - 2 files changed, 30 insertions(+), 9 deletions(-)
> -
> -diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
> -index 971f5e714..00a15056e 100644
> ---- a/avahi-core/wide-area.c
> -+++ b/avahi-core/wide-area.c
> -@@ -40,6 +40,13 @@
> - #include "addr-util.h"
> - #include "rr-util.h"
> -
> -+#ifdef HAVE_SYS_RANDOM_H
> -+#include <sys/random.h>
> -+#endif
> -+#ifndef HAVE_GETRANDOM
> -+#  define getrandom(d, len, flags) (-1)
> -+#endif
> -+
> - #define CACHE_ENTRIES_MAX 500
> -
> - typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
> -@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
> -     int fd_ipv4, fd_ipv6;
> -     AvahiWatch *watch_ipv4, *watch_ipv6;
> -
> --    uint16_t next_id;
> --
> -     /* Cache */
> -     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
> -     AvahiHashmap *cache_by_key;
> -@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent
> *e, void *userdata) {
> -     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
> - }
> -
> -+static uint16_t get_random_uint16(void) {
> -+    uint16_t next_id;
> -+
> -+    if (getrandom(&next_id, sizeof(next_id), 0) =3D=3D -1)
> -+        next_id =3D (uint16_t) rand();
> -+    return next_id;
> -+}
> -+
> -+static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
> -+    uint16_t next_id;
> -+
> -+    next_id =3D get_random_uint16();
> -+    while (find_lookup(e, next_id)) {
> -+        /* This ID is already used, get new. */
> -+        next_id =3D get_random_uint16();
> -+    }
> -+    return next_id;
> -+}
> -+
> -+
> - AvahiWideAreaLookup *avahi_wide_area_lookup_new(
> -     AvahiWideAreaLookupEngine *e,
> -     AvahiKey *key,
> -@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
> -     /* If more than 65K wide area quries are issued simultaneously,
> -      * this will break. This should be limited by some higher level */
> -
> --    for (;; e->next_id++)
> --        if (!find_lookup(e, e->next_id))
> --            break; /* This ID is not yet used. */
> --
> --    l->id =3D e->next_id++;
> -+    l->id =3D avahi_wide_area_next_id(e);
> -
> -     /* We keep the packet around in case we need to repeat our query */
> -     l->packet =3D avahi_dns_packet_new(0);
> -@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine
> *avahi_wide_area_engine_new(AvahiServer *s) {
> -         e->watch_ipv6 =3D s->poll_api->watch_new(e->server->poll_api,
> e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
> -
> -     e->n_dns_servers =3D e->current_dns_server =3D 0;
> --    e->next_id =3D (uint16_t) rand();
> -
> -     /* Initialize cache */
> -     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
> -diff --git a/configure.ac b/configure.ac
> -index a3211b80e..31bce3d76 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
> - # whether libc's malloc does too. (Same for realloc.)
> - #AC_FUNC_MALLOC
> - #AC_FUNC_REALLOC
> --AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket
> strchr strcspn strdup strerror strrchr strspn strstr uname setresuid
> setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp
> strlcpy gethostbyname seteuid setegid setproctitle getprogname])
> -+AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket
> strchr strcspn strdup strerror strrchr strspn strstr uname setresuid
> setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp
> strlcpy gethostbyname seteuid setegid setproctitle getprogname getrandom]=
)
> -+AC_CHECK_HEADERS([sys/random.h])
> -
> - AC_FUNC_CHOWN
> - AC_FUNC_STAT
> -
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> deleted file mode 100644
> index b3e11f9597f..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Wed, 17 Dec 2025 08:11:23 +0000
> -Subject: [PATCH] core: refuse to create wide-area record browsers when
> - wide-area is off
> -
> -It fixes a bug where it was possible for unprivileged local users to
> -crash avahi-daemon (with wide-area disabled) by creating record browsers
> -with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by callin=
g
> -the RecordBrowserNew method directly or by creating
> hostname/address/service
> -resolvers/browsers that create those browsers internally themselves).
> -
> -```
> -$ gdbus call --system --dest org.freedesktop.Avahi --object-path /
> --method org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -=
1 1
> -Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient
> disconnected from message bus without replying
> -```
> -```
> -dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/,
> member=3DResolveHostName
> -avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e'
> failed.
> -=3D=3D307948=3D=3D
> -=3D=3D307948=3D=3D Process terminating with default action of signal 6 (=
SIGABRT)
> -=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation
> (pthread_kill.c:44)
> -=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
> -=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
> -=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:11=
8)
> -=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-are=
a.c:725)
> -=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
> -=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
> -=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
> -=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
> -=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447=
)
> -=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch
> (simple-watch.c:563)
> -=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-wa=
tch.c:605)
> -=3D=3D307948=3D=3D
> -```
> -
> -wide-area has been disabled by default since
> -9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
> -
> -https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
> -
> -CVE: CVE-2025-68276
> -Upstream-Status: Backport [
> https://github.com/avahi/avahi/pull/806/commits/0c013e2e819be3bda74cecf48=
b5f64956cf8a760
> ]
> -
> -Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ----
> - avahi-core/browse.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> -index e8a915e..59d53cb 100644
> ---- a/avahi-core/browse.c
> -+++ b/avahi-core/browse.c
> -@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare=
(
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags,
> AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags &
> AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -
> -+    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) &&
> !server->wide_area_lookup_engine) {
> -+        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
> -+        return NULL;
> -+    }
> -+
> -     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
> -         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
> -         return NULL;
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> deleted file mode 100644
> index 3635cc8d53e..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
> -From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> -Date: Sun, 2 Mar 2025 18:06:24 +0100
> -Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
> -
> -Closes https://github.com/avahi/avahi/issues/683
> -
> -CVE: CVE-2025-68468
> -
> -Upstream-Status: Backport
> -[
> https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179=
d309a
> ]
> -
> -Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ----
> - avahi-core/browse.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> -index 86e4432..79595fe 100644
> ---- a/avahi-core/browse.c
> -+++ b/avahi-core/browse.c
> -@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
> -                 lookup_drop_cname(l, interface, protocol, 0, r);
> -             else {
> -                 /* It's a normal record, so let's call the user callbac=
k
> */
> --                assert(avahi_key_equal(b->key, l->key));
> -
> -                 b->callback(b, interface, protocol, event, r, flags,
> b->userdata);
> -             }
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
> deleted file mode 100644
> index 210565cdd61..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001
> -From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> -Date: Sun, 2 Mar 2025 18:06:24 +0100
> -Subject: [PATCH] core: fix DoS bug by changing assert to return
> -
> -Closes https://github.com/avahi/avahi/issues/678
> -
> -CVE: CVE-2025-68471
> -
> -Upstream-Status: Backport
> -[
> https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54c=
c0aa1
> ]
> -
> -Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ----
> - avahi-core/browse.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> -index 2941e57..86e4432 100644
> ---- a/avahi-core/browse.c
> -+++ b/avahi-core/browse.c
> -@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
> -     assert(l);
> -
> -     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) !=3D !(l->flags &
> AVAHI_LOOKUP_USE_MULTICAST));
> --    assert(!l->wide_area && !l->multicast);
> -+    if (l->wide_area || l->multicast) {
> -+        /* Avoid starting a duplicate lookup */
> -+        return 0;
> -+    }
> -
> -     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
> -
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> deleted file mode 100644
> index 1a442966fc9..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 5eea2640324928c15936b7a2bcbf8ea0de7b08f7 Mon Sep 17 00:00:00 2001
> -From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
> -Date: Sun, 2 Mar 2025 18:06:24 +0100
> -Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loo=
p
> - detection algorithm
> -
> -Closes https://github.com/avahi/avahi/issues/501
> -
> -CVE: CVE-2026-24401
> -Upstream-Status: Backport [
> https://github.com/avahi/avahi/commit/78eab31128479f06e30beb8c1cbf99dd921=
e2524
> ]
> -(cherry picked from commit 78eab31128479f06e30beb8c1cbf99dd921e2524)
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 40 insertions(+)
> -
> -diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> -index f461083..975b3e9 100644
> ---- a/avahi-core/browse.c
> -+++ b/avahi-core/browse.c
> -@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {
> -     return n;
> - }
> -
> -+static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup=
*
> from, AvahiSRBLookup* to) {
> -+    AvahiRList* rl;
> -+    if (from =3D=3D to)
> -+        return 0;
> -+    for (rl =3D from->cname_lookups; rl; rl =3D rl->rlist_next) {
> -+        int r =3D lookup_exists_in_path(lookup, rl->data, to);
> -+        if (r =3D=3D 1) {
> -+            /* loop detected, propagate result */
> -+            return r;
> -+        } else if (r =3D=3D 0) {
> -+            /* is loop detected? */
> -+            return lookup =3D=3D from;
> -+        } else {
> -+              /* `to` not found, continue */
> -+            continue;
> -+        }
> -+    }
> -+    /* no path found */
> -+    return -1;
> -+}
> -+
> -+static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n=
)
> {
> -+    int ret;
> -+    if (l =3D=3D n)
> -+        /* Loop to self */
> -+        return 1;
> -+
> -+    ret =3D lookup_exists_in_path(n, l->record_browser->root_lookup, l)=
;
> -+
> -+    /* Path to n always exists */
> -+    assert(ret !=3D -1);
> -+    return ret;
> -+}
> -+
> - static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex
> interface, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r=
) {
> -     AvahiKey *k;
> -     AvahiSRBLookup *n;
> -@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l,
> AvahiIfIndex interface, Avahi
> -         return;
> -     }
> -
> -+    if (cname_would_create_loop(l, n)) {
> -+        /* CNAME loops are not allowed */
> -+        lookup_unref(n);
> -+        return;
> -+    }
> -+
> -     l->cname_lookups =3D avahi_rlist_prepend(l->cname_lookups,
> lookup_ref(n));
> -
> -     lookup_go(n);
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
> deleted file mode 100644
> index 208345a3258..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Wed, 1 Apr 2026 05:31:58 +0000
> -Subject: [PATCH] core: refuse to accept publish flags where both
> wide_area and
> - multicast are set
> -
> -It fixes a bug where it was possible for unprivileged local users to
> -crash avahi-daemon via D-Bus by calling EntryGroup methods accepting
> -flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and
> -AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was
> -invoked like that avahi-daemon crashed with
> -```
> -dbus-entry-group.c: interface=3Dorg.freedesktop.Avahi.EntryGroup,
> path=3D/Client0/EntryGroup1, member=3DAddRecord
> -avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion
> `!((*flags & AVAHI_PUBLISH_USE_MULTICAST) && (*flags &
> AVAHI_PUBLISH_USE_WIDE_AREA))' failed.
> -=3D=3D84944=3D=3D
> -=3D=3D84944=3D=3D Process terminating with default action of signal 6 (S=
IGABRT)
> -=3D=3D84944=3D=3D    at 0x4B353BC: __pthread_kill_implementation
> (pthread_kill.c:44)
> -=3D=3D84944=3D=3D    by 0x4ADE941: raise (raise.c:26)
> -=3D=3D84944=3D=3D    by 0x4AC64AB: abort (abort.c:77)
> -=3D=3D84944=3D=3D    by 0x4AC641F: __assert_fail_base.cold (assert.c:118=
)
> -=3D=3D84944=3D=3D    by 0x48A9404: transport_flags_from_domain (entry.c:=
57)
> -=3D=3D84944=3D=3D    by 0x48A9F8F: server_add_internal (entry.c:224)
> -=3D=3D84944=3D=3D    by 0x48AA49F: avahi_server_add (entry.c:324)
> -=3D=3D84944=3D=3D    by 0x401A670: avahi_dbus_msg_entry_group_impl
> (dbus-entry-group.c:348)
> -=3D=3D84944=3D=3D    by 0x4A70741: ??? (in
> /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
> -=3D=3D84944=3D=3D    by 0x4A5FB22: dbus_connection_dispatch (in
> /usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)
> -=3D=3D84944=3D=3D    by 0x401D01D: dispatch_timeout_callback
> (dbus-watch-glue.c:105)
> -=3D=3D84944=3D=3D    by 0x488E3AE: timeout_callback (simple-watch.c:447)
> -=3D=3D84944=3D=3D
> -```
> -It's a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where
> -those flags were introduced and consistent with the other places
> -where wide_area/multicast flags are used.
> -
> -It was discovered by
> -Guillaume Meunier - Head of Vulnerability Operations Center France -
> Orange Cyberdefense
> -
> -https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc
> -
> -CVE-2026-34933
> -
> -Upstream-Status: Backport [
> https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5e0febcbbbf452ec=
f7675
> ]
> -CVE: CVE-2026-34933
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-core/entry.c | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/avahi-core/entry.c b/avahi-core/entry.c
> -index 0d862133d..06eb12076 100644
> ---- a/avahi-core/entry.c
> -+++ b/avahi-core/entry.c
> -@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(
> -                                          AVAHI_PUBLISH_UPDATE|
> -                                          AVAHI_PUBLISH_USE_WIDE_AREA|
> -                                          AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags &
> AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s,
> avahi_is_valid_domain_name(r->key->name), AVAHI_ERR_INVALID_HOST_NAME);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r->ttl !=3D 0,
> AVAHI_ERR_INVALID_TTL);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_pattern(r->key),
> AVAHI_ERR_IS_PATTERN);
> -@@ -454,6 +455,7 @@ int avahi_server_add_address(
> -                                               AVAHI_PUBLISH_UPDATE|
> -
>  AVAHI_PUBLISH_USE_WIDE_AREA|
> -
>  AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) ||
> !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(name),
> AVAHI_ERR_INVALID_HOST_NAME);
> -
> -     /* Prepare the host naem */
> -@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(
> -
>  AVAHI_PUBLISH_UPDATE|
> -
>  AVAHI_PUBLISH_USE_WIDE_AREA|
> -
>  AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags &
> AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE)=
;
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain ||
> avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
> -@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(
> -
>  AVAHI_PUBLISH_NO_COOKIE|
> -
>  AVAHI_PUBLISH_USE_WIDE_AREA|
> -
>  AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags &
> AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE)=
;
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain ||
> avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
> -@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VALID(interface)=
,
> AVAHI_ERR_INVALID_INTERFACE);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> AVAHI_PROTO_VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_VALID(flags,
> AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA),
> AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags &
> AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> avahi_is_valid_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s,
> avahi_is_valid_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE)=
;
> -     AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain ||
> avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
> -@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(
> -     assert(name);
> -
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(flags,
> AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags &
> AVAHI_PUBLISH_USE_WIDE_AREA) || !(flags & AVAHI_PUBLISH_USE_MULTICAST),
> AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type =3D=3D AVAHI_DNS_SERVER_UP=
DATE
> || type =3D=3D AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port !=3D 0,
> AVAHI_ERR_INVALID_PORT);
> -     AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqdn(name),
> AVAHI_ERR_INVALID_HOST_NAME);
> -@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(
> -     AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface),
> AVAHI_ERR_INVALID_INTERFACE);
> -     AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) &&
> AVAHI_PROTO_VALID(address->proto), AVAHI_ERR_INVALID_PROTOCOL);
> -     AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags,
> AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA),
> AVAHI_ERR_INVALID_FLAGS);
> -+    AVAHI_CHECK_VALIDITY(s, !(flags & AVAHI_PUBLISH_USE_WIDE_AREA) ||
> !(flags & AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY(s, type =3D=3D AVAHI_DNS_SERVER_UPDATE || type=
 =3D=3D
> AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);
> -     AVAHI_CHECK_VALIDITY(s, port !=3D 0, AVAHI_ERR_INVALID_PORT);
> -     AVAHI_CHECK_VALIDITY(s, !domain ||
> avahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
> deleted file mode 100644
> index 479d0d7e932..00000000000
> --- a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From a93fdd980d2db5d453475c0aa2b39946bd6611bd Mon Sep 17 00:00:00 2001
> -From: Evgeny Vereshchagin <evvers@ya.ru>
> -Date: Wed, 1 Apr 2026 05:30:58 +0000
> -Subject: [PATCH] tests: make sure AVAHI_PUBLISH_USE_WIDE_AREA is refused
> -
> -Upstream-Status: Backport [
> https://github.com/avahi/avahi/commit/a93fdd980d2db5d453475c0aa2b39946bd6=
611bd
> ]
> -CVE: CVE-2026-34933
> -Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ----
> - avahi-client/client-test.c | 25 +++++++++++++++++++++++++
> - avahi-core/avahi-test.c    | 12 +++++++++++-
> - 2 files changed, 36 insertions(+), 1 deletion(-)
> -
> -diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> -index 9a015d7..c80e12f 100644
> ---- a/avahi-client/client-test.c
> -+++ b/avahi-client/client-test.c
> -@@ -212,6 +212,28 @@ static void terminate(AVAHI_GCC_UNUSED AvahiTimeout
> *timeout, AVAHI_GCC_UNUSED v
> -     avahi_simple_poll_quit(simple_poll);
> - }
> -
> -+static void test_refuse_publish_flags(AvahiEntryGroup *g,
> AvahiPublishFlags flags, int expected) {
> -+    AvahiAddress a;
> -+    AvahiStringList *l =3D NULL;
> -+    int r;
> -+
> -+    r =3D avahi_entry_group_add_record(g, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, flags, "test.local", AVAHI_DNS_CLASS_IN,
> AVAHI_DNS_TYPE_CNAME, 120, "\0", 1);
> -+    assert(r =3D=3D expected);
> -+
> -+    avahi_address_parse("224.0.0.251", AVAHI_PROTO_UNSPEC, &a);
> -+    r =3D avahi_entry_group_add_address(g, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, flags, "test.local", &a);
> -+    assert(r =3D=3D expected);
> -+
> -+    r =3D avahi_entry_group_add_service_strlst(g, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, NULL, 80, l);
> -+    assert(r =3D=3D expected);
> -+
> -+    r =3D avahi_entry_group_update_service_txt_strlst(g, AVAHI_IF_UNSPE=
C,
> AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL, l);
> -+    assert(r =3D=3D expected);
> -+
> -+    r =3D avahi_entry_group_add_service_subtype(g, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, flags, "test", "_http._tcp", NULL,
> "_magic._sub._http._tcp");
> -+    assert(r =3D=3D expected);
> -+}
> -+
> - int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
> -     AvahiClient *avahi;
> -     AvahiEntryGroup *group, *group2;
> -@@ -275,6 +297,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSE=
D
> char *argv[]) {
> -     error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
> -     assert(error !=3D AVAHI_OK);
> -
> -+    test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_AREA,
> AVAHI_ERR_NOT_SUPPORTED);
> -+    test_refuse_publish_flags(group,
> AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST,
> AVAHI_ERR_INVALID_FLAGS);
> -+
> -     avahi_entry_group_commit (group);
> -
> -     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> -diff --git a/avahi-core/avahi-test.c b/avahi-core/avahi-test.c
> -index 2a7872b..2bae82b 100644
> ---- a/avahi-core/avahi-test.c
> -+++ b/avahi-core/avahi-test.c
> -@@ -30,6 +30,7 @@
> - #include <netinet/in.h>
> - #include <arpa/inet.h>
> -
> -+#include <avahi-common/error.h>
> - #include <avahi-common/malloc.h>
> - #include <avahi-common/simple-watch.h>
> - #include <avahi-common/alternative.h>
> -@@ -150,6 +151,7 @@ static void remove_entries(void) {
> - static void create_entries(int new_name) {
> -     AvahiAddress a;
> -     AvahiRecord *r;
> -+    int error;
> -
> -     remove_entries();
> -
> -@@ -181,7 +183,15 @@ static void create_entries(int new_name) {
> -         goto fail;
> -     }
> -
> --    if (avahi_server_add_dns_server_address(server, group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE,
> avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a), 53) < 0) {
> -+    avahi_address_parse("192.168.50.1", AVAHI_PROTO_UNSPEC, &a);
> -+
> -+    error =3D avahi_server_add_dns_server_address(server, group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA, NULL,
> AVAHI_DNS_SERVER_RESOLVE, &a, 53);
> -+    assert(error =3D=3D AVAHI_ERR_NOT_SUPPORTED);
> -+
> -+    error =3D avahi_server_add_dns_server_address(server, group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC,
> AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST, NULL,
> AVAHI_DNS_SERVER_RESOLVE, &a, 53);
> -+    assert(error =3D=3D AVAHI_ERR_INVALID_FLAGS);
> -+
> -+    if (avahi_server_add_dns_server_address(server, group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, &=
a,
> 53) < 0) {
> -         avahi_log_error("Failed to add new DNS Server address");
> -         goto fail;
> -     }
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-connectivity/avahi/files/avahi-daemon.in
> b/meta/recipes-connectivity/avahi/files/avahi-daemon.in
> new file mode 100644
> index 00000000000..49ec3586896
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/avahi-daemon.in
> @@ -0,0 +1,198 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          avahi
> +# Required-Start:    $remote_fs dbus
> +# Required-Stop:     $remote_fs dbus
> +# Should-Start:             $syslog
> +# Should-Stop:       $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: Avahi mDNS/DNS-SD Daemon
> +# Description:       Zeroconf daemon for configuring your network
> +#                    automatically
> +### END INIT INFO
> +#
> +# This file is part of avahi.
> +#
> +# avahi is free software; you can redistribute

--000000000000908e7e0651c99ad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">How confident are we with the release happening on time b=
efore we release in next 5 months time=C2=A0</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, M=
ay 14, 2026, 6:37=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:=
arm.com@lists.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">As per upstre=
am[1], 0.9-rc4 is pretty much what is going to be in the<br>
0.9 release, and upgrading to this now will make upgrading to the final<br>
release a lot simplier.<br>
<br>
As there are no tarballs for the release candidates, switch to git. This<br=
>
means we need to disable the manpages as they need xmltoman to build.<br>
<br>
Delete all of the backported CVE patches as they&#39;re included in this<br=
>
release. The cvelistv5 database has version information on all of these<br>
CVEs, so they don&#39;t reappear in reports.<br>
<br>
Delete invalid-service.patch, fixed upstream differently in [2].<br>
<br>
Upstream has deleted the in-tree init scripts, so copy them from before<br>
deletion and add alongside the recipe.<br>
<br>
Consolidate the systemd options, and depend on libsystemd as avahi links<br=
>
to that instead of duplicating the code.<br>
<br>
Pass --runstatedir so that /run is used as expected.<br>
<br>
[1] <a href=3D"https://github.com/avahi/avahi/issues/503#issuecomment-44430=
16376" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/a=
vahi/avahi/issues/503#issuecomment-4443016376</a><br>
[2] avahi 93b1436 (&quot;core: no longer supply bogus services to callbacks=
&quot;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../avahi/{<a href=3D"http://avahi_0.8.bb" rel=3D"noreferrer noreferr=
er" target=3D"_blank">avahi_0.8.bb</a> =3D&gt; <a href=3D"http://avahi_0.9.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.9.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 52 ++--<br>
=C2=A0...01-Fix-opening-etc-resolv.conf-error.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../avahi/files/CVE-2023-1981.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 58 -----<br>
=C2=A0.../avahi/files/CVE-2023-38469-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 48 ----<br>
=C2=A0.../avahi/files/CVE-2023-38469-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 65 -----<br>
=C2=A0.../avahi/files/CVE-2023-38470-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 59 -----<br>
=C2=A0.../avahi/files/CVE-2023-38470-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 52 ----<br>
=C2=A0.../avahi/files/CVE-2023-38471-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 73 ------<br>
=C2=A0.../avahi/files/CVE-2023-38471-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 52 ----<br>
=C2=A0.../avahi/files/CVE-2023-38472.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 46 ----<br>
=C2=A0.../avahi/files/CVE-2023-38473.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 110 ---------<br>
=C2=A0.../avahi/files/CVE-2024-52615.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 228 ------------------<br>
=C2=A0.../avahi/files/CVE-2024-52616.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 104 --------<br>
=C2=A0.../avahi/files/CVE-2025-68276.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 68 ------<br>
=C2=A0.../avahi/files/CVE-2025-68468.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 32 ---<br>
=C2=A0.../avahi/files/CVE-2025-68471.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 36 ---<br>
=C2=A0.../avahi/files/CVE-2026-24401.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 74 ------<br>
=C2=A0.../avahi/files/CVE-2026-34933-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
08 ---------<br>
=C2=A0.../avahi/files/CVE-2026-34933-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 96 --------<br>
=C2=A0.../avahi/files/<a href=3D"http://avahi-daemon.in" rel=3D"noreferrer =
noreferrer" target=3D"_blank">avahi-daemon.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 198 +++++++++++++++<br>
=C2=A0.../avahi/files/<a href=3D"http://avahi-dnsconfd.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">avahi-dnsconfd.in</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 197 +++++++++++++++<br>
=C2=A0.../avahi/files/handle-hup.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 41 ----<br>
=C2=A0.../avahi/files/initscript.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 51 ----<br>
=C2=A0.../avahi/files/invalid-service.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 29 ---<br>
=C2=A0.../avahi/files/local-ping.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 152 ------------<br>
=C2=A025 files changed, 416 insertions(+), 1615 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/avahi/{<a href=3D"http://avahi_0.8.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.8.bb</a> =3D&gt;=
 <a href=3D"http://avahi_0.9.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">avahi_0.9.bb</a>} (83%)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-198=
1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
69-1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
69-2.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
70-1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
70-2.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
71-1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
71-2.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
72.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-384=
73.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-526=
15.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-526=
16.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-682=
76.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-684=
68.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-684=
71.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-244=
01.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-349=
33-1.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-349=
33-2.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/avahi/files/<a href=3D"h=
ttp://avahi-daemon.in" rel=3D"noreferrer noreferrer" target=3D"_blank">avah=
i-daemon.in</a><br>
=C2=A0create mode 100644 meta/recipes-connectivity/avahi/files/<a href=3D"h=
ttp://avahi-dnsconfd.in" rel=3D"noreferrer noreferrer" target=3D"_blank">av=
ahi-dnsconfd.in</a><br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/initscript.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/invalid-serv=
ice.patch<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/avahi/files/local-ping.p=
atch<br>
<br>
diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.8.bb</a> b/meta/r=
ecipes-connectivity/avahi/<a href=3D"http://avahi_0.9.bb" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">avahi_0.9.bb</a><br>
similarity index 83%<br>
rename from meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
rename to meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.9.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.9.bb</a><br>
index 0042c3c2e3d..b5b63cf1ee4 100644<br>
--- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
+++ b/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.9.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">avahi_0.9.bb</a><br>
@@ -18,35 +18,18 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2d5025d=
4aa3495befef8f17206a5b0a1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://avahi-daemon/main.c;endline=3D21;md5=3D9ee77368c5407af77caaef1b07=
285969 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://avahi-client/client.h;endline=3D23;md5=3Df4ac741a25c4f434039ba3e1=
8c8674cf&quot;<br>
<br>
-SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \<=
br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/avahi/avahi;protocol=
=3Dhttps;branch=3Dmaster;tag=3Dv0.9-rc4" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">github.com/avahi/avahi;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv0.9-rc4</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00avahi-autoipd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://99avahi-autoipd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://initscript.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://avahi-da=
emon.in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-daemon.in</a=
> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://avahi-dn=
sconfd.in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-dnsconfd.i=
n</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-opening-etc-resol=
v.conf-error.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://handle-hup.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://local-ping.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://invalid-service.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-1981.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38469-1.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38469-2.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38470-1.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38470-2.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38471-1.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38471-2.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38472.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38473.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52616.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52615.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-68276.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-24401.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-68468.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-68471.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-34933-1.patch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-34933-2.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
+PV =3D &quot;0.9~rc4&quot;<br>
+SRCREV =3D &quot;625ca0fac19229f6dfa3a6c6b698ae657187e50c&quot;<br>
+<br>
=C2=A0GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/avahi/avahi/r=
eleases/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/avahi/avahi/releases/</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;060309d7a333d38d951bc27598c677af1796934dbd98e=
1024e7ad8de798fedda&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2021-26720] =3D &quot;not-applicable-platform: Issue o=
nly affects Debian/SUSE&quot;<br>
<br>
@@ -55,17 +38,20 @@ DEPENDS =3D &quot;expat libcap libdaemon glib-2.0 glib-=
2.0-native&quot;<br>
=C2=A0# For gtk related PACKAGECONFIGs: gtk, gtk3<br>
=C2=A0AVAHI_GTK ?=3D &quot;&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;dbus ${@bb.utils.contains_any(&#39;DISTRO_FEATUR=
ES&#39;,&#39;x11 wayland&#39;,&#39;${AVAHI_GTK}&#39;,&#39;&#39;,d)}&quot;<b=
r>
+PACKAGECONFIG ??=3D &quot;dbus ${@bb.utils.contains_any(&#39;DISTRO_FEATUR=
ES&#39;,&#39;x11 wayland&#39;,&#39;${AVAHI_GTK}&#39;,&#39;&#39;,d)} ${@bb.u=
tils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[dbus] =3D &quot;--enable-dbus,--disable-dbus,dbus&quot;=
<br>
=C2=A0PACKAGECONFIG[gtk] =3D &quot;--enable-gtk,--disable-gtk,gtk+&quot;<br=
>
=C2=A0PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot=
;<br>
=C2=A0PACKAGECONFIG[libdns_sd] =3D &quot;--enable-compat-libdns_sd --enable=
-dbus,,dbus&quot;<br>
=C2=A0PACKAGECONFIG[libevent] =3D &quot;--enable-libevent,--disable-libeven=
t,libevent&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;--enable-libsystemd,--disable-libsystemd =
--without-systemdsystemunitdir,systemd&quot;<br>
=C2=A0PACKAGECONFIG[qt5] =3D &quot;--enable-qt5,--disable-qt5,qtbase&quot;<=
br>
<br>
=C2=A0inherit autotools pkgconfig gettext gobject-introspection github-rele=
ases<br>
<br>
-EXTRA_OECONF =3D &quot;--with-avahi-priv-access-group=3Dadm \<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--runstatedir=3D${runtimed=
ir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-avahi-priv-access-g=
roup=3Dadm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-stack-protector =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-gdbm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-dbm \<br>
@@ -75,14 +61,12 @@ EXTRA_OECONF =3D &quot;--with-avahi-priv-access-group=
=3Dadm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-qt4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-python \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-doxygen-doc \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-manpages \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-manpages \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${EXTRA_OECONF_SYSVINIT} \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${EXTRA_OECONF_SYSTEMD} \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# The distro choice determines what init scripts are installed<br>
=C2=A0EXTRA_OECONF_SYSVINIT =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;,&#39;sysvinit&#39;,&#39;--with-distro=3Ddebian&#39;,&#39;--with-d=
istro=3Dnone&#39;,d)}&quot;<br>
-EXTRA_OECONF_SYSTEMD =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;,&#39;systemd&#39;,&#39;--with-systemdsystemunitdir=3D${systemd_system_u=
nitdir}/&#39;,&#39;--without-systemdsystemunitdir&#39;,d)}&quot;<br>
<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# This m4 file will get in the way of our introspection=
.m4 with special cross-compilation fixes<br>
@@ -97,9 +81,9 @@ RRECOMMENDS:${PN}:append:libc-glibc =3D &quot; avahi-libn=
ss-mdns&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 autotools_do_install<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/run<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${runtimedir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test -d ${D}${datadir}/dbus-1 &amp;&amp; rmdir =
--ignore-fail-on-non-empty ${D}${datadir}/dbus-1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}${libdir}/avahi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Move example service files out of /etc/avahi/=
services so we don&#39;t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # advertise ssh &amp; sftp-ssh by default<br>
@@ -147,9 +131,8 @@ FILES:avahi-daemon =3D &quot;${sbindir}/avahi-daemon \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${sysconfdir}/avahi/avahi-daemon.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${sysconfdir}/avahi/hosts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${sysconfdir}/avahi/services \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${sysconfdir}/dbus-1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${sysconfdir}/init.d/avahi-daemon \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${datadir}/dbus-1/interfaces \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${datadir}/dbus-1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${datadir}/avahi/avahi-service.dtd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${datadir}/avahi/service-types \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${datadir}/dbus-1/system-services&quot;<br>
@@ -194,6 +177,11 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/udhcpc.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${UNPACKDIR}/00avahi-autoipd ${D}${sysc=
onfdir}/udhcpc.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${UNPACKDIR}/99avahi-autoipd ${D}${sysc=
onfdir}/udhcpc.d<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${UNPACKDIR}/<a href=3D"http://avahi-da=
emon.in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-daemon.in</a=
> ${D}${sysconfdir}/init.d/avahi-daemon<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install ${UNPACKDIR}/<a href=3D"http://avahi-dn=
sconfd.in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-dnsconfd.i=
n</a> ${D}${sysconfdir}/init.d/avahi-dnsconfd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,@sbindir@,${sbindir},g&#39; -e=
 &#39;s,@sysconfdir@,${sysconfdir},g&#39; ${D}${sysconfdir}/init.d/avahi-*<=
br>
=C2=A0}<br>
<br>
=C2=A0# At the time the postinst runs, dbus might not be setup so only rest=
art if running <br>
diff --git a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-res=
olv.conf-error.patch b/meta/recipes-connectivity/avahi/files/0001-Fix-openi=
ng-etc-resolv.conf-error.patch<br>
index cb8b83fd238..d46b4d88ac8 100644<br>
--- a/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.con=
f-error.patch<br>
+++ b/meta/recipes-connectivity/avahi/files/0001-Fix-opening-etc-resolv.con=
f-error.patch<br>
@@ -39,7 +39,7 @@ index 548c834..63e28e4 100644<br>
=C2=A0+After=3Dsystemd-resolved.service connman.service<br>
<br>
=C2=A0 [Service]<br>
- Type=3Ddbus<br>
+ BusName=3Dorg.freedesktop.Avahi<br>
=C2=A0-- <br>
=C2=A02.11.0<br>
<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch b/me=
ta/recipes-connectivity/avahi/files/CVE-2023-1981.patch<br>
deleted file mode 100644<br>
index 4d7924d13a6..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-1981.patch<br>
+++ /dev/null<br>
@@ -1,58 +0,0 @@<br>
-From a2696da2f2c50ac43b6c4903f72290d5c3fa9f6f Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D &lt;<a href=3D"mai=
lto:pemensik@redhat.com" target=3D"_blank" rel=3D"noreferrer">pemensik@redh=
at.com</a>&gt;<br>
-Date: Thu, 17 Nov 2022 01:51:53 +0100<br>
-Subject: [PATCH] Emit error if requested service is not found<br>
-<br>
-It currently just crashes instead of replying with error. Check return<br>
-value and emit error instead of passing NULL pointer to reply.<br>
-<br>
-Fixes #375<br>
-<br>
-Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-1981.patch?h=3Du=
buntu/jammy-security-Upstream" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-=
2023-1981.patch?h=3Dubuntu/jammy-security<br>
-Upstream</a> commit <a href=3D"https://github.com/lathiat/avahi/commit/a26=
96da2f2c50ac43b6c4903f72290d5c3fa9f6f" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/lathiat/avahi/commit/a2696da2f2c50ac43b6c490=
3f72290d5c3fa9f6f</a>]<br>
-CVE: CVE-2023-1981<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-daemon/dbus-protocol.c | 20 ++++++++++++++------<br>
- 1 file changed, 14 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/avahi-daemon/dbus-protocol.c b/avahi-daemon/dbus-protocol.c<b=
r>
-index 70d7687bc..406d0b441 100644<br>
---- a/avahi-daemon/dbus-protocol.c<br>
-+++ b/avahi-daemon/dbus-protocol.c<br>
-@@ -375,10 +375,14 @@ static DBusHandlerResult dbus_get_alternative_host_n=
ame(DBusConnection *c, DBusM<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0t =3D avahi_alternative_host_name(n);<br>
--=C2=A0 =C2=A0 avahi_dbus_respond_string(c, m, t);<br>
--=C2=A0 =C2=A0 avahi_free(t);<br>
-+=C2=A0 =C2=A0 if (t) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_dbus_respond_string(c, m, t);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(t);<br>
- <br>
--=C2=A0 =C2=A0 return DBUS_HANDLER_RESULT_HANDLED;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_HANDLER_RESULT_HANDLED;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_dbus_respond_error(c, m, AVAHI_E=
RR_NOT_FOUND, &quot;Hostname not found&quot;);<br>
-+=C2=A0 =C2=A0 }<br>
- }<br>
- <br>
- static DBusHandlerResult dbus_get_alternative_service_name(DBusConnection=
 *c, DBusMessage *m, DBusError *error) {<br>
-@@ -389,10 +393,14 @@ static DBusHandlerResult dbus_get_alternative_servic=
e_name(DBusConnection *c, DB<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0t =3D avahi_alternative_service_name(n);<br>
--=C2=A0 =C2=A0 avahi_dbus_respond_string(c, m, t);<br>
--=C2=A0 =C2=A0 avahi_free(t);<br>
-+=C2=A0 =C2=A0 if (t) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_dbus_respond_string(c, m, t);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(t);<br>
- <br>
--=C2=A0 =C2=A0 return DBUS_HANDLER_RESULT_HANDLED;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DBUS_HANDLER_RESULT_HANDLED;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_dbus_respond_error(c, m, AVAHI_E=
RR_NOT_FOUND, &quot;Service not found&quot;);<br>
-+=C2=A0 =C2=A0 }<br>
- }<br>
- <br>
- static DBusHandlerResult dbus_create_new_entry_group(DBusConnection *c, D=
BusMessage *m, DBusError *error) {<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch<br>
deleted file mode 100644<br>
index a078f66102f..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From 72842945085cc3adaccfdfa2853771b0e75ef991 Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Mon, 23 Oct 2023 20:29:31 +0000<br>
-Subject: [PATCH] avahi: core: reject overly long TXT resource records<br>
-<br>
-Closes <a href=3D"https://github.com/lathiat/avahi/issues/455" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://github.com/lathiat/avahi/issue=
s/455</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/avahi/com=
mit/a337a1ba7d15853fb56deef1f464529af6e3a1cf" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/lathiat/avahi/commit/a337a1ba7d15853f=
b56deef1f464529af6e3a1cf</a>]<br>
-CVE: CVE-2023-38469<br>
-<br>
-Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver=
.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&=
gt;<br>
----<br>
- avahi-core/rr.c | 9 ++++++++-<br>
- 1 file changed, 8 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/avahi-core/rr.c b/avahi-core/rr.c<br>
-index 7fa0bee..b03a24c 100644<br>
---- a/avahi-core/rr.c<br>
-+++ b/avahi-core/rr.c<br>
-@@ -32,6 +32,7 @@<br>
- #include &lt;avahi-common/malloc.h&gt;<br>
- #include &lt;avahi-common/defs.h&gt;<br>
-<br>
-+#include &quot;dns.h&quot;<br>
- #include &quot;rr.h&quot;<br>
- #include &quot;log.h&quot;<br>
- #include &quot;util.h&quot;<br>
-@@ -688,11 +689,17 @@ int avahi_record_is_valid(AvahiRecord *r) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case AVAHI_DNS_TYPE_TXT: {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AvahiStringList *strlst;<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t used =3D 0;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (strlst =3D r-&gt;data.txt.=
string_list; strlst; strlst =3D strlst-&gt;next)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (strlst =3D r-&gt;data.txt.=
string_list; strlst; strlst =3D strlst-&gt;next) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strlst-&=
gt;size &gt; 255 || strlst-&gt;size &lt;=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return 0;<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 used +=3D 1+strls=
t-&gt;size;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (used &gt; AVA=
HI_DNS_RDATA_MAX)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
---<br>
-2.40.0<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch<br>
deleted file mode 100644<br>
index f8f60ddca1c..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch<br>
+++ /dev/null<br>
@@ -1,65 +0,0 @@<br>
-From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Wed, 25 Oct 2023 18:15:42 +0000<br>
-Subject: [PATCH] tests: pass overly long TXT resource records<br>
-<br>
-to make sure they don&#39;t crash avahi any more.<br>
-It reproduces <a href=3D"https://github.com/lathiat/avahi/issues/455" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/lathiat/ava=
hi/issues/455</a><br>
-<br>
-Canonical notes:<br>
-nickgalanis&gt; removed first hunk since there is no .github dir in this r=
elease<br>
-<br>
-Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38469-2.patch?h=
=3Dubuntu/jammy-security-Upstream" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/=
CVE-2023-38469-2.patch?h=3Dubuntu/jammy-security<br>
-Upstream</a> commit <a href=3D"https://github.com/lathiat/avahi/commit/c6c=
ab87df290448a63323c8ca759baa516166237" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8=
ca759baa516166237</a>]<br>
-CVE: CVE-2023-38469<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-client/client-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++++++<=
br>
- 1 files changed, 14 insertions(+)<br>
-<br>
-Index: avahi-0.8/avahi-client/client-test.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- avahi-0.8.orig/avahi-client/client-test.c<br>
-+++ avahi-0.8/avahi-client/client-test.c<br>
-@@ -22,6 +22,7 @@<br>
- #endif<br>
- <br>
- #include &lt;stdio.h&gt;<br>
-+#include &lt;string.h&gt;<br>
- #include &lt;assert.h&gt;<br>
- <br>
- #include &lt;avahi-client/client.h&gt;<br>
-@@ -33,6 +34,8 @@<br>
- #include &lt;avahi-common/malloc.h&gt;<br>
- #include &lt;avahi-common/timeval.h&gt;<br>
- <br>
-+#include &lt;avahi-core/dns.h&gt;<br>
-+<br>
- static const AvahiPoll *poll_api =3D NULL;<br>
- static AvahiSimplePoll *simple_poll =3D NULL;<br>
- <br>
-@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA<br>
-=C2=A0 =C2=A0 =C2=A0uint32_t cookie;<br>
-=C2=A0 =C2=A0 =C2=A0struct timeval tv;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiAddress a;<br>
-+=C2=A0 =C2=A0 uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];<br>
-+=C2=A0 =C2=A0 AvahiStringList *txt =3D NULL;<br>
-+=C2=A0 =C2=A0 int r;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0simple_poll =3D avahi_simple_poll_new();<br>
-=C2=A0 =C2=A0 =C2=A0poll_api =3D avahi_simple_poll_get(simple_poll);<br>
-@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVA<br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;%s\n&quot;, avahi_strerror(avahi_entry_gr=
oup_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;Lathi=
at&#39;s Site&quot;, &quot;_http._tcp&quot;, NULL, NULL, 80, &quot;foo=3Dba=
r&quot;, NULL)));<br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;add_record: %d\n&quot;, avahi_entry_group=
_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quo=
t;, 0x01, 0x10, 120, &quot;\5booya&quot;, 6));<br>
- <br>
-+=C2=A0 =C2=A0 memset(rdata, 1, sizeof(rdata));<br>
-+=C2=A0 =C2=A0 r =3D avahi_string_list_parse(rdata, sizeof(rdata), &amp;tx=
t);<br>
-+=C2=A0 =C2=A0 assert(r &gt;=3D 0);<br>
-+=C2=A0 =C2=A0 assert(avahi_string_list_serialize(txt, NULL, 0) =3D=3D siz=
eof(rdata));<br>
-+=C2=A0 =C2=A0 error =3D avahi_entry_group_add_service_strlst(group, AVAHI=
_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, &quot;_qotd._tcp&quot=
;, NULL, NULL, 123, txt);<br>
-+=C2=A0 =C2=A0 assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);<br>
-+=C2=A0 =C2=A0 avahi_string_list_free(txt);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_U=
NSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_doma=
in_browser_callback, (char*) &quot;omghai3u&quot;);<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch<br>
deleted file mode 100644<br>
index 91f9e677ace..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-1.patch<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-From af7bfad67ca53a7c4042a4a2d85456b847e9f249 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D &lt;<a href=3D"mai=
lto:pemensik@redhat.com" target=3D"_blank" rel=3D"noreferrer">pemensik@redh=
at.com</a>&gt;<br>
-Date: Tue, 11 Apr 2023 15:29:59 +0200<br>
-Subject: [PATCH] avahi: Ensure each label is at least one byte long<br>
-<br>
-The only allowed exception is single dot, where it should return empty<br>
-string.<br>
-<br>
-Fixes #454.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/avahi/com=
mit/94cb6489114636940ac683515417990b55b5d66c" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/lathiat/avahi/commit/94cb648911463694=
0ac683515417990b55b5d66c</a>]<br>
-CVE: CVE-2023-38470<br>
-<br>
-Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver=
.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&=
gt;<br>
----<br>
- avahi-common/domain-test.c | 14 ++++++++++++++<br>
- avahi-common/domain.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
- 2 files changed, 15 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c<br>
-index cf763ec..3acc1c1 100644<br>
---- a/avahi-common/domain-test.c<br>
-+++ b/avahi-common/domain-test.c<br>
-@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED ch=
ar *argv[]) {<br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;%s\n&quot;, s =3D avahi_normalize_name_st=
rdup(&quot;fo\\\\o\\..f oo.&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0avahi_free(s);<br>
-<br>
-+=C2=A0 =C2=A0 printf(&quot;%s\n&quot;, s =3D avahi_normalize_name_strdup(=
&quot;.&quot;));<br>
-+=C2=A0 =C2=A0 avahi_free(s);<br>
-+<br>
-+=C2=A0 =C2=A0 s =3D avahi_normalize_name_strdup(&quot;,.=3D.}.=3D.?-.}.=
=3D.?.?.}.}.?.?.?.z.?.?.}.}.&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;}.?.=
?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.}.}.}&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.?.?=
.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?.zM.?`&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;?.}.=
}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.?.&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;?.z.=
?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.}.&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;??.?=
.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}?&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;?.}.=
}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;?`?.=
}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;}.?.=
?.?.}.=3D.?.?.}&quot;);<br>
-+=C2=A0 =C2=A0 assert(s =3D=3D NULL);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;%i\n&quot;, avahi_domain_equal(&quot;\\06=
5aa bbb\\.\\046cc.cc\\\\.dee.fff.&quot;, &quot;Aaa BBB\\.\\.cc.cc\\\\.dee.f=
ff&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0printf(&quot;%i\n&quot;, avahi_domain_equal(&quot;A&qu=
ot;, &quot;a&quot;));<br>
-<br>
-diff --git a/avahi-common/domain.c b/avahi-common/domain.c<br>
-index 3b1ab68..e66d241 100644<br>
---- a/avahi-common/domain.c<br>
-+++ b/avahi-common/domain.c<br>
-@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *ret_s,=
 size_t size) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!empty) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 2)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(r++) =3D &#39;.&#39;;<br=
>
---<br>
-2.40.0<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch<br>
deleted file mode 100644<br>
index e0736bf210a..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38470-2.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From 20dec84b2480821704258bc908e7b2bd2e883b24 Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Tue, 19 Sep 2023 03:21:25 +0000<br>
-Subject: [PATCH] [common] bail out when escaped labels can&#39;t fit into =
ret<br>
-<br>
-Fixes:<br>
-```<br>
-=3D=3D93410=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address=
 0x7f9e76f14c16 at pc 0x00000047208d bp 0x7ffee90a6a00 sp 0x7ffee90a61c8<br=
>
-READ of size 1110 at 0x7f9e76f14c16 thread T0<br>
-=C2=A0 =C2=A0 #0 0x47208c in __interceptor_strlen (out/fuzz-domain+0x47208=
c) (BuildId: 731b20c1eef22c2104e75a6496a399b10cfc7cba)<br>
-=C2=A0 =C2=A0 #1 0x534eb0 in avahi_strdup avahi/avahi-common/malloc.c:167:=
12<br>
-=C2=A0 =C2=A0 #2 0x53862c in avahi_normalize_name_strdup avahi/avahi-commo=
n/domain.c:226:12<br>
-```<br>
-and<br>
-```<br>
-fuzz-domain: fuzz/fuzz-domain.c:38: int LLVMFuzzerTestOneInput(const uint8=
_t *, size_t): Assertion `avahi_domain_equal(s, t)&#39; failed.<br>
-=3D=3D101571=3D=3D ERROR: libFuzzer: deadly signal<br>
-=C2=A0 =C2=A0 #0 0x501175 in __sanitizer_print_stack_trace (/home/vagrant/=
avahi/out/fuzz-domain+0x501175) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad60=
0216ea8)<br>
-=C2=A0 =C2=A0 #1 0x45ad2c in fuzzer::PrintStackTrace() (/home/vagrant/avah=
i/out/fuzz-domain+0x45ad2c) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216=
ea8)<br>
-=C2=A0 =C2=A0 #2 0x43fc07 in fuzzer::Fuzzer::CrashCallback() (/home/vagran=
t/avahi/out/fuzz-domain+0x43fc07) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad=
600216ea8)<br>
-=C2=A0 =C2=A0 #3 0x7f1581d7ebaf=C2=A0 (/lib64/libc.so.6+0x3dbaf) (BuildId:=
 c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)<br>
-=C2=A0 =C2=A0 #4 0x7f1581dcf883 in __pthread_kill_implementation (/lib64/l=
ibc.so.6+0x8e883) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)<br>
-=C2=A0 =C2=A0 #5 0x7f1581d7eafd in gsignal (/lib64/libc.so.6+0x3dafd) (Bui=
ldId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)<br>
-=C2=A0 =C2=A0 #6 0x7f1581d6787e in abort (/lib64/libc.so.6+0x2687e) (Build=
Id: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)<br>
-=C2=A0 =C2=A0 #7 0x7f1581d6779a in __assert_fail_base.cold (/lib64/libc.so=
.6+0x2679a) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)<br>
-=C2=A0 =C2=A0 #8 0x7f1581d77186 in __assert_fail (/lib64/libc.so.6+0x36186=
) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)<br>
-=C2=A0 =C2=A0 #9 0x5344a4 in LLVMFuzzerTestOneInput /home/vagrant/avahi/fu=
zz/fuzz-domain.c:38:9<br>
-```<br>
-<br>
-It&#39;s a follow-up to 94cb6489114636940ac683515417990b55b5d66c<br>
-<br>
-Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38470-2.patch?h=
=3Dubuntu/jammy-security-CVE" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2=
023-38470-2.patch?h=3Dubuntu/jammy-security<br>
-CVE</a>: CVE-2023-38470 #Follow-up patch<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-common/domain.c | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-Index: avahi-0.8/avahi-common/domain.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- avahi-0.8.orig/avahi-common/domain.c<br>
-+++ avahi-0.8/avahi-common/domain.c<br>
-@@ -210,7 +210,8 @@ char *avahi_normalize_name(const char *s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0empty =3D 0;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_escape_label(label, strlen(label), &amp=
;r, &amp;size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(avahi_escape_label(label, strlen(label)=
, &amp;r, &amp;size)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0return ret_s;<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch<br>
deleted file mode 100644<br>
index b3f716495db..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-1.patch<br>
+++ /dev/null<br>
@@ -1,73 +0,0 @@<br>
-From 48d745db7fd554fc33e96ec86d3675ebd530bb8e Mon Sep 17 00:00:00 2001<br>
-From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">msekleta@redhat.com</a>&gt;<br>
-Date: Mon, 23 Oct 2023 13:38:35 +0200<br>
-Subject: [PATCH] avahi: core: extract host name using avahi_unescape_label=
()<br>
-<br>
-Previously we could create invalid escape sequence when we split the<br>
-string on dot. For example, from valid host name &quot;foo\\.bar&quot; we =
have<br>
-created invalid name &quot;foo\\&quot; and tried to set that as the host n=
ame<br>
-which crashed the daemon.<br>
-<br>
-Fixes #453<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/avahi/com=
mit/894f085f402e023a98cbb6f5a3d117bd88d93b09" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/lathiat/avahi/commit/894f085f402e023a=
98cbb6f5a3d117bd88d93b09</a>]<br>
-CVE: CVE-2023-38471<br>
-<br>
-Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver=
.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&=
gt;<br>
----<br>
- avahi-core/server.c | 27 +++++++++++++++++++++------<br>
- 1 file changed, 21 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/avahi-core/server.c b/avahi-core/server.c<br>
-index e507750..40f1d68 100644<br>
---- a/avahi-core/server.c<br>
-+++ b/avahi-core/server.c<br>
-@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {<br>
- }<br>
-<br>
- int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {<b=
r>
--=C2=A0 =C2=A0 char *hn =3D NULL;<br>
-+=C2=A0 =C2=A0 char label_escaped[AVAHI_LABEL_MAX*4+1];<br>
-+=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX];<br>
-+=C2=A0 =C2=A0 char *hn =3D NULL, *h;<br>
-+=C2=A0 =C2=A0 size_t len;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0assert(s);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, !host_name || avahi_is_valid_h=
ost_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);<br>
-@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s, con=
st char *host_name) {<br>
-=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hn =3D avahi_normalize_name_strdup(host_=
name);<br>
-<br>
--=C2=A0 =C2=A0 hn[strcspn(hn, &quot;.&quot;)] =3D 0;<br>
-+=C2=A0 =C2=A0 h =3D hn;<br>
-+=C2=A0 =C2=A0 if (!avahi_unescape_label((const char **)&amp;hn, label, si=
zeof(label))) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(h);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 avahi_free(h);<br>
-+<br>
-+=C2=A0 =C2=A0 h =3D label_escaped;<br>
-+=C2=A0 =C2=A0 len =3D sizeof(label_escaped);<br>
-+=C2=A0 =C2=A0 if (!avahi_escape_label(label, strlen(label), &amp;h, &amp;=
len))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME;<br>
-<br>
--=C2=A0 =C2=A0 if (avahi_domain_equal(s-&gt;host_name, hn) &amp;&amp; s-&g=
t;state !=3D AVAHI_SERVER_COLLISION) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(hn);<br>
-+=C2=A0 =C2=A0 if (avahi_domain_equal(s-&gt;host_name, label_escaped) &amp=
;&amp; s-&gt;state !=3D AVAHI_SERVER_COLLISION)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_server_set_errno(s, AVAHI_E=
RR_NO_CHANGE);<br>
--=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0withdraw_host_rrs(s);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0avahi_free(s-&gt;host_name);<br>
--=C2=A0 =C2=A0 s-&gt;host_name =3D hn;<br>
-+=C2=A0 =C2=A0 s-&gt;host_name =3D avahi_strdup(label_escaped);<br>
-+=C2=A0 =C2=A0 if (!s-&gt;host_name)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_NO_MEMORY;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0update_fqdn(s);<br>
-<br>
---<br>
-2.40.0<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch<br>
deleted file mode 100644<br>
index 44737bfc2e1..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38471-2.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From b675f70739f404342f7f78635d6e2dcd85a13460 Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Tue, 24 Oct 2023 22:04:51 +0000<br>
-Subject: [PATCH] core: return errors from avahi_server_set_host_name prope=
rly<br>
-<br>
-It&#39;s a follow-up to 894f085f402e023a98cbb6f5a3d117bd88d93b09<br>
-<br>
-Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38471-2.patch?h=
=3Dubuntu/jammy-security-Upstream" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/=
CVE-2023-38471-2.patch?h=3Dubuntu/jammy-security<br>
-Upstream</a> commit <a href=3D"https://github.com/lathiat/avahi/commit/b67=
5f70739f404342f7f78635d6e2dcd85a13460" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/lathiat/avahi/commit/b675f70739f404342f7f786=
35d6e2dcd85a13460</a>]<br>
-CVE: CVE-2023-38471 #Follow-up Patch<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-core/server.c | 9 ++++++---<br>
- 1 file changed, 6 insertions(+), 3 deletions(-)<br>
-<br>
-Index: avahi-0.8/avahi-core/server.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- avahi-0.8.orig/avahi-core/server.c<br>
-+++ avahi-0.8/avahi-core/server.c<br>
-@@ -1309,10 +1309,13 @@ int avahi_server_set_host_name(AvahiServ<br>
-=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hn =3D avahi_normalize_name_strdup(host_=
name);<br>
- <br>
-+=C2=A0 =C2=A0 if (!hn)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_server_set_errno(s, AVAHI_ERR_NO=
_MEMORY);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0h =3D hn;<br>
-=C2=A0 =C2=A0 =C2=A0if (!avahi_unescape_label((const char **)&amp;hn, labe=
l, sizeof(label))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(h);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_server_set_errno(s, AVAHI_ERR_IN=
VALID_HOST_NAME);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0avahi_free(h);<br>
-@@ -1320,7 +1323,7 @@ int avahi_server_set_host_name(AvahiServ<br>
-=C2=A0 =C2=A0 =C2=A0h =3D label_escaped;<br>
-=C2=A0 =C2=A0 =C2=A0len =3D sizeof(label_escaped);<br>
-=C2=A0 =C2=A0 =C2=A0if (!avahi_escape_label(label, strlen(label), &amp;h, =
&amp;len))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_server_set_errno(s, AVAHI_ERR_IN=
VALID_HOST_NAME);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (avahi_domain_equal(s-&gt;host_name, label_escaped)=
 &amp;&amp; s-&gt;state !=3D AVAHI_SERVER_COLLISION)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_server_set_errno(s, AVAHI_E=
RR_NO_CHANGE);<br>
-@@ -1330,7 +1333,7 @@ int avahi_server_set_host_name(AvahiServ<br>
-=C2=A0 =C2=A0 =C2=A0avahi_free(s-&gt;host_name);<br>
-=C2=A0 =C2=A0 =C2=A0s-&gt;host_name =3D avahi_strdup(label_escaped);<br>
-=C2=A0 =C2=A0 =C2=A0if (!s-&gt;host_name)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_NO_MEMORY;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_server_set_errno(s, AVAHI_ERR_NO=
_MEMORY);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0update_fqdn(s);<br>
- <br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
deleted file mode 100644<br>
index 85dbded73bd..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001<br>
-From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">msekleta@redhat.com</a>&gt;<br>
-Date: Thu, 19 Oct 2023 17:36:44 +0200<br>
-Subject: [PATCH] core: make sure there is rdata to process before parsing =
it<br>
-<br>
-Fixes #452<br>
-<br>
-CVE-2023-38472<br>
-<br>
-Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE-2023-38472.patch?h=3D=
ubuntu/jammy-security-Upstream" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://git.launchpad.net/ubuntu/+source/avahi/tree/debian/patches/CVE=
-2023-38472.patch?h=3Dubuntu/jammy-security<br>
-Upstream</a> commit <a href=3D"https://github.com/lathiat/avahi/commit/b02=
4ae5749f4aeba03478e6391687c3c9c8dee40" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6=
391687c3c9c8dee40</a>]<br>
-CVE: CVE-2023-38472<br>
-Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver=
.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&=
gt;<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-client/client-test.c=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
- avahi-daemon/dbus-entry-group.c | 2 +-<br>
- 2 files changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-Index: avahi-0.8/avahi-client/client-test.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- avahi-0.8.orig/avahi-client/client-test.c<br>
-+++ avahi-0.8/avahi-client/client-test.c<br>
-@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVA<br>
-=C2=A0 =C2=A0 =C2=A0assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);<br>
-=C2=A0 =C2=A0 =C2=A0avahi_string_list_free(txt);<br>
- <br>
-+=C2=A0 =C2=A0 error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNS=
PEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, 0x01, 0x10, 120, &quot;&quot=
;, 0);<br>
-+=C2=A0 =C2=A0 assert(error !=3D AVAHI_OK);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_U=
NSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_doma=
in_browser_callback, (char*) &quot;omghai3u&quot;);<br>
-Index: avahi-0.8/avahi-daemon/dbus-entry-group.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- avahi-0.8.orig/avahi-daemon/dbus-entry-group.c<br>
-+++ avahi-0.8/avahi-daemon/dbus-entry-group.c<br>
-@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_g<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(r =3D avahi_record_new_full (name,=
 clazz, type, ttl)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_dbus_respond_=
error(c, m, AVAHI_ERR_NO_MEMORY, NULL);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avahi_rdata_parse (r, rdata, size) &lt; 0=
) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdata || avahi_rdata_parse (r, rdata, si=
ze) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_record_unref (r);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_dbus_respond_=
error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<br>
deleted file mode 100644<br>
index 707acb60fec..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<br>
+++ /dev/null<br>
@@ -1,110 +0,0 @@<br>
-From 88cbbc48d5efff9726694557ca6c3f698f3affe4 Mon Sep 17 00:00:00 2001<br>
-From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">msekleta@redhat.com</a>&gt;<br>
-Date: Wed, 11 Oct 2023 17:45:44 +0200<br>
-Subject: [PATCH] avahi: common: derive alternative host name from its<br>
- unescaped version<br>
-<br>
-Normalization of input makes sure we don&#39;t have to deal with special<b=
r>
-cases like unescaped dot at the end of label.<br>
-<br>
-Fixes #451 #487<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/avahi/com=
mit/b448c9f771bada14ae8de175695a9729f8646797" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/lathiat/avahi/commit/b448c9f771bada14=
ae8de175695a9729f8646797</a>]<br>
-CVE: CVE-2023-38473<br>
-<br>
-Signed-off-by: Meenali Gupta &lt;<a href=3D"mailto:meenali.gupta@windriver=
.com" target=3D"_blank" rel=3D"noreferrer">meenali.gupta@windriver.com</a>&=
gt;<br>
----<br>
- avahi-common/alternative-test.c |=C2=A0 3 +++<br>
- avahi-common/alternative.c=C2=A0 =C2=A0 =C2=A0 | 27 +++++++++++++++++++--=
------<br>
- 2 files changed, 22 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/avahi-common/alternative-test.c b/avahi-common/alternative-te=
st.c<br>
-index 9255435..681fc15 100644<br>
---- a/avahi-common/alternative-test.c<br>
-+++ b/avahi-common/alternative-test.c<br>
-@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED cha=
r *argv[]) {<br>
-=C2=A0 =C2=A0 =C2=A0const char* const test_strings[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXXXXXXXXXXXXXX&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXX=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;).&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\.&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAA\\\\&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;gurke&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; #&quot;,<br>
-diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c<br>
-index b3d39f0..a094e6d 100644<br>
---- a/avahi-common/alternative.c<br>
-+++ b/avahi-common/alternative.c<br>
-@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {<br>
- }<br>
-<br>
- char *avahi_alternative_host_name(const char *s) {<br>
-+=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+=
1];<br>
-+=C2=A0 =C2=A0 char *alt, *r, *ret;<br>
-=C2=A0 =C2=A0 =C2=A0const char *e;<br>
--=C2=A0 =C2=A0 char *r;<br>
-+=C2=A0 =C2=A0 size_t len;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0assert(s);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0if (!avahi_is_valid_host_name(s))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-<br>
--=C2=A0 =C2=A0 if ((e =3D strrchr(s, &#39;-&#39;))) {<br>
-+=C2=A0 =C2=A0 if (!avahi_unescape_label(&amp;s, label, sizeof(label)))<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+<br>
-+=C2=A0 =C2=A0 if ((e =3D strrchr(label, &#39;-&#39;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e++;<br>
-@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0if (e) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c, *m;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int n;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D atoi(e)+1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(m =3D avahi_strdup_printf(&quot;%i=
&quot;, n)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D e-s-1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D e-label-1;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt;=3D AVAHI_LABEL_MAX-1-strlen(m)-1)<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D AVAHI_LABEL_MAX-1-strlen(=
m)-1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt;=3D AVAHI_LABEL_MAX-1-strlen(m)-1=
)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D AVAHI_LABEL_MAX-1-strle=
n(m)-1;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(s, l))) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(label, len))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(m);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) {<br>
-=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-=
1-2)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(label, AVAHI_LABEL_=
MAX-1-2)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drop_incomplete_utf8(c);<br>
-@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(c);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 alt =3D alternative;<br>
-+=C2=A0 =C2=A0 len =3D sizeof(alternative);<br>
-+=C2=A0 =C2=A0 ret =3D avahi_escape_label(r, strlen(r), &amp;alt, &amp;len=
);<br>
-+<br>
-+=C2=A0 =C2=A0 avahi_free(r);<br>
-+=C2=A0 =C2=A0 r =3D avahi_strdup(ret);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0assert(avahi_is_valid_host_name(r));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0return r;<br>
---<br>
-2.40.0<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2024-52615.patch<br>
deleted file mode 100644<br>
index 9737f528375..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch<br>
+++ /dev/null<br>
@@ -1,228 +0,0 @@<br>
-From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001<br>
-From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">msekleta@redhat.com</a>&gt;<br>
-Date: Wed, 27 Nov 2024 18:07:32 +0100<br>
-Subject: [PATCH] core/wide-area: fix for CVE-2024-52615<br>
-<br>
-CVE: CVE-2024-52615<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/commi=
t/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f3=
8ae04fdcdf2411f8b942</a>]<br>
-<br>
-Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.c=
om" target=3D"_blank" rel=3D"noreferrer">peng.zhang1.cn@windriver.com</a>&g=
t;<br>
----<br>
- avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------<br=
>
- 1 file changed, 69 insertions(+), 59 deletions(-)<br>
-<br>
-diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c<br>
-index 00a15056e..06df7afc6 100644<br>
---- a/avahi-core/wide-area.c<br>
-+++ b/avahi-core/wide-area.c<br>
-@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0AvahiAddress dns_server_used;<br>
- <br>
-+=C2=A0 =C2=A0 int fd;<br>
-+=C2=A0 =C2=A0 AvahiWatch *watch;<br>
-+=C2=A0 =C2=A0 AvahiProtocol proto;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);<br>
- };<br>
-@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {<br>
- struct AvahiWideAreaLookupEngine {<br>
-=C2=A0 =C2=A0 =C2=A0AvahiServer *server;<br>
- <br>
--=C2=A0 =C2=A0 int fd_ipv4, fd_ipv6;<br>
--=C2=A0 =C2=A0 AvahiWatch *watch_ipv4, *watch_ipv6;<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0/* Cache */<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);<br>
-=C2=A0 =C2=A0 =C2=A0AvahiHashmap *cache_by_key;<br>
-@@ -125,35 +126,67 @@ static AvahiWideAreaLookup* find_lookup(AvahiWideAre=
aLookupEngine *e, uint16_t i<br>
-=C2=A0 =C2=A0 =C2=A0return l;<br>
- }<br>
- <br>
-+static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GC=
C_UNUSED AvahiWatchEvent events, void *userdata);<br>
-+<br>
- static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p) =
{<br>
-+=C2=A0 =C2=A0 AvahiWideAreaLookupEngine *e;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiAddress *a;<br>
-+=C2=A0 =C2=A0 AvahiServer *s;<br>
-+=C2=A0 =C2=A0 AvahiWatch *w;<br>
-+=C2=A0 =C2=A0 int r;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0assert(l);<br>
-=C2=A0 =C2=A0 =C2=A0assert(p);<br>
- <br>
--=C2=A0 =C2=A0 if (l-&gt;engine-&gt;n_dns_servers &lt;=3D 0)<br>
-+=C2=A0 =C2=A0 e =3D l-&gt;engine;<br>
-+=C2=A0 =C2=A0 assert(e);<br>
-+<br>
-+=C2=A0 =C2=A0 s =3D e-&gt;server;<br>
-+=C2=A0 =C2=A0 assert(s);<br>
-+<br>
-+=C2=A0 =C2=A0 if (e-&gt;n_dns_servers &lt;=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
- <br>
--=C2=A0 =C2=A0 assert(l-&gt;engine-&gt;current_dns_server &lt; l-&gt;engin=
e-&gt;n_dns_servers);<br>
-+=C2=A0 =C2=A0 assert(e-&gt;current_dns_server &lt; e-&gt;n_dns_servers);<=
br>
- <br>
--=C2=A0 =C2=A0 a =3D &amp;l-&gt;engine-&gt;dns_servers[l-&gt;engine-&gt;cu=
rrent_dns_server];<br>
-+=C2=A0 =C2=A0 a =3D &amp;e-&gt;dns_servers[e-&gt;current_dns_server];<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;dns_server_used =3D *a;<br>
- <br>
--=C2=A0 =C2=A0 if (a-&gt;proto =3D=3D AVAHI_PROTO_INET) {<br>
-+=C2=A0 =C2=A0 if (l-&gt;fd &gt;=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We are reusing lookup object and sending p=
acket to another server so let&#39;s cleanup before we establish connection=
 to new server. */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;poll_api-&gt;watch_free(l-&gt;watch);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 l-&gt;watch =3D NULL;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l-&gt;engine-&gt;fd_ipv4 &lt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(l-&gt;fd);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 l-&gt;fd =3D -EBADF;<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_send_dns_packet_ipv4(l-&gt;engin=
e-&gt;fd_ipv4, AVAHI_IF_UNSPEC, p, NULL, &amp;a-&gt;data.ipv4, AVAHI_DNS_PO=
RT);<br>
-+=C2=A0 =C2=A0 assert(a-&gt;proto =3D=3D AVAHI_PROTO_INET || a-&gt;proto =
=3D=3D AVAHI_PROTO_INET6);<br>
- <br>
--=C2=A0 =C2=A0 } else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(a-&gt;proto =3D=3D AVAHI_PROTO_INET6);=
<br>
-+=C2=A0 =C2=A0 if (a-&gt;proto =3D=3D AVAHI_PROTO_INET)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D s-&gt;config.use_ipv4 ? avahi_open_unic=
ast_socket_ipv4() : -1;<br>
-+=C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D s-&gt;config.use_ipv6 ? avahi_open_unic=
ast_socket_ipv6() : -1;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l-&gt;engine-&gt;fd_ipv6 &lt; 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 if (r &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_log_error(__FILE__ &quot;: Failed to cr=
eate socket for wide area lookup&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return avahi_send_dns_packet_ipv6(l-&gt;engin=
e-&gt;fd_ipv6, AVAHI_IF_UNSPEC, p, NULL, &amp;a-&gt;data.ipv6, AVAHI_DNS_PO=
RT);<br>
-+=C2=A0 =C2=A0 w =3D s-&gt;poll_api-&gt;watch_new(s-&gt;poll_api, r, AVAHI=
_WATCH_IN, socket_event, l);<br>
-+=C2=A0 =C2=A0 if (!w) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(r);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_log_error(__FILE__ &quot;: Failed to cr=
eate socket watch for wide area lookup&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 l-&gt;fd =3D r;<br>
-+=C2=A0 =C2=A0 l-&gt;watch =3D w;<br>
-+=C2=A0 =C2=A0 l-&gt;proto =3D a-&gt;proto;<br>
-+<br>
-+=C2=A0 =C2=A0 return a-&gt;proto =3D=3D AVAHI_PROTO_INET ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_send_dns_pa=
cket_ipv4(l-&gt;fd, AVAHI_IF_UNSPEC, p, NULL, &amp;a-&gt;data.ipv4, AVAHI_D=
NS_PORT):<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_send_dns_pa=
cket_ipv6(l-&gt;fd, AVAHI_IF_UNSPEC, p, NULL, &amp;a-&gt;data.ipv6, AVAHI_D=
NS_PORT);<br>
- }<br>
- <br>
- static void next_dns_server(AvahiWideAreaLookupEngine *e) {<br>
-@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;dead =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;key =3D avahi_key_ref(key);<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;cname_key =3D avahi_key_new_cname(l-&gt;key);<br=
>
-+=C2=A0 =C2=A0 l-&gt;fd =3D -EBADF;<br>
-+=C2=A0 =C2=A0 l-&gt;watch =3D NULL;<br>
-+=C2=A0 =C2=A0 l-&gt;proto =3D AVAHI_PROTO_UNSPEC;<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;callback =3D callback;<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;userdata =3D userdata;<br>
- <br>
-@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) {<=
br>
-=C2=A0 =C2=A0 =C2=A0if (l-&gt;cname_key)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_key_unref(l-&gt;cname_key);<br>
- <br>
-+=C2=A0 =C2=A0 if (l-&gt;watch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l-&gt;engine-&gt;server-&gt;pol=
l_api-&gt;watch_free(l-&gt;watch);<br>
-+<br>
-+=C2=A0 =C2=A0 if (l-&gt;fd &gt;=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(l-&gt;fd);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0avahi_free(l);<br>
- }<br>
- <br>
-@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngine =
*e, AvahiDnsPacket *p) {<br>
- }<br>
- <br>
- static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GC=
C_UNUSED AvahiWatchEvent events, void *userdata) {<br>
--=C2=A0 =C2=A0 AvahiWideAreaLookupEngine *e =3D userdata;<br>
-+=C2=A0 =C2=A0 AvahiWideAreaLookup *l =3D userdata;<br>
-+=C2=A0 =C2=A0 AvahiWideAreaLookupEngine *e =3D l-&gt;engine;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiDnsPacket *p =3D NULL;<br>
- <br>
--=C2=A0 =C2=A0 if (fd =3D=3D e-&gt;fd_ipv4)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D avahi_recv_dns_packet_ipv4(e-&gt;fd_ipv=
4, NULL, NULL, NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 assert(l);<br>
-+=C2=A0 =C2=A0 assert(e);<br>
-+=C2=A0 =C2=A0 assert(l-&gt;fd =3D=3D fd);<br>
-+<br>
-+=C2=A0 =C2=A0 if (l-&gt;proto =3D=3D AVAHI_PROTO_INET)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D avahi_recv_dns_packet_ipv4(l-&gt;fd, NU=
LL, NULL, NULL, NULL, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fd =3D=3D e-&gt;fd_ipv6);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D avahi_recv_dns_packet_ipv6(e-&gt;fd_ipv=
6, NULL, NULL, NULL, NULL, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(l-&gt;proto =3D=3D AVAHI_PROTO_INET6);=
<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D avahi_recv_dns_packet_ipv6(l-&gt;fd, NU=
LL, NULL, NULL, NULL, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (p) {<br>
-@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new=
(AvahiServer *s) {<br>
-=C2=A0 =C2=A0 =C2=A0e-&gt;server =3D s;<br>
-=C2=A0 =C2=A0 =C2=A0e-&gt;cleanup_dead =3D 0;<br>
- <br>
--=C2=A0 =C2=A0 /* Create sockets */<br>
--=C2=A0 =C2=A0 e-&gt;fd_ipv4 =3D s-&gt;config.use_ipv4 ? avahi_open_unicas=
t_socket_ipv4() : -1;<br>
--=C2=A0 =C2=A0 e-&gt;fd_ipv6 =3D s-&gt;config.use_ipv6 ? avahi_open_unicas=
t_socket_ipv6() : -1;<br>
--<br>
--=C2=A0 =C2=A0 if (e-&gt;fd_ipv4 &lt; 0 &amp;&amp; e-&gt;fd_ipv6 &lt; 0) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_log_error(__FILE__&quot;: Failed to cre=
ate wide area sockets: %s&quot;, strerror(errno));<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e-&gt;fd_ipv6 &gt;=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(e-&gt;fd_ipv6);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e-&gt;fd_ipv4 &gt;=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(e-&gt;fd_ipv4);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(e);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
--=C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 /* Create watches */<br>
--<br>
--=C2=A0 =C2=A0 e-&gt;watch_ipv4 =3D e-&gt;watch_ipv6 =3D NULL;<br>
--<br>
--=C2=A0 =C2=A0 if (e-&gt;fd_ipv4 &gt;=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 e-&gt;watch_ipv4 =3D s-&gt;poll_api-&gt;watch=
_new(e-&gt;server-&gt;poll_api, e-&gt;fd_ipv4, AVAHI_WATCH_IN, socket_event=
, e);<br>
--=C2=A0 =C2=A0 if (e-&gt;fd_ipv6 &gt;=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 e-&gt;watch_ipv6 =3D s-&gt;poll_api-&gt;watch=
_new(e-&gt;server-&gt;poll_api, e-&gt;fd_ipv6, AVAHI_WATCH_IN, socket_event=
, e);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0e-&gt;n_dns_servers =3D e-&gt;current_dns_server =3D 0=
;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* Initialize cache */<br>
-@@ -651,18 +673,6 @@ void avahi_wide_area_engine_free(AvahiWideAreaLookupE=
ngine *e) {<br>
-=C2=A0 =C2=A0 =C2=A0avahi_hashmap_free(e-&gt;lookups_by_id);<br>
-=C2=A0 =C2=A0 =C2=A0avahi_hashmap_free(e-&gt;lookups_by_key);<br>
- <br>
--=C2=A0 =C2=A0 if (e-&gt;watch_ipv4)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 e-&gt;server-&gt;poll_api-&gt;watch_free(e-&g=
t;watch_ipv4);<br>
--<br>
--=C2=A0 =C2=A0 if (e-&gt;watch_ipv6)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 e-&gt;server-&gt;poll_api-&gt;watch_free(e-&g=
t;watch_ipv6);<br>
--<br>
--=C2=A0 =C2=A0 if (e-&gt;fd_ipv6 &gt;=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(e-&gt;fd_ipv6);<br>
--<br>
--=C2=A0 =C2=A0 if (e-&gt;fd_ipv4 &gt;=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(e-&gt;fd_ipv4);<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0avahi_free(e);<br>
- }<br>
- <br>
-@@ -680,7 +690,7 @@ void avahi_wide_area_set_servers(AvahiWideAreaLookupEn=
gine *e, const AvahiAddres<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (a) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (e-&gt;n_dns_servers =3D 0; n &gt; 0=
 &amp;&amp; e-&gt;n_dns_servers &lt; AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--)=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((a-&gt;proto =3D=3D AVAHI_P=
ROTO_INET &amp;&amp; e-&gt;fd_ipv4 &gt;=3D 0) || (a-&gt;proto =3D=3D AVAHI_=
PROTO_INET6 &amp;&amp; e-&gt;fd_ipv6 &gt;=3D 0))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (a-&gt;proto =3D=3D AVAHI_PR=
OTO_INET || a-&gt;proto =3D=3D AVAHI_PROTO_INET6)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e-&gt;dns_se=
rvers[e-&gt;n_dns_servers++] =3D *a;<br>
-=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(n =3D=3D 0);<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2024-52616.patch<br>
deleted file mode 100644<br>
index a156f987280..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch<br>
+++ /dev/null<br>
@@ -1,104 +0,0 @@<br>
-From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D &lt;<a href=3D"mai=
lto:pemensik@redhat.com" target=3D"_blank" rel=3D"noreferrer">pemensik@redh=
at.com</a>&gt;<br>
-Date: Mon, 11 Nov 2024 00:56:09 +0100<br>
-Subject: [PATCH] Properly randomize query id of DNS packets<br>
-<br>
-CVE: CVE-2024-52616<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/commi=
t/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe=
3bfaeabebbda1b7a79f7</a>]<br>
-<br>
-Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.c=
om" target=3D"_blank" rel=3D"noreferrer">peng.zhang1.cn@windriver.com</a>&g=
t;<br>
----<br>
- avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=3D"_=
blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +=
+-<br>
- 2 files changed, 30 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c<br>
-index 971f5e714..00a15056e 100644<br>
---- a/avahi-core/wide-area.c<br>
-+++ b/avahi-core/wide-area.c<br>
-@@ -40,6 +40,13 @@<br>
- #include &quot;addr-util.h&quot;<br>
- #include &quot;rr-util.h&quot;<br>
- <br>
-+#ifdef HAVE_SYS_RANDOM_H<br>
-+#include &lt;sys/random.h&gt;<br>
-+#endif<br>
-+#ifndef HAVE_GETRANDOM<br>
-+#=C2=A0 define getrandom(d, len, flags) (-1)<br>
-+#endif<br>
-+<br>
- #define CACHE_ENTRIES_MAX 500<br>
- <br>
- typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;<br>
-@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {<br>
-=C2=A0 =C2=A0 =C2=A0int fd_ipv4, fd_ipv6;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiWatch *watch_ipv4, *watch_ipv6;<br>
- <br>
--=C2=A0 =C2=A0 uint16_t next_id;<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0/* Cache */<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);<br>
-=C2=A0 =C2=A0 =C2=A0AvahiHashmap *cache_by_key;<br>
-@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent *e=
, void *userdata) {<br>
-=C2=A0 =C2=A0 =C2=A0avahi_time_event_update(e, avahi_elapse_time(&amp;tv, =
1000, 0));<br>
- }<br>
- <br>
-+static uint16_t get_random_uint16(void) {<br>
-+=C2=A0 =C2=A0 uint16_t next_id;<br>
-+<br>
-+=C2=A0 =C2=A0 if (getrandom(&amp;next_id, sizeof(next_id), 0) =3D=3D -1)<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 next_id =3D (uint16_t) rand();<br>
-+=C2=A0 =C2=A0 return next_id;<br>
-+}<br>
-+<br>
-+static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {<b=
r>
-+=C2=A0 =C2=A0 uint16_t next_id;<br>
-+<br>
-+=C2=A0 =C2=A0 next_id =3D get_random_uint16();<br>
-+=C2=A0 =C2=A0 while (find_lookup(e, next_id)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This ID is already used, get new. */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 next_id =3D get_random_uint16();<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return next_id;<br>
-+}<br>
-+<br>
-+<br>
- AvahiWideAreaLookup *avahi_wide_area_lookup_new(<br>
-=C2=A0 =C2=A0 =C2=A0AvahiWideAreaLookupEngine *e,<br>
-=C2=A0 =C2=A0 =C2=A0AvahiKey *key,<br>
-@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(<br>
-=C2=A0 =C2=A0 =C2=A0/* If more than 65K wide area quries are issued simult=
aneously,<br>
-=C2=A0 =C2=A0 =C2=A0 * this will break. This should be limited by some hig=
her level */<br>
- <br>
--=C2=A0 =C2=A0 for (;; e-&gt;next_id++)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!find_lookup(e, e-&gt;next_id))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break; /* This ID is not yet us=
ed. */<br>
--<br>
--=C2=A0 =C2=A0 l-&gt;id =3D e-&gt;next_id++;<br>
-+=C2=A0 =C2=A0 l-&gt;id =3D avahi_wide_area_next_id(e);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* We keep the packet around in case we need to repeat=
 our query */<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;packet =3D avahi_dns_packet_new(0);<br>
-@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(=
AvahiServer *s) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e-&gt;watch_ipv6 =3D s-&gt;poll_api-&gt;=
watch_new(e-&gt;server-&gt;poll_api, e-&gt;fd_ipv6, AVAHI_WATCH_IN, socket_=
event, e);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0e-&gt;n_dns_servers =3D e-&gt;current_dns_server =3D 0=
;<br>
--=C2=A0 =C2=A0 e-&gt;next_id =3D (uint16_t) rand();<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* Initialize cache */<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e-&gt;c=
ache);<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=
=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
-index a3211b80e..31bce3d76 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES<br>
- # whether libc&#39;s malloc does too. (Same for realloc.)<br>
- #AC_FUNC_MALLOC<br>
- #AC_FUNC_REALLOC<br>
--AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket str=
chr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid =
setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy getho=
stbyname seteuid setegid setproctitle getprogname])<br>
-+AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket str=
chr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid =
setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy getho=
stbyname seteuid setegid setproctitle getprogname getrandom])<br>
-+AC_CHECK_HEADERS([sys/random.h])<br>
- <br>
- AC_FUNC_CHOWN<br>
- AC_FUNC_STAT<br>
-<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68276.patch<br>
deleted file mode 100644<br>
index b3e11f9597f..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch<br>
+++ /dev/null<br>
@@ -1,68 +0,0 @@<br>
-From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Wed, 17 Dec 2025 08:11:23 +0000<br>
-Subject: [PATCH] core: refuse to create wide-area record browsers when<br>
- wide-area is off<br>
-<br>
-It fixes a bug where it was possible for unprivileged local users to<br>
-crash avahi-daemon (with wide-area disabled) by creating record browsers<b=
r>
-with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling<=
br>
-the RecordBrowserNew method directly or by creating hostname/address/servi=
ce<br>
-resolvers/browsers that create those browsers internally themselves).<br>
-<br>
-```<br>
-$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --metho=
d org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1<br>
-Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient d=
isconnected from message bus without replying<br>
-```<br>
-```<br>
-dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, membe=
r=3DResolveHostName<br>
-avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e&#3=
9; failed.<br>
-=3D=3D307948=3D=3D<br>
-=3D=3D307948=3D=3D Process terminating with default action of signal 6 (SI=
GABRT)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 at 0x4B3630C: __pthread_kill_implementatio=
n (pthread_kill.c:44)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x4ADF921: raise (raise.c:26)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x4AC74AB: abort (abort.c:77)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x4AC741F: __assert_fail_base.cold (ass=
ert.c:118)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48D8B85: avahi_wide_area_scan_cache (=
wide-area.c:725)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48C8953: lookup_scan_cache (browse.c:=
351)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48C8B1B: lookup_go (browse.c:386)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48C9148: defer_callback (browse.c:516=
)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x48AEA0E: expiration_event (timeeventq=
.c:94)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x489D3AE: timeout_callback (simple-wat=
ch.c:447)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x489D787: avahi_simple_poll_dispatch (=
simple-watch.c:563)<br>
-=3D=3D307948=3D=3D=C2=A0 =C2=A0 by 0x489D91E: avahi_simple_poll_iterate (s=
imple-watch.c:605)<br>
-=3D=3D307948=3D=3D<br>
-```<br>
-<br>
-wide-area has been disabled by default since<br>
-9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).<br>
-<br>
-<a href=3D"https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-86=
5v-g5rc" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc</a><br>
-<br>
-CVE: CVE-2025-68276<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/pull/=
806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://github.com/avahi/avahi/pull/806/commits/=
0c013e2e819be3bda74cecf48b5f64956cf8a760</a>]<br>
-<br>
-Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&=
gt;<br>
----<br>
- avahi-core/browse.c | 5 +++++<br>
- 1 file changed, 5 insertions(+)<br>
-<br>
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
-index e8a915e..59d53cb 100644<br>
---- a/avahi-core/browse.c<br>
-+++ b/avahi-core/browse.c<br>
-@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(<=
br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_V=
ALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_E=
RR_INVALID_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags &amp;=
 AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags &amp; AVAHI_LOOKUP_USE_MULTICAST), =
AVAHI_ERR_INVALID_FLAGS);<br>
- <br>
-+=C2=A0 =C2=A0 if ((flags &amp; AVAHI_LOOKUP_USE_WIDE_AREA) &amp;&amp; !se=
rver-&gt;wide_area_lookup_engine) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_server_set_errno(server, AVAHI_ERR_NOT_=
SUPPORTED);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_server_set_errno(server, AVAHI_ERR=
_NO_MEMORY);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68468.patch<br>
deleted file mode 100644<br>
index 3635cc8d53e..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001<br>
-From: Hugo Muis &lt;<a href=3D"mailto:198191869%2Bfriendlyhugo@users.norep=
ly.github.com" target=3D"_blank" rel=3D"noreferrer">198191869+friendlyhugo@=
users.noreply.github.com</a>&gt;<br>
-Date: Sun, 2 Mar 2025 18:06:24 +0100<br>
-Subject: [PATCH] core: fix DoS bug by removing incorrect assertion<br>
-<br>
-Closes <a href=3D"https://github.com/avahi/avahi/issues/683" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/avahi/avahi/issues/68=
3</a><br>
-<br>
-CVE: CVE-2025-68468<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226b=
f8b67240179d309a" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a</a>]<=
br>
-<br>
-Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
----<br>
- avahi-core/browse.c | 1 -<br>
- 1 file changed, 1 deletion(-)<br>
-<br>
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
-index 86e4432..79595fe 100644<br>
---- a/avahi-core/browse.c<br>
-+++ b/avahi-core/browse.c<br>
-@@ -295,7 +295,6 @@ static void lookup_multicast_callback(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lookup_drop_=
cname(l, interface, protocol, 0, r);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* It&#39;s =
a normal record, so let&#39;s call the user callback */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(avahi_key_=
equal(b-&gt;key, l-&gt;key));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b-&gt;callba=
ck(b, interface, protocol, event, r, flags, b-&gt;userdata);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68471.patch<br>
deleted file mode 100644<br>
index 210565cdd61..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 4e84c1d6eb2f54d1643bd7ce62817c722ca36d25 Mon Sep 17 00:00:00 2001<br>
-From: Hugo Muis &lt;<a href=3D"mailto:198191869%2Bfriendlyhugo@users.norep=
ly.github.com" target=3D"_blank" rel=3D"noreferrer">198191869+friendlyhugo@=
users.noreply.github.com</a>&gt;<br>
-Date: Sun, 2 Mar 2025 18:06:24 +0100<br>
-Subject: [PATCH] core: fix DoS bug by changing assert to return<br>
-<br>
-Closes <a href=3D"https://github.com/avahi/avahi/issues/678" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/avahi/avahi/issues/67=
8</a><br>
-<br>
-CVE: CVE-2025-68471<br>
-<br>
-Upstream-Status: Backport<br>
-[<a href=3D"https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f20=
7e3ce35c54cc0aa1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1</a>]<=
br>
-<br>
-Signed-off-by: Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
----<br>
- avahi-core/browse.c | 5 ++++-<br>
- 1 file changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
-index 2941e57..86e4432 100644<br>
---- a/avahi-core/browse.c<br>
-+++ b/avahi-core/browse.c<br>
-@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {<br>
-=C2=A0 =C2=A0 =C2=A0assert(l);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0assert(!(l-&gt;flags &amp; AVAHI_LOOKUP_USE_WIDE_AREA)=
 !=3D !(l-&gt;flags &amp; AVAHI_LOOKUP_USE_MULTICAST));<br>
--=C2=A0 =C2=A0 assert(!l-&gt;wide_area &amp;&amp; !l-&gt;multicast);<br>
-+=C2=A0 =C2=A0 if (l-&gt;wide_area || l-&gt;multicast) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Avoid starting a duplicate lookup */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (l-&gt;flags &amp; AVAHI_LOOKUP_USE_WIDE_AREA) {<br=
>
- <br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2026-24401.patch<br>
deleted file mode 100644<br>
index 1a442966fc9..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch<br>
+++ /dev/null<br>
@@ -1,74 +0,0 @@<br>
-From 5eea2640324928c15936b7a2bcbf8ea0de7b08f7 Mon Sep 17 00:00:00 2001<br>
-From: Hugo Muis &lt;<a href=3D"mailto:198191869%2Bfriendlyhugo@users.norep=
ly.github.com" target=3D"_blank" rel=3D"noreferrer">198191869+friendlyhugo@=
users.noreply.github.com</a>&gt;<br>
-Date: Sun, 2 Mar 2025 18:06:24 +0100<br>
-Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loop<=
br>
- detection algorithm<br>
-<br>
-Closes <a href=3D"https://github.com/avahi/avahi/issues/501" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/avahi/avahi/issues/50=
1</a><br>
-<br>
-CVE: CVE-2026-24401<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/commi=
t/78eab31128479f06e30beb8c1cbf99dd921e2524" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/avahi/avahi/commit/78eab31128479f06e30b=
eb8c1cbf99dd921e2524</a>]<br>
-(cherry picked from commit 78eab31128479f06e30beb8c1cbf99dd921e2524)<br>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++<br>
- 1 file changed, 40 insertions(+)<br>
-<br>
-diff --git a/avahi-core/browse.c b/avahi-core/browse.c<br>
-index f461083..975b3e9 100644<br>
---- a/avahi-core/browse.c<br>
-+++ b/avahi-core/browse.c<br>
-@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {<br>
-=C2=A0 =C2=A0 =C2=A0return n;<br>
- }<br>
- <br>
-+static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup* =
from, AvahiSRBLookup* to) {<br>
-+=C2=A0 =C2=A0 AvahiRList* rl;<br>
-+=C2=A0 =C2=A0 if (from =3D=3D to)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 for (rl =3D from-&gt;cname_lookups; rl; rl =3D rl-&gt;rlist=
_next) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r =3D lookup_exists_in_path(lookup, rl-&g=
t;data, to);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r =3D=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* loop detected, propagate res=
ult */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (r =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* is loop detected? */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return lookup =3D=3D from;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* `to` not found, conti=
nue */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 /* no path found */<br>
-+=C2=A0 =C2=A0 return -1;<br>
-+}<br>
-+<br>
-+static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n) =
{<br>
-+=C2=A0 =C2=A0 int ret;<br>
-+=C2=A0 =C2=A0 if (l =3D=3D n)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Loop to self */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+<br>
-+=C2=A0 =C2=A0 ret =3D lookup_exists_in_path(n, l-&gt;record_browser-&gt;r=
oot_lookup, l);<br>
-+<br>
-+=C2=A0 =C2=A0 /* Path to n always exists */<br>
-+=C2=A0 =C2=A0 assert(ret !=3D -1);<br>
-+=C2=A0 =C2=A0 return ret;<br>
-+}<br>
-+<br>
- static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface=
, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r) {<br>
-=C2=A0 =C2=A0 =C2=A0AvahiKey *k;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiSRBLookup *n;<br>
-@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l, Av=
ahiIfIndex interface, Avahi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-+=C2=A0 =C2=A0 if (cname_would_create_loop(l, n)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CNAME loops are not allowed */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lookup_unref(n);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0l-&gt;cname_lookups =3D avahi_rlist_prepend(l-&gt;cnam=
e_lookups, lookup_ref(n));<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0lookup_go(n);<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch<br>
deleted file mode 100644<br>
index 208345a3258..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-1.patch<br>
+++ /dev/null<br>
@@ -1,108 +0,0 @@<br>
-From 0be89b6bb5c3983837b5e0febcbbbf452ecf7675 Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Wed, 1 Apr 2026 05:31:58 +0000<br>
-Subject: [PATCH] core: refuse to accept publish flags where both wide_area=
 and<br>
- multicast are set<br>
-<br>
-It fixes a bug where it was possible for unprivileged local users to<br>
-crash avahi-daemon via D-Bus by calling EntryGroup methods accepting<br>
-flags and passing both AVAHI_PUBLISH_USE_WIDE_AREA and<br>
-AVAHI_PUBLISH_USE_MULTICAST there. For example when AddRecord was<br>
-invoked like that avahi-daemon crashed with<br>
-```<br>
-dbus-entry-group.c: interface=3Dorg.freedesktop.Avahi.EntryGroup, path=3D/=
Client0/EntryGroup1, member=3DAddRecord<br>
-avahi-daemon: entry.c:57: transport_flags_from_domain: Assertion `!((*flag=
s &amp; AVAHI_PUBLISH_USE_MULTICAST) &amp;&amp; (*flags &amp; AVAHI_PUBLISH=
_USE_WIDE_AREA))&#39; failed.<br>
-=3D=3D84944=3D=3D<br>
-=3D=3D84944=3D=3D Process terminating with default action of signal 6 (SIG=
ABRT)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 at 0x4B353BC: __pthread_kill_implementation=
 (pthread_kill.c:44)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x4ADE941: raise (raise.c:26)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x4AC64AB: abort (abort.c:77)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x4AC641F: __assert_fail_base.cold (asse=
rt.c:118)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x48A9404: transport_flags_from_domain (=
entry.c:57)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x48A9F8F: server_add_internal (entry.c:=
224)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x48AA49F: avahi_server_add (entry.c:324=
)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x401A670: avahi_dbus_msg_entry_group_im=
pl (dbus-entry-group.c:348)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x4A70741: ??? (in /usr/lib/x86_64-linux=
-gnu/libdbus-1.so.3.38.3)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x4A5FB22: dbus_connection_dispatch (in =
/usr/lib/x86_64-linux-gnu/libdbus-1.so.3.38.3)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x401D01D: dispatch_timeout_callback (db=
us-watch-glue.c:105)<br>
-=3D=3D84944=3D=3D=C2=A0 =C2=A0 by 0x488E3AE: timeout_callback (simple-watc=
h.c:447)<br>
-=3D=3D84944=3D=3D<br>
-```<br>
-It&#39;s a follow-up to fbce111b069aa1e4c701ed37ee1d9f6d6cefaac5 where<br>
-those flags were introduced and consistent with the other places<br>
-where wide_area/multicast flags are used.<br>
-<br>
-It was discovered by<br>
-Guillaume Meunier - Head of Vulnerability Operations Center France - Orang=
e Cyberdefense<br>
-<br>
-<a href=3D"https://github.com/avahi/avahi/security/advisories/GHSA-w65r-6g=
xh-vhvc" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/avahi/avahi/security/advisories/GHSA-w65r-6gxh-vhvc</a><br>
-<br>
-CVE-2026-34933<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/commi=
t/0be89b6bb5c3983837b5e0febcbbbf452ecf7675" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/avahi/avahi/commit/0be89b6bb5c3983837b5=
e0febcbbbf452ecf7675</a>]<br>
-CVE: CVE-2026-34933<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-core/entry.c | 7 +++++++<br>
- 1 file changed, 7 insertions(+)<br>
-<br>
-diff --git a/avahi-core/entry.c b/avahi-core/entry.c<br>
-index 0d862133d..06eb12076 100644<br>
---- a/avahi-core/entry.c<br>
-+++ b/avahi-core/entry.c<br>
-@@ -207,6 +207,7 @@ static AvahiEntry * server_add_internal(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
VAHI_PUBLISH_UPDATE|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
VAHI_PUBLISH_USE_WIDE_AREA|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 A=
VAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags &amp; AVAHI_PUB=
LISH_USE_WIDE_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ER=
R_INVALID_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_dom=
ain_name(r-&gt;key-&gt;name), AVAHI_ERR_INVALID_HOST_NAME);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, r-&gt;ttl !=3D 0, =
AVAHI_ERR_INVALID_TTL);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !avahi_key_is_patt=
ern(r-&gt;key), AVAHI_ERR_IS_PATTERN);<br>
-@@ -454,6 +455,7 @@ int avahi_server_add_address(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0AVAHI_PUBLISH_UPDATE|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0AVAHI_PUBLISH_USE_WIDE_AREA|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);=
<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY(s, !(flags &amp; AVAHI_PUBLISH_USE_WID=
E_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FL=
AGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, !name || avahi_is_valid_fqdn(n=
ame), AVAHI_ERR_INVALID_HOST_NAME);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* Prepare the host naem */<br>
-@@ -595,6 +597,7 @@ static int server_add_service_strlst_nocopy(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AVAHI_PUBLISH_UPDATE|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AVAHI_PUBLISH_USE_WIDE_AREA|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags &amp; AVA=
HI_PUBLISH_USE_WIDE_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AV=
AHI_ERR_INVALID_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_val=
id_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_val=
id_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || a=
vahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);<br>
-@@ -754,6 +757,7 @@ static int server_update_service_txt_strlst_nocopy(<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AVAHI_PUBLISH_NO_COOKIE|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AVAHI_PUBLISH_USE_WIDE_AREA|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags &amp; AVA=
HI_PUBLISH_USE_WIDE_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AV=
AHI_ERR_INVALID_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_val=
id_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_val=
id_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || a=
vahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);<br>
-@@ -843,6 +847,7 @@ int avahi_server_add_service_subtype(<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_IF_VAL=
ID(interface), AVAHI_ERR_INVALID_INTERFACE);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_PROTO_=
VALID(protocol), AVAHI_ERR_INVALID_PROTOCOL);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, AVAHI_FLAGS_=
VALID(flags, AVAHI_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAH=
I_ERR_INVALID_FLAGS);<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !(flags &amp; AVA=
HI_PUBLISH_USE_WIDE_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AV=
AHI_ERR_INVALID_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_val=
id_service_name(name), AVAHI_ERR_INVALID_SERVICE_NAME);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, avahi_is_val=
id_service_type_strict(type), AVAHI_ERR_INVALID_SERVICE_TYPE);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_SET_RET_GOTO_FAIL(s, !domain || a=
vahi_is_valid_domain_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);<br>
-@@ -910,6 +915,7 @@ static AvahiEntry *server_add_dns_server_name(<br>
-=C2=A0 =C2=A0 =C2=A0assert(name);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, AVAHI_FLAGS_VALID(=
flags, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_=
INVALID_FLAGS);<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY_RETURN_NULL(s, !(flags &amp; AVAHI_PUB=
LISH_USE_WIDE_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ER=
R_INVALID_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, type =3D=3D AVAHI_=
DNS_SERVER_UPDATE || type =3D=3D AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALI=
D_FLAGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, port !=3D 0, AVAHI=
_ERR_INVALID_PORT);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY_RETURN_NULL(s, avahi_is_valid_fqd=
n(name), AVAHI_ERR_INVALID_HOST_NAME);<br>
-@@ -967,6 +973,7 @@ int avahi_server_add_dns_server_address(<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, AVAHI_IF_VALID(interface), AVA=
HI_ERR_INVALID_INTERFACE);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, AVAHI_PROTO_VALID(protocol) &a=
mp;&amp; AVAHI_PROTO_VALID(address-&gt;proto), AVAHI_ERR_INVALID_PROTOCOL);=
<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, AVAHI_FLAGS_VALID(flags, AVAHI=
_PUBLISH_USE_MULTICAST|AVAHI_PUBLISH_USE_WIDE_AREA), AVAHI_ERR_INVALID_FLAG=
S);<br>
-+=C2=A0 =C2=A0 AVAHI_CHECK_VALIDITY(s, !(flags &amp; AVAHI_PUBLISH_USE_WID=
E_AREA) || !(flags &amp; AVAHI_PUBLISH_USE_MULTICAST), AVAHI_ERR_INVALID_FL=
AGS);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, type =3D=3D AVAHI_DNS_SERVER_U=
PDATE || type =3D=3D AVAHI_DNS_SERVER_RESOLVE, AVAHI_ERR_INVALID_FLAGS);<br=
>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, port !=3D 0, AVAHI_ERR_INVALID=
_PORT);<br>
-=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, !domain || avahi_is_valid_doma=
in_name(domain), AVAHI_ERR_INVALID_DOMAIN_NAME);<br>
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch<br>
deleted file mode 100644<br>
index 479d0d7e932..00000000000<br>
--- a/meta/recipes-connectivity/avahi/files/CVE-2026-34933-2.patch<br>
+++ /dev/null<br>
@@ -1,96 +0,0 @@<br>
-From a93fdd980d2db5d453475c0aa2b39946bd6611bd Mon Sep 17 00:00:00 2001<br>
-From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" target=3D"_b=
lank" rel=3D"noreferrer">evvers@ya.ru</a>&gt;<br>
-Date: Wed, 1 Apr 2026 05:30:58 +0000<br>
-Subject: [PATCH] tests: make sure AVAHI_PUBLISH_USE_WIDE_AREA is refused<b=
r>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/avahi/avahi/commi=
t/a93fdd980d2db5d453475c0aa2b39946bd6611bd" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/avahi/avahi/commit/a93fdd980d2db5d45347=
5c0aa2b39946bd6611bd</a>]<br>
-CVE: CVE-2026-34933<br>
-Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank" rel=3D"noreferrer">vanusuri@mvista.com</a>&gt;<br>
----<br>
- avahi-client/client-test.c | 25 +++++++++++++++++++++++++<br>
- avahi-core/avahi-test.c=C2=A0 =C2=A0 | 12 +++++++++++-<br>
- 2 files changed, 36 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c<br>
-index 9a015d7..c80e12f 100644<br>
---- a/avahi-client/client-test.c<br>
-+++ b/avahi-client/client-test.c<br>
-@@ -212,6 +212,28 @@ static void terminate(AVAHI_GCC_UNUSED AvahiTimeout *=
timeout, AVAHI_GCC_UNUSED v<br>
-=C2=A0 =C2=A0 =C2=A0avahi_simple_poll_quit(simple_poll);<br>
- }<br>
- <br>
-+static void test_refuse_publish_flags(AvahiEntryGroup *g, AvahiPublishFla=
gs flags, int expected) {<br>
-+=C2=A0 =C2=A0 AvahiAddress a;<br>
-+=C2=A0 =C2=A0 AvahiStringList *l =3D NULL;<br>
-+=C2=A0 =C2=A0 int r;<br>
-+<br>
-+=C2=A0 =C2=A0 r =3D avahi_entry_group_add_record(g, AVAHI_IF_UNSPEC, AVAH=
I_PROTO_UNSPEC, flags, &quot;test.local&quot;, AVAHI_DNS_CLASS_IN, AVAHI_DN=
S_TYPE_CNAME, 120, &quot;\0&quot;, 1);<br>
-+=C2=A0 =C2=A0 assert(r =3D=3D expected);<br>
-+<br>
-+=C2=A0 =C2=A0 avahi_address_parse(&quot;224.0.0.251&quot;, AVAHI_PROTO_UN=
SPEC, &amp;a);<br>
-+=C2=A0 =C2=A0 r =3D avahi_entry_group_add_address(g, AVAHI_IF_UNSPEC, AVA=
HI_PROTO_UNSPEC, flags, &quot;test.local&quot;, &amp;a);<br>
-+=C2=A0 =C2=A0 assert(r =3D=3D expected);<br>
-+<br>
-+=C2=A0 =C2=A0 r =3D avahi_entry_group_add_service_strlst(g, AVAHI_IF_UNSP=
EC, AVAHI_PROTO_UNSPEC, flags, &quot;test&quot;, &quot;_http._tcp&quot;, NU=
LL, NULL, 80, l);<br>
-+=C2=A0 =C2=A0 assert(r =3D=3D expected);<br>
-+<br>
-+=C2=A0 =C2=A0 r =3D avahi_entry_group_update_service_txt_strlst(g, AVAHI_=
IF_UNSPEC, AVAHI_PROTO_UNSPEC, flags, &quot;test&quot;, &quot;_http._tcp&qu=
ot;, NULL, l);<br>
-+=C2=A0 =C2=A0 assert(r =3D=3D expected);<br>
-+<br>
-+=C2=A0 =C2=A0 r =3D avahi_entry_group_add_service_subtype(g, AVAHI_IF_UNS=
PEC, AVAHI_PROTO_UNSPEC, flags, &quot;test&quot;, &quot;_http._tcp&quot;, N=
ULL, &quot;_magic._sub._http._tcp&quot;);<br>
-+=C2=A0 =C2=A0 assert(r =3D=3D expected);<br>
-+}<br>
-+<br>
- int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {<br>
-=C2=A0 =C2=A0 =C2=A0AvahiClient *avahi;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiEntryGroup *group, *group2;<br>
-@@ -275,6 +297,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED =
char *argv[]) {<br>
-=C2=A0 =C2=A0 =C2=A0error =3D avahi_entry_group_add_record (group, AVAHI_I=
F_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, 0x01, 0x10, 120, &quot;=
&quot;, 0);<br>
-=C2=A0 =C2=A0 =C2=A0assert(error !=3D AVAHI_OK);<br>
- <br>
-+=C2=A0 =C2=A0 test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_ARE=
A, AVAHI_ERR_NOT_SUPPORTED);<br>
-+=C2=A0 =C2=A0 test_refuse_publish_flags(group, AVAHI_PUBLISH_USE_WIDE_ARE=
A|AVAHI_PUBLISH_USE_MULTICAST, AVAHI_ERR_INVALID_FLAGS);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_U=
NSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_doma=
in_browser_callback, (char*) &quot;omghai3u&quot;);<br>
-diff --git a/avahi-core/avahi-test.c b/avahi-core/avahi-test.c<br>
-index 2a7872b..2bae82b 100644<br>
---- a/avahi-core/avahi-test.c<br>
-+++ b/avahi-core/avahi-test.c<br>
-@@ -30,6 +30,7 @@<br>
- #include &lt;netinet/in.h&gt;<br>
- #include &lt;arpa/inet.h&gt;<br>
- <br>
-+#include &lt;avahi-common/error.h&gt;<br>
- #include &lt;avahi-common/malloc.h&gt;<br>
- #include &lt;avahi-common/simple-watch.h&gt;<br>
- #include &lt;avahi-common/alternative.h&gt;<br>
-@@ -150,6 +151,7 @@ static void remove_entries(void) {<br>
- static void create_entries(int new_name) {<br>
-=C2=A0 =C2=A0 =C2=A0AvahiAddress a;<br>
-=C2=A0 =C2=A0 =C2=A0AvahiRecord *r;<br>
-+=C2=A0 =C2=A0 int error;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0remove_entries();<br>
- <br>
-@@ -181,7 +183,15 @@ static void create_entries(int new_name) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 if (avahi_server_add_dns_server_address(server, group, AVAH=
I_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, avahi_a=
ddress_parse(&quot;192.168.50.1&quot;, AVAHI_PROTO_UNSPEC, &amp;a), 53) &lt=
; 0) {<br>
-+=C2=A0 =C2=A0 avahi_address_parse(&quot;192.168.50.1&quot;, AVAHI_PROTO_U=
NSPEC, &amp;a);<br>
-+<br>
-+=C2=A0 =C2=A0 error =3D avahi_server_add_dns_server_address(server, group=
, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA, NULL, A=
VAHI_DNS_SERVER_RESOLVE, &amp;a, 53);<br>
-+=C2=A0 =C2=A0 assert(error =3D=3D AVAHI_ERR_NOT_SUPPORTED);<br>
-+<br>
-+=C2=A0 =C2=A0 error =3D avahi_server_add_dns_server_address(server, group=
, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, AVAHI_PUBLISH_USE_WIDE_AREA|AVAHI_PU=
BLISH_USE_MULTICAST, NULL, AVAHI_DNS_SERVER_RESOLVE, &amp;a, 53);<br>
-+=C2=A0 =C2=A0 assert(error =3D=3D AVAHI_ERR_INVALID_FLAGS);<br>
-+<br>
-+=C2=A0 =C2=A0 if (avahi_server_add_dns_server_address(server, group, AVAH=
I_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, NULL, AVAHI_DNS_SERVER_RESOLVE, &amp;a,=
 53) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_log_error(&quot;Failed to add new =
DNS Server address&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta/recipes-connectivity/avahi/files/<a href=3D"http://avahi-=
daemon.in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-daemon.in<=
/a> b/meta/recipes-connectivity/avahi/files/<a href=3D"http://avahi-daemon.=
in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-daemon.in</a><br>
new file mode 100644<br>
index 00000000000..49ec3586896<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/avahi/files/<a href=3D"http://avahi-daemon.=
in" rel=3D"noreferrer noreferrer" target=3D"_blank">avahi-daemon.in</a><br>
@@ -0,0 +1,198 @@<br>
+#!/bin/sh<br>
+### BEGIN INIT INFO<br>
+# Provides:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi<br>
+# Required-Start:=C2=A0 =C2=A0 $remote_fs dbus<br>
+# Required-Stop:=C2=A0 =C2=A0 =C2=A0$remote_fs dbus<br>
+# Should-Start:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$syslog<br>
+# Should-Stop:=C2=A0 =C2=A0 =C2=A0 =C2=A0$syslog<br>
+# Default-Start:=C2=A0 =C2=A0 =C2=A02 3 4 5<br>
+# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 6<br>
+# Short-Description: Avahi mDNS/DNS-SD Daemon<br>
+# Description:=C2=A0 =C2=A0 =C2=A0 =C2=A0Zeroconf daemon for configuring y=
our network <br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aut=
omatically<br>
+### END INIT INFO<br>
+#<br>
+# This file is part of avahi.<br>
+#<br>
+# avahi is free software; you can redistribute </blockquote></div>

--000000000000908e7e0651c99ad3--

