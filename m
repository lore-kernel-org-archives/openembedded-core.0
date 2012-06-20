Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMrt-0001GR-N5
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:30:54 +0200
Received: by dalh21 with SMTP id h21so9610306dal.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dA19FijkdlPKHrCbRMN+o4w+pFzo1v9fEiXj2t3Dk7s=;
	b=f7/TTA7bWGwpoJh+QTnI3Jvg53MHl+2itEYnDNZsIDCi9sP7on/+JOAFfMlzvsXAvY
	GZDMXurmoBXwpX5W9bfaosxqKuDPqeZfQolLJ69ynlARGzW8Dtsn06Nf4U6xkxIvbJOs
	wU1/yYpHWT7UaNV+NorI8bqN6rfk+sVxZAan4f5WLHSi2esOUfNoEhrmI2j1A/FV2Cai
	8Bejn538Buuw318uzJ4TECFr4Bl83zr8RLLiJmsyS9jgRhiPoTltXFfelvtAr2zP+lGw
	u/7gpP4M2gY0DfOABO/ahRQB6LHnkVmvOc9I2yRCOo7l265qivDsrabhs/mxROac/+Av
	+wHA==
Received: by 10.68.236.102 with SMTP id ut6mr54571591pbc.113.1340205603268;
	Wed, 20 Jun 2012 08:20:03 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jw3sm32227422pbc.65.2012.06.20.08.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 08:20:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 08:18:38 -0700
Message-Id: <ab4b220d0b0e7b0470a9ff254636caf8842b7729.1340205163.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
References: <b69f84fe9eeede659eb8f390497ccb764e37f880.1340205163.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340205163.git.raj.khem@gmail.com>
References: <cover.1340205163.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] binutils: Add with-sysroot to target binutils
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2012 15:30:54 -0000

Also rearrange the recipes to have common bits
in inc files and not include the target bb file
everywhere. This lets us add specific options
to specific recipes particularly target recipe in
this case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc   |   37 ++++++++++++
 .../binutils/binutils-cross-canadian.inc           |    7 +--
 .../binutils/binutils-cross-canadian_2.22.bb       |    4 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    8 +--
 .../binutils/binutils-cross_2.22.bb                |    3 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    3 -
 meta/recipes-devtools/binutils/binutils.inc        |   27 +---------
 meta/recipes-devtools/binutils/binutils_2.22.bb    |   60 ++++++++-----------
 8 files changed, 71 insertions(+), 78 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.22.inc

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
new file mode 100644
index 0000000..6f1e0dc
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -0,0 +1,37 @@
+PR = "r10"
+
+LIC_FILES_CHKSUM="\
+    file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
+    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
+    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674\
+    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504\
+    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6\
+    file://gas/COPYING;md5=d32239bcb673463ab874e80d47fae504\
+    file://include/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
+    file://include/COPYING3;md5=d32239bcb673463ab874e80d47fae504\
+    file://libiberty/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7\
+    file://bfd/COPYING;md5=d32239bcb673463ab874e80d47fae504\
+    "
+
+SRC_URI = "\
+     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
+     file://binutils-uclibc-100-uclibc-conf.patch \
+     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
+     file://binutils-uclibc-300-006_better_file_error.patch \
+     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
+     file://binutils-uclibc-gas-needs-libm.patch \
+     file://binutils-x86_64_i386_biarch.patch \
+     file://libtool-2.4-update.patch \
+     file://binutils-2.19.1-ld-sysroot.patch \
+     file://libiberty_path_fix.patch \
+     file://binutils-poison.patch \
+     file://libtool-rpath-fix.patch \
+     file://clone-shadow.patch \
+     file://binutils-powerpc-e5500.patch \
+     file://binutils-armv5e.patch \
+     file://mips64-default-ld-emulation.patch \
+     file://0001-PR-ld-13470.patch \
+     "
+
+SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
+SRC_URI[sha256sum] = "6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 15b9abb..a23531c 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -5,11 +5,8 @@ PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
 DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/libc-nativesdk zlib-nativesdk gettext-nativesdk"
