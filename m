Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFF4C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 16:32:58 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.1038.1716222776022606556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 09:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=iyu7KRM3;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=qoqDItSp;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KG7sCs030155;
	Mon, 20 May 2024 11:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pps1; bh=07Ry08HNb+4z
	y7rHS68+1uhxVN/Pffv7E3gwrLpTK2I=; b=iyu7KRM3axh/bDmUqxbODJX4txGB
	qfSwwl0ECpqpoomXk7SotK/QefwGgspl2ncVyt8dYT2+a4FafXlDrxYb4UcG2LaT
	Vom1MHCZCYcZECb6jfN/iM0S8BLiLrNPcoQqqi0/AxAxwOnCj1jOfOIcYzSeI1Fw
	XntgU02Vo74pLAdKs1XpuFz8tui7OlLgiXIHhvK3Txzz26yKJdhXmfNs6ExjPmCf
	eAUzWoUry7PLU/LxoJh7Zjhot6t9lK7Ad6Axx2PZIC3ByVckueacKvUj/c5Qa3Hc
	DKlmBRnXY+Mrq88CBlBim2yVbAfqwBsBYc6aa7U5/yr4OqBozXHGTG1U1w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3y89rx81h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 11:32:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZouzsVWW2AGkhXnPgj75a262lKSbnA21au+aJRsmLD+nIGENdH4XfCizrrPwjIuX08LwhjMKlHUKUtNydcP7SRpoNHgQrz1YoRHN9ClSZs26jAvBsAez2jKxnTXq0LPDUCVbUeHSnkj2EAD9OHDYRt1DUm9uVi5Sbd/TKR0CxfIQeoiN8lH+baVQqlwb+Huxi4TZPO7es74uOT0Nvtau/eEbG/WmAGMTAtVqLvgdFDvCuMAaFlbckx2GqI1AYOYmbmczT+w53k7UnBiodjFib1kkUmiSSaJ4I8NYuTfylAVyiZuNJmiNwOkavQrCv9H3e+CYpua/GTwZ9bbvgi1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07Ry08HNb+4zy7rHS68+1uhxVN/Pffv7E3gwrLpTK2I=;
 b=l3OIIg1ujuop1opNdZIVRfsE/a6AB+vZPgh0AOz2ogHbXeTnIHhhhm1Kb16aM03fgFVWMzcOUDipbCx9P2PlbosNyGncGuSKNKxuZ2Hma+xQJVaGa4ZQPbn/Yq50LGPoAMG1cPLWru/bLtcZd1THOJIjVUnT0/qK5+3jV9rLj7FER5OJfymNmL+oiLTCmbE5x+CC7Lc+jQlyw2k7qKaEY1IiwFKB5s7xHA8+vQ3xAZOKnWSiidUHGuI9Nrx6cafchegrnna8ZHr7YgCvhO/id7COHDygIXPQW0+EeiuixMzY1VTRXN/mR9oxmmemC4YhTn6x8t1WtiqKv6/QtTq9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Ry08HNb+4zy7rHS68+1uhxVN/Pffv7E3gwrLpTK2I=;
 b=qoqDItSphCni1koXGC/sgdIR6YeWH8rjiG6PaceMCM4Ti2JxOxKE35rIX2A97TemxXrWcG36jKLS6APS88O+w6pxKqo0gnUvOz4IMAqeAh0Hu29Ts6trq/sK+Nr/2c02RlpsqLLFrbAH7TRxy7FC1tOxGc4NNgIeGzReNjDfL3hC2A6G+k1LPxF6Qk0IDPhCXPE9xSfndQELKN5KWOVn2xkiHBmqUNlvmNGl7Tf0H0G3YZ7tmafO+mhWN6cg0aoSvMbkxj3FIx1ZeNBYd6BpT0wGIeKkcyJVGMf+PFJGka+r4LnqguXfQayXI8EEKcFnwktAw7cMhOuj0fqZSV+5FQ==
