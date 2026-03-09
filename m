Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B10F3C26B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:44:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20798.1773078263516629352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TedGOz+7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295e72F2139992
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 17:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=; b=
	TedGOz+7zykIhAdEodV/FXQFl+WH9U5amg7u/lm22crKapuSYcN02AHc3QPYB1Mo
	uYCF+7PcWfdt4ouNBYnrBjvgmOCanbcccrScLZaM3FHtnCA4P8qXoJaZaEqV8VMd
	dbluQKHEoD1ivbNt/SbPjqE8McW2mhqZ1hrx1c3PiI9im4CIntOgZpnOOujiAelC
	oLMrmR35OzHhG9tHuCV3cNaCciJ/awVDPPC1vg63B/s60d8SL4eICfRvL73DXyvF
	Hz7U/c09n0DQWkYF3pogK4yPca9TMox7Ccg0h69CdMwz3QyBcLFFFA7rH/zSiQBT
	UHEw4F3o6j3gGkjwiJi3lA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97va9bc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:44:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIiu9BZ0cKlFNGLzX9fjf97/+2bpVHGEal5EoUpma4ii2vf0drIAQDTynt41ZB+6xFclYUEy9R5tmSB1HXV237fnTSci0ljxz20ctmqD7DPefGsQc7vAkyklW3Udl72fXtXbyFvUcLOPYckIbECWQhWc+uEDp2We7j961Onyrl4i6nIe2XkCPvdGLeo7q0jpwaJijYuE9ZNjmtnK4l2XAnlzHEUHdFg3JDq+n9vn9whFGolXyhgE3KdJjqt7kQ0mmOD+tMWrvFO9SAFeOJ3ZD2X+n+7eU4G82QVazW7CYr8SgF6exkidndjDljq8bSS0Yp1UQvwjBtpGHE5n75w3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=;
 b=Wba6h4cPySrHdrAC/ApaHBzwHBjry6U317z1nPumRuCWPNNvok7VIUZ6oIA7I2h/mu3V/wtA4DyfTv4+6G+c8g9/xkYXvXIXxiWh07WWwKCwL7CR8udJhqbXS40rkb3MGmcs0D9H0nM9yfjONyexLj7NHpFosLUmwJQ15VKOK5bnS68VNXw49UL8bGjY/8khZP5yjd1TrkCjk7qrmVE/A8QNa3h0exDpXy9ZJtN+fv/RpXktqMubEgcIRfPe8LLQkC/oByAWWOkEhilFIumeAuAarRSVRKoEWfcTx7gm1H0b6m4ERgffWsNx6sJQeVFN8qs7Q1P1cNhHIHvUmb+vNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.9; Mon, 9 Mar
 2026 17:44:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 17:44:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        ross.burton@arm.com, bruce.ashfield@gmail.com
