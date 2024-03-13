Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4BBC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 16:37:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.115])
 by mx.groups.io with SMTP id smtpd.web11.440.1710347819493110554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 09:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=AP/P2P/I;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.115, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOCHJdQfsxbph2w4FjaYwDUle4F7JslKsikSLxy6rnT9rpfN6TnOXkp7UQs/uor6WXaISqBkGsoqQhVaXDdBYmmhoZgLO5lW7uz2DaTLbIpl24pGKLr/HyKa0uNzjThUIeI3yg3AjcuHVjsr+sxR0+ZWzTpnwzlfOrIV67hYYDTfCUIGslzzm7dEQPOlrJaiZ7WyV8vqwo43GbtaWk/CiFJP7Qkc3swnK2L6LHFTk9OeujEn2QSApZmbtBXn9/gaoM70Avi1m16VE0pmrxhXtLmdb21tyv3rhODSjrm902LQ9+zDlFZyOojQZY36UKZb0yOl95t5dQkflUFqTu0ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcG/vd84ga9+jXm+VjTqxrYcCgUj4tklbGnfalkwYyY=;
 b=Bpw4SVlGT+8ToNIgMVKP3qtM8GsC1Tny81CNiotuW+UtXRx2bFkQEKtOS8HefGVMOdwKrbGjY//3XW8fqK7PXVucHQXmBKvwdcYx76Z6uMEryvlwG0y9My8fQcu1G/KOqsaYfWEmxM0jV4vlCIhCjRgUMRNARjvZzVx2vZZfURQg02fnmbpsdjReawqhf/5jhaG2FzoSiDMrU8k2RYfWwoKFxdxC2CMHneHwvPIZt8XrvQFsHI3KAw4q2JHcXXDndUJsr/2SE/SM0mZFqUKz/0BQZsNJ5GzqzjadeIQ6j8G8PjSatuHuY+eYqBF0cgPHrFNWiDngvHv7/TxU9BHFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcG/vd84ga9+jXm+VjTqxrYcCgUj4tklbGnfalkwYyY=;
 b=AP/P2P/IMbyzBsXn4sZT0r5/LhWqzJ3VFgGuYmLxpHkzu8hre3gKpXm+sf8GfI5qcl37dPF6pogi091li+zjV0bzPyTk5shgcAEZE1mS9Kriv/taFRmhbXkMcepjQmKOZpWYKLeN8SsJlr5ulk6CKss3BsS2FEFibLT/RxR3v5fI3mx2ySl+52byI7awy6Xa4mJfhatge6zLE1DbOolhdUo8bNlhH+nZYwAjitKO4NVcp2XSjSXpIxOP45y76LrtqMSZ2+h+nm34pF0nNEmr3ci7HwZA4B2L1hU95+kRQYXq4ZUZ/PnHs437BDu9eBAkDtRWR3BUlM+l0IoUbpcdvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8022.eurprd04.prod.outlook.com (2603:10a6:20b:28a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 16:36:55 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::23:4118:ae4a:8dda%5]) with mapi id 15.20.7362.031; Wed, 13 Mar 2024
 16:36:55 +0000
Message-ID: <77d3a99f-4cf1-4ff4-afa1-81a5c21f7677@theobroma-systems.com>
Date: Wed, 13 Mar 2024 17:36:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] linux-firmware : Add firmaware for Intel
 9260 wifi modules.
