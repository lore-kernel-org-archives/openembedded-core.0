Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A447C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 14:35:45 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.137])
 by mx.groups.io with SMTP id smtpd.web11.47844.1723473341651275051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 07:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=r2v8rKUU;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.241.137, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBgPfE2MzrXXGnFqV1i4kegKi//ss/loqRUlGe7YP/BtpAwqjWtiEcwfC/00EdM9sn8lkJedUsUdorWTVtVLb6Ow0WjElvMYFBxD4HX1dnUx/o5sGL/Q+2r282PaI1spKn9aybDm8Hz27F+J7ByhB8P2V9tDBd1dAnoETOx1Dbye1vskPHxUJwhyKUleCgkU5roXj+RRSgUAMoPipKNdA/X88xTx7iAYkgfjEtraO93lL6rVaQQiZC9MoV3lgMSuPI6NWX2b8i/SmK1lW4jO+HDgiYULfI+2tovVVcvBUTcRIQPfq4u/SXDuR56MI/iwF+yOl6Z0/bf79z0vLVcwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjgpkzdHAXkZjlrgXrCBkaGu19Y7LgL1VYodbCtiDZU=;
 b=QFxITUKmniHBwXnzgx6jjIQ2FR4EWJRkO6E3o+4Jaux947j/GWCWTKBeFmlaWjGGTE0DVjps9+yLdUUGIvxJPvgRm+fMInd02Z9El2JuQl5G2xx/qBc7nqBKn2OaFRiS/5WOoMnbHuE5q3ClR7AOigvS7gq8BrzOulF87QzLpWFpSpjJd5YRHWavT+LOgPhnvXyjcMeSsTG4FuKfxytm1RtAWhnSk7gq5sZgR7ww5lSnVSR+r2IBzZt5ZxAfzYsGNVk5Cmm4XCTq7ooq6DItodwCa4UQ47AhgTirEcY2EiiskBIHw5kiPCvfPTMU/se49ozQNOz5IyFDhPflCFaVSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjgpkzdHAXkZjlrgXrCBkaGu19Y7LgL1VYodbCtiDZU=;
 b=r2v8rKUU43Iq3ms0FfFqgFHYPzEkb7keh6jGa/kVYLLjPmZkuwS3Y95MwpCZ0pwD+ut1DL5tf45z55RU5OTN4okXvEbFEpFMW5AqsB1ZH2+br4v4IeEyiMCn503vU3l4P36JohverXFXNtqLFtuf3GScvJV815roKTbfujC0XtMUet8Tcb2izwb1/4Xb/1rGFiN6sWMnCayoQmdOh7+ujESU4dOhlYB+M8Gj6hoAFgkDwYrSW6locDRmqou37oQ3c33HLonDK+a5nQfObd0nYmtGqi5hT9BhJckrfyJYTfokesJEjLEJfvgWgZLIP1Hb1lPI5z3niX/PxFCyZ4oyPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB6462.eurprd06.prod.outlook.com (2603:10a6:800:129::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 14:35:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 14:35:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] image_types.bbclass: Use --force also with lz4,lzop
