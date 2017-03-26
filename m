Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFBA71A0C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 15:29:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 26 Mar 2017 08:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,227,1486454400"; d="scan'208";a="1147130967"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2017 08:29:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D351E6A4006;
	Sun, 26 Mar 2017 08:29:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Mar 2017 18:28:04 +0300
Message-Id: <1490542084-4372-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: fix generation of partition UUID
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
X-List-Received-Date: Sun, 26 Mar 2017 15:29:20 -0000

Partition UUID for msdos partitioning is based on a 4 bytes long
system identifier. Wic uses random number to generate system
identifier. For the numbers starting with 0 partition uuid is
shorter, which makes wic images non-bootable as kernel expects
8 charactest in PARTUUID parameter.

Padded system identifier with '0' when generating partition UUID
to make it always 8 characters long. This should fix the boot
issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7d38ab3..67fd183 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -323,7 +323,7 @@ class PartitionedImage():
                 if self.ptable_format == 'gpt':
                     part.uuid = str(uuid.uuid4())
                 else: # msdos partition table
-                    part.uuid = '%0x-%02d' % (self.identifier, part.realnum)
+                    part.uuid = '%08x-%02d' % (self.identifier, part.realnum)
 
     def prepare(self, imager):
         """Prepare an image. Call prepare method of all image partitions."""
-- 
2.1.4


