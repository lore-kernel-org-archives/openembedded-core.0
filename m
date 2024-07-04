Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813BDC3271F
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 19:18:32 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.96])
 by mx.groups.io with SMTP id smtpd.web10.2674.1720120706565838492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 12:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=II1nEIEU;
 spf=pass (domain: navimatix.de, ip: 40.107.241.96, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRoOW8Ps2xIRCUAzFF47rrx/6VhVdSlFTFKCmid3XmM0zYEFpdUglyUg3KMDjRcxnFj/lXPgDQEaLH6NEMtdasH6gAm5HiGKZo72A4InpJDef9mWMBifWESGDp9t5BGHZNEzBBjPv1toJkhvQPSFgG+Oe5/BuqBg/22xxGf4Y7RtL5WYcjLAAQ4PZ5m+bm7RUwynxnJFfSClW1fSOGSrKxiODWTskAMyNPUAwVaNQFIiBdESpVE0jmc6IWb8ND+PgZlNq5h+/8xRlR3OyaYOapwvy3X0dFQjRqZjxpqND6aekXMSmMec4C3gU5+O1nCn2cZBHPIC+4Vd4zbqW22qeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfWAdk4ydZ0Iq1l503u1bzell4DpqfM5Gr3viUwN93I=;
 b=SZCwhnd9LplqlI0rlX1XA9uzOCZXkNcv0H3OxgtzmhtiCtYNWEaEHQ2dhHaCgOu/N5hx58K8rzGOlDbxNTAH/J6DrjPVx4CrPfmAs7OyN0MrO+eJWMMp/+W4FTvASB7R+T6qbSOhRqDXpJq4rTI5qgGx8juJiOFdkghvZ8L52TbY2J7vBBx4dBgqsftOMA4t8iBL7n0D/uly1yRwz4QykNldIHBSzGgH07A9tSOZviI9WIynHVkhqNhp32wd4T+oDCH3g8G1URukQpulpW7bMKo0+QAVGjYOjDnTMc5fmh2aRC3DeatRsW04+rkUNGQhH9i9lPccIGHJNqzgFD2VtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfWAdk4ydZ0Iq1l503u1bzell4DpqfM5Gr3viUwN93I=;
 b=II1nEIEUT/+WL3mvABOyogCHMlBgO5ggj6lu1OAyQFGszZA9Y/mB9mxZPWoYGPmzlP5u/BtYTNRxeaf+anfvcmCkYSy54ncsDo2ojmklzRA7zXZ3YngJI9v0bWNGNlPKcz0GGTUbm8viTUDgWanUnjW5wZHPd0NeSfZRejZZXdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PR3PR01MB6586.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:62::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Thu, 4 Jul
 2024 19:18:22 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Thu, 4 Jul 2024
 19:18:22 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] u-boot: do not pass O=$B, if $B = $S
