Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D93FC36014
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:02:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.81])
 by mx.groups.io with SMTP id smtpd.web11.13335.1743174120694761555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=SaPMShAd;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfAems4s7S0PAN+1NXkBpr+c2qARxldKh8ZA933BVq1ARrUv1+I02R/Emo9mCJf9frWZTVhj4cbSxVoCibxKX78h6Z8nfcrXPmeNk1x+3nwNkN9k/sXp0KbiRpXhhPPg0nexJCrEyACMCSu67fCPQwSJotuC0K1qhMIhmvsOydC6mH6bYWbPBeQwLyS0pYHqcO+m4NSP9ciEo2zKh3DfK2Ew0NrpaYSnJfogxCsiI21hxGaQuOD+qeYSVMJnNYYVeb625M5U4Hz58a2LRVFWnvY15zGSjGDC7sBTQF5TBFwqeKlLUUKu3pRdqgihOJtu4acRlSvYwrXx/TP8GD+ydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcZGfn7A+0JIuQbpEGV6Th1iMso9y6eiFQCS1mYXZD4=;
 b=Jn8bl5SsAual85pcy1xfREAiICIrbm1ubQRLC4IKgY1+5qcacwsMCR516l79MYABvPGdVJeEL0WDSB/Fraf5wM30q6PlcpF0zJl31zMZiFVCUf61MZO5ul7K3o5uS4mHoZna73WX6jNWLUL4ul72a7L2ACXE1Psf0WLLC5dU0eikjb/0as4pGF/I5Cj0wXTfvi8KHRTlJ2yctJXtjE0/4lG/veHOt3eYF9b+vNa21CxT9Rt7tyHJDuafwCzU79AL3NOHoiJlxA9p5bCiV+44BfNF0WS02vkbbPpJcvh0JJy6lnslSYlA7Zm3wR3+YWg7n1SBmiCU3Dmw1TaR/4n/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcZGfn7A+0JIuQbpEGV6Th1iMso9y6eiFQCS1mYXZD4=;
 b=SaPMShAdpdAyKFNeh3YxMTlGmrdc+BSJ0c2WP57XbW1+v76mApk9cp900EaIs5ytR1nBKvKgtEiFNVkLQ17qI4pzgniJiZDOKZcC90FAstCHcO8h2T3XpURQSUg7PsT/O/eqTrPfSxkzYpsSz16RjaibVEceChQ3SJx1PJe+dfoenn7jYmn0cOanpSZP87qSrQ1WyFQH6h1NuZ7EnXR8vudetZzAx9EjykNUdYZZmG24JZCHgaa7oP4sC2Rns7doC+IwSm0X/oU5ayUUXcWPhBOTraYZkxC78RIRKGuXY5wg20sKlps9aXs+KcCGbmApT+aha01RyscAXhXfqbKYuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9285.eurprd06.prod.outlook.com (2603:10a6:102:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:01:58 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:01:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 3/6] dbus-glib: Support using alternative runtime D-Bus
