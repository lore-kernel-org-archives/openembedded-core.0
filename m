Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FD8C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:55:27 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7675.1784267721786405091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AZcm32VG;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7320; q=dns/txt;
  s=iport01; t=1784267721; x=1785477321;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FzBCXjUxsfDkspwOVBYIwSeOvMO9TuLkZlcsOpMxmog=;
  b=AZcm32VGyYYxo5AMN+AvhTdoTHbQfxLw391/WzT+ds368yk0Wim04brx
   wnhZ9B4Tknw6BmInCW5V/PMp1ZoE6puyemdiwNpHaMzEqGrjFTEz1PyBz
   f9ATKQ1FzJLiLd0e6HVkq4EfKJsM9AlXr6RjwLe64Jl4vtsUsevU3AOvi
   los61ReUh73nciAC84RFK47weEOZSME22vzxzzU1dXuhaZFsx+jFsY3tp
   rRuw5xwfskP1y+7qu8kdfWULuhA2y3ZLL9xrzhsceRs/ZrxwIyvzJcair
   HUR2rf9XhwrGr4/OT/fgJORcO8YKoaRknSya97rEGcN678IyCfBP/j4gu
   w==;
X-CSE-ConnectionGUID: ruBor6L/Tb2tXIY/8WBmNw==
X-CSE-MsgGUID: Oa+ONhzJRFuszTx0OfcAsg==
X-IPAS-Result: =?us-ascii?q?A0BEAgByt1lq/4z/Ja1aHgEBCxIMggULgld0X0JJA5Qmg?=
 =?us-ascii?q?iGLZ5I3FIFqDwEBAQ9EDQQBAZJZAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBLQsBcgMBAk8LIxkIgwIBgjoDNwMRvUuBeTOBA?=
 =?us-ascii?q?YNoAkNQ2EkNglgBBQYUAYE4hT+CfYUjXBgBhHwnGxuBcoEVg2mBBYEaQgKBR?=
 =?us-ascii?q?wOGWwSCIoEMgVoegXyOBUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgTqBAIR2Ix8DOX+BL3VKdy1qEheBToIUgT4DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?41II4FNcgEsLDUBExh7Cj5pkzcBB5I0nk6BU3EKKIN1jCGPPoV8GjOqbAuYf?=
 =?us-ascii?q?Y4KhAmRK01PhGmBaDyBWXAVO4JnUxkPVo1XCwuDYM5APDULAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokAGBfQEB?=
IronPort-Data: A9a23:0ExtLaC8psEpkRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG4lhjIAy
 msYWjrSPfyLamOjLdx3YInn8ktSucfVz98yOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD8hWYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE2ehEC1toGcok8LxrMUB/s
 qwnAjUrcUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEpium0YICPJ7RmQ+1ylwW/g
 GLU3V7XHwoICMzH7jSO22mj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:NPlN1amqSwiAH60qEv3z54sX73bpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:o806nW3jf+0askpO/MtuZ7xfAN0PdWeD6DDsKRWkOUdYD+2qY1q25/Yx
X-Talos-MUID: 9a23:t8jJSwgjsWm+rbpzH8vv1MMpE84rxIKuGmI3v4gdqfWUbQt+MB6Gg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="502918225"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:55:20 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 253A1180001C0
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:55:20 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 3FE53CC037D; Fri, 17 Jul 2026 11:25:18 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] util-linux: fix CVE-2026-13595
Date: Fri, 17 Jul 2026 11:24:32 +0530
Message-Id: <20260717055432.2900484-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241137

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream stable/v2.41 backport for
CVE-2026-13595. The upstream fix merge or commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://github.com/util-linux/util-linux/commit/132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa
[2] https://access.redhat.com/security/cve/CVE-2026-13595

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..2a994d7a38 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
            file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch \
