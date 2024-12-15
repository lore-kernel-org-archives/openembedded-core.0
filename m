Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D67E7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 13:53:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.35758.1734270831699426787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 05:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LKpsJ6ZM;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso3173163f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 05:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734270829; x=1734875629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PqH21icC5TpkNx7ev5uXAeEeWDsMQ5SzjDBCZYpLDf8=;
        b=LKpsJ6ZM00E7D1DwLkGDsmifa1aHnA5kNFyi3kTcqJGDG9BUK4IEing29TSxU0sHyL
         9Y/5BzLIiBPi3cdyhkKywQKX1Xs/6tZ3+3stwVKdi9xesFLl7Yt8+bFR6IQ73AP3ES91
         0l9MWoHqRwQjQSbGLdsIrz+4O9E6vf7zZuwlub0fljW/xrgHbMnzV2nRf/2fjK1Bu7Lf
         XrY8c5t3pf+YpLKa8B/X2uHfzZ9yrn2G83rhXH6vTaRZ++sR8RpXAQQVQvWHxAcp0nkg
         /kKs5C79zZHuO00QR8jS2LjWnGDniTlKFeEJ4q6515+KiqehPxs4+qKCoTeqZBFBsYkA
         wS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734270829; x=1734875629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqH21icC5TpkNx7ev5uXAeEeWDsMQ5SzjDBCZYpLDf8=;
        b=mmfYufiRLsRVE5iDCjx8npjveT2YE0aoJo4wO2E3Y3JjiCT40cS1FmkSOc72WLBPwM
         thXj8hiN9u+s+rAUgS0g9nXZqunHhAOgXXcAWa8/7Z5Pk3LkFA9tCsnNc1OnlGWKL/K/
         W9eArtR9mh+ER0JMKvUmc1jrjokceEIQPOevnqjaM+GPBQzTuN63hrHf9ma1OxXJYuzP
         aH/l0UIKBPT9F2lVJsGTsTa2mznXoF5+lhdakJzXBViscNSBW8RcoqpSirkko5nhJA9+
         /fuCRZ0NWSKD85EIJvr50VVMptbXQwc6tG7XS75bcSzB9H7JjYUZ3vRrkwI/88hZnKSJ
         0iSA==
X-Gm-Message-State: AOJu0Yx0nzMkY7pCmbIkTXKfTXpLhrduxA3CunL1t+Q9gRilkrrb5IYm
	N5MnhwDHtsHKmijn0rdYxH1qMUfomJOJE4M8g89qxvomjHiVvVnKBTDYfA==
X-Gm-Gg: ASbGncshF/UpVWHNzas/bc5D+MVPr76vlif+BIjlXV+zUWNRE1fROO6Nf3y/hXZFCP0
	oIqADuvDS6n6Im9vWThdvXRLT0GSx5QtL3KXIcpe2gsNthG0tkZgKb4duBVNC3bD8KLD2YnKm4l
	lA66/85W5W52jYYKXLrMICl56HOhtBL66vxrdHuOmDt1Vk0oHOyRtQ5xP0vIofWoxk0zaVL6DyT
	U+pEjdt+v3nnVCit23an9bJlC+/aard71e4sIXTh/GkBTaq46761bgM0k50dRfm7nHwihnHPTd0
	lpCidg==
X-Google-Smtp-Source: AGHT+IEgaI/ls2KC0nJTU8+6OAJikfFnAEHT3OxDA4slFbm22tm5ZjG4BgdV+0oSDu7ehjLpibk3GQ==
X-Received: by 2002:a05:6000:1848:b0:386:3ba8:5326 with SMTP id ffacd0b85a97d-38880ad9050mr7308742f8f.21.1734270829040;
        Sun, 15 Dec 2024 05:53:49 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c806cc06sm5286956f8f.110.2024.12.15.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 05:53:47 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [scarthgap][PATCH] python3: upgrade 3.12.6 -> 3.12.8
Date: Sun, 15 Dec 2024 13:53:35 +0000
Message-ID: <20241215135335.128188-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 13:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208750

Upgrade was performed using devtool

