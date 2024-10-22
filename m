Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A97D1CDAE
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:17:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.135])
 by mx.groups.io with SMTP id smtpd.web11.13385.1729585032565837892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 01:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ioENaaIL;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIsLBXxaZGRNLA6SixDtQzxJUc3fZK7tr6SShqSSTbDdkFnJWS2Xixvu7Bp7gCj+OKyml4CS0bVLKpCJHhJCiFjCblmamh2+MfxUtVseXo/SWYpkJH1wUal7NI0YlrMWuLM1/OcPw9q3CsWSvVoIYJFKE4SVdx0tlEjVzIo179cNepoO9269VuhEKkM1Dwk74OK0gt6PKS0CV7JoMBelmmn2cuC8J2E1P5tqkglRKyTNSI0tiWtH2b5r9kCASA7mjwVl1BZ3nlKwVKYkiJMxsPP5U5pGRv14D35uBMLYHGBGuEQIuA5akAIMvftPGmSfR1dDKycN9W4eZ0b2aMbDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bv7J4XdI+I2ZTw7v+AMA4vgEHGLZCgSqHuqXLkoOKw=;
 b=qCEpjWPWAFEjNAiBBg/eZQ+Md7RJcMaiFKj8kzy2Dsg+quV4duVTlCL5zswJqznMr2wBT5YxVAm7nMcMzHENeYFQei/4ZBziHEuflXi3UhBegy/PsP9l7bWjSG2JWW2+Tqrcn9RSOthwkV46uwVV87IN9KaL5JoidttylRI+T6CeeBpvAJoEIWfcFjjBY5wgzNNeXJEhDmciljM+2Y3gMCbZtpw8VxGD9mi2K2xD5GreYxtHvo4rwu+SCTRnrKylMcook2qVWcOHS+i9VM9/HLLh23x89X04AqA8QfC2JgKJsgy0Ha59De42UGd0pYqL/xDg2DK3xrqcWC6milnRyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bv7J4XdI+I2ZTw7v+AMA4vgEHGLZCgSqHuqXLkoOKw=;
 b=ioENaaILRmRwxyo5SsZxdlOb5yZDhrZ707c4PwRy8aCEJeGelOxbxNG0vF6Z5ceNk9tlk5+1twLWfrdvyBmbCX1OGuPZD53+TSQPSduFI6aUqwme3ttUKwn3yrNVHWxtC2bAdyTUNd0SVECGTP/1+x/JRzX+SpuC+eeGdkZ8pcUzKJZXMSnG+Q2e2r6bUM3sdqIQL9cc3h2stwIk8xuAqonLhETTsB/oes3Il8lLgeop+o1fMzCJCEx8ghP1O/kACuzLZU75vQJEWaLcklPD7ORxqLQ380axqCp5iqugyhk3ExINXK5Hfv1nYt50vJvtqw7awNH3FToIYLYmZjAv9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8976.eurprd06.prod.outlook.com (2603:10a6:800:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 22 Oct
 2024 08:17:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 08:17:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 2/2] bitbake.conf: Mark VOLATILE_TMP_DIR as obsolete
