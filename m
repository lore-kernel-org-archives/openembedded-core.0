Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBFECD98CF
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33483.1781132128516521059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mPGNg+ZN;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4602e2a0372so5358520f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132127; x=1781736927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNM0N3TpVH+oJUeThj0SeMfXD56GX2A7/KCskRmjd4E=;
        b=mPGNg+ZN6+QLoKwjdv5OdVmhPkkZasC+TLUbfjgur7y247XJYZIbl9V5huPC/l9v7t
         of+NzB+TZuPe3pD7zGo9MzLH++oYekQ2QrD52LCgpeXUEuWHcpcSiKr60EGgevGixauZ
         9n6AnhMw1gu4INCrDYMiE1i+6u0/aatbF0QPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132127; x=1781736927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNM0N3TpVH+oJUeThj0SeMfXD56GX2A7/KCskRmjd4E=;
        b=d9RtH5CiomFhCca0x4JlQluGPUKxsXvl7WzDzp/oEqTH84unjrkx57SwDiNScDIeUY
         JzxKR46yWArLWywpi/6yr7lTcKxIMWmKu9ooV3dUtU9TlkRIqZDU5ObG2HdrsLbRww8I
         39a0EW/sdQvCpSWtCv/wVXpNqFj3P813p0+2vDIfNPjA/rjC+xfvFgu5tVVTsPt8/zcX
         qR6LZEUPK0SL1IMGyhsaegQIek5OtCgQ0KDehR2xh40tekEbxhpnAwMuqI8fOzQFXUun
         T4rBReAFbraQjcca13n8hF9EAP/DL+V20QcxX6XxQAQexvgxR7vsQpJwehvQlDESpIFy
         N2tg==
X-Gm-Message-State: AOJu0YxfC3c+2w9HFB2F0ry+2fQj4JVJx+StO1AkHqIqvZZzUEz0srQy
	0IDrXr1nnDgU5w8MNrTGkPXpAoOYHOA+NKk5e9Rkq5xbwW7/D0mTSTx6Blrl3heYUTqvwYvmE3b
	qL3w1
X-Gm-Gg: Acq92OGCHbXrudeKDDNQCmmGqMyiQhyWEjkNyOTZ1wivfmzGPeN6fWU/M/p0xQS296j
	FZ+7zVX36ZTQ2Rx1NQwU3r1eGwUhkZp5Hgw1Y/3X3fmQF8t3HXd8ZU8PD1bCEgKSV67IAtd5U2r
	JMotpvw/5EbpAvOLjigk5vYM+aCVzdtxIMGEbAy6fTWyfIz2FuGtv3cxwA9EeUZ91nLFPRBQKfq
	Zq76gaHfcA9BWM+Yj3Pbt6GaJ+KgYjD5APqq/gd3t7v2CV+9UpaBrrX/hLr2ZUhGAw3tfpnbwRv
	ZK3jq3FERabI3ZZQ2oVad9GI24IsYYr7lX7c+rNYB/+9vCjlI8/r7RUSohO5ygy48VYHS3zJ/Lv
	UfXH9PKYrRgIBXwJH671VE0oN/qK17CaE8iUErC2XR4KnXxP8mnLZTfAP34VcYkHdYNRt091lBO
	HvUwNAfaNsdTcNKXXldxUz5lOEL0Td0QMTt8KAZGUKqW2vkUqgWEEI1ej7W6z6OUuVCbHfEou2r
	hS8lJ7iT85w2TG1mLvQJT5YIXf2FZena2HCb9k=
X-Received: by 2002:a05:6000:43cc:20b0:460:42c:1133 with SMTP id ffacd0b85a97d-460674760f2mr197731f8f.14.1781132126405;
        Wed, 10 Jun 2026 15:55:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/21] python3: use SKIPPED_TESTS instead of test skip patches
Date: Thu, 11 Jun 2026 00:55:09 +0200
Message-ID: <c9df7ab1678751caa8c5195fd366d3058a3cc6fa.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238415

From: Trevor Gamblin <tgamblin@baylibre.com>

