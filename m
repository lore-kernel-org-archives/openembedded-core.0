Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ED8C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9245.1749722232005168600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4SVJD006799
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 02:57:11 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq45akd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 02:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCCX+2p7loNAYQEHvS6ld4RhGXNfE/53t+mQf1bBk9oobwxSuGF/1cnYFOWuUBZTofnTYDRnMUx1Tfhq54K1lajAL1gozcIys3nIJNCuADR+sbrrSsF6jaEzB9+1wn9Fw/huYg6nWNenTUyrOG7nHd2LlwUeARjLO/KS/Qrxt687+9KNO514Rny4Yt+QwjFTfrQ0d04/3Jk6xFti5DRqwOafPCiuqJMhOoKswlS/jp3J1j9tKdvwOBKJDqiHybk497nf6kismxZuYA1uLrqpi7xMCU8+jDGyc4MmUAPEbE3MX2/HBtyB4acg/J6DXrJXMRSmRZetOraINcpnFuqsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqU29vl2jS4Bwa0KM320uFmzE4k6MxGCG/8YpguYwP8=;
 b=oi1W7tVHoovpmUKEOlcUkm+SAzjeF9MdGwgRG4kmo1SD+nktcDWjWYrkGWTJd8Z6js91v0eodpiSEtwl4oYtX7dzHf4+Mh8crogeANjq8CpMKrep9KLRXtjlSUpAoPiKIuPO3cY+oljdfmPBS98oobN8LMxCbnzqrDqRXcLsU1oBOyjgt0iE858Vor97do640DxWIuzbCxU+99dl+fCwC79AiyY9+I952GKBDhqV7o0aV8ds5FRik1OuP2LQ0BboNcympK+ufDCpOBWwwFLQD6Zm9Z8pFKgopb2XwOq/yjk6+j4Ljakw0VTbO43UfeufzsBT94Jdaj/dL52u/Yd1og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:09 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:09 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 1/8] pthreads NPTL: lost wakeup fix 2
