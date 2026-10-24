Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5432.1792845269757358613
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 05:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mRztJ0Em;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 152714E412F4
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDF4360769
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16F3E1032902C;
	Sat, 24 Oct 2026 14:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792845267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r78lWdhJAz5HsqxAYh/iT68NzJTHmh9lrPp8l9Kr/EU=;
	b=mRztJ0Em8GApQO1UZI04l4SDy+E8VwuBqEKVv862RrUolnK07qzBgFWHCkVImujkCQJHLg
	TiHS2zNWLKWXsPGiPNjxwBmLowfHdl8jl8wuMypM+tV/frrf+hkiBL2iaCEGMmGlmyGAkd
	knPjX7GIj6+jeLDhp1OxXJhirjNqQX8yAWYyyi2dwh7wJp0m8Iz50oM3KbtDX+7eTtopuP
	sPEm2XWeTY+F8qY8KnF+hNv+tuRwBP/N1/J5eNYYRen5aYgv6QsC5bp4/H240U0DxO8Cm4
	EkdPuCr8HNDD0mlpSsn5a3iWO+VXbFLtAKgVdfGGdlQ5at9qW0D+xwaeqXC64Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sat, 24 Oct 2026 14:34:12 +0200
Subject: [PATCH RFC 3/3] oeqa/sstatetests: Add tests for sstate log replay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-mathieu-debug-replay-v4-v1-3-fc591ec473a7@bootlin.com>
References: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
In-Reply-To: <20261024-mathieu-debug-replay-v4-v1-0-fc591ec473a7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792845263; l=10824;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=euWNnig1TowA3AKWaCnqyogTEadyStkh7XmJGjUwouk=;
 b=t7cEsqiFJ2N3hGLr6/MGxtMU/Q2YuBMwZ2/C+a2a3lC5o8LF/M01s5yMxF67nSTdrnyL/JPLU
 gjim6/CDvZSCYgSEGMM3XNK3NUwpoST1ZDckLDrblI1SzCiEBTHl9wy
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 12:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248590

Add a selftest suite covering the sstate log replay feature:

- warnings saved by a task are replayed once, with their severity and odd
  content (newlines, '@', non-ASCII) intact;
- warnings of non-sstate tasks (do_compile) are replayed exactly once
  even when several setscene tasks cover them;
- error and erroronce messages are replayed at ERROR level and fail the
  build;
- paths in replayed messages refer to the build doing the replay, not the
  one that populated the sstate cache.

Two selftest recipes emit the messages, including a shell task
(do_emit_shell_log) to cover bbwarn output.

AI-Generated: Uses opencode (DeepSeek V4 Flash)
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../log-replay-error-test/log-replay-error-test.bb |  11 ++
 .../log-replay-test/log-replay-test.bb             |  29 +++++
 meta/lib/oeqa/selftest/cases/sstatetests.py        | 128 +++++++++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/meta-selftest/recipes-test/log-replay-error-test/log-replay-error-test.bb b/meta-selftest/recipes-test/log-replay-error-test/log-replay-error-test.bb
