Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BA24C77AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 22 Mar 2017 06:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="79402769"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2017 06:44:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6EB692C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:43:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:28 +0200
Message-Id: <b1e18eba17b1a2b1cba5d25e96b6729c36671f6f.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/10] wic: fix bug in sparse_copy
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:03 -0000

sparse_copy creates output file that is smaller than input
file when input file ends with unmapped blocks.

Used truncate(<input file size>) when output file is created
to ensure the size of output file will always be equal to
the size of input file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/filemap.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 162603e..080668e 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -537,6 +537,7 @@ def sparse_copy(src_fname, dst_fname, offset=0, skip=0):
         dst_file = open(dst_fname, 'r+b')
     except IOError:
         dst_file = open(dst_fname, 'wb')
+        dst_file.truncate(os.path.getsize(src_fname))
 
     for first, last in fmap.get_mapped_ranges(0, fmap.blocks_cnt):
         start = first * fmap.block_size
-- 
2.1.4


