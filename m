Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5E6C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 07:35:58 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.68])
 by mx.groups.io with SMTP id smtpd.web10.61504.1643787356066037702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 23:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=YG0+xVeU;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.68,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cr9p4heNFyurPojI203rGxOsyRAX1Vz2c0XTF7lVm3/AX9yIWIJwsK1wvhh909sglBJbH3+8jliWU+y4GYsOf8GLbb4f4UiZ1ngQMcBviLOpulgGmgHdsHk4bqzRE2MXM//YXJPV7zCg/veqxvPeMOOXA6/YvHgGrqnxeRHYO0ezEzM8zCxCpeMFjXEZ8m93ON/9B78Y4Z9Xy9YJ7fixPkfBMui4dSt4zzqb2aj3Lbbf8PAwQSIsGg3qat5NM6LHmIsXJASW2FDD2m7VfVMZmvb3gDNjiMSG8fR+X9QxDPnFSA2MXXc5enoYyJF6p8Ra+rrmii8a/l67UiVZA5Nyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BV1FxfYuglC34Bwnj7nT6qKdgEU83DloGBhC60WdChc=;
 b=RT4TbSEsgjGiUXXkaJDCXsGjQbfU9aLISgtCNTZfWP7GPTLur3wgbh6l0+5Eh5f8UNtbRChbvbSAtiNpc30ivz/nuXjWfVXBAxwSEoPSrgK8pcMu2wXX/hj2rQkQvjnqH+ej/rgQW2J+RJ0FsSydo/D7zUC3vFp2K44eRsgy2HYiqzQLO2OZgQoUjraGVasyHwpvrkzw6WawdGbtxPfMopvHaXP/ZDIi4I/lsCXZnN+ZYyr5kyVWoL4ce9ZWEphzw5bX14UGLvW0Gxm4OuFbM7XMzHa9+7jRvU9J+vmcYt0BvyyqxKgruecomAsrlwXa8KBFR+DaoEYXGltMZ5hBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BV1FxfYuglC34Bwnj7nT6qKdgEU83DloGBhC60WdChc=;
 b=YG0+xVeUhSlAxyeSoUjqfqtSkVqEaf7SUJj+2IveL06DVxyM9WskrmLsQePrvsVV6DUK2GvUpyzNNvG2GfGyA14GkD4MgIFgw366i0qCgZcn71V2RibQDwtR7f+4vWZJlZWzerY2IdWaI0vIp5FgnKvBpQ4xc9G88aagy9qQevY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM6PR08MB3111.eurprd08.prod.outlook.com (2603:10a6:209:48::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 07:35:52 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 07:35:52 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 2/3] systemd: Add link-udev-shared PACKAGECONFIG
