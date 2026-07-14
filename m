Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE75C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:40:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6960.1784184028264115339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=r5cHDwIb;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ZZS4SYen;
 spf=pass (domain: navimatix.de, ip: 40.107.159.138, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWL5FhGRii6uiK/Ctp0bFH52Dxutk9+7XWIYTMbzrCk=;
 b=r5cHDwIb+1tTnnwPRM9/UjxKhqn9TjLE4hflDXju4lwyg06HBw+SEvqAb7Y4dIZLeK152vepxZQWURDdv8jKteinI0ZDMAfDL0lPLCdtvuosTbZE5lzSXm7lsqDG9vIFiJj4/fHQf67hs/n2HU5yvEbHAgOeOnRpMErSZrZxXII=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:40:24 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:40:24 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:40:22 +0200
Resent-Message-ID: <alh81or8qz7MXuwZ@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIDLwzgshTcUGUF3CICZKe2clKwKFMJmxDClknX8TOQDF4N+r+aAv0r1g21TQKrnkMc1NNFeuo+mVVGwuIrDZTTzlLtb5ykBWbFd/8YeuLkG2dqDKSL5VBkS4HN6QB2Dpsf0OkX5jbT5PnzXFatRvAvMo+OkpU3HVX91xCGSv7Carx1tJr1t0xIgcm6jXr6byRPV1y8qkFM92Y1iRq8v0RQfJE4p0Za9ixhgVwBwDLCuqGvrMV7tpEBHWDCGWkZuHuLM618LR5G4VdBYwMvLk7sofv1DB3yFcMaG2/GNeyBdY9AtHI9qTWBDNKk6X/BJ8ji0s9s7MdD084+Hs55JVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7Jwmhy3Et137CdtfVBtbfxB2rGUA9gEi9pyqXhbInU=;
 b=MrdzEiMkWzh+9wgAKsB5+e2qIFWu/SFlsU80ivQPiczw9P2lBypoCMzrczVmPITaXfusrpzhj2ZloSNnLWhPQUEFInyTxGv2b2UEhRSEzGBig3UBO+7AZnjcUSrygopQ7k2bcWGJMQcxUdFrJX1SHu+/iJWJehksr9SB1jsP3lmdc6Shu9qLe6pPdxHcT1bwsT09fVl26/OTDRpTky71ZZAJmljriZhKzSQnBVWfGQoARM9/L8pQCMTgtWMoPGsQWFKEDADThgAxf/Gdbv9+3Gs4oyPgls3C/gGdKDUAQ4kSR+/1BicPrZuMd5rV47K+E6z3zgIl1gmXGjovms4+Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7Jwmhy3Et137CdtfVBtbfxB2rGUA9gEi9pyqXhbInU=;
 b=ZZS4SYenGd/8qxbKMGua4NwVdDOTlVV+thZNM2+aHnlId3Ss3+XGV6ogGFlVK0q1uvta6NdKfyxJDRVnvgnaOt9sb8Dqm8v+I7g/nsmYw5Mi+ByBVshM/OeIvvHW1RxuBZNIMhpDNO9haLYiNRfcwA9GEJC438KR+PfUJVm+tsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:39 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 3/6] rpm: Enable PACKAGECONFIG[acl audit selinux] by
 DISTRO_FEATURES
