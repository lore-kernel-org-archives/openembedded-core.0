Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A2CD65C46
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 06:21:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31980.1731565306369020738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 22:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10486e7ac3=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE5455q020739
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 06:21:45 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtub2aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 06:21:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crSlTaT7BPVgfCUeVSeIFH9Aw3myzYACC8R+fo6MqD9oc+psYvt/YbOcRi4IOS7Xgt6aJRTJ7AP+zCFUmOc7NZPcUT5dUG5udmEEofjMUV+VZbvWJU8+m2DeLVF8EvWQNQUzekXyJ+JULt82VXpqtK1/HKJHC5ybN4UIFwP8mXB/vl6KCDREGh9wPRFEieUMFzUb0bbJrCYcbuSudzLAGh1giIB0dBXcVsxPMBu1rXDKvE2yGnrVn+6oizqzMAyMeJ5KRB9SnR8Fud7RGzxM3+z/FeQhujdtTcnZfJoYwmJp55CVp8L8kr2rrp8+bELu4pnjOdwDbVdF+vwnd4jEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K4+3Kv7C3IwOOixQplz7AlfEe0fz6JRzkuRAd6t1OY=;
 b=Q7JXcCYMQXhpfMn0jP0piN06fsh9KaNo4meX9rjT7nKejejailz7FRfWRy55NfUr04n3ZPUtdWXgq+Y2Md80RJInsaShLa4YULaP1NEiEnTJgZBTftMDEpvcz+XV1aQ6mM780StefrlQNY1o44aOeUqpPbRcF43vWDAQlzZWw8VLllKQk4SqMtaRwXMA1XlEzb/T47fq3JoxMUWFOmkjrM0GLE+QLIBbrsMQ2kuGuBgMLNM/0V/C28Vf5VuIOtXwLCDqLUcsxL+kOR7f2qO2ii4Xahc2g3PQraodlELOP38KzTBY3QOYz1jQLnLvudk01ME6uC3f7sFPmyzPeTNEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7387.namprd11.prod.outlook.com (2603:10b6:208:421::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:21:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:21:41 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] lttng-modules: fix build error after kernel update to 5.15.171
