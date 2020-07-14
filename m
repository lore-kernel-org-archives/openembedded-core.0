Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4851.1594756319651683394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 12:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06EJpMSw007822
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 12:51:48 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 14 Jul 2020
 12:51:29 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id 5FBC72002E;
 Tue, 14 Jul 2020 15:51:28 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sakib Sajal <sakib.sajal@windriver.com>
Subject: [PATCH 1/4] qemu: fix CVE-2020-13362
Date: Tue, 14 Jul 2020 15:51:16 -0400
Message-ID: <20200714195119.20074-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-13362.patch            | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d41cc8f200..98bdff7ac6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-13361.patch \
 	   file://find_datadir.patch \
 	   file://CVE-2020-10761.patch \
+	   file://CVE-2020-13362.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
new file mode 100644
index 0000000000..af8d4ba8f4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13362.patch
@@ -0,0 +1,55 @@
+From f50ab86a2620bd7e8507af865b164655ee921661 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 14 May 2020 00:55:38 +0530
+Subject: [PATCH] megasas: use unsigned type for reply_queue_head and check
+ index
+
+A guest user may set 'reply_queue_head' field of MegasasState to
+a negative value. Later in 'megasas_lookup_frame' it is used to
+index into s->frames[] array. Use unsigned type to avoid OOB
+access issue.
+
+Also check that 'index' value stays within s->frames[] bounds
+through the while() loop in 'megasas_lookup_frame' to avoid OOB
+access.
+
+Reported-by: Ren Ding <rding@gatech.edu>
+Reported-by: Hanqing Zhao <hanqing@gatech.edu>
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Acked-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20200513192540.1583887-2-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [f50ab86a2620bd7e8507af865b164655ee921661]
+CVE: CVE-2020-13362
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/megasas.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
+index af18c88b65..6ce598cd69 100644
+--- a/hw/scsi/megasas.c
++++ b/hw/scsi/megasas.c
+@@ -112,7 +112,7 @@ typedef struct MegasasState {
+     uint64_t reply_queue_pa;
+     void *reply_queue;
+     int reply_queue_len;
+-    int reply_queue_head;
++    uint16_t reply_queue_head;
+     int reply_queue_tail;
+     uint64_t consumer_pa;
+     uint64_t producer_pa;
+@@ -445,7 +445,7 @@ static MegasasCmd *megasas_lookup_frame(MegasasState *s,
+ 
+     index = s->reply_queue_head;
+ 
+-    while (num < s->fw_cmds) {
++    while (num < s->fw_cmds && index < MEGASAS_MAX_FRAMES) {
+         if (s->frames[index].pa && s->frames[index].pa == frame) {
+             cmd = &s->frames[index];
+             break;
+-- 
+2.20.1
+
-- 
2.27.0

