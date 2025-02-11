Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B4EC0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3302.1739304576236720630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Mu3yv8MT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f3c119fe6so136539555ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304575; x=1739909375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYdwpaLT1DqwBFXHpt4ca1dM7m42EZnR5rEimxJhP/E=;
        b=Mu3yv8MT15kRPGvy4hyAuLpOu0X5JPHUnDj+rgplsN/9ztrb3CqKrEcXONphJ3l7Dp
         KokcHk7zrIpWQ2s/UgkhSdgKk0cHnFuLnBN1XYho3wtoHPGG+wy0a39V0SqD16aiIEnw
         3mOFA6hsqT4LOvnalxkGb/gqQjK0OzaSAkzllk0kW9FeVTxXFV2cGsHsGTpLXd5LW/RO
         0vFJooSQF7HMIjIE0A2cxau6687gwrZUN8QiynT/Gc7ozSgytEkQrmfmYNn6mYlhWYv0
         eoydclM5iqQhcgSkidkc+cX9RO6I4muy+4Nmmrx0btX5UvhpgLqFtzfhXKkAk2R8L/sj
         s3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304575; x=1739909375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYdwpaLT1DqwBFXHpt4ca1dM7m42EZnR5rEimxJhP/E=;
        b=qnABTVVMheoTl+7nzK0e9hnU6OvaSPF7ucFlxOgkPMH6R556WRUfYC635mLq+Tw7tc
         4aDrmm2jMi/Q2b28vqesjhknxJJZmjcXpSFMNHsi23PzJWiFFltsvmm/H4tamIweDPJ/
         brx3AndbAIwxHtjzURqwKDRJmQ0i+EBKseoQhmR1AYqOEh35t34tJ7mS1rsu/3ynQ7Pp
         bT9a/8b1h5XtAPAvB403NYiR3bv9ssAwZcYKpJlCrdUe1g1v2MdnJRauqcm66jQtMF0j
         L6bhv7EFnHXKbi+zbqR2vklNfnGViXxndGwUb1DP6emirEujkp27wdt65W4wdw2JqrdH
         mKzw==
X-Gm-Message-State: AOJu0YyobEQDQv3aVXb2yQ34t1u3b/PTh3GY+2+tKu+CrGpLD/hVK8Mb
	rULzvN3bT138pyQd01P8fUigVZirIPLQv7QStB+h47v8u4vCLhwAq8k+npj+K3mEg8O1oL4GSsq
	V
X-Gm-Gg: ASbGncvjjVAQxZjeomd8fm3a++/piv/P7W7oMoNvRWwOAnaIe74V9naD+8eQqQP4BHw
	Ye9UvI9+q/T38528nkdt+vkKyd9Y9YvAzK+nn/HkOklgcxZpMjo6CxQDhdDKqgo1inFJ03Tt4SO
	klnlNnSV2pTAH7oWi391d4MsjmqjFz6fcMssI6zsMLm8jb1g6tmeD2f4j0xWdfcZJRQdVbW5ywI
	duJw7SecPl5iKX+KjHPEcbMz7ih5LJubO2OjIGtIamA6nXA4dtXds1dxEQY8Mg/E/YRhDKdlkaE
	eIhl
X-Google-Smtp-Source: AGHT+IHXkCLgn1Ifsjdcodru/Ul5Q2qqXsATqnUjQOqEY8qG19zAWbbCSazD09KCOKqWXCspixgDFw==
X-Received: by 2002:a17:903:234e:b0:21f:ba96:5de9 with SMTP id d9443c01a7336-220bbde92f2mr8565915ad.49.1739304575316;
        Tue, 11 Feb 2025 12:09:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/14] python3: upgrade 3.12.8 -> 3.12.9
Date: Tue, 11 Feb 2025 12:09:08 -0800
Message-ID: <685b2719ae9b44c238e63942efabe52e5df7d640.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211178

From: Peter Marko <peter.marko@siemens.com>

Release notes:
https://docs.python.org/release/3.12.9/whatsnew/changelog.html#python-3-12-9

Solves CVE-2025-0938, CVE-2024-12254 and 3 other vulnerabilities without
CVE number assigment.

