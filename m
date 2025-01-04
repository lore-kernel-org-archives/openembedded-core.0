Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E18C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.18154.1735998148022941464
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QFz1ERxK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216401de828so171989185ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998147; x=1736602947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFlbvLUE7U2vTwH/4g+UevcDUA92daEt7cAYo7s+Qx0=;
        b=QFz1ERxK+0qFV+ok1wHAdkPymTGe9+q8LNxWUItsi5TLVRHLIUKrDTBmjFMB/fsPTr
         0bRGVcuE5IlO5t2umzMvDqpLJsQxdTcAeHLae++yQ5vu2T9DlFHY5BRSPnnV2CWKCNAF
         i7SnVTEnU836kRwlhXVMYDHxH86iE40ircri4O41RbTn3fhMF9bLOP6xq6Z+IaP73A5w
         iBA2ugo5BXLd5L0F2yhHE580HimjJjdPDPzfQ7y+adCT90XGVxdPIPXmzbN1CSFWEA7s
         OR1ayb9c2HTWfa/8PMBueVZTPQ3gomSPqkGsIygQnnRGM2VsHJ2XnFQ9W6QA9Bfg9rem
         kqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998147; x=1736602947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFlbvLUE7U2vTwH/4g+UevcDUA92daEt7cAYo7s+Qx0=;
        b=Ap65SdsoJ7BffCsTLzetrmND5KFq4GXeogX83tXK2dVGLxWWCqphtNq/QoGokMe0wM
         Vhz2eItA9Wc2EWwlaJne3NGjFGkaK6fbgwg4I7wTEIfKZWhhHZdzdAY/7TxOZvLbvgyM
         bq9bLeKzBmdkw17UFM9pmfu9BJQkAvwSy5KEBmDB/j5tQeq6bU1ybrvpTlF1uy5/BXLB
         Ua8q7oXcAYnjD1c4NBJ6Vat7VkqzG+N74QCQJfCyDXsxl6UmwoAFUNy9oSd0oW/i2vDh
         yrGNnj6x49Ph+s7EVprb1TZwC079MF/I/QWnmyMeOwXpf1vYcC14vEAMBJUjAgf4dSV7
         sJ6Q==
X-Gm-Message-State: AOJu0Yx2rA/Ky8D14eOHd9jwps/qEWyBZ7YmFbBMQTMJlF/E8LePHiPm
	oo7YfKGg9R9s/Z4JIisZGsEc1d2sm1H6qsQl9iQZ0K99Z3fyQDo6qxo9g/lrn9ljEIR0cV5wsU3
	V
X-Gm-Gg: ASbGnct/SKowdrbBu5B0N6WoWlnamXBpeCfC8A+Rjtj3PN4NxmNlCgsRbKZRAK4fEUN
	vS/WCsQPFAUMVlnZd80Gno++VBCgT33ZT8rQv0WRuw0jH024dXFredKYRfKoS4gqoVOGupLQPLB
	Ij/997wfJJhHA1SzSIwP9G8xkNMoBgfLUHKJRBXBFLLabF9jUPOuKOAWMiBRE7Ao4J2GKbqyNVp
	HjO6wVYR65MC0sjJRo08puPqhuvjcDIR0agF/GvtBbRQA==
X-Google-Smtp-Source: AGHT+IGZ5IJxC26gOpw1c7id5PBI62uTKJmk88z3Gr7rpMElAgQgKyhcb2wigItI6jyATlx72RsofQ==
X-Received: by 2002:a05:6a00:ac3:b0:726:f7c9:7b1e with SMTP id d2e1a72fcca58-72abddcadd6mr73135739b3a.13.1735998146845;
        Sat, 04 Jan 2025 05:42:26 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/25] python3: upgrade 3.12.6 -> 3.12.7
Date: Sat,  4 Jan 2025 05:41:42 -0800
Message-ID: <197048667f69ed559baf54831eb7b1606320f3e8.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209387

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

