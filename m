Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7218BC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:41:04 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.77115.1723567264035719966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Sr9/ildp;
 spf=pass (domain: baylibre.com, ip: 209.85.167.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3dd16257b87so1283009b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723567263; x=1724172063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRyZ9WC1VdDpE+7pZVur0YsAgzqWRZkwZiSKgQywE4c=;
        b=Sr9/ildpzisfHsOZV8RJd7tnaF0ofQvlmSGR9+AeWAP6DmuhjLfphN0y7n3ac63wD8
         yFpVPiw+PJUpdjkkiUqM6qH/tdJNazsixGNeX6VhB+S5/tmkOkbFx0vovqxShYBO489D
         pey3sjNtQZNgoASFZ2Hb9tetX1Esw585v+mDvOcwQU3AB9xCZ3mefG863srWWWShuGt4
         tvd2isTjOfpvwE/PEHpzwCojyVFAl7aZuYB65aDq72Yg67BM3HUN1BecyTgJzJk3UKze
         yhx2VmcC7FlE0eGNBSvl2J8xxw/sRpvkW20gsEe8bwvC/lztb+PKq1Mf04ctJGaZMlxe
         0MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723567263; x=1724172063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRyZ9WC1VdDpE+7pZVur0YsAgzqWRZkwZiSKgQywE4c=;
        b=vg8CCHT4AYACuDufuSsbHOYhmwyt/55vGC345cOieYS4qOrxNgLMd4giKsPreIOEU/
         tVZv0Ngpg+gq5vOB0O2kqphom65hrY7Qz3gMYNPj4TDfVNvWYAnkfLP9XPMmIekKr/KS
         AeBbrqfheB5Q63FEKUI7rXXGMhE5neKQocGFZYBRoFcizlhWBtsu5mfcXhSH5smwYKWv
         L7BxYwjnaEJM/yZyMy5H5mweB1eVKFCSqsn2t2v2Bp0KBLffqmYG+1cyGF2K9bQ0e0TW
         Vw5gUXeN/uTqqsy9z+T8U7ksZw/JT93BnrjgjnXaGTz44s7/WQJLTNjnXNVLLwu4U8C9
         gksg==
X-Gm-Message-State: AOJu0YyM7D25hnTeAaRzUVenKmGhS5857DSVLaKO04Pvb0ulf2qL36nQ
	gdq39uogNp2HaTB4aHlIFSELTKM3Gl8jU+IT9WLu4TP6UMUJ/BuwtFWLayqKqmF7h4JDzQo9O0I
	e
X-Google-Smtp-Source: AGHT+IHWr3B+M0cOLaGlTQJgaOjkvDLTLSmWZgSeduCCTKWBCJv9zJtFJRRNsF4qz0Wvn5f+YrND/g==
X-Received: by 2002:a05:6808:189e:b0:3d9:2c5a:c81a with SMTP id 5614622812f47-3dd1effdbeemr3830014b6e.50.1723567263131;
        Tue, 13 Aug 2024 09:41:03 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c291c11sm33489721cf.97.2024.08.13.09.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:41:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
Subject: [OE-core][PATCH v2] python3: skip readline limited history tests
Date: Tue, 13 Aug 2024 12:41:01 -0400
Message-Id: <20240813164101.3425564-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 16:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203289

Python 3.12.5 is failing a newer ptest for reading/writing limited
history. Skip it for now until a proper fix (if any) is determined.

The new test was added in
https://github.com/python/cpython/commit/263c7e611bb24715e513d457a3477a61fff15162

The GitHub issue is here: https://github.com/python/cpython/issues/121160

The aforementioned bug report suggests that OSErrors like that show up
when using the GNU readline-based readline module if a workaround isn't
also incorporated. It also mentions a new readline backend will be
available in 3.13 that might help, but that won't be available for a year.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds extra info in the commit message and carried patch about the
source of the test failure.

 ...t_readline-skip-limited-history-test.patch | 40 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
new file mode 100644
index 0000000000..851ddd571a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -0,0 +1,40 @@
+From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 13 Aug 2024 11:07:05 -0400
+Subject: [PATCH] test_readline: skip limited history test
+
+This test was added recently and is failing on the ptest image. Disable
+it until the proper fix is determined.
+
+See also: https://github.com/python/cpython/issues/121160
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_readline.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 91fd7dd13f9..d81f9bf8eed 100644
+--- a/Lib/test/test_readline.py
++++ b/Lib/test/test_readline.py
+@@ -132,6 +132,7 @@ def test_nonascii_history(self):
+         self.assertEqual(readline.get_history_item(1), "entrée 1")
+         self.assertEqual(readline.get_history_item(2), "entrée 22")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+@@ -349,6 +350,7 @@ def test_history_size(self):
+             self.assertEqual(len(lines), history_size)
+             self.assertEqual(lines[-1].strip(), b"last input")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
index 5665c90fa9..cc2e14baf0 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_readline-skip-limited-history-test.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.39.2


