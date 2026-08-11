Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48283C5AD7B
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:13:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48324.1786428820246534812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ojCYwEgr;
 spf=pass (domain: est.tech, ip: 40.107.159.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vb6hHIST9OIQn24T+dx+IQ2k+uIz3FWkFeaNfSAAdP3rKfadD0FJNU3N7UOP4teV1kpjx7zVL1SjZmMEZHMfWKfxKXdKUwF2EpPsPYA+KaTIEDb+1Eg9JFx49r+hcawOr0jbEiMgJLIsLHNEbYGFjgVzl6o7ye4azm2UGiBYEUjjtKhTI1ARjwmbs5S1t3Pczi1Pbvcb9UEjLKenhN/8fiKHgsZsmob83vRN94UGKX3lQgO8o6KCykkWxwexwabqKrBpq+7MOV+Susg3fRgTvaQ39/OPrxeYSBgEIxxTHEST7HP5WhIw6J94WlnM1OsU8UeN9v53MapGTvOjp9rDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG2p4rP1hzMAXnST5nnLUZAImJBxNlJdzVDEHDf+/kw=;
 b=O8UPdPlCkj/QSM7uon2w+6rwUeabFbhNKyWEcqY1+qqrCDQt1o1NOKRtvvegrd7STX2zQbiRTjpue+5R+VLWMMXa4nphY+jlZFkf/aErNTrfdWtSHNPlm7RBEj+jIlFG0E6Yr+/i5LSCvaJI5pnPREzjoARyECL71rXv4jRXZoi6D9XL0KU2zzuErkqF2Y0NvacK+sxnFZUpMHbCq58Artsz20oGlpZ3+PCmGmcnZD7+r6gaf12HaRbzm9AQGP0XN0GTHwFg98JVVWHCnXRK+OPCNVJE6dl2xV3qhs0g1b2mxvh98kMgHJDyLcuH4hOr5mKJxGOlFba52QYzIAvb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG2p4rP1hzMAXnST5nnLUZAImJBxNlJdzVDEHDf+/kw=;
 b=ojCYwEgrsxHBe7idUMmYiNGStR2UggHr5hmNStBhgdM6wpNiqzhCv2tR32PB60RsRGLiJrXg5TSo819YHulq7mPgd9qzT2OHjDVgC3EL7asYpjkNVOFaDeEQDGUKthagpYOnd1T52tzhWylOgpp2UnvG/TOwBy3j+QoR6gH0Mfy01uWtqy+z+9oDNSBBpwqEl/0SOJIHDjHgUG0EOQ0+Ku632pYJsXqfiKctYIOwLjI4pDK5JJH3imPxepPNU3yrazLgNIxS5glNAbZSnLYBsqalGyeLoXCA0SkAMoiD3JgBihO7Qaltm8OYrGZn01JN/tHfb3YNnrTCvRedBDUwFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS2P189MB2581.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:644::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 06:13:34 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 06:13:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH v2 0/2] swig: upgrade 4.4.1 -> 4.5.0
