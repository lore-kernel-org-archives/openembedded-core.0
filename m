Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA248CD342E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 07:42:27 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.122])
 by mx.groups.io with SMTP id smtpd.web11.17944.1725349344429963476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 00:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Zavxicfy;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbbGreHkcELREfh6ee3KNNsLncheHvewTJnndXsBwu69TgGbGyjUokTuHq/sShhMw2nhx0Wc+WzpcvQ9LVl4asMUHTsUIK7o3OTxsRmSAZX4YHhZolykbdh9TGk3UdhE3zIDPkl/4deE3lAvSDizeZM2TP2Ufe5mAVTK7++NZejQY7DCPGClxgvGtjKcXQj2DEerIMd/HdrpN4tUanaOcg9IDsw3kwGqA6p8mlFjILL0FAOglAt076wbPHXothuHvO8DYLb3qg9ewMOZWkz5B+OOq78bD1q1s1cVx00QVCb8aUYVi/zBSXciCyADtDJ8sjAes7vzSpvBlaTqF5qDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R6lu74NyeQlG6UT9cg3oFAyFgnp2oGNe1OVovhCc5c=;
 b=LvF/wcv33fjpJDJbhP8Y2Z73qgXLm7arLByGwN6h7YbVH3GacfT0QQ8SHenMBkTPlx40xK9+du4iKRxNLx55w4pXYctE/ESDMBtgCF5DbLncTrqVrdZaUTJsflo8LeopoX7zIXaq0Np8NKKFy/MNq0CHe4RBlhPX0I0CDbi4OzrhyaOOsJ9NFeeXGoWaotl2SyVXPrRE/AMRyCc8jLnhr3xNWvBlJvUsKQnN3/q6Btf7bM/HVk9fkh11b7HUQU5fl6DqLHVo5EOJEXUgtQ13gMPA1xoRgPIjr6MfHn80BwUCOJXq7tLOiQD3P4M0GKj+mwrpi+4x8ZQXIUjhoo3jYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R6lu74NyeQlG6UT9cg3oFAyFgnp2oGNe1OVovhCc5c=;
 b=Zavxicfy5dnmdXtlg1anAjC+FZ/Rs8E+ceVJoJsfiSpbXfTUftkd9MOxP0M8rMI2whue1sY8DygWVKibJioejqDQqMLtUGI1Ottid4B1lqmXcfq96WFj7teY1/kZXMzN+9tLQdP4AvHtSq/XwRXHHFbcbXh0+dbvx+01nYGWQaRw4Ak6+8WWIi3BsjsmGBq4dsjRpUQ9mFIevoeiHVZxvBRWZDbY/sr0L3DB8MC6ePs6MRpgQ+lZ/F874fs58HBDs73dstBR0Kd7SkqpPaVxtFUR14l4xZdIb+rhNk7yFczNwWbx85wxlQjYsCPFxWp29fo9wuw2CGxdT3mvpfaLww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9211.eurprd06.prod.outlook.com (2603:10a6:102:454::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 07:42:22 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:42:22 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] zip: Fix LICENSE
