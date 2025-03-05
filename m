Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA755C282DE
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:24 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.16718.1741190357223788023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XbPAvd3D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22355618fd9so123533075ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190356; x=1741795156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbffEdnI5LN+NWaYSIZp4R0kUXtFq7TIJEg7kiG1nE4=;
        b=XbPAvd3DYGQ3gJCRUmHNuPx4a2OlzhBk/6hS9At4zNJT6+2o1DDTBNuVvI7x1OYUXy
         COs0LAa9MnipnnSfywOiaEuYyV4m6fnsStZsOUrXeyu570O6gcXz6jx1SXNUKXfRznJY
         ydmB7i6uAYDJe28z6iaJ50QjECZ6jxRwSoWtAnmTejywGSrFFPV0r+OAvxgAbHIHMlrG
         OdRJjgx8Y6adq1kyg9+cbkWc1fCLW+fgOQBILk+kMWCygqi84+Yi9Rzi8aF6CdI5xc6d
         sjAIOQrkvWx5td0Wr/NH1J68z32o0xLZWzO4eqSHsDu5PBIzmW6dsvEbvfPVthgyfsZy
         ROHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190356; x=1741795156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbffEdnI5LN+NWaYSIZp4R0kUXtFq7TIJEg7kiG1nE4=;
        b=hc9kx4VarZq/SzZFH9wLoSRsxPTPNcOjKjxuaIoIrPCzaV9LCefXY1XQcojUWA+9n3
         sI7NtKmvfYqLK6ic5PsG7lEEOIgkW6YpOzi6Zualb/9YC5koUcZ+iBbgCPWc34DbQ70+
         1fvFYlDltpLX1K/0n0Vb7hgXtLSvdjcEQ7esFcaMLB5BqU7Ar9qGeFGivNsm9zP7Ji2l
         A8H2/kAjFnT1IFvWEhDj8UAXa0X9BclIbXpb3+VDdOaMTf6/MVdNt5OPb4+ZJCJgr4o4
         CFYKe5LOhM4VnHcO//kyD/ex6ENw+Eu2l8A4HHv/M5aSBYF57uoF4KBf7t75SJE3pvUR
         0ebA==
X-Gm-Message-State: AOJu0Yz7SxieE+3rHPZbFPFv42YzSp7m/L4yyIQCE8x7khVhIHAkIs/R
	Y5cLbRa9JFhw03bu++Q4GcF0ld7tK5Z0pZ7rKvp9Q3E0PlRCLKug872rLujyhcNMYZBqtHZwgSA
	i
X-Gm-Gg: ASbGncsBByO3QowJ8YyTQyafGvXlXDt19o9pGnVhPVZLzoihATKZS9J4BQO+uU8521Z
	vMVjJDFcXy6HQF1o8gD1kRmbNk8qE1rqGSttvBkPEpqZSXaU/wRghewi339YVlPnthSVnxUPSut
	cwx4J1RYuZqoLC9ts+mi8wa9wQ9BHCMpbc8hG9E0mypV79REuyi/yCG82eAIT9tZUAhejwFR6K9
	YBHTFVt1wYJ+wqEAVqGBwgjRTYRWKyvG3j6I5q1Jh6e/opyyG6ZMl9qmNV+8idhyflsyUu1ejBN
	eFIPR5T0VSZ4Jf8RGHWJhgGib8xg9AUyzB0=
X-Google-Smtp-Source: AGHT+IGNwz7yZttNNj6TQ8oUNfZ9fFfufSUn1o43qUMkSNXRrPMqjal7W732GrADHrQVP+joZuYpyA==
X-Received: by 2002:a17:902:e54c:b0:223:26da:4b8e with SMTP id d9443c01a7336-223f1c6a8f7mr62082835ad.4.1741190356386;
        Wed, 05 Mar 2025 07:59:16 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] xwayland: Fix CVE-2025-26599
Date: Wed,  5 Mar 2025 07:58:42 -0800
Message-ID: <d79cd91d2abc1b0e9e1e47d18af140d351dce298.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212335

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


