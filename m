Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C55FC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 19:59:34 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web11.2914.1706299168176513418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 11:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=bzsNH33r;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=ocCFFeJ8;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QF0ZvR012251
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:59:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pps1; bh=zhMLKlcgXdkW
	rz0Ba30q40BGLri07xx83KEZqyRYPlU=; b=bzsNH33rOw3n2fuK8hVoi6NYEv0c
	iqVyNm/IeE0n5bBqeGXUiUgK9bZoJHhO9ng5XEEe7O9vKS23fPKr+A2bi2PYHXM7
	y6Mmod7ts0cgoeZYSrh/nMA+qk1RXBV9RO8aaoIUUzeUpwh/xqGUAUftOI/E9MNQ
	8QR5KGSrLt53gLza7jrThpSPvzi6W771ov1IliNFYMWpFxu5y+mpNXOjzRk6tJ6u
	Avid2/H1fo7PcyAmqOn3qg3UMViOW4zdRh7JWANhtDyLCULs1WuLCN3olFIrFWd4
	EyEumdHxReIWkIzFd3LmAhhLO9IJ88qcsBzcQMRjx1xkKlLAF3eza5vS3A==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3vunjqb1u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:59:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHVakl8ooj6QyV0qmoUKj8KBdywvkEtGL16BDfLKkWJlmW4wfUrDvwzv+Nix5NZ2V+Y/SS4QyohNdjMulabGb1hWEc9MnBM+wl1kvMRqljhvng1qBSz04ehtl+4QflgWFWlMJjtU2CNxvL4kLrkRwhjx3KB+PyZiXB6vHlDb9Zn94acinya4VAFXTK11gLNxI48Wy5hj39aEYR6x/hd720E3pW1TtD48HZsstLR0ayrarU6mqs53rNyZHF0cBEVO4g5IR1wKMgdX+x42kjphhVNFoqtqC796dbpDsOq7MrHWJWftvVxigS132uTPb7lji44Mv9xnoZNTP4FHB+ljBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhMLKlcgXdkWrz0Ba30q40BGLri07xx83KEZqyRYPlU=;
 b=M6efSZkxNavMp7D/Xak/Citt3gwOIETXeGNjI8yUp5t/0Zu8gJRi/0shzaTprXzDmuZWRzv764qZ+P1V+xdnzvIs3jPKY0q8UQOPaQxLkdfngUK5EepTdGrso9tPvw04YOxWWZySfmS6RPsFSOq8DOG8MryA6YAblY3Jy+0uCWKWKB2zh0xUYHc/0emGXIfsCsXXhQV4xs39b2D8P6lePJ4h6gg3TN9UlOmNwoEVLb6FQkpnN9dJZjyUR9LoDp8XTHwE24q/gTJv3Nv8zImT00zYFNJgH+RL/EJQq85g8eJOj+pwOc14zhKjIMnzn7/Jgd6deogJ3oMTcbOdbwUXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhMLKlcgXdkWrz0Ba30q40BGLri07xx83KEZqyRYPlU=;
 b=ocCFFeJ8cCJJwrnIan9vay9odN2wWU5OYDVOZrEtREXO7UxKRpWLlxvyMZpSJ7wLMw4ysn6aiyIMwxyRoAx8mjVKlI3/QJDU2sD/mdz5MavIcomQIpba2pamoQq9xBMdDU9nnJpjsETQMAVahDuFXorqqK84T+SIVzt7P3Bj7ej2zxkcn+up++vbvN+NxJDfhFfENj29HdzrzzhiCVun49tkwo662RwUakY79znREG/xzF4r/LmdWcRsSEhqMObkCx2DKWGb04piZaFg9P8WhJNwc6SxOhj8zcPzfXHINg8YewgE+KCeXc3Kii5oA9MhBfV6thImMD5uAeU9A6XjxQ==
