Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA50C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 22:19:52 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.3634.1707344382667722611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 14:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NoaN7THC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d746ce7d13so10912145ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 14:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707344382; x=1707949182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t3+JlngzRkY51pe2MQeykopd90qL+RtqX29W/zxAc+4=;
        b=NoaN7THCIkSJ+f5OyDwNGHxHdhYTegW/YwZ8x3Xpn7iK9w8lyHw8BP/pP6rmVfa07q
         nPvVJSfqguaqoR/hhfv9HdKwABMnqVYU1BRUSfNI17BGy1ykDWZgQiH+xC3oacQqMRHK
         57QGFvUPrIUquvFPhEmNO0YPgzsWm/SqZl0Yw7oTnMRM1pcL6di1EnfRnP/TTGjyYhUr
         fuLqS6LB7fsHZytu1kElgcUuWQKIyU03djor+Gf6trL3ruTVHA3WWh5Fl8MZ/SLIuv0G
         8iwZ0Kd+76MjvJ1ThZd0HjU1z/gL9eH28cGb0/2N4/VuoQkqkroXD9DFJcQhnLeFvzBi
         KY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707344382; x=1707949182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3+JlngzRkY51pe2MQeykopd90qL+RtqX29W/zxAc+4=;
        b=epOIasGBsVZKErNjZtUHw7mzXbQfj8+XoE4WYs2JBs93Y+y7Z9PN7W8axT8AuICGlg
         yY/NI4HGE3Qz2PBm/SE9DFAbhs05wOuFEuPzFlJgkhMz+VUapI02TXVMiUzwULMhxdCv
         sB1iWi36YInyFDceeUohycNBXEMu9mHUX/E7iPTHzXnYdtpkLcnu+QLSG2WFcZGGceNK
         mBmbzM18Hpq3mYqKkgHn5BT/Qb3Os0z3lshE2aZjamL59duW3eXm4n4Ojmk2KUyOBXlJ
         ocTI6uKVfdLDP6juJ6X+AuS+3dPLD8ANLuWJj5e3sNfbAKVxiFRIGsjo9+SoCKuguIk0
         TRlg==
X-Gm-Message-State: AOJu0YzrbFxeoSBaqptGHMCWdYZHSpSrpNiJucbgYTDIG0B9plNfiXwM
	zrcr7WX8cEKIBQnk8HzHJbkFU8Wpf2nbRDwhgvJ9ru2KTFQD1P80P5+E9vBy7Eg=
X-Google-Smtp-Source: AGHT+IE4GlMw3aYwAIJnMA6QKQ7fB7orY2ShlCZz0Q5CjQV+f1dZf+6lvBf7VKEcjKVOqfOMtMv3Gw==
X-Received: by 2002:a17:903:48f:b0:1d9:b099:6f9 with SMTP id jj15-20020a170903048f00b001d9b09906f9mr5928671plb.45.1707344381739;
        Wed, 07 Feb 2024 14:19:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902dccb00b001d9711d3e83sm1985280pll.204.2024.02.07.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 14:19:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] python3: Fix ptests with expat 2.6+
Date: Wed,  7 Feb 2024 14:19:38 -0800
Message-ID: <20240207221938.2837858-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 22:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195091

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Put the patch in right directory

 ...y-Fix-for-Expat-2.6.0-with-reparse-d.patch | 57 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.1.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch b/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
new file mode 100644
index 00000000000..415db4bc5b8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_xml_etree.py-Fix-for-Expat-2.6.0-with-reparse-d.patch
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


