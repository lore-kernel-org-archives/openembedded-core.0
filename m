Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE601D1F9B5
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:20 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.4796.1729018278698715313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g0h4w8o6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so2968109b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018278; x=1729623078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnfdE7P0Mlsfs95T7zSskqSvvgl2vq64BMlf/DvAdXw=;
        b=g0h4w8o6q5julsm6GzhYYE7I4A4UstFIISwDnfm8Fb6F4i4QPpNO4xbWV/kFe5ycZF
         c2JOV1ON5EAi4p9EaKbTxW1iVAd+/rgsXv51iB3K7//EeEpptbk1rKF+rj8SiWj+8xAj
         JZ4Ppa4udnG8yp1KFlEkf+Gud4cFHI0pJj+trRz8/V5KWYJNA+cUzhKSoJa0O2PQVhWm
         HVKbxgistTuoMLYtNJhc17QqyfXaaoeHWPEiwc/2y+P5AO4nHuy6LbwoQwphSERmsCyt
         PTNkDiW3YYAanGKr76TAFFl5hKpxQ9L8Hajbko0zIiek6ycmD4qQK8sDECen1ZMBAgik
         tdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018278; x=1729623078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnfdE7P0Mlsfs95T7zSskqSvvgl2vq64BMlf/DvAdXw=;
        b=nF1UqUyVxOrCtwL/6ers67e+aNyfqzV0Y6SW3qvXWGI+BudjXwKHtZeVbaROmnE1i4
         xWAGG1je3ZvbJlzHLA7KF0hz/5Ef9+Me55hg9azjue9BltrRArZ4gtKAiOuJecdX1gvN
         yGs7KMwXMdaeYi1w9oTZdCVnPfQ1hhPU52Gh9ma5VEsxiDngMOxZlz1tCfeX4CAEzYj5
         vKkQfb0cQ2VknRHQPhX7I5wlzP5ZVy6237jyyhPMbhC0B/uCoUVZXamNRpWaG2nEuoMa
         DkaMQVtWlxlu4EipZAtVtwqj8vfDEQeR7iM195qvoy64T5fUNRofejkNBbfmxi9ocDrV
         XmiA==
X-Gm-Message-State: AOJu0YxMo3RbzLP3tET14Tu4qxsrGl5KkCDhyguTWeW/7t2v0MZXZZwG
	rfTYrWiqCl3dVq1WK1NO0r1ijizYVlgKMRD9gouUgBSji9sq3sYDoMEzNGzI0JAw+TnQUvB915N
	f
X-Google-Smtp-Source: AGHT+IGpZ1HMGroVzGhQaU58itPnQIpA1cEHXNdwfYDHO7TEEqSZdOin7P08ClRHNkHP9/XVxOcPyA==
X-Received: by 2002:a05:6a00:10c8:b0:71e:72b5:3094 with SMTP id d2e1a72fcca58-71e7db1cc99mr1911461b3a.28.1729018277398;
        Tue, 15 Oct 2024 11:51:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/18] virglrenderer: Add patch to fix -int-conversion build issue
Date: Tue, 15 Oct 2024 11:50:46 -0700
Message-Id: <17049482f0a112781026376245437c4c8343d28a.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205933

From: Purushottam Choudhary <purushottam27.kumar@lge.com>

Fix int conversion related error during compilation
as some of the platforms where EGLNativeDisplayType
is an int instead of a pointer with GCC-14.

Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f71f4936a273262343e34f278e6cfcc1e419aea3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nversion-fatal-build-error-with-GCC-.patch | 41 +++++++++++++++++++
 .../virglrenderer/virglrenderer_1.0.1.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
new file mode 100644
index 0000000000..9c49ee512a
--- /dev/null
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
@@ -0,0 +1,41 @@
+From 464deabe4d1bfce6b8f414ab0945d9a62b66ddd4 Mon Sep 17 00:00:00 2001
+From: Purushottam Choudhary <purushottam27.kumar@lge.com>
+Date: Tue, 8 Oct 2024 11:47:21 +0530
+Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
+
+Getting below error int conversion during compilation as one the
+platforms where EGLNativeDisplayType is an int instead of a pointer.
+
+| ../git/src/vrend_winsys_egl.c: In function 'virgl_egl_init':
+| ../git/src/vrend_winsys_egl.c:364:62: error: passing argument 2 of 'egl->funcs.epoxy_eglGetPlatformDisplay' makes pointer from
+|   364 |                                                              (EGLNativeDisplayType)egl->gbm->device, NULL);
+|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|       |                                                              |
+|       |                                                              int
+| ../git/src/vrend_winsys_egl.c:364:62: note: expected 'void *' but argument is of type 'int'
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/464deabe4d1bfce6b8f414ab0945d9a62b66ddd4]
+
+Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
+Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
+---
+
+ src/vrend_winsys_egl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/vrend_winsys_egl.c b/src/vrend_winsys_egl.c
+index 9d9f410c..8750f6b2 100644
+--- a/src/vrend_winsys_egl.c
++++ b/src/vrend_winsys_egl.c
+@@ -361,7 +361,7 @@ struct virgl_egl *virgl_egl_init(EGLNativeDisplayType display_id, bool surfacele
+ #ifdef ENABLE_GBM
+       else
+          egl->egl_display = egl->funcs.eglGetPlatformDisplay(EGL_PLATFORM_GBM_KHR,
+-                                                             (EGLNativeDisplayType)egl->gbm->device, NULL);
++                                                             (EGLNativeDisplayType*)egl->gbm->device, NULL);
+ #endif
+    } else {
+ #ifdef ENABLE_GBM
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
index 0501b0c59c..87f25a3461 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
@@ -12,6 +12,7 @@ DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
 SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
+           file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


