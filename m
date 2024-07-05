Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC7FC30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:36:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web11.13837.1720172183660033898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=1QSSStCs;
 spf=pass (domain: navimatix.de, ip: 40.107.22.110, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOvCql1uKGEkoLzqUic/5ruc+mEbnoRBYXWhIWNNLnU/T/5g2Msq2hdbowa5ZZeZhbgcqlM9mSf5/R+4ETQNRy+WFeEI44tUFKY+7PNPOc0GhKZ1weCIei6RXLSYuaxFcGMmZf6WhfcP2hx5lO1lBGilTe8k/ByRv1Nc9y1Q9jViUo0ZlG0Q1SG/FzhnY7thHb/yLjuo6enPro51omUm2iyiLEaaxkAq6Je6PPkqDEh1x8yFtMiEd4EtE8FXdEoNY51mc6GyY3a+ki+muB7wXaSlRdDPaUCzm4FYTbIgKoL3UWAREYvY8yW05PmRW9XXc3xV2GMqXKowVldqeyra+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PowJBVjVSgsDs/4xyIh+8T0269mrcixKCtPtAZ98hg8=;
 b=YuU8+/fdk45C/n3ynxltk9iTC3KJ/JxRcV9tkn3P5luER8sjdAIYJsZ/HYcLQdEjAnETSg4/B3e1Ydjho38afrRWX2UX5wXPKS0FiW8d+lT7mHzx1pSomL0F5vvweYMfpExxG8Ngx63cFSLTrIAeywC11RTnVtvSnD9ghhkCowvppW5FkdVmvVyaUa55OG8JEsg/mWbFP6hk/MQlQQfeh7xGrMZwi4nbPc80qxOnrX52Ay4jremwfeEfhy9dDDeHmCfuqoBa5iJwyTYw1ktoW8PgLcOkGf7YRW+mRmiNjaz++qiLTPjz4eK0KMLiBVkbYUGvovIybFUPDMzJdIGE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PowJBVjVSgsDs/4xyIh+8T0269mrcixKCtPtAZ98hg8=;
 b=1QSSStCswbr+vWi0tHD91aAvUDEGIFvDxwbRg8F98jgvtsSlIYHC95O2seqbpFrkCMQWbIemQpoqyvTruYeddJYqeREGle+pSNCzzrC9u14R0ofThz9x0PxyPAYVI1f2O0gTLXxGlJgTeQaG5ATOwCt5m7Gco2Rlu6ObXKWDElA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB9447.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4ca::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:36:20 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 09:36:20 +0000
From: joerg.sommer@navimatix.de
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] u-boot: set B = WORKDIR/build
Date: Fri,  5 Jul 2024 11:36:07 +0200
Message-ID: <8424bf73dd44e1f8a9aa940b3956dcff9de6d458.1720172151.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
References: <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::18) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 024ad19b-ef25-491d-f924-08dc9cd5ed06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?diCi+S4UBwaQaM/13jv139gC+I55GTW1zLrlyz4QmkXn8yTmEP244tl7jNt8?=
 =?us-ascii?Q?vlFunuOyeXbQv+zCbQzQkFjXisnpGyOnBlwfq2VISaOI0hwj2WeVPecDqhKq?=
 =?us-ascii?Q?cF1c3AvriwAcQ1P9eRIrwW4KvkD3ak6fLQg80pQIjDOD3R4V6Bb46U/Tj8Bc?=
 =?us-ascii?Q?uaCCai+AW5AVut06zgm4t3TMekLJ3uMp5R3FfGU5K8wqUfI1C1Jb788kOCOU?=
 =?us-ascii?Q?bVyYrzj9yz98n453q6Zs9KruhDGnB4v6fEliLbjgL5I8xeRiX7U0U5fP9BlN?=
 =?us-ascii?Q?hoVhoDL1l2aHfUx+hhk2KOuP4KNPAgXUBZ28ipBkanUiu0poYIMCTaJ24nBn?=
 =?us-ascii?Q?kv/rB5C9vJ+w8SG51a+/Sh6LzfnWMoJSae3ka5rt3OdIdG6lKaQQPCSv3iZa?=
 =?us-ascii?Q?dTnDh9V4f1QwKZqrYC5r1kBtA1/zF1ioGrEsw6yvhLKt9oi5uBUWtyIE7fwv?=
 =?us-ascii?Q?QnlTXc+4+R1rwCk5g6QvHBQqP9s1ARY4qXx+J8PQ6cUQktx/2/G99hKqPFyq?=
 =?us-ascii?Q?PJoHktNAjex27OPJVm+kbhUtUFLc7J95YgDxGXGSvkp0G+vmUbu1dlVHHauQ?=
 =?us-ascii?Q?Xy+I+PcLZnZC6RfuYfM7+k9kmBRDuGAAGzzjcVfkdX4y7VhXdY3IKHrIaAmO?=
 =?us-ascii?Q?0P/QzLl2p/OsQQWClIO/KE2Fm5wOPEQgzGDLCCac2drvA5vmkCBmVH0XXrO0?=
 =?us-ascii?Q?DGHJGIxzoq1nolnUH1Ps6e+s+byjuCaVGIMYEJUYgccmN8RqLyD64JUmdwIQ?=
 =?us-ascii?Q?WnfmRccNvOYGee6eT362C/RrKA5y/aCRrTgwx/xXskrkueoGfO2fOc1ODIXr?=
 =?us-ascii?Q?97KT2hM0hRkQ8eYIBnCCnE4DrH/cT1QdgTjuZ1sXUmIHmnCIv/1MV/Xv6Xy2?=
 =?us-ascii?Q?g0EF00wGxv8z0vx5MMumWz6O119qVBlRQQ5au3oqdvy2iQ0h1gHzbgkKWmLh?=
 =?us-ascii?Q?Xsf/2Kv+knebzSrPl7ZvdSuy1IYLO45G5QI5aIRV0qukapLzoC6dHCdOwDxT?=
 =?us-ascii?Q?c4E/PJLMri0FuVNEGR5kYOUzxi4Rk1El6rMzuogp45uZU6Z02yMKmnL3K+uY?=
 =?us-ascii?Q?D95yFrLfr9j3mmQaY3MK15QCSIJy77E6XqRYMvXfU5arHiLnSRHvfJuv36PV?=
 =?us-ascii?Q?8tIvwR9oFJdFDtGc11gbJg+GidRxes2Gpgdk1euY/ydXoAgNpeT9Gf7A5eG1?=
 =?us-ascii?Q?RxkHIx9MuZcHSKBbdHMNmF6G911DOIH57UniuQzXoDsZlGfeXMMU+nJFbqfy?=
 =?us-ascii?Q?dmmngpXHXmwFZw5SdYMlQ/Y/xrA0hhCMIUjcNJ4uCtaSVMheKlya7dJ/O8oM?=
 =?us-ascii?Q?Anq12aJF0wHv6GsI7OeunTFM9+LL7MQwOiSu4fPWm58Az132EEmHmfihcKEh?=
 =?us-ascii?Q?fMNM6ZFVUHBckuUKru5MQsFrEhEUJoWtdzVbFHmYm+10CkAbXQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uw7t/H0q8ER4OcTgCmVSR0LncuZ5dPQkQoPtkTINWPOFK9yIGfGgWflK+JIS?=
 =?us-ascii?Q?P3TWK3bECfmNeT1e50m6e8Rk0LFxZt7tWPjaYP7BpT0RKa1vnco7ghzOcxRY?=
 =?us-ascii?Q?w6kgrPZKv72R2ecvo9GFjZJ7FrW8sE/KYluSd2K/0LGvklf+ALAx7oVqcIE/?=
 =?us-ascii?Q?1vjRh/dPzGggzZOAkfWgPmVNxZcPpVHnu9vrgIN4cjGe6GZXmJS/uMsjmbgN?=
 =?us-ascii?Q?0/s9/LpUBP2V9k+COfmR8doMZFpBkwHh25Bd6VB6ecXK/JnZHBpu2qnSdB+a?=
 =?us-ascii?Q?HRo3oB0Lat/v3aBST6BGrs0B+BHJSpeapVONx5Kgj3CqcmnEjGQPvbnd1uRF?=
 =?us-ascii?Q?BFvlTadeTQ8zM9kzgNyHsO0aK7GjLNShdbe5M0l4iew8XFdB/V8QL4NYK6dy?=
 =?us-ascii?Q?+o2RABVqWrl1IbKz+TuZs2JCOaZRIWA6kSp+kxYb4V9csjUAK/5rsOqwywRh?=
 =?us-ascii?Q?tuNWtJclz1rxZ6pqjHsTvH68Gj/EbBo4w1g4g3yvrNOgfXhwq4etauoy+PIw?=
 =?us-ascii?Q?E/x5yoTVvbiT8Do5gMBRLM9/my5KagnVpzJmpmcmLbgLqGCFV+1dTPjLUFKV?=
 =?us-ascii?Q?93X1Pst0nYhPG5Y4wLd3rBVRCx2mEIRxccDgU/nmrZ0E2oiXCVu8V8GjPdo2?=
 =?us-ascii?Q?4MalodkhZNXaliD7AQI+aDtmnnG0G70xkqaX/KQt37jQbpc3nZDhhiZb9Ujo?=
 =?us-ascii?Q?XNf7aqQfBFfsxLkodNnGSLJ7Naeh4+1bYfSAbqEyCEMw8Wb7MrYnqtANzA2a?=
 =?us-ascii?Q?kdpPlPEwB760/sXhF73i7orOE0KhScJTeUDT6eaoo5PiQQba93PBL0tXi1N6?=
 =?us-ascii?Q?UEZo9rXnzdaSBWYeZUJ0O2L73hy913J77PZ++pxPoFz3ESoBU5nzhjOGqnH1?=
 =?us-ascii?Q?EC0HL+chnZ8cEp4lB3L5t5jQSiEESeen9vdJ3GWPNFUUEPtbDv+J0coNBjWQ?=
 =?us-ascii?Q?WIDwQ6mjGJxiClkcPbECwHCoNWf3cRGhhsq5sg90PQ9vfXHSlJjh+4DQFVso?=
 =?us-ascii?Q?kAe70sSxB2H2zPjyl3BIIxjIVedZLwN8KQesyYro5pUMkhDmbp/WkrWM10NL?=
 =?us-ascii?Q?gjzqqEkTv5RfS2vZCGCHLB3gIAXqhsYBVbHGo4wYsdddM7ROx8uJD/HVibP+?=
 =?us-ascii?Q?4tPK0D1TIBOhdoyUrR/8ibZpsSCCNayX/pgalWlgPtM/hdS7l+ISWRkD4sTZ?=
 =?us-ascii?Q?V9QshU0+pwPJSog3xytjKPsW1mKLqkH7DN5y1Lg3/MayamW50W3+LWUFqSb8?=
 =?us-ascii?Q?vCUU2fA5LrZ1U7prU1tij5tuT26nlQ8avTw3kPOb4oraLXgerk40/w66/ynZ?=
 =?us-ascii?Q?F1XcSbAbkbGAjFKL02/esxeXbylZ1GEXUMm6JTrRMHws1hxfsspE/uhBU+GP?=
 =?us-ascii?Q?X2NMZx5j69oWpyRu11zMX3Xl1+szJbLjGB9Ou1NMSS4H6PuxyFHbFS+pgn5w?=
 =?us-ascii?Q?JZU8h0CZjRxWhdEYuCl1ZJrz5mjjDlouGI/R3rDsCB44Oz6NvcyI/UJ4tSpd?=
 =?us-ascii?Q?Y0+JiOPORYlOZoNO1gR0U3miMHeeGK50WWjRSFOqhwNDkBe5cSJ8g/8q4Pbq?=
 =?us-ascii?Q?heHCE2ySNiFkklqC8b4NlyJbAlOxZK2CvbvHlwSuNWJUAR/NeZUhyZ3fcg7C?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 024ad19b-ef25-491d-f924-08dc9cd5ed06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:36:19.9560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0tN6OOt9psonp5Bvdk+GXIV/te+LFhLxSOhsqvVO8XqH+grscD29kMHZHfuyjuxpGMFPnMZ0rVHI3qQ+9auoIdAklhdLGiXq24/a8c4ce8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB9447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201593

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The build of u-boot fails, if `UBOOT_MACHINE` (instead of `UBOOT_CONFIG`) i=
s
used. U-boot doe not like the setting of `O=3D$S` in the make call, which
happen when `UBOOT_MACHINE` is used. Therefore, use a dedicated build
directory to circumvent the conflict `$B =3D=3D $S`.

