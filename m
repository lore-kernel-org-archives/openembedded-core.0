Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TOZ3m-00027s-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 21:13:43 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so6552994pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9YnwZGM5+oIBmpnp57fqDTXXU8pFmrRS1DVGr4S9Jhs=;
	b=S+deL3C5k+gclO+81LyDeESIwccURDsG7lsPBmK12zV12ZlQHR1rdkLXSRfvBtGHch
	+hxxDYsQhyFcP/u8qO+q4TcekR6KfX+HLSaEfaTNs31kyVT2TihsXJUiYQ2bsQkSLmcC
	eJ02MhXBZ4yiSonWF4dfj/6vesqrQuj3TECGl1hxIdfcHhevDBFp+XydqgbVfdK30Fne
	GTV8o9QI36G6KkVL4vTgHCO+lL9HJT/E29CO486vwz68GL6OUFrx2zEUM/EnsIwmcIMm
	Ts+xGFf2MZh1W7NXZbNnSruO9rm7r013uUa5lp4vqLNUtZcd3kPohqxd1WO4Xn7pqNla
	pnwg==
Received: by 10.68.131.40 with SMTP id oj8mr60086813pbb.40.1350500423592;
	Wed, 17 Oct 2012 12:00:23 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ka4sm12882775pbc.61.2012.10.17.12.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 12:00:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 11:59:43 -0700
Message-Id: <1350500383-8380-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [RFT][PATCH] eglibc-2.16: Use tar ball instead of svn SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 19:13:43 -0000

Adapt the recipes to fetch a tarball.
Tarball is generated from latest 2.16 branch
which has e500-math_private.patch already applied
hence we remove that patch.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/cross-localedef-native_2.16.bb          |   14 +++++----
 .../eglibc/eglibc-2.16/e500-math_private.patch     |   31 --------------------
 meta/recipes-core/eglibc/eglibc_2.16.bb            |   19 ++++++------
 3 files changed, 17 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch

diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
index a79a276..e4781ce 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 LICENSE = "LGPL-2.1"
 
-LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+LIC_DIR = "${WORKDIR}/eglibc-${PV}/libc"
 LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9\
       file://${LIC_DIR}/COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://${LIC_DIR}/posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
@@ -16,13 +16,15 @@ inherit autotools
 # pick up an eglibc-2.16 patch
 FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
 
-PR = "r1"
-SRCREV="19383"
-EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+PR = "r2"
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
 	  "
-S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
+
+SRC_URI[md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
+SRC_URI[sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
+
+S = "${WORKDIR}/eglibc-${PV}/localedef"
 
 do_unpack_append() {
     bb.build.exec_func('do_move_ports', d)
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch b/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
deleted file mode 100644
index 9dbb26e..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.16/e500-math_private.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Match with the latest math_private restructuring in glibc
-
-as done here
-
-http://sourceware.org/ml/libc-alpha/2012-03/msg00302.html
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h
-===================================================================
---- libc.orig/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h	2012-07-17 22:58:20.340405923 -0700
-+++ libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/math_private.h	2012-07-17 22:58:21.120405923 -0700
-@@ -1 +1 @@
--#include <math/math_private.h>
-+#include_next <sysdeps/generic/math_private.h>
-Index: libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c
-===================================================================
---- libc.orig/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c	2012-07-17 23:15:15.872405939 -0700
-+++ libc/ports/sysdeps/powerpc/powerpc32/e500/fpu/fraiseexcpt.c	2012-07-17 23:18:42.760405602 -0700
-@@ -23,7 +23,7 @@
- 
- #undef feraiseexcept
- 
--#define __FERAISEEXCEPT_INTERNAL feraiseexcept
-+#define __FERAISEEXCEPT_INTERNAL __feraiseexcept
- #include "../spe-raise.c"
- 
--libm_hidden_def (feraiseexcept)
-+libm_hidden_ver (__feraiseexcept, feraiseexcept)
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 78bf9be..30ce173 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,13 +1,9 @@
 require eglibc.inc
 
-SRCREV = "20393"
-
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r15"
-PR_append = "+svnr${SRCPV}"
+PR = "r16"
 
-EGLIBC_BRANCH="eglibc-2_16"
-SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -21,7 +17,6 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://initgroups_keys.patch \
            file://eglibc_fix_findidx_parameters.patch \
            file://ppc_slow_ieee754_sqrt.patch \
-           file://e500-math_private.patch \
            file://fileops-without-wchar-io.patch \
            file://add_resource_h_to_wait_h.patch \
            file://0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch \
@@ -33,6 +28,10 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://fsl-ppc-no-fsqrt.patch \
            file://0001-R_ARM_TLS_DTPOFF32.patch \
           "
+
+SRC_URI[md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
+SRC_URI[sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
+
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
@@ -41,7 +40,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
 SRC_URI_append_virtclass-nativesdk = " file://ld-search-order.patch \
             file://relocatable_sdk.patch \
             "
-S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
+S = "${WORKDIR}/eglibc-${PV}/libc"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
 PACKAGES_DYNAMIC = ""
@@ -93,9 +92,9 @@ do_unpack_append() {
 }
 
 do_move_ports() {
-        if test -d ${WORKDIR}/${EGLIBC_BRANCH}/ports ; then
+        if test -d ${WORKDIR}/eglibc-${PV}/ports ; then
 	    rm -rf ${S}/ports
-	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
+	    mv ${WORKDIR}/eglibc-${PV}/ports ${S}/
 	fi
 }
 
-- 
1.7.9.5



