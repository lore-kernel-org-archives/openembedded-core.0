Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2B5C54730
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7353.1724377703833162924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MBhYIq018581
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRc7SscpiJH7nHm6mj9QvtxyWXjSXbFS2ervbneyhdbNtn9Ve/6meW+2zsbvGIZjXzpatyeNfplDMq/i3hdr4XqJHehQFaGY2Xr8RN2jUwiViOgmG4zm7TX0GT+3TDW1iBhS22WpCK2ZrNBXBQ3LqEE4r0mLedrXcfNwwAPCQhhJF18b+ZF7vQrdGrZWbr9EYRUJ0FLvwo9QitqU6elDeMIdcids3JUlHa9Kfrb+jlg7yBlLF8c+5H+rv+/o1tliLc5qQms1cQ2FKA7/m132Ze5nM9Y2tYuSgImaMARrQFjZ29dsRs8PI4Fo9HaS+VeUuQkolXk0slMNSzhfYymBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WluM8l4icEiTy02hYhat6TGgA4BeVOxh7i5zbywYlAw=;
 b=xb5eU4KPLBAp8mnI+S6GGwmeIWmd7nqnUnSFRIcpApszDXTOt0KbBNFHfLyBtTWb08G+7B+n+3y4y3V/Ug+/EayvMwEfhus+Jfkgt54L1OqWDnBlLoQdAugTx5FuszECOf8rEC7ByepxGZwiW+BPRTNQpoFrE3AZQKHBszNvMdQsA7oUtxGD4+RpPXnpHxwZm/xtsCNq+EKdkbRR7HMST6KdElDZ7I8pblF2XE8cDXLI4VbNOWhDwTRuiyoqvnueFzQdatjz1mLXzJNftrpjU7Z6cyelrba03ZdrXD+PR94tmtdHNYYB/dVTRWlGEtkCMCQzEiQ72YGDYw9Y0R2oFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:20 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:20 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 4/9] readline: 8.2 -> 8.2.13
