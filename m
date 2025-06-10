Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE92FC71135
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.96416.1749584088618005939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UfWFgA2s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3109f106867so7037133a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584088; x=1750188888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cZfwonTDHQksT57a7WQmY1EDHhBK4Spi4wa87QkOz0=;
        b=UfWFgA2st9KM/kz88/iBbiTP2utAasBRJs+y/0BKZyzFY6pqVZLJgRPlhG+4lNmKJd
         d0UYPJGprH0GIz65I+EO4vZZEUDBZz0h0LAs38b+KjFdaUKfRN1f4pAew55DjOH0apmH
         i1sw8XZAX2d6Qwaf7PloZ7eDvCsVhRams1yE/W3ikdhspNqcP7tps8JV4UdWbHOC9WmM
         6q3Wa2joJQS6I3MhqAGXqEDj6XRaq0+9yHDmpb6GRohYYLYbQChw+hnYo0mC+Hco/JBR
         4BOppEf/sl0YJCcgY5E2FPZgao5YKZl9rozCXaOlyVGRlPnzIbWAhWrNkBAxkJYZviQE
         Bp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584088; x=1750188888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cZfwonTDHQksT57a7WQmY1EDHhBK4Spi4wa87QkOz0=;
        b=jn6OOG7eXBaVjMlJFf1fCPBsnh6e3px7P+WxBDULW3wdFhcDlQePo5CFZFsOfJz790
         tVafGhnAfJn9lCMtOaWSsOiEg4z8hb3/72jSXk6FCL1Md4pYL5Pru3fCx4RT0Em7wJFS
         +ZWcz8d/YJ2GRBxtFSTFmXI57SWZn5ZwrgA5a8TM3+AXKyhr2+HTuoG9M5A4ldQbMrM6
         rNJwPwEEeI6jl9mSr2D6g9+lbKiHjO6KEzAjGbbNtPVmTvqa2zXJwCF1Z4gzUj28yJkQ
         NjOqez5j+SEgKhE0/GmYpBXLH8CnVdZVkfJ0G4jpbiiC0OrPQhu34YMAbZNUexWBU2xw
         CGAA==
X-Gm-Message-State: AOJu0YyLM52Wc78xA6EwJb3uxemJbh2WK8xTggv4FgvXe73mnXFhhbax
	PbGxPtmKSrseuRO4rGx7uwaO3qNN9OGjJ/PWhIWQZmyxIs4Cp1I6gTxAZ5DDtcEqIV+ORB/LWqz
	Vjgqj
X-Gm-Gg: ASbGncvE6858b+8qeSBeP5x+Dk6SNzZXrZUdwZuiI1dVOTDyoYhmS5UmH9eSUbWALdX
	2YM2CIwLYN2+dmDqUYTGioK03ZEK3JBgrnJgR5BwQ9fBqjUYmzNDPZO2ug/DnOkJX5fbzupl1Jw
	nZm/txPYyPd17RkJXL6IUeK5evo7Ul1GmnbsUcr7Ga6wOooGBPVPojy2OZlMR45GFvlYnREZRy8
	9H8nMq7RjD7bArER2TiV2xwd0IDNmI6I2Y7QQbORppaMYldHjRBoPSL0WHiNbM2OSDoFY8neTe6
	v+kBEX1ar9c+2QYjVSAA0FoECIURYlEe/y/0iyR6nCamjjM8jHn7zA==
X-Google-Smtp-Source: AGHT+IEVVBtLO6Dz8fwolHIPg2QHF2KsgDWMSFha7nqBjlw0fejqoIcGOJ+KZfPEB/zP/muI3XT7TA==
X-Received: by 2002:a17:90b:38d2:b0:311:b5ac:6f63 with SMTP id 98e67ed59e1d1-313af1b311bmr882764a91.21.1749584087775;
        Tue, 10 Jun 2025 12:34:47 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/16] python3: upgrade 3.12.9 -> 3.12.11
Date: Tue, 10 Jun 2025 12:34:09 -0700
Message-ID: <6cca08b2857efd5481e837ecd6bb295cb8a99ee1.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218419

From: Peter Marko <peter.marko@siemens.com>

Drop upstreamed patch and refresh remaining patches.

* https://www.python.org/downloads/release/python-31210/

  Python 3.12.10 is the latest maintenance release of Python 3.12, and
  the last full maintenance release. Subsequent releases of 3.12 will be
  security-fixes only.

