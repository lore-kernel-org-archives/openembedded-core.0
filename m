Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3864BCE7AF1
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.119])
 by mx.groups.io with SMTP id smtpd.web11.30525.1725613362147603825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=fgGM3KQy;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.119, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKBW9ZarLsRUTTHia/8T3d7QaFgsAkwOT/40QygYvSxA7dmDSTpMSSatC8uiSFBxovUG5pFJ7TFpeKNp+ZrvIxfeDNEy5gQZL7hjmDOcqhYGZVD6UnEu0+ExZgINfMgrOndLifJXXOcY9XonlGQBPCPH8VziKaHG3CokdrzSi3LttQikhdN61thfRIRyKrTrISGTKkYtL4a5wlHaiExKFKDwFY8FuWtwAbkv0f+f0m55hF8YJNFy5eURZSaajmqplkfd2T5iL/OKbYisWZULHZ38MFk+z4gHZ7N3JmcWC8/T0GMzkUott2SrA6iMFcFOd4a8VuRyeWjU5i+zln90+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyWRemZSl23E9twrNpfVNAGltoGVjhGsmI+9FgBKKkw=;
 b=k6aaN5dEB93rmz3IQ8V1CD4r4/h7SbpV6jCSNy2jI1Ha9e3wk+KC4b/CqTFopWCYOf+3q37hd0Q9lGP3P1pHYl+mzdhNcL/vq6KD1L01UhIePb/IZVEtWc7g0kNjimlhnvj93TeWlj/T4Bpwpe1pOqi0DyBSQDNlB8V2ZewvW85uysLvnibo/LTWFS9ZESrE4l3GR6i2rtmVM5nOWi/YgUR9hVXPugs7wnAY1eC63cC+Tc0oY9BknkM/lfWlIIzW9vtnfJDTNgVzGpzpI4Yw5SST0qNRtUb5mbKX0eWdyM2R1vOrMcivT+35e3wQp+gtyQQRK2e78ZlcekKTKSDf3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyWRemZSl23E9twrNpfVNAGltoGVjhGsmI+9FgBKKkw=;
 b=fgGM3KQyp8OFPIkgWXmP3B+5xnN3Z6fNOyvLW/0y7Yhb0KuKp35+59MaMgc4MdQfmY5Ue0QWioB8fYGNwOq9O40bvPmwGbYHel0FdVkOeryBbWJnD+steFMCHYuy0LLCgP//R3RGnyBBcXYYTWMT6AwEqZptDJjwKYRx/1JYdsZCvlWXsBxPMSgWEV7CrjIXOXuMh6cDWvIwVEiZeeUMR+m4/qhc/sffIxmh7ocKikB+YLvUVbcpFGyrWZNl1q/hOgQ0UtMp8fIbkVm4lohlUEQWJzN/uV92zxCzg6qtmdgprZoeRakkYO0KnSzXL3RVJyzw/v7f4lWi+Kz9U+FBsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6780.eurprd06.prod.outlook.com (2603:10a6:102:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:02:38 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:38 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 5/7] tiff: Fix LICENSE
