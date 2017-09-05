Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C200D78067
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 11:55:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 04:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,480,1498546800"; d="scan'208";a="1169243884"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2017 04:55:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DCB405809EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:55:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 14:54:38 +0300
Message-Id: <0031f028b6900418d8c2474f9e7fd0cfb6cc5e73.1504611134.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <cover.1504611134.git.ed.bartosh@linux.intel.com>
References: <cover.1504611134.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/7] wic: implement ext fs support for 'wic rm'
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

Implemented removing files or directories from the ext
partition using debugfs tool.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9ebd93ae278..edcfab39ef5 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -339,18 +339,23 @@ class Disk:
     def remove(self, pnum, path):
         """Remove files/dirs from the partition."""
         partimg = self._get_part_image(pnum)
-        cmd = "{} -i {} ::{}".format(self.mdel, partimg, path)
-        try:
-            exec_cmd(cmd)
-        except WicError as err:
-            if "not found" in str(err) or "non empty" in str(err):
-                # mdel outputs 'File ... not found' or 'directory .. non empty"
-                # try to use mdeltree as path could be a directory
-                cmd = "{} -i {} ::{}".format(self.mdeltree,
-                                             partimg, path)
+        if self.partitions[pnum].fstype.startswith('ext'):
+            exec_cmd("{} {} -wR 'rm {}'".format(self.debugfs,
+                                                self._get_part_image(pnum),
+                                                path), as_shell=True)
+        else: # fat
+            cmd = "{} -i {} ::{}".format(self.mdel, partimg, path)
+            try:
                 exec_cmd(cmd)
-            else:
-                raise err
+            except WicError as err:
+                if "not found" in str(err) or "non empty" in str(err):
+                    # mdel outputs 'File ... not found' or 'directory .. non empty"
+                    # try to use mdeltree as path could be a directory
+                    cmd = "{} -i {} ::{}".format(self.mdeltree,
+                                                 partimg, path)
+                    exec_cmd(cmd)
+                else:
+                    raise err
         self._put_part_image(pnum)
 
     def write(self, target, expand):
-- 
2.13.5


