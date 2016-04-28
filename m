Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C8AC260761
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:34:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2016 02:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="794125698"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 28 Apr 2016 02:34:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1E8D46A4007;
	Thu, 28 Apr 2016 03:22:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 10:14:52 +0300
Message-Id: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 1/6] wic: use truncate utility to create sparse file
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
X-List-Received-Date: Thu, 28 Apr 2016 09:34:53 -0000

Used truncate instead of dd to create wic image for the
following reasons:
 - truncate syntax is much more clear
 - dd requires additional calculations of the image size
   in blocks
 - the way dd was used in the code is not entirely correct.
   It was still writing one block to the file, which made it not
   100% sparse.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/fs_related.py | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 2e74461..2658dcf 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -71,14 +71,8 @@ class DiskImage(Disk):
     def create(self):
         if self.device is not None:
             return
-
-        blocks = self.size / 1024
-        if self.size - blocks * 1024:
-            blocks += 1
-
-        # create disk image
-        dd_cmd = "dd if=/dev/zero of=%s bs=1024 seek=%d count=1" % \
-            (self.image_file, blocks)
-        exec_cmd(dd_cmd)
+        # create sparse disk image
+        cmd = "truncate %s -s %s" % (self.image_file, self.size)
+        exec_cmd(cmd)
 
         self.device = self.image_file
-- 
2.1.4


