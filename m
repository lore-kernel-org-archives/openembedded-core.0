Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E9FE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 05:24:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7245.1733289836715230122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 21:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2068a148a2=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B44X4gq009910
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 21:23:56 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7v4un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 21:23:56 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Dec 2024 21:23:53 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/2] qemu: fix CVE-2024-3446
Date: Wed, 4 Dec 2024 05:23:34 +0000
Message-ID: <20241204052335.323403-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: N92lgqFGQdJMWKJpaHfGKRvzHXWPNBo9
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674fe76c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8
 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=mLnsDVdbAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=pGLkceISAAAA:8 a=xhC5M8TBU7N-6NrgxyMA:9 a=MXjEtaH6gqThO6A_:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AkheI1RvQwOzcTXhi5f4:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=xnp1pY6zelCj5OLna2To:22 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: N92lgqFGQdJMWKJpaHfGKRvzHXWPNBo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_03,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412040042
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B44X4gq009910
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 05:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208227

From: Divya Chellam <divya.chellam@windriver.com>

A double free vulnerability was found in QEMU virtio devices
(virtio-gpu, virtio-serial-bus, virtio-crypto), where the
mem_reentrancy_guard flag insufficiently protects against DMA
reentrancy issues. This issue could allow a malicious privileged
guest to crash the QEMU process on the host, resulting in a d
enial of service or allow arbitrary code execution within the
context of the QEMU process on the host.

CVE-2024-3446-0004, CVE-2024-3446-0005, CVE-2024-3446-0006
are CVE fix and CVE-2024-3446-0001, CVE-2024-3446-0002,
CVE-2024-3446-0003 are dependent commits to fix the CVE.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-3446

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/9c86c97f12c060bf7484dd931f3=
8634e166a81f0
https://gitlab.com/qemu-project/qemu/-/commit/f63192b0544af5d3e4d5edfd85a=
b520fcf671377
https://gitlab.com/qemu-project/qemu/-/commit/ec0504b989ca61e03636384d360=
2b7bf07ffe4da
https://gitlab.com/qemu-project/qemu/-/commit/ba28e0ff4d95b56dc334aac2730=
ab3651ffc3132
https://gitlab.com/qemu-project/qemu/-/commit/b4295bff25f7b50de1d9cc94a9c=
6effd40056bca
https://gitlab.com/qemu-project/qemu/-/commit/f4729ec39ad97a42ceaa7b5697f=
84f440ea6e5dc

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   6 +
 .../qemu/qemu/CVE-2024-3446-0001.patch        | 218 +++++++++
 .../qemu/qemu/CVE-2024-3446-0002.patch        | 427 ++++++++++++++++++
 .../qemu/qemu/CVE-2024-3446-0003.patch        |  68 +++
 .../qemu/qemu/CVE-2024-3446-0004.patch        | 144 ++++++
 .../qemu/qemu/CVE-2024-3446-0005.patch        |  42 ++
 .../qemu/qemu/CVE-2024-3446-0006.patch        |  43 ++
 7 files changed, 948 insertions(+)
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

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 95d9c9de5a..c9b2d49c7f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -121,6 +121,12 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.=
tar.xz \
            file://CVE-2023-3019-0001.patch \
            file://CVE-2023-3019-0002.patch \
            file://CVE-2024-6505.patch \
