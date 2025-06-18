Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3351C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:17:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1168.1750231022946474886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ca7d46=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5xvJR012566
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:17:02 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3v4a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jsk64TBEP5tuqd/6MfAdPtsJne6ka43+mIV5Hfy2dVnMwBNP8NXe71a/CkvwQj4m5jai+hbz1lL5dQgJqwazz30urMUB7/Fu950MCYDRIasZaXYZj/AVuY0C78P86eymp7rZDNw9NHc7t3T2n/1CDwhkzTMuuZWX2n784Ob/dLgUEMqSLdqVpI29Ts84Ncyowc555Xt9z4cZXH/oDLAJJwC6KP5R7qX7nppFc7e1EzT2TNU5JMaYmgtRctQAdMIouYkEx/u49MpUpyzA5+kUp8pVhPXchnYNnyTSMb9DOQgAnVUiO2JEpztNg5LiU40jyxwVLzw7RbtQ+hle5JahmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7YZXt3iIeRgNTSZeO/+tQ/IEq7T01mrPJk1hKxufBU=;
 b=LEzk3NkaIHeMftijC7t89t7dIrgXrtr5/+VyGUvpvX5+WKYOe3LNzFhliomBP4R/ZiC/KFS0fqSmlwdCgbsYnYSVAMYKXWX8U3nakU16NqQVc/ls1u3XlO9Q7zTDG1mafRnSx9I/sT9fnLByNa7k3q5SjXo2UP/8iJE6iGXIkvFDJwbd28k/IsIdFPKx3xA5MzzWz7WK4Pmc6MS+SlkNaM3kT09dNsp0pUY1tDX88ozD3Rhy4vzrGT46BuMoFCqcr01IFT4vzHznzH9qIx2q/w14bVusYXG0QzJg6QW93TO3IUsZJufjHN7s/o5ppRsHuHbm/MOdrMI/oOnr4r44kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 07:16:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:16:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] coreutils: fix CVE-2025-5278
