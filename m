Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7BEC52D73
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.30114.1722791374610951779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xjUrn4hD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7104f939aaaso3570242b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791374; x=1723396174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9wh7Ggn4hMSX27Osg06amV0n1dR/ojzNalqfIZ5EU0=;
        b=xjUrn4hDtgHxSN7l5SnWWM4z7+5dcihQBRiN0wkg1mQnhE6+PL3AOERr3nqvWiYdO7
         h0IwQPlPhyyC3j6GdfT8Ys2J6bGoYst8ncKcMvSF82RdGtOhH6VfNORdLXJ5Q8zR1nLM
         bgRFOlCHPnGR883/2h89lByagBoiEUl0JXVgXHCsv80+6Peh6vQslgiZVwrg3WUaDmLx
         7Gw3awrGU6qVFrhE1LtUb1mqM+lzyTMtwqJ3DgDj9gjoDBuVudLmbhudzLyjwtaP4T6L
         JWQIgFT3ZcQP6e4mu4vy4Stk93rxAYBeTuAw69rGc9tM67A9PAkAom9V8c/Sfzq/6jXT
         zSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791374; x=1723396174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9wh7Ggn4hMSX27Osg06amV0n1dR/ojzNalqfIZ5EU0=;
        b=ipzXRul1QdYwY9WvrxVslNy+sbdHLjMfPatK+3ZO897kjc8MNpRsbUFIeJUqUwj2pS
         tB+vwdENerZ31MY/ejn9jqWHZmmmqv5TtPbZ5c89b0Adc3WfBtUdH4g5ucjwEfxksLAp
         PyPHy7Fy+8jewjMhqG9n6GgBaJAK142sL+Bu9mrBgNm5iiCNJTsrAtkj1OP42EnA8YNd
         d0Qwi3NQhCU0xpJmggFyzWEeCOq8C5zvBOZT6gEzhjKvmX4cVsqtiZ/66TiNn7Too/eZ
         YBQ6DHXLQGl9ue06H4MWP1lcQPs9mRsm3JQg5gWd6XwH142s5OsvjyG1U54k7Onw7pXj
         Kyqw==
X-Gm-Message-State: AOJu0Yw7T9Zc41gsCBaU6XRDOMi5cUADkivKza8ZGoSz8tUBKlLF/1T/
	4/6x9i2LYbUE1AIwAPM+cnsbH3qnOEljJZYkZK6Lj3luayJS4hTSzt+vMLkecLckLVGyOWdRmgh
	wzI3YHw==
X-Google-Smtp-Source: AGHT+IHN78G+XfI1kBKVqn9ht+3KCi8qxrXNd7j/SHyiXhyEUs44Qf3bO2nHkgNIV92NqvLe9G1LQg==
X-Received: by 2002:a05:6a00:3e19:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-7106cfd77e7mr9549727b3a.14.1722791373656;
        Sun, 04 Aug 2024 10:09:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/18] qemu: upgrade 8.2.2 -> 8.2.3
Date: Sun,  4 Aug 2024 10:09:08 -0700
Message-Id: <1a6d502c04fad0d190bb665e9d454b85c0853fcc.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202964

From: Yogita Urade <yogita.urade@windriver.com>

This includes fix for: CVE-2024-26327, CVE-2024-26328 and CVE-2024-3447

General changelog for 8.2: https://wiki.qemu.org/ChangeLog/8.2

Droped 0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch,
CVE-2024-3446 and CVE-2024-3567 since already contained the fix.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...u-native_8.2.2.bb => qemu-native_8.2.3.bb} |  0
 ...e_8.2.2.bb => qemu-system-native_8.2.3.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  8 +-
 ...4-Handle-the-vsyscall-page-in-open_s.patch | 56 --------------
 .../qemu/qemu/CVE-2024-3446-01.patch          | 73 -------------------
 .../qemu/qemu/CVE-2024-3446-02.patch          | 48 ------------
 .../qemu/qemu/CVE-2024-3446-03.patch          | 47 ------------
 .../qemu/qemu/CVE-2024-3446-04.patch          | 52 -------------
 .../qemu/qemu/CVE-2024-3567.patch             | 48 ------------
 .../qemu/{qemu_8.2.2.bb => qemu_8.2.3.bb}     |  0
 10 files changed, 1 insertion(+), 331 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.2.bb => qemu-native_8.2.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.2.bb => qemu-system-native_8.2.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.2.bb => qemu_8.2.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.2.bb b/meta/recipes-devtools/qemu/qemu-native_8.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e121ae70cc..41af9ca045 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,18 +34,12 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fixedmeson.patch \
            file://no-pip.patch \
            file://4a8579ad8629b57a43daa62e46cc7af6e1078116.patch \
