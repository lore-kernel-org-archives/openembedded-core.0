Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1A4C636D3
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 21:09:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web11.66600.1675717786150966588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 13:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=rTW5r6cK;
 spf=pass (domain: nxp.com, ip: 40.107.22.50, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkQWteP0zS70Bmx+sA8GVr9X2YfbUey3ZwZmKDuJtlpvOwVaPzZC16AK+QTZVfe/8lEmxYob6CedhFNqev2Z+r3lP/9xfJ9FxzAgJJGfbMrAFUl1YF3t0WIyBqZNkUsV9TsQvnRBndByRXlshlX28SS4m23DM/vr/syX786oG2rhJ+9FIp2OSbbiOaKzh9f5JACj3FC+lN3LFvbux/gXaB3kbuE2NypMru4g1VxmdKBLcshKd5cKIVXlanDoUCAduKz8A6r1pytQ21xGFq0sq3HvwZTbuPMQtpPXoxrP2QwpExOoakR9rddbtd4LnK3ubfzHrmiKgex3D5fTSVvf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpMT1LuDPPW4yLJ6eMYnZru7uBwnI/Z2FmxYvUHK6KI=;
 b=OPj0lf8cQwM16Ioq05dAKvh94AQTKBHj9MQQ7yyt0KLISqLgMyJa0BhKS7L8ampgESq3+LGs4TYSqfsVvVJ9VPfAttZ4kP/VWmi622iupniDlxz5jRTIAjv0UqtDXVta4gjg85/moi1b6nfvm438EtP4ZKPw3WB/p4Z/88RR2GZKHNVEIdJhW21H0tHYRa2gDkhe63170LcjYrI6MJhh/RQ83klFc4SkXYFi9H8cFkNb20YAHtaKnA5CK6PSu9qdJGYzTvtroXoIpIde1qtEDK8qNl23seDsyb2sQKa95OoJt1D1gexI+8BxS4iTXeu1iznl/HUTg4pwejU0A+GfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpMT1LuDPPW4yLJ6eMYnZru7uBwnI/Z2FmxYvUHK6KI=;
 b=rTW5r6cKvO68Uxhrue1PtbI0d4sA3y0QhPXVFp+sODi5mGYAMATeJhOEmy92XUZR8dwWkWdFJqZhGPi9hwGyr9eKa3HlZT/djqZPBZsLNuTiVmJnJhA0wGkiv6rmnI3cNxm4Fg8w2NB1+F+EG4loSSxZpNIM2Cp1Bvf2fm/Xkcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 21:09:41 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 21:09:41 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [meta-oe][PATCH] nlohmann-json: Allow empty main package for SDK
Date: Mon,  6 Feb 2023 15:09:11 -0600
Message-ID: <20230206210911.2074894-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|PR3PR04MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 7358a30f-02ec-47da-4c15-08db088676b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oQadQZRUDJ6f4G9Lh/UjAztrH/gQx155FXlKUHdWogVO3shl0TEjDvMOtEu7R40D6W3peoE1ZXYEUXWnszW9P5JRFV39DJvpzAcJBIckk7vL0ZaTdz9vZwoBTXjMAqe5+hHfNb/U/TOP3sGtyf1IF+7itU3kJ2KFz00yFo9vVqAGyfT1/VKrCzGpA++MVp+7MdHPRZv/SawQEx6Rxci8vyMWP/1ot0aamhC7wpIH+T7CLVeOldx1ryDaMP1eUxtIuSodLmksM5HJrMHD9JCv/O90u9q+Gi27RW1RidO1e85iNM2NanTG/t/WnZSEU+qLxDJuC68wNszClp75ROMWuLefn72tPPS06LD2r+yolUXJoYBTr1+VDy6Dp6RYwo2CnGU1eEjUONEq1vqBLzXjxLWVFr11m/gJ+nNJzekzH0kv5SJGoaKlJOy5NIrD3quBVA1cYBXq/rsSMKcW2VvplxXjqoGx4dv6Og/QxrLPjVwh3FFUDioGOEfpcQ/uH1EHS0fcIH3ajj72qsaMKhQ6qtxBVYDMJymIoirWB/GMc4En9f8tS+l/GBsdFL0XAW6K0qm8ItW2jJ/BSaTIwf/DQv1WFePKXFt9DGBasFN4vpMzRRGNhsVusqJtmu1+e1RiGndnAVLoKHIp1QezEWHpsB8e/x0laVhALosBdDwpv0NxRBiKayOdPgrqMM/WZAwdkISXIRkCXFkYCd3WBSiCL6Pkf/ZuNj7lwYT/FfHuXRTmMzbnA9fFZa5x50FWtgKO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199018)(38100700002)(86362001)(38350700002)(36756003)(41300700001)(316002)(6486002)(478600001)(66476007)(6506007)(44832011)(2906002)(66556008)(6916009)(6666004)(83380400001)(5660300002)(4326008)(66946007)(8676002)(8936002)(1076003)(6512007)(26005)(186003)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gMwccIqAmXyvE2PR257QwnJdJgNDi2bJBugVJovoIc+TjmdbSvgHC17fIft7?=
 =?us-ascii?Q?W5sFtqnMK0dj5V7sHWo6hQ26btdz2yA4P3oilJCvx/EJztvGd4wIHjfsYF7q?=
 =?us-ascii?Q?1gVtYsynkEOLT5ioClIMqJah6Qr1trIwyma27a+SMAg80BSN731XFWWik/o7?=
 =?us-ascii?Q?aYw+bVIF5sXJGI4DGrleHZLh0FTLR6hGHxRgyD0liasMeScUBw0eNU6kwFhK?=
 =?us-ascii?Q?toRhoc5KXtDpKNMugfugA6Krk3V+f9QojPk9XHzCtvGy3taEmiIGmJCVg6Ce?=
 =?us-ascii?Q?376ebU7/avUAvshDJqp1reFHQtRkXd7dZ+0TKgYShUEAzUfPZn+XVjtnDvu3?=
 =?us-ascii?Q?T7zROz/obIuvEQTqS8BBN5o5l+AQPBBLAMsU+rR3ftUUu2pCZ2u2FXgXA75X?=
 =?us-ascii?Q?OPydmJ887/wTyXIIUvbaP4dtOPhuKeMPVNK6kOHsTcVLegRGxb9cJW6UtLmU?=
 =?us-ascii?Q?DZja4yukCpXYAgDh9yad6WCXAxM4la3F6O0NMPkgmblIYHTqcrUcovaW5eJ0?=
 =?us-ascii?Q?L9VuBZmY2ju627bQlSNE09IlY1JnksAewlTlr4ci0TlLl+pV2l3/yGs1O/oc?=
 =?us-ascii?Q?mngEZQza09ScSvpj5ZwPI0xTotjcAyaEnxnURlMKFQkzZSW7aXPYuib2Lbve?=
 =?us-ascii?Q?gp+uiVqMLnOFR5pyaqywUNBeZiKj659eogQ90Go+IYkfX2m4U9CTfJtK/t12?=
 =?us-ascii?Q?AYjcn7o+XlTkXY3oPh55o7rOrs4jzyMLg2nrLEOCt9By0UFnjIDO3aOKttma?=
 =?us-ascii?Q?XNhzbvWEh5rl0apvc7kGXHfdKLQxvnKMi2a/W0bm1GIfE2FPOVaUN8ZqxsEy?=
 =?us-ascii?Q?eE7tK9PX58/8i9dOGMuMCnbPLP/bSvmmpOc90n6dE36nGkUU/eMTiPolVOGt?=
 =?us-ascii?Q?pBsx6jCwrC9k4qdw6DLM05vmw7SnujOHL4jKfOGR3qM3WkZiEf7JUwnLVRs0?=
 =?us-ascii?Q?zAcvTtECmxunMbhTYiezujRbUiwaUFSpbN2Gk2HblX+nKkrsMG7rPhoZmNIv?=
 =?us-ascii?Q?DkJ5xIj2tHqQInB+4gT5bNrX/1hn0ak1xLoBGkAjRGDfF7mi0Vc+0z0296Yu?=
 =?us-ascii?Q?yyPhwWIp6wtYC+s4ocM8WEadt1Ps5rvZ5eXDvNHSteVf5kzIFBNt9+UKLLKH?=
 =?us-ascii?Q?XIcww7GXubcWCuIfU1qaKWrNugrHHVH3vB8K974NZtTtuz5pSWuzJR+KcUku?=
 =?us-ascii?Q?UUCupu8pYFXqCxjlPtjPExB8lF+vN2mbUY/qwPTCK4Nb80U+RQt+kJIN0ww5?=
 =?us-ascii?Q?8pqF9qBPfM5iE518xIhLxgC5++gozaMfa2ozSsl0Sv6jHzOfc4NfXOqMO4St?=
 =?us-ascii?Q?W9PM9vMaXA7vI59K4ZgNGF9I4Y6SZSf6U31Ke8SKG59w8Ld/lwqoPplOtDVj?=
 =?us-ascii?Q?w11hs6OTJ0wA2ZCeftpsTW4AdfebCSmOcUyd3TT54t/AfsOBHiwPPR1U0DR2?=
 =?us-ascii?Q?DcQWsjArnYK1aOGDcuOh/9HCkl8w9SFTxX1KuDYDl7SqJTdUiEGbFEilTk9P?=
 =?us-ascii?Q?qH4MXMZlC6GDAEBYWdgFPz7HTzsPPXAeIVdBS8tSbqfaByZSH7zxlJifSPe7?=
 =?us-ascii?Q?fjqKScYQWuz1lNbJYXR6PFRYDoh3ECekHfV3iRiz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7358a30f-02ec-47da-4c15-08db088676b4
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 21:09:41.7286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLJjNpFD055UUE7GXB2XdAEer7qF2JgMn1afQkSJOq0oVI4roYg929EzcHtbLWXUltv2CaDfQ6brhwU3x4ZVYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 21:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176797

The header-only package cannot be included in the SDK without marking
the main package with ALLOW_EMPTY.

Fixes rootfs problem:
```
The following packages have unmet dependencies:
 imx-gpu-sdk : Depends: nlohmann-json but it is not installable
E: Unable to correct problems, you have held broken packages.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb=
 b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 502262820..6cf27755e 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -18,7 +18,7 @@ inherit cmake
 EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"
=20
 # nlohmann-json is a header only C++ library, so the main package will be =
empty.
-
+ALLOW_EMPTY:${PN} =3D "1"
 RDEPENDS:${PN}-dev =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


