Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777DAC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 07:23:14 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.44998.1719991388751643523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 00:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jLUyC/X/;
 spf=pass (domain: mvista.com, ip: 209.85.128.182, mailfrom: hprajapati@mvista.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64f4f96bbf9so22978007b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719991388; x=1720596188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pgSUvfLKv2FRMVoTDn04esQg1CUQckHf8GGUNTxinI0=;
        b=jLUyC/X/ob3T4+95w9tKzYvL9JagM45fbqWYsNho9sWd2tC0GHfJbh3tXabx/zGpO2
         vPFVPQ10pbGdhc0bFiBO7hBfJB77d9bycw/JAjwfkoHHOYA4Z+I09Zq2qhSjmpdAgaE6
         HvSaU70Jg/OPcS3/mKP0AUPzmplV7FuJXY7hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719991388; x=1720596188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgSUvfLKv2FRMVoTDn04esQg1CUQckHf8GGUNTxinI0=;
        b=mhK7C8xDjNyZoXM8LkZf0FVys68nYsi8sLomSGLHBcFw+FEj98g3rGwa2JvUWZIike
         1ilAOC4YnULThsfDnDJkbNZ+PWHuyQEVyxIeSlzcxHwg5M6x3pb84kiXnjeWfewu9JNc
         yj5eJDdQjFojVkFNjtiBMD7X/lZYw75rcOJbedwA3pT7Grs9ZoqaI6yV3Ozz5eVfYz2z
         ScTxSafyqQuRpthiCVt3Joq40v0VSYzk7odnJP21xWUiGag/e3TNZ6Tcdww3vSq03u8u
         KTNFoscGmGx1IBmGWuv6OMuz3yylu347oMDOqziGrr141N40QuJTvc0H9pw7jj7dgmlM
         xTrw==
X-Gm-Message-State: AOJu0YywfGzlmQYEu+dUKjvcY/Gf5kuk2iAuVMhqW7WuacmsgsJ6i1iQ
	uI2VCBTTS5EjUOeuD70P8sZmquTi0KWuqlzmNR7bRhWDLPNPIK2yucj7yvh21m/vwmL/nd9J08h
	J
X-Google-Smtp-Source: AGHT+IGHMiWqbt5dTlcw1qdXhqCGokIOfVnjGlHHBgouftmiZiNecPq7GE/Vwe/ti53V7qnPfKbsfA==
X-Received: by 2002:a05:690c:a9e:b0:620:3c10:527a with SMTP id 00721157ae682-64c7268293fmr150018697b3.15.1719991387621;
        Wed, 03 Jul 2024 00:23:07 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.251])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c405db0sm20682127b3.130.2024.07.03.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:23:07 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] QEMU: Fix CVE-2024-3446 & CVE-2024-3567
Date: Wed,  3 Jul 2024 12:52:39 +0530
Message-Id: <20240703072239.566036-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201456

Backport fixes for:

* CVE-2024-3446 - Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/eb546a3f49f45e6870ec91d792cd09f8a662c16e  && https://gitlab.com/qemu-project/qemu/-/commit/4f01537ced3e787bd985b8f8de5869b92657160a && https://gitlab.com/qemu-project/qemu/-/commit/fbeb0a160cbcc067c0e1f0d380cea4a31de213e3 && https://gitlab.com/qemu-project/qemu/-/commit/1b2a52712b249e14d246cd9c7db126088e6e64db

* CVE-2024-3567 - Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/commit/1cfe45956e03070f894e91b304e233b4d5b99719

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