+           file://CVE-2026-13595.patch \
            "
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
new file mode 100644
index 0000000000..894844bc1f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
@@ -0,0 +1,148 @@
+From c3844c348f2903d929dd5ded0ea8147394cce607 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 7 May 2026 12:50:48 +0200
+Subject: [PATCH] libblkid: fix use-after-free in nested partition probing
+
+The partitions list stores partitions in a contiguous array grown by
+reallocarray(). When the array is reallocated to a new address, all
+existing blkid_partition pointers (tab->parent, ls->next_parent, local
+parent variables in nested probers) become dangling.
+
+Fix this by changing the storage from an array of structs to an array
+of pointers, where each partition is individually allocated via
+calloc(). This makes all blkid_partition pointers stable across
+reallocations -- only the pointer array itself may move, which is
+harmless since no code caches pointers into the pointer array.
+
+This eliminates the need for callers to re-fetch parent pointers after
+every blkid_partlist_add_partition() call.
+
+CVE: CVE-2026-13595
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa]
+
+Reported-by: Thai Duong <thaidn@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit c0186f14fbdb02f64c8e0ba701ce727ea764ff4c)
+(cherry picked from commit 132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ libblkid/src/partitions/partitions.c | 34 +++++++++++++++++-----------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/libblkid/src/partitions/partitions.c b/libblkid/src/partitions/partitions.c
+index 9df813c92..e600e5e45 100644
+--- a/libblkid/src/partitions/partitions.c
++++ b/libblkid/src/partitions/partitions.c
+@@ -198,7 +198,7 @@ struct blkid_struct_partlist {
+ 
+ 	int		nparts;		/* number of partitions */
+ 	int		nparts_max;	/* max.number of partitions */
+-	blkid_partition	parts;		/* array of partitions */
++	blkid_partition	*parts;		/* array of pointers to partitions */
+ 
+ 	struct list_head l_tabs;	/* list of partition tables */
+ };
+@@ -357,13 +357,16 @@ static void reset_partlist(blkid_partlist ls)
+ 	free_parttables(ls);
+ 
+ 	if (ls->next_partno) {
+-		/* already initialized - reset */
+-		int tmp_nparts = ls->nparts_max;
+-		blkid_partition tmp_parts = ls->parts;
++		/* already initialized - free individually allocated partitions */
++		int i, tmp_nparts_max = ls->nparts_max;
++		blkid_partition *tmp_parts = ls->parts;
++
++		for (i = 0; i < ls->nparts; i++)
++			free(ls->parts[i]);
+ 
+ 		memset(ls, 0, sizeof(struct blkid_struct_partlist));
+ 
+-		ls->nparts_max = tmp_nparts;
++		ls->nparts_max = tmp_nparts_max;
+ 		ls->parts = tmp_parts;
+ 	}
+ 
+@@ -398,6 +401,7 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
+ 				 void *data)
+ {
+ 	blkid_partlist ls = (blkid_partlist) data;
++	int i;
+ 
+ 	if (!ls)
+ 		return;
+@@ -405,6 +409,8 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
+ 	free_parttables(ls);
+ 
+ 	/* deallocate partitions and partlist */
++	for (i = 0; i < ls->nparts; i++)
++		free(ls->parts[i]);
+ 	free(ls->parts);
+ 	free(ls);
+ }
+@@ -438,15 +444,17 @@ static blkid_partition new_partition(blkid_partlist ls, blkid_parttable tab)
+ 		 * generic Linux machine -- let start with 32 partitions.
+ 		 */
+ 		void *tmp = reallocarray(ls->parts, ls->nparts_max + 32,
+-					 sizeof(struct blkid_struct_partition));
++					 sizeof(blkid_partition));
+ 		if (!tmp)
+ 			return NULL;
+ 		ls->parts = tmp;
+ 		ls->nparts_max += 32;
+ 	}
+ 
+-	par = &ls->parts[ls->nparts++];
+-	memset(par, 0, sizeof(struct blkid_struct_partition));
++	par = calloc(1, sizeof(struct blkid_struct_partition));
++	if (!par)
++		return NULL;
++	ls->parts[ls->nparts++] = par;
+ 
+ 	ref_parttable(tab);
+ 	par->tab = tab;
+@@ -851,7 +859,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+ 
+ 	/* check if the partition table fits into the device */
+ 	for (i = 0; i < nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if (par->start + par->size > (pr->size >> 9)) {
+ 			DBG(LOWPROBE, ul_debug("partition #%d overflows "
+@@ -863,7 +871,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+ 
+ 	/* check if the requested area is covered by PT */
+ 	for (i = 0; i < nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if (start >= par->start && end <= par->start + par->size) {
+ 			rc = 1;
+@@ -962,7 +970,7 @@ blkid_partition blkid_partlist_get_partition(blkid_partlist ls, int n)
+ 	if (n < 0 || n >= ls->nparts)
+ 		return NULL;
+ 
+-	return &ls->parts[n];
++	return ls->parts[n];
+ }
+ 
+ blkid_partition blkid_partlist_get_partition_by_start(blkid_partlist ls, uint64_t start)
+@@ -1074,7 +1082,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
+ 		 * and an entry in partition table.
+ 		 */
+ 		 for (i = 0; i < ls->nparts; i++) {
+-			 blkid_partition par = &ls->parts[i];
++			 blkid_partition par = ls->parts[i];
+ 
+ 			 if (partno != blkid_partition_get_partno(par))
+ 				 continue;
+@@ -1090,7 +1098,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
+ 	DBG(LOWPROBE, ul_debug("searching by offset/size"));
+ 
+ 	for (i = 0; i < ls->nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if ((uint64_t)blkid_partition_get_start(par) == start &&
+ 		    (uint64_t)blkid_partition_get_size(par) == size)
-- 
2.35.6


