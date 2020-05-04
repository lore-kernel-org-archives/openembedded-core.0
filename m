Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.11653.1588614428364101567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 10:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HBX5eZkA;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g16so193332qtp.11
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ggNHKldXb4g6Pr4Ut9MPbImxkWAwCGmdl8+F+F/D8RA=;
        b=HBX5eZkA58E1OHWvE/WXZ8LGPchUW9hPmzD8KjKwZQnExJBZBUwxrswy0YjcTUGGu7
         Tnw3uh1wVagwE32eGREd+HySpw9u5e2sBimlQI2XvU35Z29VBzXvGF7Jy4xLQQgmOgdc
         XYPZH4er773iIciQBepE4L8Y+N5IfBeGSnW244C0hl/8VRXLwdwUbv7CxCMwxA1jsQzv
         Yw41K8xYiKEmwOEQX3UiKp7rtytvW0wuT+kA+0rq3jtdWJ++vpVto6pLTl8b11s9GBL1
         GlI8EJH9WUzQg6ZJnCgT7rrj95r2TFPNJLGcSxDKB50k3MOVoFDBDERBVLoGl5R/f6XK
         b9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ggNHKldXb4g6Pr4Ut9MPbImxkWAwCGmdl8+F+F/D8RA=;
        b=bbBdMb+N6YSbU9wXOpf5b2ehzWAxYQxgIYJZwdAemdR+NnVPlViT38DRY6NX1PByeX
         27IpixWKMDXgBa74x1fc7HE0AcIPoIffrYVyDZBbguYNvb9mGjiVQhOOEKD0AwaVzo7K
         HfcjUHT5X0axd331wMl1KFZo/+Tbn8Ko1w+t29cfHnVPAFtOlH1v7QtCiuopTTB+62iL
         kG+zJvD3w8dWdxNPUfO5yaHLVagaOyMC9xakjJ02fKzLqC2bQcycZkcQLEj9cQnc03u/
         YNw6nb5jYftXIMScAgim1gIvK2rhLG5Uppzf9oWkzzo9U+S5/G9KWE1Gz2PRo5FHd+pc
         s12g==
X-Gm-Message-State: AGi0PubCQreo1JmZl9yPZRR9Y5mvm2eLYkkA3jtnUdyd6jaxIiHPUAOV
	hwhuiPggwDwVj+f/aSREm+5zbLyT2M2yVwYclmnaWbcL
X-Google-Smtp-Source: APiQypKDE0Dg2l5til1oEBNcaDsw8wrHP2cSNkHSrDpcWe/kArio4955jbFg3z1RqBF+o/Rk9rghP+t7OgLlsCj14Ng=
X-Received: by 2002:ac8:24b7:: with SMTP id s52mr245593qts.316.1588614426833;
 Mon, 04 May 2020 10:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200503080730.3686063-1-daniel@zonque.org> <CAMKF1sqCb8JhGcuyJaTwC2=AsHRGvHsQ7BXJguOVg3VTOENiNA@mail.gmail.com>
 <CAJ86T=XKmHH2geeKudRLuTox2TOz3njdic5hiBSeX8hDRxUbDA@mail.gmail.com>
In-Reply-To: <CAJ86T=XKmHH2geeKudRLuTox2TOz3njdic5hiBSeX8hDRxUbDA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 4 May 2020 10:46:40 -0700
Message-ID: <CAMKF1srJ=Tutp+N4G+tjmCvQR4nextzNNU6t_a=JozFkdCh4gQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Add -fcommon to BUILD_CFLAGS to a number of recipes
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 3, 2020 at 12:21 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Sun, May 3, 2020 at 10:39 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I think add it globally to BUILD_CFLAGS perhaps is
> > Right thing to do once we upgrade to gcc10 cross compiler I have a patch to add it to gcc defaults
>



> Adding -fcommon to CFLAGS or BUILD_CFLAGS globally could interact
> badly with components which are already setting -fno-common via their
> own internal CFLAGS. It's safer to fix selectively on a per-recipe
> basis.

Dont have hard opinion on it.
there is a chance of that but I was thinking of keeping it in one
place as it might be needed in a lot of places
but


