Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4389DC531D2
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:21:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21237.1784805674798599441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UzodMTAe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1664a73ee3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8sIn62947885
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2SA2d5QaO
	sp3P5kXTItGNiDsFnT1G4G/5hI3nyjrQb8=; b=UzodMTAeZKHcxY8m6Ed01xDC1
	+EXqepzSRcDRCfKuV6qA86MwEwPIlrwhE0QngKLlh7BT2OrFC1nX8flnuTnXn2J4
	eLLAtIteNKLtY5nvxfN1UJFpR9XIk3zbXRElvPnR6EvjVMWpmOj8+B8EGmykHNt5
	3+MqZ0vr6HfGParp3Pt7HrsG8fInD32Tq64g+YFFevZGdg2UdPP4SOaBlN6mv8cw
	Oqd0NHmlUI8petZfhj2KUSF2xi4IBOGr6YWnQEqv5mj8KCjbzDlB5Wos0Au99Bly
	0ABWOK79rotuKz0k6Fz1vLqF3fFZE9tYe7XM3/BHwNdSNtEwwLbei7h+ehhDA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fkdhy0c27-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7JemEa/o+Yx83gW2W5wx+kmpBukGfvCLfix8XTi6GjBljdDO1kRJ/fJdPzpCzKPu/t27Z26LvmetdeB8iJfCTcERnbeqG2woYEXYYPM6zYQqRSnQej2ie3+E3LyrEOLeP6Lwi3FHN9sJTkNJFHovpZ0xmBtCrXHC1/3J5l8TSveO0i+upwoV1AvOSz12+PjJtnTUQrrflth1Ro6NziW62XPfP+NqWNyKVITqzeWr7M9pBmJqwiSu46Aw4wN/+QcfgOvUWvbiJmBUip01RoBIjAikhQ3//JSR7N+XIUe7y+IpNsa/1QP0rwnV7k4w0JQtYNEQKIbg4ls6w0y+rbZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SA2d5QaOsp3P5kXTItGNiDsFnT1G4G/5hI3nyjrQb8=;
 b=T6frxGlaUaNjRzSe2GHCaBl8avxIkpEhsY4DF82SwT/THI4aP0Pd/XHJMS7KCjyiPaexHcJGvtu4ZIwKNdXTmdgHG+Im6ctXoze2q4KPKBDKlB5XhfEspGdtI851hCNpkJvga+2YNxKqn6WOjroxnAnptV1EOey4HrJGUMy+aa7I5+ax4/lzh2jok/aTEz6uZJqxdbP+1YCQlV0H0MZGubxX9wfPx5K2jbpG/TTG5uT9KTlAirgtiGJCADX5BruUiiksVLTegOMIDvo/ovKIgwSzvIvi7yWkRFdAniN6gehSLnUer6tnEKWKjH5kTYJLHltb3u+TRVblMhoz4buSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:21:10 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 11:21:10 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/3] rust-cross-canadian: install target-specific env scripts and fix rustlib lookup
