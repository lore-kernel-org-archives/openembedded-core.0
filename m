Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26518E6FE2D
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:17:46 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.90])
 by mx.groups.io with SMTP id smtpd.web11.1424.1725635856935465437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=qlYURUx4;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqB04NzGZzm7QrV85tKu+uS1LJ2iLg11phdibZy/pGEqZBB9J+JeC27kVg9WBfD1OX0/qDTyA5J5YZBetSeEtSr69xET2FB1kLOJKw3b6fKkybER/zO/DS9GMfgm9tR3O5WIPFclztFb7doAfHlJNbfaxBkDMTXT5ynmKeTJCOB6ukWW2Csdy6rFUpPTMdS081BElLVsfx90L0ymHnLtwaNN0Ge+chVKBus5OwI656M1MmPVkgtBhimygNlH9GRm4aIzCDiLWLoEwuH/8V6p4+TvWPRM0OqU8nEzzfrZ7MVFmagK6AD7aTs0YSJMNrPiYYcvh5keDVgdOK0FvZ5LqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7kfxI7+cTcdMdvTft1n7UF2TvsLV3cpVpgVCQ95lk3w=;
 b=SEncORt/4K/TXpfGfojaqEHyhRM3kpYJj0yDOE88cKPF/yUjL+Ct+/uW1N1DtI2gRYCLrauLPOBrTrPfTYsdw9I3RSMTVLOLyRLuDuaqezMKSJnhwO3o+4/er+bYRdRyAuyJZg3S9qCmkUrjXFG6uozj9xFYztPprIqEPZKYhu5r6eApCgwxPxV0FYqJRImOqLunGbvCAuX+I7JtKZGZaEilC/T7wtzDWPUSxz+/TRedwjcCqEily6P40ptKnlHTTC7rUKux3Hwut//d3E4MDS+WfBIadq+UW0tc6QolRO9JDlxPNCQEGeSVqHSBacjFLRpqCMOhqxfibxOzBO/T5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7kfxI7+cTcdMdvTft1n7UF2TvsLV3cpVpgVCQ95lk3w=;
 b=qlYURUx4IK9XawMxoFftDgeEV2OP34XQUjjmIBUU0PdwhumjfwD50K2qCLhFMQad6cHtRZ7hft+ebD1uq1ckiECTXprjYUDUnvIHfFD54NIIFPXZY4l5xhkEFyn2GuFKFWpKf1Suhbgxw7oxBxgd+BVv8UcxP2mkWlwUE5lQFINkdf/4SZo7P8YBF/6bl1PzO2bXP4jZkvl6Qw9euWdMiqHf/HQCLmCNJS+/EIheT9QrLuuU/lqsxMf5YpxeUDZRlC8cNg5Vc6J4cqeSHQe84rqL3XvA5ORSGukXTfQYQnfgyGaVoq3U7ZjnvUtpYggXMb1IizLhRU+wbZAkNBmZ8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8950.eurprd06.prod.outlook.com (2603:10a6:800:1d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:17:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 15:17:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 4/6] zip: Fix LICENSE
