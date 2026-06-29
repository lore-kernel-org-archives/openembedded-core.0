Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A751C44508
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93239.1782742837883045142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eZMTHvhs;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46db1eb3100so361240f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742836; x=1783347636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8ywHwmyAuiBl3RYyDgTSudSWXHHyKBmXCQsp22FxcI=;
        b=eZMTHvhsSV9zQ2wK6z1iv2h7dVTQsJWYffMl03MArjfdZrZ3uvJTJvWHNUtTQ/41P3
         VJMXhHpCe1maNgo5fs6WPoh/niAmT4ZNagxwf0XXa0+W0PBgWd70SD3xhvsQOgzq/kAb
         dEtOBEP+r4Qqu9QxbCuBW8VaGIbVsoamqwvUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742836; x=1783347636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I8ywHwmyAuiBl3RYyDgTSudSWXHHyKBmXCQsp22FxcI=;
        b=nWBv/z0eGvdQGltShrcJJmWmFGdyFH/8sENd/62/CrZZgw3Gv/dSJIDpmlpGqn8rlq
         yWnIAqLYaeHY0P3b6x6U6/SxEHC3avLfW88tTJnDuaKfe5sp9TJZvOITleNgOn1zaWMk
         V9rc//MSzC6JT+GBnSdDycteIjXSxGiU/66vQ36pBNcGFWxzlXLIC5PV7wXWnCPuYcLH
         imjxsUlbVpxFAOw1bCSpXhK3iCblx+s6yZ7jLi2nEoINBTwGLsD6AJdbZIMTkOOjZmXk
         yZ7t/kHrAzDQlBL1PVWfAr2LXJMoResMY66Az2+WLIF46zW6lA7LYcNxVv3Afz1ziyT7
         y54Q==
X-Gm-Message-State: AOJu0YxqiApaFhPxKCvG5x9fWcSICcLN1h1Y6emI5SGCK0nvNc8ZvsY1
	QsKbQ6TrepTJAXU0nsLBtxzoesUeD/9aofFrWeEoSKVD2ky0Xh8sxl+/o4GajDBC0xpBqDX73LE
	DKZ0skHM=
X-Gm-Gg: AfdE7cnbMW7vgGe8chpjp5vmMRMxAS1sMAr+6ecsQpVgt04bE9tqWnGP9/RtgvoW2ub
	1D94vqd7GlIy8aUn8AzFKRIJfhVaOzKrkTRXzo8ClHysUr3KZu+7LJ2x0frF8sSMKwZ1r274waJ
	Vf1thURh/DqMhXUUMJx+kohOxT/xa1YUfXZxGuhS76W9LI+4yoMjHQqNeQamkCMtWMi0TptNh/S
	KzqGn7qVFWBrcy2E8LwzEUKSukPQg7Zl4VQDrYKs9cAMYG9i6WkR8RHeyNLRIVvJGxvsc2OW4v4
	gVHQECcGAkL+BEu7/BlJ5O56tulYeKt4bFaWY8RNKmlKer0iB0SJkkfsVtghMuoG8dUdgkToY22
	jryAvBvLKTY0BZEk+ycHVPezelxldy9vBQytHS9mGQ1lOwY8q3Zljibg4o1UN6MdigJxDi0bRgT
	ZTLIThpyqWEF+ji/zWRXziKMJxBbsrVAvqZNT7lz3XZ6okAmILNmHLh0xMj57cX4XLJb2J4BXGe
	eNPqJmOaOA9pAj9igotWQI=
X-Received: by 2002:a05:6000:4b0b:b0:470:80f7:9ef with SMTP id ffacd0b85a97d-47080f70cb1mr13247665f8f.19.1782742835996;
        Mon, 29 Jun 2026 07:20:35 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/19] xwayland: Fix CVE-2026-34002
