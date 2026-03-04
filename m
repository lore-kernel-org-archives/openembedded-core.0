Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6EDEFCE35
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24443.1772646257647996628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FTwYFZtO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244APNV1925138
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	FTwYFZtOo9jLyJWOYGjr018d8MrzCTsbZLs2wLnsraOSSvZK4JkV4LCyKFlgLc2T
	AFYLZwjVcJtuzsax9s5RFrOspFqx+fnOVT5ValqaW7rV397FzkZ8oXvxPuhT796x
	vk2ZKO/bqXKFpE4r3FUxGEjzH3otJNA8ZE7aBLX7Z5PVWFIMFp1seBJ/afcshX4F
	IPCM4qahe36TF5KDiZT7YOupzWeUxG8hdD1AEh/2WVugbNFZGwipEfHF5ut3ryLg
	yjLiySrgIM0FCIErEcgt5xQP+UFlh1n0WdjN4q8z8uhMrpz5TLlE8ICrLYgOElP8
	nFFP9bxh3uKGI65sZGpyAQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj1h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bn/WRaMTn0uuA8osj2Ygvo0/b9A9Uu6KyBUBm7DuWalQN4tvyvR9TfZy1Vy2aOXEO2D6xriw/PfZFwMkuBbMddjkeLSt+hjGyLlVvwuSpXCtlA9lE6VGHYJoUTFQzrdq8pgaackYwasXuNm3YcAL1Bt6rGR+y+7Dq35mWkEKuAuFD6PbtMPkHif/tD4Owi36Ejz7R/TPGwstm/XPs894Chuuy8Uq3Bfyvsz8QxuySWBIy+kqGWrAs6jFH3Pa9CcV3Mtu4I0dRKqke46OLx+jFGEi+Dq4ngck7SvdHGFY0C6NPSITsPORZG2S3nogIWbC/u1B2bt1gKaC5o3dNHBswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=a3s5gM6ANTPCC895K4g80lLtQ6pc1lvDJwnnINtynq1/9lFuOrEb98RPa34GUqIwcsLzbSiG90sDpx9/eXgmYiYHqzHJ9ZaGuK8BKHc/RAJEXAJmsq7BbXY16sjWQvkhUpzgNzeWybNhc4HOScUlOhxJ5MPZlSCRmEFq1c2/vjp2JcKYJilTbNXLqQ+zzfpESkZfhCISDA2HnjrF7ACzFNR9vwEvOY8r6gGfEh5voTgrtahzZwDY+0Vx8VxEYrHFu6dQZontqUouuPqNj1jKYCCxaGMM4ypAbro/pe+3kUpAx1mq4WbcCzHKapd8/6IQc5QoeEpby6WjDiP59owrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:12 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:12 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 06/14] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Wed,  4 Mar 2026 09:43:16 -0800
