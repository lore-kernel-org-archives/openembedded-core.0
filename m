Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E4EC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 00:42:10 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.36026.1712882525726703865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 17:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=AX/sT3Cd;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-696719f8dfcso2314736d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 17:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712882524; x=1713487324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=njcwKd0rNPxEtRb7zorqgsIUAxqDFU0oZ1PgMAelHfQ=;
        b=AX/sT3CdEL09Lie5l73xKvxYVJOs7kLoEPHDDnhVJTgofOXX1wzwBRJoL+ucv2CseQ
         iVK+WBbaDNx4l1lez4OeBDuiYovZdeTPG4DgG5VcV+YhJlufgvE+rVRzwdij3R74FoJE
         RSzVd4iCAxw7BFLuOPygPXhG+i2CasojUP11Tijq79s8XPL8QpUr4R5cD9E5t8nOXqxg
         +xR9MVk9M9B5Xeo6RaZ0mQyWvFOCYHhCPvtFOgGfE0WVa6uVGLAmpfRuD3J2kZcYhe6O
         9HijjU1JN/LM4QHK7y5OPxaBUskQXYdLxvyX1s7NJGahKSluhIP4+IWIiG7Cp8UWfOP5
         IcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712882524; x=1713487324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njcwKd0rNPxEtRb7zorqgsIUAxqDFU0oZ1PgMAelHfQ=;
        b=OeXx/XJeALb6EOD1njKdCd9oMdm8+9DtQP+T4wM4/iQNUIsJ4np7ObvuyGoHi7Ky+C
         lWg2v2yWHqWMT8wDBUwcAbkMp37RfiZHrGigDZ8tVAoIlmD9AHT/mXFMuGnyJKCnkpnT
         /BoJ9nwcO4njQ+6GDD4HNOP5nvLfO0XC3shHbCxZxNFlCJCQnMK1gUAJdfMFIG54kZlV
         Tck8f/eDASvF7m0MGieVwhzPnAsqTPxhTOT3kHIOd/k2vPo3n/FuUyWorQ0AOYX6ZC24
         zMn+dSRwJOdhTD1q8kb/x7Abgr5kk4VOc6RnXXWvXCGDiJrgkI8VqEYljThmQk8qUesv
         SF+A==
X-Gm-Message-State: AOJu0Yxkc2FynWZVOs/LZkarUhNSEmaasNvCF6D41i9waapMHd5Qg1Up
	0YqOj5/XVKUrsPxX/r3bLTpirEemrNa2uYiJHaVCCW0KO9ky2ZPTj88ixFdngRl9PhNN5H3NxNB
	mtlk=
X-Google-Smtp-Source: AGHT+IHY+A5Z2DVlLfbkiAE8y275b/QsBWpTY5E64ciQUgiflkO0msPdfY4+jLu2BBYgoBU4jKZsTA==
X-Received: by 2002:a0c:f803:0:b0:69b:1006:c888 with SMTP id r3-20020a0cf803000000b0069b1006c888mr1338764qvn.50.1712882524387;
        Thu, 11 Apr 2024 17:42:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id v10-20020a0ce1ca000000b00699427d1611sm1611748qvl.40.2024.04.11.17.42.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 17:42:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: upgrade 3.12.2 -> 3.12.3
Date: Thu, 11 Apr 2024 20:42:02 -0400
Message-ID: <20240412004202.2430828-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 00:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198149

Remove the following patch:

0001-gh-115133-Fix-tests-for-XMLPullParser-with-Expat-2.6.patch

Which a different fix was submitted for in:

c4fa79b924 [3.12] gh-115133: Fix tests for XMLPullParser with Expat 2.6.0 (GH-115164) (GH-115288)
See: https://github.com/python/cpython/pull/115288

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-12-3-final

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...y-Fix-for-Expat-2.6.0-with-reparse-d.patch | 55 -------------------
 .../{python3_3.12.2.bb => python3_3.12.3.bb}  |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
 rename meta/recipes-devtools/python/{python3_3.12.2.bb => python3_3.12.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch b/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
deleted file mode 100644
index 598ef08cc4f..00000000000
--- a/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d07ca7fbd874e230dec4d4c6d650a66ea2a9008e Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Wed, 7 Feb 2024 15:32:45 +0100
-Subject: [PATCH] test_xml_etree.py: Fix for Expat >=2.6.0 with reparse
- deferral
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/115138]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Lib/test/test_xml_etree.py                             | 10 ++++++----
- .../2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst     |  1 +
- 2 files changed, 7 insertions(+), 4 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
-
-diff --git a/Lib/test/test_xml_etree.py b/Lib/test/test_xml_etree.py
-index b50898f..4578367 100644
---- a/Lib/test/test_xml_etree.py
-+++ b/Lib/test/test_xml_etree.py
-@@ -1403,6 +1403,7 @@ class XMLPullParserTest(unittest.TestCase):
-     def test_simple_xml(self):
-         for chunk_size in (None, 1, 5):
-             with self.subTest(chunk_size=chunk_size):
-+                expected_events = []
-                 parser = ET.XMLPullParser()
-                 self.assert_event_tags(parser, [])
-                 self._feed(parser, "<!-- comment -->\n", chunk_size)
-@@ -1412,16 +1413,17 @@ class XMLPullParserTest(unittest.TestCase):
-                            chunk_size)
-                 self.assert_event_tags(parser, [])
-                 self._feed(parser, ">\n", chunk_size)
--                self.assert_event_tags(parser, [('end', 'element')])
-+                expected_events += [('end', 'element')]
-                 self._feed(parser, "<element>text</element>tail\n", chunk_size)
-                 self._feed(parser, "<empty-element/>\n", chunk_size)
--                self.assert_event_tags(parser, [
-+                expected_events += [
-                     ('end', 'element'),
-                     ('end', 'empty-element'),
--                    ])
-+                    ]
-                 self._feed(parser, "</root>\n", chunk_size)
--                self.assert_event_tags(parser, [('end', 'root')])
-+                expected_events += [('end', 'root')]
-                 self.assertIsNone(parser.close())
-+                self.assert_event_tags(parser, expected_events)
- 
-     def test_feed_while_iterating(self):
-         parser = ET.XMLPullParser()
-diff --git a/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst b/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
-new file mode 100644
-index 0000000..4dc9c13
---- /dev/null
-+++ b/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
-@@ -0,0 +1 @@
-+Fix etree XMLPullParser tests for Expat >=2.6.0 with reparse deferral
diff --git a/meta/recipes-devtools/python/python3_3.12.2.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.2.bb
rename to meta/recipes-devtools/python/python3_3.12.3.bb
index f837f05af4d..b49a58a1013 100644
--- a/meta/recipes-devtools/python/python3_3.12.2.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -30,14 +30,13 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
-           file://0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch \
            "
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "be28112dac813d2053545c14bf13a16401a21877f1a69eb6ea5d84c4a0f3d870"
+SRC_URI[sha256sum] = "56bfef1fdfc1221ce6720e43a661e3eb41785dd914ce99698d8c7896af4bdaa1"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.44.0


