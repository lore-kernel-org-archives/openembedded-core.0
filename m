Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7C3C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:58:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.49])
 by mx.groups.io with SMTP id smtpd.web10.37139.1699883879028211034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 05:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=B6aS4Nr0;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.49, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuXhlo0Jc7odyV8jnS7wg2J0Tvq1A9lVdnXO3PWELKa6Fq3XHejM/doGyh2jWvTOAZorHHe0ZqLkV2dw5MAnFlmGCklDYKp0co2O/ZcmiVJG/2D+GYeX0H1ShTm17ua9bH1zEelqWXiK8PGaemLbPPjYMMFFwQgRU7A3jmpYJ6J+PyC+WOrWywbaFDuPYd8TV6lywVBFtziNIsPrYpyz7u6MgyNhexOfJUnWYQOl9z6C4u41iRTCGB/UO7GovaYFA9ltxqnKIVTfEfCmlHgDY8Z5NGMOlSKa6QdPVMhbIyA7q+Ohd+yEOhXlKmseLBHkq4NhhdveFdPhQQARYcAyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTDX7NBw+cPsLkC6VnGcFnm7V5GFi4Ze3ABy2k5uEMg=;
 b=M9INe23B2ZECWxuBlzZ5dgFTgZiYGvVHCW083s/qaQ4UEvbVUZBFFxO+dCHEpa5AUjjASB+cgDzu/GtRqbxj4XpxQFLw4ARgNOzXX6U3VgwS7EDLI17y81RYI8O23K8MvTGxB/Kcv4dQxxlAXRLqAvsmDnNxtIsbGZ7lSmDCCM1vEeNMzMN67C4cN8e9KduqoaeM1i2nriPf9W6O9bfGOC6plxYWPxdVpGYgBKeUsOEwXg2s48DYpvdFN6mTE2+XUc4tt0ypXN0DbVAG1TYx6/IEgrh1gSGaL3OX3OktJyOm3R0mCe6zdwLdLCuoT/zvD95TRasHiA562kVX7YWMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTDX7NBw+cPsLkC6VnGcFnm7V5GFi4Ze3ABy2k5uEMg=;
 b=B6aS4Nr0u80TA5LFZPZjU1ejMUgSvfTrNC9oBgg59tYLtpuDUPt6JHlH/s5uptzgnLNS9kgWyMEJbV+RQNlSg7riEsgJTRHvJM0YAE1r8XhLq5SDtI4RAEUgrUnTLOBt9lfKqcIKUhIMoINVumo1kM2ytPyNnsmg/PnfEUh06h0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DU2PR08MB10040.eurprd08.prod.outlook.com (2603:10a6:10:49f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 13:57:54 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 13:57:54 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH 0/2] patch: reduce changes during patch refresh