* https://www.python.org/downloads/release/python-31211/

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  6 +--
 ...001-ctypes-correct-gcc-check-in-test.patch | 53 -------------------
 ...e-treat-overflow-in-UID-GID-as-failu.patch |  2 +-
 ..._fileno-test-due-to-load-variability.patch |  2 +-
 ...orlines-skip-due-to-load-variability.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.12.9.bb => python3_3.12.11.bb} |  3 +-
 9 files changed, 10 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
 rename meta/recipes-devtools/python/{python3_3.12.9.bb => python3_3.12.11.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 6e4930b9ec..a8f98d873e 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2355,6 +2355,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2356,6 +2356,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 1b9f3565d3..c42a56bcb3 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
 index 6258b68..d59ec6e 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -668,6 +668,11 @@ def _init_config_vars():
+@@ -675,6 +675,11 @@ def _init_config_vars():
          _CONFIG_VARS['VPATH'] = sys._vpath
      if os.name == 'posix':
          _init_posix(_CONFIG_VARS)
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index ec3bb9cbbd..051ec2c635 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -26,7 +26,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 3b4415b..1f94dec 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
+@@ -692,6 +692,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index 3b4415b..1f94dec 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2223,6 +2224,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index 3b4415b..1f94dec 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5208,6 +5210,7 @@ class TestWait(unittest.TestCase):
+@@ -5220,6 +5222,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
diff --git a/meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch b/meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
deleted file mode 100644
index 3dd762e519..0000000000
--- a/meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2e2a0c8593a38f2020cc2baeeaa7972eb86773f9 Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Sat, 8 Feb 2025 23:57:17 +0100
-Subject: [PATCH] ctypes: correct gcc check in test
-
-In case gcc is not available, it will throw exception and test fails.
-So chatch the exception to skip the test correctly.
-
-======================================================================
-ERROR: test_null_dlsym (test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym)
-----------------------------------------------------------------------
-Traceback (most recent call last):
-  File "/usr/lib/python3.12/test/test_ctypes/test_dlerror.py", line 61, in test_null_dlsym
-    retcode = subprocess.call(["gcc", "--version"],
-              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-  File "/usr/lib/python3.12/subprocess.py", line 391, in call
-    with Popen(*popenargs, **kwargs) as p:
-         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
-  File "/usr/lib/python3.12/subprocess.py", line 1028, in __init__
-    self._execute_child(args, executable, preexec_fn, close_fds,
-  File "/usr/lib/python3.12/subprocess.py", line 1963, in _execute_child
-    raise child_exception_type(errno_num, err_msg, err_filename)
-FileNotFoundError: [Errno 2] No such file or directory: 'gcc'
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/129872]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Lib/test/test_ctypes/test_dlerror.py | 11 +++++++----
- 1 file changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/Lib/test/test_ctypes/test_dlerror.py b/Lib/test/test_ctypes/test_dlerror.py
-index 6bf492399cb..56eb7622b4d 100644
---- a/Lib/test/test_ctypes/test_dlerror.py
-+++ b/Lib/test/test_ctypes/test_dlerror.py
-@@ -58,11 +58,14 @@ def test_null_dlsym(self):
-         import subprocess
-         import tempfile
- 
--        retcode = subprocess.call(["gcc", "--version"],
--                                  stdout=subprocess.DEVNULL,
--                                  stderr=subprocess.DEVNULL)
--        if retcode != 0:
-+        try:
-+            retcode = subprocess.call(["gcc", "--version"],
-+                                      stdout=subprocess.DEVNULL,
-+                                      stderr=subprocess.DEVNULL)
-+        except:
-             self.skipTest("gcc is missing")
-+        if retcode != 0:
-+            self.skipTest("gcc is not working")
- 
-         pipe_r, pipe_w = os.pipe()
-         self.addCleanup(os.close, pipe_r)
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 5c74443e62..1cffdd6e05 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 0a0f31e..4dfb67d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2590,7 +2590,8 @@ class TarFile(object):
+@@ -2685,7 +2685,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index e105f36eca..4920cb9ad9 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
 index c71c568..e41ab5e 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2352,6 +2352,7 @@ class PtyTests(unittest.TestCase):
+@@ -2375,6 +2375,7 @@ class PtyTests(unittest.TestCase):
          # Check stdin/stdout error handler is used when invoking PyOS_Readline()
          self.check_input_tty("prompté", b"quux\xe9", "ascii")
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index 22aabbb2ed..88cd93a51f 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
 index 4c4a449..b8c79a4 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
-@@ -626,6 +626,7 @@ class TestFTPClass(TestCase):
+@@ -629,6 +629,7 @@ class TestFTPClass(TestCase):
              self.client.storbinary('stor', f, rest=r)
              self.assertEqual(self.server.handler_instance.rest, str(r))
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 862b648685..fbe12a5fca 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2266,7 +2266,7 @@ COMPILEALL_OPTS=-j0
+@@ -2267,7 +2267,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.9.bb b/meta/recipes-devtools/python/python3_3.12.11.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.9.bb
rename to meta/recipes-devtools/python/python3_3.12.11.bb
index 8e03ff5f2b..706dabb5cd 100644
--- a/meta/recipes-devtools/python/python3_3.12.9.bb
+++ b/meta/recipes-devtools/python/python3_3.12.11.bb
@@ -34,14 +34,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://0001-ctypes-correct-gcc-check-in-test.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "7220835d9f90b37c006e9842a8dff4580aaca4318674f947302b8d28f3f81112"
+SRC_URI[sha256sum] = "c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d49f7adb"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


