Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDAFC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 09:05:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19910.1636967096945278171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 01:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dN57xwMe;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6953e0f3a4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AF8PeDR029553
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 01:04:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=RE1DoJnOD6K1srZf+m7aSCOCBjgRy747Yp4VbXPY5NM=;
 b=dN57xwMe49yqUiet5DYZa76FxhLsssrfJxOSVFkEJAzd3W9LFY3erd7JZR9TdiIbGlq6
 9+MIn+or8evnTqE4gJFLqsHElkXaqlk//LLlh+IkSP7iAHOsa7uE+wCZCEhvnNz3gkyC
 1viOIUpAJ8tOEsdGd8RExvmpnv/a6Udigc52MJrO6Vy4F/sh1TLbpxvF6Vr1s9ubt0WJ
 9oZiOaUVobnoZ6l+iq4r0Se+vFedAkb6ICwLujpDwhyHg3pwS2gUPADBPu/RV/aU3vaQ
 FkXJ6BKwptUlVMGLpAiu2sWDn3xtXDemy1gy+p8As7zQdbNonWp1Bwj1WaTRua7rtcTw fA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbfw5g5m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 01:04:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr2b2Kt433dbm7xVYX9s7ryRYk4n6ZUvGz5UkfEbgx4yzbcugXXEJMJwf4DhxcEn673dD/gl/sTTtZSwc2nGlHVErgcYnS9ezP/YaNPYR/CQJ5xhA6CJWU5aSGBFiXHkRUucLojcK2Vqwp+LxrEI+nDJVzSmh4KdRETGA0ckOkbB/1Oke9AfRwPGPNHjOMv7GMcIpwjZpar6JJDagdphMOS6BTBnm4hoM5f/ZkMrMrDjGbJarg0D77drfCpUvh58wlzeW1oF/e3n0EgQimxmr+77jieJ8Zp7eTx/rBGO+U/8ScfA1x/hB/Ln9JrF+Zc87VpE1qVRwGc6ZTgjaL7dxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE1DoJnOD6K1srZf+m7aSCOCBjgRy747Yp4VbXPY5NM=;
 b=QrDUYh97zjop2N/9uq3mTZ9OWu8zwHQSg9E56LHAY89koz/Gli7BaWveiGD2FsEHll01sg8RVykILKexWe1iyDLzEyJx2Jl4/Xdz9EVtyzrr7kl190YBE8M3Wzsanx0q05nwWQNwtLSDGLZLI0+d3hDsiX99kCLCLXbav2/i2hgVb4Q/zuCk9du935yX3GKwGTVMPs44/1KW+MQHH8mRdpbwm98Z6uu0kxgGcAUrIV6A4lPpIh1kkLBlbv5aGFLSWieQNANpum1/wJSOGXogI1T6LZm+IpucaH1z/MORnfBbcvzqoImAviZmyH0Bri3g6a98VLi9VaZfcxSyh5oXRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 09:04:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Mon, 15 Nov 2021
 09:04:53 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] waffle: add cmake-native to DEPENDS
Date: Mon, 15 Nov 2021 01:04:40 -0800
Message-Id: <20211115090440.94588-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::41) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 BYAPR05CA0100.namprd05.prod.outlook.com (2603:10b6:a03:e0::41) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend
 Transport; Mon, 15 Nov 2021 09:04:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d121a30b-db0d-4538-f475-08d9a816fc1f
