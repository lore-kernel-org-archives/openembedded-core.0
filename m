Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6344AC3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 05:35:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43220.1744608916121395434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 22:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5K7ta015814
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58hkvj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xH7A5YQcyq2uIDfqVRxncG37nZ/X2RESy6DF7tjAM3DAN/MBresVb6qOITOI5apxMYA7azu4QzBpPVT01NihgmvFcYBIrMsM3j88ljuapNINw5UCYpXJaTFa+HchU07Ga0QbWyF5OQb1lIogRqD+Z0QppeuvrzGqYHglIwZ2/3K6Z21sV3+PVbeJc0wggfZNZiIMdJrERgTY3mgxD3evpoDxt/cL0lK/wyVjDpQc2YU9bW0Y71PER2XaRpLIH8YXAFuUBbDwVEJh7oB5BizXHeZ/lTp+ntsNBn4pHIoULWwINQDvvkqrA/OryJv5Xncng8+RBTF9a/cLz7ooC0PH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgluiA3iazkC9ftPYFWE7I4GTu2G22pkeJRppis9Q7M=;
 b=SDLol4iILi7dU2MX/rMcn6z5hrP7TLL6GvTo3K+WP+/ctVxdv9zAfHLc/uyt7Ve3fsDCi40LtxitvFM+ABoJ34Pc+xOgdf3XrVlmKh8gP3iBQcvIDtC1Q5gv5FNg2KFT0I41nml3loHjSG9WEeI2cgsCIP9bAJS4WmxR7MlEGz+G3rp7Viii3gCXBxRyStUPXvT4e5KbwWz+xKavaSkolknjFCVTUOZAKM1upLYPoCy1maw0lZSadfZ7NxqWXY/FmFyfmSb2lAkmE5a641LjU8KNq89IEfTndIlCvh0Tvt479Nt3AbRb18BLfts1miZsLgGJI+grcRUBN7+s/Ao3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH3PPF066A3CD44.namprd11.prod.outlook.com (2603:10b6:518:1::d07) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 05:35:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 05:35:10 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3 2/5] cpio: fix ptest-runner dependency
