Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE9AC43219
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 15:47:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.65533.1643816854007913695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 212FlWnv024554
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 212FlQXi023439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Feb 2022 07:47:28 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Feb 2022 07:47:27 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 6/8] qemu: fix CVE-2021-3748
Date: Wed, 2 Feb 2022 10:47:18 -0500
Message-ID: <20220202154720.18976-6-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220202154720.18976-1-sakib.sajal@windriver.com>
References: <20220202154720.18976-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 15:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161214

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3748.patch             | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 970aa96608..7648ce9a38 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -78,6 +78,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3595_2.patch \
            file://CVE-2021-3594.patch \
            file://CVE-2021-3713.patch \
+           file://CVE-2021-3748.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch
new file mode 100644
index 0000000000..4765f24739
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch
@@ -0,0 +1,127 @@
+From bacc200f623647632258f7efc0f098ac30dd4225 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Thu, 2 Sep 2021 13:44:12 +0800
+Subject: [PATCH 09/12] virtio-net: fix use after unmap/free for sg
+
+When mergeable buffer is enabled, we try to set the num_buffers after
+the virtqueue elem has been unmapped. This will lead several issues,
+E.g a use after free when the descriptor has an address which belongs
+to the non direct access region. In this case we use bounce buffer
+that is allocated during address_space_map() and freed during
+address_space_unmap().
+
+Fixing this by storing the elems temporarily in an array and delay the
+unmap after we set the the num_buffers.
+
+This addresses CVE-2021-3748.
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Fixes: fbe78f4f55c6 ("virtio-net support")
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [bedd7e93d01961fcb16a97ae45d93acf357e11f6]
+CVE: CVE-2021-3748
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/net/virtio-net.c | 39 ++++++++++++++++++++++++++++++++-------
+ 1 file changed, 32 insertions(+), 7 deletions(-)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index 9179013ac..df1d30e2c 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -1665,10 +1665,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+     VirtIONet *n = qemu_get_nic_opaque(nc);
+     VirtIONetQueue *q = virtio_net_get_subqueue(nc);
+     VirtIODevice *vdev = VIRTIO_DEVICE(n);
++    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
++    size_t lens[VIRTQUEUE_MAX_SIZE];
+     struct iovec mhdr_sg[VIRTQUEUE_MAX_SIZE];
+     struct virtio_net_hdr_mrg_rxbuf mhdr;
+     unsigned mhdr_cnt = 0;
+-    size_t offset, i, guest_offset;
++    size_t offset, i, guest_offset, j;
++    ssize_t err;
+ 
+     if (!virtio_net_can_receive(nc)) {
+         return -1;
+@@ -1699,6 +1702,12 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+ 
+         total = 0;
+ 
++        if (i == VIRTQUEUE_MAX_SIZE) {
++            virtio_error(vdev, "virtio-net unexpected long buffer chain");
++            err = size;
++            goto err;
++        }
++
+         elem = virtqueue_pop(q->rx_vq, sizeof(VirtQueueElement));
+         if (!elem) {
+             if (i) {
+@@ -1710,7 +1719,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+                              n->guest_hdr_len, n->host_hdr_len,
+                              vdev->guest_features);
+             }
+-            return -1;
++            err = -1;
++            goto err;
+         }
+ 
+         if (elem->in_num < 1) {
+@@ -1718,7 +1728,8 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+                          "virtio-net receive queue contains no in buffers");
+             virtqueue_detach_element(q->rx_vq, elem, 0);
+             g_free(elem);
+-            return -1;
++            err = -1;
++            goto err;
+         }
+ 
+         sg = elem->in_sg;
+@@ -1755,12 +1766,13 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+         if (!n->mergeable_rx_bufs && offset < size) {
+             virtqueue_unpop(q->rx_vq, elem, total);
+             g_free(elem);
+-            return size;
++            err = size;
++            goto err;
+         }
+ 
+-        /* signal other side */
+-        virtqueue_fill(q->rx_vq, elem, total, i++);
+-        g_free(elem);
++        elems[i] = elem;
++        lens[i] = total;
++        i++;
+     }
+ 
+     if (mhdr_cnt) {
+@@ -1770,10 +1782,23 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
+                      &mhdr.num_buffers, sizeof mhdr.num_buffers);
+     }
+ 
++    for (j = 0; j < i; j++) {
++        /* signal other side */
++        virtqueue_fill(q->rx_vq, elems[j], lens[j], j);
++        g_free(elems[j]);
++    }
++
+     virtqueue_flush(q->rx_vq, i);
+     virtio_notify(vdev, q->rx_vq);
+ 
+     return size;
++
++err:
++    for (j = 0; j < i; j++) {
++        g_free(elems[j]);
++    }
++
++    return err;
+ }
+ 
+ static ssize_t virtio_net_do_receive(NetClientState *nc, const uint8_t *buf,
+-- 
+2.31.1
+
-- 
2.33.0


