Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E538065D35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 07:30:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3O7UHpu028307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Apr 2018 00:30:17 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 00:30:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 24 Apr 2018 15:37:50 +0800
Message-ID: <1524555471-8816-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] qemu: fix CVE-2017-16845
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
X-List-Received-Date: Tue, 24 Apr 2018 07:30:18 -0000
Content-Type: text/plain

During Qemu guest migration, a destination process invokes ps2
post_load function. In that, if 'rptr' and 'count' values were
invalid, it could lead to OOB access or infinite loop issue.
Add check to avoid it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ck-PS2Queue-pointers-in-post_load-routine.patch | 63 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.11.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch

diff --git a/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch b/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
new file mode 100644
index 0000000..f8d7f66
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
@@ -0,0 +1,63 @@
+From ee9a17d0e12143971a9676227cce953c0dbe52fb Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 16 Nov 2017 13:21:55 +0530
+Subject: [PATCH] ps2: check PS2Queue pointers in post_load routine
+
+During Qemu guest migration, a destination process invokes ps2
+post_load function. In that, if 'rptr' and 'count' values were
+invalid, it could lead to OOB access or infinite loop issue.
+Add check to avoid it.
+
+Reported-by: Cyrille Chatras <cyrille.chatras@orange.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20171116075155.22378-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2017-16845
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ hw/input/ps2.c | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/hw/input/ps2.c b/hw/input/ps2.c
+index f388a23..de171a2 100644
+--- a/hw/input/ps2.c
++++ b/hw/input/ps2.c
+@@ -1225,24 +1225,21 @@ static void ps2_common_reset(PS2State *s)
+ static void ps2_common_post_load(PS2State *s)
+ {
+     PS2Queue *q = &s->queue;
+-    int size;
+-    int i;
+-    int tmp_data[PS2_QUEUE_SIZE];
++    uint8_t i, size;
++    uint8_t tmp_data[PS2_QUEUE_SIZE];
+ 
+     /* set the useful data buffer queue size, < PS2_QUEUE_SIZE */
+-    size = q->count > PS2_QUEUE_SIZE ? 0 : q->count;
++    size = (q->count < 0 || q->count > PS2_QUEUE_SIZE) ? 0 : q->count;
+ 
+     /* move the queue elements to the start of data array */
+-    if (size > 0) {
+-        for (i = 0; i < size; i++) {
+-            /* move the queue elements to the temporary buffer */
+-            tmp_data[i] = q->data[q->rptr];
+-            if (++q->rptr == 256) {
+-                q->rptr = 0;
+-            }
++    for (i = 0; i < size; i++) {
++        if (q->rptr < 0 || q->rptr >= sizeof(q->data)) {
++            q->rptr = 0;
+         }
+-        memcpy(q->data, tmp_data, size);
++        tmp_data[i] = q->data[q->rptr++];
+     }
++    memcpy(q->data, tmp_data, size);
++
+     /* reset rptr/wptr/count */
+     q->rptr = 0;
+     q->wptr = size;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
index f4b7d69..ab82c5f 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://memfd.patch \
            file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
+           file://check-PS2Queue-pointers-in-post_load-routine.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


