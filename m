Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8AB78049
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="897215377"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2017 04:55:36 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CBAD85809EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:35 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:37 +0300
Message-Id: <f01df5759f1d1783b6dee9e9954fadf3d93da78b.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/7] wic: implement ext fs support for 'wic cp'
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
X-List-Received-Date: Tue, 05 Sep 2017 11:55:35 -0000

Implemented copying files to the ext partition
using debugfs tool.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index c6a63f2080a..9ebd93ae278 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -325,10 +325,15 @@ class Disk:
 
     def copy(self, src, pnum, path):
         """Copy partition image into wic image."""
-        cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
-                                              self._get_part_image(pnum),
-                                              src, path)
-        exec_cmd(cmd)
+        if self.partitions[pnum].fstype.startswith('ext'):
+            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
+                      format(path, src, os.path.basename(src),
+                             self.debugfs, self._get_part_image(pnum))
+        else: # fat
+            cmd = "{} -i {} -snop {} ::{}".format(self.mcopy,
+                                                  self._get_part_image(pnum),
+                                                  src, path)
+        exec_cmd(cmd, as_shell=True)
         self._put_part_image(pnum)
 
     def remove(self, pnum, path):
-- 
2.13.5


