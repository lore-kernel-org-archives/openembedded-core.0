Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74C17731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 05:20:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1H5Kr2e015286
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 21:20:53 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 16 Feb 2016 21:20:52 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 13:21:22 +0800
Message-ID: <dfcea62b0b5759ccfcb859dce594cc033a0174d3.1455686332.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455686332.git.Qi.Chen@windriver.com>
References: <cover.1455686332.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] image/populate_sdk: seprate variables to fix dependency
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
X-List-Received-Date: Wed, 17 Feb 2016 05:20:53 -0000
Content-Type: text/plain

Previously, do_rootfs depends on variables like SDK_OS, SDK_OUTPUT, etc.
And changing variables like POPULATE_SDK_POST_HOST_COMMAND doesn't cause
do_populate_sdk to rerun.

This patch separates variables so that do_rootfs and do_populate_sdk could
correctly depend on their related variables.

[YOCTO #8670]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass             | 16 +++++++---------
 meta/classes/populate_sdk_base.bbclass | 13 +++++++++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 56a49e7..5924ded 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -97,13 +97,12 @@ do_rootfs[depends] += " \
 "
 do_rootfs[recrdeptask] += "do_packagedata"
 
-def command_variables(d):
+def rootfs_command_variables(d):
     return ['ROOTFS_POSTPROCESS_COMMAND','ROOTFS_PREPROCESS_COMMAND','ROOTFS_POSTINSTALL_COMMAND','OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','IMAGE_POSTPROCESS_COMMAND',
-            'IMAGE_PREPROCESS_COMMAND','ROOTFS_POSTPROCESS_COMMAND','POPULATE_SDK_POST_HOST_COMMAND','POPULATE_SDK_POST_TARGET_COMMAND','SDK_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS',         
-            'RPM_POSTPROCESS_COMMANDS']
+            'IMAGE_PREPROCESS_COMMAND','ROOTFS_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS']
 
 python () {
-    variables = command_variables(d)
+    variables = rootfs_command_variables(d) + sdk_command_variables(d)
     for var in variables:
         if d.getVar(var, False):
             d.setVarFlag(var, 'func', '1')
@@ -112,12 +111,11 @@ python () {
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
     variables = ['IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
-                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS',
-                 'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
-                 'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
-                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
+                 'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
+                 'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS']
-    variables.extend(command_variables(d))
+    variables.extend(rootfs_command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
 
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index cc211ab..de23f14 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -243,6 +243,19 @@ populate_sdk_log_check() {
 	done
 }
 
+def sdk_command_variables(d):
+    return ['OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','POPULATE_SDK_POST_HOST_COMMAND','POPULATE_SDK_POST_TARGET_COMMAND','SDK_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS',
+            'RPM_POSTPROCESS_COMMANDS']
+
+def sdk_variables(d):
+    variables = ['BUILD_IMAGES_FROM_FEEDS','SDK_OS','SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT',
+                 'SDKTARGETSYSROOT','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
+                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI']
+    variables.extend(sdk_command_variables(d))
+    return " ".join(variables)
+
+do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
+
 do_populate_sdk[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
                                     ${COREBASE}/meta/files/toolchain-shar-extract.sh:True"
 
-- 
1.9.1


