Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B72C28B23
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:33:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.13084.1741181577019256443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Z83xI70z;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224019ad9edso6795795ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181576; x=1741786376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZI33fPh6TpmZYMEH7rUgV3mMWciFpMl3O3OzC5u93A=;
        b=Z83xI70z8TMC2vIbocgsEmUlqsOgBYNZZ81EbBVI9PKRgEr7Qpqqr5rmmBd2gb0+aN
         ITBY4oTguBpF7TX1AIC2kWgvs0Z7JuD1CARkW0ANdX12UpDvgVqP9hlxCVLuP+qJi185
         p92gDTWMboToYRr654QABphoJBobi4qL/fFqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181576; x=1741786376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZI33fPh6TpmZYMEH7rUgV3mMWciFpMl3O3OzC5u93A=;
        b=s3JQEloncIoA/8zGnCvoPKNTCX5Vv5FsPgEpnrO3J6dKGMvAegcD4G+YftOUJU1zhX
         Rgoh6e9AWUW+Z0xr7QIls2fJkVKtTrLUQKzp586xYLEvHkzkhjwrzb428uzC1oPYFo9d
         p0+f1+fi+L91aB+RALqCq/TGXV+BpFiJaMmwpC+wlW8NKIcin+wX72RMaUnpce9ivnjo
         3AM18NoKV5ir8SRdlHBqEmY4arOeIG81lCDX7dCMQ6Odky67Wl+g5v05eJgHUGZw55u/
         S35kaUMb/mXYAsOCjj5YqtmOdbCMEb/Jp/90E80Os9+FlTzoPaA7kprYSIcOKY3MaO9N
         AK/g==
X-Gm-Message-State: AOJu0Yz5O4iS7EBeRt1Fzhw5p6bUKNJXG+wZJvlBwE2zKSLe2YzH6rfU
	zO8lFOXv1ixAmiMH9aK0GzbBw+nGGb+I/940kieGqNJ8g0yk+lX7ZnXq+78x3Sg5coEMBGlhL9e
	PNhI=
X-Gm-Gg: ASbGncuGT1/UazSwBXtUpQXR2DEd7hcXC0jowS/JyQ7DeIGSFPNAyp/8HnrQ3+oh3fZ
	2LmaLmBiGvrhBl6MWGupTeIFFTYO06DLKjXeWgZch72XQIdd9bcKMABh81Xrj312Lsa7VY6sl96
	30B+dXKNigjOG0ScadpVCx9wqO81w6tlUOiS2WE99LH6tAt4shygWpSlTaxayj4rPk8Te148YrA
	ikQJ8HCb0dxzE6Udy/SbEXVWRdCEhWEziR+b7XqwgDg4cK2+BWig4zch+rjKbf2Oo272Pm8DIla
	X0W3dx5MDpJtiQBtzK61UiB7/dsh11M3aSpVsiDeyXxnPWOUa4yVo3c=
X-Google-Smtp-Source: AGHT+IEM8PiHItSyEw4Zd89JwFoH+q9DoaiYC/HsFOe/PDd9nVb7w91TIXgI3M0HRoLoOISSqx3lbA==
X-Received: by 2002:a05:6a00:21cc:b0:736:457b:9858 with SMTP id d2e1a72fcca58-73682b7405dmr4386344b3a.10.1741181575913;
        Wed, 05 Mar 2025 05:32:55 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:55 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 7/9] xwayland: Fix CVE-2025-26599
Date: Wed,  5 Mar 2025 19:02:12 +0530
Message-Id: <20250305133214.169364-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212313

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.freedesktop.org/xorg/xserver/-/commit/c1ff84be & https://gitlab.freedesktop.org/xorg/xserver/-/commit/b07192a8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26599-1.patch  |  66 +++++++++
 .../xwayland/xwayland/CVE-2025-26599-2.patch  | 129 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |   2 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index b46a02e5c3..cafddc62b5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26596.patch \
            file://CVE-2025-26597.patch \
            file://CVE-2025-26598.patch \
+           file://CVE-2025-26599-1.patch \
+           file://CVE-2025-26599-2.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


