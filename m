Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67C2C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:27:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16702.1699457263227673030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 07:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FAC41063;
	Wed,  8 Nov 2023 07:28:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6905C3F64C;
	Wed,  8 Nov 2023 07:27:42 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] Revert "xserver-xorg: Fix for CVE-2023-5574"
Date: Wed,  8 Nov 2023 15:27:41 +0000
Message-Id: <20231108152741.1920655-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190354

From: Ross Burton <ross.burton@arm.com>

These patches are not yet merged (so they're not backports) because they
have outstanding (undescribed) issues[1]. As this issue only affects
Xvfb and is a use-after-free with only a hypothetical attack, revert the
patches until the compromise is understood.

This reverts commit a193c0224a4100f2e75bfff40b0832758affeb45.

[1] https://lists.x.org/archives/xorg-announce/2023-October/003430.html

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xserver-xorg/CVE-2023-5574-1.patch        | 113 ------------------
 .../xserver-xorg/CVE-2023-5574-2.patch        |  42 -------
 .../xserver-xorg/CVE-2023-5574-3.patch        |  54 ---------
 .../xorg-xserver/xserver-xorg_21.1.9.bb       |   3 -
 4 files changed, 212 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
023-5574-1.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
023-5574-2.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
023-5574-3.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574=
-1.patch
deleted file mode 100644
index 9a8e583e780..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-1.pat=
ch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Thu, 12 Oct 2023 12:44:13 +1000
-Subject: [PATCH] fb: properly wrap/unwrap CloseScreen
-
-fbCloseScreen assumes that it overrides miCloseScreen (which just
-calls FreePixmap(screen->devPrivates)) and emulates that instead of
-wrapping it.
-
-This is a wrong assumption, we may have ShmCloseScreen in the mix too,
-resulting in leaks (see below). Fix this by properly setting up the
-CloseScreen wrapper.
-
-This means we no longer need the manual DestroyPixmap call in
-vfbCloseScreen, reverting d348ab06aae21c153ecbc3511aeafc8ab66d8303
-
-CVE-2023-5574, ZDI-CAN-21213
-
-This vulnerability was discovered by:
-Sri working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/1953f460b9ad1a9cdf0fcce70f6ad3310b713d5f]
-CVE: CVE-2023-5574
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- fb/fb.h             |  1 +
- fb/fbscreen.c       | 14 ++++++++++----
- hw/vfb/InitOutput.c |  7 -------
- 3 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/fb/fb.h b/fb/fb.h
-index d157b6956d..cd7bd05d21 100644
---- a/fb/fb.h
-+++ b/fb/fb.h
-@@ -410,6 +410,7 @@ typedef struct {
- #endif
-     DevPrivateKeyRec    gcPrivateKeyRec;
-     DevPrivateKeyRec    winPrivateKeyRec;
-+    CloseScreenProcPtr  CloseScreen;
- } FbScreenPrivRec, *FbScreenPrivPtr;
-=20
- #define fbGetScreenPrivate(pScreen) ((FbScreenPrivPtr) \
-diff --git a/fb/fbscreen.c b/fb/fbscreen.c
-index 4ab807ab50..c481033f98 100644
---- a/fb/fbscreen.c
-+++ b/fb/fbscreen.c
-@@ -29,6 +29,7 @@
- Bool
- fbCloseScreen(ScreenPtr pScreen)
- {
-+    FbScreenPrivPtr screen_priv =3D fbGetScreenPrivate(pScreen);
-     int d;
-     DepthPtr depths =3D pScreen->allowedDepths;
-=20
-@@ -37,9 +38,10 @@ fbCloseScreen(ScreenPtr pScreen)
-         free(depths[d].vids);
-     free(depths);
-     free(pScreen->visuals);
--    if (pScreen->devPrivate)
--        FreePixmap((PixmapPtr)pScreen->devPrivate);
--    return TRUE;
-+
-+    pScreen->CloseScreen =3D screen_priv->CloseScreen;
-+
-+    return pScreen->CloseScreen(pScreen);
- }
-=20
- Bool
-@@ -144,6 +146,7 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, i=
nt xsize, int ysize,
-                    int dpix, int dpiy, int width, int bpp)
- #endif
- {
-+    FbScreenPrivPtr screen_priv;
-     VisualPtr visuals;
-     DepthPtr depths;
-     int nvisuals;
-@@ -177,8 +180,11 @@ fbFinishScreenInit(ScreenPtr pScreen, void *pbits, =
int xsize, int ysize,
-                       rootdepth, ndepths, depths,
-                       defaultVisual, nvisuals, visuals))
-         return FALSE;
--    /* overwrite miCloseScreen with our own */
-+
-+    screen_priv =3D fbGetScreenPrivate(pScreen);
-+    screen_priv->CloseScreen =3D pScreen->CloseScreen;
-     pScreen->CloseScreen =3D fbCloseScreen;
-+
-     return TRUE;
- }
-=20
-diff --git a/hw/vfb/InitOutput.c b/hw/vfb/InitOutput.c
-index 48efb61b2f..076fb7defa 100644
---- a/hw/vfb/InitOutput.c
-+++ b/hw/vfb/InitOutput.c
-@@ -720,13 +720,6 @@ vfbCloseScreen(ScreenPtr pScreen)
-=20
-     pScreen->CloseScreen =3D pvfb->closeScreen;
-=20
--    /*
--     * fb overwrites miCloseScreen, so do this here
--     */
--    if (pScreen->devPrivate)
--        (*pScreen->DestroyPixmap) (pScreen->devPrivate);
--    pScreen->devPrivate =3D NULL;
--
-     return pScreen->CloseScreen(pScreen);
- }
-=20
---=20
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574=
-2.patch
deleted file mode 100644
index 2cdef752c73..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-2.pat=
ch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b6fe3f924aecac6d6e311673511ce61aa2f7a81f Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Thu, 12 Oct 2023 12:42:06 +1000
-Subject: [PATCH] mi: fix CloseScreen initialization order
-
-If SHM is enabled it will set the CloseScreen pointer, only to be
-overridden by the hardcoded miCloseScreen pointer. Do this the other way
-round, miCloseScreen is the bottom of our stack.
-
-Direct leak of 48 byte(s) in 2 object(s) allocated from:
-  #0 0x7f5ea3ad8cc7 in calloc (/lib64/libasan.so.8+0xd8cc7) (BuildId: d8=
f3addefe29e892d775c30eb364afd3c2484ca5))
-  #1 0x70adfb in ShmInitScreenPriv ../Xext/shm.c:213
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Reviewed-by: Adam Jackson <ajax@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/b6fe3f924aecac6d6e311673511ce61aa2f7a81f]
-CVE: CVE-2023-5574
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- mi/miscrinit.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mi/miscrinit.c b/mi/miscrinit.c
-index 3bb52b1bc6..b88938c9ae 100644
---- a/mi/miscrinit.c
-+++ b/mi/miscrinit.c
-@@ -249,10 +249,10 @@ miScreenInit(ScreenPtr pScreen, void *pbits,  /* p=
ointer to screen bits */
-     pScreen->numVisuals =3D numVisuals;
-     pScreen->visuals =3D visuals;
-     if (width) {
-+        pScreen->CloseScreen =3D miCloseScreen;
- #ifdef MITSHM
-         ShmRegisterFbFuncs(pScreen);
- #endif
--        pScreen->CloseScreen =3D miCloseScreen;
-     }
-     /* else CloseScreen */
-     /* QueryBestSize */
---=20
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-557=
4-3.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574=
-3.patch
deleted file mode 100644
index 47c247ef0c9..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2023-5574-3.pat=
ch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ab2c58ba4719fc31c19c7829b06bdba8a88bd586 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Tue, 24 Oct 2023 12:09:36 +1000
-Subject: [PATCH] dix: always initialize pScreen->CloseScreen
-
-CloseScreen is wrapped by the various modules, many of which do not
-check if they're the last ones unwrapping. This is fine if the order of
-those modules never changes but when it does we might get a NULL-pointer
-dereference by some naive code doing a
-
-   pScreen->CloseScreen =3D priv->CloseScreen;
-   free(priv);
-   return (*pScreen->CloseScreen)(pScreen);
-
-To avoid this set it to a default function that just returns TRUE that's
-guaranteed to be the last one.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/ab2c58ba4719fc31c19c7829b06bdba8a88bd586]
-CVE: CVE-2023-5574
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- dix/dispatch.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/dix/dispatch.c b/dix/dispatch.c
-index eaac39b7c9..cd092fd409 100644
---- a/dix/dispatch.c
-+++ b/dix/dispatch.c
-@@ -3890,6 +3890,12 @@ static int indexForScanlinePad[65] =3D {
-     3                           /* 64 bits per scanline pad unit */
- };
-=20
-+static Bool
-+DefaultCloseScreen(ScreenPtr screen)
-+{
-+    return TRUE;
-+}
-+
- /*
- 	grow the array of screenRecs if necessary.
- 	call the device-supplied initialization procedure
-@@ -3949,6 +3955,9 @@ static int init_screen(ScreenPtr pScreen, int i, B=
ool gpu)
-             PixmapWidthPaddingInfo[depth].notPower2 =3D 0;
-         }
-     }
-+
-+    pScreen->CloseScreen =3D DefaultCloseScreen;
-+
-     return 0;
- }
-=20
---=20
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
index 2e1d2529aba..43c06181e37 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
@@ -2,9 +2,6 @@ require xserver-xorg.inc
=20
 SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           file://CVE-2023-5574-1.patch \
-           file://CVE-2023-5574-2.patch \
-           file://CVE-2023-5574-3.patch \
            "
 SRC_URI[sha256sum] =3D "ff697be2011b4c4966b7806929e51b7a08e9d33800d50530=
5d26d9ccde4b533a"
=20
--=20
2.34.1