Date: Thu, 14 Nov 2024 14:21:25 +0800
Message-Id: <20241114062125.3857531-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:404:29::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: db059a89-02fc-4921-ff8e-08dd04749a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SPxUlFhY302BIPUwzeU5K1gy+zqjbwIZk5M0q7OZIW2c0aGSeUJ7nVxGtGUn?=
 =?us-ascii?Q?jqp6LVS0m9z4TflIgUpF+bKCCTQ3tOX99wQ39mnakjB/AHuCwmr1MHM4GGQB?=
 =?us-ascii?Q?O0YBVYw0YWFza0Eo737hOs92FANwSuauu4bTCkEwkOP14g/spr5/N+oREcwL?=
 =?us-ascii?Q?2gyLw5HB1mghMa0aQIjENTez2x5BPDxxGA5sgaHh3kuyrV5AUyEr1jpezF9J?=
 =?us-ascii?Q?wbY9kxMqTGpUGDLhXLQ4SAwVjQBrgnTEKiBl/h+bq1160PtfGMyg5xibD0KO?=
 =?us-ascii?Q?5PVAlmHjGp2ZZ+DsrVUA0NujYKdAy2UHZfajW1s1aIsg/ssYmVgdaHgxO+Mi?=
 =?us-ascii?Q?QRrT/MnUCcuhE06J3exFkHyzfJiKxkZ1zL83sEZA6HFk0Ja3fgP8dRrGsyad?=
 =?us-ascii?Q?wYghiw1Kd8y8F3bASmr4Dxa4nJuIhp/z8vleyQZJXTZs1xcVTuJWz2i9/HYo?=
 =?us-ascii?Q?7pMwkOvDqSZG1iz4s2rbQt0vQnTntSyBY9lEPt761KdZ0VW4Fy/ESxhkLLOA?=
 =?us-ascii?Q?nC3mdLeWxKQbhSOWXO89g9Bz5aTUsdrlqRFUmNHUrk5U7+ztmCBI6zyX61i+?=
 =?us-ascii?Q?S6JPTJ3kRRuADdHcG8gXWBKwa/INinF7ofj3KW22P8KKpOH51QhyXUSHvDSL?=
 =?us-ascii?Q?W1BdsVtbIWLUmz3SWnvXYIdEMrZbMbLpjbJc+LXQw14VZuTW7iVafAFZ1egj?=
 =?us-ascii?Q?wpNFRCpJFUYuTEhS/eRKpMS7SfcJCb5p5jqUOkcxTFvrOcbCjccnZUAAbD80?=
 =?us-ascii?Q?eIDjDAT3/rVgS/hnu5dQtqixZwFIEXyfRbowu71yUhaMF2pQiYbmWOgXMT9H?=
 =?us-ascii?Q?nZB5Ycr7PT+9RygiRlSnw6eCkSHVQmNNXpAzHEW/xuKchHreudgfQ6CdaMlH?=
 =?us-ascii?Q?VJw22EtqE/MsBupH+1oO+QF3/GQWeW0OZ+1unTLJ3AsGUr8EccNJJ2gdxRbG?=
 =?us-ascii?Q?tzD3me4fJhRQ55VxKzifQftc8G00wzLLVyV8CPZIE/wVAhU2KEAgzHYreURZ?=
 =?us-ascii?Q?zShr5gUUBK/OJ163oaUHaKyGoxHedisyH9UwxldPBo6naN9QyAdNjt6I4AnJ?=
 =?us-ascii?Q?ZmDDpY7tDl/REiz6XvwrBoWZzYpGEY89qypUNlSOZnqIgXfQIVylJ0gYanA+?=
 =?us-ascii?Q?Ns4iyY9CIVrZQ5CusMtFblgIwjPzvBpRlrM37ZAhzgxuR69kJ047qkfTBCo6?=
 =?us-ascii?Q?DCTHv7ckn9xwRimGmSLEM4NEW6Q6gOkI89hTYw1Y9fZ9cmtfyBRdnKGLs/k/?=
 =?us-ascii?Q?Y8v+mf24/ABbw565xH6hBpVJUkc7ZmKk7jKk0TwYYZumWUXd0UZ4B9H26U28?=
 =?us-ascii?Q?2zYgW9BtTtIp0J8e47jRxCXR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9L8te+OkcpauDFBV9CzrSXRjFbgnf/qoKNF0QtjgI4qy1EdGRmh89NZmC60P?=
 =?us-ascii?Q?tPA6fGvdId7ONzo+Se1Xp7RA/wy6UCu4IPLUrWJ3cz1V5xAcDfFFAADuIc1K?=
 =?us-ascii?Q?ws64fSwwSTgAXwiGmyPA2OdwGEs0J82Ud2UdbwwiyDzzd1VftHaVvf+I9J+A?=
 =?us-ascii?Q?QvBnQ+ni5+JAenQ0t9E2zxT631TliSUQEA2ZV92KE5wJZx/oAfd0rai2zAVz?=
 =?us-ascii?Q?MKCXyPKD3bL0ABnFIwxWcdnblWH4mFp3urWo+DYDMVlAR2wo1LAEu8hPZO+w?=
 =?us-ascii?Q?c9amX6rSjTGO08LDsP26tBz8Ne6CX2R1Jb0CxgYIoEC0FB0EVOByGFxpuupn?=
 =?us-ascii?Q?dXzv+Fdt8OW2UDrXnTLOFVrs2M5ICrXhI81IdqyoEDkeec4gGUmm4K6pR6NH?=
 =?us-ascii?Q?4pvGzJnCh6wrvmC9l4xT7xN+O/P44ZrdsGeOnGwsPnFzEYXLRQciMxETf1d+?=
 =?us-ascii?Q?woyrz7wVjeVcoJYZrK785JJpxVC3vGNG1oM/jTe8i6a4yl708h6yqvohssSv?=
 =?us-ascii?Q?eY+tl6lzubgLoRsmyMRl4kb1B16W3X9kpDkVKs8YBiwg9k98lb3l0iOG+nvI?=
 =?us-ascii?Q?js7qec+r3ldoLXq9DhaMcWT1t1hYEHj3OklFePFGjkuSpG1HkcKz+Ol0ABBH?=
 =?us-ascii?Q?dqv08LxO+1gW/KyBH5KdtiM5xGntRfEH6m4iJw3cLr+yLY8QDZ7gPHfj7O6j?=
 =?us-ascii?Q?sjEbyZiRm2JfhBzUamN/rFRJcuVYVWHke1dajnunKvdJhmfnd2Ls0v4hwlEm?=
 =?us-ascii?Q?nBgaS9HiIVOpCuiv664vTJaN8rm7JqynldmTa7yf/WexjtrwOboeXgSmk9pU?=
 =?us-ascii?Q?BDsrUbsIxw5wCZaKQpPYnNXJkV5N31dKEZPU+MPoDo9+68KOGStzkfzuYZ4f?=
 =?us-ascii?Q?+/CgrvrwaUB7TVSJTo45XpBXAwE2NHovMo+AqPAdt4otMWYuVmQ7n/trQPbu?=
 =?us-ascii?Q?8VSLWqKRFMOqfoXOKndmC2QlGaVIeeErGHurQMokmQLpnvg9HjYu51Rq0l9w?=
 =?us-ascii?Q?8GUgogTDC3DyZqbMoctLY6IvwLVbwqNXjJOPZFWJb581gEznB9n7qk7WNJyo?=
 =?us-ascii?Q?ndKKSFjDlznAJfaIKIyhNfQdAmkIrrU4CkDl/XLA+10WP3KV4rZ+4EnAtXM+?=
 =?us-ascii?Q?wWVJn16n9kLlI7+tDU4651cPaWL2cN7641hSBEtclFm0iYAtT8J2OkIsPuRa?=
 =?us-ascii?Q?BQ0f7Mw9UMD0heIn2uocHA89+049O0llwKv6EOxXFdQcTEK7zLFpHjgAxU3E?=
 =?us-ascii?Q?hJqReg9oUl1CZbVLnRwEhapD9KMnF/QnqQbOUtglaypUlucODFnRbjwvhdMu?=
 =?us-ascii?Q?9iAIWVulusk2usHDkgh3+cZ+2qXki4y0InbrsqmrjHbXZNIOtvPfjzEBGa0J?=
 =?us-ascii?Q?Xl95k0/iHUCYpWWoZuXdRNoSs66xC180mNczn2pC8e62wpjsJ3gLgYNbYNwC?=
 =?us-ascii?Q?EQ3W4xaCQym4FaVUP5tWU8PSKfjP+8PJFFVOvWV6qvh4TObYBodCIgI2yS+3?=
 =?us-ascii?Q?cBoEpLLPM4u13+k/6ML9CMqU+L6sEtd/3es2ChirJA1cEuxuNkzYNlRMAMhM?=
 =?us-ascii?Q?QKl4kl67aKxc5Jj6J9yy91Keg43wxtKnCWROEqhe4CeOFSTeIGJS1vx82EZq?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db059a89-02fc-4921-ff8e-08dd04749a5e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:21:41.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JdZ7J+VHl8UPgt+guXBAFc7MxiIxiIrTcXpT9ZygiqQ+i8AGIo+/6NI0tly7lISEFLkkW1Bc3Y297tRgCekE2lDBo+PlGVd/Ul8QjfaPiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7387
