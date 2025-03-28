Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CE1C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:02:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.81])
 by mx.groups.io with SMTP id smtpd.web11.13335.1743174120694761555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ELakPLnk;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYf6PtraS9caPz6BS3jLhmhEdQr7k12Pl2mMgOcs0KRjno14EvJGHvmLXGAL5OrGVMNx/KjngR2WlKzo7cSqqqCOKWAg+utGJgx0A9WMfIfvDLaveoOEyCta6fB9Se77euwjSvquL3q4+bV0L4BZDhXSxscNtnHwGcRjFKVUUkuQjXyFfsuH6YcR82iXCvz2wOr6vKyNBGHtG64o8r7vnMLkbwjLBjsxk4gcIOAmVnU29hVe3jFEdOUfV4huFJPGEw847fhnnS/uQTR9UMlX5wea1ZpRInaewVPXS81F5m6Bd/N1B7DnRkXpmuOR5a+DRGNvqGtPl44lKu/xavvo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfUvcjfosgdjfHJVgW103R9yH/SwnGBV6HKP4YzEDpc=;
 b=f9QFhVgDJeVWGQhCMFzK5VUnh/aYQ0jqiZWykLK8P0xDv7eu6SVeu2XinCZibNE6KQgmhYN9KFBvdNzfy9qtFut8YsUV7kQUexS0jbtzqcWPB+ifLhjXHLgnH3m9jT7up3SBOXyi88stIiqzABnnrs8YwEv94NiGO0W+1/vNdNy6wPvcPpAnVOyU1x+lmUWdRY5T8gVNiDnZuCNJyHPfG4pYmLCVZvlBjsrlT38ATwNcr3tMk+9u+FfL4pl19L/6vEMBhMS3emMELtitBSW0q2Nr5jMGmI98bQbVWC/xhCb7b7yWgy7My37DBA9lZQkqSDWbwetfXeSSFPz4k83FnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfUvcjfosgdjfHJVgW103R9yH/SwnGBV6HKP4YzEDpc=;
 b=ELakPLnkM5JEY1q/t6hGWSmtRlcmoyTIOl6fGTal9dh+yMlr10eRzEpk1ibKZCCwgchhYzn05UCTHhkdSTx23AF5sYiZ7ZQuFA8EAnQUbd4dHLfF0Tyja1Wp1F5vGGJ0775qGCur7QWn2X6TYTtcXIZhllguDsJxK5uoZNxzre2jEgKrGxw1xLa2flN/cxXubzEPijpfVJUU+A+VvX3NdV0jlVLiS5o5vy3s6buYosXkGbmWiMjun5BC3BjpBarLSvA7qVMEBw/LR206/T/8LYYMmqCAIpJqDK4ys/ypPtUj8gA/f8kSU8jr12c38J6Ck8cmwV0sTAGpP5JtQbuClQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9285.eurprd06.prod.outlook.com (2603:10a6:102:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:01:57 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:01:57 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 2/6] dbus: Allow using dbus-lib with alternative D-Bus