Date: Tue,  3 Sep 2024 07:41:59 +0000
Message-ID: <20240903074159.134083-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903074159.134083-1-niko.mauno@vaisala.com>
References: <20240903074159.134083-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::12) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: dd588686-d4ae-4bb1-9d0d-08dccbebf25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ytpzIdJ1NQbvKyFiYOuwffOTNPsuePPJP+0vfQHKsFd2gv3wjjmdYIE2R7Ed?=
 =?us-ascii?Q?jeBgEhU2cefuSgivMSF4d/Rp7PJlrPvsL1NGsL8QIk1ld6ZhhnarCKOYAhqr?=
 =?us-ascii?Q?q64y34z7rwBQDOWlrUbtBiFhDYXnE+KoI+hrkVBs3O/NWZuSDOK3KlQANggq?=
 =?us-ascii?Q?Ibq4YdN+ZLH/pAPq7HUtwzVKB/7J/fy9kL9EjQQ/n3lBnPknPOMUf05Gdfbs?=
 =?us-ascii?Q?s2n4+V3Bj+CZTcOfSANKYFHUB5g35gJ6gf9+VJwzY7oP0WNr3pXW61c3fI5f?=
 =?us-ascii?Q?W80Zg2Hx2LDn0lpbC2BrI77jVbulxc1DT1VQFZA4t3am/ssbDRnKLy8DzXqp?=
 =?us-ascii?Q?dZdmBkSZtVIhtc82ZFidxXbZium8KwSevXWyg3RuN8gRKN0MXG/qJEqAScyn?=
 =?us-ascii?Q?xzzk8SG7cI2iLBOnEXAjntWnU+cIvnFIrN892hhvfKguME4p/1jUCwjz60yV?=
 =?us-ascii?Q?VMsJzI4dw9dEwems7yD9OIkrhrNtnuednfVmkX4m5KdQoP4JVDD5Ta9XP3nJ?=
 =?us-ascii?Q?OSmq2MbbzYeoZlaVuMHh2f9JQ0V5fjnWlzxeSdW2Wny6xjVrK5UzChBtDVeU?=
 =?us-ascii?Q?evyVT+jN/G/z0krfptM+PJlJjz86svYAqwgm7aJWjik8Us063we8uCS01LVN?=
 =?us-ascii?Q?FV0e5cmGJE+B+25N7Ag+7bPewj1qgPfeEIUd/23QyaIO2Oe9rxwWpu4RYs1o?=
 =?us-ascii?Q?roHCg9rStR/ZIyg1t8UBtghXxs97vgbYQIPDe6Qnk8N7NQKgICyMVxEurSd/?=
 =?us-ascii?Q?mhVjHtTaWi0veLNaJ5bDbLsD780BY+zFlMuvNseFiy1V48F/2jfviWFwlaBQ?=
 =?us-ascii?Q?n9Hlu7dXdJLxzpfQBvQhMymwYTGr1GNAW0/88Q4FnS2lPQY93kooDMT5dAEl?=
 =?us-ascii?Q?eeMCuxdHTZsn8rEtk3qNNFJxHyIarQxyuCbAPwc+YH0/MIXqfcDMI/B3S6M3?=
 =?us-ascii?Q?K9u+cTXg1k9WM2AXeRw8z1kVxqPLzCzLv2S3mIj/p2NHZ1n+0dCsfz6nvUwt?=
 =?us-ascii?Q?spxN0P4h4I8tNdhRB+hgvofwVtCzTO/X/LbBT2LbPYlHhCbUV3UK9DR+UUGZ?=
 =?us-ascii?Q?Kzrk+IiMLP8Xkqkw6gd0W/Y2CBGkJPnU+VQTBuvi7oj1X4NLH8VXtg5Jznho?=
 =?us-ascii?Q?jzfayLByc0cCbyEgJYQolFuzPdM3ChZ+z46w3eMJY77rdhmS/4w1rMC1nn7Y?=
 =?us-ascii?Q?N8ihoIG7TtmJ2zDDRI0azgpVqrg98wXjQ9673V3naIuNhN93khdTwy7r42YO?=
 =?us-ascii?Q?q4EVcR8Dj2VSNwkM7lcEjjUOhHbR3+MEYc9bb7DvN5N99ufNwap8f+e2i+ya?=
 =?us-ascii?Q?bxXsR6mZ6uwMU0NI8sT6TtcKfSl8TxK0W/9gFW7UpJekf3NIncQv/PziZvrV?=
 =?us-ascii?Q?+1QPlxo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pQccuG2khN8U8CSLk63BH7CWiOfOIlMLx9y73L2ktjuRD0qhlUdgsMqQMik4?=
 =?us-ascii?Q?IAjknQd0PveUbw6MDrVicNJlgeoniFobhhy8/eYM/o4tFUI8RtoGCVksQf87?=
 =?us-ascii?Q?yTJENilAVc4PG7BtnbDfLjwIG1uJJIlYHuBmX2tG+qta5iN3/2Pxa0WtSvnH?=
 =?us-ascii?Q?aw/BN8Iz5aE5pYQUvO89At50F2PSDZBUQ/CEHLNcTM6i+UbrjJ+UAiYxs3sf?=
 =?us-ascii?Q?umDUZxlKbTe3EXmcubocyZ2KFyu67KxoabNLvW53PUZCjMgm49Hx+dx4eIWu?=
 =?us-ascii?Q?CsA6RLo/64SgBD3ib0wX5n3ZsAfSdOdEy1uQ+vcPDAJphKdGcZa4uY4J9cfZ?=
 =?us-ascii?Q?Bzvontc4DUt9YYlH1QNRIojXGEJNlJH1RgFTmRex5XKkJMJrO9AzHqN3giOi?=
 =?us-ascii?Q?Jg2419lhTDos1jtfuOhIk6CRZWal5uIG4yhf7+11cCN9n5unfY9XlhChdgQj?=
 =?us-ascii?Q?4Lgz0E1WnvEUMKIOMdM5/Pk15aMFFQWjGu3paUpCjdelNRbdj954Br65Nl8J?=
 =?us-ascii?Q?MOQTUvmfAhwBT0/ljyCCTVncW1ewnLW0Ntrz59wHaYdRJSQPfR4RJHkCwOOx?=
 =?us-ascii?Q?aCLT1dPdKl8q1DQTqV5BAvocM2tLkHXzmBg1G2S5b2H60ep4wONEuSq+EyS3?=
 =?us-ascii?Q?NS/bJ5fGYudOdpD46EEN3msW0wtxS3rzaCnhF0KamKPCWJxAKT/u7yG1hsfm?=
 =?us-ascii?Q?ktXMFrgTO4gCdoQnz9SDj7laRj3wNjkJQpkRpvN8y+c2J7DQjJFWoiRgCaiF?=
 =?us-ascii?Q?LKIbeuh+kV4awgbdnJpCZskI/NE2vaPP5zwsIcgmCh3BuUGwbx2kKtrxne00?=
 =?us-ascii?Q?50CYvih2bXapU5FcLuNszkLw7QkySTMRHJFJn23NS9wv3bCbpXAEeme3olj7?=
 =?us-ascii?Q?0/94bh2wPQ1qhzt70ANyFRVthnOffcPC3A70RMtBOAzntJ8Ns+RpsLWY5Ggy?=
 =?us-ascii?Q?hPnE22JumDoQ//jwApuXkScdHVJ5YJQ2eopu37bgMgMJxHQwweuhjuU6+u0x?=
 =?us-ascii?Q?tkRILWSq7CVU8yzwHyvG2PEGDHenw7U0e0OZnuCm16Jxz1GhSYrJw00R8oeu?=
 =?us-ascii?Q?OHLKpYeQJWFCfj8IkyFJgveBYAmUAHrXPfqXL5LL0w0FilEAlLKdbvbYXN8i?=
 =?us-ascii?Q?sce8cElTvuMey/I/AOvmAyRzMYxpWSGeTB03JBOr3YeKY3s9zM4KCxwa3Dp+?=
 =?us-ascii?Q?64lw3BE8hIFT9soaoUK8C9FMOjY2/bkkteMzj99mGseIo/OQllCUzhMzW7Xd?=
 =?us-ascii?Q?9SNAiC6mlTiTsGgpWZrqJOuoD2eERp87aFOjG/qE89hX2+jsdyJkw/PI1bg4?=
 =?us-ascii?Q?UAZMGnyx1k4cJZmROI8+b33eMy9ws+9v9SPNVEG4SQ8F/hHnWrexP/yaKxxf?=
 =?us-ascii?Q?2tsqKYLiB/Cub2C+p0gLGPcAaO+XBDqymAXJxQ/c07o0IprCyUCKS1siLQIQ?=
 =?us-ascii?Q?k2NSIsrB1EjHKTktZ7tQsYgbbpwmMdhbal3aWA7rgdTpJZvuAFrVCrcUggU5?=
 =?us-ascii?Q?40kfvpDS6weZxRahzRyoDEM8OrbK0UuyAZ7nephpRs9FOsZOoHsioCDRcGVS?=
 =?us-ascii?Q?Bi+jxH/zMKHnbGOPb+UK63M6pSdFz1NCQ/7mZvEBP8VD0jYsuv9wVyGaPfFj?=
 =?us-ascii?Q?VA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd588686-d4ae-4bb1-9d0d-08dccbebf25f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:42:22.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79tFxCCQDlkwdNuU/4UtnChnpVi6Y/MSVL9lc+KtoMOcHVNQu8JYDcKFSftiAkQrjmgUK1pqXIvuxqP7Z9CZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204125

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2007:

  This is version 2007-Mar-4 of the Info-ZIP license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/z=
ip/zip_3.0.bb
index ec54206335..58144baa14 100644
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
=20
--=20
2.39.2


