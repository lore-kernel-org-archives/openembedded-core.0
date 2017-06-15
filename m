Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 612DC78389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:45:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 02:45:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="1182803332"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2017 02:45:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B96C05804B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 02:45:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 12:44:02 +0300
Message-Id: <d36dd3db5e436983c05c8084bdc26a646e257101.1497519337.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497519337.git.ed.bartosh@linux.intel.com>
References: <cover.1497519337.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v5 3/6] image_types_wic: merged 2 tasks
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
X-List-Received-Date: Thu, 15 Jun 2017 09:45:47 -0000

Merged do_write_wks_template and do_populate_bootfs into
new task do_prepare_wic_build to be able to write the same
partition UUID into bootloader configuration files and
kickstart file.

[YOCTO #10073]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 53 +++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 275f1d7..825a67d 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -43,27 +43,6 @@ do_image_wic[depends] += "wic-tools:do_populate_sysroot"
 WKS_FILE_DEPENDS ??= ''
 DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else '' }"
 
-python do_write_wks_template () {
-    """Write out expanded template contents to WKS_FULL_PATH."""
-    import re
-
-    template_body = d.getVar('_WKS_TEMPLATE')
-
-    # Remove any remnant variable references left behind by the expansion
-    # due to undefined variables
-    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
-    while True:
-        new_body = re.sub(expand_var_regexp, '', template_body)
-        if new_body == template_body:
-            break
-        else:
-            template_body = new_body
-
-    wks_file = d.getVar('WKS_FULL_PATH')
-    with open(wks_file, 'w') as f:
-        f.write(template_body)
-}
-
 python () {
     if d.getVar('USING_WIC'):
         wks_file_u = d.getVar('WKS_FULL_PATH', False)
@@ -90,7 +69,6 @@ python () {
                 # file in process_wks_template as well, so just put it in
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
-                bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
 }
 
 #
@@ -127,7 +105,11 @@ EFI_PROVIDER ?= "systemd-boot"
 EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
 inherit ${EFI_CLASS}
 
-python do_populate_bootfs() {
+python do_prepare_wic_build() {
+    # Prepare required artifacts for the wic image build:
+    #  - Populate {WORKDIR}/bootfs directory with EFI content
+    #  - Write wks.in template into the .wks file
+
     def populate_bootfs(partuuid):
         # remove bootfs dir as it may have files from previous build
         bootfs = os.path.join(d.getVar("WORKDIR"), 'bootfs')
@@ -140,6 +122,23 @@ python do_populate_bootfs() {
 
         bb.build.exec_func('efi_bootfs_populate', d)
 
+    def write_wks_template(template_body, wks_file):
+        """Write out expanded template contents to WKS_FULL_PATH."""
+        import re
+
+        # Remove any remnant variable references left behind by the expansion
+        # due to undefined variables
+        expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
+        while True:
+            new_body = re.sub(expand_var_regexp, '', template_body)
+            if new_body == template_body:
+                break
+            else:
+                template_body = new_body
+
+        with open(wks_file, 'w') as f:
+            f.write(template_body)
+
     if d.getVar('USING_WIC'):
         # Generate parition UUID
         from uuid import uuid4
@@ -148,7 +147,11 @@ python do_populate_bootfs() {
 
         if d.getVar("EFI_CLASS"):
             populate_bootfs(partuuid)
+
+        template = d.getVar("_WKS_TEMPLATE")
+        if template:
+            write_wks_template(template, d.getVar('WKS_FULL_PATH'))
 }
 
-addtask do_populate_bootfs before do_image_wic
-do_populate_bootfs[depends] = "${MLPREFIX}${EFI_PROVIDER}:do_deploy virtual/kernel:do_deploy"
+addtask do_prepare_wic_build before do_image_wic
+do_prepare_wic_build[depends] = "${MLPREFIX}${EFI_PROVIDER}:do_deploy virtual/kernel:do_deploy"
-- 
2.1.4


