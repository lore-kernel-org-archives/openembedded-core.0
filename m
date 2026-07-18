Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971B4C44523
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2523.1784364806413008014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2Ix82yP4;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f6de72faso16072045e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364805; x=1784969605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ppx6QVWh67iPtipQUQpt9MIqtlUwv6o/M0OtCQDBk9I=;
        b=2Ix82yP4JhBEDEqYUK3WoeRCRjQZv+BRLrjENI/9/ot4VqanHXhcbA1YF0xwJi95RC
         7I7HHe14hGycO+9//nNWRdtYmGCVnqOJGTHXIkGeZlx2F7acdtEKWj6yXn7ZoFqu9les
         O6WIC2CgZudmdp56humb0oPLXgI0CUhnuaBJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364805; x=1784969605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ppx6QVWh67iPtipQUQpt9MIqtlUwv6o/M0OtCQDBk9I=;
        b=K9Ak8PueOAfaBoW0+teoerT0269loUAI+893rhGxNsSdCbJTbyOHeqcNuw3gaYkFZj
         ju3aZrg3PoK0AO94QikC0vkf0VtTbsPrkpY2dI/HOGdhLRZJLjO3yKHmt6adywhpkxpj
         16VALbmkR3BdMr5RWfEP80wL+3TxW52HMBBtCW/ywqlBl4FKucRfTkaqQf/2Bdwn6Ffq
         WnAW1NP6au4X/71aQNFAoIypTrZQc/toTaDK9PeOy9cxWnji0gdJnU3yOOkjFq1JRCSf
         /wYeajcv6hbdiOsHcr3RVI7iFXUZzxHTJjyE2W4fcBc6m/TqjDQyAzBtlu55Ke7PMQR0
         zf6w==
X-Gm-Message-State: AOJu0YzqN36stwQz8Sju+i6oc0DGNpkKvIsJ5ai3+Ffq+96884XxLdr6
	PrXtPz7yqLwiC3isL0kNVsYoP0VJAf4nPP+qetzIalJxigRPc/3QZ2P9RIsLvu0IgrIQJjldXh5
	yJIWaRY0=
X-Gm-Gg: AfdE7ckhE17UX+VTDah1a19aPxMGcMG5bKR5Ihhj4PvguLF26eSISr/7gGyjl0O5juJ
	FkEJWMF19jRn1ashyTBj7WJX65qTjlwq6vl9GZ0pAYHdyrk2sBZDHcnFzIYi/TyTWcll1fKS1wI
	JrUoGjAK8vXXQNfYahFm9/0Bhs7/AM98MZS0qBMaH9u2ICiKLbeT3uFrOCg1RKL5tpmRVleY7DE
	SkcnCbpHAXg2Kvhpb8MTZdwW3YNzGV8hkergVajI0dVWraefuv381WM0a8xpqglByr/eECitTGx
	HD8WEoUnGhZcFUqIMBCT7OFO+H+EM0cH+lxgolvkoRj4DRWC9HVjmBvXo3MsJRF+wVGSvpRFqAJ
	dg8xkpyFnoqallmEGHJPp5zQb97LwsvXVKwwLacD5vgL9PcchUQkDTj3VRwrH5EIcKzPY3Hm/yD
	rtFbACN33QrQRZEXrGAmZK8f2u//knY5CnHncCscjiPad3T6/139UOYXQoe/ofgkZHdMnRVGyTa
	4n3sUlbLbl62dvv1Q==
X-Received: by 2002:a05:600c:45d2:b0:493:ee34:d875 with SMTP id 5b1f17b1804b1-4954a339294mr61091155e9.10.1784364804621;
        Sat, 18 Jul 2026 01:53:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/17] util-linux: fix CVE-2026-13595
Date: Sat, 18 Jul 2026 10:52:47 +0200
Message-ID: <419de81aa04f7b77431cfaae8c1f60091b86c935.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241245

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream stable/v2.41 backport for
CVE-2026-13595. The upstream fix merge or commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://github.com/util-linux/util-linux/commit/132d9c8aa15a8efd0a23d8ca7ed8b98f365e84fa
[2] https://access.redhat.com/security/cve/CVE-2026-13595

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 02358626669..2a994d7a386 100644
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
index 00000000000..894844bc1f4
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