Yocto build message:

```
| if [ -f /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnueabi=
/u-boot-variscite/1.0-r0.fwkos.6/git/.config -o -d /build/tmp/work/da850_fu=
nkwerk_rp1_eval_board-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/g=
it/include/config ]; then \
| 	echo >&2 "  /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gn=
ueabi/u-boot-variscite/1.0-r0.fwkos.6/git is not clean, please run 'make mr=
proper'"; \
| 	echo >&2 "  in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-=
linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.";\
| 	/bin/false; \
| fi;
|   /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnueabi/u-boo=
t-variscite/1.0-r0.fwkos.6/git is not clean, please run 'make mrproper'
|   in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnuea=
bi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.
| make[1]: Leaving directory '/build/tmp/work/da850_funkwerk_rp1_eval_board=
-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git'
| make[1]: *** [/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-g=
nueabi/u-boot-variscite/1.0-r0.fwkos.6/git/Makefile:1928: prepare3] Error 1
| ERROR: oe_runmake failed
```

U-Boot test:

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
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 54ea2e9e50..2f808d659a 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign deplo=
y python3native kerne
=20
 DEPENDS +=3D "swig-native"
=20
+B =3D "${WORKDIR}/build"
+
 EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_PREFIX}g=
cc ${TOOLCHAIN_OPTIONS}" V=3D1'
 EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"=
'
 EXTRA_OEMAKE +=3D 'STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAGING_LIBDI=
R=3D${STAGING_LIBDIR_NATIVE}'
--=20
2.34.1