Date: Fri, 28 Mar 2025 15:01:32 +0000
Message-ID: <20250328150136.1855862-2-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: e4926aa6-2888-4244-f40f-08dd6e097c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wQUyRwWuV67sYrjyEtS6E0aJ6jt8FRWOP8/5xGVfBYQ7kqBDo9kUhTZ6FvRp?=
 =?us-ascii?Q?jLYZ26g+v87INwffmqKtcjPPAJSnH5UzVRIonb+Sd9pXAM91zhvFlOD6psLJ?=
 =?us-ascii?Q?cDBGV2/LYZLiqcTloLeLuOluoR35W9i5zXc+VtqQyWAjnvj5Ryv3ac7DPqmo?=
 =?us-ascii?Q?Ywd9XUq780nfUlxcuTxic64sv9dARl2vBOlYlsTDvky+Mn+FMZWPil1bd+K3?=
 =?us-ascii?Q?F76TWgIJCxLiYfcW0VSB1V8I9ghK7NZJUITWGCaBZDObVbvKUtqFxK7DJZKt?=
 =?us-ascii?Q?JDrCvsX+6FDtG+2SebTr2KBDmOc8LqLWSXRC1Oz654eZSYr7GAW2tNlfXgpd?=
 =?us-ascii?Q?4XwFGpFwKKyvVlQk99LASH+51anGzchONOpx/jf2SA3OYSSADgl0AThc0wmV?=
 =?us-ascii?Q?NWzyrh3I+tbF6RGx6QWEKlgboBw0j862rPhr6Jp7O3qo9Iv0UztvnhIpJ+/g?=
 =?us-ascii?Q?RPdaTtdL3HtzrrP1O40+UMYrgYZTV9wCqzvK7ycgteTULt5UbwzWI2Kcjzl4?=
 =?us-ascii?Q?C5ZV5lkjfKJJNGg96JICOYouckL9G36G8UFMRvxe7Dq3KPMFNJZ9Z/vypFq5?=
 =?us-ascii?Q?ldLX81CA2U7h7jfZak//Cymr5QM/VZhwrsZ9OO98cOFtd+8yt9qF7R1iI1Qs?=
 =?us-ascii?Q?aQLwMHnUetSI5YZ8+NdIhhWTH9Qbq5l+lP+WQYSqcHvQUGfDYJQWJ898zOGK?=
 =?us-ascii?Q?6QgrscVHI8atiexOK1B/L22lzWo6GuT65L0pXTCt/CnEznGuZ7EK6v91H2l6?=
 =?us-ascii?Q?lp750PB26j2Vz2clQ+3QZHX5JN9bFyQlR4IPGASQa4qLDyUuZtnZVaDngixa?=
 =?us-ascii?Q?6HvIRECgbP0HRY/uKNI2pn/1+TWOBpDTOUxTh9ormTMO6srf8S9iaX6lxQrH?=
 =?us-ascii?Q?SNK7nRpNw4guWdxSlVfXjeGJSzbHG15X2VS+WvJB9oLpXtzKFoC7awXw/Gjn?=
 =?us-ascii?Q?dl5NYKKuNtx1VX0YG3D39R+FH97PTQL92fkFYkfqqCPPmrEnQ6hrK9hybsjr?=
 =?us-ascii?Q?+NIA0PXA4UQD9vHdlOJlVKSw6KCVq4gQ8VX2Bm4RQMe5FqsLcO1GeqzmunqE?=
 =?us-ascii?Q?VhkkBPWLK12FFQdeFJyJ5eu90+ZuYdjIoDGGOfA/NazZsmPTgYYZ5oJGMDhH?=
 =?us-ascii?Q?kk0X6Jm3NT2zvRjxNqLy4V1h8JAbpIfpiyRbcprVH7hJaFM4SqUw8rN278eO?=
 =?us-ascii?Q?OUSOPGOwRatz7WrecPWs3xmCgCvuB0Opknvc6edlHrY8s7/AxRotSQqit+UG?=
 =?us-ascii?Q?z/gj63cib69N0iIy6+ldx/+li4eJKNH+NGssyYqG73+Vzu1SQ8QPWXkSO+zG?=
 =?us-ascii?Q?DVDqEJzPFtud4ewJysNLe4E7Jz+FCEQI43+H5Wsedd+9wI8J9VAUDrdISPWw?=
 =?us-ascii?Q?KPvFk3nHFkV3ic4iBonaPZNPKCmBV6eBx1k8DTO0oblvEbniLHOciot91eR9?=
 =?us-ascii?Q?qb/ISEWkCtKphyA+IyzbW64JgaOcjLlU92yx29PL4pkXb5i2bqBXCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IERZeTZRZrUgcMCxpZqJxnbvW33MmIQr0uYb0pTkdr8Z9Ju8fkXK3+M1Vkgs?=
 =?us-ascii?Q?l94+KW7GLz0bxyYgfAIaaoI5/DrsxiygEmVgVTgbbtl8f8FPF4L1UdYipJ6N?=
 =?us-ascii?Q?BZJf6b50CK9R0PdQ1HIB/KsW4b9/bt0vVzs7QlOhqhZcTR+DJYTUFQ5eh9kT?=
 =?us-ascii?Q?M2f4dXRRLaKgr/Xt3NATfCT39NQbA3464jQ3RZr1DQSqQ4D6VpcLCpohpoEh?=
 =?us-ascii?Q?CfkTU/XMKEEegoHpOn4tVKxVTsRkWCCl14lKMdfMlXgmCTL1hHYP7GuBUO0R?=
 =?us-ascii?Q?1LsR04BBvcp4cslxHl2dEVPsvcwItKsZYoMEqwPzWRFa3bLivJ3DX729dNU/?=
 =?us-ascii?Q?iZJ5oHuHOklXf9pEpbofeWC860QFm/NjjXYxV5WSghFNvdpjJclNHU/PpAqZ?=
 =?us-ascii?Q?aizPXfJ4JBOs74oJTFuBy+jFjxxItZa/pIW3xNxZ2XxZj4Opx8S2eWfWqYCd?=
 =?us-ascii?Q?Y6Ja/4c/IGmn8qYvFBV1AAIn26DZ/+zUT3CuyhTm1+ZWfn2vRmuY1K70l0ak?=
 =?us-ascii?Q?HkqvR2w9iXPBUDNNSfLUtTqRFXahhFeiFq0ThJWk0aPINFm2MhoS6OnIp0aM?=
 =?us-ascii?Q?Us2IHQr1PRfWcL+qNWkrQk3CH/bEQdq+75wsBi+PJNvSvyHY1RN4YHX1fg/v?=
 =?us-ascii?Q?pMymX5FS+2wmkLKR1rKY6InWItbsnI8CgrrCOWGLsMKzlVKsnv9q5HwCEZfs?=
 =?us-ascii?Q?3Se05R4swi41x+SbEDyck8GRhIJepUQNFJMqjTXikHQXfOGSLZLhe3xPI+gt?=
 =?us-ascii?Q?zxqkysvV3gYAka29SRYVqbhPRjHP7+yLC1PdS3xbnEEznEvB5jmZ8flsrw8e?=
 =?us-ascii?Q?25dKaF3PyNNDUEXvqOxdqbAQYwS42AHU1otfzsryQ2BijhHtAqUEh4h5ygBN?=
 =?us-ascii?Q?SPy80fss6QD4YHz06P/DNYc2hmfEUceC3TmNFwZE67fqouTIrufU3R427d71?=
 =?us-ascii?Q?J8lQ4oiT8RrVd9xuOjMPampfkXPF+0Y7wGKZX1zaNAX/+PhLjswvXsigFtD0?=
 =?us-ascii?Q?yaAffEmqbU6Tvj0KHf6AjmwBtzWwZN2mCD5U+oy42VIE2jtTwXExgKKcolLl?=
 =?us-ascii?Q?71b0raKmZEWO7YNbeL8++98PxXiYtXEWM/GFJIZedRGOfUzsHw1+AjzkzEGN?=
 =?us-ascii?Q?A+ps/VvKnJ3nv48CmL2fte8dqc+hBtjvWMKV/r6RVs/PWUWFtZXuFRQpbPYk?=
 =?us-ascii?Q?6bZoazLJ4iFXnjbtyIsP/KOC4N3sM3L9iIp1740bJAaR+rG/ALwLjT6jb0dc?=
 =?us-ascii?Q?9UaQjd71ssxUtqTKHt7Rdh8N3d+APBUmuNRmgWqthm3KZUyWozZYGMkgolvz?=
 =?us-ascii?Q?kQRY0xi7Q1MEelBjW5TKR5/BOL3WEpsyAkE/B4HAsx/taZ5cgcgsr/WbJUrn?=
 =?us-ascii?Q?sIQDipuCVn6QQEPLv/+opSNuJhSS4O01jXOl/4/I5dzPpGFxgXGbeSoFoCIX?=
 =?us-ascii?Q?nCHCQQkFz9wgNUmr4u4TgCLI5myyICVSsrF71SryNqenSzFrUWIZvpBdbXyg?=
 =?us-ascii?Q?y6bJhvt5EZmU23v3k0CLvZpy3ZuoWyHzM+Zg6AIa0dkOUCTyzH9Oe8XA94tA?=
 =?us-ascii?Q?QG9fxPKfzuiNAIiwSnyAoM/5UnB+lIjOQq295UkWuzgId/X9/VwnYpOzi06M?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4926aa6-2888-4244-f40f-08dd6e097c42
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:01:57.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNtE+jhKp2KoRMe/K3/gETJM3zQHPfyDQG9W7ypVi/2pbznc1m8Qc3YB43hs6PB7nVQb5/arMn6WKSujB98PPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213845

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, declare the target specific
dbus-lib runtime recommendation so that it will honor the new
VIRTUAL-RUNTIME_dbus variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus=
/dbus_1.16.2.bb
index 9475e55b57..eeeecde946 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -105,6 +105,7 @@ FILES:${PN}-tools =3D "${bindir}/dbus-uuidgen \
 "
 FILES:${PN}-lib =3D "${libdir}/lib*.so.*"
 RRECOMMENDS:${PN}-lib =3D "${PN}"
+RRECOMMENDS:${PN}-lib:class-target =3D "${VIRTUAL-RUNTIME_dbus}"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool =
${datadir}/xml/dbus-1"
=20
 RDEPENDS:${PN}-ptest +=3D "bash make dbus"
--=20
2.39.5