-EXTRA_OECONF = "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
-                --program-prefix=${TARGET_PREFIX} \
-                --disable-werror \
-                ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
-
+EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
+                "
 do_install () {
 	autotools_do_install
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
index a49aded..5dbaa03 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
@@ -1,3 +1,3 @@
-require binutils_${PV}.bb
+require binutils.inc
+require binutils-${PV}.inc
 require binutils-cross-canadian.inc
-PR = "r2"
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 80152a9..300a1d3 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -4,14 +4,10 @@ PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
-                --program-prefix=${TARGET_PREFIX} \
+EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-install-libbfd \
-                --disable-werror \
                 --enable-poison-system-directories \
-                ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
-
+                "
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.22.bb b/meta/recipes-devtools/binutils/binutils-cross_2.22.bb
index 01d99db..fbd1f7d 100644
--- a/meta/recipes-devtools/binutils/binutils-cross_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross_2.22.bb
@@ -1,2 +1,3 @@
-require binutils_${PV}.bb
+require binutils.inc
+require binutils-${PV}.inc
 require binutils-cross.inc
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
index 0e8b6e4..0eb5684 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
@@ -4,9 +4,6 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r2"
-
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
 }
-
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 2440509..19cb06a 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -50,13 +50,10 @@ FILES_${PN}-dbg += "${prefix}/${TARGET_SYS}/bin/.debug"
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
-                --enable-install-libbfd \
-                --enable-shared \
                 --disable-werror \
+		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
-EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
-
 # This is necessary due to a bug in the binutils Makefiles
 # EXTRA_OEMAKE = "configure-build-libiberty all"
 
@@ -124,28 +121,6 @@ do_install () {
 	oe_multilib_header bfd.h
 }
 
-do_install_virtclass-native () {
-	autotools_do_install
-
-	# Install the libiberty header
-	install -d ${D}${includedir}
-	install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
-	install -m 644 ${S}/include/libiberty.h ${D}${includedir}
-
-	# We only want libiberty, libbfd and libopcodes
-	rm -rf ${D}${bindir}
-	rm -rf ${D}${prefix}/${TARGET_SYS}
-	rm -rf ${D}${prefix}/lib/ldscripts
-	rm -rf ${D}${prefix}/share/info
-	rm -rf ${D}${prefix}/share/locale
-	rm -rf ${D}${prefix}/share/man
-	rmdir ${D}${prefix}/share || :
-	rmdir ${D}/${libdir}/gcc-lib || :
-	rmdir ${D}/${libdir}64/gcc-lib || :
-	rmdir ${D}/${libdir} || :
-	rmdir ${D}/${libdir}64 || :
-}
-
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index 7b6adef..b8e1112 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,42 +1,32 @@
 require binutils.inc
+require binutils-${PV}.inc
+EXTRA_OECONF += "--with-sysroot=/ \
+                --enable-install-libbfd \
+                --enable-shared \
+                "
 
-PR = "r9"
+EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
 
-LIC_FILES_CHKSUM="\
-    file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
-    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
-    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674\
-    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504\
-    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6\
-    file://gas/COPYING;md5=d32239bcb673463ab874e80d47fae504\
-    file://include/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552\
-    file://include/COPYING3;md5=d32239bcb673463ab874e80d47fae504\
-    file://libiberty/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7\
-    file://bfd/COPYING;md5=d32239bcb673463ab874e80d47fae504\
-    "
+do_install_virtclass-native () {
+	autotools_do_install
 
-SRC_URI = "\
-     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://binutils-uclibc-gas-needs-libm.patch \
-     file://binutils-x86_64_i386_biarch.patch \
-     file://libtool-2.4-update.patch \
-     file://binutils-2.19.1-ld-sysroot.patch \
-     file://libiberty_path_fix.patch \
-     file://binutils-poison.patch \
-     file://libtool-rpath-fix.patch \
-     file://clone-shadow.patch \
-     file://binutils-powerpc-e5500.patch \
-     file://binutils-armv5e.patch \
-     file://mips64-default-ld-emulation.patch \
-     file://0001-PR-ld-13470.patch \
-     "
-
-SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
-SRC_URI[sha256sum] = "6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9"
+	# Install the libiberty header
+	install -d ${D}${includedir}
+	install -m 644 ${S}/include/ansidecl.h ${D}${includedir}
+	install -m 644 ${S}/include/libiberty.h ${D}${includedir}
 
+	# We only want libiberty, libbfd and libopcodes
+	rm -rf ${D}${bindir}
+	rm -rf ${D}${prefix}/${TARGET_SYS}
+	rm -rf ${D}${prefix}/lib/ldscripts
+	rm -rf ${D}${prefix}/share/info
+	rm -rf ${D}${prefix}/share/locale
+	rm -rf ${D}${prefix}/share/man
+	rmdir ${D}${prefix}/share || :
+	rmdir ${D}/${libdir}/gcc-lib || :
+	rmdir ${D}/${libdir}64/gcc-lib || :
+	rmdir ${D}/${libdir} || :
+	rmdir ${D}/${libdir}64 || :
+}
 
 BBCLASSEXTEND = "native"
-- 
1.7.5.4



