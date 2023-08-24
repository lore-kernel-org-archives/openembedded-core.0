Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE19C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 20:04:22 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.79])
 by mx.groups.io with SMTP id smtpd.web10.1454.1692907455735361413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 13:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=dj8snM+h;
 spf=pass (domain: nxp.com, ip: 40.107.247.79, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLan4Khb77Y2h9OtE53ebB/CsNchLF+9U8SZksk+X7vq8WmkZ5mw6OiFwzJ7oVzd8kOuUBHcF056j0TbpsskB4h0VpVY8xezysn0aY1HMnchvHI+vTk4k3+ZTyRi4aS+VANKzBPKoKod/QBzlkazn8GmbrRmnrc4sK+yo54exlC9uHjvxHtKdN4stYFsglFnxAVzkbOwoNB/c7K28OM/kgF5+UJLEMtXt+JEjoNPVMzEy8Dk61IjwroHj/lYXGCGGxNZmZocS8pbaD/RNzDyQNupXn+jWx8ZygsnLY0mp1BAagdnP4Yv9qaGmZymNqCaTkiaE/Yv116u8z16FV1qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiFnTttsVQDKFyE8ppl5xIUb9YzZzMbp4IWDHIQ9EoY=;
 b=bckOgPoZhTj6gWL1vwCYADUQE45d16oERYKoiWR0kW9PPWgNYFjbl4WfjNJc3NI1pJbQAo30OOOIWQDyeFfM5qHSkNjLqb+DE2mgBV3qwOCOUoDmhnfbq0zYw9dcFbl2uqLkOTkUIwtxfTON1Uss5nKDum2dALH2QpRLwfXklGg/1ixSP7vLYHRty4/b2fZV3mOVQ8m1HziOPe13Oo2UCWgEdwJTO9FTYcQuH3L31xKUsT4P9isx2VROyNYXRbb9gDJQVbJfQWwLV0DsHAvxKBUJfXi8Pwh5zZ1EPXqbWt10et/U5rzSQwY6aFOsM/lF3pxKc9Ceha7XTQSj6WeeSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiFnTttsVQDKFyE8ppl5xIUb9YzZzMbp4IWDHIQ9EoY=;
 b=dj8snM+haLUxSmsSnGj29k3JhY9TmFCkfDfK3TmZuFQrJU8elE4+d8+o5HmUrY2FX9aig7d0mNC74MG0ojc8pgfilXvQ9Q5UOUV0GLRGdD25XXJaLuU3zMkiLar+saAM1o70cV8Ykkn9/SedwE3pzLMPD4cl0nX9h3w3xcLeIWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AS8PR04MB8818.eurprd04.prod.outlook.com (2603:10a6:20b:42d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 20:04:12 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::b077:9a2:546c:d6e6]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::b077:9a2:546c:d6e6%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 20:04:12 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org,
	otavio.salvador@ossystems.com.br
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] linux-firmware: add firmware files for NXP BT chipsets
Date: Thu, 24 Aug 2023 15:03:48 -0500
Message-ID: <20230824200348.382164-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AS8PR04MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 815e1f63-462f-4af8-8cba-08dba4dd48eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gFPZWLx2CZCQYHGOQaqZt8Pl8nscgFQyAD2vNgyNvEjK3nQSkZnx+FA7MpoeWc4WqSNhKRb/aGPWbS8zvmYZlMN2x0HXY3elyAvB//sTSa6a/qvtfwCDIYORUGsvYqatLO1r0Wsbc3mjTkH4o9+pN+xPQZBcUteH8NU+2x2MiSaMRr6l2a6HqM01xaxsZ+4p5UQ9vAH7OE4dM2GgYwBzPdjR3hZrXIZ/mGXaBtYdYqKpQJASUiLes1Oaom4NTuOJFKAMMWCxZducdDE5Oprh6dPz7LI2djJ/4lo2uRd56h+wHz0uUzlPCa6x4kXMvEllzuNUYrff/eIlpBSq9RyW2VlUPowNTpZZrNYUrL4KOagTsWSIw324TbhYn9f3UOkQ8kw1ffIF1klBGT9s7n/kwk0dtjNuKtAow3ccxcu6+LZWEa+a2A/u4q7YCR+30A/0HRLvhfluMccjMEsZDuVDuvybAWIiWonsBSTfdAqyK7FHn8sN53GQ9AD927VB6DCJyVm2m0Lm/w22GEACVwuJHiU39c2c+i6//wPMpU3T/5Tsj7RG5XT9SOcNCBjl+dr3CXlZGAemot9pR4zIZW6+kvZz/YKakUDQIGsc12NjqGs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(346002)(366004)(136003)(186009)(1800799009)(451199024)(1076003)(2616005)(5660300002)(8676002)(8936002)(4326008)(36756003)(83380400001)(44832011)(26005)(38350700002)(38100700002)(6666004)(66556008)(66946007)(66476007)(316002)(478600001)(966005)(41300700001)(6506007)(6512007)(2906002)(86362001)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2dZvF85b2dwRrIBmz6/VyqX3HjT/y8ueleQWcKBjuvoZ7Xivhz+A6k5wDWBf?=
 =?us-ascii?Q?wYM0XHUAq3PXPde0KfKDmndUTU7DrLcc/3E+kbfAQumcDZvOpKx2xHvZ2KQo?=
 =?us-ascii?Q?l2FBQZJoRS9saKDX6dGbQSqdRtrYRnI+p60GsEeCpvqbaLO3Aybf528m9yBI?=
 =?us-ascii?Q?Dy/85aWagYH1q8rHTUYVueRrjOgPYyrkVV5IhDuzwxoYE74d3o+Wp+A5OVuV?=
 =?us-ascii?Q?vpslOLDV9Na3jADuD7VOIfnB9U2BkP/BeednuIFgIvas7tWBbhniyy+x82UA?=
 =?us-ascii?Q?4vHFw+g5gP5NzAD4m5eCebjtL92VRi7eCR9EX2enDWPHs1FEC9uNJgY69TUD?=
 =?us-ascii?Q?4T0cC3zKyhgIwSL4VUuwTXkg2bqN7X5x/xdOdKaR0iRUNuoRcOWhvnhDCxGk?=
 =?us-ascii?Q?e+7SU9S5oDR+BCkQPZKX0R2ONbF/czUbDkiNcrsauCRNdVpMu3FgOtpe94he?=
 =?us-ascii?Q?sNFh637jCrf5qkrTgOFn9gwxbqJSsN5/Kezu2hkfcJ/0XlomGGCqJyx7XjSg?=
 =?us-ascii?Q?GJL0zS4aKzQin/YQnNyy2agscRHnAUm+whbTbk/qocS9ihK3DL9Rjtv+nvMi?=
 =?us-ascii?Q?+JuHuyBuHKgHdy+DIVGGCUoD1YAPF95E/nHUQqa6HBGBWwGZydo6g4Gsqf6x?=
 =?us-ascii?Q?sOeTgNKyOVqElkLHW6CWKQV+8E4QRPLcKzDs9bfEf+mkp0dXZzTcy0pmDa4c?=
 =?us-ascii?Q?0gxPDIOluzlAxJEOVpTk8GRYvJfI+kDl8t3EIZzOlVQlpAr406RlIU+YpLCf?=
 =?us-ascii?Q?lUZmW8mCZ+ZM5nL1GJyVnw7SyO1QzUr22EJtuMuuf2ZmO/orsfQQXittA2jF?=
 =?us-ascii?Q?nNfdb5kNTmzLzuUG8KV3ZhdnByLYXKVhxzPY4YyU0OO6YEqRWTJOj5Fzi91v?=
 =?us-ascii?Q?P6R0qZU+90oUTPrQFSyraN0Mgx33uVI5hyHU0+X0theA/DZjTUrx2XP6iwg9?=
 =?us-ascii?Q?sV/NUzAX8tyK7Rjh/RdRYqOMat2GJbR/VN6WVb5mRk7qMEzWLOSzEVFzbpzz?=
 =?us-ascii?Q?KVmul9MG9Mb/0qI+5abTWvUN61WDevwuhc8qi3FDIOITlRSNbOQKopH67Z7p?=
 =?us-ascii?Q?gFr3I3kuAkgRyQIFFI4RWUx/M/gUFtn4a5vCVH3vgpuFFM7zqrwqX7kl+ZfJ?=
 =?us-ascii?Q?DjowAUrMOtboycit4O/Wyk1nJUM53pQmyNPwbq6vtyBrTd9dPlAfsuEm0Vxk?=
 =?us-ascii?Q?UChR/G6gaEQ95TI4iMuQ7HxkWjc3RkSZHmXe5/Sav/gTkZZU0u6zaxytOIFq?=
 =?us-ascii?Q?zmtZ3Cd6lBCKKNqbNrrEUBkWBwC+sEot6gjrOhXERywPhYzQra+BLwIhvOfa?=
 =?us-ascii?Q?5IlfgYewRbYVeKsAt15x7VX/x4/olJZON5gs8ijr0ASO7QD5CR2Y/OgIetwv?=
 =?us-ascii?Q?A2wu85kETxWm/h18Xc4l3geWsz6MwO1i4yFtcxVnHuw/gCNcb5A3ycA487D1?=
 =?us-ascii?Q?QjaoorPL4HAiEwIz49FCyvov5jNdL2nB0rqw3fCNboMDMNEUyVeH435o1zz5?=
 =?us-ascii?Q?xDegkupo7M3YxLl/SJSqgF1ue8Sbftg5gByMi+6ZgqX/PIiqkX9NAcqsGhlO?=
 =?us-ascii?Q?viHkE5TyMdTWxcXXdjBrNAnywd6HYIatCcDgeNpPIw3QRl3Ktw7EHUmT8Q7g?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815e1f63-462f-4af8-8cba-08dba4dd48eb
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 20:04:12.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLEu4Zke5neV4Ikhbxfw3uVBR7V0XkePD6ld2Epik27WWmUgPEeN3SDhEUwby0cP6/G3N96wjuHOkaIihLZEXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8818
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 20:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186671

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
 .../linux-firmware/linux-firmware_20230625.bb | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