Changelogs:
* https://docs.python.org/release/3.12.8/whatsnew/changelog.html#python-3-12-8-final
* https://docs.python.org/release/3.12.8/whatsnew/changelog.html#python-3-12-7-final

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...shebang-overflow-on-python-config.py.patch |  6 +++---
 ...e-stdin-I-O-errors-same-way-as-maste.patch |  3 +--
 ...-use-prefix-value-from-build-configu.patch |  5 ++---
 ...-qemu-wrapper-when-gathering-profile.patch |  6 +++---
 ...sts-due-to-load-variability-on-YP-AB.patch | 16 +++++++--------
 ...est_sysconfig-for-posix_user-purelib.patch |  7 +++----
 ...e-treat-overflow-in-UID-GID-as-failu.patch |  9 +++------
 ...lize-struct-termios-before-calling-t.patch |  2 +-
 ...asename-to-replace-CC-for-checking-c.patch | 20 +++++++++----------
 ..._fileno-test-due-to-load-variability.patch |  6 +++---
 ...g.py-use-platlibdir-also-for-purelib.patch |  5 ++---
 ...ctive_children-skip-problematic-test.patch |  9 +++------
 ...pes.test_find-skip-without-tools-sdk.patch |  5 ++---
 ...-test_deadlock-skip-problematic-test.patch |  9 +++------
 ...le.py-correct-the-test-output-format.patch |  7 +++----
 ...t_readline-skip-limited-history-test.patch | 14 ++++++-------
 ...-test_shutdown-skip-problematic-test.patch | 11 ++++------
 ...orlines-skip-due-to-load-variability.patch |  5 ++---
 ...up.py-do-not-add-a-curses-include-pa.patch |  6 +++---
 .../python/python3/cgi_py.patch               |  3 +--
 .../python/python3/crosspythonpath.patch      |  5 ++---
 .../python3/deterministic_imports.patch       |  5 ++---
 .../python/python3/makerace.patch             |  6 +++---
 .../{python3_3.12.6.bb => python3_3.12.8.bb}  |  2 +-
 24 files changed, 75 insertions(+), 97 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.12.6.bb => python3_3.12.8.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 0d807db39f..efcc04ed3c 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 365399f17d35719d828ddd49182dcb401fb7791c Mon Sep 17 00:00:00 2001
+From 3275a2da60d453a48b7494fc62f8838db45f3c39 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 77bf09a..6353c57 100644
+index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2339,6 +2339,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2354,6 +2354,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 026150f0e2..bb7eddfaa5 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From f8a664cf1fc73e381d57d6927207286059744837 Mon Sep 17 00:00:00 2001
+From f1aeedba2de352a327a75b89626fcbacb1d8bac6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -24,7 +24,6 @@ So let's treat both channels the same.
 
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/28388]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  Lib/pty.py | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 680254fab9..63988caaba 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 71c194077bb907bfe423d3f3275f33a6c8ca0e74 Mon Sep 17 00:00:00 2001
+From bf2c7fbcb7e4382381f5eb4e8174fe924a8cb831 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -9,13 +9,12 @@ native python.
 
 Upstream-Status: Inappropriate [oe-core cross builds]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  Lib/sysconfig.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 79c0510..91ebcb6 100644
+index 6258b68..d59ec6e 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
 @@ -668,6 +668,11 @@ def _init_config_vars():
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index ee33128fa1..b2da10f66e 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From 38278339832a57dbf5fa3ef21accaa03e2c814d7 Mon Sep 17 00:00:00 2001
+From 283c9859c4fbc01952887c97a0ed1b1ce1550870 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dd5e69f..381feb0 100644
+index 083f4c7..dce36a5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -658,8 +658,7 @@ profile-run-stamp:
+@@ -660,8 +660,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 197daa71a5..bf5b2cb062 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 3471e3478e0760c42e04f8046cee2367ab5706d2 Mon Sep 17 00:00:00 2001
+From eb347616890c8f6341afd30ca0c0396f259bdfd7 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -23,10 +23,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index e42c7ab..dff5227 100644
+index 3b4415b..1f94dec 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
+@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index e42c7ab..dff5227 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2066,6 +2067,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index e42c7ab..dff5227 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5024,6 +5026,7 @@ class TestWait(unittest.TestCase):
+@@ -5208,6 +5210,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -51,10 +51,10 @@ index e42c7ab..dff5227 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 02cc3f4..51a4548 100644
+index 9463add..4e0f39d 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -527,6 +527,7 @@ class TimeTestCase(unittest.TestCase):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -62,7 +62,7 @@ index 02cc3f4..51a4548 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
-@@ -505,6 +506,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -540,6 +541,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index b6c6ac5a28..b12cdfd0e0 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 37d058e841ba3bd89b5746cc5381afb014b11581 Mon Sep 17 00:00:00 2001
+From 3fabf78b623ac6e29517be70c83aa312e9edca5e Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -17,16 +17,15 @@ Update test_sysconfig.test_user_similar() for the posix_user scheme:
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
-
 ---
  Lib/test/test_sysconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index b6dbf3d..5672590 100644
