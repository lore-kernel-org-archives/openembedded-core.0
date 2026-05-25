Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0EDCD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:43:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16046.1779716583411350251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 06:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m+CrcCJz;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ebafde87cso1681715f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 06:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779716582; x=1780321382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxQ/j/zd3cY32yanMQKuqK+kEeYXh/aRigD6t12Ugsw=;
        b=m+CrcCJzsLXPGFY/cnkEFoTtvVHVec7E5MLrpIsa+/RCz97lOIkAQpPHbOV/9AlcSu
         gWSEYm4ZkiJ4mLmW1j00uiAEv96SLq/u1qvdvOVx3uZgvlNcZHb5FV53nLbQS5o8hRAY
         zY9SOYHC8Tur5o6PwgbGf9mGfYstp9fDpea7HxuO7SA5gBV7FIev2+uvOAmDn1gNNJ9w
         /AUT4MYbfCLDlaqb5ufxfMxQwzu8tvk3htQXxjZa8e7YJ7fBpqhxIeatDat6ZuWdHF6b
         BS27KixoQ2hNJtXYSXit3MZVtOOOGWrQ08PnUsnlBdNk5Vd/lB4olxI8+1qizIMC4HUt
         D9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716582; x=1780321382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxQ/j/zd3cY32yanMQKuqK+kEeYXh/aRigD6t12Ugsw=;
        b=Z/CtEo/4muKO6uufOiul7O+DHbFB5SaeSSWvPfVJWssCaL2J+D3WRwaY88Xpy8DNZO
         ym1Ia0Ckror4kpDgenV8BDN9Qg6xLVy/7cnIIdU2RIgS9uFMc0PJiPgYpsq95RlnAGHX
         szVt4HirKTl2gxAsGUt5TZM4HGfpgn9XDCbAOy9/4sJ7RUgTZgOYsXjFUU8H7tF/WZKc
         pOq7RC3pIcIQtoCqmBSJaebdbpCGYyJqWBkMv7eCivCAGWLZ+DDCtSZ/sWRVMoAfPAeC
         EZcfseRSJ5EuPFmzg1259dZdX5XRo4klxynYRqA/HTKwJhyc5RXHoeFZJi1w5Plu5EIW
         3DVQ==
X-Gm-Message-State: AOJu0Yyyfi7OJM5kArPtgSXKy7A+YyuvybtwVOG2CUBorAg49SPVoT0L
	O0XGS7JyKXQ8rfzhveKhnD7mQa00MLUlQ+NnT0aHDCf5oxUhXLRoCXLhF9X82A==
X-Gm-Gg: Acq92OHAmpkLBJvE9lhjPfuQ5I0OsOeRierUu/bdtSDzmgklJxeCPvpRwT2iE1NSRIQ
	K284dflYhG96ZYJlj7gp2nFOH2EeHowASkskaGsOGM8+fLbxNfrdESM86SzG6irMGtl2aC404p/
	MQegWnp3M2Of5khniQcexz4PQE1lBGxqN9N4yIaadMN2aEqQFd1Tnl0JczM6uOT4eDozl+PCt4C
	5rx6vGUTJQjkAdYUIgT4Mz1mOZFkW3hNLrhKvDtMgA4vR8bYGDm/S0i/WqBce2q/239stX9zV3w
	kmtbpHg64zxQ/nkL1PpLIU6hFLJUJmarx32gAfj7HmdfABNBMnRYELekDv439hfpiP8SSsrFURU
	TtdSYCWhgmGeF0RoYaK66lLn4grgFt/vEQ+Lj/ShCSvzB7ySSx0iAe1tydrTDKPdhumvz0ymoHh
	DJIlCbDeS753r8TfJSNv3FCuZYKJNghsg0H9a0R4cXqijiG6GTD0hHdUWgLU318hU6oAl3FT1fy
	t+JagtWasEKIlCyMGckn1Y=
