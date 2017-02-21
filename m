Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1A92A72FD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:48:52 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 14:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,191,1484035200"; d="scan'208";a="67477683"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 21 Feb 2017 14:48:54 -0800
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id B9F6A6A4082;
	Tue, 21 Feb 2017 14:48:53 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 14:48:50 -0800
Message-Id: <1487717331-26684-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 2/3] meta/classes/populate_sdk_base: Only execute write manifest when is populate_sdk
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
X-List-Received-Date: Tue, 21 Feb 2017 22:48:54 -0000

This function is going to be used for generating the eSDK, however the
eSDK package information comes from sstate artifacts instead of package files.

[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index dd3cac5..33665cd 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -60,14 +60,15 @@ SDK_TITLE ?= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 SDK_TARGET_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 python write_target_sdk_manifest () {
-    from oe.sdk import sdk_list_installed_packages
-    from oe.utils import format_pkg_list
-    sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST"))
-    pkgs = sdk_list_installed_packages(d, True)
-    if not os.path.exists(sdkmanifestdir):
-        bb.utils.mkdirhier(sdkmanifestdir)
-    with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
-        output.write(format_pkg_list(pkgs, 'ver'))
+    if d.getVar('BB_CURRENTTASK') == 'populate_sdk':
+        from oe.sdk import sdk_list_installed_packages
+        from oe.utils import format_pkg_list
+        sdkmanifestdir = os.path.dirname(d.getVar("SDK_TARGET_MANIFEST"))
+        pkgs = sdk_list_installed_packages(d, True)
+        if not os.path.exists(sdkmanifestdir):
+            bb.utils.mkdirhier(sdkmanifestdir)
+        with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
+            output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 python write_sdk_test_data() {
@@ -78,14 +79,15 @@ python write_sdk_test_data() {
 }
 
 python write_host_sdk_manifest () {
-    from oe.sdk import sdk_list_installed_packages
-    from oe.utils import format_pkg_list
-    sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST"))
-    pkgs = sdk_list_installed_packages(d, False)
-    if not os.path.exists(sdkmanifestdir):
-        bb.utils.mkdirhier(sdkmanifestdir)
-    with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
-        output.write(format_pkg_list(pkgs, 'ver'))
+    if d.getVar('BB_CURRENTTASK') == 'populate_sdk':
+        from oe.sdk import sdk_list_installed_packages
+        from oe.utils import format_pkg_list
+        sdkmanifestdir = os.path.dirname(d.getVar("SDK_HOST_MANIFEST"))
+        pkgs = sdk_list_installed_packages(d, False)
+        if not os.path.exists(sdkmanifestdir):
+            bb.utils.mkdirhier(sdkmanifestdir)
+        with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
+            output.write(format_pkg_list(pkgs, 'ver'))
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; write_sdk_test_data ; "
-- 
1.8.3.1


