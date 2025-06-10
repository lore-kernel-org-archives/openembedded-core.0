Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78342C71131
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:48 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.91305.1749571785663797248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vfaop3gL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23508d30142so72534205ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571785; x=1750176585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orK9mKh5vGdQ4vGIX80Z06rz2LiyFdhT4D0QyPoJ6R4=;
        b=Vfaop3gLWkpBAJeLz6bomNouGzAf+mwvQAFBzn02yckf8dby/qKKyVIuTFB5h4JD83
         PRrEkFXr8L+tEOf33w0zeJqaoePeRcAVGqB2aFmT/KmPk0FH6ZAvduLtYkNFaXxekl2A
         Sdq1+v0OFZMYVbplLjy6QicNSDs2BRxTUVdaengXHNeZ/lw45Uq4czBEIMPIbpziVuzA
         uea4GC4sQolJ10WGyCWbfjIfYPC8QcCLACqzut1bO6wKOMte8F2ZrE3irGyRL+f65Hs7
         aBxYsQ3RTIP8/m+FNRm3G8O4Ib+I0qoPO34nW4f3sQBpiF91hcOPcuB4yytZUlSY8d04
         /SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571785; x=1750176585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orK9mKh5vGdQ4vGIX80Z06rz2LiyFdhT4D0QyPoJ6R4=;
        b=MVdt1wOpIRGS+t1ymEIuTzwct4458LA4E6tXkq6C2Jdg6ryr1NJ2jfPHuGcxApXSDk
         /R/StQSNMhQrmytF1rSN+OgShdL+aAV5US4XielqVM1AJpNNdkQKP6HlH9Me/GVQABry
         kjQSnXOHSp2a0oIy2dJdabVwVGmHsSjRpTeP1Ay4fShkVLlrL251HdE7a02rCUKRQWIA
         L28edPaWT193v09NB95ZvzACLHGIVmbaqRTFBmB//lVIjwS/CxPqbZUxjCb9N6yrMh1U
         amwxJidgtwDh9UGeHqCm5I9OxUVvwXd+toj6mI0nvXZTqR3LXAvKSCxNzzuiQObhh4i2
         mL/g==
X-Gm-Message-State: AOJu0YwHGC7RccPXfByzIeVDGpGKDt56nfJuL5VDms2ZvzJ/C2LStWFE
	3xPPsfnpQTqNGPj+R57Ll5XwNlOTjSMylGrC3+/5V5sjulZ9UF0zFLmZBHzuoEOPNQTP9QkdwrW
	aPGMw
X-Gm-Gg: ASbGncsR+XNLQ1q7Gr3WpnYKkY72EmWVRI0idKNHgC32sj9XpnYSYpcVZsg+fxCrz/W
	78kk+fVNs1OoDLgPqUFgiEXDT5as7wEG5EFbi2mlN0+xyb7gsUlH6HsdtE49hGUlqcFrkEjLZju
	4VdVadaVAmUryYid7JBgS999ohv7/CkagMwVfj+TDaEewc7uruKDJ6a+wgkIBIOJlw/Mc7p4Kmn
	NJOf69xJtgIF8a/UqItJu7RtrrTqIuG8sGP34JFb9QroxLaqHqSWjzH0fN6W7k+2LopkjEPuesM
	XQdbkScNbLPRBaZuFh7mXJghuRprPg6TXsCY85xDUohNN4Wye0qGLmsnut9U/QPo
X-Google-Smtp-Source: AGHT+IHb3JlZlzD16bTYsCb0w81RvCVUWJ8/JL7EPpAwqDS/Gfkaxs6pN3C3EpulcP8Ut4DNEObjcw==
X-Received: by 2002:a17:902:d50c:b0:234:de0a:b36e with SMTP id d9443c01a7336-23601da6138mr267142335ad.49.1749571784644;
        Tue, 10 Jun 2025 09:09:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 32/32] python3: upgrade 3.13.3 -> 3.13.4
Date: Tue, 10 Jun 2025 09:08:45 -0700
Message-ID: <55a9cd748531c75d46f5d6d53af692a38c6b6716.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218401

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