X-MS-TrafficTypeDiagnostic: CO6PR11MB5620:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56201E7F36C7C4739690D34CED989@CO6PR11MB5620.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S4hrSeX616JamjfTg7UEVWJRaexVBGsWAcuOQ+Ec0UQVaxeeyT+I3NozwS08OHyyfT08mpzocZFUH5F26ifa/GMF2v86iotcVHUYzPaRlZTEEfWkxQW3YvTZ8gMwskDdTKvfwZPRMrN/KbMFQNUbN4u8CqBXk4s61t/TuCMkT6VthtJdAlovkbacMd/ptmRqe5/MJSAOHKKQmvNG+g5q21nTjvsa06MgWeQdEUAW5PuvNlhIredbcPU48XWYbSp0FwQ9AXMnDF5N+oo8j6YbTBJE1CCZh304nLuzUzZGu/2PeumITCZdWlGFMxF1LUQoSGvsQJ05nTMKjQosXs09Oyzu5gZOMdhM5CuCsMu2aFWSSpGV2wxqyjpsbFHi28MjjITMEaydy68Zy1RDjIvGICLRR+M+5h5ua9aLNfA2EyJFbqn8mYG3oKA+jkbn1GBeU04B4ND2ycLpbzCffh/2IaKl2vDA5wTFaVhN1P/azPfrZDxTBvfJXPZgDLiGjby3QjKt4z2IUYuhBtT+Dkw9lay7OZM5/oKxZouC0omCidYDeXZiwquYsksxSJVSjr5R1u+XPUpOptkxVdUhW2wQ2tkf6T6zju4q9aakVc9p17Tjwo29RvoywdnZEURM/EuHCn1WBW1I6RX9jBIyQfVN1GXXdrEaNa7epk6B7WAkIu4wM3b7iTzPUmUpfo467Uxuj2uq8PrI90KnRul3iAHhDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(86362001)(83380400001)(6486002)(52116002)(316002)(6506007)(508600001)(26005)(956004)(2616005)(1076003)(8676002)(6666004)(2906002)(186003)(66556008)(66476007)(38100700002)(38350700002)(8936002)(6916009)(66946007)(36756003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gh7CBPLtey9rAB7WVBmie2R6OUVO3wN2wOx5Y3XYVGBhIXSOabzHHzHq+YAK?=
 =?us-ascii?Q?2UgMtdxLRrfsLbBLATs8Hxi0EPo3J4JoCxuaiQL3y5oSo1bX6IgiqgOh9sEY?=
 =?us-ascii?Q?WMzMcMiNzPp3rtXQ5AsZJf6zpDINSaqw6L571xkTRJXxtGsV+iCgUuuDbp7N?=
 =?us-ascii?Q?P9eYdJ3m0i5xNkuYDuqZNsYscJmovSAXEZ80waaqhF8s5zRXH/F8X1Hrf/xx?=
 =?us-ascii?Q?Uv0KkGnfrZtznhoP32m+smDywzNJQ/noiV9Y68jZjG1UB0TKwY51iOz6K7Lh?=
 =?us-ascii?Q?h//GRTThoXNQk7keEalA6Jri7+/bS7HlP1c++5D8Dm31+GYFBP8wVXUa1X2v?=
 =?us-ascii?Q?nr/w9jFFhL4bDbJPl0TSzQCJCAgVZre7+npyVr8bNa9U1CMoekwGm+JNDYoj?=
 =?us-ascii?Q?BtXzyYKZAkOARTGUFXKTRLaV4ZPFHx54CX0b6U1W1yh/apZJ8CjAMatWqvzg?=
 =?us-ascii?Q?ENMd9SMRW0pigIwt9j21HE/xkvZp7FxGz/wDEDeAraqdVU5Hsd9ocwXa48bd?=
 =?us-ascii?Q?6ipyKA6lstOuXJjK90DXJ9FhIGN40RJw6xDUSfedUDVntJqIB1U8i0t1MIfk?=
 =?us-ascii?Q?O+vnif+/lmG3BpQpx5v9KlYrOWXkbMdZUfZdJnUzG+csamhx+vT5NfIjCaOM?=
 =?us-ascii?Q?XBS2pQkKpR5+DG3s0TnfAoUuFXTq+nSl8ahAuy2L7QmyNBRuv5ew/WVC52oE?=
 =?us-ascii?Q?LcsjDCGSvAK1dCTx1RvBlaEi5nHNBQeMsbMOEAsTQLxFtGjTxOKoFiOrDpXf?=
 =?us-ascii?Q?TEHzBCj3rPeN6JuqVyvreJSi4TRJpC/MuSuezvH7ZZqY7EjYWf69lgSZr030?=
 =?us-ascii?Q?Vh4blgWGH2/vQ9D3GDqV5EonnElOnKckYxvmNRUFtpsjaVtwDmIx3SM5JtYf?=
 =?us-ascii?Q?KdJtLK4Q4EQQLO2G6bWKzt9RNYfJGoJedlJ20o4JY8EzIqMdYUWBOIBaPDp9?=
 =?us-ascii?Q?qbLphabvUmBFvfTRE7vX5dfX100ss/4tMY1UjogAKj9Tq4w6zSwrziPe8nsJ?=
 =?us-ascii?Q?hNlLRrKi9nSVUNgb3tW74EIA0j3MTpd6V3AFSGwHfSCTgPwjmK1cZQQmKoEM?=
 =?us-ascii?Q?gGH5wFDD571smPtAzzdEckCYNSejeN8AchM7PMsVcdpxaRuhT0pAdCso1u9A?=
 =?us-ascii?Q?td8zXLb5phRm2gLB1vovIp/aTZw7J2d0+TnDExwkRXcH0OTIM0bG4DntNOgt?=
 =?us-ascii?Q?9IbzkK40jAR4znKoGDfZkcBnT3TrjkQmoUpLN3xkVWaAOSX7XgRz8f3dc+2+?=
 =?us-ascii?Q?BzOMsfD7p8Med6V8VVo2nEdmPCBut+eJNAM0J4M9qKHG4ZfXSiflE6HgTZsv?=
 =?us-ascii?Q?CBytwsMeTAkShMm+N1QUEto2i/xCVuygx05nZ8shWxutV5Tm5vzTRuo/wAuy?=
 =?us-ascii?Q?uHQfl4G8QkFm9ZWoRAluZ8x0kkPBEuaK7ZKZaArkns310ZErydeZ3y/PseJ2?=
 =?us-ascii?Q?guWo6nNcW6uTVcrAX7CU4fVt3USc4jMEzq3cg208TVEx2JDv/O6EwN/8PjcY?=
 =?us-ascii?Q?7lQGYdwJ1m128RuhAWCOL/MCqaRWS7CUs8VXjOSnpxw/vlkV8hTmYQKvQIKy?=
 =?us-ascii?Q?ZPRkksNxq7NkXtInKEK1+gLcXf2qMizhBCbuUJ3MglP6ehsDqB2dtG8SJaaF?=
 =?us-ascii?Q?xre/OJnnNQi/VM3+WF34PCY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d121a30b-db0d-4538-f475-08d9a816fc1f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 09:04:52.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0BnZpA2mNDpBgnqUHN4jq2x+LmGojd64vxcjw2/8wnDfoAAOkVs30skHL8wTWMD/mBf09bowoRkblzHzs10IJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5620
X-Proofpoint-ORIG-GUID: L5MtvhrUJG0-cs7n3xT9sOCUDUOtFC8C
X-Proofpoint-GUID: L5MtvhrUJG0-cs7n3xT9sOCUDUOtFC8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_07,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=732 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111150052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 09:05:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158276

waffle currently requires cmake-native because it has the following lines
in git/src/waffle/meson.build.

  if meson.version().version_compare('>= 0.50')
    cmake = import('cmake')

In case of 'wayland' not being in DISTRO_FEATURES, we will get the
following error at do_configure.

  | ../git/src/waffle/meson.build:233:8: ERROR: Unable to find cmake

So explictly add 'cmake-native' to DEPENDS to solve this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/waffle/waffle_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
index 6284af3076..ea11309940 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
 
-DEPENDS:append = " python3"
+DEPENDS:append = " python3 cmake-native"
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
-- 
2.33.0


