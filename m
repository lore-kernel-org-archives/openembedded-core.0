Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93B4C83030
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 02:55:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10059.1751943304772728050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 19:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92847720d7=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5682o1YE029212
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 19:55:04 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5jan4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 19:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXbL1AtFFbAVeYsYIRC378C283/8METyK9Ubui5o+AjabL0BiYukEpFa16inFuOk/h12F1Il3w1IdcyHhXrrUsylSoPV6QPCbOwOdbALjz3g7l86BG528y0t0PDUJMOxkKaVf09GHRRnrwAP9u1YbeRXawjEaW8O9n3JFRLJsCPzC4pBBpqj5iQKXuEXVnmuGq0iMGst0tKypcUwZsIXSTT+ODibBlQ2X0qg7kmVqNm7ymT0fIORZZewzFtNZ600xoC251e4IH9bnf/GXfadbkxJWf7CGIrd54yevTsAZvAU21ahwzQFrgwiLHeqIFEHZHzbPIu70+aMj6fnfOQ8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13/0/o+eXUSHOLNm4z73yFJff7C48Egm1j4KygLfuFY=;
 b=mECVvsy5usuD2dZ1APWDyQvLRhBibU6XsAfEbJzHahAprkiuYILJrRlRIG8rgdpgm5WyPD4GWODNNBIajcC6kThLqNHKDwRtAIiehQ/0UAxdDoQMITTc0EcEJ7gD3WyG0T0knQmBBW6kzH0tylYUrTqJau7QfOIjkd1LJs5kvgKFxYKp15+x4EiF8/JmOg8u4vHkF1fA4X4trko7QAQZt6FEksighWWJNW39Q+Hy7Urjo9y1xsSHu1zbC5nsROYLAyv+FzrFgcr3Dnfh+tKqLpk9rz9V5BlXkzf66H2wYZgLK04qgzTFUpWBHmIu73DjqqrQ3Cm9u1gET/UqLYjHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ5PPF82E3BEA84.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 02:54:59 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 02:54:59 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][walnascar][PATCH 1/1] wayland: correct the SRC_URIs