+index 3468d0c..9ff174c 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -372,7 +372,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -390,7 +390,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 88b84c6024..673c2a2059 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -1,4 +1,4 @@
-From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
+From 06e9f21cb171b60b4b5cc64886a53ad27c98da5e Mon Sep 17 00:00:00 2001
 From: Petr Viktorin <encukou@gmail.com>
 Date: Wed, 23 Aug 2023 20:00:07 +0200
 Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 Misc/NEWS.d/next/Library/2023-08-23-17-34-39.gh-issue-107811.3Fng72.rst
 
 diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 3bbbcaa..473167d 100755
+index 0a0f31e..4dfb67d 100755
 --- a/Lib/tarfile.py
 +++ b/Lib/tarfile.py
-@@ -2557,7 +2557,8 @@ class TarFile(object):
+@@ -2590,7 +2590,8 @@ class TarFile(object):
                      os.lchown(targetpath, u, g)
                  else:
                      os.chown(targetpath, u, g)
@@ -35,6 +35,3 @@ index 0000000..ffca413
 +:mod:`tarfile`: extraction of members with overly large UID or GID (e.g. on
 +an OS with 32-bit :c:type:`!id_t`) now fails in the same way as failing to
 +set the ID.
--- 
-2.45.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
index 8406ef30a2..12931a59fc 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-114492-Initialize-struct-termios-before-calling-t.patch
@@ -1,4 +1,4 @@
-From 439aa02f42d6e6715c172076261757fcb89a936a Mon Sep 17 00:00:00 2001
+From 3cb36b59d778388736d6efb6c81e9214edf210b6 Mon Sep 17 00:00:00 2001
 From: "Miss Islington (bot)"
  <31488909+miss-islington@users.noreply.github.com>
 Date: Tue, 23 Jan 2024 23:02:02 +0100
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index bbeabe4389..08464d7df6 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From ababc7b1db8c406910766e11cdd04cbef7a706c9 Mon Sep 17 00:00:00 2001
+From 2bd63039744fd6954c5f01668b4f8527f160aea2 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -26,7 +26,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 384718d..5a1d58b 100644
+index 9270b5f..955daad 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -137,6 +137,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
@@ -46,7 +46,7 @@ index 384718d..5a1d58b 100644
          gcc)    AC_PATH_TOOL([CXX], [g++], [g++], [notfound]) ;;
          cc)     AC_PATH_TOOL([CXX], [c++], [c++], [notfound]) ;;
          clang|*/clang)     AC_PATH_TOOL([CXX], [clang++], [clang++], [notfound]) ;;
-@@ -1328,7 +1329,7 @@ rmdir CaseSensitiveTestDir
+@@ -1331,7 +1332,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -55,7 +55,7 @@ index 384718d..5a1d58b 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1854,7 +1855,7 @@ esac
+@@ -1857,7 +1858,7 @@ esac
  ],
  [AC_MSG_RESULT([no])])
  if test "$Py_LTO" = 'true' ; then
@@ -64,7 +64,7 @@ index 384718d..5a1d58b 100644
      *clang*)
        LDFLAGS_NOLTO="-fno-lto"
        dnl Clang linker requires -flto in order to link objects with LTO information.