-           file://0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch \
            file://0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch \
            file://0003-linux-user-Add-strace-for-shmat.patch \
            file://0004-linux-user-Rewrite-target_shmat.patch \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
-           file://CVE-2024-3446-01.patch \
-           file://CVE-2024-3446-02.patch \
-           file://CVE-2024-3446-03.patch \
-           file://CVE-2024-3446-04.patch \
-           file://CVE-2024-3567.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -62,7 +56,7 @@ SRC_URI:append:class-native = " \
 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
         "
 
-SRC_URI[sha256sum] = "847346c1b82c1a54b2c38f6edbd85549edeb17430b7d4d3da12620e2962bc4f3"
+SRC_URI[sha256sum] = "dc747fb366809455317601c4876bd1f6829a32a23e83fb76e45ab12c2a569964"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
deleted file mode 100644
index 2eaebe883c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4517e2046610722879761bcdb60edbb2b929c848 Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Wed, 28 Feb 2024 10:25:14 -1000
-Subject: [PATCH 1/5] linux-user/x86_64: Handle the vsyscall page in
- open_self_maps_{2,4}
-
-This is the only case in which we expect to have no host memory backing
-for a guest memory page, because in general linux user processes cannot
-map any pages in the top half of the 64-bit address space.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2170
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- linux-user/syscall.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index a114f29a8..8307a8a61 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -7922,6 +7922,10 @@ static void open_self_maps_4(const struct open_self_maps_data *d,
-         path = "[heap]";
-     } else if (start == info->vdso) {
-         path = "[vdso]";
-+#ifdef TARGET_X86_64
-+    } else if (start == TARGET_VSYSCALL_PAGE) {
-+        path = "[vsyscall]";
-+#endif
-     }
- 
-     /* Except null device (MAP_ANON), adjust offset for this fragment. */
-@@ -8010,6 +8014,18 @@ static int open_self_maps_2(void *opaque, target_ulong guest_start,
-     uintptr_t host_start = (uintptr_t)g2h_untagged(guest_start);
-     uintptr_t host_last = (uintptr_t)g2h_untagged(guest_end - 1);
- 
-+#ifdef TARGET_X86_64
-+    /*
-+     * Because of the extremely high position of the page within the guest
-+     * virtual address space, this is not backed by host memory at all.
-+     * Therefore the loop below would fail.  This is the only instance
-+     * of not having host backing memory.
-+     */
-+    if (guest_start == TARGET_VSYSCALL_PAGE) {
-+        return open_self_maps_3(opaque, guest_start, guest_end, flags);
-+    }
-+#endif
-+
-     while (1) {
-         IntervalTreeNode *n =
-             interval_tree_iter_first(d->host_maps, host_start, host_start);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
deleted file mode 100644
index 15dbca92cd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-01.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-rom eb546a3f49f45e6870ec91d792cd09f8a662c16e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
-Date: Thu, 4 Apr 2024 20:56:11 +0200
-Subject: [PATCH] hw/virtio: Introduce virtio_bh_new_guarded() helper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Introduce virtio_bh_new_guarded(), similar to qemu_bh_new_guarded()
-but using the transport memory guard, instead of the device one
-(there can only be one virtio device per virtio bus).
-
-Inspired-by: Gerd Hoffmann <kraxel@redhat.com>
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-2-philmd@linaro.org>
-(cherry picked from commit ec0504b989ca61e03636384d3602b7bf07ffe4da)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/eb546a3f49f45e6870ec91d792cd09f8a662c16e]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/virtio/virtio.c         | 10 ++++++++++
- include/hw/virtio/virtio.h |  7 +++++++
- 2 files changed, 17 insertions(+)
-
-diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
-index 3a160f86e..8590b8971 100644
---- a/hw/virtio/virtio.c
-+++ b/hw/virtio/virtio.c
-@@ -4095,3 +4095,13 @@ static void virtio_register_types(void)
- }
- 
- type_init(virtio_register_types)
-+
-+QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
-+                                   QEMUBHFunc *cb, void *opaque,
-+                                   const char *name)
-+{
-+    DeviceState *transport = qdev_get_parent_bus(dev)->parent;
-+
-+    return qemu_bh_new_full(cb, opaque, name,
-+                            &transport->mem_reentrancy_guard);
-+}
-diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
-index c8f72850b..7d5ffdc14 100644
---- a/include/hw/virtio/virtio.h
-+++ b/include/hw/virtio/virtio.h
-@@ -22,6 +22,7 @@
- #include "standard-headers/linux/virtio_config.h"
- #include "standard-headers/linux/virtio_ring.h"
- #include "qom/object.h"
-+#include "block/aio.h"
- 
- /*
-  * A guest should never accept this. It implies negotiation is broken
-@@ -508,4 +509,10 @@ static inline bool virtio_device_disabled(VirtIODevice *vdev)
- bool virtio_legacy_allowed(VirtIODevice *vdev);
- bool virtio_legacy_check_disabled(VirtIODevice *vdev);
- 
-+QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
-+                                   QEMUBHFunc *cb, void *opaque,
-+                                   const char *name);
-+#define virtio_bh_new_guarded(dev, cb, opaque) \
-+    virtio_bh_new_guarded_full((dev), (cb), (opaque), (stringify(cb)))
-+
- #endif
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
deleted file mode 100644
index 843ed43ba8..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-02.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 4f01537ced3e787bd985b8f8de5869b92657160a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
-Date: Thu, 4 Apr 2024 20:56:41 +0200
-Subject: [PATCH] hw/virtio/virtio-crypto: Protect from DMA re-entrancy bugs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
-so the bus and device use the same guard. Otherwise the
-DMA-reentrancy protection can be bypassed.
-
-Fixes: CVE-2024-3446
-Cc: qemu-stable@nongnu.org
-Suggested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-5-philmd@linaro.org>
-(cherry picked from commit f4729ec39ad97a42ceaa7b5697f84f440ea6e5dc)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4f01537ced3e787bd985b8f8de5869b92657160a]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/virtio/virtio-crypto.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
-index 0e2cc8d5a..4aaced74b 100644
---- a/hw/virtio/virtio-crypto.c
-+++ b/hw/virtio/virtio-crypto.c
-@@ -1080,8 +1080,8 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
-         vcrypto->vqs[i].dataq =
-                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_dataq_bh);
-         vcrypto->vqs[i].dataq_bh =
--                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->vqs[i],
--                                     &dev->mem_reentrancy_guard);
-+                 virtio_bh_new_guarded(dev, virtio_crypto_dataq_bh,
-+                                       &vcrypto->vqs[i]);
-         vcrypto->vqs[i].vcrypto = vcrypto;
-     }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
deleted file mode 100644
index a24652dea3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-03.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fbeb0a160cbcc067c0e1f0d380cea4a31de213e3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
-Date: Thu, 4 Apr 2024 20:56:35 +0200
-Subject: [PATCH] hw/char/virtio-serial-bus: Protect from DMA re-entrancy bugs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
-so the bus and device use the same guard. Otherwise the
-DMA-reentrancy protection can be bypassed.
-
-Fixes: CVE-2024-3446
-Cc: qemu-stable@nongnu.org
-Suggested-by: Alexander Bulekov <alxndr@bu.edu>
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-4-philmd@linaro.org>
-(cherry picked from commit b4295bff25f7b50de1d9cc94a9c6effd40056bca)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/fbeb0a160cbcc067c0e1f0d380cea4a31de213e3]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/char/virtio-serial-bus.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
-index dd619f073..1221fb7f1 100644
---- a/hw/char/virtio-serial-bus.c
-+++ b/hw/char/virtio-serial-bus.c
-@@ -985,8 +985,7 @@ static void virtser_port_device_realize(DeviceState *dev, Error **errp)
-         return;
-     }
- 
--    port->bh = qemu_bh_new_guarded(flush_queued_data_bh, port,
--                                   &dev->mem_reentrancy_guard);
-+    port->bh = virtio_bh_new_guarded(dev, flush_queued_data_bh, port);
-     port->elem = NULL;
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
deleted file mode 100644
index 7f0293242d..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-04.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 1b2a52712b249e14d246cd9c7db126088e6e64db Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
-Date: Thu, 4 Apr 2024 20:56:27 +0200
-Subject: [PATCH] hw/display/virtio-gpu: Protect from DMA re-entrancy bugs
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-qemu-system-i386: warning: Blocked re-entrant IO on MemoryRegion: virtio-pci-common-virtio-gpu at addr: 0x6
-
-Fixes: CVE-2024-3446
-Cc: qemu-stable@nongnu.org
-Reported-by: Alexander Bulekov <alxndr@bu.edu>
-Reported-by: Yongkang Jia <kangel@zju.edu.cn>
-Reported-by: Xiao Lei <nop.leixiao@gmail.com>
-Reported-by: Yiming Tao <taoym@zju.edu.cn>
-Buglink: https://bugs.launchpad.net/qemu/+bug/1888606
-Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
-Acked-by: Michael S. Tsirkin <mst@redhat.com>
-Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
-Message-Id: <20240409105537.18308-3-philmd@linaro.org>
-(cherry picked from commit ba28e0ff4d95b56dc334aac2730ab3651ffc3132)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1b2a52712b249e14d246cd9c7db126088e6e64db]
-CVE: CVE-2024-3446
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/display/virtio-gpu.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
-index b016d3bac..a7b16ba07 100644
---- a/hw/display/virtio-gpu.c
-+++ b/hw/display/virtio-gpu.c
-@@ -1463,10 +1463,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
- 
-     g->ctrl_vq = virtio_get_queue(vdev, 0);
-     g->cursor_vq = virtio_get_queue(vdev, 1);
--    g->ctrl_bh = qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
--                                     &qdev->mem_reentrancy_guard);
--    g->cursor_bh = qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
--                                       &qdev->mem_reentrancy_guard);
-+    g->ctrl_bh = virtio_bh_new_guarded(qdev, virtio_gpu_ctrl_bh, g);
-+    g->cursor_bh = virtio_bh_new_guarded(qdev, virtio_gpu_cursor_bh, g);
-     g->reset_bh = qemu_bh_new(virtio_gpu_reset_bh, g);
-     qemu_cond_init(&g->reset_cond);
-     QTAILQ_INIT(&g->reslist);
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
deleted file mode 100644
index f14178f881..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2024-3567.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 1cfe45956e03070f894e91b304e233b4d5b99719 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
-Date: Tue, 9 Apr 2024 19:54:05 +0200
-Subject: [PATCH] hw/net/net_tx_pkt: Fix overrun in update_sctp_checksum()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If a fragmented packet size is too short, do not try to
-calculate its checksum.
-
-Fixes: CVE-2024-3567
-Cc: qemu-stable@nongnu.org
-Reported-by: Zheyu Ma <zheyuma97@gmail.com>
-Fixes: f199b13bc1 ("igb: Implement Tx SCTP CSO")
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2273
-Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
-Acked-by: Jason Wang <jasowang@redhat.com>
-Message-Id: <20240410070459.49112-1-philmd@linaro.org>
-(cherry picked from commit 83ddb3dbba2ee0f1767442ae6ee665058aeb1093)
-Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1cfe45956e03070f894e91b304e233b4d5b99719]
-CVE: CVE-2024-3567
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- hw/net/net_tx_pkt.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
-index 2e5f58b3c..d40d508a1 100644
---- a/hw/net/net_tx_pkt.c
-+++ b/hw/net/net_tx_pkt.c
-@@ -141,6 +141,10 @@ bool net_tx_pkt_update_sctp_checksum(struct NetTxPkt *pkt)
-     uint32_t csum = 0;
-     struct iovec *pl_start_frag = pkt->vec + NET_TX_PKT_PL_START_FRAG;
- 
-+    if (iov_size(pl_start_frag, pkt->payload_frags) < 8 + sizeof(csum)) {
-+        return false;
-+    }
-+
-     if (iov_from_buf(pl_start_frag, pkt->payload_frags, 8, &csum, sizeof(csum)) < sizeof(csum)) {
-         return false;
-     }
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.2.bb b/meta/recipes-devtools/qemu/qemu_8.2.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.3.bb
-- 
2.34.1


