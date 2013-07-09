Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1416A8E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 16:48:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2013 09:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1029,1363158000"; d="scan'208";a="362654852"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2013 09:49:06 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 2E90C6A4091;
	Tue,  9 Jul 2013 09:48:02 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 19:48:48 +0300
Message-Id: <1373388528-21894-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
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
X-List-Received-Date: Tue, 09 Jul 2013 16:48:08 -0000

Don't use shlex.split in subprocess call and also prepend
. /etc/profile, because PATH over ssh is always
/usr/bin:/bin which isn't what many tests expect.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 85a09a0..9aa30fd 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -1,7 +1,6 @@
 import subprocess
 import time
 import os
-import shlex
 
 class SSHControl(object):
 
@@ -18,8 +17,12 @@ class SSHControl(object):
                 f.write("%s\n" % msg)
 
     def _internal_run(self, cmd):
+        # We need this for a proper PATH
+        cmd = ". /etc/profile; " + cmd
+        command = ['ssh', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', '-l', 'root', self.host, cmd ]
+        self.log("[Running]$ %s" % " ".join(command))
         # ssh hangs without os.setsid
-        proc = subprocess.Popen(shlex.split(cmd), shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
+        proc = subprocess.Popen(command, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
         return proc
 
     def run(self, cmd, timeout=None):
@@ -30,15 +33,12 @@ class SSHControl(object):
 
 
 
-        actualcmd = "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l root %s '%s'" % (self.host, cmd)
         if self.host:
-            sshconn = self._internal_run(actualcmd)
+            sshconn = self._internal_run(cmd)
         else:
             raise Exception("Remote IP hasn't been set: '%s'" % actualcmd)
 
         if timeout == 0:
-            self.log("[SSH run without timeout]$ %s" % actualcmd)
-            self.log("  # %s" % cmd)
             self._out = sshconn.communicate()[0]
             self._ret = sshconn.poll()
         else:
@@ -48,8 +48,6 @@ class SSHControl(object):
                 endtime = time.time() + timeout
             while sshconn.poll() is None and time.time() < endtime:
                 time.sleep(1)
-            self.log("[SSH run with timeout]$ %s" % actualcmd)
-            self.log("  # %s" % cmd)
             # process hasn't returned yet
             if sshconn.poll() is None:
                 self._ret = 255
-- 
1.8.1.4


