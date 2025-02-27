Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E279C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 12:32:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9467.1740659555430010253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 04:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dm3WbDn1;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223480ea43aso19750055ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 04:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1740659554; x=1741264354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEpVl5oH8yR0AaozDODqS/0uOTrsQ+K2f97IwsDgGi4=;
        b=dm3WbDn1w6mK9iksUzMvMyl+dT1d7JS8lmM8hKJSM57oIwjIgf9Y84mUk0ACH9xIqW
         YVVrfVx/vrvWke+s9hw7uwh9izGgRyjzTcvCQ0PxNCLEvqYM/tfJvRnwobFq9bLsSpNM
         5UbNhOnolSbnJ62jBVzTbMWVhnLs3AkvdrngM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659554; x=1741264354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEpVl5oH8yR0AaozDODqS/0uOTrsQ+K2f97IwsDgGi4=;
        b=Pk19hcQAyIr5fBqyYcuxe0skeGHrveNfFVFukney6v8t6zJy8x/Vtf4d8jhBGrj8uH
         KWscmL2Q8He69G0kRBP5/OKiP2BsjKEmIRGYNr6BtDI3bmdE9O3al8j/BqwMsIArtaY7
         rZ3hQixdaq7KhjcoqptDsil2IA8clDr8sH3f8WMlpxqLaW4yqXN+lbouYq0ySgRuexYS
         SlGIG12cAtWXePcrIBjyct5x9DZ2MJza+WTTId+bNynUWcUJaX59pHKfe2yQ45MLt1rk
         v1fWz9GcXgKaiAj554CGksliEVamMK+clU8sJ8pPIKPaFpy7/FxyGS3nRs5rKKDIyyaz
         FUcA==
X-Gm-Message-State: AOJu0YzmitovxGHh/hLwGbkAZAcREbCo3KQBB5mUZaKN0QzlHOBeQU/J
	6JKVRmRtod9khCo3pLg9x5PCHHx4ckpCzmVumPubstdwug8n7ww4u+EOAyhkJtEC4SI6c3eOB/l
	7taw=
X-Gm-Gg: ASbGnctFbsk9qfYxKK2nKvUXGV7F8ZKtu0y3kgIuZTSjTYnEJJyhE7ujLYXSwckxyHk
	GRqVRv7hYTYZcysRpTebd8PuSyKspD1VTmzBthS2/agl52jvK2ZdvZtbuVoJDt478RseDzFlSXt
	F6ZXhlMSJuR56Ze6pcnAwPjkYmxnZaRV8hYSLktJu5+82VfRqaXRd9jsS6z6+1byRSHgUG2NJkg
	Ey3u1HE8Zj7+Eut0Jv6H6gu+2o/jZ+0sjpUOKevxJ/hUAZCHGAcV1p3sEM61qT+w4lWjOUmkvdb
	aeYKVwqOHG31qNYWqQVvCW8FOy4/sTHnn6c=
X-Google-Smtp-Source: AGHT+IEEmZmj185fYg75R9KNpXpKFQ004+ppID3KKeM0b6s193ltGbk+NW15mWf7Vil3lMtIWjpsog==
X-Received: by 2002:a17:902:e80d:b0:220:f069:eab4 with SMTP id d9443c01a7336-221a0ed87cdmr446716175ad.22.1740659554381;
        Thu, 27 Feb 2025 04:32:34 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c7ce2sm13082805ad.128.2025.02.27.04.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:32:33 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 5/9] xserver-xorg: Fix for CVE-2025-26598
Date: Thu, 27 Feb 2025 18:02:03 +0530
Message-Id: <20250227123207.270978-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123207.270978-1-vanusuri@mvista.com>
References: <20250227123207.270978-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 12:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211996

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/bba9df1a

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xserver-xorg/CVE-2025-26598.patch         | 120 ++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26598.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26598.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26598.patch
new file mode 100644
index 0000000000..210a76262a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2025-26598.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index 7c963e9fdf..5b77dad16a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
            file://CVE-2025-26597.patch \
+           file://CVE-2025-26598.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.25.1


