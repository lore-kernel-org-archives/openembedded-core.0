Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF12CC282D3
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:19:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20479.1741090782363678596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YsZI9fgJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2234bec7192so89978785ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741090781; x=1741695581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4kW24YOU+BbKTqOq2WiaZG21ybEc+So84YR3Xf9eBM=;
        b=YsZI9fgJQrzCpvHii7IXP4/ZLGWLcJq/MZgTJ4pUbO2wPUnsW2jCsGW5PXuCYhLeUw
         XofFJYIwG3zgq/go/v4bxo7cB1gOIr8jRPAGdpQ+2217f9zQLIfHONgIDj1O5oPV7u1v
         6cT2jG9YpAPMhwKC/u8no/qycp3PbxsY1WzG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741090781; x=1741695581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4kW24YOU+BbKTqOq2WiaZG21ybEc+So84YR3Xf9eBM=;
        b=L2ErHnFMrYzG0DJC3YGXlu8nU8IUX+XctUFLeyikI/nJ8MFQi5TQId5ryyX+m/SBBn
         wUCLrCvyq2EH2ANvOEoluzivIfo2LO+Xpeis1N6PgXgMGyi75RQtT1y15Kta9WigVmf2
         WTaf4FRqk0VWDeE1uLuNm/w0Ehs9gzI5cuaVyM6DKg1guF6E6WQNkVHzgDLm2tN4ZR5g
         IFQcTDxdf03exGKGc1KKbFGeMdUxgUoLmEyMwYZInra2jX+XbN0VVbISxbgbh8KvFiwL
         8NfdBEge7ViziehF8COMJm5j3islSBJCpqIcJJ+kSUgVa0l1nm9DPcp5iDjie+mHFhY6
         PwOg==
X-Gm-Message-State: AOJu0Yy0ZO3f3QawHy2tlqalKfWfjdzR1UnaVWfBST952+L1/7bkD6w9
	yOfWdG6qGG+61xn7mPnfy16eXIHTzdtocXUWN1okq+B/jMTfBQ0aqTcJNbvVn0wiGEWXQCmMYou
	yjzQ=
X-Gm-Gg: ASbGncvJzjLofUxtFaLglQ4792YbYPyTSyZx0zGzH2Avumqjjj2xHXdSpvSWzNbl6tl
	4NjNqtYdCjEeM6smfss2Gjcbj8Qq2JnWgoA3oqP0JB4pLq4K9qg0EfqKXtUkHEys7h3SPNgmXG0
	j/7DPA/YTeERAfNqllucgGz/TUssKdoX+d0FwuOIph/vIucGdy1mt6cKi56sHDIOxIl8vitac5k
	irccbVqjiYqkMhN+YeD+FI62OKWtNHfekLb9zcOTjFvYcnAkeLKqKTY9oXv5e1qBU1jFgiKOb4y
	2K4u+rWtinZoQY4C1gZFMiQiKbVJ+y+BIg+rbYqBOf9DCvdhQM5t8Q==
X-Google-Smtp-Source: AGHT+IHZjYnEFzi02p11zG7cZozLchZhrOIwxsbsLq2+KXw6U8dRt1MM3dBYK3BgmDQYNh+EX5rtcA==
X-Received: by 2002:a05:6300:8987:b0:1f3:29a9:6197 with SMTP id adf61e73a8af0-1f329a963efmr7765314637.18.1741090781378;
        Tue, 04 Mar 2025 04:19:41 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a488sm9859550a12.27.2025.03.04.04.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:19:40 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 02/14] xwayland: Fix CVE-2024-21886
Date: Tue,  4 Mar 2025 17:49:06 +0530
Message-Id: <20250304121918.147345-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304121918.147345-1-vanusuri@mvista.com>
References: <20250304121918.147345-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212267

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/bc1fdbe46559dd947674375946bbef54dd0ce36b
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/26769aa71fcbe0a8403b7fb13b7c9010cc07c3a8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xwayland/xwayland/CVE-2024-21886-1.patch  | 74 +++++++++++++++++++
 .../xwayland/xwayland/CVE-2024-21886-2.patch  | 57 ++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  2 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-1.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-2.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-1.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-1.patch
