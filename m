Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF486B208
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:46:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2013 09:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="369348876"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2013 09:46:46 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 0E52B6A4092
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:46:44 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 19:46:50 +0300
Message-Id: <671dc0d8f738843aa00b050f7f35dd260ddd969d.1373647359.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/8] lib/oeqa/utils/sshcontrol.py: fix passing command to subprocess
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
X-List-Received-Date: Fri, 12 Jul 2013 16:46:45 -0000

Don't use shlex.split in subprocess call and also prepend
. /etc/profile, because PATH over ssh is always
/usr/bin:/bin which isn't what many tests expect.

Changed in v2:
 We now need to use a separate call for scp command.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 40 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 85a09a0..6c61caa 100644
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
@@ -70,27 +68,23 @@ class SSHControl(object):
         return (self._ret, self._out)
 
     def _internal_scp(self, cmd):
-        self.log("[SCP]$ %s" % cmd)
-        scpconn = self._internal_run(cmd)
-        try:
-            self._out = scpconn.communicate()[0]
-            self._ret = scpconn.poll()
-            if self._ret != 0:
-                self.log("%s" % self._out)
-                raise Exception("Error copying file")
-        except Exception as e:
-            print("Execution failed: %s :" % cmd)
-            print e
-        self.log("%s" % self._out)
-        return (self._ret, self._out)
+        self.log("[Running SCP]$ %s" % " ".join(cmd))
+        scpconn = subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
+        out = scpconn.communicate()[0]
+        ret = scpconn.poll()
+        self.log("%s" % out)
+        if ret != 0:
+            # we raise an exception so that tests fail in setUp and setUpClass without a need for an assert
+            raise Exception("Error running %s, output: %s" % ( " ".join(cmd), out))
+        return (ret, out)
 
     def copy_to(self, localpath, remotepath):
-        actualcmd = "scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no %s root@%s:%s" % (localpath, self.host, remotepath)
+        actualcmd = ['scp', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', localpath, 'root@%s:%s' % (self.host, remotepath)]
         return self._internal_scp(actualcmd)
 
 
     def copy_from(self, remotepath, localpath):
-        actualcmd = "scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no root@%s:%s %s" % (self.host, remotepath, localpath)
+        actualcmd = ['scp', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', 'root@%s:%s' % (self.host, remotepath), localpath]
         return self._internal_scp(actualcmd)
 
     def get_status(self):
-- 
1.8.1.4


