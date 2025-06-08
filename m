Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E51C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:41:31 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.45715.1749418885750516065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LfHQjtuk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202506082141206413fc7eb0df1283d2-nghutb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202506082141206413fc7eb0df1283d2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Jun 2025 23:41:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rQYjhfeiWgfvock1SjJzKHTMnklauU1zuXtp55dqP1Y=;
 b=LfHQjtukxoQHLWRUlbwaE/9gbFkY7DtIIkHy4tpnPu6lfCNOeYz0XXEZlpGTbqzmsNmGaQ
 +SmWqLCBH0xZ1lMSIJppnHJo/Ydi3/BhZSN4NBFSc97PvEv9Q8JFoJpzsGEBBi+fgAPDW/2J
 xerynTUEll/5n4TUTm3uJNXnb6v43SQQEbDiK7D/7HBu0Nj50ARFbu6CnGugclpQAHijXFm9
 VGQy6502CcYY+STABtVZTcRcM6hVsFPPuP9t/IJq6MYkBBWINIAblqctZrLZXNuDXt0utmEb
 Gme4E4oVh2W0Lx2I89RoLNPDtIxyhfnMuYud/IeSy9Rih2Q5lQXjfxKg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] python3: upgrade 3.13.3 -> 3.13.4
Date: Sun,  8 Jun 2025 23:40:32 +0200
Message-Id: <20250608214032.2426822-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218226

From: Peter Marko <peter.marko@siemens.com>

Refresh patches.

* https://www.python.org/downloads/release/python-3134/
  Security content in this release
  * gh-135034: [CVE 2024-12718] [CVE 2025-4138] [CVE 2025-4330]
    [CVE 2025-4435] [CVE 2025-4517] Fixes multiple issues that allowed
    tarfile extraction filters (filter="data" and filter="tar") to be
    bypassed using crafted symlinks and hard links.
  * gh-133767: Fix use-after-free in the “unicode-escape” decoder with a
    non-“strict” error handler.
  * gh-128840: Short-circuit the processing of long IPv6 addresses early
    in ipaddress to prevent excessive memory consumption and a minor
    denial-of-service.

gh-133767 got meawhile CVE-2025-4516 assigned.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...01-Avoid-shebang-overflow-on-python-config.py.patch |  2 +-
 ...config.py-use-prefix-value-from-build-configu.patch |  2 +-
 ...ailing-tests-due-to-load-variability-on-YP-AB.patch |  6 +++---
 ...no_stdout_fileno-test-due-to-load-variability.patch |  2 +-
 ...01-test_active_children-skip-problematic-test.patch |  2 +-
 .../0001-test_readline-skip-limited-history-test.patch | 10 +++++-----
 ...1-test_storlines-skip-due-to-load-variability.patch |  2 +-
 meta/recipes-devtools/python/python3/makerace.patch    |  2 +-
 .../python/{python3_3.13.3.bb => python3_3.13.4.bb}    |  2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.3.bb => python3_3.13.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 81a613c151..eaf5ea5049 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 9ec3a71..f7d5382 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2578,6 +2578,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2585,6 +2585,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index ca72ebc899..ffdf9affd9 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
 index f8e1c7d..0882526 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -494,6 +494,11 @@ def _init_config_vars():
+@@ -501,6 +501,11 @@ def _init_config_vars():
          _CONFIG_VARS['VPATH'] = sys._vpath
      if os.name == 'posix':
          _init_posix(_CONFIG_VARS)
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index c8537db1fd..8fa794b5e7 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -26,7 +26,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 5dae370..23eb971 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
+@@ -701,6 +701,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index 5dae370..23eb971 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2232,6 +2233,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index 5dae370..23eb971 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5299,6 +5301,7 @@ class TestWait(unittest.TestCase):
+@@ -5320,6 +5322,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index ea103bc834..9bc8b091cc 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
 index c5394de..ed17fb6 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2435,6 +2435,7 @@ class PtyTests(unittest.TestCase):
+@@ -2474,6 +2474,7 @@ class PtyTests(unittest.TestCase):
                           "byte 0xe9 in position 4: ordinal not in "
                           "range(128)")
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 5f60c60b5b..08ac5861b3 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 23eb971..b1295b2 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -585,6 +585,7 @@ class _TestProcess(BaseTestCase):
+@@ -594,6 +594,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index 862a7f5ea7..186623b084 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -13,12 +13,12 @@ Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- Lib/test/test_readline.py | 2 ++
- 1 file changed, 2 insertions(+)
+ Lib/test/test_readline.py | 3 +++
+ 1 file changed, 3 insertions(+)
 
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -70,6 +70,7 @@ class TestHistoryManipulation (unittest.
+@@ -71,6 +71,7 @@ class TestHistoryManipulation (unittest.TestCase):
  
      @unittest.skipUnless(hasattr(readline, "append_history_file"),
                           "append_history not available")
@@ -26,7 +26,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
      def test_write_read_append(self):
          hfile = tempfile.NamedTemporaryFile(delete=False)
          hfile.close()
-@@ -141,6 +142,7 @@ class TestHistoryManipulation (unittest.
+@@ -142,6 +143,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -34,7 +34,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -382,6 +384,7 @@ readline.write_history_file(history_file
+@@ -390,6 +392,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index b4f873fd72..b452c6556f 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
 index bed0e6d..36602be 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
-@@ -627,6 +627,7 @@ class TestFTPClass(TestCase):
+@@ -630,6 +630,7 @@ class TestFTPClass(TestCase):
              self.client.storbinary('stor', f, rest=r)
              self.assertEqual(self.server.handler_instance.rest, str(r))
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b115a6fa65..bf73135e09 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index be1b9ea..9ec3a71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2485,7 +2485,7 @@ COMPILEALL_OPTS=-j0
+@@ -2492,7 +2492,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.13.3.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.3.bb
rename to meta/recipes-devtools/python/python3_3.13.4.bb
index 6839d28e19..5d904d6207 100644
--- a/meta/recipes-devtools/python/python3_3.13.3.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041"
+SRC_URI[sha256sum] = "27b15a797562a2971dce3ffe31bb216042ce0b995b39d768cf15f784cc757365"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

