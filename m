Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 87DDD60FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 11:27:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BRmIU004437 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 12:27:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GuDNF9MuG9fL
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 12:27:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r94BRkC8004434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Oct 2013 12:27:47 +0100
Message-ID: <1380886061.18603.595.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Oct 2013 12:27:41 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] cross-canadian: Fix TUNE_PKGARCH references
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
X-List-Received-Date: Fri, 04 Oct 2013 11:27:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The cross-canadian compilers are now build once per architecture but were being
installed into tune specific locations which is incorrect. This adjusts things
so they are make TARGET_ARCH specific. We gain the tune specific parts from the
target sysroot which remains tune specific, the compiler and tools are independent
ot that.

binutils/gcc require sysroot options but since we reset at runtime, these shouldn't
have dependencies in the sstate checksums. They are therefore also excluded.

With these patches, switching machines does not result in a rebuild of *-cross-canadian
and the compiler is correctly located and referenced in the target images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index c22be1a..4387d05 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -73,12 +73,12 @@ target_exec_prefix := "${exec_prefix}"
 base_prefix = "${SDKPATHNATIVE}"
 prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
-bindir = "${exec_prefix}/bin/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+bindir = "${exec_prefix}/bin/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 sbindir = "${bindir}"
 base_bindir = "${bindir}"
 base_sbindir = "${bindir}"
-libdir = "${exec_prefix}/lib/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
-libexecdir = "${exec_prefix}/libexec/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+libdir = "${exec_prefix}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+libexecdir = "${exec_prefix}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 FILES_${PN} = "${prefix}"
 FILES_${PN}-dbg += "${prefix}/.debug \
@@ -91,3 +91,7 @@ export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 do_populate_sysroot[stamp-extra-info] = ""
 
 USE_NLS = "${SDKUSE_NLS}"
+
+# We have to us TARGET_ARCH but we care about the absolute value
+# and not any particular tune that is enabled.
+TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index be5623b..8bdb17d 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -10,7 +10,7 @@ toolchain_create_sdk_env_script () {
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${REAL_MULTIMACH_TARGET_SYS}:$PATH' >> $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
 	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 4658bad..2da9017 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -7,6 +7,11 @@ BPN = "binutils"
 DEPENDS = "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 "
+
+# We have to point binutils at a sysroot but we don't need to rebuild if this changes
+# e.g. we switch between different machines with different tunes.
+EXTRA_OECONF[vardepsexclude] = "TUNE_PKGARCH"
+
 do_install () {
 	autotools_do_install
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 2ad6f4e..9718ecd 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -14,6 +14,11 @@ EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
                       --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
+# We have to point gcc at a sysroot but we don't need to rebuild if this changes
+# e.g. we switch between different machines with different tunes.
+EXTRA_OECONF_PATHS[vardepsexclude] = "TUNE_PKGARCH"
+TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
+get_gcc_fpu_setting[vardepvalue] = ""
 
 #
 # gcc-cross looks and finds these in ${exec_prefix} but we're not so lucky



