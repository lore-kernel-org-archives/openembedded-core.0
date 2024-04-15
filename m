Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54F6C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 12:01:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19145.1713182482583720456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 05:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UZxmoDNR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4835052c0f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43FAZ2jg014261
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 05:01:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/kLANFcwj3nqj+cZJN
	cyWvakGWuoJEtQTK6VYTlliao=; b=UZxmoDNRJpLMqdeJaTE9u+8RJLqt/TmcHJ
	wEPMeGcI0qMhvPMIspFzpvDMF86/dv4UxzaZzbndbH8CNjMcVXbSfO1mhEAJ9rTc
	vosamfQVG68bJEBAZA8/nlz/isGcl3QKUxvFw/tRTa4qRUPL7EtmE/wPIuI43s0c
	OI0OtS2zBCqQWXSwaZFuwfIJ6ZziGdFaY/qyRTxMZFg4H0vzquemv9e+LT2oxSVe
	u+eSBCiPvqeTTNdW5TgOvvTr3Ue5+/bnrYuG4bV8ndVXH1/QzEdN0izBDuh/TqR8
	BZpvm+3IJPCBlStTIfxOk2YWPaOREkM+fpeoNqTzJSoCHWHqDnwg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb11drm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 05:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq6BEMMPj9zCTddXmMiQj0AaFQJhVhRoyDeis/hUfEHhDmrLBo8LK8Hnuqhl9qee1Y1iU9mPWpcSSBPs3atXV2Ad+u7vhxsmWPI4fbnvrHKdayyyFpI314a1mNgbtrEDFvRM0GCEmePVN4YPSovhe/UgWZlmTEtdnOh+eNp5FLklaRv7guPzstV6+vCEU0UbXS5a7oVUP40/UzLAjFyi+85OSWqI5NzJDjFZLWTRkEYHfoo6u4FUJNuhMCpPOoFpPtBytEDdWwfqwdawzCnuvqNp0BRLcUG352wvIoweLwTdC/0RCY2YYLuHNNBhVlP8kf+Z1fdPvgzBiCR4msH2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kLANFcwj3nqj+cZJNcyWvakGWuoJEtQTK6VYTlliao=;
 b=fNUrrHY6//pqTGtFCC0mt3k4/xBpUfAQJWyrOkR68s6xllsvf7z2Cbtn00SnMxDbsJ0hayXn0fTNMTZId+KlZwjKxdCvwvIldcdzqLmf8/AzkZXyoEJRMltO421PFRT7O6A61Zd+lVUWdRPue3M56P0vryzCB3siFbB3Mpe3EclHrN+aC8r9IZpK3V8pIMPDrn7QASddMk9b3Lr5hy4Ni7fmm8KiRPQs0S57Uaii9V/NYlslqK30EAW0caNqiNUHwaXrwhabmYXYPiFP7NsP0dYToupsHJ7XUw1xXoI2N42gI+L/CY27AfYeA4me0g4eBd/l1qXaD4oF8/DnqgbfYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Mon, 15 Apr
 2024 12:01:19 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 12:01:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [kirkstone][PATCH] rust: set CVE_STATUS for CVE-2024-24576
