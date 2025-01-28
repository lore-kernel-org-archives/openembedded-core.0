Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90DEC0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 09:46:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14022.1738057615833799121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 01:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3123f64c40=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8uiJJ029598
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 09:46:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny708v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 09:46:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wteAU/yPEX81am7rwtZF9URAYZHRmrehhJMNpxeRkCXrPsK0KlxVy1X7mEvBJ3acZyFCCkwBWY28brA9BU7kbw9nVJn1rcs94GiNn+Q4um5/tWWf2Y+fjpcCUmzMibseRtGlJmsN36WB/cNLxxxwEz6plzf/Gbaj6ZvylT+XdS0AyoOr+ESenVRuKATYELwHFGLKq3L1VLXcBeGii8OrPN3K4k+RWvmrp0TCsaFO0G8CHyi2w/0LmOMGfOl7Aa0W2Vzsp6ErwQQ0CJL4XXinprS9aLAwJJbITC0HOeDf9ixsrUNgpVD5F2AL+tRyymNJ12YDgNbDL5ZLkz6k5SAyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VYdfPDI+15VAOYCQ2tXqwkZY9UYmSJn4pnfG8K5gk8=;
 b=h1kmqtMW6PzCO+bg9ytCCGvUCm7F1JeloAVsVRoqCMbpSgHVlGM1fKoBKrlZS3hve/ddApZpNII9GsQdI7chLgXaIoM6VIzTYMYu21/+KJEBoIihF9qM2QWrRnhN9VBpiQhVzA1xw1SWv1hwkeTWjlhGWNXaa+W96dbG2e3IykH0BStsGbexMtl+9ra9RuMbih6rOqRXgSb2V1XvQqY5ZKCtxFQbUjW7LACpt5lOdnSBC4CrthVmtF5/hyggLIO8c5X3qjXWNDpwy95P8zMSli3+8XM3bBquaoDa9MkLkx89AlLjA3YxDgWxo1/G3IP+gvv6Y+SaS8+y7M2B6b28Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 09:46:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 09:46:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] glibc: fix CVE-2025-0395