Date: Thu, 12 Jun 2025 02:56:32 -0700
Message-ID: <20250612095639.3630518-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: add88d6c-50de-45c4-b476-08dda9977ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wen9AMFGE6MA4h6xmqCAW3Stu5b5jiXvOV0SGPxFF8gckqaEjVFmQBmESv0i?=
 =?us-ascii?Q?YKb4oyXWfA7Fmif/h3Yl7+5dPX5/v1yYRn+crWFZ/w5w2oeYME2vHc4QDx86?=
 =?us-ascii?Q?l90uAN9IWOGDCQb/t2UpkBD+4EDF60QwUA1/q8pwimXFxknCiF8To1LPa+FD?=
 =?us-ascii?Q?t8x5oY5Mzcb3mOeUzbj9s2qLH4uI3ACHRKO6KUq2DzOMUnGPxsZjygh10gXc?=
 =?us-ascii?Q?m7PTJhnAqLNGR4GtvgX9SyRe3xemZwYLuDKx2YoFbSCPEBHj/AcsSgdYrgxl?=
 =?us-ascii?Q?mybwFAO/POamMr9AurJpWgnSSeGT+ePFr0D2RP+UPbJ1/nRtL5CuHcgjC4ct?=
 =?us-ascii?Q?TrvEsw9duMi/+80DqCs20zbJx1N2OnmXCNyVybE3F7y/QKR8Fw+6AvVGiK5d?=
 =?us-ascii?Q?GAZeakgnF/viZwXXah8+cVOEMVZtMDMvSfNusBObD0ekBaBput+uu0yqLQ66?=
 =?us-ascii?Q?Q2GQ6ePozGiVdDtDSA1UvGshrTQaR/C7ths7xnyAwqdsd9jnZE5P0pFioJmH?=
 =?us-ascii?Q?ZRaAIgANT1bNBGB7IIh+kzJ615aMeWX66mn5Zomf+oWqjkrB4lYZmaZVIxDM?=
 =?us-ascii?Q?7LhPGepddsIMBzBdzpek6s2yRrYtEUIfdo6ysa4gyMnc2+Q+3Um1Ln4saNpp?=
 =?us-ascii?Q?5SUVv+CLAgnxoN43K24GJFwUaVj6nWB5Vs7yS0zMWVmamOBxSng3T/TQzASN?=
 =?us-ascii?Q?wRQnoPUR+9gwhmom+7fnwzdOEkSqbKHr2x36hh0VPfGhGU0Hg8lVYiomuiHH?=
 =?us-ascii?Q?wbSzn+abTqGnJp1psP8UQyoTWg+qHKNilzdipLpkFM/rQWdAjwmMDCSAhxbR?=
 =?us-ascii?Q?ICUa3ioSgzhwvFWsbhovwEgBe6q4nfbQCa1Qgx0++54dCRIJA3DGiiOPHZzf?=
 =?us-ascii?Q?UKEXunlaS/p6q+/1A/ZMLT1PwBN0+znhjyhlPDLidszcc7el/IrASby39PXe?=
 =?us-ascii?Q?PzzUZCB/9LEZP94swNeVnMa65+JM7995SoDNvhorsPOfW4xuP5Ou/9m+LJh4?=
 =?us-ascii?Q?c3Hvje7B/yLyTchFk/93qOpEi7CRz3F1eeKSRFmKbxK7gCBrsUAYAZuokhj1?=
 =?us-ascii?Q?PDk1eP4CjzBbsfcupNFRyz4RBUeLv1xTSXX6/i0nAbkBMROgS9yd4Gpcooug?=
 =?us-ascii?Q?ntPjoK/yK18ZtZ0M7epv8smQ0tOgtQnnR+ECpOHpfjCJx5maiU9LVDwS6z06?=
 =?us-ascii?Q?rRyHbyRz+3LRc6En8fI7P1crusCty+I42fNgu86VJ+uziK3JW6R6LMEC28VN?=
 =?us-ascii?Q?KhyIE7oUysDhmVlf5AExfBhFEAllDWdirWLD7OARC+BvtQ4un6EsZUuDWZ4c?=
 =?us-ascii?Q?AlQYgufYDS9G9zY85imdWORINLbHsz9vdEp1ueoNCWrLM36JKFcW1t/rJZnY?=
 =?us-ascii?Q?gm5Ju3cNLkAXTqb30D4N7KC79WlukssztfeAfoz+QUtWiVszIDY+cxB7i/9y?=
 =?us-ascii?Q?Y4GonZUGd1o21tJqqqVDtu18y4NfVFcuIQBot0yloF1Oo2in1lGGqer6Dx9g?=
 =?us-ascii?Q?216aAp67/HP1L5w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g0+QQ3m0SpSiWk2CEbBJJogkC/IPgFYkNtz950qgbWw1ZgBnusHXZU3hbnQ4?=
 =?us-ascii?Q?AVteQLex8vtUmNUIqdB57E3eXZ3BhuqDXnWkCi19pkF+UywXZjehj8vTBfpG?=
 =?us-ascii?Q?YytkMViOseT2DqQ1m+/dP6RFZsB7of3MqJDg+u73F1gEQCwdvZfzMInw9GUi?=
 =?us-ascii?Q?h941WhT5RCVvs1jzz301rcbAqKzUz5TL14LBXLnaGcxCCdPRVtIHpgReJhww?=
 =?us-ascii?Q?4mX8aOoi2eeBGZYGiT23ln2qZ4anyMYWCw/FEocy9oyrfNNlF6EhZ9Bkk5Sv?=
 =?us-ascii?Q?I5Y+C3xWh1CaXLdex99lL9JdEFtxiCg7M2F8rUteNlZ/x+ux1K8PzXilOonJ?=
 =?us-ascii?Q?CpgFDGogQiL4Q1/Zg8rmtgxgRFzT/x4WADogReMhu7zPx2ROM8rM+SvRhVp4?=
 =?us-ascii?Q?5MxoyC7aut0m8pIutgpqVFk5HWDlkFpPXmVkSKmp27evZ1nGRDufg0M0YKXs?=
 =?us-ascii?Q?sDUtulRkxp+OXrL6AHaqq3Vn4YmvMKLbQQrqsUNuALYZMQn38GqeLIQszck/?=
 =?us-ascii?Q?/ZNA3Avsw7a6INYp0hhgKOvZ2rnGzYPcvdjTi/KUD8MUgJJZ/2kxW+NIitCK?=
 =?us-ascii?Q?NsgwN3jwzIeW36l+NpavUTPHRpt1Q+DcbmCx0s5I0cKSV9zYD4g7o3LTHzaS?=
 =?us-ascii?Q?lMPMvFpEz3YLiFyRYHm8wUEuWPy5k0c1/kCxUcMP8hHRs4+OcDOqkjVV3LNQ?=
 =?us-ascii?Q?z5LCHpYGiFadOtus55Sn4FJkTTmpvLMTVZ9prNUIAU4FgOknqv+m1VtkqG5k?=
 =?us-ascii?Q?WUQd+tDUwIA3ep5nGIKpJGFoHTUoKfHMlvpmvPCCg1W5dvkJNY2joq9pLt1M?=
 =?us-ascii?Q?0xdYMee2gUvitk7a5CnP4UOlVj36ljvKJASdRmUdeOMLXTxrczeLqv9c/y6j?=
 =?us-ascii?Q?YMbx+OYscSmabqiiufitr0Fv5clqkE33Sn63rcy3aaWuaMd4ffaaA/C/oAmk?=
 =?us-ascii?Q?7qQzoDsO1wfMDxeb4ObC+3pYKDxhLAjjT2hGYi4mYbVxHFVEZEsxUzRf+m4q?=
 =?us-ascii?Q?/uiaE8ywdmOuXF0DJDEIc3zmSRYvoLMYk/r1nJPt/sea1bIX2TR+x9LuEt4P?=
 =?us-ascii?Q?mVB1/705PhZLz3V+SA78Yio7y/3SACzMwUfwj94OvH7r1uRkL/TeYGvgo8jG?=
 =?us-ascii?Q?NuhxyiX+SUbZpRfmcjaDHH0I8kDxUv057qkBUfxIvdd/fFoImueCr2LJVYqc?=
 =?us-ascii?Q?Cc42JjT0/r3gdQ7diRIouTYXgOr0oucuKfahGMrCoy3UagaUK5+oIyv2nF+j?=
 =?us-ascii?Q?+7UbhawjJrxOKs498Y3nRS9jAgugEM5GFEhqXrZ1v5jBXke/IT+/Po15Vulu?=
 =?us-ascii?Q?gyuKV5bE9Ka1Js4jNrH3mGJr8Kb9aT0CES0MjLCZSvqaCb5pE7E2WUCJAFON?=
 =?us-ascii?Q?Y//RENXildBKm2JsWue6WFwf1IgncAS8jeMo6fLrdkcJlmSz/BTRy8HqrWdz?=
 =?us-ascii?Q?cyI/Gr+MU/iXo6Ao8UXmxP14JXEXoKj6QKx/IwACY9yWDmMCwRFltvacBtX5?=
 =?us-ascii?Q?ZrbQbYEeqKF05HcqOlfgECSytomMEe8FloN1dDF4omAXkvb5D74nxhQSlurY?=
 =?us-ascii?Q?O6t4gZ3ZeWFF3gd0XrwpNnxInHK6iIvIsyBKkG2JxcGORCEppSjgxgxeOBsG?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: add88d6c-50de-45c4-b476-08dda9977ef2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:09.3422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWgKsSq83Dko21XTQu9ML9+2QAef4kHfn0+Vilif07OziE6Sg9WL9uaHQXplwCjJ6+1m8kyvOQR60i+FrdBS4QeSwuoyVeSglnoQbnGHop8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684aa477 cx=c_pps a=Ns4bprCil9VHDTMiZxHROw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=-y7sjS4E6xoPhqQzj00A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zKs1TTxazXxjfmDmy4_0gOZ6CrwbJd-r
