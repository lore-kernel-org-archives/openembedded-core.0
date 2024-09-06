Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1529AE6FE27
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:17:46 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.90])
 by mx.groups.io with SMTP id smtpd.web11.1424.1725635856935465437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=CHRw/SNe;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpfNoSHtH12S6srJurojV8Bx8yGGuucB/ZBLUVVX3MHvfQmQX6ukGcr2wKaKhtk3UJZ5cumJBOM5Zh/1EEPy8WNRi5P9wHYpdHpsyS0sUZa9xeqDLl+XggiqNuQ1LZrq9yQgk1UOh/MUy3zRhdobweqyWmSFAs2t7svry+hT6CsLDuhTiZp2vE2X3zrFA8RUyRf377BhVkwbOEMJEaMYt8uaWXHgWpLSI8yVgUhAo+g4NtdR2aIdptkLAw6tPm2Rn8jVnizw6BnUvC9VSqAxIJunce3MOuTJjM2x2z5soiPGULsm7mgOl51SJRGOSrIJfK7bf7xdSMNfp4R/4ibfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PflWbMYbtJFGJIriaW1sMolPcCE4bnsa4y9RMs39Mig=;
 b=acMeyEGFl9zt+u4c4V5n9IKRsCe+PrJybZwLK2gBn9yD+HjrVpodAI8si0+KkiNvgD3p87h1pVDVTErg7oIm22wyx+FO7E6M+tH/XaxHOx1hypgJXzH+w30SglBbjZpo8Qmr0b+mOhh8eCAHU30V5yY7UtQQrut4zgFddHtqX9h/CVGzSrL9WcwQXMx82tmhSNImYDxIRr3gDIyUqvwTrZp5EG9DCayafDXjZBmFQP87nM/xMXdQ2mQzGe918Wv0fYNsIwG702meUusnzXrHA721pSdxgRHYxUNeWl3tmktWTPOKvE7cULlzOGm2y1T6Efvxt5XJyEfNVa92ZRBEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PflWbMYbtJFGJIriaW1sMolPcCE4bnsa4y9RMs39Mig=;
 b=CHRw/SNey+U+9Jb1Kwn8P8+Hd1ksZ0tNsYqGQiC5DV7NU168aAfEkH5/XAtd9jEH8Elf1eUrdRFPhLs3GkalJnjzBP4Xz1KPFfZRGDCKTwWn3MkNHQl0uNjXR9g8vyW1Rju8SdkYYBBm/bdf8aZ0DVNIBkO2wIofQ/Gvl86jH7DnxstJgaLEZTBkth0/WJDAAQkm9M5vECSFyO0ZrY7Kg8GhFLHe0NsjhxhwTU3w84wu5ttGW1v1DBsi1iepOucssb+Ihatg+QzIG6nrqJd8qSs/xAZ0YF4hbAQSCRnhPtOHBPnJNSAlSTvkUWWEnOD8yzglp37r/wiapBF9dSm1Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8950.eurprd06.prod.outlook.com (2603:10a6:800:1d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:17:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 15:17:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 6/6] gcr: Fix LICENSE
