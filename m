Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0DEC433F5
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 16:01:22 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.45])
 by mx.groups.io with SMTP id smtpd.web12.32557.1636300880577636477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 08:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com
 header.s=selector2 header.b=ReYyKoFk;
 spf=pass (domain: nxp.com, ip: 40.107.2.45, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgufC+irm7HSAM/OD3EM8TXftraIwljkYMCDNlZ3DNV4lteOCDfxyPEkSWNAA/oX9aqTa8rnnRxZX2QezXHEC4CAfprJwlaaZVCRG+QPmB0JvdKyNAKlOjhZn/HRLch+GXQ5JBBbYfmLk3rH6KnAfzC6jOcfpqjDC2fKYSyv9yFFXBtAXCrpz9fz9r/TFUj2dPbseneTtf0p3ZJE7pbW99sNEzTZuYkG6trPc8Dgmpspa/XL/Q2y1Z2g55e6EFD30pV0QjD3BZIQiZj6lbyfdtdX6hiWZfY4WT08D/xduWaO2HNt67mvpoxYKvsIkrvIawkniGOdjBe1AA81uOa3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHW/1EsqOSFBo/pG3tRG2TvzReUJsmE1iQgwKdJzErk=;
 b=jZ2SwmJQNjdXL2NUe/cRE8EsyUcgLukT/my2ExK6I0ZosMAbOf9nuWUTj1Q8/VRthZpdCvwVx7wbdH8ZhINKF5t/Lkykqdb+HGe22BIaQEeDk0ArhLj61dwHU3XXU3g5FdLVrsVOChojmBJXjvMeblyRsHQMpT4c/D++4pZldrlwHdeEBPgC5liVM0Pt/8mhjUVZjko61nf7d1OMRpzDLf8/E1cfDOU4B9VqC89AtCAsiEIj4ypjM7YcWyLguTq/4+WJ2WJkz9ikrSy4/ZwKX5h0Jq0bF/EDxEgoDuM6shjRYj2Y/SICt7M+bE0XJUjGcJ2gTcYWmhX3852+tbcfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHW/1EsqOSFBo/pG3tRG2TvzReUJsmE1iQgwKdJzErk=;
 b=ReYyKoFkTpzhEFC3bsHe88wxUfvN8As/TWvM2kukg0nGEdB9XJR7xE65EkIQbwW1+fAJR5iVe2Luia4TN8h80VikbkJgnkydLj5UpBV1nvubtjh5/PfvVEfFl5FXJT7ownNJ59ez2o5FYH5oityGmqhP4Bfi739UZkdj0w2uvLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5)
 by DB7PR04MB5259.eurprd04.prod.outlook.com (2603:10a6:10:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Sun, 7 Nov
 2021 16:01:17 +0000
Received: from DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a]) by DBBPR04MB7753.eurprd04.prod.outlook.com
 ([fe80::25a8:33dc:5634:180a%3]) with mapi id 15.20.4669.015; Sun, 7 Nov 2021
 16:01:17 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH 1/3] wayland: Fix wayland-tools packaging problems
Date: Sun,  7 Nov 2021 10:00:04 -0600
Message-ID: <20211107160006.25440-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To DBBPR04MB7753.eurprd04.prod.outlook.com
 (2603:10a6:10:1e1::5)
MIME-Version: 1.0
Received: from lsv07069.swis.us-cdc01.nxp.com (192.88.158.246) by
 BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Sun, 7 Nov 2021 16:01:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96b0fce9-1f4b-4709-187a-08d9a207d52c
