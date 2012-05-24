Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SXaXK-0002Mp-IT
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 18:05:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4OFt2ra011704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 08:55:02 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 24 May 2012 08:55:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 23:55:08 +0800
Message-ID: <f97eccf92441efd2795d82445cb1925dfcb593ef.1337874862.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1337874862.git.liezhi.yang@windriver.com>
References: <cover.1337874862.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] oe/process.py: remove it since it is unused and duplicated
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
X-List-Received-Date: Thu, 24 May 2012 16:05:14 -0000
Content-Type: text/plain

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
1.7.1



