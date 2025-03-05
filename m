Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67BEC28B27
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6378.1741212698395016699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XeIG60O1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2234e5347e2so151223815ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212698; x=1741817498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J77vBoRYpun6es0dbmbwZ8LAS2r0Zy14pSnmvX6yNhM=;
        b=XeIG60O1JPI4+2gErVqEavbVzV1iBF3N/UGSYyreL3R2Qcw0E6ZSKfRPjfZSMVbmcw
         GrLWAewbLL+A4bicRkZfzKAoCinjTDS0YKYVONfyEY8QkShmy1/rfMLK8ofrp0iTpMU0
         brSB0gIe6bcNNEPOYYyEWfgpwf1+Xybh5PfsiYMjkyDVnZwzc/vTK7CHHhTzcXiCvrKx
         fOE691xpJXTy/1j9YnhyiWvUP/l2Dc2zWZ/j44vHlhSagmWtgt9mkP2tWEhH3cCx9ifm
         aYSNlnnFXl/XDUY7/+e9NIICloc6gSAtVbYpR4Qyy9Rib4i/wEZjLt0Lay9ItJzyUGZZ
         Xg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212698; x=1741817498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J77vBoRYpun6es0dbmbwZ8LAS2r0Zy14pSnmvX6yNhM=;
        b=svAMKuAESxO7dJPUPUnLNHb1hBxEIC5gJp4+euNGBBHq4k3tpq0Kzizodx0qYjXxmn
         yMtWDJwCQCnxUGX+fVEeL+luucpFVhauYLepNe7VFSO2NXw58FxTb4vGnQiPDziDZyYO
         374n1K3yp17klNGgmJxi4FWcTfaEAZlr51cQNSsQvux7A73fU0VRrf2+QRfm08f7qPK8
         0p003oqQeNTvTh1bZqhxCxmlXsO1u1ySwN907kGY2KA7eeNnC3f/3CsJVSwzsf6ShMSE
         AIhubCqf+IGG3DRIaqJ9H+OH3AP++j2xS87y8kjdf3WvlVJewChD1x8+Dzb8gkCh/ARJ
         2IPw==
X-Gm-Message-State: AOJu0YzwPkc3gAXMRimiEpBKJ3b00S3LoLEC/ouDsEBv6bwD8E9akyP8
	PGr2xd2LWAGDLek8sOyqDJXdJeOCwBXtrzAmjmBx9Mkuv3u5wUp5rBKDnYDWdVog13b9QrhU3GX
	J
X-Gm-Gg: ASbGnctYc0K0DokyNFsx9MNJDQ/6OCgKHs116uF4JN9gKV/by6fx0Wc/r7q5rFn/TV7
	FQuFW8S/zKMCPc4k5aclI+jedD22pD3/npZ5VB6RcQJHxYvG49Mi00ouG3xrdpAr3RORUGufNPY
	KB5GJhJEJh+9TGCGKPJQHkdvZIuCmckZ05+H9J+SbuRU0DIjC8XOy/o7iJyr9nW+wMey5IvlesR
	2xLhaEKTUGItzc5U6YqGB4dURqkD279IJdpULKN2QFDYQJTi/y++ZXJ/I9511I41lIBKxMncoA2
	Wj4qCVct0fUA2rOber7rMWaaomo/4tOkWIM=
X-Google-Smtp-Source: AGHT+IGBnssb34yOThnE4GoiWm+b0OsdK11BDq/pFQZjDYbSuPorFoHfs3FgpL0aPo3kbAZRdoaonA==
X-Received: by 2002:a17:902:eccf:b0:224:162:a3e0 with SMTP id d9443c01a7336-2240171e861mr38569355ad.49.1741212697358;
        Wed, 05 Mar 2025 14:11:37 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/16] xwayland: Fix CVE-2025-26598
Date: Wed,  5 Mar 2025 14:11:07 -0800
Message-ID: <b58fe3b82168502e29f500e42ca8d140934f5b1a.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212358

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


