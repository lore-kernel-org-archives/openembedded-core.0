Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCAEC27C55
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 18:29:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.1585.1717612177594325067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 11:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N8bVXobQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4213870aafdso1633245e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612176; x=1718216976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AS4bOdHxrklG+rVXex3ykVrzNw3fGGc6jrHDtFHcNzs=;
        b=N8bVXobQ/vidHsIaLvK3mJ2EugkK22xxFzuNHLwbWVSQANxfCeZWioZ4NwmPnnowq8
         dnX1ReTFRySP7pYSdegenofbAFukqWdcIZ4w8XSrAfwOdsYvAJf0Oc7aGVxWV535qpEo
         xu6T/1aujdhwTTkUi1b61aDTJRgNZNDh9NecbM419U2cb/2FxEJUQnvkff7XbYJQXp5P
         Nj37y9nMiZowvz3nBdqKEEGWm3Dro+BnySmdyMrck1goqFGR1W+HU8qia5RW4aCX92qb
         9IhdSbewbeW9JQTBNCf0HUKR0ZAI8LuNY+O8TZX2xpltwthEsTWOf529C+4HX5YnKh9C
         Zzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612176; x=1718216976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS4bOdHxrklG+rVXex3ykVrzNw3fGGc6jrHDtFHcNzs=;
        b=QZ7dmlZS+JlPYcMZFoymbSWEaeEVT7IuzpLbcWzmBdf8bThUxkqUbn5+AlDrJer5HV
         ryD4b1Sjh0JjHbpB1hKtbn975hNlsl1Nzuqg9c2BepZQy8OaO70SLejHQzqYB3Wd80wo
         wq60d5xA6AoLyyKVFkVbHt2pSDipFShc5wL15vrjCTpFKieMziM/Ic/ZXvQGmrtlO+6Z
         MDN6j0HBBC927ddPmDjfM8bSZVlYLOYOEdum6QwzhBYylOOySPip0S5onOUOaCp76c/Q
         NHVx4IQK9au6ObPipzVNq5pp/QYXnZBITbRkXEQwXBZJ099aUMkFCFOjD0o2WZrZAU4P
         9K3A==
X-Gm-Message-State: AOJu0YxtBZRhvQ5XOIh1TMFLSo7rx5P5Tue+kSNRYyX+6p0nXWpBDJw+
	VpaBiiinUcmdBaW366pJJHje7hC4K5EHQqSCryjh0mDRPgJGB7+e35bjMA==
X-Google-Smtp-Source: AGHT+IEX6mFa8RKJd74ZH/YQG57F/4ZLnk5mlbQicymKY/aBQ4DqIaBKxjct04uC1TgIF219uN9aiw==
X-Received: by 2002:a05:600c:4a17:b0:41b:d4a3:ad6a with SMTP id 5b1f17b1804b1-421562e6fe2mr27478675e9.17.1717612175739;
        Wed, 05 Jun 2024 11:29:35 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158102a9csm31902335e9.14.2024.06.05.11.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 11:29:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH v4 1/2] selftest: add Upstream-Status to .patch files
Date: Wed,  5 Jun 2024 20:29:24 +0200
Message-ID: <20240605182925.3890273-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 18:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200378

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v4: use Inappropriate [Test artefact] everywhere as requested
    add Upstream-Status to *.patch.expected as well to fix
    devtool.DevtoolUpdateTests.test_devtool_update_recipe_with_gitignore
   devtool.DevtoolUpdateTests.test_devtool_update_recipe_long_filename

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
index 7569ccef7bb..96be6f4a614 100644
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
index e33a2753f9e..17ed5a54f16 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemuarm/arm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
index 1a0a175fa84..0af5ebbfaf9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides/qemux86/x86.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 --- source.orig	2020-10-06 13:26:10.792688630 +0100
 +++ source	2020-10-06 13:26:18.853424694 +0100
 @@ -1 +1 @@
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
index 96ea0eb4e3b..bc1ca4bc4a8 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/ignored b/ignored
 index a579759..e3d7b43 100644
 --- a/ignored
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
index 68ec6d9875f..8ead9ee1ce6 100644
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
index 6aaf409ebc5..2b7088e3676 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/patch-me b/patch-me
 index a20b29a..5e35d1b 100644
 --- a/patch-me
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
index 1bf25a61d07..52b0df74cef 100644
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
index 4ea3d74f0f6..db66a284b73 100644
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
index c4f3f12666c..5159652f69f 100644
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
index bccda17ee9c..4f8b745995e 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/Makefile.am b/Makefile.am
 index 432a9b4..bbf7c74 100644
 --- a/Makefile.am
diff --git a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-here.patch
index b1d5eab2b8c..7df224e5c8c 100644
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
index bdc99c94f0b..cb43cc629d4 100644
--- a/meta-selftest/recipes-test/recipetool/files/add-file.patch
+++ b/meta-selftest/recipes-test/recipetool/files/add-file.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Test artefact]
+
 diff --git a/file2 b/file2
 new file mode 100644
 index 0000000..049b42e
-- 
2.45.2


