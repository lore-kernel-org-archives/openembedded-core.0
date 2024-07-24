Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBAEC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 21:08:02 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.37])
 by mx.groups.io with SMTP id smtpd.web11.21489.1721855275099845666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 14:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=QZqQ0lQU;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.37, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGjeXuhqYSIuJVL9LVwJcJ8huXJuLstCd6uZAc0BrbNmCGkPSQ/dvFb9xDW7mDDzcN8mgVxeKEqNtYpoiwZ6BAwPHhpi9Qky7sqy5fF5iRmLJD3kliW4nYf9SfZNOSC0HZjZKgBWPZtiN7k5CgbX+W9UY8QXPMpXaWHmzOLevsDevsdPzH2fcRPgC86OSDbI3VsadPunq9t2FVsPqioTa7bMKLgTCCmYYpS0yIHblbZ9kc0bolAwvrGFRW5SGhv+409J9Qeux2FhovmX2J7eSS4panw4jP69ioOERbU9ryvJc1AoCSt0ZSXG/l27ADyAdMMqysC7hayGvzuOLy+QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbi7qXt1RXo4ZygZoGvhY40/HpkaXXVbsgj3V9eJJMU=;
 b=uq0CD1W9FUoK1LWQSv1yG35CVhICrWZErDh5ty5UoNh7IkRSZ1L4zOv+OAJWVs/soO0eg9RRMAo/YgpfxE6N4urcaAXvhMgYJNIfttfDANipVuad+pdBQgESOEBY2l4LZe56ZEwTwEI4jEnzHLZeXEqOhcMEUQc1sHLK9cq4zbhruSBAftOsv9jMDywvbiB2N3xvbq5/n9ytXGH7/4OQ1Q48hwWDke4Hne2ioMXoDbf4q/gYPyxgZIvwPcbSpVmb8ARLm6qNR3JKgnb1vcskG9mIj44Y/DVzUkGWt2xOEmOrezmYPxOlClNaoGxo1lYxbLE6L0gfTQrT+V8ywsmJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rbi7qXt1RXo4ZygZoGvhY40/HpkaXXVbsgj3V9eJJMU=;
 b=QZqQ0lQU0OA1jAH71wI1Uex2I46SiGavju1F2tRGSZTXH+PG9/Xshmq0HM2l7q1Y+MN27JakBqr54i0PfgOaFtPnBT77vmzpGHVLkLBGKU86TEFZDeqkCjKeLMsTKX6gUfmWlclPR5GUrz1N9nBcqZNYtR3u4P9GXur1wVLnu8BrFWAxXucQeZOFHFgvTnhLJRJj9w3kkZGF7XQJu0YraYmpWTcTxJq9enKNoSUkKwS1fGcEcPyfvfeJjJB8myGXkpbFOZnFQ8V6z2zd6GtduvWyGntw6MvxgSIr0q+rzFOVNCDxxc80bcIhqctEete9g2bfBMz1n5JZWu5+1kIo0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 21:07:51 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 21:07:50 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [OE-core] [PATCH v2] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS usage