Message-ID: <20260304174324.1186644-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d395d7-4d00-47ab-c895-08de7a15a5c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	o3+oKeS7ylbTUh9xHCQyH941VzREnOc9MPNNVr9VYQBXw1ZFgkqonj92TeB6gJoGfIlXJQ3UzcJEYiwM9X/3uURfvDTfrQMiWlsoE7zXcKL+J85ATFZ7B9Kvydwj3py0JJ2+zeV483PIUrdbptEXcQHiN5Qsh6erh0oRl5WQ5hVZAjPOCffdfVt0F546uZNaBYTg8WLn3v+RFmfWS9qTrk07sMCx4hdT+TShIL/oevOvPWbI2pzEVD4Nrx2gqelwcVaI5EYMhpO4SOJKjbfCpCE3IBan3FCr/SFrppNLHhsYpYhiuqz3XkJ6fDMBa4pE3GBPmqXaZ0LS6Lg1f0kTvnAir0KKdkpVhyy0/lga4PAA/2Z5V3Bg6YHulUIUlU2dLRS5slCwhIYG7YSbs/lSY2zFpAMFOav34VnpSY6M4g8wbECeIeP4HHnunsx92nQOV5Rp1FY5hNeFHaWA6/MwtjNmiZ2C2bE5DWPQQQbpMFnvLxi/RTe2MEKOQx+DtKYLsUszzN0035i9B2qYC3rKKg5Lf19tyBOdG4/fRw+jU4Y1h56SU9NYmfc99hdGxLWWmG1NtLv4gtwPe+jOijP5IwDw4QaDnUziyTCq4i0nPBst1b69BKYr7mb4M1vt90hkcpTUvriOWhC/CrWiLKxfJGaehN97dz+MxxMYJjQKmN92HTlY2lPbDK63JLB6+56MvWCbaOAT02xVL0JRC/bH9qvGdwz7uYJT7P/WO/LBm+4yhlFQVNUTckeY6s0riQnQGqeS41FsSmjifSLO5wAtU8vkPNLnhb5ZNckNTW4ELYU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uUUPQGebjKp4Ga+toiwWARcHUHNgXg3a1/9ikLUJH8bx6PsvuHZama79YLtL?=
 =?us-ascii?Q?tGbGroiqJLvBH6LZH5lISG+YmHQLSKc/GnxQxxyhFhMJT72IWO4/7/WEbdVJ?=
 =?us-ascii?Q?3DkelcIdPaXVmyDJc/lMGJa8Ut/ZXEzvJqJ8AY4U46PU93vdVnRLEIwaF1PH?=
 =?us-ascii?Q?GjJjiCotZgk5m+4ANxo0JjL7bEL53gUi/LWEonCoAnOg90Wzij7TxRnIPliM?=
 =?us-ascii?Q?EQYnWcc73aDVi/ZkQzNl+Phy1m6ASZK1k1CL2oz035nRE+PLNVEPWJ+aUNSW?=
 =?us-ascii?Q?7jURxlNuaDXHfgq+cPRIvtabw1QRMOsNAGHS/yMr674hqMMWfonpthCHyjIt?=
 =?us-ascii?Q?UKlMZQ0tCO0vdW5znp5Zs8jdZ/oIqulHupEEMgx2o2fIcsYt47D1FOXUUFX8?=
 =?us-ascii?Q?bQy7lSnxn6sU9i83hR+6qDn7gG5LufRvdlwj1qvBf3IftjklYwdzJSnwuQM3?=
 =?us-ascii?Q?CSEua0uzEqHhj+I2RCXgxMQdsTowE/05azy+kRogwhSHJ61MZETxhJeTk7tP?=
 =?us-ascii?Q?f5AH4qA+U4KMUrN0bsdoqoGBnwELSxSt099BKUlRsYzIS8sah9XLTcp8OrCW?=
 =?us-ascii?Q?Hk6HGbH+QuN7zsXcUS2i200N51x0B8tz8y4sbl6WBNjA6a4uHimwoyjPJngH?=
 =?us-ascii?Q?OXwnxO4KLKLRNMCtGSqHoAVEnIRIE28hWJcR/W1VbvBACvt0NE4UDRXHmg/N?=
 =?us-ascii?Q?AlVB0Lj3ONW7NJSafTf5yT/zElb4FkuFHufLehKbsQ8Xg80nfL7CPZegeQoy?=
 =?us-ascii?Q?ugoTgVgOHmKo+FLf12MjDX19RnTv8E8M3G49Nuzr59vV1CY4Vm5cgmKvqj71?=
 =?us-ascii?Q?WseZ1ZwdZLs3P5aacEcrqmvoeMmnHw6t55rpqJNnzBvRn40167UkTVFMpZUh?=
 =?us-ascii?Q?pFwCvVKVdu89utf9jMKnmTNqUK2L6bBdVMkIBNhBCUTUsksk8zNpnegUXIrK?=
 =?us-ascii?Q?b3K9sv9eet3KNPV9cU932vDnIAUJkN7+FgDfObqPqiOJLwMT8NlKZZPv2w+g?=
 =?us-ascii?Q?a6CO4Durrqigl7Bl2Fc/dAqzYfpzdFQ4XpGIMn0PaI+vTdqjbOj+SMgmcNlX?=
 =?us-ascii?Q?FRTxHZUUBfsxzRG5MheqinMVtSzWFqFJvUyx4KPsa7I3JqoOWIs9qVPhx76V?=
 =?us-ascii?Q?Ow7cZuwKds2m/yfJAmOoU3GhV5J82S7gXBgE3Yjcau6bp2KnW+3FtlEHTQ60?=
 =?us-ascii?Q?navkev6bBBupUk2ZfomcmtUSiPGDJ288YQcKIi7PqDr3CBxa2G1ajSJeP/SD?=
 =?us-ascii?Q?Jh5mhM8xu8zopu+MMXGd8tX1iiaAEYihgPJTCoYN0/5jYnvBy0LEc1/xFOdi?=
 =?us-ascii?Q?RF7ljBzGwFSiJw+JI3yYhC+/ocrqnkHQXL5c0Jti4u25YLRZDgV/1zU+V0N+?=
 =?us-ascii?Q?jhLmBKlMnIdZojoZpr+iiiDdif0mjzYeo/OiwpW4VJzDaOW6zxD5CMwNehyl?=
 =?us-ascii?Q?2872jF5f+BcQJy55n24EpziSgvq09AekBa76OX40pWtf1ggeYKGgyWjjIj4u?=
 =?us-ascii?Q?QmRijQVv2NHhBSIRk6qrtsC74iHc52pdGrW8xT3nVMNXP9cQfc2OSdvPNUjw?=
 =?us-ascii?Q?tSlsTARoeDajlrbVTLas7P87HHeM0Nnt+3EyrZdyg5tjCOqWHlBDM/sp9YBU?=
 =?us-ascii?Q?d1uJf3SZPYLhVw+Fmx/J5b878gwVJg46K6sDgfmW0Svk6PGDofclpXwWWPH4?=
 =?us-ascii?Q?KNPagLlICP1Dm6/VnHOsQngyJZhMENTGu0Sg37n31K2ckmGyLJ3jd0H7vHFQ?=
 =?us-ascii?Q?gXJuu7MP4wzmQ3rPbR6JZUPjHZPCOog=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d395d7-4d00-47ab-c895-08de7a15a5c1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:12.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2daOjw74tlHgOUXP5DraNf6g4BjN9jBlFHqxSZ9fXL2/lVZ+rzYS/aUUVSRZFWKTqqXJhCMQvhOKkskbqP551DW2hr7CwojJVJIfLSO1ybE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: PUswAzKmiaNf1UkdQP45tf2-D-gjcsJt
