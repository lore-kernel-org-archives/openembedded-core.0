Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545F7C5478C
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:30 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.101641.1709565809214330562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XDLpleTW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2997a92e23bso2758736a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565808; x=1710170608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZX8tKOxoDDMOLNT48N45wxGGxLgcFnS07hpckVCLkg4=;
        b=XDLpleTWtc67davy5zUfV6tsz4g/vCgcMW7npJu6BBd0fUMlDr6jSuFUK3sczJbp0s
         feceZCv/SGzaIYILYBGiCOxD9JFaJWv5P4t2K3JKU5mMOD7FjwUgSy5UQG5O7kBhNrdo
         7nt/xvq+Ue6Rn6VHSVhjjdoAop6rsaTKgYTrvr96UMtWcA6zDHG3QWUCeKsyalNYvkJv
         A7CXZGbp9+804rAw89G1IvrC4UyyNmezpDUtaBCtLzkjdkhC6pqyz+i+MHmwbbnu1yn+
         PIHZEI7tHvpwf8Y0madT9asTQPxbylpdZAXPScmynu1/QaKPCsc7AXm8QFy9HvvClLvP
         EuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565808; x=1710170608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX8tKOxoDDMOLNT48N45wxGGxLgcFnS07hpckVCLkg4=;
        b=bnbbcuGjonLOQVkXzez3R4k+3mR8zfFRNBZZHTVowdLoqkMLzY9YznuTqhpwz4S3lt
         z+zqz2lMOGhuIA+niSJ/U0krs6iM8PMpGHBGlIXGYopMknbrxtSW6GdTuZSkeE/0KLNx
         0hVrbAXhBCQnhshMCmWGNKk0X4xZ0FO1c6nFlPMzPxpxswcJENDnyZDwE3e9cHNnkHdH
         i8kFA2onGgil9z/TWt/1n9ptSAWMUInKYJtUO/eegBRySrdf6dZZbCoLlMwyeMfzsXKd
         6rQmeqTxVK4/ohCvC9I4sg9ZKAz8YPaImcbS3ln3xgtd3VbQIBOqHm9e53MqldSBwxom
         +Scw==
X-Gm-Message-State: AOJu0YxCal8/3N2Chjt8ZKgI5TjwfcunpLF4OYulqzQYgUZFD6NPwQ0z
	WQN8xZ9OTwcM0XNk/p2fXBMrE3T9p5JMnpGD8D0nCuoTyafF1hIvS96hBh8L/QLH9U5vcggfEP4
	icN0=
X-Google-Smtp-Source: AGHT+IEnUYYUXIKO3prl4KRqTgSo/IVnxXKXt4/T9QlxE95UVBeFo+U0j00kSIixOMLp/ClVNLkzlw==
X-Received: by 2002:a17:90a:3d45:b0:29b:125c:a97a with SMTP id o5-20020a17090a3d4500b0029b125ca97amr6205974pjf.43.1709565808517;
        Mon, 04 Mar 2024 07:23:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/11] qemu: Backport fix CVE-2023-6693
Date: Mon,  4 Mar 2024 05:23:09 -1000
Message-Id: <e993720fc31dbf94bed138b76ce33cbcd61ab9a5.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196602

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/2220e8189fb94068dbad333228659fbac819abb0]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-6693.patch             | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6693.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 18752af274..d3e6ced988 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -104,6 +104,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-1544.patch \
 	   file://CVE-2023-5088.patch \
 	   file://CVE-2024-24474.patch \
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


