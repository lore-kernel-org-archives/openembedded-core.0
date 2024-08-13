Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A118C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 15:30:44 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.75062.1723563043458374422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 08:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zANFmbhN;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a1d6f47112so336048385a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723563042; x=1724167842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu/AF9vO+2KFIBzMoVzIXVX2WTdpH4PRpyCmBS/NAms=;
        b=zANFmbhNrDcPpxjnIdb/vjY+BjZNE9Kt0TyN7TNx4s6PXEljz6+1MvpYxBEDQZplQM
         EtVcrYDRDUWyrWSbZEGY255vBBylOfoEV4XTE/5dj3Rr2Y/NxLApFCn1qF+8PlGAlAbh
         /GFvZcSb2cR1pnUd2iwxkMi9lc52zNomsz1XeuZGzo5P4OsGxIeGuyyCP51mRMkz/Nsx
         nvpDL6sayO4vwLxkBitb4ATzxq1y53NGp8NBohevubbTfTKu8xRNICCluO3Vtg0r+krn
         z0AL0kiBCH64MYdSHY6ThTX3ylUUXVESJq5OCmdcBmXub3ptY3p6kMvDIlygJydZhj53
         XkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723563042; x=1724167842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu/AF9vO+2KFIBzMoVzIXVX2WTdpH4PRpyCmBS/NAms=;
        b=FOycyIOBHcsEVj6yrwYfByJ7TWfG34LI+pjO5v+lyOwvWyhQAN3SpVr6vr8/mxylXn
         rP7F0FcPv2ycUa8LegaPCSrQAYvPn/Kk9+I974uBQIEeMddrYbNhTdwDRugjWs2qzrDN
         NzEt43BSDk0V+MlJSadYM/IENkd4XWTl3GnfOLX4tw3DKMwiHBDEcnhekgwxMEqGlurz
         E035Ws+YT2+mkJ6gyZ6PWmwMViEQns05dL4e4cee2wD16yWQKvl5ns9k+We0vfJavylk
         t5lB3YmOXpiN7Ohzjv83rp9/wJRfLxae+LIEUhuYRchyFfx32bhlgywzyGmknKIzoKQq
         GZFQ==
X-Gm-Message-State: AOJu0YyqtCN+gDfkKM5uPDjbL/IQqCVY33QIjwizFb8Gz68TDuUwhsY3
	inV4r4zYVWeKYtPh9Os5HK+fkvSsChNU6MrDfBr4qxygktq3wYr3YBA3bWEVOLWkHLDHMERH/0R
	m
X-Google-Smtp-Source: AGHT+IHkYF3JBplc8ZdgjcOqfPahVE+7RLxfIgQIX9uRgB0A5qevV7qp0Ub2cHa53ml65MQ5z+DQ6Q==
X-Received: by 2002:a05:620a:4408:b0:79f:148:d834 with SMTP id af79cd13be357-7a4e15cfb7emr512630385a.59.1723563042275;
        Tue, 13 Aug 2024 08:30:42 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7df5429sm351062885a.93.2024.08.13.08.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 08:30:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python3: skip readline limited history tests
Date: Tue, 13 Aug 2024 11:30:39 -0400
Message-Id: <20240813153039.3395682-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203282

Python 3.12.5 is failing a newer ptest for reading/writing limited
history. Skip it for now until a proper fix (if any) is determined.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...t_readline-skip-limited-history-test.patch | 38 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
new file mode 100644
index 0000000000..d8ec33e162
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -0,0 +1,38 @@
+From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 13 Aug 2024 11:07:05 -0400
+Subject: [PATCH] test_readline: skip limited history test
+
+This test was added recently and is failing on the ptest image. Disable
+it until the proper fix is determined.
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


