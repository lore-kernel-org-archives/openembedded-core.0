Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1009C4452A
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:43:51 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10612.1784558621023165953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GNjZ1R/0;
 spf=pass (domain: cherry.de, ip: 52.101.72.47, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3rCqvGGRHVTMw8iu7lE3vFS8hY+a8l1r2hFsof/E8X1RYsqQLb3+oL5hhrqx+ZvLh6HoBQwk+hCAjyp6PWZQZwO82U1mFcjwADhiqJiFS/ngT8RIbyMd3Sj8iBNQklGl4Ts8pHMb1j22TwLvY+tjoj0iGGM+IWkNhqGO3Sb2xVzYW1vLXioNUqE/DbmVL5vHBdMYe1aJOIdQQBW/4VBuryE7T308E3ulPthGk8FRZhSRJuHAO1qr2bhMvI4qF0TvcyfzzezGFUC/tYKnQ1y632896d+pZb0472+txJeAH4OmpiMS3Qp4EoajfDdW/ma6CUWmcNjFM7QsSX6y8CmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXFmxvIkHcN3E3nUSptwIfPeCY9eyQMLxrlOp/QQYS8=;
 b=EZbDgsiPAkTnQYiYvpAJKxzJNjm5KfTAgjyHJwwpyS8HdK9rX8rb/3L+sepCmjx6pDZVOYbEaFXaGZn48NsJdSE8dihm+GKEkVzNPPH7VC8b8HmePnoH5k8iJXcuUReSC4KM4CR1VEOCbdFRTKgiBAqfKDrmAdBzCntCQqMD+Rm6VD9ErTWIDSK/O0vDwU/dqVM/UoREqagqIFHq8ObZ3xkcFoVNWq7mAbIMTvNUYefJBaV66j8CEpifh9oBfLOKD6Mx1UsLH80J0eU6iw2/wx0AqgIWfs1xN3/yMA+wO88sFz1DYZzZrVPqJSE5NvCHR8QhbRjyBDJETmBJjwOx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXFmxvIkHcN3E3nUSptwIfPeCY9eyQMLxrlOp/QQYS8=;
 b=GNjZ1R/0tQcQbjt8rfn/Tw66oc6419li7jGOLn81ngx/y9zFunhmngoebLL/t8KtieUWMOTHn/sZWJlF8JMwSC/UcDTcBEy/3RslH3Si6mY0bZxrqLJKBj59D6BH8u9SwoNZ8LE1eec9sf87TXeN6a9h9ddgUr3cQSCh6JnCFQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM7PR04MB6920.eurprd04.prod.outlook.com (2603:10a6:20b:101::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:43:34 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 14:43:34 +0000
Message-ID: <4e508b63-8c6f-4b61-be3f-f47981e1bd31@cherry.de>
Date: Mon, 20 Jul 2026 16:43:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
To: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260719080108.1290998-1-zboszor@gmail.com>
 <20260719080108.1290998-2-zboszor@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260719080108.1290998-2-zboszor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIVP296CA0021.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::9) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM7PR04MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: e81ae91c-a81f-4fa4-363e-08dee66d4652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DysO5veMcslscZLY3zDhU1ABk9jVj2zd86zKlw3/8rirCLTnz+yiJPLRrUIs2zKm/HRA5ZHtWe5CUdw9EOu/avLlyPuvqfsYykKxORl+1zsAiar4MCh1wUXjLypXDKVGxlHujCJ41ItcGlgD2DKwkyN8SoZohnnVN+WFtMRVdJPIb6n4T5PQkR5kZqtDfXPk4K/oGuVY3cLxvZ8HAQ/6KXiyW8gw1ZOsAi4LsD2tRPq7wScjiwEs9Qf3w3q9FNEdJgZ23KWQ7K8j3ou1iMqhepGEaMeRq3uhckFPOrOXeCKA+z4LyRjylTtKLPqqkQnpV9OWK4H7icYLCOtCYf3wEWYOafKOuIcyS8CkWbv7qF6IntWgyra0mzUbyzztLVfVWIeEAJSzbSmczEdX4M9AiO9nHwl7wfE5V/mX5lxPFD1gIquDZllAW4hXTO3qtjzqNc4PHhPmWfWIf6KS7GTBFct6HzW07xWy4/6oj4Q2XdQcYdhQD9Fz7D6haAsWtdLtid3LUl21nVkweOuZ0wo50W9yHto5FzFfu4WVkZAjJ7Cs5rz6DyvZIsdPA2bjCziYFLsVlIs6BeLOwF3jkCLKCUYE902DfBx8N1iM29eADFNgSJhYP87iu7GY9FKqtDz6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eUUwbkVtcFk0N2ZVTkw0KzhEaEI0a3lFa2kxVFpleXdqV0dLMU1lWEVPVFdJ?=
 =?utf-8?B?MTZ1ZWdyTlV1YW1HbWgxOTBwb2kwT0kyUWVsZEFQbkIrb0NnbUFHa2JGYnkx?=
 =?utf-8?B?T3JQSW43bGhyNUpySC8yMUtLUEhzMjRoMWxySG5IWGRCOHBwWlZaN1RCcURa?=
 =?utf-8?B?YUNEKzRtZlBmT1J6MGZVci9BNkpRMDRlbGROcDc3VmxGZldvWEhnUzEwaUk0?=
 =?utf-8?B?UDJGbmJ0aFAyYUxFdkRocW1KOHA4VkNtSlBTL291ZFRpNFkyeFh4a3VtTWUx?=
 =?utf-8?B?ZS9SQ0dvSmhYbnA3bVp4enRnN3ZhdTMzR2pHOFYrWU9qS29kTUhmOUhURnV5?=
 =?utf-8?B?aEFQYUs1SW00NnBPN2ErL29MNzNZRnZ6Q0krNFE1enhkMHFIMUZ3MGd3cTRi?=
 =?utf-8?B?SVBhdHdrMEZxRGVZNTA0R0IyVExZeHZMV0pOUmZCZndQS2YyclpIYS9BRUdY?=
 =?utf-8?B?eHl3MW90K3ZZZ3pOZk0xVm54MWNTY3BaNWFDME1XZ2FtbUZUTDhha0tZb3o0?=
 =?utf-8?B?dWpBaEcwam9NREZDZDRrSmZVSFplSDBwTWx0L2NvdzBQc0NKLzlvdVBjd2NO?=
 =?utf-8?B?VVhRckZhN0dMK2tybEFSU0wwSGNVRzQ4dy9uRW44N2NMRkRMTlJpLzJJQzEx?=
 =?utf-8?B?bW9ISW04YmFBRnpYUVJvNzVXYS9NNE1BenlWYUV2eUJ3bXZKWm8yS2lpSnpY?=
 =?utf-8?B?S0loQjlrNlc5cDhENkptWUhvdGttSFBnRFc2WVFKWmNJci9FblZubDdZc2FM?=
 =?utf-8?B?Rk9GcWZJbHBIdnVPaGgvdWZoekxQMmtTS1dSSE8ra1hiZUNIbnJaS3NqRXdH?=
 =?utf-8?B?TkpCVUt4MTZ5N25KQ2kzNFpWQ3NtMFV4Rk0vbDYrWURCVG5zM0xHODF5d3Zt?=
 =?utf-8?B?L2YrN2lyWUhGeWJHNWFseTNIdlZWWjBYeUl5WUN6Z1VNK2lhWEdTd0pTY3Fu?=
 =?utf-8?B?all5dWpaZkltOXJEUkxpT2hHZlF2d1luUWhGT05KSWU4QjlSZnFvUDU4Ri9U?=
 =?utf-8?B?QXpQYTJJRUZEVXlnRUcyaExDUkwxZUJ6eVlIbm51eHo5NmFlQW5jUUdZYmJC?=
 =?utf-8?B?NU9aY210N3RzbjJqMG5qTG9XNkRpMDVJcXFleG9qa09zY1JqTFF1cWJheXE3?=
 =?utf-8?B?Wk9XN0M5TmJWOWt3Nm1vMUJtK0FqQVhHVm9rZHVGMGMwTzJWYzdSUGpzUDBt?=
 =?utf-8?B?NUl4cWdOcC83alR5cDFwSlYvSXhqWVhKZkpFY0ZrNWdIR2ZKSWg4TWxVWUFt?=
 =?utf-8?B?K3p2N2Y3REtrRDJKTFBzZkF4NmVmVDZYS0d3eFFYajU4ZHpVbkdKdk1PK0Nw?=
 =?utf-8?B?Y282cGUzRkdtTlNRbkJhYVpjOFk1ZXdVMG5ybnB3OUE0QmlpQytxUHV4ckZI?=
 =?utf-8?B?eXBQMnROUlcyQlFzZHQzdWtmcTBnNTBNb0tEeVR5TmZiUVVJdTdtTStIQTVu?=
 =?utf-8?B?SE52SVpqT09PSmkzOFZjN0ZDSzZSNkFBUmZlVjBGWG10UTJBbTNHdllHdlBt?=
 =?utf-8?B?K1JJS21aLzdVYkd1cDFBQXFXTWFsc0JwUiszditVUnFTTHZ6Skg4bVBXSTJz?=
 =?utf-8?B?bDZpMGhMMC9TbUJ5ODNyZUNoNzA1eitmZEFsRlhYOWpRaDViQjdsanRvS3ZQ?=
 =?utf-8?B?YnIvU3J2dkcvd3Z1K0k2V0hmQ0pBTk5pSmtWT3VwUlBBSjU3aW15eWVMbXlX?=
 =?utf-8?B?d29qd1BhakRkZDMwL0EyWVJnSlBiSDJ4dm04KzZuQWMrc2t6RnpBbG1vb3NJ?=
 =?utf-8?B?VXlnbGNkSWZMYk9sdXJ2Wi94QVhHZ1NINGQybW9oeGdMS2RuUVkrcFNqVUNi?=
 =?utf-8?B?cm5YaXhybkc1V0d6UGswU0dqV2oxOUZFbzJoNnBHOTFyL0NBZzErWnpzSVNz?=
 =?utf-8?B?Zk1LanhTY3BXRVdVWVhrS29sS1pIMm5NWEFYNXB4Ri9pVWtpRXdRWXc4RTNn?=
 =?utf-8?B?aGd5VVpYeG9NUGU3ZmpnV0dlUGJkb0Mydml1dDRrZHJyaGNEbEYzT0dyWXdK?=
 =?utf-8?B?TWxCc0k5WVZ1M1dRR1JjS3Jia1hhYkh5RkZRVFU3NWVSKzBvMk96c2xFblVK?=
 =?utf-8?B?d0NwcHVVY0RBWTBwMk5uVjdENHpQTjlHTUJEbWtTUUhuNzZnS2hRbmlzQXpY?=
 =?utf-8?B?a2p1OERRWjdFRndWRGxPNUVMSWpwbEpTNXU5U2RxWmhjTnRrcEpRT0J5YVBL?=
 =?utf-8?B?V0QxbmI1TXRLSmllMnRKV04yTElOT0Nwbk41am9xM2pTdDRCak1TWDloVGJh?=
 =?utf-8?B?cTFPejRaSm1mbEJZaklXc2hWUzd0RjRvdlRwUDFGdVZFakxkOVZpS1ZNQmJ3?=
 =?utf-8?B?L28rWndPdkpKZWphTDlKaEp6M2lPUWNsYTlDa1d1ZzZLY1FjYVJoZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e81ae91c-a81f-4fa4-363e-08dee66d4652
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:43:34.0277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aw1LWNCZBmtPwD5Meeg28bJsbAVJ+ZP8ggXZPBo/B1gjeCv2+V7Jql++MsWLnVxk9FwVzyTt5YmNTsdHZOfOgXfThKE9xrKgZsgjh+xEuxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 14:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241406

Hi Zoltan, everybody,

On 7/19/26 10:01 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> See the reasoning and discussion at
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
> 
> TL;DR: LLVM constantly introduces breaking changes that cause
> regressions for running OpenCL CTS with Rusticl and finally
> Karol Herbst had enough.
> 
> This fork is from the LLVM 22 version of libclc and contains the
> necessary fixes to make Rusticl pass OpenCL CTS.
> 

I think this may be too early as this is still pending upstream and is 
currently not receiving support from at least one person involved there.

Also, aren't we going to have an issue if we have libclc AND mesa-libclc 
built at the same time?

Cheers,
Quentin