Received: from BL0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:207:3d::37)
 by CO6PR04MB7538.namprd04.prod.outlook.com (2603:10b6:303:a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.29; Fri, 26 Jan
 2024 19:59:25 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:207:3d:cafe::d) by BL0PR02CA0060.outlook.office365.com
 (2603:10b6:207:3d::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Fri, 26 Jan 2024 19:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.16 via Frontend Transport; Fri, 26 Jan 2024 19:59:24 +0000
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 26 Jan 2024 13:59:02 -0600
Received: from kc3wpa-exmb7.ad.garmin.com (10.65.32.87) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 13:59:08 -0600
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by
 kc3wpa-exmb7.ad.garmin.com (10.65.32.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 26 Jan 2024 13:59:07 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by mail.garmin.com
 (10.5.144.76) with Microsoft SMTP Server id 15.2.1258.28 via Frontend
 Transport; Fri, 26 Jan 2024 13:59:07 -0600
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [PATCH] initscripts: Add custom mount args for /var/lib
Date: Fri, 26 Jan 2024 13:57:44 -0600
Message-ID: <20240126195900.2199003-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|CO6PR04MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: ec57712f-4807-421d-1d5b-08dc1ea94be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2cG5ya/yEvOTWCJOFu7ORsCnk1P8flMtZXeM4wj2tq/sh+/8nTrWKdUCiUUZUBBlz0iYx5BrDOpUIdwSyehhvjnCT1b6hQQwwZq/hHqdo3/aDYyO3hBOCqDsYGy2Ke2gr1K/qiJJ9LLqFqKz4pux25nc8dGRZ2NcKjRCI61Qe1kPLCKOS1MSFWJ/KESwb2RzDbruJ+irgPguG8CubxA/GVeMBfXCucAB1H+F6eqlmIGAhXy3vGXCIm+gR/9AoYD0LgqS5NwsGlOA2/feAPgoTcmrWgknBMfToA+8Pl1heeLHvcckQanRlz6sudqVeDeFzSKuArKs17N/nTqJhVeLTy4S2yQrQeoZeCtSDZXMxavaCyCB3sBpR4N48kbldf+v1v+Kr+zItzx3Zta0Q50QuVBUZbBADTbrKJq8D3lWGiGAHSpR4d5r5+BLYdOHvBYlgf/NhZGyyGc0YM73jVCEhkXXRktHeJYYZJiyVgapyuKHXA5qDY67baFF6mVYlxVa925YIolHzZZdkXDMNQxA7QEFb8VgAoiSS7FDFITQ8UdnuQ5wGLyeW6r3hRRCZVw/TZSJFcboeYgMJoMA1pd6j07mK1sJJn682OYnYu/GVLeUxzfv4L9+xvhrqgsCDc2seDUUN3jpRuh7SS24d7sGxjUldUWrxClVNGjmmDLZY09IHkQ10ucaIdRpXGCTTWGhDr7yhD6kJ129x2ddR+I4CZtYBlCoD7tWhT10Odr9NfX/RlD+fe4KM/VR085Yu0C6
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(426003)(83380400001)(2616005)(1076003)(36756003)(7636003)(356005)(86362001)(26005)(36860700001)(8936002)(70206006)(47076005)(478600001)(336012)(4326008)(82740400003)(107886003)(70586007)(2906002)(8676002)(6916009)(316002)(6666004)(7696005)(41300700001)(5660300002);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 19:59:24.9959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec57712f-4807-421d-1d5b-08dc1ea94be0
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7538
X-Proofpoint-ORIG-GUID: qXJGmIQEScCv5j2qtpU6e-nz0O8fcGYn
X-Proofpoint-GUID: qXJGmIQEScCv5j2qtpU6e-nz0O8fcGYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=911
 mlxscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 19:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194403

Adds bitbake variable to set additional mount flags for the /var/lib
overlayfs or bind mount when using a read-only root filesystem. This
can be used to set additional options like "-o nodev".

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
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
index 4b34c6a67f..e61ac554f3 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -58,10 +58,12 @@ FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
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
2.43.0


