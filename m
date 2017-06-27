Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 91E1177E4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 11:03:51 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id b205so13279416itg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1gKgVpbY+jkzfzO+FYYpUNW77Ko/YPh2+0CGiykAJA=;
	b=T66PGbd6idDdYDdlVgc10u7a8vkskdGNAoXrboL2hRDz4PlaDXmwfyLfEpaUWCJvd+
	nV6PzoiJnT//wxeij/iZ0oGBteWISdanMDbMasxG2SsBpnkFWeDwUoi3EZ3gEbMClFgA
	ustggHG9q/wkomC8aInDtwoSsLXwVGEctOGZHxpfVFNoBSGkxWun/0YrEAedqefYHYOC
	KYGMwqkcR04k8cHv0joGrqjPI/hkjK1+3YIkIqVkN/TKgcpWULiP/QZxsrZKR/5G0VYl
	Z2+mXip2sYTCt0Vgt9So9o0wvu3w+Dn+1VMwVrrN14xQEAmX7zFC1mN2+CblfI72tATt
	bbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f1gKgVpbY+jkzfzO+FYYpUNW77Ko/YPh2+0CGiykAJA=;
	b=Q0Sqdc1e+3q//DzMg/a+tg5jkqMobnIiVAg9qO2d+sdt1DvPy6/nQsg8XEuJuCprfG
	jhyoY66JTkbmpvCIOsW8fyHavVNhvPLYql12ggCGiq+oYFqsdSTPffze2nTuCjGliW7I
	jOIb0tB5oEbaIqzhydHYhRRwiI8LzqHZmGqj1eKfoKs5hlDRTOCX/lemTTJArx8LqVm3
	Y1uOfXpgwm+UusePiORrG6opW8Qjwm9kxM9W24gg5Oxq3bYgrH5jA0U+DGwlN6ZLD34p
	lmyH+/s5r5mNJf1FWWEw760UnVdjpC9S9yjyUOmCtoCL240lewxgDKGxkUx+cqqLzz77
	PZQg==
X-Gm-Message-State: AKS2vOxB4xTNh3FiHc6bmOuSpfGoXWTHL49wHbfRYSBfcuSzOVabZXPO
	reaQDBbYKFZaqEOXXVw=
X-Received: by 10.36.20.206 with SMTP id 197mr1388979itg.99.1498561432213;
	Tue, 27 Jun 2017 04:03:52 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	e14sm1182323itc.30.2017.06.27.04.03.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 04:03:51 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 13:03:41 +0200
Message-Id: <9be851cd0076ac89d1065194a996f1cdf86e797d.1498561325.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.6294f875f727127346587b794d369e08b84cc30e.1498561325.git-series.patrick.ohly@intel.com>
References: <cover.6294f875f727127346587b794d369e08b84cc30e.1498561325.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] runcmd.py: unit testing for runCmd()
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
X-List-Received-Date: Tue, 27 Jun 2017 11:03:51 -0000

This covers the traditional API as well as the new output_log feature.
While testing, it was noticed that killing hanging commands does not
work when a shell is used to run the command(s). This might be worth
fixing.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/selftest/cases/runcmd.py | 117 ++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/runcmd.py

diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
new file mode 100644
index 0000000..6c785ca
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -0,0 +1,117 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd
+from oeqa.utils import CommandError
+
+import subprocess
+import threading
+import time
+import signal
+
+class MemLogger(object):
+    def __init__(self):
+        self.info_msgs = []
+        self.error_msgs = []
+
+    def info(self, msg):
+        self.info_msgs.append(msg)
+
+    def error(self, msg):
+        self.error_msgs.append(msg)
+
+class RunCmdTests(OESelftestTestCase):
+    """ Basic tests for runCmd() utility function """
+
+    # The delta is intentionally smaller than the timeout, to detect cases where
+    # we incorrectly apply the timeout more than once.
+    TIMEOUT = 2
+    DELTA = 1
+
+    def test_result_okay(self):
+        result = runCmd("true")
+        self.assertEqual(result.status, 0)
+
+    def test_result_false(self):
+        result = runCmd("false", ignore_status=True)
+        self.assertEqual(result.status, 1)
+
+    def test_shell(self):
+        # A shell is used for all string commands.
+        result = runCmd("false; true", ignore_status=True)
+        self.assertEqual(result.status, 0)
+
+    def test_no_shell(self):
+        self.assertRaises(FileNotFoundError,
+                          runCmd, "false; true", shell=False)
+
+    def test_list_not_found(self):
+        self.assertRaises(FileNotFoundError,
+                          runCmd, ["false; true"])
+
+    def test_list_okay(self):
+        result = runCmd(["true"])
+        self.assertEqual(result.status, 0)
+
+    def test_result_assertion(self):
+        self.assertRaisesRegexp(AssertionError, "Command 'echo .* false' returned non-zero exit status 1:\nfoobar",
+                                runCmd, "echo foobar >&2; false", shell=True)
+
+    def test_result_exception(self):
+        self.assertRaisesRegexp(CommandError, "Command 'echo .* false' returned non-zero exit status 1 with output: foobar",
+                                runCmd, "echo foobar >&2; false", shell=True, assert_error=False)
+
+    def test_output(self):
+        result = runCmd("echo stdout; echo stderr >&2", shell=True)
+        self.assertEqual("stdout\nstderr", result.output)
+        self.assertEqual("", result.error)
+
+    def test_output_split(self):
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, stderr=subprocess.PIPE)
+        self.assertEqual("stdout", result.output)
+        self.assertEqual("stderr", result.error)
+
+    def test_timeout(self):
+        numthreads = threading.active_count()
+        start = time.time()
+        # Killing a hanging process only works when not using a shell?!
+        result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True)
+        self.assertEqual(result.status, -signal.SIGTERM)
+        end = time.time()
+        self.assertLess(end - start, self.TIMEOUT + self.DELTA)
+        self.assertEqual(numthreads, threading.active_count())
+
+    def test_timeout_split(self):
+        numthreads = threading.active_count()
+        start = time.time()
+        # Killing a hanging process only works when not using a shell?!
+        result = runCmd(['sleep', '60'], timeout=self.TIMEOUT, ignore_status=True, stderr=subprocess.PIPE)
+        self.assertEqual(result.status, -signal.SIGTERM)
+        end = time.time()
+        self.assertLess(end - start, self.TIMEOUT + self.DELTA)
+        self.assertEqual(numthreads, threading.active_count())
+
+    def test_stdin(self):
+        numthreads = threading.active_count()
+        result = runCmd("cat", data=b"hello world", timeout=self.TIMEOUT)
+        self.assertEqual("hello world", result.output)
+        self.assertEqual(numthreads, threading.active_count())
+
+    def test_stdin_timeout(self):
+        numthreads = threading.active_count()
+        start = time.time()
+        result = runCmd(['sleep', '60'], data=b"hello world", timeout=self.TIMEOUT, ignore_status=True)
+        self.assertEqual(result.status, -signal.SIGTERM)
+        end = time.time()
+        self.assertLess(end - start, self.TIMEOUT + self.DELTA)
+        self.assertEqual(numthreads, threading.active_count())
+
+    def test_log(self):
+        log = MemLogger()
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log)
+        self.assertEqual(["Running: echo stdout; echo stderr >&2", "stdout", "stderr"], log.info_msgs)
+        self.assertEqual([], log.error_msgs)
+
+    def test_log_split(self):
+        log = MemLogger()
+        result = runCmd("echo stdout; echo stderr >&2", shell=True, output_log=log, stderr=subprocess.PIPE)
+        self.assertEqual(["Running: echo stdout; echo stderr >&2", "stdout"], log.info_msgs)
+        self.assertEqual(["stderr"], log.error_msgs)
-- 
git-series 0.9.1