Date: Thu,  4 Jul 2024 21:18:08 +0200
Message-ID: <9e5273afdef2797f48970927998cd5f6d5b1e63f.1720120588.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::7) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PR3PR01MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab44f6f-2dd4-4930-2d40-08dc9c5e11fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5Nl+Vo57YS9ceFF0Wmy9XD/rbfrQs0BaVCek0ho9tF+AuVhlhvuqyRUhknvo?=
 =?us-ascii?Q?DeJH9459abkXG88b5EadpUMmzQAypkp7GR1d0TUW83iipDIWfkANCyxFmt87?=
 =?us-ascii?Q?PbGm02e0D+ufk83EFdeMbG3Q+Ian/TkA4496m9NEDLQJxMPARiFqwsczqYtf?=
 =?us-ascii?Q?hhZATXNbe4Y5sCEi/VYdA9m54/9gjTs5yswocMBWRRX8M2KKq0p4TQs6JO6C?=
 =?us-ascii?Q?BvNmfD5BXr4S9s4yJKItyH20UCrZkeTDIq+dFYudZ2Oapd/dgU/Wz38VnR+s?=
 =?us-ascii?Q?Crx/dQ6CLBNN9EJ8beZMqHO0mK8k5hI8X+hr9XPYd1u4CWE+WHhUcp//Cr2W?=
 =?us-ascii?Q?RafZeYSKoJSdDttAHSP+Ea7AD+cdpetm06zQaZgbcj7Q1b6R5q48Y9EmwnKj?=
 =?us-ascii?Q?EBqemHI3G1Hyt4XhMkFGsTg2S0TjicV6lcgLsIEXnnO2mTZBWYd/eCyctDE6?=
 =?us-ascii?Q?bbU2xewjgn/PUvsEd7BUI0fkn3QAw36H3TGBbT+l17Qi6VwMktFdtqlSk+QR?=
 =?us-ascii?Q?KS6puvgj2EhGZZ1C6ne0lrPC6mmI9Ca6E/YcKRiAytUCwHEZqAaFqnPunbmj?=
 =?us-ascii?Q?Y4HYKu34pBGKRPfZ/XlAmxmMiSWWBjXX2eDg2+wuiKVavRPGz4HUpNyWlxLB?=
 =?us-ascii?Q?PmXf5jgWOKgmhlT4BrYtjMESYEmbsL+m0xWR7tUg9TRsL8XNNJeOQgJmWpyI?=
 =?us-ascii?Q?DxKocWLO29q6OQ8G6wpVOeGOgUagr7BviVFKh0YOTh28pvyAPwVuGdElq8iJ?=
 =?us-ascii?Q?SAOCa439ngwXddbwY2022FlG74WP+avo0TKWYqLajQB4N7GE+Rq6HhzAy315?=
 =?us-ascii?Q?TOfVh437gX6nTy4vQfUE8iMgyYqy6JzbDQuIsP1dUq9bXi62nBUgVBnzRTe8?=
 =?us-ascii?Q?cxRZTU6Mvxoh441A6Ix2U9nSurVTnMVwaGMXz/S9H1EZ7KIoOV6FJ1dsYrcg?=
 =?us-ascii?Q?prsoSxVK4BJhASmN53+R5ShWspen0Hp/pPDQbeyS6nPHio03lTJDtypzvrTm?=
 =?us-ascii?Q?Ol9HXlBBFNKC5NytcVi7ueQ2wQNnzW7lkNeGCHqjj35alNFXgpyLyDuWHlcu?=
 =?us-ascii?Q?nyY+i3/JRGaLZ3KvGADrQOwO5fGflCOGMyfAlqVOC2LA+jfehWq2Sya3pTWe?=
 =?us-ascii?Q?xbeexFUMKIReS5Hy4BdK/SC6wHoVyOAhuQvlwHU6lSJlnUb5A/bQUIcJME6j?=
 =?us-ascii?Q?lkFSslUPlZ0xrQOi4kmx4993xpymfSJLV92QjAPNsAdV5+AW8krdGWNXlzFU?=
 =?us-ascii?Q?4bYZHhS5XPoHTQtQxJPpHPQcTnQmzQFKShjtyjXqbgIzn0wywXMA+pMCNCHd?=
 =?us-ascii?Q?4frDXbtYlk+crnarNM01VT6KCv0UDsvO+XHQoWoMOAIk+dwgAvpLUEhMGmfT?=
 =?us-ascii?Q?0L5uCW1+C0O5uTfRUpk/M7C4i6J5bYnUNV9e0LYKI0xJq5CqOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V/Jiw7F46+RcbOBcn9ddteH9q0VVWYUuUHOoNqe6P6cmzHKSks61L6C91V/1?=
 =?us-ascii?Q?QkEyhl7oTmUXG+PIkiEHd4zWDx/BTh3L+8mO4SVkrE7NIsI+M1B9nmbfGIxM?=
 =?us-ascii?Q?hKGH0UayDdLs7Va+lY62kJBD5ziZhYiIHID5QbmNEX96srxsGEIlUNjv1QGS?=
 =?us-ascii?Q?Ul+e0SjLYPdsBisXDnP+agGxiHL3VeROvOGDxG1LdgxeH2YNS0gQgV1LAvs3?=
 =?us-ascii?Q?cdoGz9nF/M7grnlbeJdOcf/Fe+r6C3k/GalP7PQbz+ons0KoOA0khwTg5nZf?=
 =?us-ascii?Q?oK0afTdG/nueQe8Wrm+XA/c+Sny9l5xEO1AjmteSt0db8jLP+ZAKzybbH6Mi?=
 =?us-ascii?Q?JQUs5nM6yD09uME2kU1tZkUGrA3T6w7MiW8B3qDNSix2H4Wt9xaXV1bXO5mp?=
 =?us-ascii?Q?6b2G8ipdHoZhnORJebqhyx05RsDvmaK0uf6MaiYRbxjXhNZ9n8KZYfd1XKc6?=
 =?us-ascii?Q?Ivx3yDOqNbKMprWl73WU7f14MVPukgsqUI0NFo6urkCTgTDyEFF+P0Dq2Vna?=
 =?us-ascii?Q?ZoWeTj/TV2uV9+hdNE+3yoN4kjoYx82TMvha461eGA6tmkFmCocBCVwxpFGj?=
 =?us-ascii?Q?fFX0pRukWNZF0Sf4KNeRJwwRpTrFZbBtYJlg87xAwfKlWlUViCpaxKt9Tzx1?=
 =?us-ascii?Q?XSKxkpTlVIWCEorFzHrpBM0BUR3ZzSaOU1fqvgB9XMPdFBqz/+VgNWKDcXBW?=
 =?us-ascii?Q?Mi0oec42XH58SQyYadvlem501iqAgUnGiqtOoskJBOoNcRGeofAkcjzEeLdz?=
 =?us-ascii?Q?twupozc0vs9nU1V4LGujwSS2TWGncyxfmULro0tI0ohr3BRkzQcucZ6sL/Dr?=
 =?us-ascii?Q?SgIVEcRnrT8zwFRu0+aosEs2u26INIEpES02ZK9GjWn/DwbYxv1RMAjKTQZU?=
 =?us-ascii?Q?v4HDp0UUGIaGNEeK3CpZqbWU5FcXO0iahkPLGxECC3zLd9spcEM3ejiC2DY7?=
 =?us-ascii?Q?OVIZyj9QFu04ZWeL2omwceNcst2fSqoC0UJaD2mKZqVO6xubsVIWtWcvXslv?=
 =?us-ascii?Q?B5IKwSQbm+rHmGJDGhTVgUh8QDEC4WHmLGIN510uf58WPQk3WqJFLxcntqpd?=
 =?us-ascii?Q?7V7ZYCcygqGcwzqHALx9hHefwB6V4IbFecNLRS4nVZvPP9v03poXolQQFmox?=
 =?us-ascii?Q?lHABFATaVqUdTRsMmnrfusp9U0H7aZvVXpvS3uxGwPH2HZwF4PVdEF5ZQIvF?=
 =?us-ascii?Q?tVkcrl55pj1ABmBXq5v9114egrYNAIlbLLpn+wE1EYikeAoRhuzZwuTczqDW?=
 =?us-ascii?Q?2q6Z7YMYuW/bfQUN/6yONlIe9SAy+c5YjtNqzj9AFmdAH59BzAsl/uRAMV9N?=
 =?us-ascii?Q?x+hr0fS6gZNRv4PRctbV4guFrM/KPdZWXMC2GuvBR3VdF/GSYbifjywfkRGa?=
 =?us-ascii?Q?kpCUpeP/RT14t+wcLX/mNG5OBks6uzFuiXKJ45aGnz3eReJNVWueMWYx4XYB?=
 =?us-ascii?Q?KxNWXyJX1pfUsqiaXjmGXnTfNhV1/H9/3RqiTLQBrkYhTmKYVRkf32+hRloi?=
 =?us-ascii?Q?TpFc1TOEU06QadYB8bj0Ra3Pl5HFNN+ut8Klmhk+dUFYdt74zeelor9a2qCx?=
 =?us-ascii?Q?DFlCb7tjj9c/G8IF1xRAATnm6kvVibxv2qc/QjbDIyFN106W2F7y/jGdqdYI?=
 =?us-ascii?Q?qA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab44f6f-2dd4-4930-2d40-08dc9c5e11fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 19:18:22.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxuJmzEc0LTmVaUsL0q7oCvu0Os8IR1I3o5Fd7Wf/iRqNYW1suFrk2foysT3X5GHmRrIHIndk9dstr0z3dWb3A+MLyhmUXt8WPD/VPWGGsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB6586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 19:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201584

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The u-boot Makefile (even v2024.07) doesn't like it, when `O=3D=E2=80=A6` i=
s the same
directory as the source directory and complains about a dirty source
directory; see below. This happens when `UBOOT_MACHINE` is set and not
`UBOOT_CONFIG`.

