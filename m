Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B4F6978519
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 19:23:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2017 12:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,384,1500966000"; d="scan'208";a="1171586558"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2017 12:23:24 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 12:23:27 -0700
Message-Id: <1505244207-79728-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] qemurunner.py: wait for PID to appear in procfs
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
X-List-Received-Date: Tue, 12 Sep 2017 19:23:23 -0000

We need QEMU PID in order to access "/proc/<qemupid>/cmdline"
Having a valid QEMU PID does not mean we can access the proc entry
immediately, we need to wait for the /proc/<qemupid> to appear
before we can access it.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 9073315..427ae23 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -394,9 +394,10 @@ class QemuRunner:
             f = open(self.qemu_pidfile, 'r')
             qemu_pid = f.read()
             f.close()
-            #logger.info("qemu_pid: %s" % qemu_pid)
-            self.qemupid = int(qemu_pid)
-            return True
+            qemupid = int(qemu_pid)
+            if os.path.exists("/proc/" + str(qemupid)):
+                self.qemupid = qemupid
+                return True
         return False
 
     def run_serial(self, command, raw=False, timeout=5):
-- 
2.7.4


