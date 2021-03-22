Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Z8cEUbmd2sKRijdUqGv9nge0kZSZCnxa9IdOSVC9ke5Q7c61oT2ajor5p3ewLaqJAXhE6EA3S8
 Kq1xD0Abf7VQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211563"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211563"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:41 -0700
IronPort-SDR: Pht9Fy0j8d0cavB6Qsg3U8Ct5zEmcyDqXwsgxcY36MD7IXbjGNe2M5FsuiTEn2GtUm+ybz2sN4
 WOwfgrpDB/JQ==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295114"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:40 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/25] qemu: fix CVE-2021-20203
Date: Mon, 22 Mar 2021 09:41:03 +0800
Message-Id: <0c6dfc8a04c5048f395765d50b3fe4ba8a36c4c6.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

net: vmxnet3: validate configuration values during activate

Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
CVE: CVE-2021-20203
Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20203.patch            | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 97f110cde5..482ca3d6e5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-28916.patch \
 	   file://CVE-2020-35517.patch \
 	   file://CVE-2020-29443.patch \
+	   file://CVE-2021-20203.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
new file mode 100644
index 0000000000..31440af0bd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
@@ -0,0 +1,74 @@
+From: Prasad J Pandit <pjp@fedoraproject.org>
+
+While activating device in vmxnet3_acticate_device(), it does not
+validate guest supplied configuration values against predefined
+minimum - maximum limits. This may lead to integer overflow or
+OOB access issues. Add checks to avoid it.
+
+Fixes: CVE-2021-20203
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913873
+Reported-by: Gaoning Pan <pgn@zju.edu.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+
+Upstream-Status: Acepted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07935.html]
+CVE: CVE-2021-20203
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ hw/net/vmxnet3.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
+index eff299f629..4a910ca971 100644
+--- a/hw/net/vmxnet3.c
++++ b/hw/net/vmxnet3.c
+@@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+     vmxnet3_setup_rx_filtering(s);
+     /* Cache fields from shared memory */
+     s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
++    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
+     VMW_CFPRN("MTU is %u", s->mtu);
+ 
+     s->max_rx_frags =
+@@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+         /* Read rings memory locations for TX queues */
+         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
+         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
++        if (size > VMXNET3_TX_RING_MAX_SIZE) {
++            size = VMXNET3_TX_RING_MAX_SIZE;
++        }
+ 
+         vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
+                           sizeof(struct Vmxnet3_TxDesc), false);
+@@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+         /* TXC ring */
+         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
+         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
++        if (size > VMXNET3_TC_RING_MAX_SIZE) {
++            size = VMXNET3_TC_RING_MAX_SIZE;
++        }
+         vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
+                           sizeof(struct Vmxnet3_TxCompDesc), true);
+         VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
+@@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+             /* RX rings */
+             pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
+             size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
++            if (size > VMXNET3_RX_RING_MAX_SIZE) {
++                size = VMXNET3_RX_RING_MAX_SIZE;
++            }
+             vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
+                               sizeof(struct Vmxnet3_RxDesc), false);
+             VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
+@@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
+         /* RXC ring */
+         pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
+         size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
++        if (size > VMXNET3_RC_RING_MAX_SIZE) {
++            size = VMXNET3_RC_RING_MAX_SIZE;
++        }
+         vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
+                           sizeof(struct Vmxnet3_RxCompDesc), true);
+         VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
+-- 
+2.29.2
+
-- 
2.30.2

