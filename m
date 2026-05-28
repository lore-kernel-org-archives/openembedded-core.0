Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF1DCD6E45
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 17:22:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16261.1779988949811771344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=isLM3Zub;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=060824051e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SFWHZ71628084
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 17:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=sMks1RCQK
	E5bdMriRGlME0L0pd6nVa3CSCKmnZli7ZE=; b=isLM3ZubQSru0DPZnheIpHDz0
	4JazG8S/OeJiqhe5Ml4FmaXVXTa28JGj9+2OvO2zqeGDZpkgWgAluw/ZyonIl5Hu
	VexQCnR/uFibaTHpXKYoD03FKiYXT+ER+iYd02wUxJsGXenMNxuLjA+YTx1c72M2
	5TExRcvIq2Dn8Y2GpGE5vD3NNFCfpy/n2AXORTo26gO25rYR4IE5dj0G2zImmzk2
	9HUH6g+UITZ3jDTVGwqMq4Ta/E921w+bgwpiB8gYbeGZkOy6VYxBWCoM+72Y/QSw
	zzOyfSKIARA1ussXDZpoYRBley/Zkiq6KreEczrSmUytr82gse9tNZzYF3RtA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013069.outbound.protection.outlook.com [40.93.201.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x3h661-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 17:22:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nskYX0Ex3mzNGaffDfJLtaqOKtbvZs8CJwgZ/mFKD8ETcbT1q+RfM9JPUWHSxUH2vdQFx3B0ibOOKoqM4VeZa1x9wHkNDVkaT4epL683J6XHe+J4Hm5jiurayGX6P2fWhBhknXjcOGkBggMTE0JazVFzOfkWigRSHCk5T1p2upvBRrYkT4fvP9Vu7tjAKqK1KqwVX48zieyzWKeFyobi1stqq69hcbkYXMCuXk8CE4cO81HSgqbheiqU/hP/EgN6OrQMDf7bPEcY2jhCp5xeP3hDTSAWN1nqZpwCksjlnXwAU9V3McHtKclSiyYklfZkxPjjmKBq5fA/jfa4pNu5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMks1RCQKE5bdMriRGlME0L0pd6nVa3CSCKmnZli7ZE=;
 b=TacGKRuI9sMkA4CbqJG0PLrWHDyclgXxVZkCK2MdroIMMZXq7Y1gvorpiTrdsT7sle/gc2kzZ/uj5cgySqp8zEJ1J8M2CigJwKo1XCpX5qC+YBj6J5HTIubCpFx+LzUalxY5v4od+2c8jBvenkZkNWKzZNJ0rzoW8KGgpq6oPr4sjJgBuyA7StqyfZWgHHn4oTGJQ3ieBXE3rbIrtXXfkleR1qUYyVuj6bxsdAkGXTRNkdICbeH5oGGWKDAOIkdup6cqiWn9fQ8oq0/cp7AiBMHfzBzHfmaODv4t4u6fSNf0aAoP/ceADZYk6s+QuqUfWiYhZrpq/KHjZXA7zP7Xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SAWPR11MB9712.namprd11.prod.outlook.com (2603:10b6:806:4ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 17:22:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 17:22:25 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/2] packagegroup-core-buildessential: Add Rust-in-kernel dependency packages
Date: Thu, 28 May 2026 10:22:10 -0700
Message-ID: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SAWPR11MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9b68f2-c206-47dc-e260-08debcddafba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|11063799006|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Z5h7BDRl0BPy5/BX69daNBTO9vrHGtlaLraZQJdFACjMh/7gdx6YPSfJ2TIEJvoMFYjNW+JDHlMY/dI1jIgT6SfyNXPiCtDSDQHAM2VAkVgy3TTaexQ3Y+m5Xuo8alzvR/HLmiWneJr40lerGdAphaXKG6swXsL3rsFilwUiVH1ISHIqm2yVyn/LcKCPtDCtK0QV2Ec1MfR1LFw1podgV3IsUShPOeQSsqShu5O7x4GQg6yYvfNXriYkAGhiC5Tb1mD7sMDNG8NrcquGHiALsh9Y/ALO8ZyOXRDfbWIYg/TiOV6CJOGZ6st6xX7Px2xCyUvatPBY0IHQ3cCm7V/5/iwDJPQVxBcl+L886GuJg7FiiOKpO4Tdb5ACepR4YX+BaZ+pchYGdxZLJbmE/eieZXR3cyVPKI5jGAzEb5Q4CWA1wl8xHVsX4k5BDR0oiPm9NmrLLTYH8AMvQDo0vMyZ8suH+Tbv4aRPLZ20aPNp7Rz1Jo3P6XwjGrsyaOC2vqegVDQnEQL6EB2HKgTI792D5Al7c2G9mqpQear8EgWItQaCfnzKmpRHMAJnB60WwMnj9VCDofCvQZrJdryRJhHKVVGGcu1USNgfkzv855Gd+hGHwbVc8diDdJtGg97SH/r73esRxiYfLV47bzuoMAXh/UtvYFtqHC5sY2N/9qMlqG82+kg7LHcIuD//mGJy/lY3mQK6KYmr4gxjHOEu8nAUPg8X6E+zV8PNc4X/ERmP65/xeioyUUHnSmHdKlDJ9EpY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(11063799006)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yiq1WSt08e7pZThCKx/NexvVozNtee3tGm270xxmNqHFlBvIHU+UiY6I/dUY?=
 =?us-ascii?Q?hgzmm7uL/qtpwguC68tLvGaSpJ8mwcjp/FO94zyZA7tlHXLNC/kQ2SltJoQU?=
 =?us-ascii?Q?3aRSfriClC9asBhVgDD5IgS4dxIvi77FP5drWQ6P95Qn4lZzdaF+e6vhEDBf?=
 =?us-ascii?Q?vuMWPPyxtCH7AW4fhEahkyrRofw2X51/Aqa4z0QqiNCEpZOOwoEUur9ZKHeN?=
 =?us-ascii?Q?x58JsmCdcu2MXSwNnHuKfa5HLJujdAVLZpKo6ild877QvBbRbamRAUPgIaGC?=
 =?us-ascii?Q?T/MnFV1ydjJVQrFd2KZmLSoSufm15WEk1g0h/ag7qRV6ZY8J42I7q+wY9FHU?=
 =?us-ascii?Q?WQZEvt5AB39+QZlPJ0rwgGCTPY8pFlqCwuv93iKcVjhf19Midnl2OMcPzieL?=
 =?us-ascii?Q?VgdwfGwvWBbSuMTd2tD+qNmWJt269u/4+VsJYjIHWy+f4mYmDP8X1ChtUSeW?=
 =?us-ascii?Q?JloUevxiezlUJHemmEItmc11ChCbCv8Ck1sWzREVMkunB4VN8Oz2P1i4DWpB?=
 =?us-ascii?Q?l8MhzPoA+2IfADtXYPcbSLFOYNjN355ZFBRAIDj2DRpi+SeoITMqxekVfoKv?=
 =?us-ascii?Q?ajk+A3NGhIJ4eTn4dGFgF2PdazOVpcI4h+7mKNRsubYufkPIQsVoHVinJR9O?=
 =?us-ascii?Q?04wmAV03MWVd5NRQ6wxS4dH2lftZGCJld2L/L1ldz/Zeev4S93bv8lMb6RaF?=
 =?us-ascii?Q?/6s3w6UjjvPlO0zIVXywzI5+tGuiavW/xF3tQSO6Xn3h5J0R1IBoVUNiq9Dz?=
 =?us-ascii?Q?iQCpKFr+zZjecmlLvQKRWduDvc9rMl4wxljuBVYwW480WARp/kn2wglOXlXe?=
 =?us-ascii?Q?u6qnaWDzKHcupZUjdlZwQBCDv4u43sdI5/kVfbMT3U/Bc8zr/cZLQT7ZTC3H?=
 =?us-ascii?Q?TfEA5APnWOgAycWYWVb1r/BtXlcNRqEyrNLf9RKDJJvllQzmMKatHHYBPFpl?=
 =?us-ascii?Q?agzvKC26OPBljJCQJb1UIZJdEd0Q4oM9gbw7PKtqIQeMnhx3pGzcymYL1gr9?=
 =?us-ascii?Q?IvtMpcBOjc1RnjcyVK+M1U4FszsNNOc1I5uc8hcduv6syCTbLPZOQAOT5Krj?=
 =?us-ascii?Q?kHNovwnAjqrLY/ltE0eyiDzGswSChinH2Jzn8VC4YUnJut6mBuf+oma1z8hn?=
 =?us-ascii?Q?qriW4Jw9fYP8BIvibkTtlBaui0Y4gni8niTalHwHjuoJndLGI1TzKcQ6itR6?=
 =?us-ascii?Q?1TuUP+uNAmpbKiFasmDcvbw2TwdkKyBFsLQRLuzpPPDTYhhatp0ew1eza8yP?=
 =?us-ascii?Q?ccZLkOPB9OTic3N6eiaVuDXf75mOBvSqX/5jM6nvsbPC5LWGT/e3eVNANoGu?=
 =?us-ascii?Q?PQXmyECm7/3g2Knw3ofMG+WBvF9LHcKHRbOA5z96R+jPwmrN7soM6JnS6YN2?=
 =?us-ascii?Q?spshe4iOFyFoDVaC2x8P/ApO50hTp71tKDBFX3hHNmDOLqS06kyx/ZK18GrL?=
 =?us-ascii?Q?1YWJnVJzXXiIgN7i7ROCmkIwrdQesaB7/+QIj/b0F1i1sL9PWUZoHFpI2+v+?=
 =?us-ascii?Q?M21NcfJgjkGwD6z1gDGxHVxvQvotuB8/vwzDHhlhvHGhybng7ko4fGzZizlv?=
 =?us-ascii?Q?CGT4iJPD2cZo78td2hJX4mv2zSxthxOrxpxvgEte4SnkGs2RAdcsBMgh6AsC?=
 =?us-ascii?Q?ErpE0e4mSGRkb52bAH6JEGuURZg6sXqNiJYy6yCkvGGWMNxhlfgm6qEMWvwi?=
 =?us-ascii?Q?UyyVeDguTOMRtcHI3qnQsmLoPB7xqgG/n3XADSbQQ4jDFLW+Cg6VSti4mi+a?=
 =?us-ascii?Q?atBdKMCcWpqfmdEbC3H+P9FxTSLgN60=3D?=
X-Exchange-RoutingPolicyChecked: 
	RJMzHK8l6FL8bAq5HDyr+IaKjJ/BevuZMm95zDARDreC2G5B4bz/S4B7MLH4c0Li6H4Wg5COj3G055eugqio38C5tAIlADtxj27behG6Xd5tDC+BEHekAFo/vSBn72Y84hsx94tNqcP08GoVhI3RHchLyCkya7OIngEfJSAjNqs9KMdM1EKoUoJdcn6dL8k0eOlYyQUrrhvYRB0mDQW3hcqv48E90A5BgSPpdbEQzudwUzFRTzuB05bId2VCk4pvk8iVinUe5CXXImsx5zYP85joOFuyLJJ4Sj/paqZMHJoCswvlpPhBsT49iq+oGC6or62J0bBMw/QdX8DwJ+oF8g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9b68f2-c206-47dc-e260-08debcddafba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:22:25.6961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOk9yPk1kog24swUwFpeNdU1+o3JrzGICdKqljlJK/kkQ3dWNuNYfXsm+4My8zW3yTHZuTHG4gLLspsuuqUvPDhK5oGfGTdaR1Pwid8X7JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9712
X-Authority-Analysis: v=2.4 cv=Pa/PQChd c=1 sm=1 tr=0 ts=6a1879d4 cx=c_pps
 a=/NeaHkXls/iJsjBnUIdqww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=mlIFmrzzYCbavEK9oJ4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE3NSBTYWx0ZWRfX+hni9us9t8Ez
 xJ2nh/788FqoQe+zDOe3DTWBQD8dqfSpy1iFZ4SaE7XjYj47e05Bm9ZvdInvRN0VOJovfkeWqNv
 C1pN/Ll/YGQID0Cnn2s2R7f0vJlJndph1C+I4U7OaUtw+mL2QYtcH5f1FgQpWX49HWHRUJ90RvP
 gIZFNyTn4he6Cxhl01cb4Y+s/J7Y9/Dq05niZGDFNDe3avpAiptxW7n2cje6ey5INCX83KGQ4aO
 GJqFIa/KgytU3Wr6zq1yPMOL9TFvotJGDkxXYRYjGkEFyU2zScl+ercX8OuPS4oml+mZz/mAz4A
 Y5zHnjdJTCIYR9fnmjzg3SB7jLTAWN3UkLnheExdYLmCw9jwQt43jWOt8PCJ9sVKIQFqZkrcvuO
 wiqgxrKfYkQpoxeuziarFOXG2og/Zb8AiP+KWaV+VAxges6IA1A5T9JSuklVk2WyHhlzhZiqTPG
 MHNdNZ1xww/42s0tUnA==
X-Proofpoint-GUID: j9yopXiAF0yCRGgO9aBLIzhDAqgX05RO
X-Proofpoint-ORIG-GUID: j9yopXiAF0yCRGgO9aBLIzhDAqgX05RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 17:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237719

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add Rust-in-kernel depedency packages to the target image when Rust kernel
support is enabled (KERNEL_FEATURES includes 'rust'). These packages are
needed for self-hosted development of Rust kernel modules.

The following packages are conditionally added when Rust-in-kernel
support is enabled:
  - bindgen-cli
  - libclang
  - rust
  - rust-src-lib
  - rust-tools-rustfmt

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../packagegroups/packagegroup-core-buildessential.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 2cd67ad05f..cdfe07a584 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -27,5 +27,6 @@ RDEPENDS:packagegroup-core-buildessential = "\
     libstdc++-dev \
     libtool \
     pkgconfig \
+    ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'bindgen-cli libclang rust rust-src-lib rust-tools-rustfmt', '', d)} \
     "
 
-- 
2.49.0


