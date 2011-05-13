Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKrxU-0004FQ-19
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 14:59:08 +0200
Received: by fxm19 with SMTP id 19so1944974fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NG0XKJAPEkNRROSXdX00BptjpcqwJH2ILBYQxY7Tph8=;
	b=nBha6TsUQ+76+G6c3fFbA3LoDBbYU1j8VLrgmWiZQbGZWccel3YbM2D/8wXCa5Dfk3
	PJbBZgK7pZobUyRWOdSuQA8apEBoX7slroINTOmve0IaYLWKHTupoSEMAWt2uvDSxcS+
	rFRjyBUMqCgDlqHShapMIDkHowE+Zx4wJhl+Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Zg1y92GSvb6bA1lBs61Q50i+HJltgos/P9OPumWYMWS+O9rSjg/T4MO7/nsYOtF/nG
	oS/4sO4GBByJsX5SBg4f1LkOhhi2D4R+CZtM4gXrmi9hHKwYGilmtmYkH/A9QPRaYYZN
	WSG6xC2BBrX0kcZvle9NMIGSQA7QassFa12CM=
Received: by 10.223.100.15 with SMTP id w15mr748020fan.11.1305291379414;
	Fri, 13 May 2011 05:56:19 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id p16sm833065fax.45.2011.05.13.05.56.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 05:56:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 14:56:17 +0200
Message-Id: <3b4084a296b54dc63948211a10ea485d43d9fe8d.1305291184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1305291184.git.Martin.Jansa@gmail.com>
References: <cover.1305291184.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] lib/oe/process.py: import from OE
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
X-List-Received-Date: Fri, 13 May 2011 12:59:08 -0000

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
1.7.5.rc3



