Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1411CF364AB
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 17:38:39 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138262.1775756309701741445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 10:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=At+GjvAS;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899d6b7b073so11285396d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775756308; x=1776361108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sG3dL09NHd8//KAdJZpdtoY50uq4StVkXFPAZQHRrlE=;
        b=At+GjvASF+uuetXYwcReV7F5nclOj4wbam7SBdFL0E+i04P5+0bRzMYwvAwXEaG8sk
         NA+LiHj5RZSqOAe30DgUYD+yULVvFkJ2N9oxThps2lo7z8eUP3yO+t4L0+Bxf58ofwY9
         AbYZ8252s/yNmPR9WwG8dh8x7UXxDiIOY/NgXRvkMtmVQJIcZPelhBf/6T6zQTPoQ71n
         0/g3QWoPi5uPKesZyKp77NTIfAKOaWa1p/HKMQA9NK4Zm0lq5n7SPsL3XdcVxpOeYLXd
         nf+yVocauqD+X0S+oAK42YMOJ1z2BYOEZQKHUHzCRKN7j7+OWkLXK7jcxS3fYrYG2Kge
         hGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756308; x=1776361108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG3dL09NHd8//KAdJZpdtoY50uq4StVkXFPAZQHRrlE=;
        b=USWMal1hfPVfXtzhCJPkhHME9asu+/Y8kWr8HRKDgLS1sCCB3Rhe7Mg10B0+5UUxkP
         wRGF+d/SCv0EV4/Kz9SD41es2zNIw4N+cRILXEh1XNtxlLwThBaEgjdgKWf6TLg7kUws
         l5kpkLD2HrgoDyUhL8dwzNog5D8n37HO5bGpoevHTWXUdDAF0qskDY2CV7menIZdn3rU
         o4NzbvbhGUPWcEcInhGFo+PgpFxJ2ZZxizLc1CBtMwz1OS19tJukey4CvqDQjfusDZ5n
         ufw/lcoed0Ms16i1Fz4ljTeEffC14eZ/JCLmqPw4GYrHkumJHP/PChXb+JKzM8EZnYpe
         PO3g==
X-Gm-Message-State: AOJu0YxcCiAu0cTQSgASUsdSwrs5SgJ1dCYez/jTQdYH0fvfaifv+ECZ
	3oC31Z0hzcPCW8UI0wf5sFUBcRK76fGRtArneUwG3JWfFKahz98soqGPaVxMWa11tf4k2jOjHzL
	H1oa7
X-Gm-Gg: AeBDietUOb5lMCpP8Bz5JFbBOEsHdM2u+a8+HuxoXqu8h4fx5lU+QcUaqCd4wGv+DVd
	NLZdsw22jy6L1Gln5fCcJMBO0wz80cfIZYDd295nodrgQuWl5IRSfC2+AD+il2P3wbkzZh3UJpF
	VYo73BEANcsreMnlHvjTBnK/COuRXCxvHYPib8UhIibPAnHbrv7szVHHRcMV/4mC1DavIkieDoL
	UQT2k2Pd8yTG4GmGgbeYMFuVwzKRH2QEE6tdKHI8rzIPB0U/j+yqR2m9nd1Ej/U63taamTIRP/r
	o9vu2CGswYKbMPOdqd0kbPwmSdhoLo993A7/Ygm/6wQKSw66XcYi4AxWQxGO28WpY3zcRbxg3gv
	odcFxrcTG1VHIZzZ6m4qtDEq5FT+JYgzFbauEYwhh3s/HBTWyn7UENLUxnRTgJnDJgqkhwq4vsT
	C7uJHsgD378QuFY/GzPd269pAb7of7iF0DCOSqUw==
X-Received: by 2002:a05:6214:19e4:b0:8ac:7d70:f0d0 with SMTP id 6a1803df08f44-8ac7d710175mr41962466d6.17.1775756307812;
        Thu, 09 Apr 2026 10:38:27 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84c4595fsm1304006d6.29.2026.04.09.10.38.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:38:27 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3: upgrade 3.14.3 -> 3.14.4
Date: Thu,  9 Apr 2026 13:38:26 -0400
Message-ID: <20260409173826.3600663-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 17:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234939

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-4-final

Drop patches:

- 0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch since
  it was a backport and is now included in 3.14.4.
- 0001-test_pyrepl-skip-test_pyrepl_eio.patch, the test for which was
  determined flaky and dropped upstream in commit 9743d88334ad.

