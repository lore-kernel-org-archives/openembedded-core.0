Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E04D63949
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13943.1732111052005064704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hm6BdZOd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-212776d6449so3495945ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111051; x=1732715851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dnfdE7P0Mlsfs95T7zSskqSvvgl2vq64BMlf/DvAdXw=;
        b=hm6BdZOdaX+Rqbu8wkv8T99rrZybN52ag5j9a/q8/IPDWimmuCUBKVYri8PISs/Rqh
         PraiEdR12tlyLtrc0/iEh34HAux0eWO0AjhyjXgohQad7EQKGqcBZDzeC1WOXaYP+nLd
         HC5Ou5GWY6fRzy1R5Kd1N4Kk64gExwg2Vv0YxS8i1ZaprkfwZLyrcwJZobsFi7J24QPi
         LC3GPLMx6lslVPW5c4QXUQIoVqvrxuMgfvPoVQFTTSBZcUGj3ytH6WmH+ijYXsfYb29i
         FRL+OVbyous1R3k7EMo53uysyuWQjIWvbdWS4YVuoyih63ZtX12b+MGbpHNewqUt3FnY
         jDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111051; x=1732715851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnfdE7P0Mlsfs95T7zSskqSvvgl2vq64BMlf/DvAdXw=;
        b=UzoCVDr1/WQ5qr6AQUoCEMk3k4RvZc1iRi7ykE4LnTnSl1PX63AwJ8Wbqu3ojKTwPr
         +wUNLFYtIEnVFXp4L9zXWWYXs4yi6UTycgS8OT58RXeiBf+C5/rHtMzITjOS0k8UwSyH
         MzQ7vUmW8HUMixcbFwn9wOr0ObEO/35ukBOrgfd+yQZ9J+f2aXFpYNwoEJN1eFIv/xKV
         wu2bsH/Ix5RaYGnC8/UAQn3M8y2Sj9sGd9qEwbd5E2ia/lQ7YJop5C64vJDSBJdjbztD
         oxmyhB8WLO4exo42gsABwUxnpF3s5Zw2sbki98bFPHwTSudKCcWR4txHtT7o6qWO/er3
         RRjg==
X-Gm-Message-State: AOJu0YxIfMUUTIxP42/RkSj65zMj7PaDnK6bfn+oo1Ww7wELwKbaV3BS
	OJYbe/TVRAEuyP9yMz8t8hWmY2HKG9cxukT+MbIvkYIriCyOXbnrmDbUMRoHh7iaVDbWuVwAUsD
	U
X-Google-Smtp-Source: AGHT+IHOF77iF7EaylrXIngvOX9RR49S5wfq8GyAXuPo1u4OBEfHeS9NVG5zfXOzCO+I7oNRI+xagg==
X-Received: by 2002:a17:902:ccc9:b0:20c:8dff:b4ed with SMTP id d9443c01a7336-2126fb34cabmr23346395ad.16.1732111051283;
        Wed, 20 Nov 2024 05:57:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 13/31] virglrenderer: Add patch to fix -int-conversion build issue
Date: Wed, 20 Nov 2024 05:56:45 -0800
Message-Id: <37b9b21db6aae90ff16a808a20eed52f82575e0e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207437

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


