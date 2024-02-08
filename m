Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF1FC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 16:26:38 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.21877.1707409589451449712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 08:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ldbs2w2j;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-290d59df3f0so1494619a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707409589; x=1708014389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/qyhENH4agzxqPYzChrnII66d79th7HhfdbF8rrGe8=;
        b=Ldbs2w2j3TmGXognvg9U7Yx+L67gQQyysaU0ejGstpTTyaP1e/FYkij9MFm6Rpk7Ul
         BtjcrIBnhYS9liIRckMlFk7M+NKH23rL4Ba+44DgNj+7aDtRNRk+kTPlJVzvDaMO07qy
         dES5r/qtHSdDIwplWdz4C/KW863Z0bZVG5R9YR7w0pwBZfGRvkS5y24gk0T5SIgv3bH3
         u6fGrAiyZStOV1MDyHC2yVjw/7gfpfLINHwUXi7pRAcpWzYSjO8v0xZQfgDF6DBucypU
         PAf24NgbwKCtC8qlnIndVK3GATkA9W9UQDMFo3FlE5g/QDyLBVchqkVFaOvigU0rG9rM
         2vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707409589; x=1708014389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/qyhENH4agzxqPYzChrnII66d79th7HhfdbF8rrGe8=;
        b=pN79pys8BeBS0E/DSFcTShcmTCOvQjEdTQJfrDgYKPeIVQmmFeIFbLFg2HRK6Kve0l
         u3kXOl3/1/7pJ6BHBaGNeMXsxwjMHO7bER8mRFnVAL00mkJTleRRCBCIsKAJEv/6WqAq
         rTCY6ANW1Jgyh+XMKSs+RTgy3U4AELEK31TlWoWkaDqNQkDUZaPwvjlFyoC+fy3XVL47
         Q57kFtPK6XJVvN6Y4NAgJQ2Eotkz4cWnSGoLxgH37pRZkLK1FZmPXs3+QQNm6JSaLAN2
         UMijlLNlygXHnCzgA/pLYgB6NRaDfoqRBDw9DIgWUcv2ucfwCjEILz6JEa+tej/IRV3J
         d2zw==
X-Gm-Message-State: AOJu0Yxl7oGX3Hvqszs9uquTmwuW2itBP+VE/kxgLeXCzPeWcWkOqkOA
	i+Pz1MJZSPY5N0SOvcBtPHBSFu3qEwW3/HygJZv+wW1HlReaZggR7YnDWXTBFJQ=
X-Google-Smtp-Source: AGHT+IH/2inHbXfZ/qHnGVwBO/tj3PzDAgyrdyQS2OFoaxpx48v601l29Ev3pYmSMhOKy+k++Y0dIw==
X-Received: by 2002:a17:90a:9a7:b0:296:15e7:8f33 with SMTP id 36-20020a17090a09a700b0029615e78f33mr5494507pjo.3.1707409588475;
        Thu, 08 Feb 2024 08:26:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902f78200b001d78a08e8e7sm3586825pln.250.2024.02.08.08.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 08:26:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] python3: Fix ptests with expat 2.6+
Date: Thu,  8 Feb 2024 08:26:25 -0800
Message-ID: <20240208162625.2575278-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 16:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195160

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Replace the patch with next version of the fix from upstream PR

 ...sts-for-XMLPullParser-with-Expat-2.6.patch | 110 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.1.bb |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-115133-Fix-tests-for-XMLPullParser-with-Expat-2.6.patch

