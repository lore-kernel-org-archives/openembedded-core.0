Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC91C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 15:08:42 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.7911.1754752120277166585
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 08:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SEM2AC8l;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250809150836281723998dc7d173fc-rr9ahh@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250809150836281723998dc7d173fc
        for <openembedded-core@lists.openembedded.org>;
        Sat, 09 Aug 2025 17:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4hn59TlvTomN9ZLnILHRmtbwQRQIfdsOcoeXx6f84vw=;
 b=SEM2AC8l7ofO9NDywGxUPPdYno6feGVBNNf2EY/SOCYaAx8uXkMeURvwi7scdc5Tt0iLKp
 7zWcOFIqfknLmL1hZZQtOLuXwf2/7/Mb26CEOrS1zhzxKz0pewoAaQmrw9cYq5Ovv4dsjcEL
 hZmBeS+NfT8HXCMYYR+ShJfqPm4JKnFFc43QMVfqmIIu0MygfsQUb6Ld2FrOo9WXwy/NCUru
 1gtsADFrnOHCRvX4hObI9R1unplZwxlyL77WScvXsSPA6OTKsqkSnavmeIhW5LC4nZfbtPwr
 Vg5ZM1BfMEX1z7nulCy6YScf2stuMn2ZQSOhZTSVZXILMrfZwL06bo8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3: Upgrade 3.13.5 -> 3.13.6
Date: Sat,  9 Aug 2025 17:07:49 +0200
Message-Id: <20250809150749.2203058-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 15:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221682

From: Peter Marko <peter.marko@siemens.com>

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-6-final

Handles CVE-2025-8194 and 4 other vulnerabilities without CVE numbers.

Refresh patches via devtool.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  6 ++---
 ..._fileno-test-due-to-load-variability.patch |  2 +-
 ...ctive_children-skip-problematic-test.patch |  2 +-
 ...le.py-correct-the-test-output-format.patch |  2 +-
 ...t_readline-skip-limited-history-test.patch | 12 +++++----
 ...orlines-skip-due-to-load-variability.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../python/python3/valid-dists.patch          | 26 +++++++++++--------
 .../{python3_3.13.5.bb => python3_3.13.6.bb}  |  2 +-
 11 files changed, 33 insertions(+), 27 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.5.bb => python3_3.13.6.bb} (99%)

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
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 2cca004b57..f672ee7ad7 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
 index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -572,7 +572,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -576,7 +576,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index 862a7f5ea7..a619d51c10 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -13,12 +13,14 @@ Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- Lib/test/test_readline.py | 2 ++
- 1 file changed, 2 insertions(+)
+ Lib/test/test_readline.py | 3 +++
+ 1 file changed, 3 insertions(+)
 
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 537a9fb..ddf0323 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -70,6 +70,7 @@ class TestHistoryManipulation (unittest.
+@@ -71,6 +71,7 @@ class TestHistoryManipulation (unittest.TestCase):
  
      @unittest.skipUnless(hasattr(readline, "append_history_file"),
                           "append_history not available")
@@ -26,7 +28,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
      def test_write_read_append(self):
          hfile = tempfile.NamedTemporaryFile(delete=False)
          hfile.close()
-@@ -141,6 +142,7 @@ class TestHistoryManipulation (unittest.
+@@ -142,6 +143,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -34,7 +36,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
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
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
index 1b2c078c21..38b6ebc5cb 100644
--- a/meta/recipes-devtools/python/python3/valid-dists.patch
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -8,12 +8,16 @@ Closes python/importlib_metadata#489
 
 Upstream-Status: Backport [https://github.com/python/importlib_metadata/commit/a65c29adc027b3615154cab73aaedd58a6aa23da]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Lib/importlib/metadata/__init__.py   | 14 +++-
+ Lib/importlib/metadata/_itertools.py | 98 ++++++++++++++++++++++++++++
+ 2 files changed, 110 insertions(+), 2 deletions(-)
 
-diff --git i/Lib/importlib/metadata/__init__.py w/Lib/importlib/metadata/__init__.py
-index 8ce62dd864f..085378caabc 100644
---- i/Lib/importlib/metadata/__init__.py
-+++ w/Lib/importlib/metadata/__init__.py
-@@ -21,7 +21,7 @@
+diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
+index 8ce62dd..085378c 100644
+--- a/Lib/importlib/metadata/__init__.py
++++ b/Lib/importlib/metadata/__init__.py
+@@ -21,7 +21,7 @@ import collections
  from . import _meta
  from ._collections import FreezableDefaultDict, Pair
  from ._functools import method_cache, pass_none
@@ -22,7 +26,7 @@ index 8ce62dd864f..085378caabc 100644
  from ._meta import PackageMetadata, SimplePath
  
  from contextlib import suppress
-@@ -404,7 +404,7 @@ def from_name(cls, name: str) -> Distribution:
+@@ -404,7 +404,7 @@ class Distribution(DeprecatedNonAbstract):
          if not name:
              raise ValueError("A distribution name is required.")
          try:
@@ -31,7 +35,7 @@ index 8ce62dd864f..085378caabc 100644
          except StopIteration:
              raise PackageNotFoundError(name)
  
-@@ -428,6 +428,16 @@ def discover(
+@@ -428,6 +428,16 @@ class Distribution(DeprecatedNonAbstract):
              resolver(context) for resolver in cls._discover_resolvers()
          )
  
@@ -48,10 +52,10 @@ index 8ce62dd864f..085378caabc 100644
      @staticmethod
      def at(path: str | os.PathLike[str]) -> Distribution:
          """Return a Distribution for the indicated metadata path.
-diff --git i/Lib/importlib/metadata/_itertools.py w/Lib/importlib/metadata/_itertools.py
-index d4ca9b9140e..79d37198ce7 100644
---- i/Lib/importlib/metadata/_itertools.py
-+++ w/Lib/importlib/metadata/_itertools.py
+diff --git a/Lib/importlib/metadata/_itertools.py b/Lib/importlib/metadata/_itertools.py
+index d4ca9b9..79d3719 100644
+--- a/Lib/importlib/metadata/_itertools.py
++++ b/Lib/importlib/metadata/_itertools.py
 @@ -1,3 +1,4 @@
 +from collections import defaultdict, deque
  from itertools import filterfalse
diff --git a/meta/recipes-devtools/python/python3_3.13.5.bb b/meta/recipes-devtools/python/python3_3.13.6.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.5.bb
rename to meta/recipes-devtools/python/python3_3.13.6.bb
index dde03dc0e7..184d71bdce 100644
--- a/meta/recipes-devtools/python/python3_3.13.5.bb
+++ b/meta/recipes-devtools/python/python3_3.13.6.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "93e583f243454e6e9e4588ca2c2662206ad961659863277afcdb96801647d640"
+SRC_URI[sha256sum] = "17ba5508819d8736a14fbfc47d36e184946a877851b2e9c4b6c43acb44a3b104"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