Date: Wed,  2 Feb 2022 08:35:24 +0100
Message-ID: <20220202073525.3413-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::48) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c738c90b-8e83-47ec-52d9-08d9e61ea3b4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3111:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB31118399290BA4B8793AFBB3D7279@AM6PR08MB3111.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QX8r+0ds0a/WHS6EWfkuf3Dc4Zlb8N9FZll2ouaZMqlo77ltNduwpoWMGQa3VekNr3BYYFw2thVZfHbwM4Eu/Lx0r5mzOD3Ioa5dq9b0JpdeNg0SNdRFYX1ETQ8MVySRJi8eXe/MUY5zwAA7f2EwqV1NSyyu6HEMUCb6nl0P900kVLw12nQtjY230sWoU5FWTXkRdmO2T2aQDDYloyNfiyBXvmu9JOUbIFcnv/lAA5ctdCyzAItI7HWlzBVxznxZ4EVZszE5ghNqVATNhR+JMyqMx6WP8m33EcsUGeHnTyXbQ8vCquPlp7fkyjC38hYVEv1O/J5rmGinD19kwH+Uj/kGUTDXxQPI1yz0kTAA3ooBFmBo0MlT4Z0Yy0jdMaSnKaoSAsKPck3jKDGLuQHKOnO+HXYV8IKpx4eP4OJqFtTvakAJiXLuCUHQf3ojiJLjpUJNWDpprbxAhTwKc9AlmaP8UcjUbjrO0Tdbt1Bm/vWfcBn6HmqIgtFrvlCqAq80D4JHptcqPvRz6u+XO32k4I7EF1OJp986KnrDZasf6O8nlhhurWvaryFM6j/qycbTHE/LUkE2Iu7FU0ryXKweGKPzMFHUL4EsU2e9Z9Ct/j2lYW3MfJa965xeLf0JqiSGLuK/oMCj3bkQpepEIEFPWbXE4PsdfgRlIrjiGVS7Ys8gpYBYamvag6EkNWOvhXvCnMuNuyeR2709w4GMppEviQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(6666004)(6506007)(508600001)(4326008)(8676002)(316002)(6486002)(52116002)(6916009)(8936002)(36756003)(66476007)(66556008)(66946007)(38100700002)(86362001)(2906002)(2616005)(186003)(26005)(1076003)(83380400001)(107886003)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?puW0iisBV6TH/I63LpVliAqRtx/l5cysZELrxuvEEbFKJzxGnbeA9mhW7WBN?=
 =?us-ascii?Q?/8cf0PqaFqoYp0klzab7SplBXoeqzTSgT5fhHcwnXmKKxE6kDCXfiOYb1x6Q?=
 =?us-ascii?Q?AucMzZ8DmPfFsKGtVZu0hwQ7QYiJuHidjcxo8ZUUQoy+BDGB8aF76OYtei+c?=
 =?us-ascii?Q?Rjntv/lzcGS3bXoD1uKE8j3UobCRQJ86eFpiEcBrajWR5SVyt3WrPrVceTXr?=
 =?us-ascii?Q?nus51675omGMWWo4IaX+meIw6uoXHnBMiwr8ok3aFOjrBmVosD1vckPJTXBg?=
 =?us-ascii?Q?lque+3mtJrYM4dGCDDyEbfCl/jrDLYhjNAT9wyq7Iy2y40G2zFw7n+JMQJps?=
 =?us-ascii?Q?0ygkEGK1uL1YBI3xTKnVEaktkATPm+DyjOtQRRM8CtTAxaejlRCit2D/U2AV?=
 =?us-ascii?Q?yJN9s2Ki5qLTtUhqv00FCqn10v4t9dT0PEwkJZ9tEtYtGTOTmjlxrWpzHiYg?=
 =?us-ascii?Q?UkaWO2ex4PEazVer8SG06qyNfnaTdVUDiKqvN4lncjGahz6ojXxg7lEqX3Pl?=
 =?us-ascii?Q?KKun6XRK24MovisUZMYIfXrPH7lkataCgM12dYKKfsWIuKphQKONR9bJN6Zq?=
 =?us-ascii?Q?yMScuFUz7xHAfUBCJQwJe/bY/ZSpsWJ2LDo0TPlZBRbNSc6GTvaXTJbiWKgs?=
 =?us-ascii?Q?bma7lJQrk+b1QbzVh5T0ydkwTWrjJBanxNKVHUKYliM0/TgRuenuLIOylJ2i?=
 =?us-ascii?Q?A13BfllIagOdoMzMF4wMdoqokblKv23anUre3gIEqJDOXbEyZpH78SGYLkrj?=
 =?us-ascii?Q?WED1/uGqCtbEVyy7WGUgM0JglnH5JAMTt3TBS1pVcpunEuNXPrHGDoGizV8v?=
 =?us-ascii?Q?T8SI+Zbdf6YwtvOb7ItYIdKA4C1UgiN0aNzwQc/8NaUQnHkPpTjeB5aord+6?=
 =?us-ascii?Q?vrRBRS7/fYcVv905auenxslHYqYIB1q2Tw27A6V+6lL9kFBflEPkbO3oxDMu?=
 =?us-ascii?Q?RYW0WZ/y8WiOhWfGzUtWCsMDgLYT2cJ+FodNWRoPuiBQ+JTM5elDfj7+qs48?=
 =?us-ascii?Q?Gr1+BDyXiKz0PC+BRIRtlfCKOn4r4S7H/s1mRHtL5Y2xlnsB8NvCl0jzIBXv?=
 =?us-ascii?Q?A5PUrw921FOxh0TN2k0zQeZJu1d+x6psfOS5da54q0QX6CpzhBCIZw7U4I7r?=
 =?us-ascii?Q?NQW1frvFViYxnL8pJtbnhTJ11mdiT9Uf/g87R1TEMfNu99l7SOuL0Bk3q1ds?=
 =?us-ascii?Q?8+krWRNkFdL1mHrLWdLwLBvjpLkDMvn3qTZU3HkKA6jGjeZY5zac7KmPrAMQ?=
 =?us-ascii?Q?4fim5vvTjRZK7ZD38dpb18O28e4ok+EylQoc+73Sb4MNE3NxoPc5ZKf2+Y2j?=
 =?us-ascii?Q?aUKzz3VWZvcpzSN9857dwvtEGO3D1TpFrpCVIOaomoxGBLebWGeU5wCUflLJ?=
 =?us-ascii?Q?p+P7XCr26yTfWJ30E7W6yX7ji0b+P8Wr8/J65RBZF04EfCQgt1an0pLIfEgg?=
 =?us-ascii?Q?NsrejebsWHWJbCI03R8aWTwAoaWgyka1lpbKV82v7TmiqGT1f72WkMfFzjAT?=
 =?us-ascii?Q?SYrD3qoOnuwoRAx7lE7TF8XZoVkF8w5a3A9nVQUlO918RtYZEHpWSQXVESYx?=
 =?us-ascii?Q?scxZYuSn5lr5HHf9x7W6/SkAf240fwohK/7bLi5aTGjOvuUlebslRH0ppnQp?=
 =?us-ascii?Q?wPg93WVs4i0u/TMJIw1r5J8=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c738c90b-8e83-47ec-52d9-08d9e61ea3b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 07:35:52.5171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h47BqoZ8OO0LPTM6wrKrI4VEBtGUg2+qf6VA1A6MZYZzgpW63AGFib1e9C8pQPCWzNjzq/jWkOtXKS0aNXi+1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 07:35:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161181

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a PACKAGECONFIG to link systemd-udev and its helpers to
libsystemd-shared.so. If enabled the udev package depends on the systemd
package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/recipes-core/systemd/systemd_249.7.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core=
/systemd/systemd_249.7.bb
index 53e7f6738d..739f3aae86 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_249.7.bb
@@ -156,6 +156,9 @@ PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,k=
mod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldconfi=
g"
 PACKAGECONFIG[libidn] =3D "-Dlibidn=3Dtrue,-Dlibidn=3Dfalse,libidn,,libidn=
"
 PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Dtrue,-Dlibidn2=3Dfalse,libidn2,,li=
bidn2"
+# Link udev shared with systemd helper library.
+# If enabled the udev package depends on the systemd package (which has th=
e needed shared library).
+PACKAGECONFIG[link-udev-shared] =3D "-Dlink-udev-shared=3Dtrue,-Dlink-udev=
-shared=3Dfalse"
 PACKAGECONFIG[localed] =3D "-Dlocaled=3Dtrue,-Dlocaled=3Dfalse"
 PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue,-Dlogind=3Dfalse"
 PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz4"
@@ -215,11 +218,6 @@ rootprefix ?=3D "${root_prefix}"
 rootlibdir ?=3D "${base_libdir}"
 rootlibexecdir =3D "${rootprefix}/lib"
=20
-# This links udev statically with systemd helper library.
-# Otherwise udev package would depend on systemd package (which has the ne=
eded shared library),
-# and always pull it into images.
-EXTRA_OEMESON +=3D "-Dlink-udev-shared=3Dfalse"
-
 EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dnobody-group=3Dnobody \
                   -Drootlibdir=3D${rootlibdir} \
--=20
2.30.2


