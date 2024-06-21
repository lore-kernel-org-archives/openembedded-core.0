Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA2C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 12:16:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71588.1718972206168601735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 05:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=690294a050=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L3TQmo016577
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 12:16:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmrgtdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 12:16:45 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 05:16:41 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] qemu: fix CVE-2024-3446 and CVE-2024-3447
Date: Fri, 21 Jun 2024 12:16:21 +0000
Message-ID: <20240621121621.1315054-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: uzhpbc0Dzt3MGUTeX2Ah_CUUZkbXvB5D
X-Proofpoint-ORIG-GUID: uzhpbc0Dzt3MGUTeX2Ah_CUUZkbXvB5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406210091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45L3TQmo016577
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 12:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201021

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2024-3446:
A double free vulnerability was found in QEMU virtio devices
(virtio-gpu, virtio-serial-bus, virtio-crypto), where the
mem_reentrancy_guard flag insufficiently protects against DMA
reentrancy issues. This issue could allow a malicious privileged
guest to crash the QEMU process on the host, resulting in a d
enial of service or allow arbitrary code execution within the
context of the QEMU process on the host.

CVE-2024-3447:
QEMU: sdhci: heap buffer overflow in sdhci_write_dataport()

Fix indent issue in qemu.inc file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-3446
https://security-tracker.debian.org/tracker/CVE-2024-3447

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  23 +-
 .../qemu/qemu/CVE-2024-3446-0001.patch        | 136 +++++++++++
 .../qemu/qemu/CVE-2024-3446-0002.patch        | 218 ++++++++++++++++++
 .../qemu/qemu/CVE-2024-3446-0003.patch        |  68 ++++++
 .../qemu/qemu/CVE-2024-3446-0004.patch        | 141 +++++++++++
 .../qemu/qemu/CVE-2024-3446-0005.patch        |  41 ++++
 .../qemu/qemu/CVE-2024-3446-0006.patch        |  42 ++++
 .../qemu/qemu/CVE-2024-3447.patch             | 135 +++++++++++
 8 files changed, 796 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0003.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0004.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0005.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0006.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 4747310ae4..dba7c76f95 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -97,18 +97,25 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
            file://CVE-2023-3301.patch \
            file://CVE-2023-3255.patch \
            file://CVE-2023-2861.patch \
-	   file://CVE-2020-14394.patch \
-	   file://CVE-2023-3354.patch \
-	   file://CVE-2023-3180.patch \
-	   file://CVE-2021-3638.patch \
-	   file://CVE-2023-1544.patch \
-	   file://CVE-2023-5088.patch \
-	   file://CVE-2024-24474.patch \
-	   file://CVE-2023-6693.patch \
+           file://CVE-2020-14394.patch \
+           file://CVE-2023-3354.patch \
+           file://CVE-2023-3180.patch \
+           file://CVE-2021-3638.patch \
+           file://CVE-2023-1544.patch \
+           file://CVE-2023-5088.patch \
+           file://CVE-2024-24474.patch \
+           file://CVE-2023-6693.patch \
            file://scsi-disk-allow-MODE-SELECT-block-desriptor-to-set-the=
-block-size.patch \
            file://scsi-disk-ensure-block-size-is-non-zero-and-changes-li=
mited-to-bits-8-15.patch \
            file://CVE-2023-42467.patch \
            file://CVE-2023-6683.patch \