>
> > Perhaps we will have apps ported to gcc10 by then
> >
> > On Sun, May 3, 2020 at 1:07 AM Daniel Mack <daniel@zonque.org> wrote:
> >>
> >> When building on a gcc 10 enabled host distribution (such as Fedora 32),
> >> a number of recipies need explicit treatment to enable '-fcommon' in
> >> BUILD_CFLAGS. There might be more of those fixes needed.
> >>
> >> Commit 46827b8616 ("recipes: Use -fcommon explicitly") already addressed
> >> that for some places, but tweaking CFLAGS doesn't seem to suffice.
> >>
> >> Signed-off-by: Daniel Mack <daniel@zonque.org>
> >> ---
> >>  meta/recipes-bsp/u-boot/u-boot-tools.inc                   | 2 ++
> >>  meta/recipes-bsp/u-boot/u-boot.inc                         | 2 ++
> >>  meta/recipes-devtools/binutils/binutils.inc                | 2 ++
> >>  meta/recipes-devtools/libcomps/libcomps_git.bb             | 1 +
> >>  meta/recipes-devtools/pseudo/pseudo.inc                    | 2 ++
> >>  meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 1 +
> >>  meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb           | 2 +-
> >>  meta/recipes-kernel/dtc/dtc.inc                            | 3 ++-
> >>  meta/recipes-support/gdbm/gdbm_1.18.1.bb                   | 2 +-
> >>  9 files changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> >> index 8ae290acc6..98c47bf399 100644
> >> --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> >> +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> >> @@ -11,6 +11,8 @@ RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
> >>  RREPLACES_${PN}-mkimage = "u-boot-mkimage"
> >>  RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
> >>
> >> +BUILD_CFLAGS += "-fcommon"
> >> +
> >>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> >>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> >>  EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> >> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> >> index 188e5295cf..5fb1ae856a 100644
> >> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> >> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> >> @@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native
> >>
> >>  DEPENDS += "swig-native"
> >>
> >> +BUILD_CFLAGS += "-fcommon"
> >> +
> >>  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
> >>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> >>  EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> >> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> >> index 4119960c63..6d590658f8 100644
> >> --- a/meta/recipes-devtools/binutils/binutils.inc
> >> +++ b/meta/recipes-devtools/binutils/binutils.inc
> >> @@ -71,6 +71,8 @@ python do_package_prepend() {
> >>
> >>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> >>
> >> +BUILD_CFLAGS += "-fcommon"
> >> +
> >>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
> >>                  --disable-werror \
> >>                  --enable-deterministic-archives \
> >> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
> >> index 40b60159bc..0e893a9b49 100644
> >> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
> >> +++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
> >> @@ -17,6 +17,7 @@ inherit cmake distutils3-base
> >>
> >>  DEPENDS += "libxml2 expat libcheck"
> >>
> >> +BUILD_CFLAGS += "-fcommon"
> >>  EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
> >>  OECMAKE_SOURCEPATH = "${S}/libcomps"
> >>
> >> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> >> index 50e30064bd..751f1815dc 100644
> >> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> >> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> >> @@ -15,6 +15,8 @@ INSANE_SKIP_${PN}-dbg += "libdir"
> >>
> >>  PROVIDES += "virtual/fakeroot"
> >>
> >> +BUILD_CFLAGS += "-fcommon"
> >> +
> >>  MAKEOPTS = ""
> >>  MAKEOPTS_class-native = "'RPATH=-Wl,--rpath=XORIGIN/../../../sqlite3-native/usr/lib/'"
> >>
> >> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> >> index 9bcf026ce2..3ab9b0f2e5 100644
> >> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> >> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> >> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
> >>
> >>  S = "${WORKDIR}/git/squashfs-tools"
> >>
> >> +BUILD_CFLAGS += "-fcommon"
> >>  EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
> >>
> >>  PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr reproducible"
> >> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> >> index fc66821ecc..f600430c41 100644
> >> --- a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> >> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> >> @@ -21,7 +21,7 @@ inherit autotools pkgconfig
> >>
> >>  EXTRA_OECONF = "--disable-gssapi"
> >>
> >> -CFLAGS += "-fcommon"
> >> +BUILD_CFLAGS += "-fcommon"
> >>
> >>  do_install_append() {
> >>         chown root:root ${D}${sysconfdir}/netconfig
> >> diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
> >> index 0650e3c82e..6a5b5e5ef1 100644
> >> --- a/meta/recipes-kernel/dtc/dtc.inc
> >> +++ b/meta/recipes-kernel/dtc/dtc.inc
> >> @@ -10,7 +10,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
> >>             "
> >>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> >>
> >> -EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
> >> +EXTRA_CFLAGS += "-fcommon"
> >> +EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}" EXTRA_CFLAGS="${EXTRA_CFLAGS}"'
> >>
> >>  inherit pkgconfig
> >>
> >> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >> index 5cb7c558b8..5f55ab0ffb 100644
> >> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> >> @@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
> >>
> >>  BBCLASSEXTEND = "native nativesdk"
> >>
> >> -CFLAGS += "-fcommon"
> >> +BUILD_CFLAGS += "-fcommon"
> >>
> >>  do_install_append () {
> >>      # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
> >> --
> >> 2.26.2
> >>
> >
> 
