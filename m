Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740F3D58E69
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:50:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154702.1772434202200197173
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=byCEE/PM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224IM7Y1205175
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 06:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8lpxhhWIGfIsZtLxv/F3KFGNoYLqbZ3faNipyUHc2Rw=; b=
	byCEE/PMNiIV5h7OMCjcHNUufCcGaNuzHUtQkHtXXTxffPu9pw/9USfHe7HpMGbp
	8DFbbQHKzuiAPe/lIlJXbUPG8+UHpVFHBI7euuiPHhhyIy3hZaRG0J57ly5/Sh+q
	u/9Idlxw00m8TjfjKZhzY4u9gTu6+52gvRpIRC1gpt3hQEVRUU0DYLifOt1HDjxS
	vYX+riGl4oXZLYTk1+jKlXiRI2qN7fV++KttrQj7XSwafuo6+kxxnsBkwkcRIvRD
	2MTLrLZ9CvsxaC80j3JsINXdhADbVv9XaPhJiZElYH78om0laLYERi/iw8crSZIj
	HIyIMZgXYN7LFnbYHALK4g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvj2jp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNf9YFbKOv/EsMk9scqLKFQgemb1Ioy6SIP1RTAx861biM7YnbvRy3g9z0PYEkqu6M4q2bTrP0Wt0d9DGxRQrzsUWLWjJIA4sLGfMTGjKMytzeBWutYwMyWB7N9eubzQbmDom6Wuk6xRAQ909FodhP1U+5g4/tUiQ6Fr6cY5KUKHGIkslp0ofbgbixJXJ/PBURxlc2+rgSjY+EfGS5GgdShpPXPlQ6Elj/Ex9ancVHtxytagsFXfXBYY2Gacx2lZUV2Sw/essPsOemw/ukfiVJ4ZWm/7BiU9L2RcXp9ieQbTq/Zji6b/qGL7xOHSVtTKSTtPc3SvognboP6DUiNxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lpxhhWIGfIsZtLxv/F3KFGNoYLqbZ3faNipyUHc2Rw=;
 b=DLMSS3zKdRggZh8Ueo/95gmpaglEMiFCeCdcTCbml2poLQUmAyWNc56vN16YWdpy4k+dTMoytibOshWYS/DnqaBgeSJeQhc6LMVLrIX+zGeWc8WqF0Zb1IMdi3peRudjQ4LZgyTHGzHNMnG8AUJU1ZJdRjq5ajrdPIj4/YJt2mRlG1qDZNHoQemogwzoRn9Gg4lBtVHdcw6bqlXj9FibKLQz2hNcL3SaYw3LLQ/Njbjke1Mh40mx25rRpTQlXpXidukw/TyuGrFJTxin+LT/CUKWaatyXsv06+/Kl9uUPO5K/vZrbvEIuzZnUeJH/JvWm6+g7bw8AtEC8PdKHWlZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 06:49:59 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:49:59 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/4 V2] oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
