Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF866CD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:35:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20551.1779888938417700956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IR+qxLg9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RCxt8f3067731
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=; b=
	IR+qxLg9ZN7GH8K9TJfbLP8n25Ao7lAtbDcUIUuEDNzX8hp9QnC/tygQIFdYjUUd
	1F/qNHyBhnTEqs5iTuqqVKV69ptoczAssjaJhPUUIcIApnA9PrAIS9I493vFEwdd
	lBP9ZzZiWCcXpCBIl45rEjrsjmXt3wVGzmrSL3rdA21sXcKP9crWVR5xy7ke60lC
	JKo3bM+4w57EVCH6NEBGJ6BJQ4XeB58tkUyFI+3blJvcxd6ZkzcZYQjSq5yB/vGN
	LSiyqWLp9pdJnlGjgAAq7QOJHTRtHc24b2RSkKFJiPv+YQL1Wu9Q1akQCVo3Tg2D
	k59K4pemaKlqLZQn96AZ5Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376dytx-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmgPvnEwPgBGoNCxannv7T4bPcGINsNgda/Zv8uDZo9fYRPIYBQ+/j7odZ5cKOwKpYdilomg69oL6DxNNHmb1tbwroA5jYKemtVIfJAiRRDaQXpN+VlGmjQ1y3q4aAwxZK+JVEZAJN3jZo9C35TQuqFErql726IphCkC1V3orZ4d36HGWGb+9GcW1bnByNHUCatHaqCScrZZu2kvsxYSc7g1PAv1pTjK3+YzFPKwetNUHht/o0SR8XBDV3o+2U0PiGuyPKXOoVl6VBf5vPopOwDKZHgiqwWmdWy7AR09nMzofI5cCcFbGypr2JSQmrwoaPhASenOAp1Fw4YQxnP4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAIBjI+Mxy97IdUA9oxj02q1q/KA8i7rOiJrIOWVYfI=;
 b=faLyIfwtSmGMOU/T83HsAoJ5SpupDbP4tEFvBFZKewoZbefF5Oulrchh3g2xRlV4b5YjGK0InOdyrIF6tAhgEutqd49LMSN2wytqcdIQ3Vbe+QUkXVlu9c3ybaRu9INEJvmCevN4tVYIu+9IOpgAp0oCAIE0Kld2vkjsBeFiB0OIHcoKagAAnBxYn7moeDMZVdg1ZngCgDe6jUGYqXrKcVbMYxloG5xOKUkdrROigiHGmdn00owxKChuVeKGnTcadXY6PHrYBuSg3u1t1UoqU5D4A8wfQP5pNeOq+sHHYtChnpfod5+YdWSEN3UH3oxuC8v5BmSPR/+SCE7ap9uirg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:35:33 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:35:33 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v5 3/7] gcc-runtime: package new libatomic_asneeded files
