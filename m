Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F027D690EC
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 08:32:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.90892.1732782722809795271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 00:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=M+ub4c5r;
 spf=pass (domain: prevas.dk, ip: 40.107.21.61, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1b+7aVjYycmtrKtls24aISTFnUd57wJ0+Gh00MnF/v4w1sifgBi4qNfpoJR+JGBDc6fJdSKCuSsciF2FkMLrADic/YTKTFFppwRRQzD8bVqqcIoFDqsYmZYmzUV+YloYlBngyndB8RCWn5cNi+8D5SelIr+znFrsMOz5SRCUzjw6HfZ1zI9K5y1jPg/678Mvl8tgHfI5ikBx0M/Vlma+NuV0kK9MEYrKk7+wQJNqzL51wxbFRFE260YWTYlSR/bwRA3VVtgEoTYImJRzPmoOHtm8Eqp4bWh/U0/M7dzNHcm+F6s/HUlTZvhGi63wCpcvPNb4hMNe/F9CN3YqEkEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHWgUlhaLCGXJ7iTjKw2DFeQJ3zT9W+21kiJnNR5mcQ=;
 b=qlEKL8E6Fq78G8kCxw0nngz8I05akLKBtWLeLXaZhTCZated2Li4w2WUXclMTYw/Qq800Jravmu6F8PpdgLA4UlSWFC6IU1ph2drsQlI2U9tZBWz9GYY/Snr3iyg6DYbGW+A1wjlP+L4hrIIfm5mvF+/SOoUWCWyPXJqKVCxt35YrIl37o81Sx2HYbs7Vqftf34nRcDpYaNEARMvPDnH3VE38oh4xI0sS0m4u+vLwasRBMNDD+PXqhONOWeaYybajp8PO7nAgXsJI1RPztsJgBgFoSeJgrCWTOVWf/odi67LZ/MpDUeP5QdYkrAEXR//zEO5g0IkAe4qpyUoAeDKAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHWgUlhaLCGXJ7iTjKw2DFeQJ3zT9W+21kiJnNR5mcQ=;
 b=M+ub4c5rHDGxEd5K3M+BRRjj1rRfPkNeD1wU59P+DJPd/0B7erJi+O6l3/kM3nEgKZN/IGKs0J6SG6rKcEKDVxQni8Oa5n0jfgzpCFymdIp3YoHF3aOO1BPGUuU4ABOw3hnO19vea7jLXjhZUVrelp3jZIZLlSbXqF76xjgJ/ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by DU4PR10MB8543.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 08:31:58 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 08:31:58 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Bunk <bunk@stusta.de>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH] gcc: remove unused JAVA variable
