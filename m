Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B72DC44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 04:31:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15638.1784608310323791094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 21:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HICi54BV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1662381085=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3aA5q1584403
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 21:31:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lEnmHvUemps7tSKcW61ZLn1izUf5ixxwaKma6WXB4yc=; b=
	HICi54BVYOroGo/3C6OhV5LOCLr3NHwqljX31oL+/oSbZCwJyNO1kqxvLapnILLe
	wRYMASK8ENxdjIlcIwSLfjORbeTCcIDUhUGxNFn48ieqJn6rnjLri0MuvaGUe84f
	fqkghQqbpCnSrBfv4/X4G+v8HASKsZsZa/yavsZnYBklIgXoU09wCGLkAr2t3hxM
	7UBQg6lyR4+eLvfBsIiqhqSJ0PnE7q3jgd5RXgZMDjadr6BmDME+lVSiRU0VcEd7
	smHUhVWkHbHfKyVGsYg6XmvKYclY9sJ4frKU5eNLrFQaiCXJDcPWMU+MQWxunDqM
	WhnnROpJAY3VhKoWQuy6Og==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg90cutft-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 21:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kB5J8gU3a74OTOEDx+QmzfPMEKJRyQubXOWWW6uIwRVCdrH3bhMpXMAVWL3KjU0X/C4Ip9DiD2bEWbVAJyGi+q0ofW6HCwkWov9WWwq+aVwkBNvTefXYePzLTaBKYYkrUFkV9NFQ/OVFb2UiQ80Mp69JPcppim5V4OjFnwvrOjdQG9e6Of03/u4ah41WeKkgToCByLiLvXf4yxUP4A94bKMEjvLN+pzcY/JcdqEVw9y4H9Zjk6Xy++fTrwYgs6QIn/oYjbVyt6mho1tB4b/KD0IffY9xvYxZQCT5pFyaXzYc+N+03SI/wpYp3ttS11SqIkr/eI1kqDFQf+CuicJowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEnmHvUemps7tSKcW61ZLn1izUf5ixxwaKma6WXB4yc=;
 b=O05QkdyZjdf0oWX4ABGS2gJCNQ1BKiMbfzYy+0wybTpmOyBTbkBV0i+f/Jq1rHA0xisZbLMDqDfiabQvTvfoPfL4Xl8Kcfo0Iv2ioyVzBv0KCGPOaQFQMC+msUQK0wLsozqyf1QKL/SFPxun55/pqUHuK7uA3De413KdKqGMr8vrqyooThEtanq/lR2ATydmECKxA+UNPtGaQTlhEXBeFK+cYFvS4eM5Q+0suDK02AATWF7FGTugFkEZ5nEOJywqBNyyTbAXTAZdCvV7hf7N5aU5qHB7QL/HXpvKPV7v/HD5ZDqTzfQ4J2PQfpL60JEdSxdfCX9HCH7CvsPUeMmbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DSVPR11MB445312.namprd11.prod.outlook.com (2603:10b6:8:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:31:48 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 04:31:48 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 3/3] rust: Move do_update_snapshot to rust-source
