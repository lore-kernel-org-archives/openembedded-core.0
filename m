Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6824378340
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 23:05:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 16:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,428,1500966000"; d="scan'208";a="1198131749"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2017 16:05:44 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 16:05:41 -0700
Message-Id: <20170922230541.187600-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] qemurunner: print tail qemu log in case bootlog is empty
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
X-List-Received-Date: Fri, 22 Sep 2017 23:05:43 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are cases where the 'while loop' waiting for login prompt fails
and the bootlog variable does not get populated, thus use the the new
qemurunner member (self.msg) which stores all output coming from the qemu
process.

[YOCTO #12113]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 427ae23b1b..6bae3882d6 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -51,6 +51,7 @@ class QemuRunner:
         self.logged = False
         self.thread = None
         self.use_kvm = use_kvm
+        self.msg = ''
 
         self.runqemutime = 120
         self.qemu_pidfile = 'pidfile_'+str(os.getpid())
@@ -79,6 +80,7 @@ class QemuRunner:
             # because is possible to have control characters
             msg = msg.decode("utf-8", errors='ignore')
             msg = re_control_char.sub('', msg)
+            self.msg += msg
             with codecs.open(self.logfile, "a", encoding="utf-8") as f:
                 f.write("%s" % msg)
 
@@ -307,9 +309,12 @@ class QemuRunner:
                         sock.close()
                         stopread = True
 
+
         if not reachedlogin:
             self.logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
-            lines = "\n".join(bootlog.splitlines()[-25:])
+            tail = lambda l: "\n".join(l.splitlines()[-25:])
+            # in case bootlog is empty, use tail qemu log store at self.msg
+            lines = tail(bootlog if bootlog else self.msg)
             self.logger.info("Last 25 lines of text:\n%s" % lines)
             self.logger.info("Check full boot log: %s" % self.logfile)
             self._dump_host()
-- 
2.12.3


