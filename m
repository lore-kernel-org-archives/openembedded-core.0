Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B405E7718E
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:23:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.27158.1734884579574530729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=wSCL7KQD;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.46, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAHB1ikVaO0c4Gxyt8iQhe4G+DxYWV3itITmdG/bIBRaLn2gwpAnjvTYKrAInESniFM2YACdSPaWEXlee3mnQMdCKkccQOAVPhVPro5CBj0r8UuJb7lEI1pQycb91t3ukgbNigNh0/ew7fw5ssFQDe1LUk1w/8hbSckTGSzAJ31nKjdWoX70/ECB1EhZNU9L3Zt/oqWbOVaaP9xehH1yvp2qmZCZl0etjt3PkShYnXyTN2BP7lPf9Ig7WRNe4JvRdxlztKBO83njymRmKk5V8zze7k+HkStefhXUrZknTw4ygzqtpXTokxsGmWhv5hkJcAxpfWFl/2D1jseb8SYfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=mCGMIR5S0z2gHRieSkNpzzPrBYJFZUjNFf5pbYQNyrR9JHZBjbzvMuRhIWeyLxFUGEMSniNwZYN/C71xu5V1XgKOigkdcxRylUmpNsyDPk/kTnI1IwMK6fQFBZM9rhlxslkA0FpRdNf7CCuPwsJk0SO6p2hkBZhk576SeKEyLLmwwFf8nps+jTrEEia187d5dIOeUWyy5vmgZjv0ugDXoCn5Jh5/Sz1UNP8QMt8ghZctVAHAS2JR6rrm1iSTN9XEoWfxYbRvLK4DuylTiynCjCBGtwYvTBwAG8gOx787XosSE4jOoBQLVfkinz6wD83JiVgn+b8quSamFdODGXZ7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=wSCL7KQD2c57mRX4hvvUg80JnEs2aN4dMMwX3EOzMzMKcB1ajBfahgQuCGEXBvpA4pRh+ulXNX0IBns39BwjFKQ2bdr0YrOZUs/AhlEyOyps27ngi+JMCgftxafy/f5gd6gzWF4uMYui+y7zCaLaVJsEV5RGuLl86w97OT1cSskxzePYQadXePnlKw+wvOydvuvAzNtpozUKWkbUkG0kfLND/hqfFKEYeeqBcXlR/2+OoFLB78rr24Et5GWldzEUJMy5zT7Ind6cMyJjKu06KjHIdOSG820yCR2sEiB05UyYKnsv0exhFOLLzGHpLGWpIaEqKCGMiTtThIpaTXkaDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Sun, 22 Dec
 2024 16:22:56 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 16:22:56 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 2/5] wayland-protocols: Remove inoperative packaging override
