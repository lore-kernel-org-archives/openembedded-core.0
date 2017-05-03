Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D578F71CB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 21:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id F11A618196
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1HQGpu8duZNU
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9A7CE18231
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85FF71E09F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B4C31E09C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 6FB422732
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 23:13:41 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v43LDfZa021763
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 May 2017 23:13:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v43LDfFs021762
	for openembedded-core@lists.openembedded.org;
	Wed, 3 May 2017 23:13:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 23:13:38 +0200
Message-Id: <cdbb3c26e51f50192ffea09a4e79202c662ca6b8.1493845632.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1493845632.git.pkj@axis.com>
References: <cover.1493845632.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] bitbake.conf: Add COMPONENTS_DIR for ${STAGING_DIR}-components
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
X-List-Received-Date: Wed, 03 May 2017 21:13:42 -0000

The path to where to install and find the sysroot components is used
in many places. This warrants it to get its own variable.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/native.bbclass                     | 2 +-
 meta/classes/staging.bbclass                    | 6 +++---
 meta/conf/bitbake.conf                          | 3 ++-
 meta/lib/oeqa/selftest/devtool.py               | 2 +-
 meta/recipes-core/glibc/glibc-locale.inc        | 2 +-
 meta/recipes-core/glibc/glibc-mtrace.inc        | 2 +-
 meta/recipes-core/glibc/glibc-package.inc       | 4 ++--
 meta/recipes-core/glibc/glibc-scripts.inc       | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc        | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc         | 4 ++--
 meta/recipes-devtools/guile/guile_2.0.14.bb     | 4 ++--
 12 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index aec1087af5..b8f839a8b2 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -95,7 +95,7 @@ libdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 libexecdir .= "${NATIVE_PACKAGE_PATH_SUFFIX}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_NATIVE}/"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