Date: Wed, 27 May 2026 06:35:09 -0700
Message-ID: <20260527133516.2337150-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
References: <20260527133516.2337150-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 9375dc3f-2a18-4e8f-664b-08debbf4d3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|22082099003|38350700014|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	eZFuO/SWypG9GcdlJBdyDdNf4LzaG06jPiJn5adZ25krGBMKysfw30tUwVM1TpnbJR//n3xID+/kS9ITrmS6ON/EJSeyVFCFDKkDAb3VDFNq49nO1Gni0I5Xk+XNnKSDjdIzb1HRMm4WnYN2ytJ5XmxhktaQ/suXyvRgSQvPB1YP/+ORfDqkX6IOb1abrOC8qz1j+zVA22Jsfg/fi4iFRjr0FepBaNjHL54ULcN8D5w4ppCVs9UXJlV87o05+Y6OjQaHwwptxrCcquP4kTO5bx5RB6vJroUS2UMB2hounGO0fGglyaM6xjfoK0YioVI2iGmbcEm+A3g52I5xKTAbREL1UwqNITxZhRB0LUHKoG1JcDetYhlYnngExmwz5vipOdd1yOZCMuErbGPi7DddodZ4CXvg8Kdq4zZcyYrnXSCFq9GgECKNqiNd4ZFJ2CoX8pZzso4JPAJUYuwoWtdVvMywZ2uC6aMxp5/qhjDSPMemuP4BwXmAwyuFJ6sQrYJjM56f9yqIdDpsiMk+wr3O89cSfX10Ilqy/13B6/IbHXTZgyRWdJNC4+sWb6XdnD2pC6pWakqVvyJHiUANEcG1mjSwfgGfR9/ZM4OqB191EtIoPJhilGhGPyTy0Uhb59GUSOnMLVpY14up/yDUMgtONhmZ8eyfKpy5v06/KROhdmIhXojb8qmaOXxPPFgqqMxYFdtKj+zq0aWpl8V7lGxyEGqcIEfTxztDOLB0dMSO05RLwMdRPEqnpxCLGaxi5gzA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(22082099003)(38350700014)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pgfCz3W1hNyUYkazqcajgBU+uW22njLvd5cM+tzhrpyEoLltxj39uU0U3wch?=
 =?us-ascii?Q?F4iA5JWaLPWo0eqiN6wJYyJ86IHxj58Mo30cq0e1suc5FCnQ6VJQgR1Qlwab?=
 =?us-ascii?Q?jwS2P0vf/oo1KlMXoyXY3/dJ9MuDSu06oanZ6EASCA5YJbjVk8j5EbTcMJ4/?=
 =?us-ascii?Q?TEfiXwWa80XcqjM9T5TBNYE34G3aekbe1eFZBCwCeXyfPgB4EF22iFR+nWbj?=
 =?us-ascii?Q?8ZEw1kt3QIRST9aHa7p5/+l6iNB3ad8BlrKcgXCcZafOSFRKvFgVC4hhRzh+?=
 =?us-ascii?Q?1mDG2ojB4DtEFUbhurH+oO8Wr6tQqKMowY6qqbGs69LqCuqcVmNljC1KopAn?=
 =?us-ascii?Q?Ktx9seuCuxMsRAGycK5Zcuk/tQ6AYltGm1A0/sByUBf+GcWlLUGikSNZsTe6?=
 =?us-ascii?Q?vtRhgibm30zOdl9qwD18yEd+o7yQsLwQmL7pTeyC5wzGRxYouwuOIZ791Ve0?=
 =?us-ascii?Q?d2EQUg9ZGPQPR1m8KFYsyyC2srdAhPOPDlvfUf5lMzdk7QaAibS3nfI0Bpji?=
 =?us-ascii?Q?aM35aWPAcFKJMlmR+eohym7SVAjMzM1j27XZ8e/lDUKWYNp7IicYHY2k9sdJ?=
 =?us-ascii?Q?ADxC431FgPi98XTn5HWnjL8KgVeA8NZiYy7LUi7B8dBcMDsnYkDf48Ra39ZZ?=
 =?us-ascii?Q?lvwGxkkV6yILbzkudxqZpZ6iXsVVZgnjWWDl6VsY/xcSd19pl/A0DwD5UyH+?=
 =?us-ascii?Q?kBYk/A/qjSozY9bSCaN2TD/rwuoE3D3Pz0zFjNyfVznIgE8HwQv9DuO6gRnZ?=
 =?us-ascii?Q?Hwndktp2QEcVHM/Y+6R0loF5wt3AiHW2BDUoaCjDk0vdnDuku/lK0VbLljqu?=
 =?us-ascii?Q?9Ec31ayCQ4guiYcwJm6Y3BQTJZMHRRCDxuT8ss7GOecV43PqfK8uqay8uio2?=
 =?us-ascii?Q?ae744ZlEXZPSxlunmt1jPvfHxB1JACkYoE4HSjYaNYHIsS0CZezqurf76+yO?=
 =?us-ascii?Q?UzzpeTMo2U0Pt7TN7YO4mRG6FtN1dwNV8nEJpcPDb0Fw/C+24KWECmwwNXHg?=
 =?us-ascii?Q?mGVChz5mK+XFJbaSxvf06qXGJ96MBhaI5LIHyZeOYPNyLon+I+N3S+y+Th0W?=
 =?us-ascii?Q?9u7nvW8jIwQxwNfT62H/2Nft0kmz3NRHUxw8nI07LrkqH5EjwOi82vUW0zf2?=
 =?us-ascii?Q?zrr3F8NAos9SSKum582rdVNKRijxTRqxQipk5VXg41CdZNizZmb6xrdGkQHS?=
 =?us-ascii?Q?cRvNPC9YEkroXdO3JXwmobI/C/cj78mRs+0UCv/9p3yNTlr3BPgClzF3EBDM?=
 =?us-ascii?Q?8lVLhd09G6//nLMHRfZ/yA4beNd0jtbJHOqi0q+2oFeN7aQjjwQzUULF9WzJ?=
 =?us-ascii?Q?ZdoyIt17bJ4uYKBVeYZcYmeoLvjU4ZqF5h9Vk0aTea6QNnuZuxiSzCk4bBj3?=
 =?us-ascii?Q?WCVNFWvhEEtZ2rdlzLER1xA45HoJETMMquBad8IrrkxhclrEpWJwcEhdt59h?=
 =?us-ascii?Q?l/YhOkKeoo8TB2a4TMJdhYqKYHHKQP29w9XkE5gq07QfOP1XZ6rFyzvLb+H9?=
 =?us-ascii?Q?V/44911YgFAFJHVv76lt/Vw0II/JhlWqazSBfwR2w5cNfJL5DZR30CuyMCTn?=
 =?us-ascii?Q?I0v5NDQB/XVwRWK+SZk2U8T8n5E1wBJCn+DsRL8Mcrniso8UopQqJw7Ykr0o?=
 =?us-ascii?Q?l2/X0Pu1TvJGv9Xn/m4O0LzivgfxchEp+5rwQCphqqfu/cxtdQMxzl7WFRMy?=
 =?us-ascii?Q?IoEldZ3zF19/gKhNgG8HKC8czjboIB1hDE0CVFRtB1TL6t/xme9k9jvINgXM?=
 =?us-ascii?Q?Zj29MFBRGq83kXwq/IIKItKCAjAc3mI=3D?=
