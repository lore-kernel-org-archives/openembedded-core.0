Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B09C28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:33:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13039.1741181581582268764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fbDpt8X+;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223959039f4so80574205ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 05:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741181580; x=1741786380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0StgYofBEI8iacj6Ymv3Xf9T2sdBcszuv7R8GFKCZBY=;
        b=fbDpt8X+2yG5pEPNsxp/HcApugu4PGp0WbBW0DLzO+mHlkYedTskhUHrfEi35mB9Z+
         eO5cy12MFlS/VHaUcQevMB0cYUec0uoKQLi+OkAvRoes2/Dqmn+hmWEsBPfLFUsuVgcu
         oES+MYlvopYiyRYGPk6b4XOTEYyi3kVT/xy4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181580; x=1741786380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0StgYofBEI8iacj6Ymv3Xf9T2sdBcszuv7R8GFKCZBY=;
        b=j1g7JR01S/MFcxLfFBFPIBChXtvBjpB0AZTdQwInVV+Xw/PT0ceu1/ATWz0POVddah
         uEV+zatqtUZkrLZ5EXRNjpRGLkE44z/h+AhrzmLe8hY8lujIwTZNjL6+6e0IW1Wyhh/i
         aBxwrZDc3s9zYS1++BgBh0Ve2xc1RMZ2As6xicmuIQhg2PvXdnNYKFPpXCRBUxj3lfPB
         oXbBJu8rx5EBZMGj+nuDyXZVpPrfT2VJo8baTdNla2ordvq2yB8YYk3MbsmYggyUvXam
         Bq4UMVcYm99oo16wZ98OqjZOFdKFiYpMKw4W7yjwiuCescEj4k557Qr5U2EZ1YK9ZDC1
         UnbA==
X-Gm-Message-State: AOJu0YwqUVBmFCnHA0EtALm43gZlr0/rASYlc/bwVKFl2yIq4IdmDGvN
	u+kSVmrHmqV/fMlR+Ipn+adkRhN5p/JJEtxZtxCVwfqIHeTXrXpu+fUMtlBWMVhGK3NShBHM+5F
	VXJ4=
X-Gm-Gg: ASbGncs0daeHK4G+5FLrBg1qTVI8o/aG0Ih8fJRI1IWSO/Kkeuc+DX9OFD5TJZ8oxVz
	jaRNsILC1WSQgKPjVdxoqQMH7U1jEXiQPTJgkWjToWBTMT9V7bVMUPMgIOigzkUfXlicRRNe+Vb
	YB0h2ac2S1fjI+aS+RUkgRBFONshHe6IbP6q0Qu4FE3SR75LZPCQ4qwfzvSVYtQ5ZmGYidVT23C
	tXGrUdiWSqac2qWzL6DYNAGR0MREHfwa0r920a/P627O5CrcukD1Ttd9kv0RQkSe3jvrAnNAeBV
	uvlcv06FOHsiwVtOnNqQzYpA4GUbWK7fbO+zaRQ3/houpSGCaRhctxU=
X-Google-Smtp-Source: AGHT+IGTEtQUn/z5tTZ0yYDH9XhWJQj7K8oO5B5myjBljpijLYymk5gfT37vV6C9niviF8oULC+C1A==
X-Received: by 2002:aa7:88c1:0:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-73682cda337mr5344937b3a.24.1741181580178;
        Wed, 05 Mar 2025 05:33:00 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.221.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0024c04sm13314501b3a.105.2025.03.05.05.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:32:59 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 8/9] xwayland: Fix CVE-2025-26600
Date: Wed,  5 Mar 2025 19:02:13 +0530
Message-Id: <20250305133214.169364-8-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305133214.169364-1-vanusuri@mvista.com>
References: <20250305133214.169364-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 13:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212314

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/xorg/xserver/-/commit/6e0f332b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


