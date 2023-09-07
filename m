Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7089AEE14D3
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 08:50:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8723.1694076638210861491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 01:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BYlp6KUL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7614fa9128=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3878A2dP027155
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 01:50:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=KgOFX
	YK1SQv0+OHy87DLElUhB4E/f9JX9HNL7fnf1Xc=; b=BYlp6KUL+RGwL0Dhw2mPZ
	FETmR9kdM07d+3XuNm7FQY3Gp7f8U9HpIbaDxl+lJEVly58irgkYnYhBCbCr9oRO
	+MjeG6He33yR6CFRBmgsUb/mWOBpTU+mNd4TYxgctxdkE/XK8/0eOGjfakfMl4JR
	L7maOO0LsqKRNgoqMwrhwvlFBXLi8pqZ0tN6yaM/KbqmE9MU+QcQB6IzvdYTcaef
	KNkO1qaMKgbyhYE9fJxp7Bq9Rf67ELaWoa4zKkuJlbKKxtdzS0BwVGQfXJ6Tcrhw
	WBTXAkVG+Z89oJLieAW3r8DT0TUSHpaRN+ttSaTvqKkseBFIVENOFMwbprM0n7Dd
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg43y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 01:50:37 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 01:50:35 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/2] qemu: fix CVE-2023-0330
Date: Thu, 7 Sep 2023 08:50:15 +0000
Message-ID: <20230907085016.2818537-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: dZX9avmCVCA_9B_U8UIJ44WoYr8700Qp
X-Proofpoint-GUID: dZX9avmCVCA_9B_U8UIJ44WoYr8700Qp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187365

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
 ...-2023-0330.patch => CVE-2023-0330_1.patch} |   0
 .../qemu/qemu/CVE-2023-0330_2.patch           | 136 ++++++++++++++++++
 3 files changed, 138 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch => CVE-2023-0330_1.patch} (100%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d77c376bb6..15c7465308 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -93,7 +93,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2022-4144.patch \
            file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch \
            file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
-           file://CVE-2023-0330.patch \
+           file://CVE-2023-0330_1.patch \
+	   file://CVE-2023-0330_2.patch \
            file://CVE-2023-3301.patch \
            file://CVE-2023-3255.patch \
            file://CVE-2023-2861.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_1.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330_1.patch
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
new file mode 100644
index 0000000000..a45ee0490a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330_2.patch
@@ -0,0 +1,136 @@
+From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Fri, 11 Aug 2023 07:41:04 +0000
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
+index 20f1b2737..e089f90f9 100644
+--- a/include/exec/memory.h
++++ b/include/exec/memory.h
+@@ -734,6 +734,8 @@ struct MemoryRegion {
+     bool is_iommu;
+     RAMBlock *ram_block;
+     Object *owner;
++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
++    DeviceState *dev;
+
+     const MemoryRegionOps *ops;
+     void *opaque;
+@@ -757,6 +759,9 @@ struct MemoryRegion {
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
+index 20d306659..14226f860 100644
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
+@@ -193,6 +197,9 @@ struct DeviceState {
+     int instance_id_alias;
+     int alias_required_for_version;
+     ResettableState reset;
++
++    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
++    MemReentrancyGuard mem_reentrancy_guard;
+ };
+
+ struct DeviceListener {
+diff --git a/softmmu/memory.c b/softmmu/memory.c
+index 7340e19ff..5d0ed6669 100644
+--- a/softmmu/memory.c
++++ b/softmmu/memory.c
+@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
+         access_size_max = 4;
+     }
+
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
++
+     /* FIXME: support unaligned access? */
+     access_size = MAX(MIN(size, access_size_max), access_size_min);
+     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
+@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
+                         access_mask, attrs);
+         }
+     }
++    if (mr->dev) {
++	mr->dev->mem_reentrancy_guard.engaged_in_io = false;
++    }
+     return r;
+ }
+
+@@ -1169,6 +1184,7 @@ static void memory_region_do_init(MemoryRegion *mr,
+     }
+     mr->name = g_strdup(name);
+     mr->owner = owner;
++    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+     mr->ram_block = NULL;
+
+     if (name) {
+--
+2.40.0
-- 
2.40.0