diff --git a/meta/recipes-devtools/python/python3/0001-gh-115133-Fix-tests-for-XMLPullParser-with-Expat-2.6.patch b/meta/recipes-devtools/python/python3/0001-gh-115133-Fix-tests-for-XMLPullParser-with-Expat-2.6.patch
new file mode 100644
index 00000000000..baf7776963f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-gh-115133-Fix-tests-for-XMLPullParser-with-Expat-2.6.patch
@@ -0,0 +1,110 @@
+From f329ff6286e19aedfefd306676fe2ab0b587db5a Mon Sep 17 00:00:00 2001
+From: Serhiy Storchaka <storchaka@gmail.com>
+Date: Thu, 8 Feb 2024 14:17:04 +0200
+Subject: [PATCH] gh-115133: Fix tests for XMLPullParser with Expat 2.6.0
+
+Feeding the parser by too small chunks defers parsing to prevent
+CVE-2023-52425. Future versions of Expat may be more reactive.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/115164]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Lib/test/test_xml_etree.py                    | 58 ++++++++++++-------
+ ...-02-08-14-21-28.gh-issue-115133.ycl4ko.rst |  2 +
+ 2 files changed, 38 insertions(+), 22 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-02-08-14-21-28.gh-issue-115133.ycl4ko.rst
+
+diff --git a/Lib/test/test_xml_etree.py b/Lib/test/test_xml_etree.py
+index 53a4e9f..d406235 100644
+--- a/Lib/test/test_xml_etree.py
++++ b/Lib/test/test_xml_etree.py
+@@ -13,6 +13,7 @@ import itertools
+ import operator
+ import os
+ import pickle
++import pyexpat
+ import sys
+ import textwrap
+ import types
+@@ -120,6 +121,10 @@ ATTLIST_XML = """\
+ </foo>
+ """
+ 
++fails_with_expat_2_6_0 = (unittest.expectedFailure
++                        if pyexpat.version_info >= (2, 6, 0) else
++                        lambda test: test)
++
+ def checkwarnings(*filters, quiet=False):
+     def decorator(test):
+         def newtest(*args, **kwargs):
+@@ -1398,28 +1403,37 @@ class XMLPullParserTest(unittest.TestCase):
+         self.assertEqual([(action, elem.tag) for action, elem in events],
+                          expected)
+ 
+-    def test_simple_xml(self):
+-        for chunk_size in (None, 1, 5):
+-            with self.subTest(chunk_size=chunk_size):
+-                parser = ET.XMLPullParser()
+-                self.assert_event_tags(parser, [])
+-                self._feed(parser, "<!-- comment -->\n", chunk_size)
+-                self.assert_event_tags(parser, [])
+-                self._feed(parser,
+-                           "<root>\n  <element key='value'>text</element",
+-                           chunk_size)
+-                self.assert_event_tags(parser, [])
+-                self._feed(parser, ">\n", chunk_size)
+-                self.assert_event_tags(parser, [('end', 'element')])
+-                self._feed(parser, "<element>text</element>tail\n", chunk_size)
+-                self._feed(parser, "<empty-element/>\n", chunk_size)
+-                self.assert_event_tags(parser, [
+-                    ('end', 'element'),
+-                    ('end', 'empty-element'),
+-                    ])
+-                self._feed(parser, "</root>\n", chunk_size)
+-                self.assert_event_tags(parser, [('end', 'root')])
+-                self.assertIsNone(parser.close())
++    def test_simple_xml(self, chunk_size=None):
++        parser = ET.XMLPullParser()
++        self.assert_event_tags(parser, [])
++        self._feed(parser, "<!-- comment -->\n", chunk_size)
++        self.assert_event_tags(parser, [])
++        self._feed(parser,
++                   "<root>\n  <element key='value'>text</element",
++                   chunk_size)
++        self.assert_event_tags(parser, [])
++        self._feed(parser, ">\n", chunk_size)
++        self.assert_event_tags(parser, [('end', 'element')])
++        self._feed(parser, "<element>text</element>tail\n", chunk_size)
++        self._feed(parser, "<empty-element/>\n", chunk_size)
++        self.assert_event_tags(parser, [
++            ('end', 'element'),
++            ('end', 'empty-element'),
++            ])
++        self._feed(parser, "</root>\n", chunk_size)
++        self.assert_event_tags(parser, [('end', 'root')])
++        self.assertIsNone(parser.close())
++
++    @fails_with_expat_2_6_0
++    def test_simple_xml_chunk_1(self):
++        self.test_simple_xml(chunk_size=1)
++
++    @fails_with_expat_2_6_0
++    def test_simple_xml_chunk_5(self):
++        self.test_simple_xml(chunk_size=5)
++
++    def test_simple_xml_chunk_8(self):
++        self.test_simple_xml(chunk_size=8)
+ 
+     def test_feed_while_iterating(self):
+         parser = ET.XMLPullParser()
+diff --git a/Misc/NEWS.d/next/Library/2024-02-08-14-21-28.gh-issue-115133.ycl4ko.rst b/Misc/NEWS.d/next/Library/2024-02-08-14-21-28.gh-issue-115133.ycl4ko.rst
+new file mode 100644
+index 0000000..6f10152
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-02-08-14-21-28.gh-issue-115133.ycl4ko.rst
+@@ -0,0 +1,2 @@
++Fix tests for :class:`~xml.etree.ElementTree.XMLPullParser` with Expat
++2.6.0.
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3_3.12.1.bb b/meta/recipes-devtools/python/python3_3.12.1.bb
index 1d3a4221c32..f67aa195e2b 100644
--- a/meta/recipes-devtools/python/python3_3.12.1.bb
+++ b/meta/recipes-devtools/python/python3_3.12.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
+           file://0001-gh-115133-Fix-tests-for-XMLPullParser-with-Expat-2.6.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