Date: Thu, 23 Jul 2026 04:20:45 -0700
Message-ID: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 5891853d-8001-479a-1209-08dee8ac7f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|6133799003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	T6r16ORYH744qGTcRl5UglIuGmbiLXNrphr4bV7lTgz19+Aul+7P1GTCnCQaD94I6cOATc5AS2ygPXIihKW6w74qSFoq5mSXe7Dhbk3MAFBpETR+PitDAfZTxqJyxmbm/LcfPnsH6LA57Bc9kzmOGs0MsJtnzN2HfJVgbhNQS4intiEn/zm4tQEuU3CipwaQn/IxGTJDQ/mEJepxrfb10iE+f5wjnzGfBctpP/OjSC+dHbvmSwDDm3acd3js5ePDCq77TMlf5Ifd+PasIp07ACGMJ+1CURbDMoE0Gto7iNxhf2c5Zy5jkCVH4p9EGHxFPPRRS3HtSvGVTmrvuPGE7Cvgv8HY0XZ70OctayXXIvLuFGOOglK89idutuVd91zz/Nn9CuNuLxK5X+v1eNVPad3bNdBuMdAQcB//8+w8KPWcvBy0SB3ZUiu6UKNEdZqt+/9JiBSCyn6jN52G1flZLxL8lWhppq7Jle3mn9OM2NyqM7Qnl1HfsfBPZL90TtaLiyYDPQ7iKoE0tscMfxWOU8W5TwACoEZgZXlgwYigoYaZaxW0tOR6NlQO3iyotJv/O+Xik4x0HwsL8ez1KSgHXlQUxJ0qw2J5krh5SIgelKoZ/L4UypNQyTcVeYJQgGShWCiHvvAbG6oUHMugMLkZ7+YkHd8XOds6SznrBL9iRJEuDwjgSwgGW0hFS/36sLoThBTXESGXd9fiCKbKM41TGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QzJlHDNsJ6+e4YIn1Nj6mpNnrW7FMYPTd8fo9q3F6JMarhp9/vzjCjZJ091q?=
 =?us-ascii?Q?mkbhXOYevH3Mal/wc+DzvSligfNwcE0CCn03ZDpymi0jzkRWqBwv4+dCqpWK?=
 =?us-ascii?Q?NtKjiTdqNSOEXYs0U33TMN562+RiREIuz7B2qpp4x4W3Q8MIJDt2CGYj7yI1?=
 =?us-ascii?Q?mD6IWMpSJbyVFFa3WUqT5cEhe+DlBfcwwsC2TGtckVu/2dVXEo68872UbdX9?=
 =?us-ascii?Q?E+jPLKuRWznwGQ0oq7JmzgLl3IK2vrpFdgaN3Y1MVkY5ItdI7Z5AUZeE5y3h?=
 =?us-ascii?Q?dffStAo7XkHXdMi/Y1xLw9BaCEDsB4vyxk6J0+fHPFLexIrQiE1npMB5OBCG?=
 =?us-ascii?Q?+9WhBFmFzdNnUmuUu8glSTxEID8rKPxi4KgOQzPd6Im0tCzHxghwZi4Bnyhl?=
 =?us-ascii?Q?hb9pOPSGs+bqTgXfacyHJRIusO+vMl89NnRSG6bxG3LPAqSr29hOoOUM6qQw?=
 =?us-ascii?Q?mlHLLng1gi9Yun3OHKmCDj0JL33Q1pyAkUhIV4H8fllPopXJF90LUYAmqQIy?=
 =?us-ascii?Q?NzVtrx0s6lXCqpzdVH8Gi9cqgKzT+BYsQq+/K5mGvaRcid5BgWUyBmioAXub?=
 =?us-ascii?Q?hk/ruIdx3kn7ZearZp6bi2Iqp3859fWw2fRvuhwu7JMrbcQfpeTYB/WzXE/b?=
 =?us-ascii?Q?9/1WMX2L6S+vqyrbCJDpGuA3yP1hjt7GtvpiqljKQ13UGVOuyH0x9UY34xRl?=
 =?us-ascii?Q?wKPJxYFVgEBhNElndZ32ZzgRk8etY7tGVuBabQIehBA8C01aLzwY9JVAskEn?=
 =?us-ascii?Q?CT1gV5GHS+xmXxnmDBVb+gDwOCmver6qi2ypwg6sROfusCy92XnYN4C7sF5G?=
 =?us-ascii?Q?givxzRKNbPO/YZsfpz0Y1epU2+34cDzs+nNvls2npSBZG8OtmpOmtmfpr9Cy?=
 =?us-ascii?Q?Zl+caYuJBFg81b6CGwLs0zMq8sFr8d2qV4NUrxIlVUL7ZGimybuSzw0/po1G?=
 =?us-ascii?Q?Bi+CNiPY0+OuB4ePJkHJ4+hmbC7rzNNuXQ9ZtWhtPp8I2+uzbb+3ZsfqYmMo?=
 =?us-ascii?Q?9EO7ZiEmxAyiTV3T0JSCo1H0aAHLYG78F2+IFDVuRuvjfRXmTv5fpgIF4a6W?=
 =?us-ascii?Q?pB5f9Lq/Uco868fp3g4BwBbGOJYLYKQK0nNZwEp+19qZTaidQLeEP0+ZU+dq?=
 =?us-ascii?Q?cPv0UjJpcRB6txn5HBCeGL57txMt0WD4LvAytM+qM/6ogwdgJxZVVzymleC/?=
 =?us-ascii?Q?aCvs2jUd5F6u3sT1LIrNaoBowzbuOmVgCSrrOb63zQ3BqA7ITK4+Yb9iY757?=
 =?us-ascii?Q?JW1sualOP8PelCh5u/cZPSIpUgLCQe9MRITAm+39WmXut/0x8WDM0Uyb0Hwt?=
 =?us-ascii?Q?USO9aTXtdfKaHcNtO29SnbNro1mAYVOno6meIc0r7nkTlMjlzyeCqtJAcwyn?=
 =?us-ascii?Q?Moyorh9VCSX6gxNC+ebYbHaY4gPmu687AmWlq13rtJWbtjiJFcikqUobJtQU?=
 =?us-ascii?Q?kWiicyu+hRXfP6jVc003aBvF30IpsjLvnr2Gqmp0+GlKOzusTfDsupIfeuw2?=
 =?us-ascii?Q?23eSLoBY5bwf2oTk5mycpEz7nMXXKPukHD2a59OTrqRSXoa79TiXxhBi7uT3?=
 =?us-ascii?Q?dAf41/pKUudpmfuKYMtns4Y5Qp4ymQvge9LtyCLT4sCUX8+cuRyf+C+7YywH?=
 =?us-ascii?Q?cxLIzce8RNwfYjW850v2UFtOpxHTxsZ4qUiC/egg8496GppBAjYb7Qp9SpIE?=
 =?us-ascii?Q?9SJnqL5z2bNBLwz9QEGZFvzJ7gp8UE0yGo91hx2V2dvGF7TFrO2WBoLUnw7h?=
 =?us-ascii?Q?x9pvy/WfwFfrwoF0OAjNIUZT35gx25c=3D?=
