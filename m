Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75861C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 09:15:54 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26290.1786958148060307678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 02:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=YkXN/N09;
 spf=pass (domain: phytec.de, ip: 52.101.84.75, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2FW4ti9yG5Dd2TAq34ylOAXm1EFDPPn23XuwBshIRdgqqMnTwQnhxtE2aBD2XJruWrUd3N5yYfvGMxWtqNRbBvduYdYOK4YZJ+M+bcActHgKpj1+mt+OwHgXlM43FuhWy4N+AEsXm+bO971UuxZhLhHj4ZkA2cYm/AQxFq7ShgPQvzW/UqqCPcQUdSaFXYmPv9MPoZutay0jvA0dEXbGy7MNnomPzG5xALQJ+cRt7jD75/vJsPm3LqlPop5/Jp93rj8aIBXMx+M1+X3S0WsB/NKU5bVRMxf2lX9FMEElZxkBUY8jbBDK3Oimw0mVbO5c7eQJOoNCIWHOdYqW1RjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyo/NaWq25zhrtYL3JOzKcNI2pbtVI2rZvqmvSs73og=;
 b=QO7x9s0CdlyWGOdlaVebHc6cuIz5XDAGeEmCN0l5wegqOaU8Fv7ryIonsRHDY76OTf4QjCqHJ12Rwsi91rjWkWPo21EEKfIq7MYBlniyp8ylePf4nx8uzGjbdgvgJtNMs1lNFomyEt8BlNqASqT17rgXZvOw7+tfal3tzXOFFcV/hWUxtjssDQVr61bhqhDVMq3F/0a0JlVKIDRvT+xHCn/TNh0tfAM6ZR/TQXQEA2eQSgyksoXiXEexC8RchCyIY7R0DIzJ3BvjJUkxkfdMTLt4+Mp0jXPNmhj6xK/pkj7Fjc87F9t8Ub7G9VF6BnhzAmHZfnV41GhIbWQsrftKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyo/NaWq25zhrtYL3JOzKcNI2pbtVI2rZvqmvSs73og=;
 b=YkXN/N09x0YQA68HGXjqptXY1dFx1uW7lIYLWHeOv8WlJLoJTjpYAGuoZpiiRF5R9VU5lusV6bVxZxtF1s0e0G55iw9YuuDO/NoZ+JFV4HIgIophP/jOQXK94+Fy0dsj+vaQLvNO9PjbTUeTqg1gkBvxbL3G82guvUknZkHK3qq44TQg0fV5Ic4kC7reQzbRCxnIe2NV8Yu4QiLP00ml/Tfv9WBY8fuXCAPt9qRIe+nZB2SJNc118nv27mo49epbi/jWZy1B4f9oSm6utxPyYIlE9YaTXrJizw/C076HgYCSiufd4j4ga9hkKT7rn8bhUZCWNk+kpXcOKkgeUXna/w==
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by PA1P195MB2536.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:467::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:15:40 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::83) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 09:15:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 09:15:40 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 11:15:39 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH] linux-firmware: split out iwlwifi 5000-5 firmware
Date: Mon, 17 Aug 2026 11:15:28 +0200
Message-ID: <20260817091529.2406140-1-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|PA1P195MB2536:EE_
X-MS-Office365-Filtering-Correlation-Id: c738639b-446a-496b-aa5b-08defc401b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|42112799006|376014|23010399003|36860700016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rYcdFhwMweIniBTO/maSmWo+mQ/QSXYmgOZUxBxpIj9sSpk9xEEmpQt5vryRip9dn3uMaKngetruGQpYN4mZXXysWs9FGjZqvXSUvVTuSQ2XE1qXebKTCWDttJfGXd1oP3Cfh4AdMH8SDI6SWLrDsea0UoNYXlmS7wJHZ1ISKfh1PtZfgN2pse9wwOqVZYWB490b1B4CI5cXvrtwajGFKMSRrK/Zo88LkpR9Ty2g1KZuvFukBkZBAw52J3mwJnOSV9zQfxHEgOhpdzv0kDSaGxCAYw1BkG9aQVRhUWFMMf5y8VWvWH1iKRUXtUgVqWYp4/uAWF5n8Xq0AN8jLXnuo70bCKWtqOFGVJeJOEG7gN+Yg6kRAlFezyAkyDtxGtqaVsJLkaPCeiduik6Mk0Mw+/ZhePPBP+49l7P1dLZkfyeg4A8wf71GvRC9GuFDxk/pQYbPBYlbwbY6MzKgCHxc/QRZx8VLGYrockHk488hhi6oCqo5JNNtG9R4T0/phVt5PCgAHlE8bSgaGkeAuIZGuQe28oy/1/fs2oEYAu+7NfJ65Sr2LBni4ekpbOsbHlCgDXkQ9/tjdvEcezDTMKWHHbZdJA6b2IOojb+rWtsVLcuiugFfHwudrbHrVf/sUKvg6sp3gJmK9FZYI29a3h0RbAgW90xhf+WhJJPybbZFX15PKSl7RhMYsY1+v//eZtlIgrMSLNxXI5FQtU5fGWhG8Q==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(42112799006)(376014)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u72QSjK2vf5nncCkS4OaElbihSbuSWbC472qsl78rpSH2q67+M45Ll2Ip4nQeHRND4WdvxK5Riu41uRHC9GXtVLkDdojbzr2M/lW/13Z5WIJpq9A3qsPNMZhU2StsNNYHD3FW/I79LIGdO673sXE6iH9JMKH7Mg77wVhsDeY6A9VkY+DDmGFg7mgjfUwE96LoEVIS5mSQDSE8grVKd3rMgZktx0JQdPUlRshcW1hxhWNChK2csbSt23XRFWi46xWfutpxg6IIAEiZYfwYdNv5lc6cqYpa3U98phW0EFuHKH0COv6juWAXZzF+c6AJjqnKKhf4i+zTrnaxDBXaA2iEbPHlCay3WVXtDXHhY+0uXJI9Uvx5n7tDtsylyM5BoxgnQQwpn342sl42F1HgZDjTiI31wi7baSodZ98N0vVKqvuwkaiMPvoJSDGZzSMArQX
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 09:15:40.3696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c738639b-446a-496b-aa5b-08defc401b96
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2536
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 09:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243602

