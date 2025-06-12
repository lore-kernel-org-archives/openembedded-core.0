Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDE6C71141
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9130.1749722246934219066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7welC020387
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2ndym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1tn9u6A/SkIGxs6GdZe2XRImB1lVj2qC8T4cmpFVBhkqC8tclCMHJ+tbTHxYSX6/4fAe3cSL1ixOXUrdMN4FEsaNzzBUz5CZk+S4CNnnNZIeYZ3VFS1zi54PLQ5u9JJ2NPaT+RpFKzQbWowzQxoi8HBHHlk2Hj9KHf5S+s0DRTTVsk8Rfg3bejUbHK4fQCgMuh9qAc+j0uJxGYJ9vc+B7ayGxR2nAh/N9vtaf8nMjVdgofMfnZ+oI9QLCQfwheVCR07v1Vi6whmaYnNVACyZCqWCoT91q2sKQZIOgghmA0rVfazDfJ0Gmy5ubzbGtOaLicWVFizoDbNX23R1qqIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXZMppbQU2MZQYOuh9884A3SSQCluLQgKeJTUqIV3H4=;
 b=kjmZ2XTWvPj7J/Q0LFEu+dgScTZ7suGFH/iUccUYKqLKHSzu9dudTTs4OkHMA3N2D+JKjNLd4ebOPwGY9bPIC/yuPFzZDv8zooy3bM+RmAlVoIsNMG0AV7hVj290cTSFTXiJypqMsPBmeJ38EmZo4YN35XhQmoSyyMQm37//8YVgbVj/wKiZs1zMK2RGT+QMKGEa+Ard5RUENweh1YHHEeNA/s+RG92TdxeiVpaJvcckSgywYTXM1H8YYbs+VAaWtFbHBJq65mdLMg+e3BezEmt3Ya3Hr0/lMlqvCe2RYGIN7l6mKnHigtK4rbbms1+b0gwaMJKlIQKubQ4Krr/NSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:23 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:23 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 8/8] nptl: Use all of g1_start and g_signals
