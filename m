Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3BF97826C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBJAdSJ6017649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 02:39:28 -0800 (PST)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 19 Dec 2017 02:39:27 -0800
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Dec 2017 12:39:12 +0200
Message-ID: <1513679952-12639-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemu: CVE-2017-17381
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
X-List-Received-Date: Tue, 19 Dec 2017 10:39:28 -0000
Content-Type: text/plain

The Virtio Vring implementation in QEMU allows local OS guest users to
cause a denial of service (divide-by-zero error and QEMU process crash)
by unsetting vring alignment while updating Virtio rings.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-17381

Upstream patch:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=758ead31c7e17bf17a9ef2e0ca1c3e86ab296b43

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../qemu/qemu/CVE-2017-17381.patch                 | 72 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.1.bb          |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-17381.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-17381.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-17381.patch
new file mode 100644
index 0000000..416771c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2017-17381.patch
@@ -0,0 +1,72 @@
+From 758ead31c7e17bf17a9ef2e0ca1c3e86ab296b43 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Wed, 29 Nov 2017 23:14:27 +0530
+Subject: [PATCH] virtio: check VirtQueue Vring object is set
+
+A guest could attempt to use an uninitialised VirtQueue object
+or unset Vring.align leading to a arithmetic exception. Add check
+to avoid it.
+
+Upstream-Status: Backport
+CVE: CVE-2017-17381
+
+Reported-by: Zhangboxian <zhangboxian@huawei.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Cornelia Huck <cohuck@redhat.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ hw/virtio/virtio.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index 703e672..ad564b0 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -182,7 +182,7 @@ void virtio_queue_update_rings(VirtIODevice *vdev, int n)
+ {
+     VRing *vring = &vdev->vq[n].vring;
+ 
+-    if (!vring->desc) {
++    if (!vring->num || !vring->desc || !vring->align) {
+         /* not yet setup -> nothing to do */
+         return;
+     }
+@@ -1414,6 +1414,9 @@ void virtio_config_modern_writel(VirtIODevice *vdev,
+ 
+ void virtio_queue_set_addr(VirtIODevice *vdev, int n, hwaddr addr)
+ {
++    if (!vdev->vq[n].vring.num) {
++        return;
++    }
+     vdev->vq[n].vring.desc = addr;
+     virtio_queue_update_rings(vdev, n);
+ }
+@@ -1426,6 +1429,9 @@ hwaddr virtio_queue_get_addr(VirtIODevice *vdev, int n)
+ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
+                             hwaddr avail, hwaddr used)
+ {
++    if (!vdev->vq[n].vring.num) {
++        return;
++    }
+     vdev->vq[n].vring.desc = desc;
+     vdev->vq[n].vring.avail = avail;
+     vdev->vq[n].vring.used = used;
+@@ -1494,8 +1500,10 @@ void virtio_queue_set_align(VirtIODevice *vdev, int n, int align)
+      */
+     assert(k->has_variable_vring_alignment);
+ 
+-    vdev->vq[n].vring.align = align;
+-    virtio_queue_update_rings(vdev, n);
++    if (align) {
++        vdev->vq[n].vring.align = align;
++        virtio_queue_update_rings(vdev, n);
++    }
+ }
+ 
+ static bool virtio_queue_notify_aio_vq(VirtQueue *vq)
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.1.bb b/meta/recipes-devtools/qemu/qemu_2.10.1.bb
index 71cc74e..6c2dd58 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://chardev-connect-socket-to-a-spawned-command.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://ppc_locking.patch \
+           file://CVE-2017-17381.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.10.2