Message-ID: <831673f23f130b01228e0252fbb750b459062fcb.1784039919.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|AM8PR01MB7731:EE_|DB9PR01MB9932:EE_|GV1PR01MB10913:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1fb6aa-179b-4caf-ea49-08dee3051da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	rVWXJPw35xAUdGG2hYiv19qxwCVahKa4M3sr+3UirsJ3mo7DWnYbcF9gksPODtGkJH66dBKLotwGGpzD7SsDYdzg4eepY1tF/VUZHhMQD8FkM64tUY/0a8utnuTLlhSmgrDXgK6mwwm++VOvGsZnA4eA7Vvmq3sH9pfB0bv53BekgJQJ3xtGWHMSch2Tj+PmTJFDv857hHais5k5BZFOAoXDjblgzFBLffbpnlwPMBLh5ks6rOSv+uf70Iz0VxLDNX71AkHQUGE9hFcQlUYERuIEIoGAbVQwBa3rd+jtGJTpdxCqaxJrvkBFDyg5Runhjmnu0DoFl6BViLVgtYrHl+6/1jOutZg7BybsuNSQqXCco30hNOxXmuDi66azRAarsvt1O6kt4L0kV9MMaV+Z7mDvpVOVuWCjSYuhMcUKMswsFL8sLsjpbltntY7yEl61AypkoHkIAquMUwIpyX1yUwykDB4ZZIcCLcQ1mju4xwciJzf3EvJFUNivwyZH3DkW8SiI8RnF2UvEcNo/bsCDnijnCD0jN8/lzRiNEkSRURLX5lidC5DD6fV1KHR7eM6RfX76oaiHmVKeDOEESRoVjrl2HTWofWmCRbsTdn3Hdt9RA3Yvc3Ml4EYznWailsz+jbjiJ2lEgvPwVnFjNh0YeeWFQeisosjFKEOcEjORw1U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: d73982dc-a77a-40bb-b1fc-08dee1b60448
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:40.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBvTpVireON36TkqT33u6J1lXxzlN4y9AeA0+n8c5WIN12k8/bmgGkS1AFpEAe5w4WAYHiGUjuRe68Yi91PTvvudMYJAy9amurq8gYF+ffE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE1P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d73982dc-a77a-40bb-b1fc-08dee1b60448
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?XCq+AernhjyFmcy0nOXEQIvI6cZldMoX8NHZZnsEsVH0O4YaqNYDcOxZof?=
 =?iso-8859-1?Q?6k3D8aTuEwQ/stmuK5aHbDZPDVeQsfP71097/YCzSidUFIlbKzttAVeTdv?=
 =?iso-8859-1?Q?82Rs09Q9akncK9qsIUCLBDjPVqoJX1ORdaB5PBHA7fvp+AHNo8YuIgesKg?=
 =?iso-8859-1?Q?2XjdAF/hgOWxdnhNAJsqwoUYbrmv7bEVN2bqdZaUCVIZJ1dMFda31ywoi7?=
 =?iso-8859-1?Q?JbM02S2XgSIcGNBUPJ0uJWYHRwBLqOtG/sEIRtAmNMng5j8E4+N3QZDrAy?=
 =?iso-8859-1?Q?Gm4CqA7oNvohzagii2DekXYbCy41kEGbtMwH5EnOp0NfKmQ+02W97C4UKT?=
 =?iso-8859-1?Q?yA8rrhEqY5tAsD75+8MKYXKFTFyZRJrZTKSW+GQhb7bTvFCxE7uyt9oJJX?=
 =?iso-8859-1?Q?fYAwv/JrkDk/7zTEUff9WkWKSCd1goMhZFrt2gZxCDq8Q96Nte8/4Lhurw?=
 =?iso-8859-1?Q?7c10LF+S3b0hTO6+S+r7tHzuBu/vogsoNea+XM7Qw0oN9pJVT8I5BBSMvs?=
 =?iso-8859-1?Q?6C2DnnEdJSvbMDpeIyNoBRuxgiR4TEfaoNBksUDmaBPkT5z2d0p4cPWzZC?=
 =?iso-8859-1?Q?UZ7kNrjofa5Ts3cHoIdxYnHuSoW2saFZEUYX1qVQyJbR5BZDXo8VvT+CCb?=
 =?iso-8859-1?Q?RBlCmleqQlv0tLEquFebolvnnAYQqvEEmi5D+JtZWCP8ZyNJMgT0gzLSNI?=
 =?iso-8859-1?Q?KDx7TUS7InNcJ7LQ2kmsH4VRRZ3Zj1GU9frMBC0mI30SCpK+gkh1sN/AGk?=
 =?iso-8859-1?Q?PZGNQM2YANJA/eMHTzMtZQZ9ana6kPBQugJDXdACzTaSA1Yi6jGdwUlOiB?=
 =?iso-8859-1?Q?AK3gOAHrntjbSkm26VX11lht/hU7Zs1PjjXX2EC6Bdy8ZbtxIAXqnMQ9k3?=
 =?iso-8859-1?Q?CwMbh0zPlbleXNATcUFUlVjSZaCHVBVyI0yIyExtunJvg+/dkxJf+5DAPf?=
 =?iso-8859-1?Q?5xmOXuTE5zl4VvEtYuDYfRLWHa/xbEJ+Tsi2bJLYg5o6oQoc4KHrneDG2C?=
 =?iso-8859-1?Q?yOHN6ZRxWOnDiMrvsEfBQDdt8RM/y8KHMCTqx0dJde/JKPgUsod9mYSS4R?=
 =?iso-8859-1?Q?FOPpfy0QQxdvUm+Uf6I1DwXDVGkAZlqHZBFi5rl0dv1uTBAjksHLYbgYEE?=
 =?iso-8859-1?Q?y9uWySKoawtAVK1Lm1uLZzV6Q/I8+p+9aHz4207tToT0GfJjL5uWA4JMnD?=
 =?iso-8859-1?Q?rMQOluIWI2QG7dcopDgdAPnzsV/GdgFE9lMVntCciwAkN+kDg1QQ/xSgkH?=
 =?iso-8859-1?Q?W3LW5OQfxJuXY5IlwpGpnmR/3RE1Tf79mKNa7zANQxsSDIPpf7V1toUAEK?=
 =?iso-8859-1?Q?tkoId1Y/BygFLB4k8Pbkw86rArKhBNYZHI+W+IFX1K4tIAASHGBlovn7ID?=
 =?iso-8859-1?Q?kf7rC9hDT87pFTZ3sgeyID1UZAhmnuSE9rwxl8wrYN5qh/0dCQSuq6Xb3k?=
 =?iso-8859-1?Q?hPxGjVGmazQBmInTxt2v9OVBvxczp3QeqmvNQShQtUedLvu5AVXxujOvtN?=
 =?iso-8859-1?Q?7pQUi7CW9MwP0JsqeBIhGlhRWK50YJfi9ydOE5/WTMuvp4UwsADBzhL52a?=
 =?iso-8859-1?Q?fZubncuNtOpm/TwlQqv4fKuZKef1HYqKzKf6HriGK71nhkTZgwGoQmWR7N?=
 =?iso-8859-1?Q?+/4VSRlpMYNOZYNuEuyZlYMKNm2zzxgIAGDotO9/sh3Q3cz1ZjxYQ6RMUy?=
 =?iso-8859-1?Q?nQhr9c4Lft6P5ZbJMfsfEoe5f9u9tHbM33hng2FbM0YVC7AZxCJq1O6we6?=
 =?iso-8859-1?Q?G3kROQUySz/p7Jvd9WHZRF13MtHv75bNpQmnmqTP9/Oujfv7MUXtSqWhur?=
 =?iso-8859-1?Q?X9dKHy3f0poGHmUO/0MOnMLNaaWiMWo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1fb6aa-179b-4caf-ea49-08dee3051da1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:40:24.6419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lod7sD2x73CMTHFyN16r5GYo8dUwK35HO67edCuYKvIFtRvynFsSktOFx+EFhCQZyBk6hhzQuCS14BgZvHtpIg18ODR9rICAczZTMhethRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241058

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/rpm/rpm_4.20.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtool=
s/rpm/rpm_4.20.1.bb
index ba967ec1fa..17e75c3e14 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -64,7 +64,10 @@ BBCLASSEXTEND =3D "native nativesdk"
 # https://github.com/llvm/llvm-project/issues/82541
 TOOLCHAIN =3D "gcc"
=20
-PACKAGECONFIG ??=3D "archive"
+PACKAGECONFIG ??=3D "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit selinux', d)} \
+    archive \
+"
=20
 PACKAGECONFIG[plugins] =3D "-DENABLE_PLUGINS=3DON,-DENABLE_PLUGINS=3DOFF"
 PACKAGECONFIG[testsuite] =3D "-DENABLE_TESTSUITE=3DON,-DENABLE_TESTSUITE=
=3DOFF"
--=20
2.53.0