Date: Mon, 20 Jul 2026 21:31:12 -0700
Message-ID: <20260721043124.3538696-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260721043124.3538696-1-Deepesh.Varatharajan@windriver.com>
References: <20260721043124.3538696-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DSVPR11MB445312:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f138861-89c4-4f7f-32e7-08dee6e0fa88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	096Yt8Lm/mMYxigDIofXuhg4oshN7GkMu2SaL3KDAliiOfB7xSxsnT2FaEtzX31LgqIUh3hgrILES/WLe/MOJ/flleXiHVom2OeLhwOpk2dD5llCIpMysGCiR2SRxW8DIDtt/YZTDbzskto+rqCz/RU3TWy5Pj81NTGdD5GugkHrvSFYQv7UZIfaWKdFkttvZddJtm8ein4ApSCjyAdEtz8hus+7sJPIucHG/2O0FcE7aheeViQK3D4/ahLeFs7FqZY6x+uDbbeYbXP7fRMrn96y8jyOhj0l+64BSZ2z5AqzmZ5yHw23psiNOPRmqfFi+SaqVS5KTn2gwxFZdTzjihLN8GSgsom6NiSFXLJz1qbCD/zI2mWZoFItNNtIJ9q3RLJbbnAr0YZJWIA/gS6RJaM5hNI2LSynQLi641N/vhP5o+4Msf4Q019R4YNSfmvN+R2nednNbzyiBqZmx2JqJpmbTOXmzltuyBYpooLNG3572v6mdfBVY1w5byFSb0fi27LSQazwPAoqcu/Zz6nR02zAQzeGUGVqzEhIB3/yNlgnRGkaR+670NT3yIDjOlRVr5yLS22yvXGm1GH/T7lCqH5CsG/ljdwaqWdgJP3Ew4xjCavjLLuY4Ta+BWufMnmuD+v8yovZ01BK3RbAxLoUxsWxzA74ukQQqLjwEv5cGjPaUmNJkjn2Twgkw+ZTWn7T6W0eKZWm+9sW8RwoX8DT97UEcuD1IgV41cvYRnfukPY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6S57JM0Q13QT2/7u2dc8NTKbVlGEGjMsPBadZ3LGR2KuBed7tfU9OuoAFOLp?=
 =?us-ascii?Q?cQ9LWwHeMfsVh2g2hGtEhxIpu5LffUjYsb3B9IHh6U0aPEwpJOy0RSwEKcQz?=
 =?us-ascii?Q?1IuklmgN5AXsqffvoVo3X/uVtXbQkiAreG9uIm7YMg1fK17Sl7cC5FpyhIOw?=
 =?us-ascii?Q?9uko+HYiC76eFA3jiSJv593vUsPRBMS99xaXdj0gQFOMxR4Dg5Tif16TUsVJ?=
 =?us-ascii?Q?U48xJ0hBH+HuPGGz6IDMxASO9vmT+e5QSdQR7iRsm/Yqk+Aju+15gv7j3WNN?=
 =?us-ascii?Q?i0LD6NfAqRaBntt6SsLQ5f1vUUHoNBKemXQ936wqQK+iQEx/khRIoW5FYchS?=
 =?us-ascii?Q?NdgIiL9is7eCeT8qIA57UI6SS+d69rkm0S862n4e+ac2OsQ7KO/5kehB9Tfw?=
 =?us-ascii?Q?b7Ww9PJ/U8mVI6q/e1KDRxsG+y2kFpAt+1KUnUg0CskAjDq1Q5t6yavdST8x?=
 =?us-ascii?Q?/paXJmu77QU2+f0JWZE6hA6D9a1bBwqQjBiJQqWd6VhlnTsaIpoQeyG09hjC?=
 =?us-ascii?Q?pwicxtiG6r5QH6f4gidnm1T2XUb1O9FROpJ42MdIj7SqpUp9AJEZK2NVOo2X?=
 =?us-ascii?Q?NlbQUyxNz7XwY4uBUnZZylabETqg59lsaVSNBpc39UZXhATMIEKHKvgWd6xM?=
 =?us-ascii?Q?H9ewu7vkRBZpKx68WVPiWzGq+PMgWM7CB9tyPeBVcxKo6hZ3Ywr/qerSsQNk?=
 =?us-ascii?Q?x7yd9qEsxgezPMjg2qfjSpUG+jYzYDhjo4fAcp5bOgIvGNp0IBSAPzikExDl?=
 =?us-ascii?Q?/Y3O2Iiu3QtAvd4G2RUK65hw507stQnX8oypCuPUWqMV8aOvaTAG5pDynuC/?=
 =?us-ascii?Q?FV5Nc5TNR7W4xAi6hydFUQ2o/c/T+Jh3iWS40Ru9JTiR0mn+4sRXlVKUGzwh?=
 =?us-ascii?Q?pfz9GTICvvtwUH7Nhqb4sI6Ar2Jd6XAZjvb9G4UFGOz/PFQ+aIDnDRXltzHx?=
 =?us-ascii?Q?DFYJY568XnjXkuYUaen3rYoUrUnvsHXiWxhhdMfFCLnf3G3VkktLNW2ta2Zi?=
 =?us-ascii?Q?CIxZrDEllQYUwv3wPK7UEX9HZNglnx9g5lbI8GSCsJqWmTR/N3nEo088rTmX?=
 =?us-ascii?Q?C+HxOFpsOHEieQawiwcPfiiZVhmnOQwPgEhY+qVHgj4bC5FznEEUmfTR1iPi?=
 =?us-ascii?Q?yGMQADN9o1K0+jfUWhS8VKZ5myG7bRjT0vskiM1X7h0QK/TJHAgb6WIJZeAQ?=
 =?us-ascii?Q?H2mP0KT1YsjMwkaE8/NvuQiVbR2xyx2OmbTyiLRToCASFPUspbPYDH8V4S2r?=
 =?us-ascii?Q?99m5jTK731YxWCMUfR87aUdPyQlgC4ll9rIkgzKN5nQrzphZzVwP4Sm9CPAU?=
 =?us-ascii?Q?ftDrhMDcj2WTLjMUauYu3FaNj0GrUq8sCtFt/vQw7hftL8of0/j9IcbUwaZb?=
 =?us-ascii?Q?cNxvy35TZ3NbSJbZP8Aizywl7UViE7ynP16/vEPVdfCfGrgw8mgq/R86jecK?=
 =?us-ascii?Q?uE7LF+oTAWfY9XYHXytFW9l8Nlds+kayXf3YPYaz6hfS91WAFWo2sC2xlO6j?=
 =?us-ascii?Q?D2AisL4BNCsws95RW5aTRtMgAseqkL+9SmRmINwA5xKvVKj8OtSLPQHr+k3m?=
 =?us-ascii?Q?GcioiMBslU+bH2KFqeEg76p+4ZjbYmx8chfkAreQQnoN+Le9Ododz2GhdD4p?=
 =?us-ascii?Q?D/HL4QBXdngmRswN8gkKsYzmFBZ8WwOWtDwYHBwRb8KEmTdNzcazQ5IB7s75?=
 =?us-ascii?Q?7MUMDFkdH0Z/KXXCXQTLUCOxhKCJ8XGyVXSgWYpEWOI4xo6TTLnj4N40LsRw?=
 =?us-ascii?Q?uxhljfNKtPsg/soene4TfjKq+jRHJe6/CrrwIUwAEwnwXxxAvi2+?=
