Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671E6E7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 11:27:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.5993.1735126028112226840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 03:27:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XpbQr1tq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3863c36a731so4331795f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735126026; x=1735730826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL/7+RIqv1ppmHNhu0rQO6N5Fm3nSpY7q8dHe/w8sEc=;
        b=XpbQr1tqlzlpbNacjSnT6Wkn6lxewqALz9VGRB75972CzmelJobfnf/ViHjH1lfC0y
         Z5FNbTl7JdjWiTIVt9pV0sr88vgZvV2onmz4mMkbMQPQW0mBjbR96kAPuJXUMWo9Zu04
         4P/dbyegiXjbEXgutDnuiFX/5WwTf0fmEZwOFz2/OQfeDEW0hnlTon/txjU30SM6gisb
         N4V9/W2XTlbvwvh8hAaf32pZtj5PwqAzu0eCVipmhKGMW3NqrOz65xD7nvV3w+imkvpV
         zHoykWWAhe1laNFtUDxmIeo3ER72xDZ1uq2ZaAGwxiGePFD5RsEJGH2QysYOn9ZVV1nA
         MCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735126026; x=1735730826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL/7+RIqv1ppmHNhu0rQO6N5Fm3nSpY7q8dHe/w8sEc=;
        b=JJBSoRSLu3KViB7w6cUuMH7h8p+6aXZD1NULLWqghvDdDuwcyDAs9pa5uq2kl257FQ
         yDEBxOE8am/LXOq6zYA5AI/dlCH+JiB47NP7hqKkP8saiEEoSAOpi5TwBKYoF1/xGpLE
         3q+FNWtjzUt8/2JLT4s/zg/4KBYNYMbNMBFXxX8Z/Xln055qLIUwxdXx3KlMDIVkarJl
         UC7IuG34JiEVfyLoqLO196ZfS/KlANZoVHzaLAd3fBLoRxNUp3n7n1ChSu6Kq8NoYgOz
         dUQ5/GUxN9dCzLe5HFULrHKLVdBvDclUESxhUQ1YpGbmwmBWeLbAhyqimmprDCCHx6a2
         Sm2A==
X-Gm-Message-State: AOJu0Yye/Kx/X6y0sTIQ3SnXOY4quVpNihUyjDvpXbDstWIbBV9xO7Xo
	Zw2KSg6M8p7jbyHMJj29xufa7CSmK5tl98iHsc3E8jZLTeBmj/ilzxjKfg==
X-Gm-Gg: ASbGncuY11uqGSwLPt26WxS6s1bHeP92lcpW+wPQc2AD/8/0WkPsbuBmlP/bxmBSND3
	cjEZMaI347gAbTV4TwVgzOI4GLb7CwOtMHSYjB+2M8mN8Q5hExa3wsMncrGWwR0BrmV4a3XonTS
	Rl6xkPeL2EII8QtPvvbKZlvbljor/JD8TagmMAgEMnk/R+sQRoweGLWqjn4ZPBmSf6vL0q3gNsz
	dIfXwOevnDJH2Zzsor7yRI0a7eB28vz1p9QE//2otfCZ/56cYEfhFdRczxunv0j3GHaqtxAUn5X
	etK0SQ==
X-Google-Smtp-Source: AGHT+IEE+brbyhlqWayKk949xz9VAb8f9p65ZiLkkieGnJiv4dtq7egajWWL+FUvQWKS+SRx57fWog==
X-Received: by 2002:a5d:6d8b:0:b0:386:3356:f3ac with SMTP id ffacd0b85a97d-38a221f2dedmr18135787f8f.26.1735126025544;
        Wed, 25 Dec 2024 03:27:05 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828cc8sm16686747f8f.17.2024.12.25.03.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 03:27:04 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [styhead][PATCH 2/2] python3: upgrade 3.12.7 -> 3.12.8
Date: Wed, 25 Dec 2024 11:26:50 +0000
Message-ID: <20241225112650.2346464-2-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225112650.2346464-1-gudni.m.g@gmail.com>
References: <20241225112650.2346464-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 11:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209077

