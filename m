Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2686ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:04:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5333.1663157071169699400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Er1qbgJG;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id n8so3888793wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=JNcWLO7JoUswViP9uAatMcZYWiPBaqwLrpM7zl7M8kE=;
        b=Er1qbgJGYwrEVsPdMcNKKwvGiZ0bVvV1Rar7uwUAg/u/HcZFzEBqUlJMUmoiBVy76B
         nVA94LKjitONAL1o8k56NsIfQnkgPNwSLQuMGgxlihKP+EhdnqbztD5v4Brg9ele9uqj
         XTb3IOaykYB86Yz+Lm1FKUOKkqLViub6g8BirfuLFc9KQBhc1LbOx6wnyY/D3vA89MWz
         Rp7XATlKLzFpwkXG6BZAGH2tlnaDjQWQOajmhl5MZSNUEMxRu6aXjfX5FkSoOJo1nFHh
         fR/dsYYFon3e3wS8LhBWnS9AcF6IO1Ta4KVkq3lVCuhn3mZnK8IfKEJXaDIl4CkkzBOo
         2RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=JNcWLO7JoUswViP9uAatMcZYWiPBaqwLrpM7zl7M8kE=;
        b=wNjp/gxtHC7Ob2fwrte1rz76lATdYUwLUqK1eGu/KqEAOEEZpFfxNyHHOfzGvVSHLp
         FHMdB33aXmo49zBJuSHXvj4Fh8HInCDGpNXbSqaT/T+wTwMxCp2dNHhV5NFS1ggg/cbB
         82rDT1OH4Hb45lSqebv59/k6EZMWDzKbJ5R/3vb/H0QxOv4wQN44mhuQUAl19+QS0scE
         ADfiYkj68fa98aVxIayTsIWoB7K1Zele6UwjRUH21t0nft/GfFoi7cyARLScKTR2Qdim
         opJIYyXeToZAWLB4XQRhqWGZ27yND5lctV5zzbln/AvVhg6KU+UOKNGSgzDNzAYTIXXO
         mKQg==
X-Gm-Message-State: ACgBeo3Erlx2SGTf2CIZXSryLQS3vIY/t2KtV/j+JXcLAMv04KutLAjX
	U1zIhtJHmc2FPUxfftQZV3jabfQQ8RxXfQ==
X-Google-Smtp-Source: 
 AA6agR75EKQIW4+GPVaWyeY5qut3c2CX01lXT9knklPIkY6k3CV2S4l1IFVdQAHYN5RXwi/A5jpqBA==
X-Received: by 2002:a05:600c:3492:b0:3b4:9fcc:cbb6 with SMTP id
 a18-20020a05600c349200b003b49fcccbb6mr2228995wmq.42.1663157069419;
        Wed, 14 Sep 2022 05:04:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay3-20020a05600c1e0300b003b339438733sm16977972wmb.19.2022.09.14.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:04:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH] python3: update 3.10.6 -> 3.11.0rc2
Date: Wed, 14 Sep 2022 14:04:20 +0200
Message-Id: <20220914120421.551923-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 12:04:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170655

The semaphore fix has landed and is available from 3.11 onwards:
https://github.com/python/cpython/commit/1ee0f94d16f150356a4b9b0a39d44ba1d2d5b9fc

3.11 release schedule: https://peps.python.org/pep-0664/

