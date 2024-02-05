Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A69C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 12:29:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.61270.1707136179610746496
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 04:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cQfeAYIY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2765d7cc0f=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4159rwQr010750
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 04:29:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=sM6JguNFo60n519kvc
	mV4zPm7Th7URSPDP2kNGNWZ1o=; b=cQfeAYIYWtZob6ImwzIa/xGm4YUV5hXuVP
	dtKltcQzjI0SQHpduH2azhnR437MJ/3bj7gC+koEBNX31nuv1QLjU0KRw1s+82My
	jcKg/TscBIbxhUTUCEEQ1ubtt5NFu9f6ZLiwjJOAIFGEnj+1Og8Zcn7Zs4pnpkAk
	XXthDa+MvOf4z6nxTNfdAQAdvmcLQ3+iCqcXbOSevnKkP6uNdcPP+tjbw22zTjFj
	Huu6AOv0LJZQIjuEcJ4PUxOFWrokxw3ZaAZ/yn4GBQI2BzwudGMcO6RBOzduXfMA
	bMpFKI5FGUDrXR0nEinhZvRQKQ9N+mTsVXH1v4/Ek2+IyvSAcDrw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3sjjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 04:29:38 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 415CTcnt032209
	for <openembedded-core@lists.openembedded.org>; Mon, 5 Feb 2024 04:29:38 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1hn3sjjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 04:29:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1Mz55u11/PCfC+B4k55uosvuFkspm4kk2hoh3TtJoFXc/5nNeICeA8XbQOVfPaFgMDRY359GXKn6740fsImVGej21RXNHzNlAG3OHotYl+YqgLbQpmjW43zJWQOpP2SPLmBLJWQ+VxnxTWSZdH9MpIa1Cvh1vxkogEepqRGFl05sUlXPCCvIkqnD1xcJZ+mIxMRT+XL7YsyntpG4a5HxyUeft5m7EDw5ywcwpRDwCIN1vL5Bx3CWeCIWzOgd3Bh2XyTSYtn/upKWI6uN3946YZZ74ntuPUjjDQlDmimMnYSyxVkZQyhvgR4gCRS9I9gz2RC4SHU6bYdiFqccMd3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM6JguNFo60n519kvcmV4zPm7Th7URSPDP2kNGNWZ1o=;
 b=Nf/r+Zl4iT4xa44fh3319Bya/aKVD4YUd+OWOFFFSNcmntN/QI9qTy3WcP5ysmLJDIkg1nCPhJiECLCSO9v4u8J2HOg4rRAwPronRxFoQrD31hgdOKzZCV+w/wZSVE5CnpZ1rmO3TLFyM0NGQznfLKP5Hf5lxcEYr3suB/cJCL7bC8uEADj3ko3TdMveOK/5ySjWPl6pvcDX0efNJWARyCjroHUQFfnfByuL/X1srE+geFo6jK9eB8Zv2g7wUB8Om9lDtQfiYNP/nRWAuQChWAiVMGolWfKpvznOVh57sIQkXYXzNs1R45WeYY5J6DNQEEeF8W8z5jxTzFiTIK9b2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by BL1PR11MB5511.namprd11.prod.outlook.com (2603:10b6:208:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 12:29:35 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::a0ca:592f:32ba:1260%4]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 12:29:34 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com,
        shivams@gmail.com, sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH V4 1/2] binutils: internal gdb: Fix CVE-2023-39129
