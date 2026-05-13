Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DBDCD4F35
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:45:28 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.138])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4635.1778669123031982932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kontron.de header.s=selector1 header.b=bhGMR4yn;
 spf=pass (domain: kontron.de, ip: 52.101.72.138, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPoo3gUAtz8rpvlaGJwZZ4YdsKRIbuZwQQ1/T+xjCR2f4UBLiuUqoPgESecJLiTxe2umd3oWP5u1c94vZ3DTE8JlebmO5WFTA9G2gCHjWrnhAy/YopeJkCxDBwcrhdo4ng6AoEGl9p6IVVmTRicX1o3MaSBriAcZlR/NVTdBaMYfIFmIgVQmkIjCACozSBdcQJ6M0bqzCy5gKYUbcedvgdkMxtbz6uP+YYs8vKp3uf1t3ECYRDNfIF0Yz9Ni1POjidtr/nquyDCqbtsa5EO3ctEGxr6HE3nhUiU4FNWLiLzAk+T2hw1g4GDtgK18DXN2dPOviiROoFJDDP6p8uw8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0pOg8uKmnuv4sgIKk785ci2arC66gyM3+D3alZl1io=;
 b=nBg+Q+WQWNXrhLQuF31N9TizFH9zk6HI/RI3r75twyjIgxA5H9YTLvl7/u4Xx4+IO3u1YAODwIl6fB0nAHwM87RGV25R5MZzEIgf49TOMIpJ9aFhPdoyT9MaewKQmKQ5k+gYRZ530eeIMd0eoH6sl8SmBpF7zGp54a3oAM1ynDKMIqazhmp4ZclZcnNewDK4+tLcQWDmVRonBu3pssjM6M0OTa358kFEUCC9O1eq/0zMR2b2YoY/l2XlHFDG2cmXzsfnSOiValvsyvWzPDExJEuyzYMTABMAPdGgvmPmXXAtAOZRp9mRIzi0kVxyx+ieGUiTHGUOEPo8C341e05u2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0pOg8uKmnuv4sgIKk785ci2arC66gyM3+D3alZl1io=;
 b=bhGMR4ynlmg22/nZ9QmkcfpSG66gXhYwkhXmZ/lYXqSWsIb1OLOB/zhRTt75Q74Pg5NyxwW/7sZNOTLSN4VDhKET8XcZGtv8TTAqkrczh6zMdbPnxw2MISh1+f/CqH+i0lbG3b5jO/CD/vFa8uYumfW4OyDrdaz4MKT2BnIW/Eu7wX1IF1TbEFnPTEIeRPB41FeGudzT0aahpXGueVyH0jm0Xe1v9CIvfJqmg0ClZGuY/9tnoDLn8sjAl/sSctN/7mgbYzV3kNrmXBmk5LxqIDIr4KZJWNx59sJvCDBCr2jozQ+CKSAstTmQg+EGX+PHJMGhaoE+y8jFGATl3l9PKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DB9PR10MB5379.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:334::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:45:18 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 10:45:18 +0000
Message-ID: <b95117fa-9ea2-4f89-ad22-432931887f8e@kontron.de>
Date: Wed, 13 May 2026 12:45:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] devtool: prevent 'devtool modify -n' from
 corrupting kernel Git repos
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Yoann Congal <yoann.congal@smile.fr>
CC: yocto@pengutronix.de, ejo@pengutronix.de,
 openembedded-core@lists.openembedded.org
References: <20260323232008.3456362-1-ejo@pengutronix.de>
 <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
