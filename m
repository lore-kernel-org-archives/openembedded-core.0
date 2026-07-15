Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DD2C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:55:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10694.1784130957128224320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=geQTzPdz;
 spf=pass (domain: est.tech, ip: 40.107.159.34, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjY+jqPund76GvXVewWQ+l7eCmhZzyJ0USlDq9e5b/fVSl0rh89FcBvq3lX0bmmGAp4Re+YEZioehVTEIkK465X61sY1/CGynIpaSCf7r2xEw0skqlabMwc5B59QJTgsrnawXwYLfAxvOyCTGQyYC68f9sNGG1pt8pxdbQvLKKzpQeunZIcyWAyp9/CRS+1VqeQ1WsSNgs/PSzbEykd+bqRVmymrrEoqFiya+XOa346iFD76sFm5kiOcLWyiTxwjIOKdkIAJ2SY/BB1HpX3DkL0YVawHiVLU+9yMEHI1hbyBYoA1djGFMb6lZwMSREyRompywqi9tS77IVMxOS9HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F//ZExl/TJ1yuiGiooIohqdCrAqrTGfYqhbS1OrMwIg=;
 b=NZQnyAncrZR0IdURMxGhrK8+u6XCCZB5HxGKOInlg+qfDSKJvRrdw/mTF/ciKkdx2EUiq1U2zz7T9ZFN4GYflfM44e7Jlmo9+U6nzwb6Z5WqLjuWhMhGt5gDHHkO8a5l8i/Y+orxDg15zEC3lq9LLdFmjF0ZBriRPF2eYZVRIY25HKLT5bXQ61xHzt2eKY8VcsqmLbT+SqpyPO+1V74F9ZsER6dqkZlXh9YQE4p8FAWSYPBbgVCRVQHo0QwtEK4zISK6IIw+1wVI2eBSp/ZOHCpnrzqTT5wOM/4nCSajAX2yPNz1Q989554b7pVUTCePVY6bGQ7Pq0/p6MWOd8qc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F//ZExl/TJ1yuiGiooIohqdCrAqrTGfYqhbS1OrMwIg=;
 b=geQTzPdzKOhtcxhXldLWt/DV9g4IdRDf1LIil8GYkPg4o5lT80o8+xZdP/Cp6tvvd14Q70EjsO6I/rGWpleMF/3jTN9a6uQetXXP/UEt/NwvWabyT2Xr4EBtj9kEUMFWgq3tKRAFVnewSyFASdERg8Cam5PKMEK1lIEjkATEc3CEEE48Oz5nRRJRRUc3NEbXjmPB0Fp7vMTVbXXBOIbfEzTkjCeJfNFb0r3WazwQJ/3szm6iKyVUzxG5R6gr1qvkWCzubuY84xynd410KqKf/X06wOqkkWIV8WejzkduRR5vP/L0EGX7W2KZM0cDUuZfmoPBhjk4lkLpOkvXfPHdWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by AM4P189MB3524.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 08:02:26 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04%5]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 08:02:26 +0000
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose] util-linux: fix CVE-2026-13595
Date: Wed, 15 Jul 2026 10:02:13 +0200
Message-ID: <20260715080214.343854-1-ravineet.a.singh@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::9) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|AM4P189MB3524:EE_
X-MS-Office365-Filtering-Correlation-Id: f26fb833-5abf-4b89-ccaf-08dee24768ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	KzeIIca2IlEIW17Ax+ftXIu8DUpUuK/rvOtlpt2Jk+kxsOiMfgvQsTPv6XfGLEOHVuD/tjgdJhw4ec+7csPrkRxtMsrxaU+BT0BMNaajkLEl/6k4fsXKuvF0kbYZpupxj6kUs/If/JHo/FTACqcLLrVz17nycLhw6t+RKo1atiu4yz/ip+vgVp+Dk3bvI3DDw5dJz1pjMH2xTR6cfKIhgl12qsNRXCEu1er5rVMwcQbVimUaubtWtydPHGoiY/bMCsA2Z9BT7YLt8ESC1DEccBeRLi7X/TPyJjArh5Ka5eWp5DHE0AoWKPHUH9zSUC/GKz4PBxWhL0zzlR7Q5mq9cnuHNWX+87uCG6V3J2PtTTe7jHyPlqmH7B03m+9TETcxetpmPBfbGqJCPI7aeS49eyB2q6ataMgOwz3heGRfS/Ev8b5vQ3VmHJVuq8vVjsummwmKMIQlaAZUSPpgwfmk20meOO8BbDPaIBFbq3W5KMtrQZBZ8MuxIl0N/+uMoImQKIinh/W0mXBbKg48uSp/ovsO5sz53kEgIqEximKodLwzYKnPSv8LP7g44ekhn/RwuFQYjxnt5h5C0rAuSnCS9A+rmvmA41NppamMu1RAR1/rZd+KcSbZpX8Ar76/eWfxsPrXNzWFw4kWC8psvQ+INzWqk9I6DxoKBmtj0+n47TQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wk6seD/i5PfclOD2gwzDs7PQehVJi+BAqh6jMV2EQrlqd1lRSfnpezgKT1Dx?=
 =?us-ascii?Q?lAQ99opoMF5RbASwjUOvWtrdivPXApuvZHF2A61qSlenYZ476sQNdzUAzHCc?=
 =?us-ascii?Q?qrYaSwh5Pp3Hn3SuoctJ4ktsSdiQ8k6/xfNXyrjIAIdx5677ViPnkNH7sHk0?=
 =?us-ascii?Q?v4crAfSDPGye0ya9Qtr1pWx+iU6RVitghdGpW5gw2rlSbKTJJuI1x43FkXig?=
 =?us-ascii?Q?9VaT6p091ZrMVnyu9ku7A8SrqBiynQhzTrwHX/GfGY/yCHKmMZE8NNz83FtW?=
 =?us-ascii?Q?BlCwtzZGhODTk3nRsdZabT2DQ1ICthSmQ2N6oNVd3ZHrchv0CJ/LkKrO1CDq?=
 =?us-ascii?Q?RpRWZn+pPyfvpwd2A1x+ORvvK83i5BlskShFOzweJyDz9i/hrzf5HWwyBgWm?=
 =?us-ascii?Q?aL3nDLGItF1M/2f8oMYnvAM3ZaB09vIfVbrq79UXmKFYDZGHHqZQnCCUlbIo?=
 =?us-ascii?Q?1Rj5G580L+Q1fPtof6bosHWgi1f935sHDRr8dqLALE2rE6ySyM/tAENfIV5K?=
 =?us-ascii?Q?hKlGx1Keq0jnixRPWsIkrDKxDTEyIQv5wQYN4Mr+uhPfaes181jl4HN4f0s8?=
 =?us-ascii?Q?sihcoR3wTW4khvYwCimVykhdfndGgIPVDKhrY1kay253qtDPs+Zz2+gg1mAs?=
 =?us-ascii?Q?tPpjb2Czqd+LffGSBhLKruTa9/7D0w2nOBacCGnmTYyuiJmtGSYrMQ+R0zkE?=
 =?us-ascii?Q?S3JjWHf1iAPxIxapEGzffa1nOa3ITb1Vaz1Anbj84z6bDWmMvCK8TqnJ3MnA?=
 =?us-ascii?Q?kXnXG29V5F39LKDV1MgHT9sFnZw4GJAfs3PEqb/8yfK0izL6l+cVKlacwXl6?=
 =?us-ascii?Q?XNVJLaqKZZaSLphl55rt1hNZTpc/PTqSRxH8yFLpmizgfKceMZuVMzhVZCWy?=
 =?us-ascii?Q?2JtYIQwAdNKxFvq9Ct3LINbgjSZZT5z6DXco6HBVPRPqUwpOmrQdIO/EgdgH?=
 =?us-ascii?Q?SqzTdg5hh1+fcs2UEC/KC09jYgswdDTuEQlBwK4xFer1ScPBSe7U4evx6ENf?=
 =?us-ascii?Q?HP+fA08cnE2t19h6/xpRMbPS1EtDKKGpKy0dvpC/MaLBQOqQg3gU3XB0sofY?=
 =?us-ascii?Q?ZuKMEBrztt+rvPvGB8bM5ejUKhInYb2eCQcAEv0K0D16/gVNJ3byv4Ve/zQi?=
 =?us-ascii?Q?EEgFFEKa+Mj9UqRnUkiyxKyw2JZGnQHSS7gu5MD80ezmxq0fWRLJpTC0XO1M?=
 =?us-ascii?Q?iWmeoLLsnuhJ8AHPbHjkWhmpYs5RAULTWeHL7ghdsiGPerpQET7Vdju7pwTW?=
 =?us-ascii?Q?2f5OX716oHE6BBB3s+xzqDxeaz9FYDLi6wIIDlDItuU6mbWRWw9WvuSzVF5y?=
 =?us-ascii?Q?CT+43OqwZ3AOV04Al54kosoOg+gRApul9bkIz+AdDfJugfJeXgJibf+mpbkZ?=
 =?us-ascii?Q?rGsCeVBMQHrgEU8cA4pJ3HLUNKnX82U6j5LQXoD7ByaazJeur7JFFDvyOo/J?=
 =?us-ascii?Q?0a0vkL/6xvVR0AF36OK7vGstWGW/m8JWZnjVisSn/t3PH5DKv7IaDHXazWLG?=
 =?us-ascii?Q?JO8liRpqOl2rF4+ObhqZVndVkvdbOhIntcIfSof3e8p9U8Fc97XyyIAnG7Cc?=
 =?us-ascii?Q?lC8eR4UCzAs3BRaYRU5eQs/5nv/GP8/SbUNBZ82p5wZFT7xOC8GQOpsz/X0s?=
 =?us-ascii?Q?GnVuwHucAq0FAaGWg6NUhpEF7tw/sFpRpDvjK0v4mILziwXo9JkanhSru8b2?=
 =?us-ascii?Q?j9i5JJCV5V5cALe1T69WQvhkpujRcbcm6weUWqOt4KCCjB6wTAKReMQ/aefL?=
 =?us-ascii?Q?ZSXMJMDlHg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f26fb833-5abf-4b89-ccaf-08dee24768ae
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 08:02:26.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Bzwxcw913nz40wb44T+JYqC+85EyGwp1ngaIi19zBprQ+MX12Q9Q6jNHDv2BQrq+L8YrYUbhBL33lxU/BfEsfLAY+GyoxUMMDwEabGOXVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240987

