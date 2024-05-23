Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1836C25B79
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 12:01:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13649.1716465689160438891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 05:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF97C339
	for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 05:01:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CC803F641
	for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 05:01:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] pciutils: rewrite recipe
Date: Thu, 23 May 2024 12:01:26 +0000
Message-Id: <20240523120127.1250257-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 12:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199787

The upstream Makefiles are bespoke so need to be handheld, but this
recipe has workarounds for code removed a decade ago.

Add more PACKAGECONFIGs for the other configuration options (zlib, kmod),
and use hwdb by default (non-systemd builds also have hwdb, as it's part
of eudev too).

Instead of using 'make -e', pass the variables that we want the Makefile
to respect explicitly (CC, CFLAGS, etc).

Construct an appropriate HOST so that lib/configure does the right thing
without needing patches.

This now results in text relocations (apparently from the versioned
symbols in libpci), so add an INSANE_SKIP for that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pciutils/pciutils/configure.patch         | 90 -------------------
 meta/recipes-bsp/pciutils/pciutils_3.11.1.bb  | 50 +++++------
 2 files changed, 20 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils/configure.patch

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/re=
cipes-bsp/pciutils/pciutils/configure.patch
deleted file mode 100644
index 5015cf48844..00000000000
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 561216c8cbc280aaa9aecf30cb11835a4a0a78ed Mon Sep 17 00:00:00 2001
-From: Richard Purdie <rpurdie@linux.intel.com>
-Date: Wed, 31 Dec 2008 17:20:38 +0000
-Subject: [PATCH] pciutils: Upgarde 2.2.4 -> 3.0.3
-
-This patch:
-* ensures we link correctly
-* allows us to optionally pass target information to configure rather th=
an using uname
-* select linux as the platform in most cases we care about
-
-This is a merge of various tweaks to allow us to build pciutils includin=
g
-work from:
-
-7/30/2010 - Qing He <qing.he@intel.com>
-1/22/2012 - Shane Wang <shane.wang@intel.com>
-Ionut Radu <ionutx.radu@intel.com>
-2017/6/15 - RP - Cleanups and merging patches
-
-Upstream-Status: Inappropriate [embedded specific]
----
- Makefile      |  2 +-
- lib/configure | 14 ++++++++++----
- 2 files changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index aaec04e..9c1dab0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -123,7 +123,7 @@ pcilmr$(EXEEXT): pcilmr.o $(LMROBJS) $(COMMON) lib/$=
(PCIIMPLIB)
- pcilmr.o: pcilmr.c $(LMRINC)
-=20
- %$(EXEEXT): %.o
--	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-+	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
-=20
- ifdef PCI_OS_WINDOWS
- comma :=3D ,
-diff --git a/lib/configure b/lib/configure
-index 3df057a..c87e71c 100755
---- a/lib/configure
-+++ b/lib/configure
-@@ -9,6 +9,10 @@ echo_n() {
- 	printf '%s' "$*"
- }
-=20
-+VERSION=3D$1
-+IDSDIR=3D$2
-+DNS=3Dyes
-+
- if [ -z "$VERSION" ] ; then
- 	echo >&2 "Please run the configure script from the top-level Makefile"
- 	exit 1
-@@ -16,8 +20,8 @@ fi
-=20
- echo_n "Configuring libpci for your system..."
- if [ -z "$HOST" ] ; then
--	sys=3D`uname -s`
--	rel=3D`uname -r`
-+	sys=3D${3:-`uname -s`}
-+	rel=3D
- 	realsys=3D"$sys"
- 	if [ "$sys" =3D "AIX" -a -x /usr/bin/oslevel -a -x /usr/sbin/lsattr ]
- 	then
-@@ -25,7 +29,7 @@ if [ -z "$HOST" ] ; then
- 		proc=3D`/usr/sbin/lsdev -C -c processor -S available -F name | head -=
1`
- 		cpu=3D`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
- 	else
--		cpu=3D`uname -m | sed 's/^i.86-AT386/i386/;s/^i.86$/i386/;s/^sun4u$/s=
parc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/power=
pc/'`
-+		cpu=3D${4:-`uname -m | sed 's/^i.86-AT386/i386/;s/^i.86$/i386/;s/^sun=
4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/=
powerpc/'`}
- 	fi
- 	if [ "$sys" =3D "DragonFly" ]
- 	then
-@@ -43,7 +47,7 @@ if [ -z "$HOST" ] ; then
- 	then
- 		sys=3Dcygwin
- 	fi
--	HOST=3D${3:-$cpu-$sys}
-+	HOST=3D$cpu-$sys
- fi
- [ -n "$RELEASE" ] && rel=3D"${RELEASE}"
- # CAVEAT: tr on Solaris is a bit weird and the extra [] is otherwise ha=
rmless.
-@@ -52,6 +56,8 @@ cpu=3D`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)=
$/\1/'`
- sys=3D`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
- echo " $host $rel $cpu $sys"
-=20
-+{ echo "$host" | grep linux; } && sys=3Dlinux
-+
- c=3Dconfig.h
- m=3Dconfig.mk
- echo >$c '#define PCI_CONFIG_H'
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb b/meta/recipes-=
bsp/pciutils/pciutils_3.11.1.bb
index 044074ccc3a..d5a2601dbcd 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
@@ -9,41 +9,27 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
 # Can drop make-native when all systems have make 4.3
 # https://git.savannah.gnu.org/cgit/make.git/commit/?id=3Db90fabc8d6f34f=
b37d428dc0fb1b8b1951a9fbed
 # causes space issues in lib/libpci.pc
-DEPENDS =3D "zlib kmod make-native"
-
-SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.=
tar.xz \
-           file://configure.patch"
+DEPENDS =3D "make-native"
=20
+SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.=
tar.xz"
 SRC_URI[sha256sum] =3D "3f472ad864473de5ba17f765cc96ef5f33e1b730918d3add=
a6f945a2a9290df4"
=20
 inherit multilib_header pkgconfig update-alternatives
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'hwdb', '', d)}"
+PACKAGECONFIG ??=3D "hwdb kmod zlib"
 PACKAGECONFIG[hwdb] =3D "HWDB=3Dyes,HWDB=3Dno,udev"
-
-PCI_CONF_FLAG =3D "ZLIB=3Dyes DNS=3Dyes SHARED=3Dyes STRIP=3D LIBDIR=3D$=
{libdir}"
-
-# see configure.patch
-do_configure () {
-	(
-	  cd lib && \
-	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain =
'HWDB=3Dyes/no',
-	  # so we put it before ./configure
-	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadi=
r} ${TARGET_OS} ${TARGET_ARCH}
-	)
-}
-
-export PREFIX =3D "${prefix}"
-export SBINDIR =3D "${sbindir}"
-export SHAREDIR =3D "${datadir}"
-export MANDIR =3D "${mandir}"
-
-EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D ${PCI_CONF_FLAG}"
-
-ASNEEDED =3D ""
-
-# The configure script breaks if the HOST variable is set
-HOST[unexport] =3D "1"
+PACKAGECONFIG[kmod] =3D "LIBKMOD=3Dyes,LIBKMOD=3Dno,kmod"
+PACKAGECONFIG[zlib] =3D "ZLIB=3Dyes,ZLIB=3Dno,zlib"
+
+# Configuration options
+EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS} DNS=3Dyes SHARED=3Dyes"
+# Construct a HOST that matches what lib/configure expects
+EXTRA_OEMAKE +=3D "HOST=3D"${HOST_ARCH}-${HOST_OS}""
+# Toolchain. We need to pass CFLAGS via LDFLAGS as this is the only vari=
able
+# # available to the caller without clobbering assignments (notably, -fP=
IC)
+EXTRA_OEMAKE +=3D "CC=3D"${CC}" AR=3D"${AR}" STRIP=3D LDFLAGS=3D"${CFLAG=
S} ${LDFLAGS}""
+# Paths
+EXTRA_OEMAKE +=3D "PREFIX=3D${prefix} LIBDIR=3D${libdir} SBINDIR=3D${sbi=
ndir} SHAREDIR=3D${datadir} MANDIR=3D${mandir}"
=20
 do_install () {
 	oe_runmake DESTDIR=3D${D} install install-lib
@@ -54,11 +40,15 @@ do_install () {
 }
=20
 PACKAGES =3D+ "${PN}-ids libpci"
+
 FILES:${PN}-ids =3D "${datadir}/pci.ids*"
-FILES:libpci =3D "${libdir}/libpci.so.*"
 SUMMARY:${PN}-ids =3D "PCI utilities - device ID database"
 DESCRIPTION:${PN}-ids =3D "Package providing the PCI device ID database =
for pciutils."
 RDEPENDS:${PN} +=3D "${PN}-ids"
=20
+FILES:libpci =3D "${libdir}/libpci.so.*"
+# The versioned symbols in libpci appear to be causing relocations
+INSANE_SKIP:libpci +=3D "textrel"
+
 ALTERNATIVE:${PN} =3D "lspci"
 ALTERNATIVE_PRIORITY =3D "100"
--=20
2.34.1


