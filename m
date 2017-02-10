Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9718B77392
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="1093210351"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2017 07:28:56 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E683C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:54 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:45 +0200
Message-Id: <6e642331d7ac3ed011da5ac06b4eb850acc4e706.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/13] wic: direct: move UUID generation to PartitionedImage
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:55 -0000

Moved code that generates partition UUIDs from DirectPlugin to
PartitionedImage class as it's more logical to have it there.
This allows the code to be reused by other imager plugins.

Got rid of having yet another list of partitions in PartitionedImage.
Reused the list passed from DirectPlugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index ffe6c84..18cd277 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -158,7 +158,7 @@ class DirectPlugin(ImagerPlugin):
         """
         image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
         self._image = PartitionedImage(image_path, self.ptable_format,
-                                       self.native_sysroot)
+                                       self.parts, self.native_sysroot)
 
         for part in self.parts:
             # as a convenience, set source to the boot partition source
@@ -166,13 +166,6 @@ class DirectPlugin(ImagerPlugin):
             if not self.ks.bootloader.source and part.mountpoint == "/boot":
                 self.ks.bootloader.source = part.source
 
-            # generate parition UUIDs
-            if not part.uuid and part.use_uuid:
-                if self.ptable_format == 'gpt':
-                    part.uuid = str(uuid.uuid4())
-                else: # msdos partition table
-                    part.uuid = '%0x-%02d' % (self._image.identifier, part.realnum)
-
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
@@ -310,7 +303,7 @@ class PartitionedImage():
     Partitioned image in a file.
     """
 
-    def __init__(self, path, ptable_format, native_sysroot=None):
+    def __init__(self, path, ptable_format, partitions, native_sysroot=None):
         self.path = path  # Path to the image file
         self.numpart = 0  # Number of allocated partitions
         self.realpart = 0 # Number of partitions in the partition table
@@ -321,12 +314,20 @@ class PartitionedImage():
         # Disk system identifier
         self.identifier = int.from_bytes(os.urandom(4), 'little')
 
-        self.partitions = []
+        self.partitions = partitions
         self.partimages = []
         # Size of a sector used in calculations
         self.sector_size = SECTOR_SIZE
         self.native_sysroot = native_sysroot
 
+        # generate parition UUIDs
+        for part in self.partitions:
+            if not part.uuid and part.use_uuid:
+                if self.ptable_format == 'gpt':
+                    part.uuid = str(uuid.uuid4())
+                else: # msdos partition table
+                    part.uuid = '%0x-%02d' % (self.identifier, part.realnum)
+
     def add_partition(self, part):
         """
         Add the next partition. Partitions have to be added in the
@@ -337,8 +338,6 @@ class PartitionedImage():
         # Converting kB to sectors for parted
         part.size_sec = part.disk_size * 1024 // self.sector_size
 
-        self.partitions.append(part)
-
     def layout_partitions(self):
         """ Layout the partitions, meaning calculate the position of every
         partition on the disk. The 'ptable_format' parameter defines the
-- 
2.1.4


