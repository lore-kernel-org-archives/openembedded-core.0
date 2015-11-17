Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1B27702B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:28:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAH5Ss2J027230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:28:54 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 Nov 2015 21:28:53 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Nov 2015 00:28:49 -0500
Message-ID: <7225dd1f4bcdff371ff505c41e188ed058ff41cd.1447737927.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447737927.git.wenzong.fan@windriver.com>
References: <cover.1447737927.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v2] qemu: fix CVE-2015-7295
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 05:28:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

hw/virtio/virtio.c in the Virtual Network Device (virtio-net) support
in QEMU, when big or mergeable receive buffers are not supported,
allows remote attackers to cause a denial of service (guest network
consumption) via a flood of jumbo frames on the (1) tuntap or (2)
macvtap interface.

Backport upstream commits:
http://git.qemu.org/?p=qemu.git;a=commit;h=ce317461573bac12b10d67699b4ddf1f97cf066c
http://git.qemu.org/?p=qemu.git;a=commit;h=29b9f5efd78ae0f9cc02dd169b6e80d2c404bade
http://git.qemu.org/?p=qemu.git;a=commit;h=0cf33fb6b49a19de32859e2cdc6021334f448fb3

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../qemu/qemu/qemu-CVE-2015-7295.patch             | 166 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.1.bb         |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-7295.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-7295.patch b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-7295.patch
new file mode 100644
index 0000000..0f4a1f5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-7295.patch
@@ -0,0 +1,166 @@
+Fix CVE-2015-7295
+
+Upstream-Status: Backport
+
+Backport upstream commits:
+http://git.qemu.org/?p=qemu.git;a=commit;h=ce317461573bac12b10d67699b4ddf1f97cf066c
+http://git.qemu.org/?p=qemu.git;a=commit;h=29b9f5efd78ae0f9cc02dd169b6e80d2c404bade
+http://git.qemu.org/?p=qemu.git;a=commit;h=0cf33fb6b49a19de32859e2cdc6021334f448fb3
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+======================================================
+From ce317461573bac12b10d67699b4ddf1f97cf066c Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:28 +0800
+Subject: [PATCH 1/3] virtio: introduce virtqueue_unmap_sg()
+
+Factor out sg unmapping logic. This will be reused by the patch that
+can discard descriptor.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Cc: Andrew James <andrew.james@hpe.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+---
+ hw/virtio/virtio.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index 7504f8b..6f2b96c 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -244,14 +244,12 @@ int virtio_queue_empty(VirtQueue *vq)
+     return vring_avail_idx(vq) == vq->last_avail_idx;
+ }
+ 
+-void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+-                    unsigned int len, unsigned int idx)
++static void virtqueue_unmap_sg(VirtQueue *vq, const VirtQueueElement *elem,
++                               unsigned int len)
+ {
+     unsigned int offset;
+     int i;
+ 
+-    trace_virtqueue_fill(vq, elem, len, idx);
+-
+     offset = 0;
+     for (i = 0; i < elem->in_num; i++) {
+         size_t size = MIN(len - offset, elem->in_sg[i].iov_len);
+@@ -267,6 +265,14 @@ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+         cpu_physical_memory_unmap(elem->out_sg[i].iov_base,
+                                   elem->out_sg[i].iov_len,
+                                   0, elem->out_sg[i].iov_len);
++}
++
++void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
++                    unsigned int len, unsigned int idx)
++{
++    trace_virtqueue_fill(vq, elem, len, idx);
++
++    virtqueue_unmap_sg(vq, elem, len);
+ 
+     idx = (idx + vring_used_idx(vq)) % vq->vring.num;
+ 
+-- 
+2.3.5
+
+
+From 29b9f5efd78ae0f9cc02dd169b6e80d2c404bade Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:29 +0800
+Subject: [PATCH 2/3] virtio: introduce virtqueue_discard()
+
+This patch introduces virtqueue_discard() to discard a descriptor and
+unmap the sgs. This will be used by the patch that will discard
+descriptor when packet is truncated.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+---
+ hw/virtio/virtio.c         | 7 +++++++
+ include/hw/virtio/virtio.h | 2 ++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index 6f2b96c..d0bc72e 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -267,6 +267,13 @@ static void virtqueue_unmap_sg(VirtQueue *vq, const VirtQueueElement *elem,
+                                   0, elem->out_sg[i].iov_len);
+ }
+ 
++void virtqueue_discard(VirtQueue *vq, const VirtQueueElement *elem,
++                       unsigned int len)
++{
++    vq->last_avail_idx--;
++    virtqueue_unmap_sg(vq, elem, len);
++}
++
+ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len, unsigned int idx)
+ {
+diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
+index 6201ee8..9d09115 100644
+--- a/include/hw/virtio/virtio.h
++++ b/include/hw/virtio/virtio.h
+@@ -146,6 +146,8 @@ void virtio_del_queue(VirtIODevice *vdev, int n);
+ void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len);
+ void virtqueue_flush(VirtQueue *vq, unsigned int count);
++void virtqueue_discard(VirtQueue *vq, const VirtQueueElement *elem,
++                       unsigned int len);
+ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len, unsigned int idx);
+ 
+-- 
+2.3.5
+
+
+From 0cf33fb6b49a19de32859e2cdc6021334f448fb3 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:30 +0800
+Subject: [PATCH 3/3] virtio-net: correctly drop truncated packets
+
+When packet is truncated during receiving, we drop the packets but
+neither discard the descriptor nor add and signal used
+descriptor. This will lead several issues:
+
+- sg mappings are leaked
+- rx will be stalled if a lots of packets were truncated
+
+In order to be consistent with vhost, fix by discarding the descriptor
+in this case.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+---
+ hw/net/virtio-net.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index d388c55..a877614 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -1094,13 +1094,7 @@ static ssize_t virtio_net_receive(NetClientState *nc, const uint8_t *buf, size_t
+          * must have consumed the complete packet.
+          * Otherwise, drop it. */
+         if (!n->mergeable_rx_bufs && offset < size) {
+-#if 0
+-            error_report("virtio-net truncated non-mergeable packet: "
+-                         "i %zd mergeable %d offset %zd, size %zd, "
+-                         "guest hdr len %zd, host hdr len %zd",
+-                         i, n->mergeable_rx_bufs,
+-                         offset, size, n->guest_hdr_len, n->host_hdr_len);
+-#endif
++            virtqueue_discard(q->rx_vq, &elem, total);
+             return size;
+         }
+ 
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
index d30645b..30a1c04 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.1.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
             file://qemu-CVE-2015-6855.patch \
+            file://qemu-CVE-2015-7295.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "c99445164e77184a9ba2e7dbf7ed5c29"
-- 
1.9.1


