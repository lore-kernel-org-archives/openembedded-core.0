Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AC0CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.102])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16048.1762158140824865720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=aRpV+Rdm;
 spf=pass (domain: navimatix.de, ip: 40.107.162.102, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H99t27+iDCptsOHNRg7f085Xp1dFxuRxxbjAwdH6cU0cLCwIGkc4zoEAyJ9KUZhP6/qWEDZWgKecjys8fJ+sZe/6rYTsD24c0b6+EiYbtw91DTybGWbEnJWcWG8aTZ9Ek2112P+Jn3Xxp6U47ouEF6FQCHgWLeXBggnPa8e+BqjpWbsk+OOGVDTUiWPmtjVyzpXtT1yQNdBiJXVPavKOm8eDRsxgyHDCMXLn0QqJbLT2QrXjj77PtjIvB7C99t12PRAOvZok5UDlkLk+pL5TfQrzNhy4XdNV+tVUHiO/OUhH6AyjggXENXa0XM7ffYYzhMQ63N/Pgj3I7E3jeHG8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjJ9F6Lhngp1zehwx40YJ10xJiEAuTsl2Zl7SvHD9WI=;
 b=sWRMhMCPIyWJVVtjjfh3ZGp10Aj0oh1Bv6plj5xRuQDV1MJL4NfJmqZBUCB+16Mc7DJnNkHTaUHydX2eyfCXoXJjKDA1vXE6q+DS1ETvaBAY8j5UhkRX0G6xGQ4rwnbdrw7TbK5gPx62+V0aVVgU19kDtGoyBfD1V1IKEd5ZY5S2HgVWIspQiZn3Q7fv+Ths2XZ6yPgNmHYBd8ygdYKQfm7l1EQfJoi6MBFaBjHtAQD0nqtd14elHn/xILhzJZ3i+wzwjPSQLLjDpc37lq/1L4figmBf/fGdMFadsQhCTPlnOdVOchmQkm5ej9sAuL4/D7tbK7VoA14MmwCjjTSy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjJ9F6Lhngp1zehwx40YJ10xJiEAuTsl2Zl7SvHD9WI=;
 b=aRpV+Rdmvr23JVlotL867J8lKI8WCppU1CGMjke9iM0j747yrBELXfbK6lv7kbDV/4vmmaUQ4+G8Z8ztfxZ5W4HxvO43jxZVNomsEOPg6aaxBaX4IYrx4ZDFBWajhgDNGRTUAnyqWbPmOyE2ldbpgn68Vy1SBgS3dod364GKRO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:16 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:16 +0000
Date: Mon, 3 Nov 2025 09:22:14 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 18/19] gtk: set correct bug tracker
Message-ID: <c0b8a9906c5c1c42927999b5a5408027443de0cb.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ace4598-7846-4327-51e5-08de1ab218e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B5RnEEdygsZQ3HROCcPZ7qKBvsKLpphBxa4lo2lTErnE90PR21OCGWJmIyin?=
 =?us-ascii?Q?xKiRxx8Z9gufLvA6fa1/nf6m8PJb8uR+mbj6jzhkXysPp6SzMwHsdK+1h4q6?=
 =?us-ascii?Q?G98qc3Z+/nX294KCt69MFa1Yu5LV3eX7t69gvdqj9aSgSmrBvwaUpQsGv7Ze?=
 =?us-ascii?Q?JeV7buUVXPjunIcfrFFrscNkQDVpmPIGaQwO6W3fVgmcRaTYCIYI46nKTKih?=
 =?us-ascii?Q?ASKCIPmqDNG+iS8/g0BofUgVpXDXp0ltvOQF26JbCJ0AuJXauNRwAyKI31CP?=
 =?us-ascii?Q?AM4wp2eQHnO/IDxcLzW/vZp/qlixdELHxTYdRdEl1VLCdXgaLDSkOQeOxxbf?=
 =?us-ascii?Q?ifNeZQIySYks+v4PSm/Up7Or5yr48MyRWgtfM2az5PzAu7z/61EN9Qzol9L/?=
 =?us-ascii?Q?DdLZVUjrCpcB18iMCL0Mykp2PK9guuC5nO7Ol5ufDX4HF9jX6pnaxCYeXkcm?=
 =?us-ascii?Q?/HpsoY7/l1uNA9IG5uQfHyoJN28n9UrpQjtHFhpwT24RFnIuTJ8/GpK0gSdN?=
 =?us-ascii?Q?vZWWKkPUhUyd39lnMuVpfY6Z0U8nPITEH5vIK1eTGBitjGz0PO2IAezhtszP?=
 =?us-ascii?Q?0qHp8hzLNuDtohm8+XeEWhjmuW7waeOjhLkmOtzS8IKawlSQXfTqwCLzuDwe?=
 =?us-ascii?Q?5bNWA8JVSV/JFdi2G01vFi0CF1tLDhKIKXqA8u24RZ3CXoIZ10ACGXr2lER9?=
 =?us-ascii?Q?o0eTJMzVJiZWxa6f9i6bnyDBrdDBMzEYvXdIIxl25yvECjYbNYw3zX5daEKP?=
 =?us-ascii?Q?FeQyVox9vTg1+Wb0bAzdnHGUuGWPivGj8Lx+frYXNIDhwfnvgCXO/O9NfPyp?=
 =?us-ascii?Q?rnvIQR2NUD298plC60BEqL85oeixV+jZOwSvxKg8b414qw6M1HzimI7vhdMq?=
 =?us-ascii?Q?34YA9qLS62CTeInJ8tfYX1gGMixRlV67JISHJGG2lt96DSHVCnVyChWIGqJh?=
 =?us-ascii?Q?U1ugo9g3sDTankIBDgmbm81JxDv6XmUuSb04rMpw5i6rO97Li73epYIacktk?=
 =?us-ascii?Q?1j9F1YrUsgc9vA0SHFf8F7FjHTpV8+zYn2v3D7DVqirOhUkyUf9sIkSNuYPS?=
 =?us-ascii?Q?Zh8RI6DFJ36OHkL4K0KRaE7fRW4Se/AOMilEkl3tkig7hpO0LhAPjTT3F0h7?=
 =?us-ascii?Q?UN/4+KxcL3zyRn4xNTcuwyt5nWYDwcGXoiMYvwDYuHXpaiIPTi6JjeeE6x2m?=
 =?us-ascii?Q?KgTVoprsO6J9kvFQbidRRTwvUgMBl0R4jsAOpuW775GqDNKrNjm2onUxtca/?=
 =?us-ascii?Q?cEVfhxxVKB/im5weDidKw8AT8H5BfpuxQz8unwfy27hsjkov0NDDv8BuYBSe?=
 =?us-ascii?Q?40uNJ5ILWfDRHTobpOUqjUWmhb0fdO37QoA3K2+iQZ25RSco9QajvZg9XpMI?=
 =?us-ascii?Q?X1nPal0NdxMNUH54p4bxefCwBwU1QXlwStPwL/gFLzxneEJf8w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6k9Qk1AJcYHV+zEOT0o6wFGkLO03qGc0KmSHzzxs/73OrxbTo5RKiFN7/8KF?=
 =?us-ascii?Q?+nILsat90cxlogK/AxzHDlE9bU/kxZPS10FCl3Ncl4plLRFZOt6uf5jfyvZY?=
 =?us-ascii?Q?w/JfsrRo9FhJDFNzzGzqXCNezz48etbvDP571tQWhCGDTznPUo8Mipm03mLW?=
 =?us-ascii?Q?RgzCrpPvDBOxeKuXmlAnhnMKD3sbRkSPdrKhzJBAGqXTQMkSa+DXU421c0t5?=
 =?us-ascii?Q?7lWJ5i3GdEskoHGxrqmeSTwgim2/LgOLucinfejwbtsS8SIwz5NqXlv4JRic?=
 =?us-ascii?Q?D/R5+73vi5xfFhG+ji8qGPMKJOvoPAEZYwThmx/B9gMm35UwVVV7Btz16KKf?=
 =?us-ascii?Q?tXoC0xVEyLGCgQqCTsV80ymddzaV2XM457NlUs9B7OD6YhX38N+LNuvDU5U2?=
 =?us-ascii?Q?xQ/3mwuo5hRZdDmte74D2/l3Pr2dO2d3+3qK1USfONjns4mIi3qpAlmuRooM?=
 =?us-ascii?Q?G2dGhjfGuoak5Ab7dxY2t3pStUnzFTXJe8LwOW82WyrnBAk+xtoAQfw1gFw0?=
 =?us-ascii?Q?11g0miJmqehkdfw9p8fqrZZMt0Qw/rmX+w/1dCfOLOFMlK9Q86R/8F7a7nuA?=
 =?us-ascii?Q?DALaRqbF7w+1jIngXybghg1knmmz5MltdnvDllJ+jNN+R1RQdEg8SC3kSq6K?=
 =?us-ascii?Q?OP8hh+mOTuXEMnFArZ0FamHxSc2SpLtYlnpfuhfZNSdQpqu1ZgxKoaSbL56y?=
 =?us-ascii?Q?UeqCt/5iaRuGPyx+PnpwYwIBVt7OkVfSBtiG8qNvfPU/SV+hS0AlwZ5ZvFHG?=
 =?us-ascii?Q?8085+5Tg6/H/8RuV5lQAQKLXTEH+dAC+cf4mMK3vMkn37mGGkYzOTeqNEAZN?=
 =?us-ascii?Q?1TdUHGd/8VmVPZIBBbFbetJKw/MHHmQeV9yorYCuhMN/6cuIvhDmMHePyegL?=
 =?us-ascii?Q?gttYLssleJvkegTJeS+lcfSr9xyq4Wh7yRtvwtB+I7HQd1SUhrzZ7/9UgArW?=
 =?us-ascii?Q?SGuujugcvIkZnAFsR31eHBU/99lSuDWBB6FHmklx8MkcljswWXGMxTK0gvrH?=
 =?us-ascii?Q?XhfQSH9Ls6eq7zG0PkRs33Awm5DIYGUKNATR1raZmA3Tvvr58SjMbXjQjlvz?=
 =?us-ascii?Q?uKI/ESovnHL0O57jWbINfuC8boZbpoOiXOYaEhMRR/+DD+CoDB/5wgBU2h2O?=
 =?us-ascii?Q?SWov/7nb+Oe1dj1czJYu5r5t/4mRAt/uG2Ospodpt5Ym8j/Dq8O3lfO4Boqg?=
 =?us-ascii?Q?qnbjJ+ad9eVLzukZIfovg+cEGlmdWvGTgX+SsEgxE5Knph1jIvxv/jxAyisF?=
 =?us-ascii?Q?Wy22elPcOgt0l+Lc0ozhOTgVn/UOWmlJnJK2LkEYrXA4SdJ5YXswGVgKMp2T?=
 =?us-ascii?Q?E7DmDg23d9ee2LlmPlmftdVXn7pXhS3u3ZJRMpQZ4C2dcDHPZ+2opf2p0lSJ?=
 =?us-ascii?Q?EewXn2U4tCi55jMmqwPYo7+sIMUItsRGOkVqbF4ADYm7LMBP5kPJU4Sb0zNc?=
 =?us-ascii?Q?7Lf//PZqJdzMq9OIp8Yx40aj4Yd83xieWV/uCQfqjjMCk9T65srVcQzWvRED?=
 =?us-ascii?Q?4CIHCrW2L11sa+qdzknHiLUIIoSLdq7WfF2dIRMduAE80kOhhoJK221ZfmSp?=
 =?us-ascii?Q?PY5E+Z2YGluKVeRlGdOw78dhW1iiQovHvg2XsrK00YhAkyn/YD6ETb9wmlEQ?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ace4598-7846-4327-51e5-08de1ab218e7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:15.9031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgO66zALAJFkY8x2pIPP1XzPpW64hD7kwMl5g0C3Uow6EV1mwoyWjaUS0XQBrCxHI5qh3EZ4g0B5NipiHz2/WU45Edqe1kDhHdlq0luK3bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225632

From: Ross Burton <ross.burton@arm.com>

GTK hasn't used bugzilla for many years, switch the bug tracker fields
to gitlab.gnome.org.

(From OE-Core rev: 87e42afb25b3faa8dfae1e37118bf18b9f8b6531)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: f42421f09ec2ab9c588a03d47d57e4ec1fb28ebc
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.43.bb
index 15870dcc08..0ee2f18167 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Multi-platform toolkit for creating GUIs"
 DESCRIPTION =3D "GTK+ is a multi-platform toolkit for creating graphical u=
ser interfaces. Offering a complete \
 set of widgets, GTK+ is suitable for projects ranging from small one-off p=
rojects to complete application suites."
 HOMEPAGE =3D "http://www.gtk.org"
-BUGTRACKER =3D "https://bugzilla.gnome.org/"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gtk/-/issues/"
 SECTION =3D "libs"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2 \
                     file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287=
a271dce88af737 \
--=20
2.51.0


