Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B3EF4782BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 21:07:23 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 14:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,288,1496127600"; d="scan'208";a="119563405"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by orsmga005.jf.intel.com with ESMTP; 30 Jun 2017 14:07:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 16:07:30 -0500
Message-Id: <20170630210730.27152-1-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] classes/populate_sdk_base: Fix SDK manifest generation
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
X-List-Received-Date: Fri, 30 Jun 2017 21:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The write_{host,target}_sdk_manifest don't need to be set as
SDK_POSTPROCESS_COMMAND because are already append to
POPULATE_SDK_POST_{HOST,TARGET}_COMMAND and the if doesn't
make sense because are only added for populate sdk task.

[YOCTO #11741]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 36 ++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 01960ee4cba..3de1d0b1a5d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -63,15 +63,14 @@ SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manif
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
 python write_target_sdk_manifest () {
-    if d.getVar('BB_CURRENTTASK') == 'populate_sdk':
-        from oe.sdk import sdk_list_installed_packages
-        from oe.utils import format_pkg_list
-        sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST"))
-        pkgs = sdk_list_installed_packages(d, True)
-        if not os.path.exists(sdkmanifestdir):
-            bb.utils.mkdirhier(sdkmanifestdir)
-        with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
-            output.write(format_pkg_list(pkgs, 'ver'))
+    from oe.sdk import sdk_list_installed_packages
+    from oe.utils import format_pkg_list
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST"))
+    pkgs = sdk_list_installed_packages(d, True)
+    if not os.path.exists(sdkmanifestdir):
+        bb.utils.mkdirhier(sdkmanifestdir)
+    with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
+        output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 python write_sdk_test_data() {
@@ -82,22 +81,21 @@ python write_sdk_test_data() {
 }
 
 python write_host_sdk_manifest () {
-    if d.getVar('BB_CURRENTTASK') == 'populate_sdk':
-        from oe.sdk import sdk_list_installed_packages
-        from oe.utils import format_pkg_list
-        sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST"))
-        pkgs = sdk_list_installed_packages(d, False)
-        if not os.path.exists(sdkmanifestdir):
-            bb.utils.mkdirhier(sdkmanifestdir)
-        with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
-            output.write(format_pkg_list(pkgs, 'ver'))
+    from oe.sdk import sdk_list_installed_packages
+    from oe.utils import format_pkg_list
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST"))
+    pkgs = sdk_list_installed_packages(d, False)
+    if not os.path.exists(sdkmanifestdir):
+        bb.utils.mkdirhier(sdkmanifestdir)
+    with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
+        output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
 POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; write_target_sdk_manifest; write_host_sdk_manifest; ${SDK_PACKAGING_COMMAND} "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
 
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
-- 
2.11.0


