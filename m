Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 527A36E7EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:54:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2014 05:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,736,1384329600"; d="scan'208";a="472020868"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2014 05:54:29 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id F34926A4092;
	Tue, 28 Jan 2014 05:54:22 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 15:55:32 +0200
Message-Id: <1390917332-9975-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/utils: sshcontrol: rewrite the SSHControl class
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
X-List-Received-Date: Tue, 28 Jan 2014 13:54:30 -0000

Split the class in two, one to handle the process and the
timeout based on output and one for the actual ssh/scp commands.
The ssh/scp methods now use the same run method.
It does the same thing as before but:
- it looks cleaner.
- adds support for using a different user than root
- optionally, raises an exception when exit code != 0
(that's useful for code outside of tests, where you wouldn't want
to check the return code every time as the tests do)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 175 ++++++++++++++++++++------------------
 1 file changed, 92 insertions(+), 83 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 8913250..d355d5e 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -11,108 +11,117 @@ import time
 import os
 import select
 
-class SSHControl(object):
 
-    def __init__(self, ip=None, timeout=300, logfile=None, port=None):
+class SSHProcess(object):
+    def __init__(self, **options):
+
+        self.defaultopts = {
+            "stdout": subprocess.PIPE,
+            "stderr": subprocess.STDOUT,
+            "stdin": None,
+            "shell": False,
+            "bufsize": -1,
+            "preexec_fn": os.setsid,
+        }
+        self.options = dict(self.defaultopts)
+        self.options.update(options)
+        self.status = None
+        self.output = None
+        self.process = None
+        self.starttime = None
+
+    def run(self, command, timeout=None):
+        self.starttime = time.time()
+        output = ''
+        self.process = subprocess.Popen(command, **self.options)
+        if timeout:
+            endtime = self.starttime + timeout
+            eof = False
+            while time.time() < endtime and not eof:
+                if select.select([self.process.stdout], [], [], 5)[0] != []:
+                    data = os.read(self.process.stdout.fileno(), 1024)
+                    if not data:
+                        self.process.stdout.close()
+                        eof = True
+                    else:
+                        output += data
+                        endtime = time.time() + timeout
+
+            # process hasn't returned yet
+            if not eof:
+                self.process.terminate()
+                time.sleep(5)
+                try:
+                    self.process.kill()
+                except OSError:
+                    pass
+                output += "\nProcess killed - no output for %d seconds. Total running time: %d seconds." % (timeout, time.time() - self.starttime)
+        else:
+            output = self.process.communicate()[0]
+
+        self.status = self.process.wait()
+        self.output = output.rstrip()
+        return (self.status, self.output)
+
+
+class SSHControl(object):
+    def __init__(self, ip, logfile=None, timeout=300, user='root', port=None):
         self.ip = ip
-        self.timeout = timeout
-        self._starttime = None
-        self._out = ''
-        self._ret = 126
+        self.defaulttimeout = timeout
+        self.ignore_status = True
         self.logfile = logfile
+        self.user = user
         self.ssh_options = [
                 '-o', 'UserKnownHostsFile=/dev/null',
                 '-o', 'StrictHostKeyChecking=no',
                 '-o', 'LogLevel=ERROR'
                 ]
-        self.ssh = ['ssh', '-l', 'root'] + self.ssh_options
+        self.ssh = ['ssh', '-l', self.user ] + self.ssh_options
+        self.scp = ['scp'] + self.ssh_options
         if port:
-            self.ssh = self.ssh + ['-p', str(port)]
+            self.ssh = self.ssh + [ '-p', port ]
+            self.scp = self.scp + [ '-P', port ]
 
     def log(self, msg):
         if self.logfile:
             with open(self.logfile, "a") as f:
                 f.write("%s\n" % msg)
 
-    def _internal_run(self, cmd):
-        # We need this for a proper PATH
-        cmd = ". /etc/profile; " + cmd
-        command = self.ssh + [self.ip, cmd]
+    def _internal_run(self, command, timeout=None, ignore_status = True):
         self.log("[Running]$ %s" % " ".join(command))
