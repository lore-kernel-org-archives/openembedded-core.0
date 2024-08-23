Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D3BC52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 13:50:33 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.16531.1724421030329482350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 06:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lG1XVXgo;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53438aa64a4so798111e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724421028; x=1725025828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzJAbtC8tmBdRkm8EcQPu19jcBzQxfbBM3LFEQcdcVY=;
        b=lG1XVXgoDp+2jQzEzpeyd+cb31zPyD3BT7XN5lpReGmr5go82Y1swc1/SzB9Fk5CFp
         ADjfKsY9u1ciLvTPaX6tAWWjrbIHr1bNjc8u90cdoKhvlrh3hoyuEJraKQadRsQ7pCOb
         LiP/Wp7Wn5ToD8YVuD6G96jrN8LmMW8xrzXTn4rMko7+uQgvv3ZTa7mL3xGPE9ZIh/wZ
         bBK+N/3Hudrh3GDuagdSOBpjVq0uO3wX/5cM25slNV4rVNjBUV31yb3Qy9SnJtiIqtnA
         MDGchb6/yg6L2Xetvw9ht1Q/y3/KkgZm91+gcybwGF9/Xbe4/R+uzRqLRyZyioDnXuAp
         cc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724421028; x=1725025828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzJAbtC8tmBdRkm8EcQPu19jcBzQxfbBM3LFEQcdcVY=;
        b=lhIkDnLIML/qyExk9IDSnG6Wu9VXR3QpiyKTqLmQImXWXQTP++oGEFpDCZgLrzR5oY
         j9ttA7IeseqQzQQb55fUeNtUqs1ZezPaAUot0rfLSTyk0Vl91nDShqcdqE3VTz176cOq
         yF/z/pOpgSu4yfbpzMc3Ca8rPu+5WAuzs2ADL90R8sR7ZNZHes6mbca4Tdm2qPDdr86k
         Sz5i2nDYAJnEwy42WLNRWc5JhGMUmNw3/9o6z6rdozJwL0U0ffzzklhda+P+yoBflPE6
         envgFx0BU1agCmaDNWreqO9XgNf2L0ePwHtYzHzBCqN9jJb3ynLqjajleeAhxH2MWb6J
         nvaA==
X-Gm-Message-State: AOJu0YxvmDimVb/GNjj+/q9tIy0b4s3BMJaj7sLg6LjHIXYg5FG3dTt4
	AAdmrkrqhB1Y9JSgCyiMFzT+I3iQwW/GqiqFojST4SkGYXT5PTy8UOVQOw==
X-Google-Smtp-Source: AGHT+IFRJUquaB1Ffz3zPPZDG7nvF3Q3/EgXpVEVhkUlas602Pziax1qet96cZwhX3Cbv/jOB+Ydsg==
X-Received: by 2002:a05:6512:33c8:b0:530:ea6a:de42 with SMTP id 2adb3069b0e04-5343883a11dmr1600473e87.26.1724421027811;
        Fri, 23 Aug 2024 06:50:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a5764sm261417666b.79.2024.08.23.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:50:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH] piglit: add a patch to address host contamination for wayland-scanner
Date: Fri, 23 Aug 2024 15:50:24 +0200
Message-Id: <20240823135024.699680-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 13:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203691

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-not-obtain-wayland-scanner-path-fr.patch | 38 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
new file mode 100644
index 00000000000..b47e16af6b3
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -0,0 +1,38 @@
+From 8f25cdf54e35ab1a174cabf5078784b8e48bda01 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 23 Aug 2024 15:29:45 +0200
+Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
+ pkg-config
+
+cmake can only use target wayland-scanner.pc which (correctly) points to /usr/bin/wayland-scanner
+
+However in cross builds it should be using wayland-scanner from native sysroot,
+otherwise builds will break if wayland-scanner is not installed on the host
+distro.
+
+Upstream-Status: Inappropriate [yocto specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ CMakeLists.txt | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d169fb481..8394f5236 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
+ 		message(FATAL_ERROR "Failed to find wayland-protocols XML path")
+ 	endif()
+ 
+-	pkg_check_modules(WaylandScanner REQUIRED wayland-scanner)
+-	pkg_get_variable(WaylandScannerPath wayland-scanner wayland_scanner)
+-	if (NOT WaylandScannerPath)
+-		message(FATAL_ERROR "Failed to find wayland-scanner path from pkg-config")
+-	endif()
++	set(WaylandScannerPath wayland-scanner)
+ 	add_executable(WaylandScannerExe IMPORTED)
+ 	set_property(TARGET WaylandScannerExe PROPERTY IMPORTED_LOCATION ${WaylandScannerPath})
+ endif()
+-- 
+2.39.2
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a1fd2b8bde1..3a2dec34d7e 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
+           file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.39.2