```
% make O=3D$PWD all
make[1]: Entering directory '/home/joerg/git/u-boot'
  UPD     include/generated/timestamp_autogenerated.h
  Using /home/joerg/git/u-boot as source for U-Boot
  /home/joerg/git/u-boot is not clean, please run 'make mrproper'
  in the '/home/joerg/git/u-boot' directory.
make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
make[1]: Leaving directory '/home/joerg/git/u-boot'
make: *** [Makefile:177: sub-make] Error 2
```

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)


Would it be possible to get this patch into kirkstone and scarthgap?


diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index fc36c21ec2..8172551c0c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -82,11 +82,15 @@ do_compile () {
         done
         unset i
     else
-        oe_runmake -C ${S} O=3D${B} ${UBOOT_MAKE_TARGET}
+        if [ "${S}" !=3D "${B}" ]; then
+            O=3D"O=3D${B}"
+        fi
+
+        oe_runmake -C ${S} ${O:+"$O"} ${UBOOT_MAKE_TARGET}
=20
         # Generate the uboot-initial-env
         if [ -n "${UBOOT_INITIAL_ENV}" ]; then
-            oe_runmake -C ${S} O=3D${B} u-boot-initial-env
+            oe_runmake -C ${S} ${O:+"$O"} u-boot-initial-env
         fi
     fi
=20
--=20
2.34.1


