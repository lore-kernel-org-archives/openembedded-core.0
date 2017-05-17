Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 58C9177DD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:40:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="101715253"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 17 May 2017 06:40:20 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 787D26A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:40:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:39:47 +0000
Message-Id: <df9cf94844cf4f74ed1e308080eeeff1df0cef30.1495028274.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028274.git.ed.bartosh@linux.intel.com>
References: <cover.1495028274.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 2/8] filemap: add parameter 'length' to sparse_copy
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
X-List-Received-Date: Wed, 17 May 2017 13:40:19 -0000

Added parameter 'length' to specify amount of data
to write into destination file. This is useful when only
part of source file should be written into destination file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 585b7ea84e..8fe302ab49 100644
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
2.12.0


