Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649F9CFC500
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:28:03 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.113])
 by mx.groups.io with SMTP id smtpd.web10.50170.1728894474603875736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=V+GfBEAw;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTzRqk1KQ6FZJVi28yMzDuWAN/I8lHQmT3IcuPVrv3JzXqUwzvFADw9KvyRekd7di/8VmRXgeutpIc6m0WFMZQY3YTvXIEqSg0/ZBlDzCRYiwbiRBfl+8KIEDXodmS6IlnfBxb5BkWyjdzsqwexTg6DFQHKbGXGrFpDH+ALFPjUPik09tTxi3kY8DYggWUWgYZ2QFs2Jbdnq7S/M/iw4rNBkGx8ituaBT5kBojcUYWIxBmSB098DKcMrwz2TKdj8uHf55gVVC8ASd2kU1IZD6GZJ6vgJ2doqnvOhsYInhtpHPa8C/WthAI8USwFBmSv6nC9ZL3LSnc/3KPCC5fLxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0HJPpIIaM0GpB88BbQZ0YvTOfR+hxIWmWOjD7+6R5I=;
 b=FDh87CMBdJ4oc1r1KYuvXz8DYo/1y36/aAIwdZMBqYNC2qZfETRjq7bbHvxmsuLY3zxe2DPrYRHPJHrJ9mVtOs3XUiaeyrUHpu3QyzqfMTPmD7IP+no+0zZkkhMzvnHUKvTMMLsJBPOhoQo7IK6KvCmlDunvM9cGCLeYNeHIcMvvVQ68tVoVOmjA7x0JdfEHnpKKh2GkzNoFHEMZe5NflR2yClVrAlqRBqqWsyF8IPpkFsjbuZZ+QE6xc89BPFP9t/ITZJXilbqPypMdwKx27A1BAO5/NdgSG5tS08x3HjLBk1PT4c1kOxGjFeP7zoZgFWTiViRFZdCrrnRmDuFMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0HJPpIIaM0GpB88BbQZ0YvTOfR+hxIWmWOjD7+6R5I=;
 b=V+GfBEAwxf7WuE1r28P2W/WTjo8BWmKd/iv38lXMYX7sOOBFTR4hAfNLDqURNiuatN1PlopdKVmmdVWLYMkHqk4p3wzer/0eIXIoHY09XKRc9QeoEcr+6Ta4w36hMOnfA8wo3dHbWH84aPSTbE4cOQnieawQTCJ5Ffbdptv5vOL7fI86sCsXpvAKE91cqtkXHRP8/M9vydD/1LPq7OxnE3lbAf8fiTiCrddcQ3hodrZC1RFXW8bYVB4ynfZwGUj6UpSuiLigrgN+AGLiu6eBYqX4cGwIWZiCYcPNXfr2UbsmU9OuINxCX2f9zgcEluCMNpcQ+dHF3ZT/7aI93P/Y5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB6560.eurprd06.prod.outlook.com (2603:10a6:800:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:27:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:27:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] bitbake.conf: Mark VOLATILE_LOG_DIR as obsolete