Changelog:
https://docs.python.org/release/3.12.8/whatsnew/changelog.html#python-3-12-8

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...shebang-overflow-on-python-config.py.patch |  6 +++---
 ...e-stdin-I-O-errors-same-way-as-maste.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  4 ++--
 ...-qemu-wrapper-when-gathering-profile.patch |  4 ++--
 ...sts-due-to-load-variability-on-YP-AB.patch | 16 +++++++--------
 ...est_sysconfig-for-posix_user-purelib.patch |  6 +++---
 ...e-treat-overflow-in-UID-GID-as-failu.patch |  2 +-
 ...asename-to-replace-CC-for-checking-c.patch | 20 +++++++++----------
 ..._fileno-test-due-to-load-variability.patch |  2 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |  4 ++--
 ...ctive_children-skip-problematic-test.patch |  6 +++---
 ...pes.test_find-skip-without-tools-sdk.patch |  2 +-
 ...-test_deadlock-skip-problematic-test.patch |  2 +-
 ...le.py-correct-the-test-output-format.patch |  2 +-
 ...t_readline-skip-limited-history-test.patch |  2 +-
 ...-test_shutdown-skip-problematic-test.patch |  2 +-
 ...orlines-skip-due-to-load-variability.patch |  2 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |  6 +++---
 .../python/python3/cgi_py.patch               |  2 +-
 .../python/python3/crosspythonpath.patch      |  4 ++--
 .../python3/deterministic_imports.patch       |  2 +-
 .../python/python3/makerace.patch             |  6 +++---
 .../{python3_3.12.7.bb => python3_3.12.8.bb}  |  2 +-
 23 files changed, 53 insertions(+), 53 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.12.7.bb => python3_3.12.8.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 4110774193..3311a90bda 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 733b46f11d311290e37fcb30f08c47660b888d22 Mon Sep 17 00:00:00 2001
+From e8bd4f8ee56cbb12a61c1dcabf35a1835a863132 Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -16,10 +16,10 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index b1c5413..e88f301 100644
+index 2d235d2..1ac2263 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2349,6 +2349,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2354,6 +2354,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 0ae6283840..5ca09c6f3c 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From c6ba19a4cfdb0a5b137b91ef761f654b70776a47 Mon Sep 17 00:00:00 2001
+From bbfb7fdf01f0502c7bf3d418f3a912ea76c93f24 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 981531139a..1b9f3565d3 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From d325a4e1fde5bd817c88f37d5e7b6e93a3bad077 Mon Sep 17 00:00:00 2001
+From c739bf214b9dd6060db216b79077806fccb582ae Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 79c0510..91ebcb6 100644
+index 6258b68..d59ec6e 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
 @@ -668,6 +668,11 @@ def _init_config_vars():
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 881986d322..b78f619958 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From a727a950023b9384955c912f4975d36a8d7913b4 Mon Sep 17 00:00:00 2001
+From b9081b2e21983f2a828bc40a47ab278ef69f4dfe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0e64ccc..23e20e9 100644
+index 083f4c7..dce36a5 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -660,8 +660,7 @@ profile-run-stamp:
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 22c42e37ab..6779dd515a 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 6b0088a3d222b7fe5304f6bc0d6b15d3c41e68f3 Mon Sep 17 00:00:00 2001
+From b4014e3d1d9e38b25f2840e65e2acd757f3e5d41 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -23,10 +23,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index aac74ea..3470bc5 100644
+index 3b4415b..1f94dec 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
+@@ -688,6 +688,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +34,7 @@ index aac74ea..3470bc5 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2083,6 +2084,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2211,6 +2212,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +42,7 @@ index aac74ea..3470bc5 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5080,6 +5082,7 @@ class TestWait(unittest.TestCase):
+@@ -5208,6 +5210,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -51,10 +51,10 @@ index aac74ea..3470bc5 100644
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
index 9a2634ac9b..08142617c0 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From f0b18f1b3b3d5b40d65e08a184f4e3463745b891 Mon Sep 17 00:00:00 2001
+From 5224cc0ac21f4c2574c24e0fee38b145ca15175b Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -22,10 +22,10 @@ Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index 1137c20..f5c8980 100644
+index 3468d0c..9ff174c 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -381,7 +381,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -390,7 +390,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
index b4de257d1e..5c74443e62 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch
@@ -1,4 +1,4 @@
-From 73960393a559d0de5edf07b022d182cac54df9dc Mon Sep 17 00:00:00 2001
+From 6e3868c8c330f997bc242a8d51d742baac449ecc Mon Sep 17 00:00:00 2001
 From: Petr Viktorin <encukou@gmail.com>
 Date: Wed, 23 Aug 2023 20:00:07 +0200
 Subject: [PATCH] gh-107811: tarfile: treat overflow in UID/GID as failure to
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 7997811228..c9ef409018 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From f834492007487e9e87b3d3f1f3c5cc440e6ec5e2 Mon Sep 17 00:00:00 2001
+From 82576cdb9d6d9736ba122592974b0e7727216a3f Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -26,7 +26,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d0d5405..093f8b5 100644
+index 9270b5f..955daad 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -137,6 +137,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
@@ -46,7 +46,7 @@ index d0d5405..093f8b5 100644
          gcc)    AC_PATH_TOOL([CXX], [g++], [g++], [notfound]) ;;
          cc)     AC_PATH_TOOL([CXX], [c++], [c++], [notfound]) ;;
          clang|*/clang)     AC_PATH_TOOL([CXX], [clang++], [clang++], [notfound]) ;;
