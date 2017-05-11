Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A35771CCB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 12:44:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 11 May 2017 05:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,324,1491289200"; d="scan'208";a="1128984204"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2017 05:44:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 442886A4080
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 05:44:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 15:21:20 +0300
Message-Id: <6c598a712101b59dd3b8aa7e91e2519a460b5dc9.1494505033.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494505033.git.ed.bartosh@linux.intel.com>
References: <cover.1494505033.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/5] image_types_wic: merged 2 tasks
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
X-List-Received-Date: Thu, 11 May 2017 12:44:16 -0000

Merged do_write_wks_template and do_populate_bootfs into
new task do_prepare_wic_build to be able to write the same
partition UUID into bootloader configuration files and
kickstart file.

[YOCTO #10073]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 51 +++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 0ef587b..f37865f 100644
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
@@ -127,7 +105,11 @@ EFI_PROVIDER ?= "grub-efi"
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
@@ -148,6 +147,10 @@ python do_populate_bootfs() {
 
         if d.getVar("EFI_CLASS"):
             populate_bootfs(partuuid)
+
+        template = d.getVar("_WKS_TEMPLATE")
+        if template:
+            write_wks_template(template, d.getVar('WKS_FULL_PATH'))
 }
 
-addtask do_populate_bootfs after do_image before do_image_wic
+addtask do_prepare_wic_build after do_image before do_image_wic
-- 
2.1.4


