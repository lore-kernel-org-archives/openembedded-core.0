Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43D3C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 09:27:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.102])
 by mx.groups.io with SMTP id smtpd.web10.68105.1723541238355389150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 02:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=aHtWEaXX;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv9iCqkmneJh+0uEq4xCpQdVIFc+Oqw0dAkdPC6xExHC3V4i2eco5dDM/KKQJC4g704Xcl+2viQ8w8l08EEAqekAtrrEc9K2BlGKZrA2nb2EY0zAzO2F+FXg9xGJ3N7ZVoOrheSqNSLMNdNnImIUE08CLhz2jCtRH0VxTRwCQdD6e5YWPvtq7i6dQlfN6XKeTiIkEyGmoQgmBnJ5y/H4XzEC7jMZMoxqK6DxHixA+S6zQWpXfq1v0WnwkL6X0MOCRSOgppbkbuf4zfm6i/TqTH97uCY9IU1Y2HIDv9XchMX6vQwMfoHe9QgL28AkCy5raPUR+F3qpTVKw5V+NkQHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSZC2nd0oyzW/D8/Y1RMbADx17+5PHOTB8TihFl8NIs=;
 b=oieVpX1K9oMw34oobzuhJebaP2FWQlDDvArbfrz1OS180vHu7z/2NLdJ8v8syViPcbBFSthJOsoKut8gBoWuaXZaVaP/6aUmyVlGknjWrj4Ko2oVDtWZQgK1svx68bf8hBdxnxtAzEXfwuNZHeubptbihT2b56tclxjWhlWi5QAyFMGLyIaeA+LT6Bno9Lr2kOICb6Wu4hWPZu5XcXp7mIqLqHYBkB8yNZgX2W5JW+QjlAUl2w0bbXWUmP/VjvUjZ9QLzMg96/SX3ea/iYrTZBI9loegmsT5inxHKCy32AvwTH1old6zlixPYbnpwpcSiFL8Bo6RiY8xfVrP7Hayrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSZC2nd0oyzW/D8/Y1RMbADx17+5PHOTB8TihFl8NIs=;
 b=aHtWEaXXwkgTtUVP8I/6ZJR3I3zeZXfZ0Wr+XwXDgBmvdT97Ogw1oYB5T3TxDhVYePbmT06Fqq8niXS5bWnwsjpnAnenZOx9EH4BoN5rTVmxP6H/1wrCegYhjY2T9JR8SEOzOl5lArIaGNOQqMjgp02L9WOl6TIcn8sxzbI6yEg6K6rIIEsE+pAThHqwOEP0azDbCEEfm/E5VhCd6OcLky8DKkK6SxiSg1iRDBKEd3YAwZCx9F4iHNH81mElYswOWcyiXqUiE/C/asRQMwjbFCpOLYMfSJ1ySySC6DfzWfjAswurAQGR6E9L7q6fb8Hw0j1VLaGfMCmXLB1fhfwEOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7423.eurprd06.prod.outlook.com (2603:10a6:102:154::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 09:27:14 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:27:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] image_types.bbclass: Use --force also with lz4,lzop
