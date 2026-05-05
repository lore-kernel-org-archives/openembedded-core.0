Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A5BCD3430
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 08:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34256.1777969013434702707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 01:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HcD79YgO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456i79S2350189
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 08:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5xx22mQWJ6KY+FNAPsGEcHqF7bDFX0G2J6NOggiKlfU=; b=
	HcD79YgO5IU+NJD9HqsLiVliFYfpKdnxWa0gsWC1PgVsGXvomPnoLbTKHt2zCRG8
	+7H4/yThqiOgjDh1sNueOeHlPtGZQuAWE9R9/mewZCtLo1tO1Xoh5VuhliSjdtND
	A81/cFpeoiEQfp6s2MIvXsGqeDTvlLcPDXkQpTLg8VOb0OXu9igOLlEkq/Fp5eZZ
	ggpzrVi9RE9jhhBFwChwvFxCCMloky/tnkX4qnQwWz68HwCrOkmL5m+bIzEJZkMc
	Kf4Wfv9fPI9fkiM4zU/TRjarkJIr84aOsEws0/KZRaNRIvaH+vL5FMOy7J451Nr1
	VQFN30VLHZA/Wjiw/q5wwQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu338k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:16:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+e3zmYhYtfgL+PzMFFW5zC9rGeHNiIdx3C6eVYhzFcQp1BoefpQuK4WYRo/k2iRLpJ/KX0bbNU1KSIBzU0y0U9Szl1SV0zSxUfwp5NcnLyYI0qYPgcMJQ8jJhZBBTzYMof9Lx5NBc/r2M7cqH9MNmc7X7yhnuDeKRrLnp9qrXSOOzVnNScDOOJSb+lXKyPgSnLY6mmMDmSWBaAZcjrAEtqDviJRljYxUPCMCm9HG+tqHBrO54bIgK0QPvSQJUe9Q2aNFk+Tv/bw1QXoQ2spmOaTmT3dR2HyqqIudMDtlynvnlnsUz/gdTuaUc6IYeTa6PJupsHQB6EuKDjWAyZ5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xx22mQWJ6KY+FNAPsGEcHqF7bDFX0G2J6NOggiKlfU=;
 b=leqnrlq03sMlCSmd3SgN84bYMVWjR1OpUc/DNgaiqT8b2s9TBwOsLIxIQPXwWYnxti/8Gvhpw4VgRxmBWqOIB24GoOK7EcltRQwMe1ciptgjj4yd3g9Qe1I9UVnw+C0bMEVJvDH+7KmXSXpZSDgNX19IFywIk2U+p2G5l9Tj94aNmVCPObgvoyg/Eictfgv2blKfdu1oCRfubhJ4fJAaryZ099tRhpJIL8V/m1bj/eAeu5+WtZP+zV6miG/9dIwRMsWhuQ2tD3vfUy5d2NQzGJLeigsYlXTcvGlOl2hJEV9GwGciFp1/T59J5RsL/7Swu1LN8Ka9kkwKMS9uEtrZ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:16:47 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:16:47 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        mathieu.dubois-briand@bootlin.com