Date: Tue, 28 Jan 2025 01:46:24 -0800
Message-ID: <20250128094624.1520461-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN0PR11MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d8c6c5-b638-40f4-d650-08dd3f80b123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OGgB0TG+ZpZYlYmlpxP6SqzyAKRdks+smD+VMmb2ykMRR0ZvRENcjVlCTq9l?=
 =?us-ascii?Q?HLPMcVhSEfRx8ATRkLCzQQ+hGJPItKM5h2MuVgvTEiYq5Irg1wpRJFsDDass?=
 =?us-ascii?Q?QA3Jb4O1dEmoXgh7gXTeJHJ0pskrCDvWQd/gM5F/KPCvXNY6IYhTH5sjmHLd?=
 =?us-ascii?Q?bfq9CDpop8RDpD4j6vMxyaftg7pPRpYAfJt9pz9YFjSJU8mOlKTJVQ3+4jS/?=
 =?us-ascii?Q?Pq744UlW9OB2HsazlGf0Mvc4AcUUmERKO8jMcm+ey0XMWtyraJoENxnX6t9w?=
 =?us-ascii?Q?S4vbNPTfbP0Lm/6sJ50WcWf/eEr1QS45kN7lt20mGCGy+4RI5UxY3O5gHSps?=
 =?us-ascii?Q?ZdekxENqwggljme6CAzWkd29ArDiLHfhQ6KsTk++gaKoFDBTYT6RRNSvtHsC?=
 =?us-ascii?Q?n2gkUKV2Jj6mQav7onN9s7z5NxWwVcgZSd0l60925X6YEAmKc37vLwcsd/0H?=
 =?us-ascii?Q?Iobs9+0l8v8v8iJ29546OYyjgdDxNL26Wg94tfIBT9Ip90n1ieFBp4ZZTUt4?=
 =?us-ascii?Q?P6SfWhmaSIY4+F0VblcejssdqK+81rsAjXZFyq8TAQK3U2wyLJUaW3h6/2ol?=
 =?us-ascii?Q?06VH1VB6ggths4KgB56A5e7q8w5szGHOrR64HI9gmpGQS4bG2Sd/rDobj0O9?=
 =?us-ascii?Q?dtVakdGBMtLaQ6SwKSAyn2vXYnWimQWOuYtoilbCdJPGzJy5N+2JGr48tHwa?=
 =?us-ascii?Q?yiPr0FhvxKIw5MVCz5tGuB3sgxEwEfK0RGiJTFBYE8MgA6wg6xhHV0qxvuGp?=
 =?us-ascii?Q?xsU1w0/SmilRkINW99qnDu5mtkUaH3UcTM1cdEu48WTk/T+HjoNcGiZnD+eu?=
 =?us-ascii?Q?oKDou4/LNjplX4ynf23l+7bYF7U3g7FbpuzRIbceIKxhMwmIPsSfr55bAp4h?=
 =?us-ascii?Q?h20FtStGnptcUilc+6NP5BTXmAgYVQWGmZIvQpAbE353wTNqxPaNvrIbK1i0?=
 =?us-ascii?Q?dG5uioVwSMPVwkuYHB2G1Z1vrcsRVeUeNX57ZCJ7rA7V3e3ePzraKC1MbnNo?=
 =?us-ascii?Q?pNVKc2zCZu90qE8sb2fqqbirKp9t7Vwu3LmjTmQSEC0Pcto+5q1G1b3YSOx/?=
 =?us-ascii?Q?54+kq+hMhWps7TnW9qpP4Roye/koKRhZmxwkA9F6rII6pQLI5zv7RAfCCZL6?=
 =?us-ascii?Q?HU8Bo6+keo+8hMxwG1/kRUEj3oO5WKL32tFpTOj7NmBNi+an96g+FmRwtD+B?=
 =?us-ascii?Q?+TKxqcbvuNNdz4azCNKmvAIBPHxTMexw9oOvUMQ+1ZPQsaAPuknO4/6fRQPg?=
 =?us-ascii?Q?lMxaLZFtRcCvBID64/aocQwwLOyD2mz8iHge6NmtzFUpIryvxlkn8awIlI61?=
 =?us-ascii?Q?pe2KhojJKmvFLv8NFVRDoyt1G6NiBUajgiA2IBRADQ7BETD1/xcHdkDHmQ15?=
 =?us-ascii?Q?kQDpvR5tzMcITRA6g+x5v7ME6HSPU62NBId5pS8LbgcfLHnouA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PAa8IgwE75z27sv4Pdnr98WRvO9ZHArODiOkfdIs1WFJjpCE575t5aWz78hg?=
 =?us-ascii?Q?7qpCngnWnJh2UhYia6mPLdaSNuidOndNFSWARYNyhtBpI7pHeAKJFGgoilV+?=
 =?us-ascii?Q?PfhA7UsO/zEWZZk6JlFSYyyQeO0/a0Rq41HLHfIOfRY2vgIffZbbCKEaXZrB?=
 =?us-ascii?Q?fX5YsSd6fcedyNipau+0qrx/e4OCO+NZaHNdiu4moSG/VMrt6QmlkMTxC3wE?=
 =?us-ascii?Q?PuFy1hpKCx8BPHEEeah5/k5PTyKQtZjF8rying+YAZ6Urey+g0eV5stN+aj/?=
 =?us-ascii?Q?Ip63lV/3JX6iag3hwbWdxsQeptWM8Q+EnJfC+x/AyoBF/NUx3l8ioOED90O/?=
 =?us-ascii?Q?M0rKQap1iydRat8Iw+P3i4YNZsdbk0WKJRPP9i9a+ZZpRnt6NSonCh9wkVTQ?=
 =?us-ascii?Q?o9G9MLn4AKk3ksCt8gfzRMhuNnGMqqkvGxFJG99xP1QJyUjOOYCvKOekp+fT?=
 =?us-ascii?Q?t3AUQiqcuNANcZ995sMaoeJuKL2+h1S/4PrQdi5bCp/RDt2DexDVNMWPh5mP?=
 =?us-ascii?Q?hSnXbfy8jAxmAhupSNi9oiYvc+Gk5YP76GVNpkHuLMtg5fl3tBxY2DkY9fGv?=
 =?us-ascii?Q?xDnpT7euBtb9B9yHRHrvyWDy3S6NQVrM6Mgev4cVA4pTDK0xYNY5ik81MDmM?=
 =?us-ascii?Q?N5GmnHJ6hoUWFpDzbPRkyyAW163pWw7TpHi/29rji1BsvAC5iJb8osKpYvFD?=
 =?us-ascii?Q?XgZX9GdohL8aihkahEupgxwlHN4B50YXZ6dxvcC0B1jGwHtuYKdCdOxSOvRm?=
 =?us-ascii?Q?Mrk1uAz9HYIWHgPUZxy5pngddK2DX8bOucSwTtoevKAp4bxWAWedsm96P+/m?=
 =?us-ascii?Q?L9IMvO1FK0n+z+B046IrMWzMEnLuu4ygYqvsLxiuGsG+c7qXxOQS6+8YuqAV?=
 =?us-ascii?Q?ruCX4upMgS16MjeWQUQ7rcDnYXQcZYv55ESWEY3y8NOxJWyQLkuRa7qqY3wN?=
 =?us-ascii?Q?fS4neXTfMlwJ7/Y/MYaQ3Viq9X6ahBupb4Gg2DyH2bWDQApgj3goY9ukDEHA?=
 =?us-ascii?Q?zVnI6jNfoLQFioQbcUu8ADatAwCgP5XGvN5zcMkjpkYdO0SogiU6pMMqCcMt?=
 =?us-ascii?Q?RqWqQUXxbVWOtSXbbdrcc3Si2qHdbyFRwFaVSzZjCqWfF+v49OMxK4UNBXh4?=
 =?us-ascii?Q?Cle8Ua2VMOMplp5G9yBMRkziHFUUVAK/eez2/+ZT6t9O8xx1olHVSpTLjgiR?=
 =?us-ascii?Q?7ytnLroTiwl2fD1YXpOcSQOjHTBJjceaWpsmiX7ARFvJLu3EopbJrH7SZPNE?=
 =?us-ascii?Q?yQpc0lt18f/l9qR0EQHROMu8H15JlX5+Nw/3gtU8PcUu1B6cxN/A7hkYJuXU?=
 =?us-ascii?Q?46jDJ1+pSeF5mtTyU8ikvbzBY7Rr/1meB0FGT9VZW08eBV3W/Lclr9vxjkWo?=
 =?us-ascii?Q?LVeQgo1H3dE742aiQDLF8xJYa/Et3Y8/iNbMjA9b1mf3K5QoKglZO29MHwPr?=
 =?us-ascii?Q?vFbGfxveIi5qYp/wuOYYtAavdszuJHSjNhjV42g9BO7RQq9cHKyq9KvmSYgg?=
 =?us-ascii?Q?pwDMtEFonrvOztA9I25QdUCRqCUSNOCoJI3jovN71AozLLHs/OkbIKfLgL63?=
 =?us-ascii?Q?KhILVr+ACdADQBhR2kVYR2AVlcZ6DBjnB1gimkGtef8vYD049J6ECZZOFSIV?=
 =?us-ascii?Q?Qi/XCkZQBJQ0x7SHaCbe9aU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d8c6c5-b638-40f4-d650-08dd3f80b123
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 09:46:51.8133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcttjAkyuUeukkDiViJe2w4L4QgZqIOOc1h6yEHs57KEcBHabb6T2/KIxJP44XA5usDzDLFN5aO159rWrSbJcL0oSbCRcuL5TBxEN4RE6bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6207
X-Proofpoint-GUID: U3F2x82sLqCnC-Nwya465ETbYFWZicIx
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=6798a78e cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=RNnUd5T89QfoQ4j43GIA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: U3F2x82sLqCnC-Nwya465ETbYFWZicIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=896 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501280075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 09:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210314

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=7d4b6bcae91f29d7b4daf15bab06b66cf1d2217c]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../glibc/glibc/0025-CVE-2025-0395.patch      | 67 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.40.bb         |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-0395.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-0395.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-0395.patch
new file mode 100644
index 0000000000..a7f9cc8bad
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-0395.patch
@@ -0,0 +1,67 @@
+From 7d4b6bcae91f29d7b4daf15bab06b66cf1d2217c Mon Sep 17 00:00:00 2001
+From: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Date: Tue, 21 Jan 2025 16:11:06 -0500
+Subject: [PATCH] Fix underallocation of abort_msg_s struct (CVE-2025-0395)
+
+Include the space needed to store the length of the message itself, in
+addition to the message string.  This resolves BZ #32582.
+
+Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Reviewed: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+(cherry picked from commit 68ee0f704cb81e9ad0a78c644a83e1e9cd2ee578)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=7d4b6bcae91f29d7b4daf15bab06b66cf1d2217c]
+CVE: CVE-2025-0395
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ assert/assert.c            | 4 +++-
+ sysdeps/posix/libc_fatal.c | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/assert/assert.c b/assert/assert.c
+index c29629f5f6..b6e37d694c 100644
+--- a/assert/assert.c
++++ b/assert/assert.c
+@@ -18,6 +18,7 @@
+ #include <assert.h>
+ #include <atomic.h>
+ #include <ldsodefs.h>
++#include <libc-pointer-arith.h>
+ #include <libintl.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -65,7 +66,8 @@ __assert_fail_base (const char *fmt, const char *assertion, const char *file,
+       (void) __fxprintf (NULL, "%s", str);
+       (void) fflush (stderr);
+ 
+-      total = (total + 1 + GLRO(dl_pagesize) - 1) & ~(GLRO(dl_pagesize) - 1);
++      total = ALIGN_UP (total + sizeof (struct abort_msg_s) + 1,
++			GLRO(dl_pagesize));
+       struct abort_msg_s *buf = __mmap (NULL, total, PROT_READ | PROT_WRITE,
+ 					MAP_ANON | MAP_PRIVATE, -1, 0);
+       if (__glibc_likely (buf != MAP_FAILED))
+diff --git a/sysdeps/posix/libc_fatal.c b/sysdeps/posix/libc_fatal.c
+index f9e3425e04..089c47b04b 100644
+--- a/sysdeps/posix/libc_fatal.c
++++ b/sysdeps/posix/libc_fatal.c
+@@ -20,6 +20,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <ldsodefs.h>
++#include <libc-pointer-arith.h>
+ #include <paths.h>
+ #include <stdarg.h>
+ #include <stdbool.h>
+@@ -105,7 +106,8 @@ __libc_message_impl (const char *fmt, ...)
+     {
+       WRITEV_FOR_FATAL (fd, iov, iovcnt, total);
+ 
+-      total = (total + 1 + GLRO(dl_pagesize) - 1) & ~(GLRO(dl_pagesize) - 1);
++      total = ALIGN_UP (total + sizeof (struct abort_msg_s) + 1,
++			GLRO(dl_pagesize));
+       struct abort_msg_s *buf = __mmap (NULL, total,
+ 					PROT_READ | PROT_WRITE,
+ 					MAP_ANON | MAP_PRIVATE, -1, 0);
+-- 
+2.43.5
diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-core/glibc/glibc_2.40.bb
index 3e855b19d8..48a1e03585 100644
--- a/meta/recipes-core/glibc/glibc_2.40.bb
+++ b/meta/recipes-core/glibc/glibc_2.40.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch \
+           file://0025-CVE-2025-0395.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.43.0