Date: Thu, 12 Jun 2025 02:56:39 -0700
Message-ID: <20250612095639.3630518-9-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 376846d6-b8f3-40d9-13ee-08dda997872f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EJvu1I3in/9F7m7VBx19uxJh2SUL2eTlefCqGkBLUuqVAsC2T2Z3ha5pbTP9?=
 =?us-ascii?Q?GgyU1j9S42FPdinTDmMcJaJzn1gvT2wLJJQFvn80GFaySJrVHCFAzHgARWsY?=
 =?us-ascii?Q?t8Ud34lH7nM8xTvJtTQh4WDY14gwjXWUFB4f6SmHlHCy0QD4ZHER4Tt2AeIA?=
 =?us-ascii?Q?6woRl/z4nH6TBplNqaEoYgoScPpZXEMqoEFEpcFIxcKafCUQPwJD2+5+6Zrk?=
 =?us-ascii?Q?lO9FCH4zb/po6mjynp06TX2JoRMbjyiUlf2zP+3WcHW8tFdz+iz7iKUpYGIx?=
 =?us-ascii?Q?6YdThBnahkRlG4unjIUDuXFKyugol4SbtDwGjHQYi2lIiPqqAoCYvTbbrJj7?=
 =?us-ascii?Q?AoYEz1H5x+/CTLKCh29JBV26b9ODQJh0pxZUten84n0OnoGDBp/fL8ocWSyR?=
 =?us-ascii?Q?HR+4JzwfJ9+mrcdlFobWr7OaWfd9UjyA3gYd4yUuuVHGp5CEozoigg66gtFW?=
 =?us-ascii?Q?zvWXOBCONkVEQrPmrS7eZbbflzuU12p5SbKMJn8wRC/bm8XSPjecvqs6fos0?=
 =?us-ascii?Q?sPJjUSKKIzOf1Mf6IdiVnHREjLKztvaUvuAlFqmPYX5rAQvJT+jZ54bXXHr9?=
 =?us-ascii?Q?PQ0bUMlG7gOgyeM4AOHBOxj3J6GvjH10WcW1BKMDo/eAHPZTXYiI7d1l8/JB?=
 =?us-ascii?Q?w1LK+8UbVk6vIBSyfHbhLn9G7ot9vzBJ7YDNhFEzOZqaXFk16oHS5rYlGur3?=
 =?us-ascii?Q?TGscIFjAuVS77jQVNybQC3/lYXzk6HBxYqgFs+uCwTFth00/SnkWoR2Juw+X?=
 =?us-ascii?Q?LPaE8mOydmKJtkSI/ajnyt/XKH7Oj7M7fTYJi/ApDN31lqgxP7/YFVFeGVM6?=
 =?us-ascii?Q?GSZFxDnwdXaKoHtHiYKaCTCQiHhJQJQIDNQjbt4iP1VQgXJu+x7H0X95Mw3Q?=
 =?us-ascii?Q?tvsZe7RxlqTuJlenIDIMPTEOvL0DyYKgWAiorgn17H+2c4oxZQ7zjilXMtdv?=
 =?us-ascii?Q?TveUMg9zVMvmjyRNM1BAez8MVp838Z4JrWlqUsNmI4u8ukp6EjPcI5fyqgOc?=
 =?us-ascii?Q?7waA1iWwN0zjX1shUAL1b8BeeDrqJydHrXTDprIoPzO8AN+o8ACvvAm/EFDV?=
 =?us-ascii?Q?xjj6onuS22FXtpeXljovi+TBaCojRMQNRcOKkB6KFG18Uqq4P+bZHNRNzYhc?=
 =?us-ascii?Q?Hv5CgXNunPL8VDCcxcr0eEa5aaOriL5TPfSkkpAjVoGewKQnngDToiwRUMF1?=
 =?us-ascii?Q?CurntILRqyjHBGHn+VBQwszbNt+RsxXMCRmFlv4yGIPa1TXpoPWP0V8fHzH1?=
 =?us-ascii?Q?6WTowi2LeAbNPNFz3ox8RwC/YR1vquw+cNg72aUosqmBx1YcVhUPIu5X/gDL?=
 =?us-ascii?Q?G71PDFWLNtRPz2cw+MqS3dhCXF1xxhHdLM8771W8vcQJT4rnsNe8tjSKv0o1?=
 =?us-ascii?Q?1bGsvH81EYP5gBYWbUTSBUcr7/cwduaMLIppVjcft1tl7/11+nzTwKYb3xG5?=
 =?us-ascii?Q?CLU8/hNAbOMm8w1n5vXxILCdn2ljN54F7cem9Qnvf0fvCALJ6+5ByNnOsAzA?=
 =?us-ascii?Q?GzBNakkzNn8iQZM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EErr+jhI9aVCI8WT1Ax7Oy9Uwv1OBAi/BGE3TvBaw/qqpT06JHidPQsWqFEI?=
 =?us-ascii?Q?HHQWHfOYtBsLbvBQz0VsrhjAdKBfYwSibcpUSb3U3gTIOpjA9SC5zlA8azN3?=
 =?us-ascii?Q?UWcHNyjkvA3cGPA62bzj8B1zUg9PnIY6pl2Us8WDM2F7GKaQh5m1OthziqYw?=
 =?us-ascii?Q?riaZftWOb0myoN7wkY9DptdPQYSK9q0Yaen1+pRSvhLlufzSr/3E68PzrLWw?=
 =?us-ascii?Q?nwH8v6MfzdRqukgnK8Una743FO9UFBu6JYVIDnfPF890RC9p/Z8uATUB8FqI?=
 =?us-ascii?Q?7mPH4cfgd+lZsGup4gL2nVyH0dQ+Ew7MaegN1BiSC6Zfrx3g5Q6sgRjh2SJo?=
 =?us-ascii?Q?CV+YtCKZ9k8IsTmXVvppOmrZFDmu2X+akY7I92cflpdSq8Agu+ltG7HBQpHb?=
 =?us-ascii?Q?f3xq97AaBygOB6OAJkx1iqn/WQw6FnpX2AuazJwI8f+moJNdGqmlNGd/GYbG?=
 =?us-ascii?Q?UyEwrjGuo3l0XDmx1Lgigdv8+n7Brs3IIbI1TBa44zUwhs0WlqqTj0rvzxqO?=
 =?us-ascii?Q?lSbOr4LX8dt8p0ZHndElxnHP/LsPNZv+uVr8L0xXwG5pec/QRIZ/zbzvIvaI?=
 =?us-ascii?Q?pto24ImwhuPJob/57Cy3hI8d6kYyns3xOg++A0aVC4U1udjyLuhiIxV2SsL6?=
 =?us-ascii?Q?tjFSOqbATj9SKMjW+4QSeS3zZm8NYtmV0+6C4frIFXt1bbKW9UbKzHJetdk0?=
 =?us-ascii?Q?A7soPElheIozTpKW7/MxrVrRQVyYA53Sgd/or4l8blvjzijqu6nT3I+hcjM3?=
 =?us-ascii?Q?anR+1eo7+W6uvB1IKPhN7oSbBo9FE/+t4bnRJuUIBHwi/VSjer0eT5+hTV4H?=
 =?us-ascii?Q?zU7Uft5afodCMH2q0jYNwj4W4468qj//EyxI3H7IgPMi3S+nzsEpbg9rS+m/?=
 =?us-ascii?Q?eznVKZqHFA6INLsIyKFe08PDT0/DYcxQ/a1VVpuczLUC9gIKdSAoKHAwYKlR?=
 =?us-ascii?Q?tzy0pQ6d1Bh4YzeeqYTfnLp1b6xz+LtFQHgjwGRZu/GVvw3V/aNWZIVa444B?=
 =?us-ascii?Q?tLtbh7n54180h37EFdFPwnWcKdNm0KWWp8Xx7odIBDLly1lLJgrlf6fvdNAd?=
 =?us-ascii?Q?QVilX+uOM1x+MlJouHH94OdNZRS12mQBibhn9fYLTrDxiJYq2SLCnzMIomXk?=
 =?us-ascii?Q?rK2YXABmg4BNhPqSBULymE1FCrzSUZYF8sOO4/TSi+dyZYqZPYhMqCEQ+JVn?=
 =?us-ascii?Q?mqnU0p+IAM5yQR1+gnR9OS1NTYiHZEgNRa59vlyCZ5A6vqr6o1GXGnGj6nWq?=
 =?us-ascii?Q?NWG8FiU2kH2z7z4qnmHkPClP0BEtdYXxSQLozz7nrFPLn+6jkZgW41jvdN7f?=
 =?us-ascii?Q?CEIBSW4J7dZiS8p16PiIDtiQd5OkRpMN2n1U26NUMV6ZcNbX5IfhmToOt6+5?=
 =?us-ascii?Q?c4ghvH7CmevH2eHruyziAIjo0XisttX8CTBshSC7lSaAyf0a4NEBa+hRBt2n?=
 =?us-ascii?Q?RU5/IKrfliM5EmcMh5V3sv/hHNlzmXhwGSwabmG9ysYY1YLM7MrfKg4LC7Lo?=
 =?us-ascii?Q?bkrG5nqfiwBbPqTJrDo5tWkothpbMbVxSVYP4ddCOypeGMsxVxsaawED+dtc?=
 =?us-ascii?Q?facoTB2YjVVa639rximLtbaLSyZsiV7BzsfksZ3K1kptxL6UuNVNmx5T3c32?=
 =?us-ascii?Q?mGAd+78t8gKjvSAVerNe9t8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376846d6-b8f3-40d9-13ee-08dda997872f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:23.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkmZ2cbG+GJP515AIbMZ/NSITIkSmVYt2Ocug01LXlqeoXrTajJZ7pQOLBVJh9Bwjqn8uvYm3cnmYgdI0mf2k7xQZXJ+zXW22dw8YAwfcHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX524VuTJ0bpFK /42ngHqwB2qENKvpuPQNIa/LZ2sRgSThEfUsrEIWrOxI4HZUWXEXLmmHRRIANPezAv7S7Wu8J7g GVuksG+tryrxSy3Eznzv8tu6OiZVvCFU4YY6ggZIZa1h9Kt43+upBl2pw43GKewydqx4SQqNtbB
 s3RdU2Y5WfmZ4yezA6+ab0DsQ/yAwGPuCmFHa4B9gRMaHEwUvXm7ZfSQoGUno55YI3uEG+3wwPL HOeeMNsQqV/khr9AW2NsSCcFYn9YJ1I62/HNghN8D2wtDzLay+O2nFzOHmB8vvtI8iFAHD4K1cE xch0kqgGKo5scLIIngLt4udRfLC6T28Cu4y7Ha8rrYpkPLRKVo10AkyBX9y3iK31bg5JHoAqYnA
 HVV36BW+f39rqUNda8ULglveT/5CaQ9sX/Bst/9vgtNvM3OrvFXFJB5qLmx9Sfaqp6NVQqlD