Subject: [PATCH 4/5 v5] oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
Date: Tue,  5 May 2026 01:16:24 -0700
Message-ID: <20260505081625.849368-5-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH7PR11MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 248d102b-7210-4a0b-cca4-08deaa7ea4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|21046099003|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Sh77wC9h9FV6djT4Bg0yw9WOokTnk8dx7lzUQhZCrqtY3tD6IvVxDJ7LM1YPCajcwn4WrQQq+uTjOmJ4vEgL0Qd8lrV7RX1qYaSrWbOE3M0Wyxg749emLehr+p8KESK3xPtGJUhBDHfn3hG/F0C/pobWLZdtS+b11Aoqh2Id0r1ql2p9NG2EoyGSQjCGU0VoP1MoYsqISiv96V7tjEKlUCcckfN/izauX/i3csV9FupWLh3hPZY13g8DxvXrrmOmGELAKmKNDuJ4JCqs9Ps1guHCwqKxHmA1sIyLsbzb1/vUVKIKomIPjncytOflfyWCMCt8yisyt6swd9mK8sorqwd5IFKtHpdtiNvGtS1X4JyI62qfcVr3CeLb6HhTc37qR+fHuW027qgGBV/3ciyuSgBNCGdCLmSTrPTCEFbEdFcNYwnGbLwvTLHuzYQeb20r/FhTEPZ2G4OSJY4tCg6Be4CKF2tRIUX7oD6qVh0wegpCt8aMg3ilmH8jEyvzIbEaV/aiRJsfCSg7yXlUhtzZ93v0QxiHN7z8Hi7OC44/uVtBHliXr/03HPv/OZuZoNBy5bO8P8Vhp3AKcbr1Dj15RwbcLRTuMFIWwAH45JKcPeWzJORMmodxrSHhJhzj5zpAxeYnc+nHZxVDdFH2rJDMOlGjMFOMA/GpLPKXzrbXARKEQwgfuF6vinPyiCqT3w7fuBeVXbZH5qp9ODqApY6cd8U4i+aB7T3vWB7CDn5clkDDarZcy2HTFnCslWf2IIpM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(21046099003)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C0UMRbHK4+KIR5f2W7a/zJIbP9h1YYaAxwxv4Agxwo5C3DFPluC5YJ/T+spr?=
 =?us-ascii?Q?ZP7Yb+Q7NOQzjOuWmti34MwvQStteZF1UhTAw6DWyjiJ40bt8Ndj3/FnRuM4?=
 =?us-ascii?Q?3ErHGMW3KzXjsRIpDyP5W3nsRAnXpHmZ2NCHNoxAXGXuS8reInPuzUkcWNAJ?=
 =?us-ascii?Q?3O6Pr/QnilomK462UyoFuO+rHDq3Ie17Z5dX23sVjPE14v+7ZgbSk/hhRQ6a?=
 =?us-ascii?Q?BmKboDaD1Xk9qcTHgk3i9bjP7bcwZI2LALkALSrYSLTeh26epIVrHgrX7G5S?=
 =?us-ascii?Q?0RPYI9J/yaIaQkAZvxMktD3h/IzzIpcS1xGIERvzW4DrutwJSm5G+0Te6tv3?=
 =?us-ascii?Q?CRdqqvcGkuWBmpPjOmVuFWw49l8oyq5al4I9C8599agdEFX+apu/Qv18eLYp?=
 =?us-ascii?Q?SUknNDGa7p07ijbD4tTkevPwgqDxa2j5B1pfbsLIGBNDuGS8t0rYlT2Qltrf?=
 =?us-ascii?Q?KbViBb/Klq8WXnuLfFm7FkmYfHI7w4oh/fXcMGLna8Z9z/96MHM+Xt4XbCED?=
 =?us-ascii?Q?FE+ckRshAvxGwVbVI3YPk51eTjQOMQ0qh8qGXqk7QazyDfjl6CzgFuvWfCOF?=
 =?us-ascii?Q?FYVQlT5JFxznfJlKoQRPGiiQCHX9TRfe0DCVD5Q7O1akYGN3HWN5eWlYou7V?=
 =?us-ascii?Q?gYygP3tCZN5ZeR6ZDeBrQ3i2RJzvN15j4MRhldMoQQ23SizN4uGJbrhPpyak?=
 =?us-ascii?Q?6V8mKaaFBLuY9ykxKV5GZJgSGwK77zjAvheNjQ0vyM6FnpgwTLeful+5ZtS5?=
 =?us-ascii?Q?ZVt5I7dj+oP8rSFow+yMJKIxrbDIID2BslOKPcyjCYFN83vvdI90np1/fMG5?=
 =?us-ascii?Q?t9q2X74ZhUvKeUgtlotXmmHCG/gMGCf9EqZUA9WHE8BiX1+LgNiEZuKOkGn8?=
 =?us-ascii?Q?qEnGQfeWr6k8Gv+jfbvoXjN7Yv26b1SeHIo+Tdm2A6VUUtvpDApD6F9ZHmQp?=
 =?us-ascii?Q?epC2cffsPTDQBNqxeHllrxi3sPUYG8uieG2QeK1xU+/4Q9w+XR39NyNtLqfn?=
 =?us-ascii?Q?WiCjVVb26wcKCoTBlMprzLMSRRgrcHECdu/kstVKfatGISAyxAHs650icD/4?=
 =?us-ascii?Q?aXzWp6r9uPR465LcpiIsUUZHRXi6GOLSc1Nunr9enpmCM2BtPAYKAKf24dKM?=
 =?us-ascii?Q?hJ+brSL6Z+Q/PZudnyjre+tZdwrnEycmuhkn5Kjfc45kynWA9kGo+41RdaIR?=
 =?us-ascii?Q?ql1tm5vzL3a0WDHAF1GWqVDgO4tnvExmLmWlPOaJ88V0vwGQKMS5K2nlDbJ5?=
 =?us-ascii?Q?MA8ozq8qpmU8+PUkZirmUamlIl5I6KBQZ+NXOavg0FQoxhOF7K8o7zzAaMaf?=
 =?us-ascii?Q?QhdmW4LyK7uil68Qq5R1An8QbhvLWrF6f6DN26xcj92fBP/h/ORLz0B+ljus?=
 =?us-ascii?Q?yKHvgFA1iLhV1a+utKSI2VE3YRi32I7AxHnwZEAv9PGCyb6f2mtQlJj4Cp99?=
 =?us-ascii?Q?JviB9OGXcx01dEFP94QJUACt65daKQjX9gkDrsrTClG9S33xq52Mo9WmpPt2?=
 =?us-ascii?Q?WXG2J+nBaMOkxlODv9DdeRKMka0PZhXt7VPFlP+QZrLxO2SE8EOcXetjhQhF?=
 =?us-ascii?Q?JsxieTmyEMMpIyQaHiV0e0JHS2Tw5uuFcZ7t5+TknwbtjbI2NKthQ+8rMkJL?=
 =?us-ascii?Q?nxBIGtRz55msHRb/AoOqZJmKTo2heo/2WDKKqh5K5AMd8Aihv4wLoIT5ZSWp?=
 =?us-ascii?Q?rArqRWTfTcFVeBTlR94iPAbL1diCIGad2+Jc/CzVjF2Pd0rPK/qD9ct55nCr?=
 =?us-ascii?Q?r+UBdU+y5golZh+cEEa991tMuEnTEqC8CE4c0rnnPICvrOAX7tT6?=