Add a patch to fix failure of a new test.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  4 +-
 ...001-ctypes-correct-gcc-check-in-test.patch | 53 +++++++++++++++++++
 ...asename-to-replace-CC-for-checking-c.patch | 10 ++--
 ...t_readline-skip-limited-history-test.patch |  4 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.12.8.bb => python3_3.12.9.bb}  |  3 +-
 8 files changed, 67 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
 rename meta/recipes-devtools/python/{python3_3.12.8.bb => python3_3.12.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 3311a90bda..6e4930b9ec 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2354,6 +2354,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2355,6 +2355,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 6779dd515a..ec3bb9cbbd 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -54,7 +54,7 @@ diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
 index 9463add..4e0f39d 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -527,6 +527,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -536,6 +536,7 @@ class TimeTestCase(unittest.TestCase):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -62,7 +62,7 @@ index 9463add..4e0f39d 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
-@@ -540,6 +541,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -549,6 +550,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
diff --git a/meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch b/meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
new file mode 100644
index 0000000000..3dd762e519
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
@@ -0,0 +1,53 @@
+From 2e2a0c8593a38f2020cc2baeeaa7972eb86773f9 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Sat, 8 Feb 2025 23:57:17 +0100
+Subject: [PATCH] ctypes: correct gcc check in test
+
+In case gcc is not available, it will throw exception and test fails.
+So chatch the exception to skip the test correctly.
+
+======================================================================
+ERROR: test_null_dlsym (test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/usr/lib/python3.12/test/test_ctypes/test_dlerror.py", line 61, in test_null_dlsym
+    retcode = subprocess.call(["gcc", "--version"],
+              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+  File "/usr/lib/python3.12/subprocess.py", line 391, in call
+    with Popen(*popenargs, **kwargs) as p:
+         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
+  File "/usr/lib/python3.12/subprocess.py", line 1028, in __init__
+    self._execute_child(args, executable, preexec_fn, close_fds,
+  File "/usr/lib/python3.12/subprocess.py", line 1963, in _execute_child
+    raise child_exception_type(errno_num, err_msg, err_filename)
+FileNotFoundError: [Errno 2] No such file or directory: 'gcc'
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/129872]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Lib/test/test_ctypes/test_dlerror.py | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/Lib/test/test_ctypes/test_dlerror.py b/Lib/test/test_ctypes/test_dlerror.py
+index 6bf492399cb..56eb7622b4d 100644
+--- a/Lib/test/test_ctypes/test_dlerror.py
++++ b/Lib/test/test_ctypes/test_dlerror.py
+@@ -58,11 +58,14 @@ def test_null_dlsym(self):
+         import subprocess
+         import tempfile
+ 
+-        retcode = subprocess.call(["gcc", "--version"],
+-                                  stdout=subprocess.DEVNULL,
+-                                  stderr=subprocess.DEVNULL)
+-        if retcode != 0:
++        try:
++            retcode = subprocess.call(["gcc", "--version"],
++                                      stdout=subprocess.DEVNULL,
++                                      stderr=subprocess.DEVNULL)
++        except:
+             self.skipTest("gcc is missing")
++        if retcode != 0:
++            self.skipTest("gcc is not working")
+ 
+         pipe_r, pipe_w = os.pipe()
+         self.addCleanup(os.close, pipe_r)
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index c9ef409018..5a1f9ffccf 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -73,7 +73,7 @@ index 9270b5f..955daad 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -2158,7 +2159,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
+@@ -2179,7 +2180,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -82,7 +82,7 @@ index 9270b5f..955daad 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -2430,7 +2431,7 @@ yes)
+@@ -2451,7 +2452,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -91,7 +91,7 @@ index 9270b5f..955daad 100644
              [*icc*], [ac_cv_disable_unused_result_warning=no]
              [PY_CHECK_CC_WARNING([disable], [unused-result])])
      AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2676,7 +2677,7 @@ yes)
+@@ -2697,7 +2698,7 @@ yes)
      ;;
  esac
  
@@ -100,7 +100,7 @@ index 9270b5f..955daad 100644
  *mpicc*)
      CFLAGS_NODIST="$CFLAGS_NODIST"
      ;;
-@@ -3511,7 +3512,7 @@ then
+@@ -3532,7 +3533,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -109,7 +109,7 @@ index 9270b5f..955daad 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6832,7 +6833,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6853,7 +6854,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index 3568d92bda..f9dc0ddcda 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -20,7 +20,7 @@ diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
 index fab124a..291dd48 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -141,6 +141,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -28,7 +28,7 @@ index fab124a..291dd48 100644
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -371,6 +372,7 @@ readline.write_history_file(history_file)
+@@ -379,6 +380,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index f5e500b146..e917c8bdf0 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -18,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index 6e465a4..13c4835 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6537,12 +6537,6 @@ AS_VAR_IF([have_panel], [no], [
+@@ -6558,12 +6558,6 @@ AS_VAR_IF([have_panel], [no], [
    AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
  ])
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index f420404f34..862b648685 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2265,7 +2265,7 @@ COMPILEALL_OPTS=-j0
+@@ -2266,7 +2266,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.8.bb b/meta/recipes-devtools/python/python3_3.12.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.8.bb
rename to meta/recipes-devtools/python/python3_3.12.9.bb
index 94e0f24f89..8e03ff5f2b 100644
--- a/meta/recipes-devtools/python/python3_3.12.8.bb
+++ b/meta/recipes-devtools/python/python3_3.12.9.bb
@@ -34,13 +34,14 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
+           file://0001-ctypes-correct-gcc-check-in-test.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "c909157bb25ec114e5869124cc2a9c4a4d4c1e957ca4ff553f1edc692101154e"
+SRC_URI[sha256sum] = "7220835d9f90b37c006e9842a8dff4580aaca4318674f947302b8d28f3f81112"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


