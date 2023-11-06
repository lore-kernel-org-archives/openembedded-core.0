Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A10C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 05:47:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.48534.1699249643531700693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 21:47:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Qk9nomHK;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc30bf9e22so32502535ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Nov 2023 21:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699249642; x=1699854442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKjO50kWEWEE/dqHtDC4JBCWgTGLer7NeaZqxZ/82AY=;
        b=Qk9nomHKO6+n0B8GG1JiJ5eTc4TrKvlqc57/i7CggOZT14zqZiwMddCyutMoxD4Cco
         yjiJkerIKIkIRKc55356+3QKmLKYocXQO/M0XDv0HOxhri9IgDP5/1vI0UmquR5uXPTt
         elV20wVErb0mUcTj22ZBaBDuuF5dfwUUNDkaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699249642; x=1699854442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKjO50kWEWEE/dqHtDC4JBCWgTGLer7NeaZqxZ/82AY=;
        b=MF/moqHPaJUjMGuUNQPV9OXnjLd+cIFti8XPJ/1Hxv5TBn/AQ37JK8jZH5JbGxQgBe
         FZs947vJJxJJzUsJc6z14S1tvrndOjBnA9eyy8VhUCvIPU6aJX1T8szOQgbT416yQVlS
         GzT/BuIdNiaX7H2ZnyLEDJRtCvthMkqSO4KgjAd0NLTFjLcsyWaTInhJRTD1o4U8SH+c
         TSzS5rW+s01BZkRJsTz/Ui266C046Hh7YuSJhhFVsbFiuLn/XLIgXHFVwni13XMGu1g/
         QGoGy0Muxq8BpLuHGukJuuyoMGuMpb3RgtPDxlU49RyOkSCFABnSZVyIWPC1kbs13kxd
         R7tA==
X-Gm-Message-State: AOJu0YzIUKXgS7qgzPBU6hDkonTdIPLI4UTUGuIu1znOI+sJ5h6ujxqT
	BI31+9FKEVTZTBt77oShCdHQ1uOfJm3QLmxICPs=
X-Google-Smtp-Source: AGHT+IHIpaqi3dXd7aNRfYNqudzaS1dGDropinfMVT3+Mq8pauoUt31g+/E7pX8K9ogOE+4h7TQWfA==
X-Received: by 2002:a17:903:244e:b0:1cc:507c:edeb with SMTP id l14-20020a170903244e00b001cc507cedebmr13929844pls.0.1699249641977;
        Sun, 05 Nov 2023 21:47:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c01c:7c68:1109:1fee:ab02:8473])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c15500b001b8b2b95068sm4960968plj.204.2023.11.05.21.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 21:47:21 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] xserver-xorg: Fix for CVE-2023-5367 CVE-2023-5380 and CVE-2023-5574
Date: Mon,  6 Nov 2023 11:17:12 +0530
Message-Id: <20231106054712.810105-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190195

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f
&
https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2023-5367.patch          |  84 +++++++++++++
 .../xserver-xorg/CVE-2023-5380.patch          | 102 ++++++++++++++++
 .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ++++++++++++++++++
 .../xserver-xorg/CVE-2023-5574-2.patch        |  42 +++++++
 .../xserver-xorg/CVE-2023-5574-3.patch        |  54 +++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   5 +
 6 files changed, 400 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