ptests look OK:

|Ran 353 tests in 74.012s
|
|OK (skipped=43)
|
|== Tests result: SUCCESS ==
|
|28 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_kqueue
|    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
|    test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|9 tests skipped (resource denied):
|    test_curses test_peg_generator test_smtpnet test_socketserver
|    test_urllib2net test_urllibnet test_winsound test_xpickle
|    test_zipfile64
|
|455 tests OK.
|
|Total duration: 3 min 42 sec
|Total tests: run=46,926 skipped=2,469
|Total test files: run=483/492 skipped=28 resource_denied=9
|Result: SUCCESS
|DURATION: 223
|END: /usr/lib/python3/ptest
|2026-04-09T14:44
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
Forgot to remove the patch files from git in v1.

 ...Allow-TLS-v1.2-to-be-minimum-version.patch | 39 -------------------
 ...001-test_pyrepl-skip-test_pyrepl_eio.patch | 29 --------------
 .../{python3_3.14.3.bb => python3_3.14.4.bb}  |  3 +-
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch
 rename meta/recipes-devtools/python/{python3_3.14.3.bb => python3_3.14.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch b/meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch
deleted file mode 100644
index 3b0e98bf51..0000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bcd6e2535cb0dbf72b677eb6bddb644cb035ed51 Mon Sep 17 00:00:00 2001
-From: Colin McAllister <colinmca242@gmail.com>
-Date: Fri, 13 Feb 2026 11:17:53 -0600
-Subject: [PATCH 1/1] gh-144787: [tests] Allow TLS v1.2 to be minimum version
- (GH-144790)
-
-Allow TLS v1.2 to be minimum version
-
-Updates test_min_max_version to allow TLS v1.2 to be minimum version if
-TLS 1.0 and 1.1 are disabled in OpenSSL.
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/f24009feeb78f605a3ee177d9e7cfb63d5890ee1]
-
-Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
----
- Lib/test/test_ssl.py | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 6023c89bca..7e9ba735b3 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -1156,7 +1156,12 @@ def test_min_max_version(self):
-         ctx.maximum_version = ssl.TLSVersion.MINIMUM_SUPPORTED
-         self.assertIn(
-             ctx.maximum_version,
--            {ssl.TLSVersion.TLSv1, ssl.TLSVersion.TLSv1_1, ssl.TLSVersion.SSLv3}
-+            {
-+                ssl.TLSVersion.TLSv1,
-+                ssl.TLSVersion.TLSv1_1,
-+                ssl.TLSVersion.TLSv1_2,
-+                ssl.TLSVersion.SSLv3,
-+            }
-         )
- 
-         ctx.minimum_version = ssl.TLSVersion.MAXIMUM_SUPPORTED
--- 
-2.49.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch
deleted file mode 100644
index 9fa441014a..0000000000
--- a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_pyrepl_eio.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 79cc5e15edb5ae67832dce5dfa9e114b8740489f Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Sat, 21 Mar 2026 13:14:51 -0400
-Subject: [PATCH] test_pyrepl: skip test_pyrepl_eio
-
-Upstream-Status: Inappropriate [oe-specific]
-
-This test fails intermittently on the Autobuilder, so skip it for now.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Lib/test/test_pyrepl/test_unix_console.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lib/test/test_pyrepl/test_unix_console.py b/Lib/test/test_pyrepl/test_unix_console.py
-index 680adbc2d96..2cc69e7807e 100644
---- a/Lib/test/test_pyrepl/test_unix_console.py
-+++ b/Lib/test/test_pyrepl/test_unix_console.py
-@@ -370,6 +370,7 @@ def test_eio_error_handling_in_restore(self, mock_tcgetattr, mock_tcsetattr):
-         # EIO error should be handled gracefully in restore()
-         console.restore()
- 
-+    @unittest.skip("skipping problematic test")
-     @unittest.skipUnless(sys.platform == "linux", "Only valid on Linux")
-     def test_repl_eio(self):
-         # Use the pty-based approach to simulate EIO error
--- 
-2.53.0
-
diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.3.bb
rename to meta/recipes-devtools/python/python3_3.14.4.bb
index c40742fb43..f48dbc6996 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -33,15 +33,14 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
            file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
-           file://0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
-           file://0001-test_pyrepl-skip-test_pyrepl_eio.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
 SRC_URI[sha256sum] = "a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b"
+SRC_URI[sha256sum] = "d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.53.0