+           file://CVE-2024-3446-0001.patch \
+           file://CVE-2024-3446-0002.patch \
+           file://CVE-2024-3446-0003.patch \
+           file://CVE-2024-3446-0004.patch \
+           file://CVE-2024-3446-0005.patch \
+           file://CVE-2024-3446-0006.patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch
new file mode 100644
index 0000000000..f33934bf85
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0001.patch
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
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch
new file mode 100644
index 0000000000..68a6e737da
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0002.patch
@@ -0,0 +1,427 @@
+From f63192b0544af5d3e4d5edfd85ab520fcf671377 Mon Sep 17 00:00:00 2001
+From: Alexander Bulekov <alxndr@bu.edu>
+Date: Thu, 27 Apr 2023 17:10:09 -0400
+Subject: [PATCH] hw: replace most qemu_bh_new calls with qemu_bh_new_gua=
rded
+
+This protects devices from bh->mmio reentrancy issues.
+
+Thanks: Thomas Huth <thuth@redhat.com> for diagnosing OS X test failure.
+Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Paul Durrant <paul@xen.org>
+Reviewed-by: Thomas Huth <thuth@redhat.com>
+Message-Id: <20230427211013.2994127-5-alxndr@bu.edu>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+CVE: CVE-2024-3446
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/f63192b0544af5d3e4d5edfd85ab520fcf671377]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/9pfs/xen-9p-backend.c        | 5 ++++-
+ hw/block/dataplane/virtio-blk.c | 3 ++-
+ hw/block/dataplane/xen-block.c  | 5 +++--
+ hw/char/virtio-serial-bus.c     | 3 ++-
+ hw/display/qxl.c                | 9 ++++++---
+ hw/display/virtio-gpu.c         | 6 ++++--
+ hw/ide/ahci.c                   | 3 ++-
+ hw/ide/ahci_internal.h          | 1 +
+ hw/ide/core.c                   | 4 +++-
+ hw/misc/imx_rngc.c              | 6 ++++--
+ hw/misc/macio/mac_dbdma.c       | 2 +-
+ hw/net/virtio-net.c             | 3 ++-
+ hw/scsi/mptsas.c                | 3 ++-
+ hw/scsi/scsi-bus.c              | 3 ++-
+ hw/scsi/vmw_pvscsi.c            | 3 ++-
+ hw/usb/dev-uas.c                | 3 ++-
+ hw/usb/hcd-dwc2.c               | 3 ++-
+ hw/usb/hcd-ehci.c               | 3 ++-
+ hw/usb/hcd-uhci.c               | 2 +-
+ hw/usb/host-libusb.c            | 6 ++++--
+ hw/usb/redirect.c               | 6 ++++--
+ hw/usb/xen-usb.c                | 3 ++-
+ hw/virtio/virtio-balloon.c      | 5 +++--
+ hw/virtio/virtio-crypto.c       | 3 ++-
+ 24 files changed, 62 insertions(+), 31 deletions(-)
+
+diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
+index 65c4979c3..09f7c1358 100644
+--- a/hw/9pfs/xen-9p-backend.c
++++ b/hw/9pfs/xen-9p-backend.c
+@@ -60,6 +60,7 @@ typedef struct Xen9pfsDev {
+
+     int num_rings;
+     Xen9pfsRing *rings;
++    MemReentrancyGuard mem_reentrancy_guard;
+ } Xen9pfsDev;
+
+ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev);
+@@ -441,7 +442,9 @@ static int xen_9pfs_connect(struct XenLegacyDevice *=
xendev)
+         xen_9pdev->rings[i].ring.out =3D xen_9pdev->rings[i].data +
+                                        XEN_FLEX_RING_SIZE(ring_order);
+
+-        xen_9pdev->rings[i].bh =3D qemu_bh_new(xen_9pfs_bh, &xen_9pdev-=
>rings[i]);
++        xen_9pdev->rings[i].bh =3D qemu_bh_new_guarded(xen_9pfs_bh,
++                                                     &xen_9pdev->rings[=
i],
++                                                     &xen_9pdev->mem_re=
entrancy_guard);
+         xen_9pdev->rings[i].out_cons =3D 0;
+         xen_9pdev->rings[i].out_size =3D 0;
+         xen_9pdev->rings[i].inprogress =3D false;
+diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio=
-blk.c
+index ee5a5352d..5f0de7da1 100644
+--- a/hw/block/dataplane/virtio-blk.c
++++ b/hw/block/dataplane/virtio-blk.c
+@@ -127,7 +127,8 @@ bool virtio_blk_data_plane_create(VirtIODevice *vdev=
, VirtIOBlkConf *conf,
+     } else {
+         s->ctx =3D qemu_get_aio_context();
+     }
+-    s->bh =3D aio_bh_new(s->ctx, notify_guest_bh, s);
++    s->bh =3D aio_bh_new_guarded(s->ctx, notify_guest_bh, s,
++                               &DEVICE(vdev)->mem_reentrancy_guard);
+     s->batch_notify_vqs =3D bitmap_new(conf->num_queues);
+
+     *dataplane =3D s;
+diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-blo=
ck.c
+index 860787580..07855feea 100644
+--- a/hw/block/dataplane/xen-block.c
++++ b/hw/block/dataplane/xen-block.c
+@@ -631,8 +631,9 @@ XenBlockDataPlane *xen_block_dataplane_create(XenDev=
ice *xendev,
+     } else {
+         dataplane->ctx =3D qemu_get_aio_context();
+     }
+-    dataplane->bh =3D aio_bh_new(dataplane->ctx, xen_block_dataplane_bh=
,
+-                               dataplane);
++    dataplane->bh =3D aio_bh_new_guarded(dataplane->ctx, xen_block_data=
plane_bh,
++                                       dataplane,
++                                       &DEVICE(xendev)->mem_reentrancy_=
guard);
+
+     return dataplane;
+ }
+diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
+index f01ec2137..f18124b15 100644
+--- a/hw/char/virtio-serial-bus.c
++++ b/hw/char/virtio-serial-bus.c
+@@ -985,7 +985,8 @@ static void virtser_port_device_realize(DeviceState =
*dev, Error **errp)
+         return;
+     }
+
+-    port->bh =3D qemu_bh_new(flush_queued_data_bh, port);
++    port->bh =3D qemu_bh_new_guarded(flush_queued_data_bh, port,
++                                   &dev->mem_reentrancy_guard);
+     port->elem =3D NULL;
+ }
+
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index 2a4b2d415..585254fc7 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -2205,11 +2205,14 @@ static void qxl_realize_common(PCIQXLDevice *qxl=
, Error **errp)
+
+     qemu_add_vm_change_state_handler(qxl_vm_change_state_handler, qxl);
+
+-    qxl->update_irq =3D qemu_bh_new(qxl_update_irq_bh, qxl);
++    qxl->update_irq =3D qemu_bh_new_guarded(qxl_update_irq_bh, qxl,
++                                          &DEVICE(qxl)->mem_reentrancy_=
guard);
+     qxl_reset_state(qxl);
+
+-    qxl->update_area_bh =3D qemu_bh_new(qxl_render_update_area_bh, qxl)=
;
+-    qxl->ssd.cursor_bh =3D qemu_bh_new(qemu_spice_cursor_refresh_bh, &q=
xl->ssd);
++    qxl->update_area_bh =3D qemu_bh_new_guarded(qxl_render_update_area_=
bh, qxl,
++                                              &DEVICE(qxl)->mem_reentra=
ncy_guard);
++    qxl->ssd.cursor_bh =3D qemu_bh_new_guarded(qemu_spice_cursor_refres=
h_bh, &qxl->ssd,
++                                             &DEVICE(qxl)->mem_reentran=
cy_guard);
+ }
+
+ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
+diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
+index c6dc81898..316469ab7 100644
+--- a/hw/display/virtio-gpu.c
++++ b/hw/display/virtio-gpu.c
+@@ -1334,8 +1334,10 @@ void virtio_gpu_device_realize(DeviceState *qdev,=
 Error **errp)