Date: Mon, 29 Jun 2026 16:19:57 +0200
Message-ID: <d9656559ca24cdebbea49c9ce76bc1841b46b773.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239800

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/xwayland/CVE-2026-34002.patch    | 93 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch
new file mode 100644
index 00000000000..131caefcd5e
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34002.patch
@@ -0,0 +1,93 @@
+From f056ce1cc96ed9261052c31524162c78e458f98c Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Feb 2026 17:02:09 +0100
+Subject: [PATCH] xkb: Fix out-of-bounds read in CheckModifierMap()
+
+As reported by valgrind:
+
+  == Conditional jump or move depends on uninitialised value(s)
+  ==    at 0x547E5B: CheckModifierMap (xkb.c:1972)
+  ==    by 0x54A086: _XkbSetMapChecks (xkb.c:2574)
+  ==    by 0x54A845: ProcXkbSetMap (xkb.c:2741)
+  ==    by 0x556EF4: ProcXkbDispatch (xkb.c:7048)
+  ==    by 0x454A8C: Dispatch (dispatch.c:553)
+  ==    by 0x462CEB: dix_main (main.c:274)
+  ==    by 0x405EA7: main (stubmain.c:34)
+  ==  Uninitialised value was created by a heap allocation
+  ==    at 0x4840B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x592D5A: AllocateInputBuffer (io.c:981)
+  ==    by 0x591F77: InsertFakeRequest (io.c:516)
+  ==    by 0x45CA27: NextAvailableClient (dispatch.c:3629)
+  ==    by 0x58FA81: AllocNewConnection (connection.c:628)
+  ==    by 0x58FC70: EstablishNewConnections (connection.c:692)
+  ==    by 0x58FFAA: HandleNotifyFd (connection.c:809)
+  ==    by 0x593F42: ospoll_wait (ospoll.c:660)
+  ==    by 0x58B9B6: WaitForSomething (WaitFor.c:208)
+  ==    by 0x4548AC: Dispatch (dispatch.c:493)
+  ==    by 0x462CEB: dix_main (main.c:274)
+  ==    by 0x405EA7: main (stubmain.c:34)
+
+The issue is that the loop in CheckModifierMap() reads from wire without
+verifying that the data is within the request bounds.
+
+The req->totalModMapKeys value could exceed the actual data provided,
+causing reads of uninitialized memory.
+
+To fix that issue, we add a bounds check using _XkbCheckRequestBounds,
+but for that, we need to also pass a ClientPtr parameter, which is not
+a problem since CheckModifierMap() is a private, static function.
+
+CVE-2026-34002, ZDI-CAN-28737
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/f056ce1cc96ed9261052c31524162c78e458f98c]
+CVE: CVE-2026-34002
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 1ba638b..3fcc6c4 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1940,8 +1940,8 @@ CheckKeyExplicit(XkbDescPtr xkb,
+ }
+ 
+ static int
+-CheckModifierMap(XkbDescPtr xkb, xkbSetMapReq * req, CARD8 **wireRtrn,
+-                 int *errRtrn)
++CheckModifierMap(ClientPtr client, XkbDescPtr xkb, xkbSetMapReq * req,
++                 CARD8 **wireRtrn, int *errRtrn)
+ {
+     register CARD8 *wire = *wireRtrn;
+     CARD8 *start;
+@@ -1965,6 +1965,10 @@ CheckModifierMap(XkbDescPtr xkb, xkbSetMapReq * req, CARD8 **wireRtrn,
+     }
+     start = wire;
+     for (i = 0; i < req->totalModMapKeys; i++, wire += 2) {
++	if (!_XkbCheckRequestBounds(client, req, wire, wire + 2)) {
++	    *errRtrn = _XkbErrCode3(0x64, req->totalModMapKeys, i);
++	    return 0;
++	}
+         if ((wire[0] < first) || (wire[0] > last)) {
+             *errRtrn = _XkbErrCode4(0x63, first, last, wire[0]);
+             return 0;
+@@ -2568,7 +2572,7 @@ _XkbSetMapChecks(ClientPtr client, DeviceIntPtr dev, xkbSetMapReq * req,
+         return BadValue;
+     }
+     if ((req->present & XkbModifierMapMask) &&
+-        (!CheckModifierMap(xkb, req, (CARD8 **) &values, &error))) {
++        (!CheckModifierMap(client, xkb, req, (CARD8 **) &values, &error))) {
+         client->errorValue = error;
+         return BadValue;
+     }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 800d0a8f634..e7412e20116 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2026-33999.patch \
            file://CVE-2026-34000.patch \
            file://CVE-2026-34001.patch \
+           file://CVE-2026-34002.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 

