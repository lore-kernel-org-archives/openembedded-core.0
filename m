Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F423E7718C
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:22:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web11.140245.1734646917684260218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 14:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=X+3HNfHD;
 spf=pass (domain: oss.nxp.com, ip: 40.107.104.41, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqjXJW1HrUJtjmnqqQi/0X8GthEd1MOEdB8KttrNKmVlqpbKXfqmcEHaaBKp6pnHb2steFeOIln7ehTPQrwXrrIdx2Yd4zm7GkRotlXV5e4nrB2o9hnaHa9zQ6kIzUBGpKiLH9gnAU4SMcD3oRlLwx/1c7vQXa0mXRHZTk3GGxE8hRrxqBGpGv4PBi8B2rxg3vkQjPqpDB7ETl8tNpW1dz0lctJaj+3EmS+en+u9oVv/9vTnshea2nC4c1VWrwJNz8G4+rCJrLwNkGgEXanl5OTgpYa8bsxgL53TZjlGvRJFHEEuj+rOZBcyspTcr0+1gJsPqdvBfP4ZvZaF6nXv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHp9lvRylv77ovUN4YKmXnEq1FNXNp/8wwFyUgnkCuk=;
 b=H8w+biiNYvzi+t0mZzKHhnPLs0OZBmnF/giuBjN0PgPGPgghI821Zc2vesg3N/CM37v0O0gayuVRQ3W1OMzJG1VTb7vPzO5N1uDStXhAoVOfMpzR+d9Kr0wPqvtB7CafqQfo7gV/+qBbJeSrwyNsdL1ya6yt+dxFsbScWldJJYcZFrucbyIZaxEJlCTOxfRNlTam6H1CNlIU2bxbSNcGXmHMKDrOSUc3s0Fdxv9fK35tqfBxEqOrOrh1Pdl5RAdeisS6UvTeE4ecrN1FZHNu2d16A4NWRTEBx7wvn3SD9uEfKfq7shisgnsg6Ii/+rqQrtxPF2BFtiRfDk8dGNHwJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHp9lvRylv77ovUN4YKmXnEq1FNXNp/8wwFyUgnkCuk=;
 b=X+3HNfHDYjJJPswZ1znZN0Btsm17ulVocX5xxku6o99rEv7532tDgArWMqc+7sx2vvbOvaV7A6YXb52K09Yi2MaR06isXOqN5MtAvBYBlPNZBfJpS6mlW5fcHm2yeRRWzivgrLzwmYL73tgEW8DdEUhpGkd9SlnKJBeujBotOjWx8yZcTPGYs0vESRKjfbtlvndSyP1fHLvUnKlNaD9GDzgOGjVD1c+RIiLUC8xmuxCgKBagi55Vs6x7S91nJVAKPS6se65iw4vLz26QvFoxyKNP+/LocboQ6f7UoTlI/7FmxHBrX4zaoD/Hhpw6vY7PMgVnbsw9qOGy1A/1NDKEIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 22:21:57 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:21:57 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH 4/4] weston: Add xcb-util-cursor dependency
