Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339EDCF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 16:18:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35266.1727626727768048953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 09:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0002c673db=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TFsRxe019348
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 16:18:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x710hdrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 16:18:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOFronLG6bTdWdSR2XCt84KiKyofvbOkDz70kRhdJF9bEvqeGQRU1XyuSty0IemJj/9TMRohG6HY0t5mCgW3REdHrTbbZz0D45Vp45DSBR+Hz7wEpYfsZekpqdZaXGY5CQa2bRjWniXoVCFSDAuvU5yW23BMm6juMHwh61rcKwabXjchNm/OpIbFMclnMnc/qbHBzxgBxkjgprBPjNAzPWx3Vhu6e5X9EgjTMFrn7PH+n8RTX1xsH9uN0n/OE9F6FIw6EDgA9m7NA9EYw8XTPmJ1gLuKMNgmURvwZr7Q/aWq4KWXPTqPVvCq2mOwdx/ma64586Y5rAKX99f1Fkulfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60O12rTpEUXKb0cYwhXzgabI8O1PCAmWOufwxoBemPw=;
 b=W0JF54cg+5TQS0YM/TpyRlV8zvMj/p087JqQMkoUZf23W4Q3lr//pOxBKQK9+ZDcJiNEXI3/OLr42vLd6uGZwbcHObpO5A8As09GhZSIn0E/wbvk0H6dDRLwdfJgAAR0n68lLi4dR/DYgiTbEHLykztt/HxoFtFEUiPbHPgoQcGtk++6Fx1FL2L6QpQyJOO2FqPb38nStgslWINbc0ukcaOTTB/OuJqHimCeYbY0kTQpi8+i1kFtL3zh/rNQOU/bJFD07m2NzytF0F+7wnzlhqDb7mr38EiAQH7KNuhhx91Blzw6tq9NDBSgqfjJ97faUbkBDlivvE3gtjKRpmy9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Sun, 29 Sep
 2024 16:18:42 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 16:18:42 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates.
