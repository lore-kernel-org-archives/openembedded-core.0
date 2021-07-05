Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.517.1625524528178604806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VQh0Hxcx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so19775333otl.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JHbE/Yr+Oo8mRHTqnU1161uosddmp9I7neHtd37nkMY=;
        b=VQh0Hxcxi5ASW+eaXiCmBGBwAx8wen+rnwjJhN1ivtJdJ6rTea/rD1YfpNJynIgoML
         NVb9oeNWhNkZpKGRI67gOZeSo7Z4dXlJKluDQS3uuL5gs/dZoRBKe5BB8EnAUxDN17HC
         57peqCL5CDLWT9s5mQTZTXorUHv7iGjA4PcpKAvnQDCaElwYjGVBg7i4buhcAupYMmZ1
         dZ8m6tySEBvraZEAZ+lk4KtfxXh73vwQRPt5kukIgo2gBMNrHk78e3zl8BFS1gxp2ewh
         BkFTqQkz5kN735DT3hzoXht7wMaK2T7Y4jWrdZBrzK/VOcoV2sxOKqius3xzoEuv1K7t
         kN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JHbE/Yr+Oo8mRHTqnU1161uosddmp9I7neHtd37nkMY=;
        b=H5TKQvLlnTNuPptSz7sfAuyPA7JfSrd2B60V8ZV1jV6VVhOhfIrdZ6hOGEDQzO2IDC
         XHzG3963r+E0X5gV7p84OC3IHo2R+GC+ondbHBKNA/Sx0soQmubntC4n/Fo7aZR0p5Lg
         f454U2lyqyNyVogySSXhVNcV4BjyHVQeaMjQjKWQOtEzkZoI4366fuHnEWGTPabXEYpQ
         HTzH2pvSofcoBbggVtVEbre/y/nSsxPA6IRViF+ge73lWMgHJakllVRAVCWQHE93C1s1
         SZXIml0UU2OKvHu3v5nhJl+Eqq8QMiQDsyxI9ptITFf0gifodWaJ8tIWuL71EUozTJ1/
         6Yng==
X-Gm-Message-State: AOAM531B8sjv9GpK+OfsjXnIoWlYK8HL/4jhXPhZCyF9h/OFj4aJuZy5
	b0Rh3R9SJ2T0WJGaGBJyFxSTRipIdLHETQno
X-Google-Smtp-Source: ABdhPJzoMxWpjZm8tbhuUTBicLnscCmvttt4T8U6izsZHT4HbAj0FwFsWkjR8hIwpNcz164fnjIUuA==
X-Received: by 2002:a9d:5506:: with SMTP id l6mr12877620oth.176.1625524527141;
        Mon, 05 Jul 2021 15:35:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/19] python3: skip tests requiring tools-sdk
Date: Mon,  5 Jul 2021 12:34:38 -1000
Message-Id: <63bc36dbd93c46be8adf7db00e3fc22897eb1846.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Conditionally skip test_ctypes.test_find unless
IMAGE_FEATURES contains 'tools-sdk' as these test
cases require full packagegroup-core-buildessential

Fixes:
AssertionError: Failed ptests:
{'python3': ['test_find_library_with_gcc', 'test_find_library_with_ld']}

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...pes.test_find-skip-without-tools-sdk.patch | 33 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.8.10.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
new file mode 100644
index 0000000000..a44d3396a6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -0,0 +1,33 @@
+From 7a2bddfa437be633bb6945d0e6b7d6f27da870ad Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@intel.com>
+Date: Fri, 18 Jun 2021 11:56:50 -0700
+Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
+
+These tests need full packagegroup-core-buildessential, the
+easiest way to dynamically check for that is looking for
+'tools-sdk' in IMAGE_FEATURES.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ Lib/ctypes/test/test_find.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/ctypes/test/test_find.py b/Lib/ctypes/test/test_find.py
+index 92ac184..0d009d1 100644
+--- a/Lib/ctypes/test/test_find.py
++++ b/Lib/ctypes/test/test_find.py
+@@ -112,10 +112,12 @@ class FindLibraryLinux(unittest.TestCase):
+                 # LD_LIBRARY_PATH)
+                 self.assertEqual(find_library(libname), 'lib%s.so' % libname)
+
++    @unittest.skip("Needs IMAGE_FEATURES += \"tools-sdk\"")
+     def test_find_library_with_gcc(self):
+         with unittest.mock.patch("ctypes.util._findSoname_ldconfig", lambda *args: None):
+             self.assertNotEqual(find_library('c'), None)
+
++    @unittest.skip("Needs IMAGE_FEATURES += \"tools-sdk\"")
+     def test_find_library_with_ld(self):
+         with unittest.mock.patch("ctypes.util._findSoname_ldconfig", lambda *args: None), \
+              unittest.mock.patch("ctypes.util._findLib_gcc", lambda *args: None):
diff --git a/meta/recipes-devtools/python/python3_3.8.10.bb b/meta/recipes-devtools/python/python3_3.8.10.bb
index ae32ccc40e..c3da6718a8 100644
--- a/meta/recipes-devtools/python/python3_3.8.10.bb
+++ b/meta/recipes-devtools/python/python3_3.8.10.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           ${@bb.utils.contains('IMAGE_FEATURES', 'tools-sdk', '', 'file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch', d)} \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.1