X-Proofpoint-GUID: Vym7_Uwn8ofQRe00iq9Jg6wg_6j51rkQ
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=673596f9 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=7d_E57ReAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=a5LkSv8FAAAA:8 a=ivIkX58JM1iPaf5I05kA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22 a=E2cWBXyb0kjxxB1PlMdk:22
X-Proofpoint-ORIG-GUID: Vym7_Uwn8ofQRe00iq9Jg6wg_6j51rkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_02,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 mlxlogscore=850 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 06:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207139

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

This patch fixes the following build error after kernel rebase.
lttng-modules-2.13.14/src/probes/../../include/lttng/define_trace.h:87,
lttng-modules-2.13.14/src/probes/../../include/instrumentation/events/kmem.h:576,
lttng-modules-2.13.14/src/probes/lttng-probe-kmem.c:35:
../../include/lttng/tracepoint-event-impl.h:133:6: error: conflicting types for 'trace_mm_page_alloc_zone_locked'; have 'void(struct page *, unsigned int,  int)'
133 | void trace_##_name(_proto);
    |      ^~~~~~
../../include/instrumentation/events/kmem.h:444:1: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
444 | LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_mm_page, mm_page_alloc_zone_locked,
    | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kernel-source/include/trace/events/kmem.h:9,
from lttng-modules-2.13.14/src/probes/lttng-probe-kmem.c:24:
kernel-source/include/linux/tracepoint.h:244:28: note: previous definition of 'trace_mm_page_alloc_zone_locked' with type 'void(struct page *, unsigned int,  int,  int)'
244 |         static inline void trace_##name(proto)                          \
    |                            ^~~~~~
