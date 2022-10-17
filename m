Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7411FC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 15:53:04 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.115])
 by mx.groups.io with SMTP id smtpd.web10.42813.1666021978796181950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 08:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=FTiNRAc+;
 spf=pass (domain: arri.de, ip: 40.107.7.115, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gg4x5q85qPttNmv2auLrf5mBP3dr9xEFD2Pybe8S7FdDHmOavxpCqGEgB3JlPG+evj+d7EI3zKCSVnzVMnfl1nZV1SUpXIi89WwV5grM3so2y6/JBimQjaSsSqfzuJ8K3zQ4U/8umPYYbnRn1HgapgtLpZl4Tpec8MsCD8Krztpa1TR2l8ky3pXMx+uDz86pZL1YcppZv5K9fd0Ci66bx7Ht8ea8cDlt1IhYEoqWrFapApgbqOcQsf0mxg1Kw/qBj2hlk1X9Nppe1LnFOYqEDHZGeBK/CIvKpK5/kIpkIrQOa22pCWdvxSu+1xR1+WViHZNvyuTlnK8ktyinJGBsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36X15lZ+KCWNrLaUHtryF1DVydYaSgEiT8oOR7o2g7w=;
 b=L96fmxFRWpPjGQXMIa3in/XpAYzFHqXoNm9cHjrG82/Ho8EqGHkqbuyFytGYbpliWC4ImkaBlN0U2bQ5Ek8rhIDTUoem2WKXcDJTYAamX+deWiCCcoTdgetAyhDeCnHdmZ/n8EkgG7cwtYF9FwJoRpX9r1o51NtITEaX7SALKhxv+umxzrMxhZ5GDjoFmXW2IdztOHjzZR5xpK+gbbo7HM0XRuEIyg9lJJM3FkFUCt+HhAbTqhXCj8c8aqHnav9TqUWxfZsi6RZjp3Eg8FGLuwxscmngn1+cpVp2tD5y2lAqsClvKWiUpwR6AmTJ/adZoTcZc5oJ3sLYFVGyN6YZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36X15lZ+KCWNrLaUHtryF1DVydYaSgEiT8oOR7o2g7w=;
 b=FTiNRAc+fUG8gpTnYfq5LuG0XVcAjEkIM4r9i3HErg6EZZiRjy0NRfU7Qp1d3WXNskLtBFtz6W1Czu5CKEAcso6fSQ4N55Gz6C7otO8KI3ofFid6vQd9L+HRAVXU0uDWjWFBC51+aVCh+Z4xtartgaomUR4QVDPKAHPsKrVUt0M=
Received: from FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::12)
 by DB9PR07MB8749.eurprd07.prod.outlook.com (2603:10a6:10:30d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.20; Mon, 17 Oct
 2022 15:52:55 +0000
Received: from VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::9c) by FR3P281CA0046.outlook.office365.com
 (2603:10a6:d10:4a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Mon, 17 Oct 2022 15:52:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT028.mail.protection.outlook.com (10.152.12.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 15:52:54 +0000
Received: from N95HX1G2.arri.de (192.168.54.96) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 17 Oct
 2022 17:52:54 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH] linux-firmware: split rtl8761 firmware
Date: Mon, 17 Oct 2022 17:52:40 +0200
Message-ID: <20221017155240.16652-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.96]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR02FT028:EE_|DB9PR07MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fe8213-05da-4733-477b-08dab057a7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MdpZywWMBFHTIgX0ZGzcQ2QBXzIRJsTkphtfCk1S5NnOve++UDyKXiB3/GbK8kxWJQl4UJuzAmnutZ1qzOXAC7qURngItEai50TnHi0kurjADZRjH7Sohy+DDod54PDAt+jjeLDtH5H22WNDysR6MifHDpAgCIDTy7Z/yJwMNN8Ok1b31ZCFX9Mb+knDwhx/Tz9vUlmziAKHQUwdoHydkaF0AvTjc76VaXdDZO2d3jtH+3foKBpSXyJrr+ZpNo96VMqsPmWYAfUtzMWOMa/Nrwf0QhPgKYU1auJkAVue01ER2F8L7WK7/S1OolbAJz0DJsou2wS7kMeZpojKNC5JOokFyNr2HvAwz+ywctMq2pWg7i+vGkbwr3MdmXDHSzFMlSior3+1ukLWmFFDrfYyocBabCxvaVjvVJY9Y+STNnxSSYLYlQNOw03Ay6UvzijEmmptASAQdhM4OZnLCmIjR02JTOlPXaqqVFz8IJirlbI39HqEg4BlMdOBGGqpRR6tfTTM4xjAWaR31Hr+UnUwwdX+WyDbX6NsBeQ8MOvb+lOFShZfUDTINEj2/tqUc/HMhzWEAeS0ZHDuP1lHxbf2HQjwjXOR56vzvaNLsvmbTJiKJT8/DXSdwRGNcwayn5whKcj8J9rjyNkhno6IrjN5A8xD5XYmuyJYFcDTzgLa9HSikZKDf9Ogv49OFFAgfMXYVQCNCSYXej4boXlPEFk77oEXU5XusOO3JHekiZgf8qhQcPQQ47tmYuj90nm4FKTJ7PyXssRuGZsWss3urxUC0w==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(36840700001)(46966006)(336012)(2906002)(1076003)(2616005)(8936002)(16526019)(186003)(7696005)(41300700001)(5660300002)(26005)(81166007)(356005)(82310400005)(82740400003)(40480700001)(86362001)(83380400001)(36756003)(426003)(36860700001)(47076005)(316002)(478600001)(6916009)(6666004)(70586007)(8676002)(107886003)(4326008)(70206006)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 15:52:54.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fe8213-05da-4733-477b-08dab057a7b2
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT028.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB8749
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 15:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171914

Realtek Bluetooth devices require binary firmware files. Package them
separately in order to avoid installing the full linux-firmware package
on embedded devices.

Affected (end user) products (incomplete list):
- TP-Link UB500
- Logilink BT0054

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../linux-firmware/linux-firmware_20220913.bb               | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 45c9d0e86123..eea9251a840e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -235,6 +235,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192=
ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
+             ${PN}-rtl8761 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
              ${PN}-broadcom-license \
@@ -563,6 +564,7 @@ LICENSE:${PN}-rtl8192cu =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8192ce =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8192su =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8723 =3D "Firmware-rtlwifi_firmware"
+LICENSE:${PN}-rtl8761 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8821 =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl-license =3D "Firmware-rtlwifi_firmware"
 LICENSE:${PN}-rtl8168 =3D "WHENCE"
@@ -588,6 +590,9 @@ FILES:${PN}-rtl8723 =3D " \
 FILES:${PN}-rtl8821 =3D " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
 "
+FILES:${PN}-rtl8761 =3D " \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin \
+"
 FILES:${PN}-rtl8168 =3D " \
   ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
 "
@@ -598,6 +603,7 @@ RDEPENDS:${PN}-rtl8192cu +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8192su =3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8723 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8821 +=3D "${PN}-rtl-license"
+RDEPENDS:${PN}-rtl8761 +=3D "${PN}-rtl-license"
 RDEPENDS:${PN}-rtl8168 +=3D "${PN}-whence-license"
=20
 # For ti-connectivity
--=20
2.35.3