Date: Thu, 19 Dec 2024 16:21:20 -0600
Message-ID: <20241219222120.1188742-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: d3edca03-7df4-4a2a-696a-08dd207b8d01
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ob6fBLzZYgxw3HNu9mt1AKhpjbDr4fujfnr7GO4xdC+rf3DxUz6WSGK30gNL?=
 =?us-ascii?Q?V0137YBcVhMGEtW2aRPI2WPlIBXc4nJEx5aDRzGliZHZPoYiZgNjcsmNNfeA?=
 =?us-ascii?Q?D9sRia+lq3bp2kzDi5H39swm/wK4AYX8cSE/0uySYtQ4t8T4fNLXLnaeBpSk?=
 =?us-ascii?Q?XVdzDIvC7FjKirMA9y5ADAiLxjr+1YlTPiViNrl6uiSEoDY6+4ReDPYo/gcy?=
 =?us-ascii?Q?19zn84cgEjVFSkjmRt4pT36gxmOi74YFFNXjAF3Vqf5sQotk6J0aU0ed8QPl?=
 =?us-ascii?Q?Vm/zPSQ3XbrTQ6yiwr2EmxgdllyvYRmAkKvf/fVr8ufJoSR9GfaCerxuk44P?=
 =?us-ascii?Q?OjCsQgkB3ANGmj/5yyulIw3NAPdifsSyFS9zh4XF6SbY/bdcoRFbs4nhwBDL?=
 =?us-ascii?Q?MKQLkTC+zHtbDUFoGEycieEj4H5BzDhtTZuCli4xvaiMq6HmPgUiYfz9CyRz?=
 =?us-ascii?Q?FfJaF2SMVOpmSAFMZI/Lo3Pg6Jxy7WEfKOfr3BO+QdJQeVxoKrBm1ZZ0IBqB?=
 =?us-ascii?Q?s5xWYFxIy7S8iqQDTCnyed8pLpT4LIOPpZNJlGiWeZDeWTTCeiMQntS6W5vW?=
 =?us-ascii?Q?ejmfClGiCB9plAerrd5cCXMeraqsQLrjzMlhJE468fv0shkyuMt+408QmDGu?=
 =?us-ascii?Q?BfcuJ10GUB1ltOAg4dX7zaHqM98mkGDBS49sk/CwBrX8aXGgL2jqPQln6mlf?=
 =?us-ascii?Q?bAHiVjGI9M0i3M9QpFNxfpUvqfGndZr5kPRigTDAjYw5J3j07LYOZhd6/bKN?=
 =?us-ascii?Q?bajDNYxMPOWVjnIVjkSQN6yMyegQY3MOb7ChjybCvPqVDzCwCAaff+cDSl0K?=
 =?us-ascii?Q?jnp4ImckYSB97ft26OwisVcFc5Lz27Pdo6nlhKfrweYu0/Iqr5+uey3h9lux?=
 =?us-ascii?Q?i9MY2jxohHhImh6WvTLMZvz6bb8XOwaSp03yxvFH1V+Bs7K4GAxNWoFXg9lu?=
 =?us-ascii?Q?8BgcpC2GpALkwnd/aQSbwwPcxoRsXbq0dmbC63fasxHM+QchMLgoEES7Eoih?=
 =?us-ascii?Q?8hmEBMgGFFRp7Hi53/5kU1vF7GkyJLILKbiV6ZNw2TAofKTPmaptzPJnwj62?=
 =?us-ascii?Q?LdFmqQgW97JgJD+a0ef5x4hGxi+oKor+qEdNxfqesmA4JptyIl6wGYBY0Gzv?=
 =?us-ascii?Q?uZAFnPzBC8no4pEich9VmlMDgo7RaKNYG9vHSKoj7Hw2SiK1XeHwA4PiOwmS?=
 =?us-ascii?Q?fNEbr0CcDiPsxEmgiSlu7976UTxK1OvwxywRZSkC1/ztngghvrO34LIStsds?=
 =?us-ascii?Q?DL12X3Gr5PT/ZtJOS/4ouvGdj8ThaJgu0KKGgfo2lHN0Ng1eVEeFjotIxDL9?=
 =?us-ascii?Q?WMmLoDimbJlwGUyjTXVVLl1HeBCeytHlxDehtLMOxJgCuL+AaVKbs3EajBng?=
 =?us-ascii?Q?n90IPPEPQ+1nYkLeKwXU5SPwqYKTe4vdUmVE0XnA9wXnnn9TXSoqzJPffjPg?=
 =?us-ascii?Q?eeStpDX2pJRVG77oH2kKX6ZxvBkU0abU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DbYGp2N6DRNPUo0/vgAiwOc0AEZyeZiTMifvfGKfuHAGOSa8VXoAc4pBTCnv?=
 =?us-ascii?Q?A5pLyzTjPAjzZVGlTO5/JYH9Z3t4Dvp95f/Iz9hPBpfmkPqBvnfQEJOY2b1J?=
 =?us-ascii?Q?UyTXrrBDPUHaXvag94HLPuFjSaOnX1Y0TZwVn6lrj68Idh5+bBpd++8mmvgI?=
 =?us-ascii?Q?UvuIgvpXsM/QGiVvURc2Sgjh2c31q85h06bxKH2y+BBZPtFU6H7nj9TkXTeY?=
 =?us-ascii?Q?4XihRIraNhOgIKg7ZeOswJ4wb7BHvpKcdeY4ipU5o4Aldn40a+B6bpb9y3gV?=
 =?us-ascii?Q?0SqjQkPV4PDp6OhXgKg/ijCmszcjPlU++6Y+QZ+1rhAO7CzRoxsu1WITb328?=
 =?us-ascii?Q?fk25ro4DaNufj0BcRndT22wpEGZO7Rnf2Y84raxX4lRNg2m/D15dtOgcQVwN?=
 =?us-ascii?Q?XWSRuA1huo43Cy4IOz7I5TmdeCq6SdaMnvbVSnhB7W8kjked371hVE2wqFTi?=
 =?us-ascii?Q?+jbmC+uPpfiTPqzbf7p+pcp5DK/s3LPez0YcRSRdcKcnCwyZ7Y09/cUd/yOi?=
 =?us-ascii?Q?7jtwUd2fmitb32SAgn3m20uZl0Ng7I7L50i37k3CaBzRVWa3DYTGTguVBuDw?=
 =?us-ascii?Q?TfrFFAtr7EYV/dDRtnaiZazWozcgJn09AnEr8tYEi489abyczBZcNcqtmYRo?=
 =?us-ascii?Q?8mgPEBNJau4sdBeJyud3zldiZ73fuY6LjkjrK6Y+AlU6XJsl55np4oJisi5L?=
 =?us-ascii?Q?yo3iVSe4YpVerZ4q398MRBD38JGH/R7ncGFqJHoxncS+TuKKXa2lOzz6iD1I?=
 =?us-ascii?Q?BjvCYgZYfnPw5YedPTTmmeIYk5AipC6xxCZe11+vG5vQbJh/3BobLHN1gfZP?=
 =?us-ascii?Q?z81WOqFkQHMufsjEXjzc8At9Mn7V9q8dG1yBHndkQg+1Uc2fuEdNtB11s51X?=
 =?us-ascii?Q?E85bHofltLlrpFkFffOCrMTaROftyGz4AFid5DIrRSQouNzXBTsVIitB3wun?=
 =?us-ascii?Q?XWU8DQdAWb670p7593mcaFb87moOE1j1BoDf797j5C1CkTu+pc7MZhx7LdaQ?=
 =?us-ascii?Q?tJzmavEvBrw7szovHV8hazUKJOauO2sQjyM7tI4vJUXHXF0D6RygrVnr070Q?=
 =?us-ascii?Q?T0ewxTxt2MsyNyDrXFsF3HEWt2Qthgzs7+X7jKOzV9KoFaQvXljIz11MMD1j?=
 =?us-ascii?Q?A4j30XNMxy76e2kXs359InLv3/ulOpryV8cPYezuYWiM2mmZCWz7BL1Xq7v+?=
 =?us-ascii?Q?Ht2BSvQBlxl5DB96q9+4evQajin/o7sKSoYf2jijbUX/X5rck1G/zV8LRemS?=
 =?us-ascii?Q?zlJXkddtKu0ZmV7vTqkyIOKX9KXPXUBNFivULFAd+QO+qResp50dvCNp+nIh?=
 =?us-ascii?Q?4hf5Vue61sdtrcGbjX4e62zXBHZ/8r3T6G80GaVJIRx8m3u/228hbL0GN3+a?=
 =?us-ascii?Q?sEW99FOzAkhnlKEDPXZ4gz7hcCF9TuQcvSczM/KsYqBTfQwA7diXl14FNK2g?=
 =?us-ascii?Q?kveIUbYPJtalc76RF/jU8ZTww0IZ4HRiXDgQdna6X8z4vcX1xrHlyj0gf62M?=
 =?us-ascii?Q?XUXjax2Hh5okE7z8cFWSom5WKtqOghc8Y2fav2qoZkMAxDPRsxmcTcwJStUO?=
 =?us-ascii?Q?+mO8GPK/8tCZfbTZlPBamQuoOeV+zvygS6S6jbEwmaSUfSj2M0CgF73DzCXu?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3edca03-7df4-4a2a-696a-08dd207b8d01
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:21:57.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYANFggYl3QwQftsL6CQiMvlHIHFDhM2W04SI9IW8mwYgpAhX3WTBxhpemvlbGbuyi5QHYe5kxhXjoweYUPxCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208962

Building weston with core-image-weston SDK fails:
```
Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)

tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor req=
uired for running xwayland tests
```

Fixed by adding xcb-util-cursor as runtime dependency.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 4cb0ca4d5f..bcdd77bf67 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -72,7 +72,7 @@ PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=
=3Dfalse,libwebp"
 # Weston with systemd support
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd dbu=
s"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xcb-util-cursor xwayland"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xcb-util-cursor xwayland,xcb-util-cursor"
 # Clients support
 PACKAGECONFIG[clients] =3D "-Dsimple-clients=3D${SIMPLECLIENTS} -Ddemo-cli=
ents=3Dtrue,-Dsimple-clients=3D -Ddemo-clients=3Dfalse"
 # Virtual remote output with GStreamer on DRM backend
--=20
2.34.1


