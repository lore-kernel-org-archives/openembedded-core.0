Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEl-00068K-FC
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2011 18:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; d="scan'208";a="436235857"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2011 18:32:25 -0700
Message-Id: <3fdfd5206c54c90823de7f65909bab8b31b37adf.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Mon, 4 Apr 2011 09:44:36 +0200
Date: Sat, 14 May 2011 18:32:25 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 07/15] lib/oe/process.py: import from OE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 May 2011 01:35:15 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

---
 meta/lib/oe/process.py |   74 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta/lib/oe/process.py

diff --git a/meta/lib/oe/process.py b/meta/lib/oe/process.py
new file mode 100644
index 0000000..26c3e65
--- /dev/null
+++ b/meta/lib/oe/process.py
@@ -0,0 +1,74 @@
+import subprocess
+import signal
+
+def subprocess_setup():
+    # Python installs a SIGPIPE handler by default. This is usually not what
+    # non-Python subprocesses expect.
+    signal.signal(signal.SIGPIPE, signal.SIG_DFL)
+
+class CmdError(RuntimeError):
+    def __init__(self, command):
+        self.command = command
+
+    def __str__(self):
+        if not isinstance(self.command, basestring):
+            cmd = subprocess.list2cmdline(self.command)
+        else:
+            cmd = self.command
+
+        return "Execution of '%s' failed" % cmd
+
+class NotFoundError(CmdError):
+    def __str__(self):
+        return CmdError.__str__(self) + ": command not found"
+
+class ExecutionError(CmdError):
+    def __init__(self, command, exitcode, stdout = None, stderr = None):
+        CmdError.__init__(self, command)
+        self.exitcode = exitcode
+        self.stdout = stdout
+        self.stderr = stderr
+
+    def __str__(self):
+        message = ""
+        if self.stderr:
+            message += self.stderr
+        if self.stdout:
+            message += self.stdout
+        if message:
+            message = ":\n" + message
+        return (CmdError.__str__(self) +
+                " with exit code %s" % self.exitcode + message)
+
+class Popen(subprocess.Popen):
+    defaults = {
+        "close_fds": True,
+        "preexec_fn": subprocess_setup,
+        "stdout": subprocess.PIPE,
+        "stderr": subprocess.STDOUT,
+        "stdin": subprocess.PIPE,
+        "shell": False,
+    }
+
+    def __init__(self, *args, **kwargs):
+        options = dict(self.defaults)
+        options.update(kwargs)
+        subprocess.Popen.__init__(self, *args, **options)
+
+def run(cmd, input=None, **options):
+    """Convenience function to run a command and return its output, raising an
+    exception when the command fails"""
+
+    if isinstance(cmd, basestring) and not "shell" in options:
+        options["shell"] = True
+    try:
+        pipe = Popen(cmd, **options)
+    except OSError, exc:
+        if exc.errno == 2:
+            raise NotFoundError(cmd)
+        else:
+            raise
+    stdout, stderr = pipe.communicate(input)
+    if pipe.returncode != 0:
+        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
+    return stdout
-- 
1.7.1.1



