Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5C78678149
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:47 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 25 May 2017 07:47:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="91388281"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 25 May 2017 07:47:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 952A7580394
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:26 +0300
Message-Id: <84beaa130a3f31e4b81b876c452a899f1d9707ec.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495722660.git.ed.bartosh@linux.intel.com>
References: <cover.1495722660.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/11] wic: add Disk._put_part_image method
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
X-List-Received-Date: Thu, 25 May 2017 14:47:47 -0000

This method copies partition image into the wic image.
It will be used in 'wic cp' and 'wic rm' subcommands
to copy changed partition back into wic image.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index f24fb9a..6a4f55f 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -300,6 +300,11 @@ class Disk:
 
         return self._partimages[pnum]
 
+    def _put_part_image(self, pnum):
+        """Put partition image into partitioned image."""
+        sparse_copy(self._partimages[pnum], self.imagepath,
+                    seek=self.partitions[pnum].start)
+
     def dir(self, pnum, path):
         return exec_cmd("{} -i {} ::{}".format(self.mdir,
                                                self._get_part_image(pnum),
-- 
2.1.4