Date: Tue, 22 Oct 2024 08:16:55 +0000
Message-ID: <20241022081655.3970573-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241022081655.3970573-1-niko.mauno@vaisala.com>
References: <20241022081655.3970573-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0053.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::21) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: f9eca6a0-d762-4c92-273b-08dcf271eb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RywI7b7Qes1RFc0osHlbhO09k1IhtTbGVBHNqeUgQ7BH1J7oIj1chC+HZfCP?=
 =?us-ascii?Q?SPVP0+Vu7sM7/cE2LnrwUmjXiQKWde/mK34xDo5h3HmvaZy2CY5A7oDoieR+?=
 =?us-ascii?Q?8Gfl1C/muVKUKf4p16G+7nT5+Y3+kfLN+j1caWEpivW/Iwjabxho+Myj38jg?=
 =?us-ascii?Q?sH9DEICRZ8Vim45j2w3kuNahs2CSo01s1jbT+wfPc9h6SBqki4IQvC4xg8jv?=
 =?us-ascii?Q?9WicXfd+0mxYNemjP3rvjV/8Uop1NGgqjS19+DP2QcNqb9ZVrtiYXVT1JhXw?=
 =?us-ascii?Q?idIQvyvm/Jr8evwYaOIvhcx8MK+dayNi0YJuDMxqvrrH3as632NsJ5X72QEO?=
 =?us-ascii?Q?MbT0dJsSHxufv+rfbUow6jY4kOwV91VVOkJTireSTgN24f307m7YWIAwzWsK?=
 =?us-ascii?Q?hp65r+aqM3Jp0vt5X8OLmq5skeRjoOZ6jAUXgSHsvwOp0nVpEOrnPk5cpxgT?=
 =?us-ascii?Q?QyuIOMsEGk3QSo8A2WJIjhWd76sAih4JmQHaY5mTaxPI9FW5xGd8oto7zdDH?=
 =?us-ascii?Q?ceyE/5BB+BmXKU4Z6yMEzbXXaKVU/+DwR34mF71L4qAQsrlSmA0xQERnXNcC?=
 =?us-ascii?Q?zMqrNyexBjkCN6ZcB+GNIxF3dXBQDjEp15sQ56tE4Y4rYz9fs5s6Buhgm/2a?=
 =?us-ascii?Q?8Foepei1Bmcg/5hwsBVNRD+wABAb6PH+dQL2NGFRTfJ7D9O/yueuW9XPx5Dr?=
 =?us-ascii?Q?6gXzFWI/XpPBbs5OdFw1fO1hL6l3Qw7BVfqPJFyHAxo8xYj8Ulkisy/9gf6v?=
 =?us-ascii?Q?Zxy/nRWqtHpk9NRY7Qt2V2EAuQoPyGWSts6q9otexFsNOoD0os35N+VLvJeP?=
 =?us-ascii?Q?uzmyWS8s011ZQTkqHgCoDHaFOldlH2HDgO74nAQEuoHvnz/MfV33C1Wfm7ER?=
 =?us-ascii?Q?h1wCwaeKjbNbkmk3WI9A36HWcEGlw4k997MOlaVZuq5P/VO4J3kTQbop3roR?=
 =?us-ascii?Q?lDIZ9UBrHq5ZQ0ETxYQZYCOQPqq/43Qaujy85e/ES2KpWLFlY4RSYc75hA5B?=
 =?us-ascii?Q?AwA87bDYP0PcNYpXwESHjAnfgDndxRqHN7HtT7DLL1rXMD8lHdXbkabVPCsl?=
 =?us-ascii?Q?uJ4acPRSW1/38MvRaBpYwYYPoJB1HX8Q7fh9mBKN2I8kAJZ4xXCRsjySxKdO?=
 =?us-ascii?Q?Zh5yuxgej9nlYmAYluflc/qTuICnnAq7JxfQv/+bUArLFOEeHwZWsUO4dJnN?=
 =?us-ascii?Q?Hqk/yjTaujzLxaQYZXNmKPEaDms/SaJEBXFd4UEC4Rh2OUQDCXOvPGihiO45?=
 =?us-ascii?Q?8ZHyM+o1ebqOVatAHaGv4+RCe3+s4kM45wAUGuVhk1T9SflEKcX1+UJwKq0C?=
 =?us-ascii?Q?uSiTozmTb2de1MAxEPgem8j1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YS0qcnsXthgZNjYgvKT50enVh+81d085KcbGwQy7mGnon+N9L4fK3/2l8vqm?=
 =?us-ascii?Q?wnMqfWSKyJyEh60LWNImkYirNvJVNgEZjAfKv12B+rxOj2zI0vxKMTtQ/tLV?=
 =?us-ascii?Q?e3VZdUt1Iu918Tx73XczhvtwQ/c2AFgyIGmMGVfl1AjRVQ0eyB5S2wFkl9EO?=
 =?us-ascii?Q?6dThxLatgHbv5B31xVp9Rk4WqteHzgPR0xNYNcdVr4vhCTa9DL0e9rb7xyZY?=
 =?us-ascii?Q?kIlQ5vE3VVkApRysEl8RUI0K3gUuk1p0M9ONYxHDupK2c13uW8EfFQkf1LuD?=
 =?us-ascii?Q?i8S8H8FUHiMtylXP/1v20TqP7k3XqOFHu2j93n/10q/5wCjBB7CNZ+rRe1S/?=
 =?us-ascii?Q?p5CSo6Bj2bqdm4AR6EXGixaPrIjo4ausw+AeSCiSvqnD96VHf3d58i687eOC?=
 =?us-ascii?Q?Az/PwtPGq/r7H6+BW+0HKIbryhhido2wS4V3KcIx3A+yNasVWiUthUfg3DOr?=
 =?us-ascii?Q?a+lUt7NbTLQaHVstMFux6rNVXHnZeFnNlv8XWfs9Sig4zxDRbgeF0ZqfKCWJ?=
 =?us-ascii?Q?bwOtdYFjk7NnNPT5a6qGcLnpGmgqoReAT/ppyQayOZuIIXW3dSaMcUmHHuCZ?=
 =?us-ascii?Q?GC/Eo4h8Z67XEiIhsUUFunZ/eIGSqCJXbcUCOmOI39B6BByFSuwPZzQrQFPk?=
 =?us-ascii?Q?anD+mzE/csQmD3XcpC7dTeRU4qFOIGYTUxntBnTlOoyo/RT6VX9RmtO8sJB4?=
 =?us-ascii?Q?sLJFYRayWmXNTqf7YNdBGzNH1wEnzMsrVLLSA2r3Wyf3QypuZ3nQ/lqk0qHU?=
 =?us-ascii?Q?S0KnYfVarx0Zgl7ZTvnSP5IF8W3tV3AeaPenm5jdu4EoYJ87QmFey0CkcBx1?=
 =?us-ascii?Q?o1jm6ggNbqMdwqjaXiIRnPi7+TT+K+lMavo9Yd7XskYsI5kE+JyqH6lqmTSQ?=
 =?us-ascii?Q?31I4mDuSCVWEWRmrfncLnqE2CeiZe87xji5+V6CIEVJ7I9soozdDA0QWWjUe?=
 =?us-ascii?Q?+N2X3Zb058y4XuxJppcjpQVIo+550FTeXpnrbI/eb/2Tt4OKM4MWhYs26arY?=
 =?us-ascii?Q?Z5sXavL5L4SFci56+Qyde9Ds8uvv8XEidx62ojNMID26PAeqEN1oug8DbdMB?=
 =?us-ascii?Q?Zmy25GzzT9OYDrByAhCcBS1vi4/XPDNvyn1pfaW9dBtxNy2EpWDFoil/tllc?=
 =?us-ascii?Q?06/mn5F6fwd0CLtbTAmUAFkvMsWMcyPH0+GP0UFQC8ab14TdIGeOKmg/CNZ9?=
 =?us-ascii?Q?v9ZJAVxtRGYJufqljdzq93bv7QnWSjWwPaLsY8JJSgArVJVgO8hZ4pf+fhPf?=
 =?us-ascii?Q?Uai62PhscsR6b1FiBUEhs33/f2AzY6VqunJkQjMFKoInAGqiFvGm+gEtC3bC?=
 =?us-ascii?Q?aDRLkvQ9WHo6qASo/WuTa+JBm5VQvJ4OrEPpYZTwn5Lq/104rx9U1wNdOo5x?=
 =?us-ascii?Q?YzbDDJWqpqituthxbg3GtWT8Mw0liFjyfaBY6i7j0OmOj3g/HjDkhH6uC7M4?=
 =?us-ascii?Q?UQV/VUG2kVPNY12MgyRJdppkQZe4irqqrTW8eEAATYwPdvSphCW4o4CiuCi1?=
 =?us-ascii?Q?qZIou2b7YchJnQ0z1t9P19CWZTfrEl7aa9zGmLvjRbpm1cn/qPakDAZVbeFG?=
 =?us-ascii?Q?AfGRKMQ4apuY1kc9J98f7ML10ddwr4VOfu1AE+lX3Kryolm7aBxQNcr3Oaag?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9eca6a0-d762-4c92-273b-08dcf271eb49
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:17:07.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2nmW7LsMBvI+5tux/l2dpoAl6YnXumiaEfAuZWv0FaytKcZxKTUqXWP5kaePfJ7JAOy0Ml1mSUNk/ALE+t/fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206143

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900fce=
cfe64c3536f1
("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)
so ensure that distributions become aware that it no longer has any
effect.

(From OE-Core rev: ec032dd13a19e4d4a332f06ace87f1f02143c3b2)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 59ac1873e0..1f31b4fcb3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -107,6 +107,7 @@ BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] =3D "is a depre=
cated variable and support
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] =3D "LICENSE_FLAGS_ACCEPTED"
 BB_RENAMED_VARIABLES[TCLIBCAPPEND] =3D "is no longer used, modify TMPDIR d=
irectly if required"
 BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is obsolete and no longer supp=
orted"
+BB_RENAMED_VARIABLES[VOLATILE_TMP_DIR] =3D "is obsolete and no longer supp=
orted"
=20
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] =3D "INCOMPATIBLE_LICENSE_EXC=
EPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] =3D "INCOMPATIBLE_LICENSE=
_EXCEPTIONS"
--=20
2.39.2


