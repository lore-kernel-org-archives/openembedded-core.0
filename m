Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C7E9660589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 07:40:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 00:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,374,1496127600"; d="scan'208";a="1173382288"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2017 00:40:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 857B858038F;
	Mon, 17 Jul 2017 00:40:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 10:16:21 +0300
Message-Id: <1500275781-22939-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [pyro][PATCH] wic: fix calculation of partition number
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
X-List-Received-Date: Mon, 17 Jul 2017 07:40:09 -0000

Total number of partitions should be taken into account when calculating
real partition number for msdos partition table. The number can be
different for the 4th partition: it can be 4 if there are 4 partitions in
the table and 5 if there are more than 4 partitions in the table. In the
latter case number 4 is occupied by extended partition.

[YOCTO #11790]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index f2e6127..31d07ba 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -312,7 +312,7 @@ class PartitionedImage():
                 part.realnum = 0
             else:
                 realnum += 1
-                if self.ptable_format == 'msdos' and realnum > 3:
+                if self.ptable_format == 'msdos' and realnum > 3 and len(partitions) > 4:
                     part.realnum = realnum + 1
                     continue
                 part.realnum = realnum
-- 
2.1.4