X-Exchange-RoutingPolicyChecked: 
	CCXHbtfGwf4TcqH+6M4mg+PXc8PktfJX+E/g39zpNd2pB95cjcOOZ9C+ISAztm4lHhzZvDsp/8ipDAdvRcqfLChUTJWDBgAHntUjuJrX1BTJ2ruaZ21NFf2jscXrMlSDwj8oRFI7LWtGWmdQXCcGZM3H7HoFZ1H4lVlCAG7PBGZ/76gdVjZ0lCG/3bacQePx0z5wi23zF66UffndmcHZVALQZXqXWf2paduFUZtOTnb8Y1cgGSReyaR7vzU6+TWuPOlJqtaXvBIIxotT/7qakn3Q4ZTU/LiO88jkctpqjVG0zQT6W6P2fvGtEAv4vHaEAF00DuStx5GYx2q0eACnHw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248d102b-7210-4a0b-cca4-08deaa7ea4b3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:16:44.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idfBX8OLkyD58RXXISN0kQ1B0XXE+LYrxUUHhpTKWxVDDeDYSdHRwpkgo3JnXssXDiAl8jZKigMF/k3repmUqv8Ong8RyKP41px0xzGDUFeZlsBZ/2XIC26QA9nYlACW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69f9a774 cx=c_pps
 a=u7dnV0yUwpVRNDUrCOcuvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=iG7WmaLeum_H_6XJk-4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3NSBTYWx0ZWRfX95XYQJKJux0Q
 +voiTVyo/s8JBRL3TgWfXTWvBByGJ5cTMt45MXyqkCHvNrKmTxoP5RHRSaNKHemwoL1uqGB2vVv
 Lxfzez2MVAP8JSfrUBuj2Mp0KhuXpE/6cOUOqMVsYtPL50odzubGVbAg05pSBbAz/odRh3NSYUn
 Zk+2kEOw58CaIrjSI0Z3CoE1pzRcUP5XRDET3DwM4S1y9B/4TD5zXqXhs0d7g5R9NpdV9DDnXq5
 4tqcaZFK6Pl4+wcJ1x0ANupLalyN5huL0MO7ZZhJgOOdy7IGoTNHxqMSuO3Q49tH9xY31S4HzBx
 tOJFps9GmbQ5xM1bhOmEsEgZz56cPi0pf6FXGxcXGCIAcWKgSOyIgCW39rOXBMY2Xn3tjN48eas
 I9UdbIgtIFh1Fk+jz0NqDOYcukF51bGeFGMTlYhi0+BOf6tkge4D5NxkEUHSerwNAg5mvuAh5pA
 eZPK3YR/eSpMfVa6SeQ==
