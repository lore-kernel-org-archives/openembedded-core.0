Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3024EC021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:26:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8936.1740493602558949214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF8728C7
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:58 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C26F63F6A8
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] recipes/*: remove obsolete use of acpaths
Date: Tue, 25 Feb 2025 14:26:34 +0000
Message-ID: <20250225142636.703255-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225142636.703255-1-ross.burton@arm.com>
References: <20250225142636.703255-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211882

The bulk of these recipes used acpaths to work around argument list
limits as we passed the full path to every directory. As this behaviour
no longer happens we can remove these workarounds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/inetutils/inetutils_2.5.bb   | 2 --
 meta/recipes-core/coreutils/coreutils_9.6.bb           | 6 ------
 meta/recipes-core/gettext/gettext_0.23.1.bb            | 3 ---
 meta/recipes-devtools/bison/bison_3.8.2.bb             | 3 ---
 meta/recipes-devtools/m4/m4-1.4.19.inc                 | 3 ---
 meta/recipes-devtools/patch/patch_2.7.6.bb             | 2 --
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb       | 2 --
 meta/recipes-extended/diffutils/diffutils_3.11.bb      | 3 ---
 meta/recipes-extended/grep/grep_3.11.bb                | 3 ---
 meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb | 2 --
 meta/recipes-extended/tar/tar_1.35.bb                  | 6 ------
 meta/recipes-extended/wget/wget.inc                    | 5 -----
 meta/recipes-support/gmp/gmp_6.3.0.bb                  | 2 --
 13 files changed, 42 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/=
recipes-connectivity/inetutils/inetutils_2.5.bb
index 7310f2dc47e..19bf7e1539b 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -22,8 +22,6 @@ SRC_URI =3D "${GNU_MIRROR}/inetutils/inetutils-${PV}.ta=
r.xz \
=20
 inherit autotools gettext update-alternatives texinfo
=20
-acpaths =3D "-I ./m4"
-
 PACKAGECONFIG ??=3D "ftp uucpd \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6=
 ping6', '', d)} \
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-=
core/coreutils/coreutils_9.6.bb
index 05277879343..17bd33958b9 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -82,12 +82,6 @@ RPROVIDES:coreutils +=3D "${@bb.utils.contains('PACKAG=
ECONFIG', 'single-binary', '
 PACKAGE_BEFORE_PN:class-target +=3D "${PN}-getlimits"
 FILES:${PN}-getlimits =3D "${bindir}/getlimits"
=20
-# Let aclocal use the relative path for the m4 file rather than the
-# absolute since coreutils has a lot of m4 files, otherwise there might
-# be an "Argument list too long" error when it is built in a long/deep
-# directory.
-acpaths =3D "-I ./m4"
-
 # Deal with a separate builddir failure if src doesn't exist when creati=
ng version.c/version.h
 do_compile:prepend () {
 	mkdir -p ${B}/src
diff --git a/meta/recipes-core/gettext/gettext_0.23.1.bb b/meta/recipes-c=
ore/gettext/gettext_0.23.1.bb
index da4e6c68500..cbc3e48890e 100644
--- a/meta/recipes-core/gettext/gettext_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.1.bb
@@ -63,9 +63,6 @@ PACKAGECONFIG[libxml] =3D "--without-included-libxml,--=
with-included-libxml,libxml
 PACKAGECONFIG[libunistring] =3D "--with-libunistring-prefix=3D${STAGING_=
LIBDIR}/..,--with-included-libunistring,libunistring"
 PACKAGECONFIG[msgcat-curses] =3D "--with-libncurses-prefix=3D${STAGING_L=
IBDIR}/..,--disable-curses,ncurses,"
=20
-acpaths =3D '-I ${S}/gettext-runtime/m4 \
-           -I ${S}/gettext-tools/m4'
-
 do_install:append:libc-musl () {
 	rm -f ${D}${libdir}/charset.alias
 	rm -f ${D}${includedir}/libintl.h
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-de=
vtools/bison/bison_3.8.2.bb
index da138e35874..513d7ec287d 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -37,9 +37,6 @@ CACHED_CONFIGUREVARS +=3D "${@bb.utils.contains('PACKAG=
ECONFIG', 'readline', '', '
                          ${@bb.utils.contains('PACKAGECONFIG', 'textstyl=
e', '', ' \
                            ac_cv_libtextstyle=3Dno', d)}"
=20
-# The automatic m4 path detection gets confused, so force the right valu=
e
-acpaths =3D "-I ./m4"
-
 do_compile:prepend() {
 	for i in mfcalc calc++ rpcalc; do mkdir -p ${B}/examples/$i; done
 }
diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtoo=
ls/m4/m4-1.4.19.inc
index 1d1f1eb477a..8fb13f543b2 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -23,9 +23,6 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464\
 	            file://examples/COPYING;md5=3D4031593b2166d6c47cae282d944a7=
ede"
=20
-# Fix "Argument list too long" error when len(TMPDIR) =3D 410
-acpaths =3D "-I ./m4"
-
 EXTRA_OECONF +=3D "--without-libsigsegv-prefix"
=20
 EXTRA_OEMAKE +=3D "'infodir=3D${infodir}'"
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-de=
vtools/patch/patch_2.7.6.bb
index e0e44f9c977..a91944234f1 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -18,8 +18,6 @@ SRC_URI[sha256sum] =3D "8cf86e00ad3aaa6d26aca30640e86b0=
e3e1f395ed99f189b06d4c9f74b
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
-acpaths =3D "-I ${S}/m4 "
-
 PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
 PACKAGECONFIG[xattr] =3D "--enable-xattr,--disable-xattr,attr,"
=20
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
index 2b298eb5e85..baf37b0a9be 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -31,8 +31,6 @@ PACKAGECONFIG:class-native =3D ""
=20
 PACKAGECONFIG[glib] =3D "--without-internal-glib,--with-internal-glib,gl=
ib-2.0 pkgconfig-native"
=20
-acpaths =3D "-I ."
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 # Set an empty dev package to ensure the base PN package gets
diff --git a/meta/recipes-extended/diffutils/diffutils_3.11.bb b/meta/rec=
ipes-extended/diffutils/diffutils_3.11.bb
index 8f5a87c2db7..a4badc044e9 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.11.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.11.bb
@@ -15,9 +15,6 @@ EXTRA_OECONF +=3D "ac_cv_path_PR_PROGRAM=3D${bindir}/pr=
 --without-libsigsegv-prefix"
 # latest gnulib is no longer able to handle this - I dare not try to fix=
 that maze of abstractions and generators
 CFLAGS:mingw32 =3D " -DSA_RESTART=3D0"
=20
-# Fix "Argument list too long" error when len(TMPDIR) =3D 410
-acpaths =3D "-I ./m4"
-
 EXTRA_OEMAKE:append:mingw32 =3D " LIBS=3D'-lbcrypt'"
 inherit ptest
=20
diff --git a/meta/recipes-extended/grep/grep_3.11.bb b/meta/recipes-exten=
ded/grep/grep_3.11.bb
index cb3105de04c..0d36eba3b28 100644
--- a/meta/recipes-extended/grep/grep_3.11.bb
+++ b/meta/recipes-extended/grep/grep_3.11.bb
@@ -12,9 +12,6 @@ SRC_URI[sha256sum] =3D "1db2aedde89d0dea42b16d9528f894c=
8d15dae4e190b59aecc78f5a951
=20
 inherit autotools gettext texinfo pkgconfig
=20
-# Fix "Argument list too long" error when len(TMPDIR) =3D 410
-acpaths =3D "-I ./m4"
-
 do_configure:prepend () {
 	sed -i -e '1s,#!@SHELL@,#!/bin/sh,' ${S}/src/egrep.sh
 	rm -f ${S}/m4/init.m4
diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb b/met=
a/recipes-extended/libpipeline/libpipeline_1.5.8.bb
index bd3f40ab822..1f6de1d925d 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.8.bb
@@ -10,5 +10,3 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipe=
line-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "1b1203ca152ccd63983c3f2112f7fe6fa5afd453218ede51=
53d1b31e11bb8405"
=20
 inherit pkgconfig autotools
-
-acpaths =3D "-I ${S}/gl/m4 -I ${S}/m4"
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extende=
d/tar/tar_1.35.bb
index c7bd1d195e5..ea0993a9098 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -22,12 +22,6 @@ EXTRA_OECONF +=3D "DEFAULT_RMT_DIR=3D${sbindir}"
=20
 CACHED_CONFIGUREVARS +=3D "tar_cv_path_RSH=3Dno"
=20
-# Let aclocal use the relative path for the m4 file rather than the
-# absolute since tar has a lot of m4 files, otherwise there might
-# be an "Argument list too long" error when it is built in a long/deep
-# directory.
-acpaths =3D "-I ./m4"
-
 do_install () {
     autotools_do_install
     ln -s tar ${D}${bindir}/gtar
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
index 51926e72962..151aeabcdce 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -38,8 +38,3 @@ PACKAGECONFIG[libuuid] =3D "--with-libuuid,--without-li=
buuid,util-linux"
 PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
 PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
 PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
-
-# Let aclocal use the relative path for the m4 file rather than
-# absolute, otherwise there might be an "Argument list too long" error
-# when it is built in a long/deep directory.
-acpaths =3D "-I ./m4"
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support=
/gmp/gmp_6.3.0.bb
index fd4aec92fdb..2ce8ae385c0 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -17,8 +17,6 @@ SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${=
REVISION}.tar.bz2 \
            "
 SRC_URI[sha256sum] =3D "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6f=
e2e47b000d1c20cb"
=20
-acpaths =3D ""
-
 EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
 EXTRA_OECONF:append:mipsarchr6 =3D " --disable-assembly"
=20
--=20
2.43.0


