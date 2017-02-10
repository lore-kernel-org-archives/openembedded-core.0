Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CE41971ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 10 Feb 2017 07:28:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="932388922"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 10 Feb 2017 07:28:58 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 151446A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:56 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:47 +0200
Message-Id: <f88bcd0cc009543af0e399316c05be32e09021f6.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/13] wic: direct: add PartitionedImage.prepare method
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:57 -0000

Moved code that calls prepare method of Partition objects
from DirectPlugin to PartitionedImage.prepare.

The idea is to have all code that works with partitions
in PartitionedImage class.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 64a3368..9c4109e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -182,12 +182,8 @@ class DirectPlugin(ImagerPlugin):
                     rsize_bb = get_bitbake_var('ROOTFS_SIZE', image_name)
                     if rsize_bb:
                         part.size = int(round(float(rsize_bb)))
-            # need to create the filesystems in order to get their
-            # sizes before we can add them and do the layout.
-            part.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
-                         self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
-            self._image.add_partition(part)
+        self._image.prepare(self)
 
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
@@ -329,15 +325,17 @@ class PartitionedImage():
                 else: # msdos partition table
                     part.uuid = '%0x-%02d' % (self.identifier, part.realnum)
 
-    def add_partition(self, part):
-        """
-        Add the next partition. Partitions have to be added in the
-        first-to-last order.
-        """
-        part.ks_pnum = len(self.partitions)
+    def prepare(self, imager):
+        """Prepare an image. Call prepare method of all image partitions."""
+        for part in self.partitions:
+            # need to create the filesystems in order to get their
+            # sizes before we can add them and do the layout.
+            part.prepare(imager, imager.workdir, imager.oe_builddir,
+                         imager.rootfs_dir, imager.bootimg_dir,
+                         imager.kernel_dir, imager.native_sysroot)
 
-        # Converting kB to sectors for parted
-        part.size_sec = part.disk_size * 1024 // self.sector_size
+            # Converting kB to sectors for parted
+            part.size_sec = part.disk_size * 1024 // self.sector_size
 
     def layout_partitions(self):
         """ Layout the partitions, meaning calculate the position of every
-- 
2.1.4


