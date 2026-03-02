Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710FBE9B35E
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:43:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157822.1772448216543096738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r0q1xTN7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6223Hv7v1250125
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 02:43:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8lpxhhWIGfIsZtLxv/F3KFGNoYLqbZ3faNipyUHc2Rw=; b=
	r0q1xTN79ebusFhUwW5EeMPdA2GDKQooNnAvq/QroTRgf5vJappVt8geDn8n4lDD
	EBOOmcrCypRi0ZEhNSvebJNRkA4Ezku8QUFXru4TYiTzDVJ3G49yYI5Qb8CVYs+z
	/REfrxyYtGOVuQDve92CfNSFn7FomGl4PmwkVITl/xXgpU8p3dedOCAPZ0QpAEuz
	U9E2F5s2xTYsbM4VWTEBDi07sMmt5tSHXju268tQlB1ld9Zfjp9CLlIF7IXLKB/A
	tn678Blp1l1OxzJKaFRq9vObXu5rFkSR6kI/hW5CJEfoOtD6mOA4Sm/1yNnhaioi
	bZmW1fTLlHLYLU0jTY5+2Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011014.outbound.protection.outlook.com [52.101.52.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41vm4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 02:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/Zce/uD/Ov2Pu1WaSFCMnfPNibGwICO7CdX6cHE4FFSsjFUMzcw3UHD7HY5Usdf7WDPGHuoD25AKZ0Ot7w3JRRatpmUToxP58BZ5g1GAqolGs3t0quTBdEAakLmwUoUNzv6dOn3kw4oPsH3Nq+C46OwkKehMHAC3ldOFyN+yAw45bihik0V1+0ZHlc7mOsL6I+jkoHHwKIWmLguAu/PVOvGB2RU7In+nwcLPciWzCs8hFAvWxvNFXleBq8FYDprVqclWzhk/gF9DheC4KiqfpEZMBgPhi1NiUg0dCLVotIbZQAr1aerVn9YMpC/Jf/cenjFjwfNjn8cddd1Pwb9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lpxhhWIGfIsZtLxv/F3KFGNoYLqbZ3faNipyUHc2Rw=;
 b=r5KKR6ULkA01DiedcQyJ0pxOpye1Ce9WNpoKvRf6LTh372DNUPEzYcbib5qBE4nW16+OUJFbL8zvEk7tI+wPMl5ckn46vj7wnvpTrWyEEpjEkiAq0tDsZheMgI4xiZeNMXw9meDFWbvMMYJjKDQLzEv0MRjf+RHieiFlN7Wdv1m91svXw8LsaT4dmRcCeVBEnLfwIBYQfVNsnoq176lc6zLPtG3uhnoqFh4cDDkobPYok4Emfdh8paRBqJTRocOzQ2RCm43ry2/1ueERWIxIqBbA+0CqAJazoUuiXhgnYWOeYNk4yMLMDggNQ66rRR0Fbp0OiAgbM0LjUWYIjX8ICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:43:34 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:43:34 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 3/4] oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
