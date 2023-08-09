Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04261EB64DD
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 06:48:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.82820.1691563700435088481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 23:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gYmFiJls;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7585bf9412=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3795rbHY029387
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Aug 2023 23:48:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=vZU4+
	PTLjfO/C9FJs4QiAD6xKjAvy4CBWM+Vf6vBDIs=; b=gYmFiJlsslFvjTlZtxf3l
	0dg45pX1hmIRMJOCNPEsTc8Vni8XRrsy6GsVmxXr98pBHxICS7pKKA/HIo84ArTR
	lRlmaBUVtMhCoPjiLm+QszEdth6ro5oryvKLszo3NHHODgVTYGJ2ZfzZaMqBsUsr
	Ixuq7E4JV6vr4X4IRqUsFMcAuYcivqZB3LsdyPkNnCZ4nY/I5G/j0fgMG89cLjbf
	ZWHKmwnwKuK5Yp0G/zwDDou4QRELloeGzB7RgPv43lbVCLyl99qPfkNPxdOM81Sm
	qYmxQG0DIH2hllrSp/tZ6t4zQTWJzOUq30aHtBt1dBsRTOV7RixKfoMk6lgmigSK
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9hq0b9sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 23:48:19 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 23:48:17 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] qemu: fix CVE-2020-14394
Date: Wed, 9 Aug 2023 06:47:59 +0000
Message-ID: <20230809064759.1166968-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: YltUMXmUJMpg3glbft_UTQWWgCUi5EiC
X-Proofpoint-GUID: YltUMXmUJMpg3glbft_UTQWWgCUi5EiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_04,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308090059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 06:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185688

QEMU: infinite loop in xhci_ring_chain_length() in hw/usb/hcd-xhci.c

Reference:
https://gitlab.com/qemu-project/qemu/-/issues/646

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-14394.patch            | 79 +++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 96a1cc93a5..8182342f92 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -97,6 +97,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2023-3301.patch \
            file://CVE-2023-3255.patch \
            file://CVE-2023-2861.patch \
+	   file://CVE-2020-14394.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch
new file mode 100644
index 0000000000..aff91a7355
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-14394.patch
@@ -0,0 +1,79 @@
+From effaf5a240e03020f4ae953e10b764622c3e87cc Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Tue, 8 Aug 2023 10:44:51 +0000
+Subject: [PATCH] hw/usb/hcd-xhci: Fix unbounded loop in
+ xhci_ring_chain_length() (CVE-2020-14394)
+
+The loop condition in xhci_ring_chain_length() is under control of
+the guest, and additionally the code does not check for failed DMA
+transfers (e.g. if reaching the end of the RAM), so the loop there
+could run for a very long time or even forever. Fix it by checking
+the return value of dma_memory_read() and by introducing a maximum
+loop length.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
+Message-Id: <20220804131300.96368-1-thuth@redhat.com>
+Reviewed-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Acked-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2020-14394
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/effaf5a240e03020f4ae953e10b764622c3e87cc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/usb/hcd-xhci.c | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
+index 14bdb8967..c63a36dcc 100644
+--- a/hw/usb/hcd-xhci.c
++++ b/hw/usb/hcd-xhci.c
+@@ -21,6 +21,7 @@
+
+ #include "qemu/osdep.h"
+ #include "qemu/timer.h"
++#include "qemu/log.h"
+ #include "qemu/module.h"
+ #include "qemu/queue.h"
+ #include "migration/vmstate.h"
+@@ -725,10 +726,14 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
+     bool control_td_set = 0;
+     uint32_t link_cnt = 0;
+
+-    while (1) {
++    do {
+         TRBType type;
+-        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
+-                        MEMTXATTRS_UNSPECIFIED);
++	if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
++                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
++            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
++                          __func__);
++            return -1;
++	}
+         le64_to_cpus(&trb.parameter);
+         le32_to_cpus(&trb.status);
+         le32_to_cpus(&trb.control);
+@@ -762,7 +767,17 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
+         if (!control_td_set && !(trb.control & TRB_TR_CH)) {
+             return length;
+         }
+-    }
++
++	/*
++	 * According to the xHCI spec, Transfer Ring segments should have
++	 * a maximum size of 64 kB (see chapter "6 Data Structures")
++	 */
++    } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);
++
++    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum tranfer ring size!\n",
++                          __func__);
++
++    return -1;
+ }
+
+ static void xhci_er_reset(XHCIState *xhci, int v)
+--
+2.35.5
-- 
2.40.0