X-Exchange-RoutingPolicyChecked: 
	rucz/ZerVPSkF8Aytg7Ple3cMEt/xxbqS3F0FX0rVQBEhml7i6Eo1rAG/SKnXnslMdYFnND/VjYH5OWtWSe3STmNoEWfOevLzQ820+jWOiwjOSuOd6ZfEZvFV+2zHG2c7galTYd2O/ips0aAsOUW3KlZGtGjJDT+I3c2vI4wet90BnImttXmlPNp4DUdjUu02QzDCuETn2SP9ZGKuKWLHN/tULO9izULOMG73A4DexJW8cqIUp1PYL1SGBpCqQx/gzX9VNO/zPx4BiOZhbUVVJxBXSS7AnQXRBu/7X9FTo3v+BjcmO0kOFMA6WJWgRzA8BsSBMeOKKSz2Ryp/B7mqA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f138861-89c4-4f7f-32e7-08dee6e0fa88
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:31:48.4556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0irJARa9qMuKNaJG7nTjsRjLKr+H8g2fdNaI+FHd2+fEU3lWC6Cq0OGK2Y325ptvmdrgQ6EsKtDYwVBYtmXDClea0F5uu6S/1T+K+qZwirYyrddXkM5A3IQqUydFxbR9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB445312
X-Proofpoint-ORIG-GUID: P2XAr55VGc14q5DcG4ch-POnGeBWIU64
X-Proofpoint-GUID: P2XAr55VGc14q5DcG4ch-POnGeBWIU64
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a5ef635 cx=c_pps
 a=7whtcbPCeBOLW6TxF+pv5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=M-5mPBX6iDpf5b3w-P8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0MyBTYWx0ZWRfX9vBeyTybls+I
 oLTMT1C7K8m4LFE+sRU+wxXxXXrI8zH0JZDBQz9wSYjEEdQQzkE/4hqb9T+0vBTkiulsEvIY/tK
 Ae1WFIiA7KsH+t5LdMFZbkF/kq7ivFTiPp95vpaHQIztrnbIGgFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0MyBTYWx0ZWRfX7Zne7iHCAlhA
 LEQb3VNQuGSuvVOEsAXvK5z4Uzz4n3ZgFugWuszl1t/UtvU4/RVttcH14s3PQCSUwPu5pqxAEd5
 L+V60yo8kOkljBdYmOjzYtVJXd4ACH5/zcduUw86lqEFtNiAjLYlFselCd9+CgS3ZSiwHwuWVjg
 T8ZsZaoaQELwyLESP916G1/PlaVWnrB3NXriIwwbI6UA7WdLcxgpPR4ylOkICmvipX+/d3kyA5+
 WZMu5wwlutt9yXz8LrXfRWHKfBF0LoLA5MQSb0MWuFFoNWMLiijbOnxWZF1T+I8h6bpjsxwBZW+
 VshbRcFLdnt/5qzpDTJsdGUuXFHO3QzpaYyxle5XRdeKp/nXiw/XJhQi5DXQ2zv49k7imHOvP77
 Y394aea9LcrRJsaOCtGSmAotYhhnnasHGdyL7WD2yBdFOVKBHcu0vrPqwFE70mN8UMGByuYybjh
 AX1wy58FcjT92FH7+/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241498

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Move do_update_snapshot from rust to rust-source, since
rust-source now owns do_fetch/do_unpack/do_patch tasks
after the shared source refactoring.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.bb | 72 ++++++++++++++++++++++
 meta/recipes-devtools/rust/rust_git.bb    | 73 -----------------------
 2 files changed, 72 insertions(+), 73 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-source.bb b/meta/recipes-devtools/rust/rust-source.bb
