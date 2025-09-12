Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C21BCAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 03:33:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7390.1757648021830673803
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 20:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LQM0LuCh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1350ab43ad=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C2Zg2M247567
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=axidoPMH0/BLqo30zmzTPhQ2R7eTlCcQBmjiFt3bI6Q=; b=LQM0LuChE524
	OewVKvQkllWx4Le7rDGlblMRBDTNED9p+7LY+efUg8G6yEAa3UyzMyl2lADwObHu
	vqgWdPV85NhEjhS6bRUyKBFLAX6PzfNJmyRxmPed3DRaytiOYplUg4maAEZhG+a9
	HpbMgZLnFQdJopKy7+u2K0pJKem6EPYixY+9wI5mK0iznDbJKk6/VPv2DssXxCdY
	hnMRVHA8sTRp9jbZz3yVezN/v1uNoOUHrIo0OIZgGin4KV2B3L6HbspQE1l02EBn
	xy6bmnjhF0n5ljOPAg0FFCd6UBUTwJ6eVe/F8rBhTp3WBvBomoSvxaEK9z4VSok+
	8K4jJzOUOQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve35ckt-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGv/YmmLCwPpR0214vY7nxSUuUpJPor5Md76iFT8qJo0WyVrW3PrikL9Qdx/4WJ7yuCtk046YfZZ7wRmOiSrHBbeTRwn6mO/dKyCxKKXHxrJ/L29gU0TtwVDQQElgj1qH07oJtdF4BPdhrdfC7AP24rE5dRE+RNT/0dsDgELINMUSEl4olFdtc6qTKxwzQzo9mYEdfu3PTMPXC/BZBAwlacWFnlpIR6RDfzmoFhWO1uUGN7PwLWdgxqskL/6paChEEhHDkMRYTu+5by01uRQFS7P7Ay4ig23nOOEGd6u84vFas1Rb1zRbH61AMpnRKf5/VwI7sxCBrxZaSmNOIK1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axidoPMH0/BLqo30zmzTPhQ2R7eTlCcQBmjiFt3bI6Q=;
 b=jjPnhDOPFNAT+K0Qsos9j7jHuFKDiE1hxxYRB8l3AqSJC8Ru136jXRtHqTqilfCCPIwxAMXuIF3JUYyCD68i0D29mH5DiDdsvP7dStuvyeISrdkn6Bl5GZ0wj/3XKm6efCudAr5ULlsXLObn+PXwqHmLugmzx5+Bov9Ox6ECJY63tvlaugM0BWwg7ZLwONBn9yTxlG4R6PqWUfRQd5Tj5ZrIO33Tf4pVu6UjVOrHWJqwM3jlpYzwHPUs0C4BbTLKNy9tIt1H1m0IdI7gOCUzNUsjzWU3Du7bKy6s8RS3s4li6PmHSCKECkfcaTSxCg8Q7gvyU9fzONLRLL3kenL44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9376.namprd11.prod.outlook.com (2603:10b6:208:570::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 03:33:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 03:33:38 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] package_manager/deb: give out useful reason about an unmatched package