Date: Sun, 22 Dec 2024 10:22:31 -0600
Message-ID: <20241222162234.2411262-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
References: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e3fc40-3376-47cd-95e9-08dd22a4e1a2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1IKgZgg5/Mbegpu2sEgxAJahokFi5enXlxoINnFOVDMNyvSQB3AFoPfOCqdw?=
 =?us-ascii?Q?IZ/Hi/MGWpgmdw8XYUmXH8lyqYwyvweo+jtqYAsVJMNhOUfL6sLqu7g1rZDg?=
 =?us-ascii?Q?DHGYcc1XufQd7PMSF2NvD4MKqc17fLK2m8uHagfE7yZCNtTCr/HK0R0minNN?=
 =?us-ascii?Q?hCe/5l8eaCzdJ3iAop/Zam5NbUHLDkhenIzLqT58RH8z4V7OnwLQ45FgW7eD?=
 =?us-ascii?Q?5vZfNfxYmDqCrVlxnzvgCq+nEfvBTTVyRkRqPZ2kR69nWahuBL3uw78aPsnm?=
 =?us-ascii?Q?15BfWhURXoBEOfxqpu50zFmzfGTfpVNtQwZIQflaLFZuyNPtX3wK3ur6eYbG?=
 =?us-ascii?Q?E2mm9HvB8U5T2MQV51o452R8XrVlMdkdULAKvU9lPGk2pZXzZhHLqgRvtb/k?=
 =?us-ascii?Q?7b7BePRdP/EHLQx3ETwIMvVrdTO5cDNut7evIwxSTf0atfUNNzgzHqrUOVkK?=
 =?us-ascii?Q?haYGqYGg4oNxj6G59nnVli+TBsEv/lQZnYnHFVT0XqKuCdMGMhVVS6GCFBDr?=
 =?us-ascii?Q?231/wmgFskWwU65O3rMti8IXx6zX/bQL9Bnc9GxEzhapka7ygl/p5KM0HOLg?=
 =?us-ascii?Q?vdeh4H7BgCV6kZdIq7A03VGJ9acgWHjyVkR2KyIbXbLfR0V4CUXiBp4RWmlt?=
 =?us-ascii?Q?wPm8GqgA8ujb/CAduD7zw3uC566sznK9IMJ3zO698L+sntXN7oG+QRD7m/XQ?=
 =?us-ascii?Q?DOpPEiya6vDd+5xfqQi6w26A3DBfSHn14fV+VZ4p8EjC0F8hhp3iNyOroozK?=
 =?us-ascii?Q?fthaWFPHjRHS/I76IrsIsvPHG6nH5oXWcFR48Y2eN9W1+kXrcqfbVI6xNgdE?=
 =?us-ascii?Q?YX1ae5jlv2mJ+uXQ2kFMfrIHbvE7wQdQlnQpnOyXihfzV3nyd7U6z8snqX7y?=
 =?us-ascii?Q?2ioeiMz5uQrHHeSCmF/W/aoEu8h6QW3k8dj0gmXx6mG7ppx/b0xATCRpLBvd?=
 =?us-ascii?Q?lr4n5mBCN9rVGahREM2ntu+TMwgOyb9U5aofUAATODqnYGJzTvmY9wnTR/Ey?=
 =?us-ascii?Q?W/csn+hF4e6uPr5x/JhGiaAUkCdboTzeT4QE/Xa/gHpxDdXGIg8Hty/CUIEw?=
 =?us-ascii?Q?HeaBQBvuFTL3f4aJg9LPQovpXBih6+LP1IZoicE08bDGp+nrCHd6Pm/LnkS0?=
 =?us-ascii?Q?YJRJj3LkGjseApUbCn49D5owbdl5kVD/P3ylktn8yAPSW2oPGgzDYaFHrl/h?=
 =?us-ascii?Q?JaudQSdrmbKgs1lF5t1VCdTuLQqeT2b3Uhg+e3WaZd8syx/s69ysrXCZvXN4?=
 =?us-ascii?Q?s31iDpTglB3g+ZPQ44pq6MLk1ZkIXakXKfX66OXTXo/mGlcnPW8G4KXoAO6j?=
 =?us-ascii?Q?N6W14elj5QvJmw5IrLr6ttrP0gf59WE06KV9OeG9UIxy5ynjQ366D/GIB4AI?=
 =?us-ascii?Q?LrkSuY1vlmDb05oMAQPTG59ooSvijN9kURYNX3P6t5SDC11ZlX3Mcv1NHY28?=
 =?us-ascii?Q?LTrP5ecEnGBXgprtFyOt9nNr9xRsazP2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tBtK8/V5k2GQVEFIvwTkrJsChKleIHB8Ilx4vnd1XHv7efnAFgMr+EMzKs+s?=
 =?us-ascii?Q?ZYJASb27NhlDmyFidGe6W034MwCyiPetmLKfSbvlYgeLdqKcZwcWFUZz1YeM?=
 =?us-ascii?Q?SQBjVVsb0zL+8T2zF4eYR8tXad7IOqPpIk2XeVqYc9zg1DHt2iGdmqwEYEEN?=
 =?us-ascii?Q?rzvQFbR7pf9hFyNQ1Uphj/uVv5vwKlICKei2tdqaiXgqT/0l56YL+dk0nuXo?=
 =?us-ascii?Q?ooWSHICXJ8VE5h8sRHLp094DJ/o/RhrHmrgD0JWuXzembEEx9o609oCj8M0t?=
 =?us-ascii?Q?+JsOGezsVAqqYErkJ4GDaZAWKnKi6/tT0kfQXNVTJQCVZeEy4HBnKGmmCYTa?=
 =?us-ascii?Q?uoqK36lNHsKrZZe7gecmo6u+CG/7dMLFHdK+xSyCV5lUMx/EgRx1DJZVyg5r?=
 =?us-ascii?Q?mEMXgFyt9wYTL9KW1/jbOZzslNMOuOnDuibrK+UrGYSh/59NqHNkRe3iz8Fz?=
 =?us-ascii?Q?kxA4U3lMrrhNWWyhDL3WOvbIyUaeN/MQh3oHWygwdeoX83eiue46MOpAaqDo?=
 =?us-ascii?Q?9h+0TXjkG53eGyKevOgHdoYI/obvyFGZkQfovd2tKgkHwJZz1A+OPqTsHkAV?=
 =?us-ascii?Q?ptk9x6IXemhtR6LTlB+MPJs1FxXXfMvALd3w7oD8F4UfyfKrqGJIK7Vgsz7S?=
 =?us-ascii?Q?uiG8i26+PS9YnVRNSwmfH+xkCkjs5mUsaKRDwzojnia0xTyW0mikTc0N9v4H?=
 =?us-ascii?Q?GyyLQKk0JsMfygLl+YuxV4OaHW8z/n6RMTXp7+bRPsTridLU34Q7VtODRp88?=
 =?us-ascii?Q?PjneMgMtxOAxyHatHgCcCUYE5bRhZRGH7s6+hWyoTLRS24BmN0O7QpLQToLt?=
 =?us-ascii?Q?jND8bKzoV0FSCDR36MCoYWLlEYaqwQhxt23UBrhqTx8a9iHOsOYX099Xe+/n?=
 =?us-ascii?Q?uiuRhXsRn4L+jN1J+ANHL2nnNf53Uz99xqqCMEInTwnLHvu0RDmVaxztbT+2?=
 =?us-ascii?Q?cgUHz1mGQlUB3QQLUKjFWql/0X3Z5ouk6cb7g9TtMojL+iLswWpV13NGpTAs?=
 =?us-ascii?Q?UNcfbUNnktxTVEwnjAxe8h6sX84WYY5IvDXG/UoNmACcWWRZK9uD23MzlRfm?=
 =?us-ascii?Q?R/yOSZ6wsHwvBxtE+nZLdckW78ONGlg2BY2fefA6uQSGFeir2V2KYja3F6la?=
 =?us-ascii?Q?9bQHwHqG0TbKCmZozMLBS3qn0+aVSqOirW9I8mYEm7r4gAArS3WZ+SqdufRI?=
 =?us-ascii?Q?43Up3lN/aiy3UO65FQoH1q1fF2J0E9f39sjo++zq/987du9NnIqfq0ZLyeuM?=
 =?us-ascii?Q?VdCojj0vvs7whjni/lOK0WaLZ4AKm4BCxCfrw5I0EtFsDlX7x9pFDhRP1ry7?=
 =?us-ascii?Q?sUsK13X7M7kcDh9N4bA1gtGXAytIojuyrF/7MD7f8B2wTZ0RF/orKbj/6teJ?=
 =?us-ascii?Q?L6J6A21oy0kZZb9Kg+nngnl9OYJynIpQBS+EfTRwu90WvhfV5wyCpfpXjVch?=
 =?us-ascii?Q?ONzAYDOeULblQD0E04PCQwIOH7qSIdtEvc9VMF17bfFbhdSnYDPu7KFcnhUR?=
 =?us-ascii?Q?ZvFSrbONRmKzusLtDJqjdgM8ZEyWEvFWpvQ6pHfRR3wHMDHAwHaZMp4hEIJP?=
 =?us-ascii?Q?05WT4RRSxlbGCT+j3hOThNtaF5Xy8DoISaZgscTD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e3fc40-3376-47cd-95e9-08dd22a4e1a2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 16:22:51.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7pAiXeH8TNUH+J5YWR+M+7C8Sjf69mMM5kobvVivTYWKVrx4j+0s1yjlKN9mYZA49Z5Y46Q3LaxcWRollYASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209009

The upgrade to 1.38 re-enables the dev package [1]. With the dev
package enabled, the file wayland-protocol.pc is filtered by default
into the dev package, and the override adding it to the main package
does nothing and is not needed.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.38.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.38.bb
index 3e628ab113..be6b732b1a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
@@ -21,7 +21,5 @@ inherit meson pkgconfig allarch
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-FILES:${PN} +=3D "${datadir}/pkgconfig/wayland-protocols.pc"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


