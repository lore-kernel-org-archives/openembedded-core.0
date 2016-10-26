Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF60A71AAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 09:24:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q9OAaG027714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:24:10 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Oct 2016 02:24:10 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 17:18:04 +0800
Message-ID: <e8b8384fd2a9e827bf85caa5c1036521b22f54ae.1477469393.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1477469393.git.kai.kang@windriver.com>
References: <cover.1477469393.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] qemu: supplementary fix of CVE-2016-5403
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
X-List-Received-Date: Wed, 26 Oct 2016 09:24:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Issue: LIN9-1439

It is reported in qemu community that VM always exits with:

| 2016-10-17T07:33:40.393592Z qemu-kvm: Virtqueue size exceede

when VM is suspend and resume. Solution from the maintainer of virtio
is to merge following 3 commits:

http://git.qemu.org/?p=qemu.git;a=commit;h=bccdef6
http://git.qemu.org/?p=qemu.git;a=commit;h=58a83c6
http://git.qemu.org/?p=qemu.git;a=commit;h=4b7f91e

The first 2 commits have been merged in qemu 2.7.0. Then apply the
third one.

(LOCAL REV: NOT UPSTREAM) -- Will send to oe-core on 20161026

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...0001-virtio-zero-vq-inuse-in-virtio_reset.patch | 57 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch b/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
new file mode 100644
index 0000000..86955d0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-virtio-zero-vq-inuse-in-virtio_reset.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+
+Supplementary fix of CVE-2016-5403 which is backported from:
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=4b7f91e
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 4b7f91ed0270a371e1933efa21ba600b6da23ab9 Mon Sep 17 00:00:00 2001
+From: Stefan Hajnoczi <stefanha@redhat.com>
+Date: Wed, 7 Sep 2016 11:51:25 -0400
+Subject: [PATCH] virtio: zero vq->inuse in virtio_reset()
+
+vq->inuse must be zeroed upon device reset like most other virtqueue
+fields.
+
+In theory, virtio_reset() just needs assert(vq->inuse == 0) since
+devices must clean up in-flight requests during reset (requests cannot
+not be leaked!).
+
+In practice, it is difficult to achieve vq->inuse == 0 across reset
+because balloon, blk, 9p, etc implement various different strategies for
+cleaning up requests.  Most devices call g_free(elem) directly without
+telling virtio.c that the VirtQueueElement is cleaned up.  Therefore
+vq->inuse is not decremented during reset.
+
+This patch zeroes vq->inuse and trusts that devices are not leaking
+VirtQueueElements across reset.
+
+I will send a follow-up series that refactors request life-cycle across
+all devices and converts vq->inuse = 0 into assert(vq->inuse == 0) but
+this more invasive approach is not appropriate for stable trees.
+
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+Cc: qemu-stable <qemu-stable@nongnu.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Ladi Prosek <lprosek@redhat.com>
+---
+ hw/virtio/virtio.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index 74c085c..e8a13a5 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -822,6 +822,7 @@ void virtio_reset(void *opaque)
+         vdev->vq[i].signalled_used_valid = false;
+         vdev->vq[i].notification = true;
+         vdev->vq[i].vring.num = vdev->vq[i].vring.num_default;
++        vdev->vq[i].inuse = 0;
+     }
+ }
+ 
+-- 
+2.9.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
index 619b8ed..90e4eec 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
+            file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.10.1