Date: Thu, 11 Sep 2025 20:33:24 -0700
Message-ID: <20250912033325.2887890-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912033325.2887890-1-Qi.Chen@windriver.com>
References: <20250912033325.2887890-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9376:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b863581-8ae3-48cc-e44a-08ddf1ad2971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V4OiF73f/i/Qz/9D48rWTyTMXn8ewjHvBxBg/GJ83PfdR4FJjErmEHKjZJCv?=
 =?us-ascii?Q?UctadiioY+LUXd5HTJPjZUv9zmLwHf1p1kvi6SuZ0xkiEbYcbm8nG4LbYR+h?=
 =?us-ascii?Q?vP/Syqy0+bQSiYwQkgKfgFqCO/WaAL1khtgunGWL5S+KAQqCAeL5S3d+W5So?=
 =?us-ascii?Q?qzbMHxWP+DzHEqrj38oynwlUsgksfTBa8H8NLesckIvcBPYcPGaOo3kmLvjs?=
 =?us-ascii?Q?JjY06w7QYn7dWyboDarzpqx0j7fHxuR7bqSRFYSk9tszMCJ7IPZDBDqo4EZT?=
 =?us-ascii?Q?5AUlYrCh1erNsKDZlAM7TI3oDv6IE3mid7WpRiHPMU6A1+LHoWEITdzbYP2G?=
 =?us-ascii?Q?IVon8piGUJBzFVjUpHo0Eq0P+Oop10RW6b8yXniKRW24Ps/qA2DyJjyquhfI?=
 =?us-ascii?Q?HyAY7XbrQTTra0tWPKkpWqL0G7I0mfa5bjp3t1bSP0nW5+SFB8STZlGd91y2?=
 =?us-ascii?Q?u+LE1BVUno17wAzBSl4x5Otn2E3HKH+9xoxMvJo6iq7qFb+r/X6UkqrN8lsn?=
 =?us-ascii?Q?0mqYOggkCgh83TqO9QHoVvL11V92iyr/vVBgdE1nHiSVNhdaBoHhrfVXpqD+?=
 =?us-ascii?Q?ZaC+VPirztCf/sx7aov27jzh2jq+SzcNcZ4Hq4nd8U+ob5MgWp+9oXGO1qrg?=
 =?us-ascii?Q?C8NvOUbU1VhNgmHDw5j4L1IsEZ5uOE1y2kGVnk87kI+JXcNfAAaqhGcoN0Mp?=
 =?us-ascii?Q?2jVV9VQQ+Kr9cvF4MfaPeGHSbLOTPWaYy6yfBYaPNVMfxpioT06WDehc2ltQ?=
 =?us-ascii?Q?QuRkCWWDnVwAE0CXYeqgbsbwX6bAop1N/rvq6UBgKNKLuGgQlElB+3dABrYC?=
 =?us-ascii?Q?fmV0l9NwdjgUoOLqgmyyPs4/0+t+U22VG5zhPOOB1JwCbskgkTHOaP6CtBjc?=
 =?us-ascii?Q?EHeEEJ5tx0cuWM18SGpjpn58Ox7c84+NG2E2zGEzfgK8dOZORb+LXYpeTe82?=
 =?us-ascii?Q?9NqARd6Cn1fUmBeWVzMlyc9FN8w0JhYfvj+entlPsVx8fWJ+ORNNd1rWDvcd?=
 =?us-ascii?Q?UE8/0+IdpY47FrL/qIiGuEVcI9tFUegJlU6/odSvzd/KTWlL1AIWJTg6obgX?=
 =?us-ascii?Q?rv6VvDbz4Nivv6E7GHlAApVRQr4yNdk97a6io05pjYmhgyYGm62iOXSMJwhu?=
 =?us-ascii?Q?qjAXxnibvVykLkS6xPolerJMIypEX8MhOID9O/JHOkirzgznDo/4iN7CdEvK?=
 =?us-ascii?Q?z42BgRGbFc8Oorq2+XF0G+lma2odCsrLgStYMD5KDPsjgtoaBa62P/YdLfke?=
 =?us-ascii?Q?0yznzWlJ5H/lZ+jLm8AgwcSX7z33OSfFCoZbHkCrRINYHOzYjulUdqVA/qGh?=
 =?us-ascii?Q?iM8CwqSpvQvO7NK4Dm6nQKKD7awEqYgcCRUV+glPBO/ygwWP1Gu0zO3jyE7y?=
 =?us-ascii?Q?Lm/xr5UbF2H1Tv9Wc85kLplamw+qeTzFYnVk0sF1OnUZqTIFUGkABvUDulVE?=
 =?us-ascii?Q?u5llDC+E4Nt5LR3dgYXPQIK4ZS6vtHsgoIo3q1FoxqmO7H5mJq3WRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZGXWw3F2Fh7fn8VhXzRklabHbQoYMDLyFIjEsht2A7QMSOc1FmMmyqcApz6b?=
 =?us-ascii?Q?g1c3yJ7g/vgoxFR2SbX/pZynL1br0kEVcptdQ+iUUm2M2VvlX18zrktygRbo?=
 =?us-ascii?Q?KC86bmBnhKHLYOHTet1xhkSHk3wXsaLoyrvBiqJb/TERwA70dsWt/aCtlVR7?=
 =?us-ascii?Q?DFYwYUQEfMYYAX/p3i2PkG8Qw/i7DYzf0EiHQYU2TDMDZ9ocRRAOX9XxZXbJ?=
 =?us-ascii?Q?bq6DcoCm1Xhf5UuKKBctJkuIW5N8AjfGS6NtGLLvuxYF42wpmNmrjnDnAg/B?=
 =?us-ascii?Q?Crg3plROYYI67+jwNVEwdr5AlpL+cWdLx0CQ5K7fNHPsi2C5vD5t/ZlOqRYV?=
 =?us-ascii?Q?tAxuOfawQiyD1oyViG2p60SqGl2PoSXiHigUNdKUbhE1IZZxqkribIaS4Sry?=
 =?us-ascii?Q?gVv/22GAbU0zWvpxYxwI+oGziEwu2pMHe/+fJ2F/fEsvyhV+xnWgMgP2R4Pz?=
 =?us-ascii?Q?hG53UV09vU2Q4NYKu1BdOjnFaB9HrWErsD6n/ZptpmlfwGTXlcZeXRHvB6WR?=
 =?us-ascii?Q?XvU38G4g+Ajd/mHBYTZpxEBYLZCeU68Hv+81jt3K/hLPGUUrIMxczMyMr6Jy?=
 =?us-ascii?Q?xblvv8QkWqrMbHzuBHrQXk7ByI9zdVGwn4dd92Rf6zpqXJQR11PDbxlQbtLu?=
 =?us-ascii?Q?ZRId9GbPziLkptOeYH1CfEMfQP+NzSDRZQEMQVvGfYX6KKm3ttfemSgmiPaQ?=
 =?us-ascii?Q?PKPKCJpgmZVwD33rkLVB/V6QBoi0C58cZ9i6/JNWqXBLUkxrRYpb42b9wPRX?=
 =?us-ascii?Q?jtNXy5MJdCUSZtrZMH7gxLolqqPaQa1qZP9qvj+Av1syGoSInlsIlJpp6wdr?=
 =?us-ascii?Q?wVFPymozIZEKGR2f/tScyplSWkbhBeuVCpPW427kvi9I3JxV7yp3oqH5M9iy?=
 =?us-ascii?Q?C1S1tlP36Ms2tEHCMcSKQ6kLCGG9x26egm4QASyTX8UNMLKjFBDTCQrV0YLn?=
 =?us-ascii?Q?Dz3M3wTvAK1SHvj+w3kj+bTqCGKWpedA0SDxIe4tDsW8WrRHTdw15RTKfr0q?=
 =?us-ascii?Q?UVT5zMfb2FDBUPzPz9PGrnAOY9V2EWNvi7sVd288QPeXG4PTUCigD/6h1Vwy?=
 =?us-ascii?Q?fAC9SIGqn6nWnl1X4NBDZDnhw5nafjP030JiEght5ZhzcwOwq/1F3wVyttW1?=
 =?us-ascii?Q?X85x/64FQRR4v82MWV4AP7ZdVoFPkQlvRptydHyDoWWzSLf0TZznEG32ZNY6?=
 =?us-ascii?Q?PTZjGh8ATbhC7vkW0PEFO+EgIfwYUyEct6XwRuq0t4iSD1Nw4qHY7PfLk35S?=
 =?us-ascii?Q?7iy9U5Cyf9BScOnUmWXq9aBUHmcvbHcvfg4091OY/5+F7xBJZU2sfyvyqgIx?=
 =?us-ascii?Q?flHqMXAwGO3TWAaEMwNgYBHoo39M2r41r64v2Qu8HIyjuYMgu7xtbWdEcBB3?=
 =?us-ascii?Q?m4En4uTnZBUCqLmCa47N7CLKfcpy1QY7Nk4/LClrQQdQdOHuUrmr+PPdQCBJ?=
 =?us-ascii?Q?B6JHqS+1jhRTvsKNG1jdlPOcemvFuV2gTetRdAa1cJ34Hg1BpMHXkIxh5iQt?=
 =?us-ascii?Q?21gk3ntL33/Kwim5W8E/Vocr39R+kuORmKcE2BZG8rqC7q4B9ZVDRXzV6i1V?=
 =?us-ascii?Q?CdDnwWWvli3Oc5YuiDWx1aS7PwIGI5CnUw+RE1kvqo6YPgwEfU/5CVF3kMEu?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b863581-8ae3-48cc-e44a-08ddf1ad2971
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 03:33:38.4226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/cFiy/40WX/GV4FlsA9Ya5BC0ieq4gllbKJ+Km7/EgwZHB8HUjRvzr1AuT8SuwAdZU9dU2fPKmzI3Z/6o5ZIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9376
X-Proofpoint-GUID: 05-9Y6sgooD3pOWrmP7Jjrmne3xjZlPI
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c39494 cx=c_pps
 a=QqSBEdqS7BUxypinyQlWrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=87deq-WYKk37bI523yYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 05-9Y6sgooD3pOWrmP7Jjrmne3xjZlPI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDAzMyBTYWx0ZWRfX3q3OriQ77T63
 xxi6O4e48mMZRxEuy5KYkpBMyshQ+qI2B44nX/paM8+bwIjDeaqyQ8NHTRrs5V0q71FyEghvSfW
 TonqHBBK6wUPVVjUHEddHDLp43rKfMt+0MrGT/D0kntu+enXR1BW2fsoEvDprUtw6ociY9e/xwe
 baBqUAGIjtNUe9cfZpzVAg76bza+MBAE1KKMnpiLeAXU6qC05G0f8YmN5GNErFCLFPhnBbHIZeg
 +RLEjAeuwofEXhmuirg9Ffjfymu8mmXX9Lvz6c8Ee7Yuf5Rt5wMw5N/4eefeK7dRiZecWESTTRb
 sBM4j/h9QjBJB8oQbehEAWSPY56H+UC4qxCYhXb0Vqr9v6sAcBgR6LjV+NNouE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 03:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223302