X-MS-TrafficTypeDiagnostic: DB7PR04MB5259:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB5259EDC742620326219B54AAE2909@DB7PR04MB5259.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Jv9faZIjWxLW3otoMhHaUv+TYB5izljj38agCHZkKxfzXWpCo5MNGzAseuSzRyCoMbaGM/8daoFENvHbn+h5oJ7iGnyDo29J4abyMKLjLkCw9CdRBl6BYIVnblx3MIt88BzQBeOUw1+5G6TiCIC1+A2votXT63guaf3xHTeqXDEN9p/yTwK7jlntq2FVRIJiDNKtLYz6hpq35naluSBALnWkKYjyoMKHTlfg5JxBgwj4ftXsKxPwNW/sEBqdPTCkqp9GLly3hI0b+AGQOFMHeDRiZ3a6wQqkW36k4vKtDNy7hPCPgL+Ki9FTtxXaoMbm2YxgruayMP+zhz0rZb+YaGGYSMRGVrDXK4Xz9hHJB+ekwO/t+Ffocrq4T6hPWLOhsbUC+zacR2sHOUqwdeBi/xrw0kdAJ+HpXVbG3qMAAi1ODnMw/rIpHnmoJmrVvZ4rYjsW6jhK0wvGT/aNadF10pyLHkqL/EyZMIvI1sbMNHqgFUkX2Ma6qxZbsHEskxoHiDDcpvR96SKeRFzbH+3295YobO8r9ceOOpjnPAslDyWGAVY0S8j1m0U7vd9SPDWkvJtGSQOdAr9O7IiUjUftkXBDiBarJTXn1jnbUHHFGWMrdngdoSbhbS59myHuw07JW7yAMWGKgcw7j5ysKslvi57vFna+8yS701c0bVY9Z2YnWFMB4lToO9iscC4C3dgNRSGhQYT/aZrtvNsMKL0Mw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7753.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(5660300002)(38100700002)(6916009)(38350700002)(52116002)(7696005)(508600001)(1076003)(66946007)(6666004)(8676002)(66556008)(6486002)(66476007)(8936002)(2616005)(2906002)(26005)(44832011)(186003)(316002)(4326008)(36756003)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PBJkzAU5ahIbSLXH0WNILBMBwpSlsBtybENJBPXPLrR1X6s2Cs8s3DoSRHdY?=
 =?us-ascii?Q?5N/7pdXotAQMervGDNEspWVTgq25FzfBbF3fGLeXp16X/TgiYcTOTiuf9aid?=
 =?us-ascii?Q?scddbAkZ2t11mvi4kYXApLig9HYR5jNNp16Qe4vcbTP78XcLLuEyMVrdjQZQ?=
 =?us-ascii?Q?TEuePe4Iy7SHW9bvBM/bjht5W060Z348bH7XqwFF86zJHjDB74GRhLeOgemQ?=
 =?us-ascii?Q?VKYsKaGV0eU+UWkGNhg6VHD4SnN9Hvn7EeRwVtV29ArmxpXnAXM1aJT0gkqE?=
 =?us-ascii?Q?6tUfym5nWrOiaKn91+q+pVoj1e8Xn6HgmyBtEDYGnrZVKxDCjxbbyBXEfC8U?=
 =?us-ascii?Q?ZC6SXcpOXEEDbQ0GHuVUvi7z8pFcT93nk/aysQ0B2g7VEdjTcHMhinQchLAD?=
 =?us-ascii?Q?vm6jN7wtIhZqRTX+U8GkZIiAqB3T1oi4ChYRP8yNeJVcUVErNJ3DN9VUmJgR?=
 =?us-ascii?Q?ctTzD7hJSAqpxluvf64m9993nb9wreBMmjMZC7DYf2W3FI6J1Yyhj/3ZDaLF?=
 =?us-ascii?Q?jKvLdGbCQrf2hbzVPdammhJeBXHub/U/LqhPp9vpeIPkUn0t3ZMxbjbCfFjS?=
 =?us-ascii?Q?edIdvAE4Mg2mggKaIk1cyORp8VSbke6BQSwVXuABdWcT4UbzjOn1qw6x3tMY?=
 =?us-ascii?Q?Yy9yM+H2lSIfaApGp40/WSGKHNHBJwnzfFGqy23NNbDAEw5uZVMPK4cWC6sK?=
 =?us-ascii?Q?ICLbA6zizn2QXqcx6Ak+nSc1LBK0BrqIE4f96kWjo/3a5U92mnuZXsdbK3Gm?=
 =?us-ascii?Q?IIcSr/kg1fXoKfk+t1fnCuoSvMJU2XF9vSMfCY0q3cFU9c4cBzSvsmQOJlQo?=
 =?us-ascii?Q?/Ozy84if7aeGhWqPXmZRS/UpEyDPmYirlWO5Do7eylvWBhqllC43X84D5DEb?=
 =?us-ascii?Q?wHKYlGnASAuaC59H3KmG6fIY4ZxOT5AlDwkqGGEtCZe4X9rp5tSBhaxQz6nX?=
 =?us-ascii?Q?/2Gzbc2fp+mT4WpF7hejDXqBduMEpr8bb6mzOtgzSBDRKXgW2IVVPyT5sSyY?=
 =?us-ascii?Q?BhoTz9+DunxpXmGRlQuylSZheLaGYcrHCSiY5rETbGvm0KggWzmasFaW2t7E?=
 =?us-ascii?Q?YEZ1EavrFLrXN5LlxYvGDFxuowaXz4HmIZpLOfPq12YjpHKziIC62OyKU7AJ?=
 =?us-ascii?Q?ZaQBfk2lj13MiLhAZpjjF1oW9LRjcBp8h/ApSKi32B0KYuMjAo3oIOm+318I?=
 =?us-ascii?Q?VjusaGWFKs0VgGw9cyeif4OiDOlHEcjdmSzhi3lV7UqOFczGPSqSRWb4mEym?=
 =?us-ascii?Q?D4xzZkc9nIFxebNDUs+FWpCP0JbxjEVrZ9pwSOyuWlyNrMh0htpCvWmXRWyl?=
 =?us-ascii?Q?q20DgcSeQMpptVbP0M6uLErISGSLH8HHpX7U8VK2nwkTBgEcQCbO4JnubQHX?=
 =?us-ascii?Q?M1JCQf7MzyYZcnlfcTJpy+oBwYMjVZYw3TxyS4jtd06xLNifyC5jInSM2I5/?=
 =?us-ascii?Q?8yNJiO3+ou/J2L3xwOd1C3wiJCtn9pAcPGCtqC0jMl3zdXl2ULYtd2n1S5Jn?=
 =?us-ascii?Q?/hBsOYKhu64PzkCoxwB4PjHP+R2Srxp4wiCaohS4I77/lCbNLqk6mNYUg97O?=
 =?us-ascii?Q?/4mHHWFbIsQmWDO1nBIiMImmIzzEXoA0W2yTpKAZUUBegPKLp4bQHXxWrjKs?=
 =?us-ascii?Q?ugXsNOcWT+cj5uM8t2fWN9s=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96b0fce9-1f4b-4709-187a-08d9a207d52c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7753.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 16:01:17.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FMJz6a7GVBcPLJKzUGcuGTOzy+wgaRDd7PPgujrZoZE2/BLIA5JmO4BLMWioPxv9868NMZ2Akw0K0cGCS7HMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 16:01:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157954

