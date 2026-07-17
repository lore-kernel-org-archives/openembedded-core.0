Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907E5C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:55:47 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7576.1784267747073922453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZNKQIuZ0;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7679; q=dns/txt;
  s=iport01; t=1784267747; x=1785477347;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EjFJJUJ+R6mDxvh7iIjAXVZ1ubOr3kgct+/T3ywJcqg=;
  b=ZNKQIuZ0RHSJVKQpGyqcV1e+ljN0bI5xLFxBrVl7c54d3SJBIygAlAAM
   wsbmdTlS0L3HlkXSMoDbvYtLurCSO/44qQlTQ0zAQC7nwBTre9MSDoxgI
   CFSvT6l8ZZOMMbFfoYqwnL1/4l1Y3GwLPFDhMqY+iDIbQPYkGzhdbbzfQ
   6SG3e/gY5G0QFOugch7BEv+WYunBqityODg0pArKApvNVJ6DIMMSXAItz
   JuAQjEB+Zf2KdY0Z5G2WMV04oBvfZdo31Ete9eQufWFl0wbTQYLntiElr
   RLW058kmNgKz5vVD3NCqmCmMbuGFBufP91KwIwaXoMDV/lhHKw0r9IIT9
   Q==;
X-CSE-ConnectionGUID: aSS9gKLvRRq46jEIfZqwxg==
X-CSE-MsgGUID: FDJKEVHoQj+DrT0OqRAiWQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgBWw1lq/4v/Ja1aglmCV3RfQkkDlCaCIYEWilGSN?=
 =?us-ascii?q?xSBag8BAQEPRA0EAQGSWQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAS0LAXIDAQJPCyMZCIMCAYI6AzcDEb1LgXkzgQGDaAJDU?=
 =?us-ascii?q?NhJDYJYAQUGFAGBOIU/gn2FI1wYAYR8JxsbgXKBFYJzdoEFgRpCAoFHA4ZbB?=
 =?us-ascii?q?IIigQyBWh6BfI4FSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2BOoEAhHYjHwM5f4EvdUp3LWoSF4FOghSBPgMLGA1IESw3FBsEPm4HjUgjg?=
 =?us-ascii?q?U1yASxhARMYewqBJ5M3AQeSNJ5OgVNxCiiDdYwhjz6FfBozqmwLmH2OCoQJk?=
 =?us-ascii?q?StNT4RpgWg8gVlwFTuCZ1MZD1aNVwsLg2DOQDw1CwMvAQEHAgcOAwuBaJABg?=
 =?us-ascii?q?X0BAQ?=
IronPort-Data: A9a23:/Hz0oqw512GLtC8ehnd6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 mUbXmrTaK6PZWb2Kd8gPo2w/EIF7JHcztIxG1Rp/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYrazxMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEgNBtwX2cJpO1tXq
 aIaBREDXAmcl+3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCxYYSFJY3WHJ49ckCwi
 E7k3EnHIhYjNp+z0wbd1WuWr+7wpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:ntFJdqi5x6kW7GoE39/q9W/VHXBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:kIX36WE51UxaisfWqmJuz3VFFeMBbEfn1SuOIWKZB1RwV62aHAo=
X-Talos-MUID: 9a23:nrE7SQXOBA4VhHzq/BHAphJPCudv2qbtJFoxybIfgeCFChUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="496879413"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:55:44 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 26B3418000200
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:55:44 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 4837BCC037D; Fri, 17 Jul 2026 11:25:42 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] util-linux: fix CVE-2026-13595
Date: Fri, 17 Jul 2026 11:25:36 +0530
Message-Id: <20260717055536.2902083-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241138

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
 .../util-linux/CVE-2026-13595.patch           | 157 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 8380419634..753d032976 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -47,6 +47,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
            file://CVE-2026-27456.patch \
