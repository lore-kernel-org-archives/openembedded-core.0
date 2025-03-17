Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319CEC28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:00:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.135])
 by mx.groups.io with SMTP id smtpd.web10.53023.1742220020291075222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=QEs3SZTg;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.65.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSL0O9e2nuSDv/9fSVFlifPi/0SmYD2m7ZzPv/eJKqbesy/Jg8nQDzEuHfortKkfnQpFU8/GD64NGwRk8H8MhjfvudasT+vK1QCjgXYT8XvYFsD7kdOs8v80P4cgk4F81frvKO7KIl5MtpmfOamaqwwwMnNlhbUqKm8e+XTcX1pX5FzpKP5bHt8uxjw0DdUAohfWHeOBQpM7+aXlAijybj645JwZMbich3iBCW/HOu/IQOWzmRGVZbhzpvUazarIwMV/2tyaa3HWrW0ZdKOajIxNzGHk4A/L+nre5LG8rf1qVAgLab3+ni5i7eWVlfA8I+FBd/Bi/iCBDk20onHc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqwoEDC/e4z0ttL28hCzGXB/dqPIZXymdBinMgZ1Nk4=;
 b=Rf6I6cPv7Ql+sUR3JuWpSyMOCM3BeuiPb7NzmvesnsGAAm9D9BqLod2zt9/0bsip7HS2jJ3n1CPkD7dUAPhzRnTHUSdguTfztj/GvvHLyXdtlYom8k4vNdaZauoqkrqgEZE3Xa7PzYfHCJ1qSYp8fqDnwj9OG2/rV/ohkEZw01SQXWhrkMret6wMRIdOYDrkIt9WYgAxLag0NtwMPDaqz8ov0n7sAz+OhkpKE8dz1+yvPEW37FkqMGCpSyho40Awe0pRYNNnUkNIR5XWDw5g7GMzafNCc/99ftGhfOacjHlV5hob6va7gPpUBIxnVID7V+VlrcLwmwOqLNRkX+rhWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqwoEDC/e4z0ttL28hCzGXB/dqPIZXymdBinMgZ1Nk4=;
 b=QEs3SZTgCAna3eB86omjD+IIuUkvFy3RmOzxGqqzXT4JXGf3+14/W0jY0iEFVSqcEgPdUkJ1CJqTx0DUWIOm7yvXEhh9SCv/Ar1xK0aHquGX6eZDSq8qmzSXCLjlpF0vhepGFIFpbe7/psoHVENKpJJlA4w77YO+WrCoezZ4qAHiNI2jTcsKCwWB11fx9EqV1oKVNjXdyjTOJS8ebZN/PVn49IXbSmDEejd7Aq1DT9Hat6syT+XFwLJ/9q7YasXrn598+HvNYyNAis8EPGDaE8WJGXQXkVsjbiUHo+ogcN1YBjxTRcqKyma/8j4Bq/tCSFv1P4NKbFZSNSP9hvF/KQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DUZPR06MB8819.eurprd06.prod.outlook.com (2603:10a6:10:4d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:00:16 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:00:16 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/4] at-spi2-core: Avoid non-ASCII characters in FILES
