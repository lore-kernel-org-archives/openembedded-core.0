Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837B4C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:17 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.113])
 by mx.groups.io with SMTP id smtpd.web11.20054.1743516309641251854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=pb/3EV1s;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.70.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNCIKAZA0NPTtdj+PBIq1neFQFDnvb63V9olwsDwZTU5vzkYIan4iDplW//4T62aQvBghWkK+1s88m1dgrDvCd+Jmb7rcD4KOreS3Guoy21j34MXRoQbt2WBpA2J7Odpw/7bEbxCm33j/ZSfJm4tQMukhl28sErvgTMbuQRucbWcNBPPzyrdZpynW3sdVHufhYAd4MlIkAEC5wbTxwZ8wllFlj2BdJDDEp+TVXcTfX0hZrR4gid2N12jwaPK8zlndBxQIWPnsi9M5GOchfIhpZn4fKq0k6H1wRH9BTVIjRHRtyH84E+6aoCdrBRnYhkovZWMEVMyVmqOZ6NUosTVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00xHJ0GyR7Z0wddjuf81diQS4ok+ESue4iFQb1bYknE=;
 b=iV7aYTywGy7j51LiAnum7OdEaobJVj6c2sXUJQjw4cYIA1cmlqDdqWfhGIVjp/L6nLudtNXYN5vXhRlVQThAN0mKuJ4c1fMWfsBJCiGDsUUMrxdY7nhvueV4bFJDDRq6xHVHuuiyiHV1qgk760GAO/JWVJPbZc7jIQmF7o6hiA7V7dGzyi1RMxrYJXZW49HJokLPbxor3np2e1yB35ZgKLLEGDAtC8dE9JKhlAbngI23lCba+o8dbLzZVOBz9UtkxsHhWjit0PxQ+I6bwCFTsk0ShwnuZYQpkcJkQwH31ZcMfU/lUfDlKI9tgN0eyF7p1ulURadOtwos4z3QNi+LZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00xHJ0GyR7Z0wddjuf81diQS4ok+ESue4iFQb1bYknE=;
 b=pb/3EV1sp2qz8xaS3ush0KAxxbfVCWHtbJ9XMCYlx1KuqF32ou6yyOIxSvic908gEdTXTNqmRG8nqiOu9DD2bjO0/pKwW72iTF4+vqDF4G5mZTo22JxyjbpG7TdkOOAX8KcggFjtK+EU48rWWT4QKyLNyFc4AAReK0ztbkp0cZeZQHrX7s9HYXi4hshIly7Mfdb65y+dsDLBglbuXUzl5hUQ+RXaCPycmk4B/7gPjE3k/bm8gfxFnvpFsBAMWrrUPhPEFV2UmMvMRXW/ODmqTRkZbLpa4mB0KKxHWm5Ut5BV64DCCcSP5WQOoLG+/wX9Gpm36jUwoijmuGV+kq+omw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7088.eurprd06.prod.outlook.com (2603:10a6:800:1a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 14:05:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 14:05:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 3/6] dbus-glib: Revise RDEPENDS:${PN}-tests assignment
