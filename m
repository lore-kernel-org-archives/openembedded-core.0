Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7AFB771CB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 21:35:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 22 Feb 2017 13:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,196,1484035200"; d="scan'208";a="61245039"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 22 Feb 2017 13:35:17 -0800
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id 52CDD6A4082;
	Wed, 22 Feb 2017 13:35:17 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 13:35:16 -0800
Message-Id: <1487799316-22941-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1487799316-22941-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1487799316-22941-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v2 2/2] meta/classes/populate_sdk: Adds support for generating eSDK manifest files
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
X-List-Received-Date: Wed, 22 Feb 2017 21:35:18 -0000

The functionalities to generate SDK and eSDK manifest files are different,
the SDK comes from package information and the eSDK comes from sstate artifacts.
Only execute write_sdk_{host, target}_manifest when is on populate_sdk class.

Adds new functions write_sdk{host, target}_ext_manifest to execute on postprocess
in populate_sdk_ext because at the end we have all the sstate artifacts to generate the manifest.
[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |  5 +++--
 meta/classes/populate_sdk_ext.bbclass  | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index dd3cac5..ae1b3af 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -88,8 +88,9 @@ python write_host_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
-POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; write_sdk_test_data ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index fff0f12..09c8e6c 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -83,6 +83,33 @@ TOOLCHAIN_OUTPUTNAME_task-populate-sdk-ext = "${TOOLCHAINEXT_OUTPUTNAME}"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
+python write_target_sdk_ext_manifest () {
+    from oe.sdk import get_extra_sdkinfo
+    sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+    extra_info = get_extra_sdkinfo(sstate_dir)
+    target = d.getVar('TARGET_SYS')
+    target_multimach = d.getVar('MULTIMACH_TARGET_SYS')
+    with open(d.getVar('SDK_EXT_TARGET_MANIFEST'), 'w') as f:
+        for fn in extra_info['filesizes']:
+            info = fn.split(':') #added
+            if info[2] in (target, target_multimach):
+                f.write("%s %s %s\n" % (info[1], info[2], info[3]))
+}
+
+python write_host_sdk_ext_manifest () {
+    from oe.sdk import get_extra_sdkinfo
+    sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+    extra_info = get_extra_sdkinfo(sstate_dir)
+    host = d.getVar('BUILD_SYS')
+    with open(d.getVar('SDK_EXT_HOST_MANIFEST'), 'w') as f:
+        for fn in extra_info['filesizes']:
+            info = fn.split(':') #added
+            if info[2] == host:
+                f.write("%s %s %s\n" % (info[1], info[2], info[3]))
+}
+
+SDK_POSTPROCESS_COMMAND_append_task-populate-sdk-ext = "write_target_sdk_ext_manifest; write_host_sdk_ext_manifest; "
+
 SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} Extensible SDK"
 
 def clean_esdk_builddir(d, sdkbasepath):
-- 
1.8.3.1


