Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82419C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:12:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19575.1748520733931248158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 05:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8244b0285a=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T8wkH1023745
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:12:13 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm500r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzxT1A+CcPn+9fFa1WaMVsnzU8qEqoZT6eD5K/M/pWebFdmWh8CPTlxyW7AIxftAstZEU586+zQRcrGBok4GYACtdqqXFXNR/OeDGbwQVUB3i2eNG3rKP4/xf3cfrommfrN3Waqjba3apv/fjU2j20TuMwXeFo5pZ0Pk+52DPwt4gWH9LHYAGYsbSOuDtQBinFoAm+YIercqdvH1LJcyd8szn0KrXq89O/fuI4YiKzxHQJQlhqK25zTUzK0HxcOkoFCwAsvjz/VnzGKNCTnWZ+Uz1P3pbSxleWb+DIwY8rNzi/XXiOrB67gBjinfFEoaPBf/ZmeGy59eWBd7fWmWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YifRYPVsL969ogSU4FDYgTdkEQr6W+jTmwRF3TaSvu4=;
 b=wWEiozIC9GX6GZDCRWCgVNAGU81y6fq7ltOOf2cdRldb4F+aN2+bbII7Ar6hw1Jpyxwg/glDa0AHUh41aUyvDPysWX1LtntPF+QDp2g5XNJU1FS5lnJVRGpLuoouySDxb5nbIHw2H0zkfcZzgYSKVzJszrVKhIeGCch2Bna+QGZpku8koWJINDWLria6LbeucN8tPqa45CHis2cn98hE03ev7S6aPGXoEu53Vu/fvOlflKmfDqa+03KVtd87/neYvcaO5f87eNkj4yiNUckOUA7YZaF7c3Gl51XLN1hMQK+On5qUE35rcErbxufI48mKapOkqjopXI8qz65Lgn/ynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 12:12:09 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 12:12:09 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] binutils: fix CVE-2025-1180