Date: Mon,  2 Mar 2026 02:43:13 -0800
Message-ID: <20260302104314.301665-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
References: <20260302104314.301665-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eedfd5f-d8e8-42e7-14ab-08de78488d61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	X9TOKaBSxdoJykgMMFVJn0K87jS8V93VEEdKDt0ai3kTXvcsvc5/u+E+e7REKmuMWG+qVc0uftN8qAgeW4+Gz22Hxx0qBilB3MGPeSugSgtxIs/K47B+gV0WBNaWrlGLzWyTdGhgtaxCmIeq8/sebinKEWnCyaGLAqBaUTFEtlqzEVZDXTjji+pfzqMoQr9p9vivlW/ww3BM/9uFvLeYocgSW43RzBrwDEOGyB2OkDxMoNe1ymcenHo8mq7V6JzibdUo/FumDiUC4Rt/ogYho4VlVaR9AhDuM39KVYliwh4ivoQqmDVUo3qex1Q/1F5V1roUuoKb2kQMJ5GfonCcGehNXSVaqUXrdn/uUezDiUly6qfxuUCPwc8Svi1dyTxk48YfPs8j4SztjtMIaYTySMTnFBur8oQGt5QtCAA4DtRAT6nSV4ewpUWTkxPU1rMPWwZliKjWF9GogQUIhoyg2JruS3PcZnnTGLsIt9A1d+AmvsW+n38/K1abuYkCTNprFicJNSl4jtpoc89e2+fjsDRmx5vF10OahT0uB6uJG8bdKM8IEc7kzYVrFcUpXAsGHZWEiwcZmfxcf8+PoXuXBv89FfKrynFwaV4yQIn+JQxT6pZXA2ykLh8nIW0Zv2VbuLarsEASYeFy8Kwhn2PsMMZzHmP+2x7VeWc77qtfejnTUQtdLwBOWAaxt8qtK9ReMdBMdxdNkjS+j2ZCEhxqaPztRTDNZNyZrYlWpzn+gc0TTqKV9JHRdPzOid5lQYC8/jKTVHNzIVGj69D3vb9dGRL1UI9Tsmt0x84Qc1Bdf1Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nEC9qQnkXHD0u7hZc0hPOBYXM+qn4lUfPcXbpPIOoUzrDC1ciaCBaFYq9ICT?=
 =?us-ascii?Q?D5f78jKMZz1lgUAU60IhurWKZPL0Fry7PdYSq2W6EXKJnR7pU9+aJYWr77Wz?=
 =?us-ascii?Q?VCh8oWWJeUaH3xywkTAoOlDaQC+uwiquhDiREXYdZ/TWLz/8OQbGHvqJ0eLm?=
 =?us-ascii?Q?2T2sOqoA0os2WDButTVI01b9tt0LvKiLVoz4AQ1eY2uCj2pvCNZwhtM0YyiV?=
 =?us-ascii?Q?Ha6cA95n9QMCdZFVuldmd7Qm8tz3xuCy98Dd4qyw5BWE9uDut7uVMI7vYW2Q?=
 =?us-ascii?Q?z/Je3smYQkbPo8cckirTtsWDEUcwHd/yxy9Z1kwBgT3ZM9H/OzgQhNH3nkS+?=
 =?us-ascii?Q?tRgnj1sKGgQ6bwjD1+bDfWlQtcIF9q+g6g22PwWQ93LD+C4Wa4nVaTs4xanf?=
 =?us-ascii?Q?O8Y0KewZwm4A/+gHwIh6sfVRaSHHBQzXR7YNO4h7mo0F+3bROzssucajX2B2?=
 =?us-ascii?Q?3fqScbM+41hb3g60AKF5Ra134FCfW/pdjHGNegmK/uxo+vYyI1OZCVhVMYqJ?=
 =?us-ascii?Q?8+GsK+PGMKyF0upHmRsxsfssjQUOEy+NHcyS89Y8cG0sNdYhwOT/rKNHpc4D?=
 =?us-ascii?Q?fDRbvyRI5JbnqPbdoi0kJ8w1L5jRic/oxKcavgYVAEF9lcsBBf5pB9DrJQ3+?=
 =?us-ascii?Q?9mkWKEbQbyH+/2M/y8Osz5RFwGsZvv/Pk/4I+tTANQtd9SLlU7awKJwDbSuP?=
 =?us-ascii?Q?JV8msgwPS6c328RbcdjiTYFbWCkWRssm6VfLZ+vV2u605DL4I3/VBjJ/L5Nq?=
 =?us-ascii?Q?TbOadd7w1igVIvw1DCSFFv7MH53lELVdhU1hYvtqnN3xh1egIevNwFDuDARr?=
 =?us-ascii?Q?wFepqkkJTdpsakwH8ER8ctxLHMRY8KIjW2/Tdc9rQJeTJ1OibLELxyeu1xiz?=
 =?us-ascii?Q?yORAhqUD7Fh8uwsS//5jXrJr+S3eyiuor+7jvw+Vmp7SgDWDuumYsdv03PT5?=
 =?us-ascii?Q?Vw9dyCSPTeSCIgltiRn1dOVpZZL8iVcgmx2/N73yAaSyq0pnA1pMAU8bRJXl?=
 =?us-ascii?Q?Lwpn7tv58HLmcIYGwpzjNhz4Gdx+WqJbIJQppQ1BE7LGRUNq9j44qG49PcgL?=
 =?us-ascii?Q?oR7yAAYe+IHMOsll/G4axFEh9tqi3GGM8gGAkhASyeWaTecUER1NuoY+tm6+?=
 =?us-ascii?Q?YfyRwB2m3Gu+53ak0k9fjrmj4QsFYFHAv4z30tVsY0+MHgtZRgvcpEbJwFrV?=
 =?us-ascii?Q?87uEQ6xagiv9XTaVTk9GLUcHIQpHry2W4mWQugpth0HUb511YHrQVEmw1G2g?=
 =?us-ascii?Q?oTfd4OUGfGGQyZGibabdC9Sc6lUBFyc2pXn+8oKLSvKLCpFrPmV2NxVoQCD1?=
 =?us-ascii?Q?mWhB+fNZKM0RpAlgMfnVtLgW6holsgAP7BAZgJcjjbCgznAb8gMsN1hKWFnE?=
 =?us-ascii?Q?QdEqZ0a7HwHY//dr0AXHc0JxgZ+XgzbWZr2lOMbVq3QFHffR2YyDXnk8iHYL?=
 =?us-ascii?Q?cJXTLSLqhSgNhxZ/uip+Bua/W575rV5yM9yNQOpfNp3rhAccZTiA+5sKNwU0?=
 =?us-ascii?Q?Mc1uVC0SHE1GrUVyMq7DoEobAOI2Zs/N8dEm8azeInb4+3dh9AWx5qT5zwCI?=
 =?us-ascii?Q?RsJoIdHW0ZKfEo7FFipHZUMroCOLqMMsk7DKmLoBJ5Dmbg8TaTzdf5zkgKRt?=
 =?us-ascii?Q?NefcP6uBhKeGvGBot1DTssMsrsA808FRYyqTfK6XhUaeVGIanWYjV8l2UeSg?=
 =?us-ascii?Q?C8zCy0qlJwjOZI2K7MBeyij5O5Pb1kiyVNP4KKiy0VlLAifc1547ekjg6ql9?=
 =?us-ascii?Q?jvYapth5DPcN8ZbAJfL960jPs1pOsVS3HKY7kKWrlR407HMrTaag?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eedfd5f-d8e8-42e7-14ab-08de78488d61
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:43:33.9165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dZk27FSkTjT93mPCMEHlxtXfiQKYFYoKh6919lMOnxTD6PQD7e2GmDZ8RW0DyjlH9i1xc7ZExoBA5Zy8ToH/stcDxqRNzs175qcmiQfGQOlO/o6UfFcBGI7JhMqvTpv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-ORIG-GUID: xAhiKy4EvX1ZQOW-fxFlrXq6uGP_Qzm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NyBTYWx0ZWRfX5r7ljxhqxPq/
 zx7r3s/S9eOgoa3EkUG6+hqtjKeQ2cH4wQyU9AUbwnxFRn5+V5dGvmhYCjNB9epO38xMbKl2+gL
 Ljjq67NlL5z/CFqFCanVp+J8CvuUpZfktDXM/PB8hmePcLpRY/DFWXBRRIZd4qSZGrxvcd34RoE
 udJrU1nD4CS6VXmTsfGdksUYLBuE32zjENqlm6QrR4VcUBiLolwdj8kDAs5jOcpYhlHOWUowxi3
 t37VNQqnB0it+DdjAQGTqNDwQqbQwtSk7KWbB33OPQbeTF1SmlKQ7a5B3qFI4+oajiq6ssZrbWJ
 3IQXQ9AN8PYBtjdKDPaWwrxipue15jMJ8+j954AeQYxRQCNMO1wLLGQvX8nlHdRINscZqm5NeWF
 y4d0ntBdrzla0pTdBQIYp0L5eBNobNdsMXt3mw12tU7aKfbL5WD3YE75wBbko8zSWMSkH5awvkN
 QdsSIZVXsh1XjTK6eWQ==
X-Proofpoint-GUID: xAhiKy4EvX1ZQOW-fxFlrXq6uGP_Qzm2
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a569d8 cx=c_pps
 a=sI2t2Ij5wXDMAk54xGiwVg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=SQQGA60Wx8lJcxWaSqYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232191

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