Date: Mon,  5 Feb 2024 04:29:17 -0800
Message-ID: <20240205122918.1896592-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|BL1PR11MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 54958af5-1baf-4cc3-2b46-08dc26461c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qAvn0x7E1Cc7+tHQ2AZgjrnc4wOn8iGRv97/S79yVt5IA502tLz6Qs5BQrS6lfEPjHorBaznW2kB2RcIWOsUz5RPlHWTvXoIW8/ex33+BRM9bw0NtdhM33waPu0niEghw6b8jjPUSfIb6JGn6wuod0fz08LNBFtf4Kk0WDS6XOb9m8M/R2aT7ivrfe8J4RY9D3kzD0vVB3SnAEeneBU8AiHe2GDyQq5RBgP9cqgYa4WUSeZ7hHP4uqsf2plUk7Nq42SyTHpgKS5+FeV3dRn/SOuzr+hH+YdhsNoZN4OcnF5U66PmgdohMeWj9Zm/xkwwudQl1mb39gUl+0fe8RmjtjRz4RGGCKu9ntmIjnXBtYZ7qMDSooFp/USQcRgkC2jsbciQNtj3oKtCBPk2q32sv0balLldlXp5fQedKEtT2Hv8P6Bk21PIkdz0mYTDRMKlSDEsQUBOGYta6rusbFNM1RO6ZN98SyCR2A/c3MwzVW2G4OSVADiHRUgWEW6UgDsj2yxk8A5Lvq0xWeNhqvTSYNYWBfT1qOyQjNZt+ql3IRZBQ4eu24GovE2kDgItnqoXtOMsaoxmKC0hfKoQB8b29wj9gE2MjpAhSe18HSc5TmI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(366004)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(86362001)(41300700001)(66899024)(1076003)(5660300002)(2906002)(9686003)(6512007)(52116002)(6506007)(6666004)(26005)(36756003)(38350700005)(66946007)(83380400001)(66476007)(6486002)(966005)(478600001)(316002)(2616005)(6916009)(66556008)(38100700002)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v1yv7ZOtFDeNouhxjMAaAFD8DLO8yD9Yoe4gz6X035ufU9G4b+jxHDYTZnvB?=
 =?us-ascii?Q?Mqa3i03/bfeyC+V2EVFoYwHJStTcQCtZUDjgAQykrUOADvhLpkJVmXTJjT3x?=
 =?us-ascii?Q?4zwUmdR7AWuBsbQvZpRv6KQ+U5HDR/BAg8LrMIY+5iRdXYDYZ1zyCOsR9K2V?=
 =?us-ascii?Q?5MjPg3+suELrDyps4DAAjxkvSZTRPUACp35Wz2dZibMwqlNwgoiBtgVQpAyU?=
 =?us-ascii?Q?CKL82hLmKlgsDZahoWaSPhEtcGze7yaCmNd1H0Nq2STBcB+l++aXHvf7kV2Q?=
 =?us-ascii?Q?31/HLxMqZBFObBiz2lulqoHUb+ZveHxmaw++scaqA8ERWVNqb7PxHetYcvxd?=
 =?us-ascii?Q?0Mta3WK8ryueAfUI7JevOIFbM0mqq6aKoMvyjpKoXoKg1Xbm2CyI7vY4Tjqq?=
 =?us-ascii?Q?JMGWSrMEt0q6PZIqaXEtBRZeqGPiYaOsNcx9vRWldglK870b8dLzWMf4IHi/?=
 =?us-ascii?Q?U3BELyxLyu3e3N+1KBZO6Yw5TE/b3bLWmDi/VriliLWz564Cte697uH1f0Ra?=
 =?us-ascii?Q?h/y3E5Cloj7WCsjUlYLLBkKKgTndgvLKJ+oUKuXj7/QBNL/+VIwkXT6XJe9Z?=
 =?us-ascii?Q?Uj9PMg8IH3NsyCVIdS/+pu2HOIlTTojhYsq58syMlwSH0hg3XeDU2jANEJzD?=
 =?us-ascii?Q?hZNTydMsvrKVUavDTk9gMrWA+KVRXAtCcaiKz+fQRGzBgGQHQjj5eIGg6rcJ?=
 =?us-ascii?Q?oTlBW2AUAEmbyUvJXeBjLCDR36OIs82S3VOyTtkTQckSFmy/Z/yrpN9L29ta?=
 =?us-ascii?Q?Na7eBMGm8nHToXpwh5QvODEtPzp5T4LrgGXAmjW0i0BbTA8dBIW/mgivkmG+?=
 =?us-ascii?Q?N08jC1zVvH3KDmy/T3esH09vMeUvUWMnxNOgzqC+r8N94UeCw0ItAhND7UMy?=
 =?us-ascii?Q?HJ4gbt+XNyC/f8dBYZOdQxnOwOJ+6AZbj0O/daG/NJ5b1yJ04pz1WhoniD0c?=
 =?us-ascii?Q?xbub+Dd4NJHbO8lzksfsM8UtGAALl25D9NvvMvhbdfm7TngcX7oZLExUsRwf?=
 =?us-ascii?Q?WufkS2ic668ZAr8ny5H1gRPTiBB32UbvKLrhKeMbp3PYUSYi6pbsoP/erpQ7?=
 =?us-ascii?Q?jJmHKPtny/TGYv7KVy9ddw6qr8VqOjpoEyNAO9NJYGyU5MwWbeZmQQ4T/ZlR?=
 =?us-ascii?Q?4YSTKCZVQuvqduvhG/6WLqT7MRh9UGj3xrcrTUNa/sCPEDZNlXvq1xvUNpe5?=
 =?us-ascii?Q?t0fEvYdwKeu0h8gGkAyU+Vg1pVrmcmYYcpnY3sHZgZQlF0dbfD7oiSzJ7aDA?=
 =?us-ascii?Q?I5B17LN606+wDkeeDRh8LM87Tqq1nzNUSqAcdf1XadOM5evI9lwnC9Ow6TV2?=
 =?us-ascii?Q?0pf+1YTbMVVoJY/YiOiT3syVbfxLeEzdvGX9gXcR0yk9GjDVTFvePC1y6Ra0?=
 =?us-ascii?Q?raODIJmClKpFwdIxYSdLclPUmL4/ndVpeGSQD8pOwZ27k0B0dTeILgFrvGy9?=
 =?us-ascii?Q?+fO6j+GZPXiKbIFXmhOQt6pnJLPPDWDUTyLZxqAtbfEnpxz+NQFk7sqrwS4X?=
 =?us-ascii?Q?3Xmufp34qJ0IoFl4MMvyjHUmjbsiH+YZTOCiEYhsGG85HjftXzyGn8qnav82?=
 =?us-ascii?Q?Y4cG6U6porWLx7GOb7lPn5pGwV4RCUN6s0/RezIffxCUGohDYe64q8neo01C?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54958af5-1baf-4cc3-2b46-08dc26461c81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 12:29:34.8677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtKA7GRChvMRAKE/l4ggvvOMjBV82egY6C0pbrPlUkmz5S3/zjuWTLH7g/4UqvCRcKx884Oc/V6iD6XJfYjEkzRjGJTwiATnANz6RXphCaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5511
