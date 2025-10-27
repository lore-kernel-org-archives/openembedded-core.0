Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4E7CCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 19:56:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.20])
 by mx.groups.io with SMTP id smtpd.web10.886.1761595012297542575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 12:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=G8qjPZju;
 spf=pass (domain: est.tech, ip: 52.101.69.20, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyUJ3j7lmm5t9FsG0fA17L57ohb1ptsL4B8nsD+U1q8q/3Yov0fuiNCZzj777wfCDCVyP/ZtTwmsvyEFTVuVKFuWl0Mri4sp70PlIXESMqLZRmzjVwUifqVmZ3e7yiPB921XazcXhusPNf4jVEXBnViFk7sifDIapY0PDKzfHozDYEw0Ez0G1NqwZovKrzu0r3+8dIP8IakozFkeDUfhfDIEQFRtlynwlGnBuV2225HgeqN4saWI4519bKewqJl6o++u5Ey5uFHvhNx2ntnrzXOTKjqKAmdHvpXjtWMDYCaWjzZL+REwz8y0Ih4Ig0OiWBItUf53lCQnPv7g95GCJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW89pYlkTo0a/kLNBhvQAEz/PFkJtJX3CFoayuh6hr0=;
 b=YVKXaOJFbpALkQHRz30Axk/T0Je9qMA8FTq8WVILQEJWHpvwF3/hj3rv7Ifou4+DoBq1bmFI5oWaqXoWpacYf8WKZUxrPDpSKSn30UknbEKB+0C/eJBxKqKQC1loc7DY3PGlqKu/u80BjhhPS722faFwnwf73ER2AFtf+7ulBci5QUQPD8+guOjrIO0sfFAjMH+hvZsGr+lhcKUZZVNAFgP4vYwiiHbt19xMdNiy3r7dfTY5+VRsMMHXm8DDsHu3kHXGQSqyiF5L9Ep0atL8o64ZoXcAmPeAGEws9MVTL+KC1zMLYrgskPQlcBf2DGbyhABSt9zXn3eYSPGmCIBHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW89pYlkTo0a/kLNBhvQAEz/PFkJtJX3CFoayuh6hr0=;
 b=G8qjPZjuQ/fHLJaGXfYbvElxHPAyS47vIvNtrC7tAzQ0tbdIFh1UKjq2eWkvEW1YWhlOdnSufkv8cIFT3xPY3fVTpsz6oBywcjvz+XvvzZYwBG3iNONOftHhajkpfdogmWZFJmZW5egQ5eIY8cl7fTms9e5BBm3yktQgHVfuwjXD0D/SZvmoGxtSnUm0HV97b+l0XLtSNGiw3hkptVHHxcanhJ15/i2eBPhxVMF9cd3Hr+TCysy81SKN5vEsdcEpa5k/F5SsH7XVMU9tN5X0hgaQy3qr2C1xeDxSWDvX9PyAqW5lxIrJxv3i+ICFl2HQN97J9j0FyJr4MIJh/Dv1rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::19)
 by AS2P189MB2582.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:64b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:56:48 +0000
