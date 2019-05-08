Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86DF67D6A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 07:11:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2019 00:11:54 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 00:11:54 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 14:41:00 +0800
Message-Id: <1557297662-16300-3-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
References: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 2/4] wic: bootimg-efi: add label source parameter
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
X-List-Received-Date: Wed, 08 May 2019 07:11:53 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

Add new source parameter label to allow boot.conf/grub.cfg label option
to set as "install-efi", so far it's hardcoded to "Boot".

The label remain to "Boot" for systemd-boot or blank for grub-efi whenever
label are not "install-efi".

when label set to "install-efi" the image can boot into image installation.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 83a7e18..0a0c5bd 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -86,9 +86,14 @@ class BootimgEFIPlugin(SourcePlugin):
             grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
 
             kernel = "/bzImage"
+            label = source_params.get('label')
 
-            grubefi_conf += "linux %s root=%s rootwait %s\n" \
-                % (kernel, creator.rootdev, bootloader.append)
+            if label == "install-efi":
+                grubefi_conf += "linux %s LABEL=%s rootwait %s\n" \
+                    % (kernel, label, bootloader.append)
+            else:
+                grubefi_conf += "linux %s root=%s rootwait %s\n" \
+                    % (kernel, creator.rootdev, bootloader.append)
 
             if initrd:
                grubefi_conf += "initrd /%s\n" % initrd
@@ -154,12 +159,17 @@ class BootimgEFIPlugin(SourcePlugin):
             # Create systemd-boot configuration using parameters from wks file
             kernel = "/bzImage"
             title = source_params.get('title')
-
+            label = source_params.get('label')
             boot_conf = ""
             boot_conf += "title %s\n" % (title if title else "boot")
             boot_conf += "linux %s\n" % kernel
-            boot_conf += "options LABEL=Boot root=%s %s\n" % \
-                             (creator.rootdev, bootloader.append)
+
+            if label == "install-efi":
+                boot_conf += "options LABEL=%s %s\n" % \
+                                (label, bootloader.append)
+            else:
+                boot_conf += "options LABEL=Boot root=%s %s\n" % \
+                                 (creator.rootdev, bootloader.append)
 
             if initrd:
                 boot_conf += "initrd /%s\n" % initrd
-- 
2.7.4


