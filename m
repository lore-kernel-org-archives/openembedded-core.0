Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744EEC4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:34:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.57746.1699284874603065627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AHSZr/RZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cc9784dbc1so25055315ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699284873; x=1699889673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+AzAypQsZz2xfB2k/iU8Yf4IzvFxsosucjOSweVvIUA=;
        b=AHSZr/RZyktii3l0dgQxXGTQVYcYPVjmECAz0m84eWSPQpM7Jf7TtGb7USoTU1uUem
         sSOgB3rW8DVAAAp0DTcNEiBEqPFUBGETz+rKD36nM4aDjdiVpXy6nabGFg/ndoRs3FYa
         KikC8PJDnKP++qlbdqx7YVfyXx87JPfreLYUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699284873; x=1699889673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+AzAypQsZz2xfB2k/iU8Yf4IzvFxsosucjOSweVvIUA=;
        b=AH9QpT3fegJ4Y3/9NPlCeolhLDnf0PQQu+3G2XJ8xUeJd8seXZIDYORW3Hynbd/HMK
         raREQOQ32rdSF0yy80QjBoM2Mk/JZUpUsk50HIpEU2nXwSqlDsBTppGM1IaGZTZYr4uM
         jfBGtRhc9SZt3tIb6IWYpcea7PRng33P7fv6anNRp6Qo8ExAiSMKquUOB5fMlKrMGH7b
         1S0C9IxOF6vBKIfaK3QvjdAgjuYMlsNGyBAXIjIkv4LrcllwpmHdMqNgunYJ2LH06cvg
         Id59lmb3o6uwpKsE6YR8VZsdLbDoWJAaapopCpJIUFRp5lMGd6gQOLfWqm5+2XlGMQR8
         VABQ==
X-Gm-Message-State: AOJu0YyEA1S//Pd7GqwVUKezbxMnH5yhpJZd5KfLlOJ+Es0mrYec5zYY
	o/URalOb6snWV2WWX096zeRXpRMnMR03Bnk62pM=
X-Google-Smtp-Source: AGHT+IFtCm2qgQk3FVwqtfB9hLoK7wmAxzBPRuBTDodKKyamuhK4Gq9XH/JHd1uRkp4ur20axPuFcA==
X-Received: by 2002:a17:90a:e396:b0:27d:4f1f:47f6 with SMTP id b22-20020a17090ae39600b0027d4f1f47f6mr24669502pjz.32.1699284873090;
        Mon, 06 Nov 2023 07:34:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c01c:7c68:1109:1fee:ab02:8473])
        by smtp.gmail.com with ESMTPSA id cq13-20020a17090af98d00b00280c285f878sm5590037pjb.55.2023.11.06.07.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:34:32 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][master][PATCH] xserver-xorg: Fix for CVE-2023-5574
Date: Mon,  6 Nov 2023 21:04:23 +0530
Message-Id: <20231106153423.2958316-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190232

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ++++++++++++++++++
 .../xserver-xorg/CVE-2023-5574-2.patch        |  42 +++++++
 .../xserver-xorg/CVE-2023-5574-3.patch        |  54 +++++++++
 .../xorg-xserver/xserver-xorg_21.1.9.bb       |   3 +
 4 files changed, 212 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