Date: Fri,  6 Sep 2024 15:17:02 +0000
Message-ID: <20240906151702.3006933-6-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34c375a7-3594-4a25-cdf1-08dcce8707cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/d2wgOOrNEweUe6T27SKiuEdAIiDQjZYaJAJSwLSShrFm9+crInEmheNtdfH?=
 =?us-ascii?Q?KC2rDDypzkSEZgTueZRIlwSKKjQsqk5ckdlcgq0Jcb8OU1oP/OiFgqMuq2Wk?=
 =?us-ascii?Q?ODKPEVMfyihP2krA/fk500PrRFU3i+4c8dlrt4VlN3zb/nq5qiiDJTHKy8Ho?=
 =?us-ascii?Q?+cY9Ffs/MbSXa3JaoLhCFirvihYeEUQW/q/xk3dvE0VIRzBvckjcLkzrZC+m?=
 =?us-ascii?Q?T3j8GvFJudLhc0/HEBCi5QWf8eKDpGXIRGQTYdlkBwsArBMjrxQGYpGMw8o4?=
 =?us-ascii?Q?9L/HaAd1BeVDTZeSIMVwmzJz0D7uoEZU64O/UsuYAm20+dSHcM+poW7FwKB6?=
 =?us-ascii?Q?pbZyTrRfmBxhSaqWk90J4FslfF9VSzoYsxDPn6BBnd3IJEG1Bpy66xYyxBXH?=
 =?us-ascii?Q?KzSsg1SXBfks1/RhvMrqoXSvhZvZgFVirdbcqm78yJ4H8+G+5dKN3JsHAoIA?=
 =?us-ascii?Q?+oxODluEOwK3udUVo2mtmZZpLUEV8yOnu9ZW4S7MeAF2a+DYzQv/gb7YRuVY?=
 =?us-ascii?Q?fBMivboXq4YtQrA+SkuypDyTJJkgDwlzjcyMKNiN8WzFARwy6J2fKZk9QWIP?=
 =?us-ascii?Q?Ubwdm9SIz3GPIXsGY2feCBV9qwCMpqus1A9v+kGQztTdSDyBde8nz2WE0o80?=
 =?us-ascii?Q?dKwGs5dEOzBuUhtp6NXEslToH2Hq6qDyYB6dQ/rLB/l+an8WmEq0InWjte+G?=
 =?us-ascii?Q?m6wAk2NDCTkq3HXcXaU7/U9jxL3YiYuS7Y/AsL9nNwjPExddA3ANPE6VflZr?=
 =?us-ascii?Q?pWj+JjD86jtp/UvYxAcypkSSPpLYzOp0yHmvX6aKMQWLeu89VqS58gVy+vuh?=
 =?us-ascii?Q?9zbSDLZ3FklAAm0oUyTlMYqAEcJ6TIdvDq9rJWkl2NA/1PPDmLuNwukjNNtg?=
 =?us-ascii?Q?oBRbWKACHXNqle+sIFcQDbbTNFPck+66RxGwEQbDyiqAsny10hMEXu2JFVwz?=
 =?us-ascii?Q?rZaYH/gbaFnZtPI16EIhg20CjU62E6Skcmu/Ta4csYRG/VhJhWscQ2kDJMTq?=
 =?us-ascii?Q?0IeWPe4vXAuEEnkPYwfUztq2Vd0jA5Fw0hPetVKd6Pfkcdqf2lbrDVnwTT6R?=
 =?us-ascii?Q?1ZNVJTOhh1NBS0nCAlvukYZmGQDjgpmfPmjFHbM9VfphITuCoNaha8RGrP2b?=
 =?us-ascii?Q?Yw4X4HpxnYz2hJ8lr8lP/rsimBsIRCPXuWD8BKGSQ2xEyzFi8UCMArZqFW/I?=
 =?us-ascii?Q?DrVezhluvRTj9Y244ISzyICyk5D6UDLO06KeLsmYQSlLOjks5noBOTNuA1D/?=
 =?us-ascii?Q?HDlC+Zz6tNESCXXT2g3rpEk2ItIl9H09ExkL5ps+AcqRqT0keZikTvgNe15G?=
 =?us-ascii?Q?JyfnvA9QUcwlCzuataQAwj5WswsSnjt3DwfnH9BdZ/WUhs39KoA616L5Lznc?=
 =?us-ascii?Q?1XWL7klUSlZyRdNSnVAcpa798W/8TrTa7+/dn303haq7srogmw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?47V9SgaCSMUyD86IwFZeLFQ5i4Qbj0vHsdqsIFe16dibP9qHFF282uHuFWqX?=
 =?us-ascii?Q?c3CFMWhIq4VpEbahaI2AZq4Flu/EDdP1FkK+X3thXp3l227AdwTp1RiZYej0?=
 =?us-ascii?Q?qxlPUZIM9MMvh4jPpNXoE3hNFua7IqPJwmTyihBZdsIV9hAW1OUzuyEXawk8?=
 =?us-ascii?Q?pLCZqMgcIrnPq12fFu0tSVuCZpC4K3loUCE+bvJbLIXxob57jNbQ9TG5jRdQ?=
 =?us-ascii?Q?VDYtdenFqR+Xd2ADua2wlAQdf8Qt/d4O2fHyx2+mKoC0bRWqFQuhasNPAab/?=
 =?us-ascii?Q?5MXrthZum/Z1G4IbvhQQDPi8Ru9zDzmfjj9Az0Owv7DXmmkJ6uJKU/LEmdLd?=
 =?us-ascii?Q?XH0RasYNPZ8TYRQFnzghvZYH/otJzrV5sgxElIgUu9qg18HHYXPNpXVc2bVF?=
 =?us-ascii?Q?wKPWm3qptwbBX7xoMBjlHONh3xSdGT6CLWC+mvHyHyFBTkbMmHEyWo2EZvIQ?=
 =?us-ascii?Q?ZHZaYu2LhgjSBL2je6JGxu2GN+72qGOZ/3AN5EWCaZQjz+v89YZszg88ozkJ?=
 =?us-ascii?Q?rUtCgQEd1T5uPBZuXimJ0NXdqAiY3w5E9gZL8pivk9Dd9altDtcpfAEUss04?=
 =?us-ascii?Q?XNXu8ML9MKHFULNPhnxrtCLIOFln3jiFkYP6Ldp++OtE8PUi9g0tbBKHEMFb?=
 =?us-ascii?Q?zOOK86Zn834DDDS7GzDmSsKEP+HtGO9ttFanBpg55Dmf68wSMy5KMh1EMH2M?=
 =?us-ascii?Q?eSF1jdDqk2dbbNjw62zG1UYDylEOea/YaGET+E4g6/bwZ54YV/+4sgi/baDV?=
 =?us-ascii?Q?r0adntk3SrHaX2XiRiLt+oOV+jr9hl+YkgtVZBlLB/7vzz8AXLRu9fkjdgDp?=
 =?us-ascii?Q?JayELD0Oq/o5T9wCpUq3hPm4AHcNDtQjy04YR4WzmCHGyYkCbddQjeceCDM8?=
 =?us-ascii?Q?TszB6PR4PrvXkJLzE0NeEpKfEx4nfaxRwQ8P8y4QA8nM6ZWhCZLyCQ5sZgpg?=
 =?us-ascii?Q?gg32NWtEnfIIPTXD/VGiBpCLbEb7DxHyfNK21gdwh3F9S3ge9diylMqtBgo3?=
 =?us-ascii?Q?q3IxvVp3m/TGWFZWDKJ6BY7TWYyI/kH/WNoO8xZvM2lR7YEQWBMA0+w1jddS?=
 =?us-ascii?Q?6Icx6zuziX+KOMyPHWILdnk8g5MtgCqJDdVr7Jcge/tKz72olvwCfAra9zlK?=
 =?us-ascii?Q?2onmVymqv4Vte9ZoclxY1Z2rbwV15d8UndyBb7ElItVWfm0JOSIIdeoRKfcu?=
 =?us-ascii?Q?1Pz0XtG2Q9z5L+oU2WLExUXTOtP6t0zHVWm5UqTX9UY7eoHC0GFbtlJLAlaZ?=
 =?us-ascii?Q?okcrjgYxGZNaj41hihD0GytoF6/GZNRvfORWikTfkjb4yOZE2LxaEs5IR2Qy?=
 =?us-ascii?Q?N7zNS04gvl4U5xjesBb6uVhKUTBv4C9owHTCd68YV8fG75r4cGlH18uyNbOj?=
 =?us-ascii?Q?n/9N+zNvySAXOMPC+Ucq3mQ3BhybDT4RiruDhmWYr0P2u3oR2AJLlulRwdKw?=
 =?us-ascii?Q?zHFdeThw8iu2NibBbNoHQOIXbOywdQRw6l547CDkR/W+d3jyt/+Gi9WtmRk+?=
 =?us-ascii?Q?Tgxi7q/MVrajQHCePhkZfYNTfPhuau/C6rhy6J2o5iCUxDGNCK63L4uqRODp?=
 =?us-ascii?Q?qcHiEIR6qvGROf6yrzLLtHEi4mt7f5ZsbSIb1vQDrNq5GVZhwERcT5tlCY4I?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c375a7-3594-4a25-cdf1-08dcce8707cb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:17:32.7727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB+2/3lqQW7+C8NWqnCGFk4q0AmcbvbYhtFk1X3Dn12qwsBKv9eJvjVzixf/NgEjiGMvmHan8XVyg8u/e2rQfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204274

The contents of the COPYING file included in the current source code
package match those of LGPL-2.0 license, which seems to have been the
case since 2011 commit
https://gitlab.gnome.org/GNOME/gcr/-/commit/c6691faa0348ab087e99ab9bd9914e1=
d5e81fa14

(From OE-Core rev: f3ae58b741e4e6e3a5196ff75fcc4da6ee89d0b9)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gcr/gcr_3.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/=
gcr_3.40.0.bb
index 8719884f25..7985339483 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -5,7 +5,7 @@ GNOME desktop."
 HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
=20
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc60=
5"
=20
 DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
--=20
2.39.2


