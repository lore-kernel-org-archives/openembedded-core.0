Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF4C282C7
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:11 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.17024.1740678007789120222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hlwhSvFU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-221057b6ac4so21232905ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678007; x=1741282807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGfvf++UYlmr3lj7dq52kKTf0fV/fHDABmiI/W3FjsI=;
        b=hlwhSvFUkQwqO/zmpE/sGIjTNYGPlcIlPl4YBzuir4NqJHX81WSJGZPyudCbLnSfN3
         WWwS9j+tnSr3hpr5ncP+BNftC+KQzJbw+eqxIghw2euG/s2L55z2+Q3Uh5iDATJvqiAo
         rUfm87eq50SVUVaFc+xvhqhrltYFN10wXOIEroqRNbEfpOw2Xzme9jWwfcIEwuZRz36i
         LK/JY7RPKibJEGqcTSCW7GeLXlgL4X83S4dHRNJGu0L3T+OXDMJap8MTWscVult/zcdO
         GvgBPDUWAdGbL64AJexfYiyuA0urkZUYKSql5s2oEhTe4TLCdH7gOFcg3jZDHC+W0glM
         AR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678007; x=1741282807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGfvf++UYlmr3lj7dq52kKTf0fV/fHDABmiI/W3FjsI=;
        b=Uuddz648siTx9qmM7d1gSJE9BWBUuUUzj6xIuw4Z74cmLBzXFPILtam3+dT/s1bFPg
         cpyR1Nl6VxRp+jVIjySx0eP2BR4IR5g8KfvkYLyQCI5z+LUbS8dcgWZDiucfwccbFFEh
         hzMQq4lg9S1MtT6tP//Qlxwux9DJRz1jOrFb3RVBXb6FWfxm3egr/WaM6iNCLrzxSO9C
         8yg3CvAoaRk00eGAPzgS6zhfdRwVtF3MND5H8jBuIlhvCbqkSlsykg9M9LJtStb3IGEn
         6SMTntY+Pe78KgMpRq9jiF7Rq1rJ97pWk5XYuxISiv0rfvSJhJl1bfTwJh+0h28cve71
         NkLg==
X-Gm-Message-State: AOJu0Yx1w2Iz8pFqXgn4y1tA3qejM2fsvcgPGfLq2CEWWJvVCcdjYUiN
	BZr0f1QBeENKZw1aANc+pdYB8ictWk3Ce2nTI1IJtIdb541On5N69YjJ6eZnbjqXz1xcxDgX3IK
	p
X-Gm-Gg: ASbGnculyxTxln38himzWSDfZ9ciz/6w3dmVIMDef/zrhQ3o5+XUhn7elkH7YYuIx7Q
	6iRNpfORCHr7basZeTUUS8wAUhRpwQBxNMQ3kzRE+pL4Onx8thXRW/D9XuGU8WUuLSKX84bM1vy
	96dVWt/ZqJF7tdgiapSiSuxD1BBkohHovuz3QKIDL46UM5LdbjLO8z9I4KVAaRFGMTaY5MmfgFI
	AQhNFrkB0i3Zef2KGllkG0kkAh2/TLO3Gb08BuKft64+0/IT5z75tjnr/9qQO7s42pCpayGETeQ
	2StXb1ZwCNzM7R9uyg==
X-Google-Smtp-Source: AGHT+IFOhNiSqSJ6WoFuhM6UAfPJsi7Rbp9Rz84SX5+6fFJc76ftwiqP7W8Ca5LT59mG16yrGvbqCA==
X-Received: by 2002:a05:6a00:218f:b0:730:87b2:e839 with SMTP id d2e1a72fcca58-734ac425e0emr403196b3a.21.1740678006784;
        Thu, 27 Feb 2025 09:40:06 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] xserver-xorg: Fix for CVE-2025-26598
Date: Thu, 27 Feb 2025 09:39:40 -0800
Message-ID: <645ad1bcf8675873a7ab4778ffd2dd59dbb7b037.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212027

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
2.43.0


