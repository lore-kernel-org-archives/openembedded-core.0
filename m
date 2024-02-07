Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D1BC4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 20:51:21 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.983.1707339074588226170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 12:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IzjG5J+U;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da202aa138so739836b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707339074; x=1707943874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNOGs8NltrqZT8tupcUbmW+84QewrGOzTI62DGv/irs=;
        b=IzjG5J+Ueahri70QBvqvYQymbOLoOSflsxVDPwW6b245pdHN+6XvHRfZqDNJMBr83j
         CjIEcovAgHo00NFQrixNKT05BhM2l2OkI4RdR2VrH02zO0k2KckIhiXzTQlnXrgkgl7C
         TOqTOBQPM2Cx2mtqXyH8EsuboD33KxLcErkU3LIg+06E5VyEURfDNi1usZz2BsewLVok
         Hv5pcGGLvkK8HZBp++7MFvrfUxRqg9rI0auNlgtFP53iZiZf3G4mnzEwC6vwIypICPFU
         bRH6gHVayvJb6cqqSUS8Q0oJFkbxd9dy/oFhhSmwa3LgPWTz9ImDcrwI6KI6utT64NGj
         Npvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707339074; x=1707943874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNOGs8NltrqZT8tupcUbmW+84QewrGOzTI62DGv/irs=;
        b=qHagRr4/6H43fLQjPIJm7rieH5O1gFDhn7W8RGNJrvEACsa/3hwWBQXaYnBr+rjBpR
         XuEEeLCCEJcekXMgnMQVwOcCD32DQWRnnEubFIiVN9KbJUC3Mso1hIuqMjzdatNZ5wah
         MZKyiRO+iRdViH24f3UnK8m9XVSYfJRRayif7846PYSdbMJ+UVibQ4fsiT6/doSEk3dW
         gYXfw2Zf5PEc6pQvGfMLMT2vqpo4ngcf8w5BdrZtzSgB0OHu8bw/n+H9ixSikv20Pjid
         nIwluOlvHgFhsZFsWdB8T87NbOYfaizAq9yGh3OU8m0VU2PKSetEdHz41SGZKmNND0fF
         ZDwQ==
X-Gm-Message-State: AOJu0YzAB6BDx5BlcBD2bRBov3jJWUoXrHRVBxKFE9BR4XL9QTgVOhHM
	nmgatCgercioDh/78QPlZAEgeobpSmHEgdGfw3hwm2Cu4/qoF2ZaLiKEM36A/jk=
X-Google-Smtp-Source: AGHT+IEtEmPV1IuQ1rMZBRmDxrBFuoTQ44HSp1YEJoYnglslemXWZGXVPipbBz1zgrsg5vZHnwQ/cA==
X-Received: by 2002:a05:6a20:1594:b0:19c:aaee:bb1b with SMTP id h20-20020a056a20159400b0019caaeebb1bmr6887136pzj.7.1707339073514;
        Wed, 07 Feb 2024 12:51:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id e19-20020aa79813000000b006ddcf5d5b0bsm2086243pfl.153.2024.02.07.12.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 12:51:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Fix ptests with expat 2.6+
Date: Wed,  7 Feb 2024 12:51:10 -0800
Message-ID: <20240207205110.2745784-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 20:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195078

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...y-Fix-for-Expat-2.6.0-with-reparse-d.patch | 57 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.1.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/python/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch

diff --git a/meta/recipes-devtools/python/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch b/meta/recipes-devtools/python/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
new file mode 100644
index 00000000000..415db4bc5b8
--- /dev/null
+++ b/meta/recipes-devtools/python/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
@@ -0,0 +1,57 @@
+From 51a048251c552d9ead29a2a3e4884c138fcf9c1c Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 7 Feb 2024 15:32:45 +0100
+Subject: [PATCH] test_xml_etree.py: Fix for Expat >=2.6.0 with reparse deferral
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/115138]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Lib/test/test_xml_etree.py                             | 10 ++++++----
+ .../2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst     |  1 +
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
+
+diff --git a/Lib/test/test_xml_etree.py b/Lib/test/test_xml_etree.py
+index 53a4e9f..9a0119c 100644
+--- a/Lib/test/test_xml_etree.py
++++ b/Lib/test/test_xml_etree.py
+@@ -1401,6 +1401,7 @@ class XMLPullParserTest(unittest.TestCase):
+     def test_simple_xml(self):
+         for chunk_size in (None, 1, 5):
+             with self.subTest(chunk_size=chunk_size):
++                expected_events = []
+                 parser = ET.XMLPullParser()
+                 self.assert_event_tags(parser, [])
+                 self._feed(parser, "<!-- comment -->\n", chunk_size)
+@@ -1410,16 +1411,17 @@ class XMLPullParserTest(unittest.TestCase):
+                            chunk_size)
+                 self.assert_event_tags(parser, [])
+                 self._feed(parser, ">\n", chunk_size)
+-                self.assert_event_tags(parser, [('end', 'element')])
++                expected_events += [('end', 'element')]
+                 self._feed(parser, "<element>text</element>tail\n", chunk_size)
+                 self._feed(parser, "<empty-element/>\n", chunk_size)
+-                self.assert_event_tags(parser, [
++                expected_events += [
+                     ('end', 'element'),
+                     ('end', 'empty-element'),
+-                    ])
++                    ]
+                 self._feed(parser, "</root>\n", chunk_size)
+-                self.assert_event_tags(parser, [('end', 'root')])
++                expected_events += [('end', 'root')]
+                 self.assertIsNone(parser.close())
++                self.assert_event_tags(parser, expected_events)
+ 
+     def test_feed_while_iterating(self):
+         parser = ET.XMLPullParser()
+diff --git a/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst b/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
+new file mode 100644
+index 0000000..4dc9c13
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2024-02-07-15-49-37.gh-issue-115133.WBajNr.rst
+@@ -0,0 +1 @@
++Fix etree XMLPullParser tests for Expat >=2.6.0 with reparse deferral
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3_3.12.1.bb b/meta/recipes-devtools/python/python3_3.12.1.bb
index 1d3a4221c32..771902cd2c1 100644
--- a/meta/recipes-devtools/python/python3_3.12.1.bb
+++ b/meta/recipes-devtools/python/python3_3.12.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
+           file://0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.43.0


