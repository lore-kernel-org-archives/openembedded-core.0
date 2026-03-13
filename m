Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BFE107BCC8
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19271.1773417614617543798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gDtBGriA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DExYpq193742
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DnZZNFzUTpfBEtnx9OxrT0+SuEYby/5CpI2YFRg8TuI=; b=
	gDtBGriAomTMiECiKkRrIy4euMm8GcfS65RQf4KU4JzcYqEV1fIx1NYrO4hDFXRw
	7BCTjdSL6aVxEBr/dZ7sxuPE+0B6Df02sgfS5PtSIrqCN0MPTXupbXf2ELOwWmKE
	l76x0iT0gvSq5A3SGrRkw0Gmo9FBzfM2dGkLLO6meDvvRLC+X/f+1+NcAagrediH
	CiVZyDqSvExOKMDBARcvvyVfwUBjlWcr+0X4+Nmb2WH+5az9V3LICz5ZyPgR5YVc
	0GWNeNnrXQ3GbLOdNt+IK2bEIjarraTcey0iIRyIhBw1zJjcl0Ns54fCMr2ZydTs
	RwPvEDlAozdFuMoQaC32Cw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvk8nr5p2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 16:00:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3dfEpk09LFg7m/5BYwjn3JkzQ4+zgUarEMehE1yfbP4IIR3DxvWEdIfRsG7GwuWQdruEV7LKfR8LN+JAHsLzA43PiBYSr0rF4Mn+nIzpK5rRWfS+9cBjw4cI0nRFKxmTKjI9oi2rrLY9YobKRcKjcxgZSNcSawBaQXnTjU/w5s506fsoIb89zf9ikOLqhN45kNaAEss+IZ791g9o0s+L215xh4JmhWSGy+dsf9VBZjk3K7zPwbhP8dCcPuZlqrLMN7bBvHlRaV0TAowVzLTQLCDZLKjqF8OzpXEuq9/3QEyNW2Jfq4/9Z1aWBCFT0WFNfYyoPpErTHRZozEKHwGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnZZNFzUTpfBEtnx9OxrT0+SuEYby/5CpI2YFRg8TuI=;
 b=cVFZ1yIAOOt+dnjCMTTHQoJMBHkHyqSl6aYVNXCFbxafIZCN3QzqqFhx8bSK9PCAYecjA+vkLqem+XYH670jY9SEukqaLk646yNd2xSc0X+Kyj034omkWy3/gQ72uN8Qx8WpkVVWr1TusXSfwXIT0HvccDPvhDpyKNP7QmXsjIy2SwjcWVURdosU9olG/y4/bD9k6eccDlNLJKg5OONU1uIlNwD7NMwwOZVPe1A2Q6q5ICJHugFlH9Fcv6U7r0Lhl/9OhZzlhfe1CKhQiRDoSM4FzeJJHodyKStoiYYTzpGbT2LYaXOMzJypQ0ENw0iwAWogU2YynDYqivTr3e+yeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:09 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:09 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 13/14] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Fri, 13 Mar 2026 08:59:19 -0700
