Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1E4CD3430
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 07:42:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.131])
 by mx.groups.io with SMTP id smtpd.web11.17943.1725349341570468665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 00:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=srmG6o3r;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.131, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQx9Zv7zwpwqo9GJNwVPr0pTctxWOSKoqXLbTMoqj+KP/5It0KFpgsTqkRy3JorB0OilIFw99Ca1db8tp+WGR80pxrwTlj+BNPF+kN1j2uVS3TUlnZZolDiN4YHPNYyh28Q9gVsUjlpTNhR7xQCU5go3J74iODQ131S7bSskksSCt/i2ukpx7TZXxfEf5WL9w6A7beThlDlgeoP8J6FqwKZiwR8o7xcuCM5+ZYAFYTKOcQoxj1BVQeG4Lfk2lHDk0LcLZPvJNuKfYFEO//qP8cUewEf4ij9EaxPQPyIe2uz8LWV9Xs/Euu6/J/453HiopoKNKsfycE1AgWsgxFLO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRXbZTm9NnExcIEu4Lz0y4Aaq2tX0MG/WB1fLbuzW1s=;
 b=vv8heFsL1FvTfu+FRhfsxb6uf4d8uOr0Q9niHGDKJj7MTr9wGpX4+oNnH5w5+5rbI4TNqV6yRBOS++WRAp20Utbq3tRz7IzBZxZMbT1eD4PnAWgCwsdSGtJt7LTbjlgakmU8cXjt2d4ZuNAD/xqXcGNQ0+dmLe/z4kOhLomsy+sr47vhGHZCiVkNhq+O8IbekUbo6MX5vjVZzLJikNIQqq4dfGQacswyLynYwCAccX88qGCAVs2mL9cosXdP11ifdLOH8zZU2RXFjHA2AA0zbGTVw9kw5N+kFGq6c1twsXkSoz/Af+nnD1zUSRsSypwfnfSTuLUuVxtiIQzo2mBwvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRXbZTm9NnExcIEu4Lz0y4Aaq2tX0MG/WB1fLbuzW1s=;
 b=srmG6o3rX9Xkn4wDSqwYwT4khamSk1k/jPDgq1JhQ0WSZsmu6YRbS6gR9ns2xBR9nHEwsxYuq6X2dqJiiEcLzOtzaT/WXz2eG7dCWShSQWPULfAO4+9+Sb/LGGKF9DUsN/cc1Q6WsyBgakRNOWm+OHqxodldTUASz11vEZrxFtLl4ZJMv/yWXVu0OFRiMMc0OC4S5XGS8ap/Qyb4mW0Z64zBfk44/Amt+6qLujtL3fA03FNVEaKH7yCNi2gRfkbwv8f4jpgGhxCP+xazKjh1DUjg8lCai0UFBeryGD97S+4W9+7rOcyd41MC+QpcvGroSbl3vUdnfpk26rqjUbugVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9211.eurprd06.prod.outlook.com (2603:10a6:102:454::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:42:18 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:42:18 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] unzip: Fix LICENSE
