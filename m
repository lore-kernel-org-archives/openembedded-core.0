Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3F5772A1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:38 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id sv5so919628pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=deTPyH6w01zEmWbaSuIC0ZE+Ld2LGYRQOh5fP2x00fY=;
	b=DbFrWcPd+GOZVyAgMXRG3tX0HqpD+j54P1YGo1sHZ/GtwtFONk0AFkbnOuysHkLqEQ
	PUfkx/1nnC13QptuedXBqVE4gACQ7U/4unfGpshsRehzw4cfMPRFkYCYfesiSebTTuxy
	G4w28RB3y8rTjyDApLTgYbacXD7VYCk9uDghA6xaylyozRv1YvgSgsd28oRvbb118Hkp
	fLP6DKII2iGlEc6bUYR4Hi55FknYI+1HES7z07cwhz+3ALZ55H2MVP4U1yBwPgmG561X
	206JDwxiOcCfDbtOmk1MhBV53ZpuXU5GIBnBE8hqtx7j/+OxBXArF6wOx7tb4f+zEMlH
	AGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=deTPyH6w01zEmWbaSuIC0ZE+Ld2LGYRQOh5fP2x00fY=;
	b=cQhGpMNlqkcF4tZtEcPEiQ6NZ2Qy7XtJ6AiUagrR13FDT1+Mk7sthumsLFZq2Sq4z/
	Rwt6LMV1IPBaOmi6awz6xfdeWnsnc9FNlwsBM/Z87dWGPSpfs9OF9D3u0QJRKnkwrFcb
	deeO/u0x2g6gu4v4m/rc1daxy/MDoRQzFP1fgZz0jJ8J4DkFwmuupmcT7Qi/KFPtMB+k
	HR33/TTJZ3/RxGLcPfuQkDCl59GU1QpS3PVFgQrNxlWxiZjL0qz2Nb0ztwm2ztyuRZ/d
	UTjdhlpO870C3eAsBSe36soLECUrCRvNnZ+qypnb5CRaE69uQ7bLmhDe4mZUjBi67aC9
	zMrg==
X-Gm-Message-State: AG10YORnXU8fhY6meain1scALptwrtbjTgT7XSUTkh5Zois5iGal5eJLh9JOpDNufIoD/Q==
X-Received: by 10.66.142.168 with SMTP id rx8mr30725986pab.16.1454800539545;
	Sat, 06 Feb 2016 15:15:39 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:55 -0800
Message-Id: <a989818bcb49a9e4b4fcabbdd805eed25f2bec8a.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 14/21] qemu: Security fix CVE-2015-7295
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:39 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7295 Qemu: net: virtio-net possible remote DoS

(From OE-Core rev: 74771f8c41aaede0ddfb86983c6841bd1f1c1f0f)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../qemu/qemu/CVE-2015-7295_1.patch                | 63 ++++++++++++++++++++++
 .../qemu/qemu/CVE-2015-7295_2.patch                | 58 ++++++++++++++++++++
 .../qemu/qemu/CVE-2015-7295_3.patch                | 52 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |  3 ++
 4 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
new file mode 100644
index 0000000..bc41c45
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
@@ -0,0 +1,63 @@
+From ce317461573bac12b10d67699b4ddf1f97cf066c Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:28 +0800
+Subject: [PATCH] virtio: introduce virtqueue_unmap_sg()
+
+Factor out sg unmapping logic. This will be reused by the patch that
+can discard descriptor.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Cc: Andrew James <andrew.james@hpe.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+
+Upstream-Status: Backport
+
+git.qemu.org/?p=qemu.git;a=commit;h=ce317461573bac12b10d67699b4ddf1f97cf066c
+
+CVE: CVE-2015-7295 patch #1
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/virtio/virtio.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+Index: qemu-2.2.0/hw/virtio/virtio.c
+===================================================================
+--- qemu-2.2.0.orig/hw/virtio/virtio.c
++++ qemu-2.2.0/hw/virtio/virtio.c
+@@ -240,14 +240,12 @@ int virtio_queue_empty(VirtQueue *vq)
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
+@@ -263,6 +261,14 @@ void virtqueue_fill(VirtQueue *vq, const
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
new file mode 100644
index 0000000..74debf4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
@@ -0,0 +1,58 @@
+From 29b9f5efd78ae0f9cc02dd169b6e80d2c404bade Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:29 +0800
+Subject: [PATCH] virtio: introduce virtqueue_discard()
+
+This patch introduces virtqueue_discard() to discard a descriptor and
+unmap the sgs. This will be used by the patch that will discard
+descriptor when packet is truncated.
+
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Upstream-Status: Backport
+
+git.qemu.org/?p=qemu.git;a=commit;h=29b9f5efd78ae0f9cc02dd169b6e80d2c404bade
+ 
+CVE: CVE-2015-7295 patch #2
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/virtio/virtio.c         | 7 +++++++
+ include/hw/virtio/virtio.h | 2 ++
+ 2 files changed, 9 insertions(+)
+
+Index: qemu-2.2.0/hw/virtio/virtio.c
+===================================================================
+--- qemu-2.2.0.orig/hw/virtio/virtio.c
++++ qemu-2.2.0/hw/virtio/virtio.c
+@@ -263,6 +263,13 @@ static void virtqueue_unmap_sg(VirtQueue
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
+Index: qemu-2.2.0/include/hw/virtio/virtio.h
+===================================================================
+--- qemu-2.2.0.orig/include/hw/virtio/virtio.h
++++ qemu-2.2.0/include/hw/virtio/virtio.h
+@@ -180,6 +180,8 @@ void virtio_del_queue(VirtIODevice *vdev
+ void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len);
+ void virtqueue_flush(VirtQueue *vq, unsigned int count);
++void virtqueue_discard(VirtQueue *vq, const VirtQueueElement *elem,
++                       unsigned int len);
+ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
+                     unsigned int len, unsigned int idx);
+ 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch
new file mode 100644
index 0000000..0f69e9c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch
@@ -0,0 +1,52 @@
+From 0cf33fb6b49a19de32859e2cdc6021334f448fb3 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Fri, 25 Sep 2015 13:21:30 +0800
+Subject: [PATCH] virtio-net: correctly drop truncated packets
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
+
+Upstream-Status: Backport
+
+git.qemu.org/?p=qemu.git;a=commit;h=0cf33fb6b49a19de32859e2cdc6021334f448fb3
+
+CVE: CVE-2015-7295 patch #3
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/virtio-net.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+Index: qemu-2.2.0/hw/net/virtio-net.c
+===================================================================
+--- qemu-2.2.0.orig/hw/net/virtio-net.c
++++ qemu-2.2.0/hw/net/virtio-net.c
+@@ -1070,13 +1070,7 @@ static ssize_t virtio_net_receive(NetCli
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index 66e928f..890a9b6 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -25,6 +25,9 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2015-7512.patch \
             file://CVE-2015-8345.patch \
             file://CVE-2016-1568.patch \
+            file://CVE-2015-7295_1.patch \
+            file://CVE-2015-7295_2.patch \
+            file://CVE-2015-7295_3.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-- 
2.3.5