X-Proofpoint-ORIG-GUID: S21iKb8n81nBfUJcQJMSGy4lXQalPOdO
X-Proofpoint-GUID: t1qdqfZ-BGrzzX7BV5yoU15zlrOKF_fD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 08:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236471

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
 meta/lib/oeqa/selftest/cases/clang.py | 325 ++++++++++++++++++++++++++
 1 file changed, 325 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
new file mode 100644
index 0000000000..c5d2188cff
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,325 @@
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
+            f"mount -o noac,nfsvers=3,local_lock=all,port={nfsport},mountport={mountport} "
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
+        "CodeGen/Thumb/frame-chain\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/ldm-merge-struct\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/scmp\\.ll$",
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
+        "tools/llvm-cas/validation\\.test$",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/DXContainer/dump-section\\.yaml$",
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
+        "tools/llvm-original-di-preservation/acceptance-test\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
+        "tools/not/disable-symbolization\\.test$",
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
+        "AST/ByteCode/builtin-object-size\\.cpp$",
+        "AST/ByteCode/c\\.c$",
+        "AST/ByteCode/codegen\\.cpp$",
+        "AST/ByteCode/complex\\.c$",
+        "AST/ByteCode/complex\\.cpp$",
+        "AST/ByteCode/const-eval\\.c$",
+        "AST/ByteCode/const-fpfeatures\\.cpp$",
+        "AST/ByteCode/constexpr\\.c$",
+        "AST/ByteCode/cxx20\\.cpp$",
+        "AST/ByteCode/fixed-point\\.cpp$",
+        "AST/ByteCode/floats\\.cpp$",
+        "AST/ByteCode/functions\\.cpp$",
+        "AST/ByteCode/hlsl\\.hlsl$",
+        "AST/ByteCode/intap\\.cpp$",
+        "AST/ByteCode/invalid\\.cpp$",
+        "AST/ByteCode/lambda\\.cpp$",
+        "AST/ByteCode/literals\\.cpp$",
+        "AST/ByteCode/memberpointers\\.cpp$",
+        "AST/ByteCode/neon\\.c$",
+        "AST/ByteCode/new-delete\\.cpp$",
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
+        "CodeGen/builtins\\.c$",
+        "CodeGen/compound-literal\\.c$",
+        "CodeGenCXX/int64_uint64\\.cpp$",
+        "CodeGenCXX/pointers-to-data-members\\.cpp$",
+        "CodeGenOpenCLCXX/constexpr\\.clcpp$",
+        "Format/docs_updated\\.test$",
+        "Frontend/rewrite-includes-bom\\.c$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/crash-vfs-umbrella-frameworks\\.m$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/embed_constexpr\\.c$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+        "Sema/arithmetic-fence-builtin\\.c$",
+        "Sema/atomic-expr\\.c$",
+        "Sema/auto-type\\.c$",
+        "Sema/builtin-expect-with-probability\\.cpp$",
+        "Sema/constant-builtins-fmax\\.cpp$",
+        "Sema/constant-builtins-fmaximum-num\\.cpp$",
+        "Sema/constant-builtins-fmin\\.cpp$",
+        "Sema/constant-builtins-fminimum-num\\.cpp$",
+        "Sema/constexpr\\.c$",
+        "Sema/c2x-auto\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-1\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-2\\.c$",
+        "Sema/fp-eval-pragma-with-float-double_t-3\\.c$",
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
+        "ELF/lto/cache-warnings\\.ll$",
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
2.44.3