-@@ -1983,7 +1984,7 @@ then
+@@ -1986,7 +1987,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -73,7 +73,7 @@ index 384718d..5a1d58b 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -2147,7 +2148,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
+@@ -2158,7 +2159,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -82,7 +82,7 @@ index 384718d..5a1d58b 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -2419,7 +2420,7 @@ yes)
+@@ -2430,7 +2431,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -91,7 +91,7 @@ index 384718d..5a1d58b 100644
              [*icc*], [ac_cv_disable_unused_result_warning=no]
              [PY_CHECK_CC_WARNING([disable], [unused-result])])
      AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2665,7 +2666,7 @@ yes)
+@@ -2676,7 +2677,7 @@ yes)
      ;;
  esac
  
@@ -100,7 +100,7 @@ index 384718d..5a1d58b 100644
  *mpicc*)
      CFLAGS_NODIST="$CFLAGS_NODIST"
      ;;
-@@ -3482,7 +3483,7 @@ then
+@@ -3511,7 +3512,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -109,7 +109,7 @@ index 384718d..5a1d58b 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6803,7 +6804,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6832,7 +6833,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index 2d7bca6a77..ed25420645 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 217cea231462e7703e8c9ea39c0a6833f799a420 Mon Sep 17 00:00:00 2001
+From e54f0a198f7d98149e50116393d2a94ada4f09cb Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
@@ -16,10 +16,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index 4d03c46..b329b7a 100644
+index c71c568..e41ab5e 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2326,6 +2326,7 @@ class PtyTests(unittest.TestCase):
+@@ -2352,6 +2352,7 @@ class PtyTests(unittest.TestCase):
          # Check stdin/stdout error handler is used when invoking PyOS_Readline()
          self.check_input_tty("prompté", b"quux\xe9", "ascii")
  
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index fc52fdac26..0df94c3719 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From a5d429a0e1a4809c1ded7be7e45dcabeb82c53d8 Mon Sep 17 00:00:00 2001
+From baf0ee1693ed92f07f55db35b454d5535ad4adb9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -8,13 +8,12 @@ is not correct.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  Lib/sysconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 122d441..79c0510 100644
+index 517b13a..6258b68 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
 @@ -28,7 +28,7 @@ _INSTALL_SCHEMES = {
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 6ebbaf10e0..150d7d5960 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From bf3eb28bba24509a3e1cd40f1f0e26db833779a2 Mon Sep 17 00:00:00 2001
+From 20f9dd7346a131e1cf5d72fa355b38e7321bbbb3 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Thu, 13 Jun 2024 10:54:31 -0400
 Subject: [PATCH] test_active_children: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 3955123455..a1861fa3a0 100644
+index 1f94dec..3632219 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -579,6 +579,7 @@ def test_cpu_count(self):
+@@ -585,6 +585,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
@@ -25,6 +25,3 @@ index 3955123455..a1861fa3a0 100644
      def test_active_children(self):
          self.assertEqual(type(self.active_children()), list)
  
--- 
-2.45.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index b4fe946cba..a6a9759ae7 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -1,4 +1,4 @@
-From b64c131a576a4b4f821514e711ab91b1394fb4ff Mon Sep 17 00:00:00 2001
+From 4e81d25679c3146d8e47cb1b75ee51b3275818b2 Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@intel.com>
 Date: Fri, 18 Jun 2021 11:56:50 -0700
 Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
@@ -10,13 +10,12 @@ easiest way to dynamically check for that is looking for
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
-
 ---
  Lib/test/test_ctypes/test_find.py | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.py
-index 1ff9d01..59def26 100644
+index a41e949..eb5fe19 100644
 --- a/Lib/test/test_ctypes/test_find.py
 +++ b/Lib/test/test_ctypes/test_find.py
 @@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):
diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
index f0a7cfd39b..47a0919049 100644
--- a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
+From 3f98dfc52f05c3cf1ecf15fcea09488855c2f4c5 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 12 Jun 2024 10:29:03 -0400
 Subject: [PATCH] test_deadlock: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_concurrent_futures/test_deadlock.py b/Lib/test/test_concurrent_futures/test_deadlock.py
-index 1db4cd0099..fd07895a17 100644
+index e8cd8f6..021906b 100644
 --- a/Lib/test/test_concurrent_futures/test_deadlock.py
 +++ b/Lib/test/test_concurrent_futures/test_deadlock.py