Date: Tue, 13 Aug 2024 09:26:47 +0000
Message-ID: <20240813092647.2113558-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0042.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::34) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a793e47-fed8-400a-e38f-08dcbb7a1de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?slidTEOiGSViaR2rWHCXIQITtnNbkS3g7xc0qFQkfS1vKLb+eR608sPm1F+2?=
 =?us-ascii?Q?zya63bTW0vGYwu44DeRO8jegx2pPCapBSlR27gXnhaZh8H6GoSJ8FdHHge/C?=
 =?us-ascii?Q?gJAygyr0T+CzAUwHUFO5HsMCmdqPXvLOXwJTl5uKDE/ua2tVaULcJf/BsQ2x?=
 =?us-ascii?Q?WdLZW9de8LPhehcaERQGeBwDAbkej1x0ttwqxo5sp5BOQc+no1Th5NqfP+WB?=
 =?us-ascii?Q?j0m6nKUFSA6tkViWC4OSGqKXWzRIdWk6cYI19pW8xx1FwwFv8WZ113SP+1yN?=
 =?us-ascii?Q?at7jGRm+R1gw5iVqbDQiyhPPFKUp5HxTVLimWuzJNsLElf3UmvQ/4SUEh97G?=
 =?us-ascii?Q?xwS+L+l4XV4tU1fm7tuxrF66t2/tPc9Elv7sEExAuUbFzYf3ijrCOfqSy/m5?=
 =?us-ascii?Q?Ararggm+OMrXDjfZL85UXCs9ZSQCy1jEkfrfQkR150GifFfrK4Hofk8n9VVJ?=
 =?us-ascii?Q?VqppsJfKoLyY1uu/xaSPlKk88wo+3lhVtYJ0xR0fK97kHwqQxnaruHL4Vd0G?=
 =?us-ascii?Q?/4gsLGdG5sUl/OREG/VJYJ7tr4LLJqW+Y6YAilRkLuW3ED2k26U5onbp2bhw?=
 =?us-ascii?Q?JydjdzsBJtY6LrWWwNU7Z1dBQcignlmR/tpos5BY2CiZUUl39LMAD+a2AjmF?=
 =?us-ascii?Q?zNIld0XwYnppjmPwCrpFbJqRiggCCbJniIVcSkKj0+irjeH/mI0lMACNv1nJ?=
 =?us-ascii?Q?m/MnGg5wn8SgkiT51Mo+xZkpNeInkETrpcNURpV/Z34zfKttuIvV1KsVYYY/?=
 =?us-ascii?Q?IjNko1Bh5LixahmDXutL8CiNxjN8WbijHzqVCzE5XjTG7Yu+/PNjx2d3ZB15?=
 =?us-ascii?Q?eeSfdOmUQkYtUp3cZYFN6SLFc9weauw4dGQfsgc/WplnAO1bJJ45MK1P2Ixl?=
 =?us-ascii?Q?SiGvFxE93kRRM7YS8j1SOE+k13hGAYES/HoChPQNY4lpyMx7dkCdmxSPsvLp?=
 =?us-ascii?Q?NVal4EHpzP9cYw1hqAtzyoUjbD50XwZvfs+JAYI511e2VCMAQEjKYx7uK2ac?=
 =?us-ascii?Q?4uLgfI5rwCdxRk90+as643VgeV+b61Cpek3+2F2spigL8ZehZo44scWeZWcC?=
 =?us-ascii?Q?OkJLsK8sCAzAaGlTYUPcU/Zo77bsp8/luwjaLdW4z28ePbTBIEaZ2e40uo27?=
 =?us-ascii?Q?iCZ7t3pxr5EEP43Ofo8pRWnnh2fcYX6N1kJ7NbeW3snO6kUIbROJ4oI/VtYO?=
 =?us-ascii?Q?+xHKoBda/UTCFzZdPzob7Zr6PA5r2p+TRYetnAPz6VqbMj2/BcMEUkMet+9n?=
 =?us-ascii?Q?2SR6FoTWCh1QUgPKEzvWIIbBf5FbiCoqOEl2n2TIp/fHBldWWPDoF+Y87Ckv?=
 =?us-ascii?Q?ZTYx17YaLGNcQllwiHymFOueOc8IFrNEBLs0lKOM/Ub3W2CCLhCLUnW/lxCp?=
 =?us-ascii?Q?PD/CD3yGwJIMak8M3OAg7ldMW46Dt7pH7c78Ux39muRc0XjICw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YNfa81gC2g39tclSe9Dvc+8KPz/LlEImCw7iNmws6phoGW9MxBRwkth4WXFu?=
 =?us-ascii?Q?4iOVWZx8PdZgwmfSAgYV5JFm5F9paa8MPtKkH1QEXsduZhaFmWUbMU6gfSjh?=
 =?us-ascii?Q?R8uscBjMRy6JLsRv3hF/NCj7073TBp8gxagIKWkai2KwyYIHVSZUe90neY0a?=
 =?us-ascii?Q?AsoKrLIqK9WGrHFZ71mMMSgxaAetDgBz5p6egMVQR502jII/rzcIn329sNi9?=
 =?us-ascii?Q?mAh4+niXGnfi0gib5aSLznVYXI2Un2bKMt+BHbXBPkQx9p1AdHzB6z/RegqD?=
 =?us-ascii?Q?jsrf5tf3UIzx+52K5LMnXjq5n6fh8I2AveLa2HA8YoqrcMEGtfmaKeUhD7Vq?=
 =?us-ascii?Q?B/3s7sdl9i6GLl1l892xWLiLTWg8Iz6yEs/BkMCZleaYQAPuuiZNihpo+naV?=
 =?us-ascii?Q?6vNuOivSV7/SKsiC0CKpKGycB+mjYnIFzu+BgrEL0kh+ed3d67A51due2noR?=
 =?us-ascii?Q?sMp2Y1HBLTw4hCW54F1rrv2+PYKwxjsRXBwFrt6vzo9awoeMiPgff6SlBFwP?=
 =?us-ascii?Q?ckbnwbml4im3qh/Vv3Cy1amgAJgN/VdYzG3FoY+tcjOxxZi2DbBW1wh3PiSE?=
 =?us-ascii?Q?e+B/h1akRzENJCch1kNFC1jLbrCBpztZdBMn33ZYyPzez2Pn7L02D36JAQES?=
 =?us-ascii?Q?8lA699FwgP+RkJ2TXYPPl7H3EZAqAKgoXePBR2kS0uD5jX3Xb5sMjXRJ044n?=
 =?us-ascii?Q?NB2dumfFKRrbTDRtvpC4a0b060Gc4Zs7Qla1OU3LsEiqrA3vNHNm0/A1fHVH?=
 =?us-ascii?Q?HEVVM8IGAb8to2ZCTB8DjN7aLx8YijqHz1hH6l/eAfU5jAPmCSFxhDzyofww?=
 =?us-ascii?Q?eThr92GZ7kFJnqnx2Dw/DIxKPAfWVG0lFC4e+zWO1kzHkYo+JWJGVzEOGDD2?=
 =?us-ascii?Q?+H4yEqi4xuKB9jpkl3gEPSgOc9jXtrQa03aXOoBabTshSZW4aYK8ARLwy0Fj?=
 =?us-ascii?Q?uz7xm14lghl5UW8mK1r2byLvQtqI88CfprgPC6lXILsCm4TptfjBX7aBUItO?=
 =?us-ascii?Q?Yy/JdGW+vwLdfMqm8wBnDfNom9NP4JsmIMI2rmia9y2TAeHkHZk/uNtmWSeM?=
 =?us-ascii?Q?7SFt3jf3N0fi0w1KLoJbnQYp+6YqXY5NRQhcOjFNV2jyRGkKPTu9/NArtxdn?=
 =?us-ascii?Q?eayBx+vzDcj1K4dH10Oag2lwOSrcDt6oCTS/LhRN+cRFpGaL7gqmI7cnFFhB?=
 =?us-ascii?Q?ryQi+Wkh6whM7WKzUIiqOUjg/Imj9s+2RJXFWDL8dvZbQc7U6O1FsG73TS5C?=
 =?us-ascii?Q?5zIC+S4ayXQJF0sqfxkvqlBbGqRxWOvjecGLaeUoDlNwQ8lqjFFd/6ADpKzu?=
 =?us-ascii?Q?WcaZDZkOuMJi3uyEJAoF6aylsO01c7dWvQGC9npI4308j9vnpGdsYXhzNvnD?=
 =?us-ascii?Q?yyQr7b4lgg3syr7lQSzQHLuvVYlrVN7nXhOV3k4cMe9yJ1XLHVeHPi9U8Yij?=
 =?us-ascii?Q?leUvaynf2k7IO5KSb43sM5oBCpwUTRGC1OlUt/eGUf6Yzc1G6TqJwSClN2kw?=
 =?us-ascii?Q?nglkukokoNi/6Yrwt3fiAQD8IHaVnaAi6jY3Lb22pf4X75/HLOsBpqDZ90/N?=
 =?us-ascii?Q?ukwCa3y1pwb8JWOaJHesemHMn5OYwLOZ6GdzgquKmhGGO7SY53//s6ku7HTo?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a793e47-fed8-400a-e38f-08dcbb7a1de1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:27:14.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nicChVWGc7O4oQRwIUzTrlluM3RM957P5aNiqnl8Qt0yKGCiM+K0x9xbY3rWByAefwuCvSg4FUle5kBlnWPbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203260