Content-Language: en-US, de-DE
In-Reply-To: <afdbd1da-826b-48fe-b24c-324e32b14670@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DB9PR10MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: a3df636f-7514-4c6e-6fbc-08deb0dcb954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	doyDq3XIwkjGiwFbDBTWicL1GqCs+KX5XsQL90XT0rjXDdnK5EgO5EsEijIoKyN9RK2DW8d+iVLn/dzX6p1cPqj0gITugSrNn24FfYJa8TzBQ/cWDrY+A6i+youA7ogboHtDZSCmsHCU2ikw5R1pJ6xfT3/DeYA+uI2rg52atDPDa+Gg5D7wsn5jwj4QD7QWU/Q6ADexY15Ag7/ofDMw8UbF7Y+kQxYTqADtSkiUFq2Q2vUo3UfNNWIgVTsL5psAzUOk9rAJov+BJlgQA1vQewlnC+6BrIrODdmpQaa0V4OpsaD2fJwBHcsEvCyh69FhiDFyR9mcQhgv5MlNDaQGFKyuu1vwm/owrRMwR74ZDUbUUXMyG2MRz7cD67dpXKb1C5iODboAQZVFR8tUuMghD+CkZ0kITfWTQhX5jou+wQFPOYzwtHBM01O7L3iukpLOmsW9Po8gNtQ5Ew2QHGdpNAuE8YvnkDtI3aSi7rTjhFQbBZRPHV8XEQvReGCfWIloq4YgVr5302PFfEnqxdxZBOJFhYOQnirTfPX4/7hNTT6sJ/fP0/Y8L9em6XI2DEiH9joVwRyDiVxGWORHamgcvcXdUTmovp1S4RmcnmMfHRqiq57s/XhicIMnjcCzef2wtxe2HOtkrP0XpEvbhSKaC8b7Jta6UdfL1Dl+mesi54DywEJPCP44cGUcfR5kk27B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jh4iMIdFqWUGn6hwWNHb6c9X3UHoYdWs+dQuCMy2ArBf02e/chGH1Bfm+831?=
 =?us-ascii?Q?/L6eFcEUTC02A/eEQebCw/56QqUNn4FoYu2YiEJXVytvniGOeHNeL5E7+621?=
 =?us-ascii?Q?qPM1Df60/uP7YYndgfq7kdiWT7satXUf+Gy/AD0OIe7v/mda8IzFV8dfDrVF?=
 =?us-ascii?Q?u+vbZoPWRq3TrHPV0cL34yexGf8DhrDI/7QiRdNGPHpRR8cW82fKA34WMvTb?=
 =?us-ascii?Q?EY0rNeBmAyki93HtMfKLbwggbVr8377SGTG4lKnOJOsUBhaxPKZUke1BM1aB?=
 =?us-ascii?Q?NOvqBHcxha5HNgCpdCBhZcO7mUIm/T0UoUVM5icz4u8XV+AshAG0S33e3P22?=
 =?us-ascii?Q?I3kgbDeiiNICmdJi7gSayVypQnOhqKcvxgpX4HftiEjynb3Nh0F5azRrIYpG?=
 =?us-ascii?Q?QGJ9c9ilqUtdcSRF+CxDCW0mVCz62VeF5evK3cf5YLR0i5pu5Ne6ZmQjBcyF?=
 =?us-ascii?Q?UNoAw5OuNHjSWXSOj6UmsbwY/ngY7HUjKzudRHajUIS7n6uAoxOQ1hw/2kkW?=
 =?us-ascii?Q?YI39cJAzOMI+/Jyr55ezraRuM9+iaelLDyH9+2tnQ5ILjZTMdoMyLmElP68O?=
 =?us-ascii?Q?26lvkoMz5ff0jgg2ylisjjbkwKeY25FL/OSbIX+Z6xE0NKwAAu1m+layUOhD?=
 =?us-ascii?Q?41bPxRFt1sRmjYx+/ciWu7ZDwuT8fFc70iRxkVpJtKVz1rREhHYDVaLJ+/nw?=
 =?us-ascii?Q?xpzxyGYtleOekt4IkXKkaD6bv8qrYF7WmHy6IcSSAAU7U9dy/q6MoLNgMq0U?=
 =?us-ascii?Q?fbCU0nZnbecOMLwlS4ZX3FXzpmM0BTI3MtHB79XWN7Di4l7noOn4kd8TZNyB?=
 =?us-ascii?Q?GSrsDIbgGKjWiN/xaJ+QyJcvCi+74eeF6bZReApxH+z2KWNwyjOdbw9M8nik?=
 =?us-ascii?Q?+18vTbQM7kTPPKzOnWfxXWzmkJKFP0A/ys3b8s5lVxk6kZz6TYUez+amncSE?=
 =?us-ascii?Q?7mGFx/8JjPY6TXi6H1BRnG5lz4iZDym8BK6ldrQ0lw7Y6YakIzmNPGl3BxUK?=
 =?us-ascii?Q?VLILiy01R3NziWtHN3bebW3UbtRavIYFwHjqHeWo+aYIt0zg06dEcvZnf/f2?=
 =?us-ascii?Q?KM9+MZHKrE8rr2S2di1qUhbAYvk5eTbqAJM+wMgPEfIJf8aWgcxyM1xu0BxF?=
 =?us-ascii?Q?0QhysCOFY5aAMGGumjBd5nDENLBK/MlXuxCoq+ODppfI9am2+rFO/yy3tFPY?=
 =?us-ascii?Q?8auaUQ1VO8c1N5FCKWZM19pzJS4H7lsb72/3Subycc1UtgV8vZYEbwHVzMwf?=
 =?us-ascii?Q?kxpNEcRxdnGaD2M19jm4WHerPbn/E/kC+EmrLkjiuH0g4YxXi5MLAYlFW5gJ?=
 =?us-ascii?Q?ToQhnVjmIbMtNByeb/uupHQSVfR5xLMxKSckbQDqPFgSjd1Br3sBJq8O3fnK?=
 =?us-ascii?Q?4RXBM/I751WGOuQJrh/kEpPXSQZ/ap5vUgYPEjdUQKy9iVH/vrChkG5VxJ/8?=
 =?us-ascii?Q?R4R0GWNvnoeMz/rtUyMiea/AVCOHwYJD5sA/eH5XlE69WO/NKU4wc2f4cOhp?=
 =?us-ascii?Q?LxFmd1mnHa1Rw1N4TvbGtFQ0wZ7GC7MPAZBK+bTEXL0Qm5THg5eR3RAHubX5?=
 =?us-ascii?Q?pie4RGGqJuR7jeHT82Sy8uUZiE0uW+r6A4OFT24Rrork82iGupDT7guWQUtP?=
 =?us-ascii?Q?t+cCAEjkVI8kBJDiKWCfZOsqB/sH1/T5CfQ31V9Ok7WQnlh9KntYCC6jRcEL?=
 =?us-ascii?Q?H3gAuHwmYHHr0o6DxxUSfcMWbdRtBqo3nCYGfWgmhT19PMJqJ8I5i7JZAACT?=
 =?us-ascii?Q?Q28vMHFXFmLk721Oa+UEd983P9OYDpc=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a3df636f-7514-4c6e-6fbc-08deb0dcb954
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:45:18.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vELlMvrBHN+seDwoxhnuOw+jSePDUbRNb2lcC2dRYLUfV9SAmJQ7zqSGNSUBJAQQjlp+mZtNNXtExZV9xbcPttS/xgQ1ba1GTh4RSpJjR/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 10:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236961

