Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08C9C71CAA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2017 11:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="818593492"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 11:14:22 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 68F056A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:21 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:25 +0200
Message-Id: <9acb2c3e8e0efddf96c7906ef86658c2d07e1ebe.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/9] wic: partitionedfs: merged __format_disks and create
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:22 -0000

Private method __format_disks is called only from create
method making the code less readable. Merged the code
into one method.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 5fc5765..08ae52f 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -238,7 +238,11 @@ class Image():
 
         return exec_native_cmd(cmd, self.native_sysroot)
 
-    def __format_disks(self):
+    def create(self):
+        for dev in self.disks:
+            disk = self.disks[dev]
+            disk['disk'].create()
+
         self.layout_partitions()
 
         for dev in self.disks:
@@ -375,12 +379,3 @@ class Image():
                 partimage = image_file + '.p%d' % part['num']
                 os.rename(source, partimage)
                 self.partimages.append(partimage)
-
-    def create(self):
-        for dev in self.disks:
-            disk = self.disks[dev]
-            disk['disk'].create()
-
-        self.__format_disks()
-
-        return
-- 
2.1.4