Date: Tue, 11 Aug 2026 08:12:49 +0200
Message-ID: <20260811061251.14757-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS2P189MB2581:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb42dcb-2c5b-4748-7051-08def76facd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	h+xUotunvdagW/QMOUJaqXS3ckqIA0FVhd4D+KfrTxNdspmTw74Ge1DtlCuWfhUO22ef5sNZXg8hE3+8nnPcBTjFxMtKGMEbgtu0lm99uimO4lN1Y690BcrkCGHaZLy1PiUV1VU6qUoODkg5EV4zPHCbZIgXowalgSfNyq2nImQBE1tZSe5CqE6cKCxbmQXS1i1maaJ5++yKO34FZdVWLm7/3yOMuJa+UC/5F3kfcFL+7WJ3aN/7PQS78DRTvgy5tV7iwod0Meu1HDG6yJPh2BHnPJuPdvVbSGhIq+bb5Jdo6SYsKJY6dZjvsFeAHUXMRv68ba3Y/I/WYfw6eUyvEQ5jAHvBkPIqDXKJxRXKxuS84FaAoUzQvN7IfLgFMvWJkbeEa/VtCyhzdRGgNQ4mj8lzC/WIGh3PrSRabiUW3b27u3IWjfL99sZ83rp+u+wx8jP69r/gGB8KV8y3zR1yqYa51F//UVY2nqm+2asj1LGOIC/66yNbQW/vFcIgD2lVXY0s/S1+JnDTwD5KtO7Maf5p70OLUuMl1chwpf2p9mJnPZqZTyVbWJ+M7XHNytcwbWyTnmqAcTrFwYUeH8hnkzG0necrEG3xR0HOYAJ2u+1yIYf81E7JxtlXgmyZbvr5ChKIInSBKX/ZN3PllzLnTpjRecLES2aJNEuVlJMSbVk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mfpn1D2R0bLlN8FN3qlcHWxEBZLhHm+3iRNpku+81jn8ELy/ktivkZ6ROFOs?=
 =?us-ascii?Q?2K0fm0Y8QiELdlNGR0q1rzy9fMHYmzHbxYMYtngj74W+GltqfLy/BAFzbA5w?=
 =?us-ascii?Q?PBxO/HRyWeLPmDLQOKgyNHAQQ6ZIMhq2hj1eBpFiq2O7VB//1mmScRuY81EE?=
 =?us-ascii?Q?Jx/JfMLDxuihe+0Y7a9PBB99yOvsJunodoqZLh3oVFp3bkY/yWGCQ7uvB9DR?=
 =?us-ascii?Q?F/VOAc7aUl5Jogy0MaUOsGlKjeP9csDlZPm2Jto5o2C6e/3wHixFAhVc7Rny?=
 =?us-ascii?Q?+bCgWhkZqYKRMbfnLVJlf4VqYbWYgpo9m+4vGzUHeO65gzMbcgu2GkLt3AFr?=
 =?us-ascii?Q?tYGabU/8pIxyzi0eha2KVm3n6PgMJwC6xzBoI5HngL8ugSeedsD4qpjkYcYb?=
 =?us-ascii?Q?IuJoW8tFhcqewwHsrrGw6n5vKX9qi7ILRulDytIoNNU4EQphRI90+SRuZoBF?=
 =?us-ascii?Q?NK1Y2zUC/NFGEYOK5SwxwDf9d8pRg7+i/tfyZeOB3/HNeQvkYQ2nFZMIgViA?=
 =?us-ascii?Q?GwYVp3kVBE18hYqvWdGDWNU2pFuK/iv1ZU2ytp8e8VAzHxeB0O/bwj5ZXE9y?=
 =?us-ascii?Q?6o1OUMZagkVxY/Qfm/efR5I1rp+hd4S/CXuo1XhtEVYXy8SWL7Sap11+rg87?=
 =?us-ascii?Q?LEtDavdE9pB2uTWREtSHhDw4TdBwuR57P4fbsmmr7JRRo+3pNaXYKNHXDKKP?=
 =?us-ascii?Q?wmcWqVBNEKwO8U9e5GH5fkZpDlqNWgVN0iEe6WmF1mqIcCajpwUQP49G2DYz?=
 =?us-ascii?Q?yEf9Fnec5IzRz05viJz2F7q3+hiPdYYKtip9IZd2DK3gLLmFfI0ZrrNbeQ2d?=
 =?us-ascii?Q?rRDFYtjbX0i1jN0mdRKW4DvNZ/yJ/ZUpEFom67zKfb4YFkmGNDiwiBTEX3au?=
 =?us-ascii?Q?mcXNb85q2Nwd79gJEZAu6aB7jJeBjQf+UY+DKG+obtMDlGz3P+8126X2eymf?=
 =?us-ascii?Q?cT9E4/0VqlJUfRzcbrWAqRF46cO12FgxdCAvLMH510CeNb8AwKMNja50/5Sf?=
 =?us-ascii?Q?yCFVCEKGks5wlk/u8XpdQ0AyAWsO3hjSyYo+bnPY6AybZzjAOg4Ea7bOVeIA?=
 =?us-ascii?Q?H2orG+npXfF1WlN8yKG3l37llaBK+hs8wEszzzs7iCQNGdYdkaMlZ+b08S3Y?=
 =?us-ascii?Q?avq4whTwN3p4BaBri79q/dc0fTKRRLo6juSdtcWQ3U9ZlN1Q2XJsgSsvFhd8?=
 =?us-ascii?Q?Mq1u1pDwk8k3+NSS+7+1eoB48c7YlUKkvR71Xs+mMoc/H8p+/3XmsiVagWt4?=
 =?us-ascii?Q?HwtLKpkkLE1JQCxuZK7r9VWsYUcQmhgb0h1EwxF6C5LWE/BTVZNYrbV9bnxK?=
 =?us-ascii?Q?w08YldyyVDuoIlVD89JUeA4vlhfE3rK3SamS+IL5YGCB2boUln874Spm9ZaN?=
 =?us-ascii?Q?aupmQFJb8bvmAUImstTFrZoXId3pkdRgtiD8eTMX5k1mw9ht7NwaVdHVWaFO?=
 =?us-ascii?Q?DjDqBrhU7bly/ENgdXpDTFPo9KBPa4uiYqafcc9OGj5gSFXME4rkpel+Ra+v?=
 =?us-ascii?Q?SFYDCC8A8hVkeE/tlMqUM3QTqaj2WYJaeSkSjMBxLICIDXy45yfy1efPQDmq?=
 =?us-ascii?Q?orfV7riakAN8WB3fCJX2OnhUgeE7Wv5xN4+DrClbSswbzVF0rSwa4KhJif5z?=
 =?us-ascii?Q?PFVWSBxqB25Ijh7bZySKd+3D+1+kY2dS67Lj3n2pxR0NoQsUDBLxrnHB1K6n?=
 =?us-ascii?Q?8S5CPl+PwrbXH2tU9IomOIlQ3wY9Gtlr8A7Jb+W310N+nTWLJvMoUULW/yH5?=
 =?us-ascii?Q?q/1zQnAA93F0FEjWu6lhU0D/xez5b1pU1mfxu/OGhelk5+/bBMTh4YFr7CiM?=