X-Proofpoint-GUID: 593IKpiblu8IWGR2qqBK_qOB9HzsToDA
X-Proofpoint-ORIG-GUID: ASRPIsc3xHKvb_TGwBeTvP1ZSHKiljwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_06,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402050094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 12:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194928

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE: CVE-2023-39129
Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

---

This commit fixes the subject line in version V3 from gdb to gdb internal to binutils.
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0035-CVE-2023-39129.patch        | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 3787063cba..83dff20855 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -69,5 +69,6 @@ SRC_URI = "\
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
      file://0034-CVE-2022-48064.patch \
+     file://0035-CVE-2023-39129.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
new file mode 100644
index 0000000000..63fb44d59a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
@@ -0,0 +1,50 @@
+From: Keith Seitz <keiths@...>
+Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
+Subject: Verify COFF symbol stringtab offset
+X-Git-Tag: gdb-14-branchpoint~473
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a
+
+Verify COFF symbol stringtab offset
+
+This patch addresses an issue with malformed/fuzzed debug information that
+was recently reported in gdb/30639. That bug specifically deals with
+an ASAN issue, but the reproducer provided by the reporter causes a
+another failure outside of ASAN:
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=58abdf887821a5da09ba184c6e400a3bc5cccd5a]
+
+CVE: CVE-2023-39129
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/gdb/coffread.c b/gdb/coffread.c
+--- a/gdb/coffread.c
++++ b/gdb/coffread.c
+@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
+ static file_ptr linetab_size;
+ 
+ static char *stringtab = NULL;
++static long stringtab_length = 0;
+ 
+ extern void stabsread_clear_cache (void);
+ 
+@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::unique_xmalloc_ptr<char> *stora
+   /* This is in target format (probably not very useful, and not
+      currently used), not host format.  */
+   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
++  stringtab_length = length;
+   if (length == sizeof length)	/* Empty table -- just the count.  */
+     return 0;
+ 
+@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
+ 
+   if (symbol_entry->_n._n_n._n_zeroes == 0)
+     {
+-      /* FIXME: Probably should be detecting corrupt symbol files by
+-	 seeing whether offset points to within the stringtab.  */
++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
++	error (_("COFF Error: string table offset (%ld) outside string table (length %ld)"),
++	       symbol_entry->_n._n_n._n_offset, stringtab_length);
+       result = stringtab + symbol_entry->_n._n_n._n_offset;
+     }
+   else
-- 
2.43.0


