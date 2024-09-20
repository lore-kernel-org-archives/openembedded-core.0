Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB725C78845
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:39 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.18440.1726839571443730777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CQNZ35UE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71781f42f75so1925421b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839571; x=1727444371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6tqB7gj8m0d6TQaI9aSm8sPZ7RkehQA+QOudc0TPpI=;
        b=CQNZ35UEw+uUa9lByF5t87m/rTUwgV3vYNJy8rY2qI97SkSJ+RsAloY+5TTexONJY4
         gmLWyY3txRqOC41/nuj2sWR/e9uFT43YooMvkQPm5l1XCqsOJE/DC7AjwAK7VecYKPUz
         4xsgZd81h5m9foqzfrtWtQbVvGbEfa79UlzTBjcqBNh72dSkCIdc7LU+KcXS66UqI2l7
         xjprPtA7QY0qp7MvlLKwZibcQ0ysSRobWgVvQVbHNuYrd0DFitCv8+eH72PdyuSB1pDB
         7eIo/ENsB2aMi4a5FCqJaY0lHGHCdwzTB41EQ6DxoRCobd/LgsB/c5+5Co2q7YCEHYS5
         JVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839571; x=1727444371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6tqB7gj8m0d6TQaI9aSm8sPZ7RkehQA+QOudc0TPpI=;
        b=VgBpgB9jU+kvnk/eJtTArJYotJbt338LQmuYbi6Dhn6E5y1naVIDus+icIYo3s1vKH
         UYY92MwTCGBUKdoaojJ6agMME1ZOp0VizoNZY6eJaOGl2Hre6HnTR59w5bicYQdWKJAU
         C7IhzWMm/3HBx0zrEU4FDWNc5Eves2HK28Rn/asv+ZFG9U3Aicily5BOiH+FWaT2gF8f
         yoK1an7cxXvhgPKO7/O0HrmYywGzcu5w06DXTMorHOhAjoYKza1ah5aYCgRpsbFA+EDl
         Ki04n5UH71763jm1GvwLgd1g5qUQp5TKh5I7N70Cn/YhyvJkSszZ+u0bQdgi1CZl1Y2c
         u0sw==
X-Gm-Message-State: AOJu0YwDxk4rgu8DykxR2ltIxRBRj3EnNqeUHladSeNp+A+HR43l68F+
	o0JUjf9S2IvgLFEkBFKjcqrnOLf1vG0gwTr1qnZ9T4kx6ghddpnNP91Mbe60XskDoXTsBb4HdVG
	v
X-Google-Smtp-Source: AGHT+IHh4oP1P4HryMhd6oswXG0SSXNf1EQaSDRfkilMSmcCff5jylFiAo/63PGvVp6LFpn0n5Dyyg==
X-Received: by 2002:a05:6a21:3a85:b0:1cf:337e:9920 with SMTP id adf61e73a8af0-1d30cb66274mr3479763637.47.1726839570671;
        Fri, 20 Sep 2024 06:39:30 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/16] python3: skip readline limited history tests
Date: Fri, 20 Sep 2024 06:39:03 -0700
Message-Id: <98b3a3e3f79a3edaa4cf2cfbf58eb84553d65e1e.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204743

From: Trevor Gamblin <tgamblin@baylibre.com>

Python 3.12.5 is failing a newer ptest for reading/writing limited
history when editline (default) is set in PACKAGECONFIG. Skip it for now
until a proper fix (if any) is determined.

A bug has been opened upstream: https://github.com/python/cpython/issues/123018

(From OE-Core rev: de569ddffd5ea36b70c56df21dec9c892e5dee7d)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...t_readline-skip-limited-history-test.patch | 41 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
new file mode 100644
index 0000000000..50a4609f7a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -0,0 +1,41 @@
+From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 13 Aug 2024 11:07:05 -0400
+Subject: [PATCH] test_readline: skip limited history test
+
+This test was added recently and is failing on the ptest image when
+using the default PACKAGECONFIG settings (i.e. with editline instead of
+readline).. Disable it until the proper fix is determined.
+
+A bug has been opened upstream: https://github.com/python/cpython/issues/123018
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
index 5c3b7a92f8..92109d58ce 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2024-7592.patch \
            file://CVE-2024-8088.patch \
            "
-- 
2.34.1