+
+     g->ctrl_vq =3D virtio_get_queue(vdev, 0);
+     g->cursor_vq =3D virtio_get_queue(vdev, 1);
+-    g->ctrl_bh =3D qemu_bh_new(virtio_gpu_ctrl_bh, g);
+-    g->cursor_bh =3D qemu_bh_new(virtio_gpu_cursor_bh, g);
++    g->ctrl_bh =3D qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
++                                     &qdev->mem_reentrancy_guard);
++    g->cursor_bh =3D qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
++                                       &qdev->mem_reentrancy_guard);
+     QTAILQ_INIT(&g->reslist);
+     QTAILQ_INIT(&g->cmdq);
+     QTAILQ_INIT(&g->fenceq);
+diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
+index 205dfdc66..f77d0faf0 100644
+--- a/hw/ide/ahci.c
++++ b/hw/ide/ahci.c
+@@ -1508,7 +1508,8 @@ static void ahci_cmd_done(const IDEDMA *dma)
+     ahci_write_fis_d2h(ad);
+
+     if (ad->port_regs.cmd_issue && !ad->check_bh) {
+-        ad->check_bh =3D qemu_bh_new(ahci_check_cmd_bh, ad);
++        ad->check_bh =3D qemu_bh_new_guarded(ahci_check_cmd_bh, ad,
++                                           &ad->mem_reentrancy_guard);
+         qemu_bh_schedule(ad->check_bh);
+     }
+ }
+diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
+index 109de9e2d..a7768dd69 100644
+--- a/hw/ide/ahci_internal.h
++++ b/hw/ide/ahci_internal.h
+@@ -321,6 +321,7 @@ struct AHCIDevice {
+     bool init_d2h_sent;
+     AHCICmdHdr *cur_cmd;
+     NCQTransferState ncq_tfs[AHCI_MAX_CMDS];
++    MemReentrancyGuard mem_reentrancy_guard;
+ };
+
+ struct AHCIPCIState {
+diff --git a/hw/ide/core.c b/hw/ide/core.c
+index 63998410a..0416f45a6 100644
+--- a/hw/ide/core.c
++++ b/hw/ide/core.c
+@@ -506,11 +506,13 @@ BlockAIOCB *ide_issue_trim(
+         BlockCompletionFunc *cb, void *cb_opaque, void *opaque)
+ {
+     IDEState *s =3D opaque;
++    IDEDevice *dev =3D s->unit ? s->bus->slave : s->bus->master;
+     TrimAIOCB *iocb;
+
+     iocb =3D blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
+     iocb->s =3D s;
+-    iocb->bh =3D qemu_bh_new(ide_trim_bh_cb, iocb);
++    iocb->bh =3D qemu_bh_new_guarded(ide_trim_bh_cb, iocb,
++                                   &DEVICE(dev)->mem_reentrancy_guard);
+     iocb->ret =3D 0;
+     iocb->qiov =3D qiov;
+     iocb->i =3D -1;
+diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
+index 632c03779..082c6980a 100644
+--- a/hw/misc/imx_rngc.c
++++ b/hw/misc/imx_rngc.c
+@@ -228,8 +228,10 @@ static void imx_rngc_realize(DeviceState *dev, Erro=
r **errp)
+     sysbus_init_mmio(sbd, &s->iomem);
+
+     sysbus_init_irq(sbd, &s->irq);
+-    s->self_test_bh =3D qemu_bh_new(imx_rngc_self_test, s);
+-    s->seed_bh =3D qemu_bh_new(imx_rngc_seed, s);
++    s->self_test_bh =3D qemu_bh_new_guarded(imx_rngc_self_test, s,
++                                          &dev->mem_reentrancy_guard);
++    s->seed_bh =3D qemu_bh_new_guarded(imx_rngc_seed, s,
++                                     &dev->mem_reentrancy_guard);
+ }
+
+ static void imx_rngc_reset(DeviceState *dev)
+diff --git a/hw/misc/macio/mac_dbdma.c b/hw/misc/macio/mac_dbdma.c
+index efcc02609..cc7e02203 100644
+--- a/hw/misc/macio/mac_dbdma.c
++++ b/hw/misc/macio/mac_dbdma.c
+@@ -914,7 +914,7 @@ static void mac_dbdma_realize(DeviceState *dev, Erro=
r **errp)
+ {
+     DBDMAState *s =3D MAC_DBDMA(dev);
+
+-    s->bh =3D qemu_bh_new(DBDMA_run_bh, s);
++    s->bh =3D qemu_bh_new_guarded(DBDMA_run_bh, s, &dev->mem_reentrancy=
_guard);
+ }
+
+ static void mac_dbdma_class_init(ObjectClass *oc, void *data)
+diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
+index 9127d03db..a1d65b2f2 100644
+--- a/hw/net/virtio-net.c
++++ b/hw/net/virtio-net.c
+@@ -2744,7 +2744,8 @@ static void virtio_net_add_queue(VirtIONet *n, int=
 index)
+         n->vqs[index].tx_vq =3D
+             virtio_add_queue(vdev, n->net_conf.tx_queue_size,
+                              virtio_net_handle_tx_bh);
+-        n->vqs[index].tx_bh =3D qemu_bh_new(virtio_net_tx_bh, &n->vqs[i=
ndex]);
++        n->vqs[index].tx_bh =3D qemu_bh_new_guarded(virtio_net_tx_bh, &=
n->vqs[index],
++                                                  &DEVICE(vdev)->mem_re=
entrancy_guard);
+     }
+
+     n->vqs[index].tx_waiting =3D 0;
+diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
+index 5181b0c0b..8487138cb 100644
+--- a/hw/scsi/mptsas.c
++++ b/hw/scsi/mptsas.c
+@@ -1321,7 +1321,8 @@ static void mptsas_scsi_realize(PCIDevice *dev, Er=
ror **errp)
+     }
+     s->max_devices =3D MPTSAS_NUM_PORTS;
+
+-    s->request_bh =3D qemu_bh_new(mptsas_fetch_requests, s);
++    s->request_bh =3D qemu_bh_new_guarded(mptsas_fetch_requests, s,
++                                        &DEVICE(dev)->mem_reentrancy_gu=
ard);
+
+     scsi_bus_init(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_inf=
o);
+ }
+diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
+index 2b5e9dca3..54b9a8ce9 100644
+--- a/hw/scsi/scsi-bus.c
++++ b/hw/scsi/scsi-bus.c
+@@ -192,7 +192,8 @@ static void scsi_dma_restart_cb(void *opaque, bool r=
unning, RunState state)
+         AioContext *ctx =3D blk_get_aio_context(s->conf.blk);
+         /* The reference is dropped in scsi_dma_restart_bh.*/
+         object_ref(OBJECT(s));
+-        s->bh =3D aio_bh_new(ctx, scsi_dma_restart_bh, s);
++        s->bh =3D aio_bh_new_guarded(ctx, scsi_dma_restart_bh, s,
++                                   &DEVICE(s)->mem_reentrancy_guard);
+         qemu_bh_schedule(s->bh);
+     }
+ }
+diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
+index 4d9969f3b..d5c6293a2 100644
+--- a/hw/scsi/vmw_pvscsi.c
++++ b/hw/scsi/vmw_pvscsi.c
+@@ -1184,7 +1184,8 @@ pvscsi_realizefn(PCIDevice *pci_dev, Error **errp)
+         pcie_endpoint_cap_init(pci_dev, PVSCSI_EXP_EP_OFFSET);
+     }
+
+-    s->completion_worker =3D qemu_bh_new(pvscsi_process_completion_queu=
e, s);
++    s->completion_worker =3D qemu_bh_new_guarded(pvscsi_process_complet=
ion_queue, s,
++                                               &DEVICE(pci_dev)->mem_re=
entrancy_guard);
+
+     scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(pci_dev), &pvscsi_scs=
i_info);
+     /* override default SCSI bus hotplug-handler, with pvscsi's one */
+diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
+index 599d6b52a..a36a7c301 100644
+--- a/hw/usb/dev-uas.c
++++ b/hw/usb/dev-uas.c
+@@ -935,7 +935,8 @@ static void usb_uas_realize(USBDevice *dev, Error **=
errp)
+
+     QTAILQ_INIT(&uas->results);
+     QTAILQ_INIT(&uas->requests);
+-    uas->status_bh =3D qemu_bh_new(usb_uas_send_status_bh, uas);
++    uas->status_bh =3D qemu_bh_new_guarded(usb_uas_send_status_bh, uas,
++                                         &d->mem_reentrancy_guard);
+
+     dev->flags |=3D (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
+     scsi_bus_init(&uas->bus, sizeof(uas->bus), DEVICE(dev), &usb_uas_sc=
si_info);
+diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
+index 8755e9cbb..a0c4e782b 100644
+--- a/hw/usb/hcd-dwc2.c
++++ b/hw/usb/hcd-dwc2.c
+@@ -1364,7 +1364,8 @@ static void dwc2_realize(DeviceState *dev, Error *=
*errp)
+     s->fi =3D USB_FRMINTVL - 1;
+     s->eof_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_frame_bounda=
ry, s);
+     s->frame_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, dwc2_work_timer=
, s);
+-    s->async_bh =3D qemu_bh_new(dwc2_work_bh, s);
++    s->async_bh =3D qemu_bh_new_guarded(dwc2_work_bh, s,
++                                      &dev->mem_reentrancy_guard);
+
+     sysbus_init_irq(sbd, &s->irq);
+ }
+diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
+index 33a8a377b..7b0538810 100644
+--- a/hw/usb/hcd-ehci.c
++++ b/hw/usb/hcd-ehci.c
+@@ -2530,7 +2530,8 @@ void usb_ehci_realize(EHCIState *s, DeviceState *d=
ev, Error **errp)
+     }
+
+     s->frame_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, ehci_work_timer=
, s);
+-    s->async_bh =3D qemu_bh_new(ehci_work_bh, s);
++    s->async_bh =3D qemu_bh_new_guarded(ehci_work_bh, s,
++                                      &dev->mem_reentrancy_guard);
+     s->device =3D dev;
+
+     s->vmstate =3D qemu_add_vm_change_state_handler(usb_ehci_vm_state_c=
hange, s);
+diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
+index d1b5657d7..ef967c42a 100644
+--- a/hw/usb/hcd-uhci.c
++++ b/hw/usb/hcd-uhci.c
+@@ -1193,7 +1193,7 @@ void usb_uhci_common_realize(PCIDevice *dev, Error=
 **errp)
