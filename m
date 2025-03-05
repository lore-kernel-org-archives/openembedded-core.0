Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C27C282EC
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:24 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.16720.1741190358708770695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kmvGcp/D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223594b3c6dso123554805ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190358; x=1741795158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLDjy33rG5Qm+8LmInfiUDKXn2RPvAmZB6runjRVoh0=;
        b=kmvGcp/DA7xsZa3nsLWfVt2/jcpMJuzE+q6SW3AKWWlODJN6ACLM3d4OK6floGQ8UA
         O8nw/Leyb1ithMkUC12A17y4jDKukQ+4y5h8k5h4KQ590DKHxYrhWQBoJaNObRcZ54Zr
         NggSuyjVz41MCYmxAoCPe0K6Bitwc+ZfGEv/q3baIvjNkizgbnOVnGWgGl2eZ/5zwp6H
         n8VGEOBnsnpaFuNxRei2MEtp8Pv5PrrZZoDw84QCRfygw0MjH32dopy0D2TBp8vnurOz
         z8VdCyBy7fbxFF50j/3KhK5Qb4tliWMj/+WsTHkinnaZOmChxYMq7LS4O5ygqUYJZxhQ
         2eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190358; x=1741795158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLDjy33rG5Qm+8LmInfiUDKXn2RPvAmZB6runjRVoh0=;
        b=R4LUBf/ywpbViz+olJFwhyJi6QnprwKzLsfUT1vn3AH+nyzcdVHf7DpEwUS8+9xo4r
         6Ck9tJtGGpcXr5GFqeFMKbASZd50DqI3Ve1mYqwobZfZDICr2NDVcFvtO9jMa2IGD5pj
         cMvRyX27Snqz8eaGlZQTvE7xF54w5W4wZxmy8muGkm9P94JojSuiVw4GjSkJysVV0Lcs
         jakik2mJa04Zvv6PmbPT0ZumMm1RNWuierlqm4edizr2OESPQhEefxIt9+ZXWOqcFiYp
         YWFK+khxPg0zgdhby/S1jfjG1uUfbbBHQIJa6G3iTX/y662WBOGZNlXz/j/GJpaodVeN
         cvzQ==
X-Gm-Message-State: AOJu0Yzxux1SwgCjWvTjVMm0D6LT0WVjiQsPzM2vWDZWn7txIbA02RyW
	H9dYGZeKaRoZ4KUTvl+wHf7rXD09l4rrxRWyHTBr5a/mjAItXf9hRj8dEBhi//JkPydfijXHlld
	1
X-Gm-Gg: ASbGnctmJTCkAU3OOWlBK8vvYGPkDK8quaqhIle3O86hKmxD5CNZIIVnTBZUEeiHvwA
	LQiT1RPiuuoPbIHutSG5lRnIqTI0PyNFtcCwIGZlvPa5rBOTzzFXQRzB6ebu90qcihw5T/m/Woy
	dFE8zvOOeQTziBxG4dVg82sZik1XK4Bh7bjHjYdhLy/HES0FNYAVUXNo7KN7X1OSqYli7gaDx0q
	aCtKyrD7EtjoT55ebbv4a2pUvuqy1NP/ktAxz9z7mHwRvrSz1rwoUbMir0sepu1Ytj/FaQPaTXE
	HecAAQhBoF3MQObW0qUXufs2kyojkckvTn0=
X-Google-Smtp-Source: AGHT+IFfr1pFu/P2ac4IWq0rCUALaxmV68pa6zpCipt4vuYiIA5kEM0qTN5Dk51wxetRhQL6J7d9lQ==
X-Received: by 2002:a17:902:c952:b0:224:6ee:ad with SMTP id d9443c01a7336-22406ee0246mr11467645ad.44.1741190357914;
        Wed, 05 Mar 2025 07:59:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/16] xwayland: Fix CVE-2025-26600
Date: Wed,  5 Mar 2025 07:58:43 -0800
Message-ID: <b02bf5f9abb4d2a514f9ea883cd1fe6057367c92.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212336

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