X-Received: by 2002:a05:6000:1acd:b0:448:69c0:8da0 with SMTP id ffacd0b85a97d-45eb3692456mr23874432f8f.7.1779716581520;
        Mon, 25 May 2026 06:43:01 -0700 (PDT)
Received: from ThinkCentre.fritz.box (p200300cfaf475000947834ddeb1f7561.dip0.t-ipconnect.de. [2003:cf:af47:5000:9478:34dd:eb1f:7561])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d493dfsm27580069f8f.23.2026.05.25.06.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:43:01 -0700 (PDT)
From: toertel@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	f_l_k@t-online.de,
	Mark Jonas <toertel@gmail.com>
Subject: [PATCH] libsdl2: Fix compilation error with DirectFB
Date: Mon, 25 May 2026 15:42:28 +0200
Message-ID: <20260525134255.99033-1-toertel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 13:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237575

From: Mark Jonas <toertel@gmail.com>

Compiling libsdl2 with DirectFB as renderer results in a compilation
error. Patch libsdl2 so DirectFB_CreateRenderer() uses the current
SDL_RenderDriver API.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 ...ix-CreateRenderer-callback-signature.patch | 58 +++++++++++++++++++
 .../libsdl2/libsdl2_2.32.10.bb                |  5 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch
new file mode 100644
index 0000000000..232b7e76d9
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch
@@ -0,0 +1,58 @@
+From 1df9ae4338c43ad9dce4b27a77f807aa8d2b073b Mon Sep 17 00:00:00 2001
+From: Mark Jonas <toertel@gmail.com>
+Date: Sun, 10 May 2026 20:16:17 +0200
+Subject: [PATCH] directfb: Fix CreateRenderer callback signature
+
+Update DirectFB_CreateRenderer() to use the current SDL_RenderDriver
+API.
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/bb65446578187f0dd1460d5ddf02636e8a7a3b8a]
+---
+ src/video/directfb/SDL_DirectFB_render.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/src/video/directfb/SDL_DirectFB_render.c b/src/video/directfb/SDL_DirectFB_render.c
+index 3f353cce9..684f907ea 100644
+--- a/src/video/directfb/SDL_DirectFB_render.c
++++ b/src/video/directfb/SDL_DirectFB_render.c
+@@ -1130,19 +1130,17 @@ static int DirectFB_RenderWritePixels(SDL_Renderer * renderer, const SDL_Rect *
+ #endif
+
+
+-SDL_Renderer *DirectFB_CreateRenderer(SDL_Window * window, Uint32 flags)
++static int DirectFB_CreateRenderer(SDL_Renderer *renderer, SDL_Window * window, Uint32 flags)
+ {
+     IDirectFBSurface *winsurf = get_dfb_surface(window);
+     /*SDL_VideoDisplay *display = SDL_GetDisplayForWindow(window);*/
+-    SDL_Renderer *renderer = NULL;
+     DirectFB_RenderData *data = NULL;
+     DFBSurfaceCapabilities scaps;
+
+     if (!winsurf) {
+-        return NULL;
++        return -1;
+     }
+
+-    SDL_DFB_ALLOC_CLEAR(renderer, sizeof(*renderer));
+     SDL_DFB_ALLOC_CLEAR(data, sizeof(*data));
+
+     renderer->WindowEvent = DirectFB_WindowEvent;
+@@ -1207,12 +1205,11 @@ SDL_Renderer *DirectFB_CreateRenderer(SDL_Window * window, Uint32 flags)
+     }
+ #endif
+
+-    return renderer;
++    return 0;
+
+   error:
+-    SDL_DFB_FREE(renderer);
+     SDL_DFB_FREE(data);
+-    return NULL;
++    return -1;
+ }
+
+
+--
+2.43.0
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 2b583448ef..880bf56167 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -21,7 +21,10 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 
 PROVIDES = "virtual/libsdl2"
 
-SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
+SRC_URI = "\
+    https://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+    file://0001-directfb-Fix-CreateRenderer-callback-signature.patch \
+"
 
 S = "${UNPACKDIR}/SDL2-${PV}"
 
-- 
2.43.0


