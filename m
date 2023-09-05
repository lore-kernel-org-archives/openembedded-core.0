Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A895CCF9E2
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 23:29:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web11.37459.1693956566617033100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 16:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=R7dEH4Hm;
 spf=pass (domain: nxp.com, ip: 40.107.20.81, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Grz/pREp9PXtgLmrYAqkzVrUHHp5JxYwTEEPsI4PMBQR0qsR2pGWXFE/f4QDDQJWFrSIEPOZUTVXlRjkykYn1PZpBRyvNnOyAtSRXknUtnBVMO3/o2WP34akpuZbDOn/ux3EijG0doGYPDHOyrk8zMxknUti6TiSjcfPdsMNjKkUDqwpqYqp+0i/oacZAG6pd+URzKjd/I5PkWtVu3R71IYGiJsAnrUAl8lQS+Yxi6xP1cY0OAkz+Czi7fhwjroYM95Hhutl9BSarEPcrfsKmeCHxdPIDV9UO34ZA6G6mK9Kp/vsqm2rdGyDAZXCaj+FfBLPL6H2RWgeh18Y6hR9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UDqbr90AYT+N9WqiE5MCTRPZ7hCikxcL5yahiR/92U=;
 b=acFTA80mAeChKIAH4MtK6itD9t0ApeSkQNC/65Ri+wtY8Hfnl8oXH3SOKnTDUN1kk2aH452nN4iK6bokUZCQ1KBcYMdltFlgKXVhjeodR9DBfEFjkR6wQBzOV9wHplEZCwJmtft1h2k/ExiFzEItofPifIaGkImuvG/Lwz40xmrNdIoxT96HlzSepQWiAu6OHWp+JaMuGjoAfX4qxt+wwKpHTi/g1WDvs73bUVp1S3zWJKcwtkCztNFsZSiw6UiwLymbmPbqDAezuN4PbrRBGQszVYaB1j8glLDzZaj2k+l0AuOg+/3U7LW0H4BS4uJANnt8BAaPZjJ0hT/8+nquBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UDqbr90AYT+N9WqiE5MCTRPZ7hCikxcL5yahiR/92U=;
 b=R7dEH4HmB6PgrpnSXAyNPyrcwf9UgQxJkCFHYZPS7jH3tzTooC4EkF179Ug3pxWrnSIAyhW2B2M27PHmPb94DsIdTXaSDMO6x0ri1yDxbEsId4e9zZatUGft0vIagtIEp1PeYmAHuBadWAThkbqzpBBhsg26oifzwnEkAXn8X1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AS8PR04MB8436.eurprd04.prod.outlook.com (2603:10a6:20b:347::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Tue, 5 Sep
 2023 23:29:22 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::903:206e:5922:2f0f]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::903:206e:5922:2f0f%7]) with mapi id 15.20.6745.034; Tue, 5 Sep 2023
 23:29:22 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH v2] linux-firmware: add firmware files for NXP BT chipsets
