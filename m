Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC4371E41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:21:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 13 Dec 2016 13:21:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="39677626"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by orsmga004.jf.intel.com with ESMTP; 13 Dec 2016 13:21:19 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 15:27:20 -0600
Message-Id: <1481664440-6184-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] masterimage: ignore return status in case of ssh shutdown command
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
X-List-Received-Date: Tue, 13 Dec 2016 21:21:19 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are reported cases (see bugzilla entry below) where ssh process
is killed by the shutdown command it runs, thus the ssh's return
status is non-zero. To ignore the ssh return status, a context manager decorador
is use together with the 'with' statement, ignoring the status of any command
run inside the later body.

[YOCTO #10101]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 9ce3bf8..1054fb4 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -16,6 +16,7 @@ import bb
 import traceback
 import time
 import subprocess
+from contextlib import contextmanager
 
 import oeqa.targetcontrol
 import oeqa.utils.sshcontrol as sshcontrol
@@ -24,6 +25,15 @@ from oeqa.utils import CommandError
 
 from abc import ABCMeta, abstractmethod
 
+@contextmanager
+def ignorestatus(conn):
+    previous = conn.ignore_status
+    conn.ignore_status = True
+    try:
+        yield conn
+    finally:
+        conn.ignore_status = previous
+
 class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
 
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
@@ -103,8 +113,11 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def power_cycle(self, conn):
         if self.powercontrol_cmd:
-            # be nice, don't just cut power
-            conn.run("shutdown -h now")
+            # be nice, don't just cut power and ignore status just for shutdown cmd
+            # status is ignore because the ssh connection may be killed by the
+            # shutdown process, thus yielding a non-zero exit status
+            with c = ignorestatus(conn):
+                c.run("shutdown -h now")
             time.sleep(10)
             self.power_ctl("cycle")
         else:
-- 
2.1.4