Date: Fri, 23 Aug 2024 09:48:01 +0800
Message-Id: <20240823014806.4154590-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7fef65-e803-4355-104c-08dcc315aaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XeCKB+Pm1XuK4WzXVqLY/gTo5InDCO8ap3QS6AeVQjh0Tcx53fa/43ZGmYtu?=
 =?us-ascii?Q?zhSBiosav4WxxCChhtCU+5hSatX73Ry0qka/3ve1aGL9m2ov5y3uU4aFmsTH?=
 =?us-ascii?Q?95tsEN71bckPy0PDyxXCYVBSHoLcvG1mDSfKPxQm0uzSRyEjt13v1HTE34xU?=
 =?us-ascii?Q?BnEZVzXisITR0SJMevpb4f5WqNEEntY/NvhMOdeQ94FF9U3aRoZwZoRx0LJy?=
 =?us-ascii?Q?Ig8WD/j52DlYwcQjunIiUG5mtgUM4+aFpFPt4a3ifEpoPtdUlW0xGXumpFhb?=
 =?us-ascii?Q?PObLp9xHwsIycejCiSEum8upiwi2bAlj8wiOjw+VPb0tR0dvavtQgWx7C7PR?=
 =?us-ascii?Q?BoIX3wcLI8E7MLZ7JTNPginq2kIWy0xyZ0eevoDDRBqh6zMDa6WTh3dAwD0Z?=
 =?us-ascii?Q?3Dh5KcOZmoK+oqusshnnv0EFliNZNqvyy8B7tBiEjTyZaAwmLLeFNfz94DmR?=
 =?us-ascii?Q?rIERNtRzF9cC0l9X1zAb+pTI5b7FLLtjNCHRkT/Z38s/Prz5TUY0+nMkRuCR?=
 =?us-ascii?Q?GrLdV/lGSR1Vo6tBkABvXreOclbSWuYYVJARD11qgbh0MbF1FgPZb8CxBU31?=
 =?us-ascii?Q?9ktyul1kN7VCP7RIewqq+omFVxP+agmHp0MThP4hjyEPXeCpmlXHyutogohn?=
 =?us-ascii?Q?BKeZSuOo7/M7TcLYW9ecnTXRqwIHw98CmYACsho0fzXcTWXZ5Rzt/e53gC/V?=
 =?us-ascii?Q?06TIgxxFFLC9VuAnlNmcSUJIqwzxuWdp7v5wU80Tmh8O0jRgsyiOAXgBi7l6?=
 =?us-ascii?Q?Gq7TMPAsEMUlZvgVVoSuBipSKQ6HX9fHbmsRPX0znYHy75E3HQ80iPtL+7bE?=
 =?us-ascii?Q?gr5p6hiv6qEQpm4GtYvnYlyd8ZpT4cUIw0jZleLpVFBh+kvAoDjCOMuneyoR?=
 =?us-ascii?Q?fiaV2sfIeKbNFxGF1MpScj4qqabTnw9nKBlUM8Lb3a1r8XR/LtxYF+t7c/NC?=
 =?us-ascii?Q?POpo/aiHtNCzyx7rhsvXgE1PrkVKWXdpEh5luXJI0Ob7c4Vwb0gwLq1JQa6B?=
 =?us-ascii?Q?ufPRlsWNEFENtopunxWT0YtpFlueNUlDXi9ir5m9uMuH/bnEjWBE8aPW0h2l?=
 =?us-ascii?Q?qu/nGJ2tvtd/PJfKxjSPOOJ2BfX+z4plqutj/MuYp5qxGYT7dqoAaSIiK8Zi?=
 =?us-ascii?Q?Ya+fvlh5GxJKj5UTFHDHSuDVhuhyDWKKeRWZiZJbp6TpYMITTwC4Me3hhsD1?=
 =?us-ascii?Q?5wna6rhaPN1uY1vzM7SvOA3jQr5sDfCMNmjRpQ0qfZ0agNVFWBIDH5ue3FE6?=
 =?us-ascii?Q?jebFG6Wj4nHj8GTu+SecjR9gqorJXwFnTklOwu+JizCrlURAXQLalqCHE7Yt?=
 =?us-ascii?Q?rx65TGBK/KmoLAsz7LNy0vAvoksd+0KTtMF6x1Zi55dXyNb9hRyV3MyScuXY?=
 =?us-ascii?Q?/6lCMCA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vcl+cjFOxsDm18T7yWVe2GV3nsUSBgTykxxwbZ+mf9bFWRAzDiCIrqYL/wsO?=
 =?us-ascii?Q?ibt76xVmUsRyA24Spw7eMQqKSAjWugZrp5LIngNfev83pRA2iYX8Oy9PuYQ6?=
 =?us-ascii?Q?Eu802GDtNQjDXQxf7RTp80NZCUcJXi7utPT23YHObQx3gOvngqNEfwaAhWIU?=
 =?us-ascii?Q?s0NBy2pxiffDRGbxDkvMT6PsKbc1YaNNXsOVoRim/jzbTzA/pOyosGgt7u+h?=
 =?us-ascii?Q?jk/ptkIvWLtspsuR7Cfk4WokB4oGZoH8ZBpn+Jbn6OpfkLHSwBY4jnbbPSIC?=
 =?us-ascii?Q?eXBsRAOEAR7XLBFx80JBmrO5h5HPK5AIvXWXken6YpLnkZ2FulLnkx3Kkj/5?=
 =?us-ascii?Q?UVyRIJpsCuotgcBxjSWYf0H/7RP68PDjhG8t4fGHjThb7440JVciySZB/v63?=
 =?us-ascii?Q?BAJr9GZP+55YzrjWcwZbdgPTzGY0bHRNlCtMSgEFGOV2D/8NV5OKcixP3uTD?=
 =?us-ascii?Q?f4LO2vRhaX1Lt3T1XbDoGEgJRclPJv9GLTrqA91MfBzzJkDH+cBsT3Y9RyuM?=
 =?us-ascii?Q?mGwUvCXke7GJnArE83VWjx3zPCllU/TlsUzb3nUQopilzITmXPz3d0vHpgxe?=
 =?us-ascii?Q?yl5ZhEFL8dfETs/la7imznqklcz5RzGDC118egiNGPFoa9FhCfLwJw9UYgyk?=
 =?us-ascii?Q?pVDuqfeyxXw53zWoH8m7sNnXqaumMsegvtihltp8jxz3FhUSve11CKfyCUAU?=
 =?us-ascii?Q?5mNgyib5dlV4QD1d4xF5RS8HXnM+8NtG0dn+uZeVtM3iwHy400hXyvqVU3d5?=
 =?us-ascii?Q?Tm4mg0KjiXiO4jx8yX1pQrN/45PW3mjU2voZ7URgGyUylFplh6LVKz4QHJM8?=
 =?us-ascii?Q?sJEFgkJ7H+MRelRb6O3gu/DjY116H1cykF1+TV8ATS5CNFKU1k9Lp63O9W3V?=
 =?us-ascii?Q?LjcpYZhrytT+JNTTvgpegeZdrOOwfKr+Ua/wPS597NovOQCE+T2qjbfpbPeQ?=
 =?us-ascii?Q?Z7nyXdswBMbe7+W0fdBaKoca7gXL2RZie7YeaY+yyNToL7XVod2WkOtBuC/Y?=
 =?us-ascii?Q?L4dVHzWcytikRheFDXsk5nsinuK+tUCGB9iRnY+FBrP9dw710QR4nxGRZn3+?=
 =?us-ascii?Q?FqE0jk2iWzC3/LAa2IKoysjwWyqvL3rUqa6/8VsZN6Yh3J4d4zkYW9uf58MA?=
 =?us-ascii?Q?eazJCPNLriBHenJ+IwuFSmlDCSwxPAWNqmeCQXCzxKKg/9oYpLcmhVMJz8ID?=
 =?us-ascii?Q?fwX4vZpSHjb04GlG4Gcb0SSDFYnrYRzVd71gOp/hqXq0Wm0JyDTuA/dc7G1o?=
 =?us-ascii?Q?f2YRk3e31kvOUmNsENLnALZ8yEz1nXJw6acO/Dd+6oNnNeUcSGPx5Ao3mKi6?=
 =?us-ascii?Q?nQ3CWvGKidOmdLn8+yxeCC5FjBHiA96s9cHN6bSwr6f+4FQgLhI+w0JBCyGE?=
 =?us-ascii?Q?a1vQWiKDyeodDcTaoyi8ZuqWwHgH65i0XjBXbSvPpNaqh1YVH59ns1lzpwpT?=
 =?us-ascii?Q?XQc1bhxFyIR/pVPSbIOtylqlEYLquN2fvIZDkC8oliSMBhkMiQLiltG4UeT9?=
 =?us-ascii?Q?1Ad0I0FaWGztLvYhB8MZRdhbZQj8C5cz8iePa4bm0z104XJFErFI7k4zdtPy?=
 =?us-ascii?Q?EKGlrQA4zpKv9LnxJuECl8SDLmloDhRPo+SUrsJH6xzb12vBNYyYzaT72CSw?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7fef65-e803-4355-104c-08dcc315aaa9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:20.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cH6/T2jY5npocoDgrwudtamIgbpSE2mAhETGBkO20LgQV65CQE4JjxlfF4SltITRSwLj6wTC8veco4Il5MrlJ2dg5SuoquKCLiB09JIZ90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: LaCsGb9Id_3GF2WgpKhDDBEA8Ml7Eqe1
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea66 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8 a=mDV3o1hIAAAA:8
 a=pGLkceISAAAA:8 a=eHe_0jdtAAAA:8 a=Z3krQfD2AAAA:8 a=_ZhYKdCeAAAA:8 a=HanOaVHjAAAA:8 a=g6utzmWhN4npkcL4-b0A:9 a=ndlDZqTeIngEI4z2:21 a=Gp_M6zLOVyIA:10 a=cNh90wl4zzwA:10 a=9zgvW-0DGmgA:10 a=EaLYwRSLnYwA:10 a=BoqcdmVvSocA:10 a=kWClByX7cxkA:10
 a=gfvt9UqS0JIA:10 a=tQmJzuk27bYA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=SEwjQc04WA-l_NiBhQ7s:22 a=_FVE-zBwftR9WsbkzFJk:22 a=FuewtF2gekjSoI1dp_sw:22 a=GLjUmipmX1P0AEK-g7Xr:22 a=uqOk3ZSnBfCTOznnrPA1:22 a=qDapSG_AXRM5HRunqNxx:22
