Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3606C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:18:36 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.83])
 by mx.groups.io with SMTP id smtpd.web10.57723.1741018709948389933
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hvzb/xqi;
 spf=pass (domain: cherry.de, ip: 40.107.249.83, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGP2hCNZttfUivp8YoZYChYSnA1NrW2ksLDhNiVpUz+uw5o7kO5V36dNGViJfpInrWi+9yd4KYLei3OU/sTIRNBAjDewQpwnBdZIEogpESC1Ke/bHRHXF3PnJz2VpYDY0mfYSZzlKVjysmPR6YWApWO5gg+ZSSB9ZE3bM6BFF69yDuOa1vFRlZZzMcHuYlAcFfP+F8h+7uagQyY9Y8bVSHvQs42Ap2/BDEYaDr3P4AovaoLxU7MZJo7NbOlIpb8tjvx1xLBn8F7HJK5QwUmguMSNfV0JIpZZFDWIB9orbW3JpT940NPU+H0o5ULWmMq9m6xL8gEXF/g/pEfQHsxrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySMYLrL9HRriWvjItZ+dEm/1DjHfF67Bl99d/IEm50E=;
 b=NYyoJsKTbK0BQ2Qj1Tw0NMlSlrtrH7/eWs/8h1pv0tROJXdNFz1JApfMDXWlkkUlqVR4pJQkPOAqYpe/zdKxtqgy/FJn/UnfPOokgBo7llLjtXs8CqFaCNAXeKKCNJyOhTM/AZtyQWtla0wJAInOveHAVKBaWZ7sidhSHA9156Co3PLf5hnNYvrRPjR4DmE2lsbq7jdxsqMpz6c4yh1dRW9kNbW/Y9+Ab7XaieHUS0SXo3aai3VpeeMPdypsIhpReEZPBEpM4rvtVu5c3VCyMM+3YZgG1Rl1uVSGDwYd2JeCI8MFZH5GXPx5exI3Ieh6vsJo8cVWNADLa4BfZjMLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySMYLrL9HRriWvjItZ+dEm/1DjHfF67Bl99d/IEm50E=;
 b=hvzb/xqid5k7RX4vzVfXrOPT8H/U7qQvhZxLGvrVGedDagi+ZUtAzW2zj6AQ7RFb2HBwSJxo8R/CN9NciEz5vu2VOzBBBfTMy+263KBveBeICaKXp8kO9voCmyOlWo9Ri3E01XVxO3T2H1nBTk85FsQxGNU0lEqSYVBERV1s6DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 16:18:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:18:26 +0000
Message-ID: <c33ab1f9-9235-4076-98bf-c8bd163c6464@cherry.de>
Date: Mon, 3 Mar 2025 17:18:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: alexis.cellier@smile.fr, openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
References: <20250303134038.102355-1-alexis.cellier@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250303134038.102355-1-alexis.cellier@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e9eda12-fc69-45b7-667b-08dd5a6f06dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVZtblFrcHlqZys3Wm95UFpRNm8vekxBeGJoSlJlZVpBOUtUUUZqdkhvWFVl?=
 =?utf-8?B?NENPQ3hNQnViU1Vtb2ZPMlFwQVA0em5FYzIxb0JHbXYybmMyTThubWRaeC8r?=
 =?utf-8?B?ZFE2V1RrUGhNK0d5dk5hY05CemhDYnJEOUcyWkxBL1FJWXlVSnh1bmZ1Mnpz?=
 =?utf-8?B?Wk1sUUxtTEpOYzVYYjhFWVN1YlNVcEZwMUdDN1lsQUhnS1FTaTFWSFlBZ1U5?=
 =?utf-8?B?c250aytFYVJqNEF2OVh6S1praWl1STBUSGRmc0xxaHRSbTNYMWtXVExvNldH?=
 =?utf-8?B?L0srYXArdFplNzYwakJYTFB4U0FPa0FLTG1ESS9QL09Zc1JtdU0zSm1oaE40?=
 =?utf-8?B?ZjliWDJReURGR05lYmR0NjVHT2VZVkhaa3N3SWgyTW4zVTBLRWNLcm9BaExK?=
 =?utf-8?B?Mk40SUpyaTNCZlpEU000MmdKWlJpWS9kWTNQenovaUZCdGtxYnkxOGczaWQx?=
 =?utf-8?B?MVZ0SUVzMmNERGFoTGp4S0h3bFdCeWlhREpmRmpqZm5jU29vWk5mMVdlOHY5?=
 =?utf-8?B?QUpNVjc0aDNJcVUxY2E3V0swamdHY1JQeVdzTzVVMFVJRFF1LzFBMjE2bnFX?=
 =?utf-8?B?eUtvSG1GazZpWUdIdjlUaGUyanVUMy8yUjdQdWE1c0swOG0wYTVSdENUWWJT?=
 =?utf-8?B?TVo5cE1rd0ZSSVpJT2crWEUrK1Y4c0lZTmlZT0RSSlBTZXA4R25lZ09qWXFx?=
 =?utf-8?B?dFRWYTZ0bGhVUVk2ZUswQm5qdEpNT1hQYVpBa0g1cmJ2SDFvR1ZlZE15aUFO?=
 =?utf-8?B?K0FaV0I2UlBvUDRLR2NUcE5mZVRsNVFhbmZYbFQ0UkFWTWR0VUE3UzZuMEY4?=
 =?utf-8?B?YUx5WG5ubE1nOURBc0pqSXNDdGZteDRaN1ZQUDlKVGNyRG8xSjJyd2VnUFdV?=
 =?utf-8?B?WnQ2VlVPOU5nVGZ4elo0Zzk0MzMvVWgxQURrSEVDTnoxU3dBaGtxQlJBMURQ?=
 =?utf-8?B?MUtCVmltaEtLZWsvK2VqYW5VdFJqUERKclhya3NpL1BNOVI4M2RCZGtYVVZ5?=
 =?utf-8?B?WGJNMmFGZWp3Q1JsbVp4cUJFQWR6d2VxTHM1VXRjTGkwOVBiQmlNMmp5T1Z6?=
 =?utf-8?B?NVJiZVMyNkYyR3luZ0ZRSDFUYlEzRWF5Y0d5clVvVWhsWndheGdKWWt3TkVH?=
 =?utf-8?B?a2tNcm1mR1pKaFh1YStzREhWNnZtWXV5K3BWU2pJSDh5TWh5cnFmOFc5NWl5?=
 =?utf-8?B?aGNIMC9yKzA1MjMwSmZVa2hsak0wd2VhS1NVaUNFRUxoYjJXdjUrV1BkcG9n?=
 =?utf-8?B?dTZuNkMvd3cvMHY4eko3Ti9rZ2ZpNEQzZlJSdjZXdmRMdS8wZmQ2ZWdROXc4?=
 =?utf-8?B?Z0NZVlNwZmY4RWo3SnRsVHd1VjhXa0JtSzFRQkNzNHRYUTJsQ2JoYlRtVTZU?=
 =?utf-8?B?ZnRqY3lwS3BZdThYYUZqT3Z0TE9JODlZSmRCVE9keStHdGNUL0pTK3o0cWNZ?=
 =?utf-8?B?MlpDY2lRaG9iMlYrdTgrMEdhSlJma2NSQXNGNE1ZQ056OWgwaWxGb0swZXFx?=
 =?utf-8?B?T1VwT3NCYXYrWTFYMWdJNlBiblBBcmhqaFhoS3MyYWdrdllHK3haSXpiWlBx?=
 =?utf-8?B?TFkrbXpacHBvUFJSaUlVQ3FZS3pDYnJjQ0RGMEZ6QldWak1CZU9kT3hKd3Yx?=
 =?utf-8?B?L1JFWEJTVVQvZ1VmZStxVG9QU25IaVJ4OXhBbXFEOUMvSHpsUFVCaEFPcHhZ?=
 =?utf-8?B?YVU5TzZ5N1hZZ3JVbjBNYUlJT1h2MW1hcVZ5bW5ISmNQb0JNYU1ZNlFlcmpM?=
 =?utf-8?B?Y1pya3IzcnNmT1VjV1FUb25TbVNkLy95WkltM1BVU1NPeUV2NG1VZ3VDWUtS?=
 =?utf-8?B?cEV6OG14Ky9PaGhQU3k1YmJoMWxLSjN5L0RFcVdXTE9ka09PMUNyZzNEdVNB?=
 =?utf-8?Q?qNrOl6L61Bylj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cVcyc2dRcVJLWDYraUhMU0Rha1hIWWdOeXdzMGtvY25hQkpObFIzY3cvVUJH?=
 =?utf-8?B?YUJ6S2JiclBJTTBLZndJYkVVWWxUYkxlQk9vbnhLZVJCRXVnTWtKOFNseG9I?=
 =?utf-8?B?TXFneGkrSU05R2dXT09GT0VCdjIrL2lXenZNSTNqbWtMV2FBVVFOODJRbUs1?=
 =?utf-8?B?YWJnWTBqR3RXSmNtQ094bENjLzhiaVlvd1BteG1WMFNmcDgwNCtiU2t2V09z?=
 =?utf-8?B?VUhqdTFtTXc0cG05V0w5TWlRWXJOMGZzWnFOQ08vOUszWk9uZUZaYnNhTW9R?=
 =?utf-8?B?akJOUEE0dEZ3UU9NNFlkU05scTdkUGhWMkZZWkRlVDJWa0dyV0VDNUxEMFFy?=
 =?utf-8?B?UDdidnNYWUIrUk5EUjZCNGd5OHB1bW9sR2gzQWNKTE1Qbmx2dnVXaGl0UmlI?=
 =?utf-8?B?VS9HWDQ5dlpBTW5nTlJjblBQckRjRGNqbzZGNGZycGlYZjluOXpYN0dZazZP?=
 =?utf-8?B?YnExWnRiamNYbzI0NlN4aXRTY1pNLzVVeG5yZFRLNmFmS0F2VWdKVjdzekxB?=
 =?utf-8?B?dnhmc0dzMDIrZkxldXAzQ2JjcG9UcWlrTjZsTXpKYXNnR24xaWxOamYxbnZC?=
 =?utf-8?B?UkVwZ2NXKzFkbGhjNkNpZ2JRaXFxeVFQbzJUMzdMMEFBaWd6bVFhNXVlQmRP?=
 =?utf-8?B?dDZOOGc5c1MzOVlNL2xZSkJSWXYxWVE0cGdZSlFGWmE1V3RlZGpaaVNFYk9n?=
 =?utf-8?B?UG1EUlRrMkxpbEQ5YXZiWVdoM1F6c2pqQU0yYVMrMVM2NEFyK0taTk1YbjFM?=
 =?utf-8?B?bmZPN3kzN2dKdTl3NHpMMVJTY1ErTG8vNGNKQ0JDNmhMYzJ2cXUxUk9nZDRQ?=
 =?utf-8?B?NloxVWk4WW5vS2pPbUlUZzFiOFZJR25pTm0vTWRHSnR5dG5FUTZqVCtnSzlK?=
 =?utf-8?B?VFhXQ2VqaDFkT1BPZk1mZnlOMXh3NHJBcDh3ZmE1UkxBUmE1dS8rVDRLV2FR?=
 =?utf-8?B?OFgvczdwWGJxNWJrYll1THRjSUxXelN5Uzc0S1RMb1FNOGxvd1dzcGhZRDVK?=
 =?utf-8?B?akVQQ0NtdlVEakZWdUFPU3lORzNiQnRzalpEY2Fod2cyd00vMGxkSjRPVFVR?=
 =?utf-8?B?TmsyNHprV2lkR1htUjA4SWtLeVgzclpxYnBiWlgwcmdtS1p1Zkk0OWZXdWZK?=
 =?utf-8?B?U3hRSTdkcHVoYk9ROTlUT1BxZWwrQ1p1aEx2WjdkK3VLT3lSWDhTcUpSMFNE?=
 =?utf-8?B?bjFWL091MWhqNkw4Q280NlVGQURUN20rR1NqQWRmYUdGODNWS0ZFOVpROU0z?=
 =?utf-8?B?dDNHeWJPbkRLYUF0S1BJN2s2MHFNWVF5clJIWVcwUEVBN045Qm00VTFSWlFO?=
 =?utf-8?B?R1p2LzA4elN6UUpVNEZrbnUxUHc4dkxTWHlYZ3FOTUhjbTFYMFM3NlNDZ2Nz?=
 =?utf-8?B?K1BzeTFVZ1haUWh3SldpSXdLd2xxdDdBZG04aHA4UjJZRWlaU3VnWHN4bE4x?=
 =?utf-8?B?UGlROElzRnNNMXQxeFlmMm9id1RucDJUVy9XZEdnb1ZDOHNyZW9xYTVzVm1H?=
 =?utf-8?B?T3c1R2dzcWxac3VyRUFYMmpIWnR0VGhzMk5ZV1pWdStZbm0zcTlncWNiL3Yv?=
 =?utf-8?B?Ump0bFdpcTFmcGJRbGQwMnBEK2J6N2Yrai9TVG9oRGhHWEtVOUJiZGwvdmFW?=
 =?utf-8?B?Wm5XSm1nTDlqSmRDcy9YazljeDc0eDNOazBNcWpYMjkreVNGYnVBK0FZY1hm?=
 =?utf-8?B?b0lCS3RqcEE3RHVkeVVUUER2djNmTXNUVldZekhzeGIzdVZxV2QrV3BVQWVx?=
 =?utf-8?B?UlBKU1NLckdqRmkvR3ZEMk5Ic2JpY2x3dVNYMzh3eGxZVmJpczJOcGZDTGVl?=
 =?utf-8?B?WHFRaThpTldVSnFGMlR3MWdYMzNnOXF4TzJUS0lVUjUxV2UyK09yTFAvU05D?=
 =?utf-8?B?M0E5YS9oTUdJSWJEZ3o0MEVOc281K3pBb3d3V2o1MzdYQVB0c2krZENkSHlN?=
 =?utf-8?B?ZXJsbFpNalN2cVptVzNiYmIxL1NGT3p4UVkvWm5uRmhON0tnRDRIb0dBK3FB?=
 =?utf-8?B?aXg4OWo0NjUyeE5aOXVZcGp0OFpiMUJKZzlDa3g4cGpGbTR2bHFmbHBxc1ZS?=
 =?utf-8?B?NUhUb3ZFNFZWNENVcGhDR1dIUGFGdCs4eHlXaklHbklSNHZjRkdCM0NKRFky?=
 =?utf-8?B?Y3ErR0VzbktsTWpzaXdXbkpoOW8zWWp5TEV3NFlvbHFaSzd6MXNRa3ZiR3gz?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9eda12-fc69-45b7-667b-08dd5a6f06dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:18:26.0808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFE8bU8reiuJY6HgWf/m9+2iFUnRXNKbFRkoMTWhMG4ZgDSgYgurzQ1HXjZ1QDzuaDRndD/127Ca5g5+Pf6JgbausCV6VHkH3gtYvis/YwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212218

Hi Alexis,

On 3/3/25 2:40 PM, Alexis Cellier via lists.openembedded.org wrote:
> [You don't often get email from alexis.cellier=smile.fr@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The libpcre2 is now dlopen'ed, so it is not automatically added to the
> DEPENDS anymore. Add it to the RRECOMMENDS list.

Should read RDEPENDS I believe instead of DEPENDS, with the automagic 
mechanism that detects shlib dependencies and insert their packages if 
the recipe building those packages is part of DEPENDS?

Also, why adding to RRECOMMENDS and not RDEPENDS?

Cheers,
Quentin

