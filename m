Return-Path: <chee.yang.lee@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2017E024
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 07:30:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 May 2019 00:30:51 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 30 May 2019 00:30:50 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 15:30:49 +0800
Message-Id: <1559201449-16076-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wic: bootimg-efi: add label source parameter
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
X-List-Received-Date: Thu, 30 May 2019 07:30:50 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

Add new source parameter label to allow custom boot.conf/grub.cfg label,
so far it's hardcoded to "Boot".

Default label to "Boot" for systemd-boot and blank for grub-efi when source
parameter label are not set.

Signed-off-by: Chee Yang Lee <chee.yang.lee at intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 652323f..70cc1b0 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -73,8 +73,13 @@ class BootimgEFIPlugin(SourcePlugin):
 
             kernel = "/bzImage"
 
-            grubefi_conf += "linux %s root=%s rootwait %s\n" \
-                % (kernel, creator.rootdev, bootloader.append)
+            label = source_params.get('label')
+            label_conf = "root=%s" % creator.rootdev
+            if label:
+                label_conf = "LABEL=%s" % label
+
+            grubefi_conf += "linux %s %s rootwait %s\n" \
+                % (kernel, label_conf, bootloader.append)
 
             if initrd:
                grubefi_conf += "initrd /%s\n" % initrd
@@ -144,8 +149,14 @@ class BootimgEFIPlugin(SourcePlugin):
             boot_conf = ""
             boot_conf += "title %s\n" % (title if title else "boot")
             boot_conf += "linux %s\n" % kernel
-            boot_conf += "options LABEL=Boot root=%s %s\n" % \
-                             (creator.rootdev, bootloader.append)
+
+            label = source_params.get('label')
+            label_conf = "LABEL=Boot root=%s" % creator.rootdev
+            if label:
+                label_conf = "LABEL=%s" % label
+
+            boot_conf += "options %s %s\n" % \
+                             (label_conf, bootloader.append)
 
             if initrd:
                 boot_conf += "initrd /%s\n" % initrd
-- 
2.7.4