Date: Mon, 14 Oct 2024 08:27:03 +0000
Message-ID: <20241014082704.841698-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045B1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::41d) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 00369023-5992-48be-807a-08dcec2a0b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mmk3fd1GqHCK7EyM0G8eGGEx1g9ymaow+XsHXMeW2TJ98RMhmzgn/Jly4tvk?=
 =?us-ascii?Q?aniMjoCdomF57OaX6wESHy3HOBYtTl4j0+srY5C5GJii90kLZYLY/5LAXOZA?=
 =?us-ascii?Q?AA39IWE53d9mLvqxs0dgkyOgxGMnQDINqwzzHZ/UbliuQq0/wpq28vXhdpH+?=
 =?us-ascii?Q?cWM9aisMfhG0QnYOr0/+olOiImI0z551JG0JyETgcZwo1V8tFuBhyY+a2Hor?=
 =?us-ascii?Q?7fpg8LzcbDyC5BwtqwFTpLc7nIV7ZG14un+2VB6vcgmJJDk8Ow3mUfhyMGd9?=
 =?us-ascii?Q?h8w2/xMkC9SfhVqEvgS4Bx0iTHV6Gfi90ZdSfi8EXmaesnP32mvQZVly59At?=
 =?us-ascii?Q?1GjlYhdRvWhlp7NgtYKIR38ucJzyHjoWTSw6xGCUlPTQG3sP9ZLLcc3NelF3?=
 =?us-ascii?Q?9RUpZNxeY85kAgc8WlyDAM6d3kUHvSS51s8ZRLj0aJjsEzcB9nhiepfQXPg9?=
 =?us-ascii?Q?OV+2rwOm7uyJzZjzO4WeKB1CU/T1N6WxlHh0kZILqKFe5xKTZlPemuZWb0bH?=
 =?us-ascii?Q?DiYCAYk4/krMrJD+6K68diL/gEBwCAb7swgo6JDT0vuzrZexalr7N0RMOmr+?=
 =?us-ascii?Q?M3jgXEWKCSaGhebjnvpIFKWwYICR6DsjI43jpp1m6R+tAGrzB5b7jWq1J/Uo?=
 =?us-ascii?Q?njDJls9YBHsRQHB2MkC6j6oax36W/yCEvmokN12POKAuYdpGz0G3Z0W3Y+u2?=
 =?us-ascii?Q?ELy7EyP+FOV7gaIuNRs/UDVtmuXdDOhOQaHVQOpxlnZekV0J/7yijbRcysUB?=
 =?us-ascii?Q?3bGb5Uzw7ZkjRw72zEGehYHbNDvJbA2PO/pumw/aqBral1G0P0auCX/frG4c?=
 =?us-ascii?Q?5kWGtgq/H0ct8vyijySksf1yDa7toArZo/CR9tRckOFVeOiq1obVFVdlqogE?=
 =?us-ascii?Q?IRmXjc6P7xqXCc2lPkOni+pf5yru84mjKwJ0MR5SuYmdh+3NYucPk2BsoF6y?=
 =?us-ascii?Q?C3vqgBRnulx6qYE+QVhm18B5s4jOpICa4GnUDIrTOZFFwvigFmnAFSGClk8t?=
 =?us-ascii?Q?bjU8gNdo8RiLmZcimvMjtUI15oYeuoPmClNIgoBl6w2yrBsiNGJDoDIdkbSE?=
 =?us-ascii?Q?gDW8RLgEEG27x2OCG8CQP+Pi9n7ky6qT+s8DnhN9ebb7EEYm0BHUE3Qwpcy5?=
 =?us-ascii?Q?rLS8X7NxB2WfuyPIz32KdIab21oGPUZH8DdCThSfy+51ojZMXymtH2SLW4Rg?=
 =?us-ascii?Q?/tpuVSVVfqPLTM/oKfJpAL6965WzqQUySSU11BKJ4G7zzZS3fp6Vc9Wplftt?=
 =?us-ascii?Q?Q9xKSKNiRpJsjhaxpZ3RcZ1EXTuY86vYOuypAiZSMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3uVdTmc26K3/zPHoEWAFtkv8Qtk7qii1kLzLMHoYH7lBtD5Y1+W5cEbHO+AC?=
 =?us-ascii?Q?eSLiDnGYPaxAdMveJEMEiESN1en069AYnn/63T0KjUqehwI8MGIB49K2eSb9?=
 =?us-ascii?Q?FJs8nEJCPLIb/EptHffDeThAau/aRFWe6/iAKkUQifLDpQYc0s95KdgivmoY?=
 =?us-ascii?Q?R6SbZxMAkAgG+4PS1sYfD7YiL37L1DBhcRuUwBmadZX9OCnmFzpSts2XGhW+?=
 =?us-ascii?Q?GmKJ0oVH8OVB9zUc9n4LXIR6T8q7wYUGHHA64G/BDVych6WNvnY4AwpOjjfm?=
 =?us-ascii?Q?jkz6h7+PkJlPe2l1e4swNMQMzCAad3V4EGCG1eAkflfOdUHG97EF/ge9MimE?=
 =?us-ascii?Q?uXlB3C6HTR6brTiHh2whUPyIUEWqqTn9Rbr4JSbW2FShQTK2cgYY5pgbnxdP?=
 =?us-ascii?Q?Pk8/iU96KQLPjAiWGTZfPVzipQipwAViPX/HZHLTW7acgZkXoR0t8bhIz2N1?=
 =?us-ascii?Q?dItu88NlLcupG+hLZwhMk04JPG3U0lKAQKysXpnoCY+5zqEXwwbzyhrs5Yjg?=
 =?us-ascii?Q?K632vB3J2WsEc7xAhyqsCB+w8osk/qb8sx7SNHkkQE8pS4NaUTniAjPDwXCG?=
 =?us-ascii?Q?9n+ODgmXiwx3d0JrOo3YH7W7tbd4DRitr682qhGWOU5v131g2iZR2GMlESCA?=
 =?us-ascii?Q?rL8jL2zwqX4KCSPs+afsaoBQu4gdf2k2X9quAXArSF6Lxgjh1+GHlFgizf8U?=
 =?us-ascii?Q?te6DewXPRNa8CdJ6ilengnyWm0FpRXYFL2MWJWbYzSWEhgtjccVsPIXJdR8i?=
 =?us-ascii?Q?7iJ3WbZUjWduaqPGddiBBCxQWxU2wHPhDFdrmtPmCrBR9zcCphli2CCEI2/S?=
 =?us-ascii?Q?frQW/GJoyATAW2Y/gic0b+GItW2dbR6EggueX6ZK+ffdALcEqhG4BL9gddGO?=
 =?us-ascii?Q?PnhA5MY+xpcepTyNFVPzkJqn5FCw70Mxs+sLr0hhjls4qPEzB1IWh2GpyTa8?=
 =?us-ascii?Q?6RXWHSCPllIoAO7wRujm3GeXhtlwMsuR+x4IkYWsB2xiXHjPnPdXGqvf360z?=
 =?us-ascii?Q?/5KRjIv2+8MUbMdI+8mdQCkessUA9swuJ2mR88wjuUM9qT6r4j6gKR9zKtQ+?=
 =?us-ascii?Q?138W7Eex8x0JfE625YzJuUnFUqwECGZklhP7La0vwF57FWpqXnidHoykpenT?=
 =?us-ascii?Q?ukpmyN60KkgNWjE5UUNHC6ekRBtd/H4eHtj9c4siguPT9ZHA7Cc/KvQaDD4N?=
 =?us-ascii?Q?4Qo8djEnYoe8Wqfq1rQVmg1eUwYNNfPT68mZ29GO6RSWGc79B/eh7SNlGHPT?=
 =?us-ascii?Q?EKyKepzOEcT6hB9qO32f75nEiCVfLPcJ9YgG26i8rIpj36dLgHyaVaENqY4+?=
 =?us-ascii?Q?pKmCyrS5MTPLwRC0mg8+V4tohVVQb0zBDgJFyJc+Pc8REEoOlCsK0s78VerZ?=
 =?us-ascii?Q?O7OowGAVuFjXLTbBTmH8z2SK1pmXz8M5y29awGvx2v+uv81mNuKnsxOV8LUu?=
 =?us-ascii?Q?oty8bZYMMOKH6gt0Jd4Z9ycAltNrPqtx6ZVkPGu9sS9LtYbkAfpJZqSqu82/?=
 =?us-ascii?Q?7BoM8MFilSFw1vWs01PviVJBr4reB807A/wGf7GXsXA74GL8HUmaznwJ+MLt?=
 =?us-ascii?Q?GO5TU0IDdVilTBslbQXmCLuXFKYlU8eotpraoFEBQ1IdYoPdODgUyLPUh4hw?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00369023-5992-48be-807a-08dcec2a0b79
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:27:30.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grKwQDmFrvq1h8VbA/xwaziEmmh2DCj26FcgXivqjFxQlQMbLp9eWC/Z63Gy6B/d62xVTfVLq71TzCntVv6OqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6560
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 08:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205733

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=3D2f8806deb7655b37d6f8d12ff546=
80d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)
so ensure that distributions become aware that it no longer has any
effect.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3f583668f6..ca4b5a6637 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -106,6 +106,7 @@ BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] =3D "is a depre=
cated variable and no longe
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] =3D "is a deprecated variable and =
support has been removed"
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] =3D "LICENSE_FLAGS_ACCEPTED"
 BB_RENAMED_VARIABLES[TCLIBCAPPEND] =3D "is no longer used, modify TMPDIR d=
irectly if required"
+BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is obsolete and no longer supp=
orted"
=20
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] =3D "INCOMPATIBLE_LICENSE_EXC=
EPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] =3D "INCOMPATIBLE_LICENSE=
_EXCEPTIONS"
--=20
2.39.2