X-Proofpoint-GUID: LaCsGb9Id_3GF2WgpKhDDBEA8Ml7Eqe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203671

Drop backport patches:
- readline82-001.patch ~ readline82-010.patch

Rebase norpath.patch to 8.2.13

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../readline/readline/norpath.patch           |  19 +++-
 .../readline/readline/readline82-001.patch    |  45 --------
 .../readline/readline/readline82-002.patch    |  51 ---------
 .../readline/readline/readline82-003.patch    |  46 --------
 .../readline/readline/readline82-004.patch    |  68 ------------
 .../readline/readline/readline82-005.patch    |  53 ---------
 .../readline/readline/readline82-006.patch    | 102 ------------------
 .../readline/readline/readline82-007.patch    |  51 ---------
 .../readline/readline/readline82-008.patch    |  80 --------------
 .../readline/readline/readline82-009.patch    |  76 -------------
 .../readline/readline/readline82-010.patch    |  70 ------------
 meta/recipes-core/readline/readline_8.2.13.bb |   5 +
 meta/recipes-core/readline/readline_8.2.bb    |  17 ---
 13 files changed, 19 insertions(+), 664 deletions(-)
 delete mode 100644 meta/recipes-core/readline/readline/readline82-001.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-002.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-003.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-004.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-005.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-006.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-007.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-008.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-009.patch
 delete mode 100644 meta/recipes-core/readline/readline/readline82-010.patch
 create mode 100644 meta/recipes-core/readline/readline_8.2.13.bb
 delete mode 100644 meta/recipes-core/readline/readline_8.2.bb