Date: Fri,  6 Sep 2024 09:01:49 +0000
Message-ID: <20240906090151.513160-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906090151.513160-1-niko.mauno@vaisala.com>
References: <20240906090151.513160-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac69138-acde-4999-7299-08dcce52a84a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CRQHIEDo4r8oOuweGw2jODsvyrRZNEREf8UWKffu23e9S5SqbfvM8RESft9q?=
 =?us-ascii?Q?/JaIEnshO46BLleHlT1QbghkSHoOZ6sCzzkeAxZ231sK/Ro9zn3rqPH8EETT?=
 =?us-ascii?Q?plZ6iWHDr0at4dTW6PmnJnZUsrcCBqeOE+D6XcgW11OVW4cbGZyutlTLKRQ+?=
 =?us-ascii?Q?bUAVHGYjxZinLpdR0u2YyM7dbj1AQYBEAy76Uk6cjHUv6FmqrPncgCCeZWQU?=
 =?us-ascii?Q?Hp2jUcdvE9HRVW34MEVoIIMumSYwB6Ar1mUiUFGvuKNI7mtbRok6Jq/QS3Wt?=
 =?us-ascii?Q?zeCAgkowWE+/G/5ADDc0jzQBM7JZDWaCLGSKLGiCjeX9bvKuYTxA3E/J38u3?=
 =?us-ascii?Q?PE+xwvbeK/jcFk//CXtTzJ1PMUFZZ+EfkM9PRcR2IZdUlyz0uU/3XcQrszUx?=
 =?us-ascii?Q?q+qnaZsZzgKw26TO61UYr7inqFpeRAEwvN6WgRsBOF2BHH4K0IYBznfuAzND?=
 =?us-ascii?Q?FydCLyOcTmEeAuecu10ENzoKy1E9mVfxnRv55OwhxD84zHoRAh/LcuuCeSET?=
 =?us-ascii?Q?x0UJblc9u9L9+Fvlb5hsxNyM07oLn0gnqMp8fGwEHHakplPgRq+SQhMD11NH?=
 =?us-ascii?Q?OeQ/kTXeUEWVPx1vRYMHHO1ElQcd7m9cGZudpOWGRhYIU+n/hDgImPxoT1Cm?=
 =?us-ascii?Q?pAbb6g3KQzwyd1EbrGYBHnpDUs0LfuVBkrGgCjwm1nZfRypX3ihiXeQsdgFR?=
 =?us-ascii?Q?Qz948MW8/DkPyCbrO3ltptYaNyyjKG2DI7rp0TovFXojGPVmzqDnFSoSi6c8?=
 =?us-ascii?Q?qABY0qzXbAxKmM2CVxPTtdnqdeNQRRDhqIbw0vMWzyYPUDqq27GFJ+loB4BG?=
 =?us-ascii?Q?fbfr4zVzKMow8rTu1Odl1LM8pZnI5I/FmOFluzz8foNKWJ5ad7hdWV6O1HQN?=
 =?us-ascii?Q?xXaPsl5f1YANP9fkyLRO49lZ7fjMQMlRg5be5HzClqrT+oMi+QOrOj7CH1RR?=
 =?us-ascii?Q?adDZaQHHRnOCfVhkmFaihHIOimLsznhTmzx1f7GGfv47jHX9PROf1X4/cLfQ?=
 =?us-ascii?Q?DPW0lNgs3K0YwtzOfq/sN1zeemp2yR6Hi0Vu9GRDv9FZ4VoAYq/RNmVRZNxM?=
 =?us-ascii?Q?2X7CyRLi4o12EPtp9sldIsnGMdr+E5hey17S71yCSYtYsg4yB+pSC2d8snr2?=
 =?us-ascii?Q?Ejc66EWktU/1hRMp/PLvw4jQ3ZoWSbEzhqot4H9ti51hBxPYp2T3J1CSQe/k?=
 =?us-ascii?Q?BIEP2WGjPz0NhfECL3t5EXoPBENr1IgAVIdTVefwal3WLQED/+jbtWyzxsHW?=
 =?us-ascii?Q?B4s1AxXcqicqN+wdhvH5P8y62+olcfSc/x4OxkjUvWVJSIu9LfPNMlzVlx1Y?=
 =?us-ascii?Q?YCFRLvzANew+fVHvsoJvcpYaFAGTjBkeB/geAdLn5giFn6pojNWIxGYpCTZ0?=
 =?us-ascii?Q?XDFd43k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1G0Jl+vgq5YG3CeZ+1p4iplyK32nYrqaojN5N2S3EaD2w5irOLRczuoQECdb?=
 =?us-ascii?Q?7PX2iddhh6iz6zqiGJY+JmvTdfHEZ6xLmh9IAlen3skAApJKJmAxhzpGiYHq?=
 =?us-ascii?Q?q8wvqIQprPeKSACl3w6GHbA+EJ3ttuJZvRpZPuCnzwnEmD8AIAcz1TngJivN?=
 =?us-ascii?Q?ccm9YeMYrkhyUdjutB86ngMuVCn0QoKq/isMUtdv1B62GzkPaU8p6oCDueuQ?=
 =?us-ascii?Q?VZ/4OhWMiD0TFeW2MCQfFCT5A3hDisIRFSjICqWUbM/pL+1F4I0Nq3I230MX?=
 =?us-ascii?Q?n3V+Mt/QORWHAO7tAoDxo5ZWY80uIyrLxPmixJ3ev3ODue5sA+L1f49613up?=
 =?us-ascii?Q?lB631/RFb+CN0jgQXOugjy2BKBvjH5Srw1B6BaOzW94L/eSvfOrSaSa0IIeq?=
 =?us-ascii?Q?PAOOZu/ZHLEwa23t0mxofgzaB01wrAxr2EXdfXiywPT43Z6yMJdv55BzuDJV?=
 =?us-ascii?Q?UTTraQYUzydIZQvDTwyWAMw1p1Dh+rUJmx5KPtBxxaa8NobS4wfPih2uILuP?=
 =?us-ascii?Q?mpxiHh+9EuMgjHH/rLB5cCAimoX62BMTKVuuZHFQjzCZQ4NpWEXTubS1wKtc?=
 =?us-ascii?Q?z39gnPQ83OmSAlHd+MWG+5x6oRMJhqNf58GHRJxzICVs5qxZ/O9GBLAL426m?=
 =?us-ascii?Q?Pyk91UtQ+hUd8J/5+XPfTEmthF7PfkPMJp8guiJdBE7zOJp5xpGRlC6RiGG0?=
 =?us-ascii?Q?qMCnTy5/D3jCKZ/9IaQ3ufoYantVDeQU1ttbUuhNqowwvjGWqihuQ2RoJNWU?=
 =?us-ascii?Q?prwlpwHs8S0ncoILzf8mljaOuNlOYZVm+ftgCBCjvZSea8AWwsvfQzKp+5R8?=
 =?us-ascii?Q?hzS9MINC/Z/PdZpESDH3USydD721Xx1Xx18BKnOcWbJaJiwdwBvqMDbS0tg4?=
 =?us-ascii?Q?CA9TRCHPirYAbJPI+m8oiIe1nAhELPCyLjymrbQwTTQ6rwPmh365c8en0EsW?=
 =?us-ascii?Q?Lo4BiebTAS/Ls/podVKuIMoHFk2i8AAKTfKLiuxxwpwQTuoqxAhiYmcVFqKV?=
 =?us-ascii?Q?PN/p+oXpDb3XcVCG59frrUchsb4uqdiXpC2C5WMNXkTWlyBP36IItvK2ky2z?=
 =?us-ascii?Q?kcfZCtY3oIPkZk2yiHGCfNfLQdAgIJEh+8Fr5FMH+HMSIV/g/zK/1do6ii7C?=
 =?us-ascii?Q?/Kx/3ArLsAx44C1JWG3mZ5LGj80j296X1Ku5CB8JtfxxpdvXd7qW2zqdB9yF?=
 =?us-ascii?Q?zWUqlYjkymeGt3e0ThO0vySUfXAuQdOCFeT1F9+1LJA+BcYl6IRrT92pvIF8?=
 =?us-ascii?Q?nyYwFfRHw/5yj0U6+NmJAWev6MmowXtHYlgpo704SZHc/mylGpQ2CNwezOYq?=
 =?us-ascii?Q?3EG2vPVNJNLv8eLCWRWeIvH41jXXBYVlb2HyCwHFCfFh9vR1V8k9PX4tAe8p?=
 =?us-ascii?Q?0kFogi0BqURlIIj9SuqCEtAuVkpKSPZXrv0yC/Id8HqG42GpVFX4CTySjo5/?=
 =?us-ascii?Q?ptj6GVUt056ntq1KjZ3UW6Z2FEBxNTp1NuClpSVF6sZs1AHc8EzaKFygGGfn?=
 =?us-ascii?Q?8ot5EUnB2I6AhrfuX/BmqYMf1cwJGs7YHwgUOJo5PyGaUGPQBslo9MdXMJnX?=
 =?us-ascii?Q?Qo+vozOskqspHC5Fyi/XjXoS9/FDEqwfAEhbk0yVgMnnIKup0dKuAJ1m8D+8?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac69138-acde-4999-7299-08dcce52a84a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:38.6780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb9zLo0BgRHTB464iXlrHdx2RTYwS4PJsEPGJKNXQP3QDGNkyAH70wGyG+vyzMlAPjtKjHFC70noL4HOuz41iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204257

The contents of the LICENSE.md file included in the current source
code package match those of libtiff license, which seems to have been
the case since 1999 commit
https://gitlab.com/libtiff/libtiff/-/commit/0ef31e1f62aa7a8b1c488a59c493077=
5ee0046e4
where it was added with filename COPYRIGHT and was then changed to
LICENSE.md in 2022 commit
https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5be=
e969d424b

(From OE-Core rev: 71d8e8b03349ab18dca558055c2b3a3687785ddf)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-m=
ultimedia/libtiff/tiff_4.6.0.bb
index 89681be634..6bf7010ba2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Library provides support for the Tag Image=
 File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE =3D "http://www.libtiff.org/"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "libtiff"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da3e32d664d6db1386b4689c81215=
31c3"
=20
 CVE_PRODUCT =3D "libtiff"
--=20
2.39.2


