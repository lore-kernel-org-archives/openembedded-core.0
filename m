Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5B3C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2257.1743577891053978724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MyBJf9R0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso69124555e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577889; x=1744182689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/LcqTDJYGHVoPnWZETBzeI8zDfpLpZ5Bqyh5fSGrEY=;
        b=MyBJf9R0hRZUL/14oRs5mJo+nRAYF1LWUGAJS1RIwDjSp3dPyRF8EPl16dJqH5CLr2
         JGBUVDCRQg6Jl4RGFbld5SI0rv/AH3QlMBEmfFJH3S6nXxOprvYiylmJgqrZsHix6wvW
         xpM8DjqgMjbaQh5cXZ6LC/dBRlUKjeBRWZgGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577889; x=1744182689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/LcqTDJYGHVoPnWZETBzeI8zDfpLpZ5Bqyh5fSGrEY=;
        b=uCtOTJg4AcZxjsFrHEvRaIxL8rlx7eNy+8fvloo3XoNZly8YArsXobMtYiXSyyUXci
         RmVJ+C+tgRISCk0toMojA3PMxG3rkL9TH9JORfMecNhCathAOEiIrP8SbXq92GfODpTn
         Dg1fddxo41TylxUvugqR9x/GnnBcswP3IGmt3UTHkvRN53hn6mUaxpOoYjpY4Z9Xithc
         niDToCzDpWf0H7IQFqMeJJpI8aQB+fAR3RWFXHhDz/syg4DBP3J9mIcab92DcnCCey3+
         DNrg96hBG6kjFtVK3C+UJW+IInOxnli/X3yfUvAm4eKuv+lpxn7eS7H/8jKQF7FqKRBe
         aqcQ==
X-Gm-Message-State: AOJu0YyH9CgbDzL6lk60ZJyjPxYUs9zVoR43aR1yguVogmIlaKV0Tial
	r2om3nP7JnNlAoau7AXSEfvTJ5nNmDK7DSHSnNRuvA0i1DrggEChJr0EuR4z6hfvSkmvk6inwy9
	v
X-Gm-Gg: ASbGnctRIK3oxMVeApQ8p5Zh/R8qkknJRU1MdzH3/BUvP3FlFtRQBaMgddqEHCEetdt
	V7wFmBHuKbPbpFkAUy+0WPwcbd/HmeYp54DiI5jswOEPiiTP0Uj6QZ3XLW1b4JuIl9o24pjIvEH
	cNakP59kbrIGDWXV9lXnCwHXPqqCwywsKkJyNkBdWEIQzGVCc1TGapZAw9swxzw3PfTv4za1NZv
	0vIm7Al5Bvg+LRAa7oyW9EqU5erqSdatqUTfENItE2B/A6rYUEBk3HhGGVJx1Wse/rivBebfWbp
	ygc+PxMZUDhMt76KXQoW/08IPrai7LicDzSXtCBEX96C438H8uOS4dFpscu0zPnaeZOQCKJ8kQ=
	=
X-Google-Smtp-Source: AGHT+IHGXMernUmSl+QPsfebNI4SxRiOTWJT33o5IRtl/a/5KJRrEuKnevcHuyQpidHSJY8kCtt6dw==
X-Received: by 2002:a05:600c:190d:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-43eb5c95bbbmr7349735e9.25.1743577888824;
        Wed, 02 Apr 2025 00:11:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/48] piglit: upgrade to latest revision
Date: Wed,  2 Apr 2025 08:09:56 +0100
Message-ID: <20250402071017.2157620-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214200

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch     | 2 +-
 ...tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 4 ++--
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index fa9db07f3f5..6ce2348a712 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From b76523100ad785c1fed41b881d7aecda1b8ce66f Mon Sep 17 00:00:00 2001
+From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 73750f67e..8018a1bb7 100644
+index 99ae07a4a..d5ee9cc22 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 8b51790e2a9..9751b206730 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From e7cd5ff25b40b807664bdcaf4f865ec769bbc52c Mon Sep 17 00:00:00 2001
+From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 9c2fe0adb2a..c6c072c7e0f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From a7b699b2647b950b5558a0d51626e44455d2a229 Mon Sep 17 00:00:00 2001
+From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index a196921aa43..6cb561c3f27 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From a28c1dcdaa74b014ad33a7c04ad3b906cee2770e Mon Sep 17 00:00:00 2001
+From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 1a5d7f7006a..7706d88086c 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 30eb460534dbcd6c7cd23bbe733c8ed6bdd82773 Mon Sep 17 00:00:00 2001
+From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
-index 1787eb180..9e74704b1 100644
+index b03221053..a01568c81 100644
 --- a/tests/util/piglit-shader.c
 +++ b/tests/util/piglit-shader.c
 @@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index ef3241c7a27..e30efdf33bd 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "fc8179d319046f45346bcbcc5aaeabebdf151f03"
+SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 