Date: Wed, 24 Jul 2024 16:07:15 -0500
Message-ID: <20240724210715.3457292-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0bdd40-5a6b-42db-78ad-08dcac24ad12
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M4qILmNnJz9tr96BM4E1WrHCIP7I7FoGOLySUpibaDQMCo9/x6duQo05yxQj?=
 =?us-ascii?Q?ppeiSrCpHIKJr4AB2kU+uYzMheP/Wp43K7xDrnwSd8Op2z94OmQjHY+QfvL/?=
 =?us-ascii?Q?4i6v6K1+LyBHf/EJzXKO7E2e7GtFVoS/QreUlLXoakwj9JPoobVNoqltslJE?=
 =?us-ascii?Q?v0Tor8ZumGuGEkxi99koMyzU+wyvo+vqTMLQIbMpxukZIx6f1G9zA9mNMqmU?=
 =?us-ascii?Q?ydG7jEPMXwp0Syan/AB6rTbEUZ9aJ3be5wt/1JvOnI6uLF1U8lP2iXNVq4yk?=
 =?us-ascii?Q?8UWgpnV1mFG3YWTbhNPA2jTLc9M6Dj89oW7Zcs0lXoQzQgrqKaAkvTz/ostQ?=
 =?us-ascii?Q?RRsHvO7ueiqHTPq8RUtFuGiTzy1I0eLMGY28iYMvgZs8KHRjM7TFV6B9R1Re?=
 =?us-ascii?Q?bZUcJlKqpFOpO1UW8QZZi/2kLaKEqr1G2ygXB8xgJiHY+7xQuaLoF24h1fK6?=
 =?us-ascii?Q?pp2mCNyEIiA+PEgKEWlJrLwrAgqqz8K4bqsI8yX1RR53+rd8Fj+ew4qt/CSe?=
 =?us-ascii?Q?jhyN0kxqSpEEjt83t6tvWtNgtxmo+WsQbaXvc6z1Dv89Bh/7vGFhd9J6EpSm?=
 =?us-ascii?Q?C6chiZeTJFvdWoVoj3tKJmKhMiCEKCSRzxpnqNHNNry462MnVWsiPxH4MhZX?=
 =?us-ascii?Q?TCvk9v6s8Q2AHOFiYwdkr0uWUleMQKHvZsHjMChBOsMC+UWr+TTB9sgsjXOx?=
 =?us-ascii?Q?GRM39ZxgiziZ5FLfJYqVgGSVQIJCEzvxyMrrfWUJ0JbpPbl0sCA692tae+4j?=
 =?us-ascii?Q?dTQILAo/1RAep4K70mRqRsREhuCgtFQrqv8TcQHdu6KLCG/D9AapPwjCgWnF?=
 =?us-ascii?Q?GQALXUpsKNrbdcGEgBtaL4RzAd9xtRvJxrgbJB6PtZ4RfyJFDOfwtUHyJbXM?=
 =?us-ascii?Q?IZ69g3M+777B9nqvp8lSCUH3YzGvWUzUaJkYKeuVnDFv17e/UClOPgB1w6i7?=
 =?us-ascii?Q?V9op/+BOnIf2unYk8vU24gI60ImWRe0t2vygujNVihokIPS0EMuht0mB9dPM?=
 =?us-ascii?Q?3awwNnlHLwbhICq4UsHXNLuOg5ux2dfswaVjA6l+l4QS2hqzcByFE1toOU4U?=
 =?us-ascii?Q?PSl+CQmmPfTsDp5IzKpuMkOKMOWzPq6vVxUo3EdU9O2hArkSGs64yen4rDK9?=
 =?us-ascii?Q?6ZEwjgNwEk7zgoDpEHgvfAquYN/j5VtnqI8BrVP4PsEBVpCy1Z0vSGY0s6aY?=
 =?us-ascii?Q?MF10n4LPbDsvLq9XxeU6i1NaXtc7HdcQLlwjWvZ7tVby7d2hUNGSaCYN2vEr?=
 =?us-ascii?Q?dC8ojv/2QBAGjV2Ro+Zf3UT0jx6yrT2zoIDCaqiaUYku3gbapVah85Wnb24v?=
 =?us-ascii?Q?jAvlaYqu/A6nI4tvRK3YSNQbblkojNAPH6ztc2Z58FIS5fP510825wiCqk/z?=
 =?us-ascii?Q?8NLmyr93L5ahAdrtRbYzHMtfrDfFmj074pmdTjEq9t8Whh3C5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DRsYYBxxw8H2hD45s4+FfUjdUFyqjAUQZ9mmG/n2iT5CACPlK6iHpv17Eyx/?=
 =?us-ascii?Q?SSW3qRfkIsTAYYh6iTRI10uk6/c+i6T920gqbvDXyUAL3WSI536b8i7tToyg?=
 =?us-ascii?Q?lOMWHh09iW9hNUts3CnJjzNrNDxDc7x+x5fJku6QGDx/7vT8a+vu9sCRRuRg?=
 =?us-ascii?Q?HpUioXRWho6KVz4AAHuYv1ri1kSL7we+XMGGpMieYNCdrGxY0l0mMmL3db1K?=
 =?us-ascii?Q?xoDImZagbuNha3MsWIrHzkq82OL17NktOkPuufgcoItLaX91DPiWUK9OfFFj?=
 =?us-ascii?Q?h4A5MZd9VzctRRO4Ahdw7KSrfR1zJDKuALXG1gqr4319lPuG5G+y+HUjIWgc?=
 =?us-ascii?Q?3JgM8Iug8pTlNRfSL5+h72ieLnK33M+tvm7xnsZJoB4wegH2pff9p0HL5toC?=
 =?us-ascii?Q?eQtxVqOloZravCsgbmiVVVY6yMpBagq5pMqyIygOlxOGHMIRxmBNQ8jNLaNw?=
 =?us-ascii?Q?TDA6McKQEu5y3wDoT9wdARk+GCED2fzlQC4rxZ9N8MDfL2yLtXm/iS/xiNc2?=
 =?us-ascii?Q?NG/cRQNDMpw+s5I0rQoe4VUL4n0tqaggaMqbEMwCCJUIa2VBWBQYBQxkmY+B?=
 =?us-ascii?Q?FfU3zpveH4viEMcqctaUXbwqIYlt3sDY+JnkbCIqbJwUDk6lLWo1LyrVwr8G?=
 =?us-ascii?Q?QFrDgdvGqgsmZhxVaJItj9uPgpWxQ3Ptu8Dnk6b5o6uqTyT/ma8Pw+MRsYJc?=
 =?us-ascii?Q?zl0NQz60Drt/na7I1FKAjVgJOrmTHXL7rgSfrjqhnNozHLdJXfuDeaL1VsIH?=
 =?us-ascii?Q?fFR6d+Z4FMcUj5p+YvgIPxmKKKR+bq8CRkNVs0tbOxxF/bABH51g7S/RMH9k?=
 =?us-ascii?Q?fVDfgTCPsxXR2Ep/NSQOqde8gbk7k+auFGU6VPmsLnJZSvPxuoUG1r4jJ4UW?=
 =?us-ascii?Q?aJG+5zf8URfmQXNBGcrkn536r2fdaxaBF1cbuNilCTvH/K0ODppsRhNbJEeg?=
 =?us-ascii?Q?pv5ABA0LFKwrYQjqJXBSNBq+SSjOwidqso9YDBzBx9JgahjFyAoUG0rHZ4v1?=
 =?us-ascii?Q?mNWy1id1kfxXxckm5qch/RV3qgS+zC5gXVkivIxljkzwR3xDQW5vWN5AqSeJ?=
 =?us-ascii?Q?fhJKaDbxSsVJAvRX6bOjccxoilpacs6BFUCnzT1D4skuoJTbNsA5UUSKOZuf?=
 =?us-ascii?Q?ZEbWv3Cx0sb9GxR2YtNHhBxUqc6OpQgx4XjTgu+nn3W5TC9qn/r7g912nQ/M?=
 =?us-ascii?Q?Pk6uF0Ut9vlmbr9/K4U/3JbVEnHodyZY5NHsBEPSodTGmtNxurzVNrdw8tUQ?=
 =?us-ascii?Q?ZTaO0Z87L1mSF7hUkqchcQi6vn2To2zR4Z4KAh04wP5uIdIlnpOnAN8LHqXn?=
 =?us-ascii?Q?K0YCFAaLZhhmaGvuHUSeWsRoPm1fbxzdY/281kR9+L91/F041EGMuA+bC4P3?=
 =?us-ascii?Q?L+w81ljteosc6+nGKcEk+gZXPpFLDbLSkE4TprQUau8ODjLYXHz2aH/XiFG2?=
 =?us-ascii?Q?A5onwUbrcYGFS7gLq42bzL6Dx5/8RmfDW7SnUKWaRxHQUz8Ewb/Royqh8cwW?=
 =?us-ascii?Q?d1CbdTiNAT62GxC7eSqnLn62P+GcXpVmKsJhaqpl2kW2y2e2NnS3WHdWx7sK?=
 =?us-ascii?Q?wVOoVY4neGlMOaeqocLhqwx4j4gSBtAnDtmUeJP4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0bdd40-5a6b-42db-78ad-08dcac24ad12
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 21:07:50.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maBaTx99too7LfoSqTl1A7ElaZ7/1ZM7o9dM8674NTmm9YN32grBxX4RwYwDmbpddOBX/D3oz3vPkogoi9nPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 21:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202485