Date: Mon, 12 Aug 2024 14:35:17 +0000
Message-ID: <20240812143517.1768597-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f12f4f-44f9-4f78-b743-08dcbadc07fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gv4gI4AuUXzfOotVzIpVrZNW9z6wkraavC1zt8C4j70L+1f/OT0D6nnTmCMm?=
 =?us-ascii?Q?VDDmCavPnG7X6nyEIqrS2QPeWoBp+WT+V3mTJpVZSFn6RlriN7SfKxbfrEPs?=
 =?us-ascii?Q?OF+ZQqfRGwQDXzaw0j+xbifRly7/SuHXPogu9GHaPijq1cup3B5HdsaUtMQ6?=
 =?us-ascii?Q?OsqjWCi8a+7CadU1RvXuknRj8Oe9SSqRSU+B8wJ0DO6fQ7b8d/a2i0Xw2kiG?=
 =?us-ascii?Q?ul1XJtZkhvAPUbYSbmwcB5Y+iitfy4kjRB9SdP9Fqkg7BIr459fTS5PzWoqB?=
 =?us-ascii?Q?4Pt1hHFfLmjmF3/deIMP+2+SNVhhxIvFIXpfTySPzQVInecOPV+cdtnTR/7M?=
 =?us-ascii?Q?zqK2EmQEiv1aKZXborKdHC+A38+Ysgj7pRil7bEx7GyIBMU18rrX45utq5yL?=
 =?us-ascii?Q?jror8+1++3JeUfAlpBtJq8abz41nI+RTCDzQpfnSz/KkTpRsVJHGFZIcbqM1?=
 =?us-ascii?Q?+/IGHrgVebvVaREE8EpJsyAiL6cRd4pHvRniTrU6aUlzkG22TRqpx4KZyKVb?=
 =?us-ascii?Q?0U7LNStVVwWBRV+FcXM0Rl5C7hmPIZLznCmGfTuRyQu22AtNx2IiTuZWdDmf?=
 =?us-ascii?Q?itqe1tdAlpc7Jnu7wqrkde0JeaNkOuowEVHgcYgJlJQivD3McvAIk9aZHVRX?=
 =?us-ascii?Q?O3zxVzDYltXMScOA53wa6C9GFCRX4UzRSOmQgFI8VQS8BO/Jl/uazHPU6k9h?=
 =?us-ascii?Q?WrE8l6EA9FScsWUM2Gdc1Ga2/3VWce8n9D5EIqmXLtd4tb2aadVJ84Z5Q1MR?=
 =?us-ascii?Q?V5vh2LvGGQZ+uRA95REw5/5pjRwEO+IDcka1WIOPhW1wuw9ZgC9qG+uN4yPX?=
 =?us-ascii?Q?5jROYPUJRcxtqKpajSGWrPC8gdhuVE8RUA78GMxDHxhzlpE7ZaEqBiK20Z0+?=
 =?us-ascii?Q?nUpMWcPfs3V82iFZYb4rfIClUQ5YcReInsfi9pln53DWSK1OHpvvnrf9y/Fq?=
 =?us-ascii?Q?LBpsJzK+i1hFnLEry2Asq0WQaKFzGavguioU/5ug/fiR3eGebPp0OKepLoBz?=
 =?us-ascii?Q?AGpcMfgstziLrK67tOytNiS5RikeW9uOue86dvbzLb3uUjRr/hpiFu8O5Ohf?=
 =?us-ascii?Q?aTYiRO1x67EG0n3zFfdOff6f5HOp2CAoqI89bjBTvT/ECpQ4Kh/rLxYeBBV1?=
 =?us-ascii?Q?qzsWm5saYQubsqzm4rvX8lOpR4kVTUC4dYyX5gGAklZKkfcq9u/HUL6Jlt5n?=
 =?us-ascii?Q?DhvQwF1YAOhHRfrdeFCCj8yvtL9y0tQQyt2IJHIOvzzwV0uNYyTStWR+tGCo?=
 =?us-ascii?Q?3dO7U+mzWCRM4ywkdBJAG90PTk/mDmgVIjZzrNntj65eLPeTYvoW5Sz3Q1KK?=
 =?us-ascii?Q?ydHEvcsxP8yqqQG+OLJEtBubFj6sDNpcBCj03c9t8oA5te2Yb3lTeAwc8RRn?=
 =?us-ascii?Q?OMVRIwcKZ8i/zoYhnQZOfdMuAuh97B3Ut/A9MPHG8w0FRTwiQA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v8gRh89S62bP4pcVgI6imieA72i9a9j7FSRgeDALnMrWCQxlaly6x2COdwtO?=
 =?us-ascii?Q?P/yAufkY3X7RO1o/0goiw6AH/tQjTZjocI5y8UHzDYLIO0h3+Wu60ddGp+Jy?=
 =?us-ascii?Q?ZUMPCQT5qL+4UZpLhPhQMnstkB+xLQDXTnkPB6NEZBXwu4+fuK0okCYkFHnT?=
 =?us-ascii?Q?fpnsR7RunFn9PwN9USlGgMqKfI/sbqAbuMi0uBe3YjoVUBXwPAAFeJzLwp0g?=
 =?us-ascii?Q?7GMf0tG+KBdfXf5A6FFumXP2w1miMpNvRDGuhCQRwiygJFx+aJvgUAtbgTe7?=
 =?us-ascii?Q?pxEcd9Uhff880bFFBGjKxU6ZnQcUwWJZXovon/wDXQaCzSXAGbazdqkCRDeO?=
 =?us-ascii?Q?qqutN30Exkpi7RWoGmCtBf2NPXoAi06ThNDYijJil+E/Ly/nQkJ9iSj3VoY6?=
 =?us-ascii?Q?Zes9QLVKTtU+DQYE2LQfqAwJgS3vbMCxrIrj/tWiGMRuj7BP2G9oC6ebv/Qr?=
 =?us-ascii?Q?B4mS41YYT9D3jPgSYH7tVwP7Cb0GE8YByjPkcLU8FpiLCzBSUuFgjlKxLu1L?=
 =?us-ascii?Q?VxlE1Z8GkpY1W3HQtneLDEm4Y0+CyTuqYONlv9mdXb72l23LXOj8QXmbqY+l?=
 =?us-ascii?Q?TWXLE49nAujgqtXt7fpIYw0XZ9L+lO2vV09voZVR2GUdzRoJ75N3LQYAyuIM?=
 =?us-ascii?Q?cbvWPnrzq9zMG9BV/x57tKpQUf/XwXurZ8KFeeZJPaijf6CzcUMKI4pX64H4?=
 =?us-ascii?Q?SJm+Y0w6fCIJSe8+/aadBQ0wJLMali3TVoBA6ZaBi8zP8yMMrJewFFv3/YNm?=
 =?us-ascii?Q?8JeGvGMKE1xgQzPmLDeDLmpsgkXR5wKI/yBmewp7XZ7mfjBtxdCGYk8cc1SW?=
 =?us-ascii?Q?PdGzvjB3Nooho40gs9Dw1crPChT2weASObRrdOEJPvkgpiyebDJ398zL2Asv?=
 =?us-ascii?Q?rd24WzD+5ecLugii60s3GDsLS2E/8l2Bc4xuToGrXWo3zs3fZhwW1ZsAem9M?=
 =?us-ascii?Q?RpuVTXopoAe8VKpgStr+ropO05G+f7+V6YO6ZfUFXe0ldBXeVHMTF4HUP/XB?=
 =?us-ascii?Q?4a7D+qdCOt+w1R16lguIqrc/Wf7Sl4ZFMV+M39OKBahUgk5xs1UC2vfxLcfM?=
 =?us-ascii?Q?GsB6y7DfLNVhxBms646YPhV22y3SV3abjPTwy0aFINTqrIyJRLKV5lRZclA0?=
 =?us-ascii?Q?qIAc69zTVw+Cew8yuFf5GNdDViVP4F6pVGdJYbbAWL8PRHEmtn2doDhxYKV1?=
 =?us-ascii?Q?zSQ2SyujVADfBl6yiumeaKBQXvoysD2MC/KO+GZB41WzE4RpCZ5LinJdEkzp?=
 =?us-ascii?Q?xnLNziX5h47dM7cB7XOTeiswq5HUMpVCXIgHr3Qbr4itrpjC+uMsnGTxFi61?=
 =?us-ascii?Q?8pmXNA/6U5YkgFTd1ec85c4ferkB7LsTQJVYFg3i5/orGwUcmLv0cq0B9/z/?=
 =?us-ascii?Q?OEW7Z4j65DHbILC7ws7xbsNwa2QoLbw4x3a5loFGvqr3LPJEnndPolb3nQHX?=
 =?us-ascii?Q?qKexGaIrhSK6YQmaeKNOCihHDeDPUey7c3cGmH60JDQfnxewOFVejasOwtq5?=
 =?us-ascii?Q?LCO7zEcfMyUg3K0jrlIdKTyxZ2uyV2E7vcJOO6O82Yi7kZ7nNzuUrEfCGzL6?=
 =?us-ascii?Q?wChUrlZsqlgL4fqgH1mEFYQgyGYcyt9LkcU0Z1a0nDdTsWvKpxKUYMbIXXEW?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f12f4f-44f9-4f78-b743-08dcbadc07fc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:35:37.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeYuyoPBXV5If31QUtnfVKMaC66mxqvMFQ1LXh1JpD+LsE8TvZPWJW9YG7uEP4BtPM+fMG56IhClDmrv2R4V6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 14:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203226

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

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 506b9934cb..b230add314 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -337,8 +337,8 @@ CONVERSION_CMD:lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.${=
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


