Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D94C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 16:42:14 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.25428.1752856923521778542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 09:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IFvF2ARF;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-612a8e6f675so3265713a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752856922; x=1753461722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw46HlXAh4SR52BpPRkFcBmJT5NbIgcDQiH1o0lfCpU=;
        b=IFvF2ARF39nSa4Qup5yKveQylHMSFVoXm2pVHqdCGXOp9qKxGYhbtzp2bkfaM8cC8W
         952Wzk+XhI1y5B+++IcSPGVsoJO9Nbr93eMuDnR8Nsz5teIerXk1hdzY1HntYs3WUm0F
         2iJrsZDuXPyuIRqpH1D5mP9/MSPS73xPb4REWlRk1LHlvbbmakwv1UjfyH9gvC59QJge
         YonYmVvOuqfczLbEGJYFRyehzMO4Z4N4fUgTmz2EgETF5kLUCfcHzAkgJUW5VAJ07S3R
         Zmzps+Uhcx2hyBULdX2JTGOmKtqUAVbfYh6khqHJ8HwRQnl4biteSKviKyOPQQEvkRxP
         Vi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752856922; x=1753461722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw46HlXAh4SR52BpPRkFcBmJT5NbIgcDQiH1o0lfCpU=;
        b=nQhnQk/ERn2li9DvanDvTUE6Y1fFbzMzXJaahiUQNoalUna5EWhJep8vu01aO+FyzY
         CxUmYMXpfJCWfTqxkVk6qQHRb80Wu0XRB7BqIzWnzIAHIYGlFDfpizEJTSzy4Hb+GBpb
         blhJOJi6oWvEs+NsM+ei59JaPD2kfW1PaaFWroth4klmU9iT2ep/Oq4e74gM8ss5NgGs
         +gnQLfj5C1sWS5wi88kQ2+2V8V79/QcA4aEckTgF6Qf/MOB02I208DQp4tnetfMLKr1A
         7ZJsjfSGO2+M4w55at/wh046YNINhjjaknhAWsaHb1yf3gt1e/HaxZMPr7maFcRLikqa
         2Pig==
X-Gm-Message-State: AOJu0YwVPw0Z0rk5TokFWZPR+3gsSqbvRLeHLKKDczHtZwlRjAE7a5bE
	Zw0FHzPU2jNnf6w+FakrX+MKM0ZyZQPI9XipGdGqAzk4wSJMPlxTwmGgvREd/mPE
X-Gm-Gg: ASbGncseTwZ6rer07w54eMrryFvDdIztHpRDRJctt8iWN1l4RGDHMuU+NF/3pe0CrCq
	aaP9YT1ReSQ0VuiRgjOo8zn4mbFXQHQdu9gcXO8w36kbivHelXDEtXaFSCSuacobKvDifiLFV1D
	rXANqT5N8unZUMaLadMgyrVcaSJ4qPMyd5thBRYTlT+dpcNAXlw1dlN8NWbcNEhVTKUGh26aBXP
	JcZfGlTr4/5TAnfEQTNt8QtyMd8Xu33ihk0VI8fl410VGr2pPynabXEC5qHLVKG5zAEkzElftwi
	VII+mbw3blA7qlc9XWkg62JMyxq3q260YeG4J7BaepLqzOLWxiwQkwW5TrHbCP/MUM+zQg3hDsk
	08npK3Mo2OLx359w2E6o=
X-Google-Smtp-Source: AGHT+IGtdAu7pbuiaWwmtX1KqavJoLWiLn4RAOPGsrJKMfzGTeHDM/9bA/mFTShwAFF1ZU9ridtlzw==
X-Received: by 2002:a05:6402:2808:b0:60c:3d54:4d2a with SMTP id 4fb4d7f45d1cf-61285bccc0emr10167954a12.22.1752856921555;
        Fri, 18 Jul 2025 09:42:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f07fa9sm1232092a12.7.2025.07.18.09.42.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:42:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] virglrenderer: upgrade 1.1.0 -> 1.1.1
Date: Fri, 18 Jul 2025 18:41:58 +0200
Message-ID: <20250718164158.330142-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 16:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220602

Dropped 0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
because it is indluded in this release.

Added python3-pyyaml as a build dependency - dependency was introduced in
https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/194c75946a30e11b90ea46b6a6ddc5e62a9e9612

Changelog: https://gitlab.freedesktop.org/virgl/virglrenderer/-/releases/1.1.1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...nversion-fatal-build-error-with-GCC-.patch | 37 -------------------
 ...nderer_1.1.0.bb => virglrenderer_1.1.1.bb} |  7 ++--
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.1.0.bb => virglrenderer_1.1.1.bb} (84%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
deleted file mode 100644
index 67dc4989b5..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From bb129aac12c5aa6e2dd371244b042baa82aff014 Mon Sep 17 00:00:00 2001
-From: Purushottam Choudhary <purushottam27.kumar@lge.com>
-Date: Tue, 8 Oct 2024 11:47:21 +0530
-Subject: [PATCH] vrend: Fix int-conversion fatal build error with GCC-14
-
-Getting below error int conversion during compilation as one the
-platforms where EGLNativeDisplayType is an int instead of a pointer.
-
-| ../git/src/vrend_winsys_egl.c: In function 'virgl_egl_init':
-| ../git/src/vrend_winsys_egl.c:364:62: error: passing argument 2 of 'egl->funcs.epoxy_eglGetPlatformDisplay' makes pointer from
-|   364 |                                                              (EGLNativeDisplayType)egl->gbm->device, NULL);
-|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-|       |                                                              |
-|       |                                                              int
-| ../git/src/vrend_winsys_egl.c:364:62: note: expected 'void *' but argument is of type 'int'
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/464deabe4d1bfce6b8f414ab0945d9a62b66ddd4]
-
-Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
-Part-of: <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1440>
----
- src/vrend_winsys_egl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/vrend_winsys_egl.c b/src/vrend_winsys_egl.c
-index 9d9f410c..8750f6b2 100644
---- a/src/vrend_winsys_egl.c
-+++ b/src/vrend_winsys_egl.c
-@@ -361,7 +361,7 @@ struct virgl_egl *virgl_egl_init(EGLNativeDisplayType display_id, bool surfacele
- #ifdef ENABLE_GBM
-       else
-          egl->egl_display = egl->funcs.eglGetPlatformDisplay(EGL_PLATFORM_GBM_KHR,
--                                                             (EGLNativeDisplayType)egl->gbm->device, NULL);
-+                                                             (EGLNativeDisplayType*)egl->gbm->device, NULL);
- #endif
-    } else {
- #ifdef ENABLE_GBM
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
similarity index 84%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
index 11c3c8c963..89dd25de70 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb
@@ -8,11 +8,10 @@ HOMEPAGE = "https://virgil3d.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
-DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
-SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
+DEPENDS = "libdrm libepoxy python3-pyyaml-native virtual/egl virtual/libgbm"
+SRCREV = "0f1f43929724a6a414c01a29bc51feccb445c2f0"
+SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https;tag=${PV} \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-vrend-Fix-int-conversion-fatal-build-error-with-GCC-.patch \
            "
 
 inherit meson pkgconfig features_check

