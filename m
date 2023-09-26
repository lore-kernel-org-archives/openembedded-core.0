Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C7AE7F130
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:38:49 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.3448.1695764322580098364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=CBsQ4J4H;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=EW8Sukd8;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QJidck027434
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 16:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps1; bh=bfWwcTr7g2nPv5U357YYuoXIdQUolpt79tnXlzO8ZM0=;
 b=CBsQ4J4HoiAOCvOlSv1cRCIjyIBGhwlp4jCbUE1IZskrcoapYWSnu/G3t+c04qX6wTNG
 xkLdlh8yU8zxYgl2X35G0I5jQwZyBvmlgeEquSckmsJiTjPg8yOuz6VLM7s7ab//DBQu
 ELumfD2/yixXKnDJTz/GNozcYqz1z2MS078JWWo268UHWOwJ2Z4d3h38m/kgDldIqdja
 gNALp1ZBFILhUqB8uA3WEpBZ8eZYRwMKk7DT7jvwQE7Rc+/lJFk2j1ypJaOKU8+mAOHs
 y2R6hHqZoSfizI/6N+VltSuceu8dCq+cityBnMmqclfOVJWQpoIwNScr2au5ymfc2YTZ dg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3tbqthsqn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 16:38:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBayAcn0tm+z2QWKNrdZ1g/tinKxYqnzkuH5YKwuuboYpHUHv8dCzlUY1Qquugft/oYsHqqpKl4XRRgk2cUduSHmI1SuM/GN/579FPqJOQk7pt3cvEXfmNdcz+4GAVawnkik27ekK5eZLJbN16ox9mbqv9q9i6oARiHoJ4RzmrApPAk6l/tphi6YU6/Kfzub2Yxjh41/HKnY9wGxGmdqG5jge0UeMgoHA7XkhK4+UX4dwhdxUAkjt7hvwNnE/QP1poha8tvjMSgME7XqeVSe0Tra3h/Q2ey/Udosc3Pbcf2CqZnom+QX1NFTlkM4/Tn6fmw5dM08R/T0RUM8IBWTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfWwcTr7g2nPv5U357YYuoXIdQUolpt79tnXlzO8ZM0=;
 b=dxPNyNGWNnZuuNrQwsFiKE6KzeeZvhS2nSqujYeNL+02AkoBqCwESJwscpfmzFNtKVn6SKP4lFGUv+zTWgohlhmJIeuRvwt/BP3f2L3dGPlt6a+rgdyfXV/tnSvgcTsrpm3aHPf7SbLLSH9WihD502j2ZsZR3AIbFiJ+x2yi1soiVvGZswWQFKn+6yGaMC1omp2A7qycJQe6awH14NmZo05/Gu1z5OlIyYIDn5ur+z8Erm9DrJizHLq37O+VVsEbs9IIzyrXiCd2/LQYDlXOV2j5Jsl32mvqgm3k9nQ5iC4EmQF0Dne/HAGD410/1vRbIwqHN4EloP5RKBSnR04dEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfWwcTr7g2nPv5U357YYuoXIdQUolpt79tnXlzO8ZM0=;
 b=EW8Sukd8y6kGmGoGVZs6PQiJcWZWkRwNCb6g2DmkuiAGWxx6FXDqEMguADN4T81vUz+IwQwsFnoq83NRU8fUSPUk1GY6Wq36gNrmeOTCjTcVrZbfp8I9G0taeukbHlmSnfs1cGtUagg0fWOYbJ1uSxiG7/Q4iPX/jw/49UZiXrTbpaISldGSe/HkYHywO2QnYwhIZCrQIm2YexDC7AzYymLKgjq7QZMu0iqSRSkbZG1to2wumPCkXEYgcH0VEHXb4LzF+H8UjoYOvfy3GDFvLrALIGViuYMm94cuiXTKB5qeViEZHqXe7a8Gj94t9od3KcgHatFlWCKk/VPr9dQw8A==