Drop 0001-Mitigate-the-race-condition-in-testSockName.patch
as it is merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/python3-dir.bbclass       |  2 +-
 ...ib-termcap-to-linker-flags-to-avoid-.patch |  8 ++--
 ...-search-system-for-headers-libraries.patch |  6 +--
 ...-use-prefix-value-from-build-configu.patch | 14 +++---
 ...e-the-race-condition-in-testSockName.patch | 47 -------------------
 ...sts-due-to-load-variability-on-YP-AB.patch | 18 +++----
 ...FLAG_REF-always-for-interned-strings.patch | 33 -------------
 ...-detection-of-mips-architecture-for-.patch | 33 ++++++++++---
 ...fig-append-STAGING_LIBDIR-python-sys.patch |  6 +--
 ...asename-to-replace-CC-for-checking-c.patch | 44 ++++++++---------
 ...tutils-prefix-is-inside-staging-area.patch | 10 ++--
 .../python3/avoid_warning_about_tkinter.patch | 21 ++++-----
 .../python/python3/crosspythonpath.patch      | 22 ++++-----
 .../python/python3/makerace.patch             | 10 ++--
 ...python3_3.10.6.bb => python3_3.11.0rc2.bb} | 13 ++---
 15 files changed, 112 insertions(+), 175 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
 rename meta/recipes-devtools/python/{python3_3.10.6.bb => python3_3.11.0rc2.bb} (97%)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 912c67253c..d93d337f76 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PYTHON_BASEVERSION = "3.10"
+PYTHON_BASEVERSION = "3.11"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
index 62ef6efc28..16a4185704 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
@@ -1,4 +1,4 @@
-From 80f872e4573f542d33f91514538755557d566f79 Mon Sep 17 00:00:00 2001
+From 93ae2ed3fc8be0245e35063c4f63626792f4cd0c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 25 Jan 2019 19:04:13 +0100
 Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
@@ -12,14 +12,14 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 43e807f..11b5cf5 100644
+index 15d0d45..37ed244 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1149,7 +1149,6 @@ class PyBuildExt(build_ext):
+@@ -1109,7 +1109,6 @@ class PyBuildExt(build_ext):
                                                       'termcap'):
                  readline_libs.append('termcap')
              self.add(Extension('readline', ['readline.c'],
 -                               library_dirs=['/usr/lib/termcap'],
-                                extra_link_args=readline_extra_link_args,
                                 libraries=readline_libs))
          else:
+             self.missing.append('readline')
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index c790c7b886..f1ffeaebda 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From 7589ab03ad3f7cb4bb092c31273ff22371ac77e4 Mon Sep 17 00:00:00 2001
+From cc1c59cb7779bab1c20edde9dab9c8b225821095 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index c3a6b5e..c892537 100644
+index 7555dcd..b601da2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):
+@@ -877,8 +877,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 641017edd5..164dc13d20 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From d82cb96eed1098920ad3cdcb36feb32137618066 Mon Sep 17 00:00:00 2001
+From 19d239870c30d000f466dc2fdd0ff3a350753bf9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -15,11 +15,11 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index e64bcdc..40c6b3e 100644
+index 93c6f73..ff399e2 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -613,6 +613,11 @@ def get_config_vars(*args):
-             _init_non_posix(_CONFIG_VARS)
+@@ -668,6 +668,11 @@ def get_config_vars(*args):
+             _CONFIG_VARS['VPATH'] = sys._vpath
          if os.name == 'posix':
              _init_posix(_CONFIG_VARS)
 +        _CONFIG_VARS['installed_base'] = _CONFIG_VARS['prefix']
@@ -27,6 +27,6 @@ index e64bcdc..40c6b3e 100644
 +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
 +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
 +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
