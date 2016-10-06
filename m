Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 18C2F6078D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:59:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Oct 2016 03:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="769506486"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2016 03:59:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id CA0036A4006;
	Thu,  6 Oct 2016 03:59:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 13:33:36 +0300
Message-Id: <8b11adbb2e4f224e382b21d60087a8065a092997.1475749929.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1475749929.git.ed.bartosh@linux.intel.com>
References: <cover.1475749929.git.ed.bartosh@linux.intel.com>
Cc: Saul Wold <saul.wold@intel.com>
Subject: [wic][PATCH 2/4] wic: generate PARTUUID for MDOS partitions
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
X-List-Received-Date: Thu, 06 Oct 2016 10:59:40 -0000

Added generation of partition UUIDs for MSDOS partitions.
UUID for MSDOS partitions is <disk identifier>-<partition number>,
where disk identifier is a random 4 bytes long number. It's usually
generated when MBR/partition table is initialized.

As UUID is used to point to the root partition in bootloader config
we need to generate it before the MBR is initialized.
After MBR is created we need to rewrite system identifier to match
it with what is used in bootloader config. This will be implemented
in the next commit.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 14 +++++++++++++-
 scripts/lib/wic/partition.py     |  3 ---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index ffde232..123a078 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -26,6 +26,7 @@
 
 import os
 import shutil
+import uuid
 
 from wic import msger
 from wic.utils.oe.misc import get_bitbake_var
@@ -242,12 +243,23 @@ class DirectImageCreator(BaseImageCreator):
 
         self.__image = Image(self.native_sysroot)
 
-        for part in parts:
+        disk_ids = {}
+        for num, part in enumerate(parts, 1):
             # as a convenience, set source to the boot partition source
             # instead of forcing it to be set via bootloader --source
             if not self.ks.bootloader.source and part.mountpoint == "/boot":
                 self.ks.bootloader.source = part.source
 
+            # generate parition UUIDs
+            if not part.uuid and part.use_uuid:
+                if self.ptable_format == 'gpt':
+                    part.uuid = str(uuid.uuid4())
+                else: # msdos partition table
+                    if part.disk not in disk_ids:
+                        disk_ids[part.disk] = int.from_bytes(os.urandom(4), 'little')
+                    disk_id = disk_ids[part.disk]
+                    part.uuid = '%0x-%02d' % (disk_id, self.__get_part_num(num, parts))
+
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         shutil.rmtree(self.workdir)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 30cd320..90f65a1 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -26,7 +26,6 @@
 
 import os
 import tempfile
-import uuid
 
 from wic.utils.oe.misc import msger, parse_sourceparams
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd
@@ -60,8 +59,6 @@ class Partition():
         self.system_id = args.system_id
         self.use_uuid = args.use_uuid
         self.uuid = args.uuid
-        if args.use_uuid and not self.uuid:
-            self.uuid = str(uuid.uuid4())
 
         self.lineno = lineno
         self.source_file = ""
-- 
2.1.4


