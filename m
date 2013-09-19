Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A6A9E610FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 12:36:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2013 05:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,936,1371106800"; d="scan'208";a="380540013"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2013 05:36:04 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 6E7762C8001;
	Thu, 19 Sep 2013 05:36:02 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 15:36:15 +0300
Message-Id: <1379594176-30993-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/utils: sshcontrol: log how long the last command take
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
X-List-Received-Date: Thu, 19 Sep 2013 12:36:03 -0000

It might be useful for debugging to have in the ssh log
the number of seconds a command has run.
---
 meta/lib/oeqa/utils/sshcontrol.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 643d0ad..1539ff2 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -15,6 +15,7 @@ class SSHControl(object):
     def __init__(self, host=None, timeout=300, logfile=None):
         self.host = host
         self.timeout = timeout
+        self._starttime = None
         self._out = ''
         self._ret = 126
         self.logfile = logfile
@@ -35,6 +36,7 @@ class SSHControl(object):
         cmd = ". /etc/profile; " + cmd
         command = self.ssh + [self.host, cmd]
         self.log("[Running]$ %s" % " ".join(command))
+        self._starttime = time.time()
         # ssh hangs without os.setsid
         proc = subprocess.Popen(command, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
         return proc
@@ -58,7 +60,7 @@ class SSHControl(object):
                 tdelta = self.timeout
             else:
                 tdelta = timeout
-            endtime = time.time() + tdelta
+            endtime = self._starttime + tdelta
             while sshconn.poll() is None and time.time() < endtime:
                 time.sleep(1)
             # process hasn't returned yet
@@ -69,23 +71,24 @@ class SSHControl(object):
                 self._out = sshconn.stdout.read()
                 sshconn.stdout.close()
                 self._out += "\n[!!! SSH command timed out after %d seconds and it was killed]" % tdelta
-                self.log("[!!! SSH command timed out after %d seconds and it was killed]" % tdelta)
             else:
                 self._out = sshconn.stdout.read()
                 self._ret = sshconn.poll()
         # strip the last LF so we can test the output
         self._out = self._out.rstrip()
         self.log("%s" % self._out)
-        self.log("[SSH command returned]: %s" % self._ret)
+        self.log("[SSH command returned after %d seconds]: %s" % (time.time() - self._starttime, self._ret))
         return (self._ret, self._out)
 
     def _internal_scp(self, cmd):
         cmd = ['scp'] + self.ssh_options + cmd
         self.log("[Running SCP]$ %s" % " ".join(cmd))
+        self._starttime = time.time()
         scpconn = subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
         out = scpconn.communicate()[0]
         ret = scpconn.poll()
         self.log("%s" % out)
+        self.log("[SCP command returned after %d seconds]: %s" % (time.time() - self._starttime, ret))
         if ret != 0:
             # we raise an exception so that tests fail in setUp and setUpClass without a need for an assert
             raise Exception("Error running %s, output: %s" % ( " ".join(cmd), out))
-- 
1.8.3.1