index 6765226b9d..45556d419e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
@@ -40,6 +40,7 @@ LICENSE =3D "\
     & Firmware-myri10ge_firmware \
     & Firmware-netronome \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
@@ -105,6 +106,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5ee3=
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
@@ -174,6 +176,7 @@ NO_GENERIC_LICENSE[Firmware-moxa] =3D "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] =3D "LICENCE.myri10ge_firmw=
are"
 NO_GENERIC_LICENSE[Firmware-netronome] =3D "LICENCE.Netronome"
 NO_GENERIC_LICENSE[Firmware-nvidia] =3D "LICENCE.nvidia"
+NO_GENERIC_LICENSE[Firmware-nxp] =3D "LICENSE.nxp"
 NO_GENERIC_LICENSE[Firmware-OLPC] =3D "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] =3D "LICENCE.open-ath9k-htc-firmwar=
e"
 NO_GENERIC_LICENSE[Firmware-phanfw] =3D "LICENCE.phanfw"
@@ -309,6 +312,16 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
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
@@ -543,6 +556,42 @@ FILES:${PN}-netronome =3D " \
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
@@ -1125,6 +1174,7 @@ LICENSE:${PN} =3D "\
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
     & Firmware-nvidia \
+    & Firmware-nxp \
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
--=20
2.25.1


