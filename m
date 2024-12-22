Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6283AE77190
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:23:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.27158.1734884579574530729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=l6napOmT;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.46, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2wcx/afXwzTg6d14JesG5HXAGuBMiXlE3EqvsHwNaGr3F1qNkSRaHP/li2uElzYO1AaHIM4q1S4DqIw8fw+e/tcwjQKW5kWKlyDOIWPvxmXeikRf1rar2u4yn7XpeSRDq0S3CzvmzCFtNAyZ8RM0nsgaYX37x/+TeCwVKZv8he8nwJ+2zCrcujbTbVUXcJvqAYDarnDCYMDdVU9Y40rh3vRu2u3Qgi2QlytnKcyOZ9xZhOw0uqQAo0wnau/NiVGnVb7UXa75m1DoFSgnSjLd/QKSX6B9uiVUA5bbdakcp+6flh6q8nH00pNFTyNUkSZLMjxweAz6D39Yru8JPa9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=Ii3mSif2heXKAblFM/zPT916Lh8Uoh1a7B4i149906J8jB+5NVBKyModkg885HjNWjB3F31QK+tKU08Pth3K9W+L57yVroOxCzEUJNaPTBdwx5qaFdyLBjA8vJuIXp2hmFeAV/BkXvztDqF3UDT4Na2fP3EqnRATWm+RoaSn9R3x1yPR/mjudnyhESzQAZn9WCmPIVjB0HD0o0FEd/hupzjV4HRoQHBb47m41cF8kSCbn72O/pgZKB9pnhiW9gWtZ5TjWRSYAALhM7sbEy4rrYBgZcdtmMVBnwLO11bigUyIgwxdd/kmq3r0v5vwpw8hXtTgQy8uaG86fD6+ehDiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=l6napOmTPnhkN+zD4J0+yYDHtYmZr91Wa9JqYgEsjk1HdZk6kfForhLsYkkH0FHoynP8sCYzgc7S7bJ3Nj6rnHxi8Xuyx3wMD4vZGfbz8B8iEbxuvizm7U/4EkkLEP78v45ADRgO9ghh37zoMVH4z1Ov/wAKjXPmV1A03VSDv0VUs+fCZfog+85AR5zpxpo9bVMG06hq6XXvo16vJcevb9Bpaeu4teuTHRn8N/fqtqe/CZQxAVOv/alv9Wpuq4WAs5m0/kimIMzPAKVkTkT9KQX5cHQk9sBy37EG8+CqnfnaymwOfEwU1gbsThB93fA5bNJ86vxqj16AFZS2A+FOdg==
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
Subject: [PATCH v3 3/5] weston: Fix wayland-protocols dependency
Date: Sun, 22 Dec 2024 10:22:32 -0600
Message-ID: <20241222162234.2411262-3-tom.hochstein@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: db4bda44-4f98-46d9-1891-08dd22a4e23b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DX9jWYyKY2tXooibXW1zzIi8+SgtgAzobRAucLvM7skaBFd7MqId7QznyzYq?=
 =?us-ascii?Q?7xHw7GXGa0tLeDGxZk/b3C6wTBZn6me5jMTlVoNawiNAtgcIp7C2qxeAIB5F?=
 =?us-ascii?Q?+nWRK/GmCWe5LzFfx6hWsJ2ToeGfb8ZG9nl9mlE4i2c86nmvQMpfPJKhLqiu?=
 =?us-ascii?Q?TtfFQTJXKxD7uXPpCuTWP6ihd7bSogfS0j5GoM/I9AuHegzrWYrSncHLm9d9?=
 =?us-ascii?Q?UOl6v090FtS4KniuGioJlZTyuNLjJUdNctCnLRo9aE46AID+AP92zqaS2ptg?=
 =?us-ascii?Q?eDteHzSVIiru3fkjWJlcQlylWJbZLQ9BbyhJlP7KHy0BdiBmIk/q8Q9866ek?=
 =?us-ascii?Q?TQQ9QRq0w6l4XrFi0CyH1kNxLw95IEaaE0b/BHP5+CrVutT+jbXyPmcEQ6mC?=
 =?us-ascii?Q?qDsdVckadDUXc4aSk3w6Gbf+t2tlIJKSGo5A5LhlkmazLgx8O7Fjaf+kTKUh?=
 =?us-ascii?Q?MsqEMIncNYUkC8L+umWP04gHi8pq1dowQ4Ct5fiixsQFLDors8RLSUNU2ic0?=
 =?us-ascii?Q?mSWWANuFVWOgpTeHYlHo5E5aWkypmw6YqqSGcEV1RWDGLwT/lsmS7s//78MO?=
 =?us-ascii?Q?emz/I5Zy8vTr2Cvc/5vPNd2HDpa+UWH/XdPOuaLA6srTzNFoVZINcwOIjfPw?=
 =?us-ascii?Q?li6Em4k6CxlomtzU68+qeVrb9JElW0/bo9aPvlRx6PDFS2AL2zSNzCs1opht?=
 =?us-ascii?Q?ReerRT5yA4nO0YmFyTTwZ7y++vACW4ce5fq3qPUuOqi0GUaJSuUJ6UZeNtHq?=
 =?us-ascii?Q?8vbW8ABBhfNRfFRQ+/EG2zVKx2M03nCR+uoLZ5/k3rymYlkN+rbHDQE4bmKG?=
 =?us-ascii?Q?63pRSrx0vHloV/3zfhKryXeD14w241Tw3TuE06SPBtCigsRiEsLcABmeW+xd?=
 =?us-ascii?Q?y7ENMfHCskxsX++rncv9aQ7i3dB+zr8CLae/eIoCw3zYsCK02JCGyCm9Omxb?=
 =?us-ascii?Q?uU67RtMJrM7XKuqiGc5FuaDe+OvbDV6/OT+3RVPmO3mU1gcCPUYO3AoDK3AM?=
 =?us-ascii?Q?GZkEqvapDPMR1yADRaIS35gaei5w4l1IVs7h/d+SsW3bCkCPCCsI4ndVRYif?=
 =?us-ascii?Q?wuS3Ix59MIS+b1q2tMZjE7XgKqp+VCaTnt8MgDi9p1F7km+szgEd2eDDAYkd?=
 =?us-ascii?Q?CJtj/fmzw43AATfdH4dvlEUJ80gFUa2F0MiT0rDsJICGUZyUIqHHOQ7NG/Mq?=
 =?us-ascii?Q?9V6xX27GK8vcqj8FGjL1hEw2N0rQvC5pWzoO5RHfNFSrV8FI+Q6xPR8UwEfD?=
 =?us-ascii?Q?qHsmDX9WI1U54GiwAz//PO6zys+MJwx4QQEFOb5j60zdCjMKIrk4HXTfV7/g?=
 =?us-ascii?Q?BqRdlzWirJeLZVGiO//P8kk3eOXtnWDTg7uLBlo4w4G1iGHnmVYO0ajEQ7dH?=
 =?us-ascii?Q?LSKASrkpzoBoDPrEL6LbKYb70tUrV/Kx5hwBvlw9vrVfT1EoJydupfAhuumA?=
 =?us-ascii?Q?jgIVRv4INbQv70zjOn4Nq2rbR5k350Hz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bnF1waApE1QwWzau5q9DLKZyDiKmoX2rllvsBmmkS/v6thHKhhU+pdE6NXp7?=
 =?us-ascii?Q?2u080h40R4pc1Iyo85n22UKQiZAXgxSJO4/STmw23aL+v0rUili3oDq6DLts?=
 =?us-ascii?Q?z3NdGJgEzV/mWi3PUfORdw9/zjNIq4R5Jl6bzHlQXKk+ofFSWxXPshoawlMr?=
 =?us-ascii?Q?wV2seKjFJftG+j2KMel+QlMa32EV7m8WP/qgyfXZT7pYMwDRywsIfmdg1mqt?=
 =?us-ascii?Q?89CTdFu8Ub71ivQvt9cmB2pMplwpNkhc+Nn9F+q9riHshOPjrPqD6uuhiGj6?=
 =?us-ascii?Q?hTCsy6AouWxaBuLj1jAVsEqNMhdPu8n5T/3eyvqHAqd5vUISmVkfN9Mu4FBb?=
 =?us-ascii?Q?LSHKetcEj1UTJuiGBqnZ9yXcJYWdOFaEDFUj9fNvBEUrKUYsEGKMbfthsjzj?=
 =?us-ascii?Q?kX0trtw+hrfkg7pSwkjYEpjdW07hQ77wpDLrolQCudyicc/Juz0ivJX5PZA5?=
 =?us-ascii?Q?1M8of0wv6tIBALd1UHbfixFS04OEpmh0C5Oy3cLFDVAN4zEB6NL3gHUV0hPP?=
 =?us-ascii?Q?mPDlfmtnbrYk5MAAaxaG8QksFRTuMzDbqwMZEgqO9esI7C/naLcLawsxasaa?=
 =?us-ascii?Q?9uV4Kyp7tqZAflb2CdPs3D56et7VeA3HCbNv193CSWo52yh4TImlkJmdJCfA?=
 =?us-ascii?Q?9tLwH6fmiT5XvVcm62/a4pC3dbDZPrLS7mPdeax0r/p0tVINCUXKHdSJC9g+?=
 =?us-ascii?Q?/Ejg3qd9GiWNSVOB3p6rZEsl6BWVT4fN6LykOMAcnVQYudj6bj+EAvKaDGBM?=
 =?us-ascii?Q?xgdrXzsjwWRiB1YIQ5IXWgkZ+qxwVQgk6e1QOEnL5+YDjK7m48Dd9HMs0mHT?=
 =?us-ascii?Q?GY5SvTiTAq94BcSljTe3fsNaNphy8CryR4LZJdUVn3nqbCK408jYoJWJpX2h?=
 =?us-ascii?Q?ssj3iVbs7Q5j1ikG2qKcKJeLEdoFkMRKkfKh8WiFSCyz70ioq+OGYZxsGSAf?=
 =?us-ascii?Q?OTwCg96ef1Tu6S06hHlBm6KvdMc4YYgBkqWbxjKeUG5ThVS9thbINqWw9bj/?=
 =?us-ascii?Q?JXuN2MiwS+wDjzmfLPW79IPPzWiL9UXI9q6WUB/7BC+orlJP0hTOvoRXg4eT?=
 =?us-ascii?Q?eQ80NoV9pEEnxxCOq1zZVT8XFj2ATa99G7/RIo5uSBfRld7uMoqGeIPejfGE?=
 =?us-ascii?Q?iTdQFsgqXwUlD8/cY2R2r58VVleSm0FxLkKxhJjiLN3ZdwVAJ3prulEiKzpv?=
 =?us-ascii?Q?ry2jJn6qolj2H2tCNb/L3mzsjtoIg1f2sDnsdcZN5LpLYTT3MkWvE5uAsmlk?=
 =?us-ascii?Q?fEszfPD0skhMbEhxCAg/00Wk970xA8VGqTUTCO3esm4h9h5OXTYFyBbto69X?=
 =?us-ascii?Q?FaI1QhKzF4/lU3Owzdy/6Et+3HxIx1DSvW8d1yB7WyQPmGJSu2EnF8Ozs3js?=
 =?us-ascii?Q?BaayXvi5M8W138en3wZLGBhOBVH8qsZ4X2a/magxfoXHZOyr9vt46Ay7S/tz?=
 =?us-ascii?Q?KDxlO+SsdTb8F2BIwg0+L7dowFo0iZ0Bez6xlwH3E5U8vxbXP3YGePUua+TG?=
 =?us-ascii?Q?yDQx3HnzVUsPUdsxgEJfRgRulFoA7EXzhDPp7HO2PYYF4wJrtJrXeu2cyI+B?=
 =?us-ascii?Q?GGqVzzf8U37xbVvmtiTV7JM/KneAZ2d7RwPWmoM8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4bda44-4f98-46d9-1891-08dd22a4e23b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 16:22:52.4248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKhDUOI8BRQOa/FEwRb07pKrTYYYf4J8YamQktITXCERu6mn5Ndb/4C+ni0Q/78hPtDPmwkXqQqYALBiKjgZuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209008

An SDK build of weston fails:
```
Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)
```

The file wayland-protocols.pc is missing in the SDK. This is traced to
the upgrade of wayland-protocols to 1.38 [1], which re-enables the dev
package, which moves wayland-protocols.pc to wayland-protocols-dev.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 50749d7d15..4cb0ca4d5f 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -137,7 +137,7 @@ RDEPENDS:${PN}-xwayland +=3D "xwayland"
=20
 RDEPENDS:${PN} +=3D "xkeyboard-config"
 RRECOMMENDS:${PN} =3D "weston-init liberation-fonts"
-RRECOMMENDS:${PN}-dev +=3D "wayland-protocols"
+RDEPENDS:${PN}-dev +=3D "wayland-protocols-dev"
=20
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM:${PN} =3D "--system weston-launch"
--=20
2.34.1


