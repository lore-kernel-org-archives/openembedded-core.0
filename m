Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.3720.1586235612743820143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 22:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: ktNoK5UtNbmQnLHLIdAYXQtJqOcnDPaXu4QFcpBOGyPh3sjPPq3QgEeEUTgKmealzjhfiPAyt2
 me+Y7GJ3KuzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 22:00:06 -0700
IronPort-SDR: iIDFX86n3bjqOiLXG5x+mLmmmpxbZ8bFeQdyPqHMLvg2ughYGiKRhIUAVOg7iMHcLP/8SB2DVA
 gOvVUyoUcHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; 
   d="scan'208";a="361433502"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 22:00:05 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: fix CVE-2020-11102
Date: Tue,  7 Apr 2020 13:00:04 +0800
Message-Id: <1586235604-22114-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../qemu/qemu/CVE-2020-11102.patch                 | 148 +++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 530ee82..f17a046 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-Add-enable-disable-udev.patch \
 	   file://CVE-2020-7211.patch \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
+           file://CVE-2020-11102.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
new file mode 100644
index 0000000..e8f3e1d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-11102.patch
@@ -0,0 +1,148 @@
+From 8ffb7265af64ec81748335ec8f20e7ab542c3850 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Tue, 24 Mar 2020 22:57:22 +0530
+Subject: [PATCH] net: tulip: check frame size and r/w data length
+
+Tulip network driver while copying tx/rx buffers does not check
+frame size against r/w data length. This may lead to OOB buffer
+access. Add check to avoid it.
+
+Limit iterations over descriptors to avoid potential infinite
+loop issue in tulip_xmit_list_update.
+
+Reported-by: Li Qiang <pangpei.lq@antfin.com>
+Reported-by: Ziming Zhang <ezrakiez@gmail.com>
+Reported-by: Jason Wang <jasowang@redhat.com>
+Tested-by: Li Qiang <liq3ea@gmail.com>
+Reviewed-by: Li Qiang <liq3ea@gmail.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=8ffb7265af64ec81748335ec8f20e7ab542c3850]
+CVE: CVE-2020-11102
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ hw/net/tulip.c | 36 +++++++++++++++++++++++++++---------
+ 1 file changed, 27 insertions(+), 9 deletions(-)
+
+diff --git a/hw/net/tulip.c b/hw/net/tulip.c
+index cfac271..1295f51 100644
+--- a/hw/net/tulip.c
++++ b/hw/net/tulip.c
+@@ -170,6 +170,10 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct tulip_descriptor *desc)
+         } else {
+             len = s->rx_frame_len;
+         }
++
++        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
++            return;
++        }
+         pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
+             (s->rx_frame_size - s->rx_frame_len), len);
+         s->rx_frame_len -= len;
+@@ -181,6 +185,10 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct tulip_descriptor *desc)
+         } else {
+             len = s->rx_frame_len;
+         }
++
++        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
++            return;
++        }
+         pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
+             (s->rx_frame_size - s->rx_frame_len), len);
+         s->rx_frame_len -= len;
+@@ -227,7 +235,8 @@ static ssize_t tulip_receive(TULIPState *s, const uint8_t *buf, size_t size)
+ 
+     trace_tulip_receive(buf, size);
+ 
+-    if (size < 14 || size > 2048 || s->rx_frame_len || tulip_rx_stopped(s)) {
++    if (size < 14 || size > sizeof(s->rx_frame) - 4
++        || s->rx_frame_len || tulip_rx_stopped(s)) {
+         return 0;
+     }
+ 
+@@ -275,7 +284,6 @@ static ssize_t tulip_receive_nc(NetClientState *nc,
+     return tulip_receive(qemu_get_nic_opaque(nc), buf, size);
+ }
+ 
+-
+ static NetClientInfo net_tulip_info = {
+     .type = NET_CLIENT_DRIVER_NIC,
+     .size = sizeof(NICState),
+@@ -558,7 +566,7 @@ static void tulip_tx(TULIPState *s, struct tulip_descriptor *desc)
+         if ((s->csr[6] >> CSR6_OM_SHIFT) & CSR6_OM_MASK) {
+             /* Internal or external Loopback */
+             tulip_receive(s, s->tx_frame, s->tx_frame_len);
+-        } else {
++        } else if (s->tx_frame_len <= sizeof(s->tx_frame)) {
+             qemu_send_packet(qemu_get_queue(s->nic),
+                 s->tx_frame, s->tx_frame_len);
+         }
+@@ -570,23 +578,31 @@ static void tulip_tx(TULIPState *s, struct tulip_descriptor *desc)
+     }
+ }
+ 
+-static void tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor *desc)
++static int tulip_copy_tx_buffers(TULIPState *s, struct tulip_descriptor *desc)
+ {
+     int len1 = (desc->control >> TDES1_BUF1_SIZE_SHIFT) & TDES1_BUF1_SIZE_MASK;
+     int len2 = (desc->control >> TDES1_BUF2_SIZE_SHIFT) & TDES1_BUF2_SIZE_MASK;
+ 
++    if (s->tx_frame_len + len1 > sizeof(s->tx_frame)) {
++        return -1;
++    }
+     if (len1) {
+         pci_dma_read(&s->dev, desc->buf_addr1,
+             s->tx_frame + s->tx_frame_len, len1);
+         s->tx_frame_len += len1;
+     }
+ 
++    if (s->tx_frame_len + len2 > sizeof(s->tx_frame)) {
++        return -1;
++    }
+     if (len2) {
+         pci_dma_read(&s->dev, desc->buf_addr2,
+             s->tx_frame + s->tx_frame_len, len2);
+         s->tx_frame_len += len2;
+     }
+     desc->status = (len1 + len2) ? 0 : 0x7fffffff;
++
++    return 0;
+ }
+ 
+ static void tulip_setup_filter_addr(TULIPState *s, uint8_t *buf, int n)
+@@ -651,13 +667,15 @@ static uint32_t tulip_ts(TULIPState *s)
+ 
+ static void tulip_xmit_list_update(TULIPState *s)
+ {
++#define TULIP_DESC_MAX 128
++    uint8_t i = 0;
+     struct tulip_descriptor desc;
+ 
+     if (tulip_ts(s) != CSR5_TS_SUSPENDED) {
+         return;
+     }
+ 
+-    for (;;) {
++    for (i = 0; i < TULIP_DESC_MAX; i++) {
+         tulip_desc_read(s, s->current_tx_desc, &desc);
+         tulip_dump_tx_descriptor(s, &desc);
+ 
+@@ -675,10 +693,10 @@ static void tulip_xmit_list_update(TULIPState *s)
+                 s->tx_frame_len = 0;
+             }
+ 
+-            tulip_copy_tx_buffers(s, &desc);
+-
+-            if (desc.control & TDES1_LS) {
+-                tulip_tx(s, &desc);
++            if (!tulip_copy_tx_buffers(s, &desc)) {
++                if (desc.control & TDES1_LS) {
++                    tulip_tx(s, &desc);
++                }
+             }
+         }
+         tulip_desc_write(s, s->current_tx_desc, &desc);
+-- 
+1.8.3.1
+
-- 
2.7.4

