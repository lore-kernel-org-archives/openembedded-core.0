Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 187DC7834A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:32:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 04:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="980709707"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 14 Jun 2017 04:32:28 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:30:47 +0300
Message-Id: <1497439848-29967-7-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v4 6/7] meta/lib/oe/sdk.py: support added for executing pre-target commands
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
X-List-Received-Date: Wed, 14 Jun 2017 11:32:28 -0000

Added a new POPULATE_SDK_PRE_TARTET_COMMAND variable, which can contain
functions need to be executed at pre traget sysroot creation phase.

classes/populate_sdk_base.bbclass: Added POPULATE_SDK_PRE_TARTET_COMMAND to sdk
command variables list.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 +--
 meta/lib/oe/sdk.py                     | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 01960ee..20ba219 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -262,8 +262,7 @@ populate_sdk_log_check() {
 }
 
 def sdk_command_variables(d):
-    return ['OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','POPULATE_SDK_POST_HOST_COMMAND','POPULATE_SDK_POST_TARGET_COMMAND','SDK_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS',
-            'RPM_POSTPROCESS_COMMANDS']
+    return ['OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','POPULATE_SDK_POST_HOST_COMMAND','POPULATE_SDK_PRE_TARGET_COMMAND','POPULATE_SDK_POST_TARGET_COMMAND','SDK_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS']
 
 def sdk_variables(d):
     variables = ['BUILD_IMAGES_FROM_FEEDS','SDK_OS','SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT',
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 1c5409e..30e1fb5 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -145,6 +145,8 @@ class RpmSdk(Sdk):
         pm.install(pkgs_attempt, True)
 
     def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
@@ -226,6 +228,8 @@ class OpkgSdk(Sdk):
                            [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
     def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
@@ -308,6 +312,8 @@ class DpkgSdk(Sdk):
                            [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
     def _populate(self):
+        execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_PRE_TARGET_COMMAND"))
+
         bb.note("Installing TARGET packages")
         self._populate_sysroot(self.target_pm, self.target_manifest)
 
-- 
2.7.4


