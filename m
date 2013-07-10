Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 482DF6A59F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 16:09:41 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2013 09:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1036,1363158000"; d="scan'208";a="329388153"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 10 Jul 2013 09:09:41 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 8B0F76A4092;
	Wed, 10 Jul 2013 09:09:39 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 19:10:24 +0300
Message-Id: <1373472624-26428-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] lib/oeqa/utils/qemurunner.py: increase boot timeout
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
X-List-Received-Date: Wed, 10 Jul 2013 16:09:41 -0000

On a loaded host (such as an AB setup where multiple builds run)
the 200 seconds timeout might not be enough to reach the login prompt,
so use the same value as the qemuimagetest class did.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3132b68..8c74e73 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -49,7 +49,6 @@ class QemuRunner:
         self.runqemu = subprocess.Popen(launch_cmd,shell=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,preexec_fn=os.setpgrp)
 
         bb.note("runqemu started, pid is %s" % self.runqemu.pid)
-        # wait at most 30 seconds until qemu pid appears
         bb.note("waiting at most 60 seconds for qemu pid")
         endtime = time.time() + 60
         while not self.is_alive() and time.time() < endtime:
@@ -59,8 +58,8 @@ class QemuRunner:
             bb.note("qemu started - qemu procces pid is %s" % self.qemupid)
 
             console = oeQemuConsole(self.streampath, self.logfile)
-            bb.note("Waiting at most 200 seconds for login banner")
-            (match, text) = console.read_all_timeout("login:", 200)
+            bb.note("Waiting at most 400 seconds for login banner")
+            (match, text) = console.read_all_timeout("login:", 400)
 
             if match:
                 bb.note("Reached login banner")
@@ -80,7 +79,7 @@ class QemuRunner:
                     return False
             else:
                 console.close()
-                bb.note("Target didn't reached login boot in 120 seconds")
+                bb.note("Target didn't reached login boot in 400 seconds")
                 lines = "\n".join(text.splitlines()[-5:])
                 bb.note("Last 5 lines of text:\n%s" % lines)
                 bb.note("Check full boot log: %s" % self.logfile)
-- 
1.8.1.4


