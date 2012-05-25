Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOC-00085Q-M7
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115407"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:43 -0700
Message-Id: <f042665d2cf8c6506ddb068fd87145e0056e50c8.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 04/45] oe/process.py: remove it since it is unused and duplicated
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
X-List-Received-Date: Fri, 25 May 2012 06:52:45 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The meta/lib/oe/process.py is only used by oe_run and oe_popen in
meta/classes/utils.bbclass, and they will be removed, we have a better
one: bitbake/lib/bb/process.py, which can replace of it.

[YOCTO #2489]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/process.py |   74 ------------------------------------------------
 1 files changed, 0 insertions(+), 74 deletions(-)
 delete mode 100644 meta/lib/oe/process.py

diff --git a/meta/lib/oe/process.py b/meta/lib/oe/process.py
deleted file mode 100644
index 26c3e65..0000000
--- a/meta/lib/oe/process.py
+++ /dev/null
@@ -1,74 +0,0 @@
-import subprocess
-import signal
-
-def subprocess_setup():
-    # Python installs a SIGPIPE handler by default. This is usually not what
-    # non-Python subprocesses expect.
-    signal.signal(signal.SIGPIPE, signal.SIG_DFL)
-
-class CmdError(RuntimeError):
-    def __init__(self, command):
-        self.command = command
-
-    def __str__(self):
-        if not isinstance(self.command, basestring):
-            cmd = subprocess.list2cmdline(self.command)
-        else:
-            cmd = self.command
-
-        return "Execution of '%s' failed" % cmd
-
-class NotFoundError(CmdError):
-    def __str__(self):
-        return CmdError.__str__(self) + ": command not found"
-
-class ExecutionError(CmdError):
-    def __init__(self, command, exitcode, stdout = None, stderr = None):
-        CmdError.__init__(self, command)
-        self.exitcode = exitcode
-        self.stdout = stdout
-        self.stderr = stderr
-
-    def __str__(self):
-        message = ""
-        if self.stderr:
-            message += self.stderr
-        if self.stdout:
-            message += self.stdout
-        if message:
-            message = ":\n" + message
-        return (CmdError.__str__(self) +
-                " with exit code %s" % self.exitcode + message)
-
-class Popen(subprocess.Popen):
-    defaults = {
-        "close_fds": True,
-        "preexec_fn": subprocess_setup,
-        "stdout": subprocess.PIPE,
-        "stderr": subprocess.STDOUT,
-        "stdin": subprocess.PIPE,
-        "shell": False,
-    }
-
-    def __init__(self, *args, **kwargs):
-        options = dict(self.defaults)
-        options.update(kwargs)
-        subprocess.Popen.__init__(self, *args, **options)
-
-def run(cmd, input=None, **options):
-    """Convenience function to run a command and return its output, raising an
-    exception when the command fails"""
-
-    if isinstance(cmd, basestring) and not "shell" in options:
-        options["shell"] = True
-    try:
-        pipe = Popen(cmd, **options)
-    except OSError, exc:
-        if exc.errno == 2:
-            raise NotFoundError(cmd)
-        else:
-            raise
-    stdout, stderr = pipe.communicate(input)
-    if pipe.returncode != 0:
-        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
-    return stdout
-- 
1.7.7.6