-        self._starttime = time.time()
-        # ssh hangs without os.setsid
-        proc = subprocess.Popen(command, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
-        return proc
-
-    def run(self, cmd, timeout=None):
-        """Run cmd and get it's return code and output.
-        Let it run for timeout seconds and then terminate/kill it,
-        if time is 0 will let cmd run until it finishes.
-        Time can be passed to here or can be set per class instance."""
-
-        if self.ip:
-            sshconn = self._internal_run(cmd)
-        else:
-            raise Exception("Remote IP hasn't been set, I can't run ssh without one.")
 
-        # run the command forever
-        if timeout == 0:
-            output = sshconn.communicate()[0]
-        else:
-            # use the default timeout
-            if timeout is None:
-                tdelta = self.timeout
-            # use the specified timeout
-            else:
-                tdelta = timeout
-            endtime = self._starttime + tdelta
-            output = ''
-            eof = False
-            while time.time() < endtime and not eof:
-                if select.select([sshconn.stdout], [], [], 5)[0] != []:
-                    data = os.read(sshconn.stdout.fileno(), 1024)
-                    if not data:
-                        sshconn.stdout.close()
-                        eof = True
-                    else:
-                        output += data
-                        endtime = time.time() + tdelta
+        proc = SSHProcess()
+        status, output = proc.run(command, timeout)
 
-            # process hasn't returned yet
-            if not eof:
-                sshconn.terminate()
-                time.sleep(3)
-                try:
-                    sshconn.kill()
-                except OSError:
-                    pass
-                output += "\n[!!! SSH command killed - no output for %d seconds. Total running time: %d seconds." % (tdelta, time.time() - self._starttime)
-
-        self._ret = sshconn.wait()
-        # strip the last LF so we can test the output
-        self._out = output.rstrip()
-        self.log("%s" % self._out)
-        self.log("[SSH command returned after %d seconds]: %s" % (time.time() - self._starttime, self._ret))
-        return (self._ret, self._out)
-
-    def _internal_scp(self, cmd):
-        cmd = ['scp'] + self.ssh_options + cmd
-        self.log("[Running SCP]$ %s" % " ".join(cmd))
-        self._starttime = time.time()
-        scpconn = subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=os.setsid)
-        out = scpconn.communicate()[0]
-        ret = scpconn.poll()
-        self.log("%s" % out)
-        self.log("[SCP command returned after %d seconds]: %s" % (time.time() - self._starttime, ret))
-        if ret != 0:
-            # we raise an exception so that tests fail in setUp and setUpClass without a need for an assert
-            raise Exception("Error running %s, output: %s" % ( " ".join(cmd), out))
-        return (ret, out)
+        self.log("%s" % output)
+        self.log("[Command returned '%d' after %.2f seconds]" % (status, time.time() - proc.starttime))
+
+        if status and not ignore_status:
+            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
+
+        return (status, output)
+
+    def run(self, command, timeout=None):
+        """
+        command - ssh command to run
+        timeout=<val> - kill command if there is no output after <val> seconds
+        timeout=None - kill command if there is no output after a default value seconds
+        timeout=0 - no timeout, let command run until it returns
+        """
+
+        # We need to source /etc/profile for a proper PATH on the target
+        command = self.ssh + [self.ip, ' . /etc/profile; ' + command]
+
+        if timeout is None:
+            return self._internal_run(command, self.defaulttimeout, self.ignore_status)
+        if timeout == 0:
+            return self._internal_run(command, None, self.ignore_status)
+        return self._internal_run(command, timeout, self.ignore_status)
 
     def copy_to(self, localpath, remotepath):
-        actualcmd = [localpath, 'root@%s:%s' % (self.ip, remotepath)]
-        return self._internal_scp(actualcmd)
+        command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
+        return self._internal_run(command, ignore_status=False)
 
     def copy_from(self, remotepath, localpath):
-        actualcmd = ['root@%s:%s' % (self.ip, remotepath), localpath]
-        return self._internal_scp(actualcmd)
+        command = self.scp + ['%s@%s:%s' % (self.user, self.ip, remotepath), localpath]
+        return self._internal_run(command, ignore_status=False)
-- 
1.8.5.3