Date: Wed, 18 Jun 2025 15:16:46 +0800
Message-Id: <20250618071646.3138051-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:404:a6::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bf5ee0-23fb-4a7d-9877-08ddae381d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w0Zid0+mBxTXSSDI7VybZYR5cVY7HDV+JSm9ShDZMJpPILCgrrGcNHMjKIH7?=
 =?us-ascii?Q?xgO13szFuXV6somRI6gXRxo8SBaj5e4/UCrllLF5bXLFCOdEWFw+57R+LYZ8?=
 =?us-ascii?Q?q4e3WlqYmAXSMbL+ZrFFOt5WFR6Upk/JGBZiO5rNy4NNlAD3+5PLn8ESn89Z?=
 =?us-ascii?Q?Dm1QRkBjg5b8feNZAJ4ihIfuDeWE4emgf9NCyx1S2aL+F7tCXzJpln7Hta6M?=
 =?us-ascii?Q?XrJ02/lMTIm8fkL6F7a4nuzlMRPJQOqzQ9SC0U2Mp+h+qHHMzbXAnEpBgG2Q?=
 =?us-ascii?Q?BWp9Goy1vew8+4TVIXL5DHbz4r0ivU3vT0rfxp6xtnjoOIbmpjoR3cUiFjwy?=
 =?us-ascii?Q?FCmgqyKRYrgt5UnnMhw91iD0QCjbe56RBmZtQIxiw9M++dMKaVBv1JVdbnv+?=
 =?us-ascii?Q?CLKswncgwuAfcThqJmGTei/hzjX7iyIfovkEz7cK8fkgsKcsCzyD6E3uuaPI?=
 =?us-ascii?Q?xOLEv5Yw8ekQs60s6Ema/D1kmsm4GbgMfZhb01IaamqcGiClV1x7uS8yDy09?=
 =?us-ascii?Q?D9WtUxpcV88iWW7UdqeKVgZb1AIJhkLz5T2kECLs1Xs31SSI35guPDpQWGlm?=
 =?us-ascii?Q?yFxkSul3VCrcB2gzKReLRZTgOm0nJIuuDgg+BFeZsAfUuHJcidc0R1GsUqAF?=
 =?us-ascii?Q?+kWXouaCtr9ISu63euf4a1dz6nDt+NckxwhBfrmhWbpr8iOEsDeYkWNSnx3P?=
 =?us-ascii?Q?2NnNZeNQwB+1zZFcOmauV913GJAeMrmpzOJBtJyavF+dEAQFKrCs57dzoCWm?=
 =?us-ascii?Q?zR6dUKVVP07WrHfa5fx++j2I2uC/CXI8DZMn7aavd7w9fOqp/oumrsz9qeoS?=
 =?us-ascii?Q?lqg3ecO95lj10gUqlY7ZEFp8xl4RoXMzBYZpc4nkt2YsPAX5bQlfx3gQU48Z?=
 =?us-ascii?Q?kyKU+Ba4koVJkCYVWTlXz6gnjBzzMv4btXNBLRSAAjvIBz/Ah41/iplTyj/N?=
 =?us-ascii?Q?zLh2tjX+GuMpve+AuyYFNsBdQjPEeXAPtRy8YP+mRSCashdJfFLAmtHfXb7s?=
 =?us-ascii?Q?4blMLBmkEydXNo+iS5+HW46Ltt5nd6tHyOnUPuxnhokKXoBGV8hmv12QnSP0?=
 =?us-ascii?Q?fAHicDWVqXAuCvsFn37OiW1HFqc0JmXRyBVLESfmQwplt5KEma50f6xjZ4Hw?=
 =?us-ascii?Q?TTYi5PvP7gQ3B7iqXUAj/gVhFgXy+IUvdZD+9s6sqnvNz1Ygj1QTUrI1ZO8c?=
 =?us-ascii?Q?1Qe7CEW+f5oV4jh23cNR6KfhH4HvUAgsDa1MeBWVcb6ajOrum2f+dzzDw7+i?=
 =?us-ascii?Q?Y2vzwVjgc2zzsdAsPk8y12iy2gRHyg0beCS99uxqikQIzx8+B+fsXbvexbdC?=
 =?us-ascii?Q?nQvhwlrv4iJp/wo4Vygl/COF9rZ9Ym8+W101u0MZg+rgHuPZ+cpnqscTVQjw?=
 =?us-ascii?Q?BzDlzg5wH9t1KYfvmqOiMWFycHFBXZ9YdJ67Y7lyKzeGDj8PhJR7rLyzh6J+?=
 =?us-ascii?Q?FleSAnI/UyDnLJFMXqodCPCmiS4utWP2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sNMiTIDVzdSyVHMaWUBDh7Wssa+a7KMH0hYotseyRGEv3gjl5wJca/8lfdAU?=
 =?us-ascii?Q?0NODL/7XJV8ODskGlCeQMrAtWVxKVFr7fLBzf1sJ0iVqWG7mhQqiKSHZ8u+j?=
 =?us-ascii?Q?320hqZq3RRiXlydcQRceTTcXmyXqICqImmITeCMowc9EkGdIYQFYJpsNELnE?=
 =?us-ascii?Q?+94N6mqaMWkjLlO8fCWxzjmVUZOYVuAscslSWYaECX5D+rGRS2THmgvVpP3t?=
 =?us-ascii?Q?otXKv6p/n2GTbd2GF5KoJKpfXWVpe4GltHftxvk8le//hPEhStNLM94x34qT?=
 =?us-ascii?Q?RU9Lb6M5rmP/DZag0Kh7+GLrqZw+FLbsLKgF1GR7QCB8Rtv9rqFDFNtdORS/?=
 =?us-ascii?Q?oCVshckAXnBejClcHoEWt3zSWMZtmtLE37G97Hh9esJLVmufer5zlZ5fIpyI?=
 =?us-ascii?Q?AvJBJlW69SYckSSSmcKnDF1vb/vgQ6O5XjONcnVprBnP9/st7ypA7FFLTGov?=
 =?us-ascii?Q?gUIyJ6e634IKnPqkYm/F+zwQrXC8DbK8tAl6qpP+fzxIp6AxSjFLoGylk3rX?=
 =?us-ascii?Q?Guw2mLSSkoVQgpaHNGueVUQGRiDzLqiKKOe5Q0cvemipXKZJ69Lup0i9loM9?=
 =?us-ascii?Q?nbx9wf2+A++cguVZLyrlnh5L/okyQwpVX0yhtYvcBz/IhS2OKK0i6Yiv68vl?=
 =?us-ascii?Q?o1GPATLUYqLNSNlKWtWwl29vFQGBcTyvGDVcQj+Kd4g7jyqm2RFA0KvRljmr?=
 =?us-ascii?Q?Pxk47KRFiJBdqabGLv5r909dGgQOdUTAZu2M3TocTNOOD6aeCadzBxKOwR8y?=
 =?us-ascii?Q?aP1NX1BMMdfbAPggkH0cRbXTeeuscvbLt69U5b6cRv3nEvXKeGaVSZhklhAS?=
 =?us-ascii?Q?hL3DbSCepF9zI9uA7wIU0i3wNfG3bFFKmhg4H+8zKEvCvSiRvdn9GGvLdhM3?=
 =?us-ascii?Q?fHMJPuJrUIDs4ioMR1uXWpognwWNSZmmsb5iTniC47MJSarRAcrXNsSQ6gaA?=
 =?us-ascii?Q?EtnBIIv2Dm6B77xpGKo/bV/aYSBZl/tlUruo9XupbTLztVDtzYhsklqN1Av/?=
 =?us-ascii?Q?xFWO0j1lCGjl/KM97fpnakbaEeKHlqxta0UcPFIQ+7BR1Fh+hZVIH5d/o3Ha?=
 =?us-ascii?Q?baxoiVA7/b4ecaFcY5m4eauOSjExpmYEhZQYBXkmSVEWuDsh/x0Jw/TcHGzV?=
 =?us-ascii?Q?jrxvon8XNy55SffgcIblVTCKPMXGuhBH0pdQfwEbO2I5g2yNMyLgwM7S0zLQ?=
 =?us-ascii?Q?PDVIEcxROv/7FTED+9wGVAw1rpCqNFXQSytQAXoNvAvKjc8JFzKA9n9Zx1YD?=
 =?us-ascii?Q?Vab/dpbnFUIYFbUEoJtAe+i+egMvahLz3BsiUK5kRbkaRJc5W5YHdiPhQFbH?=
 =?us-ascii?Q?D+Qp53tYBVib514hSVr9wSJM+c5DnhhcZS1OTj/PaKLoq2D627Is8fH7No4q?=
 =?us-ascii?Q?LFePRzzlWLEu5Wem+kiq57J6purFY0E2dKWON/ESSoHEwtcq1hIhCO9Qu8pb?=
 =?us-ascii?Q?Naq+dCVB0WQ/x1d6LiwFQWdAD+4hCRGlmhxMG08L2b4WWIkOsnSl/NoEERM3?=
 =?us-ascii?Q?+9D+1ma3fMvaOXPF64lw1n4QcMs0ulWu8727b7k0B7SY0hcU7nVz7/dx6StP?=
 =?us-ascii?Q?dka84oI0GAVNrFFC9WapR0Iy6Op73IYzVa3XatUK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bf5ee0-23fb-4a7d-9877-08ddae381d49
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:16:59.3832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWSPEt93HTZKaQR3mtXRlOOZwzZYTqASUvLjAMT8pIkxhj0HBUeALGcH+Lnaq3n5LTMub/xdG/GKOMW9FtKOng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-Proofpoint-ORIG-GUID: FU1JcjFT2bGAANqea5EQKpcuLd7pMNh_
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=685267ee cx=c_pps a=oWf8pMUGSF6ymmcrJseIdg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-GUID: FU1JcjFT2bGAANqea5EQKpcuLd7pMNh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MSBTYWx0ZWRfX01VKhhYHk5wc sI6f3Whez+QdCXHTVvCfKXzz5LarZM0z2u98ZX9BdhziGXDUmMjVQdXi2omA3XV4iy+vrVs4hgk i9g8gv4SbE1k2m0AHKFGy2UHTN8iPhl4vV5wUU2gb13A5RZ5YQFTGNSpDZTXYiqBB3hdDL+wGbb
 K4VwVI7G4cYnHHirKb6riZrtfQN0h1wJ9eo2Ib56OR836Sd+cbyr3wsyqRrjUt7155FNx5fPYTc /m3hxbiEPtFz3p/eFBDB+HQhyoNRG6Kb9ajo1/5Z6WLkq1x0pKX3Ktvv3HFX/dhpUfdM6rl/H/0 K06pK+fzWKQQ8k5WJvj7zuC+SWCkazoHq4yhoW/E0ysiGbmBkIaCPM0b578/UpWkNHEYCx6BOgN
 qeLCkFVTosKnKAMNsFJ5S5xaTiZSnxeDVkNAXDM/PZ5LQ/LrXtsCY31YVouKpSDXnGKaHDKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506180061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218971

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.
The patch is adjusted to fit 9.0 version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-sort-fix-buffer-under-read-CWE-127.patch | 113 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
new file mode 100644
index 0000000000..34434a65fa
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
@@ -0,0 +1,113 @@
+From 84a061ea3d1fad42188493c4e5d8396aff4a0f67 Mon Sep 17 00:00:00 2001
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
+[Adjusted for 9.0 version]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/misc/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/misc/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index 5f4c817de..07b96d34b 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1642,7 +1642,11 @@ begfield (struct line const *line, struct keyfield const *key)
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
+@@ -1743,7 +1747,11 @@ limfield (struct line const *line, struct keyfield const *key)
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
+index 228d0e368..ced85c44c 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -373,6 +373,7 @@ all_tests =					\
+   tests/misc/sort-debug-keys.sh			\
+   tests/misc/sort-debug-warn.sh			\
+   tests/misc/sort-discrim.sh			\
++  tests/misc/sort-field-limit.sh		\
+   tests/misc/sort-files0-from.pl		\
+   tests/misc/sort-float.sh			\
+   tests/misc/sort-h-thousands-sep.sh		\
+diff --git a/tests/misc/sort-field-limit.sh b/tests/misc/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/misc/sort-field-limit.sh
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
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 1cce9192ec..f226c533d8 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
+           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
            file://run-ptest \
            file://0001-split-do-not-shrink-hold-buffer.patch \
            "
-- 
2.34.1