-         # For backward compatibility, see issue19555
-         SO = _CONFIG_VARS.get('EXT_SUFFIX')
-         if SO is not None:
+         if _HAS_USER_BASE:
+             # Setting 'userbase' is done below the call to the
+             # init function to enable using 'get_config_var' in
diff --git a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch b/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
deleted file mode 100644
index e19df08f87..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 8103b90148e8768456c3ab707de105d63d9d5b20 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 17 Jun 2022 11:53:59 +0100
-Subject: [PATCH] Mitigate the race condition in testSockName
-
-find_unused_port() has an inherent race condition, but we can't use
-bind_port() as that uses .getsockname() which this test is exercising.
-
-Try binding to unused ports a few times before failing.
----
- Lib/test/test_socket.py | 15 +++++++++++++--
- 1 file changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/Lib/test/test_socket.py b/Lib/test/test_socket.py
-index c981903824..b1630d18b6 100644
---- a/Lib/test/test_socket.py
-+++ b/Lib/test/test_socket.py
-@@ -1390,10 +1390,21 @@ def testStringToIPv6(self):
- 
-     def testSockName(self):
-         # Testing getsockname()
--        port = socket_helper.find_unused_port()
-         sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-         self.addCleanup(sock.close)
--        sock.bind(("0.0.0.0", port))
-+
-+        # Since find_unused_port() is inherently subject to race conditions, we
-+        # call it a couple times if necessary.
-+        for i in itertools.count():
-+            port = socket_helper.find_unused_port()
-+            try:
-+                sock.bind(("0.0.0.0", port))
-+            except OSError as e:
-+                if e.errno != errno.EADDRINUSE or i == 5:
-+                    raise
-+            else:
-+                break
-+
-         name = sock.getsockname()
-         # XXX(nnorwitz): http://tinyurl.com/os5jz seems to indicate
-         # it reasonable to get the host's addr in addition to 0.0.0.0.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 96c5a3c840..61dd4a5bc0 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 7171aeee22a0b7ab57cdf3d1ae15530549f8f92a Mon Sep 17 00:00:00 2001
+From 01e02fb4720ecbbc44c694ee1b7fb6d5d95b5fe2 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -17,10 +17,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  2 files changed, 3 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 3bc5b8f..a6e106d 100644
+index 599c3f2..23328be 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -568,6 +568,7 @@ class _TestProcess(BaseTestCase):
+@@ -618,6 +618,7 @@ class _TestProcess(BaseTestCase):
  
          close_queue(q)
  
@@ -28,7 +28,7 @@ index 3bc5b8f..a6e106d 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -4817,6 +4818,7 @@ class TestWait(unittest.TestCase):
+@@ -4890,6 +4891,7 @@ class TestWait(unittest.TestCase):
          sem.release()
          time.sleep(period)
  