Date: Mon, 13 Nov 2023 14:57:44 +0100
Message-ID: <20231113135746.1047416-1-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DU2PR08MB10040:EE_
X-MS-Office365-Filtering-Correlation-Id: b7faf141-1187-45c1-48ca-08dbe45088c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uy0H+hiV9dWZ3tfgPIIZyxe5+hcVm2fWQbGFLgOyZRcUAsRR/1K/LImIUEY+Ma4i/Cuyi2To3UD6g+YVCeSEg2fZkVNp6EReR/+cFSacV3b2vDmj3m/axwpwiOP8eQ/leQ+W8IfGKH3GPPR9qArWwOcWKZfRnwp42MVRUmEojA//53NhN4GHbMBjYln6imrCOR6PgOevtv3EWMTtp37uNzguJEJt5Uv524LARsB5osQhCVyyQaGlj61fj4qcW6Nz2AG39AP7aw4SH/R1ko2Wkjs4KHQlJfgqpIUiY8rfb3T+WcPKrj/Ouy/pyW2G5ELwTNXby224as+km+RZ9O5JJ6XpTh4AYQa4wHffmc+x8+U5nC4UMlmHF/rzR3iOdnmX2qH9eJe912UMaDYuIZyWxQJ+9hfU+A9qqp/Wd5RjUGd3/uN//zLItu2/+HPVP2FlMZxuGXc5Bko8AoqrdIp7OyLwM+WZMF2f4WGz6N6rohGbTqq93EUhuJZlICBucOYIFS12G7o4kdiUmo4+wNYfZKv49/T1zlpBdMYY6ovODCElAYRoGPwCyoc9kyAa+wiXAvnFgMY1XcltDpMolcglaZAfZxtbHV7d4h0S5bViFXecNaVDJkq6S+bzzhsOLnAN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(316002)(26005)(107886003)(1076003)(6506007)(52116002)(6666004)(2616005)(6512007)(9686003)(83380400001)(4326008)(8936002)(8676002)(5660300002)(4744005)(2906002)(41300700001)(6486002)(478600001)(6916009)(66476007)(54906003)(66946007)(66556008)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ymjpe8GPyyvqfxCESmE5imvxAU4uPkH8B+N3j8klsElLZeJoRgU8E/xtdjxG?=
 =?us-ascii?Q?tY/LDYxd0xHGAYPPFm2i6MQfgypPP0Zmow4slpDeF7dJ/69A0mreBmRiphOI?=
 =?us-ascii?Q?8OHFuY3rrG2VjaKFjbRrb4xh0QnYIbY6HXgdHYmUMY06cFyZJtbPLRfGMcV4?=
 =?us-ascii?Q?MaxDQqxTMjZy14LISe/YeL3OS2CAjdmlPeMOImfls733l570crZmAiJUAfLv?=
 =?us-ascii?Q?d7OjOoWUJWcHHdj64Dmujpe45LL+DjGYCPyHAb2Z9OaPen8Nq3KKDeejEycp?=
 =?us-ascii?Q?aman2DWxBT/BvM5AkRD3F+q3oJ6kEkR+VA12SeBMJrZuokLVg1XAv9bgz5Kk?=
 =?us-ascii?Q?Z0iQAyvT9EwmECBvWLwCtQiLNqHqsTGkckMIaA5jyVicaB9DNnS615JRcv6U?=
 =?us-ascii?Q?VZTBzhITcxQigLXr2CMvl+eHAjgpOdrQFs22osvCrJHbs0Y1k5Y6wN+Dcz6u?=
 =?us-ascii?Q?HS58yDC6WU7qAIPKIl5oOHzFbzByv1rC7FrBCB5+1UEjvk579Wo0wfCoGfrq?=
 =?us-ascii?Q?Ss02z32VOMyd5KPhzXAIEH+4GIzQDY2B4tCOyY76KYey8DS9xWR653+WwpNm?=
 =?us-ascii?Q?51tbeUR8dgbT/hJtdNFMb4czn02U1jrRbLb0f9gmi7SUQ2V3/jkNQyh/B439?=
 =?us-ascii?Q?cRzzbkXwetAMhI/97yq0jryauMEagcmHTEbm8rHuAVi9GwUEjT2jUHYVfpTw?=
 =?us-ascii?Q?7PEAQQBCfG2jOlr8LF/b/9jCdLzLslF+g+ZGDCS1z8/aVpTwrF0BS849EZbX?=
 =?us-ascii?Q?XmF1SFc6udJnm4uQvaMQ2sw946qjPzMO6KinhfCfoXSxZcaEoVsgBOfXJT9f?=
 =?us-ascii?Q?py+u0P4FQrn0r6zMYDjkFyovmwWwoKL1gTv91jOP1Vn2F8MKrMK5eb4eF55g?=
 =?us-ascii?Q?ByjlPNWQzM0OnEeVPbSIfWBc4n0HQnIMVG01GfIQDWQIijzLLTJxHI6xaOQe?=
 =?us-ascii?Q?QIho+fcviztx1utXoAnL+6RsC1NOevso4ZZb9Hq9XetXQFo6VRDugMgNtk6H?=
 =?us-ascii?Q?T4SEyfi3FJKpLNxz/inPM+2EcgVBmmz3wbojxtcnlpFCbHBTXMp/b+lbRtR6?=
 =?us-ascii?Q?hnLKsKkHCWuEMUcnSxbWS4/PsCBZfPGHwCnCsb9mHjkNFa3l3Y67RFs8A/5e?=
 =?us-ascii?Q?zlZmTIZNZlwiK9nF1brobpuKt0hgiWZdYVq5Ng54IzM1CuiN8Ku7HXuUP44O?=
 =?us-ascii?Q?dOK+wJnRYhbY1ps90hKslHeUDyH07WxgnTZ9zasewTdbP+A9sZPHwvCN4edG?=
 =?us-ascii?Q?9FKDEabZhURYqrb8QUM88GBuS77AcKc3cD+ME5xNAGxZXTJzxWWayauUiny1?=
 =?us-ascii?Q?3Vk4Ihx2yDIGf3G3ecwH9X6FEqTplDwoI1Jkb9iukG8JDd/RSLW9AKyFzb02?=
 =?us-ascii?Q?EAXWEVzgqvquOYtRHycbpxh/Hlkjuh0GonswC6Ub8VQtVyIhaqHbD3AQD1i2?=
 =?us-ascii?Q?pdn2A9T1ZFk9/byu35QKb+FwOTSLduY11C1WVLmuQz/PzdOvFPXhoxr5WF1D?=
 =?us-ascii?Q?LsYsvjxV9SG4sCXPsfFXjjC4NFLwX0PCp6MmzbZaNYuEzAb2QpEQoKPRNmzu?=
 =?us-ascii?Q?5p/MQJnIJs47ZkOtfFiaR7BwfljyDwv73+OIYSQOcFNNpeVg9F/3rfuGDKe6?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7faf141-1187-45c1-48ca-08dbe45088c6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:57:54.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nFE0gIHY3rg7Q69GnLjpMTaaP1D4KIVrg9jYhoCNIYTeq3L0kTcVjjT0NPl42XMXnYXy2UyIxz7Umn8AxYYMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 13:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190470

From: Lukas Funke <lukas.funke@weidmueller.com>

The patch series aims to reduce the noise in patches created by devtools. S=
ome
diffs are just introduced due to an update in the hash or in the diffstats.
These changes are not important to a reviewer.

Stefan Herbrechtsmeier (2):
  patch: extract patches without diffstats
  patch: extract patches with all-zero hash

 meta/lib/oe/patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
2.30.2


