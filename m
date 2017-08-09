Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4305E71BA0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 17:49:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 10:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,348,1498546800"; d="scan'208";a="117337365"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 09 Aug 2017 10:48:35 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:48:27 -0700
Message-Id: <1502300913-40295-6-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v3 05/11] image.bbclass: support binary reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 17:49:03 -0000

Added a new task "reproducible_final_image_task".
If binary reproducibility is desired ($BUILD_REPRODUCIBLE_BINARIES" = "1"),
then recursivley modify mtimes of all files to a reproducible vale.
The value is obtained via REPRODUCIBLE_TIMESTAMP_ROOTFS.
This task is executed as the very last step in image creation, once all
the files in the image have been finalized.

[YOCTO#11176]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/image.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2c1dc81..92f4714 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -117,7 +117,7 @@ def rootfs_variables(d):
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
-                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY']
+                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
     variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
@@ -254,6 +254,7 @@ fakeroot python do_rootfs () {
     progress_reporter.next_stage()
 
     # generate rootfs
+    d.setVarFlag('REPRODUCIBLE_TIMESTAMP_ROOTFS', 'export', '1')
     create_rootfs(d, progress_reporter=progress_reporter, logcatcher=logcatcher)
 
     progress_reporter.finish()
@@ -266,6 +267,7 @@ addtask rootfs after do_prepare_recipe_sysroot
 fakeroot python do_image () {
     from oe.utils import execute_pre_post_process
 
+    d.setVarFlag('REPRODUCIBLE_TIMESTAMP_ROOTFS', 'export', '1')
     pre_process_cmds = d.getVar("IMAGE_PREPROCESS_COMMAND")
 
     execute_pre_post_process(d, pre_process_cmds)
@@ -650,3 +652,15 @@ create_merged_usr_symlinks_sdk() {
 
 ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_rootfs; ', '',d)}"
 POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
+
+reproducible_final_image_task () {
+    if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+        if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1 --pretty=%ct`
+        fi
+        # Set mtime of all files to a reproducible value
+        bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
+        find  ${IMAGE_ROOTFS} -exec touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS {} \;
+    fi
+}
+IMAGE_PREPROCESS_COMMAND_append = " reproducible_final_image_task; "
-- 
2.7.4


