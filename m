Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD746103E19E
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:00:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17813.1773849637322579934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=oMhEFL/q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.78, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXeTtfm+uUkCaMOIU7nlBhQlgjtof/GTMZuTaV/3mOiPbjBkg9DUsbh3Q8+r34ovbyWZnR2hnfratgLUK3g4B1X9GX8gkX3rKsIn9Jnr1nVzForDtqGKHRUGGtHSbk6uoio5HKpXzeWSVwXxDCDgjRJoPNYaiFGAUgeRAFb91S8/Y3wS9I3HtZWquaB6X+eaodHVODWMEBc3UnO7wnOgrFwQvj/ai40EgnirjyCcsFptQUhes0asdbmaj6YaKpe1HUndXYi+HPEE+cjqnnP6GUDJgT++Dw2c3NWH/k3VYASFQ3WAgTOmSLt5K9nRAN+s/GYRe9t2J7cPDrBiZ5gBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xXMl+jbfG/H0gMuDW3tq6ssngo+tRs/1Q91w/+fQg0=;
 b=klOUpuQEpmVk0j70mNl7jR7Fcrxf/P0AmpD9tRASphxytJr7EBCsYAO2jvoosyM42xnxObRQnOlDQdnB1GryjHqo/Y06T89wHdwzepPzgLBTbXz1Wk1derfSoCQYIkUjmY65vvG3cL5Rr1tMxnDormv8rSpEujbWmnpSmR22eF7HLLSLO9qeR2SV8Yb6WKmv2guZo4OKVss3EbIgGyNdKyNxzZWbW9CMCf/GXWR2gkS1wS7nCdzRjsbfW/+KsZXrsMTsSIyRM9g/DqgVQD8+uJnrzigdP5kwFTqYiJkAliFVP/1cWDfWVgz+xMe7H4GKMCgOoFcnoss4qVYE9/F3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xXMl+jbfG/H0gMuDW3tq6ssngo+tRs/1Q91w/+fQg0=;
 b=oMhEFL/qnBF79tL/8ISrB41LGUwS3Hn8iR1cVzsLzNGJ+Ih2T9IX8SoyEz5OtSz3sxhuwZYE3428ySAzvMyS18R9le8VyG6KGDw0bh0ntHnfjV/af6EGLbFGVq5qq6sXsw5eJ5o1kJec4fsZcgaMXXJnjeLZq22ByCGnAhFcZifWMujqWtrnsLrhT9EFpKN1U67xy/lnK+0RsyERUatrmkgjBk1AoNRv10RwugQIKm8/6V8MP3su5A14xMc5ByTVXs3EOny0kMTw0EqH6nW6Av8+KaD6X3flBNBYM/1kDpfMbmK8Bx3Gz/V6gK7Y02QKUIK4ySM8mi9NsEByQBaTBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AMBPR06MB10971.eurprd06.prod.outlook.com (2603:10a6:20b:720::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:00:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f%6]) with mapi id 15.20.9700.022; Wed, 18 Mar 2026
 16:00:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] documentation.conf: Drop obsolete INC_PR
