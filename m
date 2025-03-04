Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D819EC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.20392.1741090820653994078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Tr4Y72PK;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2239aa5da08so40954175ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090820; x=1741695620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyJG0KXsKxF/XwzpP42LUVm4e186Tkt3CnYsQbpUGlY=;
        b=Tr4Y72PKNmG17nu6zOy3tZxyeqbopzHHWDHSNSW4Rq3hgCY2dXstbbVW97uo87hmQi
         sXADsqbryH/GmjvuCPBYx2FW62sqmKd8WAqkr+I/Pd4RtqTyopDdH/Wd/f9M1x7xwy/B
         FP3lRAfSQTxzOiwv7dn49JbMn9qt7QAN4M/jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090820; x=1741695620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyJG0KXsKxF/XwzpP42LUVm4e186Tkt3CnYsQbpUGlY=;
        b=dlDmCJaH8yssZksiNAAfatWOP9j2jWK5AJJKHAQN/tAbM/w6+0lW57gimwBdcQL+Br
         TXihQmjCTGbKJXYDoyZpDut4bzk5aQDkMQKdebQsEQngV1PWTdfW4mAV2jyLO13biLWB
         ltqSuJwUnGWw4Qf0qX0RI5m6QGhnd4soWPbaZAcuuYZCzRPM4Us1P8t9Z7y1O+HrJ1HG
         UULXRmDbbas/eMDRxJO6IBm2NKhX7RTs++h657y6lQJ76tZnwUGuL8dXSVJXw2bQ4vA0
         FyegGKad6aeC0TxqM8ygwtypK4MVTnGa/MScQMZ9b4lHuB3pGM9wFOFaNEwOqh9epBA/
         SsAQ==
X-Gm-Message-State: AOJu0Ywlw2nIyU60kMoy1z8gJa2pMafIrQ4FCKy1ncxdacxJFzB/85Qi
	96HcQwMKHTxTSwcSMEIBykxf1waLTuGTtPbxtTU9WTisH1wf8WCceSHwt+Zh3ot/0tZyk8CR9qz
	Bvn8=
X-Gm-Gg: ASbGncsoc4O7riPPpdXrG9WU0TB1M+gTpvIY4pllkmW/E5tege3AQDfop+Wjld/I3Cw
	2Q5LW7uZhV9L9AiwVwrvVaQXIGm5cutPo+cLb6yKyKlYXf4CsRUEsZIaIV/5h1yeE9PdekgwJRk
	Cy5xT4f4RmBrqPUatS4SG75GpH3GVrPccLHVhGYwvNdJ/bFuVsJQErqe6qTqlc1BEGPAacR0cdF
	o+8qf0lIDe4JaXNk/cOUdg6w+wdo5yElG07CdRJeN+oxMMJpBpk9t46bdMf5GXlFSzc4mHTLbzy
	tvzYsCU+HtO5Om1Nc5LPtQHrSuJKOUb6MQY+xe9C+tdEH0ckq0PyXA==
X-Google-Smtp-Source: AGHT+IE6DJmbCVK6g/27g2o42+sJw/E/gMb6jT7PloMWXVQSRw3oNb5fp0TI8lCxo9DM32RIk9pqfQ==
X-Received: by 2002:a05:6a21:789b:b0:1ee:e2e8:45bb with SMTP id adf61e73a8af0-1f2f4cc6570mr24751536637.11.1741090819634;
        Tue, 04 Mar 2025 04:20:19 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:18 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 11/14] xwayland: Fix CVE-2025-26598
