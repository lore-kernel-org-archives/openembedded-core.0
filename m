Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D3F3E65E28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 00:22:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R0MJ2k015344 for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:22:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8HxD57-cIxNg
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:22:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R0MGDv015330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 01:22:17 +0100
Message-ID: <1398558130.16672.282.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Apr 2014 01:22:10 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Drop ARCH_FLAGS_FOR_TARGET usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Apr 2014 00:22:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As far as I can tell this variable is now completely unneeded. It would
only ever get used in target builds and these are now correctly done
in the target environment namespace, not any of our cross environments.
As such, CC and other variables contain the correct compilers and other
tune options and these are correctly picked up when building libgcc,
libstdc++ and others.

I tried to figure out where else these would make any sense and couldn't
find anything. Builds appear fine without them so lets drop the complexity
including the patch adding in this flag to gcc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 855ec26..42b4212 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -22,7 +22,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
-	   file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://0002-uclibc-conf.patch \
 	   file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
 	   file://0004-uclibc-locale.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 3cc5efa..7ff1a10 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -68,11 +68,6 @@ CPPFLAGS = ""
 EXTRA_OECONF_append_powerpc = " --with-long-double-128"
 EXTRA_OECONF_append_powerpc64 = " --with-long-double-128"
 
-# Used by configure to define additional values for FLAGS_FOR_TARGET -
-# passed to all the compilers.
-ARCH_FLAGS_FOR_TARGET = "${TARGET_CC_ARCH}"
-EXTRA_OEMAKE += "ARCH_FLAGS_FOR_TARGET='${ARCH_FLAGS_FOR_TARGET}'"
-
 SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
@@ -121,7 +116,6 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
-	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
 	export CFLAGS_FOR_TARGET="${TARGET_CFLAGS}"
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2e82a09..c59c35a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -7,8 +7,6 @@ EXTRA_OECONF_PATHS = " \
     --with-sysroot=${STAGING_DIR_TARGET} \
     --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
-
 EXTRA_OECONF += "--disable-libunwind-exceptions"
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
 
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 3412aa8..aff395c 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -7,8 +7,6 @@ EXTRA_OECONF_PATHS = " \
     --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
     --with-gxx-include-dir=${includedir}/c++/"
 
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR} -I${B}/gcc/include/ "
-
 PACKAGES = "\
   ${PN} ${PN}-plugins ${PN}-symlinks \
   g++ g++-symlinks \



