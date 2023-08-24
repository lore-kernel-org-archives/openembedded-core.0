Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41040C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 14:08:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.114])
 by mx.groups.io with SMTP id smtpd.web10.11824.1692886084308486955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 07:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=RXyZ1ycN;
 spf=pass (domain: prevas.dk, ip: 40.107.6.114, mailfrom: emil.andersen@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvI7hiPx7yG5dJJlI4+ntAAxiNFepiK1YetNO46xwCr1nNJozidO+c/EG3CAgnFCp1RGLgsKop3kBoYzwVHwRlcP0EqpfWgU0SrI/WwW1JsxMmaA0+RAGRyPQs8+QVZxTk0jaQ1vvxehLZbTIBQDSjjwvA8y0fqVM34VutaVxBF1HgM0BYX96vazWoEBR3M97pkmyjMXp3C1tbgrQfMGwORuAMAm0TKX+Fl38VG2SJvK3Q2VyzfGCJqiQPct7NfnKF7ruGbz3I8zs9kyUoPEr1Dp82lhpsVMDENvj7CTSnrndcSwgISxT7KkaEJcsruV87dqXJK9MjKj0sdKLMywuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOSUcxNzG0k2IuRn3laGGOB+465hBZZllVM9RcA/UVY=;
 b=MxjEcq3A2RqWV+O1noWn6A0KXZhxCa2ikifEgN8C2cCj691Ric3EiZExUZaOoJIR3qojBoMCHhSK/6YlPlwjHTGvTfpBjYAND401GOvavR5YehddfY7Sb0Ns17IuPcUeapizEjiKQHE4fbm7mo99JeUmu/xwBmQTqdVaoH8ULfSisvuMqSSdzxky8hE66/PMlZ4R7xgOZMqkMXqLoRUdVb4tyZ5y7lHorj0MJYQ61NiAwvWzjmYT+wHYoX4lhaKH4x4zjtTQxJsmrPbLXyaJxJdjJ4uymB579Bb4eF7t0+AQb8Pq8wC/vw/RALcz8nmwoB9kFXmhBGNt7R2suGazeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOSUcxNzG0k2IuRn3laGGOB+465hBZZllVM9RcA/UVY=;
 b=RXyZ1ycN6mP+7/5zLFCf/M3fpwdddKcP7AA5KxM1aYoQHVnNkaIfpIAkqtsPudc98BlnW7ldzkTiYZGks2sLPIapb5O/Ui08OHudPLLk5uZjPcF+zuKHtu0DXzL6RWnP0XSDT0z7BYz92BZXEn9kLdLBwhxumN3nmGZ2y7jruaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1fe::24)
 by AS1PR10MB5263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 14:08:03 +0000
