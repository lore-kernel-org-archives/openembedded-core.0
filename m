Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74382C47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 17:40:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.137])
 by mx.groups.io with SMTP id smtpd.web10.19495.1705599653783497858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 09:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=VnF/nk3N;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.21.137, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZsO1P2utV150V7/E/3YXZkslPWxfbHgpyEKoO2zgixQt3xiXQmcARCfJyTa4yj1XFzw7iDV9qmxGR9ub8gWffuhDJEVOrWADrMOHfdMsyG5aJ4sxmZWb0/0LfJO1DCdPLRoeMxEqR1ddujAnw4FJJR0b4dwHaY+178HTPCds/o8+A0lCad7MsYiLVIAQvs//Dkq0WBbStMh6yfuqB/JQBc8PJ0mWt/rPa5DNPCIZ5dwMOh2daiakU0qlHcbD74YI4JNepGTth9pktZQfXNfzWGmv7BcN8zza3LMVCQ3D5y6nG2pPBMVYJ8BxzEleTPqWn2Js4Jz2qKxXX4N4CgGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4pfCoc+T/p6uejd+OAn0FUhkFOhjlA8+qkgCZ/sTKw=;
 b=bu0YdGe4uS+Yzpmt+5GZVgLuWAsDkx9i3JjwMkUnNIXeeGd+p38knAw5Hu+5Ykyr6MKQuqta8mya6BMngi014V2RoZw7pD4aVHybzjB7GlmHYkznvfpllTkmaqFg4qX/VTAEWpuyBJyPBcL3W4Md9b69isEsNB5lcNMtjj6UJRaYpOA8dUSV9pJIx3LPJ3EIN7H+/hGgZaWk7tRlJAOTaUspNjVmdZgwIjUA1JFPmRbpYU6u9BnHSI91opbTKr5mX9w1iorArv34M7Ihl+Wq6cVMle01VqGnx7NUotizHNGx4P/e14Q76VITCChut4QCLKLUad2nrcspWPnkDxu3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4pfCoc+T/p6uejd+OAn0FUhkFOhjlA8+qkgCZ/sTKw=;
 b=VnF/nk3NgrLrHSAAfYXqfaL0m/gpOJyrarCdqZH/CYD4uRCZyQEGHagVGYt0Snx2WnX8pbx7y1ECAI45C1Sa+DoZh3FTnuONALnO4YiH7qLgN8DoAvWYm242hIx3v7BYO9VkpuIwB24NG7ZV4DSJy1j9X55MKSroHhjz627nlL4=