Several conversion commands already make use of 'force' option in the
compression, which enables overwriting existing files without
prompting.

Since occasionally an existing residual destination file from a
previously aborted or failed task can prevent the re-execution of the
conversion command task, by enabling the 'force' option also for lz4
and lzop compression commands we can avoid following kind of BitBake
failures with these compressors:

  | DEBUG: Executing shell function do_image_cpio
  | 117685 blocks
  | 2 blocks
  | example-image.cpio.lz4 already exists; do you want to overwrite (y/N) ?=
     not overwritten
  | Error 20 : example-image.cpio : open file error
  | WARNING: exit code 20 from a shell command.
  ERROR: Task (.../recipes-core/images/example-image.bb:do_image_cpio) fail=
ed with exit code '1'

(From OE-Core rev: 623ab22434909f10aaf613cd3032cc2a2c6e3ff9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 2f948ecbf8..28afff4571 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -335,8 +335,8 @@ CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.${=
type}"
 CONVERSION_CMD:gz =3D "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} =
> ${IMAGE_NAME}.${type}.gz"
 CONVERSION_CMD:bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} =
--check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${typ=
e}.xz"
-CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME}.$=
{type}.lz4"
-CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}.${type}"
+CONVERSION_CMD:lz4 =3D "lz4 -f -9 -z -l ${IMAGE_NAME}.${type} ${IMAGE_NAME=
}.${type}.lz4"
+CONVERSION_CMD:lzo =3D "lzop -f -9 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${type}=
.zip ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D${7ZI=
P_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAME}=
.${type}"
 CONVERSION_CMD:zst =3D "zstd -f -k -c ${ZSTD_DEFAULTS} ${IMAGE_NAME}.${typ=
e} > ${IMAGE_NAME}.${type}.zst"
--=20
2.39.2