Date: Tue,  3 Sep 2024 07:41:58 +0000
Message-ID: <20240903074159.134083-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::12) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: abcae94c-745e-4bf5-1010-08dccbebefb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SrvaLI2QOULEIxuGG6qyd/dAeLCv55FedneP46gMR5y8jCe8a46gMolP6+9I?=
 =?us-ascii?Q?9Dmws2PnfVTKOxy8yOsPH1fyawFuo14N6SHaw0ziUzakPlSWKq0KUlT5Z22b?=
 =?us-ascii?Q?HMvimvqHnenB96Wy66aVrXiQagNqSgqnshAmHzetOgENVYwjPNoNfxF+3wbc?=
 =?us-ascii?Q?IcUU170Axei8gB/jslXBBN2bgqVZtiGjfkVDCKn7w5vbEUFcboZ1m3as5ORv?=
 =?us-ascii?Q?eEyg81srwxCBma3HF6fBFzyLJ6q47EMe6NOt0WLoen6sDD7Ot13I7oI4i0Jw?=
 =?us-ascii?Q?b3QwhThRHg4UDJwzN3KebqasaBPzvfEscPijZvU7D+MHTZbNoupo7wiYTBb7?=
 =?us-ascii?Q?nYZ6kiHezcZFDZkx+wT00YtK7UEX2ydDp9qePxd8hsBnnL1bE0VjJ7+ILRDK?=
 =?us-ascii?Q?fEO4lghy37b8KVO9IlmKfwnFk1A89oIXi51PdLksIggOFzDF+3XpUwsEfuWK?=
 =?us-ascii?Q?I3dFrZPfGeHuRs0Zwzv552E7rn4X5A1honRxcPlqD5jyiSAcPLx9GWi6y4FJ?=
 =?us-ascii?Q?Neg9W/b1XYGd3hRm7YCp3CqqswYj7Bd7/2okbTVCzhMNYmoBBnrdkXsOqB+x?=
 =?us-ascii?Q?ygfzmSAK9ufQrDVyRhGWfk/ghTaBTpngWFwiXjV/dEcuJd8SfKyeviLgGnZG?=
 =?us-ascii?Q?3q/HIw6AX2FYZst5WqbTG68r3ylCe1zz5zK9XIfONdiVyoT379S3HLXrXPRM?=
 =?us-ascii?Q?F9aNd5iPuGIt9OhgnXyBvqxsoPrxrr47mzGYMIU39TqZbTiCSCrFg3CYfKY+?=
 =?us-ascii?Q?EUutem+rI7POiJnFGUWFWNOY+zOxsGgqBEq7CWhjM4kl8VNPzVDKXNF61vkb?=
 =?us-ascii?Q?Fq5I3EFcK3/oC7g5xT86PirssuwU7NpPCvoXXWTbR9/D4jh3ZZS0NkeDqMhV?=
 =?us-ascii?Q?Hv0DXF3EvRTqsnF05w9ve7Z7J8j6dPCgwbIhwGkR/WvgjfCLtbPPPczwGpWm?=
 =?us-ascii?Q?+YDDX4h6ckpip5JkGLR3WNdPtEswL/gvdgwHtyNV801UgY+OtcnTdjg/zzdG?=
 =?us-ascii?Q?tsDtpcXFkQ4/bjtApK3BwhXOQh1EMusFevh3jI/I1nV1IibeY3E82DbLzg04?=
 =?us-ascii?Q?8krZXWSeGho8TC8xQSPWapJyVhoD/JUouA8dSnjBemal+ldMmFa2KAkeotbx?=
 =?us-ascii?Q?n0nuvCr6EoZlfWHU8/oV2LQg09nUa7VZxpYp99hOXCGrWwewQcFrcXtlXTJk?=
 =?us-ascii?Q?OjOlD1DiTZkM3YJ//XBJACHKXFRhqxY0tBRZhagUgC0xJPUznkFkhVM4YHaD?=
 =?us-ascii?Q?L6fe40e3eQfnLfiyk1gfTJ6Sw1XVitLyJ5KOG5ijlCSKUvT77sfLk3KFntat?=
 =?us-ascii?Q?hCjLacd5i9xOT+JR6ZH1dJhbvBQGN6DsUW8yuvu6o3qQVrTWHPThhBzGytwr?=
 =?us-ascii?Q?+oLjUcA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VUMzZW9hNqwNUtUwWklk7gWBGsMvHdBO8VNRvvYD9vvurlRwk/cYLE9h+Z0H?=
 =?us-ascii?Q?dCyd9fllMgcTOMN9muIbhisWL+E0OrSPrI1hvktTcZbDGMhVd62pPq6NR7wa?=
 =?us-ascii?Q?+0ywWeOO9c8teYyMVwEjz0w5tIZSwEPwYx+MMYMr9h8gOxklQnTJGE8uwGf9?=
 =?us-ascii?Q?oWMne5JsbzgtqJmV4k2XGqVaha19cTYuzbLuhfqlTJvolKJk1eD6oKR04FGE?=
 =?us-ascii?Q?fgb1OeB7gyQ+DarxSyB4etA9GOUY/vFeScQvP/xi0Z6nq9LQmIlzBZ8r6w4u?=
 =?us-ascii?Q?IxqjhbK6D6vBnpcAOitZvnl0iOxxndVIwKralInCmalkA0z2sy1KzKiCvVnC?=
 =?us-ascii?Q?0YgeBaO7ckq/734tDZ+9Ca6YNDs6oSTeS80hHJTa9efpFlZtkutI45If4pTx?=
 =?us-ascii?Q?T03dVhWGL6kfPj3pK5NciS1H2nvLabd/yty+gTGGJ5rhNjAeh67I0p3Rrt0l?=
 =?us-ascii?Q?gPkrcvq08C6SZ61KmCK67fO9SB1xJ4cjGpnS5rKBaEt/TNwcQo0vMXsYmZur?=
 =?us-ascii?Q?OLoGJuO88pLwkQo5CoUFt86Ujd+zBIuEsP4SLg7WjEYt0927+XZG6OT4yvxZ?=
 =?us-ascii?Q?nrJqrgyICaKicaljBOpzCblvSsc/QP6IAoG0i5QkmcigsR/knUoI0c5WmYPc?=
 =?us-ascii?Q?TlP3VWJf5GS68B/UHLbZGbsMH3ssQXn1GOuqFXSafcDHCHLt116SLrdBcgQT?=
 =?us-ascii?Q?Hu3GkEOEX6yyOgp8uut/qom8/JVRRqnKEvn+J3F+Qe1dN3UpnoA2K6nxqSi2?=
 =?us-ascii?Q?FLTksAIDUsgLF9hlpc9Hy62xFFG/94NE8C+WJkchPCyM/F2RYzB1SYxTlphD?=
 =?us-ascii?Q?d7LqBNNRLII5d2kcbXwskSzqXLV4v+7xMs7mQQE1BRh38lhVvp2tWLYE7IPi?=
 =?us-ascii?Q?XjPV+zJa8ljneOD4rltdy29BfrLE1LyGpLeL3PxVr90S8tUra0Pbns4o0Jpv?=
 =?us-ascii?Q?Epgy/z7Ot8GsttzmUvEeoTSiN+LRk+9A429f5nC7WLXysguVq4KkNBPgCdQc?=
 =?us-ascii?Q?0hHTbXHpa8NWbGAPu65vJzSAaMRbEeG7lJsIUVE1KcyPdzliQ8aXndLrcfoh?=
 =?us-ascii?Q?rhEF0hXSPlNSkbrdT4PWhb6lBb2zd4iEOD4CGweygj9mVxr7W/LRYozkmcgE?=
 =?us-ascii?Q?FMp2Ib1aLsmmxva7mg1fBHDNgWG9/wP5JsmXpUlWQBNymwzGJn+UM4JEosSm?=
 =?us-ascii?Q?sX/2DYECpH2m/Y6I2iND1sVpQfe5uERPwceTir8rCubhXTbDYt1mGq+Tj2lW?=
 =?us-ascii?Q?q0t0O+IbPRMIAH+EzqfiKC5aPPg9fZ1r8RpvcyJK3uSqlmAeWfqrsIuZttAL?=
 =?us-ascii?Q?BPCKr+AUDngl36P85BAs3mliqH0E0D4ByRF3lOWzRgFhDGIS2Yc9YSk2NkUb?=
 =?us-ascii?Q?qrH2c4S5BrenzYSH/6OazruNStpAxQhYgF/zUwCGgrF238USX9SPOBMcN1wD?=
 =?us-ascii?Q?aAmxZyQwe2yeNd4QFPmvx0dTqrx8JoYRq7bauptJiZeNZ8wjD0lGLaav3L69?=
 =?us-ascii?Q?wRPqzOs5X3UibDJ30nDHUwqbgsCPVmsV3tL9GZTMki0/fOxhmnUhFn3Bsa0g?=
 =?us-ascii?Q?CwV5ti+4L8f+xmxE6hTjjR9EZZR92NmQTFjQ1Gp9m/v8ucSuvxfdZdjCAceR?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcae94c-745e-4bf5-1010-08dccbebefb3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:42:17.9988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoHdKuRt0H40ZzRV0MOObCvllqB0roY54cW9Ki7HQ9S4DsTgo+HkV2iyJ59meCcFu5OjXdSpKBsuQ2N2rUPQDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204124

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2009:

  This is version 2009-Jan-02 of the Info-ZIP license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extend=
ed/unzip/unzip_6.0.bb
index 27076d5d9b..c13e7a008e 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Utilities for extracting and viewing files in =
.zip archives"
 HOMEPAGE =3D "http://www.info-zip.org"
 DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-qua=
lity versions of the Zip and UnZip compressor-archiver utilities that are c=
ompatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION =3D "console/utils"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "Info-ZIP"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94caec5a51ef55ef711ee4e8b1c69e2=
9"
 PE =3D "1"
=20
--=20
2.39.2


