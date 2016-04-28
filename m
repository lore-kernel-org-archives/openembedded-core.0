Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9EAA76710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2016 06:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="964624083"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2016 06:18:15 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 4EEC86A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:10 +0300
Message-Id: <ae7cc768e784a894eae3f0fbd74a11f68dda5756.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 7/8] wic: use sparse_copy to copy partitions
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:22 -0000

Copied partition images into final partitioned image using
sparse_copy API. This method preserves sparseness of the
final image. It also makes wic much faster, as unmapped
blocks of the partition images are not copied.

[YOCTO #9099]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index ad596d2..1b3870f 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -22,6 +22,7 @@ import os
 from wic import msger
 from wic.utils.errors import ImageError
 from wic.utils.oe.misc import exec_cmd, exec_native_cmd
+from wic.filemap import sparse_copy
 
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
@@ -338,10 +339,7 @@ class Image(object):
             source = part['source_file']
             if source:
                 # install source_file contents into a partition
-                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
-                      (source, image_file, self.sector_size,
-                       part['start'], part['size'])
-                exec_cmd(cmd)
+                sparse_copy(source, image_file, part['start'] * self.sector_size)
 
                 msger.debug("Installed %s in partition %d, sectors %d-%d, "
                             "size %d sectors" % \
-- 
2.1.4