new file mode 100644
index 0000000000..1e1c782963
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-1.patch
@@ -0,0 +1,74 @@
+From bc1fdbe46559dd947674375946bbef54dd0ce36b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jexposit@redhat.com>
+Date: Fri, 22 Dec 2023 18:28:31 +0100
+Subject: [PATCH] Xi: do not keep linked list pointer during recursion
+
+The `DisableDevice()` function is called whenever an enabled device
+is disabled and it moves the device from the `inputInfo.devices` linked
+list to the `inputInfo.off_devices` linked list.
+
+However, its link/unlink operation has an issue during the recursive
+call to `DisableDevice()` due to the `prev` pointer pointing to a
+removed device.
+
+This issue leads to a length mismatch between the total number of
+devices and the number of device in the list, leading to a heap
+overflow and, possibly, to local privilege escalation.
+
+Simplify the code that checked whether the device passed to
+`DisableDevice()` was in `inputInfo.devices` or not and find the
+previous device after the recursion.
+
+CVE-2024-21886, ZDI-CAN-22840
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/bc1fdbe46559dd947674375946bbef54dd0ce36b]
+CVE: CVE-2024-21886
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/devices.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index dca98c8d1b..389d28a23c 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -453,14 +453,20 @@ DisableDevice(DeviceIntPtr dev, BOOL sendevent)
+ {
+     DeviceIntPtr *prev, other;
+     BOOL enabled;
++    BOOL dev_in_devices_list = FALSE;
+     int flags[MAXDEVICES] = { 0 };
+ 
+     if (!dev->enabled)
+         return TRUE;
+ 
+-    for (prev = &inputInfo.devices;
+-         *prev && (*prev != dev); prev = &(*prev)->next);
+-    if (*prev != dev)
++    for (other = inputInfo.devices; other; other = other->next) {
++        if (other == dev) {
++            dev_in_devices_list = TRUE;
++            break;
++        }
++    }
++
++    if (!dev_in_devices_list)
+         return FALSE;
+ 
+     TouchEndPhysicallyActiveTouches(dev);
+@@ -511,6 +517,9 @@ DisableDevice(DeviceIntPtr dev, BOOL sendevent)
+     LeaveWindow(dev);
+     SetFocusOut(dev);
+ 
++    for (prev = &inputInfo.devices;
++         *prev && (*prev != dev); prev = &(*prev)->next);
++
+     *prev = dev->next;
+     dev->next = inputInfo.off_devices;
+     inputInfo.off_devices = dev;
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-2.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-2.patch
new file mode 100644
index 0000000000..af607df4f0
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-21886-2.patch
@@ -0,0 +1,57 @@
+From 26769aa71fcbe0a8403b7fb13b7c9010cc07c3a8 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Fri, 5 Jan 2024 09:40:27 +1000
+Subject: [PATCH] dix: when disabling a master, float disabled slaved devices
+ too
+
+Disabling a master device floats all slave devices but we didn't do this
+to already-disabled slave devices. As a result those devices kept their
+reference to the master device resulting in access to already freed
+memory if the master device was removed before the corresponding slave
+device.
+
+And to match this behavior, also forcibly reset that pointer during
+CloseDownDevices().
+
+Related to CVE-2024-21886, ZDI-CAN-22840
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/26769aa71fcbe0a8403b7fb13b7c9010cc07c3a8]
+CVE: CVE-2024-21886
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ dix/devices.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/dix/devices.c b/dix/devices.c
+index 389d28a23c..84a6406d13 100644
+--- a/dix/devices.c
++++ b/dix/devices.c
+@@ -483,6 +483,13 @@ DisableDevice(DeviceIntPtr dev, BOOL sendevent)
+                 flags[other->id] |= XISlaveDetached;
+             }
+         }
++
++        for (other = inputInfo.off_devices; other; other = other->next) {
++            if (!IsMaster(other) && GetMaster(other, MASTER_ATTACHED) == dev) {
++                AttachDevice(NULL, other, NULL);
++                flags[other->id] |= XISlaveDetached;
++            }
++        }
+     }
+     else {
+         for (other = inputInfo.devices; other; other = other->next) {
+@@ -1088,6 +1095,11 @@ CloseDownDevices(void)
+             dev->master = NULL;
+     }
+ 
++    for (dev = inputInfo.off_devices; dev; dev = dev->next) {
++        if (!IsMaster(dev) && !IsFloating(dev))
++            dev->master = NULL;
++    }
++
+     CloseDeviceList(&inputInfo.devices);
+     CloseDeviceList(&inputInfo.off_devices);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index c7e5c7bd81..1d4e699d94 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -22,6 +22,8 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-0229-3.patch \
            file://CVE-2024-0229-4.patch \
            file://CVE-2024-21885.patch \
+           file://CVE-2024-21886-1.patch \
+           file://CVE-2024-21886-2.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.25.1


