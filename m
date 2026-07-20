Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791E9C44532
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2876.1784568222621758237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zkR8u1Di;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso12149555e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568221; x=1785173021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ov5TYnmA/HgvEgQIi9ER4efMPmKbLLHsw/ZfVZlTcGE=;
        b=zkR8u1Dir/M9Lw62ALZ/aaWxvs+WgvImIrdY59+o/m4IzETyjQk317ymckOK4VzvOP
         zsLLeoqGD7wd8f2OWa0tFNe4Oq9iCDqlk3CzWH/LJNL72xKJOk+UOkjkrMCDBApm9H6Y
         wH7ekE9zvl7njJuWCNJRCDD3xE179BJzeE2EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568221; x=1785173021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ov5TYnmA/HgvEgQIi9ER4efMPmKbLLHsw/ZfVZlTcGE=;
        b=O8lpPsdoBW5R4+tEHKWZAs0o2AW/k6rYRy8/1NPrNRBkd8yWfNO+g2BSl7HL8VTcdb
         TFAqPa9B1qDQceBN2UUROY/V23rSQPSoufgiyXr6Ytrefx5gMohkU1es1kHBBkB+opwK
         m/SAdQjmLsutJrU/pTGpY/wCjSPjJeQZSi1gkb+zPjwflWzxMLsdxhvDm016n0OldI02
         FXVSOrPNwcCJWstYlq9WoD2wMNyCdIFQRPA47LDor1CX/vrQ7ZMU5wcTMnQ2Eu6vFQfE
         LrouK/hf/gaPnJvJn4rjWEFxx2Cs2bHG442R7/nScS4rTlxUnSd4gdWf5QUseUetbl2y
         IvGg==
X-Gm-Message-State: AOJu0YyRyjXnA7lKo2GPI4PKY1aEXM9QC78RhudovRqPoCyQEMk7RcXd
	2GWDTshNj2NZesGpERTolEgr7HcuJN4FtGPDEaov8WFSgs+L9AfPzIjP31HrgESXZoMEC4W5U5n
	j3Y8DGQ0=
X-Gm-Gg: AfdE7clMB7eUzg9RKErs4gpmZgpveNgW9ovau6O1HQ30ELmYKlpBt7oQlhbNCUBvGBg
	LFt2UcyhefhVv+S5/rpTS7DelqGniw0ERbItfzMrMKPH/Y+wGG2pOf9bczwADukXz2v6HEvgWHW
	N37MoCUJ1RNvqp9oNlQG8MvLZ3JANrSXtmjuw+pUHH64kcDCHKcORCGW1YyM+iFIVmdgdhXFAHB
	6eSJpCGnIJ8QqHJ4UfPVVxinY6RoA4uITZgBMxkXo4U5qRh7ZHuY2W7riMX+QAnptayKwZR5f3K
	6SlUfHKtJ0Q6RDeS65i0UkHN0tvLvm4gU3TkTef7pp4hyM2vWQQ/7JxgFwmKwN98wt7pvKy7nsw
	xsO84td/CcS4c/TJ8grAz9mYZHrt7a6fOHzEsvNdTMtLgBIwYQkgQeZ/9EcfvHxK6nrCUuRGoj6
	zqKu+OtXlOYzyqDio7FQkutPPB6imMUzbp1L0UlXHS+uRXNLyp+AjaBwT+lWP371LIvPcDm6AKs
	kNwH+I5
X-Received: by 2002:a05:600c:198b:b0:495:5044:d37d with SMTP id 5b1f17b1804b1-4955044d4e8mr120745045e9.19.1784568220804;
        Mon, 20 Jul 2026 10:23:40 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/33] util-linux: fix CVE-2026-13595
Date: Mon, 20 Jul 2026 19:22:51 +0200
Message-ID: <4a4483ac57db5f7af928e588e7318fa183442c0f.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241452

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
 .../util-linux/CVE-2026-13595.patch           | 157 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 83804196345..753d032976d 100644
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
index 00000000000..36e8658f69b
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