Drop all 13 patches carried for skipping various known ptest failures
and replace them with usage of the SKIPPED_TESTS variable, which we have
started doing in recent commits (e.g. 40b0815dc9). Most but not all of
the test skips are due to load variability, distinguish between them by
using multiple SKIPPED_TESTS:append blocks with comments taken from the
patch files indicating their purpose. This adds 62 lines to the Python 3
recipe, but it also means that we no longer have to maintain the patch
files across version upgrades, where they often break due to changes in
the test modules upstream.

Results look the same as those from my last upgrade run:

|== Tests result: SUCCESS ==
|
|28 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_kqueue
|    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
|    test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|9 tests skipped (resource denied):
|    test_curses test_peg_generator test_smtpnet test_socketserver
|    test_urllib2net test_urllibnet test_winsound test_xpickle
|    test_zipfile64
|
|455 tests OK.
|
|Total duration: 3 min 9 sec
|Total tests: run=47,012 (filtered) skipped=2,336
|Total test files: run=483/492 (filtered) skipped=28 resource_denied=9
|Result: SUCCESS
|DURATION: 190
|END: /usr/lib/python3/ptest
|2026-05-29T02:22
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

(From OE-Core rev: a8b2baa6020f96468a98200619ec37c460694c4c)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...sts-due-to-load-variability-on-YP-AB.patch | 79 -----------------
 ...kip-flaky-test_default_timeout-tests.patch | 49 -----------
 ..._fileno-test-due-to-load-variability.patch | 29 -------
 ...ctive_children-skip-problematic-test.patch | 34 --------
 ...1-test_cmd-skip-bang-completion-test.patch | 31 -------
 ...pes.test_find-skip-without-tools-sdk.patch | 33 --------
 ...-test_deadlock-skip-problematic-test.patch | 27 ------
 ..._active_thread-skip-problematic-test.patch | 30 -------
 ...-test_unix_console.test_cursor_back_.patch | 46 ----------
 ...t_readline-skip-limited-history-test.patch | 46 ----------
 ...-test_shutdown-skip-problematic-test.patch | 43 ----------
 ...orlines-skip-due-to-load-variability.patch | 29 -------
 ...kip-test_sysconfig.test_sysconfigdat.patch | 32 -------
 .../recipes-devtools/python/python3_3.14.5.bb | 84 +++++++++++++++----
 14 files changed, 70 insertions(+), 522 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