+           file://CVE-2024-3446-0001.patch \
+           file://CVE-2024-3446-0002.patch \
+           file://CVE-2024-3446-0003.patch \
+           file://CVE-2024-3446-0004.patch \
+           file://CVE-2024-3446-0005.patch \
+           file://CVE-2024-3446-0006.patch \
+           file://CVE-2024-3447.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch
new file mode 100644
index 0000000000..6c27751fac
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch
@@ -0,0 +1,136 @@
+From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 27 May 2024 10:12:28 +0000
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
+https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5=
KcknhPRD5fPBZA@mail.gmail.com
+
+Resolves: #62
+Resolves: #540
+Resolves: #541
+Resolves: #556
+Resolves: #557
+Resolves: #827
+Resolves: #1282
+
+Resolves: CVE-2023-0330
+
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
+[thuth: Replace warn_report() with warn_report_once()]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/a2e1753b8054344f32cf94f31c6399a58794a380]
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
++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access h=
otpath */
++    DeviceState *dev;
+
+     const MemoryRegionOps *ops;
+     void *opaque;
+@@ -757,6 +759,9 @@ struct MemoryRegion {
+     unsigned ioeventfd_nb;
+     MemoryRegionIoeventfd *ioeventfds;
+     RamDiscardManager *rdm; /* Only for RAM */
++
++    /* For devices designed to perform re-entrant IO into their own IO =
MRs */
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
++    /* Is the device currently in mmio/pio/dma? Used to prevent re-entr=
ancy */
++    MemReentrancyGuard mem_reentrancy_guard;
+ };
+
+ struct DeviceListener {
+diff --git a/softmmu/memory.c b/softmmu/memory.c
+index 7340e19ff..102f0a424 100644
+--- a/softmmu/memory.c
++++ b/softmmu/memory.c
+@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_size(hwaddr=
 addr,
+         access_size_max =3D 4;
+     }
+
++    /* Do not allow more than one simultaneous access to a device's IO =
Regions */
++    if (mr->dev && !mr->disable_reentrancy_guard &&
++        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly=
) {
++        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
++            warn_report_once("Blocked re-entrant IO on MemoryRegion: "
++                             "%s at addr: 0x%" HWADDR_PRIX,
++                             memory_region_name(mr), addr);
++            return MEMTX_ACCESS_ERROR;
++        }
++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D true;
++    }
++
+     /* FIXME: support unaligned access? */
+     access_size =3D MAX(MIN(size, access_size_max), access_size_min);
+     access_mask =3D MAKE_64BIT_MASK(0, access_size * 8);
+@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr =
addr,
+                         access_mask, attrs);
+         }
+     }
++    if (mr->dev) {
++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D false;
++    }
+     return r;
+ }
+
+@@ -1169,6 +1184,7 @@ static void memory_region_do_init(MemoryRegion *mr=
,
+     }
+     mr->name =3D g_strdup(name);
+     mr->owner =3D owner;
++    mr->dev =3D (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEV=
ICE);
+     mr->ram_block =3D NULL;
+
+     if (name) {
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch
new file mode 100644
index 0000000000..f33934bf85
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch
@@ -0,0 +1,218 @@
+From 9c86c97f12c060bf7484dd931f38634e166a81f0 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Mon, 27 May 2024 07:29:20 +0000
+Subject: [PATCH] async: Add an optional reentrancy guard to the BH API
+
+Devices can pass their MemoryReentrancyGuard (from their DeviceState),
+when creating new BHes. Then, the async API will toggle the guard
+before/after calling the BH call-back. This prevents bh->mmio reentrancy
+issues.
+
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
+Message-Id: <20230427211013.2994127-3-alxndr@bu.edu>
+[thuth: Fix "line over 90 characters" checkpatch.pl error]
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/9c86c97f12c060bf7484dd931f38634e166a81f0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ docs/devel/multiple-iothreads.txt |  7 +++++++
+ include/block/aio.h               | 18 ++++++++++++++++--
+ include/qemu/main-loop.h          |  8 +++++---
+ tests/unit/ptimer-test-stubs.c    |  3 ++-
+ util/async.c                      | 18 +++++++++++++++++-
+ util/main-loop.c                  |  6 ++++--
+ util/trace-events                 |  1 +
+ 7 files changed, 52 insertions(+), 9 deletions(-)
+
+diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iot=
hreads.txt
+index aeb997bed..a11576bc7 100644
+--- a/docs/devel/multiple-iothreads.txt
++++ b/docs/devel/multiple-iothreads.txt
+@@ -61,6 +61,7 @@ There are several old APIs that use the main loop AioC=
ontext:
+  * LEGACY qemu_aio_set_event_notifier() - monitor an event notifier
+  * LEGACY timer_new_ms() - create a timer
+  * LEGACY qemu_bh_new() - create a BH
++ * LEGACY qemu_bh_new_guarded() - create a BH with a device re-entrancy=
 guard
+  * LEGACY qemu_aio_wait() - run an event loop iteration
+
+ Since they implicitly work on the main loop they cannot be used in code=
 that
+@@ -72,8 +73,14 @@ Instead, use the AioContext functions directly (see i=
nclude/block/aio.h):
+  * aio_set_event_notifier() - monitor an event notifier
+  * aio_timer_new() - create a timer
+  * aio_bh_new() - create a BH
++ * aio_bh_new_guarded() - create a BH with a device re-entrancy guard
+  * aio_poll() - run an event loop iteration
+
++The qemu_bh_new_guarded/aio_bh_new_guarded APIs accept a "MemReentrancy=
Guard"
++argument, which is used to check for and prevent re-entrancy problems. =
For
++BHs associated with devices, the reentrancy-guard is contained in the
++corresponding DeviceState and named "mem_reentrancy_guard".
++
+ The AioContext can be obtained from the IOThread using
+ iothread_get_aio_context() or for the main loop using qemu_get_aio_cont=
ext().
+ Code that takes an AioContext argument works both in IOThreads or the m=
ain
+diff --git a/include/block/aio.h b/include/block/aio.h
+index 47fbe9d81..c7da15298 100644
+--- a/include/block/aio.h
++++ b/include/block/aio.h
+@@ -22,6 +22,8 @@
+ #include "qemu/event_notifier.h"
+ #include "qemu/thread.h"
+ #include "qemu/timer.h"
++#include "hw/qdev-core.h"
++
+
+ typedef struct BlockAIOCB BlockAIOCB;
+ typedef void BlockCompletionFunc(void *opaque, int ret);
+@@ -321,9 +323,11 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, =
QEMUBHFunc *cb, void *opaque,
+  * is opaque and must be allocated prior to its use.
+  *
+  * @name: A human-readable identifier for debugging purposes.
++ * @reentrancy_guard: A guard set when entering a cb to prevent
++ * device-reentrancy issues
+  */
+ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
+-                        const char *name);
++                        const char *name, MemReentrancyGuard *reentranc=
y_guard);
+
+ /**
+  * aio_bh_new: Allocate a new bottom half structure
+@@ -332,7 +336,17 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc=
 *cb, void *opaque,
+  * string.
+  */
+ #define aio_bh_new(ctx, cb, opaque) \
+-    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)))
++    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), NULL)
++
++/**
++ * aio_bh_new_guarded: Allocate a new bottom half structure with a
++ * reentrancy_guard
++ *
++ * A convenience wrapper for aio_bh_new_full() that uses the cb as the =
name
++ * string.
++ */
++#define aio_bh_new_guarded(ctx, cb, opaque, guard) \
++    aio_bh_new_full((ctx), (cb), (opaque), (stringify(cb)), guard)
+
+ /**
+  * aio_notify: Force processing of pending events.
+diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
+index 8dbc6fcb8..0a8f512be 100644
+--- a/include/qemu/main-loop.h
++++ b/include/qemu/main-loop.h
+@@ -293,10 +293,12 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, =
int ms);
+ /* internal interfaces */
+
+ void qemu_fd_register(int fd);
+-
++#define qemu_bh_new_guarded(cb, opaque, guard) \
++    qemu_bh_new_full((cb), (opaque), (stringify(cb)), guard)
+ #define qemu_bh_new(cb, opaque) \
+-    qemu_bh_new_full((cb), (opaque), (stringify(cb)))
+-QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name=
);
++    qemu_bh_new_full((cb), (opaque), (stringify(cb)), NULL)
++QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name=
,
++                         MemReentrancyGuard *reentrancy_guard);
+ void qemu_bh_schedule_idle(QEMUBH *bh);
+
+ enum {
+diff --git a/tests/unit/ptimer-test-stubs.c b/tests/unit/ptimer-test-stu=
bs.c
+index 2a3ef5879..a7a2d08e7 100644
+--- a/tests/unit/ptimer-test-stubs.c
++++ b/tests/unit/ptimer-test-stubs.c
+@@ -108,7 +108,8 @@ int64_t qemu_clock_deadline_ns_all(QEMUClockType typ=
e, int attr_mask)
+     return deadline;
+ }
+
+-QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name=
)
++QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name=
,
++                         MemReentrancyGuard *reentrancy_guard)
+ {
+     QEMUBH *bh =3D g_new(QEMUBH, 1);
+
+diff --git a/util/async.c b/util/async.c
+index 6f6717a34..3eb6b5016 100644
+--- a/util/async.c
++++ b/util/async.c
+@@ -62,6 +62,7 @@ struct QEMUBH {
+     void *opaque;
+     QSLIST_ENTRY(QEMUBH) next;
+     unsigned flags;
++    MemReentrancyGuard *reentrancy_guard;
+ };
+
+ /* Called concurrently from any thread */
+@@ -123,7 +124,7 @@ void aio_bh_schedule_oneshot_full(AioContext *ctx, Q=
EMUBHFunc *cb,
+ }
+
+ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFunc *cb, void *opaque,
+-                        const char *name)
++                        const char *name, MemReentrancyGuard *reentranc=
y_guard)
+ {
+     QEMUBH *bh;
+     bh =3D g_new(QEMUBH, 1);
+@@ -132,13 +133,28 @@ QEMUBH *aio_bh_new_full(AioContext *ctx, QEMUBHFun=
c *cb, void *opaque,
+         .cb =3D cb,
+         .opaque =3D opaque,
+         .name =3D name,
++        .reentrancy_guard =3D reentrancy_guard,
+     };
+     return bh;
+ }
+
+ void aio_bh_call(QEMUBH *bh)
+ {
++    bool last_engaged_in_io =3D false;
++
++    if (bh->reentrancy_guard) {
++        last_engaged_in_io =3D bh->reentrancy_guard->engaged_in_io;
++        if (bh->reentrancy_guard->engaged_in_io) {
++            trace_reentrant_aio(bh->ctx, bh->name);
++        }
++        bh->reentrancy_guard->engaged_in_io =3D true;
++    }
++
+     bh->cb(bh->opaque);
++
++    if (bh->reentrancy_guard) {
++        bh->reentrancy_guard->engaged_in_io =3D last_engaged_in_io;
++    }
+ }
+
+ /* Multiple occurrences of aio_bh_poll cannot be called concurrently. *=
/
+diff --git a/util/main-loop.c b/util/main-loop.c
+index 06b18b195..1eacf0469 100644
+--- a/util/main-loop.c
++++ b/util/main-loop.c
+@@ -544,9 +544,11 @@ void main_loop_wait(int nonblocking)
+
+ /* Functions to operate on the main QEMU AioContext.  */
+
+-QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name=
)
++QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name=
,
++                         MemReentrancyGuard *reentrancy_guard)
+ {
+-    return aio_bh_new_full(qemu_aio_context, cb, opaque, name);
++    return aio_bh_new_full(qemu_aio_context, cb, opaque, name,
++                           reentrancy_guard);
+ }
+
+ /*
+diff --git a/util/trace-events b/util/trace-events
+index c8f53d7d9..dc3b1eb3b 100644
+--- a/util/trace-events
++++ b/util/trace-events
+@@ -11,6 +11,7 @@ poll_remove(void *ctx, void *node, int fd) "ctx %p nod=
e %p fd %d"
+ # async.c
+ aio_co_schedule(void *ctx, void *co) "ctx %p co %p"
+ aio_co_schedule_bh_cb(void *ctx, void *co) "ctx %p co %p"
++reentrant_aio(void *ctx, const char *name) "ctx %p name %s"
+
+ # thread-pool.c
+ thread_pool_submit(void *pool, void *req, void *opaque) "pool %p req %p=
 opaque %p"
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0003.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0003.patch
new file mode 100644
index 0000000000..8f7fa1a569
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0003.patch
@@ -0,0 +1,68 @@
+From ec0504b989ca61e03636384d3602b7bf07ffe4da Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Mon, 27 May 2024 11:52:53 +0000
+Subject: [PATCH] hw/virtio: Introduce virtio_bh_new_guarded() helper
+
+Introduce virtio_bh_new_guarded(), similar to qemu_bh_new_guarded()
+but using the transport memory guard, instead of the device one
+(there can only be one virtio device per virtio bus).
+
+Inspired-by: Gerd Hoffmann <kraxel@redhat.com>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-2-philmd@linaro.org>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/ec0504b989ca61e03636384d3602b7bf07ffe4da]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/virtio/virtio.c         | 10 ++++++++++
+ include/hw/virtio/virtio.h |  7 +++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
+index e11a8a0db..be0b3ff9d 100644
+--- a/hw/virtio/virtio.c
++++ b/hw/virtio/virtio.c
+@@ -3876,3 +3876,13 @@ static void virtio_register_types(void)
+ }
+
+ type_init(virtio_register_types)
++
++QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
++                                   QEMUBHFunc *cb, void *opaque,
++                                   const char *name)
++{
++    DeviceState *transport =3D qdev_get_parent_bus(dev)->parent;
++
++    return qemu_bh_new_full(cb, opaque, name,
++                            &transport->mem_reentrancy_guard);
++}
+diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
+index 8bab9cfb7..731c631a8 100644
+--- a/include/hw/virtio/virtio.h
++++ b/include/hw/virtio/virtio.h
+@@ -22,6 +22,7 @@
+ #include "standard-headers/linux/virtio_config.h"
+ #include "standard-headers/linux/virtio_ring.h"
+ #include "qom/object.h"
++#include "block/aio.h"
+
+ /* A guest should never accept this.  It implies negotiation is broken.=
 */
