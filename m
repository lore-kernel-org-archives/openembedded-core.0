Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F935C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:27 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.55657.1722258797948129493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MT5HC+Xq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cdadce1a57so1978693a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258797; x=1722863597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRZtwkyDIkhz7XO6oZ2KwGt6AqFQEtxhzoqKcJerz3I=;
        b=MT5HC+XqgFuFAtXN/t8utESXCesv5X+TJtEOeFZr+d/e09YG/gFds7pY/ZpI4mjb31
         YoSHmAL++UewTD/OZRVExCUNkHDnem7xXaX5q80UqzggcxIazeejgkBHUriw96XQEthN
         /f1cw8SjztjSnab7+ldWV1qkxIbVRiQ/0k6m9SDmQ9wO6/5w3izMgId1rTqt49eYaArf
         78fFOr25rr+5QsUItfQWmHo5UQ6kY0F22vU96k0PeqxvRUtnOLhEZ5QVft1NLNEwBuai
         9K8qFtXUaOadiI4BzTG+CdgKy/2suJYDHMlnc4dREAzXV5FqXQIGKWzzzbkoKgQNaWnR
         QV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258797; x=1722863597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRZtwkyDIkhz7XO6oZ2KwGt6AqFQEtxhzoqKcJerz3I=;
        b=gTfU5FqPwtzluu0TLsYSFpsL4nO6JcI6MOinmGUTZ1PnitYC6FEEru1u4XdwYi/c35
         8tfFP4PZGLWS3LKkFfRsEdR2ZONYGWNVW2wVg/N3eXYBeEP1JTM8NVXW2hiWFCx+bi4T
         ulQBCGC6aWcJx7B1KByLDbwU5XZYcnOOVGgZkrF6uCt2rzgwW4K1WW7qWjAKC497mOrq
         hkZedeeKz6fa4C5VTqFcn8Ba9hfKth3XIdx8e2vGABEnxZYUJhU2UPHTEdsPKR0j2Mdz
         Hb3lyd4ZjgBf1ulXehHU+KLvl4YJiO4LWeCVQimlw8pjZ2FxRdYHWZblsHfjE3wF3TQh
         Ws8Q==
X-Gm-Message-State: AOJu0YwTrhCuHXw1GctZWtyKmpq4vOf+YfOttKyn06UfRpUlOwjGblFJ
	t4yTFFxedD8oCcj6kKQSqOl3qPzKpoM6+3FAqlLL8d7G3xWnaDdVfVNNYZYFo9KenFrDk3prebI
	50BRugA==
X-Google-Smtp-Source: AGHT+IE5Du8TkY0T2sPoUt639haoKwkSU0aZdyfInCzB2FseVdSERpuRt5s9zV+p7KV3Caa6vnHhQA==
X-Received: by 2002:a17:90a:4b04:b0:2c8:538d:95b7 with SMTP id 98e67ed59e1d1-2cf7e606ca1mr5447214a91.32.1722258797121;
        Mon, 29 Jul 2024 06:13:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/37] selftest: add Upstream-Status to .patch files
Date: Mon, 29 Jul 2024 06:12:25 -0700
Message-Id: <34185c9d70920bf42323826f1ef31feab71c44e3.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202629

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5e5561c178a565b3aa7cb540fe1c8f71917c882)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch | 2 +-
 .../devtool/devtool-patch-overrides/qemuarm/arm.patch           | 2 ++
 .../devtool/devtool-patch-overrides/qemux86/x86.patch           | 2 ++
 .../devtool/devtool-test-ignored/devtool-test-ignored.patch     | 2 ++
 .../devtool-test-ignored/devtool-test-ignored.patch.expected    | 1 +
 ...1-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch | 2 ++
 ...tch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected | 1 +
 .../0001-Add-a-note-line-to-the-quick-reference.patch           | 2 ++
 .../devtool/devtool-upgrade-test1-1.5.3/backported.patch        | 2 ++
 .../recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch   | 2 ++
 .../recipes-test/man-db/files/0001-Test-patch-here.patch        | 2 ++
 meta-selftest/recipes-test/recipetool/files/add-file.patch      | 2 ++
 12 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
index 7569ccef7b..96be6f4a61 100644
--- a/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
+++ b/meta-selftest/recipes-extended/hello-rs/hello-rs/0001-Greet-OE-Core.patch
@@ -4,7 +4,7 @@ Date: Wed, 27 Dec 2023 09:55:48 +0000
 Subject: [PATCH] Greet "OE-Core"
 
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-Status: Inappropriate
+Upstream-Status: Inappropriate [Test artefact]
 ---
  src/main.rs | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
index e33a2753f9..17ed5a54f1 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
index 1a0a175fa8..0af5ebbfaf 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
index 96ea0eb4e3..bc1ca4bc4a 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/ignored b/ignored
 index a579759..e3d7b43 100644
 --- a/ignored
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
index 68ec6d9875..8ead9ee1ce 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
@@ -3,6 +3,7 @@ From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 28 May 2020 01:32:31 +0200
 Subject: [PATCH] meta-selftest: add test of .gitignore in tarball
 
+Upstream-Status: Inappropriate [Test artefact]
 ---
  ignored | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
index 6aaf409ebc..2b7088e367 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/patch-me b/patch-me
 index a20b29a..5e35d1b 100644
 --- a/patch-me
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
index 1bf25a61d0..52b0df74ce 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
@@ -3,6 +3,7 @@ From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 28 May 2020 02:03:39 +0200
 Subject: [PATCH] meta-selftest: add test for .patch file with long filename
 
+Upstream-Status: Inappropriate [Test artefact]
 ---
  patch-me | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
index 4ea3d74f0f..db66a284b7 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-note-line-to-the-quick-reference.patch
@@ -4,6 +4,8 @@ Date: Wed, 24 Feb 2016 17:43:03 +1300
 Subject: [PATCH] Add a note line to the quick reference
 
 A test patch so we have a file to move around.
+
+Upstream-Status: Inappropriate [Test artefact]
 ---
  doc/quickref.1.in | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
index c4f3f12666..5159652f69 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
@@ -4,6 +4,8 @@ Date:   Mon Nov 18 18:43:15 2019 +0100
 
     Backport of the NEWS file from version 1.6.0
 
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/doc/NEWS b/doc/NEWS
 index 69793fc..fd49b1c 100644
 --- a/doc/NEWS
diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
index bccda17ee9..4f8b745995 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/Makefile.am b/Makefile.am
 index 432a9b4..bbf7c74 100644
 --- a/Makefile.am
diff --git a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
index b1d5eab2b8..7df224e5c8 100644
--- a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
+++ b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
@@ -4,6 +4,8 @@ Date: Fri, 9 Feb 2018 17:37:48 +0200
 Subject: [PATCH] Test patch here!
 
 This is an invalid patch used by oe-selftest
+
+Upstream-Status: Inappropriate [Test artefact]
 ---
  README | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-selftest/recipes-test/recipetool/files/add-file.patch b/meta-selftest/recipes-test/recipetool/files/add-file.patch
index bdc99c94f0..cb43cc629d 100644
--- a/meta-selftest/recipes-test/recipetool/files/add-file.patch
+++ b/meta-selftest/recipes-test/recipetool/files/add-file.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/file2 b/file2
 new file mode 100644
 index 0000000..049b42e
-- 
2.34.1


