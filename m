Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 64A6465D2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 14:24:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3OEOJTr019588 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 15:24:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kkav9sEBWwn7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 15:24:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3OEOER1019584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 15:24:16 +0100
Message-ID: <1398349449.16672.178.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 15:24:09 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-cross-initial: Separate out libgcc-initial
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
X-List-Received-Date: Thu, 24 Apr 2014 14:24:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its useful to separate out the native (cross) binaries from the target
compilation. We already do this for libgcc, this now takes the same
approach for -initial.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 0f0e1cd..4cc6ffe 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -1,4 +1,4 @@
-DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial libgcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
 PACKAGES = ""
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 375b9bc..04c5d9a 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -33,7 +33,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 "
 
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 8184538..b6f04de 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -38,10 +38,11 @@ do_configure_prepend () {
 }
 
 do_compile () {
-    oe_runmake all-gcc all-target-libgcc
+    oe_runmake all-gcc configure-target-libgcc
 }
 do_install () {
-	oe_runmake 'DESTDIR=${D}' install-gcc install-target-libgcc
+	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h )
+	oe_runmake 'DESTDIR=${D}' install-gcc
 
 	# We don't really need this (here shares/ contains man/, info/, locale/).
 	rm -rf ${D}${datadir}/
@@ -64,6 +65,14 @@ do_install () {
 	# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
 	# to get rid references to real limits.h
 	cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+
+	# gcc-runtime installs libgcc into a special location in staging since it breaks doing a standalone build
+	case ${PN} in
+		*gcc-cross-initial-${TARGET_ARCH}|*gcc-crosssdk-initial-${TARGET_ARCH})
+			dest=${D}/${includedir}/gcc-build-internal-initial-${TARGET_SYS}
+			hardlinkdir . $dest
+		;;
+	esac
 }
 #
 # Override the default sysroot staging copy since this won't look like a target system
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
new file mode 100644
index 0000000..2ba27a8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -0,0 +1,16 @@
+require libgcc-common.inc
+
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
+
+STAGINGCC = "gcc-cross-initial"
+STAGINGCC_class-nativesdk = "gcc-crosssdk-initial"
+PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
+
+PACKAGES = ""
+
+EXTRA_OECONF += "--disable-shared"
+
+LIBGCCBUILDTREENAME = "gcc-build-internal-initial-"
+
+do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_TCBOOTSTRAP}/"
+
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_4.8.bb b/meta/recipes-devtools/gcc/libgcc-initial_4.8.bb
new file mode 100644
index 0000000..19f253f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc-initial_4.8.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc-initial.inc