Changelog:
https://docs.python.org/release/3.12.7/whatsnew/changelog.html#python-3-12-7

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...void-shebang-overflow-on-python-config.py.patch |  6 +++---
 ...handle-stdin-I-O-errors-same-way-as-maste.patch |  3 +--
 ...ig.py-use-prefix-value-from-build-configu.patch |  3 +--
 ...e-use-qemu-wrapper-when-gathering-profile.patch |  6 +++---
 ...ng-tests-due-to-load-variability-on-YP-AB.patch |  8 ++++----
 ...ate-test_sysconfig-for-posix_user-purelib.patch |  7 +++----
 ...arfile-treat-overflow-in-UID-GID-as-failu.patch |  9 +++------
 ...-cc_basename-to-replace-CC-for-checking-c.patch | 14 +++++++-------
 ...tdout_fileno-test-due-to-load-variability.patch |  6 +++---
 ...config.py-use-platlibdir-also-for-purelib.patch |  3 +--
 ...est_active_children-skip-problematic-test.patch |  9 +++------
 ...t_ctypes.test_find-skip-without-tools-sdk.patch |  5 ++---
 .../0001-test_deadlock-skip-problematic-test.patch |  9 +++------
 ..._locale.py-correct-the-test-output-format.patch |  7 +++----
 ...1-test_readline-skip-limited-history-test.patch | 14 +++++++-------
 .../0001-test_shutdown-skip-problematic-test.patch | 11 ++++-------
 ...st_storlines-skip-due-to-load-variability.patch |  5 ++---
 ...c-setup.py-do-not-add-a-curses-include-pa.patch |  6 +++---
 meta/recipes-devtools/python/python3/cgi_py.patch  |  3 +--
 .../python/python3/crosspythonpath.patch           |  5 ++---
 .../python/python3/deterministic_imports.patch     |  5 ++---
 .../recipes-devtools/python/python3/makerace.patch |  6 +++---
 .../{python3_3.12.6.bb => python3_3.12.7.bb}       |  2 +-
 23 files changed, 65 insertions(+), 87 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.12.6.bb => python3_3.12.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 0d807db39f..4110774193 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 365399f17d35719d828ddd49182dcb401fb7791c Mon Sep 17 00:00:00 2001
+From 733b46f11d311290e37fcb30f08c47660b888d22 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 77bf09a..6353c57 100644
+index b1c5413..e88f301 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2339,6 +2339,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2349,6 +2349,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 026150f0e2..0ae6283840 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From f8a664cf1fc73e381d57d6927207286059744837 Mon Sep 17 00:00:00 2001
+From c6ba19a4cfdb0a5b137b91ef761f654b70776a47 Mon Sep 17 00:00:00 2001
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
index 680254fab9..981531139a 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 71c194077bb907bfe423d3f3275f33a6c8ca0e74 Mon Sep 17 00:00:00 2001
+From d325a4e1fde5bd817c88f37d5e7b6e93a3bad077 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -9,7 +9,6 @@ native python.
 
 Upstream-Status: Inappropriate [oe-core cross builds]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  Lib/sysconfig.py | 5 +++++
  1 file changed, 5 insertions(+)
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index ee33128fa1..881986d322 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From 38278339832a57dbf5fa3ef21accaa03e2c814d7 Mon Sep 17 00:00:00 2001
+From a727a950023b9384955c912f4975d36a8d7913b4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index dd5e69f..381feb0 100644
+index 0e64ccc..23e20e9 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -658,8 +658,7 @@ profile-run-stamp:
+@@ -660,8 +660,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 197daa71a5..22c42e37ab 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 3471e3478e0760c42e04f8046cee2367ab5706d2 Mon Sep 17 00:00:00 2001
+From 6b0088a3d222b7fe5304f6bc0d6b15d3c41e68f3 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -23,7 +23,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index e42c7ab..dff5227 100644
+index aac74ea..3470bc5 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
 @@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
