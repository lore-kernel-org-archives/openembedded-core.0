Return-Path: <juro.bystricky@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id CB90377E87
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 18:56:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2018 10:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,451,1515484800"; d="scan'208";a="23585806"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga007.jf.intel.com with ESMTP; 10 Mar 2018 10:56:25 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2018 10:56:25 -0800
Message-Id: <1520708185-45755-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] BUILD_REPRODUCIBLE_BINARIES: use expanded value
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
X-List-Received-Date: Sat, 10 Mar 2018 18:56:25 -0000

Replace the occurences of BUILD_REPRODUCIBLE_BINARIES with expanded
values ${BUILD_REPRODUCIBLE_BINARIES} so the variable does not need to be
exported.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image-prelink.bbclass    | 2 +-
 meta/classes/image.bbclass            | 2 +-
 meta/classes/kernel.bbclass           | 2 +-
 meta/recipes-core/busybox/busybox.inc | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index f3bb68b..6a8afa8 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -36,7 +36,7 @@ prelink_image () {
 	dynamic_loader=$(linuxloader)
 
 	# prelink!
-	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
 		bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
 		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
 			export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ce78c43..1636eed 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -664,7 +664,7 @@ ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'
 POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
 
 reproducible_final_image_task () {
-    if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+    if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
             REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1 --pretty=%ct`
         fi
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 321c0a4..d4ebc25 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -279,7 +279,7 @@ get_cc_option () {
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
 		if [ "$SOURCE_DATE_EPOCH" = "0" ]; then
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index ac6d7ca..d1675c3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -106,7 +106,7 @@ python () {
 }
 
 do_prepare_config () {
-	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
 		export KCONFIG_NOTIMESTAMP=1
 	fi
 	sed -e '/CONFIG_STATIC/d' \
@@ -146,7 +146,7 @@ do_configure () {
 
 do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
 		export KCONFIG_NOTIMESTAMP=1
 	fi
 	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
-- 
2.7.4