The implementation uses the append operator to include
GLIBC_64BIT_TIME_FLAGS in TARGET_CC_ARCH, but it places the space in
the GLIBC_64BIT_TIME_FLAGS assignment in order to avoid a 'spurious
space' when the value is empty.

68b50d3 time64: Remove leading whitespace from GLIBC_64BIT_TIME_FLAGS

The problem with this is it requires anyone wishing to assign a value
to GLIBC_64BIT_TIME_FLAGS to add the leading space, otherwise this is
the error:

cc1: error: '-Werror=3Dformat-security-D_TIME_BITS=3D64': no option '-Wform=
at-security-D_TIME_BITS=3D64'

Remove the non-standard usage requirement with a different design that
uses the +=3D operator and moves the arch override.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/conf/distro/include/time64.inc | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include=
/time64.inc
index 510da11039..1361bff7ad 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -8,15 +8,20 @@
 #
 # Working to address those (before Y2038 rolls in) will be appreciated.
=20
-GLIBC_64BIT_TIME_FLAGS =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64"
+TARGET_CC_ARCH +=3D "${GLIBC_64BIT_TIME_FLAGS}"
=20
 # Only needed for some 32-bit architectures, some relatively newer
 # architectures do not need it ( e.g. riscv32 )
-TARGET_CC_ARCH:append:arm =3D "${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:armeb =3D "${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:mipsarcho32 =3D "${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:powerpc =3D "${@bb.utils.contains('TUNE_FEATURES', '=
m32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
-TARGET_CC_ARCH:append:x86 =3D "${@bb.utils.contains('TUNE_FEATURES', 'm32'=
, '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
+GLIBC_64BIT_TIME_FLAGS_WHEN_NEEDED =3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_B=
ITS=3D64"
+
+GLIBC_64BIT_TIME_FLAGS             =3D ""
+GLIBC_64BIT_TIME_FLAGS:arm         =3D "${GLIBC_64BIT_TIME_FLAGS_WHEN_NEED=
ED}"
+GLIBC_64BIT_TIME_FLAGS:armeb       =3D "${GLIBC_64BIT_TIME_FLAGS_WHEN_NEED=
ED}"
+GLIBC_64BIT_TIME_FLAGS:mipsarcho32 =3D "${GLIBC_64BIT_TIME_FLAGS_WHEN_NEED=
ED}"
+GLIBC_64BIT_TIME_FLAGS:powerpc     =3D \
+    "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAG=
S_WHEN_NEEDED}', '', d)}"
+GLIBC_64BIT_TIME_FLAGS:x86         =3D \
+    "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAG=
S_WHEN_NEEDED}', '', d)}"
=20
 GLIBC_64BIT_TIME_FLAGS:pn-glibc =3D ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests =3D ""
--=20
2.25.1