@@ -34,7 +34,7 @@ index e42c7ab..dff5227 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2066,6 +2067,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2083,6 +2084,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index e42c7ab..dff5227 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5024,6 +5026,7 @@ class TestWait(unittest.TestCase):
+@@ -5080,6 +5082,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index b6c6ac5a28..9a2634ac9b 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From 37d058e841ba3bd89b5746cc5381afb014b11581 Mon Sep 17 00:00:00 2001
+From f0b18f1b3b3d5b40d65e08a184f4e3463745b891 Mon Sep 17 00:00:00 2001
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
+index 1137c20..f5c8980 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -372,7 +372,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -381,7 +381,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index 88b84c6024..b4de257d1e 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -1,4 +1,4 @@
-From 999d4e74d34afa233ad8ad0c70b989d77a21957f Mon Sep 17 00:00:00 2001
+From 73960393a559d0de5edf07b022d182cac54df9dc Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index bbeabe4389..7997811228 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From ababc7b1db8c406910766e11cdd04cbef7a706c9 Mon Sep 17 00:00:00 2001
+From f834492007487e9e87b3d3f1f3c5cc440e6ec5e2 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -26,7 +26,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 384718d..5a1d58b 100644
+index d0d5405..093f8b5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -137,6 +137,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
@@ -73,7 +73,7 @@ index 384718d..5a1d58b 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -2147,7 +2148,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
+@@ -2155,7 +2156,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -82,7 +82,7 @@ index 384718d..5a1d58b 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -2419,7 +2420,7 @@ yes)
+@@ -2427,7 +2428,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -91,7 +91,7 @@ index 384718d..5a1d58b 100644
              [*icc*], [ac_cv_disable_unused_result_warning=no]
              [PY_CHECK_CC_WARNING([disable], [unused-result])])
      AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2665,7 +2666,7 @@ yes)
+@@ -2673,7 +2674,7 @@ yes)
      ;;
  esac
  
@@ -100,7 +100,7 @@ index 384718d..5a1d58b 100644
  *mpicc*)
      CFLAGS_NODIST="$CFLAGS_NODIST"
      ;;
-@@ -3482,7 +3483,7 @@ then
+@@ -3508,7 +3509,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -109,7 +109,7 @@ index 384718d..5a1d58b 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6803,7 +6804,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6831,7 +6832,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index 2d7bca6a77..94f7744c09 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 217cea231462e7703e8c9ea39c0a6833f799a420 Mon Sep 17 00:00:00 2001
+From 642205e1f728873b16debc24c2938339d31be6a9 Mon Sep 17 00:00:00 2001
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
index fc52fdac26..3e8e9648c6 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From a5d429a0e1a4809c1ded7be7e45dcabeb82c53d8 Mon Sep 17 00:00:00 2001
+From fac0f14fd34386e47bab71c0043ea55b507ae39c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -8,7 +8,6 @@ is not correct.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  Lib/sysconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 6ebbaf10e0..a27024c42f 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From bf3eb28bba24509a3e1cd40f1f0e26db833779a2 Mon Sep 17 00:00:00 2001
+From 7f75355e27ee7f25391523294e4c6653edf554f8 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Thu, 13 Jun 2024 10:54:31 -0400
 Subject: [PATCH] test_active_children: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 3955123455..a1861fa3a0 100644
+index 3470bc5..0e42ac1 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -579,6 +579,7 @@ def test_cpu_count(self):
+@@ -579,6 +579,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
@@ -25,6 +25,3 @@ index 3955123455..a1861fa3a0 100644
      def test_active_children(self):
          self.assertEqual(type(self.active_children()), list)
  
