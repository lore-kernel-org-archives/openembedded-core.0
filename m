Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 66C8A7812D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 25 May 2017 07:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="266315160"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 25 May 2017 07:47:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5314D5803B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:45 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:23 +0300
Message-Id: <559a47d7625a1aa5bd980d7a114ad6fbd3626483.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495722660.git.ed.bartosh@linux.intel.com>
References: <cover.1495722660.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/11] filemap: change signature of sparse_copy function
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
X-List-Received-Date: Thu, 25 May 2017 14:47:44 -0000

Renamed parameter offset->skip to match names of dd
parameters.

Changed affected sparse_copy calls.

Added explanation of the parameters to docstring.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py               | 15 ++++++++++++---
 scripts/lib/wic/plugins/imager/direct.py |  2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 8fe302a..8719f44 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -530,9 +530,18 @@ def filemap(image, log=None):
     except ErrorNotSupp:
         return FilemapSeek(image, log)
 
-def sparse_copy(src_fname, dst_fname, offset=0, skip=0,
+def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
                 length=0, api=None):
-    """Efficiently copy sparse file to or into another file."""
+    """
+    Efficiently copy sparse file to or into another file.
+
+    src_fname: path to source file
+    dst_fname: path to destination file
+    skip: skip N bytes at thestart of src
+    seek: seek N bytes from the start of dst
+    length: read N bytes from src and write them to dst
+    api: FilemapFiemap or FilemapSeek object
+    """
     if not api:
         api = filemap
     fmap = api(src_fname)
@@ -554,7 +563,7 @@ def sparse_copy(src_fname, dst_fname, offset=0, skip=0,
             start = skip
 
         fmap._f_image.seek(start, os.SEEK_SET)
-        dst_file.seek(offset + start - skip, os.SEEK_SET)
+        dst_file.seek(seek + start - skip, os.SEEK_SET)
 
         chunk_size = 1024 * 1024
         to_read = end - start
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f2e6127..3cdedd1 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -550,7 +550,7 @@ class PartitionedImage():
             source = part.source_file
             if source:
                 # install source_file contents into a partition
-                sparse_copy(source, self.path, part.start * self.sector_size)
+                sparse_copy(source, self.path, seek=part.start * self.sector_size)
 
                 logger.debug("Installed %s in partition %d, sectors %d-%d, "
                              "size %d sectors", source, part.num, part.start,
-- 
2.1.4


