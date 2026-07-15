Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56207C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:55:08 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10515.1784130904817634086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qAb0RcuB;
 spf=pass (domain: est.tech, ip: 52.101.84.11, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5E8Rp+DPqIq2uEITiZWLO6/7vNwPh8N27XWUc8MvmZTmXeZdN1J0liTZCXEvY0eIriU+AeBy9YjgkaUuCEJXw03cZDUERvCgoURbV9lTrH9IHTr8yC/OiijVuW/wCpHKv55XKCuCvWb0Sng08SJNrd5tr+6AMIDC4Q4VEAZTpgD4Y3kize/mg3BmDbWD9ScmUqBZQ7VxaowSm0HPOWj9psCGZEo6cClsYacs9/6lsQkMDO+PTy8tM7VgVcYE4h7u57azZaBoqgW2JahB9hOKuljZGWoDVf8/RNcyzl57yainXNTTSzS9J2TWumJe8bHuCy3wIrsaosGnHgxKsieyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdqaYiDVxh0QwLmKurwqwG+d8PEiOggewfzqWqcJ1Eo=;
 b=x7smFAMQoP+QDYQ4CGVp0TNBh+EykNTcTvPf9IYraEEMiAGr/705+CPHhnVGQX4NbymALeDOZvi7vPNJ/IF0kTH3yH4nqQj9KEsWSqyGgK3l+52VEtT6sSmYCGynV24vipajcDYkJkVsvqLI0zatiuIbwh4F15vifJ/ZoXH1twdLmtvGugeMEdQTnY61woriXaNbx7wBA+/k/jMGYjI7sqhbNK0ioPNdvLHAtRVKN7tDUWgXqDntbamMtk1LQG87z3BOemzYvrl388i0mIQCmKkpJRJ5ORtGl8xBlTPfCTy3+QEKoVZT47lvJMC2ey7Kc0dkNgrU3nfHFf9REkVAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdqaYiDVxh0QwLmKurwqwG+d8PEiOggewfzqWqcJ1Eo=;
 b=qAb0RcuBfiv5JTYl4J7Zg2cbXIC/TW/twoYxqRwiwYCky3/MjMqmb2J8NHml/nPwsg6pXOUW0PNnP+Ij3Z+wsI+ssp2yauQolCYJ2NSD/eeamzCOqN4k7Nk5SIp+J6B0kkUeEYwdWertwGKic05ZniPtWKJBsXFZ1Q6TJWy5q7tqCTQlokxlV1YkdilUQ3MMBU24EDVrhzAyQcfzGfaY+4ILaoFN7sP6ybXu3CoecbVjyX+LafOHNxNMPwky92J6U6Wf1SF3oV+odnz1L+0wD9TaZqqhJ3K6OAnPiX6aszQxJ2SSzCdBsKE8LpsMYcaXREcLQdntVsA2zhnEy59Fyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by DB4P189MB2438.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.8; Wed, 15 Jul
 2026 08:02:00 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 08:01:59 +0000
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap] util-linux: fix CVE-2026-13595
Date: Wed, 15 Jul 2026 10:01:48 +0200
Message-ID: <20260715080149.343827-1-ravineet.a.singh@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0565.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::19) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|DB4P189MB2438:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b28e39b-d290-4d5a-c673-08dee24758d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|13003099007|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: k5THWFxr8t8dFMEe4EjWCwYM0CE9+Z1cF5Jo4EA2n2AGwbJW34CvGxToURz5qoyW6XL8h7ROXZol49+6L4DBxQKbPr9h8EAlX4UIel3HixK1a32vUy6vRY9rpoRcWb38Wz4gLM43WKxbkfG4v+SFfYM8XET25fkcn2JuUWcvn+uqC73d8c4Rkib9TRB+h5Kink4okc5/Q25i2L8G8xr42gu/rW8P3Bn7rsLM+AeNUr1sa+tSwDierTiVFeZJFlu+DHhuW8VfccqM2BtO0hq4yJIeFKTXhFdG0PSxOQdmCARoEvzznSPOGvQTupldrg5fa90GEGQ5UZqlYNE9C4GcuNgAka4GXb6Jr4nexRpdy9S1s5BLlkyJGADXHk3lgJYFmhuhyCGZWNXlUsLsGde8y7mJiKEO9k99NmV/fIzDeIgtCB4TTvFdSNFPAyWs/xV5KCYsUHdnHMHubCQVGhRjtYrsB17ZdeSbRbqacxBGCMC2ehDBuKU8pMCzUQmcJRz9Wux45lnRV83tLbEJsvh/DRj4pZa0NZtiP4ghqIECwl+95fLylHl2MtUPd8O3Wf6TNlXidvNEALrio0Wj0G2+y3acsG43uJWRa1lWbbeubrSIxLcdkcgLR51UZrdYtCBbA4cy4sPOHViygXJcnN9KrOlvj5vVnEMrsprGPAiKeUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(13003099007)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CR2mXPrnglxIssuaiUPEMINmDtaZWYDjOKQwmFhpyEWLDVppMvj78zYBt0CQ?=
 =?us-ascii?Q?i2hmPveDNTTVTIAh47wAATurAYXPEd8HenWNW4mW1wLK/WWrdEtTgAmFYqpN?=
 =?us-ascii?Q?RK8P/Zvp4O7K0gZ6b1NY+/VXUOqTx8mj2H20mkLh8a+v182dTfLHq+W3OdVa?=
 =?us-ascii?Q?zXfhkwVxbGoHZDde+vpahDL4mO1i0tybb26m7+/Tu9LAhhTjRt5wi+zguWFp?=
 =?us-ascii?Q?yF9qin2n6PKneG1cgJlJhKkH4FCrDiQWkJY3vEH2uC2eTFF+Gjt7zIpn27SE?=
 =?us-ascii?Q?8lSlb/Qh53sSZATu3dsCDvkpyoLuLZXNjQn5l4aLa1kmvV6UZhxf/MGZJq4X?=
 =?us-ascii?Q?rN7kRy9Db+OxaPvvxwAzLZ6kDAs6+/1HAVv5JkqJAImyj4ZxD45UuAYU5+iC?=
 =?us-ascii?Q?RY+GwZADoI88pmwuATYBweOS82FUqbvRq2iY0/VHxwxt6GqwHBZKYSMMYypc?=
 =?us-ascii?Q?IqEdH2wuxY2hqnWa+ReRFbaSVFOVDelPrWD2oEwuEl3QwQYMOwI3ep3BXa/+?=
 =?us-ascii?Q?Lctu9ExqSkLiZ1Xjv5giHvtca8LUcf4S17D/Clvpag2jQmA2qve9ju0fbcA3?=
 =?us-ascii?Q?OwmMVMrsm0vDlc5aUF6o9/KI1TD4/yd3xtLRpihoU9MgOY5lTE5YrlBpQt6h?=
 =?us-ascii?Q?yOH+npYiNDlcOa9e7LdkANblUCUUMFdZokmqodDIz03lGd1ZVKpb3ZlSCfUx?=
 =?us-ascii?Q?y37p5LSMBpjCmfmZimNhjlMO1Sx6FGmVCzCuf4YNZ3oD1iYxTP3rferIA4vq?=
 =?us-ascii?Q?fp+YsaIPjmIunFuJPvzFq1dZS6ULLY5lTMbnQuORkG/dVHHQOH3OzylTv8YK?=
 =?us-ascii?Q?LLc91bSosGL7e5LJF9U0WDRwmAUgHkbvxjJ1eTzsz0u7ghvdniQguziEwcXo?=
 =?us-ascii?Q?2TxpUoKOgy4liiOteDeNknvjZvYMPY75jm0wYuees+DWGhd/TP8kaRooOcI+?=
 =?us-ascii?Q?ExuW4cm206lekm7Wz+mU+Y4Ie0Kot1CZc91xBnMm2EybiHtSjbSKKbjtK15X?=
 =?us-ascii?Q?9dQv2IdgmarXiIPY3DFIEOxOSqktgLRkBJxNeomFPC7Pm+zY3ids6pU0aqTO?=
 =?us-ascii?Q?kwBBvRNpemZnoOabjcH/JEQBJdGiaRcXf9B+tip6sYpxUDCAxsDiLmJj4XVN?=
 =?us-ascii?Q?yQEaX0aHTGUjgvJl0Qhk9WKc3LeVOScdCjhklDaA2F5b9y3U+0c+IIt23Jpq?=
 =?us-ascii?Q?G9+vrkJ8yBehpzd+Km2HlwxXZbPVDo0XzHB7xX6bMgJNjMLImwT2BK5UwAGG?=
 =?us-ascii?Q?G5DB/38ClbiHiIkLvdi0XdHniALGjqoZUjAgJxtieLyt9XeVS6DIYZF550oG?=
 =?us-ascii?Q?JRnj7md2j5S6QwzgI+allbYJUYcLOmQ9iyOOIOgZV5imPCiFR8Y9AVRk/k0a?=
 =?us-ascii?Q?SVpP07tg9eGIKatTqeSmpkZPLFY0K/091ITxCrhRbKIdP2NKzTTBOiyLbvd9?=
 =?us-ascii?Q?VfMfizT6lEh1dxCY6RVGtQBaO/KPnieiaRaCgtv39EbEhMbOs2Tcvjtbokrh?=
 =?us-ascii?Q?PXWAXIw8l4yMBqP3RSkyne7DoV9Y0R4HImSQSY6xzr8buVR3sqKSqjQhLC1D?=
 =?us-ascii?Q?q192tMMWvMpohWekx96fd89MrheZdXXgKZcCg9Sk/ZyQQ4ikvET3iv1tBZVT?=
 =?us-ascii?Q?5qKm/DeBFQjwWIDzZL8CvuKIrU83F+2mPOEpZRsGkR+AokiJ7CPbvc1FUGJU?=
 =?us-ascii?Q?xOYraHY5FlipJbAj1QXylQC6kz1sh0AGFKIM7dysdKP1wRNsfE6vJEyEAVbV?=
 =?us-ascii?Q?KT9Uu4PcQlw0/HEPyboppC2sNo675BU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b28e39b-d290-4d5a-c673-08dee24758d7
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 08:01:59.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYDJ+S5jihPR/2YWR5jC+jGbzrevZ+q+Af2DTC3Rd3TruMRDEk5+GStGZbfeJC3hicx35nUI66w1eM/Xojwd2A0nfI/Kf84SQD6Xpv+DkM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240986

  The BSD, Minix, Solaris x86, and UnixWare probers cached a raw
  pointer to a parent partition entry that could become stale when
  the entry array was reallocated, causing a heap use-after-free
  read. A crafted block device image can trigger this via
  udev/udisks without user interaction.
  Re-fetch the parent entry after each addition instead of caching it.

