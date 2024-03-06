Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6C5C54E61
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.15034.1709739739249165582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAjsdpPS;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4417fa396fso845587666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739738; x=1710344538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaR0axvvuxPICyKub6KrnquN81DJDb1jLSoM+GTa3dM=;
        b=PAjsdpPSBMLClT3dX7J0zheUituophLiiIjNHcG+n7EdC7xRk8T+a4g7gZiuO6PGr9
         JQdbbUQSfG0sHN/QyutWpv35aSlo1OOXPaGl7x43LNBp33ENaMRJWhA7pORpMECM5X1j
         II66f4/kgeqUXEKuQ9hWa/CK5W7p18w8yEzwrzyeb3qD+4XnlxHVCH6w8mBvIm37n3ON
         MO+PAd+QnUycLneVwy+S/KFND4zVANTHTdot+qXFE0fejuLESbxPVVwqlaRqUDvRTHJe
         e8MlwNeBExppzN1pDckM+6u6CkCXur8Id6Dnvvv1PYLx+ca9OsYdf18Y3zXt+Z4+WdFZ
         NP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739738; x=1710344538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaR0axvvuxPICyKub6KrnquN81DJDb1jLSoM+GTa3dM=;
        b=k/FOfG99GM2Ldcv0FmOFoiRb0giyn4DQ+79j1T93FvT78j+kn9BlNL4VzAAMy8Zplo
         CNw7G9WTKzwxy+IdOOTdPkKRLGRolgmq0Dtem3tgK+aOp7F/+c9MXas7Py6n9V+u8zhg
         RP2tnHNqcUxVyThMmzkWBewOEMU13RsfKNsFI0QNEglGnVqm+9rh0eOnsuskW/PO/To1
         e8a5ai/Rte1yzzGEH5qwwn4Ge5yTL+RRt0Tk40HfBAXEq0Z91GXj3A6X51sIHJ0RWUrN
         CpAUZV7S3UexEmriAqUtqraV/QYFzXv+h2rp2cDlK/mp5SztXGjXWMOP5B2b5dYtlQ1V
         SwuA==
X-Gm-Message-State: AOJu0YwwI7CGp0DWnW6BupqNho+fSWlkQ5uYmqezi9yBtsyGxZx7YUcI
	5lScjrgdzgN0LhStnigUESOV8FGzuQ9RGco1g7xYH2AugEt22BrR7yNLNusI
X-Google-Smtp-Source: AGHT+IGUDBMx4H3KsGm9L0Qk9z0l+UfEnpS3grZrZ+M+E7516u2erhPD+BZyJOf3HWBC73Fj2NaoIw==
X-Received: by 2002:a17:906:454c:b0:a45:92c4:7892 with SMTP id s12-20020a170906454c00b00a4592c47892mr4157428ejq.56.1709739737542;
        Wed, 06 Mar 2024 07:42:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/47] piglit: upgrade to latest revision
Date: Wed,  6 Mar 2024 16:41:35 +0100
Message-Id: <20240306154151.3741709-31-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196714

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-tests-Fix-narrowing-errors-seen-with-clang.patch |  5 +----
 ...utils-Include-libgen.h-on-musl-linux-systems.patch |  5 +----
 ...ake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch |  7 ++-----
 ...il-piglit-shader.c-do-not-hardcode-build-pat.patch | 11 ++++-------
 meta/recipes-graphics/piglit/piglit_git.bb            |  2 +-
 5 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index b1bb00e0524..08e709b1d02 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From cd38c91e8c743bfc1841bcdd08e1ab18bf22f0e1 Mon Sep 17 00:00:00 2001
+From 77f327909e4a99c64261290cd76e234e10cc64d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
@@ -48,6 +48,3 @@ index 43d451d6a..52ee94457 100644
  		glClearBufferuiv(GL_COLOR, 0, clear_color);
  		break;
  	}
--- 
-2.40.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
index 35e919e5525..e180664d6e4 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
@@ -1,4 +1,4 @@
-From 232a67b651ccb415b7d4d47584613359b7ebd920 Mon Sep 17 00:00:00 2001
+From 608cdeddc8e8a679b195927c4d34dc8d93142a91 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 13 Feb 2024 08:53:37 -0800
 Subject: [PATCH] utils: Include libgen.h on musl/linux systems
@@ -26,6 +26,3 @@ index 4d3606c70..fdfd903b3 100644
  #  include "libgen.h" // for basename
  #elif defined(_MSC_VER)
  
--- 
-2.43.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 5d6ec368ba2..70bb55053dc 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
+From cb8e4b99fcfe81399e3e6d922156db4a48a39a8e Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
@@ -15,7 +15,7 @@ Upstream-Status: Submitted [piglit@lists.freedesktop.org]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index a5f080156..a303a9f58 100644
+index 1714ab41f..3b67aa7da 100644
 --- a/tests/util/CMakeLists.txt
 +++ b/tests/util/CMakeLists.txt
 @@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
@@ -27,6 +27,3 @@ index a5f080156..a303a9f58 100644
  		)
  	endif()
  	if(PIGLIT_HAS_X11)
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 16c7c5c803c..ce5cbd3ea97 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,8 +1,8 @@
-From 1c67250308a92d4991ed05d9d240090ab84accae Mon Sep 17 00:00:00 2001
+From 7d2d23125f1946a7b74f9a427388d469500fcd8d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
-Subject: [PATCH 2/2] tests/util/piglit-shader.c: do not hardcode build path
- into target binary
+Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
+ target binary
 
 This helps reproducibilty.
 
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
-index 4fd68d21e..c9ea8295e 100644
+index 1787eb180..9e74704b1 100644
 --- a/tests/util/piglit-shader.c
 +++ b/tests/util/piglit-shader.c
 @@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
@@ -25,6 +25,3 @@ index 4fd68d21e..c9ea8295e 100644
  	}
  
  	snprintf(filename_with_path, FILENAME_MAX - 1,
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index ab749f78670..99d75e64f86 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "f3f1b3f960611a88cb1a037114ba4724f1bf330e"
+SRCREV = "22eaf6a91cfd57f7bb3df4e5068c2ac1472d4ec1"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.39.2