Content-Language: en-US
To: RODRIGUEZ Yannick <y.rodriguez@i2s.fr>,
 "yannickrodriguez22@gmail.com" <yannickrodriguez22@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240313153922.154396-1-y.rodriguez@i2s.fr>
 <9975c0da-0ee6-4de3-98d2-e01afbc1622c@theobroma-systems.com>
 <AM9PR03MB7233FFEDACD5F152CCF19742D02A2@AM9PR03MB7233.eurprd03.prod.outlook.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <AM9PR03MB7233FFEDACD5F152CCF19742D02A2@AM9PR03MB7233.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 8116a352-ff7c-4911-4b5c-08dc437bcb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8sGCi80QfOszS1BaP5gccdJ+xzQ2zwJ+cXyyY7Q60ay40mQ34Z/y1Qmr7jKjT2KuJsO9G2eaEW2cGoCdv5dJ/+u9VIZfHtMkEzdZapO5RmKjAQXhQ/TtuVumrG6whyqXZfihaaH+BMegwlmJJmIKDFHV220PmwCuK7w2hxNkGtZV6cbH+/SiXqwBZkxNqv/LI+MpvzPEUQTTLDY2cX92aVwdrn8Bz4HHlCnbUrwEpdqW6l0jyIqP1MgvDNdOmvNbCkYGjHwEJCWX/jHZGN+L2yxPPteqOKx7zTcdx2DcCjhgG9yNlH/3q0I1BuuSkZgp2+qJkM3XPulIxZpfAtFnif/0b3fO8jj6up4kYx2ILP9e5p68iEjrO2XUCRVuuX0IUp/4xvhI/9pmCi7PpuJj+0MFDbctEnF9Ox0uS8jSP9Npx7BOJdeWXIQe86X5she/rRWkUZriCZOPyzB43gv9YkseLW9/yU4nOLkB/QiiJGnSkmoygqSpba2wovOtnCM02C/O2g/ANNHLvlQZtZVjS8hmJebAdn1bQorq+m7FLrF1MBgNx9CMGgHdouNr+4ykspuJUuR7zW8GOWrPktvplSutfZ+kpjo/zsmrDtm7n48=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V3NIZEJrMHlPYWh2a25TRnZIMHV5SUxZUUVIOTdJbHlnZGwyT3orSHRqb3NH?=
 =?utf-8?B?VU16djhrZXNyYW5xanp3MzZRdkkzRzJWYmQwd2pabkVFZVhvczQ3cjBCTEoy?=
 =?utf-8?B?ZnhqanArRWl0RnZZSENySEdaWFg3MzA4bnVIVjdKZWFRTllPZWVjZWZ0S3V6?=
 =?utf-8?B?ZVRIOER1YjFhNDNOTkpNS2UwbU15ZVp4UlVwZEFiZzQ2Sk1LSzRXOXJjWVlq?=
 =?utf-8?B?Zml5R0E5aXIxTjRnVlVIekJjeU8vSTdiUVdsSnJYeW1jek9yWDRPMzZZOEh3?=
 =?utf-8?B?MjczUkswTXIwZDY3NnJia1dXK1dDb0xlL2JmSE9sYjNwQ2ppS0dBNGlMcFMw?=
 =?utf-8?B?QnlXa3dzSjhvb2tKazVJTnVTZ05tVDdzQm5OdEhKS2JaVStybDhJaW1HVVJL?=
 =?utf-8?B?NUZadUtVVmhTNEQrRTgrOVMwM3dkbnpHKzA3dGlIcmx2ZHhqMThUc0krbk96?=
 =?utf-8?B?c215VVIrVHpnTm1hT2Y3NWhCazEyMEtJakpxaHJEVXN5Q2l2QXFHajlPa3Za?=
 =?utf-8?B?S3RhNUFqaUJjQjV6Y2NoeVF3d2VveUxGaEtIR1Y2OExhdExNR0RQZ3ByNUtY?=
 =?utf-8?B?ZlUwOEV2S2YxTTVGM0xrNlN4L1oxMmEwUGRaWkdiTDNIUWNQYU9QQ0JrbzJn?=
 =?utf-8?B?ekVHam8yc0QvUThJSzF1RDdMTmpBcHpndkg0cGtEbm5Md25EZGVnSVRNRjlx?=
 =?utf-8?B?aWEvbU9DaU1PZVJzckNIazRwQVVHUzgzTGdRVGE1SXNmMXY2MExiV1ZudVA4?=
 =?utf-8?B?T0tuVW5lWEw1WG5jN01yZFo5RndHckg3Z1orYkYzelNqS0ZLU1lXU2hYRVNv?=
 =?utf-8?B?K015R21WN011Z2hRbWpKRTRPOHJvQ0RtYXEycjNLSVo5TmpEQkZsaDJ2Rzh0?=
 =?utf-8?B?NnQzREwwVVdESGpZNE40bERyU0JxNXg3N25SWG9KRGVWTnJzaXFCL0tsRG9i?=
 =?utf-8?B?N1hlcEh4RGVrMEJIeUVZNnQwditmRnpUdXgwYUFQOC9ZaVM3ZEd0STVwK1hE?=
 =?utf-8?B?N0lKck82b1FjSTlteTBNYmpvZ2tZR1hTblhIckw0a0ViVlFKL3JXc1h5dlZm?=
 =?utf-8?B?QmNjbTZSbE5lUSs2V0pyelpqS0R2N3B3L3lvWW5jeDJaYjBxQUZDUWVpSkU2?=
 =?utf-8?B?ekl0TUlsbmZ2YXBveGFONGZqOGF5VXpOQ0xtYkhHeU5BTCtoK3Z1UW1Ub1Ew?=
 =?utf-8?B?VWRvZlJGTU5MZUU5amE3NFdBVlZiaUs3QXEvbmdjMkhvQW5odUl3dU8vZ1FW?=
 =?utf-8?B?OG9OWlgwTHozU2FXaXdhdzNqYW9kL28zUU04UHhEUzY0amZDaXdPdzZSMUdi?=
 =?utf-8?B?d3lyTjRlK2hraWJJeUxuKzVLL3l3a3N2eVFRWGl6VWxFazZWaDZRVEdqSk9a?=
 =?utf-8?B?Z0Z2TkNGdFQ5KzZJdFVoU2lpc3FYMEhJZ0d4dTZUb0NBSXhOSmNlTGFFb0Vy?=
 =?utf-8?B?WlJjZ2x4U3JiUXBWWlUzbGxGWC9GY3o0UEUzVTFmUjJRNlpQWTl5TkdscHp0?=
 =?utf-8?B?V3NrK2YyL0trNTIzYUE0anFHSVNVMy90TGJlTTBoL0lIVXg3ZHB2dVZSWUkw?=
 =?utf-8?B?NmlCMDg1MC80b01PaXo1UjBvMlpRdlFXdXB1eU5SNWoxaVlLOEZDRmhUVGgx?=
 =?utf-8?B?QzZ2WldSb1ZtdGdoZ3RCK3QwN1RtWU1DTlBaM21wRi96ZnFhL1FuR011UjVJ?=
 =?utf-8?B?T2E1VGpsS3BQYnhWd0NranZmQ3pndzh5M3ZUWUdSTWFZUC9CcVNOM29OaUx3?=
 =?utf-8?B?ekw5bEJHNGJZY1NHSDA1VGsxelF3cGV3Z0hpb0JYMmVTdHViQVErbGcyeVd5?=
 =?utf-8?B?WVFPWUxtMkpSdmdVdnhYbC9IaFpPcU43amtPTDBYWDZXSTVzUkRFWUxSTGNI?=
 =?utf-8?B?cEthaFRVOWJRNWVKc2FIb1ZURk04VlJQTk4wKzU0KzlNNVZ3Y1NHajEwSCs2?=
 =?utf-8?B?M2JmWXlYanNaRkhhc25ycVBqYksySnY5Ky9ZdmJhcmNiWkY1S3JXWWxoTEdV?=
 =?utf-8?B?bzNGZGxkOC94cWRWMjFPNkY5UGdJV0tIRDRIMVBqc2NUZm5VQjB2eDR0VjY4?=
 =?utf-8?B?MEFNaEZYRVljclQvc3ZackVKQ2VOcWdUYnNXa2ZQdnVJUFZrM1J4a3VXdjVr?=
 =?utf-8?B?bk1WT2ZHT0E1N0k0YnFRdVZlMjEycTkxZk9UTW1scC9JaldSMU9JWU1xZGhk?=
 =?utf-8?B?STdIOUg4OWZ1blAyd2ZyYkFTa1NqVTdiRzNuS1Nrelhoa1dBbmZmWlNQWGZt?=
 =?utf-8?B?OWVHWTV5dThyMkJxY1A4L3lvUzNBPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8116a352-ff7c-4911-4b5c-08dc437bcb88
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 16:36:55.5354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfYKU8y4S7GejWGkmEeezav2dIS2Aq6/UHcK0ePkq+C4bCZF9YJrrjmwE4WH+YHs0umJ3c531jGSsnFkLhiQzT1J7IC3gvQEsL1IAU0zezzGc7dRFTEZViSDGDUrIdUM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197051

Hi Yannick,

On 3/13/24 17:29, RODRIGUEZ Yannick wrote:
> Hi Quentin,
> 
> Thanks for your review.
> 
> Should i resend a patch with the modification your sugest . It's possible to just amend m'y patch ?
> 

For the bluetooth part of the suggestion, a separate patch would be 
welcome. Though it's a suggestion, just a "would be nice to have", 
you're not required per-se to do it for the wifi part to be merged (at 
least that's my opinion as a contributor).

I think it'd be good to send a new version of the patch with the small 
changes in the wording in the commit title and commit log, so you don't 
have to wait for the maintainers to confirm this is a required change.

Don't forget to add the v2 (well it's now v3 technically ;) ) to the 
patch, c.f. 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#taking-patch-review-into-account 
for how to do it.

> It's m'y first patch.
> 

Congratulations :) Wishing you (and us) many more to come!

https://docs.yoctoproject.org/contributor-guide/index.html should help 
you get started. If something isn't clear there (or wrong, or 
misleading, or outdated, etc...), let us know (or send a patch for the 
documentation :) ).

Cheers,
Quentin