-@@ -90,6 +90,7 @@ def __reduce__(self):
+@@ -90,6 +90,7 @@ class ErrorAtUnpickle(object):
          return _raise_error_ignore_stderr, (UnpicklingError, )
  
  
@@ -25,6 +25,3 @@ index 1db4cd0099..fd07895a17 100644
  class ExecutorDeadlockTest:
      TIMEOUT = support.LONG_TIMEOUT
  
--- 
-2.45.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 410a9fc7f1..31f49fb0ec 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From ef5728f0af14da5c9f80b0f038fe5bf6d44cb0e9 Mon Sep 17 00:00:00 2001
+From 3d7fd019ebbe2d1f020f5f94d91202481a3f3587 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -26,16 +26,15 @@ Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
 Rebased for 3.9.4, still not accepted upstream Signed-off-by: Alejandro Hernandez <alejandro@enedino.org>
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  Lib/test/test_locale.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index b0d7998..cb12153 100644
+index cde80a4..e8ffd71 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -557,7 +557,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -561,7 +561,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index e8d297c721..9de09fae87 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -1,4 +1,4 @@
-From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From 0dab7c735335729148debfceecbf6c1aaba16618 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 13 Aug 2024 11:07:05 -0400
 Subject: [PATCH] test_readline: skip limited history test
@@ -16,11 +16,11 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  Lib/test/test_readline.py | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: Python-3.12.6/Lib/test/test_readline.py
-===================================================================
---- Python-3.12.6.orig/Lib/test/test_readline.py
-+++ Python-3.12.6/Lib/test/test_readline.py
-@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index fab124a..291dd48 100644
+--- a/Lib/test/test_readline.py
++++ b/Lib/test/test_readline.py
+@@ -133,6 +133,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -28,7 +28,7 @@ Index: Python-3.12.6/Lib/test/test_readline.py
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -371,6 +372,7 @@ readline.write_history_file(history_file
+@@ -371,6 +372,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
index 1d4cda18b1..02f71e635a 100644
--- a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 9d4cdbde100798ba9fa1cf3f82dbaf18fd10a543 Mon Sep 17 00:00:00 2001
+From d985a0b4f14a65943f0de4a2a3f2a98ae5c8002c Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 8 May 2024 11:58:09 -0400
 Subject: [PATCH] test_shutdown: skip problematic test
@@ -14,7 +14,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Lib/test/test_concurrent_futures/test_shutdown.py b/Lib/test/test_concurrent_futures/test_shutdown.py
-index 7a4065afd4..6b878a48bf 100644
+index 7a4065a..6b878a4 100644
 --- a/Lib/test/test_concurrent_futures/test_shutdown.py
 +++ b/Lib/test/test_concurrent_futures/test_shutdown.py
 @@ -20,6 +20,7 @@ def sleep_and_print(t, msg):
@@ -25,7 +25,7 @@ index 7a4065afd4..6b878a48bf 100644
  class ExecutorShutdownTest:
      def test_run_after_shutdown(self):
          self.executor.shutdown()
-@@ -156,6 +157,7 @@ def timeout(_signum, _frame):
+@@ -156,6 +157,7 @@ class ExecutorShutdownTest:
              signal.signal(signal.SIGALRM, old_handler)
  
  
@@ -33,7 +33,7 @@ index 7a4065afd4..6b878a48bf 100644
  class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase):
      def test_threads_terminate(self):
          def acquire_lock(lock):