Backport patch to fix CVE-2026-13595
  https://nvd.nist.gov/vuln/detail/CVE-2026-13595

  Upstream fix:
    https://github.com/util-linux/util-linux/commit/c0186f14fbdb02f64c8e0ba=
701ce727ea764ff4c

    Tested with ptest on QEMU x86_64:
     All 256 tests PASSED

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 154 ++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.=
patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 8380419634..753d032976 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -47,6 +47,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://CVE-2025-14104-01.patch \
            file://CVE-2025-14104-02.patch \
            file://CVE-2026-27456.patch \
+           file://CVE-2026-13595.patch \
            "
=20
 SRC_URI[sha256sum] =3D "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810b=
d572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch b=
/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
new file mode 100644
index 0000000000..a38bf93ace
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
@@ -0,0 +1,154 @@
+From 0bf0391bc10c04ac7fa2807d72a5f96f4b164fa5 Mon Sep 17 00:00:00 2001
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
+Reported-by: Thai Duong <thaidn@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2026-13595
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/c0186f14fbdb02f64c8e0ba701ce727ea764ff4c]
+Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
+---
+ libblkid/src/partitions/partitions.c | 38 +++++++++++++++++-----------
+ 1 file changed, 23 insertions(+), 15 deletions(-)
+
+diff --git a/libblkid/src/partitions/partitions.c b/libblkid/src/partition=
s/partitions.c
+index 1c344fd30..36e528837 100644
+--- a/libblkid/src/partitions/partitions.c
++++ b/libblkid/src/partitions/partitions.c
+@@ -197,7 +197,7 @@ struct blkid_struct_partlist {
+=20
+ 	int		nparts;		/* number of partitions */
+ 	int		nparts_max;	/* max.number of partitions */
+-	blkid_partition	parts;		/* array of partitions */
++	blkid_partition	*parts;		/* array of pointers to partitions */
+=20
+ 	struct list_head l_tabs;	/* list of partition tables */
+ };
+@@ -356,13 +356,16 @@ static void reset_partlist(blkid_partlist ls)
+ 	free_parttables(ls);
+=20
+ 	if (ls->next_partno) {
+-		/* already initialized - reset */
+-		int tmp_nparts =3D ls->nparts_max;
+-		blkid_partition tmp_parts =3D ls->parts;
++		/* already initialized - free individually allocated partitions */
++		int i, tmp_nparts_max =3D ls->nparts_max;
++		blkid_partition *tmp_parts =3D ls->parts;
++
++		for (i =3D 0; i < ls->nparts; i++)
++			free(ls->parts[i]);
+=20
+ 		memset(ls, 0, sizeof(struct blkid_struct_partlist));
+=20
+-		ls->nparts_max =3D tmp_nparts;
++		ls->nparts_max =3D tmp_nparts_max;
+ 		ls->parts =3D tmp_parts;
+ 	}
+=20
+@@ -397,6 +400,7 @@ static void partitions_free_data(blkid_probe pr __attr=
ibute__((__unused__)),
+ 				 void *data)
+ {
+ 	blkid_partlist ls =3D (blkid_partlist) data;
++	int i;
+=20
+ 	if (!ls)
+ 		return;
+@@ -404,6 +408,8 @@ static void partitions_free_data(blkid_probe pr __attr=
ibute__((__unused__)),
+ 	free_parttables(ls);
+=20
+ 	/* deallocate partitions and partlist */
++	for (i =3D 0; i < ls->nparts; i++)
++		free(ls->parts[i]);
+ 	free(ls->parts);
+ 	free(ls);
+ }
+@@ -436,16 +442,19 @@ static blkid_partition new_partition(blkid_partlist =
ls, blkid_parttable tab)
+ 		/* Linux kernel has DISK_MAX_PARTS=3D256, but it's too much for
+ 		 * generic Linux machine -- let start with 32 partitions.
+ 		 */
+-		void *tmp =3D realloc(ls->parts, (ls->nparts_max + 32) *
+-					sizeof(struct blkid_struct_partition));
++		void *tmp =3D reallocarray(ls->parts, ls->nparts_max + 32,
++					 sizeof(blkid_partition));
++
+ 		if (!tmp)
+ 			return NULL;
+ 		ls->parts =3D tmp;
+ 		ls->nparts_max +=3D 32;
+ 	}
+=20
+-	par =3D &ls->parts[ls->nparts++];
+-	memset(par, 0, sizeof(struct blkid_struct_partition));
++	par =3D calloc(1, sizeof(struct blkid_struct_partition));
++	if (!par)
++		return NULL;
++	ls->parts[ls->nparts++] =3D par;
+=20
+ 	ref_parttable(tab);
+ 	par->tab =3D tab;
+@@ -848,7 +857,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+=20
+ 	/* check if the partition table fits into the device */
+ 	for (i =3D 0; i < nparts; i++) {
+-		blkid_partition par =3D &ls->parts[i];
++		blkid_partition par =3D ls->parts[i];
+=20
+ 		if (par->start + par->size > (pr->size >> 9)) {
+ 			DBG(LOWPROBE, ul_debug("partition #%d overflows "
+@@ -860,7 +869,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+=20
+ 	/* check if the requested area is covered by PT */
+ 	for (i =3D 0; i < nparts; i++) {
+-		blkid_partition par =3D &ls->parts[i];
++		blkid_partition par =3D ls->parts[i];
+=20
+ 		if (start >=3D par->start && end <=3D par->start + par->size) {
+ 			rc =3D 1;
+@@ -959,7 +968,7 @@ blkid_partition blkid_partlist_get_partition(blkid_par=
tlist ls, int n)
+ 	if (n < 0 || n >=3D ls->nparts)
+ 		return NULL;
+=20
+-	return &ls->parts[n];
++	return ls->parts[n];
+ }
+=20
+ blkid_partition blkid_partlist_get_partition_by_start(blkid_partlist ls, =
uint64_t start)
+@@ -1071,7 +1080,7 @@ blkid_partition blkid_partlist_devno_to_partition(bl=
kid_partlist ls, dev_t devno
+ 		 * and an entry in partition table.
+ 		 */
+ 		 for (i =3D 0; i < ls->nparts; i++) {
+-			 blkid_partition par =3D &ls->parts[i];
++			 blkid_partition par =3D ls->parts[i];
+=20
+ 			 if (partno !=3D blkid_partition_get_partno(par))
+ 				 continue;
+@@ -1087,7 +1096,7 @@ blkid_partition blkid_partlist_devno_to_partition(bl=
kid_partlist ls, dev_t devno
+ 	DBG(LOWPROBE, ul_debug("searching by offset/size"));
+=20
+ 	for (i =3D 0; i < ls->nparts; i++) {
+-		blkid_partition par =3D &ls->parts[i];
++		blkid_partition par =3D ls->parts[i];
+=20
+ 		if ((uint64_t)blkid_partition_get_start(par) =3D=3D start &&
+ 		    (uint64_t)blkid_partition_get_size(par) =3D=3D size)
+@@ -1528,4 +1537,3 @@ unsigned long long blkid_partition_get_flags(blkid_p=
artition par)
+ {
+ 	return par->flags;
+ }
+-