kernel-source/include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
    |         ^~~~~~~~~~~~~~~
kernel-source/include/linux/tracepoint.h:539:9: note: in expansion of macro 'DECLARE_TRACE'
539 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
    |         ^~~~~~~~~~~~~
kernel-source/include/trace/events/kmem.h:259:1: note: in expansion of macro 'DEFINE_EVENT'
259 | DEFINE_EVENT(mm_page, mm_page_alloc_zone_locked,
    | ^~~~~~~~~~~~

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 61 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.14.bb            |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
new file mode 100644
index 0000000000..abcc519e81
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
@@ -0,0 +1,61 @@
+From 6479c4ae43e7a2096b97c800ece57defd0ba62b7 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 12 Nov 2024 11:19:23 -0500
+Subject: [PATCH] fix: mm/page_alloc: fix tracepoint
+ mm_page_alloc_zone_locked() (v5.15.171)
+
+See upstream backported commit:
+
+  commit 28e7a507196fefd119e7ca2286840f1a9aad5e8a
+  Author: Wonhyuk Yang <vvghjk1234@gmail.com>
+  Date:   Thu May 19 14:08:54 2022 -0700
+
+    mm/page_alloc: fix tracepoint mm_page_alloc_zone_locked()
+
+    [ Upstream commit 10e0f7530205799e7e971aba699a7cb3a47456de ]
+
+    Currently, trace point mm_page_alloc_zone_locked() doesn't show correct
+    information.
+
+    First, when alloc_flag has ALLOC_HARDER/ALLOC_CMA, page can be allocated
+    from MIGRATE_HIGHATOMIC/MIGRATE_CMA.  Nevertheless, tracepoint use
+    requested migration type not MIGRATE_HIGHATOMIC and MIGRATE_CMA.
+
+    Second, after commit 44042b4498728 ("mm/page_alloc: allow high-order pages
+    to be stored on the per-cpu lists") percpu-list can store high order
+    pages.  But trace point determine whether it is a refiil of percpu-list by
+    comparing requested order and 0.
+
+    To handle these problems, make mm_page_alloc_zone_locked() only be called
+    by __rmqueue_smallest with correct migration type.  With a new argument
+    called percpu_refill, it can show roughly whether it is a refill of
+    percpu-list.
+
+    Link: https://lkml.kernel.org/r/20220512025307.57924-1-vvghjk1234@gmail.com
+
+Change-Id: Ib76feb79d95e9f93c84c3aa1b946e57ac2e2666a
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://git.lttng.org/?p=lttng-modules.git;a=commit;h=6479c4ae43e7a2096b97c800ece57defd0ba62b7]
+
+Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
+---
+ include/instrumentation/events/kmem.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
+index 9a0f0bbf..96a5d9c2 100644
+--- a/include/instrumentation/events/kmem.h
++++ b/include/instrumentation/events/kmem.h
+@@ -381,6 +381,7 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_page_alloc, kmem_mm_page_alloc,
+ )
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,19,0) || \
++	LTTNG_KERNEL_RANGE(5,15,171, 5,16,0) || \
+ 	LTTNG_RHEL_KERNEL_RANGE(5,14,0,163,0,0, 5,15,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_mm_page,
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
index a3e29ab7b7..e8af0eca44 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.14.bb
@@ -11,6 +11,7 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
+           file://0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.25.1