Subject: [PATCH v8 05/14] kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for kernel
Date: Mon,  9 Mar 2026 10:43:37 -0700
Message-ID: <20260309174346.3384212-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
References: <20260309174346.3384212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: bca06c83-bba4-483d-4caf-08de7e037da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	mBCjtFCAHjaYDHrlMw3br+N3MoJ29giDzjgTD2Cxi928A+m2R7mJ9Yr/dNo5FCTBwraAjGDKJIjIfC7KgU7uDA0eJ6/L+Bvb/bSEHQ8TUVACihqEqnJAP6QhIUAaEe1WDvP1mmrHovHHinBmSaipgy2+83+kh4bbxKfSP5Yv6nxfD9/rhV3LwVi8i4dYUCVuNzf3GTmISX7oFFQwZvVfbtl19qrBXs4xW7EGN7jqxM/35iPXhc1Nm3Nd6/hPP88kzuW8Q6xzASDQNSkoWQPGoD6ZA02/nGIi7VeibYYOBpD1WSPiXu52uD/ea4q6e+3l67sp412WhrNlLcs2190otGFPyJUQ8RmXjD4p2dgYWCm53Fjt1cZU113er/MdnFsNoyTR8ZgIRvoCu4RBnyLCsKw8k0du8aAO7UoGKgaSJkgg3+HEhBhxZHavHBCtk0ESYYAsZR2KNFBFxhyTSmVe9oIbnyDTOBvkfjr9rwa4Ltovg1SJvUYT8RUxaoSV8TIbwewvmVl1e30webAN0bM7NwyYO0tYV5KWrW2t7xIRitq/hr7mfQpKKR/iJVtmy8RTjShPwaOdVmadG7KK3q4D7Smo1og0WHt6p6w14WWaeKTv83NN/1h2U5Vjw1JQtCJaIpjtXMNXTdcfeIG5v4RHJONXGk/8mj6X1oXimyuNsERKYLgn9R/BVUTc838A76mitWsX5bIOSyWVb72H9cSLX5O3StaxUf76Iko88TADugphRdj0NznGHHqyw7GXpRpQTtiV15k5m+JK+LCxPh1IIElMZyonkRTXwdBDlpwnqUo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d1KtSwt8BQjYHiZOpwoZqbTOewNZIkhMtYLeBSmsbkFcRZQDbKaCCnE9oHZI?=
 =?us-ascii?Q?mJJxq4iLMA4Z8Aelpzcbd7SvsKMte6Y3YpJ+QKybOCCgyqwigUYHqp5J6bf9?=
 =?us-ascii?Q?pqQ7m7vz3mo9Z/2uBszqRfAW3h7p8uckSiWySY/oSxppnkzE6oF/BpsFXpSo?=
 =?us-ascii?Q?v2ORWMQq8B/3ZXG2rB91nF26nQHXTeQrXJrF8OZ1/xlmu/PESBdWQokFwR6G?=
 =?us-ascii?Q?VCewwAeGtQf9VlDpoh/1xThXZFAfzLQLj6u5At49uyZoLb/SXKIQ3Fw+ZGmz?=
 =?us-ascii?Q?cz/2UIHLALf6xV2qOMrrS06cC2RpksnamwKvwSO/UBuKh7b/LvDxRnnuVbEq?=
 =?us-ascii?Q?R5cDMsYnxjOVovs55XWg9DBY4s0rUumqDRHmMtm5AMCr/bNoik6Ym+1A8eTd?=
 =?us-ascii?Q?KSjM3IEmHo8bDsBLPh8cXVG44LlD32ZGs4ZWoa4gLEkXCAHmkISCGr2Qyp0Z?=
 =?us-ascii?Q?I+6Xkf1iGIy8q+Pga3R/cnRFPH0oMzmTWa9DAc8VIaKTlsRJCa8fNthZrZPB?=
 =?us-ascii?Q?HvSkWjL4BDFnXW4XQV7g9c28vpEFoaCJeMalteci7DbuL8DtXnARCqHsLM6Z?=
 =?us-ascii?Q?RcjY/AS2xQDie9gtIPpe8lNh/zDe0QJ9nMUkYJtrZMqCqSsUm2Z3URNilBI3?=
 =?us-ascii?Q?MUeOXT9HaWqmNiXug0iiPbYWAJM+wLBhlrqhYGvKphJT+ZjelPlJCiIBvMY0?=
 =?us-ascii?Q?fVVgRDVel1QU+W8307BT+MfX3F7usIEvy/OPUCzzwt60l4M6lXLq/DH/W2H6?=
 =?us-ascii?Q?1K1nfPoJzL3KpWqJ43H9poaiNgkRqB2A+Uq016eY6xZLv+GlS8kPHq7FlDng?=
 =?us-ascii?Q?NdBR7Qzd7hymFt89qSeH/YKWlfB5xs7L7fWF0oVEvkUv4YDT8EXEphqA07MM?=
 =?us-ascii?Q?2pmHRZxRSaAaLaYEiCWjx2TcQbCzPZskea2oj5uoq1j9GWziUKeWTB3iNN7P?=
 =?us-ascii?Q?3Jl5zB1dK1koXRoGKjkggSHJPzYooMx9TvEqT58o4V1qdBTXjc48m99pHt8b?=
 =?us-ascii?Q?3VpQ5fAPgotyjwCSo4+tve//WJNfqNG/gbMYzebyRVRfpQbc2duoBop8+5Pf?=
 =?us-ascii?Q?u+TOiRFh738I+mryEYdst+3CDXeVGZMo1OAWlUQDqt/raqmihmpRqg2q7kRD?=
 =?us-ascii?Q?7iBd4qejy/LaubC4SXPfI9RRtmysRWFffEQyZn6hZOI/hQJnzytVQ3MibI5O?=
 =?us-ascii?Q?mdqvn5q6PziWeyhmqtwNs9PHjm/wxh4rwVl4o4Knu4z3APEnZ05RQuy2fpAe?=
 =?us-ascii?Q?8Fan4kqSIkQs9WBKVosJ01vlcagxDfpMkRdPm+0hhM5C3uBpJUw1L/TEzA+P?=
 =?us-ascii?Q?s7xmf6p2pIYMZ8Tj6GeqLnnvQFxm/i7WryUnZpizKohoZO9O6CFd9NqUwaRX?=
 =?us-ascii?Q?OIo1spDdQWii7x3JS8dK9u/smJSOZHpoJW49/8E+iBAWIhsqOOvMIxnfYfEt?=
 =?us-ascii?Q?FyOQslTdRrVTyPyjn5Q29TM7TZmV7PtZgM7eP/UDxB5RP9rBFFopHq4DFS2V?=
 =?us-ascii?Q?ViGGDXPKeycZ2M7o6zWVL9g7E4L7N4l1YUD0LO1YqpEbrXW0F6lTZcy7JJzs?=
 =?us-ascii?Q?XZrKvm8sU7mlYKPv/ZRk/pwfPc5TAWIK20OLjKt44TueFT/s9MnXOrY5ibJu?=
 =?us-ascii?Q?8hFEtbM24STd/XV34/j+rBqh8BV9Mnm9+VYc16d1I5ma3tcrlHNlVrI1TlQr?=
 =?us-ascii?Q?4h0aDLd+jifIL9y95wTRWTPWLitswcqKo4TNpODZxd0UEWsH1hHqQhZ7NATk?=
 =?us-ascii?Q?8Srs9IhJxb4ggG1hQUL6b4j1GjWAsS0=3D?=
