Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF1DC636D5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.9413.1649926646876986621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SFNKRYyr;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id c6so5465799edn.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xJP211fWBCica7ikbsS2SZu2f9GcTahvVR5Zy/F0Ng=;
        b=SFNKRYyrsNL2STy9APH283rDOjHQPmgOpkFC0hLo+aEiVm/EVgeHiV/WJAcNriIZ1e
         V7oDPGeyWeFk+ISuLBeVrAj3QbdRuUzfnP8ORhTfAArzDlRAZohG5jRpcNlj/Mn5vQMp
         gkyxUQEvmm6N26ZZmnpM5mY0NeLhFWlpUn8o6malC/k6hFEZ3p8ASRfpAB2fcScLmYMG
         ZF5mNpjM5mB9zSXoIla8430EU30yGqdl1AVcAEXyOIUCaxJKaKjEv/58JWVIrj4KxX9A
         q8lMGzrgs99HDDcWXlHekqPl+1VS++RQErOI596BXGM2PExfttGO2mJoX4uq0VZY/Xz0
         ezow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xJP211fWBCica7ikbsS2SZu2f9GcTahvVR5Zy/F0Ng=;
        b=GnO7pjb1gcyyN7qLDtBvrBKAXPylbhTbjXCOjCE82OkWwDUlWtKQkNFgntDTMtzMtQ
         rFGIq1R1VJPpai/a6TRPc6MreNnEsbJBTmg4UEpSbvb6Ks/yZiVAsJ1+lQbPc1V527T2
         ZA9D5NZx91brvekISuQ5G6oG/U7wK8dzeXREV+rK2NXoNlBll2mGi58zoYGxMiIIUqFu
         bAZTBeyUBxs5SQnNihHD+dFLq/X9suJYVAt7YKL3wE2cOnpPwog8uJqAJ7EXO6xxgvL0
         lb7IZUlFkZak8Yt8Lej/XYnHMDvlrgjFxVaprIGwSyzIhJoiB5DttxBRQxe/i5UwR5eF
         4tcw==
X-Gm-Message-State: AOAM5320lw9KNa1AfYg2hpq4ufyl5x38ZOhzw+Gt+TkLQ6JTDMIdaWIO
	Efpkpi2mN2xm4YYQzlWvQNVIrNHNJpM=
X-Google-Smtp-Source: 
 ABdhPJwV1t7FrwVFMf4o0S1D3yjVdCVkKjqak/0lbUf54QDKQXUvsKFqEUwJOE1pQdNe/8MVQQA5Sg==
X-Received: by 2002:a05:6402:274e:b0:419:81a1:ed9b with SMTP id
 z14-20020a056402274e00b0041981a1ed9bmr1894491edd.9.1649926644488;
        Thu, 14 Apr 2022 01:57:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm429542ejb.35.2022.04.14.01.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:57:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] python3-psutil: enable ptest
Date: Thu, 14 Apr 2022 10:57:08 +0200
Message-Id: <20220414085710.2010223-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414085710.2010223-1-alex@linutronix.de>
References: <20220414085710.2010223-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164399

