Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C90C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 14:22:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.119])
 by mx.groups.io with SMTP id smtpd.web11.19798.1713882117826460750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 07:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Rp8ZbhjP;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.119, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyQ3sWY7IlV0URjWEthunTWHo6relB5r1NdNiy484IR+vLiYDrEeiPtC9Wl2dXr6PepAUqov2z0SlEQuxiN4YW1a9WDhO2UNbFqVptS+/JEOzc2p3zg1iquzgA3HM9e4TsUqInJ0BfICFqhZgcalJ5Cjb2sCXMj2lTNnXQFuA5uFlJohQPYpLh3gzFxnXp8g1UXapFJ/ElnvrBKjsVSBYftCzRp56bT2y7TGKj0NFazFuNQGQee4Jenf613Hhpgb1uVCxjq0ohKAtLj0aN++S8eKgGaoF86cuqYnq70B/+GnBKL4DwoEbuhizJOTrUWZli73JiWTw2ia7IXbrIjiuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okHWzOGtz89D/OqhXjGdotiSj7fnxMWgKv1axRl9/ik=;
 b=nLMyogwp/IDQkP8JkW0uW9PL/f3bi70T7hVlo0h/Va6iv9WIjBA9SC4jq8ONfgXj1lAmSl4JgUepIBLcdVLswCGiNzCAJsOA/vq+5InqIoAh+QfaYA1Aw8F+l3sxbkd/R/DZNR42b1zRes2R+n1fXtktBXK38P8hHl1DsS9HgRbEKB8R7Iu6052O7Mkapw903mR+KkEDZ/x0slHjXvVhH0cD/ZkFW6mYMH8AryzL/p6hqND9nTTIx6vxEBx7Fc5miaYquE+7xyJvXbFORr4ZsqVn49Hbh86nG0378Pr9xWB3kGfv8c7scAhWZaFbT/jQogTNCP5IkKcU4CP0vRPH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okHWzOGtz89D/OqhXjGdotiSj7fnxMWgKv1axRl9/ik=;
 b=Rp8ZbhjPZ4LdTD+FyBeAp8FcqlW5crGQnuQAlW3Vm4pTIb05tac/HYFtLI/PZ2UFR+3QU7buc3C/Nz6jX5DoPG14WDJfNPBlPrT3pLjpCYVkmkjGfLUmlQMkr1WDBaZBhGmH5cp3LopJGEdUIAmlCAJ+lyxkXlezpua5A78vFpVg32a9HYwHVaQmcpiIBqnpZdY6vVpFQmHGXtuhjTGsPQN6PV6LYzAzfhbp5pQ0YfgUb/5U1nxHRnUyIODWh80N2J7eoCyN31Vzkjk5Qa+ZGhIJ/Bet+kr9zebupaG/kDAFf4GlOWZIzIPYCiZYFiR0EP5nQj9KtYQGpZN0wcah0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR04MB4833.eurprd04.prod.outlook.com (2603:10a6:208:c2::30)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 14:21:53 +0000
Received: from AM0PR04MB4833.eurprd04.prod.outlook.com
 ([fe80::70be:f731:f7e6:a785]) by AM0PR04MB4833.eurprd04.prod.outlook.com
 ([fe80::70be:f731:f7e6:a785%5]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 14:21:53 +0000
Message-ID: <673bb6bf-b5ed-4000-a7d2-996ee34d78c8@theobroma-systems.com>
Date: Tue, 23 Apr 2024 16:21:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] linux-firmware: Move Intel AC 9260 bluetooth firmware
 to a separate package
To: Iskander Amara <iskander.amara@theobroma-systems.com>,
 openembedded-core@lists.openembedded.org
