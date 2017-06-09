Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BBDD8782E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:01:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 10:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97608074"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 10:01:26 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 12:01:26 -0500
Message-Id: <cbf50173c089bdd3ca50f9a6286a3e04ef1f73d2.1497027624.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	paul.eggleton@linux.intel.com
Subject: [PATCH 2/4] meta/classes/populate_sdk: Adds support for generating eSDK manifest files
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
X-List-Received-Date: Fri, 09 Jun 2017 17:01:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>

Add get_extra_sdk_info to reuse code in buildhistory

The functionalities to generate SDK and eSDK manifest files are different,
the SDK comes from package information and the eSDK comes from sstate artifacts.
Only execute write_sdk_{host, target}_manifest when is on populate_sdk class.

Adds new functions write_sdk{host, target}_ext_manifest to execute on postprocess
in populate_sdk_ext because at the end we have all the sstate artifacts to
generate the manifest.

[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/buildhistory.bbclass      |  1 -
 meta/classes/populate_sdk_base.bbclass | 44 +++++++++++++++++++---------------
 meta/classes/populate_sdk_ext.bbclass  | 33 +++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index bfcc88a..def7a64 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -581,7 +581,6 @@ END
 
 python buildhistory_get_extra_sdkinfo() {
     import operator
-    import math
     from oe.sdk import get_extra_sdkinfo
 
     sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 563582e..01960ee 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -59,15 +59,19 @@ SDK_TITLE ?= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
 SDK_TARGET_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
+SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
+SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
+
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
@@ -78,20 +82,22 @@ python write_sdk_test_data() {
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
 
-POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; write_sdk_test_data ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; write_target_sdk_manifest; write_host_sdk_manifest; ${SDK_PACKAGING_COMMAND} "
 
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 69bc1d9..4791d74 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -83,6 +83,39 @@ TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${TOOLCHAINEXT_OUTPUTNAME}"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
+python write_target_sdk_ext_manifest () {
+    from oe.sdk import get_extra_sdkinfo
+    sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+    extra_info = get_extra_sdkinfo(sstate_dir)
+
+    target = d.getVar('TARGET_SYS')
+    target_multimach = d.getVar('MULTIMACH_TARGET_SYS')
+    real_target_multimach = d.getVar('REAL_MULTIMACH_TARGET_SYS')
+
+    pkgs = {}
+    with open(d.getVar('SDK_EXT_TARGET_MANIFEST'), 'w') as f:
+        for fn in extra_info['filesizes']:
+            info = fn.split(':')
+            if info[2] in (target, target_multimach, real_target_multimach) \
+                    or info[5] == 'allarch':
+                if not info[1] in pkgs:
+                    f.write("%s %s %s\n" % (info[1], info[2], info[3]))
+                    pkgs[info[1]] = {}
+}
+python write_host_sdk_ext_manifest () {
+    from oe.sdk import get_extra_sdkinfo
+    sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+    extra_info = get_extra_sdkinfo(sstate_dir)
+    host = d.getVar('BUILD_SYS')
+    with open(d.getVar('SDK_EXT_HOST_MANIFEST'), 'w') as f:
+        for fn in extra_info['filesizes']:
+            info = fn.split(':')
+            if info[2] == host:
+                f.write("%s %s %s\n" % (info[1], info[2], info[3]))
+}
+
+SDK_POSTPROCESS_COMMAND_append_task-populate-sdk-ext = "write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "    
+
 SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
 def clean_esdk_builddir(d, sdkbasepath):
-- 
2.1.4


