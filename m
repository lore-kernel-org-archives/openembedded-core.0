Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81411C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 11:06:34 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web11.67243.1680519985009949550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 04:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=A0duFLhs;
 spf=pass (domain: welotec.com, ip: 40.107.6.88, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilFgzmM/xUvkl3vdsnGMnbbN6yNqf9/sLkjnOtE5NSO0UFSM7KTKqS+wNiFd7yzQv0l67GdikrmKQQOwtWDYb2Lqentqkyv3GoZn6MkfQgqpLnD1BuwddZZRYN3HuaGlU22joHxPRkSt9cG0y0baa4wPG2kHc/3rqqh6UPxM/16gk8grUFDmnTjcCu0vucFNPFsM6Y05i02FD30ZWSNimckLE2j+LA9nD8+nzUnl30PfBkxxjpC30gstTS7sjPkmc90hZiQ+XhS/dXe2uh17o5fRmlixO9SU3RDlbcnakFUHL4LMn3VySNh1sFzsahOGBULst7TSC8ABjFLk8QPnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgEb4Md2ajTxys3da/TsxRCoX+PPWiUbdcEWaP6Dt6s=;
 b=O/fDzb7ex2g84dXE26ov7NZO1fS96P5BTEH5kCYXua4plITJzYjeW0LgLbGIdTg1sFyZglZv3FRh67e4avx2TvpIZ+T3bxvpGYoSwtvhHw9WFWGGZ7RT/VcrcfAe7D0jh0CYx1Vyfw68bJaE3x9ntZmhJnK36KPDro4n0CY2pMiGCC/NCbfhBXPtOL6/AmNn46YmEODvdgh0N/PysOv6CVYs/4+pEKEQP0jpssWGIM4cSZHW+wHswyVAmORenCk4jgm3wCb3RQisu0vdboK+xo0ZsxaWztZ/xILJtcxgopvWJHyTqy6Z17fo5GIzpBqF+1Wqbp/RI8VDkab4/4ktHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgEb4Md2ajTxys3da/TsxRCoX+PPWiUbdcEWaP6Dt6s=;
 b=A0duFLhs8W9iQuYfpCd1Xdm6Pl1WhoeVu8TUl0amWrTKZATWWCeNPmAW3c1aFng6V4trAhpwF57asUl4ViHLhZ6nXTZOxvrfeFJZCGnfuA0CTZdeLMc4HZZYZQUH2kT5vuox0eIvWtOx1rUXciGFlCUBEzBQcF9bCSbt9RyGS84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DB9PR04MB8108.eurprd04.prod.outlook.com (2603:10a6:10:25e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:06:21 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9055:4205:39a4:364c%5]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:06:21 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [PATCH] libarchive: remove acls, xattr for target only
Date: Mon,  3 Apr 2023 13:06:10 +0200
Message-ID: <20230403110610.3060547-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|DB9PR04MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: b655554f-bcf7-4ec3-f473-08db343374c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k6fJWK+R5QUQRtGj8qCvHRFdz+4FX++NDvPvNERPe7qb0/JQtDhrRUA2Sb/812dVh1jK0dYRvFQQRLxkMYY3IUhDuc/zrvAHLV3Nj1UV5jgf/+6LmlFDmtQXJGPSSE0eM/3yS4Bd3QMAC3Mvu434xXoK50ExH+uZKu8VudU8xG0VA1CiD3qfcRDAq7xEOx5lykMnnHutEHZgbaxZEH3uWM50TUVZI+vurcF3SLN30pFKSlyABJn9VXw2ham0yQhnIVHgAZxMMtmUspT7CVbP5Z/HzdZ5zl32icmYHazXWbfAutGHLGDwB1dz4E30E2kgdIjBLdiXfYxwq0dIAMeN4w8c+hWU7/FMr0+A24AuXrHd9eJHf7MdByGz9UxkqO2RwGkjxsCenNt4AWQr21cGzcfdneOsusqiO1q8GD1B+LvEGt7lsyM7uf+E60OmceAT+3WBScdNz6q7E0GXp31c4u3sUvEhMa3bFsXKosmmzIAsDlgAtRnZwK1q1TNlU1P4AdkS4Oh4I+ZXIa8HAnzfwai0euzOv3z2jBiVDsAK8iijHfVLzMp0z2YGnWpa6DwhA+eNJv7v+ha4j8+sE+hFGvUOS4o4h/Qkcuy2jYM1Nfjm6caCSs7AnqWMrXy+jxr7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(451199021)(8676002)(6916009)(66556008)(66476007)(66946007)(316002)(478600001)(4744005)(8936002)(41300700001)(5660300002)(38100700002)(38350700002)(4326008)(186003)(66574015)(83380400001)(2616005)(52116002)(6486002)(107886003)(6666004)(1076003)(26005)(6506007)(6512007)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dEj5Heiz6Lkmt8Id08Tb0VU7XlX5EdVUaG7sXQ+x9emhcqEnKP6TN2RUOYIX?=
 =?us-ascii?Q?h5syimQrEZxNVQlaDK2+9+lp7tuTpTDc9DGvFaP49jTWZuMQWwY/yCayQmNW?=
 =?us-ascii?Q?afvXULFPeu/5n69ClU0J2x7K2px5LNxzDkKYwL2+ievw4ZRhDu8DMn8P+F0t?=
 =?us-ascii?Q?lO81WDcGv8ww5RbjheaTSamLtcEp2aKkKOYhg9zxCDpXt0EI7CcP3JpPKQ0C?=
 =?us-ascii?Q?CvGk6DV5ch6cbZDxgQB8feHLhXDA0yYzGNi2Oq6BL4j14qxQyfwCztkzO5OB?=
 =?us-ascii?Q?7mkdu/5cWlOEVJBzESZX+R7m+Qvu7GTb/xPAllltucWMEiywXYrkdxSm2idn?=
 =?us-ascii?Q?3jftx2vMR1MG7aqSM3b4EPsRCl4pnWE5+iEnKTv/mbNEWUhQM0L7sefZwPXI?=
 =?us-ascii?Q?DZS+HwS0Woy3veELRkIC1QBbIEWxlEVr87D+sCkfCBR0XGsWWNZ/T4SYhVmA?=
 =?us-ascii?Q?jc61WDDeyVumCgunKgRK6G+u2cRCGc+gz6PYIJgFOHugCXDMV70y96mrvDCH?=
 =?us-ascii?Q?VcFZJ7rS5WOxJhzWqq6GUeGsivQ52/B03Oiy/IZLG1iv1QStiJKTm15j1Oxg?=
 =?us-ascii?Q?0JSU/GCC5nXxUhZlNqTNvPTHQklxa60vmWM8gR5XkNc0yXDq2Rw61wzPmL3h?=
 =?us-ascii?Q?OyiOs9Bn5ShMbb3o9eKiViLsdKlZ64T0wnbIi3EmG7O7O4np4A1p0iuaokV8?=
 =?us-ascii?Q?0lLjazpnb5TAEjoIkzH5fvbGpvJbkVFv64tfIcqPZKU9co6H28nqypy1dxaQ?=
 =?us-ascii?Q?kPG2rhcpsXWs0BvMizMPT2wpPoL58HzeJgWJnFIda+f4TwnlMxSF66zTE0Zf?=
 =?us-ascii?Q?HIs05vZpaUkJn0UeDsPPnd02QKEMkzKvyfeKXu9YuEOHsqUlmcmvmCYQ1Gaw?=
 =?us-ascii?Q?v+UDv8HnZSSRRxSjosSNRYSsQldiyOE0QZ3JqVOXJEBKbfPAUnZjmdz4yIC1?=
 =?us-ascii?Q?GooLld+oR0f9e7aEkXogiI/a7suYAKiXjI+bXRP0G3eHzfF4FDE8fxy8bdfG?=
 =?us-ascii?Q?Lnyo9iMhh0VPI6pIp7tnfR55awJWVGunRmVk85/8XsrM9frwsf5ByqyjPeWm?=
 =?us-ascii?Q?coLSgq0VyhSaN+uzHHtRURJuIYkQ7GWaD5wbBnvKA3D4R1TOY/j7/wroOx3l?=
 =?us-ascii?Q?Xt70dTyOkQTslJA/GOAKdGQIgPplgQppbvJTiyP92kU+ylucTYuiUqDc2HEi?=
 =?us-ascii?Q?la6oywwmko1vQpSd4qLUcWLkVHMLdoD3Ir0F6vz40npC8HEjY5R4B+MUmxVC?=
 =?us-ascii?Q?2+kLK7AKOJ6xHUE6iLz/f/BM6waQ/8aJhZd2g2XKpT98r+YGca4caeu/d9fF?=
 =?us-ascii?Q?n85Qn4J1uapmr/4ct+x8bZUr+2zSxXuySzODeeizTK1c1t/QI3ArtYXxLqhZ?=
 =?us-ascii?Q?ADR0Ic/+hx9N4TaaIuFBBVLRkOn8emI68oBX5WJHRqiqVSAwE5oqOzpb3Bxt?=
 =?us-ascii?Q?UrKOHjI0yNse8W80AXsF7ffV5STSC0oPhkf6c/oIbrawVM5TkWpPhIPTBShF?=
 =?us-ascii?Q?/po7kWXbFt64sj9Zr/w5uX18mt+Znty30ciXyCHnXZTxpx2mePjsjzlgbcNx?=
 =?us-ascii?Q?Zo//v8DojyTgklA9kNv+EUrSIiOJ6qsMA2WT6A6P?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b655554f-bcf7-4ec3-f473-08db343374c7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:06:21.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzQwJCobyMel4AW6S4fYo9OoVdRTjNr7AU+0m+Ul8jC9iLkAbUBSbZ8cXG4uAFhCajNlWujLNmyEgZOjaHRUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 11:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179616

Libarchive is being used by OPKG package manager as default
API for extracting tar files. This fix allows us to extract
ipks packages with preserved ACLs and xattrs.

Fixes: [YOCTO #15091]

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.6.2.bb
index acc84de9da..15b1a88ce9 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -9,7 +9,7 @@ DEPENDS =3D "e2fsprogs-native"
=20
 PACKAGECONFIG ?=3D "zlib bz2 xz lzo zstd"
=20
-PACKAGECONFIG:append:class-target =3D "\
+PACKAGECONFIG:append =3D "\
 	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
 "
=20
--=20
2.34.1