Date: Mon, 17 Mar 2025 14:00:01 +0000
Message-ID: <20250317140004.1808848-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00007A86.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::618) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DUZPR06MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: fd89ef9c-e9d9-4efc-e39a-08dd655c0bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9CXn68XcAJJt5w2469MKkqJnl4JhyhoemuhuUfTwPLUFg9U5q76JWm969EOb?=
 =?us-ascii?Q?W6TsUtMOXxoiSuMMDgT/Tbl9vjgA7FsW3/q02aeeDNuHczOCSAH0mSMPoyNN?=
 =?us-ascii?Q?3QNDh4gPcKiKWHVjYqruBxarI5aTyo0LRGel7ANZ8U81ZsycDsRH4NmuLcW7?=
 =?us-ascii?Q?9BOlVwsy5rzgU2yyOaT8qBijjG1heIS0SmfkPQIAtFiP6lEuCNmT4AlZG0cg?=
 =?us-ascii?Q?5sRRRxXEppnDKNZxQ59OVsQPUOAIRGyIOOhxxco1NZ5ba7uLQlin1ab/di+I?=
 =?us-ascii?Q?QT0utf9ccljZX4nbvaSjqI96dfTiFCMmj50dVGH3ftCn3pFWpFTlviHErQhW?=
 =?us-ascii?Q?b2uT/adyso5pRchdLa3Ky5pW4IvxURcGwt+zeCF/pCsrDtSpyUk3adHKAk1B?=
 =?us-ascii?Q?ENq3WVISUtvwQMyxxUO/JmVsHDz+TBhu6YjWK43Jj4vdi7UvSw/K0lEEnRUk?=
 =?us-ascii?Q?QqnM4TDx65ljQ3VIbUOp+5y6U2wvFbnHJ9WRip7YG5roxE3kWbBeRMPylx17?=
 =?us-ascii?Q?fdcawJnnZSpzng2kWFoggrPgELrIva9HZXg3e4v8cUmG+/D7LrRYH0UTqh0x?=
 =?us-ascii?Q?kiH5F5VdufpUAD4sYWotUykhBP7mm2YEEQ9IF3461shP9bx7ppYF/rNUvjLM?=
 =?us-ascii?Q?nLS67akJRLmF2Jc8myntpM4ku9L+bKlU0neYvl8kIkuJJIKd9wJInusG25Uo?=
 =?us-ascii?Q?cPHBFDAIGIk2pUPB/X7cSH0fenVSlPntJiUaDnHrLuY5sYzYldY3mA3sVUvy?=
 =?us-ascii?Q?UK2LqhGgYy9osNOOHsYGFmcTeIRgU8FlVGBlnrVJzyfnLVKtaIaGJC3dBXtn?=
 =?us-ascii?Q?KwQvi78ckb/Btt70yI81sTRk2ZTQGkG1k4HiPVdxdmGqkzbJ3FPipKaveVGI?=
 =?us-ascii?Q?e6OD+OdUoWRPLbM+6qxprDstEim0yQc+OnWsvwePL56xujaBOXxnIbze1XHE?=
 =?us-ascii?Q?OGTw9Maldy4dUcK9zStpygyIRrWW0Qe0w2x11lBb5o7/L++W4OVp3DNcRoB6?=
 =?us-ascii?Q?n02/d9RrD4mdPVvfi7a4V3XPVkSsH22He1/sBemk7sLbTYWiiVg77qmIii1q?=
 =?us-ascii?Q?1joWbWUdqMXcRijyB+AQt3aGA5waZaH2tcD9asCrvz/LzUwnkgH/a3TQ2b6P?=
 =?us-ascii?Q?/gOTWeWexIv5gt5Rq4OzOrYINaxEsfJIN8VGpsdSK4oqquLDNfLeqq/B7t/A?=
 =?us-ascii?Q?lHLdy/Z4qVcz5RZXZdXqBZqoMGYuUOgv/dxkOMnM3aIMRCFcoTryGEiqSA4N?=
 =?us-ascii?Q?WYByscCmCPS8lV7l9cyOwPW5TqGp3Xad7McGQChQrEQzS93wZhtkK3NWsXiU?=
 =?us-ascii?Q?0Bp46KtfoMGfMIZgvERE4g8no1Ah/+SgBgwoLA1bJsPZDeBwJsJ2YNRJpmPE?=
 =?us-ascii?Q?slGq5tVH9ft52caVT91Poicg2IPn+A3QG5gkZ0hAhsefO0y64imbgKIUbg7E?=
 =?us-ascii?Q?qhiLHoeXivk5dHd9qBAicQZd8XK6hMkB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JJzSnQ8UKDAF4lWoVgH9vzisDU5pCR4r88gkZQnSbE0RFXbZhgtKqemaVNcY?=
 =?us-ascii?Q?buSTQUJ0dmkWS4H99xDlEXIDBHu+aI4ibsQ66CYLn37j/s+caSayv5X6VeuI?=
 =?us-ascii?Q?MPTnhCyCMf/bvPYM7vGuhT3WhHzZzebrhsku4C2GStvtONnL5qxQexDUcsqp?=
 =?us-ascii?Q?2CWadh0yfsqXwyo9Jlmpj1MCap62WSn2l1yyw+e5xq4X+lsSXKSJrjqmHUQ8?=
 =?us-ascii?Q?k66cBhKXTK6aBD/JNBdXsGATlc9BPlPn88Kq9MtcVKcVrqGWEzOCZCAvbK2R?=
 =?us-ascii?Q?/3k+eU5f9EbppzlsdUVwhRmv2s+5Yuc6vtFf6dTiinRVhylO/ElhlAkrt46H?=
 =?us-ascii?Q?u1+gEH2KCqel3HBmobWS96o+MbnztOM0u2kI2SaMFKhabiAAxtZTPN6zOp/O?=
 =?us-ascii?Q?oZHyq4w8Po5z8ShSCp09P9eUZiJpAecXOO8+E8Z2e9l2TAVpRX4JKxLBEetR?=
 =?us-ascii?Q?wcv92MeMyKU1hxEoUXzu/wQA31XeETTSUMyyqrCc/Ql7BOCj3b07i0+22QKR?=
 =?us-ascii?Q?gX21dLaWg8AWhheF21AnsW44Xh81iL2Qr5s8ACgWVk5Saw8fzyjZane0KTaH?=
 =?us-ascii?Q?bMK3N3S1AK1j8cj8s70t+IBfHHhjm6V3jcHDuHhYRx9vAUBJHLg5YW8JmUxq?=
 =?us-ascii?Q?JEIVDDs5zdQNgApKoDexfTuCQy6wqjqXRy2aaygyJbkkr8adtrAskaqGw0T4?=
 =?us-ascii?Q?6PEpBwFC6geypZBekoffs7IUWoAZSWVanpeESth1y6VgPSKLYnZ+QzbkAKaD?=
 =?us-ascii?Q?eytMDY1Vf8n+/lzWK+q4PFgt26qBLMqNN8DeSWrFAnrgYsEeitxKyda5oFYo?=
 =?us-ascii?Q?D596Ze5JlbmEfsf9dC+s3CwTSCssvkqBjGggVURfsm1DO8qTYTg56eT+Obxs?=
 =?us-ascii?Q?xbtLqj5pgFK7cICSOk7X/ACpn4kZoHPEvOKccKHgOEKkbpVQeHGojeZFDrc5?=
 =?us-ascii?Q?EQrxzQJUz8HaRj6765xNBpMbuDSV7gf1dKvWTqPRC95rs+xxKoNPHD5Kejmn?=
 =?us-ascii?Q?ivbsVC487uXJiOY21l3k7JP5fMUc3K2+WO9pM1lVKJh/H7LsWB5hCW7IdwlU?=
 =?us-ascii?Q?kJE/PG0tKJxrBAgs/j53Ob5MiwVqxdA9oUhtfqyV+H4vU8QjkEtgxD/2nyOV?=
 =?us-ascii?Q?VzgqTb5nsyxhwSjw0H/Sly1xdCq2HBRQJWWT1ApyXiizE8WIOfI99Bb0//nF?=
 =?us-ascii?Q?nlMRhMhRWAW6/EpwLQh/RFAgR/OVzTlQN4cPPRypfTK9S5hGC8If3WCwxySR?=
 =?us-ascii?Q?bnZHYPKAoCJLvKFNqm+VvO6TVrDEbX4qW8Pu9IlOsXkqN0kA3mm03tiPqogZ?=
 =?us-ascii?Q?PQ6DU7BnctuABum5JnapQYHBPYXX6yx6wwmscMrcgrA1uunArCj2Ss9+3th5?=
 =?us-ascii?Q?fa4w3Wos8oOUiF7YV32zg7k29m+DK2/zARoicWQoFx+D78H8WlrnnsmEDUNV?=
 =?us-ascii?Q?kZPxZxiA9ASrcm6eB15cpEQXO2IwB6FjdiMM9vXZi0ER7nJxB4VXi4K7d5OA?=
 =?us-ascii?Q?icjgIp+a9+k4owDmqLTYqaWRq/YfepE06BAtsy/mKp+KwU4KftHKX1nfp31+?=
 =?us-ascii?Q?VAuIazSF8ox1dRPBTHyeRKIlaKfkP8hEV/8WcLNX7RN1v5Jv7v4uKyiiVI/s?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd89ef9c-e9d9-4efc-e39a-08dd655c0bd2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:00:16.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbaiIvJH7hDlF7tSc733TKQTTPnvvFGLAFaNbkD1l6zvOButTGE5SJLRqEGjIgLPgUIxQiJiug6Y51i/9VGp/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213100

Replace the UTF8 character for non-breaking space with regular
(ASCII) space in FILES:${PN} variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-support/atk/at-spi2-core_2.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.54.1.bb b/meta/recipes=
-support/atk/at-spi2-core_2.54.1.bb
index 7b87783735..17bb955f19 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.54.1.bb
@@ -45,6 +45,6 @@ FILES:${PN} +=3D "${libdir}/gnome-settings-daemon-3.0/gtk=
-modules/at-spi2-atk.desk
                 ${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service \
                 ${datadir}/defaults/at-spi2 \
-                ${systemd_user_unitdir}/at-spi-dbus-bus.service=C2=A0\
+                ${systemd_user_unitdir}/at-spi-dbus-bus.service \
                 "
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.39.5