new file mode 100644
index 0000000000..508588481e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5367.patch
@@ -0,0 +1,84 @@
+From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 3 Oct 2023 11:53:05 +1000
+Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
+
+The handling of appending/prepending properties was incorrect, with at
+least two bugs: the property length was set to the length of the new
+part only, i.e. appending or prepending N elements to a property with P
+existing elements always resulted in the property having N elements
+instead of N + P.
+
+Second, when pre-pending a value to a property, the offset for the old
+values was incorrect, leaving the new property with potentially
+uninitalized values and/or resulting in OOB memory writes.
+For example, prepending a 3 element value to a 5 element property would
+result in this 8 value array:
+  [N, N, N, ?, ?, P, P, P ] P, P
+                            ^OOB write
+
+The XI2 code is a copy/paste of the RandR code, so the bug exists in
+both.
+
+CVE-2023-5367, ZDI-CAN-22153
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a]
+CVE: CVE-2023-5367
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xiproperty.c    | 4 ++--
+ randr/rrproperty.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
+index 066ba21fba..d315f04d0e 100644
+--- a/Xi/xiproperty.c
++++ b/Xi/xiproperty.c
+@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property, Atom type,
+                 XIDestroyDeviceProperty(prop);
+             return BadAlloc;
+         }
+-        new_value.size = len;
++        new_value.size = total_len;
+         new_value.type = type;
+         new_value.format = format;
+ 
+@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property, Atom type,
+         case PropModePrepend:
+             new_data = new_value.data;
+             old_data = (void *) (((char *) new_value.data) +
+-                                  (prop_value->size * size_in_bytes));
++                                  (len * size_in_bytes));
+             break;
+         }
+         if (new_data)
+diff --git a/randr/rrproperty.c b/randr/rrproperty.c
+index c2fb9585c6..25469f57b2 100644
+--- a/randr/rrproperty.c
++++ b/randr/rrproperty.c
+@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom property, Atom type,
+                 RRDestroyOutputProperty(prop);
+             return BadAlloc;
+         }
+-        new_value.size = len;
++        new_value.size = total_len;
+         new_value.type = type;
+         new_value.format = format;
+ 
+@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom property, Atom type,
+         case PropModePrepend:
+             new_data = new_value.data;
+             old_data = (void *) (((char *) new_value.data) +
+-                                  (prop_value->size * size_in_bytes));
++                                  (len * size_in_bytes));
+             break;
+         }
+         if (new_data)
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
new file mode 100644
index 0000000000..720340d83b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5380.patch
@@ -0,0 +1,102 @@
+From 564ccf2ce9616620456102727acb8b0256b7bbd7 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 5 Oct 2023 12:19:45 +1000
+Subject: [PATCH] mi: reset the PointerWindows reference on screen switch
+
+PointerWindows[] keeps a reference to the last window our sprite
+entered - changes are usually handled by CheckMotion().
+
+If we switch between screens via XWarpPointer our
+dev->spriteInfo->sprite->win is set to the new screen's root window.
+If there's another window at the cursor location CheckMotion() will
+trigger the right enter/leave events later. If there is not, it skips
+that process and we never trigger LeaveWindow() - PointerWindows[] for
+the device still refers to the previous window.
+
+If that window is destroyed we have a dangling reference that will
+eventually cause a use-after-free bug when checking the window hierarchy
+later.
+
+To trigger this, we require:
+- two protocol screens
+- XWarpPointer to the other screen's root window
+- XDestroyWindow before entering any other window
+
+This is a niche bug so we hack around it by making sure we reset the
+PointerWindows[] entry so we cannot have a dangling pointer. This
+doesn't handle Enter/Leave events correctly but the previous code didn't
+either.
+
+CVE-2023-5380, ZDI-CAN-21608
+
+This vulnerability was discovered by:
+Sri working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/564ccf2ce9616620456102727acb8b0256b7bbd7]
+CVE: CVE-2023-5380
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/enterleave.h   |  2 --
+ include/eventstr.h |  3 +++
+ mi/mipointer.c     | 17 +++++++++++++++--
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/dix/enterleave.h b/dix/enterleave.h
+index 4b833d8..e8af924 100644
+--- a/dix/enterleave.h
++++ b/dix/enterleave.h
+@@ -58,8 +58,6 @@ extern void DeviceFocusEvent(DeviceIntPtr dev,
+ 
+ extern void EnterWindow(DeviceIntPtr dev, WindowPtr win, int mode);
+ 
+-extern void LeaveWindow(DeviceIntPtr dev);
+-
+ extern void CoreFocusEvent(DeviceIntPtr kbd,
+                            int type, int mode, int detail, WindowPtr pWin);
+ 
+diff --git a/include/eventstr.h b/include/eventstr.h
+index bf3b95f..2bae3b0 100644
+--- a/include/eventstr.h
++++ b/include/eventstr.h
+@@ -296,4 +296,7 @@ union _InternalEvent {
+ #endif
+ };
+ 
++extern void
++LeaveWindow(DeviceIntPtr dev);
++
+ #endif
+diff --git a/mi/mipointer.c b/mi/mipointer.c
+index 75be1ae..b12ae9b 100644
+--- a/mi/mipointer.c
++++ b/mi/mipointer.c
+@@ -397,8 +397,21 @@ miPointerWarpCursor(DeviceIntPtr pDev, ScreenPtr pScreen, int x, int y)
+ #ifdef PANORAMIX
+         && noPanoramiXExtension
+ #endif
+-        )
+-        UpdateSpriteForScreen(pDev, pScreen);
++        ) {
++            DeviceIntPtr master = GetMaster(pDev, MASTER_POINTER);
++            /* Hack for CVE-2023-5380: if we're moving
++             * screens PointerWindows[] keeps referring to the
++             * old window. If that gets destroyed we have a UAF
++             * bug later. Only happens when jumping from a window
++             * to the root window on the other screen.
++             * Enter/Leave events are incorrect for that case but
++             * too niche to fix.
++             */
++            LeaveWindow(pDev);
++            if (master)
++                LeaveWindow(master);
++            UpdateSpriteForScreen(pDev, pScreen);
++    }
+ }
+ 
+ /**
+-- 
+2.25.1
+
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
index 0000000000..4204be9bdd
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
+index 264622d..907e46a 100644
+--- a/mi/miscrinit.c
++++ b/mi/miscrinit.c
+@@ -242,10 +242,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /* pointer to screen bits */
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
+     /* QueryBestSize, SaveScreen, GetImage, GetSpans */
+-- 
+2.25.1
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index 5c604fa86e..deb5526902 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -16,6 +16,11 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2022-46344.patch \
            file://CVE-2023-0494.patch \
            file://CVE-2023-1393.patch \
+           file://CVE-2023-5367.patch \
+           file://CVE-2023-5380.patch \
+           file://CVE-2023-5574-1.patch \
+           file://CVE-2023-5574-2.patch \
+           file://CVE-2023-5574-3.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.25.1


