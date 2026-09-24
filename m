Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C98EC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 13:00:55 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7282.1790254852522345923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 06:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=vwOLGjDg;
 spf=pass (domain: est.tech, ip: 52.101.83.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsC2X3iuKWu4tufrakbwgHAunnAWJE7RoF9SopMg61gO9JkFgEruRmZdjUvfL7dindM0cNY+498JwkQq91VSmz+TOg5Cc7H/OA3UHoM/sDS5di5/QlvWt/ks+lZJlMjwm+FtZWJ4S4fJqinkLd2brq8w1GivSgZjre9J7ImDqmVQCzuNh1t2PUSrhTqOS5zTXyoua0fSoE7y+muNBSrQnR8gWb2LMtGaz5jx7zVeqbVfzfpF2VyfxsbkRvfqYPwcxAOsdYRQH3Wg0t6rzrDNDh8rAuYp6gIzFJZ5pTuYrcCbKG3GFwQmHR1N2kzmgOb0N5lU5VB+mKV1BoH+hRQqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXVHJZ367jkgxqKnN/LRKUNx51PXDU2+2/JPdfUX5HQ=;
 b=dpCz1nLiL2DeHk4JmJuEkBC7TuCgDvyDaT6c7QViZnvFNCYk6wOLjjE0g4JlqmbiZUTBZGEyiMOb3xJMbVNEkUElgh0yGtzcqfDW6skqlxnOY+1liGdS94xPY+D0Jc+VGzjvzwmBaCeU4PhEOH6ixIet4YPohB9i99M8jdAU260YZ4nVvoGk07SO1VjiADg1Gae8TgB6pEfFknhVdMGc8ivubZKKQj1JZmJCfqBMVXevL9g2lR+WckT3yjxFJVDQ6E0hbNo2jGKF2UsDT58BiyDiOIwyfgL3DvZ6PGKu3yM+jYjpILc6r/pYgdYQ95Va1dFNaxzsGYkMoPy0cKEF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXVHJZ367jkgxqKnN/LRKUNx51PXDU2+2/JPdfUX5HQ=;
 b=vwOLGjDgGuA45zCtHqOu/mRL1XqOpft1Q3neTHCxOXTEU4ysqRNPWbEeEIBc0NnYLAjLvfa4tXTVRLJcs8AKkNpD1rfUDtYR8x0ko7WB4MjNkkBR3Ei/SlOT624O1bkGdTyx43U2mhRN4JiZnsAsEZV5od7iJk9JEZwvPC2TDX8p+n6xxGP1jYIOb+IF41GoKD6VZhyYR0ptYDFhYy0NagetQyUD0FgpMD0si3+EGugRF7apz5qs1hhBN+v/TEurvO+W3ef47Bn1LUN2lsH5tX0vjKKpnVWv0wfxn4aTYwSFEz7tSIDBKtJB02P68lmQVtawo3D/BMEeGFjQ4r4E1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM0P189MB169776.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:7ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:00:48 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:00:48 +0000
Message-ID: <b39ca741-7475-4c1e-be70-3dee5ecda630@est.tech>
Date: Thu, 24 Sep 2026 15:00:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] systemd: fix musl build by fixing limits.h
 override
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260924110424.674180-1-ross.burton@arm.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <20260924110424.674180-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0286.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM0P189MB169776:EE_
X-MS-Office365-Filtering-Correlation-Id: 46bdc8b6-67df-44b9-e369-08df1a3bda76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|5023799004|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	5icCIr3vmhFFq0bVHM2OSs900/6vhH2yxUk1bOc/xJXkaPJUjysHZVHoDG4XEH26TrJG+QPPN2gZjuHpAbnzXl6f3cA+cbpDAl9ARR5+xIgfPD9W9RoDQAIdaJpRtLb5lPZQCpUJpPiRDsnsJQ47SJSYrlrBlSMm8lRvv7rAIjUmEeR3rqMvHJy+HxfgUhJxHTAFtSc9v3Eq0q3CAjSQe7y/BqOO9C/A/TxL3c2WqtI1ZmCzshczzOcOJoXCE4UxzlcewyhzNWugxvVbnbJT7rCNf/824Jhw1VwYC7ujGoY7/9+s6PGo1v3P44z2AuBFtJoMKcFeoc+y8ivPKEgp3g8f5kuttC+V/WccIQ8qvv+c/z2i4MNokxs44esKLOccHiH/H6bf+jDlovZazWMeeV/9p9PF2j1TlLxl7lDfplnAeNBzgnLSIKfyFR2G4p4x6XXtlyH1lyMArIRq4yHaIGKGDQgrXW4xZnbQRyygeleBwY1cQinWXjSBi75hQi5KtYZqvv56q3zFvgVC3bMjtxLiry8tQj6RBP6/+DUsBq4rie9TEaU+nT1gcRN+yhm87PGozaXuKvKi37D4QuRojA9mI/EFGsU1D1dbZb2BMxAwFSCO4xaj4exkVqo0Z78BmFWp2RVzvezQw9aJuCtvTR4KWgD+0EnPhmT9ukbBMI8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(5023799004)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHVuWUlsNjVxcHRGSEJtVUsvN1pDM1BobGtpZXQwYW5nMDBtOC9seTQxTEpt?=
 =?utf-8?B?TTdTQUhOVjVyQThKcjNxblU3bU4wR0FEeFFERHZtYU1MRktBWG1pNVJ5SU5v?=
 =?utf-8?B?VVkyN2RQbUk5WlVVMlZ1OGV1dHQ0dGx0QzdkRGlKVlZpTGExZDJxU1ZpZ1h1?=
 =?utf-8?B?SnNqaExMdzV2YXEvMndMcTJJRC9Cb2ZUNzMzWkVpclJUdzdSWTk1SVhNNUJu?=
 =?utf-8?B?M0FiMTRFRGdWWjNoeHI5ditVcHRrcU1VdmZycjFPd1k2MmpIaVR6Q1JlZnha?=
 =?utf-8?B?dDNDWkhINWQ1VW5aQ3ZSTzVKTER2NUE0ODY0TDhVcVJOdkpmU0VJR01IWkFx?=
 =?utf-8?B?ZHlFOU0rUDUrbk0yUVRrN0RzYWRVVnZFaDRkQTBWV2RKYisyQnN5MGdodnow?=
 =?utf-8?B?RVNFWk1GWlQ3N1c0dE9kWlhraG95SkNIblNaM3pTRlpNQW4vaUxubm9UMTE2?=
 =?utf-8?B?cllTdFR3aGF3ejJrdUFNYmU2UTlsNjludElBcVB3M2NqM2hJM0cvb2dlVkFB?=
 =?utf-8?B?dVl0d0FvRjBHVXg4akFUUzVUNEpYcFBUNVU2OURyR0pRWG9lN1VwZXBEaHdI?=
 =?utf-8?B?RWMxM255VzdHZC9JWHNUbGFZcG1SNTgySnNpTy92eitac2l1ZFdqNENlNXd5?=
 =?utf-8?B?QjFBNTBHMG9tamtNQlU0U1lMeTR6Und6cVBpb201MGpsQU5OQkNkdWNNZ2Fq?=
 =?utf-8?B?dlVHNTd3bFhFWGxCWHM5bk1LTEVZYmRGei9qSDE5YlZFbkM5UHFPcXNTWjRv?=
 =?utf-8?B?c053MEdkdTF1eCt1bkpzejZNN3V4aEp5S3pCNnBVWmhiTlNyWjhJeHVDbk1H?=
 =?utf-8?B?MU4yOG1Xc2NiTjE0QWRheDVvN3k4TXdzcDJadGhBbm91NlU4aVNUaDAyZ0ha?=
 =?utf-8?B?dlVtQkFSaHBjeTFBVWRYNEVLdWNHT3RYQ1Q4dFVMamErazR2VFR6dFh5M21W?=
 =?utf-8?B?MlZ4M0lZUWFCNllBTGRycnMvZndYUk9lay9EaFpCTWsvU1A5eXIxcVZqN1JJ?=
 =?utf-8?B?M3JtV1MzWVF0R1Q1VkltLy9YTWg1ZVI2aFZQTm15Q0tJanFYSWJReFp4UkZs?=
 =?utf-8?B?YTNvcTAwV3JiVlVJanRySWNRSUZ6ZmxRQU5ZTVBZdmpTZWlGR2dINXRuVHNF?=
 =?utf-8?B?RE9WWC9CSVVxWi9qaGVIMDlZMUhRNWx2TGMySE96MFJWYWI1cXdIZElMeHlQ?=
 =?utf-8?B?ZGNRSGJGaW15azdsZEN5clgrbmZDTGtjQ1FrK3JTVDNLaVZqMTQxQ2hSRWtL?=
 =?utf-8?B?UVhrTTFVNTZTOThYQStFUUFyMVNCTWZJZUJIYkcrRnQ2WUVtUXMxdWV0aEcy?=
 =?utf-8?B?VzRVUXQxNGRCYitmREdycXNSNk1Ua0tkcnZVR05JdlhmR3dhZUtrY3RPZ0Zj?=
 =?utf-8?B?WEdNSGRsWjhCNnREZXVEV2lHem5lUFpPczFlMU4xcjA2RVNQZzF4a1NLSlVm?=
 =?utf-8?B?NUYvVEdFV0Z0bWIvWVVNeTBqNXQ3b2Jqd2I5T0RDekR3SnYyUjc2MzRjaW9N?=
 =?utf-8?B?b1pyNXkwazhMMGlPdUtQRkhSdkQraS9HREhlRzVkd2Z1b2ZUVGh3NlpJQzlG?=
 =?utf-8?B?bFVFdE9DN2V2bWxsZUtyMEdvY05ZUWhGbUIwZFpoZTk4Sm9qWjNXZVNGY0Nm?=
 =?utf-8?B?NVdSbm1MRlhPa2kxSnoxK0lZc0Fld3pVc0FPS2VkT0xPNGdiamF0eWt3K1NU?=
 =?utf-8?B?YzYxOU5rb3lGaThKdldKaCtjUUwrZVl2WGVNRWlnQlhaTmJZdTlwTnJTYmpT?=
 =?utf-8?B?WmZPdHBWanU4bTl5QTVHcVlDU0pVYzZUT0JNSlRJK2JoY2lUc2hLRnNyZll1?=
 =?utf-8?B?QTE5TDQyWkUxelJhTHRmQkd2T1JjS0I1bjJWdUxSMFBLRWMxQnlTb0x4TXdn?=
 =?utf-8?B?UnFyOWcrSkIvMVA0bUlVUzJwUnh0d3JDcHhha1hId2Z6S2FnYXI5TmptaUVD?=
 =?utf-8?B?c1BZdGo1VE9SUVFqdnMreVBmV01BTW5FalFhcTNoVWNNOURLR2FWanQ4Zk9U?=
 =?utf-8?B?NkJQR0gzTCtPUEplaEs5RGd5NzdPa2hRWk5XM3lQd3ViVHFIRkQxQnp4c0Fr?=
 =?utf-8?B?YXJ4UzBjUWk3dkcrY0wzVHBSNXRzZFdYc1lwZ2xYa1FPWXljc2ZCdlFQM1lG?=
 =?utf-8?B?VkVlQ2phcTg5dER0SWVlM3JQbVdweDV4Sko0SU1UcU1IL2I1TnlMVmhtbmh2?=
 =?utf-8?B?d2JMOFpId0JrRnhsSlJ5OVpETXhPY3g3K1UzUnFoZWxoS3ZDNSt5NEJVN3JG?=
 =?utf-8?B?SmtobTRQdUVlM3V2TDhYSHkzRmNvSCtEeGVNZWxPR1RyTmVxbmVORGY3VTRh?=
 =?utf-8?B?UE4xTk4zNXdIcEZhSjFRVjlCckFrZFk4UG5FYms5YVBPWHNZTzZpQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bdc8b6-67df-44b9-e369-08df1a3bda76
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 13:00:48.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvldxUmhzzznMS5H8mfHdPLIoWiPAaZ5pmZsoLLWla5QG5KUhMSs04OISs7X2xN+Zls+USwQG/qsZB3Rzg6YeyrT9G0lg9IcQ2cpGWrwzC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB169776
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246586


On 2026-09-24 13:04, Ross Burton via lists.openembedded.org wrote:
> +From: Yu Watanabe<watanabe.yu+github@gmail.com>
> +Date: Tue, 22 Sep 2026 01:55:01 +0900
> +Subject: [PATCH] include: fix limits.h override
> +
> +This is especially necessary since GCC 16.x.
> +
> +Replaces #43824.
> +
> +(cherry picked from commit 4e08fdf59ffcafef6ca2df6342101e7e82b6183b)


Hi Ross,


I will send V4 as submitter changed the commit message

https://github.com/systemd/systemd/pull/43831/changes/4065fa34a8c9a00ddd7802d1b00bbb6ca2d0cc45


Content wise nothing changed only commit message.


Regards,

Jaipaul


