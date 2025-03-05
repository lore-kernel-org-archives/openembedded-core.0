Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FACC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:32:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.13079.1741181573178275546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fj/3eo6L;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22356471820so110059325ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181572; x=1741786372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCQK2NMQ3TC3mnm9MP0qfhLDnzIsdd9npzj0q0/Znqw=;
        b=fj/3eo6L7y8TNdZ/l7p624sro2CnMrfCk2ARTWeEqBQZrDQVKdJ8LqCughrwMkAlmE
         OyzTdEQrWlZdlHkqx2eV+UAswfSOhihI0hoXFSwokAOFgqcUv3sHzzIfwtRGP04cFBkE
         o5iVUUU+4K2b9qZAj94DInEbR/7cEkCMXWuU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181572; x=1741786372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCQK2NMQ3TC3mnm9MP0qfhLDnzIsdd9npzj0q0/Znqw=;
        b=UphzLDlcWEzZ+yBqvKJHKFsJZ0UMvoBjs60uNFXcuczNNg0tL7rfsYCFtWMhSUoYVg
         8khfPAv8uDUTOG8woHuuaczWaIe2JosEV+RbkA0c5SvxRlZheHEsif3zWjKB+hBPKFoF
         7HWkN2osU0pNq7Vng2BaG6Ct/XL5za8dxXmDtYRrEXhJCGcg3HwY4Ql7YL0vhaothUll
         r80IJ0RKx74NGxifpknOm/oPVq9AzfTsYsRyo1CIsuqP/GfA5ghKv9O22SCMQzt1kzYd
         l6xS/Rs/IelbhYsicOJR8ccDDv1f3A+Kkb0GZ6bDxIiZTGkg9bESfr3UC2yCZrIFmuL6
         POMQ==
X-Gm-Message-State: AOJu0YzDMatMiP5SgjBkuI3TyD47hyjoLATfmA9yyxD3VWffFUCH+jM9
	0hzYva3cW/4o9JfeAwNPZogblarcdoWrc+LVCUJQ0b3PjfGWk7OKkkgrCyHjvPIy6ZwfH0sHkcw
	ids4=
X-Gm-Gg: ASbGncst/NIegDTDkQiCV1kmOjFNwDFlejciiKN3phwrhnSItxv2AnbrTJEUov29DqJ
	UznjEHE8vCZuloFJD01tpxB+EXHeU8ArAX/ELWCN/YnSJhxa/0j2vhqncl+WtOH27VLbOQTw9Dm
	kMol/Vs0eqxLOpAWIe76VSfOmPsE5A/YDYlL4rQOF0Bloz7cTGNH8TMmdE/Ref6+e8KEcDDeM7d
	0HbosZkvldulT7YegR8i2g6Am2JGCoA7eI1nkxj42eq+IGVaRVNxI2f+XBwhCryzg3daV8+/AQR
	b7dJ3QSXSCtU5BAsC5lcVyYXkemwxJVMNZX6HMEsyFyXDOlopMyJsKw=
X-Google-Smtp-Source: AGHT+IFQZNVsnE4JnsB7kVf8Vdv4yfW5rci/TWiEU4P3zqz6cuqCmkg1YEat+Dsx5AY1F4aPYErB+w==
X-Received: by 2002:a05:6a00:2e92:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73682b6c1b8mr5025632b3a.3.1741181572158;
        Wed, 05 Mar 2025 05:32:52 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:51 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 6/9] xwayland: Fix CVE-2025-26598
Date: Wed,  5 Mar 2025 19:02:11 +0530
Message-Id: <20250305133214.169364-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212312

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26598.patch    | 120 ++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |   1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 7f94c5e2e2..b46a02e5c3 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
            file://CVE-2025-26597.patch \
+           file://CVE-2025-26598.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.25.1