X-Proofpoint-GUID: KX9sItZudnIG2Lj5aRvsB84iKvAbZcP9
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684aa485 cx=c_pps a=z2JJcCkshELlDGyO4lBz5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=X6uU5uM_jJMz_PZaGGwA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KX9sItZudnIG2Lj5aRvsB84iKvAbZcP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218500

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [91bb902f58264a2fd50fbce8f39a9a290dd23706]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-8.patch          | 191 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
new file mode 100644
index 0000000000..8480bbcaf4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
@@ -0,0 +1,191 @@
+From 2801c1dd83ca923c4e4ea232393b3c58667093d6 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Wed, 11 Jun 2025 23:01:38 -0700
+Subject: [PATCH] nptl: Use all of g1_start and g_signals
+
+The LSB of g_signals was unused. The LSB of g1_start was used to indicate
+which group is G2. This was used to always go to sleep in pthread_cond_wait
+if a waiter is in G2. A comment earlier in the file says that this is not
+correct to do:
+
+ "Waiters cannot determine whether they are currently in G2 or G1 -- but they
+  do not have to because all they are interested in is whether there are
+  available signals"
+
+I either would have had to update the comment, or get rid of the check. I
+chose to get rid of the check. In fact I don't quite know why it was there.
+There will never be available signals for group G2, so we didn't need the
+special case. Even if there were, this would just be a spurious wake. This
+might have caught some cases where the count has wrapped around, but it
+wouldn't reliably do that, (and even if it did, why would you want to force a
+sleep in that case?) and we don't support that many concurrent waiters
+anyway. Getting rid of it allows us to use one more bit, making us more
+robust to wraparound.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [91bb902f58264a2fd50fbce8f39a9a290dd23706]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++----------------
+ nptl/pthread_cond_signal.c    |  2 +-
+ nptl/pthread_cond_wait.c      | 14 +++++---------
+ 4 files changed, 18 insertions(+), 28 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index a0743558..ef0943cd 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Add as many signals as the remaining size of the group.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+ 
+       /* We need to wake G1 waiters before we switch G1 below.  */
+@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 3baac4da..e48f9143 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      behavior.
+      Note that this works correctly for a zero-initialized condvar too.  */
+   unsigned int old_orig_size = __condvar_get_orig_size (cond);
+-  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
+-  if (((unsigned) (wseq - old_g1_start - old_orig_size)
+-	  + cond->__data.__g_size[g1 ^ 1]) == 0)
++  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond);
++  uint64_t new_g1_start = old_g1_start + old_orig_size;
++  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+   /* We have to consider the following kinds of waiters:
+@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which closes this group.  The value we add will never
+-     be negative because old_orig_size can only be zero when we switch groups
+-     the first time after a condvar was initialized, in which case G1 will be
+-     at index 1 and we will add a value of 1. Relaxed MO is fine because the
+-     change comes with no additional constraints that others would have to
+-     observe.  */
+-  __condvar_add_g1_start_relaxed (cond,
+-      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+-
+-  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++  /* Update __g1_start, which closes this group.  Relaxed MO is fine because
++     the change comes with no additional constraints that others would have
++     to observe.  */
++  __condvar_add_g1_start_relaxed (cond, old_orig_size);
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
+-  /* Now advance the new G1 g_signals to the new lowseq, giving it
++  /* Now advance the new G1 g_signals to the new g1_start, giving it
+      an effective signal count of 0 to start.  */
+-  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1_start);
+ 
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+-  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
++  unsigned int orig_size = wseq - new_g1_start;
+   __condvar_set_orig_size (cond, orig_size);
+   /* Use and addition to not loose track of cancellations in what was
+      previously G2.  */
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index a9bc10dc..07427369 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+          release-MO store when initializing a group in __condvar_switch_g1
+          because we use an atomic read-modify-write and thus extend that
+          store's release sequence.  */
+-      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index eb32291d..2e244e81 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+      not hold a reference on the group.  */
+   __condvar_acquire_lock (cond, private);
+ 
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+   if (g1_start > seq)
+     {
+       /* Our group is closed, so someone provided enough signals for it.
+@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
+      * Waiters fetch-add while having acquire the mutex associated with the
+        condvar.  Signalers load it and fetch-xor it concurrently.
+    __g1_start: Starting position of G1 (inclusive)
+-     * LSB is index of current G2.
+      * Modified by signalers while having acquired the condvar-internal lock
+        and observed concurrently by waiters.
+    __g1_orig_size: Initial size of G1
+@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+    __g_signals: The number of signals that can still be consumed, relative to
+-     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
+-     31 to 1 of g1_start with the signal count added)
++     the current g1_start.  (i.e. g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-      if (seq < (g1_start >> 1))
++      if (seq < g1_start)
+         {
+           /* If the group is closed already,
+              then this waiter originally had enough extra signals to
+@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          by now, perhaps in the process of switching back to an older
+          G2, but in either case we're allowed to consume the available
+          signal and should not block anymore.  */
+-      if ((int)(signals - lowseq) >= 2)
++      if ((int)(signals - (unsigned int)g1_start) > 0)
+         {
+          /* Try to grab a signal.  See above for MO.  (if we do another loop
+             iteration we need to see the correct value of g1_start)  */
+            if (atomic_compare_exchange_weak_acquire (
+                        cond->__data.__g_signals + g,
+-                       &signals, signals - 2))
++                       &signals, signals - 1))
+ 	       break;
+ 	  else
+ 	      continue;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 547d0a3d7d..b5f1535b83 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -68,6 +68,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
            file://0026-PR25847-7.patch \
+           file://0026-PR25847-8.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