X-Exchange-RoutingPolicyChecked: 
	Op/RdBa3JIJznAVX5lmBLeMO0vL35YWXHBRdsJmu91WX795k3itmZIM27xONFHMVMnUeWsL50WDJhdTAyi3zkg2ai0M+6lUuUGjY9k8Hz/UsASBd1+W5LIMpa6Em/KnMRL9b+Sil6T3gJ7h90xgb/9kyZCkHkcUp7+s4cRbSjStYF7A8iHshVLaTh7jOZvX9y5EvkfAx019zoWxvWwPDNjEwNDtW84ruO0uCG2bdCjfK6+2525HDPyGvbsstctmnN0G4rAYqi4DBhVZTLnqTVmYW6Z2hwGFng5RbdOgD2U96RNtfVe09Q58NJs0+1rIZ9/vpDJUoe+OqGo4YDxQbRg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9375dc3f-2a18-4e8f-664b-08debbf4d3c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:35:33.3200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO8rTSaXj0pxMxHSzltVH/G0OkRmSXstq1KGNW0UWQxOH/yget+/cCo9jyrlWJIyJX2xKwYb7Ywcuh/yC7Iq9uG33JUqVOY4Ng0iASVtFrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEzMyBTYWx0ZWRfX1ZpC8ng4jD6b
 hNi7y9c3zNylwcezIjsJZkmRCvOxWk8Ft5LiOpIak1vfmKlz4IWxvyh17ubrRzy7kMET2laqhtB
 Q3gPmC9/mIHC/iPsgXak+Egf4+e0isz+Xr5YoVA56yIPCMtGi+ofa1L+hEmkmEJ9U2xrsCyuDj3
 FdQSyNiJJAgt8/W262oLrjEF+JKAisyIzIjdZWVsvyPnlMn1vLj93PVJEQ/67c1TxNLe7fCquej
 0hnCMCvPwLgjQfxlO1FL6Y6gWrQoJvrUjTBMkpv2e3Avti0Dy/ox/+dedXIu9hPmP56ib6qjjbb
 scqidV3FbsPxr8y0/Gm6/KXckNhgfvxFviO4qlG5AeXx7bVYrMsVgfwdM33aKc6VEX4iQhTUnea
 3qC4GGDFO7Hmmt2l/yqG98GuHtkxb6oWL/NuTv/0Al8jVrJP0dD2r8dm9j5Nu8wHz5Y1usNbt7P
 kh6BpKI3w1U6YPRcvYA==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16f329 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=f-1Ak3PPjXL7i1jfQukA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rzyjqsnWWkv6cBSbVMv0izfwB6hiUC7L
X-Proofpoint-ORIG-GUID: rzyjqsnWWkv6cBSbVMv0izfwB6hiUC7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237664

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 generates libatomic_asneeded.so and libatomic_asneeded.a
during the build as part of the fix for unnecessary DT_NEEDED
entries on libatomic in GCC runtime libraries (PR libstdc++/123396).
Add them to avoid unpackaged files QA errors.

Link: https://github.com/gcc-mirror/gcc/commit/8a99fdb70493df1294b53406913e5ea1fc971c13
Link: https://github.com/gcc-mirror/gcc/commit/34039b22adea4d7809dae53f809177d6dd1155d9

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d975153bc2..30b2832c82 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -268,9 +268,10 @@ SUMMARY:libatomic = "GNU C++11 atomics support library"
 FILES:libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
+    ${libdir}/libatomic_asneeded.so \
 "
 SUMMARY:libatomic-dev = "GNU C++11 atomics support library - development files"
-FILES:libatomic-staticdev = "${libdir}/libatomic.a"
+FILES:libatomic-staticdev = "${libdir}/libatomic.a ${libdir}/libatomic_asneeded.a"
 SUMMARY:libatomic-staticdev = "GNU C++11 atomics support library - static development files"
 
 FILES:libitm = "${libdir}/libitm.so.*"
-- 
2.49.0