+ #define VIRTIO_F_BAD_FEATURE		30
+@@ -397,4 +398,10 @@ static inline bool virtio_device_disabled(VirtIODev=
ice *vdev)
+ bool virtio_legacy_allowed(VirtIODevice *vdev);
+ bool virtio_legacy_check_disabled(VirtIODevice *vdev);
+
++QEMUBH *virtio_bh_new_guarded_full(DeviceState *dev,
++                                   QEMUBHFunc *cb, void *opaque,
++                                   const char *name);
++#define virtio_bh_new_guarded(dev, cb, opaque) \
++    virtio_bh_new_guarded_full((dev), (cb), (opaque), (stringify(cb)))
++
+ #endif
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0004.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0004.patch
new file mode 100644
index 0000000000..8b209491d8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0004.patch
@@ -0,0 +1,141 @@
+From ba28e0ff4d95b56dc334aac2730ab3651ffc3132 Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Tue, 28 May 2024 05:50:35 +0000
+Subject: [PATCH] hw/display/virtio-gpu: Protect from DMA re-entrancy bug=
s
+
+Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
+so the bus and device use the same guard. Otherwise the
+DMA-reentrancy protection can be bypassed:
+
+  $ cat << EOF | qemu-system-i386 -display none -nodefaults \
+                                  -machine q35,accel=3Dqtest \
+                                  -m 512M \
+                                  -device virtio-gpu \
+                                  -qtest stdio
+  outl 0xcf8 0x80000820
+  outl 0xcfc 0xe0004000
+  outl 0xcf8 0x80000804
+  outw 0xcfc 0x06
+  write 0xe0004030 0x4 0x024000e0
+  write 0xe0004028 0x1 0xff
+  write 0xe0004020 0x4 0x00009300
+  write 0xe000401c 0x1 0x01
+  write 0x101 0x1 0x04
+  write 0x103 0x1 0x1c
+  write 0x9301c8 0x1 0x18
+  write 0x105 0x1 0x1c
+  write 0x107 0x1 0x1c
+  write 0x109 0x1 0x1c
+  write 0x10b 0x1 0x00
+  write 0x10d 0x1 0x00
+  write 0x10f 0x1 0x00
+  write 0x111 0x1 0x00
+  write 0x113 0x1 0x00
+  write 0x115 0x1 0x00
+  write 0x117 0x1 0x00
+  write 0x119 0x1 0x00
+  write 0x11b 0x1 0x00
+  write 0x11d 0x1 0x00
+  write 0x11f 0x1 0x00
+  write 0x121 0x1 0x00
+  write 0x123 0x1 0x00
+  write 0x125 0x1 0x00
+  write 0x127 0x1 0x00
+  write 0x129 0x1 0x00
+  write 0x12b 0x1 0x00
+  write 0x12d 0x1 0x00
+  write 0x12f 0x1 0x00
+  write 0x131 0x1 0x00
+  write 0x133 0x1 0x00
+  write 0x135 0x1 0x00
+  write 0x137 0x1 0x00
+  write 0x139 0x1 0x00
+  write 0xe0007003 0x1 0x00
+  EOF
+  ...
+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+  =3D=3D276099=3D=3DERROR: AddressSanitizer: heap-use-after-free on addr=
ess 0x60d000011178
+  at pc 0x562cc3b736c7 bp 0x7ffed49dee60 sp 0x7ffed49dee58
+  READ of size 8 at 0x60d000011178 thread T0
+      #0 0x562cc3b736c6 in virtio_gpu_ctrl_response hw/display/virtio-gp=
u.c:180:42
+      #1 0x562cc3b7c40b in virtio_gpu_ctrl_response_nodata hw/display/vi=
rtio-gpu.c:192:5
+      #2 0x562cc3b7c40b in virtio_gpu_simple_process_cmd hw/display/virt=
io-gpu.c:1015:13
+      #3 0x562cc3b82873 in virtio_gpu_process_cmdq hw/display/virtio-gpu=
.c:1050:9
+      #4 0x562cc4a85514 in aio_bh_call util/async.c:169:5
+      #5 0x562cc4a85c52 in aio_bh_poll util/async.c:216:13
+      #6 0x562cc4a1a79b in aio_dispatch util/aio-posix.c:423:5
+      #7 0x562cc4a8a2da in aio_ctx_dispatch util/async.c:358:5
+      #8 0x7f36840547a8 in g_main_context_dispatch (/lib/x86_64-linux-gn=
u/libglib-2.0.so.0+0x547a8)
+      #9 0x562cc4a8b753 in glib_pollfds_poll util/main-loop.c:290:9
+      #10 0x562cc4a8b753 in os_host_main_loop_wait util/main-loop.c:313:=
5
+      #11 0x562cc4a8b753 in main_loop_wait util/main-loop.c:592:11
+      #12 0x562cc3938186 in qemu_main_loop system/runstate.c:782:9
+      #13 0x562cc43b7af5 in qemu_default_main system/main.c:37:14
+      #14 0x7f3683a6c189 in __libc_start_call_main csu/../sysdeps/nptl/l=
ibc_start_call_main.h:58:16
+      #15 0x7f3683a6c244 in __libc_start_main csu/../csu/libc-start.c:38=
1:3
+      #16 0x562cc2a58ac0 in _start (qemu-system-i386+0x231bac0)
+
+  0x60d000011178 is located 56 bytes inside of 136-byte region [0x60d000=
011140,0x60d0000111c8)
+  freed by thread T0 here:
+      #0 0x562cc2adb662 in __interceptor_free (qemu-system-i386+0x239e66=
2)
+      #1 0x562cc3b86b21 in virtio_gpu_reset hw/display/virtio-gpu.c:1524=
:9
+      #2 0x562cc416e20e in virtio_reset hw/virtio/virtio.c:2145:9
+      #3 0x562cc37c5644 in virtio_pci_reset hw/virtio/virtio-pci.c:2249:=
5
+      #4 0x562cc4233758 in memory_region_write_accessor system/memory.c:=
497:5
+      #5 0x562cc4232eea in access_with_adjusted_size system/memory.c:573=
:18
+
+  previously allocated by thread T0 here:
+      #0 0x562cc2adb90e in malloc (qemu-system-i386+0x239e90e)
+      #1 0x7f368405a678 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.s=
o.0+0x5a678)
+      #2 0x562cc4163ffc in virtqueue_split_pop hw/virtio/virtio.c:1612:1=
2
+      #3 0x562cc4163ffc in virtqueue_pop hw/virtio/virtio.c:1783:16
+      #4 0x562cc3b91a95 in virtio_gpu_handle_ctrl hw/display/virtio-gpu.=
c:1112:15
+      #5 0x562cc4a85514 in aio_bh_call util/async.c:169:5
+      #6 0x562cc4a85c52 in aio_bh_poll util/async.c:216:13
+      #7 0x562cc4a1a79b in aio_dispatch util/aio-posix.c:423:5
+
+  SUMMARY: AddressSanitizer: heap-use-after-free hw/display/virtio-gpu.c=
:180:42 in virtio_gpu_ctrl_response
+
+With this change, the same reproducer triggers:
+
+  qemu-system-i386: warning: Blocked re-entrant IO on MemoryRegion: virt=
io-pci-common-virtio-gpu at addr: 0x6
+
+Fixes: CVE-2024-3446
+Cc: qemu-stable@nongnu.org
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Yongkang Jia <kangel@zju.edu.cn>
+Reported-by: Xiao Lei <nop.leixiao@gmail.com>
+Reported-by: Yiming Tao <taoym@zju.edu.cn>
+Buglink: https://bugs.launchpad.net/qemu/+bug/1888606
+
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-3-philmd@linaro.org>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/ba28e0ff4d95b56dc334aac2730ab3651ffc3132]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/display/virtio-gpu.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
+index c6dc81898..5719ef6f1 100644
+--- a/hw/display/virtio-gpu.c
++++ b/hw/display/virtio-gpu.c
+@@ -1334,8 +1334,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, =
Error **errp)
+
+     g->ctrl_vq =3D virtio_get_queue(vdev, 0);
+     g->cursor_vq =3D virtio_get_queue(vdev, 1);
+-    g->ctrl_bh =3D qemu_bh_new(virtio_gpu_ctrl_bh, g);
+-    g->cursor_bh =3D qemu_bh_new(virtio_gpu_cursor_bh, g);
++    g->ctrl_bh =3D virtio_bh_new_guarded(qdev, virtio_gpu_ctrl_bh, g);
++    g->cursor_bh =3D virtio_bh_new_guarded(qdev, virtio_gpu_cursor_bh, =
g);
+     QTAILQ_INIT(&g->reslist);
+     QTAILQ_INIT(&g->cmdq);
+     QTAILQ_INIT(&g->fenceq);
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0005.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0005.patch
new file mode 100644
index 0000000000..0fe9554820
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0005.patch
@@ -0,0 +1,41 @@
+From b4295bff25f7b50de1d9cc94a9c6effd40056bca Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Tue, 28 May 2024 06:55:51 +0000
+Subject: [PATCH] hw/char/virtio-serial-bus: Protect from DMA re-entrancy=
 bugs
+
+Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
+so the bus and device use the same guard. Otherwise the
+DMA-reentrancy protection can be bypassed.
+
+Fixes: CVE-2024-3446
+Cc: qemu-stable@nongnu.org
+Suggested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-4-philmd@linaro.org>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/b4295bff25f7b50de1d9cc94a9c6effd40056bca]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/char/virtio-serial-bus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
+index f01ec2137..791b7ac59 100644
+--- a/hw/char/virtio-serial-bus.c
++++ b/hw/char/virtio-serial-bus.c
+@@ -985,7 +985,7 @@ static void virtser_port_device_realize(DeviceState =
*dev, Error **errp)
+         return;
+     }
+
+-    port->bh =3D qemu_bh_new(flush_queued_data_bh, port);
++    port->bh =3D virtio_bh_new_guarded(dev, flush_queued_data_bh, port)=
;
+     port->elem =3D NULL;
+ }
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0006.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0006.patch
new file mode 100644
index 0000000000..ad1a8fc202
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0006.patch
@@ -0,0 +1,42 @@
+From f4729ec39ad97a42ceaa7b5697f84f440ea6e5dc Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Tue, 28 May 2024 09:22:58 +0000
+Subject: [PATCH] hw/virtio/virtio-crypto: Protect from DMA re-entrancy b=
ugs
+
+Replace qemu_bh_new_guarded() by virtio_bh_new_guarded()
+so the bus and device use the same guard. Otherwise the
+DMA-reentrancy protection can be bypassed.
+
+Fixes: CVE-2024-3446
+Cc: qemu-stable@nongnu.org
+Suggested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20240409105537.18308-5-philmd@linaro.org>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/f4729ec39ad97a42ceaa7b5697f84f440ea6e5dc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/virtio/virtio-crypto.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 274c7b4de..5b0b71008 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -822,7 +822,8 @@ static void virtio_crypto_device_realize(DeviceState=
 *dev, Error **errp)