Date: Wed, 18 Mar 2026 16:00:17 +0000
Message-ID: <20260318160018.1765725-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::13) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AMBPR06MB10971:EE_
X-MS-Office365-Filtering-Correlation-Id: a51eabf5-bb8e-4e9e-ce50-08de85077c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	o8mh5fLWSqCgsi/xR7yfsipPeNmUl1pPoYEnRwxFENEIWDoauHORX2vBh5GftZY++uKCIwsc0X0mmzdUWUV80EuvP4hySLm27X988wpDX/41W54hCpXq6DM01il4gYLS2rplkCq0Alax4DO2EghX2u0Ghx2Ruj3P0PWE1Ko/IvQEdtFjuM/enQF+/VqnMQG5UtBFhakeW8YG11y3rppaTFHuE+4xf8FuzJVjJhy62zsZh2uttSPBhKnYS7vbch0wuR6vYzzKvFuPJNr/OrgInbSaK2bpGLA4ecVI1x+YQyFnJ12rb3yV2EgBG0hYiJOh6OeGFci0u/YVJ7+QDj2C56rXTi8Yv39LOX5HRJzIPBaOZ9f1SHrhCBbTw5LevjNaWmszNxhTRY6Rzm5Cg5vzJw5/2je6w+v6K+eGkbVnKZFv1w1xQxEPRazi5fiH0wMOy0UcyAokZykwXeoQCnFvj0rgaf9sEvolwTLlU9PMT1Q9J8ifcaJFRLSV/tIgRiMmwDHvX9Yetzxdlslxjl3iOXqcZ8ucZCv/9l0zG6KWhhg/DqBWgX8bYNEFH0ZU1H1yjcwR/WEJftRkM0qtwEIzdn3WUllSXyMIUetD9z37ROlaViLRK/t4Iu7eJaJISPMyygd5OXEEZWHxaAyQ86tFk2qf5xl/McHg27LL8yemcpk6+nMQn25gOZQqNl77xNR13KFziyhn7zHqPuNBaBYMrP0lt2GS5UvmNc0lhPzGN+pqoFAAdTENk39E1H8Y3rEV7EM8el3u1gcLi2VgMHbP7IPoAvzMnC4eOr7Yyc5Gl84=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BQznrcdgHBd8k6RhwbsXBApYczuYmId7u4njbTSoSPmjsO9yNstMDEERrOkk?=
 =?us-ascii?Q?G6WWd7654sMNrnNad3TQe40HygrsVSk36aqgjG+/AwsSKHYpr8K6NTEBRiaj?=
 =?us-ascii?Q?bR7EI8gzACq83NoUY2zzNO8DHERyczLnmP7UQuuwebdrA9BQJrAGk4pxyg4y?=
 =?us-ascii?Q?ge/1Qih7WwDd5/6yDJNFzCKCQFLSJp+g0pJZwjebdUU886oODXh+18nRdAyH?=
 =?us-ascii?Q?ZJ7B1wF91Tc5qsowCJ9k+sCCXUDD5UY1qKP+iXodyNWcIgzAq2yr8ZSr7iQs?=
 =?us-ascii?Q?dG2aynYLSoKd2k174IAT6nCwuioH1EcDi6MaNDiY8AuAH93xFRzZxPvWrk6S?=
 =?us-ascii?Q?46SPx8Z6shDl8nnEj3sMs4QGrXKrVhB3qUR0/H2gcLGOLAXv/v/HyLWvqg33?=
 =?us-ascii?Q?oN7LbeFL5fzXLFy1mE+3c6iGNUFj2NWVBADkXZekTF76S8z2ceY1j4dNC0c/?=
 =?us-ascii?Q?F/3qjNzvGtQKxfyx/P6MfPydTwk8VUl8YlLK05oTaNJSV3bEQm7HoZkVkXca?=
 =?us-ascii?Q?LMIQeuazBj1bGHboaqiwxm9BqcTvFbrvDvN8SjhI727Zh8FIlLNg6HEDcScF?=
 =?us-ascii?Q?pK4fgo92fVsj8gOIMqiikQtTpqgUtsxX9mKLOYDNRB6UwoGfYdCWH75NRrwz?=
 =?us-ascii?Q?G3+Qfx+q5f1hd4OWNloYsh+l0DbiYp3mxrLZsCl2oG3OmN0GuOsCY4Zj964h?=
 =?us-ascii?Q?Iq/L6vDhXOleZCIyIL0yWRg1C4IdgYe8VTBk9wMTCXuVkcysjc35hkToyu9W?=
 =?us-ascii?Q?RuJEQX2tgc6A2PEuwR4ZAn+F1yfCLDmtO1MjjotzO4SCgluCQI3TRjmyFwi6?=
 =?us-ascii?Q?m+0gBzMt2EayxP1NuB4P4hz0Y9nRIeycgG1L7VYFtZx7Lc341TUmfOxeToWh?=
 =?us-ascii?Q?rePMCTnFXBMwkcRfHdclccqZPWmACZsh39uL/a0NSM5M0b9CyUJeRgrnCwcs?=
 =?us-ascii?Q?4xXC99kw3V8wnonvFQxSXvWUm5thZjbJaeKaBA4N6caAjy2Tcf9p95zx0qQ4?=
 =?us-ascii?Q?L+6ddYqqDhfnAoZlINoo2iNBSfms5RKkWgWWmPnYeqAMm1OG5D5q/SGIKdvs?=
 =?us-ascii?Q?iBmu1SdLmFT7ywv1Jj83vjTOsV4hMHwAigtGPt6nnk6igTgVsgkwgNGWfsG4?=
 =?us-ascii?Q?4w11AXWG0OI8qkf+svrLutoa3ejZNCXcof0kVHKg5D4iXKhTTzEd5QWs8zlQ?=
 =?us-ascii?Q?lVQfi4aGBq52UV47XOncGY+3d8FtV0L/ZaQQ0uei9zIhT/5HT1eDUgiRO5BE?=
 =?us-ascii?Q?11aKmR77nFGp7PaTv+TgjRsm6dPvZlfBdEPe1QYln/qV4JqdyYLO7f1e7Xbr?=
 =?us-ascii?Q?DR+WeppxL81vqKTcmV47PLjU8uZ6wOKW7fF/HnMJfBTdq8tfXky7IpfT52j4?=
 =?us-ascii?Q?CxXs5YI37ZI0Wkoj5JWGvUrn0hemJqWZ/tJh3QeL4EZe/hou44W9KFkNdmlu?=
 =?us-ascii?Q?ULcw1V6qKj3emLBJH3LdkZm9voKTxjk6cvMWyBJ165GPUgYoJPciGgKIydWw?=
 =?us-ascii?Q?ZPSA9bBdbm2C9hZDfHuntaIyiXdJM+TfIeSbg+fviZVEukNiIgqrHJwswB31?=
 =?us-ascii?Q?llSumpoQmBWbwncE1tOVDlAniPYt3lAzPdlO5baEM2uT+HxmiN56zuT91TyG?=
 =?us-ascii?Q?t7DILXv0Ypb2/NTinbDdJ8JgEnrY/TihosNunuCVInn/JvkDpUFPxsDT1fFD?=
 =?us-ascii?Q?bRF9hOaeSG9xt+wmUmnwUy9PxaZhfAWEACPd1POfQLjwIBIrZ8uiZWxbAiTB?=
 =?us-ascii?Q?IdqKRwqmsdneowXMHfZDqneOe1k/Wqo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51eabf5-bb8e-4e9e-ce50-08de85077c3a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:00:33.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWHE31HZQ6HKnxjRQ/28QxvMpwRz5shx0FETSvXozBOjKOfByZ921ABPCfQ+dhz98XZG40Ee9VE27L3UMTV85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233408