Date: Mon, 15 Apr 2024 05:01:01 -0700
Message-ID: <20240415120101.663323-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c7aa8f6-fc74-4b4e-3236-08dc5d43c2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a8DmM0COh2x1lWdqT0QoZWZktjoFle4L0snU1ZJTYJZgSGEzG/BLehxlI3XHNRyJfNReivStXNDm80+JRqGEQPnLRFjdiU+SAew4DpV08KKNSM355gJ0YRrCgXDyvnfbgVTiW/QrzY2ljgXYpMx2bdA6DTywsYRSohfEzC38QFBsPSp+HyRE8LPeR3wExsfygz+8iVITsthLhdnTnq9tAAyVObuBq4W1tipCD9rvs/BTzEkB1XtmQvS4KLoGCDxfJfp5jCaOo+mm1SqPKcZUG0CSk1Css9pEKh7Vk5zHsIsQa+wbzpcBMPc11ltRiyQjrb+2X+j/N1rLK3m1278MjBUFqGIWNAUk3KHLxcjWwge7/1nfx87yBAbzqGk879q962m0hCWdL6QjdrtpW+878DR9vdKaY9u/sjG0mjZ6T+5MpXczCZeIOW+GWPtiRyOrN5dHE8b20GVPPYbhKlsVHfY6BZA0ngAdCGIgaFpBOm3inACR9pxvGGNPPrQpOhlABVc6ElwAxOphc5IYCxjDTFYnvoMNFJRxk64K8ualvh8tgiKulXcwxLmySyE3VoRGmNYU4uvy/AM0x9WGNe2muZLZFMsbmJKjurD1k1/5BHAuYwhslGZOrrcBLkFcjdSBpFqSfybO+vH51QmeapFNl2HuAt3+CeXHjiBparjnkXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fFIUzsPm88l6R3u3g49sn5L4HJcu+tSD/xoah41u7xse3rDf2YYPrOdJxMBc?=
 =?us-ascii?Q?/BrZbu3mk/l/SqlwGpTJU22QXPBTj0gzYw6kOEDHbWftKGjEL+97HPSfxLjI?=
 =?us-ascii?Q?cnt6fX4HrIIhzUbWtpTJQ5YHlRLLCX+R05GH1xK15q7Kr/ud8VjXi2vaSazL?=
 =?us-ascii?Q?4R5ClitC3Pi3blW1QVIB7T6a0yrygOkdcFdaoozYzQkktE/TgCpVPHo+DUW8?=
 =?us-ascii?Q?wlFUpRT7qbPbkr+HFpAwsTZEUU2Sdi0tfG5DtZVnhnKn1xnbad135CSG3JUc?=
 =?us-ascii?Q?yLScTjBMhj7S7Rs3tKUibOAuXVjjcRG31KsMeE2pMAwGQF0yGChcpSKuqDLr?=
 =?us-ascii?Q?RkP/dfA/a0wdg/NPWZy3VIR+L60d8otxLv42pSBsgR8o/cR2K3prSMiZQFy3?=
 =?us-ascii?Q?nFmKFGB6tjGdS4voXM257Dc06f9L1v2k6wNkylugYMQjPoud6nMpUmlecY/v?=
 =?us-ascii?Q?+aWU7AiILOZ3TiWBeOMLjODqkSQZ5dRSCSBJrhqjSiffzA1n0/CpCBWpAYLn?=
 =?us-ascii?Q?BPIG2fuSEPCU39cUVBeuvWRkn9VxmaYkPX2YR9ML4Ik3/pMSPBXxS510jO/D?=
 =?us-ascii?Q?kswVTyrAyJRxT/r0glO4cH6akYpOBA5pVGOca8Pd9rlTnxNdb/opI4xTb85E?=
 =?us-ascii?Q?4sUssOYziZDZ+oKzkdwPPhrlvpat5+L8fJsjDFEKw82RtyxNcgA9R6mvuV5e?=
 =?us-ascii?Q?JbrrjXjNf677DUsaY9uK9EjnxWs9uaKzRTxYno9+yVWzcsEt9rhkVfs0fPNC?=
 =?us-ascii?Q?TYPBxzns+4kRLAIcNn2NQUqN/J1isavOt9ikErdTTxN6dS60LUuTemq3pdZT?=
 =?us-ascii?Q?jlKEfuLX/Vv0SMnEi5gwD6Z+pxDUgf8w9zpRxDft9uERb8hr8sYjI6DpDpgx?=
 =?us-ascii?Q?LLa5e8rR7yD4kG5gGO0R13oBsrjiZd4IwuLVmwcwPrKaZJBuM63N0SRma3V5?=
 =?us-ascii?Q?0P2UnDicVsSSgxyMNkX7p9EHkzgQNOQKWXeQC862Jb+HydULI6y4P67D1ZH4?=
 =?us-ascii?Q?Tp6Tb+dD+zv3dwDf1OKTkkpvXp0yE2LiH1gaUCmxUMunt8yjXD02EHbxT/Rl?=
 =?us-ascii?Q?eTUEDPRC+E17/xLmgKlhQFoRqvdN+ZGlRDFKSyixRtSh053dGt4m1Qa5soDZ?=
 =?us-ascii?Q?YN2xDp4/yWMcKymRWsvDSUunRx8tPN0QijGknXy2huvTTkBDntFBRohNwarU?=
 =?us-ascii?Q?YNiQIQ5j4dRlQc2AI+CdzS3tPq5Fc8xcBAj6HQ4ir/4gbEDqIzSuJ6bWEfB3?=
 =?us-ascii?Q?OBQAjpTJ6xble3p1timjDeWkvUNzgj16+c2Q0lvPx+WPcp5sIhX7OnhVO6Bq?=
 =?us-ascii?Q?jXrG1yxTN9mV9T7Wa3mqJPEYFfK/urXAl6cjM7BZZ6lA6570J/Q9N16OoGe7?=
 =?us-ascii?Q?URWZ1My0kItfurcObKGYm8M9rFh/Z+hoLBS1nm2RmwLjKg7QLqvVcSWsXI8r?=
 =?us-ascii?Q?Ue+8GWKGweC5omqNRhnY4B3Y1PtbObB8JAHJWrDlh+gtlikUmURZ874cY99V?=
 =?us-ascii?Q?5cXKTFDUJEelIT2ONn4dDYhNNceEWftw7rj4xdiR1tV8ynYqRSM1n5x6PpSn?=
 =?us-ascii?Q?jPekv0i900mm3uw3eiu7V367B6FRqSM0TSdP/Pp2PXgLxjf8ZLPvtJf0Kpbg?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7aa8f6-fc74-4b4e-3236-08dc5d43c2c8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 12:01:19.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltJZYmlUVM1S/r4OeO5fDB8NO62qA16EtnEgEN+1pnNpkE7AJxULHTAjDCpBQc+RKIRaAiq6coGRFo3zRXqdlHXX53Bm1oQkmo8HZuSWN+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
X-Proofpoint-ORIG-GUID: GbAN4b1IyKdYRcrbETGNP5wZLHqYcyTm
X-Proofpoint-GUID: GbAN4b1IyKdYRcrbETGNP5wZLHqYcyTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_10,2024-04-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=649 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404150079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198234

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2024-24576 only applies when invoking batch files (with the `bat` and `cmd` extensions) on Windows & No other platform or use is affected.
More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2024-24576

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ea70ad786f..b8dcc56482 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -5,3 +5,5 @@ RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
+
+CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.43.0


