Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA1FC3DA41
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9000.1720096074769873439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kIqxzmEU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb1c69e936so3250495ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096074; x=1720700874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcYddQTs557WaY8VXLd9hjs1Dbhe1xGWiPt0JGCgizs=;
        b=kIqxzmEUPcOYjkabwBeFrS8uEJiTpHGSVms6UIglu9WHJ/Rgo4nM/36bp4Z/nsviCP
         a1VszdrPsAQ3YNc9JykqWUgPx1yT50sTHn2wdM3HmY9naXIpoN6eAGzokmR/0h29jpAM
         ZamPrvfCHvItYJjZY5jU9v4i8Ztd7jgslMWLY8cVMmyMpLuRirbjKylBQ0QCYa/Qmk6e
         kM0nppdCbBEnYP6u2S/OXpRhJKeAjbz+eN+Org8Ep3AJh4XPzy9V2ZpPw5pzgNVB2qZa
         8N2fLwMwFjUSJlcM27PgQKyTL2MQ3gORyu0mzQgp2/xPEUb4HOjosqZsjMxKocBJzrD6
         pMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096074; x=1720700874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcYddQTs557WaY8VXLd9hjs1Dbhe1xGWiPt0JGCgizs=;
        b=TSxjee24nXNQOP3rI9bIeQoXA8CzzcMcXa8WfRTEMKaZiAmhX62NdLvjvbVAMtlN7z
         Wb0ygo1lEkgQXJ7eaHzpdIzKVXfn8kmY8Ae5hKhXVGziCSFbk9wb4bSxhBn2duONjAes
         HhW4qOFOUcIBo8KlcEF3ZozeslZMSRqLR4Ld9uON7RtaQYZjb7nK0bAh6GjpZw/51iXT
         J8sC7uy4NGkBInhteBysNZpxYt+ms5IDTx7V8zhlyz6mYnHYyGy6wOZ3W/hV5zpX6+X6
         yGQXq/9st1uD0YyvlALx+iqfOXPe1P377V6IjHDMYmyF6NX9hemrarSwYjA6btO2DQCy
         cTEg==
X-Gm-Message-State: AOJu0YyRpIKTD+47D7k8sSYSbB0LWcIWRkstfXi0JvPhiSJwe8mUV6X0
	D411abW9t/4lViy+GGHMpRNgQND00Gm6pfSujSmrVPRjuEs0a1G2vBgDIYjXIByAZvQIymY7ooz
	X
X-Google-Smtp-Source: AGHT+IGjurNsFK9loOcD9dH06O0OMVmil3VWeo0TJkFV0c6olIHqb3Ju2FDQByrci51UQkEkJVM2HA==
X-Received: by 2002:a17:903:1111:b0:1fa:2e4:204d with SMTP id d9443c01a7336-1fb33edfd04mr10980065ad.43.1720096048218;
        Thu, 04 Jul 2024 05:27:28 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/21] QEMU: Fix CVE-2024-3446 & CVE-2024-3567
Date: Thu,  4 Jul 2024 05:26:57 -0700
Message-Id: <9e22481ec84800b97d8908d57aed118895b16224.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201561

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2024-3446 - Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/eb546a3f49f45e6870ec91d792cd09f8a662c16e  && https://gitlab.com/qemu-project/qemu/-/commit/4f01537ced3e787bd985b8f8de5869b92657160a && https://gitlab.com/qemu-project/qemu/-/commit/fbeb0a160cbcc067c0e1f0d380cea4a31de213e3 && https://gitlab.com/qemu-project/qemu/-/commit/1b2a52712b249e14d246cd9c7db126088e6e64db

* CVE-2024-3567 - Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/1cfe45956e03070f894e91b304e233b4d5b99719

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  5 ++
 .../qemu/qemu/CVE-2024-3446-01.patch          | 73 +++++++++++++++++++
 .../qemu/qemu/CVE-2024-3446-02.patch          | 48 ++++++++++++
 .../qemu/qemu/CVE-2024-3446-03.patch          | 47 ++++++++++++
 .../qemu/qemu/CVE-2024-3446-04.patch          | 52 +++++++++++++
 .../qemu/qemu/CVE-2024-3567.patch             | 48 ++++++++++++
 6 files changed, 273 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4501f84c2b..d22bc31ce3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,6 +42,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-6683.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-3446-01.patch \