-@@ -1328,7 +1329,7 @@ rmdir CaseSensitiveTestDir
+@@ -1331,7 +1332,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -55,7 +55,7 @@ index d0d5405..093f8b5 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1854,7 +1855,7 @@ esac
+@@ -1857,7 +1858,7 @@ esac
  ],
  [AC_MSG_RESULT([no])])
  if test "$Py_LTO" = 'true' ; then
@@ -64,7 +64,7 @@ index d0d5405..093f8b5 100644
      *clang*)
        LDFLAGS_NOLTO="-fno-lto"
        dnl Clang linker requires -flto in order to link objects with LTO information.
-@@ -1983,7 +1984,7 @@ then
+@@ -1986,7 +1987,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -73,7 +73,7 @@ index d0d5405..093f8b5 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -2155,7 +2156,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
+@@ -2158,7 +2159,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -82,7 +82,7 @@ index d0d5405..093f8b5 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -2427,7 +2428,7 @@ yes)
+@@ -2430,7 +2431,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -91,7 +91,7 @@ index d0d5405..093f8b5 100644
              [*icc*], [ac_cv_disable_unused_result_warning=no]
              [PY_CHECK_CC_WARNING([disable], [unused-result])])
      AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2673,7 +2674,7 @@ yes)
+@@ -2676,7 +2677,7 @@ yes)
      ;;
  esac
  
@@ -100,7 +100,7 @@ index d0d5405..093f8b5 100644
  *mpicc*)
      CFLAGS_NODIST="$CFLAGS_NODIST"
      ;;