Date: Sun,  1 Mar 2026 22:49:37 -0800
Message-ID: <20260302064938.2052450-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: d697c6b0-5095-4892-a49f-08de7827ec1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Af2hsf9NEmZNlUORff7ChEhFQCmPm2Ls63K+xbtcHCAdSNOxnheC+fXfSQQaR0tkOcYyVX3wWgPAK4f/NkFVtorawQef+SB5r6wtifCAVlS+A+jY5cxvrm53LncuympQOqHEthBzyw2C65tg29P1C4qij2mESu0fHy7rbucQ87sO2H+vx+AEMunK5HZ8fO4WKvJS2Urqb8wsp5wsBiJn1qR+Zbn5mJ28vG+ZIucIWn2vYlh3hTlRzTQyty1sR7XQGIrYSCMZs1DKOiupQ6KohEGltdsyk+iP+H7blMUhMSpBVY2twrqrmGLiLVY3aj4ajVjSIO6T18pcMRATC+wavlHktp0tD23SnzdAVGpJVH14oQUc/kxvLg1sVzGYl1SeRYAOSFdul4PmGSuoy5fLM95/KvDB0bjlB5iwERSWYv8+twP+h3Ol/R9CsYeYRWXSkn8HxbqtZuIdXa27lm9M+NwSLK+wUdM9R7uOqBhxhx0f8hkiOY5gPh1a6S8lhigEeXo297DhlcgrrNkhWw79c3+oiuKPmmoTox5Trs4dHwT1lkX14KmOgJ0w9skT99PE+HPs9txXOhncGtUbZXmhLtyqy2hTSMCiEJ6biPKuwWeIvUgxCTAtjbc/VhCGlVAxifAAISuZKMKaR8dLrIvMRa/1It/BvMTRVReHVSNv9emeKAVhQPMpSbMjloRMNvM5nyK7kGo2VELeLeYmPUbB+uiN0z4Xh/xKVYx0c+nfQxFAWNjve/70ziVGV8ZTD3gbomvjnC4X3qzi0jvuSKrELIJUyrxTsCeWO1aanB0tfho=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8sixI9UFSp8qECDDj7cn43/QifQlfJuHUL4JoZNt1ccFF8ejF+9gVP5F7Kl7?=
 =?us-ascii?Q?165bIApoWqe5lmkhIBTLLCcfFQz99ruGV9UZwsCP9iCrGEpeB1BxJi6ImQ9J?=
 =?us-ascii?Q?Pt9MSGAMKlj0PDH2MmWM9RvLRDPj3hWS9NPu0/64hXh+jK7KmZEhYL46rfsd?=
 =?us-ascii?Q?hDJqZ3TcEJLlWl8aEEmB5/dzKFbS1r3aSjuGAYSwB5Yr3Zd3jcj1Wv31HkFW?=
 =?us-ascii?Q?ZZh5tEYbY+U9FWFZupSlTLCvU5+ASqFCRuxMgz6LE29f3PaquaTI+mUIRPho?=
 =?us-ascii?Q?9qVhERndP8fbuPEMBfn0rNHEWMfQk/pfYfcKkCshsubEIAKvzVEp0AkBbbkT?=
 =?us-ascii?Q?4XDiJ9XML01a18hm1zbEUWI/XO8QHOdZ2uq0SvbniEiY9a7gdrOFyX3c8t4w?=
 =?us-ascii?Q?Ulh2QbGzn1EtWCP3wV6iOnPenTs0jNCRxhkr/nkRgRZWrDYJhSe9MKIvK9kA?=
 =?us-ascii?Q?EH7iI1IVYj2DPTIgASZjKX25SzghRF0h9IdYID4wuoBBmew4NsS0Y8rdHFGy?=
 =?us-ascii?Q?Z3x0nxy9oq5XncRKDcnuxLdM4VN0UQMLR7qiRHVI5H9zjgPCRtp8nCrm6alH?=
 =?us-ascii?Q?jBHAFilFJui6DR3Ug/YtFKt6RnGeWQIwpERX2ZfpurAm3BdQ+ukmdbSMlRtq?=
 =?us-ascii?Q?7P7vlCj9wztuLnHZmEB27PIaqQGW6khZRoePRvQ0UazxGH2kj5KVAgcYNAfg?=
 =?us-ascii?Q?sPdWM+WX53VUbhp9BLs0G/B5u22mTnnfhRCZEUwNdlLUTwUC/XYJ4DRwt1N5?=
 =?us-ascii?Q?V7O8gYEszjNLwmPic/KqOKEzn7YQR/5SYA5hc7aT1RXqgEqln/60t4AT3K15?=
 =?us-ascii?Q?JuI0gCmNJ3CPDSi5tLCe3xSazOTmd1B5ftFSegyGC+e3veCURpCKW1HjTkaA?=
 =?us-ascii?Q?byPWbCi2c/VoeIT/52IO70rVwB33xvr6ZMRBx/Ak6zLWsWChyob6IVhGHFkq?=
 =?us-ascii?Q?W5tKX5pCjUz8Ucxofb7MAaczjt3/2xHPyCFDA8OingWjuuB3xSQxKxLyhgC2?=
 =?us-ascii?Q?Xr7nde5FELcHpeMcd8GbPyD1nT7rTiLINoGIxSGXcZTBE7NFLNRTMpaK84YK?=
 =?us-ascii?Q?aI4ZRjSJwKHsjqXKPEN6/25QPXB2IYgjG3cMWlwh4kbgpdVWO5/4/AM/vG6B?=
 =?us-ascii?Q?IW/VW/E+lPHw9utephRh4qiC8fUxgx3mKaBtm7NZdz1x5TaEvAORR/oogsKY?=
 =?us-ascii?Q?qtQrjFHuJnJNZnxyZZk4UUF3GgzDNM0TIdmh7b11OnAnVECps6vCdyx6ZcX/?=
 =?us-ascii?Q?9WRTZMKIph9MbiZiDEISOE5LdQ+H2FlRZl6bwszvcnF5LxRLkZE6I28KD8A7?=
 =?us-ascii?Q?bBGR+oHiaQicwkN2Y01j2QWltM1CQZOoS91kLoSsU9jugMgSR2n5axAbS/kI?=
 =?us-ascii?Q?CjdQNycN1XhP2XMCmTubPZiTRL+Y8q5UKdG/R85OjaIcKp98twKMRY+K2MS8?=
 =?us-ascii?Q?HrY8Q1/sxKa6im2OIOZ7nNzdLgmW2pv+2XpiO0Wa6eftCZAvH8nRCfVDZUIr?=
 =?us-ascii?Q?xLeuXzBuRLZFPiZqbQxMGONzpw/uaNTP5Dj2GTzQDmwod4UBB+8Nr1Pz5zeU?=
 =?us-ascii?Q?URZpzZUSqNAppk3DH2UFuGIxjzEAYtNbjkMWjz8gvXQZNN0qb6jMrtGQvZns?=
 =?us-ascii?Q?i8d0xmxcWsI8FRGLIVFX0iSIQ2nChI5wqRdnEjo/+qbRbrb96/4dO6uonO2W?=
 =?us-ascii?Q?Wxs2OTTZtdGKZ83VT/pljlq7/CQqfnKBCUUflGFH7pOZcM4N491Bq5MxYz6o?=
 =?us-ascii?Q?Z7jOs2E00UYro9Yv8gOtQteAhxQ/6pttewFiAVxOvrgdQPR6N6x8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d697c6b0-5095-4892-a49f-08de7827ec1e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:49:59.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWdKQQnlzNDqjUPOVxpmFjSNup/u1IlAkUHmXTEvsKsZLBikZhtcYe+yU0DtZodgOva+u3wIO0K0pK4IfhUcFiw+LkJ6hLeqIUoVHk4+eg/iURqEepyjzv+iwZ6ZJB2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Proofpoint-GUID: gL0JLDgU2tUci2xrS73wc9GcGaOPL9lD
