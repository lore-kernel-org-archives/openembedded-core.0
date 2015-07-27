Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 233B97630C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926381"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:00 +0100
Message-Id: <81ab80e63332d67f2a3caed6ade59617425e26af.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/11] oeqa/utils/qemurunner: fix error handling if runqemu exits with an error
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:13 -0000

* Don't wait for QEMU to start if it's never going to (because runqemu
  exited with an error)
* Don't error out if killing the process fails with "no such process"
  (we don't care if it's already dead)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 11186d6..71da21c 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -12,6 +12,7 @@ import signal
 import re
 import socket
 import select
+import errno
 
 import logging
 logger = logging.getLogger("BitBake.QemuRunner")
@@ -104,6 +105,14 @@ class QemuRunner:
         logger.info("waiting at most %s seconds for qemu pid" % self.runqemutime)
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
+            if self.runqemu.poll():
+                if self.runqemu.returncode:
+                    # No point waiting any longer
+                    logger.info('runqemu exited with code %d' % self.runqemu.returncode)
+                    output = self.runqemu.stdout
+                    self.stop()
+                    logger.info("Output from runqemu:\n%s" % output.read())
+                    return False
             time.sleep(1)
 
         if self.is_alive():
@@ -169,7 +178,11 @@ class QemuRunner:
 
         if self.runqemu:
             logger.info("Sending SIGTERM to runqemu")
-            os.killpg(self.runqemu.pid, signal.SIGTERM)
+            try:
+                os.killpg(self.runqemu.pid, signal.SIGTERM)
+            except OSError as e:
+                if e.errno != errno.ESRCH:
+                    raise
             endtime = time.time() + self.runqemutime
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
-- 
2.1.0