index ba696984b3..4c29b8e3c7 100644
--- a/meta/recipes-devtools/rust/rust-source.bb
+++ b/meta/recipes-devtools/rust/rust-source.bb
@@ -54,3 +54,75 @@ B = "${WORKDIR}/build"
 RUST_BUILD_ARCH = "${@{'ppc': 'powerpc', 'ppc64': 'powerpc64', 'ppc64le': 'powerpc64le', 'riscv64': 'riscv64gc'}.get(d.getVar('BUILD_ARCH'), d.getVar('BUILD_ARCH'))}"
 
 EXCLUDE_FROM_WORLD = "1"
+
+addtask do_update_snapshot after do_patch
+do_update_snapshot[nostamp] = "1"
+
+# Run with `bitbake rust-source-${PV} -c update_snapshot` to update `rust-snapshot.inc`
+# with the checksums for the rust snapshot associated with this rustc-src tarball.
+python do_update_snapshot() {
+    import json
+    import re
+    import sys
+
+    from collections import defaultdict
+
+    key_value_pairs = {}
+    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
+        for line in f:
+            # Skip empty lines or comments
+            if not line.strip() or line.startswith("#"):
+                continue
+            # Split the line into key and value using '=' as separator
+            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
+            if match:
+                key = match.group(1)
+                value = match.group(2)
+                key_value_pairs[key] = value
+    # Extract the required values from key_value_pairs
+    config_dist_server = key_value_pairs.get('dist_server', '')
+    compiler_date = key_value_pairs.get('compiler_date', '')
+    compiler_version = key_value_pairs.get('compiler_version', '')
+
+    src_uri = defaultdict(list)
+    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
+    for k, v in key_value_pairs.items():
+        # Match the pattern for checksums
+        if "dist" in k and "tar.xz" in k:
+            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
+            if m:
+                component = m.group('component')
+                arch = m.group('arch')
+                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
+    # Create the snapshot string with the extracted values
+    snapshot = """\
+## This is information on the rust-snapshot (binary) used to build our current release.
+## snapshot info is taken from rust/src/stage0
+## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
+## The exact (previous) version that has been used is specified in the source tarball.
+## The version is replicated here.
+
+SNAPSHOT_VERSION = "%s"
+
+""" % compiler_version
+    # Add the checksum components to the snapshot
+    for arch, components in src_uri.items():
+        snapshot += "\n".join(components) + "\n\n"
+    # Add the additional snapshot URIs
+    snapshot += """\
+SRC_URI += " \\
+    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
+"
+
+RUST_DIST_SERVER = "%s"
+
+RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
+""" % config_dist_server
+    # Write the updated snapshot information to the rust-snapshot.inc file
+    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
+        f.write(snapshot)
+}
diff --git a/meta/recipes-devtools/rust/rust_git.bb b/meta/recipes-devtools/rust/rust_git.bb
index da042ffaae..e75c5980f0 100644
--- a/meta/recipes-devtools/rust/rust_git.bb
+++ b/meta/recipes-devtools/rust/rust_git.bb
@@ -354,79 +354,6 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
-addtask do_update_snapshot after do_patch
-do_update_snapshot[nostamp] = "1"
-
-# Run with `bitbake -c update_snapshot rust` to update `rust-snapshot.inc`
-# with the checksums for the rust snapshot associated with this rustc-src
-# tarball.
-python do_update_snapshot() {
-    import json
-    import re
-    import sys
-
-    from collections import defaultdict
-
-    key_value_pairs = {}
-    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
-        for line in f:
-            # Skip empty lines or comments
-            if not line.strip() or line.startswith("#"):
-                continue
-            # Split the line into key and value using '=' as separator
-            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
-            if match:
-                key = match.group(1)
-                value = match.group(2)
-                key_value_pairs[key] = value
-    # Extract the required values from key_value_pairs
-    config_dist_server = key_value_pairs.get('dist_server', '')
-    compiler_date = key_value_pairs.get('compiler_date', '')
-    compiler_version = key_value_pairs.get('compiler_version', '')
-
-    src_uri = defaultdict(list)
-    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
-    for k, v in key_value_pairs.items():
-        # Match the pattern for checksums
-        if "dist" in k and "tar.xz" in k:
-            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
-            if m:
-                component = m.group('component')
-                arch = m.group('arch')
-                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
-    # Create the snapshot string with the extracted values
-    snapshot = """\
-## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0
-## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
-## The exact (previous) version that has been used is specified in the source tarball.
-## The version is replicated here.
-
-SNAPSHOT_VERSION = "%s"
-
-""" % compiler_version
-    # Add the checksum components to the snapshot
-    for arch, components in src_uri.items():
-        snapshot += "\n".join(components) + "\n\n"
-    # Add the additional snapshot URIs
-    snapshot += """\
-SRC_URI += " \\
-    ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-    ${RUST_DIST_SERVER}/dist/${RUSTC_SNAPSHOT}.tar.xz;name=rustc-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-    ${RUST_DIST_SERVER}/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
-"
-
-RUST_DIST_SERVER = "%s"
-
-RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
-""" % config_dist_server
-    # Write the updated snapshot information to the rust-snapshot.inc file
-    with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
-        f.write(snapshot)
-}
-
 RUSTLIB_DEP:class-nativesdk = ""
 
 # musl builds include libunwind.a
-- 
2.49.0