Date: Tue,  4 Mar 2025 17:49:15 +0530
Message-Id: <20250304121918.147345-11-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212276

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26598.patch    | 120 ++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26598.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26598.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26598.patch
new file mode 100644
index 0000000000..210a76262a
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26598.patch
@@ -0,0 +1,120 @@
+From bba9df1a9d57234c76c0b93f88dacb143d01bca2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 16 Dec 2024 11:25:11 +0100
+Subject: [PATCH] Xi: Fix barrier device search
+
+The function GetBarrierDevice() would search for the pointer device
+based on its device id and return the matching value, or supposedly NULL
+if no match was found.
+
+Unfortunately, as written, it would return the last element of the list
+if no matching device id was found which can lead to out of bounds
+memory access.
+
+Fix the search function to return NULL if not matching device is found,
+and adjust the callers to handle the case where the device cannot be
+found.
+
+CVE-2025-26598, ZDI-CAN-25740
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a]
+CVE: CVE-2025-26598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xibarriers.c | 27 +++++++++++++++++++++++----
+ 1 file changed, 23 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xibarriers.c b/Xi/xibarriers.c
+index 700b2b8c53..6761bcb49a 100644
+--- a/Xi/xibarriers.c
++++ b/Xi/xibarriers.c
+@@ -132,14 +132,15 @@ static void FreePointerBarrierClient(struct PointerBarrierClient *c)
+ 
+ static struct PointerBarrierDevice *GetBarrierDevice(struct PointerBarrierClient *c, int deviceid)
+ {
+-    struct PointerBarrierDevice *pbd = NULL;
++    struct PointerBarrierDevice *p, *pbd = NULL;
+ 
+-    xorg_list_for_each_entry(pbd, &c->per_device, entry) {
+-        if (pbd->deviceid == deviceid)
++    xorg_list_for_each_entry(p, &c->per_device, entry) {
++        if (p->deviceid == deviceid) {
++            pbd = p;
+             break;
++        }
+     }
+ 
+-    BUG_WARN(!pbd);
+     return pbd;
+ }
+ 
+@@ -340,6 +341,9 @@ barrier_find_nearest(BarrierScreenPtr cs, DeviceIntPtr dev,
+         double distance;
+ 
+         pbd = GetBarrierDevice(c, dev->id);
++        if (!pbd)
++            continue;
++
+         if (pbd->seen)
+             continue;
+ 
+@@ -448,6 +452,9 @@ input_constrain_cursor(DeviceIntPtr dev, ScreenPtr screen,
+         nearest = &c->barrier;
+ 
+         pbd = GetBarrierDevice(c, master->id);
++        if (!pbd)
++            continue;
++
+         new_sequence = !pbd->hit;
+ 
+         pbd->seen = TRUE;
+@@ -488,6 +495,9 @@ input_constrain_cursor(DeviceIntPtr dev, ScreenPtr screen,
+         int flags = 0;
+ 
+         pbd = GetBarrierDevice(c, master->id);
++        if (!pbd)
++            continue;
++
+         pbd->seen = FALSE;
+         if (!pbd->hit)
+             continue;
+@@ -682,6 +692,9 @@ BarrierFreeBarrier(void *data, XID id)
+             continue;
+ 
+         pbd = GetBarrierDevice(c, dev->id);
++        if (!pbd)
++            continue;
++
+         if (!pbd->hit)
+             continue;
+ 
+@@ -741,6 +754,8 @@ static void remove_master_func(void *res, XID id, void *devid)
+     barrier = container_of(b, struct PointerBarrierClient, barrier);
+ 
+     pbd = GetBarrierDevice(barrier, *deviceid);
++    if (!pbd)
++        return;
+ 
+     if (pbd->hit) {
+         BarrierEvent ev = {
+@@ -905,6 +920,10 @@ ProcXIBarrierReleasePointer(ClientPtr client)
+         barrier = container_of(b, struct PointerBarrierClient, barrier);
+ 
+         pbd = GetBarrierDevice(barrier, dev->id);
++        if (!pbd) {
++            client->errorValue = dev->id;
++            return BadDevice;
++        }
+ 
+         if (pbd->barrier_event_id == event_id)
+             pbd->release_event_id = event_id;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 0303e39de4..9138e1dd0e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
            file://CVE-2025-26597.patch \
+           file://CVE-2025-26598.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