The BSD, Minix, Solaris x86, and UnixWare probers cached a raw
pointer to a parent partition entry that could become stale when
the entry array was reallocated, causing a heap use-after-free
read. A crafted block device image can trigger this via
udev/udisks without user interaction.
Re-fetch the parent entry after each addition instead of caching it.

Backport patch to fix CVE-2026-13595
  https://nvd.nist.gov/vuln/detail/CVE-2026-13595

Upstream fix:
  https://github.com/util-linux/util-linux/commit/c0186f14fbdb02f64c8e0ba70=
1ce727ea764ff4c

Tested with ptest on QEMU x86_64:
   All 329 tests PASSED

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.=
patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index 0235862666..2a994d7a38 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,6 +21,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/v=
${MAJOR_VERSION}/util-lin
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-har=
d.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
            file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-=
a.patch \
+           file://CVE-2026-13595.patch \
            "
=20
 SRC_URI[sha256sum] =3D "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b=
50ec2b5799e58b"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch b=
/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
new file mode 100644
index 0000000000..55d7fc9023
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
@@ -0,0 +1,145 @@
+From e35a8bd91cc1781692dbd2b542ecacb983b4776f Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-13595
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/c0186f14fbdb02f64c8e0ba701ce727ea764ff4c]
+Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
+---
+ libblkid/src/partitions/partitions.c | 34 +++++++++++++++++-----------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/libblkid/src/partitions/partitions.c b/libblkid/src/partition=
s/partitions.c
+index 9df813c92..e600e5e45 100644
+--- a/libblkid/src/partitions/partitions.c
++++ b/libblkid/src/partitions/partitions.c
+@@ -198,7 +198,7 @@ struct blkid_struct_partlist {
+=20
+ 	int		nparts;		/* number of partitions */
+ 	int		nparts_max;	/* max.number of partitions */
+-	blkid_partition	parts;		/* array of partitions */
++	blkid_partition	*parts;		/* array of pointers to partitions */
+=20
+ 	struct list_head l_tabs;	/* list of partition tables */
+ };
+@@ -357,13 +357,16 @@ static void reset_partlist(blkid_partlist ls)
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
+@@ -398,6 +401,7 @@ static void partitions_free_data(blkid_probe pr __attr=
ibute__((__unused__)),
+ 				 void *data)
+ {
+ 	blkid_partlist ls =3D (blkid_partlist) data;
++	int i;
+=20
+ 	if (!ls)
+ 		return;
+@@ -405,6 +409,8 @@ static void partitions_free_data(blkid_probe pr __attr=
ibute__((__unused__)),
+ 	free_parttables(ls);
+=20
+ 	/* deallocate partitions and partlist */
++	for (i =3D 0; i < ls->nparts; i++)
++		free(ls->parts[i]);
+ 	free(ls->parts);
+ 	free(ls);
+ }
+@@ -438,15 +444,17 @@ static blkid_partition new_partition(blkid_partlist =
ls, blkid_parttable tab)
+ 		 * generic Linux machine -- let start with 32 partitions.
+ 		 */
+ 		void *tmp =3D reallocarray(ls->parts, ls->nparts_max + 32,
+-					 sizeof(struct blkid_struct_partition));
++					 sizeof(blkid_partition));
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
+@@ -851,7 +859,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+=20
+ 	/* check if the partition table fits into the device */
+ 	for (i =3D 0; i < nparts; i++) {
+-		blkid_partition par =3D &ls->parts[i];
++		blkid_partition par =3D ls->parts[i];
+=20
+ 		if (par->start + par->size > (pr->size >> 9)) {
+ 			DBG(LOWPROBE, ul_debug("partition #%d overflows "
+@@ -863,7 +871,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+=20
+ 	/* check if the requested area is covered by PT */
+ 	for (i =3D 0; i < nparts; i++) {
+-		blkid_partition par =3D &ls->parts[i];
++		blkid_partition par =3D ls->parts[i];
+=20
+ 		if (start >=3D par->start && end <=3D par->start + par->size) {
+ 			rc =3D 1;
+@@ -962,7 +970,7 @@ blkid_partition blkid_partlist_get_partition(blkid_par=
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
+@@ -1074,7 +1082,7 @@ blkid_partition blkid_partlist_devno_to_partition(bl=
kid_partlist ls, dev_t devno
+ 		 * and an entry in partition table.
+ 		 */
+ 		 for (i =3D 0; i < ls->nparts; i++) {
+-			 blkid_partition par =3D &ls->parts[i];
++			 blkid_partition par =3D ls->parts[i];
+=20
+ 			 if (partno !=3D blkid_partition_get_partno(par))
+ 				 continue;
+@@ -1090,7 +1098,7 @@ blkid_partition blkid_partlist_devno_to_partition(bl=
kid_partlist ls, dev_t devno
+ 	DBG(LOWPROBE, ul_debug("searching by offset/size"));
+=20
+ 	for (i =3D 0; i < ls->nparts; i++) {
+-		blkid_partition par =3D &ls->parts[i];
++		blkid_partition par =3D ls->parts[i];
+=20
+ 		if ((uint64_t)blkid_partition_get_start(par) =3D=3D start &&
+ 		    (uint64_t)blkid_partition_get_size(par) =3D=3D size)

