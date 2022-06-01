Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B625C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 03:51:43 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.3447.1654055493724878388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 20:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2513pW9p009008
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 20:51:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2513pV7v000951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 20:51:32 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 May 2022 20:51:31 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 31 May 2022 20:51:30 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 31 May 2022 20:51:31 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][hardknott][PATCH 1/4] qemu: fix CVE-2021-4145
Date: Tue, 31 May 2022 23:51:22 -0400
Message-ID: <20220601035125.17565-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 03:51:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166346

Fix for CVE-2021-4145, commit 66fed30c9c, fixes another commit:
   d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
Hence, backport both the patches to resolve the CVE.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2021-4145_1.patch           | 67 +++++++++++++++
 .../qemu/qemu/CVE-2021-4145_2.patch           | 85 +++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 568ef1be94..aa372810ce 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -75,6 +75,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3930.patch \
            file://CVE-2021-20196_1.patch \
            file://CVE-2021-20196_2.patch \
+           file://CVE-2021-4145_1.patch \
+           file://CVE-2021-4145_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch
new file mode 100644
index 0000000000..02eae727d5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch
@@ -0,0 +1,67 @@
+From 59fe260a352156261ad0d89be446e5dd0ac96de3 Mon Sep 17 00:00:00 2001
+From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+Date: Sat, 3 Jul 2021 00:16:36 +0300
+Subject: [PATCH 1/2] block/mirror: fix active mirror dead-lock in
+ mirror_wait_on_conflicts
+
+It's possible that requests start to wait each other in
+mirror_wait_on_conflicts(). To avoid it let's use same technique as in
+block/io.c in bdrv_wait_serialising_requests_locked() /
+bdrv_find_conflicting_request(): don't wait on intersecting request if
+it is already waiting for some other request.
+
+For details of the dead-lock look at testIntersectingActiveIO()
+test-case which we actually fixing now.
+
+Fixes: d06107ade0ce74dc39739bac80de84b51ec18546
+Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+Message-Id: <20210702211636.228981-4-vsementsov@virtuozzo.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+
+CVE: CVE-2021-4145
+Upstream-Status: Backport [d44dae1a7cf782ec9235746ebb0e6c1a20dd7288]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ block/mirror.c         | 12 ++++++++++++
+ tests/qemu-iotests/151 |  0
+ 2 files changed, 12 insertions(+)
+ mode change 100755 => 100644 tests/qemu-iotests/151
+
+diff --git a/block/mirror.c b/block/mirror.c
+index 8e1ad6ece..fab008568 100644
+--- a/block/mirror.c
++++ b/block/mirror.c
+@@ -106,6 +106,7 @@ struct MirrorOp {
+     bool is_in_flight;
+     CoQueue waiting_requests;
+     Coroutine *co;
++    MirrorOp *waiting_for_op;
+ 
+     QTAILQ_ENTRY(MirrorOp) next;
+ };
+@@ -158,7 +159,18 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
+             if (ranges_overlap(self_start_chunk, self_nb_chunks,
+                                op_start_chunk, op_nb_chunks))
+             {
++                /*
++                 * If the operation is already (indirectly) waiting for us, or
++                 * will wait for us as soon as it wakes up, then just go on
++                 * (instead of producing a deadlock in the former case).
++                 */
++                if (op->waiting_for_op) {
++                    continue;
++                }
++
++                self->waiting_for_op = op;
+                 qemu_co_queue_wait(&op->waiting_requests, NULL);
++                self->waiting_for_op = NULL;
+                 break;
+             }
+         }
+diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
+old mode 100755
+new mode 100644
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch
new file mode 100644
index 0000000000..891664375c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch
@@ -0,0 +1,85 @@
+From 09036c63a4a498d65de0d035211b01f0482e3533 Mon Sep 17 00:00:00 2001
+From: Stefano Garzarella <sgarzare@redhat.com>
+Date: Fri, 10 Sep 2021 14:45:33 +0200
+Subject: [PATCH 2/2] block/mirror: fix NULL pointer dereference in
+ mirror_wait_on_conflicts()
+
+In mirror_iteration() we call mirror_wait_on_conflicts() with
+`self` parameter set to NULL.
+
+Starting from commit d44dae1a7c we dereference `self` pointer in
+mirror_wait_on_conflicts() without checks if it is not NULL.
+
+Backtrace:
+  Program terminated with signal SIGSEGV, Segmentation fault.
+  #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
+      at ../block/mirror.c:172
+  172	                self->waiting_for_op = op;
+  [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
+  (gdb) bt
+  #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
+      at ../block/mirror.c:172
+  #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
+  #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
+  #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
+      at ../util/coroutine-ucontext.c:173
+  #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
+      from /usr/lib64/libc.so.6
+
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
+Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
+Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
+Message-Id: <20210910124533.288318-1-sgarzare@redhat.com>
+Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+Signed-off-by: Hanna Reitz <hreitz@redhat.com>
+
+CVE: CVE-2021-4145
+Upstream-Status: Backport [66fed30c9cd11854fc878a4eceb507e915d7c9cd]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ block/mirror.c | 25 ++++++++++++++++---------
+ 1 file changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/block/mirror.c b/block/mirror.c
+index fab008568..ca0be146f 100644
+--- a/block/mirror.c
++++ b/block/mirror.c
+@@ -159,18 +159,25 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
+             if (ranges_overlap(self_start_chunk, self_nb_chunks,
+                                op_start_chunk, op_nb_chunks))
+             {
+-                /*
+-                 * If the operation is already (indirectly) waiting for us, or
+-                 * will wait for us as soon as it wakes up, then just go on
+-                 * (instead of producing a deadlock in the former case).
+-                 */
+-                if (op->waiting_for_op) {
+-                    continue;
++                if (self) {
++                    /*
++                     * If the operation is already (indirectly) waiting for us,
++                     * or will wait for us as soon as it wakes up, then just go
++                     * on (instead of producing a deadlock in the former case).
++                     */
++                    if (op->waiting_for_op) {
++                        continue;
++                    }
++
++                    self->waiting_for_op = op;
+                 }
+ 
+-                self->waiting_for_op = op;
+                 qemu_co_queue_wait(&op->waiting_requests, NULL);
+-                self->waiting_for_op = NULL;
++
++                if (self) {
++                    self->waiting_for_op = NULL;
++                }
++
+                 break;
+             }
+         }
+-- 
+2.33.0
+
-- 
2.33.0


