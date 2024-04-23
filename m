Return-Path: <iskander.amara.it@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249EBC10F15
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 12:03:32 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.117])
 by mx.groups.io with SMTP id smtpd.web11.16570.1713873805651441705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 05:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=ASbLxpms;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.241.117, mailfrom: iskander.amara@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiOdiNsdyuJbc5zqZyzDHmI3HAJICI2/61Rtz2NDsnkdYl0qWHbufn/BHHIjDH1hqPkiMmmmHUyy4tjLU68Bc1ID5lLitGULUY/HVRenGSOJiBhulA6PLBWvkd2aup5uZXUJQsfhuB531YGVzzD7eeDfs1Sqw9lOuUa9f2Tp7Tw6atm2ULlOuwsjv5v5ybnXcQN3SZ6OteBz84dLXcibrVAZE+VUt+lVdijf9aZhqkBvdAhQOFMuLOxCZiPZZ1+A5FQp7uSmxTrqmFf+gRjmEBvYr8fgohmZrc+CgW1F1vX4AhKdAQ8Bqb48kPiw/4Xdd+UQL2ST+Bz3b0vKTyH2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3FbjhmQ3MbI+CbhGQ/OCCagclZn/P8+HCeozx51D9s=;
 b=AHec2LzH+UUN6f8tvYVk4SCCZOPeZzMlEXhFl8l3/yfxgNPYT/bLvZ7XtKjUnJOSmDFLXRcndElNOISc2jYdQaYvOYM1bODoQSSKo7xBc+0Uy4beKQyhxP/rxyN7XNBh623Sm33oq8sZUsHdfn6MybrpO8LtlKw2GGO7bdc8nH0jkGDjc2nbgFmUiaRJQniqC6Qr8CEiGfDr4KIz7xbmn5EursQX/Rmt4nVwWXhfZmf+uyPw/5SeS4vFIgGeQARJ5HxVUu+n63ZRhIjQkxT2Lzvc/upLYIMpiGizvPz5hI+6yQUYd04/TQqG9trukBpebZdz62lpl49mQ2UAKADcqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3FbjhmQ3MbI+CbhGQ/OCCagclZn/P8+HCeozx51D9s=;
 b=ASbLxpmshTslY53e1e9TsGQGiyT5BelS4G42SL9bWQ7FWhUHZ+95sJuclqbQTVZ8nSXlLwkj4WfAM5KOjY7tiRQqa5sApQAnJ3yuhDiH/Hrl9NSLto1zHRemQctYOqvbKb5P7KhWZiEjj+YUiXK4FvuC85KYmcr2JAY9dyuAIXOoo57MXZsCBf0doZQT8DLXABc+JJsZDSMw8RJuMt8PQMBgUKKunnlE98lMHdUFxiOP5Utm/BIav6ogwWkZdtIFWEFJh0i1/ekdJQKIzW8TBRlovmKtscXj5ujs19A0TTOanM9S4sQ4GxxutbLn4b9v3wuPMMtJB+OhtXBWxPz5+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VI1PR04MB6013.eurprd04.prod.outlook.com (2603:10a6:803:cb::15)
 by VI0PR04MB10372.eurprd04.prod.outlook.com (2603:10a6:800:233::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 12:03:20 +0000
Received: from VI1PR04MB6013.eurprd04.prod.outlook.com
 ([fe80::26a:844c:af55:82ec]) by VI1PR04MB6013.eurprd04.prod.outlook.com
 ([fe80::26a:844c:af55:82ec%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 12:03:20 +0000
From: Iskander Amara <iskander.amara@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: Iskander Amara <iskander.amara@theobroma-systems.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] linux-firmware: Move 9260 bluetooth firmware to a separate package
Date: Tue, 23 Apr 2024 14:02:49 +0200
Message-ID: <20240423120249.158876-1-iskander.amara@theobroma-systems.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: VI1PR04CA0137.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::35) To VI1PR04MB6013.eurprd04.prod.outlook.com
 (2603:10a6:803:cb::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6013:EE_|VI0PR04MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fa083b-9bdf-427f-b0b0-08dc638d5e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x43lXh7GpALWPlvURMmow1zYUN7EcNEgjlXdM9RWyGGBSaC824ECXHaGF9JN?=
 =?us-ascii?Q?F7XrmN1iKWPooFbfOfREH9JoFwsO8rcZuI9eNaUZmGAUCf9U4Bjl5tFX7T6B?=
 =?us-ascii?Q?spiJAzBxpOaV7Sbv/3XSNc328OnbX0ykZtLCDrBXrZmNiK/fi7orsqLfsA1o?=
 =?us-ascii?Q?V1i9MOU2+TwTABlVeZVWziSrDFhzOt2aYD785aLAq5FhbvSS8XcfhXWopCeg?=
 =?us-ascii?Q?5CGS+4Ag8y6hKiqFVhJvXeX/foNUWOsbGoSz57cGBOXPB8K/S3D4LK0EP6M2?=
 =?us-ascii?Q?lPX2YzdbvpVVb+xrcEHiq2e2FSYFaEx5DtMJRsVKGyEY8WXMndSCuOh3WObF?=
 =?us-ascii?Q?1fi49xzAYTTe66yIMVeQ61gd9r8Go6poneTPsDnQEnITS0rBowLft18IOmO5?=
 =?us-ascii?Q?+I9SXQGyFDu2a+XM8ECNCUerYjwOjP6MCGIuSTDArGZ5WTe9JNx799JSnnbZ?=
 =?us-ascii?Q?aLYC7zZh2SFlj8Jysxlf/c5CmH3AlkrW/CKrPn3hDhxCCsHDQnrdVNCtIqU8?=
 =?us-ascii?Q?15JCO5x/W/cHFf5Rife+ATZIwDzJ0py7OFEX4g5/jAzKXPuKQ1Hua3a8GDU8?=
 =?us-ascii?Q?GD7jtqTFtAu3Z2R32lzLn+x4Mqbyv2fqKeS9GeVoXJDkUFOZXP8KxBIcrYkv?=
 =?us-ascii?Q?9HpoJeWUhFHDlWjxeK6g0O9jGJKDDrwvHccgz26907fEdB01DZ+hMkmRQcQZ?=
 =?us-ascii?Q?ThhHD6OoUkqezlDFO1jVDUxt9IIYFCXst72fN7G3U01VaeeK43bczzYL8bG3?=
 =?us-ascii?Q?R7a0uzfpsUm4AfFC+21sgCTKLlXCS8QefNZhA4i/AHnx7u6Z6cwC1+ei5BVQ?=
 =?us-ascii?Q?2F/JxZT0w5WXEUEOSIIeRso0bNg4A3Bem1HGntPntfoYWEAdto918tj/nrlF?=
 =?us-ascii?Q?tSY1MfUdYRcNjuBDmqq7PWBxz01SUCvCJgzjQiZvd/LkXYuJHHtYoTbj2SIw?=
 =?us-ascii?Q?3srrXUNSxkEqStHkaMP2KYJck7ClmP9kgGTRZyXywUfXM3UL+SJ6PmksuJ9s?=
 =?us-ascii?Q?kJG8AeHAOMJNqt0jtzqTliuFrVbiaz8PF+Udi2X7BFBvq1FoJB2HF0NKZh4W?=
 =?us-ascii?Q?QjjBCm5nUQBp4XVv8UgP5iVNyGjsKIE5LTQi/AaCZG6mgEC67xN/xUbzZob7?=
 =?us-ascii?Q?nrSnqyWzaPfFwo2FqRiQSsm4T0REIRJs+rbKt7rhmc6kRQ0NlQBJheGUz574?=
 =?us-ascii?Q?OwKUZyGxgz3cyvksc1UYjacRGqsKOfmeM9N7hP69IBWZRMYsjchBLjW6tLs5?=
 =?us-ascii?Q?KdBq5VZsubCYkGLr5pJsANmzMtT1YYe5zkxEQyInFroeYveEFXvQw3vwPfAD?=
 =?us-ascii?Q?2gzBDl1EcmrB/qk68ZVWUuE6fdrHbaal5wm1z//pVXUNAQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6013.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(366007)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FJsAepdgrsgDgsG7KZP3xp59sOZM7qr0/ssTg3yceWDYh/7I7y/osMJbMKdy?=
 =?us-ascii?Q?b3oX296sDJTPnAEvXLGD2oUFK21xs0uanM6Y/YO/9Wce4WPIDWtk9RUcAzSR?=
 =?us-ascii?Q?k0LQH+ywmB+PktM/9vUMZ5Bw6XpXMF6V8RiefAm5Kdswx8yds3c4aZ2r/l6t?=
 =?us-ascii?Q?tnykqKLAZDhuQEh2yoGRMti0BXHT8bGG39ftsgkNHugG3cZ5sZEuSIarTyrz?=
 =?us-ascii?Q?oZ/6DJN6Oa0YCIqecFieT6GWMVQhfuDAI56Hsdb16nwRvSKWAX1WvEcV/ZrD?=
 =?us-ascii?Q?k+ncwoWWnrwzw7cGjSdD8AtU6KQjmNW4V46bbTYo5u5kgXmmw1sutr5ue7R3?=
 =?us-ascii?Q?jT0l0Rg+5GNFMVUy037Rjeo4P67lRJzUCmm58PSGTvBqWb2ICGFC6z7JiEg7?=
 =?us-ascii?Q?YLZlsreElqE37eaQc34nq06I4L02sNSYQRKtcEQvC8RNH9Qf5N6PRhaovcq5?=
 =?us-ascii?Q?2JbxEXyBBngHVDaKyJbOdorAFP8U81wWHI3EH80t32ufwoFW3R2qPsVJbpN6?=
 =?us-ascii?Q?NKtY8+Y1p8WjOSK2XGxt+qjuZuvP/8qyIcwK4iCisYRskQYmPLr1qtOFW1SW?=
 =?us-ascii?Q?ply2LrleOfwErYrc02CAzopADIuyR38EgiJrL2jMWM6ZN7S9ZmyHj70uEKxn?=
 =?us-ascii?Q?k4nXrtw9pqNiSxIcc0AxbYVrpxxOrZu+iS9F6/8C4510o3ifpurdMlW30JhP?=
 =?us-ascii?Q?KgzGPjnrsv1JszYtTnZd+Miiy6GpiTKHT+caj4E6/Iwthr8OZVDLls9W1Z85?=
 =?us-ascii?Q?p2KLVYYMptHgqYSg/Zmn90W9Pq+exv8b4cLfsSlNWIMq7bOI6G9bzw/QTRbX?=
 =?us-ascii?Q?F4sbhbNzhUtdedeUPfxASbzvHDfvsDvMbGW9I8zkXoDBQz9C6rzByNZi2V+V?=
 =?us-ascii?Q?uQnP+LSlfSb+6IfOO3jH/hcbe3k+5GGeAbL/3VtGdhM/6r0TtL++mmayuuay?=
 =?us-ascii?Q?UBGhBfN3stLO0J4hBLdl35mWirfTCs4WHG5LlcYyqyJ6cNmlZFhT9CJKd3yE?=
 =?us-ascii?Q?ns+WwlJO1hxn2qgyvr6FvTFB2+jFYeYilY4QfRGWdlaYiIlhlxBliHk1LNfM?=
 =?us-ascii?Q?2Ip1FI+8s+HK5A+uUM7X74AiNGXGbEvTRnXmtkfLUHxHcxyvwJa+JpL5hbq9?=
 =?us-ascii?Q?1F2Nz9TxQPb3u6y+BsqqXKjJ58QzQr55Igy6vGVN6DFMmmGM3jsc3j+5yoRJ?=
 =?us-ascii?Q?HjoNQrLu0laEpso4A9zDLDr5u5G6uACM5o92anOIC9V5N4U5DEDOdQqmFgTi?=
 =?us-ascii?Q?rVdwkRMw3KpUbOK7SVOqJf64NcMWgtK3buiD9GspoVQGi4IVgH+CBS4tq4Oh?=
 =?us-ascii?Q?La2TT99q96P1mVbUdDJtqbMX3S/PnW5vcz+mGvNrpQui6kqXwy1cxGt63+os?=
 =?us-ascii?Q?pHYVBHtHDwt+U7QaQ0w7T6eSVUNe9Gj/ww7nCUicTIZDxqiOfCirWDp931BA?=
 =?us-ascii?Q?O69ZsAc5mBNHnyu/oNjNYBd0bHgI/uXA6jOHHUnCSKoVM7obwI3YkKB5Nc7B?=
 =?us-ascii?Q?f9PZ3C1vGOPPRXFMOTRIOu0XXcXkYs72aS5Um/4OsYoiG7D24+3dwZsq3ZiL?=
 =?us-ascii?Q?2gDI8p1Bv1lF8VlpGuap+COvfKpVSdVwGu0qQqHRYn5DBPUsZSEocdSEaa1A?=
 =?us-ascii?Q?zAGlitnK0IfZtwWDprf4QVs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fa083b-9bdf-427f-b0b0-08dc638d5e47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6013.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 12:03:20.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tZGyytd1mDmYQEnZV8gjVmApJPzNTXmrNGMnHI9/vWScUg0XryY+4GrDdU1hJmPRbxYMNkxa0japFohTCxL0hcJXRWgVxN9DaYLRBxIdLnnFMkm1PRvY4PZGG+GBkH8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10372
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 12:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198620

In order to use the Intel bluetooth 9260 firmware, we need to
select linux-firmware-ibt-misc package that brings a lot of fi-
mwares that are, in most cases, irrelevant for the used hardware.

This adds a new package linux-firmware-ibt-9260 that only inclu-
des Intel 9260 bluetooth chip's firmware.

Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Iskander Amara <iskander.amara@theobroma-systems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index ff79bb9b33..dfa387ec11 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
@@ -344,6 +344,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-=
vpu \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw=
-37-8 \
              ${PN}-ibt-17 \
              ${PN}-ibt-20 \
+             ${PN}-ibt-9260 \
              ${PN}-ibt-misc \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-ice-license ${PN}-ice \
@@ -1273,6 +1274,7 @@ LICENSE:${PN}-ibt-11-5    =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-12-16   =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-17 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-20 =3D "Firmware-ibt_firmware"
+LICENSE:${PN}-ibt-9260    =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-misc    =3D "Firmware-ibt_firmware"
=20
 FILES:${PN}-ibt-license =3D "${nonarch_base_libdir}/firmware/LICENCE.ibt_f=
irmware"
@@ -1282,6 +1284,7 @@ FILES:${PN}-ibt-11-5    =3D "${nonarch_base_libdir}/f=
irmware/intel/ibt-11-5.sfi ${
 FILES:${PN}-ibt-12-16   =3D "${nonarch_base_libdir}/firmware/intel/ibt-12-=
16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
 FILES:${PN}-ibt-17 =3D "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi=
 ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
 FILES:${PN}-ibt-20 =3D "${nonarch_base_libdir}/firmware/intel/ibt-20-*.sfi=
 ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc"
+FILES:${PN}-ibt-9260    =3D "${nonarch_base_libdir}/firmware/intel/ibt-18-=
*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
 FILES:${PN}-ibt-misc    =3D "${nonarch_base_libdir}/firmware/intel/ibt-*"
=20
 RDEPENDS:${PN}-ibt-hw-37-7 =3D "${PN}-ibt-license"
@@ -1290,6 +1293,7 @@ RDEPENDS:${PN}-ibt-11-5    =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-12-16   =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-17 =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-20 =3D "${PN}-ibt-license"
+RDEPENDS:${PN}-ibt-9260    =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-misc    =3D "${PN}-ibt-license"
=20
 ALLOW_EMPTY:${PN}-ibt=3D "1"
--=20
2.34.1