X-Proofpoint-ORIG-GUID: gL0JLDgU2tUci2xrS73wc9GcGaOPL9lD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1OCBTYWx0ZWRfX4FO/chddpHMb
 fHjcSRmmebw5b398i8XSPMw57MBUHMpkj9KV1phLcnFbymUSGbkYFYCG14qbdbFNhdKDwtUYkAH
 FK/tgGCPUwV9t/8smn1m6sOYSb0QCVanR/CC9NX2evShj+34C+FKlgY35z6GyCBdTZ9ZkjlZazu
 RfeBoSilUWi509ISbzEwnbDVR5QJM7VuWjY9ocnfBw1+AjnQmXNe/5z5xN//fm9MspccNJQ6UCJ
 /Ek6d8Fn6mXDNnxHGwy9YraALsUmpZVy4N0IYihGsqoMlbT7ng2xVdmEd/p2DYwhChpu7pQ4dzh
 fCP1zZKRyY4XVZzLryigQJh/5881os1VGLZKrqxkOfJRjxAQZfCkBjli9QExBlXR+Hgut/PAPh8
 kHOgip+igbDTPoijNBF+vH0p6ifBkaKZnzR6tKlJ8k+sV1oyKnIhPrk+sGTs9LkP9oE8UHy5JzB
 8LdzAdMT5BLdjI51N/A==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a53319 cx=c_pps
 a=hksmzbl9AP/Wdhn7pSFcZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=SQQGA60Wx8lJcxWaSqYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232176

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Introduce selftests to validate LLVM, Clang, and LLD test
suites using llvm-lit for target builds.

The tests cover:
    - Target tests execution under QEMU via NFS using llvm-lit
    - Architecture and OS-specific test filtering
    - Known failing test exclusions
    - LLVM testing is skipped for x86

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 299 ++++++++++++++++++++++++++
 1 file changed, 299 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