Received: from AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
 ([fe80::e1cd:6836:ba6:11f7]) by AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
 ([fe80::e1cd:6836:ba6:11f7%3]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 19:56:48 +0000
Date: Mon, 27 Oct 2025 20:56:47 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] lz4: fix CVE-2025-62813
In-Reply-To: <18726C77CAC4BE8F.2174@lists.openembedded.org>
Message-ID: <cb5eb677-e052-2dc5-ef93-9baec0db0453@est.tech>
References: <18726C77CAC4BE8F.2174@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="8323329-1277530872-1761595008=:716904"
X-ClientProxiedBy: LO4P123CA0662.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::18) To AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6a5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3247:EE_|AS2P189MB2582:EE_
X-MS-Office365-Filtering-Correlation-Id: 3863093e-9874-4c1c-90f1-08de1592f6fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amZJTkE4ODUwbVgyN3JJSGZteEUvV0pZaS95UnkvSzE5WHY1T2NWUzBIc0dS?=
 =?utf-8?B?ZGJ5a01aR2FtUVl4TDZsMzJJSjFXUElSb3dYQ3ZCUGhmT1NxYndkNncvVzI2?=
 =?utf-8?B?aGV6VkROZEZYWS9yWjErZE5iR1hObmhhbnFKZHRpeGxZQzM5V05jNTRkVDFL?=
 =?utf-8?B?THhvZnVKaE92WlNYcXNUeWRSdStvSnBUV1hVWTNEM1dKYmNxS0xDdG5Ba0oz?=
 =?utf-8?B?OGNxZkFCcFo4Mk8zS2gwS3JsN3pWczJjSHNaOFlRb0l3SFRUTEtxQUx0WUVz?=
 =?utf-8?B?d2lUTkxsTDdUTStZclBOQUZMd3p3TlRvbDc5enNOamJxYVV3SEM2VGpzaU8y?=
 =?utf-8?B?SWlEdFJFUWtOVFVxYk5KZmFPaEtBQWZtMjIxQ3NHMGJFbDBXYzRKSElvTE83?=
 =?utf-8?B?bkJ0UjBEZnAzNlVqQktJOUYvc1N6S09ha3I3V3U0UnUrOXY2V3c3QWhTR3dm?=
 =?utf-8?B?Z0UxQjlHY0RGU21tcERacWlyK0pscHRWSG1aYXcxeUgrMzIwNGtrWm9Cb2Ni?=
 =?utf-8?B?VEJmVUJqNUlFTzlTMkNtWVdRdVlxZWNhUWszVHptbXF1bTQxM3Blc0R5ZGVN?=
 =?utf-8?B?aTU2S25vRjBUaHREdkcvOXY5NnRXUzhHaTFtTFVtMGJzQW5XbHIzRkYrQ0Rw?=
 =?utf-8?B?SThPTEprSnU3NlhKcXhEcS96NDVhNWVnWFlhOU94R0RISEQwMy9aNEhyelEr?=
 =?utf-8?B?a1ptQ01KVlRya3YvSEd6NGhNNHlqayt2UjBoZnZ6WXkzc2UvYTJvUEFvUzk0?=
 =?utf-8?B?MVVSaW1MYjFUUzA4SHEzb2RvbUlmMHA1aGFWSHB5bTdtRkxraUM2Nm5FcWlF?=
 =?utf-8?B?Tm5MMHJwMkJGQUZqeVZnZG9qWlc4K0w4bXI3ZG1YdXhVZE5rakxOU0xJVGxv?=
 =?utf-8?B?VERzaWM4TU1ZNUNvVW5MUGNaRVJhVXplYlZWL2NNRVRpRkU4KytVNXQ3Vk9U?=
 =?utf-8?B?bUkvVlZoS3Qzb2J3TkpVWTE1VjJ5aUZuaFd4cnZqMWhwTzgvL2tRMDJaaENW?=
 =?utf-8?B?Sk5kVlpDbWNrRzVWRVVGSFdGNXEzWmw2bmRpdXowQUVFeXdLWnZyWUNnVVFC?=
 =?utf-8?B?S0RNWHl4NGZrYk1HcktLcTlJOTd0SjFHbFRkQUR0dzZRVTBhOGE5VkkvUWhB?=
 =?utf-8?B?bGtUWDVWWFRNTndpMlQxS3p4ayt4aThRdEdUd2RDSTJ1UW1zZUxTYWJnRzFG?=
 =?utf-8?B?ZG9hcnhra1lRRSs4NWhvT1hsZjZMemlSZWp6NUhya0p6RzhlMExZMDBVSkxK?=
 =?utf-8?B?Vkw5b0F6b1NQRGN6NkpMbXhnTFIvd2drWW9kRlVKdGhORDdzcHAzTFNUTUJm?=
 =?utf-8?B?azhaRHM5K3l5WUdTcHAwMHZ6QUp5SXVrbklCSnFLaUZuMkcvVk5TczZMTUxM?=
 =?utf-8?B?Z0dsaERvTFR5OGFucHVpcEllZXd5OTF0dTFPSzg4MndqWUd5NXpLNmZEcVA5?=
 =?utf-8?B?YzkrNlJ2b2JEU28zT1hBcHZtTE14eXJPTWd1dnNOTDZVbnZ2c0FhaUpaZjRz?=
 =?utf-8?B?aFZqdkFIVHZnc2lSM1hLUGxYNjNPVW5jOFdGVS9wSGtOekRSVzE2dmZDcGFK?=
 =?utf-8?B?cThaNVRWeFB5Tks2ZytmeVBmcDd0R3l2MGtoZVZORmE4Q3VTc2VEZGlYeVB1?=
 =?utf-8?B?dHVVOVJ2eTdWZ3JsYXhyZzB2a3l2WGkzVmFNNGZxNjBhekhmVWdMOW51T09h?=
 =?utf-8?B?cFRtcmx0VUpLRC83cnNNcjFQTDcxa2JTVW5qYTNqV3E3QkZPblZ1cTlyUEtT?=
 =?utf-8?B?a3pzS1ZnbHdENEJtUUFUdVJZWnVpOXNXd2pNV3FsWGliVXVFN1dSYVNuN2xV?=
 =?utf-8?B?akFFK0RxS1g4R2dZcTRNK3E1RkhLdnUwWnphZmVwdlZWa2dNSXJvTUJGQlJx?=
 =?utf-8?B?WWR4enB3UWJHaDBKb1pWcnJHOEVEVndabXN6VGE0NWRSR2FMTmk4MHg3TGpP?=
 =?utf-8?Q?ys7oJByDc7w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3247.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDEvNnRVMis0YW5VelIweFZFNnFqazIvYko4VkNpNG1pTmZLQk9pVnpYL3ZV?=
 =?utf-8?B?d2RFTlFrR1hHcE1GWFpvbk5QNXlveHJyczRET2JKT0ZIMnFzbnJ4SlQ3cFIr?=
 =?utf-8?B?RUV1Ni9rNnMxVzBnNEx4TWl5UjI4SVRrMFVld2F4ZzEvZXkrVW9yTzB2ZTFS?=
 =?utf-8?B?TTVOTU9UZkVxQUUyY2RaM21WMmhjSTdHVUNSYXZrLzFMVDYzMCtSdHEwekFV?=
 =?utf-8?B?YTFyU1gvRUFhcXhCOTZib1VKUmoyaU4rUUJTVFNtblFJTmNKWUJJbFNpdVUr?=
 =?utf-8?B?T2c5L2laSWJCOERmalJ6UGt5K1YxRUltSEtxdklNUEU1RnhWK1ZJNENzQUNp?=
 =?utf-8?B?UDNVSU9ZU2JEemU3ZVZOTWdoUnNBWFZVUkNwdlFjL09oSC9kRWg3UUJJSjc2?=
 =?utf-8?B?d25aUVhKTXJSeSs2aXMzd0w3aDlJa1FLRnRCK0VSbVdGeTF4SS9CeUdCMDJM?=
 =?utf-8?B?MkJTY3V5dVlwcndva2pkbHpNK1B3NzRrMUduSTFjRUUzazdxRXZURC9ZdGpo?=
 =?utf-8?B?WHBGYTNVUXFpcmJKS2RjS0YxYzBEZ2pqNElINDNXOHRzVHUyblFNUjZHY09r?=
 =?utf-8?B?UElkWHUySkxhNjRiUzNvU1ZwM2VVSFAraEZJZk9WNXVTS05IVW13VkZBL3BT?=
 =?utf-8?B?bE1qRHBQMmxKdXFsRms1c1ZFVEdkRzJCWGovUmhUNlJrTGF4QWxoTmoveHll?=
 =?utf-8?B?V3ZHVXQ1dGZ4ZGp3dk4ydXVvOWJaSHpNY1ZuRWhMcWVzdkRtLzVrcktURXFL?=
 =?utf-8?B?a0RGZUFla3RST3NIMWszZmxKZUZxdlpkMjNpYnB5eEwwQ3BPR2ZHSkR1c0Rw?=
 =?utf-8?B?YUZqRkFaT1A3Nm8zYjZZb0MwM1lhNy9rSnhFY2l1MWpOWU1rUWZpQ2d1T0g1?=
 =?utf-8?B?S3RPalhiVVN2bzFuTG44RU1Sc2NQdHpXVlRoQ3pYOHptMXBDYnc4dGZmQTdJ?=
 =?utf-8?B?aW0rYzRNTitkQjNzbC9RbExRRGI3UlRTRzRHRngwVndraVd4aEpBOXh5TElL?=
 =?utf-8?B?azNIUnBaR2J4VlJYY08wQktmMDdMOTJQTU1FQjlzZEJPRnB4bzFuQ1JWK3M0?=
 =?utf-8?B?Snh3bnR3aXA5L1F6NjBRWTgrcnI0ZDNNRkM1aVMyeVBBNTMvL2xkUkgwZ3FH?=
 =?utf-8?B?OWlMRURwYjgyU3NjQlJjdmpiTlN2cHEzb1Rsdzg5Mm9Ndy83TlRCUFBDZXhM?=
 =?utf-8?B?YUE3Z0RGeWZKVWFveDhUMm16TXo3UnB2NWU5SURESW1ibkpTVDNZcHRKY2Ex?=
 =?utf-8?B?L0xIMGVoWWpQS0k0S1JNTFJzM3B0TWpvN2k3eWFGN29JQnAzTGk5dkROZVU2?=
 =?utf-8?B?eUJNRWQ4NE8xR2R1aVZNR2JQS1JNWU5pRzQzVGNDOVF3ZDJ6RE1DdlNOUFha?=
 =?utf-8?B?ZnExanNpYTlhSkhwY3pCUlJBSFFxa0Zjb3padVNSTC9Ka2tOU21EZGlxYVdk?=
 =?utf-8?B?MlNRbnNmYVVVbWVoNG0vNmhnSnNHTUdadERQWjJ0UFFrVEEyaCtPSjM0SktT?=
 =?utf-8?B?RFdLVVk2S0JlT3JreTNnQXhycEdwZFJQd3k0eVRqL2UzMSt6TjFsbzFFZU5E?=
 =?utf-8?B?ZVc3VWVOaXFZMldIVXNLVjRSWWhmK2dVRFNlaEU2MEZlcTJCcmF0YXE2TDFj?=
 =?utf-8?B?VVRqdzF5eUJMeVphQ1JRNnNzY3FZVE9TS0JhVVBiL0tkU2dBZmRMZm45M29I?=
 =?utf-8?B?cXJycWxPMjYrQTF0djR5dWhHTTdRQm1EMGVDTy9kSGNFVVJwdlJHb2JmZ3Z2?=
 =?utf-8?B?R0dQcnpBM0hlS295blI4QlZ2TVQxZ01jazdxVFA2Z0JNdU0weHBJR2U0a0h5?=
 =?utf-8?B?SHYycVZMazZoOUVQTGxuZDk2UnV0cW5MalcxcVloZlAzWFNhRUxqNGhOQ3J3?=
 =?utf-8?B?VWp5MzFER3pNUFNNVHFBVHJxV2FydHZTRVJRZWViVit6VVQzbERMUjhwbUVH?=
 =?utf-8?B?WG1mamtBTDJheTlsUUJoeUYxN1IveFlGV3l4VWd4RkhqUzRsNmxGaFplRXJX?=
 =?utf-8?B?akV1RDFESW1iY2ZvR0lXMGNBNytKUHJoVysrcy9Ua29uam9MMHNLZ28yKzA5?=
 =?utf-8?B?OXd2UnlFc04wb284MWY2TUlITmswcmNYRnF1c2JBbkFNcktCcnNXZzlUekdF?=
 =?utf-8?B?QTNkQ3dtS2tGVE9Ob1NHM2IzUzdEbUlCU0VzUGxVUXpNMmN1RkthWHZJQ2Qz?=
 =?utf-8?B?YXc9PQ==?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3863093e-9874-4c1c-90f1-08de1592f6fe
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:56:48.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HydaOw9nnqVUDbYzQNG3ZHsK18Lzgw6SlYQkPEUJZO8DwSx0f6PkMybp25dtHFlhmbJjL1u4S0hT6o39qCg0rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 19:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225353

