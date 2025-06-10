Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EE9C71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:39:00 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.96542.1749584332232033172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vz0Tfd9e;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af6a315b491so4806167a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584331; x=1750189131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC79uzMV+j5sdbZdVsrLPDhtUDRz1rYLqEVZFVqxS6E=;
        b=vz0Tfd9exOOODkFdCjycWw6yWx/REHn1WQk2r+4JfEDa3xwavZ5ERbPy8QHI1jLbSD
         Lt2wdCYKaruQiknovPyp32tN3Gxjj80B/ZyjTUTh5nOoaZvqz05W07bstfBsNp8sND4S
         0lhrIiF19vfrDgokluYwN9EMVJW4H1qsXJHE1hgy/kwOobzGcyrx0vpVgY5UP+no9rIT
         LGyKJ5bO3hfm7jEf59S1vhGWrioNoR6cD/HNF9ZStvo6u+FPyuNGrErj97xzT+oxNm1D
         nvUKSpqHKD6+9e8O+ukof+ScZo09psx6zoZZ9xAzQAXX7CBzCbh8UFKZ/Hu2dBuyZwfI
         hqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584331; x=1750189131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JC79uzMV+j5sdbZdVsrLPDhtUDRz1rYLqEVZFVqxS6E=;
        b=FQ5KWpO3mIsr3sg+qbq6r+Hh8VkBbN8JpuXrRCbTrN8yy2sjgTN0X9ul9d0grhq1Zi
         83KPbDxUk1c9mh1BZ9IdLhD5hA5QlGZ3psoElCIndieaDQ2YTQwKhk9iMiWloUPgebe6
         vydgRelcMMbs5ak4yRNnAqdw1A6ePxCsTod4XluH0mUPXWMmDjDo6LxOfwrPxZ/M4V/S
         uoINLYh78ZpLP66BDEXygbHhO7OwTEvmZWjHG+WQLTCGF5zdk+23MIfv8l+qojoId8rU
         BwfYyKQHiM2OdG5EH2rx7y4DdfXnqt8A9q4G0uYtIQ2f/czr04ML0GEEplibZvWvz3Mv
         AA3A==
X-Gm-Message-State: AOJu0Yxx2gKp7f5DJ0UwXaZCpJub1yiH93LuM1wfrsPV6nWrH1upaeT3
	qCoKbD4E7gEseYCLavQSnxTo3Ko8I3vdiZI/bF1+ZmecVSyHWz5Erb/5Bzi+6SO1EJdvuZh9k5H
	NIhLT
X-Gm-Gg: ASbGncv0gRN220HvEgQIxDNBqPF0IL6L1ijm9wEgDoHo1TWqTQgoCHTOSi1MTpvMhyo
	ayY6Z654I1bJvek5VUFuQQT2pNWzcpYqFkNMvXW74ccBrN817GhmzASROXu18CeG/tUPl3WMUyT
	sMmC3Jfz/27mM1sew1BKJPGkHViqml1Ixz8vl7pnykCCStRq82iz/u/H8m1nS9XX6ANjxGBdM4U
	xgvcSRarnSU7IddEMouF0j+jOIDNUVzxikhzdvP41GnUFhjFiUo6EfSKAtLWyHJqAXVv5b3u47D
	aTYzZTBoaz4w1zzOKnae6BbkRDC0g352Lxpw1EwgbkOr8dCUnk869g==
X-Google-Smtp-Source: AGHT+IFUeryogNDnEnxqXaFpSfb0G1Ua4w8zjvV00nzmFEO0IzjTLiF6V9I9SycH8AwcBbor52Efvw==
X-Received: by 2002:a05:6a21:3286:b0:21f:5b6f:36d5 with SMTP id adf61e73a8af0-21f88fd47a2mr41867637.10.1749584330933;
        Tue, 10 Jun 2025 12:38:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] python3: upgrade 3.10.16 -> 3.10.18
Date: Tue, 10 Jun 2025 12:38:20 -0700
Message-ID: <838a8b5ca148dfa6c6c2c76f1705d1e358a31648.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218435

From: Peter Marko <peter.marko@siemens.com>

Drop upstreamed patch and refresh remaining patches.

* https://www.python.org/downloads/release/python-31017/

  Security content in this release
  * gh-131809: Upgrade vendored expat to 2.7.1
  * gh-80222: Folding of quoted string in display_name violates RFC
  * gh-121284: Invalid RFC 2047 address header after refolding with
    email.policy.default
  * gh-131261: Update libexpat to 2.7.0
  * gh-105704: CVE-2025-0938 urlparse does not flag hostname containing
    [ or ] as incorrect
  * gh-119511: OOM vulnerability in the imaplib module

