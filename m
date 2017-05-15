Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BA79271E02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:20:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 May 2017 07:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="86951557"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 07:20:26 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id B49766A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:20:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 16:57:33 +0300
Message-Id: <b705e5ed6fc037f8042450cd1b46c5aae29a9d8d.1494856157.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494856157.git.ed.bartosh@linux.intel.com>
References: <cover.1494856157.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/8] filemap: add parameter 'length' to sparse_copy
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
X-List-Received-Date: Mon, 15 May 2017 14:20:25 -0000

Added parameter 'length' to specify amount of data
to write into destination file. This is useful when only
part of source file should be written into destination file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 585b7ea..8fe302a 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -530,7 +530,8 @@ def filemap(image, log=None):
     except ErrorNotSupp:
         return FilemapSeek(image, log)
 
-def sparse_copy(src_fname, dst_fname, offset=0, skip=0, api=None):
+def sparse_copy(src_fname, dst_fname, offset=0, skip=0,
+                length=0, api=None):
     """Efficiently copy sparse file to or into another file."""
     if not api:
         api = filemap
@@ -541,6 +542,7 @@ def sparse_copy(src_fname, dst_fname, offset=0, skip=0, api=None):
         dst_file = open(dst_fname, 'wb')
         dst_file.truncate(os.path.getsize(src_fname))
 
+    written = 0
     for first, last in fmap.get_mapped_ranges(0, fmap.blocks_cnt):
         start = first * fmap.block_size
         end = (last + 1) * fmap.block_size
@@ -561,7 +563,14 @@ def sparse_copy(src_fname, dst_fname, offset=0, skip=0, api=None):
         while read < to_read:
             if read + chunk_size > to_read:
                 chunk_size = to_read - read
-            chunk = fmap._f_image.read(chunk_size)
+            size = chunk_size
+            if length and written + size > length:
+                size = length - written
+            chunk = fmap._f_image.read(size)
             dst_file.write(chunk)
-            read += chunk_size
+            read += size
+            written += size
+            if written == length:
+                dst_file.close()
+                return
     dst_file.close()
-- 
2.1.4


