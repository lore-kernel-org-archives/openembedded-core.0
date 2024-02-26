Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E1C54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 10:43:39 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.17760.1708944211448159757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 02:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pr/XUWE2;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so1601547a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 02:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708944210; x=1709549010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2a6mZQ5zCOItyk3W8g7RV0WynZQFkJEpzqfY6yYb98=;
        b=Pr/XUWE2KeTaT5xBqv5Sb11vu6GfQDoztCdjDShwsZrP9Men+NGfxE4OfHKlunKQ9E
         1ckDbmATDJQJRiyZgrMxyqOP4kaCSM/RqesmUAoVa1c8XBfnjegs39Xj2obdq87Oeuze
         HApSm5cPKGJqx+umNFI/afhfxoshhUS63RgaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944210; x=1709549010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2a6mZQ5zCOItyk3W8g7RV0WynZQFkJEpzqfY6yYb98=;
        b=ouEArGXVT+xi6mF0OZ6Pl+bRLWFPFtjNAvIhactl2EYfkCHhM4xhMt+Fk2hLiRLrSU
         QzAEun5v5EFbhOM/dJFDXh8NdbcGwRXG36VxPO36QKxdjoMiJF4Nor+1skUn41y7q1g5
         dsuq+Fyy1B1sA9KcT1el+IAHVfPpUGY/WMjtsm2qQeo/c5WP+F5SFpV0sl4n3KV3e3AU
         Xh+d1Z+VVh1eLYvK9VwyBDipvPgVHPjyYDyg1dKVfq/Mv05js00nJZ0ytvfB1HOend8T
         NZOTOu6MpciD8Kv+GwuBGqljLu4BESBKnnyQiQ35xTPHfvxs6pJ8TGhz4KL9TL9HrlHO
         dskQ==
X-Gm-Message-State: AOJu0YyfBtxdMXePui08tsvbndYML2F5xDNBO25eG8uGidrosuuZqgVy
	6qAczoh8VaJJ0xhJS+7Ok4mTnpxJhd4OASz/Mqq2WrLN0iW/Shm8iNndvR5FySM0U/Q04ow1JXG
	t
X-Google-Smtp-Source: AGHT+IFSCFakiu5UMgI+8atvAlfUMvyL30MFqy885cdOYQRLP1gmUF/BTUu8OTKuQ3zHJhNxDsbexw==
X-Received: by 2002:a17:90a:c592:b0:29a:72bb:439f with SMTP id l18-20020a17090ac59200b0029a72bb439fmr4555797pjt.11.1708944209627;
        Mon, 26 Feb 2024 02:43:29 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.75.162.122])
        by smtp.googlemail.com with ESMTPSA id x92-20020a17090a6c6500b00298d8804ba8sm6726226pjj.46.2024.02.26.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:43:29 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] qemu: Backport fix CVE-2023-6693
Date: Mon, 26 Feb 2024 16:13:13 +0530
Message-Id: <20240226104313.1724097-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 10:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196198

Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/2220e8189fb94068dbad333228659fbac819abb0]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-6693.patch             | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6693.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c5fb9b1eab..c69d26fbed 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -103,6 +103,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2021-3638.patch \
 	   file://CVE-2023-1544.patch \
 	   file://CVE-2023-5088.patch \
+	   file://CVE-2023-6693.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6693.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-6693.patch
new file mode 100644
index 0000000000..b91f2e6902
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-6693.patch
@@ -0,0 +1,74 @@
+From 2220e8189fb94068dbad333228659fbac819abb0 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Tue, 2 Jan 2024 11:29:01 +0800
+Subject: [PATCH] virtio-net: correctly copy vnet header when flushing TX
+
+When HASH_REPORT is negotiated, the guest_hdr_len might be larger than
+the size of the mergeable rx buffer header. Using
+virtio_net_hdr_mrg_rxbuf during the header swap might lead a stack
+overflow in this case. Fixing this by using virtio_net_hdr_v1_hash
+instead.
+
+Reported-by: Xiao Lei <leixiao.nop@zju.edu.cn>
+Cc: Yuri Benditovich <yuri.benditovich@daynix.com>
+Cc: qemu-stable@nongnu.org
+Cc: Mauro Matteo Cascella <mcascell@redhat.com>
+Fixes: CVE-2023-6693
+Fixes: e22f0603fb2f ("virtio-net: reference implementation of hash report")
+Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/2220e8189fb94068dbad333228659fbac819abb0]
+CVE: CVE-2023-6693
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ hw/net/virtio-net.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index e1f474883..42e66697f 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -600,6 +600,11 @@ static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
+
+     n->mergeable_rx_bufs = mergeable_rx_bufs;
+
++    /*
++     * Note: when extending the vnet header, please make sure to
++     * change the vnet header copying logic in virtio_net_flush_tx()
++     * as well.
++     */
+     if (version_1) {
+         n->guest_hdr_len = hash_report ?
+             sizeof(struct virtio_net_hdr_v1_hash) :
+@@ -2520,7 +2525,7 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
+         ssize_t ret;
+         unsigned int out_num;
+         struct iovec sg[VIRTQUEUE_MAX_SIZE], sg2[VIRTQUEUE_MAX_SIZE + 1], *out_sg;
+-        struct virtio_net_hdr_mrg_rxbuf mhdr;
++        struct virtio_net_hdr_v1_hash vhdr;
+
+         elem = virtqueue_pop(q->tx_vq, sizeof(VirtQueueElement));
+         if (!elem) {
+@@ -2537,7 +2542,7 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
+         }
+
+         if (n->has_vnet_hdr) {
+-            if (iov_to_buf(out_sg, out_num, 0, &mhdr, n->guest_hdr_len) <
++            if (iov_to_buf(out_sg, out_num, 0, &vhdr, n->guest_hdr_len) <
+                 n->guest_hdr_len) {
+                 virtio_error(vdev, "virtio-net header incorrect");
+                 virtqueue_detach_element(q->tx_vq, elem, 0);
+@@ -2545,8 +2550,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
+                 return -EINVAL;
+             }
+             if (n->needs_vnet_hdr_swap) {
+-                virtio_net_hdr_swap(vdev, (void *) &mhdr);
+-                sg2[0].iov_base = &mhdr;
++                virtio_net_hdr_swap(vdev, (void *) &vhdr);
++                sg2[0].iov_base = &vhdr;
+                 sg2[0].iov_len = n->guest_hdr_len;
+                 out_num = iov_copy(&sg2[1], ARRAY_SIZE(sg2) - 1,
+                                    out_sg, out_num,
+--
+2.34.1
-- 
2.34.1