@@ -37,13 +37,13 @@ index 3bc5b8f..a6e106d 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 875615a..aebaa8c 100644
+index 884b142..542e980 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -474,6 +474,7 @@ class TimeTestCase(unittest.TestCase):
-     def test_perf_counter(self):
-         time.perf_counter()
- 
+@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):
+     @unittest.skipIf(
+         support.is_wasi, "process_time not available on WASI"
+     )
 +    @unittest.skip('timing related test, dependent on load')
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
deleted file mode 100644
index 993ac243fc..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d7217b79a4e125d4fcc1087743171b94d91d1121 Mon Sep 17 00:00:00 2001
-From: Inada Naoki <songofacandy@gmail.com>
-Date: Sat, 14 Jul 2018 00:46:11 +0900
-Subject: [PATCH] Use FLAG_REF always for interned strings
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/8226]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-
----
- Python/marshal.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/Python/marshal.c b/Python/marshal.c
-index 4125240..341c9aa 100644
---- a/Python/marshal.c
-+++ b/Python/marshal.c
-@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
-     if (p->version < 3 || p->hashtable == NULL)
-         return 0; /* not writing object references */
- 
--    /* if it has only one reference, it definitely isn't shared */
--    if (Py_REFCNT(v) == 1)
-+    /* If it has only one reference, it definitely isn't shared.
-+     * But we use TYPE_REF always for interned string, to PYC file stable
-+     * as possible.
-+     */
-+    if (Py_REFCNT(v) == 1 &&
-+            !(PyUnicode_CheckExact(v) && PyUnicode_CHECK_INTERNED(v))) {
-         return 0;
-+    }
- 
-     entry = _Py_hashtable_get_entry(p->hashtable, v);
-     if (entry != NULL) {
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index 6ab335a405..f303eb35dc 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -1,4 +1,4 @@
-From bb409432f03dd8256865292e382ad16613737829 Mon Sep 17 00:00:00 2001
+From d2abe7328cea770425405aa0da2f4c2dac89fcad Mon Sep 17 00:00:00 2001
 From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 Date: Fri, 31 May 2019 15:34:34 +0200
 Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
@@ -15,19 +15,19 @@ Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
 ---
- configure.ac | 175 +++++++--------------------------------------------
- 1 file changed, 21 insertions(+), 154 deletions(-)
+ configure.ac | 196 ++++++---------------------------------------------
+ 1 file changed, 21 insertions(+), 175 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4230ef2..ee08b1b 100644
+index 358b6ea..085fc0b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -718,160 +718,27 @@ then
+@@ -907,181 +907,27 @@ then
  fi
  
  
 -AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
--cat >> conftest.c <<EOF
+-cat > conftest.c <<EOF
 -#undef bfin
 -#undef cris
 -#undef fr30
@@ -167,6 +167,22 @@ index 4230ef2..ee08b1b 100644
 -        darwin
 -#elif defined(__VXWORKS__)
 -        vxworks
+-#elif defined(__wasm32__)
+-#  if defined(__EMSCRIPTEN__)
+-	wasm32-emscripten
+-#  elif defined(__wasi__)
+-	wasm32-wasi
+-#  else
+-#    error unknown wasm32 platform
+-#  endif
+-#elif defined(__wasm64__)
+-#  if defined(__EMSCRIPTEN)
+-	wasm64-emscripten
+-#  elif defined(__wasi__)
+-	wasm64-wasi
+-#  else
+-#    error unknown wasm64 platform
+-#  endif
 -#else
 -# error unknown platform triplet
 -#endif
@@ -175,6 +191,11 @@ index 4230ef2..ee08b1b 100644
 -
 -if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
 -  PLATFORM_TRIPLET=`grep -v '^#' conftest.out | grep -v '^ *$' | tr -d ' 	'`
+-  case "$build_os" in
+-  linux-musl*)
+-    PLATFORM_TRIPLET=`echo "$PLATFORM_TRIPLET" | sed 's/linux-gnu/linux-musl/'`
+-    ;;
+-  esac
 -  AC_MSG_RESULT([$PLATFORM_TRIPLET])
 -else
 -  AC_MSG_RESULT([none])
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 368a725ff7..8495a15f8d 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From c24674e0a52367359a1a3d950bab8bc3d282279b Mon Sep 17 00:00:00 2001
+From 4d7bb3c63c57f4bf516d82e7e1ea093ac859b7c4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 40c6b3e..ac94cc7 100644
+index ff399e2..95844cf 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -474,6 +474,8 @@ def _init_posix(vars):
+@@ -528,6 +528,8 @@ def _init_posix(vars):
      """Initialize the module as appropriate for POSIX systems."""
      # _sysconfigdata is generated at build time, see _generate_posix_vars()
      name = _get_sysconfigdata_name()
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 2c7d264da0..4d589dd759 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From 9f68a27eb34394a00f1011c06900c609f15fb15c Mon Sep 17 00:00:00 2001
+From 175ed10e0a59a5395546ef88702f23d100b909f9 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -27,18 +27,18 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0c06914..299786b 100644
+index 77fb609..358b6ea 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -61,6 +61,7 @@ AC_CONFIG_HEADER(pyconfig.h)
+@@ -134,6 +134,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
  AC_CANONICAL_HOST
  AC_SUBST(build)
  AC_SUBST(host)
 +LT_INIT
  
- # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
- rm -f pybuilddir.txt
-@@ -688,7 +689,7 @@ AC_MSG_RESULT($with_cxx_main)
+ AS_VAR_IF([cross_compiling], [maybe],
+  [AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])]
+@@ -877,7 +878,7 @@ AC_MSG_RESULT($with_cxx_main)
  preset_cxx="$CXX"
  if test -z "$CXX"
  then