X-Proofpoint-ORIG-GUID: cQCctRsB5PQaz47k2LZJP2VJBCJ9sPEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX8WfDK+ftPb1r
 ZCX9xAEyNHqFalYxANkvwL0/gpI8D8bs/3WWs6XtkRJkkgEOmgyBSHx8V3b3oCiYOB5z5QAQsvk
 AuDLSFIZlMms1yNVwsSxEzW1vb4sDW0QOZB3CdG3h3zex7Tp2RcMeYW6C9F9hAZBj5LDQzH0nEf
 dPWaqa1Y3a3VYmZ45kUyMCC+Rkk7okZL2O4XjUseljJPyh1qNnuObJezrx/O8R2wEkUfiG+4nXh
 rntFKBNsyxIdVmrBLzGOpMiF4oPQew4ALSQROQV2hrOPnvATh0VzaimOOgNhrMjBLbVShSdNtlP
 9/JEatFsUkQV3S3zZAY6sSAblKYmgbh1mybNpb+YizDY3KjN5M86Zwsz2OQUbKUt+CPKYB/by0V
 Sy4GPMCV+O4u7Bk+IAVPrlnZH9+gJ8/QKd9hhcLBrj3cE13ekf5UPLGQAKJpNNs6E45EnS9nbVM
 qL+dQYCWW8ywYMMKxNA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f70 cx=c_pps
 a=vVq7UQVwO1zAg9gY0+x7SQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232422

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


