Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33C5D6AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:27:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2013 02:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="360871547"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2013 02:28:31 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 818726A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 02:27:33 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 12:27:44 +0300
Message-Id: <a29e7a16581e848d017a56de42e4ee751639d529.1373013888.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373013888.git.stefanx.stanacar@intel.com>
References: <cover.1373013888.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH v2 3/8] lib/oeqa/utils/sshcontrol.py: helper module for running remote commands
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
X-List-Received-Date: Fri, 05 Jul 2013 09:27:42 -0000

Provides a class for setting up ssh connections,
running commands and copying files to/from a target.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/__init__.py   |   0
 meta/lib/oeqa/utils/sshcontrol.py | 100 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/__init__.py
 create mode 100644 meta/lib/oeqa/utils/sshcontrol.py

diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
new file mode 100644
index 0000000..85a09a0
--- /dev/null
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -0,0 +1,100 @@
+import subprocess
+import time
+import os
+import shlex
+
+class SSHControl(object):
+
+    def __init__(self, host=None, timeout=200, logfile=None):
+        self.host = host
+        self.timeout = timeout
+        self._out = ''
+        self._ret = 126
+        self.logfile = logfile
+
+    def log(self, msg):
+        if self.logfile:
+            with open(self.logfile, "a") as f:
+                f.write("%s\n" % msg)
+
+    def _internal_run(self, cmd):
+        # ssh hangs without os.setsid
+        proc = subprocess.Popen(shlex.split(cmd), shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
+        return proc
+
+    def run(self, cmd, timeout=None):
+        """Run cmd and get it's return code and output.
+        Let it run for timeout seconds and then terminate/kill it,
+        if time is 0 will let cmd run until it finishes.
+        Time can be passed to here or can be set per class instance."""
+
+
+
+        actualcmd = "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l root %s '%s'" % (self.host, cmd)
+        if self.host:
+            sshconn = self._internal_run(actualcmd)
+        else:
+            raise Exception("Remote IP hasn't been set: '%s'" % actualcmd)
+
+        if timeout == 0:
+            self.log("[SSH run without timeout]$ %s" % actualcmd)
+            self.log("  # %s" % cmd)
+            self._out = sshconn.communicate()[0]
+            self._ret = sshconn.poll()
+        else:
+            if timeout is None:
+                endtime = time.time() + self.timeout
+            else:
+                endtime = time.time() + timeout
+            while sshconn.poll() is None and time.time() < endtime:
+                time.sleep(1)
+            self.log("[SSH run with timeout]$ %s" % actualcmd)
+            self.log("  # %s" % cmd)
+            # process hasn't returned yet
+            if sshconn.poll() is None:
+                self._ret = 255
+                sshconn.terminate()
+                sshconn.kill()
+                self._out = sshconn.stdout.read()
+                sshconn.stdout.close()
+                self.log("[!!! process killed]")
+            else:
+                self._out = sshconn.stdout.read()
+                self._ret = sshconn.poll()
+        # remove first line from output which is always smth like (unless return code is 255 - which is a ssh error):
+        # Warning: Permanently added '192.168.7.2' (RSA) to the list of known hosts.
+        if self._ret != 255:
+            self._out = '\n'.join(self._out.splitlines()[1:])
+        self.log("%s" % self._out)
+        self.log("[SSH command returned]: %s" % self._ret)
+        return (self._ret, self._out)
+
+    def _internal_scp(self, cmd):
+        self.log("[SCP]$ %s" % cmd)
+        scpconn = self._internal_run(cmd)
+        try:
+            self._out = scpconn.communicate()[0]
+            self._ret = scpconn.poll()
+            if self._ret != 0:
+                self.log("%s" % self._out)
+                raise Exception("Error copying file")
+        except Exception as e:
+            print("Execution failed: %s :" % cmd)
+            print e
+        self.log("%s" % self._out)
+        return (self._ret, self._out)
+
+    def copy_to(self, localpath, remotepath):
+        actualcmd = "scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no %s root@%s:%s" % (localpath, self.host, remotepath)
+        return self._internal_scp(actualcmd)
+
+
+    def copy_from(self, remotepath, localpath):
+        actualcmd = "scp -o UserKnownHostsFile=/dev/null  -o StrictHostKeyChecking=no root@%s:%s %s" % (self.host, remotepath, localpath)
+        return self._internal_scp(actualcmd)
+
+    def get_status(self):
+        return self._ret
+
+    def get_output(self):
+        return self._out
-- 
1.8.1.4


