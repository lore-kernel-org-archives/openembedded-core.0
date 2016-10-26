Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4088C71B44
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 09:24:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q9OCoP022415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:24:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Oct 2016 02:24:11 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 17:18:05 +0800
Message-ID: <e6e78c955b51b83efabe4f30128dc92f1c08899f.1477469393.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1477469393.git.kai.kang@windriver.com>
References: <cover.1477469393.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemu: fix CVE-2016-7423 and CVE-2016-7908
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
X-List-Received-Date: Wed, 26 Oct 2016 09:24:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Issue: LIN9-1716
Issue: LIN9-1722

Backport patches to fix CVE-2016-7423 and CVE-2016-7908 of qemu.

(LOCAL REV: NOT UPSTREAM) -- Will send to oe-core on 20161026

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../qemu/qemu/0002-fix-CVE-2016-7423.patch         | 45 ++++++++++++++++
 .../qemu/qemu/0003-fix-CVE-2016-7908.patch         | 62 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  2 +
 3 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch b/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
new file mode 100644
index 0000000..fdf58a3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-fix-CVE-2016-7423.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2016-7423 from:
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=670e56d3ed
+
+CVE: CVE-2016-7423
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 670e56d3ed2918b3861d9216f2c0540d9e9ae0d5 Mon Sep 17 00:00:00 2001
+From: Li Qiang <liqiang6-s@360.cn>
+Date: Mon, 12 Sep 2016 18:14:11 +0530
+Subject: [PATCH] scsi: mptsas: use g_new0 to allocate MPTSASRequest object
+
+When processing IO request in mptsas, it uses g_new to allocate
+a 'req' object. If an error occurs before 'req->sreq' is
+allocated, It could lead to an OOB write in mptsas_free_request
+function. Use g_new0 to avoid it.
+
+Reported-by: Li Qiang <liqiang6-s@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <1473684251-17476-1-git-send-email-ppandit@redhat.com>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+---
+ hw/scsi/mptsas.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index 0e0a22f..eaae1bb 100644
+--- a/hw/scsi/mptsas.c
++++ b/hw/scsi/mptsas.c
+@@ -304,7 +304,7 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
+         goto bad;
+     }
+ 
+-    req = g_new(MPTSASRequest, 1);
++    req = g_new0(MPTSASRequest, 1);
+     QTAILQ_INSERT_TAIL(&s->pending, req, next);
+     req->scsi_io = *scsi_io;
+     req->dev = s;
+-- 
+2.9.3
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch b/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
new file mode 100644
index 0000000..05cc3d9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-fix-CVE-2016-7908.patch
@@ -0,0 +1,62 @@
+Upstream-Status: Backport
+
+Backport patch to fix CVE-2016-7908 from:
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=070c4b92b8c
+
+CVE: CVE-2016-7908
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 070c4b92b8cd5390889716677a0b92444d6e087a Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 22 Sep 2016 16:02:37 +0530
+Subject: [PATCH] net: mcf: limit buffer descriptor count
+
+ColdFire Fast Ethernet Controller uses buffer descriptors to manage
+data flow to/fro receive & transmit queues. While transmitting
+packets, it could continue to read buffer descriptors if a buffer
+descriptor has length of zero and has crafted values in bd.flags.
+Set upper limit to number of buffer descriptors.
+
+Reported-by: Li Qiang <liqiang6-s@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+---
+ hw/net/mcf_fec.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
+index 0ee8ad9..d31fea1 100644
+--- a/hw/net/mcf_fec.c
++++ b/hw/net/mcf_fec.c
+@@ -23,6 +23,7 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } while (0)
+ #define DPRINTF(fmt, ...) do {} while(0)
+ #endif
+ 
++#define FEC_MAX_DESC 1024
+ #define FEC_MAX_FRAME_SIZE 2032
+ 
+ typedef struct {
+@@ -149,7 +150,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
+     uint32_t addr;
+     mcf_fec_bd bd;
+     int frame_size;
+-    int len;
++    int len, descnt = 0;
+     uint8_t frame[FEC_MAX_FRAME_SIZE];
+     uint8_t *ptr;
+ 
+@@ -157,7 +158,7 @@ static void mcf_fec_do_tx(mcf_fec_state *s)
+     ptr = frame;
+     frame_size = 0;
+     addr = s->tx_descriptor;
+-    while (1) {
++    while (descnt++ < FEC_MAX_DESC) {
+         mcf_fec_read_bd(&bd, addr);
+         DPRINTF("tx_bd %x flags %04x len %d data %08x\n",
+                 addr, bd.flags, bd.length, bd.data);
+-- 
+2.9.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
index 90e4eec..a75bcdf 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
@@ -10,6 +10,8 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://pathlimit.patch \
             file://qemu-2.5.0-cflags.patch \
             file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
+            file://0002-fix-CVE-2016-7423.patch \
+            file://0003-fix-CVE-2016-7908.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.10.1


