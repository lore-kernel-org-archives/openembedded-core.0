Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB97C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:49 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9471.1740659559875157403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UcvwCNzo;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22328dca22fso12126765ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659558; x=1741264358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbl/oM4Wll7eI9r4Ulc81pxLttxcsCkFGfg/DXfzvKk=;
        b=UcvwCNzocpB6MBWCoKHGTIwUS8Nu3LeuhhAS6OC6hrjaVFrZeaPvr39d8APaoVRZ7B
         OBRGcgehKllt5sYq05U3KzHesV+YJ7EdU+ZIQ9IofWPAjDnfFEl8m5IMxk+oRa9ODYIY
         s4bT/lNcPTosKK0GV5A9k7S5fpvNklxDzT6zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659558; x=1741264358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zbl/oM4Wll7eI9r4Ulc81pxLttxcsCkFGfg/DXfzvKk=;
        b=Zi6lbziRObYToj7c/cpP32h2S2JbVEqmExwjNOg3/KppwDon52Mw5ee6WKk+YT5wZ9
         Ny+UxOE9Kf3Lr9QMJetZSXiRnOVoogcPZeZDQNq08Mxr1dfbu6SQCL5u07j5S6ifAcX5
         o03mGI+YKApPH4rlL8aZRE5qc64BEQo3pZahH72Wa5Xp7j5q5DNpdce2iYynDHPb/UNc
         WAlSzUKd3nny7j3KaI1YhfIfzkMYJgzv5xebJ8ehnlhpbidlSNs2nmi0ezrSoYSlt6Bl
         3GzpiIT8PRXtN2EkIQfcrqOeRv46d1XaLur94uoftHvO+YDyYMLv8dYKpgWPEG0VU9P4
         3x5Q==
X-Gm-Message-State: AOJu0Yy4vY7/QZpQANn5r1J9XsozEKBijGn7dSKYSPzADK1Kq7q6tB/a
	N33ARQ/0Lhs/3MMMvEjzG69SNz44Q0QVQzX6pgB9QdmrNUFdWsr41Nsobcid1zWj5OGg7KDc6c5
	5BXQ=
X-Gm-Gg: ASbGncvzvsjpPyci5ixaJOWSl0aV5R1ihRTiU4wy28UBdfyN56iyzGLs40hLQoOLnuA
	LNn5LZ6uVh9mdC9v6RQwH1hf1pdMWOZZXpBpcmpXaw1oDClq+4tTVbqHR8zzBvPczLj46Aetp44
	CtkaDExhr4YVwV8/WZonpFs8l4TWZSTYWNFqCgUyz2GfGuhY+f+Plc0nIGuEFVZuyoyzQjsX9fw
	w9hv2TH03EhWTPUbwJ1FB3q5aHm0R4p2Vf5FZYwHAjjCYxZaUJTnNiZjI3oCvTytQj9pFuWu7rL
	B8PP1XSJBw3YH4OdcBmAJTD7DurTUZ6j+9Y=
X-Google-Smtp-Source: AGHT+IHu49nuEK4oD4ZSeK9hswaNCNCxi0c9Tenfsn1o1ttHfy93qc+3lVVmw/Sz/D3/0+1JeSEULg==
X-Received: by 2002:a17:902:f54a:b0:215:9bc2:42ec with SMTP id d9443c01a7336-22307e7279cmr154735085ad.47.1740659558498;
        Thu, 27 Feb 2025 04:32:38 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:37 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 6/9] xserver-xorg: Fix for CVE-2025-26599
Date: Thu, 27 Feb 2025 18:02:04 +0530
Message-Id: <20250227123207.270978-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211997

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
2.25.1


