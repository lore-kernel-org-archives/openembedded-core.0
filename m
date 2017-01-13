Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20E6771E01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 22:37:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2017 14:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,223,1477983600"; d="scan'208";a="53643604"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2017 14:37:32 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:33:55 +0000
Message-Id: <2eb56b91056eeb1ff5469731d038aa8755273025.1484317844.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484317844.git.mariano.lopez@linux.intel.com>
References: <cover.1484317844.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1484317844.git.mariano.lopez@linux.intel.com>
References: <cover.1484317844.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] oeqa/utils/qemurunner.py: Be sure to stop qemu-system
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
X-List-Received-Date: Fri, 13 Jan 2017 22:37:33 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When runqemu fails, qemu-system process would keep running
and won't be killed, setpgrp() was used when runqemu was
a shell script but it seems it doesn't work always with python.

This would kill qemu-system explicity and to avoid leaving
it behind.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass    | 2 ++
 meta/lib/oeqa/utils/qemurunner.py | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 770ec80..7eb4038 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -171,6 +171,8 @@ def testimage_main(d):
             bb.plain(msg)
         else:
             bb.fatal("%s - FAILED - check the task log and the ssh log" % pn)
+    except BlockingIOError as err:
+        bb.error('runqemu failed, shutting down...')
     finally:
         signal.signal(signal.SIGTERM, tc.origsigtermhandler)
         target.stop()
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6927456..21bc35a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -296,6 +296,7 @@ class QemuRunner:
 
     def stop(self):
         self.stop_thread()
+        self.stop_qemu_system()
         if hasattr(self, "origchldhandler"):
             signal.signal(signal.SIGCHLD, self.origchldhandler)
         if self.runqemu:
@@ -320,6 +321,14 @@ class QemuRunner:
         self.qemupid = None
         self.ip = None
 
+    def stop_qemu_system(self):
+        if self.qemupid:
+            try:
+                # qemu-system behaves well and a SIGTERM is enough
+                os.kill(self.qemupid, signal.SIGTERM)
+            except ProcessLookupError as e:
+                logger.warn('qemu-system ended unexpectedly')
+
     def stop_thread(self):
         if self.thread and self.thread.is_alive():
             self.thread.stop()
-- 
2.6.6


