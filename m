Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 29FBA65D48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 04:02:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2018 21:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,377,1526367600"; d="scan'208";a="57979317"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.63])
	by orsmga007.jf.intel.com with ESMTP; 19 Jul 2018 21:02:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 12:02:27 +0800
Message-Id: <20180720040227.10504-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [rocko][PATCH] wic: if we can't get from ioctl, try from os.stat()
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
X-List-Received-Date: Fri, 20 Jul 2018 04:02:46 -0000

From: Dogukan Ergun <dogukan.ergun@gmail.com>

Under some conditions, ioctl FIGETBSZ can't return real value.
We can try to use fallback via os.stat() to get block size.

Source of patch:
https://github.com/intel/bmap-tools/commit/17365f4fe9089df7ee9800a2a0ced177ec4798a4

Fixes [YOCTO #12319]

Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/filemap.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 77e32b9add..a72fa09ef5 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -37,7 +37,15 @@ def get_block_size(file_obj):
     # Get the block size of the host file-system for the image file by calling
     # the FIGETBSZ ioctl (number 2).
     binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
-    return struct.unpack('I', binary_data)[0]
+    bsize = struct.unpack('I', binary_data)[0]
+    if not bsize:
+        import os
+        stat = os.fstat(file_obj.fileno())
+        if hasattr(stat, 'st_blksize'):
+            bsize = stat.st_blksize
+        else:
+            raise IOError("Unable to determine block size")
+    return bsize
 
 class ErrorNotSupp(Exception):
     """
-- 
2.17.1


