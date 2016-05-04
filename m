Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 18883731D7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 15:27:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 May 2016 08:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,577,1455004800"; d="scan'208";a="946152266"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2016 08:27:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 640A66A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 09:15:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 16:06:24 +0300
Message-Id: <066f30ad73efb6b4e02df0efe04187db589edb88.1462365339.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462365339.git.ed.bartosh@linux.intel.com>
References: <cover.1462365339.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 11/14] wic: use // operator instead of /
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
X-List-Received-Date: Wed, 04 May 2016 15:27:51 -0000

Division operator works differently in Python 3. It results in
float unlike in Python 2, where it results in int.
Explicitly used "floor division" operator instead of 'division'
operator. This should make the code to result in integer under
both pythons.

[YOCTO #9412]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py             | 14 +++++++-------
 scripts/lib/wic/utils/partitionedfs.py |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index f8b2ba7..2778be5 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -95,7 +95,7 @@ class _FilemapBase(object):
                         % (self._image_path, err))
 
         self.blocks_cnt = self.image_size + self.block_size - 1
-        self.blocks_cnt /= self.block_size
+        self.blocks_cnt //= self.block_size
 
         try:
             self._f_image.flush()
@@ -254,7 +254,7 @@ class FilemapSeek(_FilemapBase):
         if offs == -1:
             result = False
         else:
-            result = (offs / self.block_size == block)
+            result = (offs // self.block_size == block)
 
         self._log.debug("FilemapSeek: block_is_mapped(%d) returns %s"
                         % (block, result))
@@ -286,8 +286,8 @@ class FilemapSeek(_FilemapBase):
             if end > limit:
                 end = limit
 
-            start_blk = start / self.block_size
-            end_blk = end / self.block_size - 1
+            start_blk = start // self.block_size
+            end_blk = end // self.block_size - 1
             self._log.debug("FilemapSeek: yielding range (%d, %d)"
                             % (start_blk, end_blk))
             yield (start_blk, end_blk)
@@ -351,7 +351,7 @@ class FilemapFiemap(_FilemapBase):
 
         # Calculate how many 'struct fiemap_extent' elements fit the buffer
         self._buf_size -= _FIEMAP_SIZE
-        self._fiemap_extent_cnt = self._buf_size / _FIEMAP_EXTENT_SIZE
+        self._fiemap_extent_cnt = self._buf_size // _FIEMAP_EXTENT_SIZE
         assert self._fiemap_extent_cnt > 0
         self._buf_size = self._fiemap_extent_cnt * _FIEMAP_EXTENT_SIZE
         self._buf_size += _FIEMAP_SIZE
@@ -456,11 +456,11 @@ class FilemapFiemap(_FilemapBase):
                 # Start of the extent
                 extent_start = fiemap_extent[0]
                 # Starting block number of the extent
-                extent_block = extent_start / self.block_size
+                extent_block = extent_start // self.block_size
                 # Length of the extent
                 extent_len = fiemap_extent[2]
                 # Count of blocks in the extent
-                extent_count = extent_len / self.block_size
+                extent_count = extent_len // self.block_size
 
                 # Extent length and offset have to be block-aligned
                 assert extent_start % self.block_size == 0
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 8f4db4e..46b5d34 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -95,7 +95,7 @@ class Image():
         ks_pnum = len(self.partitions)
 
         # Converting kB to sectors for parted
-        size = size * 1024 / self.sector_size
+        size = size * 1024 // self.sector_size
 
         part = {'ks_pnum': ks_pnum, # Partition number in the KS file
                 'size': size, # In sectors
@@ -173,12 +173,12 @@ class Image():
                 # gaps we could enlargea the previous partition?
 
                 # Calc how much the alignment is off.
-                align_sectors = disk['offset'] % (part['align'] * 1024 / self.sector_size)
+                align_sectors = disk['offset'] % (part['align'] * 1024 // self.sector_size)
 
                 if align_sectors:
                     # If partition is not aligned as required, we need
                     # to move forward to the next alignment point
-                    align_sectors = (part['align'] * 1024 / self.sector_size) - align_sectors
+                    align_sectors = (part['align'] * 1024 // self.sector_size) - align_sectors
 
                     msger.debug("Realignment for %s%s with %s sectors, original"
                                 " offset %s, target alignment is %sK." %
-- 
2.1.4