Cc: iskander.amara.it@gmail.com
References: <20240423141842.172020-1-iskander.amara@theobroma-systems.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240423141842.172020-1-iskander.amara@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To AM0PR04MB4833.eurprd04.prod.outlook.com
 (2603:10a6:208:c2::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB4833:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddb0635-7b93-4d67-04f8-08dc63a0b95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QUpwRldETmE3VkVBSkFXc1BJNVJYLzU4d1BRcG5icTVGWGVwV0dzTDNCOUhk?=
 =?utf-8?B?cWlLaU9id0YyWm54ZWVrZnhhSzhQZzVuMDZ1Uzl5eHpxNE45NWJLb2lwL2dj?=
 =?utf-8?B?Qlo5N2x0M00xb2JyLzFzVm1ORnJwTkNuNEYxcjRPcmtnMS9pRCtZWmZwNzUz?=
 =?utf-8?B?YndSakJXQjRrR3pFeVIyQWVqamtOZUNmMmdvb2p5dXNnVG9VcE9kKzJUTFRJ?=
 =?utf-8?B?Zml0a25adGgybFpWOEtoczE1UGVrVDlXRlF4Qks0cmpQVG1HVE1lYnJMQmdQ?=
 =?utf-8?B?bjIrbUdNMThWK3NKMnN0YUozZUovVjVYalRCWnpweXJMQ2loUjdHcW80b2ha?=
 =?utf-8?B?UWx2TXFMSHNhNk04ZlA0QW1jVmlIcFJUa2VjY2cybVBWUHZYMDZ0MFQxZEtp?=
 =?utf-8?B?Tjk1N0o0M1ljTDh1QjNvajlsYVBIRXFyUDJodlRaM0xtZ2Z5eXBZcUJWMVZ3?=
 =?utf-8?B?MTl4YXMvRzU2aEVjQm5IelNMQWlIajY4Nkdxekt1NGdNWDZHdVp1Zk9uc2Nn?=
 =?utf-8?B?Tml1ZThtRGNDYU83QnFHVjEwOWNFZ0V3a0wzck5jZjhoaGRZUUpSUW1teHBY?=
 =?utf-8?B?ei9Va0JnZURKRTBoS3d0amEvcHoyUk1PbTYzWWZxYjc3RkhYdlM1WGJKUmta?=
 =?utf-8?B?MkY1VHUzMy80TFpjaDYrL0hPV1FyNVBiV2lNY3Q3TzRZVFEzR0tpVGREenJr?=
 =?utf-8?B?L1hiZVE4VjRuY3E5YnN0TFBrT0FVMDlGTWxMdFJmbXNvdWJNTGtDdmVTZ1Vx?=
 =?utf-8?B?UjNDYjVoUVlmanY0cnZDU1pyL2tRaTg0OW9Vemx6UWl2dGJrdFk5NmVmb3By?=
 =?utf-8?B?eW9BR1phSDY4NTJ2dXlneG42ZWJ3WkpoeU9PK1IzMk14Q1RVbUx2VTEyejg0?=
 =?utf-8?B?QkFYeVFqbDVodnFCZDR1S09rY1Y3UUpiZUlzNlpOY09icjRCUWxuV2xySmZa?=
 =?utf-8?B?dFlGNlcyZWFwZytDQ2dIRHpVLzNtYmNFMUgzQkZITlp2MmJwVGgzelAzLytv?=
 =?utf-8?B?WEx6K2pwU0dTanFzUXB6bjgxSHdVNnZuekRERE5pVENWeE4yS0llV29qeUxE?=
 =?utf-8?B?UFpBcmV5MHYrcVA5bFlKUTFUU0NNK0kwSklXWlZldEZNa1B5TENSeHA4Tk9s?=
 =?utf-8?B?TWFwMEkxZmVGTkdSUFRGQnFVMEdzbVVubW13N2tUbXEzdTZEcDUzUlZZRU5P?=
 =?utf-8?B?NzFyb2hqbDhvNFJ3M082M1VmcERmdDNsQUF6MHhGTjZ6UzVBUzYrSmw5Q3c4?=
 =?utf-8?B?Q0lSWjZuY0VpWkFnV0o4aGI1OWwwMVZ5YTIxQ0pPNG11cFpQbHFZUFNPWHFZ?=
 =?utf-8?B?VFRpUlpDSUhMbGFpY3dkU2RsZ0h5aE1KdllSM0dHSWIycUFEWkFXa0lPL1V0?=
 =?utf-8?B?bUZvUVlMai9Gd2MzYTdiVTZhVnRKb3U0Z0d3a05yMStDUDJ2aEtyR1d6YmhM?=
 =?utf-8?B?dWFmSmZUVWxHdmcwamdTWUU5WEg2WTdVWkJTYWFNblM1YWh5T1Bma09iVnQ0?=
 =?utf-8?B?bitka0R3c28rRXpKQVZIazA5aHpPRjliWkFKOWU0R2lVZnZOaHoxYm84M3hY?=
 =?utf-8?B?TmF0VU9FV0FDQjVtdUdNQ21GWWw0MGtNUkRWbS9BbHhlTmcwRGdDV1JKNFRp?=
 =?utf-8?B?YXVBTjA0SC96alhqWkFJUy9lM2lEbTZqUWNhcWJYTFk4NnB2bWJWQjU1STBn?=
 =?utf-8?B?MlEyS3BiL3BiUSs5bTliNlczTUZhOW9mL1RQQmU5ZGpYWWpEOTlmaFJRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGdaU3JLVVJIaFdHdVN3b0VIZ2NrVVFMZE1rNXcxMXFucXhjeGVQZEsxc0lW?=
 =?utf-8?B?ZzFGbVBlT0IxclFYd0l3UklpWFhJSWxJS3ZPWm9pUThWdmYrYjVlRkRHaWtB?=
 =?utf-8?B?a1JYSzYxeTVPZWtaYXZycWJ0eGNGN3VZU1JQVFZaeXhEUlZTVjUrY3dvREZP?=
 =?utf-8?B?a2lwNXNOa0xqSDVGNU9heE1BbSsybmdUWjBqZ0ZBYVV2TXoxOVNaaVNBdXp6?=
 =?utf-8?B?R1JDMmtQb0U2V3d3dkJMeDlIRElLTXV1UENtaTh1b0oweE5sUW1sSGRtTGFX?=
 =?utf-8?B?S2hVN1dLTDJuL2wxc0toa0dveXByZjZ0L2oyamQ4N0tDakxCQm1xNXMwMVI2?=
 =?utf-8?B?YmJ1K2p4YmcrQ0lwSGt4Y0NmN0dSV3MxMkhDUXV5bWJUajVUaC9NZ1k2NDFZ?=
 =?utf-8?B?WG9yV0ZWMzVKU0FpTSt2enJ1Y3R1bHJscW9sUklFOXRkT1dsMWVNTWdPbWZ0?=
 =?utf-8?B?bTFWdTQrZWJ6RmowTGlINjBPUTIrdUdnb3d6ZlVTS084T2Q5cmRIMG14UGZJ?=
 =?utf-8?B?WkVmbVRBcDdEcGxQbWlzUUVQdXFHbmVBQ2tCelFYWUVwdVVUeGtlMzFjbVJP?=
 =?utf-8?B?eGRUd2lSZW9Iazd6RkJOQVZ3dDBoSEs1ZXZMS1luUmhIbU5XM29jNiswWXVI?=
 =?utf-8?B?NmpqVWdoZHZGWENqVVFMRTg0RnJ0bGZqUHlIcjI0dnkzUXpuSXBEK3FjZitL?=
 =?utf-8?B?RDliQ1E4Zk01Slpqdk1nZWQ2RkRLcjFqQ3hWa014bCtENFUwdmJUOGdKUkRx?=
 =?utf-8?B?d2NyNE9DNkRqTDJ5clpYK1FIMVRoNFNpakM0ZTRzV0hUdUdRR21INS9GSDVQ?=
 =?utf-8?B?SWVWWm0ySmU0YVBhZ1VNQXpLckYwOGN3ZXl1dXVCUmc3RmUyWDN0WWpOMG9D?=
 =?utf-8?B?dDRQdnNKbUJLMUhtdEZ2S3h3Y0RHajY2MjNYZHBzT0taaldSNzArMTlnaUhS?=
 =?utf-8?B?S1plT0cvMEQrTnRZZExaRzJ2S1BUV2UrM1NQNytPVTlMbCtzM3RMRjVaODBz?=
 =?utf-8?B?a1NRTkxEbklWWFM5S1pIdkFQT0pXSjM0VDlwbTJ4QzExTXdCRUw0VTErVEpo?=
 =?utf-8?B?VFoxMkZ0aWwyWE5qbFlBYi9vc3VhQjdlRDFORVBrNlcxWkRJVERUeTd3WHdy?=
 =?utf-8?B?akFhUld5a0xYZ0RUNFk2aEhkKzVFMzNKckpnL21lakhIV2VodG9HdXYrNXVa?=
 =?utf-8?B?MVp2V0p2WHZDbkMzajZ3aXdHaHEyZVA2VVQrNXFsM0NQNWRYVXc3SWJzRm50?=
 =?utf-8?B?TURLZVRwSllEdm13RDBQVVZYTGxtMWZYQllLSExEREtvYmgwWm5HZnRQbGNU?=
 =?utf-8?B?aWhFc2tBdlR6amd1cDZGWmsrakxyV2JsclprMmFoS1J3eFgxQlhXMUxoMENN?=
 =?utf-8?B?bWN2WWt1KzJSQnh0dEw0OHhvWVh1cGVJQmNBTWhPeXBXRi9mSG5wejh2a1ZR?=
 =?utf-8?B?TW1FdFZXZlpjQjhMbitQQjI0S29Dd1lFKzVVNGlROHpJV0Z2WEpQYVVaRXJW?=
 =?utf-8?B?anJOT0F5eGdpN3lxK29IcjNIaDdUcUpaVEptZXgwU3MvKytYV0plZzhBczVW?=
 =?utf-8?B?QTN1a1loQ2pGaWdYNXl4czFsY0s0N0JRRjN0WXhMZzJocytNOGNBOFBNVjlS?=
 =?utf-8?B?TTl3eXZMditvOWt4OVJ3M1hxQlgvTjNSR1dvR3dGY2tvaml4MFkyQ25jTjFZ?=
 =?utf-8?B?dzV5RlBFMFh3WjBUcmpObGsvZ2pHc0UvdjlISlZBeURYTVV5djRyQUZvOUlE?=
 =?utf-8?B?UlVlcis1OUMxbzVSbmtRbzU3VjY3RVFQOGRzMHE1WWNQZzNTVVhDT0MwMW5P?=
 =?utf-8?B?cFZWSFFOVVlKK2NRQm5JK1NITXNZaEJHMjM0dXozcUhQWjJ1STlxbWkzbUli?=
 =?utf-8?B?L3ljcHA1UXFzNDdYeTBsVGpPcmRNcjhDbjlBby9KVXlGeUlKY3VpZGNTMVJT?=
 =?utf-8?B?eW10akJWNGRlc1NxU1lWUGpIQ0UyUWVFa3hlYysxMlgwYjZ5R0VMbS93aGlp?=
 =?utf-8?B?eUhQZkRKVzUva3NPNTNIakV6dGNZYW9FejhjMGVVem5wMTl4TS9TQXI2cGxZ?=
 =?utf-8?B?VGVLWTk0VXJwSTZYOHhrYVNKV3hYRXM4Q1BNblRML285ZzFxZ3l0bm9XNS9m?=
 =?utf-8?B?bTVKKzlBVFNkSFlBc0srS1JzVXdtb2tJaUlhN010MEtaUnYvSFZtTFV3UVBj?=
 =?utf-8?Q?2xPSakmNRtd63pniiw2dlhE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddb0635-7b93-4d67-04f8-08dc63a0b95c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 14:21:53.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6H3JO6yDgcaM8sXVBEgO5fu4ulQ+peICzvPxeCJJH4C+iEbPhdAzjBkfpbVZC/dshs5uKMcTgfSDheM7m09Qlh2wZ21EjWZxYWsaGmm96ST/jZpNsinUhwbOwMurBTv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 14:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198627

Hi Iskander,

On 4/23/24 16:18, Iskander Amara wrote:
> In order to use Bluetooth on Intel AC 9260, we need to select
> linux-firmware-ibt-misc package that brings a lot of fimw-
> ares that are, in most cases, irrelevant for the used hardware.
> 
> This adds a new package linux-firmware-ibt-18 that only includes
> the corresponding firmware for Intel AC 9260 bluetooth chips.
> 
> Below, the link to the commit that adds Intel AC 9260 firmwares in linux-
> firmware:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?h=20220610&id=97339b3a1d3bf3e4c40d679896a27a25fa83765f
> 
> Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Reviewed-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Thanks!
Quentin

