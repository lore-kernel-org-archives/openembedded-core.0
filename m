Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB4F7D4DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 04:07:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 May 2019 21:07:11 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga004.fm.intel.com with ESMTP; 12 May 2019 21:07:10 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 12:07:09 +0800
Message-Id: <1557720429-21169-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wic/bootimg-efi: replace hardcoded volume name with label
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
X-List-Received-Date: Mon, 13 May 2019 04:07:11 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

volume name should refer to --label in .wks.
Replace the hardcoded volume name  with label.
set "ESP" as default name when no lable specified.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index a7d513c..9b324d3 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -254,8 +254,10 @@ class BootimgEFIPlugin(SourcePlugin):
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
-        dosfs_cmd = "mkdosfs -n efi -i %s -C %s %d" % \
-                    (part.fsuuid, bootimg, blocks)
+        label = part.label if part.label else "ESP"
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d" % \
+                    (label, part.fsuuid, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
-- 
2.7.4


