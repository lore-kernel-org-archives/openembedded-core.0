Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF36CD98D7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33480.1781132124598586498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EoBUfzdC;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4601949975dso1471913f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132123; x=1781736923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPadFaAF5Dc8tlPtRyfvXj6NZU+wNybB+votW2bkrG4=;
        b=EoBUfzdC6TS48WXF39KxpTP93HUUDvZ4M4ISr3WZv50DNgdfOau+xvG2M8Po9z+O0Q
         iiyo41K4P6bqgirqFgmq2u1zi5KzECvQwMj7VBvqBD0xLUWg7vg0sKM6frs/rkG2ozz/
         DdpfUutgxeEw213aZCodAKHC502g6ntzm95qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132123; x=1781736923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fPadFaAF5Dc8tlPtRyfvXj6NZU+wNybB+votW2bkrG4=;
        b=nJep/hvS35Hjd994zQusu7ZnWs79Xa29pPp4HabEvzc2Gb3q+fEdfho51WZbVh/Le3
         6RU3VaSllorf97sdAB7b5RCGzR4RzdSbVcT7UlEHEOg9ALMCieO4inmODGkdCvT8j9CE
         TzAiHoRmFl+AxjQc11EXsDdu3smuJlGOHOAkQvNXA3jPoiRueVX6WljVXQRRd4pGoYrE
         ZoVPgagmSRvClUb9kh4t5n0OOI5cbO/YURdXunBE1f8aRyGh+i9U5fbmopjwnYqhoNaI
         T5FXlEFXIoRVQ0cycJcXfJUxV1K7Hde/PC3xHK7oiLYIu8HVOrkqBwtOYRMfpMM+FYk5
         cBRQ==
X-Gm-Message-State: AOJu0YzWWC6Wmw0EQG5uBWqshaYDZfXSgnEi9hrbkun3C6TE5VDAFDCh
	noccSGQ9Fq3QoGWc+tVXAaEnd0VfmKzqsPzvSlLnvZQLPflLfNdZs5ko3L26stcJRT/MViv5zxb
	8iuG+
X-Gm-Gg: Acq92OE1HHo53GFMAhk98OLV5RYG32d7TstVXn17JRx3MHwKKCX5cILXu0lJJbFtgka
	TlnzowxZJ9RvwGpnpmiI7K66GP/EOAiBDPUB9KtK460kdYZQ/R9dQHgEFJ1A65xRSYOkexkRqKu
	lSrEJKcJq38OFST4+vb2AV/lgvzCbUgLFh+AU5DLR09NaAJ4cpSvoclSQZdGrlPo7eti9n0frxI
	giKNghXTLZAIkUkZ32jQIBHKHe1NogloWg0MypEfWy1iIQpGWbI+hSO2HL8Dtw+q/ImXM0RMpwd
	79pEwlgMVBGfRaP03Ek6PyZHGfewRrcnv8DaCAJ9VeWv1DVtxOSoko8bBlA1MpABKGyQtrkIdtp
	ax/adtnJVFghGmW9PwAjoAGxYMzV8U+CbaP0lf+BYeZJuS2SCA7lvmbbmjQYUanXbI3tNI9lPMo
	zJJVM1KUP3Qf08EkwiNvoyFwNFmVW5nwLqh+OzQrnvDs1sgqk6V5+dXcWmG4G7y5IkT772X3Eh1
	XYrNjtBiLXQO3pXwPez5BlaQgNL//eVdh/4PWU=
X-Received: by 2002:a05:6000:1449:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-4606746a20dmr278953f8f.4.1781132122987;
        Wed, 10 Jun 2026 15:55:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/21] libsdl2: Fix compilation error with DirectFB
Date: Thu, 11 Jun 2026 00:55:03 +0200
Message-ID: <ff149ab4eecd4925fd350a56ed894f515fa87bc6.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238408

From: Mark Jonas <toertel@gmail.com>

Compiling libsdl2 with DirectFB as renderer results in a compilation
error. Patch libsdl2 so DirectFB_CreateRenderer() uses the current
SDL_RenderDriver API.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b989a60b10d4b1cf34b0705b64f842aaed7cdb3)
[YC: fixed patch format]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ix-CreateRenderer-callback-signature.patch | 58 +++++++++++++++++++
 .../libsdl2/libsdl2_2.32.10.bb                |  5 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch
new file mode 100644
index 00000000000..4fdec5ec5cc
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
index 834cf096b97..3e3c55af2f8 100644
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
 

