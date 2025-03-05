Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9499C28B25
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.16552.1741190339369219146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OaeOB3lS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2239c066347so76275305ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190339; x=1741795139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csh3GcnfGIE6T01SKbAH7aEmRpxzSueWgV5WuyK1rRc=;
        b=OaeOB3lSIRMc4PMyypXjmj+F4KvxS7zzqVCnxysR+Zxpc1Pr8r71RRPRgGUtU3/NDI
         FjZWWl0J3SGmKTxqyFaasgWwtszW/kgz5IsloFFyRkRgjMxfPNxoysGL1QrCmLeLcA/r
         IChf4woxQ21qnXKlsqHcHYDoJwaCssD8S3weSea3PbxBuh4jk0qPfurTyLeECcMIp+6X
         mjajwwkV9r0hb8ljbk8JA0YJp7hfKEGt+aATlpfp8P0wVdHaApIZFUgND3mCd+vgUVlF
         eOQx/w4sLK/0LDYOsUUm29H+PJ00pDYZOuxwEkDEAV1Jl5sEjEQJBMqwYoYGU7fVdpPC
         GD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190339; x=1741795139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csh3GcnfGIE6T01SKbAH7aEmRpxzSueWgV5WuyK1rRc=;
        b=ebPkkE4T3t88UEgOeHA9GctNgmajrWVQaSomz6UtYzymtP/CZAmpiPCgBh3VSO++1+
         LZfClQC1wo/3PlRCrkPDDcl3H8g7gG9pWE3xxmwl5f7FE+UIMyZgmRNuq5ohhCXvo1o2
         annEcl2b1sZZGOrqfxbtezC4AVRvOYssZrRoUr6QyS5vnaGmGDLwKV8/8HopY8H6DtZt
         zFOPexJgHrqj3F0354y/JJNDKsQ7wsY4gTJqzsgnIMHDCECqyiN2gqh5SJee9ajj6Z3P
         vsjMpddrv/ra+y0wxPBOVxU5UvSn4blJ3XuNVoYdJvUAOI9lxiXQLpp7EsluR3B7xWuu
         Fcjg==
X-Gm-Message-State: AOJu0Yxevo4kLD7wFNd+B1TvBo75XsoT35bsvBi0torA8Mwd7rXU35Yk
	RMcQDgtnWPFhpV8VNzL+jXvclMgttyFUpz+1yYDTEIHgF4qyUNSPTHogPUdoAQOaaYmrq2Q5/k2
	N
X-Gm-Gg: ASbGncsMp9qBXfTWRw6kUhrbp6CwS05xzvXkEkGnm6TggU+gEw7rJwwLHu+ft6VzioH
	ELh5RBjktuHqoJh1cqh/LVtlco3Vgw7csoi+ySnBUSaNwJJKlG26bA7W4C7Y0hRlexH4TrBlsNE
	2ioeFzQAVXYwbxMLpwGhe09B1Zh1N+DecHKafYjPJTZ/eI1JRFc78YI/HajL2F/InG2CgFjBdZg
	oNRCF5gaQvapEUihS/I7sZgrsvkvsALTHkmeHxfopN9UfYNxmEweUlLtFS5ke2aVRm+r/X8a+zp
	2fvQ7ckkLAj4H9TdI91l1dJWHGL50QSXWeI=
X-Google-Smtp-Source: AGHT+IEU4dXm2c/DE80RzPRyQjaSs2rwvze37WT4VjD2MJkOdIvAFHOq8hO5QHOWxxDWqZTdDefM9w==
X-Received: by 2002:a17:902:d582:b0:223:66a1:37f3 with SMTP id d9443c01a7336-223f1c974f7mr78290145ad.22.1741190338576;
        Wed, 05 Mar 2025 07:58:58 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:58:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/16] xwayland: Fix CVE-2024-21886
Date: Wed,  5 Mar 2025 07:58:32 -0800
Message-ID: <77487fb0756951e29628f41ff00db12a5f9d7c27.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212325

From: Vijay Anusuri <vanusuri@mvista.com>

The patches are copied from xserver-xorg recipe.
CVE reported for both and patches apply on both.

Upstream-Commit:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/bc1fdbe46559dd947674375946bbef54dd0ce36b
& https://gitlab.freedesktop.org/xorg/xserver/-/commit/26769aa71fcbe0a8403b7fb13b7c9010cc07c3a8

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


