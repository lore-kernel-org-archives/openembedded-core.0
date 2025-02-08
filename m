Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95C4C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 22:11:55 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.18875.1739052709688786304
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 14:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=T49r8LEl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250208221146ddf38900fa3a6a3144-hwa4ol@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250208221146ddf38900fa3a6a3144
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Feb 2025 23:11:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gStWyaoFeyTzLyCplRwIENvx0H1d0ulXS6UitHgdHRU=;
 b=T49r8LElGoGBNyMNzdZnYCIBfGid2fTsYzv99J4nHWaMdB0Mkt/iciDUeXV1u8p5h+NJPp
 yabHdWN1dflzRenh8gsRjFByW+PjL6lgkcyLJQakcNaLbDMyhO/a6PvYlnVe5UxuJfJaeED6
 H2RvTOCndUm8Cgd4i+wWHm7CEmqkmD/MGtYukHNksbeZb+YwOYpHOnx63j55sKgquAflE/r/
 tCO8NxfNCxTwami2ZTUH+7RnI/HeDTMT5NrM4Pwj+1pXHUKiwfTAk8y6z7LrqbguBK6/g+Ia
 lhdpJjCjFwcO3/so59NLM9eHDlHzobbSUVjaB+R2OOgct9XC/5Arn74g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3: upgrade 3.13.1 -> 3.13.2
Date: Sat,  8 Feb 2025 23:10:57 +0100
Message-Id: <20250208221057.3480821-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 22:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211043

From: Peter Marko <peter.marko@siemens.com>

Release notes:
https://docs.python.org/release/3.13.2/whatsnew/changelog.html#python-3-13-2

Solves CVE-2025-0938, CVE-2024-12254 and 3 other vulnerabilities without
CVE number assigment.

Remove patch which is included in new release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch | 10 ++--
 ...est_sysconfig-for-posix_user-purelib.patch |  2 +-
 ...01-ssl-Raise-OSError-for-ERR_LIB_SYS.patch | 51 -------------------
 ...ctive_children-skip-problematic-test.patch |  2 +-
 ...le.py-correct-the-test-output-format.patch |  2 +-
 ...t_readline-skip-limited-history-test.patch |  4 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.13.1.bb => python3_3.13.2.bb}  |  3 +-
 11 files changed, 15 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch
 rename meta/recipes-devtools/python/{python3_3.13.1.bb => python3_3.13.2.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index d2246327f2..81a613c151 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 9ec3a71..f7d5382 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2606,6 +2606,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2578,6 +2578,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
index d8ad803d50..075737e7d1 100644
--- a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
+++ b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
@@ -34,7 +34,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index b6b5ebf094c..e5b8bf21002 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -122,7 +122,7 @@ static void _PySSLFixErrno(void) {
+@@ -121,7 +121,7 @@ static void _PySSLFixErrno(void) {
  
  /* Include generated data (error codes) */
  #if (OPENSSL_VERSION_NUMBER >= 0x30100000L)
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 45094481a8..ca72ebc899 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
 index f8e1c7d..0882526 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -481,6 +481,11 @@ def _init_config_vars():
+@@ -494,6 +494,11 @@ def _init_config_vars():
          _CONFIG_VARS['VPATH'] = sys._vpath
      if os.name == 'posix':
          _init_posix(_CONFIG_VARS)
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 230e847d2b..c8537db1fd 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -26,7 +26,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 5dae370..23eb971 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
+@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index 5dae370..23eb971 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2083,6 +2084,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index 5dae370..23eb971 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5171,6 +5173,7 @@ class TestWait(unittest.TestCase):
+@@ -5299,6 +5301,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -54,7 +54,7 @@ diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
 index 293799f..1dbb623 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -504,6 +504,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -62,7 +62,7 @@ index 293799f..1dbb623 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
-@@ -517,6 +518,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -561,6 +562,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index b967a36e49..ab433d1836 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 1ade492..4e94889 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -414,7 +414,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -423,7 +423,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch b/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch
deleted file mode 100644
index 18e0f208c7..0000000000
--- a/meta/recipes-devtools/python/python3/0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 11e0523eb363b7def4bc64d24a04e88d8670a691 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Thu, 28 Nov 2024 13:32:30 +0100
-Subject: [PATCH] ssl: Raise OSError for ERR_LIB_SYS
-
-From the ERR_raise manpage:
-
-    ERR_LIB_SYS
-
-        This "library code" indicates that a system error is
-        being reported.  In this case, the reason code given
-        to `ERR_raise()` and `ERR_raise_data()` *must* be
-        `errno(3)`.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/127361]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Modules/_ssl.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index e5b8bf21002..a243ba4b9bc 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -667,6 +667,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
-                         ERR_GET_REASON(e) == SSL_R_CERTIFICATE_VERIFY_FAILED) {
-                     type = state->PySSLCertVerificationErrorObject;
-                 }
-+                if (ERR_GET_LIB(e) == ERR_LIB_SYS) {
-+                    // A system error is being reported; reason is set to errno
-+                    errno = ERR_GET_REASON(e);
-+                    return PyErr_SetFromErrno(PyExc_OSError);
-+                }
-                 p = PY_SSL_ERROR_SYSCALL;
-             }
-             break;
-@@ -692,6 +697,11 @@ PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
-                 errstr = "EOF occurred in violation of protocol";
-             }
- #endif
-+            if (ERR_GET_LIB(e) == ERR_LIB_SYS) {
-+                // A system error is being reported; reason is set to errno
-+                errno = ERR_GET_REASON(e);
-+                return PyErr_SetFromErrno(PyExc_OSError);
-+            }
-             break;
-         }
-         default:
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 7749fcbe7d..5f60c60b5b 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 23eb971..b1295b2 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -579,6 +579,7 @@ class _TestProcess(BaseTestCase):
+@@ -585,6 +585,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 7f03cf105f..2cca004b57 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
 index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -568,7 +568,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -572,7 +572,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index d63c73e334..337e69cce0 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -20,7 +20,7 @@ diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
 index 50e77cb..09b644a 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -141,6 +141,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -28,7 +28,7 @@ index 50e77cb..09b644a 100644
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -374,6 +375,7 @@ readline.write_history_file(history_file)
+@@ -382,6 +383,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index f63c230747..b115a6fa65 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index be1b9ea..9ec3a71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2513,7 +2513,7 @@ COMPILEALL_OPTS=-j0
+@@ -2485,7 +2485,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.13.1.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.1.bb
rename to meta/recipes-devtools/python/python3_3.13.2.bb
index d7a3bcc4bb..52fac76c00 100644
--- a/meta/recipes-devtools/python/python3_3.13.1.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -30,14 +30,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
            file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
-           file://0001-ssl-Raise-OSError-for-ERR_LIB_SYS.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "9cf9427bee9e2242e3877dd0f6b641c1853ca461f39d6503ce260a59c80bf0d9"
+SRC_URI[sha256sum] = "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