From: Chen Qi <Qi.Chen@windriver.com>

Give out useful information when a package could not be matched.

Before the change:

  E: Package 'catch2' has no installation candidate

With this patch:

  E: Package 'catch2' has no installation candidate
  catch2 is a recipe. Its generated packages are: ['catch2-src', 'catch2-dbg', 'catch2-staticdev', 'catch2-dev', 'catch2-doc']
  Either specify a generated package or set ALLOW_EMPTY:${PN} = "1" in catch2 recipe

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index e09e81e490..eb48f3f982 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -244,9 +244,19 @@ class DpkgPM(OpkgDpkgPM):
             output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
             bb.note(output.decode("utf-8"))
         except subprocess.CalledProcessError as e:
+            e_output = e.output.decode("utf-8")
+            extra_info = ""
+            for e_line in e_output.split('\n'):
+                if 'has no installation candidate' in e_line or 'Unable to locate package' in e_line:
+                    match = re.search(r"E: Package '([a-z0-9+\-\._]+)' has no installation candidate", e_line)
+                    if match:
+                        pkg = match.group(1)
+                    else:
+                        pkg = re.search(r"E: Unable to locate package ([a-z0-9+\-\._]+)", e_line).group(1)
+                    extra_info += self.get_missing_pkg_reason(pkg)
             (bb.fatal, bb.warn)[attempt_only]("Unable to install packages. "
-                                              "Command '%s' returned %d:\n%s" %
-                                              (cmd, e.returncode, e.output.decode("utf-8")))
+                                              "Command '%s' returned %d:\n%s%s" %
+                                              (cmd, e.returncode, e_output, extra_info))
 
         # rename *.dpkg-new files/dirs
         for root, dirs, files in os.walk(self.target_rootfs):
-- 
2.49.0