new file mode 100644
index 0000000000..9a8e583e78
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
@@ -0,0 +1,113 @@
+From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 12 Oct 2023 12:44:13 +1000
+Subject: [PATCH] fb: properly wrap/unwrap CloseScreen
+
+fbCloseScreen assumes that it overrides miCloseScreen (which just
+calls FreePixmap(screen->devPrivates)) and emulates that instead of
+wrapping it.
+
+This is a wrong assumption, we may have ShmCloseScreen in the mix too,
+resulting in leaks (see below). Fix this by properly setting up the
+CloseScreen wrapper.
+
+This means we no longer need the manual DestroyPixmap call in
+vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303
+
+CVE-2023-5574, ZDI-CAN-21213
+
+This vulnerability was discovered by:
+Sri working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f]
+CVE: CVE-2023-5574
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ fb/fb.h             |  1 +
+ fb/fbscreen.c       | 14 ++++++++++----
+ hw/vfb/InitOutput.c |  7 -------
+ 3 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/fb/fb.h b/fb/fb.h
+index d157b6956d..cd7bd05d21 100644
+--- a/fb/fb.h
++++ b/fb/fb.h
+@@ -410,6 +410,7 @@ typedef struct {
+ #endif
+     DevPrivateKeyRec    gcPrivateKeyRec;
+     DevPrivateKeyRec    winPrivateKeyRec;
++    CloseScreenProcPtr  CloseScreen;
+ } FbScreenPrivRec, *FbScreenPrivPtr;
+ 
+ #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \
+diff --git a/fb/fbscreen.c b/fb/fbscreen.c
+index 4ab807ab50..c481033f98 100644
+--- a/fb/fbscreen.c
++++ b/fb/fbscreen.c
+@@ -29,6 +29,7 @@
+ Bool
+ fbCloseScreen(ScreenPtr pScreen)
+ {
++    FbScreenPrivPtr screen_priv = fbGetScreenPrivate(pScreen);
+     int d;
+     DepthPtr depths = pScreen->allowedDepths;
+ 
+@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)
+         free(depths[d].vids);
+     free(depths);
+     free(pScreen->visuals);
+-    if (pScreen->devPrivate)
+-        FreePixmap((PixmapPtr)pScreen->devPrivate);
+-    return TRUE;
++
++    pScreen->CloseScreen = screen_priv->CloseScreen;
++
++    return pScreen->CloseScreen(pScreen);
+ }
+ 
+ Bool
+@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, int xsize, int ysize,
+                    int dpix, int dpiy, int width, int bpp)
+ #endif
+ {
++    FbScreenPrivPtr screen_priv;
+     VisualPtr visuals;
+     DepthPtr depths;
+     int nvisuals;
+@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, int xsize, int ysize,
+                       rootdepth, ndepths, depths,
+                       defaultVisual, nvisuals, visuals))
+         return FALSE;
+-    /* overwrite miCloseScreen with our own */
++
++    screen_priv = fbGetScreenPrivate(pScreen);
++    screen_priv->CloseScreen = pScreen->CloseScreen;
+     pScreen->CloseScreen = fbCloseScreen;
++
+     return TRUE;
+ }
+ 
+diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c
+index 48efb61b2f..076fb7defa 100644
+--- a/hw/vfb/InitOutput.c
++++ b/hw/vfb/InitOutput.c
+@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)
+ 
+     pScreen->CloseScreen = pvfb->closeScreen;
+ 
+-    /*
+-     * fb overwrites miCloseScreen, so do this here
+-     */
+-    if (pScreen->devPrivate)
+-        (*pScreen->DestroyPixmap) (pScreen->devPrivate);
+-    pScreen->devPrivate = NULL;
+-
+     return pScreen->CloseScreen(pScreen);
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
new file mode 100644
index 0000000000..2cdef752c7
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
@@ -0,0 +1,42 @@
+From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 12 Oct 2023 12:42:06 +1000
+Subject: [PATCH] mi: fix CloseScreen initialization order
+
+If SHM is enabled it will set the CloseScreen pointer, only to be
+overridden by the hardcoded miCloseScreen pointer. Do this the other way
+round, miCloseScreen is the bottom of our stack.
+
+Direct leak of 48 byte(s) in 2 object(s) allocated from:
+  #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId: d8f3addefe29e892d775c30eb364afd3c2484ca5))
+  #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f]
+CVE: CVE-2023-5574
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ mi/miscrinit.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mi/miscrinit.c b/mi/miscrinit.c
+index 3bb52b1bc6..b88938c9ae 100644
+--- a/mi/miscrinit.c
++++ b/mi/miscrinit.c
+@@ -249,10 +249,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /* pointer to screen bits */
+     pScreen->numVisuals = numVisuals;
+     pScreen->visuals = visuals;
+     if (width) {
++        pScreen->CloseScreen = miCloseScreen;
+ #ifdef MITSHM
+         ShmRegisterFbFuncs(pScreen);
+ #endif
+-        pScreen->CloseScreen = miCloseScreen;
+     }
+     /* else CloseScreen */
+     /* QueryBestSize */
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
new file mode 100644
index 0000000000..47c247ef0c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch
@@ -0,0 +1,54 @@
+From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 24 Oct 2023 12:09:36 +1000
+Subject: [PATCH] dix: always initialize pScreen->CloseScreen
+
+CloseScreen is wrapped by the various modules, many of which do not
+check if they're the last ones unwrapping. This is fine if the order of
+those modules never changes but when it does we might get a NULL-pointer
+dereference by some naive code doing a
+
+   pScreen->CloseScreen = priv->CloseScreen;
+   free(priv);
+   return (*pScreen->CloseScreen)(pScreen);
+
+To avoid this set it to a default function that just returns TRUE that's
+guaranteed to be the last one.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586]
+CVE: CVE-2023-5574
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/dispatch.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index eaac39b7c9..cd092fd409 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] = {
+     3                           /* 64 bits per scanline pad unit */
+ };
+ 
++static Bool
++DefaultCloseScreen(ScreenPtr screen)
++{
++    return TRUE;
++}
++
+ /*
+ 	grow the array of screenRecs if necessary.
+ 	call the device-supplied initialization procedure
+@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i, Bool gpu)
+             PixmapWidthPaddingInfo[depth].notPower2 = 0;
+         }
+     }
++
++    pScreen->CloseScreen = DefaultCloseScreen;
++
+     return 0;
+ }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
index 43c06181e3..2e1d2529ab 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
@@ -2,6 +2,9 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           file://CVE-2023-5574-1.patch \
+           file://CVE-2023-5574-2.patch \
+           file://CVE-2023-5574-3.patch \
            "
 SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
 
-- 
2.25.1