Received: from BL1PR13CA0301.namprd13.prod.outlook.com (2603:10b6:208:2c1::6)
 by CH3PR04MB8927.namprd04.prod.outlook.com (2603:10b6:610:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 16:32:52 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::68) by BL1PR13CA0301.outlook.office365.com
 (2603:10b6:208:2c1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Mon, 20 May 2024 16:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Mon, 20 May 2024 16:32:51 +0000
Received: from cv1wpa-exmb4.ad.garmin.com (10.5.144.74) by
 olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 20 May 2024 11:32:32 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB4.ad.garmin.com (10.5.144.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:32:37 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 20 May 2024 11:32:36 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] initscripts: Add custom mount args for /var/lib
Date: Mon, 20 May 2024 11:32:30 -0500
Message-ID: <20240520163230.105260-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|CH3PR04MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3e706b-8b50-4537-a054-08dc78ea7e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UsegZ3XPTaxjW3/To015Jpk9P9pqUJblXVedn70ZYCAJ9xqlP7plLUji7s2O?=
 =?us-ascii?Q?J0bJuXXFWrq5SpSRfi/xLlxcvmUppdqTMqDu20+nOSb2QhXC3eyqWEzEQvaT?=
 =?us-ascii?Q?U5rPHb2G4AyVf+r4DSxYCI5OvYtTCt5jkHVuMke/9wlWN0Fa7yHGmJ8bPwgb?=
 =?us-ascii?Q?JqMBcLl0jve2VHFKbiq1p0yIGcdbVmMhASnv3oc/JrK6G6WBXQ2dWuG5HUUF?=
 =?us-ascii?Q?JzE1XuyebMGXRlzWuoDQHm2hsnLGLluuvZKJceulaSEBUuVG63gY7PW8xc3l?=
 =?us-ascii?Q?LQje+CvqnmCy85KUjs8Ak9KJ0dtfcX5fLFAyGJk21rNiIKi9X2WAZyhmcUwx?=
 =?us-ascii?Q?F8lAAwZcg2pztfWgvFRaPXiWBKr1ITBVYbutezhfp5jAS/FGFcHLka30r7BL?=
 =?us-ascii?Q?AZ6JekVfjZpqKGJlM4Wp0rGCeTP/URihanxLF3ziVYZgpjKlRjkZDLdJkFLg?=
 =?us-ascii?Q?ikGXLWgAIwBCNwYA8B96slNq08hZzY73nBQ4f0oyy9dBZ8wjB6Y332y2sVv/?=
 =?us-ascii?Q?0A6v5+H8uExa2aFCuR2Wi6ffbwOCieu0aQOzokQHOj/0FaVa0WtRrmo2j/Se?=
 =?us-ascii?Q?2tD46hfl48L5RJdFy/4kzoYzGwlOisCLiwCWxqnW2maifbE+OnfLSiJpICJV?=
 =?us-ascii?Q?nJtdKGTxHwJtq89+wgOOjQaYZ7gEKGfVoEIWRxbPwspo3cyT6TSNC47HQeaw?=
 =?us-ascii?Q?4atgh4g5EQ2o7YyV7D/m2Urb7TmepKZaZerkx+zdQqnWW1qFf3rJQrMHrzIe?=
 =?us-ascii?Q?xzqDp3MPQadDXzw4H4DjY+ZhZ0LXSNNn8lz77S6gM3X51S2vCw4oIdAiBnWB?=
 =?us-ascii?Q?hSQ/j6aMqvrDp0zFU7RMrmDlsxCzAUnNVGwFGE7Q/W8vdju5NSx4i0rbi5mJ?=
 =?us-ascii?Q?ls9iNO8PGF0rTvI85x8jLfnxN8+DgY6AnkKz71dOVjR3n2ECWK5KkNCe1+Kx?=
 =?us-ascii?Q?7Fwahlfy5QLi06Ex+ExFEv2oSBb/+f5sJy+6Hw3460Faw4goCXV+Uevlgp1D?=
 =?us-ascii?Q?u6+TJ7hRqDmw6o4ouf5heUzrwl2LT0IQ31xdlQC+l4vWXgTeIIWNshoQk6dR?=
 =?us-ascii?Q?oIApmPOKibZc+wn39mEUL5N+wW1reHayULhHp8vQTo7GwAmcNFdeEqM3T0rk?=
 =?us-ascii?Q?kvaNKgQp70WxB67eVl7/d3zXEBZcU7cVNd8MrzRaxZlpGxSwqB2o/OcMNI8R?=
 =?us-ascii?Q?/Mq+mocUBhICODFgC0qOZ/NV8GbDxm4K8b83AKun2FBpSpbZGY0/2mawDizI?=
 =?us-ascii?Q?Z8Tc84tbEADYZ/4COlRvaVANp2GmDVLlc6CrySJhgyDWG34rYgEbIQ7pMpRe?=
 =?us-ascii?Q?Y7cmX1BBSnk02nRaIghlruqIPeOq+BBo9y6Q0CF22Bysvrs+TojseBBRVSKu?=
 =?us-ascii?Q?+j/Txzc=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 16:32:51.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3e706b-8b50-4537-a054-08dc78ea7e83
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR04MB8927
X-Proofpoint-GUID: qNWbIDrVa0jKLnHz6x_3k9KSRXoouNl7
X-Proofpoint-ORIG-GUID: qNWbIDrVa0jKLnHz6x_3k9KSRXoouNl7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_09,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405200131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 16:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199598

Adds bitbake variable to set additional mount flags for the /var/lib
overlayfs or bind mount when using a read-only root filesystem. This
can be used to set additional options like "-o nodev".

(From OE-Core rev: c3109e40e2c2c881996dd3fcc95fca74f098646d)

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh      | 4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb              | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 6706a117f7..a29773647f 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -37,9 +37,9 @@ if [ "$1" = "start" ] ; then
 		mkdir -p /var/volatile/.lib-work
 		# Try to mount using overlay, which is much faster than copying
 		# files. If that fails, fallback to the slower copy
-		if ! mount -t overlay overlay -olowerdir=/var/lib,upperdir=/var/volatile/lib,workdir=/var/volatile/.lib-work /var/lib > /dev/null 2>&1; then
+		if ! mount -t overlay overlay SED_VARLIBMOUNTARGS -olowerdir=/var/lib,upperdir=/var/volatile/lib,workdir=/var/volatile/.lib-work /var/lib > /dev/null 2>&1; then
 			cp -a /var/lib/* /var/volatile/lib
-			mount --bind /var/volatile/lib /var/lib
+			mount SED_VARLIBMOUNTARGS --bind /var/volatile/lib /var/lib
 		fi
 	fi
 fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 7c9d9ca4f1..e28d8c6b72 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -59,10 +59,12 @@ FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES:${PN}-sushell = "${base_sbindir}/sushell"
 
 HALTARGS ?= "-d -f"
+VARLIBMOUNTARGS ?= ""
 
 do_configure() {
 	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/halt
 	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
+	sed -i -e "s:SED_VARLIBMOUNTARGS:${VARLIBMOUNTARGS}:g" ${WORKDIR}/read-only-rootfs-hook.sh
 }
 
 do_install () {
-- 
2.45.1