X-Exchange-RoutingPolicyChecked: 
	ClL9SOGij0ZZsb+HHYs7G1WZQtTmAkxXvHuzSGZ4wPomybwFSrO+6ETVtBmg4YO2OhrKd2l4WzlGfPqybouAnsa+w5E+OsLzD0yFboKddmv1g5n3FbEoEbcC3ff2EJqYh3SWyguS5g/t+XDjAlGeDJ5eQvcgVnVsWzJT1lCjOKj2rQ84xA7wEqVmwmEZ9iJyqG0gE9jF5h4oSvUwelJFzKWiScSvJBFVz6z32H7Zkh7vPUYWUlCbkvVVdr/oh35C3CUGuPIpkgrcDge3l+FqNS7K1W/81OGx6g0pywa7rf1tDiyDXXawF1GyVXh+BFWZ4aMQTQ888PhjXLQzjPAtLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca06c83-bba4-483d-4caf-08de7e037da1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:44:19.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/qBZt3PuNPnGSSgAqAIM8CzaXG4WQCAsNo2AgAOCR9jD4BK5jOR3mALX7RMA7CXzYTGXpic2w+sR/b8c7zL3+UGnaBFbx9O8eywWZce6/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5PrMXFn3WNc8RIMCcKI2x72rhmH1o2ye
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69af06f6 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=JTVBbxAFR3XZCbc8QrEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfXwXMaJVUP6gN0
 63HR94f2ygAHiC7gP/onxaexFFVZkOtoDqFXRA9cz8etPqzPNePqiNIs4/rWV8fTIjTtI4cjobh
 WQkv28jIVFLP2lkq1cEoYWjL9ap4IF9GmvYLuvq3bMbXNr7lFQGTipQif2xFaKQyBfXvgBYmArS
 IBCGiNUBsWIS0u9v5fDMW2NnJ4sLrqJsVxB5gdMX+x9/lMuBFdmigysdXwK2Y/HPrpJkIbzdJ4d
 6yElNsTjp/xDdie4Gq/lRUV/biPlZDcBUsA7XR6Pg5OEjg6T3BTSaITz5Cit+zbZkI4pB8SkRTi
 yK3+9YaXHNfUoqWvZN6ZocXRn3LEhKTiBcYSmrzZ1CcsJnDDdQygjkXptkwT7lIzHJOT6Nq88Mw
 me/nf1M8B4OG0uqaIYsw+ebM/6B5RQwgLqrlt0tbsKb7PRgl7GyK8xDXcumwH2E+iA2T5or00Sc
 ZyoLLuhS4IPCjwxoVuQ==
X-Proofpoint-GUID: l6uv42Fwxh8K2MHbkpto2b5qCC9siYTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232741

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

-Introduced KRUSTFLAGS to pass `--remap-path-prefix` to rustc while
 building kernel with rust support.

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 7acc81764f..fd9ee91c79 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -4,6 +4,12 @@
 # SPDX-License-Identifier: MIT
 #
 
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                    --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
 RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
 do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 
-- 
2.49.0


