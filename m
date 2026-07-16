Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E099C44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 20:07:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3905.1784232414811342458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 13:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=au87F6Cz;
 spf=pass (domain: navimatix.de, ip: 52.101.66.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8xealxbFDzG938yDThN7XD0lC9RxrPb4OSJayTgdXu0hCdH+ur557mB1qA9gQm/niYZkHszILHeMMDTLiRzr+Ad4JVjNQJl3QKje3lGzdzaMoNpktcjX0xsRcyXbaK/c1n+UIZmF6qEXtZkbVNG+eOX4HcMYLnbVzoUKySRAIIowBzTjY6Zmc5UoN84sbPUXGbfTonCfDkXolFsXlxin8JC6Zss1SAsx5WbdoxWHIzhLx4vbKhjKFzD/FEgj6SUJzPfDl6aKQjaaRf8oz3CRzCXWI1iX8nB54L6t5AfPgrXhbLUU1uAczFGlpuw5PDZ5qoG1VtYvhVzwi+U67fCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YV2tj+y9Ai71ClXNR0eYD8ciq1h+saozY7/LornOfE=;
 b=eN7HBEX28UC1ZWWZy1wH6cZHcf/J1gql9mcIG/2if6UBm36oCL41AKqgANTvF97VbEheCUI+vtU8igYCyuceSt7Ydk6d6nsHMgb8+NkhRwZNHV8BeqNb+Nm2Qba7b/2RpOLGLL4iHROH6BroMrtrdlfVdAa8SDf3XSDscIkS6vV9+NHukJwneemhxhamU+CT2V10LO9luDeFfpSE5fpfTjU3i3ufHYPYTSlzHk+4wT3aD6zHI9jbi8tiWTwdfGXmuZoIQVoZg5seHwdrd94eMAkuG0YHixfmLQii1Ptgm8TpbjTHigr1cemNTYOfAI8tF6xcsgP/evIM4dHZdgGKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YV2tj+y9Ai71ClXNR0eYD8ciq1h+saozY7/LornOfE=;
 b=au87F6Czkv+kG0PY/c54PpkWl84Qo+saPkOnZ4F/pQVhbMaRtn5MFVYutnePZxXnzQYTqDVd7s64bgaWpu5Gnvwl++NNyvEBc/dNH4pPrgHqAkcBfVEM+WHAMRBW2VHXYBqK0ymLH936dGCijdcdas4ZIywZo/rPPTHaHGTmrto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by MATPR01MB12542.eurprd01.prod.exchangelabs.com
 (2603:10a6:250:4e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 20:06:48 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 20:06:48 +0000
Date: Thu, 16 Jul 2026 22:06:47 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com, 
	joerg.sommer@navimatix.de
CC: Joshua Watt <jpewhacker@gmail.com>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] base-files: Install /etc/mtab in a systemd-friendly way
Message-ID: <8b2633f8540d0417d0014b0a3803c4e8b0a37a92.1784232384.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <CAJdd5GYCYRiXjb9c9DNhvXJhAMt22hLtEVrseh-4N6t237+Gog@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJdd5GYCYRiXjb9c9DNhvXJhAMt22hLtEVrseh-4N6t237+Gog@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::8) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|MATPR01MB12542:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba8df65-dc76-4333-d343-08dee375c4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	9ydfCDeTif0QZ9FhtlbwFhgON7kKRk8ekA2gxWc2l8wtC011pwQgRscG/QaA9qdvtI2i2IqRPflaj4eupS6F7FmvKltUjKgekxaU+8yo+/lspXvqr7Es6g/mOl1cPiaU2F6cH2PqG5vp55gTO2Gd+3wq3ggDMS0BmeBPsz9GpMQDNZ7MxpnXqcWTanQ4moF89+V9+8iig67aJSPf8+RHIqgTOzzw6rkOjp2ga2Vs5qw5sIwcfHOgR6v/tU8cgelf268zYirgiuge54RK07hWlfy6PkIdY5mgbpcZNQ00a9fv1wxQvEUm2xTICeQvrd7HDYovvHOrp0IU1IuwWzj1etd4009M7EAbk0Wk0NkZDRV1OidnWWgBZsDYTHOK1tpCAYnhJVkCsrkUf/HcwheIWmUAJPaU+7/I6+GTpxuQ0huq7h0P85WZHWFwMjhyndfTECbNooOKcE9TTwoaaBJz3pEj7qStkCCfMt/+H+fx3i0/rfsh9tEUC/Zcy9GuGwoGoXGiPWwmhwR6Ps7aoasratUNDLQFnjjK4rK1o664jKJ6GHSa1uBrsocYh9SLdrYgZIVVI5oZxw/7FqMoKkdNtgsCCEQgSTxAo+UK3zVqfPW2TnHDGso7Ey56QOb+7Txnjy7E5NpMJQ7SJu26eFbqgyZyHR4MVeEi3Br469p/EVY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8UN3e5vpTsb/9zINgWTbZa9dXK1OUawcOX7O1AcguF623OlAzCP8l2nj6XvH?=
 =?us-ascii?Q?DaHaDpH5W9GADIpYZsFqPyBecGpU37Pbkp1V/u3mNhgtlOXMd4gLOSMLjidw?=
 =?us-ascii?Q?omg91lKs3V93c6EhN9DJW/9d0hNzvomB50sgTShLEbJfpudoZbhrNQfTPgA6?=
 =?us-ascii?Q?76p2IrXR2TRF2oeS2FpxF4u3sYEfSVv49s0GKtRwbNbC5hY9t6V4qu/Cxlnz?=
 =?us-ascii?Q?pRkjgblWEkPec8eMUlABHSMg2uAoJQvb+hRtWAhvxHAmN+wBuZVAfG3Do+MV?=
 =?us-ascii?Q?30KYqOU/O8RUzKE+/YDR2Nc5ymwRaHXdMKtCBfwYCeEn2LM+qJcUFNmP6+UC?=
 =?us-ascii?Q?AMmmnYLI9uo3OBNIrfgNFDrH+9unf42jHZxmQX1kxbPwOGlQsN6jOUb2unGE?=
 =?us-ascii?Q?2mfEiuXpnPpXoLCtVz37HwHXEQDjlh3+kI9qso+Rz38Dj1qz3XULWrNPdNAF?=
 =?us-ascii?Q?vdpNmlsTgIRVUgmQdC8v/V2qnr5xMHaL8S6lNhVWW6rcERW4sU4qYkkPqwVL?=
 =?us-ascii?Q?/0jgvY0i3OXs78PeTE5IEtmqFkQbDoGOpT2gTjzUKXX6HX9HaO2E6ZhuKaKK?=
 =?us-ascii?Q?lp3jhEspWOO6bpfTdiwM/VuIJyyvNLNuL0VUEKhqmzap9V5Ntru2kmQfBslH?=
 =?us-ascii?Q?k+qsjEhHfv2yULdEBeTh9t8zxaN+xvIEgs5pn2L2veqEaiXO/K1jg3RjqMuz?=
 =?us-ascii?Q?/wxvbDL+qZ9pxMv940Ihv5jTDsqLu6qsfxDrg3nP8k/LSHmNa8vGlGZ64ICj?=
 =?us-ascii?Q?292WZxezA/xRuOPCw0pTjttqNMNm7FtvlQpgkvakUDvwSIKAdIc6MNDqY2tm?=
 =?us-ascii?Q?DUOIg9hDPYLXBs70jUTWiBr/nI6W48Jhgqwku3ikCOGKk7x1KhqgSJBv/6gc?=
 =?us-ascii?Q?/7y9nahbR84W4waLmv5ti+2Xtf75JDl/kkqPDzB2NTkHVQ0W9LEUjQ0txHnc?=
 =?us-ascii?Q?8GyP2bBwoomNDf6VFlDMHufAclawc4NbcaqQEsXQGfzOMzuTCkWVCuYRzkl6?=
 =?us-ascii?Q?D+Esid7CmmTlJgVOz+VvaGAQvs/aLcv3x7ixG6J2P5Ry/DLebJObBhqTVkAC?=
 =?us-ascii?Q?yqem01nww3ZrqIDxjhYK83p4OlK3BA0ewMxRk329ml9n+yD8Zui0UJ8AI6HI?=
 =?us-ascii?Q?PZs9H6gbBwCYeYgkhPBQwAMaXk+O63fmmVwio66/ATVqM/FRbk8F6ZyUy09i?=
 =?us-ascii?Q?rL72VlViqMfpdn+IjJEuhsMSzND1OBORXAT9zGSTaKtaMyjaRyf6+NoBYTZK?=
 =?us-ascii?Q?k8/CZ0m/u+j8/luM8rmQQMtzeqPgA5Lh8GadnfE7wVfobWBvhUBG75sEN1Qp?=
 =?us-ascii?Q?0n+hc8v4s58MZfGktrui5qjfIfsRw4twY6J4BFamasXflin9xxuD43f5kr2N?=
 =?us-ascii?Q?ZO4fbVrMaUO372CZOLeOLMitp6bd3aP+HRknFdXmasCiXGQ/ZA++Sp1V677b?=
 =?us-ascii?Q?y6M1HQQ4xvAzzcwhMYqeuzH21kE2cp7aXFMPUnm7aJlqK1g2k4wDBLdzVGQW?=
 =?us-ascii?Q?qfuqosTbKHGvhTpetOoGzP3tguOHmZEtustBCgWOy7WEJ69SowgREBPpEXPC?=
 =?us-ascii?Q?tpnayzm88XL0VW7c90jdjbY9pj0PwXR9U3rITGgIFjZ4xDpQF3LYm8eOcbod?=
 =?us-ascii?Q?tdoAHOOx+R5vv6aenq2NCMRIVI+TT8MG45gW7mcoi5mj3L7F7yKjW0Lr9rxc?=
 =?us-ascii?Q?1cQc9xuvyXrMGmQFPLzWYvuZqjPzsNCSOVU3EEhtjRfwwkeZCgiy2MyNPihf?=
 =?us-ascii?Q?0mNhvEx9RKPru1ced/1DdI47Azhlpr8=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba8df65-dc76-4333-d343-08dee375c4b7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 20:06:48.8351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftaxyEbFAwCuFBMFDiYBSanhHAycnPsR9kxIYasE3UGt3rWdp/MLIq6999aPcFWyZGwQgWMbRUWksk5f6XGtKZjnzlBL4DAecufF0mLnNNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MATPR01MB12542
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 20:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241107

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The old mtab pointed to /proc/mounts which itself is a symlink. Systemd
therefore tries to replace it with a symlink to /proc/self/mounts, but fail=
s
on a read-only rootfs:

    systemd-tmpfiles: symlink(../proc/self/mounts, /etc/mtab) failed: Read-=
only file system

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recip=
es-core/base-files/base-files_3.0.14.bb
index 99ac19eb58..87814b8e12 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -109,7 +109,8 @@ do_install () {
 	install -m 0644 ${S}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${S}/motd ${D}${sysconfdir}/motd
=20
-	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+	# systemd likes to have a relative link
+	ln -sf --relative ${D}/proc/self/mounts ${D}${sysconfdir}/mtab
=20
 	# deal with hostname
 	if [ "${hostname}" ]; then
--=20
2.53.0