* https://www.python.org/downloads/release/python-31018/

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
 ...ib-termcap-to-linker-flags-to-avoid-.patch |   2 +-
 ...hell-version-of-python-config-that-w.patch |   2 +-
 ...file-do-not-compile-.pyc-in-parallel.patch |   2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   6 +-
 ...e-treat-overflow-in-UID-GID-as-failu.patch |   2 +-
 ...asename-to-replace-CC-for-checking-c.patch |  16 +--
 ...detect-multiarch-paths-when-cross-co.patch |   2 +-
 ...orlines-skip-due-to-load-variability.patch |   2 +-
 ...report-missing-dependencies-for-disa.patch |   2 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |   4 +-
 .../python/python3/CVE-2025-0938.patch        | 131 ------------------
 .../python3/avoid_warning_about_tkinter.patch |   2 +-
 .../python/python3/makerace.patch             |   2 +-
 ...{python3_3.10.16.bb => python3_3.10.18.bb} |   3 +-
 14 files changed, 23 insertions(+), 155 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-0938.patch
 rename meta/recipes-devtools/python/{python3_3.10.16.bb => python3_3.10.18.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
index 62ef6efc28..47637d24d8 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
@@ -15,7 +15,7 @@ diff --git a/setup.py b/setup.py
 index 43e807f..11b5cf5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1149,7 +1149,6 @@ class PyBuildExt(build_ext):
+@@ -1153,7 +1153,6 @@ class PyBuildExt(build_ext):
                                                       'termcap'):
                  readline_libs.append('termcap')
              self.add(Extension('readline', ['readline.c'],
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
index d98f243cb1..c74a1c58a1 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index ee85f35..f0aedb7 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1640,12 +1640,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -1641,12 +1641,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
  	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
  	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
index 2f037ecb09..88ba84d64d 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
@@ -26,7 +26,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index edd70d4..5e13ba2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1601,30 +1601,30 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1602,30 +1602,30 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  	fi
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 96c5a3c840..07ab4ed540 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -20,7 +20,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 3bc5b8f..a6e106d 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -568,6 +568,7 @@ class _TestProcess(BaseTestCase):
+@@ -575,6 +575,7 @@ class _TestProcess(BaseTestCase):
  
          close_queue(q)
  
@@ -28,7 +28,7 @@ index 3bc5b8f..a6e106d 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -4817,6 +4818,7 @@ class TestWait(unittest.TestCase):
+@@ -4829,6 +4830,7 @@ class TestWait(unittest.TestCase):
          sem.release()
          time.sleep(period)
  
@@ -40,7 +40,7 @@ diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
 index 875615a..aebaa8c 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -474,6 +474,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -475,6 +475,7 @@ class TimeTestCase(unittest.TestCase):
      def test_perf_counter(self):
          time.perf_counter()
  
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 88b84c6024..e6d7778ccd 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -16,7 +16,7 @@ diff --git a/Lib/tarfile.py b/Lib/tarfile.py
 index 3bbbcaa..473167d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2557,7 +2557,8 @@ class TarFile(object):
+@@ -2675,7 +2675,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 6bb85fcb34..49c918b3b0 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -47,7 +47,7 @@ index 0c06914..299786b 100644
          gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
          cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
          clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
-@@ -976,7 +977,7 @@ rmdir CaseSensitiveTestDir
+@@ -981,7 +982,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -56,7 +56,7 @@ index 0c06914..299786b 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1374,7 +1375,7 @@ else
+@@ -1379,7 +1380,7 @@ else
  fi],
  [AC_MSG_RESULT(no)])
  if test "$Py_LTO" = 'true' ; then
@@ -65,7 +65,7 @@ index 0c06914..299786b 100644
      *clang*)
        AC_SUBST(LLVM_AR)
        AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
-@@ -1467,7 +1468,7 @@ then
+@@ -1472,7 +1473,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -74,7 +74,7 @@ index 0c06914..299786b 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -1528,7 +1529,7 @@ esac
+@@ -1533,7 +1534,7 @@ esac
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -83,7 +83,7 @@ index 0c06914..299786b 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -1664,7 +1665,7 @@ yes)
+@@ -1669,7 +1670,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -92,7 +92,7 @@ index 0c06914..299786b 100644
      *icc*)
      ac_cv_disable_unused_result_warning=no
      ;;
-@@ -2018,7 +2019,7 @@ yes)
+@@ -2023,7 +2024,7 @@ yes)
      ;;
  esac
  
@@ -101,7 +101,7 @@ index 0c06914..299786b 100644
  *icc*)
      # ICC needs -fp-model strict or floats behave badly
      CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
