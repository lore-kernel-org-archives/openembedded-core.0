Return-Path: <mihaix.lindner@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DE0106C6BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:52:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2013 08:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="391553114"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2013 08:52:48 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.34])
	by linux.intel.com (Postfix) with ESMTP id 90B902C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:52:46 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Sep 2013 18:52:41 +0300
Message-Id: <f279c9ccff85b092c632d903b996d79a529e290a.1378396260.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
References: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
References: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
Subject: [PATCH 2/3] oeqa/utils/sshcontrol: tweak ssh options
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
X-List-Received-Date: Thu, 05 Sep 2013 15:52:55 -0000

Add ssh_options to be used, the same, by ssh and scp:
Decrease LogLevel to ERROR, to suppress warnings (e.g. ssh host
verifications, two warnings in case of having openssh with hpn patches);
We no longer presume that the first line is a warning.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 7de7c3e..643d0ad 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -6,7 +6,6 @@
 # running commands and copying files to/from a target.
 # It's used by testimage.bbclass and tests in lib/oeqa/runtime.
 
-
 import subprocess
 import time
 import os
@@ -19,6 +18,12 @@ class SSHControl(object):
         self._out = ''
         self._ret = 126
         self.logfile = logfile
+        self.ssh_options = [
+                '-o', 'UserKnownHostsFile=/dev/null',
+                '-o', 'StrictHostKeyChecking=no',
+                '-o', 'LogLevel=ERROR'
+                ]
+        self.ssh = ['ssh', '-l', 'root'] + self.ssh_options
 
     def log(self, msg):
         if self.logfile:
@@ -28,7 +33,7 @@ class SSHControl(object):
     def _internal_run(self, cmd):
         # We need this for a proper PATH
         cmd = ". /etc/profile; " + cmd
-        command = ['ssh', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', '-l', 'root', self.host, cmd ]
+        command = self.ssh + [self.host, cmd]
         self.log("[Running]$ %s" % " ".join(command))
         # ssh hangs without os.setsid
         proc = subprocess.Popen(command, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
@@ -40,8 +45,6 @@ class SSHControl(object):
         if time is 0 will let cmd run until it finishes.
         Time can be passed to here or can be set per class instance."""
 
-
-
         if self.host:
             sshconn = self._internal_run(cmd)
         else:
@@ -70,15 +73,14 @@ class SSHControl(object):
             else:
                 self._out = sshconn.stdout.read()
                 self._ret = sshconn.poll()
-        # remove first line from output which is always smth like (unless return code is 255 - which is a ssh error):
-        # Warning: Permanently added '192.168.7.2' (RSA) to the list of known hosts.
-        if self._ret != 255:
-            self._out = '\n'.join(self._out.splitlines()[1:])
+        # strip the last LF so we can test the output
+        self._out = self._out.rstrip()
         self.log("%s" % self._out)
         self.log("[SSH command returned]: %s" % self._ret)
         return (self._ret, self._out)
 
     def _internal_scp(self, cmd):
+        cmd = ['scp'] + self.ssh_options + cmd
         self.log("[Running SCP]$ %s" % " ".join(cmd))
         scpconn = subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
         out = scpconn.communicate()[0]
@@ -90,12 +92,11 @@ class SSHControl(object):
         return (ret, out)
 
     def copy_to(self, localpath, remotepath):
-        actualcmd = ['scp', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', localpath, 'root@%s:%s' % (self.host, remotepath)]
+        actualcmd = [localpath, 'root@%s:%s' % (self.host, remotepath)]
         return self._internal_scp(actualcmd)
 
-
     def copy_from(self, remotepath, localpath):
-        actualcmd = ['scp', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'StrictHostKeyChecking=no', 'root@%s:%s' % (self.host, remotepath), localpath]
+        actualcmd = ['root@%s:%s' % (self.host, remotepath), localpath]
         return self._internal_scp(actualcmd)
 
     def get_status(self):
-- 
1.8.3.2


