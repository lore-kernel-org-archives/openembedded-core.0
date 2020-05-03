Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by mx.groups.io with SMTP id smtpd.web11.19909.1588500136336952853
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 03:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: zonque.org, ip: 46.23.86.59, mailfrom: daniel@zonque.org)
Received: from zenbar.fritz.box (pD95EFBD9.dip0.t-ipconnect.de [217.94.251.217])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 7B1C7403776;
	Sun,  3 May 2020 09:59:37 +0000 (UTC)
From: "Daniel Mack" <daniel@zonque.org>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2] Add -fcommon to BUILD_CFLAGS to a number of recipes
Date: Sun,  3 May 2020 12:02:06 +0200
Message-Id: <20200503100206.3688457-1-daniel@zonque.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When building on a gcc 10 enabled host distribution (such as Fedora 32),
a number of recipies need explicit treatment to enable '-fcommon' in
BUILD_CFLAGS. There might be more of those fixes needed.

Commit 46827b8616 ("recipes: Use -fcommon explicitly") already addressed
that for some places, but tweaking CFLAGS doesn't seem to suffice.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
If there is a better way of doing this, please let me know. I needed
this patch to get my setup working again to F32.

v2: Rebase to oe-core master

 meta/recipes-bsp/u-boot/u-boot-tools.inc                   | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc                         | 2 ++
 meta/recipes-devtools/binutils/binutils.inc                | 2 ++
 meta/recipes-devtools/libcomps/libcomps_git.bb             | 1 +
 meta/recipes-devtools/pseudo/pseudo.inc                    | 2 ++
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 1 +
 meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb           | 2 +-
 meta/recipes-kernel/dtc/dtc.inc                            | 3 ++-
 meta/recipes-support/gdbm/gdbm_1.18.1.bb                   | 2 +-
 9 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/=
u-boot/u-boot-tools.inc
index 8ae290acc6..98c47bf399 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -11,6 +11,8 @@ RPROVIDES_${PN}-mkimage =3D "u-boot-mkimage"
 RREPLACES_${PN}-mkimage =3D "u-boot-mkimage"
 RCONFLICTS_${PN}-mkimage =3D "u-boot-mkimage"
=20
+BUILD_CFLAGS +=3D "-fcommon"
+
 EXTRA_OEMAKE_class-target =3D 'CROSS_COMPILE=3D"${TARGET_PREFIX}" CC=3D"=
${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD=
_LDFLAGS}" STRIP=3Dtrue V=3D1'
 EXTRA_OEMAKE_class-native =3D 'CC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD=
_LDFLAGS}" HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=3D=
true V=3D1'
 EXTRA_OEMAKE_class-nativesdk =3D 'CROSS_COMPILE=3D"${HOST_PREFIX}" CC=3D=
"${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUIL=
D_LDFLAGS}" STRIP=3Dtrue V=3D1'
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index 188e5295cf..5fb1ae856a 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign dep=
loy cml1 python3native
=20
 DEPENDS +=3D "swig-native"
=20
+BUILD_CFLAGS +=3D "-fcommon"
+
 EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX=
}gcc ${TOOLCHAIN_OPTIONS}" V=3D1'
 EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS=
}"'
 EXTRA_OEMAKE +=3D 'STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAGING_LIB=
DIR=3D${STAGING_LIBDIR_NATIVE}'
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
index 4119960c63..6d590658f8 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -71,6 +71,8 @@ python do_package_prepend() {
=20
 B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
=20
+BUILD_CFLAGS +=3D "-fcommon"
+
 EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} \
                 --disable-werror \
                 --enable-deterministic-archives \
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipe=
s-devtools/libcomps/libcomps_git.bb
index 40b60159bc..0e893a9b49 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -17,6 +17,7 @@ inherit cmake distutils3-base
=20
 DEPENDS +=3D "libxml2 expat libcheck"
=20
+BUILD_CFLAGS +=3D "-fcommon"
 EXTRA_OECMAKE =3D " -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} -D=
PYTHON_DESIRED=3D3"
 OECMAKE_SOURCEPATH =3D "${S}/libcomps"
=20
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
index 50e30064bd..751f1815dc 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -15,6 +15,8 @@ INSANE_SKIP_${PN}-dbg +=3D "libdir"
=20
 PROVIDES +=3D "virtual/fakeroot"
=20
+BUILD_CFLAGS +=3D "-fcommon"
+
 MAKEOPTS =3D ""
 MAKEOPTS_class-native =3D "'RPATH=3D-Wl,--rpath=3DXORIGIN/../../../sqlit=
e3-native/usr/lib/'"
=20
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 9bcf026ce2..3ab9b0f2e5 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/plougher/squashfs-tools.g=
it;protocol=3Dhttps \
=20
 S =3D "${WORKDIR}/git/squashfs-tools"
=20
+BUILD_CFLAGS +=3D "-fcommon"
 EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
=20
 PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr reproducible"
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/reci=
pes-extended/libtirpc/libtirpc_1.2.6.bb
index fc66821ecc..f600430c41 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig
=20
 EXTRA_OECONF =3D "--disable-gssapi"
=20
-CFLAGS +=3D "-fcommon"
+BUILD_CFLAGS +=3D "-fcommon"
=20
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dt=
c.inc
index 0650e3c82e..6a5b5e5ef1 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -10,7 +10,8 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc=
.git \
            "
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-EXTRA_OEMAKE=3D'NO_PYTHON=3D1 PREFIX=3D"${prefix}" LIBDIR=3D"${libdir}" =
DESTDIR=3D"${D}"'
+EXTRA_CFLAGS +=3D "-fcommon"
+EXTRA_OEMAKE=3D'NO_PYTHON=3D1 PREFIX=3D"${prefix}" LIBDIR=3D"${libdir}" =
DESTDIR=3D"${D}" EXTRA_CFLAGS=3D"${EXTRA_CFLAGS}"'
=20
 inherit pkgconfig
=20
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-supp=
ort/gdbm/gdbm_1.18.1.bb
index 5cb7c558b8..5f55ab0ffb 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_lib_ndbm_main=3Dno ac_=
cv_lib_dbm_main=3Dno"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-CFLAGS +=3D "-fcommon"
+BUILD_CFLAGS +=3D "-fcommon"
=20
 do_install_append () {
     # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other=
 packages to find
--=20
2.26.2

