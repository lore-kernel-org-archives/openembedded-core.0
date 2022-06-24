Return-Path: <julian.haller@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010A6C43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 14:19:08 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.118])
 by mx.groups.io with SMTP id smtpd.web12.8084.1656080341807229987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 07:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@philips.onmicrosoft.com
 header.s=selector2-philips-onmicrosoft-com header.b=iJIV+XhS;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.104.118,
 mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye/yIYZhgTYvmd/Gdff5wRxDHZuI2zVp9g3cEhXaD7q3crImMVNJeM2+ZE+Ad8AP4a9q9CbdiZv8wZxNp5GCL6giJH8NTOnsiNKNP1G5FtmTpI/EO2/rcL67PRrq3im21TF7GdBGS4YZ9vgMjU5kAb4Z3kcdO6tQb1xIgyZbq9Pvq2MLooyPNQg1q+B3PiVqUYeFCVWYG+yPxc22Ed6bHh0ApehFGYXQD/ECQPnBZek2+nuUqu71YhOk7jbKkr4oz7PQpvxOTORlQG2V7nJTDteNmq46XI1q3AQZ824fyMA+CYkImks9uGkeI466eQqVerKht29DdrFQ+bMPTaNJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkgoQDNcSAoyMGOZBd1jpwFchkMEzlgCq5VZgVLe164=;
 b=QH8LbyOPyed+y6l+9SqTfbd3B/czlvc8HDCCa907P5vNjVyw54pGxhiNlBcIWM8w6PirCbMxQDT+hRMknUS6E0PonSeKbSpBuIsiw3dORYtMvU8BJgYAZ4J3k+5YRGnsp6sG8U8O1gbiNnHag3Pt0rhjlMtM5EnTMeS8fykwK/PwWafeaeqV0GesuS5aS4XXfeynsnfr0T2vI2v2uvm69pR0ttOla3hu2/VgZQqJ6pzzWLfmB/gIb96SzYhG+yM5Pt377ttLnegcvR0KBavvYzbWDY4LbkP4rIJI1AyxgczmwLwE1orzl1I0W/a2aB3t/kGD67PG2yrtPCr8Eb/qVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=bbl.ms.philips.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkgoQDNcSAoyMGOZBd1jpwFchkMEzlgCq5VZgVLe164=;
 b=iJIV+XhSeEnLgXIAZzGd0O+BnIt6dn0BDjrTsAdcwSNobPetR4G/YeeC9Jwzlipb7S9OlGtPH9cPo2faR9zJvdzZaxY4qbHafKAJJxbHrFTkT5FjlPyjHlWGcPEVJDBThDkWbJ+FXG2c/Pn3966aaMrrdHRvy4pwg8caztE6cP8=
