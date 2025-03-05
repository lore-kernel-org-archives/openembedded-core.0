Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC3FC28B23
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:46 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6382.1741212701793371449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yaruHZO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239c066347so82065065ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212701; x=1741817501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOMO08UvIv8CPZWqkf26wKyUYNwVrMwGZgBoih0CUbI=;
        b=yaruHZO9R2XfNDYD7jc3YI5inj4PeOMrD0sB1vVItbReCa8IisHDUVxcps/biPx3J8
         bnk3vD9PANiLj1+9yg5WiNwkuDn/Z9hlojD4QUTcIzBKFQT6z1NWlrQRLBl5pff8Tlyw
         XuTYZgWe/4REeHkZWPrLeKdPP6ThwdxgxGRCCtlUNYKJY/wGjVGFBzxPUtPyw8PruZE1
         rbp1AiqOdu+H0eUfDf/aYSkaqPxiEOD6duP19A/fXjEXSn2+G0badMFuJmOCVYaOqGA8
         JmMLwHqE9WZHiew3D6NR6EpX11g4ysQafje1wtDzGQSpO/gnpr2nQu+QhAO5E26IL2y0
         8/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212701; x=1741817501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOMO08UvIv8CPZWqkf26wKyUYNwVrMwGZgBoih0CUbI=;
        b=sOiLIhmQYIa+WK/ZIiaqiyWPmaXzPHHm9tZFMLmIDa12QDvMRD6ymUMG4QTRKLN2Qo
         z1LllTVaxmijYLodnDC+6+Rken1ARVqMUAhtCQ5IqYombps8kk9z62JZv4VohqlJeHZN
         rKwsmVjZitSoE2gnd9dvHR7uyTe/nV5tFU+vunCZu97QneklzJ1UCwKUPOaYezTNMcDb
         Pf1VcfVYuTKSSUqejJmcPJzf2N265GRrmp8qtJ93k4u5F+3WVQVga5Jm4i3cwtWeMRsu
         saVEPcqXkw9gtxCdOaV6fzJzaD14IGgoF42a0IA9yC0aDkJykKVRP4cWuL6LNzWIbpao
         0ukg==
X-Gm-Message-State: AOJu0Yy5ATpDo0yMnT400AACXl8uFLGpXxOm2rAzH9MmVbHzlN8sf6Fz
	bJ4ufHE2kaGH1f2yLWWswcSZwKLPyfvlDsR1pl6ImZz6VwubEMkghVMX1a4Gh3l+KhuDRbeyEmh
	i
X-Gm-Gg: ASbGncsWKYJBa8Xe216ECqljprv9M1D7z659C4ZzphDM7403dblBQHmvd6lNFCu72rw
	GuNiPlcTDFS1eG6qdOY9DvZbt43cZm30sJTMyFrALkEOW7IWqxUTJ27MIJkVsD+QS8H3xobk4NT
	3OD7M9rsAMrPhu2dKHYv1xi75+XTeVjrNj3QXC0NwAHt2runI2N9wsr80p+GSY55YUkrAyZtEcB
	+decF52Mt4ly2SwM44FVE6S5+Lg6Lz+TbrpoxGGe+lB2QAaZMHcMPZN9T1x6qOCpBbxHjKBPzFJ
	0Im3JGKLSagkJq/KsZLC/TJi2rOXujxyEuU=
X-Google-Smtp-Source: AGHT+IHNuStyRaEA2WaQslB3/0n76Cdb21o3dfvDSZ+rbyjqO9tgpK2NIz51o9Cr2Epe1GR453n9Jw==
X-Received: by 2002:a05:6a00:4b01:b0:736:5b46:489b with SMTP id d2e1a72fcca58-73682b55238mr7592001b3a.1.1741212701009;
        Wed, 05 Mar 2025 14:11:41 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/16] xwayland: Fix CVE-2025-26600
Date: Wed,  5 Mar 2025 14:11:09 -0800
Message-ID: <f84fd297131deda3e13377f0b3555a71e67f1d74.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212360

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26600.patch    | 68 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index cafddc62b5..ac0408ea67 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26598.patch \
            file://CVE-2025-26599-1.patch \
            file://CVE-2025-26599-2.patch \
+           file://CVE-2025-26600.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.43.0