diff --git a/meta/recipes-core/readline/readline/norpath.patch b/meta/recipes-core/readline/readline/norpath.patch
index 5d71582b70..34534aff0a 100644
--- a/meta/recipes-core/readline/readline/norpath.patch
+++ b/meta/recipes-core/readline/readline/norpath.patch
@@ -6,11 +6,17 @@ Upstream-Status: Inappropriate
 
 RP 2012/2/23
 
-Index: readline-6.2/support/shobj-conf
-===================================================================
---- readline-6.2.orig/support/shobj-conf	2012-02-23 11:06:37.193179379 +0000
-+++ readline-6.2/support/shobj-conf	2012-02-23 11:06:50.049178918 +0000
-@@ -114,7 +114,7 @@
+Rebase to 8.2.13
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ support/shobj-conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/support/shobj-conf b/support/shobj-conf
+index cd7634d..029123a 100644
+--- a/support/shobj-conf
++++ b/support/shobj-conf
+@@ -128,7 +128,7 @@ linux*-*|gnu*-*|k*bsd*-gnu-*|midnightbsd*|freebsd*|dragonfly*)
  	SHOBJ_LD='${CC}'
  	SHOBJ_LDFLAGS='-shared -Wl,-soname,$@'
  
@@ -19,3 +25,6 @@ Index: readline-6.2/support/shobj-conf
  	SHLIB_LIBVERSION='$(SHLIB_LIBSUFF).$(SHLIB_MAJOR)$(SHLIB_MINOR)'
  	;;
  
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/readline/readline/readline82-001.patch b/meta/recipes-core/readline/readline/readline82-001.patch
deleted file mode 100644
index 4e9839db9c..0000000000
--- a/meta/recipes-core/readline/readline/readline82-001.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-001
-
-Bug-Reported-by:	Kan-Ru Chen <koster@debian.org>
-Bug-Reference-ID:
-Bug-Reference-URL:	https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021109
-
-Bug-Description:
-
-Starting a readline application with an invalid locale specification for
-LC_ALL/LANG/LC_CTYPE can cause it crash on the first call to readline.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/nls.c	2022-08-15 09:38:51.000000000 -0400
---- nls.c	2022-10-05 09:23:22.000000000 -0400
-***************
-*** 142,145 ****
---- 142,149 ----
-      lspec = "";
-    ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
-+   if (ret == 0 || *ret == 0)
-+     ret = setlocale (LC_CTYPE, (char *)NULL);
-+   if (ret == 0 || *ret == 0)
-+     ret = RL_DEFAULT_LOCALE;
-  #else
-    ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
-
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 0
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 1
diff --git a/meta/recipes-core/readline/readline/readline82-002.patch b/meta/recipes-core/readline/readline/readline82-002.patch
deleted file mode 100644
index 5629685dc1..0000000000
--- a/meta/recipes-core/readline/readline/readline82-002.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-002
-
-Bug-Reported-by:	srobertson@peratonlabs.com
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2022-09/msg00049.html
-
-Bug-Description:
-
-It's possible for readline to try to zero out a line that's not null-
-terminated, leading to a memory fault.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/display.c	2022-04-05 10:47:31.000000000 -0400
---- display.c	2022-12-13 13:11:22.000000000 -0500
-***************
-*** 2684,2692 ****
-  
-    if (visible_line)
-!     {
-!       temp = visible_line;
-!       while (*temp)
-! 	*temp++ = '\0';
-!     }
-    rl_on_new_line ();
-    forced_display++;
---- 2735,2740 ----
-  
-    if (visible_line)
-!     memset (visible_line, 0, line_size);
-! 
-    rl_on_new_line ();
-    forced_display++;
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 1
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 2
diff --git a/meta/recipes-core/readline/readline/readline82-003.patch b/meta/recipes-core/readline/readline/readline82-003.patch
deleted file mode 100644
index 61570bf4f4..0000000000
--- a/meta/recipes-core/readline/readline/readline82-003.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-003
-
-Bug-Reported-by:	Stefan Klinger <readline-gnu.org@stefan-klinger.de>
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2023-08/msg00018.html
-
-Bug-Description:
-
-Patch (apply with `patch -p0'):
-
-The custom color prefix that readline uses to color possible completions
-must have a leading `.'.
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/colors.c	2021-12-08 11:38:25.000000000 -0500
---- colors.c	2023-08-28 16:40:04.000000000 -0400
-***************
-*** 74,78 ****
-  static void restore_default_color (void);
-  
-! #define RL_COLOR_PREFIX_EXTENSION	"readline-colored-completion-prefix"
-  
-  COLOR_EXT_TYPE *_rl_color_ext_list = 0;
---- 74,78 ----
-  static void restore_default_color (void);
-  
-! #define RL_COLOR_PREFIX_EXTENSION	".readline-colored-completion-prefix"
-  
-  COLOR_EXT_TYPE *_rl_color_ext_list = 0;
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 2
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 3
diff --git a/meta/recipes-core/readline/readline/readline82-004.patch b/meta/recipes-core/readline/readline/readline82-004.patch
deleted file mode 100644
index cedc3d0fe4..0000000000
--- a/meta/recipes-core/readline/readline/readline82-004.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-004
-
-Bug-Reported-by:	Henry Bent <henry.r.bent@gmail.com>
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-bash/2022-11/msg00044.html
-
-Bug-Description:
-
-Patch (apply with `patch -p0'):
-
-There are systems that supply one of select or pselect, but not both.
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/input.c	2022-04-08 15:43:24.000000000 -0400
---- input.c	2022-11-28 09:41:08.000000000 -0500
-***************
-*** 152,156 ****
---- 152,158 ----
-  int _rl_timeout_init (void);
-  int _rl_timeout_sigalrm_handler (void);
-+ #if defined (RL_TIMEOUT_USE_SELECT)
-  int _rl_timeout_select (int, fd_set *, fd_set *, fd_set *, const struct timeval *, const sigset_t *);
-+ #endif
-  
-  static void _rl_timeout_handle (void);
-***************
-*** 249,253 ****
-    int chars_avail, k;
-    char input;
-! #if defined(HAVE_SELECT)
-    fd_set readfds, exceptfds;
-    struct timeval timeout;
---- 251,255 ----
-    int chars_avail, k;
-    char input;
-! #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
-    fd_set readfds, exceptfds;
-    struct timeval timeout;
-***************
-*** 806,810 ****
-    unsigned char c;
-    int fd;
-! #if defined (HAVE_PSELECT)
-    sigset_t empty_set;
-    fd_set readfds;
---- 815,819 ----
-    unsigned char c;
-    int fd;
-! #if defined (HAVE_PSELECT) || defined (HAVE_SELECT)
-    sigset_t empty_set;
-    fd_set readfds;
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 3
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 4
diff --git a/meta/recipes-core/readline/readline/readline82-005.patch b/meta/recipes-core/readline/readline/readline82-005.patch
deleted file mode 100644
index 69c2e4f77a..0000000000
--- a/meta/recipes-core/readline/readline/readline82-005.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-005
-
-Bug-Reported-by:	Simon Marchi <simon.marchi@polymtl.ca>
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-09/msg00005.html
-
-Bug-Description:
-
-If an application is using readline in callback mode, and a signal arrives
-after readline checks for it in rl_callback_read_char() but before it
-restores the application's signal handlers, it won't get processed until the
-next time the application calls rl_callback_read_char(). Readline needs to
-check for and resend any pending signals after restoring the application's
-signal handlers.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/callback.c	2022-04-29 12:02:56.000000000 -0400
---- callback.c	2022-10-11 10:59:06.000000000 -0400
-***************
-*** 116,120 ****
-    do { \
-      if (rl_persistent_signal_handlers == 0) \
-!       rl_clear_signals (); \
-      return; \
-    } while (0)
---- 116,123 ----
-    do { \
-      if (rl_persistent_signal_handlers == 0) \
-!       { \
-!         rl_clear_signals (); \
-!         if (_rl_caught_signal) _rl_signal_handler (_rl_caught_signal); \
-!       } \
-      return; \
-    } while (0)
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 4
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 5
diff --git a/meta/recipes-core/readline/readline/readline82-006.patch b/meta/recipes-core/readline/readline/readline82-006.patch
deleted file mode 100644
index d66afe82c9..0000000000
--- a/meta/recipes-core/readline/readline/readline82-006.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-006
-
-Bug-Reported-by:	Tom de Vries <tdevries@suse.de>
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-09/msg00001.html
-
-Bug-Description:
-
-This is a variant of the same issue as the one fixed by patch 5. In this
-case, the signal arrives and is pending before readline calls rl_getc().
-When this happens, the pending signal will be handled by the loop, but may
-alter or destroy some state that the callback uses. Readline needs to treat
-this case the same way it would if a signal interrupts pselect/select, so
-compound operations like searches and reading numeric arguments get cleaned
-up properly.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/input.c	2022-12-22 16:15:48.000000000 -0500
---- input.c	2023-01-10 11:53:45.000000000 -0500
-***************
-*** 812,816 ****
-  rl_getc (FILE *stream)
-  {
-!   int result;
-    unsigned char c;
-    int fd;
---- 812,816 ----
-  rl_getc (FILE *stream)
-  {
-!   int result, ostate, osig;
-    unsigned char c;
-    int fd;
-***************
-*** 823,828 ****
---- 823,842 ----
-    while (1)
-      {
-+       osig = _rl_caught_signal;
-+       ostate = rl_readline_state;
-+ 
-        RL_CHECK_SIGNALS ();
-  
-+ #if defined (READLINE_CALLBACKS)
-+       /* Do signal handling post-processing here, but just in callback mode
-+ 	 for right now because the signal cleanup can change some of the
-+ 	 callback state, and we need to either let the application have a
-+ 	 chance to react or abort some current operation that gets cleaned
-+ 	 up by rl_callback_sigcleanup(). If not, we'll just run through the
-+ 	 loop again. */
-+       if (osig != 0 && (ostate & RL_STATE_CALLBACK))
-+ 	goto postproc_signal;
-+ #endif
-+ 
-        /* We know at this point that _rl_caught_signal == 0 */
-  
-***************
-*** 888,891 ****
---- 902,908 ----
-  
-  handle_error:
-+       osig = _rl_caught_signal;
-+       ostate = rl_readline_state;
-+ 
-        /* If the error that we received was EINTR, then try again,
-  	 this is simply an interrupted system call to read ().  We allow
-***************
-*** 928,933 ****
---- 945,959 ----
-  #endif  /* SIGALRM */
-  
-+ postproc_signal:
-+       /* POSIX says read(2)/pselect(2)/select(2) don't return EINTR for any
-+ 	 reason other than being interrupted by a signal, so we can safely
-+ 	 call the application's signal event hook. */
-        if (rl_signal_event_hook)
-  	(*rl_signal_event_hook) ();
-+ #if defined (READLINE_CALLBACKS)
-+       else if (osig == SIGINT && (ostate & RL_STATE_CALLBACK) && (ostate & (RL_STATE_ISEARCH|RL_STATE_NSEARCH|RL_STATE_NUMERICARG)))
-+         /* just these cases for now */
-+         _rl_abort_internal ();
-+ #endif
-      }
-  }
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 5
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 6
diff --git a/meta/recipes-core/readline/readline/readline82-007.patch b/meta/recipes-core/readline/readline/readline82-007.patch
deleted file mode 100644
index 9fa1ccb552..0000000000
--- a/meta/recipes-core/readline/readline/readline82-007.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-007
-
-Bug-Reported-by:	Kevin Pulo <kev@pulo.com.au>
-Bug-Reference-ID:
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-11/msg00002.html
-
-Bug-Description:
-
-If readline is called with no prompt, it should display a newline if return
-is typed on an empty line. It should still suppress the final newline if
-return is typed on the last (empty) line of a multi-line command.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/display.c	2022-04-05 10:47:31.000000000 -0400
---- display.c	2022-12-13 13:11:22.000000000 -0500
-***************
-*** 3342,3348 ****
-  		 &last_face[_rl_screenwidth - 1 + woff], 1);
-      }
-!   _rl_vis_botlin = 0;
-!   if (botline_length > 0 || _rl_last_c_pos > 0)
-      rl_crlf ();
-    fflush (rl_outstream);
-    rl_display_fixed++;
---- 3394,3400 ----
-  		 &last_face[_rl_screenwidth - 1 + woff], 1);
-      }
-!   if ((_rl_vis_botlin == 0 && botline_length == 0) || botline_length > 0 || _rl_last_c_pos > 0)
-      rl_crlf ();
-+   _rl_vis_botlin = 0;
-    fflush (rl_outstream);
-    rl_display_fixed++;
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 6
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 7
diff --git a/meta/recipes-core/readline/readline/readline82-008.patch b/meta/recipes-core/readline/readline/readline82-008.patch
deleted file mode 100644
index 660cb1e00b..0000000000
--- a/meta/recipes-core/readline/readline/readline82-008.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-008
-
-Bug-Reported-by:
-Bug-Reference-ID:
-Bug-Reference-URL:
-
-Bug-Description:
-
-Add missing prototypes for several function declarations.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/text.c	Wed Oct 27 11:03:59 2021
---- text.c	Thu Nov 16 16:24:58 2023
-***************
-*** 1765,1770 ****
-  #if defined (READLINE_CALLBACKS)
-  static int
-! _rl_char_search_callback (data)
-!      _rl_callback_generic_arg *data;
-  {
-    _rl_callback_func = 0;
---- 1765,1769 ----
-  #if defined (READLINE_CALLBACKS)
-  static int
-! _rl_char_search_callback (_rl_callback_generic_arg *data)
-  {
-    _rl_callback_func = 0;
-*** ../readline-8.2-patched/bind.c	Wed Feb  9 11:02:22 2022
---- bind.c	Thu Nov 16 16:25:17 2023
-***************
-*** 1168,1174 ****
-  
-  static int
-! parse_comparison_op (s, indp)
-!      const char *s;
-!      int *indp;
-  {
-    int i, peekc, op;
---- 1168,1172 ----
-  
-  static int
-! parse_comparison_op (const char *s, int *indp)
-  {
-    int i, peekc, op;
-*** ../readline-8.2-patched/rltty.c	Fri Feb 18 11:14:22 2022
---- rltty.c	Thu Nov 16 16:25:36 2023
-***************
-*** 81,86 ****
-     to get the tty settings. */
-  static void
-! set_winsize (tty)
-!      int tty;
-  {
-  #if defined (TIOCGWINSZ)
---- 81,85 ----
-     to get the tty settings. */
-  static void
-! set_winsize (int tty)
-  {
-  #if defined (TIOCGWINSZ)
-
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 7
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 8
diff --git a/meta/recipes-core/readline/readline/readline82-009.patch b/meta/recipes-core/readline/readline/readline82-009.patch
deleted file mode 100644
index 1fcf7b3535..0000000000
--- a/meta/recipes-core/readline/readline/readline82-009.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-009
-
-Bug-Reported-by:	Stefan H. Holek <stefan@epy.co.at>
-Bug-Reference-ID:	<50F8DA45-B7F3-4DE1-AB94-19AE42649CDC@epy.co.at>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00021.html
-
-Bug-Description:
-
-Fix issue where the directory name portion of the word to be completed (the
-part that is passed to opendir()) requires both tilde expansion and dequoting.
-Readline only performed tilde expansion in this case, so filename completion
-would fail.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/complete.c	2022-04-05 10:47:06.000000000 -0400
---- complete.c	2022-10-26 15:08:51.000000000 -0400
-***************
-*** 2527,2531 ****
-  	  xfree (dirname);
-  	  dirname = temp;
-! 	  tilde_dirname = 1;
-  	}
-  
---- 2527,2532 ----
-  	  xfree (dirname);
-  	  dirname = temp;
-! 	  if (*dirname != '~')
-! 	    tilde_dirname = 1;	/* indicate successful tilde expansion */
-  	}
-  
-***************
-*** 2546,2554 ****
-  	  users_dirname = savestring (dirname);
-  	}
-!       else if (tilde_dirname == 0 && rl_completion_found_quote && rl_filename_dequoting_function)
-  	{
-! 	  /* delete single and double quotes */
-  	  xfree (dirname);
-! 	  dirname = savestring (users_dirname);
-  	}
-        directory = opendir (dirname);
---- 2547,2560 ----
-  	  users_dirname = savestring (dirname);
-  	}
-!       else if (rl_completion_found_quote && rl_filename_dequoting_function)
-  	{
-! 	  /* We already ran users_dirname through the dequoting function.
-! 	     If tilde_dirname == 1, we successfully performed tilde expansion
-! 	     on dirname. Now we need to reconcile those results. We either
-! 	     just copy the already-dequoted users_dirname or tilde expand it
-! 	     if we tilde-expanded dirname. */
-! 	  temp = tilde_dirname ? tilde_expand (users_dirname) : savestring (users_dirname);
-  	  xfree (dirname);
-! 	  dirname = temp;
-  	}
-        directory = opendir (dirname);
-
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 8
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 9
diff --git a/meta/recipes-core/readline/readline/readline82-010.patch b/meta/recipes-core/readline/readline/readline82-010.patch
deleted file mode 100644
index 6152953e91..0000000000
--- a/meta/recipes-core/readline/readline/readline82-010.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-			   READLINE PATCH REPORT
-			   =====================
-
-Readline-Release: 8.2
-Patch-ID: readline82-010
-
-Bug-Reported-by:	Martin Castillo <castilma@uni-bremen.de>
-Bug-Reference-ID:	<2d42153b-cf65-caba-dff1-cd3bc6268c7e@uni-bremen.de>
-Bug-Reference-URL:	https://lists.gnu.org/archive/html/bug-readline/2023-01/msg00000.html
-
-Bug-Description:
-
-Fix the case where text to be completed from the line buffer (quoted) is
-compared to the common prefix of the possible matches (unquoted) and the
-quoting makes the former appear to be longer than the latter. Readline
-assumes the match doesn't add any characters to the word and doesn't display
-multiple matches.
-
-Patch (apply with `patch -p0'):
-
-Upstream-Status: Submitted [https://ftp.gnu.org/gnu/readline/readline-8.2-patches/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-*** ../readline-8.2-patched/complete.c	Tue Apr  5 10:47:06 2022
---- complete.c	Sat Jan  7 14:19:45 2023
-***************
-*** 2032,2038 ****
-    text = rl_copy_text (start, end);
-    matches = gen_completion_matches (text, start, end, our_func, found_quote, quote_char);
-    /* nontrivial_lcd is set if the common prefix adds something to the word
-       being completed. */
-!   nontrivial_lcd = matches && compare_match (text, matches[0]) != 0;
-    if (what_to_do == '!' || what_to_do == '@')
-      tlen = strlen (text);
---- 2038,2060 ----
-    text = rl_copy_text (start, end);
-    matches = gen_completion_matches (text, start, end, our_func, found_quote, quote_char);
-+   /* If TEXT contains quote characters, it will be dequoted as part of
-+      generating the matches, and the matches will not contain any quote
-+      characters. We need to dequote TEXT before performing the comparison.
-+      Since compare_match performs the dequoting, and we only want to do it
-+      once, we don't call compare_matches after dequoting TEXT; we call
-+      strcmp directly. */
-    /* nontrivial_lcd is set if the common prefix adds something to the word
-       being completed. */
-!   if (rl_filename_completion_desired && rl_filename_quoting_desired &&
-!       rl_completion_found_quote && rl_filename_dequoting_function)
-!     {
-!       char *t;
-!       t = (*rl_filename_dequoting_function) (text, rl_completion_quote_character);
-!       xfree (text);
-!       text = t;
-!       nontrivial_lcd = matches && strcmp (text, matches[0]) != 0;
-!     }
-!   else
-!     nontrivial_lcd = matches && strcmp (text, matches[0]) != 0;
-    if (what_to_do == '!' || what_to_do == '@')
-      tlen = strlen (text);
-
-*** ../readline-8.2/patchlevel	2013-11-15 08:11:11.000000000 -0500
---- patchlevel	2014-03-21 08:28:40.000000000 -0400
-***************
-*** 1,3 ****
-  # Do not edit -- exists only for use by patch
-  
-! 9
---- 1,3 ----
-  # Do not edit -- exists only for use by patch
-  
-! 10
diff --git a/meta/recipes-core/readline/readline_8.2.13.bb b/meta/recipes-core/readline/readline_8.2.13.bb
new file mode 100644
index 0000000000..78b988365a
--- /dev/null
+++ b/meta/recipes-core/readline/readline_8.2.13.bb
@@ -0,0 +1,5 @@
+require readline.inc
+
+SRC_URI += "  file://norpath.patch"
+
+SRC_URI[archive.sha256sum] = "0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"
diff --git a/meta/recipes-core/readline/readline_8.2.bb b/meta/recipes-core/readline/readline_8.2.bb
deleted file mode 100644
index f0dba31251..0000000000
--- a/meta/recipes-core/readline/readline_8.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require readline.inc
-
-SRC_URI += "  file://norpath.patch"
-
-SRC_URI += "file://readline82-001.patch;striplevel=0 \
-            file://readline82-002.patch;striplevel=0 \
-            file://readline82-003.patch;striplevel=0 \
-            file://readline82-004.patch;striplevel=0 \
-            file://readline82-005.patch;striplevel=0 \
-            file://readline82-006.patch;striplevel=0 \
-            file://readline82-007.patch;striplevel=0 \
-            file://readline82-008.patch;striplevel=0 \
-            file://readline82-009.patch;striplevel=0 \
-            file://readline82-010.patch;striplevel=0 \
-           "
-
-SRC_URI[archive.sha256sum] = "3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35"
-- 
2.27.0


