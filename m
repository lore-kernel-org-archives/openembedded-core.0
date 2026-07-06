Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8CEC44506
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156294.1783358236108533138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ati2Wv73;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so25165065e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358234; x=1783963034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKqDcPx099aj2MrLe/7cIaymI8+nM02UwS5W1a8HDVU=;
        b=Ati2Wv73+wx+D4VcqcGy/ahLqHYzCB4J8usG91r/nLjhpnpf8SytlSy+FiAz1NFp9D
         thEDL7W+SnjgtN3Bb4cktchfqUedV+utU0lduhLGh/xijYjqxpofPxqjbEkquKeuA9lP
         Y7Wv/v1Wnu94AZkNdvf1o8G4kf2+xpNyoP2OGnhszUwpTwgQ3+frRshx9AljS0Acqrlo
         7oQzrNTXJ3cUWLjulx1OJWSDmqAe0g3K05TJpje0GkYSK0CHKL8M7zAWsVBRSRMhgoUh
         4fNIXLiNd1fo0ThNDYgHQrgHmrn7HKIUVQT+S4kIBTJ/uRAiV8CNY9Huvi9If4DDeq8v
         KCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358234; x=1783963034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKqDcPx099aj2MrLe/7cIaymI8+nM02UwS5W1a8HDVU=;
        b=CBnyD473WTHKOgaPni1oujoFB7wT3ISWy4bWYNuJRZWitk3DIIL/6RT080tp6otNQ1
         1W+fDwJ+rCc/Z75OV+97beGV3UwvphiayhrHxxUt2f84w7yq69D6jB+sPIgeQFYEG4OK
         ptnCvqn9floQc7oRN58NNutC6NFDh+u3s0e9I05+LBqQQJC6dRtARyTNY6hgICSkacHy
         /x2AK1f6Ya3u4fZR8D4FDHZ5wbnR7qVGi3ZSWJAepaeVpSKN/llSCLLf70OhDQWWT/ju
         REv2skdHn/of3DkTyZpHD2NyQh0W0pufDMziN1aj/zbREbWS4ZgiwfpO7tk8nWKuBNyO
         5GdQ==
X-Gm-Message-State: AOJu0Yyh2nKkn78VfDcZwjM9usnr+BEmRq3R7w3anjw/0idqmz3q8/8b
	FXg5gh4bdOMIATUCZTPwdHfBUEy3Y2W9C+V0DH7cQAF5bmXgZzsoZdaRJ487Nw==
X-Gm-Gg: AfdE7cmT13yADMblo5KcFWL55zZWdFH8eJv+WmEzgF3uBBHeLdt8dSvvj2HfAKt45vJ
	sqZ2a0A7NWFZm3WnAVSnb2PfRkoqDfTXQXfre4epv3arXLCW9i5wiuWmaWaaln/UVjFFsDf+xK6
	/nVingmCn6qHG+npYLI+bj2vEhHGyLr8j9uLb2271gFoj30fwBC8fl7qFEZSdnQpdeoHfkNYNnv
	+ZiJzt/JXye8JHHv29oNAo2ht5erfJF1Hq4FwB90YaVX6RHCyL8fFGKIu8gYVi2KFX0ZeTE4ICU
	1d5LbFoslLhemhpFtnUE+AYEyT1mPCm6TdieFR1KOaBIoo/1RSlxDiST0YhyVCOu5KGe8q0Ophq
	QCVnl25VLGzCkdR73bb0OKa8WNLOFdA5LLC+ZGJRhxXloEF/Ag/mA0NaF23AXZIDpwI3ngENkH0
	AoOlG74V4Nx7L4p4CVBgiYduEDyhrW7zoMmjVViQvvKvZu6xb+
X-Received: by 2002:a05:600c:a00a:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493df038767mr17535365e9.2.1783358234261;
        Mon, 06 Jul 2026 10:17:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/45] glib-2.0: upgrade 2.88.1 -> 2.88.2
