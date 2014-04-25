Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 90C7E65D76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 11:35:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2014 04:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,926,1389772800"; d="scan'208";a="499664678"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 25 Apr 2014 04:35:04 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.46])
	by linux.intel.com (Postfix) with ESMTP id 305D36A4083;
	Fri, 25 Apr 2014 04:34:43 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 14:35:27 +0300
Message-Id: <1398425727-17087-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] oeqa/utils: sshcontrol: realtime logging of output
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
X-List-Received-Date: Fri, 25 Apr 2014 11:35:05 -0000

Log the output of the command as it runs not when it finished, else
tail -f tmp/work/minnow-poky-linux/core-image-sato/1.0-r0/testimage/ssh_target_log
isn't as useful as it could be.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index d355d5e..1c81795 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -29,8 +29,15 @@ class SSHProcess(object):
         self.output = None
         self.process = None
         self.starttime = None
+        self.logfile = None
 
-    def run(self, command, timeout=None):
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+               f.write("%s" % msg)
+
+    def run(self, command, timeout=None, logfile=None):
+        self.logfile = logfile
         self.starttime = time.time()
         output = ''
         self.process = subprocess.Popen(command, **self.options)
@@ -45,8 +52,10 @@ class SSHProcess(object):
                         eof = True
                     else:
                         output += data
+                        self.log(data)
                         endtime = time.time() + timeout
 
+
             # process hasn't returned yet
             if not eof:
                 self.process.terminate()
@@ -55,9 +64,12 @@ class SSHProcess(object):
                     self.process.kill()
                 except OSError:
                     pass
-                output += "\nProcess killed - no output for %d seconds. Total running time: %d seconds." % (timeout, time.time() - self.starttime)
+                lastline = "\nProcess killed - no output for %d seconds. Total running time: %d seconds." % (timeout, time.time() - self.starttime)
+                self.log(lastline)
+                output += lastline
         else:
             output = self.process.communicate()[0]
+            self.log(output.rstrip())
 
         self.status = self.process.wait()
         self.output = output.rstrip()
@@ -91,9 +103,8 @@ class SSHControl(object):
         self.log("[Running]$ %s" % " ".join(command))
 
         proc = SSHProcess()
-        status, output = proc.run(command, timeout)
+        status, output = proc.run(command, timeout, logfile=self.logfile)
 
-        self.log("%s" % output)
         self.log("[Command returned '%d' after %.2f seconds]" % (status, time.time() - proc.starttime))
 
         if status and not ignore_status:
-- 
1.9.0


