Return-Path: <iskander.amara.it@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD277C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 14:19:12 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.130])
 by mx.groups.io with SMTP id smtpd.web11.19724.1713881950400552835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 07:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=ZT/D5jQR;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.130, mailfrom: iskander.amara@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi0hvnPBx5La6LS0mZQbgshuU6jjEHmbLHa7r8bXiuafRdC6YBZD8mdRfIIdgcpV+H3qlTqNxkJFV6P9oi5v03UR0djEIO6qGIowHUimQ/I5zLP4ynTUxLWHxh3FgsV0YPEqc8DiEulZKMHH632LRuCE7QCHuhbkulQ3Y2XQy6YtwSDsuWqidr4XHCV3MoWGQJJFmHSQ4Qua/vXXUaD6pjujSPCuH9TEMD/qES0O9fGF54YdWkkdEK56h6ebdTyaA+eBtaBy/KX3K6uIEt8ZJlhvy+rUlZOFkHytczMEERV0b8Rlu5PIep0J1AdS3WE3cvCLjao2XELeIihfOTXIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGgTNkV4PMWdoZXRs9D0WgZ/s98ZDjL4BFDVZJhMppY=;
 b=iW1M/gw3dvGzMimkOkUQfpotfdu7Y8GRMr/+4vEhGPSi1yhuT3uRB7XyMjhANLWch5sEpdX38PBDTzwiLCsy06/RXdNS/4B9hGdi7mmSOObNB2a9dbDOqov6LnBr98A8Yto5nm6vp7trXHz368DSaL8Red5IDYfrWaRIwQCg/Ku7iBb1VwK0rAR7OnXZ1EbCJzak1UjPuP/DLKbgjnOF7IkutIAgu5vo38VoD2A5og7Yn+z4YXtYwsOOr/+XVtp7Is7oQvF7eBqOZ9Njh6lxx9N2I9kL9aQ8gwSMyPqFtbJ8MD3gAHSG3eE1Ul+LKa3a0CA3G3cNtmeE5gl3aVJSTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGgTNkV4PMWdoZXRs9D0WgZ/s98ZDjL4BFDVZJhMppY=;
 b=ZT/D5jQRqDZlC8iwURMy7l37A1IroAFp1YY8/eJRfgvNT1c1CtiG76eO/w+iOJdZO+hae8ecCnJxPys4kWxWyPYWQBXgNvI5gXIZXCTsKb6xxgqH3mu6kIGf+57qLtalyO2Z1GGbQbdORqfHhOpLHkdzt84At9KIxt8qr8dIPVrHuaEG19DEqXxAqCt+EZbnog4zA7u63f3+CzONKVzbukf7Eeeq4DHR/Fdmrnmux5ZhKjN1myNNMXMWIuaThH/YyrWbJ+EjoMe2aa2KzRbi5gDPoraYb64qbLypirCIQH6ZL3M5+3We8ShVfAqkUOBcUITejoPKXZOfWo46/HAiVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from VI1PR04MB6013.eurprd04.prod.outlook.com (2603:10a6:803:cb::15)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 14:19:06 +0000