The firmware currently resides in the iwlwifi-misc package, which is
238 MB large. This is a lot of space, if you only need a specific
firmware.

Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
index 5e0d008f1b..2a0d3980b7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260810.bb
@@ -631,6 +631,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-=
vpu \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-=
9 \
              ${PN}-iwlwifi-3160-10 ${PN}-iwlwifi-3160-12 ${PN}-iwlwifi-316=
0-13 \
              ${PN}-iwlwifi-3160-16 ${PN}-iwlwifi-3160-17 \
+             ${PN}-iwlwifi-5000-5 \
              ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-60=
00g2a-6 \
              ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
              ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
@@ -2165,6 +2166,7 @@ LICENSE:${PN}-iwlwifi-3160-12   =3D "LicenseRef-Firmw=
are-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-3160-13   =3D "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-3160-16   =3D "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-3160-17   =3D "LicenseRef-Firmware-iwlwifi-firmware"
+LICENSE:${PN}-iwlwifi-5000-5    =3D "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-6000-4    =3D "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-6000g2a-5 =3D "LicenseRef-Firmware-iwlwifi-firmware"
 LICENSE:${PN}-iwlwifi-6000g2a-6 =3D "LicenseRef-Firmware-iwlwifi-firmware"
@@ -2192,6 +2194,7 @@ FILES:${PN}-iwlwifi-3160-12 =3D "${firmwaredir}/iwlwi=
fi-3160-12.ucode* ${firmwared
 FILES:${PN}-iwlwifi-3160-13 =3D "${firmwaredir}/iwlwifi-3160-13.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-3160-13.ucode*"
 FILES:${PN}-iwlwifi-3160-16 =3D "${firmwaredir}/iwlwifi-3160-16.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-3160-16.ucode*"
 FILES:${PN}-iwlwifi-3160-17 =3D "${firmwaredir}/iwlwifi-3160-17.ucode* ${f=
irmwaredir}/intel/iwlwifi/iwlwifi-3160-17.ucode*"
+FILES:${PN}-iwlwifi-5000-5 =3D "${firmwaredir}/iwlwifi-5000-5.ucode* ${fir=
mwaredir}/intel/iwlwifi/iwlwifi-5000-5.ucode*"
 FILES:${PN}-iwlwifi-6000-4 =3D "${firmwaredir}/iwlwifi-6000-4.ucode* ${fir=
mwaredir}/intel/iwlwifi/iwlwifi-6000-4.ucode*"
 FILES:${PN}-iwlwifi-6000g2a-5 =3D "${firmwaredir}/iwlwifi-6000g2a-5.ucode*=
 ${firmwaredir}/intel/iwlwifi/iwlwifi-6000g2a-5.ucode*"
 FILES:${PN}-iwlwifi-6000g2a-6 =3D "${firmwaredir}/iwlwifi-6000g2a-6.ucode*=
 ${firmwaredir}/intel/iwlwifi/iwlwifi-6000g2a-6.ucode*"
@@ -2220,6 +2223,7 @@ RDEPENDS:${PN}-iwlwifi-3160-12   =3D "${PN}-iwlwifi-l=
icense"
 RDEPENDS:${PN}-iwlwifi-3160-13   =3D "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-3160-16   =3D "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-3160-17   =3D "${PN}-iwlwifi-license"
+RDEPENDS:${PN}-iwlwifi-5000-5    =3D "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-6000-4    =3D "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-6000g2a-5 =3D "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-6000g2a-6 =3D "${PN}-iwlwifi-license"

