Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 22C4A78267
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 08 Jun 2017 09:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="112031862"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2017 09:15:28 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8888E5807BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:27 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:57 +0300
Message-Id: <4915ebc9fe84720164e755e398b315237950cf4b.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 15/25] filemap: check if dest is written for every block
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:27 -0000

If lenght parameter is provided to sparse_copy call
it's mandatory to check if the output file is fully
written after reading unmapped block from input file.

If it's not done then sparse_copy can write more data
than specified length.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 8719f44..764dbbe 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -563,6 +563,13 @@ def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
             start = skip
 
         fmap._f_image.seek(start, os.SEEK_SET)
+
+        written += start - skip - written
+        if length and written >= length:
+            dst_file.seek(seek + length, os.SEEK_SET)
+            dst_file.close()
+            return
+
         dst_file.seek(seek + start - skip, os.SEEK_SET)
 
         chunk_size = 1024 * 1024
-- 
2.1.4