new file mode 100644
index 0000000000..4a3ed25f1b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,299 @@
+#
+# Copyright (c) 2026 by Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+import time
+import contextlib
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfArch
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+from oeqa.utils.nfs import unfs_server
+
+class ClangFamilyBase(OESelftestTestCase):
+
+    ALL_ARCHS = [
+        "aarch64", "arm", "i386", "x86_64", "x86",
+        "mips", "riscv", "riscv64", "ppc", "ppc64",
+        "hexagon", "sparc", "sparcv9", "msp430",
+        "loongarch"
+    ]
+
+    EXCLUDE_OS = [
+        "Mac", "macho", "Darwin", "OSX", "wasm",
+        "Windows", "Win", "MinGW", "COFF", "zos",
+        "FreeBSD", "aix", "fuchsia", "ve"
+    ]
+
+    DEFAULT_PACKAGES = [
+        "libgcc",
+        "libstdc++",
+        "llvm",
+        "python3",
+        "python3-core",
+        "python3-modules",
+        "nfs-utils",
+    ]
+
+    def setUp(self):
+        super().setUp()
+        self.target_arch = get_bb_var("TARGET_ARCH")
+        self.tmpdir = get_bb_var("TMPDIR")
+        arches = [a for a in self.ALL_ARCHS if a != self.target_arch]
+        self.filter_out = "|".join(arches + self.EXCLUDE_OS)
+        self.write_config('CLANG_ENABLE_TESTSUITE = "1"')
+
+    def build_core_image(self):
+        features = [
+            'IMAGE_FEATURES += "ssh-server-openssh"',
+            'CORE_IMAGE_EXTRA_INSTALL += "{}"'.format(" ".join(self.DEFAULT_PACKAGES))
+        ]
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+    def start_qemu_nfs(self):
+        ctx = contextlib.ExitStack()
+        s = ctx.__enter__()
+        nfsport, mountport = s.enter_context(unfs_server(self.tmpdir, udp=False))
+        qemu = s.enter_context(
+            runqemu("core-image-minimal", runqemuparams="nographic", qemuparams="-m 3072")
+        )
+
+        status, _ = qemu.run("uname")
+        if status != 0:
+            raise AssertionError("QEMU SSH check failed")
+
+        status, _ = qemu.run(f"mkdir -p {self.tmpdir}")
+        if status != 0:
+            raise AssertionError("Failed to create TMPDIR on target")
+
+        mountcmd = (
+            f"mount -o noac,nfsvers=3,port={nfsport},mountport={mountport} "
+            f"\"{qemu.server_ip}:{self.tmpdir}\" \"{self.tmpdir}\""
+        )
+        status, output = qemu.run(mountcmd)
+        if status != 0:
+            raise AssertionError(f"NFS mount failed: {output}")
+        return ctx, qemu
+
+    def run_llvm_lit(self, recipe, extra_filter=None, timeout=None):
+        build_dir = get_bb_var("B", recipe)
+        workdir = get_bb_var("WORKDIR", recipe)
+        lit_bin = f"{build_dir}/bin/llvm-lit"
+        test_dir = f"{build_dir}/test"
+        guest_result = f"/tmp/{recipe}-target-results.json"
+        host_result = f"{workdir}/{recipe}-target-results.log"
+
+        filter_regex = self.filter_out
+        if extra_filter:
+            filter_regex += "|" + "|".join(extra_filter)
+
+        cmd = (
+             f"cd {build_dir}/bin && "
+             f"python3 ./llvm-lit --filter-out '{filter_regex}' ../test -o {guest_result}"
+        )
+
+        return cmd, guest_result, host_result
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLVMSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLVM_EXTRA_EXCLUDE = [
+        "BugPoint/compile-custom\\.ll$",
+        "BugPoint/replace-funcs-with-null\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice-absolute-md\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice\\.ll$",
+        "CodeGen/Generic/fp128-math-libcalls\\.ll$",
+        "CodeGen/Thumb/2009-08-20-ISelBug\\.ll$",
+        "CodeGen/Thumb/2010-07-15-debugOrdering\\.ll$",
+        "CodeGen/Thumb/2014-06-10-thumb1-ldst-opt-bug\\.ll$",
+        "CodeGen/Thumb/PR17309\\.ll$",
+        "CodeGen/Thumb/dyn-stackalloc\\.ll$",
+        "CodeGen/Thumb/frame-access\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/smul_fix\\.ll$",
+        "CodeGen/Thumb/stack-guard-xo\\.ll$",
+        "CodeGen/Thumb/stm-deprecated\\.ll$",
+        "CodeGen/Thumb/stm-merge\\.ll$",
+        "CodeGen/Thumb/thumb-ldm\\.ll$",
+        "CodeGen/Thumb/ucmp\\.ll$",
+        "CodeGen/Thumb/vargs\\.ll$",
+        "CodeGen/Thumb2/2009-08-21-PostRAKill4\\.ll$",
+        "CodeGen/Thumb2/2009-09-01-PostRAProlog\\.ll$",
+        "CodeGen/Thumb2/constant-islands\\.ll$",
+        "CodeGen/Thumb2/ldr-str-imm12\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-1\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-2\\.ll$",
+        "CodeGen/Thumb2/thumb2-ldm\\.ll$",
+        "ExecutionEngine/MCJIT/.*",
+        "Other/spirv-sim/.*",
+        "Transforms/LoopLoadElim/.*",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
+        "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
+        "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-segment-layout\\.test$",
+        "tools/llvm-objcopy/ELF/check-addr-offset-align-binary\\.test$",
+        "tools/llvm-objcopy/ELF/dump-section\\.test$",
+        "tools/llvm-objcopy/ELF/gap-fill\\.test$",
+        "tools/llvm-objcopy/ELF/pad-to\\.test$",
+        "tools/llvm-objcopy/ELF/parent-loop-check\\.test$",
+        "tools/llvm-objcopy/ELF/strip-all-gnu\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-keep\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections\\.test$",
+        "tools/llvm-objcopy/ELF/update-section\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
+        "tools/opt-viewer/.*",
+        "tools/UpdateTestChecks/.*",
+        "tools/yaml2obj/ELF/custom-fill\\.yaml$",
+        "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
+        "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-end\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
+    ]
+
+    #Fixme LLVM module testing is broken for x86
+    @skipIfArch(['i686'])
+    def test_llvm(self):
+        bitbake("llvm -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "llvm", extra_filter=self.LLVM_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=7200)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLVM: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLVM lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class ClangSelfTestSystemEmulated(ClangFamilyBase):
+
+    CLANG_EXTRA_EXCLUDE = [
+        "APINotes/yaml-roundtrip-2\\.test$",
+        "APINotes/yaml-roundtrip\\.test$",
+        "AST/ByteCode/builtin-bit-cast-long-double\\.cpp$",
+        "AST/ByteCode/builtin-bit-cast\\.cpp$",
+        "AST/ByteCode/builtin-functions\\.cpp$",
+        "AST/ByteCode/c\\.c$",
+        "AST/ByteCode/codegen\\.cpp$",
+        "AST/ByteCode/complex\\.c$",
+        "AST/ByteCode/complex\\.cpp$",
+        "AST/ByteCode/const-fpfeatures\\.cpp$",
+        "AST/ByteCode/constexpr\\.c$",
+        "AST/ByteCode/fixed-point\\.cpp$",
+        "AST/ByteCode/floats\\.cpp$",
+        "AST/ByteCode/functions\\.cpp$",
+        "AST/ByteCode/intap\\.cpp$",
+        "AST/ByteCode/invalid\\.cpp$",
+        "AST/ByteCode/lambda\\.cpp$",
+        "AST/ByteCode/literals\\.cpp$",
+        "AST/ByteCode/placement-new\\.cpp$",
+        "AST/ByteCode/records\\.cpp$",
+        "AST/ByteCode/spaceship\\.cpp$",
+        "AST/ByteCode/unions\\.cpp$",
+        "Analysis/dead-stores\\.c$",
+        "Analysis/exploded-graph-rewriter/.*",
+        "Analysis/scan-build/cxx-name\\.test$",
+        "Analysis/scan-build/deduplication\\.test$",
+        "Analysis/scan-build/exclude_directories\\.test$",
+        "Analysis/scan-build/help\\.test$",
+        "Analysis/scan-build/html_output\\.test$",
+        "Analysis/scan-build/plist_html_output\\.test$",
+        "Analysis/scan-build/plist_output\\.test$",
+        "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
+        "Analysis/scan-build/silence-core-checkers\\.test$",
+        "Analysis/virtualcall-fixits\\.cpp$",
+        "C/C23/n3018\\.c$",
+        "ClangScanDeps/module.*",
+        "ClangScanDeps/multiple-commands\\.c$",
+        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
+        "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/visible-modules\\.c$",
+        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
+        "CodeGen/compound-literal\\.c$",
+        "CodeGenOpenCLCXX/constexpr\\.clcpp$",
+        "Format/docs_updated\\.test$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+        "Sema/arithmetic-fence-builtin\\.c$",
+        "Sema/atomic-expr\\.c$",
+        "Sema/builtin-expect-with-probability\\.cpp$",
+        "Sema/constant-builtins-fmax\\.cpp$",
+        "Sema/constant-builtins-fmaximum-num\\.cpp$",
+        "Sema/constant-builtins-fmin\\.cpp$",
+        "Sema/constant-builtins-fminimum-num\\.cpp$",
+    ]
+
+    def test_clang(self):
+        bitbake("clang -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "clang", extra_filter=self.CLANG_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for Clang: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy Clang lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLDSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLD_EXTRA_EXCLUDE = [
+        "ELF/fill-trap\\.s$",
+        "ELF/oformat-binary-ttext\\.s$",
+        "ELF/oformat-binary\\.s$",
+        "ELF/partition-synthetic-sections\\.s$",
+        "ELF/reproduce\\.s$",
+    ]
+
+    def test_lld(self):
+        bitbake("lld -c install")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "lld", extra_filter=self.LLD_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLD: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLD lit results back to host")
-- 
2.49.0