-@@ -252,6 +254,7 @@ def test_cancel_futures_wait_false(self):
+@@ -252,6 +254,7 @@ class ThreadPoolShutdownTest(ThreadPoolMixin, ExecutorShutdownTest, BaseTestCase
          self.assertIn(out.strip(), [b"apple", b""])
  
  
@@ -41,6 +41,3 @@ index 7a4065afd4..6b878a48bf 100644
  class ProcessPoolShutdownTest(ExecutorShutdownTest):
      def test_processes_terminate(self):
          def acquire_lock(lock):
--- 
-2.45.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index 0d0eb08459..39b3f2c717 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From dc69a1afdb3ba619705ff71e14f19ed3142e422f Mon Sep 17 00:00:00 2001
+From 431f0fefdf7fa3860504dc79f5dab43ddf0df98a Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 6 Oct 2023 10:59:44 -0400
 Subject: [PATCH] test_storlines: skip due to load variability
@@ -11,13 +11,12 @@ Upstream-Status: Inappropriate [OE-Specific]
 [YOCTO #14933]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
 ---
  Lib/test/test_ftplib.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
-index 2f191ea..dc29346 100644
+index 4c4a449..b8c79a4 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
 @@ -626,6 +626,7 @@ class TestFTPClass(TestCase):
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index 0661249bfd..1f97332d77 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -1,4 +1,4 @@
-From d0205c60d08f51d84bd8ddc07a57e8c71710fdad Mon Sep 17 00:00:00 2001
+From f84541fb647e0abbac90e78b33dc85c3445dead4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:16:40 +0100
 Subject: [PATCH] configure.ac: do not add a curses include path from the host
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c49cd4f..affdedf 100644
+index 6e465a4..13c4835 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6508,12 +6508,6 @@ AS_VAR_IF([have_panel], [no], [
+@@ -6537,12 +6537,6 @@ AS_VAR_IF([have_panel], [no], [
    AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
  ])
  
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
index 8262c88e73..37e3206808 100644
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -1,4 +1,4 @@
-From a56778372fe8dc7c42f5ffd911d89498c22dd064 Mon Sep 17 00:00:00 2001
+From f571bc07d84201b10f4b828714307feea942c68b Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Wed, 21 Sep 2011 20:55:33 -0500
 Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
@@ -6,7 +6,6 @@ Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
 Upstream-Status: Inappropriate [distribution]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
 ---
  Lib/cgi.py | 11 +----------
  1 file changed, 1 insertion(+), 10 deletions(-)
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index 2c4aef0511..3805413327 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From 5b66463c10fec1440e977d5a21a0167862d6d79c Mon Sep 17 00:00:00 2001
+From 1d647d2933f812bf12dd72063f128b98652081e5 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda <ricardo@ribalda.com>
 Date: Tue, 18 Nov 2014 03:35:33 -0500
 Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
@@ -14,13 +14,12 @@ Upstream-Status: Inappropriate [OE-Core integration specific]
 Credits-to: Mark Hatle <mark.hatle@windriver.com>
 Credits-to: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index cb9e198..d81c19a 100644
+index 955daad..6e465a4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -165,7 +165,7 @@ AC_ARG_WITH([build-python],
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 2de6ae2e98..3e7ff0de41 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -1,4 +1,4 @@
-From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
+From 1bc939a52d811bef850510b8e83ac1ab36904b49 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 27 May 2022 17:05:44 +0100
 Subject: [PATCH] python3: Ensure stale empty python module directories don't
@@ -13,13 +13,12 @@ As a result, patch this to a behaviour which works for us.
 
 Upstream-Status: Submitted [https://github.com/python/cpython/issues/120492; need to first talk to upstream to see if they'll take one or both fixes]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
 ---
  Lib/importlib/metadata/__init__.py | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
-index 82e0ce1..969cac4 100644
+index e6ca178..ac5a75b 100644
 --- a/Lib/importlib/metadata/__init__.py
 +++ b/Lib/importlib/metadata/__init__.py
 @@ -710,7 +710,14 @@ class Lookup:
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index c1b20703e6..85fde52579 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 9f827c29adbe656af3c8fc963fdd8f47aec0c442 Mon Sep 17 00:00:00 2001
+From 270d4b0fa47ecf8815c1cb15ba7094ce53b3c223 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 381feb0..77bf09a 100644
+index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2250,7 +2250,7 @@ COMPILEALL_OPTS=-j0
+@@ -2265,7 +2265,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.6.bb b/meta/recipes-devtools/python/python3_3.12.8.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.6.bb
rename to meta/recipes-devtools/python/python3_3.12.8.bb
index ae69f0e781..40c2f40827 100644
--- a/meta/recipes-devtools/python/python3_3.12.6.bb
+++ b/meta/recipes-devtools/python/python3_3.12.8.bb
@@ -41,7 +41,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c"
+SRC_URI[sha256sum] = "c909157bb25ec114e5869124cc2a9c4a4d4c1e957ca4ff553f1edc692101154e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