+         vcrypto->vqs[i].dataq =3D
+                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_data=
q_bh);
+         vcrypto->vqs[i].dataq_bh =3D
+-                 qemu_bh_new(virtio_crypto_dataq_bh, &vcrypto->vqs[i]);
++		 virtio_bh_new_guarded(dev, virtio_crypto_dataq_bh,
++                                       &vcrypto->vqs[i]);
+         vcrypto->vqs[i].vcrypto =3D vcrypto;
+     }
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2024-3447.patch
new file mode 100644
index 0000000000..174011c6b1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3447.patch
@@ -0,0 +1,135 @@
+From: 35a67d2aa8caf8eb0bee7d38515924c95417047e Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Tue, 28 May 2024 11:04:06 +0000
+Subject: [PATCH] hw/sd/sdhci: Do not update TRNMOD when Command Inhibit =
(DAT)
+ is set Per "SD Host Controller Standard Specification Version 3.00":
+
+  * 2.2.5 Transfer Mode Register (Offset 00Ch)
+
+    Writes to this register shall be ignored when the Command
+    Inhibit (DAT) in the Present State register is 1.
+
+Do not update the TRNMOD register when Command Inhibit (DAT)
+bit is set to avoid the present-status register going out of
+sync, leading to malicious guest using DMA mode and overflowing
+the FIFO buffer:
+
+  $ cat << EOF | qemu-system-i386 \
+                     -display none -nographic -nodefaults \
+                     -machine accel=3Dqtest -m 512M \
+                     -device sdhci-pci,sd-spec-version=3D3 \
+                     -device sd-card,drive=3Dmydrive \
+                     -drive if=3Dnone,index=3D0,file=3Dnull-co://,format=
=3Draw,id=3Dmydrive \
+                     -qtest stdio
+  outl 0xcf8 0x80001013
+  outl 0xcfc 0x91
+  outl 0xcf8 0x80001001
+  outl 0xcfc 0x06000000
+  write 0x9100002c 0x1 0x05
+  write 0x91000058 0x1 0x16
+  write 0x91000005 0x1 0x04
+  write 0x91000028 0x1 0x08
+  write 0x16 0x1 0x21
+  write 0x19 0x1 0x20
+  write 0x9100000c 0x1 0x01
+  write 0x9100000e 0x1 0x20
+  write 0x9100000f 0x1 0x00
+  write 0x9100000c 0x1 0x00
+  write 0x91000020 0x1 0x00
+  EOF
+
+Stack trace (part):
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D89993=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s
+0x615000029900 at pc 0x55d5f885700d bp 0x7ffc1e1e9470 sp 0x7ffc1e1e9468
+WRITE of size 1 at 0x615000029900 thread T0
+    #0 0x55d5f885700c in sdhci_write_dataport hw/sd/sdhci.c:564:39
+    #1 0x55d5f8849150 in sdhci_write hw/sd/sdhci.c:1223:13
+    #2 0x55d5fa01db63 in memory_region_write_accessor system/memory.c:49=
7:5
+    #3 0x55d5fa01d245 in access_with_adjusted_size system/memory.c:573:1=
8
+    #4 0x55d5fa01b1a9 in memory_region_dispatch_write system/memory.c:15=
21:16
+    #5 0x55d5fa09f5c9 in flatview_write_continue system/physmem.c:2711:2=
3
+    #6 0x55d5fa08f78b in flatview_write system/physmem.c:2753:12
+    #7 0x55d5fa08f258 in address_space_write system/physmem.c:2860:18
+    ...
+0x615000029900 is located 0 bytes to the right of 512-byte region
+[0x615000029700,0x615000029900) allocated by thread T0 here:
+    #0 0x55d5f7237b27 in __interceptor_calloc
+    #1 0x7f9e36dd4c50 in g_malloc0
+    #2 0x55d5f88672f7 in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
+    #3 0x55d5f844b582 in pci_qdev_realize hw/pci/pci.c:2092:9
+    #4 0x55d5fa2ee74b in device_set_realized hw/core/qdev.c:510:13
+    #5 0x55d5fa325bfb in property_set_bool qom/object.c:2358:5
+    #6 0x55d5fa31ea45 in object_property_set qom/object.c:1472:5
+    #7 0x55d5fa332509 in object_property_set_qobject om/qom-qobject.c:28=
:10
+    #8 0x55d5fa31f6ed in object_property_set_bool qom/object.c:1541:15
+    #9 0x55d5fa2e2948 in qdev_realize hw/core/qdev.c:292:12
+    #10 0x55d5f8eed3f1 in qdev_device_add_from_qdict system/qdev-monitor=
.c:719:10
+    #11 0x55d5f8eef7ff in qdev_device_add system/qdev-monitor.c:738:11
+    #12 0x55d5f8f211f0 in device_init_func system/vl.c:1200:11
+    #13 0x55d5fad0877d in qemu_opts_foreach util/qemu-option.c:1135:14
+    #14 0x55d5f8f0df9c in qemu_create_cli_devices system/vl.c:2638:5
+    #15 0x55d5f8f0db24 in qmp_x_exit_preconfig system/vl.c:2706:5
+    #16 0x55d5f8f14dc0 in qemu_init system/vl.c:3737:9
+    ...
+SUMMARY: AddressSanitizer: heap-buffer-overflow hw/sd/sdhci.c:564:39
+in sdhci_write_dataport
+
+Add assertions to ensure the fifo_buffer[] is not overflowed by
+malicious accesses to the Buffer Data Port register.
+
+Fixes: CVE-2024-3447
+Cc: qemu-stable@nongnu.org
+Fixes: d7dfca08 ("hw/sdhci: introduce standard SD host controller")
+Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D58813
+
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Chuhong Yuan <hslester96@gmail.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Message-Id: <CAFEAcA9iLiv1XGTGKeopgMa8Y9+8kvptvsb8z2OBeuy+5=3DNUfg@mail.=
gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Message-Id: <20240409145524.27913-1-philmd@linaro.org>
+
+CVE: CVE-2024-3447
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/35a67d2aa8caf8eb0bee7d38515924c95417047e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/sd/sdhci.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index e0bbc9034..211daa4bb 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -471,6 +471,7 @@ static uint32_t sdhci_read_dataport(SDHCIState *s, u=
nsigned size)
+     }
+
+     for (i =3D 0; i < size; i++) {
++        assert(s->data_count < s->buf_maxsz);
+         value |=3D s->fifo_buffer[s->data_count] << i * 8;
+         s->data_count++;
+         /* check if we've read all valid data (blksize bytes) from buff=
er */
+@@ -559,6 +560,7 @@ static void sdhci_write_dataport(SDHCIState *s, uint=
32_t value, unsigned size)
+     }
+
+     for (i =3D 0; i < size; i++) {
++        assert(s->data_count < s->buf_maxsz);
+         s->fifo_buffer[s->data_count] =3D value & 0xFF;
+         s->data_count++;
+         value >>=3D 8;
+@@ -1184,6 +1186,12 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
+         if (!(s->capareg & R_SDHC_CAPAB_SDMA_MASK)) {
+             value &=3D ~SDHC_TRNS_DMA;
+         }
++
++        /* TRNMOD writes are inhibited while Command Inhibit (DAT) is t=
rue */
++        if (s->prnsts & SDHC_DATA_INHIBIT) {
++            mask |=3D 0xffff;
++        }
++
+         MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
+         MASKED_WRITE(s->cmdreg, mask >> 16, value >> 16);
+
+--
+2.40.0
--=20
2.23.0


