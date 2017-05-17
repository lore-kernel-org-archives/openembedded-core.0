Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACE877DCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:40:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1131384338"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2017 06:40:12 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 285406A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:39:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:39:46 +0000
Message-Id: <499ee0ee026d7315652c960717c20b163a4772dc.1495028274.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028274.git.ed.bartosh@linux.intel.com>
References: <cover.1495028274.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/8] filemap: fix skip logic
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
X-List-Received-Date: Wed, 17 May 2017 13:40:11 -0000

Fixed bug in processing 'skip' parameter:
   don't read input file if end of bmap block is less than skip

Simplified logic of positioning to the start of data inside a
partially skipped bmap block.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 1f1aacc522..585b7ea84e 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -545,11 +545,14 @@ def sparse_copy(src_fname, dst_fname, offset=0, skip=0, api=None):
         start = first * fmap.block_size
         end = (last + 1) * fmap.block_size
 
+        if skip >= end:
+            continue
+
         if start < skip < end:
-            fmap._f_image.seek(skip, os.SEEK_SET)
-        else:
-            fmap._f_image.seek(start, os.SEEK_SET)
-        dst_file.seek(offset + start, os.SEEK_SET)
+            start = skip
+
+        fmap._f_image.seek(start, os.SEEK_SET)
+        dst_file.seek(offset + start - skip, os.SEEK_SET)
 
         chunk_size = 1024 * 1024
         to_read = end - start
-- 
2.12.0