-@@ -3508,7 +3509,7 @@ then
+@@ -3511,7 +3512,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -109,7 +109,7 @@ index d0d5405..093f8b5 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6831,7 +6832,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6832,7 +6833,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index 94f7744c09..e105f36eca 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 642205e1f728873b16debc24c2938339d31be6a9 Mon Sep 17 00:00:00 2001
+From 5944f707fc04fb65caec3f0e1ce3a42169426c47 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index 3e8e9648c6..c7ac43cc85 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From fac0f14fd34386e47bab71c0043ea55b507ae39c Mon Sep 17 00:00:00 2001
+From 3aeeddb1325679d5c0471ad86806e92e72187138 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 122d441..79c0510 100644
+index 517b13a..6258b68 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
 @@ -28,7 +28,7 @@ _INSTALL_SCHEMES = {
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index a27024c42f..164c8b5180 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 7f75355e27ee7f25391523294e4c6653edf554f8 Mon Sep 17 00:00:00 2001
+From a83311a1030b816f422dbb4457fc38c1289c224d Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Thu, 13 Jun 2024 10:54:31 -0400
 Subject: [PATCH] test_active_children: skip problematic test
@@ -14,10 +14,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 3470bc5..0e42ac1 100644
+index 1f94dec..3632219 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -579,6 +579,7 @@ class _TestProcess(BaseTestCase):
+@@ -585,6 +585,7 @@ class _TestProcess(BaseTestCase):
          self.assertTrue(type(cpus) is int)
          self.assertTrue(cpus >= 1)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 6bf514fca8..307e4bf306 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -1,4 +1,4 @@
-From 174ef9a40c9f4373fd90b00425fd94a89f96dbf9 Mon Sep 17 00:00:00 2001
+From fbbf04dbeae217b985073263499174960e5fd142 Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@intel.com>
 Date: Fri, 18 Jun 2021 11:56:50 -0700
 Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
diff --git a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
index d8ca7f9b79..e07f7392f6 100644
--- a/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 621ba76ef956708cdaf4fd5bc0e25aa59d427c5b Mon Sep 17 00:00:00 2001
+From 9d658dd20f02edcf878b245d638c474c808ab8d1 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 12 Jun 2024 10:29:03 -0400
 Subject: [PATCH] test_deadlock: skip problematic test
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index d0f4dc14bc..535c48c769 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From d74e5f24b574fa4d571a64e647c916a7ebe26b3e Mon Sep 17 00:00:00 2001
+From fcd5b7d30d3245ce92ea45dfbab3c7b7da690c20 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index f4efd1ecff..3568d92bda 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -1,4 +1,4 @@
-From bc5c70dc2a2fcfe51481de0ad800baa849592222 Mon Sep 17 00:00:00 2001
+From 34fd0bc8afc67a11eea5d73f9e0edf045c5ce541 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Tue, 13 Aug 2024 11:07:05 -0400
 Subject: [PATCH] test_readline: skip limited history test
diff --git a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
index e8d70cdc1b..61fe5e9ba1 100644
--- a/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From b637ac8f58d17bc8888b2027a572c87531a4539d Mon Sep 17 00:00:00 2001
+From d09a034acba8922158d38fd16be970b5a454428a Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 8 May 2024 11:58:09 -0400
 Subject: [PATCH] test_shutdown: skip problematic test
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index a4c9abd8b9..22aabbb2ed 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 1a1e5c30021a200b2dc853690dbf1edfba9ca262 Mon Sep 17 00:00:00 2001
+From 6715560de4d622c2d72ee7b587c916ac647c54bb Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 6 Oct 2023 10:59:44 -0400
 Subject: [PATCH] test_storlines: skip due to load variability
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index 5c5603c956..f5e500b146 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -1,4 +1,4 @@
-From 8543ad744a2839acf1f4eec967acd645fd89d1a7 Mon Sep 17 00:00:00 2001
+From 011b21dc9b090c0b97eaecbd80a9e0c1cd39b12d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:16:40 +0100
 Subject: [PATCH] configure.ac: do not add a curses include path from the host
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index cdc54e5..d163c73 100644
+index 6e465a4..13c4835 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6536,12 +6536,6 @@ AS_VAR_IF([have_panel], [no], [
+@@ -6537,12 +6537,6 @@ AS_VAR_IF([have_panel], [no], [
    AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
  ])
  
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
index b1f2b71c2a..880a463760 100644
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -1,4 +1,4 @@
-From 8e6dc9fe684b27988b5aca3f760f02343aa95951 Mon Sep 17 00:00:00 2001
+From 6ebd9de3505be0965cfc37e2e4d0d882d75f0ec2 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Wed, 21 Sep 2011 20:55:33 -0500
 Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index 91ef3fe674..24268fb91a 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From 1bc93167c48876d77ce424415e87573a062b8f2a Mon Sep 17 00:00:00 2001
+From 0bcdb84db7801507b155a40db2228ba516edeb73 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda <ricardo@ribalda.com>
 Date: Tue, 18 Nov 2014 03:35:33 -0500
 Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
@@ -19,7 +19,7 @@ Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 093f8b5..cdc54e5 100644
+index 955daad..6e465a4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -165,7 +165,7 @@ AC_ARG_WITH([build-python],
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 9ae4af36ec..9bfdf5cd47 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -1,4 +1,4 @@
-From 38e732371ac234c3f0e6310d6dbc7ddc7f458535 Mon Sep 17 00:00:00 2001
+From 1d6f0f5f8a1279fc9bc06266caa3f3b6f234c4cb Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 27 May 2022 17:05:44 +0100
 Subject: [PATCH] python3: Ensure stale empty python module directories don't
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index e9494b555d..f420404f34 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 08c7867a02d26aac41764b915dc925343305e7af Mon Sep 17 00:00:00 2001
+From be22dd9b091af8f971f924fdbce5b439d9b2e850 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -17,10 +17,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 23e20e9..b1c5413 100644
+index dce36a5..2d235d2 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2260,7 +2260,7 @@ COMPILEALL_OPTS=-j0
+@@ -2265,7 +2265,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.12.7.bb b/meta/recipes-devtools/python/python3_3.12.8.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.7.bb
rename to meta/recipes-devtools/python/python3_3.12.8.bb
index d2f0ea3fde..fddb29b271 100644
--- a/meta/recipes-devtools/python/python3_3.12.7.bb
+++ b/meta/recipes-devtools/python/python3_3.12.8.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "24887b92e2afd4a2ac602419ad4b596372f67ac9b077190f459aba390faf5550"
+SRC_URI[sha256sum] = "c909157bb25ec114e5869124cc2a9c4a4d4c1e957ca4ff553f1edc692101154e"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


