Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F4DCD98F4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10393.1781682336126041515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ylMEZYMq;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490c1915793so44872445e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682334; x=1782287134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgTdz/CV4fckN6LEbgUM5Q2U0YSBxOmfSG9Yc6SLjL8=;
        b=ylMEZYMqJrQ2+qPynyuWjGoB8g75JJtXgG26+jmI3p8b2itWBUaNxMitptfezDa2BK
         5vuUxOxAXUF2xLFTZJ30lYVd42HnWMsQG/HN76JqucxzAl7GSqxzNnUl6QjTv+vJHVZP
         3dPVXra/853TB7tb7Vf90BcLbkatVSYszEd5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682334; x=1782287134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgTdz/CV4fckN6LEbgUM5Q2U0YSBxOmfSG9Yc6SLjL8=;
        b=Z6XJUSLPSJTNph31qnu3ZKc4WhIHdNSE8Tec9nrgXBZ3HQVf88PuokffOiT3WoYekY
         iNtg97DlgLD+mE9agKLFk2hWxhc/zmlDnJZUVj7iFTIAK7IIu4jyH+mEDTYTclg/jg9B
         LO/7A94cM9XeYPWp5qgXW1db+H4oZk2Iq1fojD/rJaE2Qi9UShI2KaKmRI/xxCHjDZnk
         tQzHroNjKS0IlHLOASvyVTySiBe0MO+dTq2lUCsfG3Y35pE3x3Ho0mnlvg7EXqPqqFQI
         KqwweWcR7b43PSaRqv0nr3aLi2xKPAEJvq83wzMcUbKWhr4pJdQyQ+VyD/nPZc0+SS3Y
         2Mbg==
X-Gm-Message-State: AOJu0YzFnjncAhAXA1srWX7lLKyiS9GtqH8KiNXAG7kQtLAPeD/saipc
	nIiSxcy3giNJaJ+0+cbsqx4oKdz7crVOWRUQz2QCnCiaozgjmSHIkCLDH6mH57kEKsf2sdq8m4v
	x37q/
X-Gm-Gg: Acq92OGOEG6+9gQJ2Y8dO4Jpc7qlY2BE3mTJcapBsycAjP2A33ovD2qXZ2gEp/UPgcj
	wbCIRS2DFyZbminybi6El51Tmcz0VcN2aqkswBMBN8peT40TXbTCf8qKFjLC1bQg2L5o0LF2+v5
	KgcJcCCB3hGYO5Uzqvz7DQMmDUdn4yyRRWd9f51uQQy6DrtiRZRE/QGNCsaVAKXy/mnd90zwgks
	CjYFEqBWTdICjlxgvQmvsGe8ssEtHoy6z9D9b9JmwlU0aYGwLqSwI6Sh9sP7+D6nprHun5ppzgV
	/pEF+75y96DgOgeeCgjQ6ezYOV6+K7mvgf92QMcIB0rjhA75MBaEzEZNrf4Vn1PCHeVys3gfBmS
	SwMvDrOQtGDOTQMF3ofVqNRjjo46pFfRVgIc7Xphyn1ZXgD879pKYCDrLdtTbJPaZaDZUwAaF2X
	gPg1BaMrC+VJc3DRAPYMLwFn6Si4oOz/kLi/bqLy+bb4543b5qOC6zjJJHg3mqz/PXmyGmipk8E
	vLYwFuH0+UQ+JQEdA==
X-Received: by 2002:a7b:c3d1:0:b0:490:b92f:ef5b with SMTP id 5b1f17b1804b1-492341088b1mr20949675e9.13.1781682334319;
        Wed, 17 Jun 2026 00:45:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/30] xserver-xorg: Fix CVE-2026-34002
Date: Wed, 17 Jun 2026 09:44:48 +0200
Message-ID: <5c30b1e0dd0e1cb65091787c9c931d3d16c0f93c.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238995

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003677.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xserver-xorg/CVE-2026-34002.patch         | 93 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch
new file mode 100644
index 00000000000..131caefcd5e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2026-34002.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index dfed2c2437c..2f7edd16a19 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://CVE-2026-33999.patch \
             file://CVE-2026-34000.patch \
             file://CVE-2026-34001.patch \
+            file://CVE-2026-34002.patch \
             "
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 

