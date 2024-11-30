Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4042ED73616
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 23:13:45 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.142223.1733008416298027127
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 15:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QRUUknQZ;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so3024109e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 15:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733008414; x=1733613214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g0FCYLZh8a2hWVzAw4Qo7eFKffGYA7F5F1cSHWF1Q0g=;
        b=QRUUknQZ9GGuBjSq+nfWeVBWhbb8CpI7bNGPpVNNsAyUVFLrd2QHiOmoYnkOPyaxy2
         FOKc4KQxzsHnKC4/DhRjC6FTJip3vPTs1m4677UzLHXPfVJTXP6w0OCpmrgbkjyN41A3
         2ErYsoX5/jbLRsRROUvcRCggODFk3wLWFtPIrQve1M06gk2H1JqzJK4X+KC/fsN5s+Ga
         shwmxS82E9dO5sVHs+Ceqo16JafJlByO0bRvZ++1hOE7I7UIdgUmA4JSuGha6xZwogzR
         3yxxh7PA7GCb2wyw59pOJm8IYGNQEUyb3wA+OkMVbCQwQHYlAWZhquFIknn/QZLdPPRd
         129A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733008414; x=1733613214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0FCYLZh8a2hWVzAw4Qo7eFKffGYA7F5F1cSHWF1Q0g=;
        b=tXzNXGjPc1V+/4iBOlm98cnFdfOPRiJCUKaDC+DPR/vEfE8W1uUNFmmbOPywVcO132
         3z1CeVL8oxuVsuSp0ATyYXKIfa/gSeZlGzSqu3Gox8AW6imGpMC9b1QZMWN/vAbGmSle
         9a9bFOFN8fgeRHf4SsuqZjJ03P+Z9E08Zzp2aC44MO/j+Q52TKYck1kFoc6z2ATZkAjA
         LOKnc7RygdMmdjyolz+1MULps8av1Ogwbjd0bBLmDKlTfI4Ny8nonRKyfvjmQHy8dXZQ
         5tBGymDnh1jhjy2/JN000t1TD/S6na+TxR/W4N3JSuelhbqN3AN7J1cy0CvaA6J/GN41
         hWFw==
X-Gm-Message-State: AOJu0YxQmV5bTL2y5J/7OUeVuaaXlW+b7U2NCS+CPiOBFdo9KDrLzkDA
	Exid5ekMi86clOWhLdUE5pZAiti74Xo0zr/mHvmGp9T7t5M4jNICTLjWmQOPsNMr/mPNlnpsp8P
	G
X-Gm-Gg: ASbGncuP6fvnhA3qd00ZR4nwkzG4WJzTlpzyhOxh5yJEVwpeQ7XEhMv2pnUprXkcrN9
	vqHbNZcxpqRiL+CTp+XcGd2nBCYKvKgCzjxQI7l85f+tSqpkGsRyea9rH+i+JuQU53yNyUuW6CO
	KIIaCLgTuJRUCypRXgq3LzBPYcFXvVDSthmI7nejRD5g2lphlmny6YaJNSKMXk8ksHq/CtCK9OX
	JL5vsNyxXfG6VyIPh9VFIDWT/Eej3SE2I0G7eu+eAS4CVonEY6bzDA9AMdaM7eHXQ==
X-Google-Smtp-Source: AGHT+IHkvjvqTXUy2AAHofhomRGiVicqRceKypeE57XgtZR+m2KdB0231q8pSxVUNAGDiSFUqSz3lg==
X-Received: by 2002:a05:6512:2347:b0:53d:6b50:f5f9 with SMTP id 2adb3069b0e04-53df01046fcmr9907397e87.38.1733008413610;
        Sat, 30 Nov 2024 15:13:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f2b8sm895334e87.151.2024.11.30.15.13.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:13:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] piglit: update the patch to fix building the test without wayland
Date: Sun,  1 Dec 2024 01:13:31 +0200
Message-Id: <20241130231331.3884926-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 23:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208048

Fix the following error appearing if building on a pure-X11 distros:

<PATH>/git/tests/egl/egl-wayland.c:29:10: fatal error: wayland-client.h: No such file or directory
   29 | #include <wayland-client.h>
      |          ^~~~~~~~~~~~~~~~~~

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...ake-egl_ext_surface_compression-cond.patch | 56 +++++++++++++------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 47f8b03961c6..69cc302912e7 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -11,23 +11,45 @@ Otherwise, this error occurs:
 |       |          ^~~~~~~~~~~~
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/974]
+Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
- tests/egl/spec/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
+ .../spec/egl_ext_surface_compression/CMakeLists.gles3.txt   | 6 ++++--
+ tests/egl/spec/egl_ext_surface_compression/create_surface.c | 1 -
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
+index d9540bcfde27..01a70164f444 100644
+--- a/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
++++ b/tests/egl/spec/egl_ext_surface_compression/CMakeLists.gles3.txt
+@@ -2,10 +2,12 @@ link_libraries(
+ 	piglitutil_${piglit_target_api}
+ )
+ 
+-piglit_add_executable(egl_ext_surface_compression-create ../../egl-util.c
++if (PIGLIT_HAS_WAYLAND)
++piglit_add_executable(egl_ext_surface_compression-create
+ 	../../egl-wayland.c create_surface.c)
++endif (PIGLIT_HAS_WAYLAND)
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
-- 
2.39.5


