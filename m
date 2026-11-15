Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5876.1794742443976204844
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 03:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SHXHF5xd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 544D91A166E
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A64260238
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FF7D11BC16DA;
	Sun, 15 Nov 2026 12:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794742441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HJM4Rq5Og6WOqPiB87HR6e6PGmKB4O6uxF0pZRE2iZ8=;
	b=SHXHF5xdoOWE3APhvCwYpaMdscPrvg1yE492znppz9fw8YlqUK1Lzuak0wsJWoPMaGA5nZ
	3z4+guOoFCh3pQi93Fitr8HFdk39FGZQPR/zbQ/qhE9rAqqdDTcV6DMatbRXVq87JxWzm3
	sdeFcyUHJoJSTuveiViSM5y9cJFyHaxtWYEfv2unekdJU6dma4zTazfXz6kLkQxElGz14E
	Z2lVsEUX1rFwM2X80KurvigohULso+8jaI4I1J9gKFk47aUZ6Xd3tZ/XG3EvFD/JXiPdok
	7lfxS3ulg344mLie45sf+9LjbNANSlBzaUzcP34OjRcTVcga8j0lN3KVJh1dGw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Sun, 15 Nov 2026 12:33:56 +0100
Subject: [PATCH RFC v2 3/3] oeqa/sstatetests: Add tests for sstate log
 replay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-mathieu-debug-replay-v4-v2-3-8fbfc07058b1@bootlin.com>
References: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
In-Reply-To: <20261115-mathieu-debug-replay-v4-v2-0-8fbfc07058b1@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794742439; l=15869;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=3gO7qUa5VW5oaylE7ii9h2YKelZwWtNOqqDJCwIN45c=;
 b=fIZ0CI9RaWnTuyrDz+US68rXxTqwL+GNshixFJIcmoNuPfzXFlugGCgPeXFFmJbqa11fbbm+P
 G/MUClCm2//AzJKo5MKpWNrWgawclGhhzEAm/UyYp5fZpq7gIESpQux
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 11:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250276

Add a selftest suite covering the sstate log replay feature:

- warnings saved by a task are replayed once, with their severity and odd
  content (newlines, '@', non-ASCII) intact;
- warnings of non-sstate tasks (do_compile) are replayed exactly once
  even when several setscene tasks cover them;
- warnings of a task from another recipe, covered only by a given sstate
  task, are replayed;
- error and erroronce messages are replayed at ERROR level and fail the
  build;
- paths in replayed messages refer to the build doing the replay, not the
  one that populated the sstate cache.

Four selftest recipes emit the messages, including a shell task
(do_emit_shell_log) to cover bbwarn output.

AI-Generated: Uses opencode (DeepSeek V4 Flash)
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../recipes-test/log-replay/log-replay-dep.bb      |  18 +++
 .../log-replay/log-replay-error-test.bb            |  16 ++
 .../recipes-test/log-replay/log-replay-test.bb     |  34 ++++
 .../recipes-test/log-replay/log-replay-user.bb     |  32 ++++
 meta/lib/oeqa/selftest/cases/sstatetests.py        | 171 +++++++++++++++++++++
 5 files changed, 271 insertions(+)

