Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA713C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.16716.1741190355616547807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1y7RfjNX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22385253e2bso103440275ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190355; x=1741795155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90WAxAYCjFoapyFpdOMKN/8SkrArE6TR2fqvxxRWZpo=;
        b=1y7RfjNXotX07RjuwwvfxVKdCcGd3IPzwX38zUgCLwfI8GnA8iQmPMZBbN7hteHYqF
         RZS88ICWr7ub4MP37i3BNxCZPVLFYhS5NNLkQpoO/oLmwZ17Uc6KGPo7O1K8n3xYWgqD
         wLyRWCwjBYNYStqr7+/v1Kwf7bFmE3gi1YuvnMVURjDPClSu1R1TdjrADLpS0Okvb6ht
         T1PoI63iUr7YXWOUW08TPzYj184gIfsAzAzwOc8D7W/76+j4+T6eNgqfFKPzeXMMZxh1
         fmpy42o1Ep/AZpgzp5Wvag44GyAQlTXv9lOuDPbzZPJt7Lid2j5/WzrXCT7km1SLAOne
         JfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190355; x=1741795155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90WAxAYCjFoapyFpdOMKN/8SkrArE6TR2fqvxxRWZpo=;
        b=ekNl8OanoDi/VmSztAig5V2/xQzJLDZrVwF/wCBfTQqLt9HE1g9FjIq3bFPVJPhXFU
         shXvsQqFC9MsKkt9uXqG516rYURsfaiZVTuikpavhhHPvSsYPyNjfmh1nsG9innTPwTZ
         j787KVXyadiP1CSa2JObLjQPWY+hSAiiDfnvDUr3yAlmxjRd01dXfi9BV7L5dGkX5LPb
         I9LivObsLzLL3Bm3ev+zaAdM35RCDYhWEckD+y4Rxtc9efb9jaXTLXu9kCZOEhXhqC3q
         OeAka/wq9phjFqOcYWpDFdVrxKFsImNtIby79AayCLbr6H0AfW4uM2ryG70tp2RZJBD6
         XyvQ==
X-Gm-Message-State: AOJu0Ywovd+UNG6Pm4o7Ii8N+AJI/6eY7gDKJJU3LiVWxS1k/MJz09o6
	X5+WJ1DsJ9kY7HH6dKBUkU1f7Y306cvcYkMiHybIyR7NUEDjlD2Xl5yozc6RpI7yo3fwQ9kAdLQ
	h
X-Gm-Gg: ASbGncvmBRJwKfgnNJkpheEg5wYaWYkERwFGfGyD6hUlngVrrKqSnzGcDq//RtGXUUn
	W9ut0dxl85Kl9g0O5G9zv7wtgRZT3B9zDKNcrZ5Hprfs4JXYgk83Ir9rK6FAorbMv7zWtZkjdjP
	ytlGmSiurtCmNnE4PvmcT/YWANeUxWjOBQG/dZzXvG+FcQmFW2R3AKuzoTzNDRAIe2u1RHVgtHJ
	G0lgm788bIoHgv648m8oSkg6OhfDnbob8XNLzZHQz06TfhO4nYsl+0iyXH7FYVMrJtuGcGy8VJJ
	tbvk6dfiN6+BZos6M+yV1UVdFfrGN1V7YfQ=
X-Google-Smtp-Source: AGHT+IGIVJ01pCgs4fB/TVvXSvRJu+r2Wi5Q3rjR5DB5e8pUigiHrczN9fnaatXQkfvpxcCWUAQtiw==
X-Received: by 2002:a17:903:fb0:b0:223:536d:f67b with SMTP id d9443c01a7336-223f1cf46bcmr74290605ad.38.1741190354781;
        Wed, 05 Mar 2025 07:59:14 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/16] xwayland: Fix CVE-2025-26598
Date: Wed,  5 Mar 2025 07:58:41 -0800
Message-ID: <f01c281b94ff137003ef108e33a8c3230c541c46.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212334

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