-@@ -2836,7 +2837,7 @@ then
+@@ -2841,7 +2842,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -110,7 +110,7 @@ index 0c06914..299786b 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -5622,7 +5623,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
+@@ -5628,7 +5629,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch b/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
index 1844e0efa3..0e243325c7 100644
--- a/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
@@ -27,7 +27,7 @@ diff --git a/setup.py b/setup.py
 index 2e7f263..f7a3d39 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -840,7 +840,8 @@ class PyBuildExt(build_ext):
+@@ -839,7 +839,8 @@ class PyBuildExt(build_ext):
          # only change this for cross builds for 3.3, issues on Mageia
          if CROSS_COMPILING:
              self.add_cross_compiling_paths()
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index 199031d42a..20d125963f 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
 index 082a90d46b..508814d56a 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
-@@ -629,6 +629,7 @@ def test_storbinary_rest(self):
+@@ -629,6 +629,7 @@ class TestFTPClass(TestCase):
              self.client.storbinary('stor', f, rest=r)
              self.assertEqual(self.server.handler_instance.rest, str(r))
  
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 8c554feb4b..025239df1d 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index 85a2b26357..7605347bf5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -517,6 +517,14 @@ def print_three_column(lst):
+@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
                  print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
                                                longest, g))
  
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index 30d2906439..78295e6791 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -21,7 +21,7 @@ diff --git a/configure.ac b/configure.ac
 index e5e3df8..bfdd987 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5092,12 +5092,6 @@ then
+@@ -5097,12 +5097,6 @@ then
    [Define if you have struct stat.st_mtimensec])
  fi
  
@@ -38,7 +38,7 @@ diff --git a/setup.py b/setup.py
 index 62f0e18..c190002 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1169,8 +1169,6 @@ class PyBuildExt(build_ext):