Date: Tue,  8 Jul 2025 10:54:42 +0800
Message-Id: <20250708025442.2097775-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0221.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::15) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ5PPF82E3BEA84:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a783eb-9b7d-4b09-9c35-08ddbdcad3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hs0JxzYGFSR1xq548cWtwLJUaZ9tPhPey9pW9i9F1ED1rPI6sNicILr7+JJQ?=
 =?us-ascii?Q?/LWJ5b7bFuw5HVyTtl3pnBjtuENoUy3Qf+Al5lYOn8XbQBNTSGBLiEKLMnkj?=
 =?us-ascii?Q?YRKF4PeVFwMkqmf5f6q7ycbilZHkaXEip5FZEivleJGnWiF/VK3AF/yaAlb0?=
 =?us-ascii?Q?SSdP/1SfalwDnzNkCAWIESjcrlq8CmeQAKHJLMxaYyk2y5HtR48wbQdTwNvK?=
 =?us-ascii?Q?2KLBCAcrdHvWeQZSH2Rv4INsFhVHhMxmjpVtJmK0Rg7EE9elJ2UD8/lJYmhh?=
 =?us-ascii?Q?FfpKw4rNDc8INHRAhfHbGy9CMxNeEL3HkbbvPh/ztMSKWrSROUPPQy1Fdnye?=
 =?us-ascii?Q?7Ws1lCKquaNuJ2sYewl06Qz/AQ6yrXQhu+Y1EMUe4ukOdLPinXeZy3G9ZWwf?=
 =?us-ascii?Q?rTlvzsDwXjojm7cJ4fe7FzhI9fWcckFCY9M8JvH6TrUbySS1lQwbZ6PdcJB2?=
 =?us-ascii?Q?FQe8D/cg6I+X0y260Gtce6tA3ndSdx7/KBFsUxyGyEO3BfErp9n2oo4VNQqT?=
 =?us-ascii?Q?ig6lEYkaCnxKflpxQTH3ADPWVJ8bej8dTTCcy0v1hKi5tDpANC3GlwUtvcI9?=
 =?us-ascii?Q?eTvyEOUeFR8DRfz8j6M1/sgS+PiWV1uTqNm5W6MJikYuBciDSyVpYxJ1SGU0?=
 =?us-ascii?Q?qSxTjZyedA6niWhMka9F8dbReiIROlSpQduAEv4Jk/NI5eX9Kj2UVncaN+Ju?=
 =?us-ascii?Q?ciCm18ha4uOiHwLPjF72eGXbX1QyfCdaWCf62uJR0mDTrWRa1XQ7Kl8JB/sZ?=
 =?us-ascii?Q?V7Bal1cFMfZp34MHTBGV7+knLHWsKmgU5on9rqLdeiEo8VYcHjTKh7yfBQEH?=
 =?us-ascii?Q?sCS0sL08Ke8S8iDepgLo0IwFeQ/DxIfPCmI3z19UNJ9OAKZJK7p0fHEAojHh?=
 =?us-ascii?Q?mFIIEhBnGxfHiHGVrwPfe9/mdwvkaDE89IJY87PQshDn0ooXAJriaPvT2PUe?=
 =?us-ascii?Q?jaBmiRrISPSs8ufhShxjaB68dN8hmjagU6Q620lri3/AQgSZ15GxL225by66?=
 =?us-ascii?Q?5qNA0K5MYBoKePqCf/KEjw1qR6h/eKpEBsm3jYGmbo8FhH5mT/cLs6WkKG1k?=
 =?us-ascii?Q?GjR1otXueIlC9YEYIDEzMGHxeQcjJeMlyBOFZRTrkgyYIHTSqMK0bAZ3TM0a?=
 =?us-ascii?Q?My4rdwCJOa1m/k+1qJFop19hDmHkbMDffqRFi9K5NUOauY2ioILHvvQkqkAD?=
 =?us-ascii?Q?NtbJDIkQ/PIGreQZURscZrouimhc4LF8vgnnykRO06vPBjJxhbRr2kuqFNq9?=
 =?us-ascii?Q?ZvQ6P32x7UX8Xyu62KXkQ2Sl9ow2HUJmqnROAn8uISrRG6lEwrzNSpreW1SF?=
 =?us-ascii?Q?/USgUilZzwB/e4AZ7D8kBmK9pp54OBVlbsUhh/CBc0NHKouoh/ZTG5KGpJ+U?=
 =?us-ascii?Q?DXGde5ZA5QxxIoKVIv0xy+UbT2i7uxfy4I8mNIWKg8+qCTKofTm8/7Z54VWV?=
 =?us-ascii?Q?dB/LUvElTbU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xYtZUedHywPoXyUjK2lmIEePOzjKbZsTTq66HSpr6EvwwMSmKHLwH+cNnXSj?=
 =?us-ascii?Q?ag3ICMgahfi8vH0YCPxVCn2B7UfO0Afd8ydCjX/UfDN4zREaVGIvrOoWUuq9?=
 =?us-ascii?Q?Pg35sVOHV3c8zq9GhcFf3481hCEieYih8ZCPptlqHL7IzJpKFdyuacAw94lU?=
 =?us-ascii?Q?qTMKjs9aNeufho7G59C5v//bu99vwTalcSsO6zNboyQcE1joaVfJwzco8Dpe?=
 =?us-ascii?Q?x7PTbK2fnSb7EujIityCt28E9clCrxO3GENUvu2FBCBHI6iDTe7mbnxhB+eI?=
 =?us-ascii?Q?k77WZeW7ydVfos2CiubXi0gvd07o4JZ+zq1jCACMOfwaN0uampvA1iLwYFb+?=
 =?us-ascii?Q?2N/D4K834GZ8/pVmz92UOyqep9FQhnpt4g7kMeHTuS2+p7b6Eb8+Mlt/K+hK?=
 =?us-ascii?Q?ppAFDuAOjReY/y6deX/czDeEpLUxdNLkRime3dx2LQAp2XkdTxw8USmNq/FM?=
 =?us-ascii?Q?06iLuw00W4j+bnQACEExRo2O6vQYA3YfvJgmJETVUJYj9X8x3oyvO4FU7h08?=
 =?us-ascii?Q?8j3KOMlgyG9iLLYd/iqomxEgITU8OZY3RKsGjRW7ftcAzNr6AeEv8IDcN13Z?=
 =?us-ascii?Q?ajh+uyPU3bmWgIQTml/CHxsOs4S70Z11i0kY5oDkGsUeCBaJbIAalksp9VsM?=
 =?us-ascii?Q?ZZnFzXaxmGriLFwMtOEAi0IBwMJAoX2dweIWeLimJyvMoU+9Rh/OXwPZRV+r?=
 =?us-ascii?Q?PsMtls+YYBFDfmSUwIjgbwVv/LeJRDl1s1fpOixveFsY67k+g1hQQjto4L+J?=
 =?us-ascii?Q?LMTO72e4Hujyo3pkBIfwh78GUoQhWZswjl5p7S2Rf8os8VtoU8sXokp67OsL?=
 =?us-ascii?Q?vvVc22L4H2vrS2KvkzKvSMKDb195EYJE5BYV7vKC954W9VgbLugDIdIBW+yV?=
 =?us-ascii?Q?LQrmM1Y+yq5KAoSnFUDlVWnV4Vs0GE/r+B7Lq4WEfMH2IkI+39JRX3EN11ki?=
 =?us-ascii?Q?NPPt2GZoJpHfWBgaXtFM7+ZTF/VhNzXEXtWMdpHIIuO2cSuFsfJg1zac/Js6?=
 =?us-ascii?Q?Fp883NaGS/4kBI5lOros+zTAxyKWpI1/s7qVoX6fIdAFWykeqV1rKWpemPXe?=
 =?us-ascii?Q?BHLBY5QkJGklaWtvr0/nIh6/f8KAFC51rOAWvMS4yJDKZvu21y4RHhtN7Ztn?=
 =?us-ascii?Q?B7e1NwNKJoIvjlVLfkMIycjcFdN1bZTRbq7I3UoEnNQb/8rWaSAL3kYH5olh?=
 =?us-ascii?Q?2tDUJnmrshW3XVxLVlX8OEEhutcCBBVEePtJxAIVOKDH+sApZwISdEehZ1At?=
 =?us-ascii?Q?CuNKsPBTECJsNTpzp+rXcVOiCvOVikIP1s0AzRliH95OF0NQqjVA6m1ah3LJ?=
 =?us-ascii?Q?Qjxjpj1HF02IPNjCysaKRLQMUqgC8AjWN9ScDxKpfWJcXJShQWCeGJdN1NOY?=
 =?us-ascii?Q?f1oNbI3hsF14i8V9xHVGe6Pj7LLtCX+xvkEMWUwQWeeQ7qCV6+ifT6Ua9lH8?=
 =?us-ascii?Q?JlCgtKrdvfPfN45vx87q3G0BOlgugbAvI2GamsivF0tmnuxRXxIW8HOMMAMM?=
 =?us-ascii?Q?g5/x3uTPiz9DfLylGf/W6uGwzuz82QM0dqL4uJiIdSnllak/iP3GUKW1PatO?=
 =?us-ascii?Q?rckMGX0W8WSeH9IFmSY7EJRG2N0qbg3T1IpaEipWzVVVx1pYQA6K5oddXFbs?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a783eb-9b7d-4b09-9c35-08ddbdcad3e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 02:54:59.5439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaezrUwpPXuRYr+FfcNrpW49y0jYJ46Tn4R1Zy99H4G7RqAkkSZk140EjkFh33FKLwMNEgU9pwtGh22TI6vZv3GTxFor5sYpU3kpvFRZTpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF82E3BEA84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAyMiBTYWx0ZWRfX7NnCkfR/vn0J runTzaJaQlQ0B/VevJmUGuT94loSEPHF4B3jJJ8MJt9BDA8mZucOgJrLFCzQSUD2tQ/riqdx9Qj 04FsyDpLrneshTHMWdaJ7o/2DdovfdoOp2p2W/aWTGEDiX485FclOi6LM+nVwcPpZnSFAm/c+tI
 evgb11m/x8ceXUKMPiZ3gEVPFuiNGsZkSR/pFuXuWalRtQaeQLeztKZt5WJSpvdkfYEIu3yimjo uVeDUQXc9uZiyQ+FbJ5X3pFQcYTzmwTzilI4IgYt1RyoBTYk0JlDD56klmhwGs940Qlg7Ppn5G/ EZPTRopd5pufHlWFySzHssvyHUW9geOY9qr/tZJJTnpc1YbVrexN2DgfUkGwFjMggEZl/2Fznhq
 KERExgD2lC0qZ/nHa1SPePBPnlY1X/A+Rn741QVVHyUVcX2hHvYemDp9ZymmvXZzhknVW0Uf
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686c8888 cx=c_pps a=3OeuVL14gDL12TxVPZ2LnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=EKA4iIvevUf9UMjeEasA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DfUmGSZZMcH4iIopFHMIoJ2dW1JBv8tI
X-Proofpoint-GUID: DfUmGSZZMcH4iIopFHMIoJ2dW1JBv8tI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507080022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 02:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220006

From: Guocai He <guocai.he.cn@windriver.com>

For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
The version for master is not the same, so this patch just
for [walnascar] and I have sent another patch for master.
---
 meta/recipes-graphics/wayland/wayland-protocols_1.41.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.23.1.bb         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
index e8ab9d84fc..b8adb8ee5b 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2786b6b1b79965e313f2c289c12075b9ed700d41844810c51afda10ee329576b"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "0abbb958dd5b85fb5ab537b4c59cc0a51d1678179c4ca679b1b925605b467cba"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 59d414a0a6..b8542ea8c3 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
index 3a5d91be04..5974064968 100644
--- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 
 DEPENDS = "expat libffi wayland-native"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed"
+SRC_URI[sha256sum] = "4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c49aa68a702ebf698f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