The use of the variable ceased already in 2020, since
commit 3fdd772b419b ("recipes: Remove remaining INC_PR variables")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 741130a392..bf6b4193b2 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -219,7 +219,6 @@ IMAGE_ROOTFS_EXTRA_SPACE[doc] =3D "Defines additional f=
ree disk space created in t
 IMAGE_ROOTFS_MAXSIZE[doc] =3D "Defines the maximum size in Kbytes for the =
generated image."
 IMAGE_ROOTFS_SIZE[doc] =3D "Defines the size in Kbytes for the generated i=
mage."
 IMAGE_TYPES[doc] =3D "Specifies the complete list of supported image types=
 by default."
-INC_PR[doc] =3D "Helps define the recipe revision for recipes that share a=
 common include file."
 INCOMPATIBLE_LICENSE[doc] =3D "Specifies a space-separated list of license=
 names (as they would appear in LICENSE) that should be excluded from the b=
uild. Wildcard is supported, such as '*GPL-3.0*'"
 INHIBIT_DEFAULT_DEPS[doc] =3D "Prevents the default dependencies, namely t=
he C compiler and standard C library (libc), from being added to DEPENDS."
 INHIBIT_PACKAGE_STRIP[doc] =3D "If set to "1", causes the build to not str=
ip binaries in resulting packages."
--=20
2.47.3