+           file://CVE-2024-3446-02.patch \
+           file://CVE-2024-3446-03.patch \
+           file://CVE-2024-3446-04.patch \
+           file://CVE-2024-3567.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
new file mode 100644
index 0000000000..15dbca92cd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
@@ -0,0 +1,73 @@
+rom eb546a3f49f45e6870ec91d792cd09f8a662c16e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Thu, 4 Apr 2024 20:56:11 +0200
+Subject: [PATCH] hw/virtio: Introduce virtio_bh_new_guarded() helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Introduce virtio_bh_new_guarded(), similar to qemu_bh_new_guarded()
+but using the transport memory guard, instead of the device one
+(there can only be one virtio device per virtio bus).
+
+Inspired-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-2-philmd@linaro.org>
+(cherry picked from commit ec0504b989ca61e03636384d3602b7bf07ffe4da)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/eb546a3f49f45e6870ec91d792cd09f8a662c16e]
+CVE: CVE-2024-3446
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/virtio/virtio.c         | 10 ++++++++++
+ include/hw/virtio/virtio.h |  7 +++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index 3a160f86e..8590b8971 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -4095,3 +4095,13 @@ static void virtio_register_types(void)
+ }
+ 
+ type_init(virtio_register_types)
++
++QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
++                                   QEMUBHFunc *cb, void *opaque,
++                                   const char *name)
++{
++    DeviceState *transport = qdev_get_parent_bus(dev)->parent;
++
++    return qemu_bh_new_full(cb, opaque, name,
++                            &transport->mem_reentrancy_guard);
++}
+diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
+index c8f72850b..7d5ffdc14 100644
+--- a/include/hw/virtio/virtio.h
++++ b/include/hw/virtio/virtio.h
+@@ -22,6 +22,7 @@
+ #include "standard-headers/linux/virtio_config.h"
+ #include "standard-headers/linux/virtio_ring.h"
+ #include "qom/object.h"
++#include "block/aio.h"
+ 
+ /*
+  * A guest should never accept this. It implies negotiation is broken
+@@ -508,4 +509,10 @@ static inline bool virtio_device_disabled(VirtIODevice *vdev)
+ bool virtio_legacy_allowed(VirtIODevice *vdev);
+ bool virtio_legacy_check_disabled(VirtIODevice *vdev);
+ 
++QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
++                                   QEMUBHFunc *cb, void *opaque,
++                                   const char *name);
++#define virtio_bh_new_guarded(dev, cb, opaque) \
++    virtio_bh_new_guarded_full((dev), (cb), (opaque), (stringify(cb)))
++
+ #endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
new file mode 100644
index 0000000000..843ed43ba8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
@@ -0,0 +1,48 @@
+From 4f01537ced3e787bd985b8f8de5869b92657160a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Thu, 4 Apr 2024 20:56:41 +0200
+Subject: [PATCH] hw/virtio/virtio-crypto: Protect from DMA re-entrancy bugs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
+so the bus and device use the same guard. Otherwise the
+DMA-reentrancy protection can be bypassed.
+
+Fixes: CVE-2024-3446
+Cc: qemu-stable@nongnu.org
+Suggested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-5-philmd@linaro.org>
+(cherry picked from commit f4729ec39ad97a42ceaa7b5697f84f440ea6e5dc)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4f01537ced3e787bd985b8f8de5869b92657160a]
+CVE: CVE-2024-3446
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/virtio/virtio-crypto.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 0e2cc8d5a..4aaced74b 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -1080,8 +1080,8 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
+         vcrypto->vqs[i].dataq =
+                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_dataq_bh);
+         vcrypto->vqs[i].dataq_bh =
+-                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->vqs[i],
+-                                     &dev->mem_reentrancy_guard);
++                 virtio_bh_new_guarded(dev, virtio_crypto_dataq_bh,
++                                       &vcrypto->vqs[i]);
+         vcrypto->vqs[i].vcrypto = vcrypto;
+     }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
new file mode 100644
index 0000000000..a24652dea3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
@@ -0,0 +1,47 @@
+From fbeb0a160cbcc067c0e1f0d380cea4a31de213e3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Thu, 4 Apr 2024 20:56:35 +0200
+Subject: [PATCH] hw/char/virtio-serial-bus: Protect from DMA re-entrancy bugs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
+so the bus and device use the same guard. Otherwise the
+DMA-reentrancy protection can be bypassed.
+
+Fixes: CVE-2024-3446
+Cc: qemu-stable@nongnu.org
+Suggested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-4-philmd@linaro.org>
+(cherry picked from commit b4295bff25f7b50de1d9cc94a9c6effd40056bca)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/fbeb0a160cbcc067c0e1f0d380cea4a31de213e3]
+CVE: CVE-2024-3446
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/char/virtio-serial-bus.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
+index dd619f073..1221fb7f1 100644
+--- a/hw/char/virtio-serial-bus.c
++++ b/hw/char/virtio-serial-bus.c
+@@ -985,8 +985,7 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
+         return;
+     }
+ 
+-    port->bh = qemu_bh_new_guarded(flush_queued_data_bh, port,
+-                                   &dev->mem_reentrancy_guard);
++    port->bh = virtio_bh_new_guarded(dev, flush_queued_data_bh, port);
+     port->elem = NULL;
+ }
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
new file mode 100644
index 0000000000..7f0293242d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
@@ -0,0 +1,52 @@
+From 1b2a52712b249e14d246cd9c7db126088e6e64db Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Thu, 4 Apr 2024 20:56:27 +0200
+Subject: [PATCH] hw/display/virtio-gpu: Protect from DMA re-entrancy bugs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+qemu-system-i386: warning: Blocked re-entrant IO on MemoryRegion: virtio-pci-common-virtio-gpu at addr: 0x6
+
+Fixes: CVE-2024-3446
+Cc: qemu-stable@nongnu.org
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Yongkang Jia <kangel@zju.edu.cn>
+Reported-by: Xiao Lei <nop.leixiao@gmail.com>
+Reported-by: Yiming Tao <taoym@zju.edu.cn>
+Buglink: https://bugs.launchpad.net/qemu/+bug/1888606
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-3-philmd@linaro.org>
+(cherry picked from commit ba28e0ff4d95b56dc334aac2730ab3651ffc3132)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1b2a52712b249e14d246cd9c7db126088e6e64db]
+CVE: CVE-2024-3446
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/display/virtio-gpu.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
+index b016d3bac..a7b16ba07 100644
+--- a/hw/display/virtio-gpu.c
++++ b/hw/display/virtio-gpu.c
+@@ -1463,10 +1463,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
+ 
+     g->ctrl_vq = virtio_get_queue(vdev, 0);
+     g->cursor_vq = virtio_get_queue(vdev, 1);
+-    g->ctrl_bh = qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
+-                                     &qdev->mem_reentrancy_guard);
+-    g->cursor_bh = qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
+-                                       &qdev->mem_reentrancy_guard);
++    g->ctrl_bh = virtio_bh_new_guarded(qdev, virtio_gpu_ctrl_bh, g);
++    g->cursor_bh = virtio_bh_new_guarded(qdev, virtio_gpu_cursor_bh, g);
+     g->reset_bh = qemu_bh_new(virtio_gpu_reset_bh, g);
+     qemu_cond_init(&g->reset_cond);
+     QTAILQ_INIT(&g->reslist);
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
new file mode 100644
index 0000000000..f14178f881
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
@@ -0,0 +1,48 @@
+From 1cfe45956e03070f894e91b304e233b4d5b99719 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
+Date: Tue, 9 Apr 2024 19:54:05 +0200
+Subject: [PATCH] hw/net/net_tx_pkt: Fix overrun in update_sctp_checksum()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If a fragmented packet size is too short, do not try to
+calculate its checksum.
+
+Fixes: CVE-2024-3567
+Cc: qemu-stable@nongnu.org
+Reported-by: Zheyu Ma <zheyuma97@gmail.com>
+Fixes: f199b13bc1 ("igb: Implement Tx SCTP CSO")
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2273
+Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
+Acked-by: Jason Wang <jasowang@redhat.com>
+Message-Id: <20240410070459.49112-1-philmd@linaro.org>
+(cherry picked from commit 83ddb3dbba2ee0f1767442ae6ee665058aeb1093)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1cfe45956e03070f894e91b304e233b4d5b99719]
+CVE: CVE-2024-3567
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ hw/net/net_tx_pkt.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
+index 2e5f58b3c..d40d508a1 100644
+--- a/hw/net/net_tx_pkt.c
++++ b/hw/net/net_tx_pkt.c
+@@ -141,6 +141,10 @@ bool net_tx_pkt_update_sctp_checksum(struct NetTxPkt *pkt)
+     uint32_t csum = 0;
+     struct iovec *pl_start_frag = pkt->vec + NET_TX_PKT_PL_START_FRAG;
+ 
++    if (iov_size(pl_start_frag, pkt->payload_frags) < 8 + sizeof(csum)) {
++        return false;
++    }
++
+     if (iov_from_buf(pl_start_frag, pkt->payload_frags, 8, &csum, sizeof(csum)) < sizeof(csum)) {
+         return false;
+     }
+-- 
+2.25.1
+
-- 
2.34.1