deleted file mode 100644
index a236268efb2..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From aa32aef19d3a54a25dc16b3b77e29e902ee8abd7 Mon Sep 17 00:00:00 2001
-From: Yi Fan Yu <yifan.yu@windriver.com>
-Date: Thu, 1 Apr 2021 13:08:37 -0700
-Subject: [PATCH] Skip failing tests due to load variability on YP AB
-
-Skip these tests until AB-INT is solved.
-
-[YOCTO #14296]
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
-Skip two additional tests due to suspected load variability failures.
-
-[YOCTO #15131]
-[YOCTO #15177]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
-Refresh to apply on top of Python 3.14.0.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/_test_multiprocessing.py | 3 +++
- Lib/test/test_time.py             | 2 ++
- 2 files changed, 5 insertions(+)
-
-diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 9a72362c022..008e6a505a5 100644
---- a/Lib/test/_test_multiprocessing.py
-+++ b/Lib/test/_test_multiprocessing.py
-@@ -774,6 +774,7 @@ class _TestProcess(BaseTestCase):
-         close_queue(q)
- 
-     @support.requires_resource('walltime')
-+    @unittest.skip('timing related test, dependent on load')
-     def test_many_processes(self):
-         if self.TYPE == 'threads':
-             self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2398,6 +2399,7 @@ class _TestBarrier(BaseTestCase):
-         except threading.BrokenBarrierError:
-             results.append(True)
- 
-+    @unittest.skip('timing related test, dependent on load')
-     def test_timeout(self):
-         """
-         Test wait(timeout)
-@@ -5550,6 +5552,7 @@ class TestWait(unittest.TestCase):
-         time.sleep(period)
- 
-     @support.requires_resource('walltime')
-+    @unittest.skip('timing related test, dependent on load')
-     def test_wait_integer(self):
-         from multiprocessing.connection import wait
- 
-diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 5312faa5077..36873d9a400 100644
---- a/Lib/test/test_time.py
-+++ b/Lib/test/test_time.py
-@@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
-     def test_perf_counter(self):
-         time.perf_counter()
- 
-+    @unittest.skip('timing related test, dependent on load')
-     @unittest.skipIf(
-         support.is_wasi, "process_time not available on WASI"
-     )
-@@ -567,6 +568,7 @@ class TimeTestCase(unittest.TestCase):
-         self.assertTrue(info.monotonic)
-         self.assertFalse(info.adjustable)
- 
-+    @unittest.skip('timing related test, dependent on load')
-     def test_thread_time(self):
-         if not hasattr(time, 'thread_time'):
-             if sys.platform.startswith(('linux', 'android', 'win')):
--- 
-2.52.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
deleted file mode 100644
index d41037f9ea9..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From baf2dda48e51fcb17a716e52cc5c4e162a6bb7d3 Mon Sep 17 00:00:00 2001
-From: Antonin Godard <antonin.godard@bootlin.com>
-Date: Mon, 19 Jan 2026 11:38:36 +0100
-Subject: [PATCH] Skip flaky test_default_timeout tests
-
-We have been observing issues with this test on the Autobuilder:
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=15885
-
-The logs on the ticket above do not allow us to know which of the two
-"test_default_timeout" tests is failing, so disable both with
-self.skipTest().
-
-Excerpt from `ptest-runner python3`:
-
-  test_default_timeout (test.test_multiprocessing_fork.test_manager.WithManagerTestBarrier.test_default_timeout)
-  SKIP: Test the barrier's default timeout 'skip flaky timeout test'
-
-Upstream-Status: Inappropriate [OE specific, but might be related to https://github.com/python/cpython/issues/129266#issuecomment-2613058866]
-
-Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
----
- Lib/test/_test_multiprocessing.py | 1 +
- Lib/test/lock_tests.py            | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index e8064e7..9ab1f9e 100644
---- a/Lib/test/_test_multiprocessing.py
-+++ b/Lib/test/_test_multiprocessing.py
-@@ -2424,6 +2424,7 @@ class _TestBarrier(BaseTestCase):
-         """
-         Test the barrier's default timeout
-         """
-+        self.skipTest('skip flaky timeout test')
-         barrier = self.Barrier(self.N, timeout=0.5)
-         results = self.DummyList()
-         self.run_threads(self._test_default_timeout_f, (barrier, results))
-diff --git a/Lib/test/lock_tests.py b/Lib/test/lock_tests.py
-index 8c8f890..43e9b90 100644
---- a/Lib/test/lock_tests.py
-+++ b/Lib/test/lock_tests.py
-@@ -1215,6 +1215,7 @@ class BarrierTests(BaseTestCase):
-         """
-         Test the barrier's default timeout
-         """
-+        self.skipTest('skip flaky timeout test')
-         timeout = 0.100
-         barrier = self.barriertype(2, timeout=timeout)
-         def f():
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
deleted file mode 100644
index b186bdcb880..00000000000
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c5bdd39f8ebc4e6c58a47d7e424eac028eddb4ff Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Fri, 15 Sep 2023 08:48:33 -0400
-Subject: [PATCH] skip no_stdout_fileno test due to load variability
-
-Skip test_input_no_stdout_fileno so that it doesn't fail on systems
-under heavy load.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-[YOCTO #15210]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_builtin.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index c5394de..ed17fb6 100644
---- a/Lib/test/test_builtin.py
-+++ b/Lib/test/test_builtin.py
-@@ -2738,6 +2738,7 @@ class PtyTests(unittest.TestCase):
-                          "byte 0xe9 in position 4: ordinal not in "
-                          "range(128)")
- 
-+    @unittest.skip("Test may fail under heavy load")
-     def test_input_no_stdout_fileno(self):
-         # Issue #24402: If stdin is the original terminal but stdout.fileno()
-         # fails, do not use the original stdout file descriptor
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
deleted file mode 100644
index d7202aa5757..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9c9aac87f48eaece5b99ea347b639c21eea84e6d Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Thu, 13 Jun 2024 10:54:31 -0400
-Subject: [PATCH] test_active_children: skip problematic test
-
-This test is failing in some tests on the Autobuilder. Since it's of a
-similar nature to other failing/hanging tests, disable it for now.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
-Refresh to apply on top of Python 3.14.0.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/_test_multiprocessing.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 008e6a505a5..746de8945f0 100644
---- a/Lib/test/_test_multiprocessing.py
-+++ b/Lib/test/_test_multiprocessing.py
-@@ -667,6 +667,7 @@ class _TestProcess(BaseTestCase):
-         self.assertIsInstance(cpus, int)
-         self.assertGreaterEqual(cpus, 1)
- 
-+    @unittest.skip("skipping problematic test")
-     def test_active_children(self):
-         self.assertEqual(type(self.active_children()), list)
- 
--- 
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
deleted file mode 100644
index f1ba044cc33..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 614e3aefec85b51a611f85a55b6760f12e29b953 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Mon, 27 Oct 2025 09:52:46 -0400
-Subject: [PATCH] test_cmd: skip bang completion test
-
-We compile Python3 with editline support by default, which has tab completion
-but not bang completion. If building with readline,
-test_bang_completion_without_do_shell() passes. Skip the test because of this.
-
-Upstream-Status: Inappropriate [embedded-specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_cmd.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_cmd.py b/Lib/test/test_cmd.py
-index dbfec42fc21..c33dab8d10d 100644
---- a/Lib/test/test_cmd.py
-+++ b/Lib/test/test_cmd.py
-@@ -295,6 +295,7 @@ class CmdTestReadline(unittest.TestCase):
-         self.assertIn(b'ab_completion_test', output)
-         self.assertIn(b'tab completion success', output)
- 
-+    @unittest.skip('no bang completion without readline')
-     def test_bang_completion_without_do_shell(self):
-         script = textwrap.dedent("""
-             import cmd
--- 
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
deleted file mode 100644
index cdcd9302d61..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0e9d0c58e77ef540d9601ce84a1aa79d9ce6ee9b Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@intel.com>
-Date: Fri, 18 Jun 2021 11:56:50 -0700
-Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
-
-These tests need full packagegroup-core-buildessential, the
-easiest way to dynamically check for that is looking for
-'tools-sdk' in IMAGE_FEATURES.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
----
- Lib/test/test_ctypes/test_find.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.py
-index 85b2861..b033203 100644
---- a/Lib/test/test_ctypes/test_find.py
-+++ b/Lib/test/test_ctypes/test_find.py
-@@ -117,10 +117,12 @@ class FindLibraryLinux(unittest.TestCase):
-                 # LD_LIBRARY_PATH)
-                 self.assertEqual(find_library(libname), 'lib%s.so' % libname)
- 
-+    @unittest.skip("Needs IMAGE_FEATURE += \"tools-sdk\"")
-     def test_find_library_with_gcc(self):
-         with unittest.mock.patch("ctypes.util._findSoname_ldconfig", lambda *args: None):
-             self.assertNotEqual(find_library('c'), None)
- 
-+    @unittest.skip("Needs IMAGE_FEATURE += \"tools-sdk\"")
-     def test_find_library_with_ld(self):
-         with unittest.mock.patch("ctypes.util._findSoname_ldconfig", lambda *args: None), \
-              unittest.mock.patch("ctypes.util._findLib_gcc", lambda *args: None):
diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
deleted file mode 100644
index 3336e2913a1..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5a44f74549b32395109342e9299510c32db71068 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 12 Jun 2024 10:29:03 -0400
-Subject: [PATCH] test_deadlock: skip problematic test
-
-This test hangs frequently when run on the Autobuilder. Disable it in
-testing until the cause can be determined.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_concurrent_futures/test_deadlock.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
-index 3c30c45..008d6c0 100644
---- a/Lib/test/test_concurrent_futures/test_deadlock.py
-+++ b/Lib/test/test_concurrent_futures/test_deadlock.py
-@@ -90,6 +90,7 @@ class ErrorAtUnpickle(object):
-         return _raise_error_ignore_stderr, (UnpicklingError, )
- 
- 
-+@unittest.skip("skipping problematic test")
- class ExecutorDeadlockTest:
-     TIMEOUT = support.LONG_TIMEOUT
- 
diff --git a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
deleted file mode 100644
index bc436e077a6..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0524821f8fcbdea2fbd90f199e7fb4950f50530f Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 3 Mar 2026 09:27:10 -0500
-Subject: [PATCH] test_only_active_thread: skip problematic test
-
-This test hangs frequently when run on the Autobuilder. Disable it in
-testing for now.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_external_inspection.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_external_inspection.py b/Lib/test/test_external_inspection.py
-index a709b837161..7a87092c10e 100644
---- a/Lib/test/test_external_inspection.py
-+++ b/Lib/test/test_external_inspection.py
-@@ -1154,6 +1154,7 @@ class TestGetStackTrace(unittest.TestCase):
-             ],
-         )
- 
-+    @unittest.skip("skipping problematic test")
-     @skip_if_not_supported
-     @unittest.skipIf(
-         sys.platform == "linux" and not PROCESS_VM_READV_SUPPORTED,
--- 
-2.53.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
deleted file mode 100644
index 97f78712668..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 66a806ea05ecaf483753de3719041944daae42b0 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Mon, 27 Oct 2025 13:21:14 -0400
-Subject: [PATCH] test_pyrepl: skip test_unix_console.test_cursor_back_write
-
-This test was not run prior to 3.14 due to Python not having access to
-the curses resource. In 3.14, PyREPL's dependency on curses has been
-removed, instead relying on the terminfo module. This results in a
-terminal capability list that does not include ICH1, resulting in an
-"optimization" occurring from PyREPL's side that causes
-test_cursor_back_write() to fail. Specifically, the test tests the
-following writes in sequence:
-
-1. b"1"
-2. TERM_CAPABILITIES["cub"] + b":1"
-3. ANY, b"2"
-
-The first two writes are read correctly, but the result for the third
-write is seeing the equivalent of:
-
-ANY, b"21"
-
-Skip this test.
-
-Upstream-Status: Inappropriate [embedded-specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_pyrepl/test_unix_console.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_pyrepl/test_unix_console.py b/Lib/test/test_pyrepl/test_unix_console.py
-index 3b0d2637dab..5a3c8952f61 100644
---- a/Lib/test/test_pyrepl/test_unix_console.py
-+++ b/Lib/test/test_pyrepl/test_unix_console.py
-@@ -186,6 +186,7 @@ class TestConsole(TestCase):
-         _os_write.assert_any_call(ANY, TERM_CAPABILITIES["cud"] + b":1")
-         con.restore()
- 
-+    @unittest.skip('no ich1 support in vt102 terminfo')
-     def test_cursor_back_write(self, _os_write):
-         events = itertools.chain(
-             code_to_events("1"),
--- 
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
deleted file mode 100644
index c59c6672e0c..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1a0a145261ba4f97aaff3c0c656ac2e0ad9695a8 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Tue, 13 Aug 2024 11:07:05 -0400
-Subject: [PATCH] test_readline: skip limited history test
-
-This test was added recently and is failing on the ptest image when
-using the default PACKAGECONFIG settings (i.e. with editline instead of
-readline).. Disable it until the proper fix is determined.
-
-A bug has been opened upstream: https://github.com/python/cpython/issues/123018
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_readline.py | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
-index 537a9fb..ddf0323 100644
---- a/Lib/test/test_readline.py
-+++ b/Lib/test/test_readline.py
-@@ -74,6 +74,7 @@ class TestHistoryManipulation (unittest.TestCase):
- 
-     @unittest.skipUnless(hasattr(readline, "append_history_file"),
-                          "append_history not available")
-+    @unittest.skip("Skipping problematic test")
-     def test_write_read_append(self):
-         hfile = tempfile.NamedTemporaryFile(delete=False)
-         hfile.close()
-@@ -145,6 +146,7 @@ class TestHistoryManipulation (unittest.TestCase):
-         self.assertEqual(readline.get_history_item(1), "entrée 1")
-         self.assertEqual(readline.get_history_item(2), "entrée 22")
- 
-+    @unittest.skip("Skipping problematic test")
-     def test_write_read_limited_history(self):
-         previous_length = readline.get_history_length()
-         self.addCleanup(readline.set_history_length, previous_length)
-@@ -393,6 +395,7 @@ readline.write_history_file(history_file)
-         self.assertIn(b"done", output)
- 
- 
-+    @unittest.skip("Skipping problematic test")
-     def test_write_read_limited_history(self):
-         previous_length = readline.get_history_length()
-         self.addCleanup(readline.set_history_length, previous_length)
diff --git a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
deleted file mode 100644
index 4e284de6137..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b678363156b5d40e09c1d138840180e3ddc7d20b Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Wed, 8 May 2024 11:58:09 -0400
-Subject: [PATCH] test_shutdown: skip problematic test
-
-This test hangs frequently when run on the Autobuilder. Disable it in
-testing until the cause can be determined.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_concurrent_futures/test_shutdown.py | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Lib/test/test_concurrent_futures/test_shutdown.py b/Lib/test/test_concurrent_futures/test_shutdown.py
-index 7a4065a..6b878a4 100644
---- a/Lib/test/test_concurrent_futures/test_shutdown.py
-+++ b/Lib/test/test_concurrent_futures/test_shutdown.py
-@@ -20,6 +20,7 @@ def sleep_and_print(t, msg):
-     sys.stdout.flush()
- 
- 
-+@unittest.skip("skipping problematic test")
- class ExecutorShutdownTest:
-     def test_run_after_shutdown(self):
-         self.executor.shutdown()
-@@ -156,6 +157,7 @@ class ExecutorShutdownTest:
-             signal.signal(signal.SIGALRM, old_handler)
- 
- 
-+@unittest.skip("skipping problematic test")
- class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase):
-     def test_threads_terminate(self):
-         def acquire_lock(lock):
-@@ -252,6 +254,7 @@ class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase
-         self.assertIn(out.strip(), [b"apple", b""])
- 
- 
-+@unittest.skip("skipping problematic test")
- class ProcessPoolShutdownTest(ExecutorShutdownTest):
-     def test_processes_terminate(self):
-         def acquire_lock(lock):
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
deleted file mode 100644
index b452c6556fa..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9f252a691cd335341938489da32d6e2d4620d8ca Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Fri, 6 Oct 2023 10:59:44 -0400
-Subject: [PATCH] test_storlines: skip due to load variability
-
-This is yet another test that intermittently fails on the Yocto AB when
-a worker is under heavy load, so skip it during testing.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-[YOCTO #14933]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_ftplib.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
-index bed0e6d..36602be 100644
---- a/Lib/test/test_ftplib.py
-+++ b/Lib/test/test_ftplib.py
-@@ -630,6 +630,7 @@ class TestFTPClass(TestCase):
-             self.client.storbinary('stor', f, rest=r)
-             self.assertEqual(self.server.handler_instance.rest, str(r))
- 
-+    @unittest.skip('timing related test, dependent on load')
-     def test_storlines(self):
-         data = RETR_DATA.replace('\r\n', '\n').encode(self.client.encoding)
-         f = io.BytesIO(data)
diff --git a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
deleted file mode 100644
index 6dfba59a449..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ac5635821ed9bead45a5bcddc3828e50647fbe77 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Mon, 27 Oct 2025 14:24:24 -0400
-Subject: [PATCH] test_sysconfig: skip test_sysconfig.test_sysconfigdata_json
-
-This test seems new as of 3.14.0 and fails due to various path and flag
-differences in variables like CFLAGS. Since the test already has the
-precedent of a skip put in place for Android builds due to prefix
-changes, skip it for our situation too.
-
-Upstream-Status: Inappropriate [embedded-specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_sysconfig.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 09eff11179e..14fcdedccba 100644
---- a/Lib/test/test_sysconfig.py
-+++ b/Lib/test/test_sysconfig.py
-@@ -689,6 +689,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
-         self.assertNotEqual(data['prefix'], data['base_prefix'])
-         self.assertNotEqual(data['exec_prefix'], data['base_exec_prefix'])
- 
-+    @unittest.skip('OE adds/modifies various flags and paths/prefixes')
-     @unittest.skipIf(os.name != 'posix', '_sysconfig-vars JSON file is only available on POSIX')
-     @unittest.skipIf(is_wasi, "_sysconfig-vars JSON file currently isn't available on WASI")
-     @unittest.skipIf(is_android or is_apple_mobile, 'Android and iOS change the prefix')
--- 
-2.51.0
-
diff --git a/meta/recipes-devtools/python/python3_3.14.5.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
index 9e6738997d6..2f821b130f0 100644
--- a/meta/recipes-devtools/python/python3_3.14.5.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -15,25 +15,12 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
-           file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
-           file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
            file://valid-dists.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
-           file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
-           file://0001-test_storlines-skip-due-to-load-variability.patch \
-           file://0001-test_shutdown-skip-problematic-test.patch \
-           file://0001-test_deadlock-skip-problematic-test.patch \
-           file://0001-test_active_children-skip-problematic-test.patch \
-           file://0001-test_readline-skip-limited-history-test.patch \
-           file://0001-test_cmd-skip-bang-completion-test.patch \
-           file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
-           file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
-           file://0001-Skip-flaky-test_default_timeout-tests.patch \
-           file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
            file://0001-Fix-ThreadingMock-call-count-race-condition.patch \
            "
@@ -252,7 +239,76 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
-SKIPPED_TESTS = "--ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME"
+# Tests failing due to load variability. Bugs were opened at
+# https://bugzilla.yoctoproject.org/ to track some of these:
+# 14296 (test_many_processes, test_process_time, test_thread_time, test_wait_integer)
+# 14933 (test_storlines)
+# 15120 (test_input_no_stdout_fileno)
+# 15131 (*TestBarrier.test_timeout)
+# 15177 (test_thread_time)
+# 15743 (test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME)
+# 15885 (test_default_timeout)
+SKIPPED_TESTS = " \
+    --ignore *TestBarrier.test_timeout \
+    --ignore ExecutorDeadlockTest \
+    --ignore ExecutorShutdownTest \
+    --ignore ProcessPoolShutdownTest \
+    --ignore ThreadPoolShutdownTest \
+    --ignore test.test_os.test_os.TimerfdTests.test_timerfd_TFD_TIMER_ABSTIME \
+    --ignore test_active_children \
+    --ignore test_default_timeout \
+    --ignore test_input_no_stdout_fileno \
+    --ignore test_many_processes \
+    --ignore test_only_active_thread \
+    --ignore test_process_time \
+    --ignore test_storlines \
+    --ignore test_thread_time \
+    --ignore test_wait_integer \
+    --ignore test_write_read_append \
+"
+
+# We build Python3 with editline support by default, which has tab completion
+# but not bang completion. test_bang_completion_without_do_shell() passes if
+# building with readline, but we don't want to change the default, so skip the
+# test.
+SKIPPED_TESTS:append = " \
+    --ignore test_bang_completion_without_do_shell \
+"
+
+# Also fails with editline instead of readline. See:
+# https://github.com/python/cpython/issues/123018
+SKIPPED_TESTS:append = " \
+    --ignore test_write_read_limited_history \
+"
+
+# In 3.14+ PyREPL's uses terminfo instead of curses. ICH1, is not in the
+# resulting terminal capabilities, in an "optimization" occurring from PyREPL's
+# side that causes test_cursor_back_write() to fail. Specifically, the test
+# tests the following writes in sequence:
+#
+# 1. b"1"
+# 2. TERM_CAPABILITIES["cub"] + b":1"
+# 3. ANY, b"2"
+#
+# The first two writes are read correctly, but the result for the third
+# write is seeing the equivalent of:
+#
+# ANY, b"21"
+SKIPPED_TESTS:append = " \
+    --ignore test_cursor_back_write \
+"
+
+# Needs IMAGE_FEATURE += \"tools-sdk\"
+SKIPPED_TESTS:append = " \
+    --ignore test_find_library_with_gcc \
+    --ignore test_find_library_with_ld \
+"
+
+# Fails due to differences in CFLAGS as as modified during build
+SKIPPED_TESTS:append = " \
+    --ignore test_sysconfigdata_json \
+"
+
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \

