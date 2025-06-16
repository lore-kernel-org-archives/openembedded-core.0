Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6389FC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 08:00:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25275.1750060794577181946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 00:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8262abcf9c=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7aO41026573
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 07:59:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1hmba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 07:59:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJrLOCJMsYCgOG/0GzzPC/eALO9cgCsMa73GgrlWQ86PzUm3pCvvk5U7Vx9jYn9DwOU6JhImm1LSFkoQ6nvD49r/ajzoP5fjQidh8aj5pFmg4cXNAd6DX41YNhcjgCfORX3+O1kHNRRMAV7w67J4pr0u/aivOeUkTTzmaZh0XYeB+Q7jWz4TQKVB5C1uHYu6soRnASy6jYngZrO8HbkAhJs7cn7HB71lv/tOYdaXN50/4Frosi7x5pZ7UFHs2BoxJbXwLmTWF4MVYtOimCDPEILPMjvArtB88OoiVkffmpkBt9upOOM907O0z6NBGduc1DKQCIovdqJcm5IBOMdh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYTq8lMG3+Rj5tYJ4iKk1a27027ZSeaZak6vqmCEWs4=;
 b=ZjKejvxPt050wPkQVnqQ+21eFG0cG9jSEx3v50xM0ffPJU+EhNd7r3upyYNzPkip/zxNZVwY5Kfu8RHLuyADJ8Hn5h5UvbAhioqZSpmc5BKPOGn0A8WJG23q0Ya3OPv85RCha2DRJKlU5xHL2NGkXEi9nKslciMTzgAQIwCEeviswHT6K/QRgWDEcvDg8P0URDCxy0maWpxM11PsifY3wTcdfaaUxbMYkZ/7UW/kiIk1gYFfofOV9KOerCWTcOKDjP22fCgVxlwtKic2fOmYFDw8n+Fqj/CJsHStV2GfIXndyc4gAlsfvWA9uZA6txGxYRGm4vKvNGE89RYL7oSJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 07:59:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 07:59:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] coreutils: fix CVE-2025-5278
Date: Mon, 16 Jun 2025 15:59:32 +0800
Message-Id: <20250616075932.1586680-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 438e0a55-a794-48a8-1cc9-08ddacabc3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9TpOIYRbpVy3NJYDoOUYKKZQ1whVuDLPsXkJfyDqQadtCy2e2pRyKO8zA9TA?=
 =?us-ascii?Q?BZzbXBL6AdqDM7OrmJ56cCAkSm7S/cvykoOq6NcmI5SwPVCPrUo00W9FxW19?=
 =?us-ascii?Q?CP+Hfq619ds3EaxtZR6mTWdI/SqPOkOYCRtCCoB+Inr9SkwXDBedRoyv6naB?=
 =?us-ascii?Q?21MhAgW63k799rDwS4HzvYgiYikDXcu37bChc/B7Z2tyWLN5JEBrPGOOcmzP?=
 =?us-ascii?Q?pQHHmXaMbxOnh02hBwywDR7tInAWODf/ejKZTs1WutDxx5RzYrzLABu/8oB9?=
 =?us-ascii?Q?XO459WYvLqewoKoUgpDkpolTAuAEgRkXSKUHzbdMvq0VTxapPCDYU/9gBYzF?=
 =?us-ascii?Q?BC02vIImxglMxsowXi5Om/YzUhUS4BdjvoiSb99CViI71tdyDwn2xBWFUb/K?=
 =?us-ascii?Q?r1SWHlHtzdPZZqzfh0n8tFrKKBZm8ABcyTenRYpWlRP1/FsfmnXLsRD1zYl7?=
 =?us-ascii?Q?UFJTcNfqSaAS2a61LrxfyeTEdGEXNz1/H1kyzHZFxENpvqrZFSV2mpmzndir?=
 =?us-ascii?Q?vERMmrUka0bAhCjveaXJC4Tb792haja+Oar82NbRG1sZCNCFM8XD1jDtu/8A?=
 =?us-ascii?Q?ecSpSx8KKWD0EnJZKF6+ZSPIoRXJX8/+I8CmMYJgWGbDge9k6NO0+NjKod37?=
 =?us-ascii?Q?q293Le70K+OErnLeCWtRGXl2ddEkzy4qjChds3I+jk0IaMaZTCLxpuiWLN7x?=
 =?us-ascii?Q?iuyugsSCBm5hX3GLX3OC6m+CWgx5rKyoPwwjDhOeXiw8lfY7SajGudQ9SfNH?=
 =?us-ascii?Q?Zo8dCKZtO4FG2C+nSk9XHfD0pb0wcPFkfJAOspHUCPOd0kn7XCNnIOcFiZpF?=
 =?us-ascii?Q?KNtkq6jbWGD725w58uX8OlxU/3/qhTEpleLJYRgsy1FcNaR755rRHp7mmvz9?=
 =?us-ascii?Q?UWyYFExTW+AeuqlgLCHjNsOAyqnJFKP+CDE6gNQSnwtQNbg0je2BnWAGENRD?=
 =?us-ascii?Q?cIhfXenTMihexgLAjITHTYAJw6vaWO3G1BrssnrjAsUhkZgRVpzLM/atPsj2?=
 =?us-ascii?Q?KDt/absXF+J8ZCzBbYq3SoJ0UAlcQh4mJLRCnmw970DavFeUrhNtVssAFYwk?=
 =?us-ascii?Q?4mcDaQumuNlGo8wo9XozXSx0HlbPoe/jA2VsumCeSZU24Jr+aLMLbeMLQ1io?=
 =?us-ascii?Q?7Y7lh1OKehQe2uYaGE0fUoWKqYXFcM4dhc/h6kAwTNeJc0Aa/UtI72o13F0V?=
 =?us-ascii?Q?1XlIYe6dnWuDGNSiioMRoUubEgb4eXtIQAmvqIUZNzfNrB7tPZxLAfh6plRK?=
 =?us-ascii?Q?gFfl57duNUPR1pm8WBxXRwpiQERSMfGwEMVsMUVbM93CQzJFxxB8tmP9U9g1?=
 =?us-ascii?Q?2jBAMn1WGpyE0+wECFb91uMOBma9gxPe5g5X6uVmJ9MUEnEB0gloNzmFGHJA?=
 =?us-ascii?Q?v9o8ArjtmbI7ZE1RsbuRa+LKXDp5qRiCSuNxEOabKGep8QaMkgjt38/kCGIc?=
 =?us-ascii?Q?XT9KquBAGJPOHcGLFNwqMt0wT7mIeLt6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UMHLy//6MbnzTT0deslPIC8IiGUKb1uQO0+ZcrC9JTMjuNhh2EEa42KgdpW7?=
 =?us-ascii?Q?pQZle2A/pwdbaWs7ZvyGF5tkVDhzZ/AUzl6PjxOnGNHYPaXtaBtamzyPWJB4?=
 =?us-ascii?Q?tEsOwqxyZlkRcNshK4g/gOdNHnVno7NxKJ9Z/NSgnTdGwAggQu3P+oHGT0aw?=
 =?us-ascii?Q?YEgTro6J2orl+pFw65GzlDnx0F1XFYTX0G40EwmZttar0aJrrSZSJDC0oQSZ?=
 =?us-ascii?Q?Rvn+4LhNAtxFON6ga8NCf0h2Czq10iXQUyuFEmXpI3MJGlW91eaw8uS5KEBI?=
 =?us-ascii?Q?jw1UubBe4Mw1tbtjx9s74fF1v/DjjvwNrWCnkgdKt24zz6euVrE9POqveFRt?=
 =?us-ascii?Q?betbLfyLwPM0HaUKr31gAGzTeufXxKfQuwHbJJP4LzY9T3EHcoPERrHUlOnY?=
 =?us-ascii?Q?frjpqcX3N5Q1gy7v1MveclfHgsHDigDXLSMm8FBlYONgmYsNGXt0wRmz/2M/?=
 =?us-ascii?Q?NX0jYkjuY+xOklhZ3MhUyeh4L8vovs5C4OFnxpfI0UDAlNwSoFBdzlf5I6qa?=
 =?us-ascii?Q?fmW8U1RBCxRm87aNMMDHk2UA9LeGQszFbSTZGKjrSYBOGKZGZQL+s0Uoe52f?=
 =?us-ascii?Q?ZEHfwPsGXgaM7mE6qLtFl8uPn/H34DQJtAT1Veodk3Nsw1Ou461A9GkH8nvw?=
 =?us-ascii?Q?o+pl7D1TBokWLtGV8ix1mKplrd01LmFdRlkYBclqyj8S+bwx3Xfe0TjbZY0V?=
 =?us-ascii?Q?oifD7ykN27XWpnOFltJ0QVjD+xKcpP0Mer9nFZgbUNWVSJhDKZtiB8y6kUuS?=
 =?us-ascii?Q?LPz0OArbt+V95g5gV65A1MUouT3CZZ0eWjQWgchYXGcnExu4uqYIjvujUCU1?=
 =?us-ascii?Q?UBUfAvpdG3WY44Esc4+hh001Zf4OOHWDFOU3b+tSTws0CSszUlr0CC/WCKjQ?=
 =?us-ascii?Q?Xt8H8INxtEEwLgL/Op/E1obMiN2wJRkek19UT4/7jf5Jh6E1do0QVrfUqWfy?=
 =?us-ascii?Q?mEx1FXHkoAgrpuoHyiq3yEuvXXjkhmBHXYGXaAQohzwEiR2LQPbDpJMuBOm9?=
 =?us-ascii?Q?Bh2gNNrTehJtIZJ0IwHtCgauS4kX7bz23h5agXLQXBte5/uyW1QxJZ6KlU3d?=
 =?us-ascii?Q?16lvV65p44CQOBFMqzYpFTtndeo7SJoegqYqOYsQnTlHTz8GWVlyy+jNsDs/?=
 =?us-ascii?Q?o2tNb770wzGDVtz6vhWR65h21vAqqCFoCyoPTzmK8EOkxiIju3AXqDhf3GPd?=
 =?us-ascii?Q?LZOg/3YTgNPXWWq6Mrzvx4B9FZ3Bd/Jw2sepA3LnASbXzcLFH1igqN5NinG3?=
 =?us-ascii?Q?kYOsaQenkM1bqI8O+8baMsNgr/RxN27oxy4WkUThDUKMcGG9fhX1dDeTixse?=
 =?us-ascii?Q?yFbuzdrQP1tg1RzLE4hf9rEs7zAc97hi6ws7iuZHwESAquG6MKoQgibJltVn?=
 =?us-ascii?Q?XZTP7g2YtHuM19kxEBnpSq0h0jR2sEvcY4n2c26OtPr9/FjUTK5AdISRR6j5?=
 =?us-ascii?Q?Re3BxKzwLVq/mcr6D48pN3ZUoml4bPZwIppinpevKTawAJATphbc9IPqOrJJ?=
 =?us-ascii?Q?mJ99rMCFuvMtttpE+Warp2KDbB8/Ji/y5QerWW7emqcEiJ/GwC9z6H6lR4rE?=
 =?us-ascii?Q?P/dFA4RscAST4jPM6JsfeMrZMvydAgrHNGNwV/yC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 438e0a55-a794-48a8-1cc9-08ddacabc3ef
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:59:48.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMvJqt2Tt0KcWAiTsAr/AyNFrLtDUnJNC2pNlDiInag61K/yDCv5y+iMnMn7bvdhFtN5jjgOJCSy51ya4U00tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=684fcef9 cx=c_pps a=kuLTmBVh2a3dvdeKPdY0HA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-ORIG-GUID: wGvdnPC8AcSXyCcTSgKN9k9rk-GjaQ4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA1MSBTYWx0ZWRfX9Pl+OxAJSY6H Hq79ddprK3CpdvKPQdAACRNsMQJ+srBYQvOuPQTIAWNgH2Np+Mt9QfoTsLALVLhx+85dG2hyFfa uXAQ4eNLvUYTxfReJ/jSWnYLfM7Pa+Cb7FleRO6JE3MsYC/u1btwrjgPn8gNyCiWXYvJ0K8wAEs
 /lm3/aX9RFdejT+KpmjMWKrvz8m6c7nnClWKMpRyfVhFT3gW3hVnA7O+PXNpHtCZJFAnpHJ5lm5 zgy9IsfjlCYoBIT0Ab1sZni1vhqoGfVcDEmlkuhZOQFxHNPoI0SXgVT6VQ+3cdnFb54MeFRSAPz jSR1/I53FwCVw3YMoHhz+nG4C7UforDgLyFatDNzQMnH9vQHRfG2uVSMMDy7csICjRK8rl1qBRo
 5ToSagFtwRlECSHLFCS9arO4Dxu/xcVt0TNBjD2dmVQaFpSRJCGT20D4pLGPAFHo96Sxaetj
X-Proofpoint-GUID: wGvdnPC8AcSXyCcTSgKN9k9rk-GjaQ4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506160051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 08:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218771

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-sort-fix-buffer-under-read-CWE-127.patch | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.7.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
new file mode 100644
index 0000000000..41be1635b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
@@ -0,0 +1,112 @@
+From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 20 May 2025 16:03:44 +0100
+Subject: [PATCH] sort: fix buffer under-read (CWE-127)
+
+* src/sort.c (begfield): Check pointer adjustment
+to avoid Out-of-range pointer offset (CWE-823).
+(limfield): Likewise.
+* tests/sort/sort-field-limit.sh: Add a new test,
+which triggers with ASAN or Valgrind.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention bug fix introduced in v7.2 (2009).
+Fixes https://bugs.gnu.org/78507
+
+CVE: CVE-2025-5278
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/sort/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index b10183b6f..7af1a2512 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
+       ++ptr;
+ 
+   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
+-  ptr = MIN (lim, ptr + schar);
++  size_t remaining_bytes = lim - ptr;
++  if (schar < remaining_bytes)
++    ptr += schar;
++  else
++    ptr = lim;
+ 
+   return ptr;
+ }
+@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
+           ++ptr;
+ 
+       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
+-      ptr = MIN (lim, ptr + echar);
++      size_t remaining_bytes = lim - ptr;
++      if (echar < remaining_bytes)
++        ptr += echar;
++      else
++        ptr = lim;
+     }
+ 
+   return ptr;
+diff --git a/tests/local.mk b/tests/local.mk
+index 4da6756ac..642d225fa 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -388,6 +388,7 @@ all_tests =					\
+   tests/sort/sort-debug-keys.sh			\
+   tests/sort/sort-debug-warn.sh			\
+   tests/sort/sort-discrim.sh			\
++  tests/sort/sort-field-limit.sh		\
+   tests/sort/sort-files0-from.pl		\
+   tests/sort/sort-float.sh			\
+   tests/sort/sort-h-thousands-sep.sh		\
+diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/sort/sort-field-limit.sh
+@@ -0,0 +1,35 @@
++#!/bin/sh
++# From 7.2-9.7, this would trigger an out of bounds mem read
++
++# Copyright (C) 2025 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ sort
++getlimits_
++
++# This issue triggers with valgrind or ASAN
++valgrind --error-exitcode=1 sort --version 2>/dev/null &&
++  VALGRIND='valgrind --error-exitcode=1'
++
++{ printf '%s\n' aa bb; } > in || framework_failure_
++
++_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-core/coreutils/coreutils_9.7.bb
index dc9dfae26b..5a6456d65e 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -15,6 +15,7 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
+           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf"
-- 
2.34.1


