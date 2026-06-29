Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A8EC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38592.1782742835325758305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CiO9tNuj;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b77b150aso1063085e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742833; x=1783347633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qz1ZiYFdEDLjVgRWb0jfv6yfm0+ZUvmiKKAtWsWAmA=;
        b=CiO9tNujI5lVqCdzCr39g04x76nYBP5H92qawkcryDG0PVX6cqvUMy5alEQzRGvppI
         dAvqlSDXzljkABvPms/jJ66bvY9MGRh1NinPlqwtm93JGzeEtewdDs1iBi5LAA2vSw4X
         8L9CDUQguOQokvGdxdgW/bR5j0Qdkc6H0d0fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742833; x=1783347633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Qz1ZiYFdEDLjVgRWb0jfv6yfm0+ZUvmiKKAtWsWAmA=;
        b=nQTBo6yemCaYSYi7C76uGadcHkMLNT2kT+DlQuKKWMMB5PXDTnAg9r2RNrzH9t7gk2
         esiYFFUd+hglONkOyKMY4mOgN5PDSn3Pyw22iznu9tc/eA8Cw1MT1EhRR1+PDhi69NJy
         De/r0gQEO0Cnw9jsOTyQe1jHUujdTXJZRlr2W+u2Kh9BxFhbNYaybKj5DLti20p/otPC
         n/dRV1Rjj7+2PtDZufIvrh4+zk4y8w+PLW4ypqOBU79gT0StzkHDJf+H8mwaVaYUrifk
         ulyxJP94L/mouu3nq2Q+jhiKcLa7cdt2LBvkuJhCi1gkhVUXuUyR3ncwrcYtksqw1XMz
         WRXw==
X-Gm-Message-State: AOJu0Yztl/cibLRftB/sdVVeWiSR6BA8R6awVZLRdxuqb39rsOtvVCD3
	sqAzicUrkEED4XoynygdOiveo/Wz7EJXwTz55kQ6oi+bDc21fOeYtBEhwrzlTKeejDYlzAnOHu9
	hgu1ccoQ=
X-Gm-Gg: AfdE7cmBH6b9kl2Bfl8CQDXUbwb0r5wAQKmpWVz+5Q8fqjkqwcNX0e1QhWET2flBO/d
	8vJ/bISUIo6rIkTKaZ7y1YIXDZuUQmr+f0uAifLj66EG3O+Jby3QsanJOJH5Sl8knHvVfoGil7G
	yA4TZdk10hEElBkyYo8aIYx3hHJAAK7ogmgbydYlqeECzJDuRGHltANXp1okKI/9IRhGagrGUZ2
	tcJtInSnXzNfBef15PupSJY55ynjVSwvMAomXhbqIJ+1XjCJRjpNvSBeyzSkbLFLlrZ39qFUAES
	T+aTZNyt2BFhJbSmau/ppkKa2DEiG3p3moATSbI2TCgIIkvk+4ZJaQQ1a8sW3vdUdYH0OrXkuXs
	0wMcYqpkZh5nsBx8T85vVMcPSuxLdz52ya0TbKowNs8Nv5X7EwJQO93VIYWm9yCF96ynDadYo8Y
	gnd9OGc5x5bhfw+XuhjKnf+cXyUIjjjptAlLl+HmM5pS3V5teuzZWVoFywgHUhRM9Wxy5XBoC6v
	q9MEWh6ydScUAe5zI/wZwY=
X-Received: by 2002:a05:600c:6097:b0:493:b55f:bca4 with SMTP id 5b1f17b1804b1-493b55fbd29mr29501375e9.29.1782742833517;
        Mon, 29 Jun 2026 07:20:33 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/19] xwayland: Fix CVE-2026-34000
Date: Mon, 29 Jun 2026 16:19:55 +0200
Message-ID: <8d7485642161722dcfead25ef8d84ac316a10169.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239798

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://lists.x.org/archives/xorg-announce/2026-April/003679.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-34000

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/xwayland/CVE-2026-34000.patch    | 72 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch
new file mode 100644
index 00000000000..7ce7cfa80c0
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2026-34000.patch
@@ -0,0 +1,72 @@
+From 81b6a34f90b28c32ad499a78a4f391b7c06daea2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 18 Feb 2026 16:03:11 +0100
+Subject: [PATCH] xkb: Fix bounds check in _CheckSetGeom()
+
+As reported by valgrind:
+
+  == Conditional jump or move depends on uninitialised value(s)
+  ==    at 0x5CBE66: SrvXkbAddGeomKeyAlias (XKBGAlloc.c:585)
+  ==    by 0x5AC7D5: _CheckSetGeom (xkb.c:5607)
+  ==    by 0x5AC952: _XkbSetGeometry (xkb.c:5643)
+  ==    by 0x5ACB58: ProcXkbSetGeometry (xkb.c:5684)
+  ==    by 0x5B0DAC: ProcXkbDispatch (xkb.c:7070)
+  ==    by 0x4A28C5: Dispatch (dispatch.c:553)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+  ==  Uninitialised value was created by a heap allocation
+  ==    at 0x4840B26: malloc (vg_replace_malloc.c:447)
+  ==    by 0x5E13B0: AllocateInputBuffer (io.c:981)
+  ==    by 0x5E05CD: InsertFakeRequest (io.c:516)
+  ==    by 0x4AA860: NextAvailableClient (dispatch.c:3629)
+  ==    by 0x5DE0D7: AllocNewConnection (connection.c:628)
+  ==    by 0x5DE2C6: EstablishNewConnections (connection.c:692)
+  ==    by 0x5DE600: HandleNotifyFd (connection.c:809)
+  ==    by 0x5E2598: ospoll_wait (ospoll.c:660)
+  ==    by 0x5DA00C: WaitForSomething (WaitFor.c:208)
+  ==    by 0x4A26E5: Dispatch (dispatch.c:493)
+  ==    by 0x4B0B24: dix_main (main.c:274)
+  ==    by 0x42915E: main (stubmain.c:34)
+
+Each key alias entry contains two key names (the alias and the real key
+name), each of size XkbKeyNameLength.
+
+The current bounds check only validates the first name, allowing
+XkbAddGeomKeyAlias to potentially read uninitialized memory when
+accessing the second name at &wire[XkbKeyNameLength].
+
+To fix this, change the value to check to use 2 * XkbKeyNameLength to
+validate the bounds.
+
+CVE-2026-34000, ZDI-CAN-28679
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with TrendAI Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Acked-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2176>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/81b6a34f90b28c32ad499a78a4f391b7c06daea2]
+CVE: CVE-2026-34000
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/xkb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 2b9004a..1ba638b 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5603,7 +5603,7 @@ _CheckSetGeom(XkbGeometryPtr geom, xkbSetGeometryReq * req, ClientPtr client)
+     }
+ 
+     for (i = 0; i < req->nKeyAliases; i++) {
+-        if (!_XkbCheckRequestBounds(client, req, wire, wire + XkbKeyNameLength))
++        if (!_XkbCheckRequestBounds(client, req, wire, wire + 2 * XkbKeyNameLength))
+                 return BadLength;
+ 
+         if (XkbAddGeomKeyAlias(geom, &wire[XkbKeyNameLength], wire) == NULL)
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 65f1ed2ae07..1a076ab552f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-62230-0002.patch \
            file://CVE-2025-62231.patch \
            file://CVE-2026-33999.patch \
+           file://CVE-2026-34000.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 