new file mode 100644
index 000000000000..380bfd90abda
--- /dev/null
+++ b/meta-selftest/recipes-test/log-replay-error-test/log-replay-error-test.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Recipe emitting error-level logs, used to test sstate log replay severity"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+python do_populate_sysroot:append() {
+    bb.error("log-replay-error-plain")
+    bb.erroronce("log-replay-erroronce")
+}
diff --git a/meta-selftest/recipes-test/log-replay-test/log-replay-test.bb b/meta-selftest/recipes-test/log-replay-test/log-replay-test.bb
new file mode 100644
index 000000000000..4ee26977425d
--- /dev/null
+++ b/meta-selftest/recipes-test/log-replay-test/log-replay-test.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Recipe emitting log messages, used to test sstate log replay"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+python do_compile() {
+    bb.warn("log-replay-compile-warn")
+}
+
+python do_populate_sysroot:append() {
+    bb.warn("log-replay-python-warn tmpdir=%s dl_dir=%s" % (d.getVar("TMPDIR"), d.getVar("DL_DIR")))
+    bb.warnonce("log-replay-python-warnonce")
+    bb.warn("log-replay-odd: line1\nline2 with @ sign and caf\u00e9")
+}
+
+do_emit_shell_log() {
+    bbwarn "log-replay-shell-warn"
+}
+do_emit_shell_log[sstate-inputdirs] = ""
+do_emit_shell_log[sstate-outputdirs] = ""
+addtask emit_shell_log after do_install before do_build
+
+SSTATETASKS += "do_emit_shell_log"
+python do_emit_shell_log_setscene() {
+    sstate_setscene(d)
+}
+addtask do_emit_shell_log_setscene
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 5da8caf1c399..cf74749b2541 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -244,6 +244,134 @@ class SStateTests(SStateBase):
         result = runCmd('git add bar.txt; git commit -asm "add bar"', cwd=srcdir)
         bitbake("dbus-wait-test -c unpack")
 
