Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB516D58089
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.17090.1732536104677253106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHJDTZNu;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43169902057so38366945e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536103; x=1733140903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9WF3JNI9XuCMqgJH8pHmKGbUbI3cJF2l/Zv1VAIYa0=;
        b=NHJDTZNu25YmJToU12CX3BYucbhp/E8qfbOTAtkiRshnzqyERpj/7jnRXZyOTj5cu+
         dNG2z6XYCTYLA7vpKdnAzbE1ZCjc+KLIKIrNUuV1fRKwlDSIISPK220jsTB7l8OYd7xv
         VF3G6pBOBjmwBuOZYfCvy0HNtWzaDmeBMjRhy+SE7YfFgQExj9y0DssITL19bBkrArPh
         0zmDwYiDdLkcSnkiWc1d/anoZjpCChDrtC6zKyhlV58kbluU27wFwPf9qRFa2cXCEthe
         SU9eNWkqT63lyOpPsIhvQoTrz1rG3o2jRPY/PBwABfF+z0QMRSSAGUbtgRQw3DGTzU3g
         l2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536103; x=1733140903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9WF3JNI9XuCMqgJH8pHmKGbUbI3cJF2l/Zv1VAIYa0=;
        b=kfm9Tqvh1AYUAHsCn5Ao9mQ3gee0/J3y1NNdFLyKiZbaru8KD6DRpBJraLfiBgzGbD
         0HpqTAmaFIxrBWD41OLOUI4Ue870tM3IXVxurWfShMFIQYxk13/0vSlQYCFA5CNjaxqP
         TLlGIQ0yhffRinjHPF9wahPvg43Fb21NXLAsPSCNAySLW3/V8qtdjhlZZLCzP52DxsJB
         8j97vPpu2vF0JsWvSLxxBl8fBoJ5Pdpz11H8U3jPhpnuQ+WFgJYE8AJqrK0QnOpawpD4
         OZ48VzmuIoIAk0VyxdjVdRuq6s0ThIXkEN5vCHif2WMWSIIhh6goPw8REmCBp7ipdWul
         BhmQ==
X-Gm-Message-State: AOJu0Yza30TfXEZkXlDesVz+a5B9RmryplmG7KsjGakkfZ2nNBsjx/YT
	DNl22KYAN2QXZ/Tpcz5B4uhfu/5y7wmh4ZY1U/w74wcPbd0o4MJkF5Hdfw==
X-Gm-Gg: ASbGncv11cMEDEWuDEMfmrX+x9m4N+8Qdu38jmINlYtHQBNmNGNTtI9d6H5SzXVbB3o
	jG49NS6eQmW69ILkugTd1geuQR37cxO4X1mq2dPibrZSl+AmXgFresh+qWa5WOLISoyaw8DgpFr
	hQZ4/PxzkD77MvLHmFVtn47purdz+UGcyspceezeNCNpKKnvHS0+Zo95MC1eElMhk8FqooIck36
	BIt+YK9xN41gmCAq5CjlZRNyiQveMIMdKXsN3lwIBiuHyZyo7yFTH15gjgk372Qx9kXmL+mQcFu
	sixY1PMgon0=
X-Google-Smtp-Source: AGHT+IGdHi8QgLgY8s7iPdZXj4fibY4AYdWng2lcl3tStQbM25SgCYDFMbSSsLhSXz59ofiS3UBvdQ==
X-Received: by 2002:a7b:c7da:0:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4349499a073mr50241935e9.25.1732536102897;
        Mon, 25 Nov 2024 04:01:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/35] piglit: upgrade to latest revision
Date: Mon, 25 Nov 2024 13:01:09 +0100
Message-Id: <20241125120127.2205232-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207764

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-not-obtain-wayland-scanner-path-fr.patch |  7 ++--
 ...Fix-narrowing-errors-seen-with-clang.patch |  2 +-
 ...ake-egl_ext_surface_compression-cond.patch | 33 +++++++++++++++++++
 ...proper-WAYLAND_INCLUDE_DIRS-variable.patch |  2 +-
 ...t-shader.c-do-not-hardcode-build-pat.patch |  2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +-
 6 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index b47e16af6b3..0c872d3e9b6 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 8f25cdf54e35ab1a174cabf5078784b8e48bda01 Mon Sep 17 00:00:00 2001
+From 2af98d67e16e083c36e3193aefbda942399a455a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d169fb481..8394f5236 100644
+index 73750f67e..8018a1bb7 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
@@ -33,6 +33,3 @@ index d169fb481..8394f5236 100644
  	add_executable(WaylandScannerExe IMPORTED)
  	set_property(TARGET WaylandScannerExe PROPERTY IMPORTED_LOCATION ${WaylandScannerPath})
  endif()
--- 
-2.39.2
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 08e709b1d02..cfdfeb683e0 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 77f327909e4a99c64261290cd76e234e10cc64d2 Mon Sep 17 00:00:00 2001
+From 70f8d56bf9db9d85f3d197ab9de972e3a514514c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
new file mode 100644
index 00000000000..47f8b03961c
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -0,0 +1,33 @@
+From 0c97d5eacae4f584313c9251e585bb0246cceffc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 22 Nov 2024 22:52:31 +0100
+Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
+ to X11
+
+Otherwise, this error occurs:
+| In file included from /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/create_surface.c:28:
+| /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/../../egl-util.h:12:10: fatal error: X11/Xlib.h: No such file or directory
+|    12 | #include <X11/Xlib.h>
+|       |          ^~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/974]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/egl/spec/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/egl/spec/CMakeLists.txt b/tests/egl/spec/CMakeLists.txt
+index 33c504978..1dea6d8fc 100644
+--- a/tests/egl/spec/CMakeLists.txt
++++ b/tests/egl/spec/CMakeLists.txt
+@@ -7,7 +7,9 @@ add_subdirectory (egl_ext_device_drm)
+ add_subdirectory (egl_ext_platform_device)
+ add_subdirectory (egl_ext_image_dma_buf_import_modifiers)
+ add_subdirectory (egl_ext_protected_content)
+-add_subdirectory (egl_ext_surface_compression)
++if (PIGLIT_HAS_X11)
++	add_subdirectory (egl_ext_surface_compression)
++endif (PIGLIT_HAS_X11)
+ add_subdirectory (egl_khr_create_context)
+ add_subdirectory (egl_khr_display_reference)
+ add_subdirectory (egl_khr_get_all_proc_addresses)
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 70bb55053dc..17bcbce1908 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From cb8e4b99fcfe81399e3e6d922156db4a48a39a8e Mon Sep 17 00:00:00 2001
+From 9b2c2213a2d7aaea350649ee031e227b44343428 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index ce5cbd3ea97..767e93c43e1 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 7d2d23125f1946a7b74f9a427388d469500fcd8d Mon Sep 17 00:00:00 2001
+From 3d621cf028acb3b464759abb72a38102844079b2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index fbf20de176e..3e950ff61c5 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,10 +11,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
+           file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "c11c9374c1448d01b31e7f724921cc1f4ee2c84c"
+SRCREV = "d04d6fff00849a2a8e29ef3251c6ca04a2f68dc7"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.39.5