X-Exchange-RoutingPolicyChecked: 
	bbwYfhqirdABAcNSU0b/uA6AoBrLwl+9Gud3DrYTQp2WMt23FBmc4Ii/P3HSjYVgduoiuqj3nCHcnPJZnxSs9JNABjVdsOXvWCmLhaSLj3dUMMJYr7AUpeieP3dJQspB+G2AiLgtHSAmug5n90iT8i9w5861M+GG7Ad2ywRoULbdTCPHCNE4Vi6GtnpZ7PPo5hImQ8YZbkwkQf1w4Hm+EUHODvFsMZnnIub5BDRvTrIe4hR1gBatJnWB5c+8p7QD3jR+cnlClDyqMyzNM1oT4dCqEO6sw7NqiOUst4EdDoufHG9Q7W9vBIAONEc1Ke7QDEo+XJmeMgyibfOQkIhTLA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5891853d-8001-479a-1209-08dee8ac7f6c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:21:10.4310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxxF90slqQYFNmL+WKxD885Vc8uqmmdtDVmA+B/s6tcWDLeSe+f26BT6W+IPihz+tlbT8qit1Kfn9UPtwNaf9151x+JOu0HUc2++yhRL4fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
X-Proofpoint-GUID: lPJSdCtPYUS0-SrVSaEgw3N1eqthcIAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfX5W1HtNaMU21c
 HNEnpicIUL2PRT8ECV1I18VpIkhPr5unU+uKzuq5K73fhrc1kw8Icgjtxxvkv4VGYGFjOeRTc98
 jkjo4u5pq6nnRmkgkHQ8eY6ezSyKQwh9r/VoXNnToEmAet3CuzYxAZLYExY4nNm+IrZfSyTPQTY
 35UufqRqRquQl+bbftFHNM3nC3vU2HU7VjLq3BEio9QNc2u2Hu5WKfrVi539Ah4hQ0znFOJDEwR
 Zd6TOMWGV9+lvocKgqblcp4TIgY7WgSFSooLft+CNBFtLdr3sTHAdxGXe3/67c4uovB2V13jjDW
 PXoD+vDC5C5v5BJlgvE9Lg5WJC3CaTWNvj7V/Bt5BOfY8x/s9L7N/M9IJuZo5JzdyGOuyLsHP3l
 xsKWo+04HD0nwmHXPqBhtW1a1UU5JJmM6G1DLzXpyHg3ZCooz2GAjjaXLDR5siQv5AOY4lOOxGF
 rZBN5vOeJrDRJKUoTbg==
X-Proofpoint-ORIG-GUID: lPJSdCtPYUS0-SrVSaEgw3N1eqthcIAV
X-Authority-Analysis: v=2.4 cv=T7m8ifKQ c=1 sm=1 tr=0 ts=6a61f929 cx=c_pps
 a=Et1EcG/LeKhR1br1BBFfMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=dP0rivtKMYtKtO4shKIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfX31nSrD5l7u5M
 ygw+xWoJ+5iUex7W3XoQZq0eApynA6WF/Wvv5psLBFPEr0CpGc2dW1j4r0ivklRT7OzN3RgTU3N
 4tgox2SXvMsI7/gUXZNWMqOT1r8RCXO79b0nDN0ipk84Oxk2hu74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241823

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.

Store the generated environment setup script in a target-specific
subdirectory so that sourcing the SDK environment always loads the
matching script for the selected target, avoiding accidental reuse of
the 64-bit configuration when building for a 32-bit target.

Also update `CARGO_TARGET_<TRIPLE>_RUSTFLAGS` to add an explicit
`-L` search path to the target `rustlib` directory inside the sysroot.
The path is selected dynamically based on the multilib configuration,
choosing `lib` for 32-bit targets and `lib64` for 64-bit targets. This
ensures Cargo can locate the correct target-specific Rust libraries
during cross-compilation with the cross-canadian toolchain.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust/rust-cross-canadian.inc               | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f083bcda82..0c60a90d17 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,14 +51,26 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_SYS}
+    mkdir -p "${ENV_SETUP_DIR}"
     RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export RUST_TARGET_SYS_VALUE="${RUST_TARGET_SYS}"
+	if echo "${MULTILIBS}" | grep -q "multilib:"; then
+		if echo "${RUST_TARGET_SYS}" | grep -qE '(32)'; then
+			LIBDIR="lib"
+		else
+			LIBDIR="lib64"
+		fi
+	else
+		# multilib not enabled
+		LIBDIR="lib"
+	fi
+	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/\${LIBDIR}/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
 	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
-- 
2.51.0


