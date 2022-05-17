Return-Path: <tobiasschmidl@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860A8C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:48:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web12.1364.1652813312231961770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=g6/YqLxz;
 spf=pass (domain: siemens.com, ip: 40.107.21.58,
 mailfrom: tobiasschmidl@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO8tXiufOSZkiGYQYf/+FxvteEMsR2pKi/CuPMxDMvfCWcKCfajAQPcLKZ5r08iC27GNNWI5Xz2WeLqDhYPQkNA4lmZaJW8k2syZDSJBS/rhxxJIXhC8MGC1rXl5PhBiVvyqHV8xeyhKvgi9Vt01T6s+hd4Z7IYSnX/hJAF8HsNFgPWAu2X2wWC8a/qizI+HGBwIOcpGkFW9zwOr2flrsLeSiQkD0UzkWIrNNDbmCXSjGweSI2P0G3KRbU8OzGSwv0peh367EFRgAHXlxgTLl0HlJVR2kU7KqBfNcKmvUIwkC3IrRPTja8ywLEkk2p7KKDUESyCTXgR9rSOMVBSz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFl9gabkw2qhHgdpuLqulg8pZNOQKffD5ZycZNYgarw=;
 b=jqQcT6j/xbFrWHhgLObd4iiQSQOoBuEWJ2EU/vOHBRPATg2WKu1ogNhJxUGd10RWMKQB1CW/yUb3ocu2eXjX7CrlGZtuTQlohax7Zc502Ta5nqR6SC2gwKFk0AqCgFXxsQaU/HIqM/GCRjdlSX5jdJsPiWoJqlriu0aE4uEzEl/EgzsZeTmXIbVcCWwu3Tum41bugCEt/ew++OvzZa/Sl5y9rQrp2xx1dDVBW5L1BcSm8J1XwVxjqZbL+qKNcj636rM97MurwAIx3eiDauOQz9RnMtgZ3EmLDW1KHkY28IrMlNY1wvUG3TIjjhUqSl3JW2/SKPO9Eno4RTJr7iJMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFl9gabkw2qhHgdpuLqulg8pZNOQKffD5ZycZNYgarw=;
 b=g6/YqLxzvuBux3yoCXh7+QEHd9k6ccmLPrEupmEm5VtF3UC+j/98y8AXI+qp4iLkgP+6oPAIEd+CxjFlMBBmEN+jSW58ch/2lTLFCrQCKPd0N9K/mbd3c1cv2LIYwJfVdXAGEhcjMwu5kzm7cIbbq3rutvRobEsx2yLkZgogjvXBUnNYeGUJHg03VVbkWxzkg8/+8wSPC7o3MlAnZu8uM0G/mXpVbjzDz4sgBCQLntOk1H4+A38OtZ/Nw8rpwSb8VNIjQdM36pXpcrTHMp7AUzb93QSrF41IC9V9a9Fph6RFHXTc15W9rRBnE4E27DcLdZTA3JoyxDlduy8ysL7vHg==
Received: from DB6PR0301CA0012.eurprd03.prod.outlook.com (2603:10a6:4:3e::22)
 by DB6PR10MB1623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 18:48:29 +0000
Received: from DB5EUR01FT080.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::2f) by DB6PR0301CA0012.outlook.office365.com
 (2603:10a6:4:3e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Tue, 17 May 2022 18:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 DB5EUR01FT080.mail.protection.outlook.com (10.152.5.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 18:48:28 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Tue, 17 May 2022 20:48:27 +0200
Received: from wonse.fritz.box (167.87.0.197) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Tue, 17 May
 2022 20:48:27 +0200
From: Tobias Schmidl <tobiasschmidl@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tobias Schmidl <tobiasschmidl@siemens.com>
Subject: [PATCH 0/1] wic/plugins/images/direct: Allow changes in fstab on
 rootfs
Date: Tue, 17 May 2022 20:48:15 +0200
Message-ID: <20220517184816.1348026-1-tobiasschmidl@siemens.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.0.197]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.774200-8.000000
X-TMASE-MatchedRID: 5vV0XjnGfUl8J6cKGoYvWKwePkardoUbgJXstD6J/JHKE9oA9cXOzf6l
	pfpte41hL6Rvb61UlO073eIwQ1PCRbM8BzDG7byxmw2Z4Qnk/ejRtBxlwMMWfKubsOtSWY2QgDL
	qnrRlXrYr+IEOItdYE2rz/G/ZSbVq+gtHj7OwNO2BSJy8ngwKGYN7zb1h3cZkuJbek2V2M82ZPy
	8TftSeppWGiurxGle2IDCCVYmXyuc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.774200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 E5A3E7B676086DC182C9B282F8260CEED0656302426978B2C5FE37FA795554292000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8196aa1e-e6a1-4621-e7e7-08da3835d514
X-MS-TrafficTypeDiagnostic: DB6PR10MB1623:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR10MB1623EF31A564E95CB5293CB7A9CE9@DB6PR10MB1623.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bziARNCCtjFjZxBcz4sA7gCI/14OzvcSqupSBk7FNr2slZ6AuJWbmE1NMJm/wsDETxem2R+ck97+VeRniaHyAVWgTij7xePTL8hjf4+fni44JaQ5EeR8+Jeth/ptCgIJ0Ft4TEjiY4VjpwzIecpPvD2hU/F3hkl9As+KzxGdkmJnDLiM9lORIKz2wk/ERJHRDDaCcVLpLMvVJj4FBOlcyfRap/JDPU2FQIantQ32IpmZy8x7lgqaSO/z6DJjSp8i00T/0Xfy/SBPV9rdmyQfyf7Y8BFOuwyHPuMH9wyXVzrglgmUXq8fJwW7WtTEzwxULnczsT+YqIQOg9PUOOUIdCdkosU3XgdxrL/RrZ1Sf9lwmlKho6BVVsARMQurD0YP8e2J6m5ycwWNr1cYv6HlqCUV61aXSyBkmRZH50aGhPUrSoh31e7dFtP0LnDja6vn3G9dlbmxPthwZ1imFPmbgOHEb4OO9UoikXy4aBibGyNlK1aLU8gxmqW41qfnel4lhXKvmDWOmSstYKP75TRfhpLcooNX+ysvWk1GcMcIM8fMQ+BDL1LMSIqTanHLBDaCTPLS5TetuzHAHjiOyKUMec4lRQhs3YxGeW0NbtkuP//kJlsVoEexnUFVTe75iDiDs+BHsETh9TW9ehtsBl9ePVOEt6qL+uT/ndCYNM1qRjWjqmi69OnpiG+dcqBKbit7
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(8936002)(356005)(40460700003)(6666004)(70586007)(70206006)(1076003)(4744005)(107886003)(2906002)(186003)(336012)(47076005)(26005)(8676002)(82310400005)(83380400001)(316002)(6916009)(4326008)(36756003)(508600001)(16526019)(7596003)(7636003)(86362001)(82960400001)(5660300002)(2616005)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 18:48:28.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8196aa1e-e6a1-4621-e7e7-08da3835d514
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT080.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165779

This patch removes the exclusion of `/` in the fstab update. This is
useful for a lot of things, including but not limited to:
- The setting of `fspassno`, proposed as "[PATCH v2] wic: added fspassno pa=
rameter to partition"
- The writing of `fsoptions`

The latter is used for example for systemd-growfs:

```
part / --fstype ext4 --fsoptions "defaults,x-systemd.growfs" --fspassno 1 -=
-align 1024 --part-type 8304 --use-uuid
```

Tobias Schmidl (1):
  wic/plugins/images/direct: Allow changes in fstab on rootfs

 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--=20
2.36.1


