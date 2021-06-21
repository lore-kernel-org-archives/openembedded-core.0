Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.50258.1624294991834483933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z5TVH0p7;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id w71so4117976pfd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FHwIpjjknvF2TV7A/Psszo32E4Q2WEuOs1MJ4f7fgPE=;
        b=Z5TVH0p7MaaGBp8S7VCu4nlmut5ZPr0LNVQDviNcOsT5bS4TwY2vqt7KCAeLwk8zqY
         BVVzAlK21oU/08zJC8wNDb0eOZpdbOHmrpjk3ePzSP9qbqT8oElpTWqlWIVN34A/9F7W
         vcdQ9v84FM6ogNYeNDo0dylsTRpvl8HmtRSoZ2GU+Y6Pusuaa4Cp+1gjGs/J+Pfl5eUI
         9ntzUFuxAGSplrFfsnWJfhT7RsfiPw1C+iuT89NDq5qShG3xUB1V3ymcWOBUZIx8MBR/
         tbziYMmQoQQ0+eRSPLrvEP6jI11UnX8Cp1GH7Z2p7dHGCBwz53ypeuzHgacXtZq/Lr94
         pd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FHwIpjjknvF2TV7A/Psszo32E4Q2WEuOs1MJ4f7fgPE=;
        b=O+BkTmugnCDZrkfTCXRblpeJJydudOlE1JFkqzwvGdZeAtXt5BLy4UFJ0cdKM6+XAI
         tJx2SesFuV1kJ7NuJ633vCwEzGf5dYN4uKMSlKSaQwvHI6eMaH37vQGxIWbyEaPIi6cP
         HC+2gIuLisZupm530yu012qDXAI92Yb5MsOX95ATTAwcyCgh8WCt5gl0jzNiHhatQUTC
         rcb7u9UqUr3au4zdzVW89big9bN02x/74y4tuP2xthu+RXf3akRXUWIBzKqWoSsJDFIe
         i05IAfo7BtdvsBGd/YY0nL+TFEKk3K2eBrHJSzQj8DvTbuIIB0/yomTZ6oi/ptAtowSh
         hEiA==
X-Gm-Message-State: AOAM531P+ibniLue6mBSi40fPwVKVQJqIoxU7RUNje+Tlm64vfyWaZr3
	nTvSOUvOU5VkuPp7xqPmDjc3xa7ghv7evA==
X-Google-Smtp-Source: ABdhPJy3XwEmPECZ4WgFL6Bsor4KHXUJd9vQIsawVDXsHOCflN9pl4UAzUohD3loNYSg5p2RC2kyYQ==
X-Received: by 2002:a63:1f57:: with SMTP id q23mr24951984pgm.398.1624294991168;
        Mon, 21 Jun 2021 10:03:11 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:10 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 07/10][dunfell] python3: skip tests requiring tools-sdk
Date: Mon, 21 Jun 2021 10:02:54 -0700
Message-Id: <98378ccfd3108986e15fa3d4fc92dc9501fa4581.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
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
 meta/recipes-devtools/python/python3_3.8.8.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
new file mode 100644
index 00000000000..a44d3396a61
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
diff --git a/meta/recipes-devtools/python/python3_3.8.8.bb b/meta/recipes-devtools/python/python3_3.8.8.bb
index d77c7d87fb7..0febe6b672d 100644
--- a/meta/recipes-devtools/python/python3_3.8.8.bb
+++ b/meta/recipes-devtools/python/python3_3.8.8.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           ${@bb.utils.contains('IMAGE_FEATURES', 'tools-sdk', '', 'file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch', d)} \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.30.2