Date: Tue,  1 Apr 2025 14:04:27 +0000
Message-ID: <20250401140430.13837-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401140430.13837-1-niko.mauno@vaisala.com>
References: <20250401140430.13837-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003849.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a33642-4080-41bf-ac32-08dd71263514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LFGBlL/0NeWxX0FsdpOSqJ/Y2w7MOChHV+Tfj2eupK44+YOmwWy9ERFpT/gv?=
 =?us-ascii?Q?1yYoFNNKzQbBcO9i4ROUnRfHGIuaGBEm9GcUWxR/sG3gRhasA2rUO9oPJMHG?=
 =?us-ascii?Q?D10MxQddAz0Dj0zeOdU14Hut4mHbLAzw2B07AB07kmhBueazCFzdZdgByUHA?=
 =?us-ascii?Q?MkfRTTPZUr35y9/GiBTbKMNoo50Qo+06+f72REWOBufl0/AhYqPisXrizG7y?=
 =?us-ascii?Q?V5PoP/G4C7lo17nsdaa6tFDNHA9qaOR9cnq1VrfL00Px44qi1W6QQ4hRCvHw?=
 =?us-ascii?Q?oyW+ef/Kp54sMaQbBk7dhYwT0J93S8ni7PQR+gsSC6gmU7ANIATzWWzwpKXM?=
 =?us-ascii?Q?PXrLX/4jPRCUheaLW0zOvM+AdIlTveZycs5oUXfLMcagKA//HDHf5vc7sUxe?=
 =?us-ascii?Q?UcIuNaRdOcTmMoWndZ0e6VItIXpAg4ZLjNhhsFLmB9cXS70dQNLdxMI4mQpM?=
 =?us-ascii?Q?MMZPX0tcq00Aaye/MSEwOZUHjcYOwP46wImni5E3J4W0MxhyAoU19o4ampfh?=
 =?us-ascii?Q?XNtYDViJlH0s0XHYMDo1LYVQz+heFpWTd7SBOdGDsTmVui+anuIb8BeYogiX?=
 =?us-ascii?Q?jUaEmrPO76PG0eSDhfs7+n7x9qaWGIFuxh4SQB0A/8gPWy2RzJdFGISgk5c5?=
 =?us-ascii?Q?ixDuEyjOwNTgZ0euGq2lB8roiPbMpeVV/VxzX4JLGloldbnmrxTkNpZlMoQP?=
 =?us-ascii?Q?+f+jBkqCvikVLF6ID9gIZWzZKJlgy/0VFgmFxWvp5p+eP0y2YYjSnwdDBLOP?=
 =?us-ascii?Q?DEzmgbVra0boeo2MGM+YBzeg3coODQAEYKCMivrDUksseVIWTpCdVDOpz3CE?=
 =?us-ascii?Q?c6gZydUPI0Y/mlZEId5sXnqe9N+KERmjn79yFXbVTKEZQuuMSXb5nMv7G9ho?=
 =?us-ascii?Q?pEGxNLrnOdsd/bB9XJQZlCfoJCVhgii9dPHE8XqcgfGKEVFd47WNJV1NPWci?=
 =?us-ascii?Q?WbnYoGj0f1HHj8GwQAH1ThMiDdBKUw5jAqZAvfuzQUmGWLD+oOj5w4OFpyQP?=
 =?us-ascii?Q?q3+2mC6HeCIWthf3wCQNkB+fgJpP+F9N15ys1uh3UrwINJ12bayDA5hi5ejf?=
 =?us-ascii?Q?y8UxQIromR11sPGDaT0e5dc5edIUtyIOtOC7FW2J0oi2oJktLWdNxlcYWAi2?=
 =?us-ascii?Q?EO1o2lavMzP9SwhnwsD5/LtCiMyITK6AmJnd2MN0CSw++ummBnIJcojpLLcy?=
 =?us-ascii?Q?3vwsetpcfBdJ6QnQwkCG76KQM9NauF355HiywlYZJc+bmgX3GVgrK9/xSpMA?=
 =?us-ascii?Q?si06cHh+HdmFI9PYLaRRsFZNDkfzsST/I3AfihPR0kYr8mRdKOw0TfDHOKYQ?=
 =?us-ascii?Q?JGJgilNqw2Q8FuPdE+9urJ1wSR9zZpeNWdqzqQA6MCF0MMWjpYx+usLQMQdZ?=
 =?us-ascii?Q?O6xxjXf093vJ7moAGyn+jrPznnH5uKK4TqqlWUDv0mMd8ZgGPWRfo06ML9ro?=
 =?us-ascii?Q?P6hCl6TlBeao3t5s/zfBN7+UFrhYyHck?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BD9iDZKpq4ZDdFf5NCcxMSnNl5knntil7ZsMmS29Mg0D51gZtNUk5sWI7Pjs?=
 =?us-ascii?Q?DoyBbmymvhzY7F1SVfFgaGl78IRfj2YiojKGVb4YqYF58d0siI0q/j7tQcsS?=
 =?us-ascii?Q?nVbD/jEnH5r9PB8cdLgTLTjcMMumvAWnUi0E4ASDP2bXRa1/XMxc6TUnE1GT?=
 =?us-ascii?Q?3HwORC9zXml0iN+yqpm0MdHOPrjg0pS7qd73Nl8NnMXrSTL3hYIG+VNtOosH?=
 =?us-ascii?Q?fU754rCZogVV5iD4ntLlAdSgRPcrOM4vvlqAyNKfPFrqriATszsXMyFIG0wH?=
 =?us-ascii?Q?45PchLSCAj2GpMNRG2QBi6gRawSwB+NLIxTJ4v/cP+fhQhNncpjInV4xt90L?=
 =?us-ascii?Q?omESv0qLLZNjxQRHKyYmwBIzEijcCioARoi+4ZBtuncRVrP8B43pDsAqsCB6?=
 =?us-ascii?Q?rfPLyhBR/kO2uc2hOmHyqEfnRbQKqmbqiIcbnG4rK/IaeuB40cxCQRBNSIFe?=
 =?us-ascii?Q?nbeBG53DYIsKwr0IwcVPDFwVUHPS1pqacsSNfPvv6tzyvfw1Pji68UHZb81c?=
 =?us-ascii?Q?ZBr9rx52qIAKVqVCFMV8PbOH+umG/JbBus9NyF2lTFjWb+8E00QCMuCT58wV?=
 =?us-ascii?Q?2gyo3fM2aWoecsA/12bIndoTd7LF2/8QqJP07L1UN+H/feJdK7icQRNByHV3?=
 =?us-ascii?Q?R05LXRoMibU8ID+pyNaFR3xyYRltu4rifvjwGj1IQdRhJMrRihmu/o5FbJbA?=
 =?us-ascii?Q?GuCZWyJbxJlDWvD7dW8BRtSj0Zm9yG/JgBULQwRzv3CsBLXoauE+H4TvrggU?=
 =?us-ascii?Q?aGb11KryuRCG0gTQvOmbBef/75duXLVY/9uUVtjsEE+E3WZ1mNo3l5qvSfcl?=
 =?us-ascii?Q?Oz0uAeQbWds+UnMtSdDahhWrW5KBI5XXvgouoaAnesBs/Ccx0fPWvO1HpQAk?=
 =?us-ascii?Q?5lLYmg2OY4rnDQeKC32lp5L97neL2+aV4dTh4sP/R+rurNsTK7oub2MSJdvT?=
 =?us-ascii?Q?llspe75Jwdln++yKFdnhymGRXYC3HeZ1Vv5h1C9yLkgf6nYngTN/0qeKSnUi?=
 =?us-ascii?Q?hTh3q2xRRddMxfsg+GzB/OamTpGb1SL+fHrcqbqVb63ccmzpHUjlgaz34gPK?=
 =?us-ascii?Q?MHwlFxr3zX1S1y/xoSmceuIIA8YfeqlKWF0EmipZ+1jNun5mTpY7KycgV9D1?=
 =?us-ascii?Q?aSm7BKAj3t8sUkLY5TsiiSJFHwxC8fakbC9aS2BkldnFx7hSAUnj/3hwUEAg?=
 =?us-ascii?Q?Ght5jX7RqPymhxutQpVUhgBx3uJmBpJ+oXr6wAdOeeg5nb+3NpbUjGhh9L5/?=
 =?us-ascii?Q?Hqyj1GfEKN8TosSVpAmnkb95BVb3fz0G/Q5bPSv4EdqabudvJ3iEPWsczBA6?=
 =?us-ascii?Q?E7izxpDehZp7wKRmWhIDCJJH/B8Bv9w6pHFMSrfL6ov64tOiMfdDl5WpaX4t?=
 =?us-ascii?Q?vbCk7qStLesOf7xK2CFKHO6N3a3DXjIe0lrj+sO+UyzMljpvlcf11UMeFSr7?=
 =?us-ascii?Q?h3oWrWlDnkFsIXKcL+eVMLgjYsXXwfVAxWfEVTCxxZbObb80Q4dLLoD2BoCy?=
 =?us-ascii?Q?7wK1to0DFdS890WczN/x9f84EPL7zPbHU4kUzAyUADDo1CsS7rgsWs78+YIn?=
 =?us-ascii?Q?yniZ8evDqxme4sp+AdIdmmAlvZTrUkh/3nTNXzlrUItuFKOxmdbYBM7GhM6n?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a33642-4080-41bf-ac32-08dd71263514
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 14:05:07.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29rxmahcKGsy1hpze7+XQRet1X7sgWkl227xQlIkjvaL1tNdfyT6Cstz+qEZzVdR6RjUiRaVkKEOzF31eBXvUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214131

Since this recipe has 'dbus' in DEPENDS, assigning dbus-glib-tests
runtime dependency to '${PN}' instead of 'dbus' will induce pulling
the preferred runtime D-Bus package to rootfs, thanks to libdbus'
runtime recommendation of ${VIRTUAL-RUNTIME_dbus}.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/dbus/dbus-glib_0.114.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.114.bb b/meta/recipes-core/=
dbus/dbus-glib_0.114.bb
index ff7c2d6613..28a9d4a4fc 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.114.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.114.bb
@@ -38,7 +38,7 @@ LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
 FILES:${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES:${PN}-dev +=3D "${bindir}/dbus-binding-tool"
=20
-RDEPENDS:${PN}-tests +=3D "dbus"
+RDEPENDS:${PN}-tests =3D "${PN}"
 FILES:${PN}-tests =3D "${datadir}/${BPN}/tests"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.39.5


