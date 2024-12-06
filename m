Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC715E7716E
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 00:13:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.26388.1733443970397786164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 16:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=sM0VVJIf;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53dd668c5easo1716570e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 16:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733443968; x=1734048768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6FSApmLWCuS4575+7mdgfX+g+1ZoC1BYo3TN+Zhry0=;
        b=sM0VVJIf9tX1RnKcMO8/D/VYbZPxizcQbsobqMs2wJ2VpFmxpCq4KfLKfm8/7eKcZ7
         KvNsjMMB/yAMi/sle1L7z+syQgKTLn2kodcKsibXZoXDy6QPGVSIdRKvwLN2+sh9H+uD
         jPMNFiR65Dee0CE0UMbkA4kPwcvLzPAn6hqlUtVLqDzt3VBg0w61CjilXBpw7Bn7d1TO
         jNt9fpXJwew0ZkTPIsLD3Ps9n/VvKI3dvWdt6oGD2NJOWW1Rl+vtV7cQSAUituHyBK/7
         Suhl+WGhzj2oLymmd5c0/tBsb4UXYqXjMuC0rK83vUde7uibT3M4AQaEpDSRJkT/JMhJ
         tCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443968; x=1734048768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6FSApmLWCuS4575+7mdgfX+g+1ZoC1BYo3TN+Zhry0=;
        b=sex5wiKCeNvSIITDSRYTqkmA27ufvBPLtUgUPIzosJC5ItTz1M/WLwjq6iCB7+n27A
         9MyCxntE5QDEbrw9yHqNbJ4Pet0SW35Czan/GCIwo8UAvonQGWx8UJYxx8b41/ombr7o
         xRchmpjjiT1fABRxeq0EFOyKUQHTNSgkUhQf6XcXvA9esOoU4iT0e1xxSka5NYcpzI0k
         p2P5cdw5aUXi9x4zCANdeyiHZLtFNvnycA91PVfUP3QcAvHtSv29gYLd/oNf9L50uRGs
         nyVtrm1zeTjDnE+rz1Bio3IDnw5pEO4gCQr9Wzr8Cv0PIbqlByqvrwug6ScshnShhywd
         alqA==
X-Gm-Message-State: AOJu0Yw22K4nT0pGg3TgTmhC873WsfQylHcSjddc4w/cf+JNu4JJbB8O
	jyGH8qw2RyZ5RZzh/FVpjC6Q8mE0lEP+dMJAoi7lZvu2C2xsU17QDkQ7z6jqPkc4SIoq/PqzrVz
	J
X-Gm-Gg: ASbGncsFY7lrUZDsn1ItlzIzKD+VVP6LWEKr5u66Ip1v2vGKqDfXHeRTvAoGipDiIRC
	/qq/hu6N7Z7mwudLPSKdog1H5GKoEOJLYy+HzLbRNyM8ShMro4JyFHpc5yK6xhIJP9sKzJaVOD8
	GLgGnkFMb+yvab7qeAtsy4cZ4lg/P1genZEktfI1bOlf7H0JuLKRrh+U9rFISXipPOVPSD3XRvx
	999kJD2QpmRiA5v+zm4SjhzDcZZgEEqh/N1nhzRbo1iY1h6zGoDdYjMVkPGhaBKZQ==
X-Google-Smtp-Source: AGHT+IEbZynoQ2X4JoawFdlpzqq5VWw4C35Q/Bi5n7A1pMwTGI7PzVubB6tiFclyHnz4BxjYYfAIpw==
X-Received: by 2002:a05:6512:31ce:b0:53e:141f:4bcb with SMTP id 2adb3069b0e04-53e2b6ea02amr358574e87.14.1733443968037;
        Thu, 05 Dec 2024 16:12:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c20b5sm362735e87.179.2024.12.05.16.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 16:12:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] piglit: update the patch to fix building the test without wayland
Date: Fri,  6 Dec 2024 02:12:45 +0200
Message-Id: <20241206001245.173254-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 00:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208402

Fix the following error appearing if building on a pure-X11 distros:

<PATH>/git/tests/egl/egl-wayland.c:29:10: fatal error: wayland-client.h: No such file or directory
   29 | #include <wayland-client.h>
      |          ^~~~~~~~~~~~~~~~~~

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...ake-egl_ext_surface_compression-cond.patch | 33 ------------
 ...rface_compression-stop-using-egl_uti.patch | 50 +++++++++++++++++++
 ...rface_compression-make-create-test-w.patch | 37 ++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +-
 4 files changed, 89 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl_ext_surface_compression-stop-using-egl_uti.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-egl_ext_surface_compression-make-create-test-w.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
