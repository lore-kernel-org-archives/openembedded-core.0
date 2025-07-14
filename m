Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4C7C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 04:58:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71512.1752469132453812487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 21:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9290ac3eb4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56E4tL4L721533
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:58:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47ufb1snae-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:58:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwNaB1aLbns6z2e6zprE+OH2/8Q75ijFvfn91OfuyCbEBuTbEt2vm2D2UO/LIXlgBBjL/j583vEPyN4LpY/3dnXmjTz+DPnDm/ItQ1qvrtxtz2mHHXvaH2kb+NEdLpDLjXcY2NLIRUpnjBFZNFzyMv8PRv82Rp11iB6gMc9fj+X82pBrNr1aQgvFGIk4u18pt0b6ZxuXakBy2rqXlHwYIheAn3quN1OvMldkzpQDGAMuPpmqLI0Vwv7GyZsRBg9DMSKhjyNuq3AIhw6eXvJlsL+JlKJo6xwFb2GokTf1cg+jXX8D+55tQ6srlCC5+Wpckn/p/t8OG/BzTNPwiHkzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEtLPUyoXgfnGUrOoy5mi1Guc4oQCgBsVfLTyvK2qVg=;
 b=zJLYX73z59mqmG3ADsq9Jy7QnKoDJAaLKGCLm02NGawJekb+tnHKmtkmRXTcCLojGIFBSjQTdpqxRqfQ/eT0gG5Bbogk5iXuvPjGQpZa8JRSC9CaWieRF4QUDjAggTYW/PakWhy9dUWnKckSBDoJyZOFmuXlakAZ6S5SP6cCGxAsG2rkvwl3l45jNXzDYiEatBTtZUp3PFtxLIgi3/o2s7CMiUdDiqa8f1YH9UsExX/Lj94GkxKl0xo1saAQwY1zwF99H1yrMBTscsQZ4WWtFQ1SLstrAJhhCDVlTjQJaUlHEf7RtvKoANOPMTEr1fEkWzXPkjRz/1RJ/WGP0kmQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 04:58:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 04:58:47 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH V3] coreutils: fix CVE-2025-5278
