Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB508CA5504
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 08:02:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6645.1694592172445910983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 01:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DgSvYsyy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7620aff610=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38D5V6kG030354
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=9Y+pPmy8gkY1sgFXtDF42lJZD9v+jab2m0BjxNgIvq4=; b=
	DgSvYsyyXg1ApIa1yl9kEX0IyHJ/y5GdvNSs+eehCHOu8wGoTf/MBw3MXVcpR4P4
	uSRLnjrncqjLYFs2AOq4RH9hEO1wma/ls3zqSLoDSK9LaGEwn7ukHgAMn8ZSrB5F
	vJm+idEdjGXZke2J5KFngsSy7MAMFQ0orhIAbWPAV7HDwYXF6/cnqKgMlNFUb1fz
	GWqUDGn61+FeWWK1kr6IPXF7xZ9LGQDgDw8OJqDs5EzXZzMTGVYGAl10FVzUu5S4
	imp4GqFBcl+gliZsASzvtefRPTicPW4Cw8dmY5pNFq5hrojlWRjP1G5f8TFC/wfk
	S8CQs0ZnG+BxnGIavd/jsQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8m8dt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:02:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:02:48 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 2/2] qemu: fix CVE-2023-0330
Date: Wed, 13 Sep 2023 08:02:29 +0000
Message-ID: <20230913080229.196711-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230913080229.196711-1-yogita.urade@windriver.com>
References: <20230913080229.196711-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: JIG0zUuM-9f86UsywsrvnrBC9U7Mxb70
X-Proofpoint-GUID: JIG0zUuM-9f86UsywsrvnrBC9U7Mxb70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309130066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187553

From: Yogita Urade <yogita.urade@windriver.com>

A DMA-MMIO reentrancy problem may lead to memory corruption bugs
like stack overflow or use-after-free.

Summary of the problem from Peter Maydell:
https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com

Reference:
https://gitlab.com/qemu-project/qemu/-/issues/556

qemu.git$ git log --no-merges --oneline   --grep CVE-2023-0330
b987718bbb hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI controller (CVE-2023-0330)
a2e1753b80 memory: prevent dma-reentracy issues

Included second commit as well as commit log of a2e1753b80 says it
resolves CVE-2023-0330

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 ...23-0330.patch => CVE-2023-0330-0001.patch} |   0
 .../qemu/qemu/CVE-2023-0330-0002.patch        | 136 ++++++++++++++++++
 3 files changed, 138 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch => CVE-2023-0330-0001.patch} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2efe63cdc0..1a50e4d524 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,7 +36,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://ppc.patch \
-	   file://CVE-2023-0330.patch \
+	   file://CVE-2023-0330-0001.patch \
+	   file://CVE-2023-0330-0002.patch \
 	   file://CVE-2023-3301.patch \
 	   file://CVE-2023-3255.patch \
 	   file://CVE-2023-2861.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
new file mode 100644
index 0000000000..a21b01bd25
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
@@ -0,0 +1,136 @@
+From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Tue, 12 Sep 2023 10:49:46 +0000
+Subject: [PATCH] memory: prevent dma-reentracy issues
+
+Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
+This flag is set/checked prior to calling a device's MemoryRegion
+handlers, and set when device code initiates DMA.  The purpose of this
+flag is to prevent two types of DMA-based reentrancy issues:
+
+1.) mmio -> dma -> mmio case
+2.) bh -> dma write -> mmio case
+
+These issues have led to problems such as stack-exhaustion and
+use-after-frees.
+
+Summary of the problem from Peter Maydell:
+https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
+Resolves: CVE-2023-0330
+
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
+[thuth: Replace warn_report() with warn_report_once()]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2023-0330
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/a2e1753b8054344f32cf94f31c6399a58794a380]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ include/exec/memory.h  |  5 +++++
+ include/hw/qdev-core.h |  7 +++++++
+ softmmu/memory.c       | 16 ++++++++++++++++
+ 3 files changed, 28 insertions(+)
+
+diff --git a/include/exec/memory.h b/include/exec/memory.h
+index 91f8a2395..124628ada 100644
+--- a/include/exec/memory.h
++++ b/include/exec/memory.h
+@@ -741,6 +741,8 @@ struct MemoryRegion {
+     bool is_iommu;
+     RAMBlock *ram_block;
+     Object *owner;
++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
++    DeviceState *dev;
+
+     const MemoryRegionOps *ops;
+     void *opaque;
+@@ -765,6 +767,9 @@ struct MemoryRegion {
+     unsigned ioeventfd_nb;
+     MemoryRegionIoeventfd *ioeventfds;
+     RamDiscardManager *rdm; /* Only for RAM */
++
++    /* For devices designed to perform re-entrant IO into their own IO MRs */
++    bool disable_reentrancy_guard;
+ };
+
+ struct IOMMUMemoryRegion {
+diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
+index 785dd5a56..886f6bb79 100644
+--- a/include/hw/qdev-core.h
++++ b/include/hw/qdev-core.h
+@@ -162,6 +162,10 @@ struct NamedClockList {
+     QLIST_ENTRY(NamedClockList) node;
+ };
+
++typedef struct {
++    bool engaged_in_io;
++} MemReentrancyGuard;
++
+ /**
+  * DeviceState:
+  * @realized: Indicates whether the device has been fully constructed.
+@@ -194,6 +198,9 @@ struct DeviceState {
+     int alias_required_for_version;
+     ResettableState reset;
+     GSList *unplug_blockers;
++
++    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
++    MemReentrancyGuard mem_reentrancy_guard;
+ };
+
+ struct DeviceListener {
+diff --git a/softmmu/memory.c b/softmmu/memory.c
+index bc0be3f62..0ad556b5b 100644
+--- a/softmmu/memory.c
++++ b/softmmu/memory.c
+@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
+     if (!access_size_max) {
+         access_size_max = 4;
+     }
++
++    /* Do not allow more than one simultaneous access to a device's IO Regions */
++    if (mr->dev && !mr->disable_reentrancy_guard &&
++        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
++        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
++            warn_report_once("Blocked re-entrant IO on MemoryRegion: "
++                             "%s at addr: 0x%" HWADDR_PRIX,
++                             memory_region_name(mr), addr);
++            return MEMTX_ACCESS_ERROR;
++        }
++        mr->dev->mem_reentrancy_guard.engaged_in_io = true;
++    }
+
+     /* FIXME: support unaligned access? */
+     access_size = MAX(MIN(size, access_size_max), access_size_min);
+@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
+                         access_mask, attrs);
+         }
+     }
++    if (mr->dev) {
++        mr->dev->mem_reentrancy_guard.engaged_in_io = false;
++    }
+     return r;
+ }
+
+@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRegion *mr,
+     }
+     mr->name = g_strdup(name);
+     mr->owner = owner;
++    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+     mr->ram_block = NULL;
+
+     if (name) {
+--
+2.35.5
-- 
2.40.0