Received: from MN2PR20CA0044.namprd20.prod.outlook.com (2603:10b6:208:235::13)
 by SJ0PR04MB7758.namprd04.prod.outlook.com (2603:10b6:a03:3ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.18; Tue, 26 Sep
 2023 21:38:39 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::69) by MN2PR20CA0044.outlook.office365.com
 (2603:10b6:208:235::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Tue, 26 Sep 2023 21:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=garmin.com; pr=C
Received: from garmin.com (204.77.163.244) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Tue, 26 Sep 2023 21:38:39 +0000
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:38:29 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB2.ad.garmin.com (10.5.144.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 26 Sep 2023 16:38:36 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 26 Sep 2023 16:38:36 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [PATCH] libwebp: upgrade 1.3.1 -> 1.3.2
Date: Tue, 26 Sep 2023 16:38:21 -0500
Message-ID: <20230926213821.1938789-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SJ0PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f67673-a5cc-4933-4cb6-08dbbed8f29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dncyIDazLPQggvAy2LXmj/STNAnGLhSy0nAAf/KgwDiJR9bLZ3yHazZmEsKZ5qsbDT7R54qaMUqyq847eXEq+uEG2no+IKl+f2hypdkDdo5C0WOmBuy8FJ+9ZWrO9dYTLgfSOimo0fEi1i9ytS3f1ZpMkhuQpnZYXnQZDTFyvRAbch73TcsDe9gtUUv/iM2pKVdBHxh+asj4Z66KoCJisCb9mtCDyhifq4g3ZNM2mI1Cyc04TGUYFQhH6DiUtJ7AjR6IbmbAADUc9xGdV7hfvoQ2OZ/ygl69l1pkHUT4rDrz/+UWbcZ4zN4TULZhu+8L1VWoizC6QnEpLcqjnt1L1Ri58kEdW+HoOwgLAPGvMhr6wTjYR32o8FT1zItvapPoQlUMBYYOR134O0HN9o0cBz0rQRaxdN63X6tAX+SDMcKdQ+CP9doQ13Ij61NeZdyBwQmoG1C3CMTrSi+DFZIC3a8hnwdfWdR4ZRV9LxZK95pnMLnScSbNyfsmtrXjxYNmo6JNo2Z+GzvQAT1CPIjXqZJHYBGawHFt5qA0VQRTChVp9QcYB/WtgYTRPbDSE/yRcfUrf+WeURoxm5R7/cdttL/Ug5f7rAqIg+G4k3KXOMD3ECX9LQ0IhLjx5in81emZX+I33WSII8vPjcKlYA2L+28L/jrydDdktKCHOITS/XizIqn5Wg+c2GDHmh8FpY9f74S1SSQ383lAVB2+8SJNVCv02zQ5KlyAfLPQbsqKFiWKZ69s9nLjBq088iMb4+Mm
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(4744005)(316002)(41300700001)(40480700001)(426003)(336012)(26005)(2906002)(5660300002)(8676002)(6916009)(8936002)(70206006)(70586007)(4326008)(478600001)(6666004)(7696005)(40460700003)(1076003)(47076005)(36860700001)(107886003)(2616005)(36756003)(7636003)(83380400001)(86362001)(356005)(82740400003);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 21:38:39.4481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f67673-a5cc-4933-4cb6-08dbbed8f29e
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7758
X-Proofpoint-ORIG-GUID: OejK4y5E7oI3XdKjIPfP1-SGqKnMotPb
X-Proofpoint-GUID: OejK4y5E7oI3XdKjIPfP1-SGqKnMotPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_15,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=666 lowpriorityscore=0 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188267

Upgrades libwebp to the latest version to fix CVE-2023-5129.

Change-Id: I061fcda90c7720bc41a575551b399a6f36dfd534
---
 .../webp/{libwebp_1.3.1.bb => libwebp_1.3.2.bb}                   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.3.1.bb => libwebp_1.3.2.bb} (100%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
similarity index 100%
rename from meta/recipes-multimedia/webp/libwebp_1.3.1.bb
rename to meta/recipes-multimedia/webp/libwebp_1.3.2.bb
-- 
2.42.0


