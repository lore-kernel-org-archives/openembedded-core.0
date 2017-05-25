Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 90D0E78142
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 07:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="1134679176"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 25 May 2017 07:47:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7F4E6580363
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:25 +0300
Message-Id: <dc4c8b594390ac84bbde1fa978c4d0bbbf46ca63.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495722660.git.ed.bartosh@linux.intel.com>
References: <cover.1495722660.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/11] filemap: calculate dst size correctly
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
X-List-Received-Date: Thu, 25 May 2017 14:47:49 -0000

Fixed calculation of the dst file size using skip, seek and
length parameters. Current code does it incorrectly which
causes sparse_copy API to create unnecessary big output files.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 764dbbe..6d11355 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -549,7 +549,11 @@ def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
         dst_file = open(dst_fname, 'r+b')
     except IOError:
         dst_file = open(dst_fname, 'wb')
-        dst_file.truncate(os.path.getsize(src_fname))
+        if length:
+            dst_size = length + seek
+        else:
+            dst_size = os.path.getsize(src_fname) + seek - skip
+        dst_file.truncate(dst_size)
 
     written = 0
     for first, last in fmap.get_mapped_ranges(0, fmap.blocks_cnt):
-- 
2.1.4