+           file://CVE-2026-13595.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
new file mode 100644
index 0000000000..36e8658f69
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
@@ -0,0 +1,157 @@
+From faf717ca4ed3b603eb213915fe15c6804c4b92d4 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 7 May 2026 12:50:48 +0200
+Subject: [PATCH] libblkid: fix use-after-free in nested partition probing
+
+The partitions list stores partitions in a contiguous array grown by
+realloc(). When the array is reallocated to a new address, all
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
+Backport Changes:
+- Scarthgap util-linux 2.39.3 still uses realloc() at this allocation site,
+  so this backport keeps realloc() and changes only the element size to
+  sizeof(*ls->parts) instead of adopting upstream's reallocarray() style.
+- The commit text was adjusted from reallocarray() to realloc() to match the
+  target source context.
+
+Reported-by: Thai Duong <thaidn@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit c0186f14fbdb02f64c8e0ba701ce727ea764ff4c)
+(cherry picked from commit 132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ libblkid/src/partitions/partitions.c | 36 ++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 14 deletions(-)
+
+diff --git a/libblkid/src/partitions/partitions.c b/libblkid/src/partitions/partitions.c
+index 8ebf480f5..6089028a8 100644
+--- a/libblkid/src/partitions/partitions.c
++++ b/libblkid/src/partitions/partitions.c
+@@ -197,7 +197,7 @@ struct blkid_struct_partlist {
+ 
+ 	int		nparts;		/* number of partitions */
+ 	int		nparts_max;	/* max.number of partitions */
+-	blkid_partition	parts;		/* array of partitions */
++	blkid_partition	*parts;		/* array of pointers to partitions */
+ 
+ 	struct list_head l_tabs;	/* list of partition tables */
+ };
+@@ -356,13 +356,16 @@ static void reset_partlist(blkid_partlist ls)
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
+@@ -397,6 +400,7 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
+ 				 void *data)
+ {
+ 	blkid_partlist ls = (blkid_partlist) data;
++	int i;
+ 
+ 	if (!ls)
+ 		return;
+@@ -404,6 +408,8 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
+ 	free_parttables(ls);
+ 
+ 	/* deallocate partitions and partlist */
++	for (i = 0; i < ls->nparts; i++)
++		free(ls->parts[i]);
+ 	free(ls->parts);
+ 	free(ls);
+ }
+@@ -436,16 +442,18 @@ static blkid_partition new_partition(blkid_partlist ls, blkid_parttable tab)
+ 		/* Linux kernel has DISK_MAX_PARTS=256, but it's too much for
+ 		 * generic Linux machine -- let start with 32 partitions.
+ 		 */
+-		void *tmp = realloc(ls->parts, (ls->nparts_max + 32) *
+-					sizeof(struct blkid_struct_partition));
++		void *tmp = realloc(ls->parts, (ls->nparts_max + 32) *
++					sizeof(*ls->parts));
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
+@@ -849,7 +857,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+ 
+ 	/* check if the partition table fits into the device */
+ 	for (i = 0; i < nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if (par->start + par->size > (pr->size >> 9)) {
+ 			DBG(LOWPROBE, ul_debug("partition #%d overflows "
+@@ -861,7 +869,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+ 
+ 	/* check if the requested area is covered by PT */
+ 	for (i = 0; i < nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if (start >= par->start && end <= par->start + par->size) {
+ 			rc = 1;
+@@ -960,7 +968,7 @@ blkid_partition blkid_partlist_get_partition(blkid_partlist ls, int n)
+ 	if (n < 0 || n >= ls->nparts)
+ 		return NULL;
+ 
+-	return &ls->parts[n];
++	return ls->parts[n];
+ }
+ 
+ blkid_partition blkid_partlist_get_partition_by_start(blkid_partlist ls, uint64_t start)
+@@ -1072,7 +1080,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
+ 		 * and an entry in partition table.
+ 		 */
+ 		 for (i = 0; i < ls->nparts; i++) {
+-			 blkid_partition par = &ls->parts[i];
++			 blkid_partition par = ls->parts[i];
+ 
+ 			 if (partno != blkid_partition_get_partno(par))
+ 				 continue;
+@@ -1088,7 +1096,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
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