Date: Tue,  5 Sep 2023 18:28:57 -0500
Message-ID: <20230905232857.1160962-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0010.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::23) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AS8PR04MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a9cadd-1aaf-4e61-6582-08dbae67ef47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uvoWZXDd74HMnXrGqs/C89Ci/cQlHbzNXSvWtG/gDCHut+8wbzg50QmlN/kgmIsuNFQ4dzrT/iDyrcv0DXUtg+RAfVEEMwWDJgPdqFrCLBQbuxiGfnG4v7Ix95fawRHixQ1rQC+/PpcYHdnRLtaszcpWv0GIsR0WefRaarOcLBygRP2+QJW+zlta0awTJlCm9YXdFrfhPTwSiAKTdlMyiUkDKpFDAkPVBoqv2heXQBqSqgMXnWbZEJAVnJbGJa8hwUKg/YprVFi/aJ/qeIblcrJbEYMdap0LWxeaD+Enpt9wUZHki02u/sq879ZXZwKT7mGo/i/hGtvbPa/I1g3P8c/eg2QJFhTHhYJoXIi1gOKeBT0a1xJ8CUhyUoCJoVdpybWP6m0BPct/v+DHUo7C3s7w1SjbY1tYNLNHn1nsn4SHiROVo1IYifevvvR3P1RRUiuaqezrfyhXzcovJIXU+gq0OpVuvldC1N4e9pre0onqNNKS97pU9Fj4lzKQxPArAjZ9y7i2Ira3VKEE9EqrHzJrv4oNXg/cNWENTrkFqYGT0qhOloPhM+8dYgzQHQS/KICnYzBNVj7nLnB/K+4XTm5O9OhhOFiUs2d7Wn5PemY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(1800799009)(186009)(451199024)(6666004)(6512007)(6506007)(6486002)(36756003)(86362001)(38350700002)(38100700002)(1076003)(2616005)(26005)(2906002)(966005)(52116002)(83380400001)(478600001)(316002)(66946007)(8936002)(8676002)(5660300002)(4326008)(6916009)(44832011)(41300700001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v0f68S/83ZKDMBqziJ8vwBWPtow+Tpq68NNS0IWuM9Avj9dwUpEurPcTBiBd?=
 =?us-ascii?Q?P0rhn03OpGZ9AsNOd1uk1I0HhAEAQ1Kr+bWqQmn1OvD6YFta1h6hGwNBFQAL?=
 =?us-ascii?Q?YjUT5kvDy8fnMzL+tv4TwrUXRTqV2epe6z9FnSeEuvTXppGWQrweZkMOi7cN?=
 =?us-ascii?Q?CaRWhocbE9qW3C0hgZMcHQCZ/EbYWzzuDuNQr1Wxrdxles/KGXeVPxaUuHWK?=
 =?us-ascii?Q?VCCQmw4oBfyw1a659UXBNFOtbdVuibECPu0RGBPa6mYU6fgAIW6Sv4WbP9e3?=
 =?us-ascii?Q?Fnfc0zSk4BDeyb99h0C02K3//9luD1jezUdQGq28kqEMovk3AhWidGSbFnSK?=
 =?us-ascii?Q?OAgGVNfJK4sqUZsMgE0/ExNg4n5htgNZVlfF0BEB+UmmiVUDfW48nTQJubDe?=
 =?us-ascii?Q?pHTqhgN586e50MhntYrFBeJF2W2NUu8obOXFI3UDs0U9MNEGfoeYqPdWIy2d?=
 =?us-ascii?Q?pETmYIf/XtUMwNoib8Rnf8zKenSsZ5vEPLeD+NgbfL5jPxnW6whTrapMaDWm?=
 =?us-ascii?Q?8jUkWvJ2zfVHqXec79hRba1G8unL2cL9oOjBEViQ9Nt7sHjToRk4NrF44OXA?=
 =?us-ascii?Q?LB9y9mmuvVDQVvqYIdrVYkNA/RZuW+nspftdj7+413amL0aE7wv7HkezYUIG?=
 =?us-ascii?Q?RxcPIEE7WKo5o8WA6LZnp3tJDCkUcGIOVXm6VBdiRTAlhSVUdtQBbf+6M/MW?=
 =?us-ascii?Q?VRdaHM3aMXJmtLV9woDBgrVSK8eWcvlrZ3cZAPbwW3i/aVnV4I5YysQJJcdD?=
 =?us-ascii?Q?RwSpaXdVdNseQ1Xnt1JOwuq1eae1nl5PhGxTzhDBWoCKn/VzS54ucGy8elon?=
 =?us-ascii?Q?i4EiKYCelXuv/IwPStm4CnQxJDnrDZ4n6Gerr4wPK9Hv3IGHD3z7kIdJBhqQ?=
 =?us-ascii?Q?d/+rm4mB3oHvAEhvSY605mcKMgsu3AFgug3sIcqZXtN/s+9PdlNL1ZDuK1oS?=
 =?us-ascii?Q?Re/RPKr8pwAQfRuCoAgi+Wkxvi5YQUgwEP9WlHM+CNrN6ljVSpkuACbJfhs7?=
 =?us-ascii?Q?vlqEBBPBiT+Px65sOkaZBxz+KuqvF3uBboPGgm3DdUhhBZz6CODilKzTLGiG?=
 =?us-ascii?Q?9+OpyZ2MRsBP09yUywKGo9IlbHuaQg4GoKx7oJ/AVmP6T0bD2oqsxKFdyQLp?=
 =?us-ascii?Q?6gTatsBH9lj8elHP55+AMYQi8SVMLtat8iYTFozJ4t1QX+tiuX+LcfoNTtRa?=
 =?us-ascii?Q?IIA/D7+ED5tgTHE9E9c/lKkvbedsFhvmg7wwOKrovOosgVQJOEmLX/0J5e3g?=
 =?us-ascii?Q?IVTojfeqAM8PcUi0Z7oa4Gy629QcM3sQDTO/n9o43txhP0fQBvgVry7aVpXr?=
 =?us-ascii?Q?5AlxEJ7Sv2jJqVUbEtNfkuUcx1PreuUjMtDUWdXzfz2fl+ydehbqJ0b/LTCI?=
 =?us-ascii?Q?Hrla/LqSCnae67DlBdaXF/jELpXs02R3JVTRwDBaucISKzXH/WujolFT1Hkz?=
 =?us-ascii?Q?N2zyCEZr80GYQLMHMRvYNV1oUKxny9JqCOLDQuyEJwHNNt7CD1E/DHHstMoU?=
 =?us-ascii?Q?+sA4tlG4R6PhFR3QMGnpG/j/UxYbeWhG0gkrfF/SmPWR4mHx5rqAD+8XItCZ?=
 =?us-ascii?Q?vk0i/gw4PiINBx3t5eSStF2x7fTcC07FqPF+4Fmq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a9cadd-1aaf-4e61-6582-08dbae67ef47
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 23:29:22.4844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnUubdeqsYCGJExieKXlG6TeseurnMDbkbVkHJciLN9dB+OdhH7w6PjHSBs75m6ERxoDF1C9X8OLL2dRi1dQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8436
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 23:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187259

These BT only firmware files are submitted for NXP chips.

88w8997-bt:
uartuart8997_bt_v4.bin version: 16.92.21.p81
helper_uart_3000000.bin version: 16.92.21.p81

88w8987-bt:
uartuart8987_bt.bin version: 16.92.21.p76.5

88w9098-bt:
uartuart9098_bt_v1.bin version: 17.92.1.p136.24

iw416-bt:
uartiw416_bt_v0.bin version: 16.92.21.p81

iw611-bt / iw612-bt:
uartspi_n61x_v1.bin.se version: 18.99.1.p154.40

These firmware files are downloaded over UART interface. The
helper_uart_3000000.bin needs to be downloaded before
uartuart8997_bt_v4.bin for 88w8997 chip to set download baudrate
to 3000000.

The above commit message is copied from the source commit message:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/nxp?id=3D1f82dd25c3ea59b6bed80ee685d860f0c5f19875

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../linux-firmware/linux-firmware_20230804.bb | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index d761673db3..ee14630ce0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -41,6 +41,7 @@ LICENSE =3D "\
     & Firmware-myri10ge_firmware \
     & Firmware-netronome \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
@@ -107,6 +108,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5ee3=
f410780e56711ad48eadc22b8bc \
                     file://LICENCE.Netronome;md5=3D4add08f2577086d44447996=
503cddf5f \
                     file://LICENCE.nvidia;md5=3D4428a922ed3ba2ceec95f076a4=
88ce07 \
                     file://LICENCE.NXP;md5=3D58bb8ba632cd729b9ba6183bc6aed=
36f \
+                    file://LICENSE.nxp;md5=3Dcca321ca1524d6a1e4fed87486cd8=
2dc \
                     file://LICENCE.OLPC;md5=3D5b917f9d8c061991be4f6f5f1087=
19cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=3D1b33c9f4d=
17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=3D954dcec0e051f9409812b561ea=
743bfa \
@@ -177,6 +179,7 @@ NO_GENERIC_LICENSE[Firmware-moxa] =3D "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] =3D "LICENCE.myri10ge_firmw=
are"
 NO_GENERIC_LICENSE[Firmware-netronome] =3D "LICENCE.Netronome"
 NO_GENERIC_LICENSE[Firmware-nvidia] =3D "LICENCE.nvidia"
+NO_GENERIC_LICENSE[Firmware-nxp] =3D "LICENSE.nxp"
 NO_GENERIC_LICENSE[Firmware-OLPC] =3D "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] =3D "LICENCE.open-ath9k-htc-firmwar=
e"
 NO_GENERIC_LICENSE[Firmware-phanfw] =3D "LICENCE.phanfw"
@@ -312,6 +315,16 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
              ${PN}-nvidia-gpu \
+             ${PN}-nxp-license \
+             ${PN}-nxp8987-sdio \
+             ${PN}-nxp8997-common \
+             ${PN}-nxp8997-pcie \
+             ${PN}-nxp8997-sdio \
+             ${PN}-nxp9098-common \
+             ${PN}-nxp9098-pcie \
+             ${PN}-nxp9098-sdio \
+             ${PN}-nxpiw416-sdio \
+             ${PN}-nxpiw612-sdio \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
@@ -547,6 +560,42 @@ FILES:${PN}-netronome =3D " \
=20
 RDEPENDS:${PN}-netronome +=3D "${PN}-netronome-license"
=20
+# For NXP
+LICENSE:${PN}-nxp8987-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxp8997-common =3D "Firmware-nxp"
+LICENSE:${PN}-nxp8997-pcie =3D "Firmware-nxp"
+LICENSE:${PN}-nxp8997-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxp9098-common =3D "Firmware-nxp"
+LICENSE:${PN}-nxp9098-pcie =3D "Firmware-nxp"
+LICENSE:${PN}-nxp9098-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxpiw416-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxpiw612-sdio =3D "Firmware-nxp"
+LICENSE:${PN}-nxp-license =3D "Firmware-nxp"
+
+FILES:${PN}-nxp8987-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*8987*"
+FILES:${PN}-nxp8997-common =3D " \
+    ${nonarch_base_libdir}/firmware/nxp/uartuart8997_bt_v4.bin \
+    ${nonarch_base_libdir}/firmware/nxp/helper_uart_3000000.bin \
+"
+ALLOW_EMPTY:${PN}-nxp8997-pcie =3D "1"
+ALLOW_EMPTY:${PN}-nxp8997-sdio =3D "1"
+FILES:${PN}-nxp9098-common =3D "${nonarch_base_libdir}/firmware/nxp/uartua=
rt9098_bt_v1.bin"
+ALLOW_EMPTY:${PN}-nxp9098-pcie =3D "1"
+ALLOW_EMPTY:${PN}-nxp9098-sdio =3D "1"
+FILES:${PN}-nxpiw416-sdio =3D "${nonarch_base_libdir}/firmware/nxp/*iw416*=
"
+FILES:${PN}-nxpiw612-sdio =3D "${nonarch_base_libdir}/firmware/nxp/uartspi=
_n61x_v1.bin.se"
+FILES:${PN}-nxp-license =3D "${nonarch_base_libdir}/firmware/LICENSE.nxp"
+
+RDEPENDS:${PN}-nxp8987-sdio +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp8997-common +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp8997-pcie +=3D "${PN}-nxp8997-common"
+RDEPENDS:${PN}-nxp8997-sdio +=3D "${PN}-nxp8997-common"
+RDEPENDS:${PN}-nxp9098-common +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxp9098-pcie +=3D "${PN}-nxp9098-common"
+RDEPENDS:${PN}-nxp9098-sdio +=3D "${PN}-nxp9098-common"
+RDEPENDS:${PN}-nxpiw416-sdio +=3D "${PN}-nxp-license"
+RDEPENDS:${PN}-nxpiw612-sdio +=3D "${PN}-nxp-license"
+
 # For Nvidia
 LICENSE:${PN}-nvidia-gpu =3D "Firmware-nvidia"
 LICENSE:${PN}-nvidia-tegra =3D "Firmware-nvidia"
@@ -1132,6 +1181,7 @@ LICENSE:${PN} =3D "\
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
--=20
2.25.1


