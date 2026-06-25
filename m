Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF36CDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 17:06:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16203.1782407201478282588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 10:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=s4rs3XME;
 spf=pass (domain: est.tech, ip: 52.101.83.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0c7fNtq4ERWn03YjvLxyLRUgo7Y3nkTvafQ6lW7S5RPxQSjP9m4vkqdbdeV10fXd3Wbz3g4WhbQj0D4DeW9YvAYxOrihEIG6Iu65c8tGBKDm9WHomrixCUeeB5TpF1gIYSSq+PoxSQIu2uoXq51j5G6ozy8RNx1DFKkZ/OJuW9zLGrbckiy9PSap/tOW8Hr9qLJIu2E6lDWMFOXNO9N9xTgVL3XyogKtR6rDv6c8MRMk8CutPzMHOYPmh5AzEHDaTI1dNjVmvMGx15u4AP6y2aReCm7nkQJeomvzVhNbvyske4ZVbi+gQOSMdvYNkd8v76Vlq9YHN3Atiq+oSJ6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMUapjrfeKQDjYWOvzyeBKDxf2k120nRY9RJyDM4SeM=;
 b=iKAg4nY7kl55kk/hlsm8J4aA4esZ8wdnO144oi0pw6icRqtTJM7GlzKVwAKeZV3WKNisyNLx9j8r2gz2veqF2gi6pfWJGUyismAlIpIM4e0zcDwWBOAVKFIC0c8zLjvvtjD3tUnTfzk0deb7OD59nafaIl+pSlczXktks9nBTCDE3rKPC8yrVd6ZjNbcL9Ax67qGRWRvW8AQfe02f742P5tkb+M8GC/1idtO6H2SzeSmJpCyes9A04TBqGV6Zt3OS7LKmwvSbY+02vApYWlhNtwRwgNRSJGTXvkzzxexlv2D1N/T1DCkOc2rE311r5UDeuCmeKYDVzWm9lKmEFEhQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMUapjrfeKQDjYWOvzyeBKDxf2k120nRY9RJyDM4SeM=;
 b=s4rs3XMEvF5SLYF+uwI+0vXfxLJtbfoKla8eOqnoJwPv8JuCFxApCq+tDJuBmqDsJbSSd4+Ph+vXcZDh96GzZ36NQ5RSX51+C5t7Tv/uAtjjWqCfPG4mqr3vpfRzRssOzbE2fexlx6tV+0EboemW+wWlXAkffHK6sqURfNiYnkD7w9XwSpcz05skn5IX584lPBtjM69eMVAw2Z2HzisLgjrb46FT9LfS55ieJ2AVLX8Bss9EkgVRcuu/RWYlndoF5kFayLeEcVUHjjy8OYlqBcWhxf2pUa4X0PVXCeGGgt3y5pPi163AdlkwGypvyJbewPS7xvPVt/QUTPy5ysSmng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU2PPFAD49C772A.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 17:06:34 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 17:06:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v3 0/2] install-buildtools: add --local-file option