+@@ -1173,8 +1173,6 @@ class PyBuildExt(build_ext):
          panel_library = 'panel'
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
diff --git a/meta/recipes-devtools/python/python3/CVE-2025-0938.patch b/meta/recipes-devtools/python/python3/CVE-2025-0938.patch
deleted file mode 100644
index 5730008f4b..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2025-0938.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 19 Feb 2025 14:36:23 +0100
-Subject: [PATCH] [3.10] gh-105704: Disallow square brackets (`[` and `]`) in
- domain names for parsed URLs (GH-129418) (#129529)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-(cherry picked from commit d89a5f6a6e65511a5f6e0618c4c30a7aa5aba56a)
-
-Co-authored-by: Seth Michael Larson <seth@python.org>
-Co-authored-by: Peter Bierma <zintensitydev@gmail.com>
-Co-authored-by: Łukasz Langa <lukasz@langa.pl>
-
-CVE: CVE-2025-0938
-Upstream-Status: Backport [https://github.com/python/cpython/commit/b8b4b713c5f8ec0958c7ef8d29d6711889bc94ab]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Lib/test/test_urlparse.py                     | 37 ++++++++++++++++++-
- Lib/urllib/parse.py                           | 20 +++++++++-
- ...-01-28-14-08-03.gh-issue-105704.EnhHxu.rst |  4 ++
- 3 files changed, 58 insertions(+), 3 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
-
-diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
-index f2ffc452e5..280644ef0b 100644
---- a/Lib/test/test_urlparse.py
-+++ b/Lib/test/test_urlparse.py
-@@ -1149,16 +1149,51 @@ class UrlParseTestCase(unittest.TestCase):
-         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@[0439:23af::2309::fae7:1234]/Path?Query')
-         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@[0439:23af:2309::fae7:1234:2342:438e:192.0.2.146]/Path?Query')
-         self.assertRaises(ValueError, urllib.parse.urlsplit, 'Scheme://user@]v6a.ip[/Path')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]/')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix/')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip]?')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip].suffix?')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]/')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix/')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]?')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix?')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:a')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:a')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:a1')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:a1')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:1a')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:1a')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[::1].suffix:/')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[::1]:?')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://user@prefix.[v6a.ip]')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://user@[v6a.ip].suffix')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://[v6a.ip')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip]')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://]v6a.ip[')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://]v6a.ip')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip[')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix.[v6a.ip')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip].suffix')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix]v6a.ip[suffix')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://prefix]v6a.ip')
-+        self.assertRaises(ValueError, urllib.parse.urlsplit, 'scheme://v6a.ip[suffix')
- 
-     def test_splitting_bracketed_hosts(self):
--        p1 = urllib.parse.urlsplit('scheme://user@[v6a.ip]/path?query')
-+        p1 = urllib.parse.urlsplit('scheme://user@[v6a.ip]:1234/path?query')
-         self.assertEqual(p1.hostname, 'v6a.ip')
-         self.assertEqual(p1.username, 'user')
-         self.assertEqual(p1.path, '/path')
-+        self.assertEqual(p1.port, 1234)
-         p2 = urllib.parse.urlsplit('scheme://user@[0439:23af:2309::fae7%test]/path?query')
-         self.assertEqual(p2.hostname, '0439:23af:2309::fae7%test')
-         self.assertEqual(p2.username, 'user')
-         self.assertEqual(p2.path, '/path')
-+        self.assertIs(p2.port, None)
-         p3 = urllib.parse.urlsplit('scheme://user@[0439:23af:2309::fae7:1234:192.0.2.146%test]/path?query')
-         self.assertEqual(p3.hostname, '0439:23af:2309::fae7:1234:192.0.2.146%test')
-         self.assertEqual(p3.username, 'user')
-diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
-index 07e3248504..e1ee36d98e 100644
---- a/Lib/urllib/parse.py
-+++ b/Lib/urllib/parse.py
-@@ -442,6 +442,23 @@ def _checknetloc(netloc):
-             raise ValueError("netloc '" + netloc + "' contains invalid " +
-                              "characters under NFKC normalization")
- 
-+def _check_bracketed_netloc(netloc):
-+    # Note that this function must mirror the splitting
-+    # done in NetlocResultMixins._hostinfo().
-+    hostname_and_port = netloc.rpartition('@')[2]
-+    before_bracket, have_open_br, bracketed = hostname_and_port.partition('[')
-+    if have_open_br:
-+        # No data is allowed before a bracket.
-+        if before_bracket:
-+            raise ValueError("Invalid IPv6 URL")
-+        hostname, _, port = bracketed.partition(']')
-+        # No data is allowed after the bracket but before the port delimiter.
-+        if port and not port.startswith(":"):
-+            raise ValueError("Invalid IPv6 URL")
-+    else:
-+        hostname, _, port = hostname_and_port.partition(':')
-+    _check_bracketed_host(hostname)
-+
- # Valid bracketed hosts are defined in
- # https://www.rfc-editor.org/rfc/rfc3986#page-49 and https://url.spec.whatwg.org/
- def _check_bracketed_host(hostname):
-@@ -505,8 +522,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
-                 (']' in netloc and '[' not in netloc)):
-             raise ValueError("Invalid IPv6 URL")
-         if '[' in netloc and ']' in netloc:
--            bracketed_host = netloc.partition('[')[2].partition(']')[0]
--            _check_bracketed_host(bracketed_host)
-+            _check_bracketed_netloc(netloc)
-     if allow_fragments and '#' in url:
-         url, fragment = url.split('#', 1)
-     if '?' in url:
-diff --git a/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst b/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
-new file mode 100644
-index 0000000000..bff1bc6b0d
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2025-01-28-14-08-03.gh-issue-105704.EnhHxu.rst
-@@ -0,0 +1,4 @@
-+When using :func:`urllib.parse.urlsplit` and :func:`urllib.parse.urlparse` host
-+parsing would not reject domain names containing square brackets (``[`` and
-+``]``). Square brackets are only valid for IPv6 and IPvFuture hosts according to
-+`RFC 3986 Section 3.2.2 <https://www.rfc-editor.org/rfc/rfc3986#section-3.2.2>`__.
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
index 2de72b7199..3b4b170f7f 100644
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -18,7 +18,7 @@ diff --git a/setup.py b/setup.py
 index 11b5cf5..2be4738 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1895,8 +1895,8 @@ class PyBuildExt(build_ext):
+@@ -1902,8 +1902,8 @@ class PyBuildExt(build_ext):
          self.detect_decimal()
          self.detect_ctypes()
          self.detect_multiprocessing()
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 2c06784ffc..cfcc798c05 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -21,7 +21,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 5e13ba2..026bffd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1527,7 +1527,7 @@ TESTSUBDIRS=	ctypes/test \
+@@ -1528,7 +1528,7 @@ TESTSUBDIRS=	ctypes/test \
  		unittest/test unittest/test/testmock
  
  TEST_MODULES=@TEST_MODULES@
diff --git a/meta/recipes-devtools/python/python3_3.10.16.bb b/meta/recipes-devtools/python/python3_3.10.18.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.16.bb
rename to meta/recipes-devtools/python/python3_3.10.18.bb
index 932791f38d..0b57a0ebee 100644
--- a/meta/recipes-devtools/python/python3_3.10.16.bb
+++ b/meta/recipes-devtools/python/python3_3.10.18.bb
@@ -37,7 +37,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
-           file://CVE-2025-0938.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -46,7 +45,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "bfb249609990220491a1b92850a07135ed0831e41738cf681d63cf01b2a8fbd1"
+SRC_URI[sha256sum] = "ae665bc678abd9ab6a6e1573d2481625a53719bc517e9a634ed2b9fefae3817f"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