There are several packaging problems due to the wayland-tools packaging
implementation. The wayland-tools package currently looks like this:

wayland-tools
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=9C=E2=94=80=E2=94=80 bin
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 wayland-scanner
    =E2=94=94=E2=94=80=E2=94=80 share
        =E2=94=94=E2=94=80=E2=94=80 wayland
            =E2=94=9C=E2=94=80=E2=94=80 wayland.dtd
            =E2=94=9C=E2=94=80=E2=94=80 wayland-scanner.mk
            =E2=94=94=E2=94=80=E2=94=80 wayland.xml

The files wayland-scanner.pc and wayland-scanner.m4 are incorrectly
located in the main package. The files wayland.dtd and wayland.xml
are incorrectly located here but belong in the main package.

Fix the problems by moving wayland-tools before the other packages,
adding wayland-tools-dev, and dropping the main package FILES
variable override as no longer needed.

After the fix wayland-tools and wayland-tools-dev look like this:

wayland-tools
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=94=E2=94=80=E2=94=80 bin
        =E2=94=94=E2=94=80=E2=94=80 wayland-scanner
wayland-tools-dev
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=9C=E2=94=80=E2=94=80 lib
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 pkgconfig
    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 wayland-scanner.p=
c
    =E2=94=94=E2=94=80=E2=94=80 share
        =E2=94=9C=E2=94=80=E2=94=80 aclocal
        =E2=94=82=C2=A0  =E2=94=94=E2=94=80=E2=94=80 wayland-scanner.m4
        =E2=94=94=E2=94=80=E2=94=80 wayland
            =E2=94=94=E2=94=80=E2=94=80 wayland-scanner.mk

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/wayland_1.19.0.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes=
-graphics/wayland/wayland_1.19.0.bb
index d6e468497d..74d6d65e9e 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -52,10 +52,14 @@ sysroot_stage_all:append:class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR=
}/${datadir}/aclocal/
 }
=20
-PACKAGES +=3D "${PN}-tools"
+PACKAGES =3D+ "${PN}-tools ${PN}-tools-dev"
=20
-FILES:${PN} =3D "${libdir}/*${SOLIBS}"
-FILES:${PN}-tools +=3D "${bindir} ${datadir}/wayland"
+FILES:${PN}-tools =3D "${bindir}/wayland-scanner"
+FILES:${PN}-tools-dev =3D " \
+    ${libdir}/pkgconfig/wayland-scanner.pc \
+    ${datadir}/aclocal/wayland-scanner.m4 \
+    ${datadir}/wayland/wayland-scanner.mk \
+"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.17.1