Date: Thu, 28 Nov 2024 09:31:54 +0100
Message-ID: <20241128083154.2298509-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::28) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|DU4PR10MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9cd0f8-ef0e-4c4a-bf55-08dd0f871fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5+eG99qbvtowS+JYscu4dJxENxl/JEjCo5URNCuVsNraesF4wDabWAJIh62Q?=
 =?us-ascii?Q?pUD2vKGmP8zzCCnc3Y2FB2PSMO5mXuu2qOSBGuKlvSJGi8IOkYjNACOkeYxD?=
 =?us-ascii?Q?gns/YVu1+zkgAjcx8W9fDzTCdVSqA3ZJCc5HgFvcHzuehQz8+2niMyXHrH4T?=
 =?us-ascii?Q?UoqByTCU6N9Z4hC/ucHpyS7QEI1PVwD15oh/4zHC8PXqWR9EJigPdu1wMHeo?=
 =?us-ascii?Q?+vGnuR2cPAaMFWz8L1wnANa/N/0kBvDXzpIJ6iW5pjkZ8tsGyFyPdW+5WffA?=
 =?us-ascii?Q?+BCXmVHRIDBgVZxtlCA91kdxKdqF1gl6C3KZJjFwlxHahSys5I6uc57q5JFg?=
 =?us-ascii?Q?mP7RJIRCUYyCf+PsrR2LBTVM9zMCT6k1Hz9+BkVey57MiDyqK5o1aLNK0Yks?=
 =?us-ascii?Q?05KOguP7TTny59+cA+6h4JcH2Mf6NgpRPWcRL73GgL43ROFRaEyf6FjdxA8u?=
 =?us-ascii?Q?gs9Ic2Sdq3Kct01Ak4iVhVbL+P/ma8hMnHqrf8HrxIRgUS90oWJZz3Cj89mJ?=
 =?us-ascii?Q?pkHs5BR2AYrvjncZlE1d2QvjdLOcEoW1bACmqX7rn5oz9kXhzifb5XIqZ2Sp?=
 =?us-ascii?Q?aH0zzQSmWUaxbcwDzTrZye2pWN7r3+1+029DTE2t1MqanHkgpE02oqThADiH?=
 =?us-ascii?Q?xghZ+OnLZACgWGAIikyrCtnCrsDbAzwNuID3gF3osaaAA6r1FF4TAwRHOBRU?=
 =?us-ascii?Q?wpYQ0wpd3t5d9EEpZit5KWSZebeXDugM8zhPG57UpcjS+ZecgAt/oncSSxId?=
 =?us-ascii?Q?E3yEmOPqSqnUCD6f8Ix/vwE87lXYVAeztgYdN0cOs1OKikxWu7bJT2NmG/8M?=
 =?us-ascii?Q?Hfb9m2gV786xuO2syVU2+lQuAJFqXdU2SdP77XpdceZMewl6SD+m1bp73E1b?=
 =?us-ascii?Q?HDgV5xQog2PAfISPLyDgC3olMHzxAbs8aJZz0Xt/c6+PxJX4YQCi7W+cxJku?=
 =?us-ascii?Q?fq67XKIKtOWXXxJT29YT3nbcT+G/CzHJ68FeEpRBZxu/vhkcJNwogTDPteZV?=
 =?us-ascii?Q?l/pXF9RaDpzif5AcPZh4G86fBGUje+7S9x3DwYCTPoWn6u1Waro8JPDl7iWT?=
 =?us-ascii?Q?yZFArkfwhTBuNPvNSjs+lsGiqtYx6PGphiKIm1MFEXLsqmzcZoQrfrwPVf9Z?=
 =?us-ascii?Q?zMhJBjvr1YJnQIBetDnW+kQ7fogtYy7Bb9QLhUvM/bArwJafggiWwZn0LYZC?=
 =?us-ascii?Q?7ix/18z9K1d+om1H20unVjxzif/ytd4glo6GjHfXjhMRW/Ii7X38J0xX6/98?=
 =?us-ascii?Q?Xo93lggjERukAENflPi9ytgpbSG9nRPvm8k6lvo2XDdp10dj/v5eJN1r+DsI?=
 =?us-ascii?Q?/9RwFBeB6lzqdEULvtLppv5Q79AJiIY6HRA357T9ZzMKIuYlrn6VWaV6HBDj?=
 =?us-ascii?Q?tRyDMaiAWqy8pBw5AeUffGpG7DpVhpZ3P1tTnNfHmXAqIA8O7A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nWdmhLxvpAPpoUViOa8N7HWMgc5rVP7PeJHaJm/IrKnV6YzJupxxwGSrPsNY?=
 =?us-ascii?Q?aixLYcrOgmmsbH+CeYaaOzsOojtum+tPzS18kVXcKCaMVYaIxgKLC+GIL0ui?=
 =?us-ascii?Q?mlxuh9fmBLMKm0yQIiemE0q5O45TOEp3Doluf8e9T3oS2K/jtmljtCYDKDse?=
 =?us-ascii?Q?L5zEvaHQjw9MPiXXLcpzKPlykFQbX+DZzUVpWozL/pc4NtXghCQr4MWmGhIc?=
 =?us-ascii?Q?u3oJt3DI4FqcZnbWOPuC6HmMJLKKaT7OMpzLOvc6zx72wnor4gxM9gneJy/y?=
 =?us-ascii?Q?/3+RaYu8TlCI26EzPv7rJnGx5GNz5paWZ4BcpVvfdtTK/Z49XBdxQJphToPA?=
 =?us-ascii?Q?k9j5Fc82frwBpZEbvlO8Pkh1U1ND8mAgYbTh1IjYWd2GGdhb91Fy4yeCILfF?=
 =?us-ascii?Q?hPD9HeYq/J2vyx0jesEuos7FUfYZtEtR464peVblT4XV//VIhWXVWCl+LznT?=
 =?us-ascii?Q?Ho2THeXQw/AxBgoHvUV2LqWi5X4dpYk/tkFmsca6Fmpusroi8pP8h2szTNgp?=
 =?us-ascii?Q?y38sPkx3ZrjCCxlyou/DjehgLzD1ld9/ZxTGMX88QFqfgq36nWyx5ffdu1Or?=
 =?us-ascii?Q?2Zoxz5N3bhlWvwELlAgZpy2OEVXZ3kxJU0xNeiJOKgAmgT6flYq0nLaC8wiY?=
 =?us-ascii?Q?Q88JNJzGx81zacoTOelR7KRD7Y826abi1ZL1W55PYjUPfFSmxmF2Lvnbm9HI?=
 =?us-ascii?Q?cy521JeP+yP1IijQk2DdPcEcW5GwUVHzgJDd7IwBZsLo44jY8LhwiQOPS5ud?=
 =?us-ascii?Q?2MOnC5GyxyNukI8KAvybL/1QFDxB9pRSvYOAUCDqDpU4x07pu/bYtgsTlmGq?=
 =?us-ascii?Q?fajQHqtTP+Pt7ILzxzlgLWr/L6p3jCRAgbkkwNEd1EcdOc0JiCl6AyRqGnR/?=
 =?us-ascii?Q?ZqS1X4Oxl8Nm9z9CG2ALA8cAlB+q/+iO6lWHpAXqBFeuT3XL4/878CCuI2uh?=
 =?us-ascii?Q?0jcmIzR+rzuILC87/7guElGiXrk2OTmUlG/OHOpbQKrITJIu0t1gghds6r9b?=
 =?us-ascii?Q?v5t5o7FUyY/5/6mAvk/5WY7ZM42ziKooba2kkfWKOMtPXJjoAS84+V1i7W84?=
 =?us-ascii?Q?CB95uLV4dIhE22rSuEbPvTo5PD2huJ1uDnw7xKSBhCWT12pg0hPf9zji0i8u?=
 =?us-ascii?Q?o2XCeaQa6V7SUF27LOdf1b0rt5HpXNRil9vhYC9gYZq7Y/J8Fu8hqYRiiyfB?=
 =?us-ascii?Q?olyAONpiI9s7+OfO2QGEI57JEAy18uQVKP6ZgccHJZicHhmpzyAxoDxBeNQQ?=
 =?us-ascii?Q?IA4Hq3cXkQU2qXOLdpt1e+0Byg3kDa92snbUp2XHboQ/PTD+djKmRBj2zrqM?=
 =?us-ascii?Q?bU0LEc0yv6DzEc7WTT/nHMlZeKEeKPSe3jMZh4g1Eefj+faxGbuqTMcaRPj7?=
 =?us-ascii?Q?HJdqRa82psB7JVo3Azt/PPa8sc0c/MVuo+hZBCnMK8I/dB+LiZc0Xb/hl2q5?=
 =?us-ascii?Q?Hw65A6w9oSlF5CdC+DG+3nql70sqhUq8vUBh5/Copcm1vF0uyZsD2NFyV+eH?=
 =?us-ascii?Q?bntTHhh2DF5NXJDaENPmScwpgkul3cjGp1qsJd6DRCc9AiWQU91CaLeDK480?=
 =?us-ascii?Q?eOiSGVoxUhNhptIegXk9vPPAdT14/3AJuB1EREBppGI/RgcfGplyupjqzdF7?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9cd0f8-ef0e-4c4a-bf55-08dd0f871fad
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 08:31:58.4196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqHq/RedXEbjrVHG+1hB6VN0HVd11Yvlo5C+2mml6nf1Vq+IX1bX5pfc9BtSndt/ZppcMX932c+Uil0/8K7tyUdyfVkXaW0rVhdbrgeT5lU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8543
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 08:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207982

From: Rasmus Villemoes <ravi@prevas.dk>

As commit 81551871b183 (gcc: Remove Java support variables) correctly
stated

  Java support was removed in upstream gcc 7.

but this line snuck back in with commit bbf32e24608c (gcc-9: Add
recipes for gcc 9.1 release).

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools=
/gcc/gcc-14.2.inc
index f05484cfc0..f77493effd 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -75,7 +75,6 @@ B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SY=
S}"
=20
 # Language Overrides
 FORTRAN =3D ""
-JAVA =3D ""
=20
 SSP ?=3D "--disable-libssp"
 SSP:mingw32 =3D "--enable-libssp"
--=20
2.47.0