Received: from AM0P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::35)
 by AMAP122MB0215.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:197::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.32; Thu, 18 Jan
 2024 17:40:49 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:208:190:cafe::4f) by AM0P190CA0025.outlook.office365.com
 (2603:10a6:208:190::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Thu, 18 Jan 2024 17:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.0 via Frontend Transport; Thu, 18 Jan 2024 17:40:49 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id QKA5retWO0QCjQWNlrGf1X; Thu, 18 Jan 2024 18:40:49 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id QWNlrCi0FIUGzQWNlrbsqL; Thu, 18 Jan 2024 18:40:49 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 43F60182502
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 18:40:49 +0100 (CET)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 351292A015E; Thu, 18 Jan 2024 18:40:49 +0100 (CET)
From: jhaller.oss@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] linux-firmware: fix mediatek MT76x empty license package
Date: Thu, 18 Jan 2024 18:40:49 +0100
Message-ID: <20240118174049.3517958-1-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|AMAP122MB0215:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 61b580f6-2ec0-49e0-dca2-08dc184c9c1e
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tkQjtjCERxkSZqCgoFo04J8o6zk0le0916URERl0o1Uw3F9fLzr9pxUglkcDFxgGGZZYsPBu8nYaqRGy/zZG/Bd14fdrMYbbxSTA3t279shPsA8dhQMx8ygsifvO4Gleq0flUSYAlGOuYzIZtStC8Ma0awIX+LNXB8aNEOJZyF84ewHUWqEyYZP/2qLUt3s7phtgA2iDVht08JMxcotKqHpW44ZOgcgWoCJFgB3wKGcgPSNH45jzLpBs3t4A14I6vZyeOz40yXS/RzSJ+/8hPFkEd0ZOR5zk5SfYsCJGNJ4CmRV1NuPAp8pmq8Eb6JQmyCheeJWKHqN8F55OMGB5u0QQcL1gT8gO7v0sDOZiIvLEEdg4AcgQQky8nSYmzs3A2oYRoRiF7q0kVxV7r7KvXnhD4qjhaVzR1jYxiFcN9aBPgDRHGtSBzDwCVU6XlWPVZ0AoXF9fgR74rxCuOzE0RN0WoJnzms/8Q81DpvLoM5rIMU87JBJ5skIK4QDKtKV4iEyDZBdY4VgXf4VYeHHZrRziZD1eIcyD5Ur86nQh7/fyvngFPQmga9m+ImggjNQ7hwEapkYOMEOk5J0ls7vqVkslEkOfRb+saAtUm+HL9pMgXk6I5GFakLJ4hJk2X/Mt1K1Jaj7W8Rb2DYp8/RAiKgxx8UDGUqBWYNFzJypAfIF230iCzg3B4ZWzjNJ7VXpHdSJZ+xSEB1nq3CeeWuH1kwH7QFu2kSpzCaAZdIH2mcdt4YGL96FXT6T08mCxn7QTycIroHipHNKStF26yxOxLQ==
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(84050400002)(230922051799003)(64100799003)(451199024)(82310400011)(48200799006)(186009)(61400799012)(46966006)(40470700004)(36840700001)(83380400001)(41300700001)(47076005)(55446002)(82960400001)(83170400001)(36756003)(7636003)(356005)(7596003)(82740400003)(478600001)(36860700001)(8676002)(8936002)(6916009)(76482006)(316002)(42186006)(70206006)(70586007)(1076003)(6266002)(2906002)(26005)(73392003)(82202003)(336012)(42882007)(9686003)(2616005)(5660300002)(40460700003)(40480700001)(35450700002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 17:40:49.5148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b580f6-2ec0-49e0-dca2-08dc184c9c1e
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMAP122MB0215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 17:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193995

From: Timotheus Giuliani <timotheus.giuliani@philips.com>

Installing the linux-firmware-dev package fails because of the following pr=
oblem.
For each mediatek MT76x firmware a separate license package was declared.
In all these license packages the same file was referenced as the license f=
ile.
This meant that if several of these packages were used at the same time,
the license packages would be empty.

This commit defines a common license package for the mediatek MT76x package=
s,
which is then referenced by all of them.

Fixes: dfb7d2c426b4 ("linux-firmware: create separate packages")
Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 .../linux-firmware/linux-firmware_20231211.bb | 23 ++++++-------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index 16cf8e241b..9347cde298 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -263,9 +263,7 @@ do_install() {
 PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-cw1200-license ${PN}-cw1200 \
              ${PN}-ralink-license ${PN}-ralink \
-             ${PN}-mt7601u-license ${PN}-mt7601u \
-             ${PN}-mt7650-license ${PN}-mt7650 \
-             ${PN}-mt76x2-license ${PN}-mt76x2 \
+             ${PN}-mt76x-license ${PN}-mt7601u ${PN}-mt7650 ${PN}-mt76x2 \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
@@ -507,43 +505,36 @@ FILES:${PN}-ralink =3D " \
 RDEPENDS:${PN}-ralink +=3D "${PN}-ralink-license"
=20
 # For mediatek MT7601U
+LICENSE:${PN}-mt76x-license =3D "Firmware-ralink_a_mediatek_company_firmwa=
re"
+FILES:${PN}-mt76x-license =3D "${nonarch_base_libdir}/firmware/LICENCE.ral=
ink_a_mediatek_company_firmware"
+
 LICENSE:${PN}-mt7601u =3D "Firmware-ralink_a_mediatek_company_firmware"
-LICENSE:${PN}-mt7601u-license =3D "Firmware-ralink_a_mediatek_company_firm=
ware"
=20
-FILES:${PN}-mt7601u-license =3D "${nonarch_base_libdir}/firmware/LICENCE.r=
alink_a_mediatek_company_firmware"
 FILES:${PN}-mt7601u =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
   ${nonarch_base_libdir}/firmware/mt7601u.bin \
 "
-RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt7601u-license"
+RDEPENDS:${PN}-mt7601u +=3D "${PN}-mt76x-license"
=20
 # For MediaTek Bluetooth USB driver 7650
 LICENSE:${PN}-mt7650 =3D "Firmware-ralink_a_mediatek_company_firmware"
-LICENSE:${PN}-mt7650-license =3D "Firmware-ralink_a_mediatek_company_firmw=
are"
=20
-FILES:${PN}-mt7650-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmwa=
re \
-"
 FILES:${PN}-mt7650 =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7650.bin \
   ${nonarch_base_libdir}/firmware/mt7650.bin \
 "
-RDEPENDS:${PN}-mt7650 +=3D "${PN}-mt7650-license"
+RDEPENDS:${PN}-mt7650 +=3D "${PN}-mt76x-license"
=20
 # For MediaTek MT76x2 Wireless MACs
 LICENSE:${PN}-mt76x2 =3D "Firmware-ralink_a_mediatek_company_firmware"
-LICENSE:${PN}-mt76x2-license =3D "Firmware-ralink_a_mediatek_company_firmw=
are"
=20
-FILES:${PN}-mt76x2-license =3D " \
-  ${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmwa=
re \
-"
 FILES:${PN}-mt76x2 =3D " \
   ${nonarch_base_libdir}/firmware/mediatek/mt7662.bin \
   ${nonarch_base_libdir}/firmware/mt7662.bin \
   ${nonarch_base_libdir}/firmware/mediatek/mt7662_rom_patch.bin \
   ${nonarch_base_libdir}/firmware/mt7662_rom_patch.bin \
 "
-RDEPENDS:${PN}-mt76x2 +=3D "${PN}-mt76x2-license"
+RDEPENDS:${PN}-mt76x2 +=3D "${PN}-mt76x-license"
=20
 # For MediaTek
 LICENSE:${PN}-mediatek =3D "Firmware-mediatek"
--=20
2.25.1


