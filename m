Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2973E6F738
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 12:11:15 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Mar 2014 05:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,630,1389772800"; d="scan'208";a="346703736"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Mar 2014 05:11:15 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id C43CB6A4007;
	Tue, 11 Mar 2014 05:11:02 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 14:11:08 +0200
Message-Id: <1394539868-9054-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/utils/qemurunner: use the right kill call so we don't send SIGTERM to bitbake-worker
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
X-List-Received-Date: Tue, 11 Mar 2014 12:11:18 -0000

After recent bitbake-worker changes [1] this was killing the bitbake-worker,
which isn't what we want and kill(-pid) was the wrong call anyway.

runqemu.pid is the right PGID as the process was started with preexec_fn=setpgrp
(so no need to do os.getpgid(self.runqemu.pid))

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=15688798520896690561824b2fdc227c8a365c82

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c664d00..f1a7e24 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -162,13 +162,13 @@ class QemuRunner:
 
         if self.runqemu:
             bb.note("Sending SIGTERM to runqemu")
-            os.kill(-self.runqemu.pid,signal.SIGTERM)
+            os.killpg(self.runqemu.pid, signal.SIGTERM)
             endtime = time.time() + self.runqemutime
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
             if self.runqemu.poll() is None:
                 bb.note("Sending SIGKILL to runqemu")
-                os.kill(-self.runqemu.pid,signal.SIGKILL)
+                os.killpg(self.runqemu.pid, signal.SIGKILL)
             self.runqemu = None
         if self.server_socket:
             self.server_socket.close()
-- 
1.8.5.3