--8323329-1277530872-1761595008=:716904
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT


Whoops, scratch this patch. It was meant not meant for master,
but for scarthgap.

Br,
David

On Mon, 27 Oct 2025, David Nyström via lists.openembedded.org wrote:

> Prevent attackers to cause a denial of service (application crash) or
> possibly have unspecified other impact when the application processes
> untrusted LZ4 frames. For example, LZ4F_createCDict_advanced in
> lib/lz4frame.c mishandles NULL checks.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-62813
>
> Upstream patch:
> https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82
>
> Signed-off-by: David Nyström <david.nystrom@est.tech>
> ---
> .../lz4/files/CVE-2025-62813.patch            | 73 +++++++++++++++++++
> meta/recipes-support/lz4/lz4_1.9.4.bb         |  5 +-
> 2 files changed, 76 insertions(+), 2 deletions(-)
> create mode 100644 meta/recipes-support/lz4/files/CVE-2025-62813.patch
>
> diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
> new file mode 100644
> index 0000000000..bbd0f74541
> --- /dev/null
> +++ b/meta/recipes-support/lz4/files/CVE-2025-62813.patch
> @@ -0,0 +1,73 @@
> +From 10dbd089b74cf858a24a4aa4c2a438984ddf17d7 Mon Sep 17 00:00:00 2001
> +From: louislafosse <louis.lafosse@epitech.eu>
> +Date: Mon, 31 Mar 2025 20:48:52 +0200
> +Subject: [PATCH] fix(null) : improve error handlings when passing a null
> + pointer to some functions from lz4frame
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport [Upstream commit https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
> +CVE: CVE-2025-62813
> +
> +Signed-off-by: David Nyström <david.nystrom@est.tech>
> +---
> + lib/lz4frame.c    | 15 +++++++++++++--
> + tests/frametest.c |  9 ++++++---
> + 2 files changed, 19 insertions(+), 5 deletions(-)
> +
> +diff --git a/lib/lz4frame.c b/lib/lz4frame.c
> +index 174f9ae4..cc6ed6f1 100644
> +--- a/lib/lz4frame.c
> ++++ b/lib/lz4frame.c
> +@@ -530,9 +530,16 @@ LZ4F_CDict*
> + LZ4F_createCDict_advanced(LZ4F_CustomMem cmem, const void* dictBuffer, size_t dictSize)
> + {
> +     const char* dictStart = (const char*)dictBuffer;
> +-    LZ4F_CDict* const cdict = (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
> ++    LZ4F_CDict* cdict = NULL;
> ++
> +     DEBUGLOG(4, "LZ4F_createCDict_advanced");
> +-    if (!cdict) return NULL;
> ++
> ++    if (!dictStart)
> ++        return NULL;
> ++    cdict = (LZ4F_CDict*)LZ4F_malloc(sizeof(*cdict), cmem);
> ++    if (!cdict)
> ++        return NULL;
> ++
> +     cdict->cmem = cmem;
> +     if (dictSize > 64 KB) {
> +         dictStart += dictSize - 64 KB;
> +@@ -1429,6 +1436,10 @@ LZ4F_errorCode_t LZ4F_getFrameInfo(LZ4F_dctx* dctx,
> +                                    LZ4F_frameInfo_t* frameInfoPtr,
> +                              const void* srcBuffer, size_t* srcSizePtr)
> + {
> ++    assert(dctx != NULL);
> ++    RETURN_ERROR_IF(frameInfoPtr == NULL, parameter_null);
> ++    RETURN_ERROR_IF(srcSizePtr == NULL, parameter_null);
> ++
> +     LZ4F_STATIC_ASSERT(dstage_getFrameHeader < dstage_storeFrameHeader);
> +     if (dctx->dStage > dstage_storeFrameHeader) {
> +         /* frameInfo already decoded */
> +diff --git a/tests/frametest.c b/tests/frametest.c
> +index 33019551..523e35d1 100644
> +--- a/tests/frametest.c
> ++++ b/tests/frametest.c
> +@@ -589,10 +589,13 @@ int basicTests(U32 seed, double compressibility)
> +         size_t const srcSize = 65 KB; /* must be > 64 KB to avoid short-size optimizations */
> +         size_t const dstCapacity = LZ4F_compressFrameBound(srcSize, NULL);
> +         size_t cSizeNoDict, cSizeWithDict;
> +-        LZ4F_CDict* const cdict = LZ4F_createCDict(CNBuffer, dictSize);
> +-        if (cdict == NULL) goto _output_error;
> +-        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
> ++        LZ4F_CDict* cdict = NULL;
> +
> ++        CHECK( LZ4F_createCompressionContext(&cctx, LZ4F_VERSION) );
> ++        cdict = LZ4F_createCDict(CNBuffer, dictSize);
> ++        if (cdict == NULL)
> ++            goto _output_error;
> ++
> +         DISPLAYLEVEL(3, "Testing LZ4F_createCDict_advanced : ");
> +         {   LZ4F_CDict* const cda = LZ4F_createCDict_advanced(lz4f_cmem_test, CNBuffer, dictSize);
> +             if (cda == NULL) goto _output_error;
> diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
> index 51a854d44a..8c96f9bab4 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.4.bb
> +++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
> @@ -13,8 +13,9 @@ PE = "1"
> SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
>
> SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
> -	   file://run-ptest \
> -	   "
> +           file://run-ptest \
> +           file://CVE-2025-62813.patch \
> +           "
> UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>
> S = "${WORKDIR}/git"
> -- 
> 2.48.1
>
>
--8323329-1277530872-1761595008=:716904--