X-MS-Exchange-AntiSpam-MessageData-1: ZLBKimfywv0uExo/2RLOJsP3cnHqw+8ONuY=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb42dcb-2c5b-4748-7051-08def76facd7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:13:34.7551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV+ih0wGoaLmU+dJVp4Ail9WMBL5EEBO6ZJ2GyX2qlXOyQqVK7PCUeCjMXs6GjQ1X7cJps1wHA8bTY7tTXQdSc03uEIf488lHSuU+3IV0y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 06:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243150

Upgrade swig to 4.5.0 and fix babeltrace2 build breakage caused by
removal of Python 2 compatibility macros in the new swig version.

Changes in v2:
- Added babeltrace2 patch to fix SWIG 4.5.0 compatibility

Jaipaul Cheernam (2):
  swig: upgrade 4.4.1 -> 4.5.0
  babeltrace2: fix build with swig 4.5.0

 .../swig/swig/determinism.patch               | 20 +++---
 .../swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb}     |  4 +-
 ...Python-2-C-API-macros-for-SWIG-4.5.0.patch | 70 +++++++++++++++++++
 .../recipes-kernel/lttng/babeltrace2_2.1.2.bb |  1 +
 4 files changed, 83 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.4.1.bb =3D> swig_4.5.0.bb} (92%)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-bt2-replace-=
removed-Python-2-C-API-macros-for-SWIG-4.5.0.patch