Date: Mon, 14 Jul 2025 12:58:31 +0800
Message-Id: <20250714045831.749210-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0102.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::8) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a63dd64-ee5b-46ab-8c4e-08ddc2931d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V+obdbYf+G415rBBrdzfQwYrc0KgIUwOOHkdqUJDCWhRe5evtLor7xRL0Av9?=
 =?us-ascii?Q?mXoLucU/7tnjvdqCbzoPiQo1wjWJtnA+jRGjGPsHsCGQC4DRR3ybx6O8Og9R?=
 =?us-ascii?Q?V2Qp+h1eqYWopjBiLLJ4wX3Ogel3n4BL+Lu/jrUJ21Y45k/nQfth5BbnsAzA?=
 =?us-ascii?Q?rvhkD8dr2IrSruEwh/A4Z8/DuPBcyv1mlJFh/OWkj+rcCileGG0OwGtgPK77?=
 =?us-ascii?Q?NR5FnPAp+xIsPY82M0Te5ek6oozs0U6uFgETi98rxrKoSL0q56MtOO+0MVJP?=
 =?us-ascii?Q?GIb3lE88SSg5M6rx94ik9Il9bA6oycThq3nE6L417XH7sx+BZchPvAjW0RE9?=
 =?us-ascii?Q?rOD+s88QT9NnLDVn2TBOaZ2bXO6pAM8oppihtm18rRngaYrV61MwEXNHgsNF?=
 =?us-ascii?Q?T5XYb8vHaKLIUtilmOe8CNdhWhmoMUOlV00Bxg5tHzheQDxICZqfLWKBToAt?=
 =?us-ascii?Q?+lcH1Y05DTsX5H0OexdD/FQMkbncaQMjmFmj+AgKd5BdgAuDp0cJ/yyLZNiv?=
 =?us-ascii?Q?jeGCS9gHfFn5gX8oG31Iwr1ahDZnTU6GtHN8fXvvB6JmYZBDjWYN29gzKW5G?=
 =?us-ascii?Q?ttLGk/gss4ta5RNQh2dHl1cL4qi6TmUXP5eZNOsp0auOV4KYLzDC2dvzeFFa?=
 =?us-ascii?Q?rmLzlIw1suCyZiIXXIaPVJFyDxs3CY1UDx53mHkwoIZ8FlmqSHc+ko6ztYX3?=
 =?us-ascii?Q?sdAXwzZ1cJ4S43s9L/oZR5L8pUs9PcYzyYVqgB35lje4ShvKNba5XDB26ji5?=
 =?us-ascii?Q?SkihfEoNwX/LFj7fKFAvlZm9P478q0j/grRgxRzGUXQG2HNZQnV6wj8I7Y4g?=
 =?us-ascii?Q?InV/7Q8aldMEYCPeUvkTA3UcuGNwfavm6New6eH3YvkIMUOd9b3KF1N1hNUc?=
 =?us-ascii?Q?t0GxkGp3eg/sy6DcwIgrmIV4N48wwtJBukjL21eeIy1nUybclBqVJsevI8iy?=
 =?us-ascii?Q?mZNVhVfDiKjNWF8JbDiLl/Rv9T1+Kml0f4nPNqT8gX/ChzrGQsrwJOdfNSmt?=
 =?us-ascii?Q?Zrds7cDQr7GL1AzqnUHe6cn65HlquQVA6U7vtOQCE1GMG5hty6QVYAaDWeP2?=
 =?us-ascii?Q?71+ZW3EhBVeraKydB6qCv+21ZO7z+YaV5uu0JRbmboBxkWBp00ZMCYxsiBl9?=
 =?us-ascii?Q?0Rr4OUA5wdr5ba/HmrddaNrlS/YrOmbSWsZNff/o8zxSPGtZt/ZljnsC88Qv?=
 =?us-ascii?Q?O2BdpQ/+rqDJN3vrkdWlngZ6d3uMC8tFKS7CogILiWLF1fAzzV/VbZ3dTCVb?=
 =?us-ascii?Q?uyaxRWwlGtiePNeiXYILrQgoEF6HkBWxWFOmwT1YnJez0qY6jmEHj9QqzMYD?=
 =?us-ascii?Q?VL6Xc1/Mf5jSYp5cYtarYG0R3wguW04uznTMkMYvdzMj2R8pUu97pqeGFe51?=
 =?us-ascii?Q?NJqgwS9kc0ZsTQsff8VQR9kjLhaQRcfHabftR/vwcar+52P94dyGYmWC7cjN?=
 =?us-ascii?Q?KYGmU6wFaZLvD24KYOQYO5b3xfcaQvZvhE24IPJJuIG8T9KpvxrMYLJr5OOW?=
 =?us-ascii?Q?vl38LqeudL0jTVY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FBWjUGVH8C5T3bp03zC4i/XEBA3xjnEVNkzmpyLFgMfr+a/0BmvjnnAq//og?=
 =?us-ascii?Q?2q9Lt02vAa9V8XtJX70Vtekr8WNONnPIGQRs3i0F1Jy2RRG7yZBgPapEKLsL?=
 =?us-ascii?Q?/cWPqnXaLCOWRHjUbtQU4cSF5I1Wa92wk2ERvCVP8pT1a30NuCXki/5CTGfg?=
 =?us-ascii?Q?XqlK9T59Pbc/znA8xCHxq+zbDwPk9xMsj1Md+b8DBgMtMUwWLTAdv6glavqu?=
 =?us-ascii?Q?wafRAemqX8kilJgP5g4bmwLfl9tmpRkCngkby/VG2MtGRaAiPtjhzxzXtzAE?=
 =?us-ascii?Q?lsacumwtDhsZzvsCtlsCusR/oXsgvbTVy1HsDLam5yc4JyKNWclnDj9rJco6?=
 =?us-ascii?Q?nTCCbotiLuOkjQWQPnt8t0FCLRCmBosip6nbbZls94uxX1Bp9Zs+YDJh+ldN?=
 =?us-ascii?Q?pRm2rBVA0k0U2+rJppEj9CWa2At2GZsiIivgzVtJp/pJOTElHCjrHzVYI0f4?=
 =?us-ascii?Q?M1ZoL96eSSQDm+SCjGWxOWqXZ4UXpXVqPLU9dnqBF0X7fodmkLj9QmF3Mch9?=
 =?us-ascii?Q?VIrK9B8Dh/jNQSL8MJkgGCMS4r+5t94njIbnOJY3Du1jSsCrl8//X8PLSLTa?=
 =?us-ascii?Q?aVTUHbksTzIvmixiH8P3Qr0cLWaPp3ZW4qMUfEYdn6yPVpE79F50U7XjwnqV?=
 =?us-ascii?Q?iN2b2Tlw1GLNFK9LxLuhxvOasm/Z1znQPXFCIV4gf1bbPGDUeO8aDf4psqsR?=
 =?us-ascii?Q?3j0ipeoUe0TQt5tfzuc77R3v4If5U8+Y6BWXJ/WBUtoXcq4g/zcEIPsxGvbJ?=
 =?us-ascii?Q?bcRJzHXsbAGFVb4Nt7dMhW2GojVXwgrKelncvFPtbnQGHjttEhDLEr01pxGF?=
 =?us-ascii?Q?ctxCK+VevPfH/1UWA4kz5bQmmZVurqo+Ur73SGQOVs3WJot8why1Wz7F/VAK?=
 =?us-ascii?Q?xDbDDRMEnWaVX/kO8Vrm5Z21arDyJ2D5Z+MHoPgD0wO2p/Pr1K2qLqw7jz4Q?=
 =?us-ascii?Q?0mZaFVp1VzkW5XsDJbmO8/Du+ENHG/FCqCE3wHPv2v9Y7QgUVSlvzqS0I6mr?=
 =?us-ascii?Q?JaHu5jLA0trNRctlUjQKRWRLCdwwNfxRkEEv/db6ZUYrVu9bSnSkig15X/bE?=
 =?us-ascii?Q?MzSUTGPnC6IdCCMR3wQAKFgVc4s0JgB4iQoRAdIJVcaMdZkLQOHM2RUdMClc?=
 =?us-ascii?Q?g++i6Rrd9okeWF8Ln9zO5A5qcls5EUCvUq3eb7jB2XP3N38u18RUJbj1yp+/?=
 =?us-ascii?Q?Ga+W2PX0351ksTLkjzzGlVLRtNneltudLwSvFbo7yZKQ5ESQaMk4mW9gFaTP?=
 =?us-ascii?Q?X9jyh8CO3JQrkT8kvfREHoRVLA39KmMFn7w/p+KPPF21DcLZ1YObb9rlt8cm?=
 =?us-ascii?Q?TYb+3XIjWRhS/YhbJeLzkZDrXE2C5WvuUL0J1QveaNSlV/DbfQ3Qlmq0759F?=
 =?us-ascii?Q?+4sZYhGuKL8OIh9SI0lXMtgHcJCmKsOQH6ERCmQeFuy//uFGoKOcmfQCAO6I?=
 =?us-ascii?Q?5RcWFRjZORhCQbPcEmLt5CtpDfxPgrQLdiGmMigFXHtmk7Uc6QvRcLePgrU9?=
 =?us-ascii?Q?L4jJ4sup/EvHHxeucDyVhU7nT2/j7uO3LVkt6R+WchK9AvQiaHZq7W35xsri?=
 =?us-ascii?Q?erCdfR+a2hl/rOfDAo/vPkJtfqb/o9xvNiq90tk1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a63dd64-ee5b-46ab-8c4e-08ddc2931d74
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 04:58:47.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgqenzpuU/qQyszLkSp5oSiKnzLbbURD7z/zOPnVF09+4cIj+llDYewYGXJCchSceucCLMOOvTsMettfoqrN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
X-Proofpoint-GUID: jlssxFiElPW3msQMo_XzgE3tmbch2F5T
X-Proofpoint-ORIG-GUID: jlssxFiElPW3msQMo_XzgE3tmbch2F5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAyMSBTYWx0ZWRfXzLWgA7NgAxst
 d1C3LKqRSvCSqqJylDTTzP+aACgUYVDrYSylWPrL+j06wtRh4auAWzshoaZhCgM888impYFVLHC
 vLqlXAIN13npG5nVoJmhneLLXXH85KbxJYvWzsJuUOPBaln1BNju3cIadoqQA5Vy9U//Fmz6HRC
 EbndiLTa1bTu8XvsS4wCtbjIJulZ6mOCooKb4NLYnFS+Z/P7/x3ljaa45X7yhtLV51gwG+WW11e
 tD7t5jcoOonusvwTUyPpvE3BSypk9znSOcjdLHs7Gin3BWNbFT37aXLkL0KrMSk7REARNbrJtDC
 p2+6j8Da4s06jNyi/8pmzmFMh3fnM2swI25+ZgGBLoo70UmAps7rx32wlc0P5nVrUB40wskaRie
 maCbS2LG
X-Authority-Analysis: v=2.4 cv=bOMWIO+Z c=1 sm=1 tr=0 ts=68748e8b cx=c_pps
 a=HWRxpm+59NDbfqu//+EW6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 04:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220212

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.
The patch is adjusted to fit 9.0 version. And the test case is
also adjusted to avoid using valgrind. valgrind in kirkstone is
reporting errors for coreutils' sort utility with/without this patch.
To avoid ptest failure, we disable valgrind explicitly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 113 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..2f262ea0b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
@@ -0,0 +1,113 @@
+From ed9ae6a4a02d322378739a895ae2090ca2bf6cdc Mon Sep 17 00:00:00 2001
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
+[Adjusted for 9.0 version and adjusted test case to not use valgrind.]
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
+index 000000000..dc5b4c964
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
++_POSIX2_VERSION=200809 sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
index 1cce9192ec..7c975708f4 100644
--- a/meta/recipes-core/coreutils/coreutils_9.0.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            file://0001-split-do-not-shrink-hold-buffer.patch \
            "
-- 
2.34.1