+                               USB_SPEED_MASK_LOW | USB_SPEED_MASK_FULL)=
;
+         }
+     }
+-    s->bh =3D qemu_bh_new(uhci_bh, s);
++    s->bh =3D qemu_bh_new_guarded(uhci_bh, s, &DEVICE(dev)->mem_reentra=
ncy_guard);
+     s->frame_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, uhci_frame_time=
r, s);
+     s->num_ports_vmstate =3D NB_PORTS;
+     QTAILQ_INIT(&s->queues);
+diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
+index d0d46dd0a..09b961116 100644
+--- a/hw/usb/host-libusb.c
++++ b/hw/usb/host-libusb.c
+@@ -1141,7 +1141,8 @@ static void usb_host_nodev_bh(void *opaque)
+ static void usb_host_nodev(USBHostDevice *s)
+ {
+     if (!s->bh_nodev) {
+-        s->bh_nodev =3D qemu_bh_new(usb_host_nodev_bh, s);
++        s->bh_nodev =3D qemu_bh_new_guarded(usb_host_nodev_bh, s,
++                                          &DEVICE(s)->mem_reentrancy_gu=
ard);
+     }
+     qemu_bh_schedule(s->bh_nodev);
+ }
+@@ -1739,7 +1740,8 @@ static int usb_host_post_load(void *opaque, int ve=
rsion_id)
+     USBHostDevice *dev =3D opaque;
+
+     if (!dev->bh_postld) {
+-        dev->bh_postld =3D qemu_bh_new(usb_host_post_load_bh, dev);
++        dev->bh_postld =3D qemu_bh_new_guarded(usb_host_post_load_bh, d=
ev,
++                                             &DEVICE(dev)->mem_reentran=
cy_guard);
+     }
+     qemu_bh_schedule(dev->bh_postld);
+     dev->bh_postld_pending =3D true;
+diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
+index 5f0ef9cb3..59cd3cd7c 100644
+--- a/hw/usb/redirect.c
++++ b/hw/usb/redirect.c
+@@ -1437,8 +1437,10 @@ static void usbredir_realize(USBDevice *udev, Err=
or **errp)
+         }
+     }
+
+-    dev->chardev_close_bh =3D qemu_bh_new(usbredir_chardev_close_bh, de=
v);
+-    dev->device_reject_bh =3D qemu_bh_new(usbredir_device_reject_bh, de=
v);
++    dev->chardev_close_bh =3D qemu_bh_new_guarded(usbredir_chardev_clos=
e_bh, dev,
++                                                &DEVICE(dev)->mem_reent=
rancy_guard);
++    dev->device_reject_bh =3D qemu_bh_new_guarded(usbredir_device_rejec=
t_bh, dev,
++                                                &DEVICE(dev)->mem_reent=
rancy_guard);
+     dev->attach_timer =3D timer_new_ms(QEMU_CLOCK_VIRTUAL, usbredir_do_=
attach, dev);
+
+     packet_id_queue_init(&dev->cancelled, dev, "cancelled");
+diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
+index 0f7369e7e..dec91294a 100644
+--- a/hw/usb/xen-usb.c
++++ b/hw/usb/xen-usb.c
+@@ -1021,7 +1021,8 @@ static void usbback_alloc(struct XenLegacyDevice *=
xendev)
+
+     QTAILQ_INIT(&usbif->req_free_q);
+     QSIMPLEQ_INIT(&usbif->hotplug_q);
+-    usbif->bh =3D qemu_bh_new(usbback_bh, usbif);
++    usbif->bh =3D qemu_bh_new_guarded(usbback_bh, usbif,
++                                    &DEVICE(xendev)->mem_reentrancy_gua=
rd);
+ }
+
+ static int usbback_free(struct XenLegacyDevice *xendev)
+diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
+index 9a4f491b5..f503572e2 100644
+--- a/hw/virtio/virtio-balloon.c
++++ b/hw/virtio/virtio-balloon.c
+@@ -917,8 +917,9 @@ static void virtio_balloon_device_realize(DeviceStat=
e *dev, Error **errp)
+         precopy_add_notifier(&s->free_page_hint_notify);
+
+         object_ref(OBJECT(s->iothread));
+-        s->free_page_bh =3D aio_bh_new(iothread_get_aio_context(s->ioth=
read),
+-                                     virtio_ballloon_get_free_page_hint=
s, s);
++        s->free_page_bh =3D aio_bh_new_guarded(iothread_get_aio_context=
(s->iothread),
++                                             virtio_ballloon_get_free_p=
age_hints, s,
++                                             &dev->mem_reentrancy_guard=
);
+     }
+
+     if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_REPORTING=
)) {
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 274c7b4de..cb3e6ed0e 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -822,7 +822,8 @@ static void virtio_crypto_device_realize(DeviceState=
 *dev, Error **errp)
+         vcrypto->vqs[i].dataq =3D
+                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_data=
q_bh);
+         vcrypto->vqs[i].dataq_bh =3D
+-                 qemu_bh_new(virtio_crypto_dataq_bh, &vcrypto->vqs[i]);
++                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->=
vqs[i],
++                                     &dev->mem_reentrancy_guard);
+         vcrypto->vqs[i].vcrypto =3D vcrypto;
+     }
+
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
index 0000000000..d833b8b1e1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0004.patch
@@ -0,0 +1,144 @@
+From ba28e0ff4d95b56dc334aac2730ab3651ffc3132 Mon Sep 17 00:00:00 2001
+From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
+Date: Tue, 28 May 2024 05:50:35 +0000
+Subject: [PATCH] virtio-gpu: Protect from DMA re-entrancy bugs
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
+
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
+ hw/display/virtio-gpu.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
+index 316469ab7..5719ef6f1 100644
+--- a/hw/display/virtio-gpu.c
++++ b/hw/display/virtio-gpu.c
+@@ -1334,10 +1334,8 @@ void virtio_gpu_device_realize(DeviceState *qdev,=
 Error **errp)