+class SStateLogReplayTests(SStateBase):
+    def assert_restored_from_setscene(self, output, task):
+        """Assert task was restored from sstate and not run natively.
+
+        Bitbake prints a lifecycle line per task carrying its name: the
+        setscene variant ends in _setscene, the plain task doesn't. So a
+        replayed log shows 'task <task>_setscene: Started' and the plain
+        '<task>: Started' line never appears.
+        """
+        self.assertIn("task %s_setscene: Started" % task, output, msg=output)
+        self.assertNotIn("task %s: Started" % task, output, msg=output)
+
+    def test_sstate_log_replay(self):
+        """
+        Summary:    Messages logged while building a task must be replayed
+                    when the task is restored from the sstate cache.
+        Expected:   Warnings emitted by the initial build are shown again on
+                    the rebuild, which is served from sstate.
+        Product:    OE-Core
+        """
+        # Populate sstate, clean the local work/stamps, then rebuild so the
+        # tasks are restored from the sstate cache.
+        bitbake("log-replay-test")
+        bitbake("log-replay-test -cclean")
+        result = bitbake("log-replay-test")
+
+        self.assertRegex(result.output, r"log-replay-test.*do_.*_setscene",
+                         msg="Task was not restored from sstate:\n%s" % result.output)
+        # Messages saved at warning level (warn and warnonce) replay with the
+        # WARNING severity.
+        for marker in ("log-replay-python-warn tmpdir=",
+                       "log-replay-python-warnonce", "log-replay-shell-warn"):
+            lines = [l for l in result.output.splitlines() if marker in l]
+            self.assertEqual(len(lines), 1, msg=result.output)
+            self.assertIn("WARNING:", lines[0])
+        # Messages with odd content (newline, '@', non-ASCII) must survive the
+        # save to and replay from sstate-log.json unmodified.
+        self.assertIn("log-replay-odd: line1\nline2 with @ sign and caf\u00e9", result.output)
+        # The messages must be replayed from sstate, not re-emitted by a
+        # native run of a covered task: do_populate_sysroot and
+        # do_emit_shell_log were restored by their setscene variants and never
+        # ran as plain tasks.
+        for task in ("do_populate_sysroot", "do_emit_shell_log"):
+            self.assert_restored_from_setscene(result.output, task)
+
+    def test_sstate_log_replay_compile(self):
+        """
+        Summary:    Messages logged by non-sstate tasks (do_compile) must be
+                    replayed when the recipe is restored from the sstate cache.
+        Expected:   The do_compile warning is replayed exactly once, even if
+                    several setscene tasks cover do_compile.
+        Product:    OE-Core
+        """
+        bitbake("log-replay-test")
+        bitbake("log-replay-test -cclean")
+        result = bitbake("log-replay-test")
+
+        self.assertRegex(result.output, r"log-replay-test.*do_.*_setscene",
+                         msg="Task was not restored from sstate:\n%s" % result.output)
+        lines = [l for l in result.output.splitlines() if "log-replay-compile-warn" in l]
+        self.assertEqual(len(lines), 1, msg=result.output)
+        # do_compile is not an sstate task: one of the recipe's setscene tasks
+        # covers it. It must not have run natively (no lifecycle line for the
+        # plain task), so its warning can only have been replayed.
+        self.assertNotIn("task do_compile: Started", result.output, msg=result.output)
+
+    def test_sstate_log_replay_error_severity(self):
+        """
+        Summary:    Messages logged at error level must be replayed as errors.
+        Expected:   error and erroronce messages are replayed with the ERROR
+                    severity and reported by the build.
+        Product:    OE-Core
+        """
+        bitbake("log-replay-error-test", ignore_status=True)
+        bitbake("log-replay-error-test -cclean")
+        result = bitbake("log-replay-error-test", ignore_status=True)
+
+        self.assertRegex(result.output, r"log-replay-error-test.*do_.*_setscene",
+                         msg="Task was not restored from sstate:\n%s" % result.output)
+        for marker in ("log-replay-error-plain", "log-replay-erroronce"):
+            lines = [l for l in result.output.splitlines() if marker in l]
+            self.assertEqual(len(lines), 1, msg=result.output)
+            self.assertIn("ERROR:", lines[0])
+        self.assertNotEqual(result.status, 0)
+        # Errors were replayed from sstate by the setscene task, not printed
+        # by a native run of do_populate_sysroot.
+        self.assert_restored_from_setscene(result.output, "do_populate_sysroot")
+
+    def test_sstate_log_replay_rewrites_paths(self):
+        """
+        Summary:    Paths in replayed messages must refer to the build that is
+                    replaying them, not the one that populated the sstate cache.
+        Expected:   A message saved under TMPDIR A is replayed showing TMPDIR B
+                    when the task is restored under a different TMPDIR.
+        Product:    OE-Core
+        """
+        target = "log-replay-test"
+        tmpdir_a = os.path.join(self.topdir, "tmp-log-replay-a")
+        tmpdir_b = os.path.join(self.topdir, "tmp-log-replay-b")
+        dl_a = os.path.join(self.topdir, "dl-log-replay-a")
+        dl_b = os.path.join(self.topdir, "dl-log-replay-b")
+        sstate_dir = os.path.join(self.topdir, "sstate-log-replay")
+        for path in (tmpdir_a, tmpdir_b, dl_a, dl_b, sstate_dir):
+            self.track_for_cleanup(path)
+
+        # TMPDIR and DL_DIR are excluded from the task hashes
+        # (BB_HASHEXCLUDE_COMMON), so a sstate cache populated under the "a"
+        # paths can be reused under the "b" paths. Only do_populate_sysroot is
+        # needed: it emits the messages and its setscene replays them.
+        config = 'TMPDIR = "%s"\nDL_DIR = "%s"\nSSTATE_DIR = "%s"\n'
+        self.write_config(config % (tmpdir_a, dl_a, sstate_dir))
+        bitbake("%s -c populate_sysroot" % target)
+
+        self.write_config(config % (tmpdir_b, dl_b, sstate_dir))
+        result = bitbake("%s -c populate_sysroot" % target)
+
+        self.assertRegex(result.output, r"log-replay-test.*do_.*_setscene",
+                         msg="Task was not restored from sstate:\n%s" % result.output)
+        warned = [l for l in result.output.splitlines() if "log-replay-python-warn tmpdir=" in l]
+        self.assertEqual(len(warned), 1, msg=result.output)
+        self.assertIn(tmpdir_b, warned[0])
+        self.assertIn(dl_b, warned[0])
+        self.assertNotIn(tmpdir_a, warned[0])
+        self.assertNotIn(dl_a, warned[0])
+        # The replayed message must be shown by the setscene task, not by a
+        # native run: do_populate_sysroot never started as a plain task.
+        self.assert_restored_from_setscene(result.output, "do_populate_sysroot")
+
 class SStateCreation(SStateBase):
     def test_sstate_creation_distro_specific(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], hostdistro_specific=True)

-- 
2.47.3