X-Proofpoint-ORIG-GUID: zKs1TTxazXxjfmDmy4_0gOZ6CrwbJd-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX7n9tUvVdXbr6 lVxJ3TuDCSlS53t7g8vKKwb+i+PTeinzjsETEbl5Z1F8CpCDOmatxP5+/6szVgZwL7o1i0Q1EwL +ib7mXNLUZSujLLgylbYT3BDXxIVs7bJmz/CAP1hh9LGK5w4XFjPOJO0XVyaBdB2Dec0PbDhkp9
 DkQ3is0YmN9UTn5I1bw8KSsKfQ1RZLVbScb2we77BuPYrlhV9a/gnAno2x02ZijHZy1lteLBJIR WxYbImbu+9904c2lTMxuIz+37tP1sA0jE3eEzBjfK3RbW3gvawp3DTnRniJnPdOk5Ycn7WiMnuR 5BarfScuyNn7iomJMqTmxwZxLWh0ZPSwAQ7DGwFBH/CFDpVHRk3I3qTll2kE+3RaPScFUrO+j4j
 lb1R7Q0DP66ruaLeOAAONCNFrh1nJiJeCtQI4uUEi3MxDtTQXuohb8/ChD6n3hQHPq/M27W8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218493

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [1db84775f831a1494993ce9c118deaf9537cc50a]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-1.patch          | 453 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 454 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
new file mode 100644
index 0000000000..67a6fa1e62
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
@@ -0,0 +1,453 @@
+From 6f030a8faf242b897e714cb77c65254b14682cfc Mon Sep 17 00:00:00 2001
+From: Frank Barrus <frankbarrus_sw@shaggy.cc>
+Date: Mon, 9 Jun 2025 02:32:52 -0700
+Subject: [PATCH] pthreads NPTL: lost wakeup fix 2
+
+This fixes the lost wakeup (from a bug in signal stealing) with a change
+in the usage of g_signals[] in the condition variable internal state.
+It also completely eliminates the concept and handling of signal stealing,
+as well as the need for signalers to block to wait for waiters to wake
+up every time there is a G1/G2 switch.  This greatly reduces the average
+and maximum latency for pthread_cond_signal.
+
+The g_signals[] field now contains a signal count that is relative to
+the current g1_start value.  Since it is a 32-bit field, and the LSB is
+still reserved (though not currently used anymore), it has a 31-bit value
+that corresponds to the low 31 bits of the sequence number in g1_start.
+(since g1_start also has an LSB flag, this means bits 31:1 in g_signals
+correspond to bits 31:1 in g1_start, plus the current signal count)
+
+By making the signal count relative to g1_start, there is no longer
+any ambiguity or A/B/A issue, and thus any checks before blocking,
+including the futex call itself, are guaranteed not to block if the G1/G2
+switch occurs, even if the signal count remains the same.  This allows
+initially safely blocking in G2 until the switch to G1 occurs, and
+then transitioning from G1 to a new G1 or G2, and always being able to
+distinguish the state change.  This removes the race condition and A/B/A
+problems that otherwise ocurred if a late (pre-empted) waiter were to
+resume just as the futex call attempted to block on g_signal since
+otherwise there was no last opportunity to re-check things like whether
+the current G1 group was already closed.
+
+By fixing these issues, the signal stealing code can be eliminated,
+since there is no concept of signal stealing anymore.  The code to block
+for all waiters to exit g_refs can also be removed, since any waiters
+that are still in the g_refs region can be guaranteed to safely wake
+up and exit.  If there are still any left at this time, they are all
+sent one final futex wakeup to ensure that they are not blocked any
+longer, but there is no need for the signaller to block and wait for
+them to wake up and exit the g_refs region.
+
+The signal count is then effectively "zeroed" but since it is now
+relative to g1_start, this is done by advancing it to a new value that
+can be observed by any pending blocking waiters.  Any late waiters can
+always tell the difference, and can thus just cleanly exit if they are
+in a stale G1 or G2.  They can never steal a signal from the current
+G1 if they are not in the current G1, since the signal value that has
+to match in the cmpxchg has the low 31 bits of the g1_start value
+contained in it, and that's first checked, and then it won't match if
+there's a G1/G2 change.
+
+Note: the 31-bit sequence number used in g_signals is designed to
+handle wrap-around when checking the signal count, but if the entire
+31-bit wraparound (2 billion signals) occurs while there is still a
+late waiter that has not yet resumed, and it happens to then match
+the current g1_start low bits, and the pre-emption occurs after the
+normal "closed group" checks (which are 64-bit) but then hits the
+futex syscall and signal consuming code, then an A/B/A issue could
+still result and cause an incorrect assumption about whether it
+should block.  This particular scenario seems unlikely in practice.
+Note that once awake from the futex, the waiter would notice the
+closed group before consuming the signal (since that's still a 64-bit
+check that would not be aliased in the wrap-around in g_signals),
+so the biggest impact would be blocking on the futex until the next
+full wakeup from a G1/G2 switch.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [1db84775f831a1494993ce9c118deaf9537cc50a]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 105 +++++++++------------------
+ nptl/pthread_cond_wait.c   | 144 ++++++++++++-------------------------
+ 2 files changed, 81 insertions(+), 168 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index fb035f72..a55eee3e 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -201,7 +201,6 @@ static bool __attribute__ ((unused))
+ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+-  const unsigned int maxspin = 0;
+   unsigned int g1 = *g1index;
+ 
+   /* If there is no waiter in G2, we don't do anything.  The expression may
+@@ -222,84 +221,46 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by setting a flag in
+-       __g_signals, which will prevent waiters from blocking using a futex on
+-       __g_signals and also notifies them that the group is closed.  As a
+-       result, they will eventually remove their group reference, allowing us
+-       to close switch group roles.  */
+-
+-  /* First, set the closed flag on __g_signals.  This tells waiters that are
+-     about to wait that they shouldn't do that anymore.  This basically
+-     serves as an advance notificaton of the upcoming change to __g1_start;
+-     waiters interpret it as if __g1_start was larger than their waiter
+-     sequence position.  This allows us to change __g1_start after waiting
+-     for all existing waiters with group references to leave, which in turn
+-     makes recovery after stealing a signal simpler because it then can be
+-     skipped if __g1_start indicates that the group is closed (otherwise,
+-     we would have to recover always because waiters don't know how big their
+-     groups are).  Relaxed MO is fine.  */
+-  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
+-
+-  /* Wait until there are no group references anymore.  The fetch-or operation
+-     injects us into the modification order of __g_refs; release MO ensures
+-     that waiters incrementing __g_refs after our fetch-or see the previous
+-     changes to __g_signals and to __g1_start that had to happen before we can
+-     switch this G1 and alias with an older group (we have two groups, so
+-     aliasing requires switching group roles twice).  Note that nobody else
+-     can have set the wake-request flag, so we do not have to act upon it.
+-
+-     Also note that it is harmless if older waiters or waiters from this G1
+-     get a group reference after we have quiesced the group because it will
+-     remain closed for them either because of the closed flag in __g_signals
+-     or the later update to __g1_start.  New waiters will never arrive here
+-     but instead continue to go into the still current G2.  */
+-  unsigned r = atomic_fetch_or_release (cond->__data.__g_refs + g1, 0);
+-  while ((r >> 1) > 0)
+-    {
+-      for (unsigned int spin = maxspin; ((r >> 1) > 0) && (spin > 0); spin--)
+-	{
+-	  /* TODO Back off.  */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-      if ((r >> 1) > 0)
+-	{
+-	  /* There is still a waiter after spinning.  Set the wake-request
+-	     flag and block.  Relaxed MO is fine because this is just about
+-	     this futex word.
+-
+-	     Update r to include the set wake-request flag so that the upcoming
+-	     futex_wait only blocks if the flag is still set (otherwise, we'd
+-	     violate the basic client-side futex protocol).  */
+-	  r = atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) | 1;
+-
+-	  if ((r >> 1) > 0)
+-	    futex_wait_simple (cond->__data.__g_refs + g1, r, private);
+-	  /* Reload here so we eventually see the most recent value even if we
+-	     do not spin.   */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-    }
+-  /* Acquire MO so that we synchronize with the release operation that waiters
+-     use to decrement __g_refs and thus happen after the waiters we waited
+-     for.  */
+-  atomic_thread_fence_acquire ();
++     * Waiters in G1 will be closed out immediately by the advancing of
++       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++       which will prevent waiters from blocking using a futex on
++       __g_signals since it provides enough signals for all possible
++       remaining waiters.  As a result, they can each consume a signal
++       and they will eventually remove their group reference.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+      switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.  See above for
+-     why this takes place after waiting for quiescence of the group.
++     case G1 will be at index 1 and we will add a value of 1.
+      Relaxed MO is fine because the change comes with no additional
+      constraints that others would have to observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+-  /* Now reopen the group, thus enabling waiters to again block using the
+-     futex controlled by __g_signals.  Release MO so that observers that see
+-     no signals (and thus can block) also see the write __g1_start and thus
+-     that this is now a new group (see __pthread_cond_wait_common for the
+-     matching acquire MO loads).  */
+-  atomic_store_release (cond->__data.__g_signals + g1, 0);
++  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++
++  /* If any waiters still hold group references (and thus could be blocked),
++     then wake them all up now and prevent any running ones from blocking.
++     This is effectively a catch-all for any possible current or future
++     bugs that can allow the group size to reach 0 before all G1 waiters
++     have been awakened or at least given signals to consume, or any
++     other case that can leave blocked (or about to block) older waiters..  */
++  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
++   {
++    /* First advance signals to the end of the group (i.e. enough signals
++       for the entire G1 group) to ensure that waiters which have not
++       yet blocked in the futex will not block.
++       Note that in the vast majority of cases, this should never
++       actually be necessary, since __g_signals will have enough
++       signals for the remaining g_refs waiters.  As an optimization,
++       we could check this first before proceeding, although that
++       could still leave the potential for futex lost wakeup bugs
++       if the signal count was non-zero but the futex wakeup
++       was somehow lost.  */
++    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++
++    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
++   }
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -311,6 +272,10 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
++  /* Now advance the new G1 g_signals to the new lowseq, giving it
++     an effective signal count of 0 to start.  */
++  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+   unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 20c348a5..1cb3dbf7 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
+    signaled), and a reference count.
+ 
+    The group reference count is used to maintain the number of waiters that
+-   are using the group's futex.  Before a group can change its role, the
+-   reference count must show that no waiters are using the futex anymore; this
+-   prevents ABA issues on the futex word.
++   are using the group's futex.
+ 
+    To represent which intervals in the waiter sequence the groups cover (and
+    thus also which group slot contains G1 or G2), we use a 64b counter to
+@@ -300,11 +298,12 @@ __condvar_cleanup_waiting (void *arg)
+        last reference.
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+-   __g_signals: The number of signals that can still be consumed.
++   __g_signals: The number of signals that can still be consumed, relative to
++     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
++     31 to 1 of g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is true iff this group has been completely signaled (i.e., it is
+-       closed).
++     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -328,18 +327,6 @@ __condvar_cleanup_waiting (void *arg)
+    sufficient because if a waiter can see a sufficiently large value, it could
+    have also consume a signal in the waiters group.
+ 
+-   Waiters try to grab a signal from __g_signals without holding a reference
+-   count, which can lead to stealing a signal from a more recent group after
+-   their own group was already closed.  They cannot always detect whether they
+-   in fact did because they do not know when they stole, but they can
+-   conservatively add a signal back to the group they stole from; if they
+-   did so unnecessarily, all that happens is a spurious wake-up.  To make this
+-   even less likely, __g1_start contains the index of the current g2 too,
+-   which allows waiters to check if there aliasing on the group slots; if
+-   there wasn't, they didn't steal from the current G1, which means that the
+-   G1 they stole from must have been already closed and they do not need to
+-   fix anything.
+-
+    It is essential that the last field in pthread_cond_t is __g_signals[1]:
+    The previous condvar used a pointer-sized field in pthread_cond_t, so a
+    PTHREAD_COND_INITIALIZER from that condvar implementation might only
+@@ -435,6 +422,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
++          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+ 	     passed might lead to what looks like a spurious wake-up even
+@@ -446,35 +436,45 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     having to compare against the current time seems to be the right
+ 	     choice from a performance perspective for most use cases.  */
+ 	  unsigned int spin = maxspin;
+-	  while (signals == 0 && spin > 0)
++	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+ 	    {
+ 	      /* Check that we are not spinning on a group that's already
+ 		 closed.  */
+-	      if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-		goto done;
++	      if (seq < (g1_start >> 1))
++		break;
+ 
+ 	      /* TODO Back off.  */
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
++              g1_start = __condvar_load_g1_start_relaxed (cond);
++              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-	  /* If our group will be closed as indicated by the flag on signals,
+-	     don't bother grabbing a signal.  */
+-	  if (signals & 1)
+-	    goto done;
+-
+-	  /* If there is an available signal, don't block.  */
+-	  if (signals != 0)
++          if (seq < (g1_start >> 1))
++	    {
++              /* If the group is closed already,
++	         then this waiter originally had enough extra signals to
++	         consume, up until the time its group was closed.  */
++	       goto done;
++            }
++
++	  /* If there is an available signal, don't block.
++             If __g1_start has advanced at all, then we must be in G1
++	     by now, perhaps in the process of switching back to an older
++	     G2, but in either case we're allowed to consume the available
++	     signal and should not block anymore.  */
++	  if ((int)(signals - lowseq) >= 2)
+ 	    break;
+ 
+ 	  /* No signals available after spinning, so prepare to block.
+ 	     We first acquire a group reference and use acquire MO for that so
+ 	     that we synchronize with the dummy read-modify-write in
+ 	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the closed flag on __g_signals
+-	     that designates a concurrent attempt to reuse the group's slot.
++	     in this case this will make us see the advancement of __g_signals
++	     to the upcoming new g1_start that occurs with a concurrent
++	     attempt to reuse the group's slot.
+ 	     We use acquire MO for the __g_signals check to make the
+ 	     __g1_start check work (see spinning above).
+ 	     Note that the group reference acquisition will not mask the
+@@ -482,15 +482,24 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) != 0)
+-	      || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
++	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
++          g1_start = __condvar_load_g1_start_relaxed (cond);
++          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++          if (seq < (g1_start >> 1))
+ 	    {
+-	      /* Our group is closed.  Wake up any signalers that might be
+-		 waiting.  */
++              /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
++	  if ((int)(signals - lowseq) >= 2)
++	    {
++	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      __condvar_dec_grefs (cond, g, private);
++	      break;
++            }
++
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+ 	  struct _condvar_cleanup_buffer cbuffer;
+@@ -501,7 +510,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+ 
+ 	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, 0, clockid, abstime, private);
++	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+ 
+ 	  __pthread_cleanup_pop (&buffer, 0);
+ 
+@@ -524,6 +533,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+ 
++       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
++	 goto done;
+     }
+   /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+      of __g1_start below (see spinning above for a similar case).  In
+@@ -532,69 +543,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-  /* We consumed a signal but we could have consumed from a more recent group
+-     that aliased with ours due to being in the same group slot.  If this
+-     might be the case our group must be closed as visible through
+-     __g1_start.  */
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-  if (seq < (g1_start >> 1))
+-    {
+-      /* We potentially stole a signal from a more recent group but we do not
+-	 know which group we really consumed from.
+-	 We do not care about groups older than current G1 because they are
+-	 closed; we could have stolen from these, but then we just add a
+-	 spurious wake-up for the current groups.
+-	 We will never steal a signal from current G2 that was really intended
+-	 for G2 because G2 never receives signals (until it becomes G1).  We
+-	 could have stolen a signal from G2 that was conservatively added by a
+-	 previous waiter that also thought it stole a signal -- but given that
+-	 that signal was added unnecessarily, it's not a problem if we steal
+-	 it.
+-	 Thus, the remaining case is that we could have stolen from the current
+-	 G1, where "current" means the __g1_start value we observed.  However,
+-	 if the current G1 does not have the same slot index as we do, we did
+-	 not steal from it and do not need to undo that.  This is the reason
+-	 for putting a bit with G2's index into__g1_start as well.  */
+-      if (((g1_start & 1) ^ 1) == g)
+-	{
+-	  /* We have to conservatively undo our potential mistake of stealing
+-	     a signal.  We can stop trying to do that when the current G1
+-	     changes because other spinning waiters will notice this too and
+-	     __condvar_quiesce_and_switch_g1 has checked that there are no
+-	     futex waiters anymore before switching G1.
+-	     Relaxed MO is fine for the __g1_start load because we need to
+-	     merely be able to observe this fact and not have to observe
+-	     something else as well.
+-	     ??? Would it help to spin for a little while to see whether the
+-	     current G1 gets closed?  This might be worthwhile if the group is
+-	     small or close to being closed.  */
+-	  unsigned int s = atomic_load_relaxed (cond->__data.__g_signals + g);
+-	  while (__condvar_load_g1_start_relaxed (cond) == g1_start)
+-	    {
+-	      /* Try to add a signal.  We don't need to acquire the lock
+-		 because at worst we can cause a spurious wake-up.  If the
+-		 group is in the process of being closed (LSB is true), this
+-		 has an effect similar to us adding a signal.  */
+-	      if (((s & 1) != 0)
+-		  || atomic_compare_exchange_weak_relaxed
+-		       (cond->__data.__g_signals + g, &s, s + 2))
+-		{
+-		  /* If we added a signal, we also need to add a wake-up on
+-		     the futex.  We also need to do that if we skipped adding
+-		     a signal because the group is being closed because
+-		     while __condvar_quiesce_and_switch_g1 could have closed
+-		     the group, it might stil be waiting for futex waiters to
+-		     leave (and one of those waiters might be the one we stole
+-		     the signal from, which cause it to block using the
+-		     futex).  */
+-		  futex_wake (cond->__data.__g_signals + g, 1, private);
+-		  break;
+-		}
+-	      /* TODO Back off.  */
+-	    }
+-	}
+-    }
+-
+  done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..2d23c17a48 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0026-PR25847-1.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