+do_populate_sysroot[sstate-outputdirs] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"
 
 # Since we actually install these into situ there is no staging prefix
 STAGING_DIR_HOST = ""
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 4015dd754c..31cd625640 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -201,8 +201,8 @@ do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
-do_populate_sysroot[sstate-fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
+do_populate_sysroot[sstate-outputdirs] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"
+do_populate_sysroot[sstate-fixmedir] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"
 
 python do_populate_sysroot_setscene () {
     sstate_setscene(d)
@@ -442,7 +442,7 @@ python extend_recipe_sysroot() {
     bb.note("\n".join(msgbuf))
 
     stagingdir = d.getVar("STAGING_DIR")
-    sharedmanifests = stagingdir + "-components/manifests"
+    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
     recipesysroot = d.getVar("RECIPE_SYSROOT")
     recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
     current_variant = d.getVar("BBEXTENDVARIANT")
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a24be0551d..2dd2bb1640 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -351,6 +351,7 @@ S = "${WORKDIR}/${BP}"
 B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/sysroots"
+COMPONENTS_DIR = "${STAGING_DIR}-components"
 RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
 RECIPE_SYSROOT_NATIVE = "${WORKDIR}/recipe-sysroot-native"
 
@@ -655,7 +656,7 @@ SRC_URI = ""
 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
-PSEUDO_SYSROOT = "${STAGING_DIR}-components/${BUILD_ARCH}/pseudo-native"
+PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 8e7642c32b..57048665c0 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -294,7 +294,7 @@ class DevtoolTests(DevtoolBase):
             f.write('\nFILES_${PN}-dev += "${datadir}/cmake/Modules"\n')
             # We don't have the ability to pick up this dependency automatically yet...
             f.write('\nDEPENDS += "libusb1"\n')
-            f.write('\nTESTLIBOUTPUT = "${STAGING_DIR}-components/${TUNE_PKGARCH}/${PN}/${libdir}"\n')
+            f.write('\nTESTLIBOUTPUT = "${COMPONENTS_DIR}/${TUNE_PKGARCH}/${PN}/${libdir}"\n')
         # Test devtool build
         result = runCmd('devtool build libftdi')
         bb_vars = get_bb_vars(['TESTLIBOUTPUT', 'STAMP'], 'libftdi')
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 9c99741920..70e2b3a16b 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -66,7 +66,7 @@ DESCRIPTION_localedef = "glibc: compile locale definition files"
 FILES_${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
 FILES_localedef = "${bindir}/localedef"
 
-LOCALETREESRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
+LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
 do_install () {
 	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/glibc/glibc-mtrace.inc
index d3641b39b6..d703c14bdc 100644
--- a/meta/recipes-core/glibc/glibc-mtrace.inc
+++ b/meta/recipes-core/glibc/glibc-mtrace.inc
@@ -5,7 +5,7 @@ DESCRIPTION = "mtrace utility provided by glibc"
 RDEPENDS_${PN} = "perl"
 RPROVIDES_${PN} = "libc-mtrace"
 
-SRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
+SRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
 
 do_install() {
 	install -d -m 0755 ${D}${bindir}
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 2ca56662d5..9f7fa62a37 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -198,8 +198,8 @@ do_stash_locale[dirs] = "${B}"
 do_stash_locale[cleandirs] = "${LOCALESTASH}"
 SSTATETASKS += "do_stash_locale"
 do_stash_locale[sstate-inputdirs] = "${LOCALESTASH}"
-do_stash_locale[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
-do_stash_locale[sstate-fixmedir] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale"
+do_stash_locale[sstate-outputdirs] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
+do_stash_locale[sstate-fixmedir] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
 
 python do_stash_locale_setscene () {
     sstate_setscene(d)
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index 42616f0760..2a2b41507e 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -4,7 +4,7 @@ SUMMARY = "utility scripts provided by glibc"
 DESCRIPTION = "utility scripts provided by glibc"
 RDEPENDS_${PN} = "bash glibc-mtrace"
 
-SRC = "${STAGING_DIR}-components/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
+SRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale/scripts"
 
 bashscripts = "sotruss xtrace"
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 74578d94ff..18dc3a6ca6 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -13,7 +13,7 @@ COMPILERDEP = "virtual/${MLPREFIX}${TARGET_PREFIX}gcc${COMPILERINITIAL}:do_gcc_s
 COMPILERDEP_class-nativesdk = "virtual/${TARGET_PREFIX}gcc${COMPILERINITIAL}-crosssdk:do_gcc_stash_builddir"
 
 python extract_stashed_builddir () {
-    src = d.expand("${STAGING_DIR}-components/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}")
+    src = d.expand("${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}")
     dest = d.getVar("B")
     oe.path.copyhardlinktree(src, dest)
     staging_processfixme([src + "/fixmepath"], dest, dest, dest, d)
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index d440d88e53..9502c2b1ab 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -77,7 +77,7 @@ sysroot_stage_all() {
 }
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/"
-do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR}-components/${PACKAGE_ARCH}/${PN}"
+do_populate_sysroot[sstate-outputdirs] = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"
 
 inherit nopackages
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index c5c1645f69..45985c3847 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -206,8 +206,8 @@ do_gcc_stash_builddir () {
 addtask do_gcc_stash_builddir after do_compile before do_install
 SSTATETASKS += "do_gcc_stash_builddir"
 do_gcc_stash_builddir[sstate-inputdirs] = "${BUILDDIRSTASH}"
-do_gcc_stash_builddir[sstate-outputdirs] = "${STAGING_DIR}-components/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
-do_gcc_stash_builddir[sstate-fixmedir] = "${STAGING_DIR}-components/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
+do_gcc_stash_builddir[sstate-outputdirs] = "${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
+do_gcc_stash_builddir[sstate-fixmedir] = "${COMPONENTS_DIR}/${BUILD_ARCH}/gcc-stashed-builddir${COMPILERINITIAL}-${TARGET_SYS}"
 
 python do_gcc_stash_builddir_setscene () {
     sstate_setscene(d)
diff --git a/meta/recipes-devtools/guile/guile_2.0.14.bb b/meta/recipes-devtools/guile/guile_2.0.14.bb
index 7a36ba0c3b..7a01d0ffc9 100644
--- a/meta/recipes-devtools/guile/guile_2.0.14.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.14.bb
@@ -111,8 +111,8 @@ guile_cross_config() {
 # auto-compile into the prefix even if it can write there, so touch them here as
 # sysroot is managed.
 SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
-GUILESSTATEDIR = "${STAGING_DIR}-components/${TUNE_PKGARCH}/${PN}/${libdir}/guile/2.0/ccache"
-GUILESSTATEDIR_class-native = "${STAGING_DIR}-components/${BUILD_ARCH}/${PN}/${libdir_native}/guile/2.0/ccache"
+GUILESSTATEDIR = "${COMPONENTS_DIR}/${TUNE_PKGARCH}/${PN}/${libdir}/guile/2.0/ccache"
+GUILESSTATEDIR_class-native = "${COMPONENTS_DIR}/${BUILD_ARCH}/${PN}/${libdir_native}/guile/2.0/ccache"
 guile_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
-- 
2.12.0


