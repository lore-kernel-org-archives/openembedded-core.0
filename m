Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859FCC282C5
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:11 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.17028.1740678009833705205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q/tFpE0G;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22185cddbffso42283225ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678009; x=1741282809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlllOLRItte/PO9Y44JzXXP+9+M1ZNcaIQeM+4tzZDE=;
        b=q/tFpE0G73TYHNucPAPhMNlLSzqs4o/x2zQnr88cFESzwl0Jyv0Pe7FhV1opE3zOjp
         6PWN6OiO5IwMmfTV3d/ygry+/+MeD/OY15xGhe8mLFYNBZ9vyjogViAPG6xGsuOFLYdy
         bd4E29BpjRk0C8YsNosIS6o+W2WOoA+5t3pD/+3ekSHnHQWMclGQPDFYpcvftkZmK1bK
         PgJZIrloIMgDQ7Cher8sHyJe30FhLukvNOZ2PBNPVtHUWhTyOn2VLBiIwq3T5YdIzV22
         9a70QH0b4LPYzKHnX3s3Z90mGf2fnO9PHQZB6kt9iC/e2puC98vXiDDphYRMiPHS3i5Q
         HHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678009; x=1741282809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlllOLRItte/PO9Y44JzXXP+9+M1ZNcaIQeM+4tzZDE=;
        b=QLSw2vJx7PsMpYW5eib51BTWZARLZPKwd8ROYyzQ5+GmF8K1QjLp+QyK04S4uDWdJk
         Yjti/qmGUsqDdFrJEmlcTtnwH5Qh3i5Ry5lwLi7AZY4WBIM0Uz7NuizKYNBAiEHQp/b/
         4Eb5G4lLVBjlRwt8GjORlGoLmVcYFXAj1STJ1OrDRq6+KZTY8r+V0Idm0n4nDu1I8GDu
         w45FaxmVS77I52ZW0iY07mMzXmKefJl+TBtlSP+8Tvnuo6VmRwo3S7QI7WGCPe4occqd
         0SD5t3z3HWdxkdOX9n9tVfDLWb5qN+/ndxmI+dwAPqpGxxCtVo6/w0BkSvBxxtMPQlbO
         IhSA==
X-Gm-Message-State: AOJu0Yyavy10BKrULchSTXSW7SeAfrOXRG7Gq4O+Zs95QE/A2novSVcw
	S8vffXSnRlxmdmArYL9dnklo1ZDio/g+8BEjzCQahq6elyNwGYB3h61cSXqjXHjjsf/HfNcUlLK
	j
X-Gm-Gg: ASbGnct78VTiP6IqxlNPIsLSqivJLXG6Li/O7DCZR+faPCZaCqzhPjNBGhnB2YJdoUD
	9r5BZPzp3eux6x03zeqEQYjuGMDqgcA869AU2vLVlu4z5u5JoOzul56ZZ46n9g0W75pwsQ/GQv3
	tHr9UaRauqVwgefB1GImAeb24uJCwPicNUe4we0bt58KzjHZc3O6SZoazi6nT/mI9irnJZnGhaY
	LKOcYdY2iRPKDkr332+48R6jQ+lHpSeYrhC14U/iWzbevmB88NavjefiBVj6N3NA7qoW59V9bqI
	A6Ewnyf6WOZw1VMNow==
X-Google-Smtp-Source: AGHT+IHIm7RQmxVxRJgrJ0vBK3MKX6RkpeETAWJmu6A67G8ZouBgGkGY+NZxJACsUXOfcy0YZUqD4A==
X-Received: by 2002:aa7:8207:0:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-7349d1ec1a1mr6689128b3a.5.1740678008940;
        Thu, 27 Feb 2025 09:40:08 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] xserver-xorg: Fix for CVE-2025-26599