diff --git a/meta-selftest/recipes-test/log-replay/log-replay-dep.bb b/meta-selftest/recipes-test/log-replay/log-replay-dep.bb
new file mode 100644
index 000000000000..53f473f78109
--- /dev/null
+++ b/meta-selftest/recipes-test/log-replay/log-replay-dep.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Recipe emitting a warning from a task covered by another recipe's setscene, used to test sstate log replay"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit native nospdx
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+do_patch[noexec] = "1"
+do_patch[depends] = ""
+
+# This recipe has no sstate tasks of its own: when log-replay-user is
+# rebuilt from sstate, this task can only be restored (covered) by the user
+# recipe's setscene, which must replay its warning.
+python do_compile() {
+    bb.warn("log-replay-dep-warn")
+}
diff --git a/meta-selftest/recipes-test/log-replay/log-replay-error-test.bb b/meta-selftest/recipes-test/log-replay/log-replay-error-test.bb
new file mode 100644
index 000000000000..d95d8d1c6f42
--- /dev/null
+++ b/meta-selftest/recipes-test/log-replay/log-replay-error-test.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Recipe emitting error-level logs, used to test sstate log replay severity"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit native nospdx
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+do_patch[noexec] = "1"
+do_patch[depends] = ""
+
+python do_populate_sysroot:append() {
+    bb.error("log-replay-error-plain")
+    bb.erroronce("log-replay-erroronce")
+}
diff --git a/meta-selftest/recipes-test/log-replay/log-replay-test.bb b/meta-selftest/recipes-test/log-replay/log-replay-test.bb
new file mode 100644
index 000000000000..56e43021de13
--- /dev/null
+++ b/meta-selftest/recipes-test/log-replay/log-replay-test.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Recipe emitting log messages, used to test sstate log replay"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit native nospdx
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+do_patch[noexec] = "1"
+do_patch[depends] = ""
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
diff --git a/meta-selftest/recipes-test/log-replay/log-replay-user.bb b/meta-selftest/recipes-test/log-replay/log-replay-user.bb
new file mode 100644
index 000000000000..b83940eabb29
--- /dev/null
+++ b/meta-selftest/recipes-test/log-replay/log-replay-user.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Recipe depending on log-replay-dep, used to test cross-recipe sstate log replay"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit native nospdx
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+do_patch[noexec] = "1"
+do_patch[depends] = ""
+
+DEPENDS = "log-replay-dep"
+
+# Pull log-replay-dep's do_compile into this recipe's dependency closure, so
+# it is covered by this recipe's setscene and replayed when restored.
+do_compile[depends] += "log-replay-dep:do_compile"
+
+# An sstate task of its own, so a rebuild of this recipe is served from the
+# sstate cache by its setscene.
+do_sstate_data() {
+    :
+}
+do_sstate_data[sstate-inputdirs] = ""
+do_sstate_data[sstate-outputdirs] = ""
+addtask sstate_data after do_compile before do_build
+
+SSTATETASKS += "do_sstate_data"
+python do_sstate_data_setscene() {
+    sstate_setscene(d)
+}
+addtask do_sstate_data_setscene
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 5da8caf1c399..03e28221b8c4 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -244,6 +244,177 @@ class SStateTests(SStateBase):
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
+        # Use a dedicated sstate dir so this test does not depend on the state
+        # of the shared cache.
+        sstate_dir = os.path.join(self.topdir, "sstate-log-replay-basic")
+        self.track_for_cleanup(sstate_dir)
+        self.write_config('SSTATE_DIR = "%s"\n' % sstate_dir)
+        # Clean any previous build so the first build populates this test's
+        # sstate directory, then clean the local work/stamps and rebuild so
+        # the tasks are restored from the sstate cache.
+        bitbake("log-replay-test -cclean")
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
+        sstate_dir = os.path.join(self.topdir, "sstate-log-replay-compile")
+        self.track_for_cleanup(sstate_dir)
+        self.write_config('SSTATE_DIR = "%s"\n' % sstate_dir)
+        bitbake("log-replay-test -cclean")
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
+        sstate_dir = os.path.join(self.topdir, "sstate-log-replay-error")
+        self.track_for_cleanup(sstate_dir)
+        self.write_config('SSTATE_DIR = "%s"\n' % sstate_dir)
+        bitbake("log-replay-error-test -cclean")
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
+        bitbake("%s -cclean" % target)
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
+    def test_sstate_log_replay_cross_recipe(self):
+        """
+        Summary:    Warnings from a task of another recipe, covered only by a
+                    given sstate task, must be replayed when that sstate task
+                    is restored.
+        Expected:   The warning of the dependency recipe's do_compile is shown
+                    again on the rebuild, which is served from sstate.
+        Product:    OE-Core
+        """
+        # Clean any previous build so the first build populates the dedicated
+        # sstate directory, then clean both so nothing is up to date, and
+        # rebuild: the dependency's do_compile is covered by the user recipe's
+        # setscene and must be replayed, not re-run natively.
+        bitbake("log-replay-user log-replay-dep -cclean")
+        bitbake("log-replay-user")
+        bitbake("log-replay-user log-replay-dep -cclean")
+        result = bitbake("log-replay-user")
+
+        self.assertRegex(result.output, r"log-replay-user.*do_.*_setscene",
+                         msg="Task was not restored from sstate:\n%s" % result.output)
+        lines = [l for l in result.output.splitlines() if "log-replay-dep-warn" in l]
+        self.assertEqual(len(lines), 1, msg=result.output)
+        self.assertIn("WARNING:", lines[0])
+        # The dependency's do_compile never ran natively: it was covered by the
+        # user recipe's setscene and its warning replayed.
+        self.assertNotIn("task do_compile: Started", result.output, msg=result.output)
+
 class SStateCreation(SStateBase):
     def test_sstate_creation_distro_specific(self):
         self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], hostdistro_specific=True)

-- 
2.47.3