Message-ID: <20260313155920.2347101-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf8dca4-719a-4c32-51a6-08de81199a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	cfpWg94sJOYIViMf7SSS5B2mp3Ak+O1CKp3RGPEdm+WlSKJeWTRnpgTFagxOTf3d+YogOqOzSNVut+DgHssMs8prh7QIB/+x4jivRAekDd2JcjgiKeDQkfPxarZQWPOPoFHk1IVssBi+QWicvzav/FDwFK4pmbB1Y4C9c+BHNky/L7HjQn3hQ73nY3Az5W6zQlohpjLUGkKEaiWoTNP16aAi+fHRQYyPzBc0QE0qwe29QnJhaP0B9a3YWe7f1zbxqOHJVZiBPLVs8Q3gTwCFp0mPbARrNiCTYwUJBSnx8TSJu51HF16hdDtEowfOgp3pExJ8zHcdRXcAgtUtpMx/qeEU8U+G9l04aKiXu3lCk8bYjnkkWcfyXrlpc4dDa9L/rMzhUQt2qtYQhPMTxiB/zgqPYGafXFkiVgpfUM5WXdZaqJ53XmoYOF7IOm8o3LonIm86MrrT8MyOZRt++CgUt2AmFgAO16lhluuYscQw8DU9CW6PAbTf6iqNH5ruHdU77v057Hw+8NTiOVhEnnr9ioo5m4Lvp7exzr3GORD3MTknNlP5QPFEECl74pRysTuhPt677bwyepDx5H/BXip0cmCSNbx/1IodeGWUUAVpZg3sHz+CmKZhZjEcRQMGZIUmWg23DLN2oTVixEoIdbjCphYXo2aWn13CVoKnoFGZBt3YNoDVTSfD/wi7buJb6GYhuQEm4VBozL0qA4gQIUiFZDBLGOH9z5bTWfWwRlSxgFmrY7m+acDQcirJpOxIYwljThAGNaz1KEypkSwO83lfYPJdA3E8vyg62Wlle77dSvQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RvWOJFwn3B4Q49/2DzmRXSPIFtx6Z48VNbvOiNbldjGDdsIs9sCVZFhaj/F9?=
 =?us-ascii?Q?zqf1Q+gGu72XtfAanqaCP6ZSPLqyZ4zr0gbBSOwONy/rVQPdTMb03i6n9ZV2?=
 =?us-ascii?Q?HlZxsDLWTdeSZFArVhLHtPFjo4XRNfcEHkZlM7/LmCoLSXRc5sHjQerzzXLA?=
 =?us-ascii?Q?U58WxUjlRZ1LtRPLg4/DLRG4gMpxGYiR//iJb1VPBAjxHlYhH68y4Pkv4cfJ?=
 =?us-ascii?Q?/zJWzebSq6Xz+G62+wR2J19uXH+GeYiv2jDB63KkxD+c7sdVd9rzY+TjnaMn?=
 =?us-ascii?Q?PX1IUMFrXmat1p9V+CGqv0gn5hCs/4lfj95FSlWpdhvCf+OHpe+LKCEZlCP5?=
 =?us-ascii?Q?+L2glQ3symsf5j6U3CbC3beCF+IeDYzy3lAl8mIBKFcOPRaBc2diD9z87aEW?=
 =?us-ascii?Q?KE6Vv3QWXf+hXz0tkKUFJdlsLxdfO8cUS3H+m5epNT1v0yGXhOS121f572SJ?=
 =?us-ascii?Q?dQcJnwqEdVEv6RZOAKbmnJOE695kGjQgadUnJGSBi/fmkmBOyFIE2IMj3C1O?=
 =?us-ascii?Q?2JBHa2nPX4hYCvOWsdEWf/Wd0IHTkhAzqpYcklnFFBkfvi0Bm/OhXyn7zCi1?=
 =?us-ascii?Q?W0TqJjmZEoyT5r+QYX34jjBGC0CFvWMyEVAX1QUxoX+eHfp7dBsnRwtv1K65?=
 =?us-ascii?Q?Xo8KxzQN80ev8DJig9UDnH1Yg3lJrpcLe9VDx4JyMQO/UYqbgbhOm9LTeHBu?=
 =?us-ascii?Q?GzI0HhRZ4w+XrvN6CXWaTBIV0y6rXJ/u5m5IoQ0bqiWCF18gKYcdCFuFC9zo?=
 =?us-ascii?Q?DtQss8JTstAoiKH5U0ZgHp0BsxEwdIPiYV30/LNnJ4pGyzKjixJk6y/g3Mv/?=
 =?us-ascii?Q?bFe7j+DT2a3+wbVTTMesnaY0+vxVOAwwb8FKRqoRE+1I6gV1s/cxICk2F2z5?=
 =?us-ascii?Q?S5VnvhB76oaNknTIVG1Ll6d4Tn3xA0owZWXOq9iW79gRn0FYwI5p0AkOhTS0?=
 =?us-ascii?Q?2Xu9wB+QCe0MkSSLrqxVMaBIYenbD2BlM+nxhLiTcWWnRl8Nc/6FCm5cicvm?=
 =?us-ascii?Q?4DZoxcCcehzZRhNshNu5C96502D0Tr6hVjzsYn+dJRUtrvN/fLEhnNNUA0iN?=
 =?us-ascii?Q?dwIxktW2OnFw42RsJQrexmaqcRDu67/zJ/fZgFxdLS8kQyy3CYVbxzh2wgKq?=
 =?us-ascii?Q?gBU/BFiQGXwq5CwEV7RtKryK1U4l1taPJbWfpNYqOTkJICZBMKI8mrUsNlmv?=
 =?us-ascii?Q?S2i9hFWEkkK9XZ3FSd+n25NKpDWtV6T9SrzF8y734CwD53L3xyzIwHXcJSGr?=
 =?us-ascii?Q?DStqdMV5kF19TKIYPDGleyyOBdih/1UGkIzC1VjfAgwCdat6woNx1MMoK0XW?=
 =?us-ascii?Q?cvh8+oEUhV9eCzmLYTO5ZrB5dySxJ5JKUO6du/XpV4UFGof6FVvl2ehK23nh?=
 =?us-ascii?Q?WmrSbaNpNpsDdxClDK8ag++ZhqQ0V43rXrp8bgahk1BwWylaR4sanTvFyMZZ?=
 =?us-ascii?Q?dGFd3y7/stvovPReKkFOGqj7+VjZPTI8WrnM0Pu8nxc2Rq3fM6v3uK6Ek7ig?=
 =?us-ascii?Q?6kcpH/cWi+urkwnF0MSSiks0Gr27PI7rW42OYMbqg55SkNgxE+fRV4C8xDPt?=
 =?us-ascii?Q?s0jOKPeggTfHjhHwSc6y0FzMdsw8j2yjYz/OLJ+nh+ZaiCtXrUvhO4Hgjtgi?=
 =?us-ascii?Q?ApsH+X7ZO9YKkbQBsQY6/OrrNy2zzwFiWtMMrpOCKG47WMM8hr5V9H0bZbuB?=
 =?us-ascii?Q?WAPahMbmNh6idi8GjpylnZyvxMpWR8bP/yrf9PeuskLNAWnKFgXl4Y7To4RS?=
 =?us-ascii?Q?hiYV6Qwp3BVcotAh9zhqzm6SSP27uGg=3D?=
