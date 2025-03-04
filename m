Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7306C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:20:34 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.20395.1741090828089483306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aJUpiC/T;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223480ea43aso136519395ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090827; x=1741695627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+SV7Std4CuAP+EAbwPXoCKBT0TzpmAAG4KJ5dKG98k=;
        b=aJUpiC/T4ZtY56+QX0B88e4/k1T8jHNu6hKCEhJMGet9eOZz/A7iXLxg2BXbL3ASW/
         ekefCS9AdvVnuUu10G3UgWOarPJaBNBDWDmj02yXU8x67N7nshsNMSwCa/CzTgJ+ilZx
         rP2wCgwe3TGPdggPQettGsf671tHJ4DYDmMoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090827; x=1741695627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+SV7Std4CuAP+EAbwPXoCKBT0TzpmAAG4KJ5dKG98k=;
        b=grL4iUV8ri+O0e9xhEACV9ugBegrJEOiyT6ITGc+i+N/EPCCQeuUl9+jp/EisFhflr
         7ezwF/vCW3JfitMvb4BetRL4X4O/loVcVLYDwS/NkzXTBt7Z8VbM+4/5lU8iijC0+ZH4
         anJ03geqBqha/1AygMWKI8A2xKEsLgTVF5zxaKWuRN0ge1kB7XvldFSoGNsmSBBaD6ro
         8oEVDJGk8hOiffgufYqe2h+lHxeEOjH3O3o53bn6rs90t4bq6PBvDEMmAKWAtXzcU25Y
         ZMwdgc53I+SUm6C4N9lpSMe31NX09CVw78EhfDzskAPnkt+PxfjAWp/6j1U3Yx6/8sN/
         zeDw==
X-Gm-Message-State: AOJu0YxaWnrlF2dOZ7a7R8F0Q2zuTPFJOs5boGMnf5yNHibrH3jasEoH
	rLqox1178UMDgTUK852kj8vGl0/9dCpxPLFziq0RdEsbbgaiLx8ah1fSuZtwvEvEIVKk3VRT8UR
	LZcg=
X-Gm-Gg: ASbGnct07dAoGTnfBkOH8GqzWim6mTD4JnM5aXQf+6hJdTteEZ7jkw40bJ9sfMxzanF
	UaX/26R/8u6Bkc1ph3WxTbgYxWpGNtVQQzvKDndtT1NaJiAUOYwnqWIq66xquzAmST2lW2AmqFw
	oWaaLDsfcQsulYG386oeRbHsSGtEkaB6fho/fKy6CKnsXKFWhmqH70QFfAzPSYg6PdNBHBBdhk/
	/1kzfBNynqFQtZnG20HIKFVcGswRWNXdEFSmAtzs0xTHH6GHnT4/SUyqVDdePjMsMMzW5LmXUwu
	P74+lthCLwpRKm1DnCj+S1nDpSiD4gjibwxOFqNiaNplEqrgCifSNA==
X-Google-Smtp-Source: AGHT+IG4Wi5l0/BU3NPh64PKE0Vw6dExtKWyP8JTRHS7RLyHASCRS3u91XH4hPej8cTvkVCLBoplhg==
X-Received: by 2002:a05:6a20:6a1a:b0:1f0:e3ce:4d3 with SMTP id adf61e73a8af0-1f2f4e013admr28262009637.33.1741090827078;
        Tue, 04 Mar 2025 04:20:27 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:20:26 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 13/14] xwayland: Fix CVE-2025-26600
Date: Tue,  4 Mar 2025 17:49:17 +0530
Message-Id: <20250304121918.147345-13-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212278

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2025-26600.patch    | 68 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26600.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26600.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26600.patch
new file mode 100644
index 0000000000..43b47b3ca3
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26600.patch
@@ -0,0 +1,68 @@
+From 6e0f332ba4c8b8c9a9945dc9d7989bfe06f80e14 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 16 Dec 2024 16:18:04 +0100
+Subject: [PATCH] dix: Dequeue pending events on frozen device on removal
+
+When a device is removed while still frozen, the events queued for that
+device remain while the device itself is freed.
+
+As a result, replaying the events will cause a use after free.
+
+To avoid the issue, make sure to dequeue and free any pending events on
+a frozen device when removed.
+
+CVE-2025-26600, ZDI-CAN-25871
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b]
+CVE: CVE-2025-26600
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/devices.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 1516147..459f1ed 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -962,6 +962,23 @@ FreeAllDeviceClasses(ClassesPtr classes)
+ 
+ }
+ 
++static void
++FreePendingFrozenDeviceEvents(DeviceIntPtr dev)
++{
++    QdEventPtr qe, tmp;
++
++    if (!dev->deviceGrab.sync.frozen)
++        return;
++
++    /* Dequeue any frozen pending events */
++    xorg_list_for_each_entry_safe(qe, tmp, &syncEvents.pending, next) {
++        if (qe->device == dev) {
++            xorg_list_del(&qe->next);
++            free(qe);
++        }
++    }
++}
++
+ /**
+  * Close down a device and free all resources.
+  * Once closed down, the driver will probably not expect you that you'll ever
+@@ -1026,6 +1043,7 @@ CloseDevice(DeviceIntPtr dev)
+         free(dev->last.touches[j].valuators);
+     free(dev->last.touches);
+     dev->config_info = NULL;
++    FreePendingFrozenDeviceEvents(dev);
+     dixFreePrivates(dev->devPrivates, PRIVATE_DEVICE);
+     free(dev);
+ }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 1e4a96f86f..d90f9970b5 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26598.patch \
            file://CVE-2025-26599-1.patch \
            file://CVE-2025-26599-2.patch \
+           file://CVE-2025-26600.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


