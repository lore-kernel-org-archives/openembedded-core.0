Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrYDN-0002k1-7D
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:34:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 09:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,357,1309762800"; d="scan'208";a="38285530"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 09:30:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 09:29:50 -0700
Message-Id: <cf117fe23258636c0801b7a7958747a8967e4208.1313079549.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/10] gcc: Various fixups to ensure consistent gcc builds
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
X-List-Received-Date: Thu, 11 Aug 2011 16:34:37 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We ensure that:
* the shared work directory contains PR and ensure PR values are consistent across gcc builds
* the regexp to handle library directories is in a specific task and run once

This avoids breakage that was seen in incremental builds after commit
be1f70d68b6b75772ebab8bdff683ddd7c42b0cd where the interpretor could
become corrupted. This was due to the sed expression corrupting
the source directory.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    2 ++
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    4 ++--
 meta/recipes-devtools/gcc/gcc-common.inc           |    9 +++++----
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   10 +++++++---
 .../gcc/gcc-cross-canadian_4.5.1.bb                |    2 --
 .../gcc/gcc-cross-initial_4.5.1.bb                 |    2 --
 .../gcc/gcc-cross-intermediate_4.5.1.bb            |    1 -
 meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb       |    2 --
 .../gcc/gcc-cross_csl-arm-2008q1.bb                |    2 --
 .../gcc/gcc-crosssdk-initial_4.5.1.bb              |    2 --
 .../gcc/gcc-crosssdk-intermediate_4.5.1.bb         |    2 --
 meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb    |    2 --
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |    1 +
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 --
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    1 -
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 --
 16 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 1b21a75..6eb3044 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -1,5 +1,7 @@
 require gcc-common.inc
 
+PR = "r8"
+
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index f952ac8..0a148b4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r4"
+PR = "r7"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -73,7 +73,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
 
 #S = "${WORKDIR}/${BRANCH}"
-S = "${TMPDIR}/work-shared/gcc-${PV}/${BRANCH}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
 B = "${WORKDIR}/${BRANCH}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # Language Overrides
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 1684e78..52431fa 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -40,17 +40,18 @@ ${GNU_MIRROR}/gcc/	http://gcc.get-software.com/releases/ \n \
 gcclibdir = "${libdir}/gcc"
 BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
-S = "${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}"
+S = "${TMPDIR}/work-shared/gcc-${PV}/gcc-${PV}-${PR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 # SS means Shared Stamps directory
-SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}"
+SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}-${PR}"
 do_fetch[stamp-base] = "${SS}"
 do_unpack[stamp-base] = "${SS}"
+do_headerfix[stamp-base] = "${SS}"
 do_patch[stamp-base] = "${SS}"
 
 # SW means Shared Work directory
-SW = "${TMPDIR}/work-shared/gcc-${PV}"
+SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 WORKDIR_task-unpack = "${SW}"
 WORKDIR_task-patch = "${SW}"
 
@@ -61,7 +62,7 @@ target_prefix ?= "${prefix}"
 
 CLEANFUNCS += "workshared_clean"
 # The do_clean should be exclusive since share ${S}
-do_clean[lockfiles] = "${TMPDIR}/stamps/work-shared/gcc-${PV}.clean.lock"
+do_clean[lockfiles] = "${SW}.clean.lock"
 
 python workshared_clean () {
 	"""clear the source directory"""
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 869d1b6..2ddc3d7 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -61,9 +61,9 @@ SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
-do_configure_prepend () {
-	# Change the default dynamic linker path, only useful for SDK, other's value
-	# are not changed according to the SYSTEMLIBS_DIR
+do_headerfix () {
+	# Change the default dynamic linker path, in case $base_liddir is non-standard
+	# (e.g. in multilib or sdk cases)
 	#
 	# We want something like the following:
 	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
@@ -72,7 +72,11 @@ do_configure_prepend () {
 	#
 	sed -i ${S}/gcc/config/*/linux*.h -e \
 		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
+}
 
+addtask headerfix after do_unpack before do_patch
+
+do_configure_prepend () {
 	# teach gcc to find correct target includedir when checking libc ssp support
 	mkdir -p ${B}/gcc
 	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
index 92708d4..da3210f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.5.1.bb
@@ -5,8 +5,6 @@ require gcc-cross-canadian.inc
 require gcc-configure-sdk.inc
 require gcc-package-sdk.inc
 
-PR = "r4"
-
 DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
index 081b7d6..16d8181 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial_4.5.1.bb
@@ -1,5 +1,3 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-initial.inc
 
-PR = "r4"
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
index a8473b0..42fd0f0 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate_4.5.1.bb
@@ -1,4 +1,3 @@
 require gcc-cross_${PV}.bb
 require gcc-cross-intermediate.inc
-PR = "r5"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
index af6daf4..97a0c81 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb
@@ -1,5 +1,3 @@
-PR = "r4"
-
 require gcc-${PV}.inc
 require gcc-cross4.inc
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
index 3c9a7f8..58eba46 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
@@ -1,5 +1,3 @@
-PR = "r5"
-
 require gcc-csl-arm-2008q1.inc
 require gcc-cross4.inc
 require gcc-configure-cross.inc
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
index 9708248..0c9fdd3 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.5.1.bb
@@ -1,4 +1,2 @@
 require gcc-cross-initial_${PV}.bb
 require gcc-crosssdk-initial.inc
-
-PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
index d235969..1aa588a 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.5.1.bb
@@ -1,4 +1,2 @@
 require gcc-cross-intermediate_${PV}.bb
 require gcc-crosssdk-intermediate.inc
-
-PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
index bae2389..7430888 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb
@@ -1,4 +1,2 @@
 require gcc-cross_${PV}.bb
 require gcc-crosssdk.inc
-
-PR = "r4"
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
index cb5b087..062f1c5 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
@@ -2,6 +2,7 @@ require gcc-common.inc
 
 BINV = "4.2.3"
 PV = "4.2.3+csl-arm-2008q1-126"
+PR = "r6"
 
 FILESDIR = "${FILE_DIRNAME}/gcc-csl-arm"
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
index 0a7056c..bd3bacf 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
@@ -1,5 +1,3 @@
-PR = "r6"
-
 require gcc-${PV}.inc
 require gcc-configure-runtime.inc
 require gcc-package-runtime.inc
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index f036cb1..4dfb12e 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,3 @@
-PR = "r8"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
index 9fd2b0a..5bb8e58 100644
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
@@ -1,5 +1,3 @@
-PR = "r5"
-
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
-- 
1.7.3.4