On 13.05.26 12:41, Frieder Schrempf wrote:
> Hi Yoann,
>=20
> On 24.03.26 00:19, Enrico J=C3=B6rns via lists.openembedded.org wrote:
>> Running 'devtool modify -n' on a kernel recipe that inherits
>> 'kernel-yocto' can unintentionally corrupt an existing Git repo or
>> worktree.
>>
>> The work-shared optimization introduced in 3c3a9bae ("devtool/standard.p=
y:
>> Update devtool modify to copy source from work-shared if its already
>> downloaded") is not skipped when '--no-extract' ('args.no_extract') is s=
et.
>>
>> As a result, for kernel builds where STAGING_KERNEL_DIR was already
>> populated when running 'devtool modify -n', the existing source tree is
>> overwritten (via oe.path.copyhardlinktree()) with the contents of
>> STAGING_KERNEL_DIR.
>>
>> Fix by adding 'and not args.no_extract' to the kernel-yocto guard
>> condition.
>>
>> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
>=20
> Can you please pick this devtool fix from the following upstream commit
> to stable branches scarthgap and kirkstone?

Sorry, kirkstone is EOL of course. So only scarthgap.
> d383ea37e4 ("devtool: prevent 'devtool modify -n' from corrupting kernel
> Git repos")
>=20
> Thanks and best regards!
> Frieder