Date: Thu, 29 May 2025 05:12:02 -0700
Message-ID: <20250529121202.1353278-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 4856dd28-e842-4f59-273a-08dd9eaa08e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RC3Pz8SvZ+y6zeuGZLort1hcyHpGYsv2crJQlImDL4gUyjQCtmZ9PGcQvqSM?=
 =?us-ascii?Q?l949kmRx8rHiubCOqOg4UbfI+dvfEhcj207N82l7VuOSINs2IVP6sJCG/AFU?=
 =?us-ascii?Q?vbXi9X4PLomcV/KQvDpo5EzpIK4Wf60A8MYFya4HLQ1na6nNRDm+nJ5WUUG7?=
 =?us-ascii?Q?+tLfG0hjZtPaTc/vOTa0nlN19DdKxTZyLT7eXTsq1OlabiMl3Q15VvpQu9ex?=
 =?us-ascii?Q?5EzZcNf75TvboYzhp18RXloCZuy8Qd1b/65tUG+V1BbHRLkjIePPrHJo+DAj?=
 =?us-ascii?Q?E+46//Rj9V3IlMCQqv/TJEtwG/bWxmAdhhmAfD5BssBoaIaiZxGDaj9MHf16?=
 =?us-ascii?Q?CZc4TZW9DgCJNLyO5xQZU5REbYClaHD6TOTgsXmaBhO/cP9CdCk/R8xITCes?=
 =?us-ascii?Q?EWASLjiVm2Mf7d8eeRY4SbtP+u3JREtSXBScnPogslv4VmCsJL0XvhsHy47p?=
 =?us-ascii?Q?U2EGF+7ZD65eQjexpmprT5DabGbk/9szwZ+DlyM8GUUpd8M8kVkqk0SuPJXX?=
 =?us-ascii?Q?ftlR1nr4Nw5452k7tIlD8jTuLUW3wRT6zHGncbNUot9yDiyfPjjhqfOSLh5B?=
 =?us-ascii?Q?DabI0R613Ghmab5rb+SrMExngT/oKgXBZ6WscqVhm3FQ7olai2QSE21KC2ww?=
 =?us-ascii?Q?2W/2W5doM29irdJD9UcH9GcAXqf04bV1uhoR7cZNbK4MZ3XLvUtIO2OHtIFT?=
 =?us-ascii?Q?Mm+OKorJTAdUTW2mOHOrd/GaTNZBNH1xtWZkkIh7zP5GYopXS8mrwwIah2KS?=
 =?us-ascii?Q?bEiJrONIsr8gREm+9wK9masgCsNkEUaZj/t709vsCg33r/gYM8qT8rC1xA+i?=
 =?us-ascii?Q?NGaADLBduB5fgEySgBHy/KHIzPZRJvmzsXWMYGy/K0lp5KwEBNp5QHoDidlG?=
 =?us-ascii?Q?3VuZObtzzbHzwIb/Pq3fHPohytVi/w/OcuKtuA4eV5Yb/vkBejMfDNzaNfhZ?=
 =?us-ascii?Q?5WhisvTv5hNb/hrHoqzS6UKr32v+fKy8EZfN42oYagL/17YIsM+kdGKvNWiU?=
 =?us-ascii?Q?jtbWqlpMPqLMmuhUjpXTTl0rP0VIfWuAi/Ad31fZXEVZkZ5xLhZ8r9hFD0A0?=
 =?us-ascii?Q?KBHQCOaVZ44WekAbqJQmiuZVgpfzIuFtwmWhyqylm32jnzBfHedb5x5B05fY?=
 =?us-ascii?Q?ytAubZoCyyGQVY93isKhMx6gZ9W0v7RBuNMVCgzWsX2TGWSOzIfs+L7630Fw?=
 =?us-ascii?Q?rT/bpu1mI0T2lDnPCsM0MEGbu4KoPeBU4+HwH8hYmWKx+V8vQRjej4R3vRr7?=
 =?us-ascii?Q?7CXqLxslwN0rcdrXTsMUQPxpiKjMBZhLvakMV22g48tK7qu2D7h8AES0gkvf?=
 =?us-ascii?Q?j0u1LQeO68YqyT4V7R/QJmn+zjux/DkapfOvBcbIPm7dk9efpMLHvLvPCVTY?=
 =?us-ascii?Q?PYDojRawl9ZO0S2WveJvG86Av2FUauRQV1lYyzFIgprmyXFiAJjKHvT6/1ne?=
 =?us-ascii?Q?ht0cx6xFOXxcfly3sJIgqWNvpBUQaoz1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bPWXvAwaiIXi9nr4fraN2KVNilYnc7mCDYNwHebdWe6RWFUEdD8BICzAPvNU?=
 =?us-ascii?Q?0VjyxAknsASD83VZBcjwPAqAyk5by3ZVyt49gCs4EKVFynfhbW4aWLJ1N2gU?=
 =?us-ascii?Q?kXwEBKQQrvJPyHyvYhKKy83ErTPdCed0QwwXmxslo+hBZJQAwc4ZRlapw40C?=
 =?us-ascii?Q?e2f6JwnjIkwq0fkNsvRteKLz8RgViMndjUBFwgQCf40Aihx0d6oWePZZgtWA?=
 =?us-ascii?Q?l3Qe+f2jRAZ3CpLG7fdFf7sRhJmHAIgXjcnKZ/Uv/+tyMBPDYKyw9re6gDpl?=
 =?us-ascii?Q?COGASTJ2Ef8izjAzbsx6XyZN2BIh0y/UONDEHghUxGWVzc1NtPHvW0hWLMJI?=
 =?us-ascii?Q?1ThjeUkzuloh3cZnd4nBb8qBtPQE92C7Q2P7+21EMvc5A9Ur6VlNINqZW4ER?=
 =?us-ascii?Q?rTQKK9PpF7vBW1Md355/tRhAf8UXYCWlimV93WSt9fD0XO+pMEH2yrrnJfm2?=
 =?us-ascii?Q?JPhj7b/ATqJBFd7L8vIdb1keaWMTet0rDdHgrwhfMlh9gFKiIxJZ57AAfPMv?=
 =?us-ascii?Q?xSDKgW6H9V9wrAAHpVbMHw30LF0G277AV/ZVYm4aHzFoDGkrjbJgbJM2sdO1?=
 =?us-ascii?Q?MMnDlanrr5mI6sCMlmOcoNPitryjPGROH3bFSx284YKbG54V8TiKOOs5WTob?=
 =?us-ascii?Q?YL20SE/APqYEyqTVSK8ZoRkbw8TW6BoywJ6ynmKFKddOKsDFK/77UTjiKiJw?=
 =?us-ascii?Q?TTVX7LmJsK/kR03cSW6WvjagQ1fZmYHpmD1vgQ4UFUT4Zs5EA3vow/6tilwH?=
 =?us-ascii?Q?gWFWw2h9LDs6ooGVEQzUzYguiUFdsXrUc7a8TFYPHHy5dpvv1WNxhwlOwSjv?=
 =?us-ascii?Q?XStptpQzPBjRU0Vy6x5Ggtlysb6QEBWZNGTXZpFBZRagmv+NgwPNMOAVBZzW?=
 =?us-ascii?Q?xiTaSch+YXiLCCeFqbY3+iy3cPdu68xDlCFeyuAyFOEoqMae+PPGQui5jok7?=
 =?us-ascii?Q?GMtnckSU7L5A2S1urCloTSUCj9chY3SFn9XFILiFeNcOaTg3S+uv2027bIQt?=
 =?us-ascii?Q?kKNcTpX6TX4NeV4HvczRNDtR2FkR1PVI0aOX0HWVvHn+nDg9fUFIi6MZOfIB?=
 =?us-ascii?Q?+LakOAuGoBjLxbdqAxv1FJshpCk+Osfj2WvM+4IJtcnbh9G678LTY54jEwEH?=
 =?us-ascii?Q?TjXQ3eXwRfbBhjapzXgWs4JaT6v8tzGFc89GPqtYaf2Szg97es4Pq6wTx8a2?=
 =?us-ascii?Q?nSVjVdt9kxWuc8PMA8nXqjy1j1xjH0QBRxyqBKVOugvBYX/TWUgC0lMFM6f1?=
 =?us-ascii?Q?nOo6RG95WcCr1tjjtSDbPi/ViuerhscZHlp4A1s2Bvd+cfl2A16UYuGONqxw?=
 =?us-ascii?Q?3FFLm1u0ARHbFaB50CW9bv4Q2seXeWZ1ZN6qDazK+Bg6I/aamQrMrshSNa7n?=
 =?us-ascii?Q?CFIlX+CzYeEzEqOJrROZTOxWgYN4rB/jdfsfIgwOIuuk1alaBzV3AlZy956q?=
 =?us-ascii?Q?SpVo8zX69gL9ci0coChKJCoAR5wb4y1PKU9x7k1bxYdO/gLixM3MmCm+LeMJ?=
 =?us-ascii?Q?bXROW/Htq2QGrG63aDbvokSlLiEceMtJGor6/x2YQ2/DUntMMMI+0myZNx1I?=
 =?us-ascii?Q?F2623YRH6FB0uDHbAyCHwZQKoJ5L2xNqs0BO9rVYLS58w27PVQNmjtLEnSNK?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4856dd28-e842-4f59-273a-08dd9eaa08e7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 12:12:08.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHRpau19og+sYdb3ndKTVmJMyKxzAEDV3iIBE0FkFrWW+CK+B0Y04qBGunTVlH2A6+GTUz4fXZ95oPdAXSCf4kN9G5ALFX7qEQJmrOSAH+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7711
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=68384f1d cx=c_pps a=03yO52JTp2ka5dcFpzYbVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=F8gY4NZ48hAu-LymO1AA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDExOCBTYWx0ZWRfX+fYr2hmc+wNF 9ulyGDe/huG5+tAJSs7Ml75pIJt2TpYMNbkUuoTgk0VgLgzoHzmimjdHoMKLHD7IaRvBHxP4iw5 h8rHtgmolGPD7mM5fUBxgISWFzKD++ohv0u+vNpBzGcJXty8nQqMXhc/92zrqC7zF49axHXp8gJ
 FWaVPSMM8Vu+r6KlItv5YGUPorvp1LiTxFCi+9TAQKbbhqT0WLFOIBn2uOXXzFaN+HCJ3z3jjRX NdT3OQwC0PIfrZ+fbtRJ5sneW7Vo6AM0FPcBv0f+lC2wdts15weTS1C1wpQvoLhp1C72XBm6wQi JGpCXC/1twH+tbGLp87YN8F1UfsM5Ry9SPU8wrTN4nied0150mcxZ4TOp6n8G46ILFuL4JWqlCT
 O2ywxPUkkpshfv4olhBFaGWNgmR+QjKp6MazjQwAm52gFVD4BLVVAlR85sJpWHmwfBn3+5xg