@@ -47,7 +47,7 @@ index 0c06914..299786b 100644
          gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
          cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
          clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
-@@ -976,7 +977,7 @@ rmdir CaseSensitiveTestDir
+@@ -1290,7 +1291,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -56,16 +56,16 @@ index 0c06914..299786b 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1374,7 +1375,7 @@ else
- fi],
+@@ -1798,7 +1799,7 @@ esac
+ ],
  [AC_MSG_RESULT(no)])
  if test "$Py_LTO" = 'true' ; then
 -  case $CC in
 +  case $cc_basename in
      *clang*)
-       AC_SUBST(LLVM_AR)
-       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
-@@ -1467,7 +1468,7 @@ then
+       dnl flag to disable lto during linking
+       LDFLAGS_NOLTO="-fno-lto"
+@@ -1917,7 +1918,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -74,7 +74,7 @@ index 0c06914..299786b 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -1528,7 +1529,7 @@ esac
+@@ -1978,7 +1979,7 @@ esac
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -83,16 +83,16 @@ index 0c06914..299786b 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -1664,7 +1665,7 @@ yes)
+@@ -2197,7 +2198,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
--    case "$CC" in
-+    case "$cc_basename" in
-     *icc*)
-     ac_cv_disable_unused_result_warning=no
-     ;;
-@@ -2018,7 +2019,7 @@ yes)
+-    AS_CASE([$CC],
++    AS_CASE([$cc_basename],
+             [*icc*], [ac_cv_disable_unused_result_warning=no]
+             [PY_CHECK_CC_WARNING([disable], [unused-result])])
+     AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
+@@ -2439,7 +2440,7 @@ yes)
      ;;
  esac
  
@@ -101,7 +101,7 @@ index 0c06914..299786b 100644
  *icc*)
      # ICC needs -fp-model strict or floats behave badly
      CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
