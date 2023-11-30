Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5D4C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:08:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.68392.1701335292135274389
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 01:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=be1vz/UV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=069828ff40=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU7RM3w005846
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=hUwWZU6RR1y1eRQ6zc
	fj+mZW94jK7MV9PxrLdnNEWxE=; b=be1vz/UV4FQdt6XieNaAga81TthpF8fTD1
	fP/mI9AZ20bs2sQowRONGLj0KETebiRHue9jneEJEszNGOfaXq1DPuN2NZHp6trJ
	EFAQvzLHppBfmDwyVAP55gt5RWL0vYCRttyAdajbHjDcBzZaD+FOOiOHZBCUDggD
	AaEX5/pJKbvNCAf2u65Uhr0UkImqvB9KwbPoUb3GUbOj5wdqwzJV+SJYfrgV47uU
	iGzEXHNr4lyJ9ECqpL7VoiRQ6qXNdZc7H6joLJt9Wt3soym9rgqNTtwxnDjinzpV
	3HGBACjEzJfMYVs2GgryjAR4RsvCXwy4F6gdreD4bX50EJRyV1qg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph108atx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:08:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egNiZna/+dylyfqpJ5dPZlbXWR21VRmwBGxdYvdKL3HUTuEpHr5yQuP2C3JH1A4MG7KgtLiupGTwoTPxv1OKh2xdv3Xb3w1I47vSsgrR35pwB4piS+EVahZ9T+h7IHHoq4vNAGmDUvbsyHXQ47+B8yqrZtqHmEfxrP4M2oUz5kb3fjW2VezkYG2gTgmRkeVJofnsv9/xQdzksMjms3OSXWwOrbAA7Ctpp1zZpU1OH4rzwuqbbhuuj1/D596/JWLwuz8eMwUGFg/jpzK3GXQ4P1iEaAWwytyowGrVI9+dgneZdkwp8DnoMhuYi2pKZPoDDHKng67X/KqbDf5Fr5msKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUwWZU6RR1y1eRQ6zcfj+mZW94jK7MV9PxrLdnNEWxE=;
 b=FI+B/ljntayMZFo/LLc7N08QB+15x2GLrdVK2Id+0nT3OG8PYYQMDvuFmXlbEQuZqMl69rWAMQOyT5XAR13rKvh/MCYKluHJnORoQ8M4EIMpMYOHT63gTSPo6n9M/IB4A8D5zILFyKknRaCK5mkZziuQDyRYQwDe49FV9SpVW7toLvabJmeB5L8cRVchzOi5htlem/+fo6S5pMmyUfDefvHhcxOHh8bt6WMKNXwNxTY9odHXcaoqkrFNjvcy7gUG4O+0yY1jYpaGEfqnLy+EinK/3iel4KcLri1LP0MUR+V/l6GcRY3xlpXgC/HxFy4EpCRoHBryPppVIIVITCTP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SA1PR11MB8524.namprd11.prod.outlook.com (2603:10b6:806:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 09:08:07 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 09:08:07 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust-cross-canadian: Fix file conflicts for 32 and 64 bit target architectures
Date: Thu, 30 Nov 2023 01:07:51 -0800
Message-ID: <20231130090751.3654747-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0042.namprd07.prod.outlook.com
 (2603:10b6:510:e::17) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SA1PR11MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a180ac-5870-4431-982d-08dbf183ddab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PD7ra2OGmIw/dDb+cOd/Rtl+XG93at8qbVlD4tzpWzgfHMvJpChj92GTV2zifwcq/ja9R6G+sjJicMBibs/EJFRIu7JDAJmNpaTJRSfaJ82QAwCGsKVSL96NSESiCDue0jL2XWDgo12AlyOXxITbAOF3CH1+Sud+XGZL+2Xk6HNowuL3mWV5hFubNrOc2ARs1EgOQtALgyLhRoDyVyqHGz3sltXUmBsHjfixNFjfk10n4undFhdrlOWzpMemypYGpda275AggnX4W9IcwN/f9aiCAgdWjtBQWrBcbS2Iz22dNDLGQgJC2lxXwqzbfRbtRHXmprREFNzYe5CEx4uquTFo7+9XIH7Zy+l+avCifSjQXkNEHOvvPxc22BSAMXGSEiijrBWBhO6lvQAQWC0POw3r4auaipnyzfoy2mAnD/Eb5SbiUR5RxJHbbToDDT3GDqoMxe+Yz3ARz4xkR1BOjr8rbfiIK43r69AhkhB/bjqKjgY/1wWpK3IjUuI6oMylZ7ErOSX+AqeP8NQ+FHG87PyH1cwQ4cNwVH18wT1bptVvSmAD0hw68CUswvBL5hIWDJv8hqPxU0T2aKPKFreTtgEqG8roBrAtglb12+wTLZobTmVDdp6vVzKdHzv/mTaSsPg7q/sNVe6F14T1uQgD6mljaQGpB3Lvz6Z+B0MRYzU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(26005)(107886003)(1076003)(2616005)(38350700005)(66476007)(66946007)(66556008)(316002)(6916009)(2906002)(8676002)(4326008)(8936002)(86362001)(5660300002)(9686003)(41300700001)(6506007)(6512007)(6666004)(52116002)(36756003)(478600001)(6486002)(202311291699003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lulp4cN6A7juh7sSIeZJUqZzs5UKwMNPqxiWOYuIQCB9GSd7N5FRsWlpAyFB?=
 =?us-ascii?Q?nPb2FiGhSLbpAQWX/5ump9d/QtSPvh89tzJ1NdUE76rkdnm0UpjUkFYuWsZd?=
 =?us-ascii?Q?YkG8SJVECBjN2hbpWNoKJqJYmDJu1iG15ul8VUfJ+wxjI4+QyGM0aCX8tyHJ?=
 =?us-ascii?Q?gewCPKxDYPbOmtK60o5kkj/sV+wYBr6xYVJZSueaSMIwc07k6VhnT45xzQGx?=
 =?us-ascii?Q?ph/FDzHkMCmTqhuxV4wfsFzdV4i1NjJt/vcId2CiFv1muS96GTkpizD9mX98?=
 =?us-ascii?Q?ZbIWSDjTUVWu6JwGM8MIjoa6+MQ1SDbktiV4J+tGlV6Lw7DZkVLSSC+0GJG3?=
 =?us-ascii?Q?j7jRrVKMQXtYwJYEUaZP0gxp/1o79XEWS1fV0Y6yvsEPtYAzEnCs/U4UxYc9?=
 =?us-ascii?Q?DQVk551u8VAi+FtZJRKONoKdLNjK2V694M+rcOqBviFxTMWaD4PWO6JO5YXc?=
 =?us-ascii?Q?j544q4qIwxoH/17nc7iUxMJqebIIujy5H+rMz5c2/DNfPD89MsBZ04hvWxO+?=
 =?us-ascii?Q?WwFkh3inrRLy3CrNFKxYWBSMqktUV0oHVhD9Ce3TprURYtKcHNwoZWIXkAAh?=
 =?us-ascii?Q?0B7VAt6cpbDm2l4cFxw7I+wEpEog4qlHtN8YZ9YA6XNS4XS9DPhoslYIj+hL?=
 =?us-ascii?Q?T44QkiVDcRU29hReQx60+d+mRYctL6/prHjVl53amKl8Ao5s7nSENhy0nMLN?=
 =?us-ascii?Q?2YZAaYat9Xf3aoGPaok9qO7mUEHcotnXWOHAZtchNiOE7bKpQGUigZJFHb03?=
 =?us-ascii?Q?NMkY+VBmHxZ2K1jGqzatpar+LzzwZlheodefo8f2seU0jBMKuDjQYyEtd8gE?=
 =?us-ascii?Q?/t6IsrwzIwD1P704OquobGFa0l3/92l+thWVNe5UEG8iEfjc1uLV/u9cqnOk?=
 =?us-ascii?Q?cejL5JaEiuwNzUO/TVPVnLVszMhl2FgYD3XxvxUb7KeWIQD0TH7yvE4zDHbh?=
 =?us-ascii?Q?L4ujLviYSP2GC54sThTGjTN7EsHRme2r7+mVzmWMhdQt9Dd6BwIwJRa1ooXv?=
 =?us-ascii?Q?nlK6P53UyX7VBqSfhNKC7ji1Rxqo/NTSOwQVJvnv1cXKzJbmef0RgpTinGgA?=
 =?us-ascii?Q?TWXHtNHdtPUzypTkBDJEMNP3lh0nMIyXMfi15JqTZ9N6dlJTDa4SXiLY/Gl0?=
 =?us-ascii?Q?isSn6A1qUli9xq7OAkjXB5vgMuDK5wSe1yiym1QvtvBMsA9Yai8B3KV7fsc5?=
 =?us-ascii?Q?18MGNCD5AkFMqFVPdv31F9nCSXp1hgYJ6x92e2kepsx3+aXT8I0bIdjFz1rQ?=
 =?us-ascii?Q?Q1n3lXM6nv7qPoEInwpGPrXjjRDk+pypu5DhnMwMMw2P0mwJmXpyoIMUHCAt?=
 =?us-ascii?Q?DlxW8XDkAEWdy80FIWkPCWHfJjcWHIPkUEbKDEEajfQULPKEKhiP04aVbtH6?=
 =?us-ascii?Q?o5RRTbpQQzg7lm38OCV2IXq3ee/K45+if23E7onyOXGYflSDkUiEcfZ44vRx?=
 =?us-ascii?Q?ZgilxZhBFLrkm4+QLeFQqGBaA9u8c0pZWCUuo1dEHtDbn1xCHLKlNEOdlLrx?=
 =?us-ascii?Q?o/vSqQrALrXh1YNXL1wiN+omwbd6JLy5bRU3BgTbBwxWbASRHOdyyCZ4Ck94?=
 =?us-ascii?Q?z7m3oYSgCnc55zHiBT0xGYddreEG6/XVuf93WfM6Q1MKLvEipx/1uoOgQ5ol?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a180ac-5870-4431-982d-08dbf183ddab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 09:08:06.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GkbMorXs0W0jHTud0tHsgwH1Rf5UmoMOSp4NVlXsrNfLJKipN3bCZUeJHfAyiW2rKZt9Xxq+7UH8/a6iL9PZ8IWI0u7v2Rg7GgGKpnJjvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
X-Proofpoint-ORIG-GUID: VROPucHywvBBKpM4bR3xzN4VDquh4oKf
X-Proofpoint-GUID: VROPucHywvBBKpM4bR3xzN4VDquh4oKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=594 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191481

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[YOCTO #15061]
Rust multilib sdks broken because of the conflicts between attempted installs of rust-cross-canadian for 32 and 64 bit target architectures
32 and 64 bit target architectures are trying to install cargo.sh and rust.sh in the same path which resulted in the issue.

The current patch  checks for the 32 and 64 bit target architectures and modifies CARGO_ENV_SETUP_SH and RUST_ENV_SETUP_SH macros.
Hence, it creates different file names for the environment setup scripts and resolves the issue.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bfef6d175..7153a59a9d 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -52,7 +52,12 @@ do_install () {
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+
+    if echo "${TARGET_ARCH}" | grep -q "64"; then
+        RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
+    else
+        RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust-32.sh"
+    fi
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
     RUST_HOST_TRIPLE=`echo ${RUST_HOST_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
@@ -66,7 +71,12 @@ do_install () {
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    if echo "${TARGET_ARCH}" | grep -q "64"; then
+        CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    else
+        CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo-32.sh"
+    fi
+
     cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
 	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
 	mkdir -p "\$CARGO_HOME"
-- 
2.42.0


