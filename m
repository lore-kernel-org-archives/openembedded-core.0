Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AD7C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.20503.1741090825853967329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gPUBpnSW;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22355618fd9so94060895ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090825; x=1741695625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bJeje5CwcwjMjX/a94zisPn8KD3gQQ0Z5yFXU7j5h8=;
        b=gPUBpnSWhi0J4ph3nUY7vr0mBEq+wpFYSDu/sFahDw+uWsN2ULVfBROhWtenwI/Xr0
         XsA6cQb/U7ZImOclaN20S3+PygygFsKxgqsTSC9l7rzUICAMKaleT8/8w3yuKK/h72PF
         3F95oxhvHfWFyfdZhN+Tcj/WhWLcRT0T5QM2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090825; x=1741695625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bJeje5CwcwjMjX/a94zisPn8KD3gQQ0Z5yFXU7j5h8=;
        b=QRmROzvre0yn1mQ5ttmlmxuyBpyUes8o4cDT13/cLv+Bpe60GkLq9NzuB/bNv+BDXq
         PTlj2cFREQBkUVDY+TJ3Bbd9L8UR7E0JZydpqrRimkqd3NXIgkE917xJ/Zyw7Xj9Qk4B
         dzxHZ4RhhgMbDlRYbxt6pUpxONEYfmngIDbAxB7cTX8kbAcx1xPUOg+FWBj1aSA/0i+t
         e3QDHHlTwdyBo+9Fzy+ML8LhHKPdMvn5725KOh8ngdYC+zFQGePwnkA1hL5gOYT9HI7J
         y/vhGvdNOAJJUMCWUCuXAI3QyMUGuDULe2RrdQmHhW3jSuNK5+4K8lGDEP380Ws/Ql8b
         ai1g==
X-Gm-Message-State: AOJu0YzSJ9mM8eJdeWdQKrQWf41usKq3wbtr7MokwoPdCAbL8DBL9arL
	OpOn2xDbs9sEBV2AlKR+gxVAprSmxbwBHPIRNA8eFyPQvzNlbNLVWqEYjbaANGFs5rPfuNSoFn9
	xNsU=
X-Gm-Gg: ASbGncslNraXK7KjH8VJES7CLZBKDEhJ+tJN4CLjyVAGo09ZH9ZQ6k8WtZtAaXwoxlF
	o2NpJfkatNWQ0ltmo9ZcC0LAXFoxYroL6cSRHDeMGp4zTgJo85jaMA3+OhWC/tjFoVqAngMZ8ft
	FQIi87DNLdo6JLSEUuGCN8IxAoopODTgIeVuh2EJK1lnmXb/xICzTPdryJ+gfigEhkaKTxaR8Jw
	YwXR6VCuS819t6/XSPdWOma3dSjcwrVg/RNRpKk52CD9H7MPRtPt+BTgYC5ZuU0/saoVFx+Y3iU
	IGKKvann2wUIU1HXfWlKQRBUB64ajoNUA7ZyHpzQ3KeWNhbqC06j/Q==
X-Google-Smtp-Source: AGHT+IENJ6/i8JMAtMtisIXGniNylM0uARhXg/jkepo6qygjtsoT4oTr45idDBvtcacS08MeBhVPnQ==
X-Received: by 2002:a05:6a20:729c:b0:1ee:db10:a4e1 with SMTP id adf61e73a8af0-1f2f4cacc9dmr28163508637.9.1741090823294;
        Tue, 04 Mar 2025 04:20:23 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:22 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 12/14] xwayland: Fix CVE-2025-26599
Date: Tue,  4 Mar 2025 17:49:16 +0530
Message-Id: <20250304121918.147345-12-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212277

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26599-1.patch  |  66 +++++++++
 .../xwayland/xwayland/CVE-2025-26599-2.patch  | 129 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-2.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-1.patch
new file mode 100644
index 0000000000..60b68a0d9a
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-1.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-2.patch
new file mode 100644
index 0000000000..252b033261
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26599-2.patch
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 9138e1dd0e..1e4a96f86f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -35,6 +35,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26596.patch \
            file://CVE-2025-26597.patch \
            file://CVE-2025-26598.patch \
+           file://CVE-2025-26599-1.patch \
+           file://CVE-2025-26599-2.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