Date: Fri,  6 Sep 2024 15:17:00 +0000
Message-ID: <20240906151702.3006933-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906151702.3006933-1-niko.mauno@vaisala.com>
References: <20240906151702.3006933-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0114.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::32) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 2648eed3-86f5-4c58-9ea2-08dcce870750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0EosiQmg/9+5Jt3+bdBA7/yE+P05RoQzoUSPGI471ugSJzp1tCWQgJ4J2h8r?=
 =?us-ascii?Q?DBnEP3QEkg4x3hvBCzy18qtNYffMNXrxwQ1oJuMXk5/8C1TBoNLmdft2oQsy?=
 =?us-ascii?Q?+Z32FCN6QrffL9lSpbOs4YR3gMBLzx2568p7LMyR5tVEhIy9CBiWgJr0p1IJ?=
 =?us-ascii?Q?2D3x0X5wZSVgpmrI/vnxOko7B5t3NZExuxUsZ2ESsR5/jc9I3AD2bXAEqUXw?=
 =?us-ascii?Q?BTzVv0R0wbc7sB0cd7NTEKuZOy/MlFuFRYpbCFCctmjqWPEZfBKKgxJ8wmlF?=
 =?us-ascii?Q?2rJWlTi5bCnafMr+FEfzg3/9g9c3ujkbu7uGwt9dpJeoYYNSTq55DftNIvwK?=
 =?us-ascii?Q?ZbK+PDQanou7CRVSJShv0+ykaJvZ8XlSXHVtsatSuYXBqyYLrJWtSSUa9BBZ?=
 =?us-ascii?Q?7X2Ji6EA4WfY/CztNE2DzGFVnb574ed9AP4KNsaKMOirjJVLsHa786SvWofa?=
 =?us-ascii?Q?T+3qztKVafrwlGA5V1qf20CpESFml5o0xyaqsiOWhVA/hUefBUq49itQfXXc?=
 =?us-ascii?Q?ujlzr/zg30wX7RW/r5RgpN+FpvlvcsAyLi2BayITpTaZiYMxzCAWa+mLy88m?=
 =?us-ascii?Q?68gwglbMVhlwg9q8sCj5AqLdtYCqxxT5Szk8jhHSsv7Z0RiMXvNTuuF1FPrk?=
 =?us-ascii?Q?ZJuLIaZ1koMp8wabhlb5X42xOXVWpL05klI2FjjEo3N6ldKvDPVGiO19LB1H?=
 =?us-ascii?Q?B9HXstof9GTsiUQWFR/d6aQtjFjZUFk+Dh6dqK6WLdTMDfzSAbvudryndmuN?=
 =?us-ascii?Q?RVkGiRspZ0vZZiKl+Xf3jkXjlYr/1NST4nivPU+y3SI/kmeHszEydX2bn4hm?=
 =?us-ascii?Q?7nOVoiOg9V664q8ecmXvMN1dcg3j4oEWc+F4mkws+/PZ1s7GNt9kPzBcu5ay?=
 =?us-ascii?Q?+2LOrzU11VqEm8WscS2YoHSYea0RyaPcuGBJuqasicVljJkhzHS6fB1QkT/W?=
 =?us-ascii?Q?0hhnCl+JIIXpDROL1DgCxCDu9P8dn9UU161F/LZaObANQwxbd6HqQ2s18TwQ?=
 =?us-ascii?Q?/Ps0W9mBAg7Vs6gt5b1T1ziid6D4qdoagWMl2nQnk7n6Yo64+BRKwXTZEawu?=
 =?us-ascii?Q?SRT9E5AM/GHu0T0QpT9vJqAqecSB8iAqlx/UO8I6QRMSKBsYIIrUB+SEQquj?=
 =?us-ascii?Q?epiR6usTrKTupiNDls8jzVSz9VnxPsfkO00FrJBEHmqWZ38A7hApszkJAMMb?=
 =?us-ascii?Q?lUaswGbQxC4oZxwQIqMaeEPcSNOy8YA6kFE9eMcyW0Gs7l3Ki3ghzE5ieVCe?=
 =?us-ascii?Q?vAAfL5URdUrRNrLUv4w2AuLAIFgiX3Vup0D52oHARtowMzceiJLWKGsMCtSL?=
 =?us-ascii?Q?NOuZU9z2IZDwrKDAcfX5WV5r8KR3gPt2J9X7Nq353zyjmegirLyMFEnn0hfe?=
 =?us-ascii?Q?9KisKvQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+JCbELNxJFW/WHgOdxg6wojiFgqi5l0lkW8AlvP8UOOo/B3WwvoyZ0UU5XfE?=
 =?us-ascii?Q?R+uNuzcycc+8KnRgDJx9uIrnGYGOLUfXc6cOkHK9yX0Na46ZyM1rX59CBVPn?=
 =?us-ascii?Q?Eu/ooiS0Q+ykOR00DIxZioL3RUVdZkMgIpBAbSPeKbo69PIQJn8UHB1elVhx?=
 =?us-ascii?Q?Hoz5+SK5ZusP6ZxXgkCbCAYfbixwec8yTJMw3zt9YfApagEnlbONUvqdG3Wb?=
 =?us-ascii?Q?/lDI02n6RVaBfYT9Enhjys/7x2LYcYoPAXSXy91BWW/61EHsMFK0iwNnBRzY?=
 =?us-ascii?Q?tqryRYH3wb5FYw1Px2aF3vfsbFQdIql8Hn6ishDZihh9qaf2tcmC5XeiAfmp?=
 =?us-ascii?Q?G6R4Uzm9yaiZ7KEbzml2dNC9jfY4aBq8+rEDi/vGKVX/tsf/Y4t4PBeIQ+4q?=
 =?us-ascii?Q?Zrkuxn2NLjFZVv6SDitnvBi91/UIELlNifLdouWFjhUyj+7kTbd288p88a3b?=
 =?us-ascii?Q?W49P1iiZg0N/2Y0E+ATkRnv/tv60TMkCjkgk8OZ9rkiKIDzcdOcX0B1F7HzC?=
 =?us-ascii?Q?6xdJ9XgNtz9JuQ+FtnjVoKMIQbamsDOpab265llm0W/zMn1WN9EoYsi1Tiwy?=
 =?us-ascii?Q?UlBq9y7DQ76QjHlw9IdUpNUX9vtJICnDBDhmyPtLWjdrIw50//Wj7APWy7XR?=
 =?us-ascii?Q?+jPIIHYDtYnaY4VLMnYoANB3tV9vZfxXIvFvc6ONM9FAOoKdCZqomn0mXhYB?=
 =?us-ascii?Q?4HhXPCgASDY3lTJsRqOJrZQGJ1gL7tzHcdguC7dqEHgXuVDM5Z5eA9uLylS+?=
 =?us-ascii?Q?vZferBfzwK5Vv6gvp44N8OGSgLI0Wa2k7aQRu2617s7edYMcF6aM+KNytDMH?=
 =?us-ascii?Q?RISnZK14+/aanlPvO4Z1ZoPUrUiTJdIkfp2Zt7z1zc3L5MGmHvLl3TAUiD4a?=
 =?us-ascii?Q?Etqqf2tGIZHwrBmbCedba2BhaA3WFTU80tcFqykcBWHqcAOXoxex4kQxVEIy?=
 =?us-ascii?Q?S+r6x+Wok/C2ZSKaKlL9E+9180GMvIpraVC9s4vdvagZBBxao3LhA4wmIDGV?=
 =?us-ascii?Q?u82YS+05Yq0w8IHifXKBWk4cFjwI5kb7cET/BdYuVWHkr1PIiw0EFkoIqBwR?=
 =?us-ascii?Q?ZyaY3ySUjq6gT7q9BuQaxTsBx0CG/Z+lfSTNGHNfXD/Rt05MTsVeg7OtnxZy?=
 =?us-ascii?Q?2E5IaLfJERqLd2gKUpMVFlD2nvGyt1W7EeLiLvXdpB5zRTowav8OFAUHnTTk?=
 =?us-ascii?Q?Z2ZA/W3peVLkeNsnPI9c0d2vh4L+PiijYEfYGtbvfNgYyADkyhRhH1UjH7MN?=
 =?us-ascii?Q?BuZg6sXlUPNk5iVRLa0Ic0fGYSUrTKWrRr7P/DtmElZ2dYiBhytEiFjwDS1k?=
 =?us-ascii?Q?OJzPX0z3TS59VhWupYbvanQz4JI8vb8Wf/zFKpTAmy3TbSVGn5lP/vfDGzqG?=
 =?us-ascii?Q?V+k0IEDP2Y5h/TlNeWn274cEZFn/mH2eD+6EwpfnD13kh7aVK0XBkzSsygZ8?=
 =?us-ascii?Q?Pa0O9tlWJkUf9mavT0s66bY96tyPIddTV5MepMiVPttw7N4ryBigCPG3yT0C?=
 =?us-ascii?Q?E+2ZxGtU0lY7SZuM4GkCOSDPg9+SWQ+CbHAoADuUgCgrcJRKnF4QXdtrjqey?=
 =?us-ascii?Q?BMpIx1/heoRC73uCRXTTPaBkDVGx0QFLfnVD0MW/jEwn31P/++tF4e5T12JL?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2648eed3-86f5-4c58-9ea2-08dcce870750
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:17:31.9586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8knJshUk/+oQf3v6Qpc/pnlCi+sxPuG715Yg54p97TBRkKh9Pd6yXWPeuU3SSyxauaj9wYd0lnNq3EJuToVUdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204271

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2007:

  This is version 2007-Mar-4 of the Info-ZIP license.

(From OE-Core rev: 3739a1af61ff6f0faca23bb565f9e71666953715)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/z=
ip/zip_3.0.bb
index 83e1e52e97..e1e6be6225 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.info-zip.org"
 DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-qua=
lity versions of the Zip and UnZip compressor-archiver utilities that are c=
ompatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION =3D "console/utils"
=20
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "Info-ZIP"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D04d43c5d70b496c032308106e26ae17=
d"
=20
 PR =3D "r2"
--=20
2.39.2


