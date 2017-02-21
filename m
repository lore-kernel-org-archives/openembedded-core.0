Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB1472FDB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:48:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 14:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,191,1484035200"; d="scan'208";a="826960110"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Feb 2017 14:48:54 -0800
Received: from yocto-ab03.ostc.intel.com (yocto-ab03.ostc.intel.com
	[10.54.69.73])
	by linux.intel.com (Postfix) with ESMTP id CD26B6A4004;
	Tue, 21 Feb 2017 14:48:53 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 14:48:51 -0800
Message-Id: <1487717331-26684-3-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 3/3] classes/populate_sdk_base: Adds support to generate extensible sdk package manifest
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

This function writes on host and target manifest files for eSDK.
[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 33665cd..db700d7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -59,6 +59,9 @@ SDK_TITLE ?= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
 SDK_TARGET_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
+SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
+SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
+
 python write_target_sdk_manifest () {
     if d.getVar('BB_CURRENTTASK') == 'populate_sdk':
         from oe.sdk import sdk_list_installed_packages
@@ -69,6 +72,17 @@ python write_target_sdk_manifest () {
             bb.utils.mkdirhier(sdkmanifestdir)
         with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
             output.write(format_pkg_list(pkgs, 'ver'))
+    elif d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
+        from oe.sdk import get_extra_sdkinfo
+        sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+        extra_info = get_extra_sdkinfo(sstate_dir)
+        target = d.getVar('TARGET_SYS')
+        target_multimach = d.getVar('MULTIMACH_TARGET_SYS')
+        with open(d.getVar('SDK_EXT_TARGET_MANIFEST'), 'w') as f:
+            for fn in extra_info['filesizes']:
+                info = fn.split(':') #added
+                if info[2] in (target, target_multimach):
+                    f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
 
 python write_sdk_test_data() {
@@ -88,12 +102,22 @@ python write_host_sdk_manifest () {
             bb.utils.mkdirhier(sdkmanifestdir)
         with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
             output.write(format_pkg_list(pkgs, 'ver'))
+    elif d.getVar('BB_CURRENTTASK') == 'populate_sdk_ext':
+        from oe.sdk import get_extra_sdkinfo
+        sstate_dir = d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+        extra_info = get_extra_sdkinfo(sstate_dir)
+        host = d.getVar('BUILD_SYS')
+        with open(d.getVar('SDK_EXT_HOST_MANIFEST'), 'w') as f:
+            for fn in extra_info['filesizes']:
+                info = fn.split(':') #added
+                if info[2] == host:
+                    f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; write_sdk_test_data ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_COMMAND} "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; write_target_sdk_manifest; write_host_sdk_manifest; ${SDK_PACKAGING_COMMAND} "
 
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
-- 
1.8.3.1


