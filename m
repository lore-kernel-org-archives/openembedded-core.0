Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8528C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 10:56:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5239.1653476167023012899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 03:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA13D1FB;
	Wed, 25 May 2022 03:56:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31C863F70D;
	Wed, 25 May 2022 03:56:04 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] btrfs-tools: add a PACKAGECONFIG for lzo
Date: Wed, 25 May 2022 11:55:59 +0100
Message-Id: <20220525105559.2479481-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 10:56:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166115

LZO is a fairly obsolete compression format these days, so add an option
to enable/disable LZO to btrfs-progs and disable it by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../btrfs-tools/btrfs-tools/lzo-option.patch  | 126 ++++++++++++++++++
 .../btrfs-tools/btrfs-tools_5.16.2.bb         |   4 +-
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-opt=
ion.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.pat=
ch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch
new file mode 100644
index 00000000000..f4278a5c5d0
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/lzo-option.patch
@@ -0,0 +1,126 @@
+Upstream-Status: Backport [https://github.com/kdave/btrfs-progs/commit/7=
3545c1fe6304f08ab306b76d2bcacaf22a5e99a]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 4f4eafe8ebcc86f84f6c85a5c5814c430d8f190c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 24 May 2022 13:44:29 +0100
+Subject: [PATCH] btrfs-progs: add option to disable LZO support
+
+LZO as a compression format is pretty archaic these days, there are
+better algorithsm in all metrics for compression and decompression, and
+lzo hasn't had a new release since 2017.
+
+Add an option to disable LZO (defaulting to enabled), and respect it in
+cmds/restore.c.
+
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile        |  2 +-
+ Makefile.inc.in |  1 +
+ cmds/restore.c  |  7 +++++++
+ configure.ac    | 30 ++++++++++++++++++++----------
+ 4 files changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index af4908f9..0e8e05f3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -335,7 +335,7 @@ endif
+ btrfs_convert_cflags =3D -DBTRFSCONVERT_EXT2=3D$(BTRFSCONVERT_EXT2)
+ btrfs_convert_cflags +=3D -DBTRFSCONVERT_REISERFS=3D$(BTRFSCONVERT_REIS=
ERFS)
+ btrfs_fragments_libs =3D -lgd -lpng -ljpeg -lfreetype
+-cmds_restore_cflags =3D -DBTRFSRESTORE_ZSTD=3D$(BTRFSRESTORE_ZSTD)
++cmds_restore_cflags =3D -DBTRFSRESTORE_LZO=3D$(BTRFSRESTORE_LZO) -DBTRF=
SRESTORE_ZSTD=3D$(BTRFSRESTORE_ZSTD)
+=20
+ ifeq ($(CRYPTOPROVIDER_BUILTIN),1)
+ CRYPTO_OBJECTS =3D crypto/sha224-256.o crypto/blake2b-ref.o
+diff --git a/Makefile.inc.in b/Makefile.inc.in
+index c995aef9..385b7ae1 100644
+--- a/Makefile.inc.in
++++ b/Makefile.inc.in
+@@ -16,6 +16,7 @@ BUILD_PROGRAMS =3D @BUILD_PROGRAMS@
+ BUILD_SHARED_LIBRARIES =3D @BUILD_SHARED_LIBRARIES@
+ BUILD_STATIC_LIBRARIES =3D @BUILD_STATIC_LIBRARIES@
+ BTRFSCONVERT_EXT2 =3D @BTRFSCONVERT_EXT2@
++BTRFSRESTORE_LZO =3D @BTRFSRESTORE_LZO@
+ BTRFSCONVERT_REISERFS =3D @BTRFSCONVERT_REISERFS@
+ BTRFSRESTORE_ZSTD =3D @BTRFSRESTORE_ZSTD@
+ PYTHON_BINDINGS =3D @PYTHON_BINDINGS@
+diff --git a/cmds/restore.c b/cmds/restore.c
+index 5923d571..4dd79fce 100644
+--- a/cmds/restore.c
++++ b/cmds/restore.c
+@@ -25,8 +25,10 @@
+ #include <fcntl.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#if BTRFSRESTORE_LZO
+ #include <lzo/lzoconf.h>
+ #include <lzo/lzo1x.h>
++#endif
+ #include <zlib.h>
+ #if BTRFSRESTORE_ZSTD
+ #include <zstd.h>
+@@ -98,6 +100,10 @@ static inline size_t read_compress_length(unsigned c=
har *buf)
+ static int decompress_lzo(struct btrfs_root *root, unsigned char *inbuf=
,
+ 			char *outbuf, u64 compress_len, u64 *decompress_len)
+ {
++#if !BTRFSRESTORE_LZO
++	error("btrfs not compiled with lzo support");
++	return -1;
++#else
+ 	size_t new_len;
+ 	size_t in_len;
+ 	size_t out_len =3D 0;
+@@ -156,6 +162,7 @@ static int decompress_lzo(struct btrfs_root *root, u=
nsigned char *inbuf,
+ 	*decompress_len =3D out_len;
+=20
+ 	return 0;
++#endif
+ }
+=20
+ static int decompress_zstd(const char *inbuf, char *outbuf, u64 compres=
s_len,
+diff --git a/configure.ac b/configure.ac
+index d907636b..c1ad2c22 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -372,16 +372,26 @@ if ${PKG_CONFIG} udev --atleast-version 190; then
+ fi
+ AC_SUBST(UDEVDIR)
+=20
+-dnl lzo library does not provide pkg-config, let use classic way
+-AC_CHECK_LIB([lzo2], [lzo_version], [
+-	LZO2_LIBS=3D"-llzo2"
+-	LZO2_CFLAGS=3D""
+-	LZO2_LIBS_STATIC=3D"-llzo2"],[
+-	AC_MSG_ERROR([cannot find lzo2 library])
+-])
+-AC_SUBST([LZO2_LIBS])
+-AC_SUBST([LZO2_LIBS_STATIC])
+-AC_SUBST([LZO2_CFLAGS])
++AC_ARG_ENABLE([lzo],
++	AS_HELP_STRING([--disable-lzo], [build without lzo support]),
++	[], [enable_lzo=3Dyes]
++)
++
++if test "x$enable_lzo" =3D xyes; then
++	dnl lzo library does not provide pkg-config, let use classic way
++	AC_CHECK_LIB([lzo2], [lzo_version], [
++		LZO2_LIBS=3D"-llzo2"
++		LZO2_CFLAGS=3D""
++		LZO2_LIBS_STATIC=3D"-llzo2"],[
++		AC_MSG_ERROR([cannot find lzo2 library])
++	])
++	AC_SUBST([LZO2_LIBS])
++	AC_SUBST([LZO2_LIBS_STATIC])
++	AC_SUBST([LZO2_CFLAGS])
++fi
++
++AS_IF([test "x$enable_lzo" =3D xyes], [BTRFSRESTORE_LZO=3D1], [BTRFSRES=
TORE_LZO=3D0])
++AC_SUBST(BTRFSRESTORE_LZO)
+=20
+ dnl call PKG_INSTALLDIR from pkg.m4 to set pkgconfigdir
+ m4_ifdef([PKG_INSTALLDIR], [PKG_INSTALLDIR], [AC_MSG_ERROR([please inst=
all pkgconf])])
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb b/me=
ta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
index 4ab486c465c..88b5c6259cf 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.16.2.bb
@@ -13,10 +13,11 @@ LIC_FILES_CHKSUM =3D " \
     file://libbtrfsutil/COPYING;md5=3D4fbd65380cdd255951079008b364516c \
 "
 SECTION =3D "base"
-DEPENDS =3D "lzo util-linux zlib"
+DEPENDS =3D "util-linux zlib"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-p=
rogs.git;branch=3Dmaster \
            file://0001-Add-a-possibility-to-specify-where-python-modules=
-ar.patch \
+           file://lzo-option.patch \
            "
 SRCREV =3D "31458c9c81935abbed010221261897273a98d2c1"
 S =3D "${WORKDIR}/git"
@@ -32,6 +33,7 @@ PACKAGECONFIG[programs] =3D "--enable-programs,--disabl=
e-programs"
 PACKAGECONFIG[convert] =3D "--enable-convert --with-convert=3Dext2,--dis=
able-convert --without-convert,e2fsprogs"
 PACKAGECONFIG[zoned] =3D "--enable-zoned,--disable-zoned"
 PACKAGECONFIG[python] =3D "--enable-python,--disable-python,python3-setu=
ptools-native"
+PACKAGECONFIG[lzo] =3D "--enable-lzo,--disable-lzo,lzo"
 PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
 PACKAGECONFIG[udev] =3D "--enable-libudev,--disable-libudev,udev"
=20
--=20
2.25.1