Date: Thu, 27 Feb 2025 09:39:41 -0800
Message-ID: <c013fec3e5dd86544366308f53a031b080b140c6.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212028

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26599-1.patch       |  66 +++++++++
 .../xserver-xorg/CVE-2025-26599-2.patch       | 129 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-1.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-2.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-1.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-1.patch
new file mode 100644
index 0000000000..60b68a0d9a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-1.patch
@@ -0,0 +1,66 @@
+From c1ff84bef2569b4ba4be59323cf575d1798ba9be Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Tue, 17 Dec 2024 15:19:45 +0100
+Subject: [PATCH] composite: Handle failure to redirect in compRedirectWindow()
+
+The function compCheckRedirect() may fail if it cannot allocate the
+backing pixmap.
+
+In that case, compRedirectWindow() will return a BadAlloc error.
+
+However that failure code path will shortcut the validation of the
+window tree marked just before, which leaves the validate data partly
+initialized.
+
+That causes a use of uninitialized pointer later.
+
+The fix is to not shortcut the call to compHandleMarkedWindows() even in
+the case of compCheckRedirect() returning an error.
+
+CVE-2025-26599, ZDI-CAN-25851
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be]
+CVE: CVE-2025-26599
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ composite/compalloc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/composite/compalloc.c b/composite/compalloc.c
+index eaabf0d..0bbbc55 100644
+--- a/composite/compalloc.c
++++ b/composite/compalloc.c
+@@ -140,6 +140,7 @@ compRedirectWindow(ClientPtr pClient, WindowPtr pWin, int update)
+     CompScreenPtr cs = GetCompScreen(pWin->drawable.pScreen);
+     WindowPtr pLayerWin;
+     Bool anyMarked = FALSE;
++    int status = Success;
+ 
+     if (pWin == cs->pOverlayWin) {
+         return Success;
+@@ -218,13 +219,13 @@ compRedirectWindow(ClientPtr pClient, WindowPtr pWin, int update)
+ 
+     if (!compCheckRedirect(pWin)) {
+         FreeResource(ccw->id, RT_NONE);
+-        return BadAlloc;
++        status = BadAlloc;
+     }
+ 
+     if (anyMarked)
+         compHandleMarkedWindows(pWin, pLayerWin);
+ 
+-    return Success;
++    return status;
+ }
+ 
+ void
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-2.patch
new file mode 100644
index 0000000000..252b033261
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26599-2.patch
@@ -0,0 +1,129 @@
+From b07192a8bedb90b039dc0f70ae69daf047ff9598 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 13 Jan 2025 16:09:43 +0100
+Subject: [PATCH] composite: initialize border clip even when pixmap alloc
+ fails
+
+If it fails to allocate the pixmap, the function compAllocPixmap() would
+return early and leave the borderClip region uninitialized, which may
+lead to the use of uninitialized value as reported by valgrind:
+
+ Conditional jump or move depends on uninitialised value(s)
+    at 0x4F9B33: compClipNotify (compwindow.c:317)
+    by 0x484FC9: miComputeClips (mivaltree.c:476)
+    by 0x48559A: miValidateTree (mivaltree.c:679)
+    by 0x4F0685: MapWindow (window.c:2693)
+    by 0x4A344A: ProcMapWindow (dispatch.c:922)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+  Uninitialised value was created by a heap allocation
+    at 0x4841866: malloc (vg_replace_malloc.c:446)
+    by 0x4F47BC: compRedirectWindow (compalloc.c:171)
+    by 0x4FA8AD: compCreateWindow (compwindow.c:592)
+    by 0x4EBB89: CreateWindow (window.c:925)
+    by 0x4A2E6E: ProcCreateWindow (dispatch.c:768)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+
+ Conditional jump or move depends on uninitialised value(s)
+    at 0x48EEDBC: pixman_region_translate (pixman-region.c:2233)
+    by 0x4F9255: RegionTranslate (regionstr.h:312)
+    by 0x4F9B7E: compClipNotify (compwindow.c:319)
+    by 0x484FC9: miComputeClips (mivaltree.c:476)
+    by 0x48559A: miValidateTree (mivaltree.c:679)
+    by 0x4F0685: MapWindow (window.c:2693)
+    by 0x4A344A: ProcMapWindow (dispatch.c:922)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+  Uninitialised value was created by a heap allocation
+    at 0x4841866: malloc (vg_replace_malloc.c:446)
+    by 0x4F47BC: compRedirectWindow (compalloc.c:171)
+    by 0x4FA8AD: compCreateWindow (compwindow.c:592)
+    by 0x4EBB89: CreateWindow (window.c:925)
+    by 0x4A2E6E: ProcCreateWindow (dispatch.c:768)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+
+ Conditional jump or move depends on uninitialised value(s)
+    at 0x48EEE33: UnknownInlinedFun (pixman-region.c:2241)
+    by 0x48EEE33: pixman_region_translate (pixman-region.c:2225)
+    by 0x4F9255: RegionTranslate (regionstr.h:312)
+    by 0x4F9B7E: compClipNotify (compwindow.c:319)
+    by 0x484FC9: miComputeClips (mivaltree.c:476)
+    by 0x48559A: miValidateTree (mivaltree.c:679)
+    by 0x4F0685: MapWindow (window.c:2693)
+    by 0x4A344A: ProcMapWindow (dispatch.c:922)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+  Uninitialised value was created by a heap allocation
+    at 0x4841866: malloc (vg_replace_malloc.c:446)
+    by 0x4F47BC: compRedirectWindow (compalloc.c:171)
+    by 0x4FA8AD: compCreateWindow (compwindow.c:592)
+    by 0x4EBB89: CreateWindow (window.c:925)
+    by 0x4A2E6E: ProcCreateWindow (dispatch.c:768)
+    by 0x4A25B5: Dispatch (dispatch.c:560)
+    by 0x4B082A: dix_main (main.c:282)
+    by 0x429233: main (stubmain.c:34)
+
+Fix compAllocPixmap() to initialize the border clip even if the creation
+of the backing pixmap has failed, to avoid depending later on
+uninitialized border clip values.
+
+Related to CVE-2025-26599, ZDI-CAN-25851
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8]
+CVE: CVE-2025-26599
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ composite/compalloc.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/composite/compalloc.c b/composite/compalloc.c
+index 7cf7351e00..4a1243170d 100644
+--- a/composite/compalloc.c
++++ b/composite/compalloc.c
+@@ -605,9 +605,12 @@ compAllocPixmap(WindowPtr pWin)
+     int h = pWin->drawable.height + (bw << 1);
+     PixmapPtr pPixmap = compNewPixmap(pWin, x, y, w, h);
+     CompWindowPtr cw = GetCompWindow(pWin);
++    Bool status;
+ 
+-    if (!pPixmap)
+-        return FALSE;
++    if (!pPixmap) {
++        status = FALSE;
++        goto out;
++    }
+     if (cw->update == CompositeRedirectAutomatic)
+         pWin->redirectDraw = RedirectDrawAutomatic;
+     else
+@@ -621,14 +624,16 @@ compAllocPixmap(WindowPtr pWin)
+         DamageRegister(&pWin->drawable, cw->damage);
+         cw->damageRegistered = TRUE;
+     }
++    status = TRUE;
+ 
++out:
+     /* Make sure our borderClip is up to date */
+     RegionUninit(&cw->borderClip);
+     RegionCopy(&cw->borderClip, &pWin->borderClip);
+     cw->borderClipX = pWin->drawable.x;
+     cw->borderClipY = pWin->drawable.y;
+ 
+-    return TRUE;
++    return status;
+ }
+ 
+ void
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 5b77dad16a..e50d7bfb9e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -28,6 +28,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26596.patch \
            file://CVE-2025-26597.patch \
            file://CVE-2025-26598.patch \
+           file://CVE-2025-26599-1.patch \
+           file://CVE-2025-26599-2.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.43.0


