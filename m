Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.15667.1624060822778831152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 17:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QseI4qiF;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id l11so2320615pji.5
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 17:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B1Mf7RlAAzGeWFt3qctCLwdNMO5Z8/rIr1xwUjpDGhs=;
        b=QseI4qiFAIp793VRre2PUy1x0O9chXl1qwBKcbaGZlTjIOAR/WuF9weBlqY/9snIhi
         hEeyWp3rMsDbr39H3154JfNYIcSNt+JttoA8lb0RKdf9UK0g4xuw/63N/VCNYzvXCfOz
         /gV+zgwjwpQ8K2kTmzCTdR9mGE+vActyM9+RH158kqop9djRKPOxLsHL1YomCeDNnCKD
         HgGMeYIdhsfZ4NUE7H01+xqnFKyvFxx0rhEnRZ2dJifVIJD57RkudaYaTjwqd3BNbbw2
         4Fnk2YO8/CFpo9PBVvFdqVjGS3MqF9fQIPa8ZNeSse35Mt14pzLL0NbdaYvQ9L89WOSg
         zAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1Mf7RlAAzGeWFt3qctCLwdNMO5Z8/rIr1xwUjpDGhs=;
        b=gAPPHMWQl1RnUtv782zBgEn3lotpRY2YrozEFBctACbketSRfZrnA7tLVcN8zawSsG
         fMS2QGBvh0v2H7UpYg3k7c3iR3xY+e+GMBpCu2dl/ZHiv6rZFA6lHD0JEHt+o9ugiIKA
         ctrJoncKBEe6Ujobnvxb6mozsKX43/XTxZHmey11/q6KAtlwBI2uMgT6QbugbUZBhqVU
         3xLUafGqbHHHZ7h4dhHnTzUp4/2xVPghsXl++EGXrbNKFBYDRxBQtmzXUI72j/szmYJl
         deSx2fIplx+FTtzFvrV7jqePpvWTKbZL3Tr2V5/3hPZC/Aa4uhJSUyZ9dkmwea3Al/Nw
         /flQ==
X-Gm-Message-State: AOAM532mivySWaqcTc1z2uDILD1eft8Ki+HfrbUJfhYB0W9bQTWPtSyD
	xkg9G5DxpDbdvZODT5IHpoYLLgiyx31jpQ==
X-Google-Smtp-Source: ABdhPJyr9/roF0VVzHrzIV8Y/1S9der1mD3Ewi8VGq1N3QUxRT/vdaR9JGbfh7Ob6S/jTXhcUNAmfw==
X-Received: by 2002:a17:90a:780c:: with SMTP id w12mr5352948pjk.42.1624060821991;
        Fri, 18 Jun 2021 17:00:21 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:892d:1e9b:5562:7e0d])
        by smtp.gmail.com with ESMTPSA id n19sm4411751pgd.73.2021.06.18.17.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 17:00:21 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/1] python3: skip tests requiring tools-sdk
Date: Fri, 18 Jun 2021 17:00:19 -0700
Message-Id: <4207e03bcbbfd8b6113c04bc7c35ceb516af31f6.1624060313.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624060313.git.timothy.t.orling@intel.com>
References: <cover.1624060313.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conditionally skip test_ctypes.test_find unless
IMAGE_FEATURES contains 'tools-sdk' as these test
cases require full packagegroup-core-buildessential

Fixes:
  AssertionError: Failed ptests:
  {'python3': ['test_find_library_with_gcc', 'test_find_library_with_ld']}

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...pes.test_find-skip-without-tools-sdk.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.9.5.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
new file mode 100644
index 00000000000..7d684b3c43c
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
+Signed-off-by: Tim Orling <timothy.t.orlign@intel.com>
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
++    @unittest.skip("Needs IMAGE_FEATURE += \"tools-sdk\"")
+     def test_find_library_with_gcc(self):
+         with unittest.mock.patch("ctypes.util._findSoname_ldconfig", lambda *args: None):
+             self.assertNotEqual(find_library('c'), None)
+ 
++    @unittest.skip("Needs IMAGE_FEATURE += \"tools-sdk\"")
+     def test_find_library_with_ld(self):
+         with unittest.mock.patch("ctypes.util._findSoname_ldconfig", lambda *args: None), \
+              unittest.mock.patch("ctypes.util._findLib_gcc", lambda *args: None):
diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
index f4002f2516f..1717ff737d4 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
+           ${@bb.utils.contains('IMAGE_FEATURES', 'tools-sdk', '', 'file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch', d)} \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.30.2