Date: Sun, 29 Sep 2024 09:18:25 -0700
Message-ID: <20240929161825.3616542-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae47e33-fc38-4bbd-7082-08dce0a2624b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j9JFWmIGSf1vVFKgvkndsDyIUGZmHc9sSbtrFoN4RpjMgG+pkkR9Zr0R6/nm?=
 =?us-ascii?Q?LT2dbXHyxho/hv8F2bHAnv0gURzBCGFeESsWljKJrt2b8eAKcwl6ugqZ6bd8?=
 =?us-ascii?Q?e0UiNGs0y/whX0bcnLbVSZv1bVuZat+qI0X6iebsyoOA+D6R4TNYgIxuyN64?=
 =?us-ascii?Q?wVdr2nXebPNrNySSPobQpJGKb7ZK8fOy3D4GANl/m1A0cskLweJVMiDHfCNA?=
 =?us-ascii?Q?8EU7039RJlZI3hxbYq9txwUkYQ0Yuz8yFMl5l3uzIM0U2RYwscoVX6XXHCHs?=
 =?us-ascii?Q?Bc2CftTNLYVX0QMaFVtvvdL692k14bIHt5EISOlP8yFXu2aS5NJwveJRSGaK?=
 =?us-ascii?Q?zr741hRrgpUlKdA6+cxkxusE81fv9gEsrjIU28MNrnpedPXzM/f23EfdUKZj?=
 =?us-ascii?Q?UN3ztUbgkqrjgB6wBK0VMZ/kQdWPAEFttkXedlDyn3iNrcv9hxs0KLLzGS/n?=
 =?us-ascii?Q?2GubJ7vKxHh7Wd23gWKEe07xBG5waDJ8+y39iRLBUHs+d+oIqk6yRJRTB3UZ?=
 =?us-ascii?Q?Lzye+uPGYCYcqYVAqm03Q+r1OEihwqG3YqFWDW01TDgdIc085dQtV9jLEyqo?=
 =?us-ascii?Q?eLu+2pESyznkupvYy2JXxylKwqBa5N8oqqNyNZAtl0V47m7SQu++v6p1QzOY?=
 =?us-ascii?Q?icBMKdzivFN+QA73anWKwxW8xq9JBtUsLkGfK4jcJ7IJwzlxteCOAPePz3FR?=
 =?us-ascii?Q?i58Tq1jLdPxysp9MrCPTyDswJ2+mc8vXGRW64C/RJKKPdYudMMk/uFTtQFLd?=
 =?us-ascii?Q?6dspyYEzZZZ3I1bwi2+UL1/fi/T+0LEZu8fkhSZJGjgqxoUsLDr16yYW0yVU?=
 =?us-ascii?Q?9TVNh7fkj+oQbeC8tpxSC8LTKqNqILlMtnFp2+PHyDd3CDVWzQll3kVQns/5?=
 =?us-ascii?Q?tIAi96hW4tcth/XnSjiN9kaITI1aHj86LxBS9fjA3UPia7hl541NTf+d+iG4?=
 =?us-ascii?Q?U/cEOM9A0YZjQOL+um2YdAT3lQkRVF0rNgQMYbnaPj5ig9+EWVLeoAE2Vzvh?=
 =?us-ascii?Q?ItsC9+ZJeGxl8qSzITgwitPNsBNzjqN7Yxcp5ddXvndtZ7GI4DBvCVMbfFKJ?=
 =?us-ascii?Q?0+LjUR776Axya2OrZ687fPC+FAav4a6FcyZhZRjK84Ht+/L0IHpnDCzlT7Qa?=
 =?us-ascii?Q?v9CaAijFTAtCzzJXQiLnqXTBPgh7olVFSy927fdi5vD350cBExxqKU5pkEnB?=
 =?us-ascii?Q?B6JiqJgfGgSJ6kBOUzV2PfwoRdzjuFzw7tR/35LTUXuuIe5SZvwE006kAFGP?=
 =?us-ascii?Q?ruYmDN/4lFepSFgePTfzhfqOjkwCiOrQx7PsC6D+tBobT7YlAS9zMYd1ax4k?=
 =?us-ascii?Q?ugzD89WlVcpd9rn4wyhJ+lcWxfJGfiqnPZUMlpWRpPiUHA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zl8Re0umxgi4yzVGVE9fE+Ho+hAqpFMmUavWObft890awLE2B+pP6A+SZJh1?=
 =?us-ascii?Q?0cx5/9tughAMo51TMHfa6P3A/eClZCU3tudiNiVu7FP/N7ncX4Auh4FbXxqy?=
 =?us-ascii?Q?WdtaQhAfudWA4UqI4pJpNIFVT2OBNo4497/pQDEGek+xlD1lEUsSmP2KDSpN?=
 =?us-ascii?Q?0Q6tuYAGwi8uiqm/NDZ7E0sbiFvdv/2JNn+f0HkOIKhFzbsL/tyi5mlseRBL?=
 =?us-ascii?Q?eyz8CKJitjPxuzkhFIlIWyOjhXHDgrNG6Rwak2luRmyRGlg5gmE1MBI+2w/e?=
 =?us-ascii?Q?2R4KwGkqe8zV9d/8EK2KIbyg8DTbPowq4wbpzS7jhfYjOs+qEVo/jsA6446/?=
 =?us-ascii?Q?3oVamSKVPLrUj7OGJFMOCnpydIEPA4Fueu6txr2PVs9SBn0c0diXVbY8dxI/?=
 =?us-ascii?Q?i9YHNLKHpu5QpKkXqZFzoa3kGQHk8n2xKrInNgBEI2rwFjA8PM/0L+7O8KTM?=
 =?us-ascii?Q?PLBeJjC1QCQhl6r+874Q7F5Sf1hso0/Kv88qpW9rLSW811nQ7ipmMss7r3BL?=
 =?us-ascii?Q?LyG48sCfhJ0YzzWLes1gh3wIbEgmnR4lKTzS1tm5t83x7gdAFUMOkUJp5BFD?=
 =?us-ascii?Q?PsxtDiV4Tm4yCMr4WdDb+B/TRW/qaGvXX81LuUmXuqd3Bekc136rkzb2hYwq?=
 =?us-ascii?Q?FlgX+KT9SIutkaACo2ap7x3QP8YRmTrMoap033bxfwI+QFq8OaqN7eoU+S62?=
 =?us-ascii?Q?m6ICikFzk93HGjx8GM+N1qDiI9obfbwuFgyd6whSUuRM1cpTL2BP9hPhqKyk?=
 =?us-ascii?Q?cVZLCQsb7yeLW276fKUZV+RXP3eRgZHGhF2hWJ3kb+isYCcZKtlZOk0fcaRR?=
 =?us-ascii?Q?zRSTzg7S8vhqdFUVgO/7u9G2wI6jQn3FJdAkTMEaobPGkOOGQj7QOAlm9+EM?=
 =?us-ascii?Q?UqSnoQlVfJlho8j5kU4jlUeftQKvrs63c3WKXItyEZO7mK4AgHOXWcTjFj4L?=
 =?us-ascii?Q?2SCT/C8U+7q77a6na9brQ/WWROiNPAauNkmqTe0iyLu84jM82xsjBmKzJwGw?=
 =?us-ascii?Q?XqgezulPk3KemQOib5crZEIJkDpa8eKkCF3akYhibImJ94vVFwkyRJgiuBe3?=
 =?us-ascii?Q?6/sQkTr4EyjRa6u6BF0nrYU8Cvn0Y0z+rsnOu7mByS3U/MI2zeMIhB/bvxkI?=
 =?us-ascii?Q?7ICFsNYU2SeZ2+q7Bn7gJR1RXcHMXmZIuF4qM40ff9ShvqcvMEIiNZfj9k2U?=
 =?us-ascii?Q?9N/mgxu1bPW71C7c55tySO0xCdZMVmmDyaGPVEweZd+NdElEt0UcEdul1bZK?=
 =?us-ascii?Q?1bipd7aEhfFA/UO422PJwhXX6LSAWbiU2hTy6w8/tl2T+FZgh0v5AyT06345?=
 =?us-ascii?Q?QU+8NLKOocPeRKdBi1X3aW1m4A1TvOzOSC5Bgtz8IN9ocKqSZ6oQ2Gijrn/K?=
 =?us-ascii?Q?/YK1N+5YcgMDT7aw7r61hdVzJSLCEqPCAG4PdHgNekbFRqBpsG3yz5scTlSL?=
 =?us-ascii?Q?RJt7XyGkxpkRVt9wfK9zsjwllVEFqGJF3M/YZxcVlMr9blg9h6hrf4N3Cuby?=
 =?us-ascii?Q?2jJ78kKDd1zxli80U6JwWB0n+yyo4HljKw4F2T+Oaiqvb/aHOnicwt3On2Px?=
 =?us-ascii?Q?E9CX3Id9wWTCBoQ8esj30FOy1X95jPxTzqEZZOZfHa4RmXH84+63UvBaP+E6?=
 =?us-ascii?Q?Z515nLA47El9bw/dpxDMvLk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae47e33-fc38-4bbd-7082-08dce0a2624b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 16:18:42.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUsjMdk8hm4a6b7UX2wOZJTr9w1gKo3fySw+eQyVKzcpyxf4VMPUULsbEw+Uzjjbz9iwc/PcJ/eTdwpbXoO5q9I3sKap1UvLVBVysLmpcHG6wPG3bo7c9wzgbOpCqBq9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