Also, replace a mass-test-disabling patch with more targeted fixes and
submit them upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../distro/include/ptest-packagelists.inc     |   1 +
 .../0001-fix-failure-test-cases.patch         | 197 ------------------
 ...im-possible-dirty-suffix-from-free-V.patch |  27 +++
 ...rectly-skip-test-if-setup.py-does-no.patch |  27 +++
 ...e-mountpoint-as-df-argument-and-not-.patch |  27 +++
 ...y-drop-test-for-presence-of-io_count.patch |  29 +++
 ...drop-initial-check-for-ionice-class-.patch |  27 +++
 .../python/python3-psutil/run-ptest           |   3 +
 .../python/python3-psutil_5.9.0.bb            |  15 +-
 9 files changed, 150 insertions(+), 203 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
 create mode 100644 meta/recipes-devtools/python/python3-psutil/0001-test_linux.py-trim-possible-dirty-suffix-from-free-V.patch
 create mode 100644 meta/recipes-devtools/python/python3-psutil/0002-test_misc.py-correctly-skip-test-if-setup.py-does-no.patch
 create mode 100644 meta/recipes-devtools/python/python3-psutil/0003-test_posix.py-use-mountpoint-as-df-argument-and-not-.patch
 create mode 100644 meta/recipes-devtools/python/python3-psutil/0004-test_contracts.py-drop-test-for-presence-of-io_count.patch
 create mode 100644 meta/recipes-devtools/python/python3-psutil/0005-test_process.py-drop-initial-check-for-ionice-class-.patch
 create mode 100644 meta/recipes-devtools/python/python3-psutil/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b51cce4d9e..0e1083646e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST = "\
     python3-markupsafe-ptest \
     python3-more-itertools-ptest \
     python3-pluggy-ptest \
+    python3-psutil-ptest \
     python3-pyasn1-ptest \
     python3-pytz-ptest \
     python3-wcwidth-ptest \
diff --git a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch b/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
deleted file mode 100644
index 34ea03b27f..0000000000
--- a/meta/recipes-devtools/python/python3-psutil/0001-fix-failure-test-cases.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-From 8b4e38958ff8bdbb3ece4796bfa2d3b6f7536f71 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 23 Feb 2022 11:54:40 +0800
-Subject: [PATCH] fix failure test cases
-
-The test cases is not robust enough. skip some cases that is
-not suitable for all conditions.
-
-* test_io_counters failed when kernel config CONFIG_TASKSTATS
-  and CONFIG_TASK_IO_ACCOUNTING are not enable in OE 
-* test_setup_script failed since oe don't install setup.py
-* test_used failed since oe use git source for free, so the version
-  is 3.3.17-dirty
-* test_weird_environ failed since gcc not installed
-* test_debug failed since it is designed to run when PSUTIL_DEBUG is set
-* test_against_findmnt/test_comparisons/test_disk_partitions_mocked/
-  test_disk_partitions is not suitable for Linux nfs boot
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- psutil/tests/test_contracts.py | 1 +
- psutil/tests/test_linux.py     | 8 ++++++--
- psutil/tests/test_misc.py      | 4 ++++
- psutil/tests/test_process.py   | 5 +++++
- psutil/tests/test_system.py    | 1 +
- psutil/tests/test_unicode.py   | 4 +++-
- 6 files changed, 20 insertions(+), 3 deletions(-)
-
-diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_contracts.py
-index 7401cc1..bf0fca0 100755
---- a/psutil/tests/test_contracts.py
-+++ b/psutil/tests/test_contracts.py
-@@ -172,6 +172,7 @@ class TestAvailProcessAPIs(PsutilTestCase):
-     def test_rlimit(self):
-         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX or FREEBSD)
- 
-+    @unittest.skip("broken on OE since kernel config maye not be enabled")
-     def test_io_counters(self):
-         hasit = hasattr(psutil.Process, "io_counters")
-         self.assertEqual(hasit, False if MACOS or SUNOS else True)
-diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
-index 20e28d2..66b6dda 100755
---- a/psutil/tests/test_linux.py
-+++ b/psutil/tests/test_linux.py
-@@ -196,8 +196,9 @@ def get_free_version_info():
-     out = sh(["free", "-V"]).strip()
-     if 'UNKNOWN' in out:
-         raise unittest.SkipTest("can't determine free version")
--    return tuple(map(int, out.split()[-1].split('.')))
--
-+    vlist = out.split()[-1].split('.')
-+    vlist[:] = [n.split('-')[0] for n in vlist]
-+    return tuple(map(int, vlist))
- 
- @contextlib.contextmanager
- def mock_open_content(for_path, content):
-@@ -1289,6 +1290,7 @@ class TestRootFsDeviceFinder(PsutilTestCase):
-         finder.ask_sys_class_block()
- 
-     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
-+    @unittest.skip("Broken for oe")
-     def test_comparisons(self):
-         finder = RootFsDeviceFinder()
-         self.assertIsNotNone(finder.find())
-@@ -1311,11 +1313,13 @@ class TestRootFsDeviceFinder(PsutilTestCase):
- 
-     @unittest.skipIf(not which("findmnt"), "findmnt utility not available")
-     @unittest.skipIf(GITHUB_ACTIONS, "unsupported on GITHUB_ACTIONS")
-+    @unittest.skip("Broken for oe")
-     def test_against_findmnt(self):
-         psutil_value = RootFsDeviceFinder().find()
-         findmnt_value = sh("findmnt -o SOURCE -rn /")
-         self.assertEqual(psutil_value, findmnt_value)
- 
-+    @unittest.skip("Broken for oe")
-     def test_disk_partitions_mocked(self):
-         with mock.patch(
-                 'psutil._pslinux.cext.disk_partitions',
-diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
-index d946eb6..121004a 100755
---- a/psutil/tests/test_misc.py
-+++ b/psutil/tests/test_misc.py
-@@ -54,6 +54,8 @@ from psutil.tests import unittest
- # ===================================================================
- 
- 
-+PSUTIL_DEBUG = bool(os.getenv('PSUTIL_DEBUG', 0))
-+
- class TestMisc(PsutilTestCase):
- 
-     def test_process__repr__(self, func=repr):
-@@ -368,6 +370,7 @@ class TestMisc(PsutilTestCase):
- 
-     # XXX: https://github.com/pypa/setuptools/pull/2896
-     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setuptools bug")
-+    @unittest.skip("OE run this test outof source tree")
-     def test_setup_script(self):
-         setup_py = os.path.join(ROOT_DIR, 'setup.py')
-         if CI_TESTING and not os.path.exists(setup_py):
-@@ -401,6 +404,7 @@ class TestMisc(PsutilTestCase):
-                 reload_module(psutil)
-             self.assertIn("version conflict", str(cm.exception).lower())
- 
-+    @unittest.skipIf(not PSUTIL_DEBUG, "env PSUTIL_DEBUG not set")
-     def test_debug(self):
-         if PY3:
-             from io import StringIO
-diff --git a/psutil/tests/test_process.py b/psutil/tests/test_process.py
-index c9059e3..a34ba3d 100755
---- a/psutil/tests/test_process.py
-+++ b/psutil/tests/test_process.py
-@@ -36,6 +36,7 @@ from psutil._compat import PY3
- from psutil._compat import FileNotFoundError
- from psutil._compat import long
- from psutil._compat import super
-+from psutil._compat import which
- from psutil.tests import APPVEYOR
- from psutil.tests import CI_TESTING
- from psutil.tests import GITHUB_ACTIONS
-@@ -726,6 +727,7 @@ class TestProcess(PsutilTestCase):
-             self.assertEqual(' '.join(p.cmdline()), ' '.join(cmdline))
- 
-     @unittest.skipIf(PYPY, "broken on PYPY")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_long_cmdline(self):
-         testfn = self.get_testfn()
-         create_exe(testfn)
-@@ -740,6 +742,7 @@ class TestProcess(PsutilTestCase):
-         assert pyexe.startswith(name), (pyexe, name)
- 
-     @unittest.skipIf(PYPY, "unreliable on PYPY")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_long_name(self):
-         testfn = self.get_testfn(suffix="0123456789" * 2)
-         create_exe(testfn)
-@@ -750,6 +753,7 @@ class TestProcess(PsutilTestCase):
-     @unittest.skipIf(SUNOS, "broken on SUNOS")
-     @unittest.skipIf(AIX, "broken on AIX")
-     @unittest.skipIf(PYPY, "broken on PYPY")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_prog_w_funky_name(self):
-         # Test that name(), exe() and cmdline() correctly handle programs
-         # with funky chars such as spaces and ")", see:
-@@ -1408,6 +1412,7 @@ class TestProcess(PsutilTestCase):
- 
-     @unittest.skipIf(not HAS_ENVIRON, "not supported")
-     @unittest.skipIf(not POSIX, "POSIX only")
-+    @unittest.skipIf(not which("gcc"), "gcc not installed")
-     def test_weird_environ(self):
-         # environment variables can contain values without an equals sign
-         code = textwrap.dedent("""
-diff --git a/psutil/tests/test_system.py b/psutil/tests/test_system.py
-index db2cb34..5ee519f 100755
---- a/psutil/tests/test_system.py
-+++ b/psutil/tests/test_system.py
-@@ -580,6 +580,7 @@ class TestDiskAPIs(PsutilTestCase):
-     def test_disk_usage_bytes(self):
-         psutil.disk_usage(b'.')
- 
-+    @unittest.skip("Broken for oe")
-     def test_disk_partitions(self):
-         def check_ntuple(nt):
-             self.assertIsInstance(nt.device, str)
-diff --git a/psutil/tests/test_unicode.py b/psutil/tests/test_unicode.py
-index e635726..7ba5b0f 100755
---- a/psutil/tests/test_unicode.py
-+++ b/psutil/tests/test_unicode.py
-@@ -86,6 +86,7 @@ from psutil import POSIX
- from psutil import WINDOWS
- from psutil._compat import PY3
- from psutil._compat import u
-+from psutil._compat import which
- from psutil.tests import APPVEYOR
- from psutil.tests import ASCII_FS
- from psutil.tests import CI_TESTING
-@@ -156,7 +157,7 @@ def try_unicode(suffix):
- # FS APIs
- # ===================================================================
- 
--
-+@unittest.skipIf(not which("gcc"), "gcc not installed")
- class BaseUnicodeTest(PsutilTestCase):
-     funky_suffix = None
- 
-@@ -169,6 +170,7 @@ class BaseUnicodeTest(PsutilTestCase):
- @serialrun
- @unittest.skipIf(ASCII_FS, "ASCII fs")
- @unittest.skipIf(PYPY and not PY3, "too much trouble on PYPY2")
-+@unittest.skipIf(not which("gcc"), "gcc not installed")
- class TestFSAPIs(BaseUnicodeTest):
-     """Test FS APIs with a funky, valid, UTF8 path name."""
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-psutil/0001-test_linux.py-trim-possible-dirty-suffix-from-free-V.patch b/meta/recipes-devtools/python/python3-psutil/0001-test_linux.py-trim-possible-dirty-suffix-from-free-V.patch
new file mode 100644
index 0000000000..f43bcd3604
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/0001-test_linux.py-trim-possible-dirty-suffix-from-free-V.patch
@@ -0,0 +1,27 @@
+From a5341e9ab25da217de49f80b2dd42dd40124d863 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 11:30:37 +0200
+Subject: [PATCH] test_linux.py: trim possible -dirty suffix from 'free -V'
+ output
+
+This can happen if free was built from git.
+
+Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ psutil/tests/test_linux.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psutil/tests/test_linux.py b/psutil/tests/test_linux.py
+index 20e28d2..7eb1c0b 100755
+--- a/psutil/tests/test_linux.py
++++ b/psutil/tests/test_linux.py
+@@ -196,7 +196,7 @@ def get_free_version_info():
+     out = sh(["free", "-V"]).strip()
+     if 'UNKNOWN' in out:
+         raise unittest.SkipTest("can't determine free version")
+-    return tuple(map(int, out.split()[-1].split('.')))
++    return tuple(map(int, out.split()[-1].split('-')[0].split('.')))
+ 
+ 
+ @contextlib.contextmanager
diff --git a/meta/recipes-devtools/python/python3-psutil/0002-test_misc.py-correctly-skip-test-if-setup.py-does-no.patch b/meta/recipes-devtools/python/python3-psutil/0002-test_misc.py-correctly-skip-test-if-setup.py-does-no.patch
new file mode 100644
index 0000000000..ba2ef91f03
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/0002-test_misc.py-correctly-skip-test-if-setup.py-does-no.patch
@@ -0,0 +1,27 @@
+From f51162f9625e9ea95c0972b5363d38526de74b4c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 11:32:39 +0200
+Subject: [PATCH] test_misc.py: correctly skip test if setup.py does not exist
+
+This can happen if installed tests are run in a non-CI environment:
+$ python3 -m psutil.tests
+
+Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ psutil/tests/test_misc.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psutil/tests/test_misc.py b/psutil/tests/test_misc.py
+index d946eb6..72b23ef 100755
+--- a/psutil/tests/test_misc.py
++++ b/psutil/tests/test_misc.py
+@@ -370,7 +370,7 @@ class TestMisc(PsutilTestCase):
+     @unittest.skipIf(APPVEYOR, "temporarily disabled due to setuptools bug")
+     def test_setup_script(self):
+         setup_py = os.path.join(ROOT_DIR, 'setup.py')
+-        if CI_TESTING and not os.path.exists(setup_py):
++        if CI_TESTING or not os.path.exists(setup_py):
+             return self.skipTest("can't find setup.py")
+         module = import_module_by_path(setup_py)
+         self.assertRaises(SystemExit, module.setup)
diff --git a/meta/recipes-devtools/python/python3-psutil/0003-test_posix.py-use-mountpoint-as-df-argument-and-not-.patch b/meta/recipes-devtools/python/python3-psutil/0003-test_posix.py-use-mountpoint-as-df-argument-and-not-.patch
new file mode 100644
index 0000000000..59b0862b70
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/0003-test_posix.py-use-mountpoint-as-df-argument-and-not-.patch
@@ -0,0 +1,27 @@
+From 6bef0cf58f4c734bdbcb8b272ee621d532ed6b98 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 11:43:34 +0200
+Subject: [PATCH] test_posix.py: use mountpoint as df argument, and not device
+
+This is more reliable as in virtual machines such as qemu there may
+not be an accurate mapping to devices.
+
+Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ psutil/tests/test_posix.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/psutil/tests/test_posix.py b/psutil/tests/test_posix.py
+index 31b8192..22fb518 100755
+--- a/psutil/tests/test_posix.py
++++ b/psutil/tests/test_posix.py
+@@ -392,7 +392,7 @@ class TestSystemAPIs(PsutilTestCase):
+         for part in psutil.disk_partitions(all=False):
+             usage = psutil.disk_usage(part.mountpoint)
+             try:
+-                total, used, free, percent = df(part.device)
++                total, used, free, percent = df(part.mountpoint)
+             except RuntimeError as err:
+                 # see:
+                 # https://travis-ci.org/giampaolo/psutil/jobs/138338464
diff --git a/meta/recipes-devtools/python/python3-psutil/0004-test_contracts.py-drop-test-for-presence-of-io_count.patch b/meta/recipes-devtools/python/python3-psutil/0004-test_contracts.py-drop-test-for-presence-of-io_count.patch
new file mode 100644
index 0000000000..0320076d66
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/0004-test_contracts.py-drop-test-for-presence-of-io_count.patch
@@ -0,0 +1,29 @@
+From e79bd02a30d8bfeee53568bc9d51258f2022298e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 12:03:36 +0200
+Subject: [PATCH] test_contracts.py: drop test for presence of io_counters
+
+This may be absent on Linux as well (if the kernel is configured that way),
+so the test becomes meaningless.
+
+Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ psutil/tests/test_contracts.py | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/psutil/tests/test_contracts.py b/psutil/tests/test_contracts.py
+index 7401cc1..5697028 100755
+--- a/psutil/tests/test_contracts.py
++++ b/psutil/tests/test_contracts.py
+@@ -172,10 +172,6 @@ class TestAvailProcessAPIs(PsutilTestCase):
+     def test_rlimit(self):
+         self.assertEqual(hasattr(psutil.Process, "rlimit"), LINUX or FREEBSD)
+ 
+-    def test_io_counters(self):
+-        hasit = hasattr(psutil.Process, "io_counters")
+-        self.assertEqual(hasit, False if MACOS or SUNOS else True)
+-
+     def test_num_fds(self):
+         self.assertEqual(hasattr(psutil.Process, "num_fds"), POSIX)
+ 
diff --git a/meta/recipes-devtools/python/python3-psutil/0005-test_process.py-drop-initial-check-for-ionice-class-.patch b/meta/recipes-devtools/python/python3-psutil/0005-test_process.py-drop-initial-check-for-ionice-class-.patch
new file mode 100644
index 0000000000..09b429311a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/0005-test_process.py-drop-initial-check-for-ionice-class-.patch
@@ -0,0 +1,27 @@
+From 33f1b29a8909dfb4df651003e236049302f16b9d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 13 Apr 2022 12:13:22 +0200
+Subject: [PATCH] test_process.py: drop initial check for ionice class being
+ IOPriority.IOPRIO_CLASS_NONE
+
+On two of my machines running different distros it's IOPriority.IOPRIO_CLASS_BE.
+
+Upstream-Status: Submitted [https://github.com/giampaolo/psutil/pull/2097]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ psutil/tests/test_process.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/psutil/tests/test_process.py b/psutil/tests/test_process.py
+index c9059e3..af3d924 100755
+--- a/psutil/tests/test_process.py
++++ b/psutil/tests/test_process.py
+@@ -345,8 +345,6 @@ class TestProcess(PsutilTestCase):
+     @unittest.skipIf(not LINUX, "linux only")
+     def test_ionice_linux(self):
+         p = psutil.Process()
+-        if not CI_TESTING:
+-            self.assertEqual(p.ionice()[0], psutil.IOPRIO_CLASS_NONE)
+         self.assertEqual(psutil.IOPRIO_CLASS_NONE, 0)
+         self.assertEqual(psutil.IOPRIO_CLASS_RT, 1)  # high
+         self.assertEqual(psutil.IOPRIO_CLASS_BE, 2)  # normal
diff --git a/meta/recipes-devtools/python/python3-psutil/run-ptest b/meta/recipes-devtools/python/python3-psutil/run-ptest
new file mode 100644
index 0000000000..90900e967b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-psutil/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+PSUTIL_DEBUG=1 python3 -m psutil.tests 2>&1 | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.0.bb b/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
index df304f01e6..4ea3fcfbbf 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.0.bb
@@ -3,15 +3,18 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
+SRC_URI += "file://run-ptest \
+           file://0001-test_linux.py-trim-possible-dirty-suffix-from-free-V.patch \
+           file://0002-test_misc.py-correctly-skip-test-if-setup.py-does-no.patch \
+           file://0003-test_posix.py-use-mountpoint-as-df-argument-and-not-.patch \
+           file://0004-test_contracts.py-drop-test-for-presence-of-io_count.patch \
+           file://0005-test_process.py-drop-initial-check-for-ionice-class-.patch \
+           "
 SRC_URI[sha256sum] = "869842dbd66bb80c3217158e629d6fceaecc3a3166d3d1faee515b05dd26ca25"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
-SRC_URI += "file://0001-fix-failure-test-cases.patch"
-
-PACKAGES =+ "${PN}-tests"
-
-FILES:${PN}-tests += " \
+FILES:${PN}-ptest += " \
     ${PYTHON_SITEPACKAGES_DIR}/psutil/test* \
     ${PYTHON_SITEPACKAGES_DIR}/psutil/__pycache__/test* \
 "
-- 
2.30.2