Date: Fri, 28 Mar 2025 15:01:33 +0000
Message-ID: <20250328150136.1855862-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328150136.1855862-1-niko.mauno@vaisala.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045C6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::43b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: dc501962-08c0-4832-1eec-08dd6e097c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aVsDuM39nRIjEZDH0m8STx3ZmBv6NS+FXCn/pQwfDZ4BxBp6gMOg+X1w9+dX?=
 =?us-ascii?Q?J51K9ivdwKI9tTyWWKUs6dcNLrHuF6yfcBQD2bzAZ9d17zEk5VYvEtXLDRiM?=
 =?us-ascii?Q?G1ealsoNnjYFVRE2tjm/DuQQtvZlV9AwzBOodxMNh0fRezjgro+hOPezEolF?=
 =?us-ascii?Q?YXaI7ZG0uRhzJRW9zhY+Z5zejwBq7HCJ9ANgnElNKBFR7O+wYT7sagtgiAxD?=
 =?us-ascii?Q?9XD6aQMiVeAO65K/eYgEwvddaMDdeb6Hhlft8d62e5Mcfl80SXrkqjvT3wAe?=
 =?us-ascii?Q?TIeH+jT2Qlvw3ZSGiDj4wFTTDDCrOmjiJMBUIV/Ig1ysjV/M7N3X7Mcf7+BP?=
 =?us-ascii?Q?DIUCUGevAKvAQ8NaXbFN5Z/VCONkL1UIYkjDy0gqIKoWr1hynj8umbCNU6Tq?=
 =?us-ascii?Q?sR7vqHrF/aZYCatowLRxxwgT12J4iazM85mdyeL8PKDoQxzNhkI7wHAGkiN7?=
 =?us-ascii?Q?nIDuIuPXtKMRuhcx+QEsE220O1//1EqPVc8EvVgWeEyauTvRToDpMzADYfRj?=
 =?us-ascii?Q?5+2Vjml5/SRbfiWgaINLpNc6MEK7Q7P8Qvx+u5xHwYXlLPQJmNjCP8Lg8+29?=
 =?us-ascii?Q?WiC9Sj7L72xNSgYgBwijHmrNo+Pxe9OH4lLT5X4fn/0fDo9vjsV7R0tnJp+P?=
 =?us-ascii?Q?GxH7BtliLNwXsjawJGZWDMjQkoV1xmoPWxFSwoUDo8Z9k49Ra1exGQ63H7+J?=
 =?us-ascii?Q?OtMpZPelcKQN7/Whlo6VUjVnWmD0UKP9cPUxoIEzyEZmnyEJC3kE4bUImcs4?=
 =?us-ascii?Q?E20VRJIlcG9fZ1I3ah4J/443zQ0N0bCQAh15bHfZbN9cJduYvRIcKW3gPNLN?=
 =?us-ascii?Q?lYTopwk0/O4BUxuSJCTF7dntSgsivNHkZEl2mA25Nqa+ND/Jne71v/e04oon?=
 =?us-ascii?Q?y5nuUY0NPEXBw8yJVC9j0BUgaHvwHPIc86gw7epgqWMFG7cKqMJyYvtWdLpC?=
 =?us-ascii?Q?ApoM/6g5ZmdSAVjWxiiwGNVKP58g4n2C7mcsZ9UKVhu+toNHo9NYHKJ2VvYe?=
 =?us-ascii?Q?1PLfR1zXZ3vudsE6I6LWPxGf/MxwGNtvmKJdCoj+7PfA1nbD+bgBcXPxz1xd?=
 =?us-ascii?Q?Ew4MdQQjVWV1HA76fsEi2QU3Wsdxy8wGmLHVYkh3jeqL/gqZAxP09OXE6/vy?=
 =?us-ascii?Q?yzyUnKz0cgbx0LHC4eFKP5KSBTPIhc12gC3WeZk/wtpZs731Dwx14akwej1a?=
 =?us-ascii?Q?SAMXAPQ47H7fBFht/kaCcmX9KI1pLx2Da3bsTchfAB2KcxPOoJfCWO63bH0z?=
 =?us-ascii?Q?9e3CB5uvNFJjRn7KtJNbLDc1zTiLXy90bTfWJaNKDFGDTfUrob3yVZf9OskA?=
 =?us-ascii?Q?ec7E4BL2cJw1waIdOhEYR4SfVjBEYTzZaouoUOBxabbfSvufD60Omhm0urJM?=
 =?us-ascii?Q?y5o3qC6pTaKRUQhcpbu4/D7pKZQjZNEni+3Uya0aX6Uv87ykkeHlbIXhSd3d?=
 =?us-ascii?Q?dgJbiS/uJ+nxwW6CjEQxFC170owysYLS0REZfeKhtlZNNkjud13SEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IAdz6V63HPUqxhFVNTOJCCCHzxBsVzn0mvFx+737o5FZf1yqxkpiVfBprKdF?=
 =?us-ascii?Q?debu/I2zER0IqZ3dd8tScsIacsFviOD05lef2y+yUjNq42TSypCDYMXQmhQD?=
 =?us-ascii?Q?w7CeMn+bvhgmxaBc/7SkGHmE+ZEUqCzzZZSahVv5dvX8H4QF/sKdPOZej9Yv?=
 =?us-ascii?Q?fMZO4e4OT84EiLOpmH4j1m/ZetzsTr4hj1onShEixnaVJ38xSqexa90yTC20?=
 =?us-ascii?Q?4RT8Hx+nb8yU+s7ZYjs2/Fn5f+SNljowj7VyHwobmSm3oJxmjyyAF7fn0SNO?=
 =?us-ascii?Q?J7d2wxUm2HTa7hxxBNtqv+r7o+wZjhbV8k0mHRpB0HkvsTNR9y23pz0HWxUC?=
 =?us-ascii?Q?BiOUkaWZBzqgnX7TS6bRyNfK2jxJjLI0cpEO/CfE2iuLz85cpEEOGgtoAd4I?=
 =?us-ascii?Q?DM+33CRcNyDHbrcBxt5QXWIh9rJz6sXM2neuVCMu+woEZId0p8Jbknv+yx0z?=
 =?us-ascii?Q?kxgF6DimH4pgPrHKrvmAbqVqx55R7NnwLjjruAZC7m5t6Uw1j6CRcirenXBO?=
 =?us-ascii?Q?FvF5F03PM4lnwX9KKvxHbBUEioZLOM2wsADf56SDw3rF/IUcIIMiZ1sUw8Fu?=
 =?us-ascii?Q?3ANWxmFto0qWyIWGmbVCeKs/qMlkFh4mWl/WnyJxDOo94diZ5qrGbcjMKquA?=
 =?us-ascii?Q?02X5L7QirK3KoEhloNmG44M+b8L5c/4B4PiM9g0Di2CUdPk7Mm/ttrwm3OYn?=
 =?us-ascii?Q?8+EARZUCbuUWnFqJTN7TTsooI9w/2aOASoHdVjKToa9RY4rP4v8vyzXMO+1y?=
 =?us-ascii?Q?d34yHS8uv54KXFrFBaujukWCjKHGZB2oyKLuwDlFLP21tCM7xmHb1h7JHEwh?=
 =?us-ascii?Q?swNfZN/NaBr+44W/m8Fv2GinBF+xaaeZjLQYWKoUBYuGLTP7RXTOlYmVJ2OZ?=
 =?us-ascii?Q?UB+XFcyqrZRsuCviRfYS9Dsc1Z70Bw1Nk2TA0PVYni/iETDKda0ogwqnB9QW?=
 =?us-ascii?Q?2XpNUVtm5sK+3fTHZagc99dvUYX9ZgFtzzbKxPLOYWIDMimtT/fLYSKNEekY?=
 =?us-ascii?Q?Gxj0dklbmXPKWZeUKzZmWn369MnBbeTRKoHJJisVec2DpVv6ljWuFepnnnMo?=
 =?us-ascii?Q?PvONU+K+rnfrooUPIGtq+/133Q65Nhbu8GwRBkPXObN7ZDZhrjQyHlNuvURb?=
 =?us-ascii?Q?FEox6/zF3XvTPzf5cjwv6Y9qXdQRa9aAh/EZKcVh25iSm2Mdl+Ia/rPmYWqq?=
 =?us-ascii?Q?+HgAwjaFTqZg2eJUoFPmRVC23XpI0coJAa2Izdxo9H0lJ70H1s9+i1Rbx1y9?=
 =?us-ascii?Q?GotO3Fh229psSgmt70xCxrLliat+tD9LH5MewIx5flm7UP8JQAm0CCXyuRJ4?=
 =?us-ascii?Q?m1qXsGGDyIUKxiBo52+5bJtMfweoY3JYUq43qQUZEJPHdX9u6zxmaCcN1rJO?=
 =?us-ascii?Q?qUB4ZQRSzJ4Oc5cDBQKIvI2WLOtmad94nFGtzl5z2E3SoYPb6STh336Y3N53?=
 =?us-ascii?Q?6XTQlnTDMLW7kErtdc+83BORH/igOBsved0r+pgTNRReGh1Gf8TCVuol+YQL?=
 =?us-ascii?Q?q2+Wuz5l9bN2eWwgAbizAgOmFC+DwDcaCQjvzzr+GYGSDLOJsYxiO+pjA5ax?=
 =?us-ascii?Q?fmD9NLtUF9Ya8ANLOr02xMQyUsRMCefxkBQtz7B3B32TkuiGMml6FkpkA59B?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc501962-08c0-4832-1eec-08dd6e097c86
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:01:58.0854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3nbqaIPDZvI0+fp/H/zPy45esw8N3Ihsz9Sb7JvbuVGko5nGk5wseJmldJmGzTiQbZk2QQh3kXHx6kCYbtvgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213846

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, decouple the target specific
dbus-glib runtime recommendation to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus-glib_0.114.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-core/=
dbus/dbus-glib_0.114.bb
index ff7c2d6613..7908a02747 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -38,7 +38,9 @@ LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
=20
-RDEPENDS:${PN}-tests +=3D "dbus"
+RDEPENDS:${PN}-tests:class-target +=3D "${VIRTUAL-RUNTIME_dbus}"
+RDEPENDS:${PN}-tests:class-native +=3D "dbus"
+RDEPENDS:${PN}-tests:class-nativesdk +=3D "dbus"
 FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.39.5


