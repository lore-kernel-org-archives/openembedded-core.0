Return-Path: <chee.yang.lee@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A8F937E7E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:41:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2019 01:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="164964762"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 19 Jun 2019 01:41:10 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 16:41:09 +0800
Message-Id: <1560933669-42014-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wic/bootimg-efi: allow multiple initrd
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
X-List-Received-Date: Wed, 19 Jun 2019 08:41:10 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

Allow plugin bootimg-efi to configure with multiple initrd
through source parameter.

Uses ; to separate each initrd.

e.g:
--sourceparams="loader=${EFI_PROVIDER},initrd=initrd1;initrd2"

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index d87db1f..5cc5c8a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -55,8 +55,10 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
-            exec_cmd(cp_cmd, True)
+            initrds = initrd.split(';')
+            for rd in initrds:
+                cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
+                exec_cmd(cp_cmd, True)
         else:
             logger.debug("Ignoring missing initrd")
 
@@ -84,7 +86,11 @@ class BootimgEFIPlugin(SourcePlugin):
                 % (kernel, label_conf, bootloader.append)
 
             if initrd:
-               grubefi_conf += "initrd /%s\n" % initrd
+                initrds = initrd.split(';')
+                grubefi_conf += "initrd"
+                for rd in initrds:
+                    grubefi_conf += " /%s" % rd
+                grubefi_conf += "\n"
 
             grubefi_conf += "}\n"
 
@@ -119,8 +125,10 @@ class BootimgEFIPlugin(SourcePlugin):
             if not bootimg_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-            cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
-            exec_cmd(cp_cmd, True)
+            initrds = initrd.split(';')
+            for rd in initrds:
+                cp_cmd = "cp %s/%s %s" % (bootimg_dir, rd, hdddir)
+                exec_cmd(cp_cmd, True)
         else:
             logger.debug("Ignoring missing initrd")
 
@@ -164,7 +172,9 @@ class BootimgEFIPlugin(SourcePlugin):
                              (label_conf, bootloader.append)
 
             if initrd:
-                boot_conf += "initrd /%s\n" % initrd
+                initrds = initrd.split(';')
+                for rd in initrds:
+                    boot_conf += "initrd /%s\n" % rd
 
         logger.debug("Writing systemd-boot config "
                      "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
-- 
2.7.4