X-Proofpoint-GUID: td-ybZH_pExCTCBgtZ6W15go322uCr5o
X-Proofpoint-ORIG-GUID: td-ybZH_pExCTCBgtZ6W15go322uCr5o
X-Authority-Analysis: v=2.4 cv=efNvfKEH c=1 sm=1 tr=0 ts=66f97de6 cx=c_pps a=2TzYObwzRp/N0knVItohZg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=cJGVk4DxmMTa8DxLuosA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-29_13,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=841 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409290126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 16:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205057

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
84f6bfce2c libio: Attempt wide backup free only for non-legacy code
4e382ce01c debug: Fix read error handling in pcprofiledump
7f5027995f elf: Fix tst-dlopen-tlsreinit1.out test dependency
27a0c6b490 elf: Avoid re-initializing already allocated TLS in dlopen (bug 31717)
e3d5d2d350 elf: Clarify and invert second argument of _dl_allocate_tls_init
28c4f32f71 elf: Support recursive use of dynamic TLS in interposed malloc
5ff30b2f75 nptl: Use <support/check.h> facilities in tst-setuid3
cae418638e posix: Use <support/check.h> facilities in tst-truncate and tst-truncate64
a500b48bd2 ungetc: Fix backup buffer leak on program exit [BZ #27821]
70939528c6 ungetc: Fix uninitialized read when putting into unused streams [BZ #27821]
f0c308ab23 Make tst-ungetc use libsupport
3c5f493d87 stdio-common: Add test for vfscanf with matches longer than INT_MAX [BZ #27650]
98de2f2bae support: Add FAIL test failure helper
e73fd06b7f string: strerror, strsignal cannot use buffer after dlmopen (bug 32026)
37c2aa4eaa Define __libc_initial for the static libc
49953727d1 x86: Fix bug in strchrnul-evex512 [BZ #32078]
81631a0dd1 Adjust check-local-headers test for libaudit 4.0
9fbbe86f7c x32/cet: Support shadow stack during startup for Linux 6.10
eeff407b19 x86-64: Remove sysdeps/x86_64/x32/dl-machine.h
1ab7faf86d support: Add options list terminator to the test driver
6eebc92cb2 manual/stdio: Further clarify putc, putwc, getc, and getwc
afc15c2044 Fix name space violation in fortify wrappers (bug 32052)
5a5eb72d8e resolv: Fix tst-resolv-short-response for older GCC (bug 32042)
7f5ccdd8af Add mremap tests
a8c230c881 mremap: Update manual entry
9f349d02c6 linux: Update the mremap C implementation [BZ #31968]
127ef30c46 Enhanced test coverage for strncmp, wcsncmp
3b25c7fa87 Enhance test coverage for strnlen, wcsnlen
4bdcc1963b manual: make setrlimit() description less ambiguous
b71a51189d manual/stdio: Clarify putc and putwc
946006d37c malloc: add multi-threaded tests for aligned_alloc/calloc/malloc
f11b7178a1 malloc: avoid global locks in tst-aligned_alloc-lib.c
51db012c94 resolv: Track single-request fallback via _res._flags (bug 31476)
8c9fbc6651 resolv: Do not wait for non-existing second DNS response after error (bug 30081)
fc1dc39984 resolv: Allow short error responses to match any query (bug 31890)
cb19cef087 elf: Fix localplt.awk for DT_RELR-enabled builds (BZ 31978)
f6a75fddf4 Fix usage of _STACK_GROWS_DOWN and _STACK_GROWS_UP defines [BZ 31989]

Results before updates as below:

No. of passes                     4581
No. of expected passes            2
No. of expected failures          16
No. of unexpected failures        214
No. of unsupported tests          45

Results after updates as below:

No. of passes                     4605
No. of expected passes            2
No. of expected failures          16
No. of unexpected failures        212
No. of unsupported tests          46

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 955b22bc38..dc162b2946 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
+SRCREV_glibc ?= "84f6bfce2c37e32b9888321fc3131ffbbe6deeba"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