X-Proofpoint-ORIG-GUID: SAsDqDzCPGVvh3gh-N_foosVicR9_qOM
X-Proofpoint-GUID: SAsDqDzCPGVvh3gh-N_foosVicR9_qOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_06,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 12:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217410

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
 --gc-sections --gc-keep-exported option)

https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
PR32642 which will get fixed with commit from PR 32636.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]
CVE: CVE-2025-1180

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0040-CVE-2025-1180.patch         | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 82dd5c9eb6..01fd03d2f4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -74,5 +74,6 @@ SRC_URI = "\
      file://0037-CVE-2024-53589.patch \
      file://0038-CVE-2025-0840.patch \
      file://0039-CVE-2025-1178.patch \
+     file://0040-CVE-2025-1180.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch
new file mode 100644
index 0000000000..a422f9d1ae
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1180.patch
@@ -0,0 +1,164 @@
+From 82670cebd1fcecfc16c075c1bd9ec404e3f9af41 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 29 May 2025 02:41:27 -0700
+Subject: [PATCH] Prevent illegal memory access when indexing into the 
+ sym_hashes array of the elf bfd cookie structure.
+
+PR 32636
+
+(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814]
+CVE: CVE-2025-1180
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 90 ++++++++++++++++++++++++++-------------------------
+ 1 file changed, 46 insertions(+), 44 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index f8521426cad..4c21a0229e7 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -62,15 +62,16 @@ struct elf_find_verdep_info
+ static bool _bfd_elf_fix_symbol_flags
+   (struct elf_link_hash_entry *, struct elf_info_failed *);
+ 
+-asection *
+-_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+-			     unsigned long r_symndx,
+-			     bool discard)
++static struct elf_link_hash_entry *
++get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  struct elf_link_hash_entry *h = NULL;
++
++  if ((r_symndx >= cookie->locsymcount
++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      && r_symndx >= cookie->extsymoff)
+     {
+-      struct elf_link_hash_entry *h;
+ 
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
+@@ -78,6 +79,22 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+ 
++    }
++
++  return h;
++}
++ 
++asection *
++_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
++			     unsigned long r_symndx,
++			     bool discard)
++{
++  struct elf_link_hash_entry *h;
++
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
++    {
+       if ((h->root.type == bfd_link_hash_defined
+ 	   || h->root.type == bfd_link_hash_defweak)
+ 	   && discarded_section (h->root.u.def.section))
+@@ -85,21 +102,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+       else
+ 	return NULL;
+     }
+-  else
+-    {
+-      /* It's not a relocation against a global symbol,
+-	 but it could be a relocation against a local
+-	 symbol for a discarded section.  */
+-      asection *isec;
+-      Elf_Internal_Sym *isym;
+ 
+-      /* Need to: get the symbol; get the section.  */
+-      isym = &cookie->locsyms[r_symndx];
+-      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
+-      if (isec != NULL
+-	  && discard ? discarded_section (isec) : 1)
+-	return isec;
+-     }
++  /* It's not a relocation against a global symbol,
++     but it could be a relocation against a local
++     symbol for a discarded section.  */
++  asection *isec;
++  Elf_Internal_Sym *isym;
++
++  /* Need to: get the symbol; get the section.  */
++  isym = &cookie->locsyms[r_symndx];
++  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
++  if (isec != NULL
++      && discard ? discarded_section (isec) : 1)
++    return isec;
++
+   return NULL;
+ }
+ 
+@@ -13642,22 +13658,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
+     {
+       bool was_marked;
+ 
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+-      if (h == NULL)
+-	{
+-	  info->callbacks->einfo (_("%F%P: corrupt input: %pB\n"),
+-				  sec->owner);
+-	  return NULL;
+-	}
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+       was_marked = h->mark;
+       h->mark = 1;
+       /* Keep all aliases of the symbol too.  If an object symbol
+@@ -14703,17 +14709,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+       if (r_symndx == STN_UNDEF)
+ 	return true;
+ 
+-      if (r_symndx >= rcookie->locsymcount
+-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-	{
+-	  struct elf_link_hash_entry *h;
+-
+-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
+-
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++      struct elf_link_hash_entry *h;
+ 
++      h = get_ext_sym_hash (rcookie, r_symndx);
++      
++      if (h != NULL)
++	{
+ 	  if ((h->root.type == bfd_link_hash_defined
+ 	       || h->root.type == bfd_link_hash_defweak)
+ 	      && (h->root.u.def.section->owner != rcookie->abfd
+@@ -14737,6 +14738,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 		  || discarded_section (isec)))
+ 	    return true;
+ 	}
++
+       return false;
+     }
+   return false;
+-- 
+2.49.0
+
-- 
2.49.0