Received: from DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6]) by DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3887:6849:a8a9:72f6%7]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 14:08:03 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Emil Kronborg Andersen <emkan@prevas.dk>
Subject: [meta-oe][PATCH 3/3] snappy: add CVE_PRODUCT
Date: Thu, 24 Aug 2023 16:07:47 +0200
Message-ID: <20230824140747.45594-4-emkan@prevas.dk>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824140747.45594-1-emkan@prevas.dk>
References: <20230824140747.45594-1-emkan@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0070.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::29) To DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:1fe::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB4571:EE_|AS1PR10MB5263:EE_
X-MS-Office365-Filtering-Correlation-Id: 858bd3f7-a659-4340-7f34-08dba4ab8814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1xZeoqssPkDJ2O6HohAFM/mTP9XifP+q2T/L7mihu4EQ7omx8mTNvkNz/U7vNTRMH4cEmCmO9zDsZ6rLkQZgruyxfnQYUf3TrpPBuRRdwm0AQyGMRevChfzZOV/NkzvojyEilw/72zUy+GYyIS3sPFw3Z2YPMj7Qn1mswppb56sXlYNkkdospzB7HNCNKzMM48hh3mD+pAicdhlXXBfa5v+7uZ5balcf25xsbX2Ig+6R6X+tt07iLJAk/NNCHv2gSCMBX9NsLkwrwQc7Lbnraig/3zQ2GnkrnBznH8XU4ncYiJ1NiBSt2L4Ld/GK84M2O15ZtRN0ujEgNaU1eGH5jeeKAteN6bHeZE7zXWatdhcgzFmb2G36wTkqN5JdU2AtLcHcBYOw3l4YP1Jr79uACKZuKr+eYvXi8Sz2cwm7p6Qhzb9K1SbxGiGpkTFo8Fa5y8UX5m2svQcn+hqZH+i9EXUEHRn+AZGE6RIyqs7/sx6PTZiYEcMLBeN1BnrAJgZ+nwzpwlRGegp9/fhnE/B8x9NCWr8nYSQ0Q1hufY3VNBsyMWSQ93zt1/RxZ5qHK+/3F87k63Sb8Hs0TvbB9ogoVLGwaeQz1wKwPEL+odTkWvc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199024)(186009)(1800799009)(66946007)(66476007)(66556008)(6916009)(316002)(478600001)(38350700002)(26005)(6666004)(38100700002)(41300700001)(52116002)(6486002)(6512007)(2906002)(6506007)(966005)(8976002)(4326008)(8676002)(8936002)(1076003)(2616005)(107886003)(5660300002)(36756003)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NAQCfv8C7SsANFC7Vl1+hhA35L6MlND6EMmaZjt2DlLs8/M/0aMxAZpbXNNo?=
 =?us-ascii?Q?4nfqVF+av/4qdNO4io62Zw0mLsKr4OO288PmqK3ZlJ6O5V+ESd+32DsUTX6n?=
 =?us-ascii?Q?+rfLeJZ91DW7XTQkc1wxSHxlMfC+ZhBvwpY/MSFRw/mJO8OOLHzgiV3N5Soe?=
 =?us-ascii?Q?2Cp2WDKkq8bvDBlU1Kl8w4lCfOPzPH4k/peE6MrGto16Hqx/mz1+Q/AioxHC?=
 =?us-ascii?Q?SexqPhqXtwYiK/gm/d0AfV5+VMaqqPPNkCgamzsVMXcR1ma6nYQFM6AI6WYi?=
 =?us-ascii?Q?FYslMSrwL1hHhzcypxIQd67+yhTSv5HtEg5VWMaSbbU7KD526CwlSQ2Lty6J?=
 =?us-ascii?Q?igmUegeYoCf6Z3uR27gldPBI9o2ZyHXVZ2TagnkuC9ZCOxPt5cENzvgkJPR+?=
 =?us-ascii?Q?QDTsqsjWi2ubea+1/JKfPLj2tpg00AII9w2ivahmAjXg5SslVuaxHO8l5WJ4?=
 =?us-ascii?Q?oiCIv6zmhZzqIdWr+joI9/XVvH7lt0ppy630iWppnlTfQGfw6UWeC0K7ArXw?=
 =?us-ascii?Q?PEao/EROATjvwY3iEzoOzTLNnDylPhpLc2d5gnJKh8t2xn2ClvUL065+sdc1?=
 =?us-ascii?Q?Giia2cE3pIy3GpT+0dYUcANLB6wUaj457swJGuct0Cef3HbXMOZjxu9p3WxB?=
 =?us-ascii?Q?6QDmPDjStWt+5p//ODCegkWqDFuBvc/38nDjafKfeasGSB75i+ZQSlsu77zR?=
 =?us-ascii?Q?LPjJUpIyBQxSEsTDOq9ZKkbUuHs7ulOsq1eaeydUQqCC2iFMoKGqD3fvlVeO?=
 =?us-ascii?Q?a3JaZFqMlb0vVRAFqsu/NlfNYtheOwOU6+BIeH7ihRKZN6BawilnlO4RYYMm?=
 =?us-ascii?Q?OI8Nz+6cYsD2u9VHVx1qNNXwpMNz2E0oD94EYQiO/x+plC0cd7vsCfgPGQvf?=
 =?us-ascii?Q?TjNwWaiGIWPSLMrwHU7DNkf5ZcUVkTufSyJYDhWEWI1SLP/2h1HuQD1DVec0?=
 =?us-ascii?Q?f2M4RTE8OKue7fN/dm54Is0eVk/jI1thnUVCX5vhybxFQzp4/htSYDopPiM2?=
 =?us-ascii?Q?E9OnJtpG4H5rQ/qgxof9eRF5X5BhF3PmMuAyK+Rwq4r1W77RmpdxvHn1HaiI?=
 =?us-ascii?Q?iVnXeYa6XAq76N8lq2G0OXKvQLz1NBpltmKNuljoFHG3TJtgnWYK9QzVgsXH?=
 =?us-ascii?Q?aQm6SculbfYVfS9N2r+1VgrpXoBT315osp4+/7w7eeGwbjfYlDBFzr25ERhD?=
 =?us-ascii?Q?oi0P5e9ZHUu4zd2vrjDHNCjR5UTXpXiCdtPHlKNBQmagKHd51poTXHMKsMRM?=
 =?us-ascii?Q?N5MxbdwHALHZFu0PxznO/3yktgGNNVb5XJt8GBfIQLXLJv8xfDUpWuenrVwo?=
 =?us-ascii?Q?5oZar2n/Pb5PnTZQUhDcHIzQNPy/dexbL8L25iT5+Alm3fmVNhKDOH3lqqCg?=
 =?us-ascii?Q?NBo2VeWxjZMQuP8KMdOSbAsZLzeuHVRrej/S+F1fdjC6KHusxBq4Wtqka1Cj?=
 =?us-ascii?Q?1Byfii+Xs/pdSoAz30HVe2JkimJVEy/pI2OuRul1q6pigwNM+8vTClBefukR?=
 =?us-ascii?Q?h6YU7lTQHhecb29s3TfdURHLyVPHm39XmciIdWxljrMXTR4ogclsh9FJbvMA?=
 =?us-ascii?Q?5U8SqM4FSf6S3swEHp0ZysgZ+K/PKnu1LlwLlqHxy5KVFtow16OzlxEawYVu?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 858bd3f7-a659-4340-7f34-08dba4ab8814
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4571.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 14:08:03.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZdtAvGf1S/vmg/MnOb5lwuQKc1IN8CPzJfdFNunil+eKCxVWVmL5R/goulahFFSjbFb9UX/CkvYJkI07TN52A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 14:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186666

If CVE_PRODUCT is not explicitly set to google:snappy, CVEs are
found for https://github.com/KnpLabs/snappy instead.

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/reci=
pes-extended/snappy/snappy_1.1.9.bb
index 0d58345d7..9e0e43ce8 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -24,3 +24,5 @@ PACKAGECONFIG[lzo] =3D "-DHAVE_LIBLZO2=3D1,-DHAVE_LIBLZO2=
=3D0,lzo,"
 TARGET_CFLAGS +=3D "-fPIC"
=20
 EXTRA_OECMAKE +=3D '-DBUILD_SHARED_LIBS=3D"ON" -DSNAPPY_BUILD_TESTS=3D"OFF=
" -DSNAPPY_BUILD_BENCHMARKS=3D"OFF"'
+
+CVE_PRODUCT =3D "google:snappy"
--=20
2.41.0