Date: Sun, 13 Apr 2025 22:35:00 -0700
Message-ID: <20250414053503.1180029-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414053503.1180029-1-Qi.Chen@windriver.com>
References: <20250414053503.1180029-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:510:325::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH3PPF066A3CD44:EE_
X-MS-Office365-Filtering-Correlation-Id: c25dd016-acbc-4c19-430d-08dd7b161f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wF7+U4qYr9a37Nw+JgVX2dfNG7jYRWOnXL4Cz26CdV+mZsPoL9oNdNGGJvnM?=
 =?us-ascii?Q?Kh7Ci5qT6FVXrot8wmlBSRYBr4OYhemAcs1VdOqvDEbNOT/U3rmdUKn7j2SM?=
 =?us-ascii?Q?+uRtNGHO27o8UcoikPx2TjsxCYIgHj8PDw3De68AbBBgx9cd8GSigaoJeF6+?=
 =?us-ascii?Q?SA8RcPuzshuEm6GLRJP3AtotfpoBv4ewpz7iAd4Ah5yH3y427i/x8goLCCGP?=
 =?us-ascii?Q?LE+0rByHxFtWFUyihN4Sh1qTZKAhvr5ov7PY9tcVsaY8uWb+FTPa9fyMrNXh?=
 =?us-ascii?Q?Wgag6aX4RY64qt96MsTdpIplEW4xhKpkJGF+xzxs9BXPEL2DYZ9r7LHgzhwz?=
 =?us-ascii?Q?cc3vAVuSeQQSxTRmCbDnzG1Hyyx0iqtztcD4S2xf5x0G9DqgLnze/D4XMMp6?=
 =?us-ascii?Q?YfVpIdp8YoXDg2yG5QwIlq3LOR7IOSoKmHfVzCihLqyH8s8M2E0d7jrfAqgk?=
 =?us-ascii?Q?zryJRqO/xSoBQz885bNiRFvSX6SnAAmE1EOz5xuMB/fgVWp5KqTnY70Qx4+0?=
 =?us-ascii?Q?ET4f80/uI6hJAhJiYiZGsoxfMJoKEkPGbTcDV7TSAwnyIhRMto4ZXKK6VrFV?=
 =?us-ascii?Q?fFn/Sb7EEAorx/j9dnjbqYw+coB70lH5sD3nQ5/Bc5pyXJdnpcwEaG8QlgPg?=
 =?us-ascii?Q?tbMtvGPVPkEq7iSInFPmZVXkZwziDvMsRHV7zD6wbt+89o/bnF2Gv/zRUkTo?=
 =?us-ascii?Q?xoQek0XaigPCW/SKXahJLRvKZmPGlL7BOMD8PUAc5JGkoTAEArBZeFy6+ogX?=
 =?us-ascii?Q?HaPWsY/OfdAeIqMn8yiWfY4RBvdPujsA3BKXZbC1DVQ8WF9JyehLTJJ9raYu?=
 =?us-ascii?Q?rDBXtz9UuG3LCghLb06COiyg2PH7KRta6M0+WxIKlcE1H58WeSvDd/py98yd?=
 =?us-ascii?Q?QAYPF1AQV95Zwc5SFLTy2iIXmpslfUFQpwHWopOCI2tsqo1BIAvqEG/KV/ex?=
 =?us-ascii?Q?kUqjwiJSTmsRpmgWlXkvTanpnTxBDR4J7iXqUxi4ZIz4EWyVVG3bL2Tj+f20?=
 =?us-ascii?Q?8RB6W4fH/sWkT2abJroFczEeYXMrH1F6X7LwvDo4nK7KGd954nmmfYaYKqsw?=
 =?us-ascii?Q?ZcBsF+aRhwHBJoyQ+PZR/6SkVu3oyMnI3Kgo7cSmJ6Au5UXGfxsxyGOQCDBA?=
 =?us-ascii?Q?TfSccQareyHyerI9c4SRfj91+me5gfUu2RWXsBcy/1U4NEjb/tUhZOfyQhXA?=
 =?us-ascii?Q?TqABKA5hzM+RxYgRAIppBWu+rHJqqTkteWE5vIfhdwXO39b0QIZPy5esw9WQ?=
 =?us-ascii?Q?Q0pDpylxpSKFmQeXZIKSjvK3bo3CvIq+X3a/IXdPj5JOLy6sC3LFIH/9adwN?=
 =?us-ascii?Q?m0g/cIes/BxNLEuwBjn5mMV7MxZl2ozbVBtoLplgIneOUoemEqPP8RfqERI0?=
 =?us-ascii?Q?V8TeDunLMlJZm+gSZrs1K2gRIUENOZF+mxKkOz4rFyOoKbmRDRE+Lp2hw1O4?=
 =?us-ascii?Q?ucLLAVJWE/D7MYQkBwbTg5jiF2eoY2p0T1pNXNTPvakKW+SVgb3wJg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OXsWibwvymo8k2duvrzolyz5Ow7mxO5M+MNY7ysKBXxGm4XrbbQUkC3dnOGl?=
 =?us-ascii?Q?xKZzbKkK5kZFFcoE5DU6UUn6TsTu3j+y9FIGSA7DH9o0QSyisJNknzVEHOgn?=
 =?us-ascii?Q?Vx+OQDVBSVOznPrEEV8tucsuHPCES+GVYDf2sdiTa8IMgWnl00DRCm6keE/o?=
 =?us-ascii?Q?Nrt8ylRg7jAP/8GuOXNPqpC4BfpsiDVWNGBvntJX3bnPNAHHEi29QbW3xccB?=
 =?us-ascii?Q?ROgZLGomjFYeqCT/REogOMLPzataPTyaFnSvxqCuzqa7YsxdqF4CgzJJEPRx?=
 =?us-ascii?Q?wVOksJZJX/o5ixIpNR1lf+vSdQDtBfCaBpP8IHX3fhbUeBTwxqtM89qTKLoF?=
 =?us-ascii?Q?qgaES1lySqvScz9RZEB3GysescXcaDsWPw5e5TMqr1N8YZ4UTjP0BTRYDSXf?=
 =?us-ascii?Q?hCYGSno17C00CIh41/re1Ee0BhXJIe8/i9QSz/0pggZtNawaZHEFyNZUPRns?=
 =?us-ascii?Q?FvBuGwit54ZlvJvAkm0LeTDSVoegN24Yz/NcWQ1jDQ2KRoOuu8OZ8YXcRhbR?=
 =?us-ascii?Q?L+c2k4JxicAiFmwrAOsI8jvqGS80VP0vTXF/hsypFSaai+N3T7he06SEoGFZ?=
 =?us-ascii?Q?v5E2yFSCxniTBLZfosir4NQKsoPHBPRpro7s6TkAym1P8X/p8aT1pCEMYzso?=
 =?us-ascii?Q?WSpJH9D1ev8RNkvR+0174d/SYHxriG15Yf+zU0ktqzmsE+pgqfOuL1I5oN/C?=
 =?us-ascii?Q?+Br0cwCjXrrgW1q5Zsuai4hwy2SWZtIDNBekFsoMaCtEHylQt8KCKcQkfHYd?=
 =?us-ascii?Q?QyWmxXva6nIs302SdTI+PtAKNvizCgH9ltXq/qSJaAMEBRUjbIoPzA/jGe+x?=
 =?us-ascii?Q?CAMy6XqtSyyS67p2B2Rpg/o5fZzUsYK+9C5bYhsoiVKrLxZ+tTbkltju5m8T?=
 =?us-ascii?Q?Ua1EbBX0QqS0mJ3FIRPnbvxMI17QCZm3fO53M+ZasnuBRp6YzN7pXbfeOEtR?=
 =?us-ascii?Q?mKMeOXKi99J/dYcliDeMAfJrp0qj4f3Y/Hn3DwDjHoNYm+vVO+bYxSGUyftR?=
 =?us-ascii?Q?V9GzQifnZhN0s3VNbKfexSTwwMIxIk4PzfodWTdF4GreP3RCTzqxG7GNw4Mq?=
 =?us-ascii?Q?LYWGVizqcXPdDu7G7jKJioJWk75N6bIwYohdPYta2/82gQvQJ4gcSD1PwIRu?=
 =?us-ascii?Q?howavOX5zkXVh41bcAFulTEZ9RsdJ/U20uKVKqYrMbKBhPGDD3zZTWOIlGWa?=
 =?us-ascii?Q?PjSL6kx0T4nGt46tkBq9jyJIlb0BUOiwUOW+gJJIQsH3+cYuXVyGw8am0DYl?=
 =?us-ascii?Q?7RAeiIIObJEXFXB7YZBqeEJO75CHLRY50rkfwEZ+GATQQtoacfW55QfGjKDp?=
 =?us-ascii?Q?FTV9wei9Yn2Ax+6NcYRwTVAbKrHtdfrzzN4I22suVe1bPSOsWy+PANavUzqy?=
 =?us-ascii?Q?9o/Och3xg07tL96RFtJLydLJfp5nDJJjYaOxR9UfA2ALJsZQFWgRzbeX/TOt?=
 =?us-ascii?Q?lQ/tB7BPZhcvUgkHnKBiIZ9bYE1qqanBO1IHqcHbIYZoAF5hHMjce1RXGg7F?=
 =?us-ascii?Q?wn0PokZRUYyk395qx27m/OL4ePTdFpyw8FB3eDIOhW5jo1wZ4Q+5IWQxLZXQ?=
 =?us-ascii?Q?CHsuSkCyUREqYgz0KDQDivMECjyC1iYw+ul+LlSZSCX0+la5VnptBFZF9L4m?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25dd016-acbc-4c19-430d-08dd7b161f57
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 05:35:10.3349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uldm8B79gciyoMV7+FkCbiAH4YeTLuEVAfkQ76JiuPeGTAuVpw0pJe/bCq/mkwFPoXszyMCct/LIS3aWgDtQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF066A3CD44
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fc9e93 cx=c_pps a=OnljjeCONrlUuPUItWmgXA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=KwLHvCn-_DKJmQUzVCEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EN1IgkxoGJoTDIji8tA3Adhd0-qx4T0B
X-Proofpoint-ORIG-GUID: EN1IgkxoGJoTDIji8tA3Adhd0-qx4T0B
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=666 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 05:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214793

From: Chen Qi <Qi.Chen@windriver.com>

ptest is only meaningful for target. So we need to specify class-target
override to ensure correct dependency.

Also, the above DEPENDS:append:class-targets lacks a leading whitespace,
add it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index b081bd53db..0b13ba103f 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -66,8 +66,8 @@ do_install_ptest_base:append() {
 }
 
 # The tests need to run as a non-root user, so pull in the ptest user
-DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
-PACKAGE_WRITE_DEPS += "ptest-runner"
+DEPENDS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
+PACKAGE_WRITE_DEPS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
 
 RDEPENDS:${PN}-ptest += "ptest-runner"
 
-- 
2.49.0