--- 
-2.45.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index b4fe946cba..6bf514fca8 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -1,4 +1,4 @@
-From b64c131a576a4b4f821514e711ab91b1394fb4ff Mon Sep 17 00:00:00 2001
+From 174ef9a40c9f4373fd90b00425fd94a89f96dbf9 Mon Sep 17 00:00:00 2001
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
index f0a7cfd39b..d8ca7f9b79 100644
--- a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From d7e3f26e7094fbe20e2271d75f18ac3b23a67f58 Mon Sep 17 00:00:00 2001
+From 621ba76ef956708cdaf4fd5bc0e25aa59d427c5b Mon Sep 17 00:00:00 2001
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
index 410a9fc7f1..d0f4dc14bc 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From ef5728f0af14da5c9f80b0f038fe5bf6d44cb0e9 Mon Sep 17 00:00:00 2001
+From d74e5f24b574fa4d571a64e647c916a7ebe26b3e Mon Sep 17 00:00:00 2001
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
index e8d297c721..f4efd1ecff 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -1,4 +1,4 @@
-From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From bc5c70dc2a2fcfe51481de0ad800baa849592222 Mon Sep 17 00:00:00 2001
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
index 1d4cda18b1..e8d70cdc1b 100644
--- a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 9d4cdbde100798ba9fa1cf3f82dbaf18fd10a543 Mon Sep 17 00:00:00 2001
+From b637ac8f58d17bc8888b2027a572c87531a4539d Mon Sep 17 00:00:00 2001
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
index 0d0eb08459..a4c9abd8b9 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From dc69a1afdb3ba619705ff71e14f19ed3142e422f Mon Sep 17 00:00:00 2001
+From 1a1e5c30021a200b2dc853690dbf1edfba9ca262 Mon Sep 17 00:00:00 2001
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
index 0661249bfd..5c5603c956 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -1,4 +1,4 @@
-From d0205c60d08f51d84bd8ddc07a57e8c71710fdad Mon Sep 17 00:00:00 2001
+From 8543ad744a2839acf1f4eec967acd645fd89d1a7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:16:40 +0100
 Subject: [PATCH] configure.ac: do not add a curses include path from the host
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c49cd4f..affdedf 100644
+index cdc54e5..d163c73 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6508,12 +6508,6 @@ AS_VAR_IF([have_panel], [no], [
+@@ -6536,12 +6536,6 @@ AS_VAR_IF([have_panel], [no], [
    AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
  ])
  
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
index 8262c88e73..b1f2b71c2a 100644
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -1,4 +1,4 @@
-From a56778372fe8dc7c42f5ffd911d89498c22dd064 Mon Sep 17 00:00:00 2001
+From 8e6dc9fe684b27988b5aca3f760f02343aa95951 Mon Sep 17 00:00:00 2001
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
index 2c4aef0511..91ef3fe674 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From 5b66463c10fec1440e977d5a21a0167862d6d79c Mon Sep 17 00:00:00 2001
+From 1bc93167c48876d77ce424415e87573a062b8f2a Mon Sep 17 00:00:00 2001
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
+index 093f8b5..cdc54e5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -165,7 +165,7 @@ AC_ARG_WITH([build-python],
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 2de6ae2e98..9ae4af36ec 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -1,4 +1,4 @@
-From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
+From 38e732371ac234c3f0e6310d6dbc7ddc7f458535 Mon Sep 17 00:00:00 2001
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
index c1b20703e6..e9494b555d 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 9f827c29adbe656af3c8fc963fdd8f47aec0c442 Mon Sep 17 00:00:00 2001
+From 08c7867a02d26aac41764b915dc925343305e7af Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 381feb0..77bf09a 100644
+index 23e20e9..b1c5413 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2250,7 +2250,7 @@ COMPILEALL_OPTS=-j0
+@@ -2260,7 +2260,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.6.bb b/meta/recipes-devtools/python/python3_3.12.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.6.bb
rename to meta/recipes-devtools/python/python3_3.12.7.bb
index 63a3134b36..e2fdc18112 100644
--- a/meta/recipes-devtools/python/python3_3.12.6.bb
+++ b/meta/recipes-devtools/python/python3_3.12.7.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "1999658298cf2fb837dffed8ff3c033ef0c98ef20cf73c5d5f66bed5ab89697c"
+SRC_URI[sha256sum] = "24887b92e2afd4a2ac602419ad4b596372f67ac9b077190f459aba390faf5550"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