+
+     g->ctrl_vq =3D virtio_get_queue(vdev, 0);
+     g->cursor_vq =3D virtio_get_queue(vdev, 1);
+-    g->ctrl_bh =3D qemu_bh_new_guarded(virtio_gpu_ctrl_bh, g,
+-                                     &qdev->mem_reentrancy_guard);
+-    g->cursor_bh =3D qemu_bh_new_guarded(virtio_gpu_cursor_bh, g,
+-                                       &qdev->mem_reentrancy_guard);
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
index 0000000000..51aa8a4038
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0005.patch
@@ -0,0 +1,42 @@
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
+ hw/char/virtio-serial-bus.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
+index f18124b15..791b7ac59 100644
+--- a/hw/char/virtio-serial-bus.c
++++ b/hw/char/virtio-serial-bus.c
+@@ -985,8 +985,7 @@ static void virtser_port_device_realize(DeviceState =
*dev, Error **errp)
+         return;
+     }
+
+-    port->bh =3D qemu_bh_new_guarded(flush_queued_data_bh, port,
+-                                   &dev->mem_reentrancy_guard);
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
index 0000000000..c7f19f45e7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-3446-0006.patch
@@ -0,0 +1,43 @@
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
+ hw/virtio/virtio-crypto.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index cb3e6ed0e..930a8418f 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -822,8 +822,8 @@ static void virtio_crypto_device_realize(DeviceState=
 *dev, Error **errp)
+         vcrypto->vqs[i].dataq =3D
+                  virtio_add_queue(vdev, 1024, virtio_crypto_handle_data=
q_bh);
+         vcrypto->vqs[i].dataq_bh =3D
+-                 qemu_bh_new_guarded(virtio_crypto_dataq_bh, &vcrypto->=
vqs[i],
+-                                     &dev->mem_reentrancy_guard);
++                 virtio_bh_new_guarded(dev, virtio_crypto_dataq_bh,
++				       &vcrypto->vqs[i]);
+         vcrypto->vqs[i].vcrypto =3D vcrypto;
+     }
+
+--
+2.40.0
--=20
2.40.0