Date: Thu, 25 Jun 2026 19:06:18 +0200
Message-ID: <20260625170620.81300-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
References: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU2PPFAD49C772A:EE_
X-MS-Office365-Filtering-Correlation-Id: b50ffb4f-9c30-473f-5953-08ded2dc1c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	sRDygsrYYKmLIS7mrQwnUvFoiuuFkIWfLUpJuXs2N3A7fTHsfDAmw3DG7WLYuux8uCeoileOMLqeFlF+rP8yqLWa28ojD83ed7RoISDFT6oNDaprdovBA8Eit0bAUMss8XCtr1j/IuPNjiOvYYh63+vksKWcbFboUoPc221mw6Md5tAzUfeRZUUhs7X6kZ0aPZuMBzojOPtPDtRqcuBJN4WjM0cx9Se+oxwBwxCIjlZmfC2gtSKJnUGgmU08BbD73puV7grcRgMdFetZfDxKCcJ7lFouAReRW7mXLh7X+ef/dtybx18cooAHr8/+nToWuCyYa+CZALfbnyvlGxaj7+uaPuH9R9yJSamlrQpDfB49Y8rSQdGtgKWzlTkwFpPMDINm95SMQQajJ0Bok/GalDuRyT6KkdDfMCRSnlRTkCsE82Z6f22oA8z5eRcs5OA3j83ezXGiDTZJY+z7sWxnVHKpdBBQT68C59EjdXBGq0nynNpbGqZlchlhIRnfwRq3E40wHdDk5kCpvKAtG3KPyYVd6kCa8dTlcc5wsRMkBPnttASM3zM85kqym6b5ViPIwI6G1+d+L8sHq59gO3BV3CtdAwdEUTdoyl05AGlbWrZiyyt0CnQcHHWeCtSHaNJoB9hxj32IC0voTGvCqOXaJ7jazkOpsvDzfuhpR63e/Fw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CMnfsTDrZ3pIi3EZ+M+zwW0J2VupmTdI2dc4w4Wv6V0uPJUdlgMptaTkBczb?=
 =?us-ascii?Q?nph2mBjmB5SkFEfOrRVfxQfhwrueI4hFPvuU7LEaPccd2N2HhFhEbJ50i/ne?=
 =?us-ascii?Q?k59QPhaz4hYJKpW1I7ek5p/Um4tcDkxAbXzafiRsuab6tGqWYEaDUO0B2bYY?=
 =?us-ascii?Q?6hTBnUaQjIlsyOmMa31jhv6loLSNu/MIuBaVOvgTp+XUn1f5Jw5zaJKPdH5v?=
 =?us-ascii?Q?6C1fADPhkw2rnrx97q93vvXzOi+EPCBPC0qS/mu3MnGqjwguld4Jqiv6mlZw?=
 =?us-ascii?Q?qNdgXpNMjW2zamJgM5ZVBa6uhyFeCa/6Y+yl8/IAAaQlX3qtQGGNG067+28L?=
 =?us-ascii?Q?ARN77zv/TkrXtX9EXx692W9a0X5pEZipWA1crm3TZ4c12crsxby40GdTeid4?=
 =?us-ascii?Q?mXDgP91nmkjhtnnUW0q+C05Sz0zclTuGKdJDpQNuo5bx1p6UZIZYZt3h+5ac?=
 =?us-ascii?Q?t/v19/REYnJ8K375OLVid7UGc3URlmCtb8a64eaAOmoSS/0sa58934Lqzt4L?=
 =?us-ascii?Q?B2hlxVbZY6AHT7qqHvamnyB6UxmsU/bAJZk10x45/1qIQgbWVWImygiBjm4c?=
 =?us-ascii?Q?6wW7PPHeR4DrVv/sfCMB3ab3e8+GdRlNAQBZIrMrFikiCGDVi1Tnx3ASAwOa?=
 =?us-ascii?Q?Bq8biTBI0hMsRD2KqCXXEENEHg4ZjkK4/qCzhJtM4mNzYm1ucGykKLqWc3a3?=
 =?us-ascii?Q?m73rLuBiYSK0uWIvTHrM+gZxUnjDgDITZMLWetxVYrnGuhTb1/c+MmIfd1c9?=
 =?us-ascii?Q?uVt3r25hkhq9bwA077Cgq6q9RzIE9Y09IopQBrZJ0cCPz2kk6HHwZ43aogAc?=
 =?us-ascii?Q?/kurm7Gi4mNYJGXlTAQeu1DoGl93+AXBmy4/sW39hS5u/7Nz7hKgJxLhF0S+?=
 =?us-ascii?Q?PlKyxxzbHQcsKRi27P4YSUBzbzxPMkkvmMwE0nlWFIH4f5oSNOfqUFg257kh?=
 =?us-ascii?Q?XEsF7saKM5/WHExtmHvcDXJsByHJrx7+0TRsRy7x+CUdXNIPKOP4c0/MyZRO?=
 =?us-ascii?Q?lSpu9D57522IEgsabsY5k4fcM/xg4MikbO92MX/+Gv6WSNTtH3yQ4iI2AGEB?=
 =?us-ascii?Q?y03nLyA9j2Gv95/eBrShAbqpNBeTmMjK7q4BGiHwPunGaqkrRomRQ+yZ2uQe?=
 =?us-ascii?Q?NFPkmetOcR8PpALAIwB/TAZ26HABsHy9utAtg762GR1oWmUQ1/LTrwr9AQgR?=
 =?us-ascii?Q?o5c3QxgkoKBYP+StF6WFJTw8EGDuFxn9ii+ngPo2eYHaZRfYB3D+yNm7F2Rf?=
 =?us-ascii?Q?vvfJpCDAfSwb/J52pA4wk3niU7dD41UIbpP2Vgv8VUm264/9YfKPYHQRcNJO?=
 =?us-ascii?Q?FuywO6DEIDc414vDDHemJsV5Kq7QEBJfES/VaQxa85LGGiiG/29yQazTVIkm?=
 =?us-ascii?Q?T52/gNij3iVym0waR62ItXuTvy8ogTeqhhedxyfI6lQ8rcwdDlTCmksviWuA?=
 =?us-ascii?Q?bzD4RV2QLuDu9nfYT9BPtp7seHxStyuzLjqaJCqe9tnMdKizmdg+EFSA/RHn?=
 =?us-ascii?Q?sJCT/LU4Qh/u9rM88n1HnHOHsq7lc+JMIAhf7ke8cOQ8XibaTujVsBZXWscP?=
 =?us-ascii?Q?6hqV1XcCYpHdUgaRf6wpZLqHdhtkjDHkOMxyNC8WJ/58Ov2QvgNEt0ZajILW?=
 =?us-ascii?Q?5xAq0S+rPf5VIqTGxARyQ4r662fjO0H8Wm2VXg+27lvooVTbFXTBLBfLJIH6?=
 =?us-ascii?Q?GyRJk0ezLBFe/SnrxdEsv6jufB15f5UrlZU3N0j6HUcCkmJOug40wz9Sx/JJ?=
 =?us-ascii?Q?ItUQgYOijiuePP1VYjPc5b53vCTDSdo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b50ffb4f-9c30-473f-5953-08ded2dc1c31
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 17:06:34.2217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpvpjrDK/NTHYoD4TosTQJmkjiWja6pST1sMq5J/XWrHmSjwyV12OtGIOLHUDNJA4BuHAPKkMG9OSXYD6zO4DpUXd5hR2pxGaW0VB9+i+AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFAD49C772A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 17:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239582

Split the --local-file addition into two patches as requested:

1/2: Refactor =E2=80=94 extract fetch_buildtools(), drop shell=3DTrue
2/2: Add --local-file option

Changes since v2:
- Split into two commits for easier review
- Avoid mutating caller-owned file (use /bin/sh instead of chmod)
- Remove shell=3DTrue from subprocess calls

Jaipaul Cheernam (2):
  install-buildtools: refactor fetch and install logic
  install-buildtools: add --local-file option

 scripts/install-buildtools | 123 ++++++++++++++++++++++---------------
 1 file changed, 73 insertions(+), 50 deletions(-)

--=20
2.34.1