Received: from DU2PR04CA0285.eurprd04.prod.outlook.com (2603:10a6:10:28c::20)
 by DB5P122MB0071.EURP122.PROD.OUTLOOK.COM (2603:10a6:20:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Fri, 24 Jun
 2022 14:18:49 +0000
Received: from DB5EUR01FT035.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::31) by DU2PR04CA0285.outlook.office365.com
 (2603:10a6:10:28c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 14:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bbl.ms.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 DB5EUR01FT035.mail.protection.outlook.com (10.152.4.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 14:18:48 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id 4bPdoaCpTl9Zi4k92oLiEO; Fri, 24 Jun 2022 16:18:48 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id 4k92oXg8nBXNN4k92oQ4JX; Fri, 24 Jun 2022 16:18:48 +0200
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com
 [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id AC6F7183347;
	Fri, 24 Jun 2022 16:18:48 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id A985E2A0010; Fri, 24 Jun 2022 16:18:48 +0200 (CEST)
From: Julian Haller <julian.haller@bbl.ms.philips.com>
To: openembedded-core@lists.openembedded.org
CC: Julian Haller <julian.haller@philips.com>
Subject: [meta-oe][PATCH 2/2] ccid: upgrade 1.4.33 -> 1.5.0
Date: Fri, 24 Jun 2022 16:18:27 +0200
Message-ID: <20220624141827.1204951-2-julian.haller@bbl.ms.philips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624141827.1204951-1-julian.haller@bbl.ms.philips.com>
References: <20220624141827.1204951-1-julian.haller@bbl.ms.philips.com>
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ddbfe480-aed5-4155-f8f9-08da55ec7503
X-MS-TrafficTypeDiagnostic: DB5P122MB0071:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fGEP8FSRkuctTP+LpnR3fyaa3oe6/WHmOQqA+abLv+233cXAYUH2XoqbBL1EcupL3j6OkLGBMa9Y2MNTz8xZjPof/Q45dOolAVf5a6Hk5X0U1czW+Sf8hsQwbg/EmdXtHwsFl5T2SftasnHQhVSszOYfLqQW4REU1Mp3+BOXYohnyNksdu8m7CKyEBvOvXTw6EW3gnrdWtgrdirNes1DbnpFiljXbDDGHCy5wURdd3z/V4Jn243DH/FVWoXhJHv8od9ZGvcreTEt7QpHPTw0L23awXYPibJxRhrYe69ffbC8EY3RH/Y74rj/dUMRbxkeJSMjBm5+vtfJx2foq8awXyO+VfHUymOEfTFmNWLY2EQjBwDoHIYoEat6LaugdamGS1KoBFjYCaCnc7HJGCq+8V7wdTiXQWD9alVkVroeCA4ktIOMnmAcni79TboNzgYT/krtbB/hY9uzeI6xRSIdfuq2lpXmIgO9sLzWOe5ozmSaoHBjJryIcTipdZwAddeeZd4W2XJtnJukubi02drUTDyHRS37qD2pPFhLBmsvUVTonlfJaBRFsld5MZ7ZzRNumPvgkjyhmDskZQlIun6C09A23HvwdmsW/SPsZ3Srh+H4xIe4poNte6BkD78wVtOwYJ50Tie+wUCJ27wYH0uA3pIW7RWM9J7Iq6dt4Zn6l9cuf2U5AG+2xAp+5KM6bn1XVXHbDz3YalF3rpbuJtP+kXfrz+BJuzghCtNwpwcOMWJHDxfuf01yOqXcIrZPzT2iCffu5Xvg4GQCA4OW/vCSsKL4LpxmFVAPsP8hJU493qX0rneYypid1wDUt/qw8R0JkzKPmA2HYQHZniP70m0MDA==
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(1076003)(120186005)(83380400001)(82310400005)(478600001)(186003)(336012)(42186006)(5660300002)(426003)(356005)(8936002)(6916009)(44832011)(4326008)(107886003)(36860700001)(7596003)(2616005)(7636003)(41300700001)(26005)(6666004)(8676002)(6266002)(82740400003)(47076005)(40480700001)(70586007)(316002)(40460700003)(70206006)(82960400001)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 14:18:48.9402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddbfe480-aed5-4155-f8f9-08da55ec7503
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT035.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P122MB0071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 14:19:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167293

From: Julian Haller <julian.haller@philips.com>

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 .../recipes-support/ccid/{ccid_1.4.33.bb =3D> ccid_1.5.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.33.bb =3D> ccid_1.5.0.bb} (6=
9%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb b/meta-oe/recipes-=
support/ccid/ccid_1.5.0.bb
similarity index 69%
rename from meta-oe/recipes-support/ccid/ccid_1.4.33.bb
rename to meta-oe/recipes-support/ccid/ccid_1.5.0.bb
index 7b260f177b..9775d82fae 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.5.0.bb
@@ -3,15 +3,15 @@ HOMEPAGE =3D "https://ccid.apdu.fr/"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a=
1"
=20
-DEPENDS =3D "virtual/libusb0 pcsc-lite"
+DEPENDS =3D "autoconf-archive-native virtual/libusb0 pcsc-lite"
 RDEPENDS:${PN} =3D "pcsc-lite"
=20
 SRC_URI =3D "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
=20
-SRC_URI[md5sum] =3D "b11907894ce2d345439635e2b967e7e5"
-SRC_URI[sha256sum] =3D "5256da939711deb42b74d05d2bd6bd0c73c4d564feb0c1a502=
12609eb680e424"
+SRC_URI[md5sum] =3D "f246d6601856775310c86b841b616de5"
+SRC_URI[sha256sum] =3D "81549b3422469d503996d03a3aed2ef1375b359167f10d66be=
9e3844e729322e"
=20
 inherit autotools pkgconfig
=20
--=20
2.25.1


