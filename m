Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5D39371AB7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="978408143"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Jun 2017 09:15:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6023358029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:43 +0300
Message-Id: <e4cb97bd2fa584a1b7d66afae958b4a514a52f22.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/25] filemap: fix skip logic
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:02 -0000

Fixed bug in processing 'skip' parameter:
   don't read input file if end of bmap block is less than skip

Simplified logic of positioning to the start of data inside a
partially skipped bmap block.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 1f1aacc..585b7ea 100644
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
2.1.4