deleted file mode 100644
index 47f8b03961c6..000000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0c97d5eacae4f584313c9251e585bb0246cceffc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 22 Nov 2024 22:52:31 +0100
-Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
- to X11
-
-Otherwise, this error occurs:
-| In file included from /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/create_surface.c:28:
-| /srv/storage/alex/yocto/build-64/workspace/sources/piglit/tests/egl/spec/egl_ext_surface_compression/../../egl-util.h:12:10: fatal error: X11/Xlib.h: No such file or directory
-|    12 | #include <X11/Xlib.h>
-|       |          ^~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/974]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/egl/spec/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/egl/spec/CMakeLists.txt b/tests/egl/spec/CMakeLists.txt
-index 33c504978..1dea6d8fc 100644
---- a/tests/egl/spec/CMakeLists.txt
-+++ b/tests/egl/spec/CMakeLists.txt
-@@ -7,7 +7,9 @@ add_subdirectory (egl_ext_device_drm)
- add_subdirectory (egl_ext_platform_device)
- add_subdirectory (egl_ext_image_dma_buf_import_modifiers)
- add_subdirectory (egl_ext_protected_content)
--add_subdirectory (egl_ext_surface_compression)
-+if (PIGLIT_HAS_X11)
-+	add_subdirectory (egl_ext_surface_compression)
-+endif (PIGLIT_HAS_X11)
- add_subdirectory (egl_khr_create_context)
- add_subdirectory (egl_khr_display_reference)
- add_subdirectory (egl_khr_get_all_proc_addresses)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl_ext_surface_compression-stop-using-egl_uti.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl_ext_surface_compression-stop-using-egl_uti.patch
new file mode 100644
index 000000000000..575477bc4ca7
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl_ext_surface_compression-stop-using-egl_uti.patch
@@ -0,0 +1,50 @@
+From ea48657a33015ad1f94c0d639fd9ee76e0e374c4 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Fri, 6 Dec 2024 01:55:28 +0200
+Subject: [PATCH 1/2] tests/egl_ext_surface_compression: stop using egl_utils
+
+Otherwise, if X11 includes are not available, the build fails:
+| In file included from <PATH>/piglit/tests/egl/spec/egl_ext_surface_compression/create_surface.c:28:
+| <PATH>/piglit/tests/egl/spec/egl_ext_surface_compression/../../egl-util.h:12:10: fatal error: X11/Xlib.h: No such file or directory
+|    12 | #include <X11/Xlib.h>
+|       |          ^~~~~~~~~~~~
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/977]
+---
+ .../egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt | 4 ++--
+ tests/egl/spec/egl_ext_surface_compression/create_surface.c   | 1 -
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
+index d9540bcfde27..2daf8167c81d 100644
+--- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
++++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
+@@ -2,10 +2,10 @@ link_libraries(
+ 	piglitutil_${piglit_target_api}
+ )
+ 
+-piglit_add_executable(egl_ext_surface_compression-create ../../egl-util.c
++piglit_add_executable(egl_ext_surface_compression-create
+ 	../../egl-wayland.c create_surface.c)
+ 
+-piglit_add_executable(egl_ext_surface_compression-image ../../egl-util.c
++piglit_add_executable(egl_ext_surface_compression-image
+ 	image_storage.c)
+ 
+ # vim: ft=cmake:
+diff --git a/tests/egl/spec/egl_ext_surface_compression/create_surface.c b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
+index e3d55d4331fb..35f13fd007b4 100644
+--- a/tests/egl/spec/egl_ext_surface_compression/create_surface.c
++++ b/tests/egl/spec/egl_ext_surface_compression/create_surface.c
+@@ -25,7 +25,6 @@
+ #include "piglit-util.h"
+ #include "piglit-util-egl.h"
+ #include "piglit-util-gl.h"
+-#include "../../egl-util.h"
+ #include "../../egl-wayland.h"
+ 
+ static enum piglit_result
+-- 
+2.39.5
+
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-egl_ext_surface_compression-make-create-test-w.patch b/meta/recipes-graphics/piglit/piglit/0002-tests-egl_ext_surface_compression-make-create-test-w.patch
new file mode 100644
index 000000000000..3de983afb73d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0002-tests-egl_ext_surface_compression-make-create-test-w.patch
@@ -0,0 +1,37 @@
+From 0a985979d68b181b9014e49c0eb1908dd51345e4 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Fri, 6 Dec 2024 01:57:18 +0200
+Subject: [PATCH 2/2] tests/egl_ext_surface_compression: make create test
+ wayland-only
+
+The egl_ext_surface_compression-create uses egl-wayland.c, it should not
+be enabled if Wayland is not available:
+
+<PATH>/tests/egl/egl-wayland.c:29:10: fatal error: wayland-client.h: No such file or directory
+   29 | #include <wayland-client.h>
+      |          ^~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/977]
+---
+ tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
+index 2daf8167c81d..01a70164f444 100644
+--- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
++++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
+@@ -2,8 +2,10 @@ link_libraries(
+ 	piglitutil_${piglit_target_api}
+ )
+ 
++if (PIGLIT_HAS_WAYLAND)
+ piglit_add_executable(egl_ext_surface_compression-create
+ 	../../egl-wayland.c create_surface.c)
++endif (PIGLIT_HAS_WAYLAND)
+ 
+ piglit_add_executable(egl_ext_surface_compression-image
+ 	image_storage.c)
+-- 
+2.39.5
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3e950ff61c55..a5629476860f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,7 +11,8 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
-           file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
+           file://0001-tests-egl_ext_surface_compression-stop-using-egl_uti.patch \
+           file://0002-tests-egl_ext_surface_compression-make-create-test-w.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.39.5