-@@ -2836,7 +2837,7 @@ then
+@@ -3281,7 +3282,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -110,7 +110,7 @@ index 0c06914..299786b 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -5622,7 +5623,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
+@@ -6370,7 +6371,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index a06e9b56c1..6d38c0a6b2 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 1cc4cab8d579bbccb8a4fc13a28158a58c603cb4 Mon Sep 17 00:00:00 2001
+From 2ce15e7786534d546f93cf6cf45d2c59fbbaebea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
@@ -18,10 +18,10 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
  1 file changed, 11 insertions(+), 3 deletions(-)
 
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 3414a76..361d3a1 100644
+index 03b8558..57d193d 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -277,7 +277,9 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -272,7 +272,9 @@ def get_python_inc(plat_specific=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -32,7 +32,7 @@ index 3414a76..361d3a1 100644
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -320,7 +322,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -315,7 +317,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -47,7 +47,7 @@ index 3414a76..361d3a1 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -334,7 +342,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -329,7 +337,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
          else:
              # Pure Python
              libdir = "lib"
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
index 2de72b7199..5a6cfc9572 100644
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -1,4 +1,4 @@
-From 6a23d52c905cd1f6a5944255903ec86ea8b904bb Mon Sep 17 00:00:00 2001
+From 627b8fe6b3c11e8bb1bb1ad1d6b816b79b8dd2ce Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei@gherzan.ro>
 Date: Mon, 28 Jan 2019 15:57:54 +0000
 Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is not yet
@@ -9,23 +9,22 @@ Upstream-Status: Inappropriate [distribution]
 
 Also simply disable the tk module since its not in DEPENDS.
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
 ---
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ setup.py | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 11b5cf5..2be4738 100644
+index 7555dcd..f29ac86 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1895,8 +1895,8 @@ class PyBuildExt(build_ext):
+@@ -1364,7 +1364,6 @@ class PyBuildExt(build_ext):
          self.detect_decimal()
          self.detect_ctypes()
          self.detect_multiprocessing()
--        if not self.detect_tkinter():
--            self.missing.append('_tkinter')
-+#        if not self.detect_tkinter():
-+#            self.missing.append('_tkinter')
+-        self.detect_tkinter()
          self.detect_uuid()
  
- ##         # Uncomment these lines if you want to play with xxmodule.c
+         # Uncomment the next line if you want to play with xxmodule.c
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index 5bb25264da..2fbb17f118 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From baa3a232e64e9bf5ae945366efdb8088ccf9b828 Mon Sep 17 00:00:00 2001
+From 7d5fc6a86103d9bd4a274e9fd31b6987e39998a1 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda <ricardo@ribalda.com>
 Date: Tue, 18 Nov 2014 03:35:33 -0500
 Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
@@ -20,15 +20,15 @@ Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index d0db062..e5e3df8 100644
+index 085fc0b..22790d7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -83,7 +83,7 @@ if test "$cross_compiling" = yes; then
- 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
- 	fi
-         AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
-     fi
- elif test "$cross_compiling" = maybe; then
-     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
+@@ -163,7 +163,7 @@ AC_ARG_WITH(
+     dnl Build Python interpreter is used for regeneration and freezing.
+     ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
+     PYTHON_FOR_FREEZE="$with_build_python"
+-    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
++    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$with_build_python
+     AC_MSG_RESULT([$with_build_python])
+   ], [
+     AS_VAR_IF([cross_compiling], [yes],
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 2c06784ffc..979fc9dc36 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From 7cc02dfa593d1350a689d64a7a6f2dc6478afe24 Mon Sep 17 00:00:00 2001
+From 4f52aaf2a548b3356c6f1369c62b11335dc27464 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -18,15 +18,15 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 5e13ba2..026bffd 100644
+index 7558f0c..8cec819 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1527,7 +1527,7 @@ TESTSUBDIRS=	ctypes/test \
+@@ -2005,7 +2005,7 @@ TESTSUBDIRS=	ctypes/test \
  		unittest/test unittest/test/testmock
  
  TEST_MODULES=@TEST_MODULES@
--libinstall:	build_all $(srcdir)/Modules/xxmodule.c
-+libinstall:	build_all $(srcdir)/Modules/xxmodule.c libainstall
+-libinstall:	all $(srcdir)/Modules/xxmodule.c
++libinstall:	all $(srcdir)/Modules/xxmodule.c libainstall
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
  		if test ! -d $(DESTDIR)$$i; then \
diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.11.0rc2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3_3.10.6.bb
rename to meta/recipes-devtools/python/python3_3.11.0rc2.bb
index 1b28728732..49f017426a 100644
--- a/meta/recipes-devtools/python/python3_3.10.6.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0rc2.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+SRC_URI = "http://www.python.org/ftp/python/3.11.0/Python-${PV}.tar.xz \
            file://run-ptest \
            file://create_manifest3.py \
            file://get_module_deps3.py \
@@ -22,7 +22,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            file://crosspythonpath.patch \
-           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
@@ -35,7 +34,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://0001-Mitigate-the-race-condition-in-testSockName.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -44,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
+SRC_URI[sha256sum] = "25b35cc7d82c5ad34d867b179a1c1695d129be5ed14a21e46b6b7f2350a8b490"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -62,7 +60,7 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
 # The module will be removed in the future and flaws documented.
 CVE_CHECK_IGNORE += "CVE-2015-20107"
 
-PYTHON_MAJMIN = "3.10"
+PYTHON_MAJMIN = "3.11"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -81,11 +79,10 @@ DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/li
 DEPENDS:append:class-target = " python3-native"
 DEPENDS:append:class-nativesdk = " python3-native"
 
-# force to use the mutex+cond implementation (https://bugs.python.org/issue41710)
-CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
-
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
+EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3"
+EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
 
 export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
 
-- 
2.30.2


