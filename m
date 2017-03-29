Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8361177C3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 17:12:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 29 Mar 2017 10:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,242,1486454400"; d="scan'208";a="1148454323"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2017 10:12:35 -0700
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id 6EEEE6A4082;
	Wed, 29 Mar 2017 10:12:28 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 10:12:34 -0700
Message-Id: <1490807554-33473-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490807554-33473-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1490807554-33473-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v4 2/2] meta/classes/populate_sdk: Adds support for generating eSDK manifest files
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
X-List-Received-Date: Wed, 29 Mar 2017 17:12:35 -0000

The functionalities to generate SDK and eSDK manifest files are different,
the SDK comes from package information and the eSDK comes from sstate artifacts.
Only execute write_sdk_{host, target}_manifest when is on populate_sdk class.

Adds new functions write_sdk{host, target}_ext_manifest to execute on postprocess
in populate_sdk_ext because at the end we have all the sstate artifacts to generate the manifest.
[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |  6 +++---
 meta/classes/populate_sdk_ext.bbclass  | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 563582e..6928d02 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -87,9 +87,9 @@ python write_host_sdk_manifest () {
     with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
         output.write(format_pkg_list(pkgs, 'ver'))
 }
-
-POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; write_sdk_test_data ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = " write_sdk_test_data ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3bccb14..81d0050 100644
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


