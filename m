Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 540B16B52C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg903001260; Thu, 22 Aug 2013 12:42:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Vs3XHR3F_RQb; Thu, 22 Aug 2013 12:42:17 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg8gQ001239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:10 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5c-0001jN-8o; Thu, 22 Aug 2013 12:30:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:56 +0100
Message-Id: <1377171000-6469-24-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 24/28] gcc-cross.inc: Clean up after merge
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:28 -0000

* Remove the duplicate EXTRA_OECONF_PATHS that is overwritten
* Merge the do_compile and do_compile_prepend
* Group dependency and configuration variables together

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 48 +++++++++++++--------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index bf22101..a09fd54 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -1,26 +1,38 @@
 inherit cross
 
+INHIBIT_DEFAULT_DEPS = "1"
+EXTRADEPENDS = ""
 DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${EXTRADEPENDS} ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+python () {
+    if d.getVar("TARGET_OS", True).startswith("linux"):
+        d.setVar("EXTRADEPENDS", "linux-libc-headers")
+}
 
 require gcc-configure-common.inc
 
-EXTRA_OECONF += " --enable-poison-system-directories \
-		"
+EXTRA_OECONF += " --enable-poison-system-directories"
+EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
 
-INHIBIT_DEFAULT_DEPS = "1"
+EXTRA_OECONF += "--disable-libunwind-exceptions \
+                 --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
+                 --with-system-zlib "
 
 EXTRA_OECONF_PATHS = " \
-		      --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
-		      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
+                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
                       --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
+ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
+
+LIBGCCS_VAR = "-lgcc_s"
+LIBGCCS_VAR_avr32 = ""
+
 do_configure_prepend () {
 	sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure
 }
 
-do_compile_prepend () {
+do_compile () {
 	export CC="${BUILD_CC}"
 	export AR_FOR_TARGET="${TARGET_SYS}-ar"
 	export RANLIB_FOR_TARGET="${TARGET_SYS}-ranlib"
@@ -31,18 +43,7 @@ do_compile_prepend () {
 	export CPPFLAGS_FOR_TARGET="${TARGET_CPPFLAGS}"
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
-}
-
-LIBGCCS_VAR = "-lgcc_s"
-LIBGCCS_VAR_avr32 = ""
 
-EXTRADEPENDS = ""
-python () {
-    if d.getVar("TARGET_OS", True).startswith("linux"):
-        d.setVar("EXTRADEPENDS", "linux-libc-headers")
-}
-
-do_compile () {
 	oe_runmake all-host all-target-libgcc
 	# now generate script to drive testing
 	echo "#!/usr/bin/env sh" >${B}/${TARGET_PREFIX}testgcc
@@ -137,19 +138,6 @@ STOP
 
 }
 
-EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
-
-EXTRA_OECONF += "--disable-libunwind-exceptions \
-                 --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
-                 --with-system-zlib "
-
-EXTRA_OECONF_PATHS = " \
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
-                      --with-sysroot=${STAGING_DIR_TARGET} \
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
-
-ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
-
 INHIBIT_PACKAGE_STRIP = "1"
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
-- 
1.8.1.2


