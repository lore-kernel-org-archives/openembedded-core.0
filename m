Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B68C5731E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2016 06:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="942094759"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2016 06:18:15 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 415DD6A4008
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:09 +0300
Message-Id: <377ce26a3c4e75d3f51680a41bb907c80c47273d.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 6/8] wic: add sparse_copy API
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:34 -0000

In order to make wic images sparse sparse_copy function has been
copied from meta-ostro:
https://github.com/kad/meta-ostro/blob/master/meta-ostro/lib/image-dsk.py
This function uses filemap APIs to copy source sparse file into
destination file preserving sparseness.

The function has been modified to satisfy wic requirements:
parameter 'skip' has been added.

[YOCTO #9099]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 1d04328..f8b2ba7 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -529,3 +529,33 @@ def filemap(image, log=None):
         return FilemapFiemap(image, log)
     except ErrorNotSupp:
         return FilemapSeek(image, log)
+
+def sparse_copy(src_fname, dst_fname, offset=0, skip=0):
+    """Efficiently copy sparse file to or into another file."""
+    fmap = filemap(src_fname)
+    try:
+        dst_file = open(dst_fname, 'r+b')
+    except IOError:
+        dst_file = open(dst_fname, 'wb')
+
+    for first, last in fmap.get_mapped_ranges(0, fmap.blocks_cnt):
+        start = first * fmap.block_size
+        end = (last + 1) * fmap.block_size
+
+        if start < skip < end:
+            start = skip
+
+        fmap._f_image.seek(start, os.SEEK_SET)
+        dst_file.seek(offset + start, os.SEEK_SET)
+
+        chunk_size = 1024 * 1024
+        to_read = end - start
+        read = 0
+
+        while read < to_read:
+            if read + chunk_size > to_read:
+                chunk_size = to_read - read
+            chunk = fmap._f_image.read(chunk_size)
+            dst_file.write(chunk)
+            read += chunk_size
+    dst_file.close()
-- 
2.1.4


