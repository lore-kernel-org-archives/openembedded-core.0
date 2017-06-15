Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AAE9978396
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:45:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 02:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="115226068"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2017 02:45:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F03FF58010F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 02:45:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 12:44:04 +0300
Message-Id: <953049749537831e935edf67d799efba7cf1af69.1497519337.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497519337.git.ed.bartosh@linux.intel.com>
References: <cover.1497519337.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v5 5/6] image_types_wic: schedule prepare_wic_build correctly
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
X-List-Received-Date: Thu, 15 Jun 2017 09:45:51 -0000

When EFI is enabled we need to ensure that kernel and bootloader
artifacts are fully deployed before running prepare_wic_build.
This is done by scheduling this task after do_deploy task of
EFI_PROVIDER class and by adding dependencty to virtual/kernel:do_deploy.

Scheduled prepare_wic_build only if wic build is enabled to
avoid running it when it's not needed.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/grub-efi.bbclass        |  1 +
 meta/classes/image_types_wic.bbclass | 26 +++++++++++++-------------
 meta/classes/systemd-boot.bbclass    |  1 +
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index b55ac96..1fa648d 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -18,6 +18,7 @@
 
 do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
+do_prepare_wic_build[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUB_CFG_VM = "${S}/grub_vm.cfg"
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 825a67d..cf88853 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -69,6 +69,10 @@ python () {
                 # file in process_wks_template as well, so just put it in
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
+
+        bb.build.addtask('do_prepare_wic_build', 'do_image_wic', None, d)
+        if d.getVar('EFI_CLASS'):
+            d.appendVarFlag('do_prepare_wic_build', 'depends', ' virtual/kernel:do_deploy')
 }
 
 #
@@ -139,19 +143,15 @@ python do_prepare_wic_build() {
         with open(wks_file, 'w') as f:
             f.write(template_body)
 
-    if d.getVar('USING_WIC'):
-        # Generate parition UUID
-        from uuid import uuid4
-        partuuid = str(uuid4())
-        d.setVar("ROOTFS_PARTUUID", partuuid)
+    # Generate parition UUID
+    from uuid import uuid4
+    partuuid = str(uuid4())
+    d.setVar("ROOTFS_PARTUUID", partuuid)
 
-        if d.getVar("EFI_CLASS"):
-            populate_bootfs(partuuid)
+    if d.getVar("EFI_CLASS"):
+        populate_bootfs(partuuid)
 
-        template = d.getVar("_WKS_TEMPLATE")
-        if template:
-            write_wks_template(template, d.getVar('WKS_FULL_PATH'))
+    template = d.getVar("_WKS_TEMPLATE")
+    if template:
+        write_wks_template(template, d.getVar('WKS_FULL_PATH'))
 }
-
-addtask do_prepare_wic_build before do_image_wic
-do_prepare_wic_build[depends] = "${MLPREFIX}${EFI_PROVIDER}:do_deploy virtual/kernel:do_deploy"
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index d98d213..f03fb88 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -11,6 +11,7 @@
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 do_bootdirectdisk[depends] += "${MLPREFIX}systemd-boot:do_deploy"
+do_prepare_wic_build[depends] += "${MLPREFIX}grub-efi:do_deploy"
 
 EFIDIR = "/EFI/BOOT"
 
-- 
2.1.4