Date: Mon,  6 Jul 2026 19:16:26 +0200
Message-ID: <20260706171701.70536-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240298

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch      | 2 +-
 .../glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch    | 2 +-
 ...Remove-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...gio-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../files/0001-meson-Run-atomics-test-on-clang-as-well.patch  | 4 ++--
 ...meson.build-do-not-enable-pidfd-features-on-native-g.patch | 4 ++--
 .../0010-Do-not-hardcode-python-path-into-various-tools.patch | 2 +-
 meta/recipes-core/glib-2.0/files/relocate-modules.patch       | 2 +-
 meta/recipes-core/glib-2.0/files/skip-timeout.patch           | 2 +-
 ...{glib-2.0-initial_2.88.1.bb => glib-2.0-initial_2.88.2.bb} | 0
 .../glib-2.0/{glib-2.0_2.88.1.bb => glib-2.0_2.88.2.bb}       | 0
 meta/recipes-core/glib-2.0/glib.inc                           | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.1.bb => glib-2.0-initial_2.88.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.1.bb => glib-2.0_2.88.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index b6ad6035c5..11e9508840 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 89c0644254023cfd5a22685fbbb50ebd8c6224df Mon Sep 17 00:00:00 2001
+From 83282a978c5107c682ab4c75ac7407961bb17788 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index c698376d3f..40398f25f7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 727d5239c378c820f874b50d539f87b54a3757a9 Mon Sep 17 00:00:00 2001
+From d02e061f830b7051878e8a467f393e85110e4e1a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 6211c31c8f..bf669bd4b7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From af1354b16aeffbfefc7e8d32160c97105a93a84f Mon Sep 17 00:00:00 2001
+From 72a58d19ae7f80985d9c91751fd6c359464ce292 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 594c444797..eef7c9db86 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 6237ed5e1677c3b0ea50c92dc36e864ca860e1bd Mon Sep 17 00:00:00 2001
+From c1eaa4dd2e2c09e9930949d4a9ee08e3e21b1a88 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 243961ab8e..14c8c701ba 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 521b129c7c6329a01a5f56b4604ea1b7499b03ad Mon Sep 17 00:00:00 2001
+From d9c75aef8b68887ef4f1dd9bb73542cc0ff02b20 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index fda448e3cc..1fe00df8fc 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 69e80e3b936e57eaecda231b12b554c075218deb Mon Sep 17 00:00:00 2001
+From f72296cbd6f04f4f74b49b961f3cb405efa112f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index bb68398..3e9e03a 100644
+index 25802aa..c53d216 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 711572b139..fa46bee904 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From e79e19bc1e6a7e8fb8596c4a9d60e21032350784 Mon Sep 17 00:00:00 2001
+From 03614474ac998422d0348c16c588a9ad50c97398 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 3e9e03a..f1957f0 100644
+index c53d216..330ccf3 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 0f98133802..7a2c168756 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 6d92086a791c2320b46817640ceba901361f34fe Mon Sep 17 00:00:00 2001
+From f37cec951e3c564d96afcfee1279f4a9fafcc822 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 7f326d8588..421dcb8f9a 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 20721d24485a51206189b3128835c3c3098601b3 Mon Sep 17 00:00:00 2001
+From d99e85f606530950514446a3113fe39c8c67934c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 43506d69f5..25f5324784 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From d548554b8793d82b93c7c7b2198e368b57916958 Mon Sep 17 00:00:00 2001
+From e19423cec5b32bfa5ff1bcd567e51fa55713f94e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8d23092187..92b919e00b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -238,7 +238,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "51ab804c56f6eab3e5045c774d1290ac5e4c923d4f9a3d8e33123bee45c1840e"
+SRC_URI[archive.sha256sum] = "cf3f215a640c8a4257f14317586b8f1fdd25a10a93cb4bdda147c0f9ad88e74f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.47.3


