Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CBE8278341
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 04:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="98869762"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2017 04:24:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 690365800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:04 +0300
Message-Id: <7032088c4b31ede07c6c1d8cf6ad9003b16366d9.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 16/26] filemap: check if dest is written for every block
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:15 -0000

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


