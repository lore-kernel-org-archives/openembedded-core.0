Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D1FC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:15 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NHppgxw4;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224835; x=1675760835;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BxRlVEON8IVyEPziq5LUMoZMa0JvFqb6ozhkZJolmzU=;
  b=NHppgxw4DxEECguoo2sPm1XIqEAzSUyHgXr5nt1FSunHIcqqC8XaXaaT
   6jsu8agWL4/TXF4sR+rGenmXmysQDRYOZ/wkHdXwMnCsffoZsNweXWS7B
   UhrbapJm4kkrsV7goQzjgP2HqUqcDEAQY3oEUz/skpmQKqgpMhgck/ixw
   pDt9ybDYBDDqYQmlmrVU4w1a3yDvCKZSIlJFDBAig66oytRMOYhi3ureg
   tPuX0yTSQmOIwuevBFjoF2JsrF6hlWCICHeyYT8Y2my+kkvQnyxmaXpnM
   Ewlnym8/tzhd3X9TgowI8fF1hlAJUi0nPH4tBONmWRXhsSjE/xpdAcATa
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420786"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420786"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140394"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:10 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/12] qemu: fix CVE-2021-3748
Date: Mon,  7 Feb 2022 17:06:52 +0800
Message-Id: 
 <6fe3b1002a273808fe4caf6f2e1ecd54729b954d.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161445

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3748.patch             | 127 ++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3748.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3aad41088a..5c1c88db25 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -71,6 +71,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3608.patch \
            file://CVE-2021-3682.patch \
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
2.34.1