X-Exchange-RoutingPolicyChecked: 
	DJNoAhfcaWgc1ghiDejGUTd9PgF1QFswmWpkKWJkOemj3Kw8Mt8wwGxhwzKRERBzAZXfMT0fAy6+xGxYGSflcTdPRtQgcsrVwxRPOT9adOm/NVOcC+PEIqWMOxYfhqbS7VxFAFLKxj/Wn3RSqJKMOwBTwwgDT5P/lbIJ7c55FQ+U0UnpSoXMwcnfONxHp6MqwP9n4D4KSMS6ApHDCLojo9WDJO+WIvd0AgB+736OBlmX/IqPsD5mNfgvFSkA/OrEImOTHa86k0Pc6UDUbdolVNPF+QvznLOjUOG85TSHaAgRfgKYDd4NjRb2Tof3hJrly3jptW7C65ggO2uCTm0XNg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf8dca4-719a-4c32-51a6-08de81199a46
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:09.7385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTPMCSpvXTNz1gSc2Uv1jcLnYrj/VYcBLXLOx+HWVYCCjOGAfKYC8QfGi4VLdWBzpE7fwLSOoIWUwGlDU7PqWSGUHRsoS/uKrYfN5qSLNgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfXzv9VcFH9hcR2
 SbaY9ZiHSHjmx/8rM58HEg28rFHOLuXjRGF9twCjVpeASiZwx+d5tOWuO4VewGPraRj2+PUtkZl
 Gln8PXRZASjJ0Z8ZdWd8XefFPM4SQpiTMCPh0ZdTXN2vajKpVImpu8HJJseI2z9Nz/5ydylJfcH
 +QQq8xkHcc1Bi7Jbke7M3yxOrxOJoqQ0sIMz66YdamY12FVmgAPEzm3A5FrAayRXv9S/VYoJQgu
 pp2sMx+W2U1AXS1qvtO+UP2k/LWsrARyjFRhTSWewSp6PpOTTvCLenEJ3tbjVdmrxyTVmGWtuCV
 pqyoNFoJ/B2P4XvGI+DvxuLcx9kxh6Z7U91K6G0GNJsiVTaqLlP5XRyd9jFvNa5VSKUAPEC3TgW
 QB3pANGPl7Uftfu4M6U/pLOfHV7H1SRFDuRBode9mKGB/LJawLwicfl6nExVZmNBa3S1pqOggO7
 o9fgtkOMG/23NyC9H7g==
X-Authority-Analysis: v=2.4 cv=Vsguwu2n c=1 sm=1 tr=0 ts=69b4348d cx=c_pps
 a=N6h9FcIU3O7PIE8+NyeJww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=UhGsRKG8cyjctxJ2D5cA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BJXXY7jUnkYl1pENAsrpWXnn1MmqHT7Z
X-Proofpoint-ORIG-GUID: sJFMzkzQuUmBEbhLb03M1_Rc8IMX7Xkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233060

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 5fbc5c2154..656d6e8f5f 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -43,3 +43,10 @@ do_configure() {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this
 CCACHE_DISABLE ?= "{@bb.utils.contains('KERNEL_FEATURES', 'rust', "1", "0", d)}"
+
+#Fixes buildpath issues when compiling rust-out-of-tree module
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = ' KRUSTFLAGS="${KRUSTFLAGS}"'
-- 
2.49.0