Received: from VI1PR04MB6013.eurprd04.prod.outlook.com
 ([fe80::26a:844c:af55:82ec]) by VI1PR04MB6013.eurprd04.prod.outlook.com
 ([fe80::26a:844c:af55:82ec%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 14:19:05 +0000
From: Iskander Amara <iskander.amara@theobroma-systems.com>
To: openembedded-core@lists.openembedded.org
CC: iskander.amara.it@gmail.com,
	Iskander Amara <iskander.amara@theobroma-systems.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH v2] linux-firmware: Move Intel AC 9260 bluetooth firmware to a separate package
Date: Tue, 23 Apr 2024 16:18:42 +0200
Message-ID: <20240423141842.172020-1-iskander.amara@theobroma-systems.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0077.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::18) To VI1PR04MB6013.eurprd04.prod.outlook.com
 (2603:10a6:803:cb::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB6013:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c344ae-aca0-45d7-8603-08dc63a0553d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WriZiF2EVNj3WPG+H6FTE0DSf39jnYZus/U7nJUN2fluEV6PwYOfUf1jgYNS?=
 =?us-ascii?Q?EiP0zYbc8K0YtYFK/D67Yv+n1+c7kR+cqC2PXE0rEtK4Jdph52O3aXI4kR95?=
 =?us-ascii?Q?R18uos3lCA7EQMuj/NoPy+o6wo7/BCl68SOEcaCPLXL1JHubTgngShOJYnND?=
 =?us-ascii?Q?pAl3GPQCtfZawX4mROPXoV2NJhF8SgN6onMYQvhBp1CqZqV/cK1oPD/P42kH?=
 =?us-ascii?Q?FoE0T2Y5NDWGxtLRnMArQHoDU7txZnaNBA0ZZVvT3h975JAnM6LhO1ruLPxr?=
 =?us-ascii?Q?zQ2XN01rjf76h51gBbZMVSFRrp9rYtkngkDnK0dBlvxbIDihV4cr1vbetxaM?=
 =?us-ascii?Q?9J1MzQ43xi+0sZhjf3dXyqrPyRuAfsohfoREaNOhUTwtFZwT3APvtcD9qhZi?=
 =?us-ascii?Q?LF8kuxXfO9mU+J5GSRsNbXHAZQeJWslypNhl6vgj0xzOb4x+jOKF4d57vQCN?=
 =?us-ascii?Q?SjDgLZb7SJnmFvvpPcfFyoewCZFDOlTw1EajseD/tUAGN7jTh8GCuqWxYfBy?=
 =?us-ascii?Q?YDSonsw43D7eyr1E/9NgoKIRA631MlE9RKsj3C61tyy7+N6OEC0GXEqWbx0t?=
 =?us-ascii?Q?dhf5oSq2tPhnJY0NuKbIezp78InZm2BZtYKoLL+TaCMOIShd3uU/xWNzJae9?=
 =?us-ascii?Q?quZ56Kx3afNgch+TS8JAQLa+BZNHbEWL+0ADOL0ysMMZjJuetnvgk+YZwg77?=
 =?us-ascii?Q?oIO+lrxgNuxsGD4EO4iodHfo8EWQ1wGVJ0AFq/1JV7JCoLpQYRzrRvfCF49s?=
 =?us-ascii?Q?aQjHTEUuUXWm9LJbc4aaJweiwDw+0uW2xm3xpqgUThu+KwX6Bl+xWQePnoKE?=
 =?us-ascii?Q?Ua4HdhlQdh1rAnMT+ay3z8oU0kCGRAluK3UdpZJUqL5tzinFvhDq/CbHiWTJ?=
 =?us-ascii?Q?T1ELkwqtp7zYJ6/mYq6oPxIlOeeTmTFITtAY/O/faBt0Bafq8siUBHi6f3T9?=
 =?us-ascii?Q?EffDHT42NXAeB/xYPqZggVLSykL2RjXHB9g0eEqq8ILNHFgu0PodnIm+tlhp?=
 =?us-ascii?Q?uOXAjCe++tKa/dYooEdfp7hTdofyZ7l+iEVSENPFUTv2pI6SViIVe5fVZ4fN?=
 =?us-ascii?Q?wsLlBzELgjN9NKEaPbtwBR1IXgSFx3m3zFQqQHINZiPl/tDch3h80YCHGe7y?=
 =?us-ascii?Q?A0cdt1gsBbHE35PbMcUwwVbfbku5122alyX2C1aKOoPmHC6cZVydtkejWt5A?=
 =?us-ascii?Q?AAnqQkAXpCbTQqvJPOTuKofCwo8KRW8or5dWumsuW1ZJ9k+dEGo2fT5vbrOy?=
 =?us-ascii?Q?krmFjLtrlfYDyxj3cRxpjUd96xJc5UOt9ngfZS9s2nGQCEz++Jm0RUIKSA3K?=
 =?us-ascii?Q?cXTrjK7wiJJT8WHAM3XEQ1MuDlzSzXY7BEr7XPbprHTBwQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB6013.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h6sOnzG+hK+GWJG9ROhqrxttpAASjktCXeYJOcS47AJHUy0OWy5yOkkm3JVb?=
 =?us-ascii?Q?ZAVym7iY2QFRL266pP+pEhF80xBBaX6nMNxt7K2g/mzVC7OFJ3uLRMFYEKWd?=
 =?us-ascii?Q?+Zoz8svGRs+btXzcACr02O9Ug+kGRqmH9C4HdpyLfR8sKQUHZJ8G1ZKfb9sA?=
 =?us-ascii?Q?F1Nqz8PWtdB8OzmSaWba06PNKseIdEY7AOYKYxvPr8DfmBmmUnpcNmrShe61?=
 =?us-ascii?Q?ESd5y27ym5TX+ydgcEWOY0NMjRzJxsESlkPGhDXTip6RqC47JnpIZ/36bCBL?=
 =?us-ascii?Q?OxRNV0o7UJgJ04MxahidlogU0A+j/HLXBLCecs4F4eXxeNwTaaQ+757Y7POb?=
 =?us-ascii?Q?a/DHmF5tRYjtaX5o4BhRC3sMd64SIJ6lecsFi0IEUAxINwyXX4+9V9xz1PwT?=
 =?us-ascii?Q?glsg1oXrP3Vmk89yUZngDrD3Q9LnFY1MXoNkQb2aIuEUtJQrydSA4IYmtcIu?=
 =?us-ascii?Q?qSwobfy1+biQlF9R9m61wmeoH5D+ZLAwoX4G38lfeEfdoNhJFek9DXzydDO0?=
 =?us-ascii?Q?DIp2/mj2rZ7Y+zBn0bdReXENt4nlSahf2wjAX4D/Bf5vwmk5uc4Cvr+TKeOs?=
 =?us-ascii?Q?JcUsCHjpH/1zmFtUXnb31sNeViouEeesIJHuv0I11ww8yfBq2ZibvDBIjWw6?=
 =?us-ascii?Q?tF7Hgt6GtgUYUHOLhL3SEaw97GsghXQm1MpTINgudN30nCgYmSkSQTQFRpL1?=
 =?us-ascii?Q?xVFg3JBrX0NWdPUChXZfMKg357M9Q2BlkBPR+USbS9CWuukv7M4I6pPPqkFa?=
 =?us-ascii?Q?D9+HypSZ9FYaeSaFVVShOPrJhKZu1CqsL8sbTJdOVMJTiIsMGmbf/zyeTHPx?=
 =?us-ascii?Q?6KXFmj7dWZNnHZvSTf81Zho3xl4lRx8vPq311d7r/niHPpD8zPRPhsR90AZT?=
 =?us-ascii?Q?esjLlICFzAy+j040LZsmeC9ysPRDrdaI2wV/c1DJ30aB9nb6qgZjbc2mtq2J?=
 =?us-ascii?Q?MhLXIbeAVjb+CkB/7rA8xuE1u28k5vtkgLsh1Ni11hfmPOGV9C+uRxE16k7q?=
 =?us-ascii?Q?lSCkJ4kVlgBqCKqUFvtzMGvHgz2ALwXM8zMIDL43XCbFetBCC1S10qtpbrWd?=
 =?us-ascii?Q?+NoU0BzH88eyN87qM2ovccsq9pB8HdQkx2GHhprI8n945XV/P5ci+bZ6FnQC?=
 =?us-ascii?Q?LeAQx5UjWMei3HpJPs1GXQV4rK30hONLN9K8HxXcbd/kMMNd8wrhssnIOlRU?=
 =?us-ascii?Q?2mFZQjitj9ECyYz4npZ0QzZOc/f3ymHLPPOsMVg1a1bmLXeZ+gFu9qoZpnVq?=
 =?us-ascii?Q?Rc49BDXugrIr0i1bIHGs/6NjmW9HoL9JhFhhlDrjzmmOM56LyUJQhYjOk77I?=
 =?us-ascii?Q?dSULs8Z8ji0YW4sd0RH5ZIFlEj3UAM8wJ3RgpvBzicYTJ3ChMX2NfojIHoTj?=
 =?us-ascii?Q?GE4brKaz7rHI5b3gIACtKJH859aBd+Fknx1Qe0mAPcO7B/UmGfiqPjxRJwLQ?=
 =?us-ascii?Q?P7RXorDVsRQgSZ1TF9gJYJlYaILJc3+NSZwjUwuiXnpevs4pig8/HSeDrA/P?=
 =?us-ascii?Q?9vIi1dLsKQjJvmL9FTr4/VZVI3Xc1EQTcsnGnKNk8n3GDjLLKHpMx+oGJnCR?=
 =?us-ascii?Q?q2fRcTWPagHUvcnP5hEi0Ob4PZ5nUHEqVytQbfn0KrXAMvOCXmelA+aQtiVm?=
 =?us-ascii?Q?sTBWEBtJ9+Sa39lpJcp/BHM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c344ae-aca0-45d7-8603-08dc63a0553d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB6013.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 14:19:05.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcbJrx5Qy4R5Nh0FQKLwNKn+zAsysR/ekbIDDffA5kr4rOu0Gel/5DCmOV6M1mciu6vaeJgRpZOK2EEgQpeLD/saTfW4hNATdF/s8MhNCQ+/MUEFzlWk+G6V9Vobq5yb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 14:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198626

In order to use Bluetooth on Intel AC 9260, we need to select
linux-firmware-ibt-misc package that brings a lot of fimw-
ares that are, in most cases, irrelevant for the used hardware.

This adds a new package linux-firmware-ibt-18 that only includes
the corresponding firmware for Intel AC 9260 bluetooth chips.

Below, the link to the commit that adds Intel AC 9260 firmwares in linux-
firmware:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/?h=3D20220610&id=3D97339b3a1d3bf3e4c40d679896a27a25fa83765f

Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Iskander Amara <iskander.amara@theobroma-systems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
index ff79bb9b33..5042d20902 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
@@ -343,6 +343,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphion-=
vpu \
              ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw=
-37-8 \
              ${PN}-ibt-17 \
+             ${PN}-ibt-18 \
              ${PN}-ibt-20 \
              ${PN}-ibt-misc \
              ${PN}-i915-license ${PN}-i915 \
@@ -1272,6 +1273,7 @@ LICENSE:${PN}-ibt-hw-37-8 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-11-5    =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-12-16   =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-17 =3D "Firmware-ibt_firmware"
+LICENSE:${PN}-ibt-18    =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-20 =3D "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-misc    =3D "Firmware-ibt_firmware"
=20
@@ -1281,6 +1283,7 @@ FILES:${PN}-ibt-hw-37-8 =3D "${nonarch_base_libdir}/f=
irmware/intel/ibt-hw-37.8*.bs
 FILES:${PN}-ibt-11-5    =3D "${nonarch_base_libdir}/firmware/intel/ibt-11-=
5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
 FILES:${PN}-ibt-12-16   =3D "${nonarch_base_libdir}/firmware/intel/ibt-12-=
16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
 FILES:${PN}-ibt-17 =3D "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi=
 ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
+FILES:${PN}-ibt-18      =3D "${nonarch_base_libdir}/firmware/intel/ibt-18-=
*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
 FILES:${PN}-ibt-20 =3D "${nonarch_base_libdir}/firmware/intel/ibt-20-*.sfi=
 ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc"
 FILES:${PN}-ibt-misc    =3D "${nonarch_base_libdir}/firmware/intel/ibt-*"
=20
@@ -1289,6 +1292,7 @@ RDEPENDS:${PN}-ibt-hw-37.8 =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-11-5    =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-12-16   =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-17 =3D "${PN}-ibt-license"
+RDEPENDS:${PN}-ibt-18      =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-20 =3D "${PN}-ibt-license"
 RDEPENDS:${PN}-ibt-misc    =3D "${PN}-ibt-license"
=20
--=20
2.34.1


