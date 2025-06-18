Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48041C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:07:55 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.6])
 by mx.groups.io with SMTP id smtpd.web11.2869.1750237668667541025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Xrg0mB7i;
 spf=pass (domain: cherry.de, ip: 52.101.65.6, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snKfp5dRTMUMSUsbuemfwwyINu8FYPgOIE3dKcPk9DN89G6O6PK4RRQ9MrsW2IrlLiMaRGW78SUBU2I/CTzFew1pqjl2mXZg7wZjTNtExqc1jMIpwrTMYTo0TUpOBb4zch9sstf4FQWRqYdUwbNjExIMOyA/urRjPh3ozfJ0FbCD04TgBPN29MVDe5sG5Wp7ndpQZWUOagjn0VZLeKsZ5MU7PeNpIL+KQLDrS/uLOx8tCY0Yw3luX/N05cvMpExUsjrWShxzciePV7XCCClIbOI6KDximaXFKeonsI7cIQl0bF+G61cuuh5Ac9aQYn90H6qQ/5xPSo8IAqMaJC138Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0p1VI3qcnI+i6FOE6FI17rHM2eFbIX/RFMkVWGdogQ=;
 b=Hs8v1Ua61H/WjW7RPOMgja0WQJ5K4gYRCg8JMD7FkwpUOhIagvcJKYObolQDENLtXBomNzliDLwwcBDWWnnnuiTCYt4sasXBkElXksJ8TPfPmAvuusUBJ/j+8wMPa/gOLPTYrBIdo9LVK1PtZd08PeANcU0nn1oqXxMAB4u12mvN4BrS9MSVF/EvrmN8NS6sGnYC3fwpbbl19MJ6QI5PJQnVYCEGQ6OafgRbT4DcrYzi1vMZE4cIT5sgmmKNcZIFBSq8mR+/JAVNyZTpIpmTO3jJnaibyJ9xlMhqEAzB2SbfdF5N4xDozKe3ltBdEzO6A1dV7UucA+/XhBFbeLuGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0p1VI3qcnI+i6FOE6FI17rHM2eFbIX/RFMkVWGdogQ=;
 b=Xrg0mB7iCJ4sUf8FxKnumO/SDrvggiXwPFVW/fRqh/tq99A9BKyqaMhu6afJgWNZn6Ep//8iRBwxlDfCKjWIfeg3H6raLTX0HQqAJBX+GP0BWKIj5P/bJTYot07O3kUbWoplN3BvARqZ2AkrrPDv2+0U1xRf0p9yKAZG+VfahUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10162.eurprd04.prod.outlook.com (2603:10a6:800:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 09:07:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 09:07:37 +0000
Message-ID: <805efa18-5a8c-435f-af91-737618a1c16f@cherry.de>
Date: Wed, 18 Jun 2025 11:07:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] packagegroup-base: fix override syntax
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
References: <20250615191535.1261591-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250615191535.1261591-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10162:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f954de-67f6-4516-0fcd-08ddae4791f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3cxU3hHbE1XQ1EzRFA5NWR0ckx3NHJteGhCTkorbGdIZWd3ckJNU01FWERj?=
 =?utf-8?B?NW5DQzFDcjRZUU4xS09YbDF5QW1WcXl1OW1MQmZ6aXJ5R2xONERZZVg4YS96?=
 =?utf-8?B?WGswaXZQc1lweVhHM25wZFZEKzF6ck55aXI0bW0xUXNxYm0rSXhMTmluUW9O?=
 =?utf-8?B?bFl3SnhabHYvS1ppaU5UaGRxVGRlVGxueGNINUVIK3VvdTM0RG5ETFMxYmNk?=
 =?utf-8?B?NG5PVFNsdy9YZTJKa0FFZTVxS2NBc255b2orbm8zcE9DcC8xYmdvM1hlRjNN?=
 =?utf-8?B?T0RRRC94ckRqYXdCYTZMZG0xT3JHL3ZTRndWTUY0TVdkYVNBdUs0Kzl6S2Jt?=
 =?utf-8?B?OGFoSVJHYy9CMGcyOFhvSy9vZUplZFhBZG0relIyWTl1RUNlb3hLdlZ6NXFz?=
 =?utf-8?B?dVNxUDhkazJNUjBqNDNNMTFSRGpPbEhvSkRjYjl1YnRGbTI0NC9IWm05cnRs?=
 =?utf-8?B?UWhvMEw2OW83SzB5V2pVNkZvTDJFVnl5RGUrTjJxT1B4RklzaVo2SVlaWDMy?=
 =?utf-8?B?WUlBVWI3ZWJEZFc2OGQ0SlVnREU2WHpzeGJvb04rcldzeXpSY1AvWFBNTU9Y?=
 =?utf-8?B?OU5hUDh1NVRTdlFjT2JVM2dlRWhmby9hNENsSkM1cWlyN2VTMlhzYU1la0Q4?=
 =?utf-8?B?TnY3YVRMcmFjVHFlM0R5U2hZTWhVV0V2eFhvMlBwbkxaQUowaXRqa1NDS29Q?=
 =?utf-8?B?WlhaWlhCeDFwNVZidCtwMW8xN20wa3RaNUdvZktST3MyMUIyYVo2U2VwYUU5?=
 =?utf-8?B?ckhEaUFQUWdXcVB0dlRDNWZMSDZySEhwdHJITkFsbU1mZ2JNakhRMHAycjZH?=
 =?utf-8?B?dDNaNGl1RE04aFlNOEJFT0VIblZBUC9XYXIrOVJ4RVRNR0dyUkNtK3VMdVNV?=
 =?utf-8?B?bzUvL1QwTzk4ZlVlckZaRk9IWFpxQ3lsMlZKNkdOb3MrejhUcUVyODdwNVI2?=
 =?utf-8?B?ai9ldmRxMzIzeFdRNlVkZ1NEL0Q3OGRLTkk5M2JJbkFCYStsZHk0cHBFUTdH?=
 =?utf-8?B?NHZWYnN0M3c5Q3J6cWE3VkgyTzIySWd3NDJ1c0VrWmd4dmdVamRpZTFBY1Q5?=
 =?utf-8?B?MGYwc2JQNUdLalk3MzB1cFMvQ3ptenlHbEMvKzJhNFdOcVZyb2dxckRGVFg3?=
 =?utf-8?B?YlMwWmdjNDNIS0ZsNHZ6a051dUM3K3JHT09HYUFuTDFKT3V6akRkSU1YcVN4?=
 =?utf-8?B?YmpMR3B5WEp3R213MHRqWW5WMDJ2SDRqKzFrcWlpUm5pcUtTRjg4Sk0vQm5E?=
 =?utf-8?B?bzB2VGVBR2liNDY0MFBtb0JMdjZ6cW10Q0NnWDkzdVhlNjdzT3RUdUI1aEF0?=
 =?utf-8?B?TVg2a29UdW0xZFpORUVCK015RFdYQ1p6STR3ZHlCVlppejRkeU5vVUtSVXYv?=
 =?utf-8?B?d3FnUVFuVEJQV1VHNUhSanROUjU3aXJZUmlRcVNOTDBNK2I3QUdyVTQ5d1Vl?=
 =?utf-8?B?OHcwVFVYUW5xZGl2SEpGVzF2MFdJWlhTcWxrOVplOFNSTW90TlFTVFdiMnZB?=
 =?utf-8?B?RHNhRjZpVnBxelRVUjJJa0RqU0gxZVFNTlhjVk5zUUVPclYrbFZYZzAwVGpK?=
 =?utf-8?B?eDZZSXA0ZEVaQ0owRk5PQVBXNXQ0SVVGRlBCVkdUcXRYTHA4NHRMMFQ4Ujhr?=
 =?utf-8?B?MTZsUlR2RmwvK2hPQUVNMFBpU2x0ckhsclVITDFCYloxamdtcmZvVW9RbzJs?=
 =?utf-8?B?SlZVbmhMdk1zQ21ZeFc3ZlhscXV5cEpLdThFWnM3b2xrMnU2a3lrcllBcHZD?=
 =?utf-8?B?aHFidjZ6SWkvZVhpOU51VDZQdjU1RmxiNTdlbEhJUy81SVUrRjFaSitodGRq?=
 =?utf-8?B?dW1hYmx0M3ZUd0JzcnZsZzZFUCtPK0dlVEEzRDE4bkdQMFNhdjNzMlVSTytX?=
 =?utf-8?B?RjE3S0tuS1NUVmU4eXNwMENJd0tJSXhjQTFXdUV4RURKZWZkTGt3NGQySFBI?=
 =?utf-8?Q?KeR3enkIDNU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGNXNitBQUlKTHJWcmZMY2tEeW9mQXBhVUVGTWc1TlYwVGIySE1Sc29NdHp2?=
 =?utf-8?B?THlBL3pYV0taNEo1OGJwNnNIa2ZlSUZkMFlPK0xUYWpxelVYaXc5djE5MDFa?=
 =?utf-8?B?VzFiSk9tQ25HZUlqUjlCZEh3VjJ6cUVWT2cyOVVxMHg1K2Nkb1ByaDViekpu?=
 =?utf-8?B?OVl3UXVhZzd2aytVbmVaK1N0SWJHOEpNUG8wNzZMY1ZMSGxxVVFYaXlyL1hq?=
 =?utf-8?B?M0prSGRGTHRvenVHVGZoOWhlbzJwNmduV2F3VTB4MU1iNnVEcDNmUExpbVBM?=
 =?utf-8?B?K0ZXOVNYaGxBVHVmOGp1d3A5RXVtOGdhTEVtRVNxSnRnS2J6QmE5ek5rNHBP?=
 =?utf-8?B?ZUxUaTc4ay9HSVMyRWIvMEcwUUxJc3M2R1JXbFNzN1B0UnFVMjRJODFqbE5L?=
 =?utf-8?B?ZUtUd0lYVkZOZ2hielZ2Zk9hUW1zdXZzQ0t1ZVFPSHhTZmYzeWp1Yi9KcjJZ?=
 =?utf-8?B?NE1nODh1ZWF3TlI1WFlXMWQySnZkendYeEMwUTZpaUhjemVwQVRkUlB6SUND?=
 =?utf-8?B?T3hST0Nza3ZERHVOL1VOZGI4SFp4TFF6L2RKS2o0SmE2SDVtQmEvMjVHejRF?=
 =?utf-8?B?NldjVWRONEIzTUV6N25oaUU3Y3pRamVhRythL0tCc1BKRkFhaW1sV091M2dR?=
 =?utf-8?B?YTRBdHYzQTgrcEk1QmpqSU9tR1lrMitXb1BjY3ZrVm54MVVjMU5Ibjh2R2Vv?=
 =?utf-8?B?aGJNVXBGQmY5eXA3VW1zMkNpTWJnVm9UbFptUFkzdnRPT1c1Q2p2YWJzVlJY?=
 =?utf-8?B?WGUwTnhNWUo2b2lQSDJWdmNaUnJ1UW92cFQwSVBlTkg2MWRIMDhodnZmeTZx?=
 =?utf-8?B?UFZwb1RyYk1VWFQ3TXpLNkJielZSZVFHRlcyNlBJRTc4MVRoSnJzbWpabEh0?=
 =?utf-8?B?OVFTZTQ4cXdIM2F4WmQ2MnF1MTZDYXNWU0xiYmpCNVBjd0kxdGtUMXJFUkFS?=
 =?utf-8?B?SmJ0cXZPYzZHUlRhdmZxeG9hd3Qrb1J1TE94T1VSaEQ3ckJuYVQrRndIaFgx?=
 =?utf-8?B?Tm0yL0NNOFAzcGszK3d4bnl0cGxhTDRHTWcrbmdYQkNFWG14MUhQeUM4TEFK?=
 =?utf-8?B?SXZ1TUpFNHlLOG90K2xIRjJmdUpGU3lhVU1rK0Q2eG9IQzdDQzlHMDNJaE5v?=
 =?utf-8?B?S2R0YXg1eFZBU0UyMGxDVno5RHg5ZjgvNTV4dFVFZ3lSZ1FPUG1tZ3BJVXlI?=
 =?utf-8?B?ZkJsaVlFeS9ySEVBUHgwQTBzTllobFZkc09sRWs1MmdObHpwcTNGcFRMTGFL?=
 =?utf-8?B?T2xnZ2xRMHFEN3BvSWxMN1RwZTVTTVNZU1pWVDZUTUJkeFFXeC94OE9vaUNJ?=
 =?utf-8?B?NnA4Vko3K2Y4TDFUWTFOTHR5TXhET2ZieDA5Z1pVVDJoVTVrOWZjZUdyeXlH?=
 =?utf-8?B?bVNzOVZCMXg1STZkT2V2MmNaQlUvaXdacG8zZUNNQU5zb21paWhPQ0lwaU9o?=
 =?utf-8?B?K2pnc3BkNHprZVVYMStLdmxXRk8yNG5IUFRWUU1iY2dFL2t4UXBENGdUMFRY?=
 =?utf-8?B?SFppL3VUaDhkdHdZVjVvRkpBWTRqbFpDeVkwTmh6M1drMjUxN2xNNWZJZ3BI?=
 =?utf-8?B?L0VjZmhOTElhUlQ3am1IdEpzUHBUK1FBTFQzUFFCaWR2MW9pT2twc01GTmMx?=
 =?utf-8?B?eUsvK0pEK0YxWmRveElTT28xUkhJZUdqK0s2QUZWZ0dPQ2JIV1lheWE0UGdl?=
 =?utf-8?B?T0NaZ25YSkI1Qkh0aVl4elMxYTVTM1MxYWtyNDNRbERwUnVsUkxieVR1dXNE?=
 =?utf-8?B?RWhzNDFVMlMxWjJuOW5RbmkxcmtmeEI2TEtvSTlBemZudVNJU0hxbEgySmFv?=
 =?utf-8?B?eXNpcHRJeU52ZHFqS3I3NDUrNnFBdEpFdFNWRjlER21UY2NDYTV6RHMwRXBC?=
 =?utf-8?B?RGIrVlJEaVJKaTNqRU1QWmcveUFDYWZ5bkwrOFNzb0JaeXZTV283d0Npc0ZJ?=
 =?utf-8?B?cDlQdWR4K21rQWdJZTZ4YUo1RE04aGtLcW5hZGM3YVB3bndsVHVyYmttTitU?=
 =?utf-8?B?Q2RrQzl3TUs5a0ZHSmRPcnJ1eUllRFVHaDFXdnNBVytZd25NclN4bzlvc2ZI?=
 =?utf-8?B?NE5vdWpHR2JBY25iaUVWY2ZEakw3aUFsTFVwNjVVMGx4VkRKTU5OcTltRGRy?=
 =?utf-8?B?UnpjYXR2eDByTnErbFBHanhUOHZodHJCV1pqbmxJSWJHbXdCSzFHSjI3aEc1?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f954de-67f6-4516-0fcd-08ddae4791f5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:07:37.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9leO53PDzKcBwesVt0ljHhzpIVayV0hmTNdguVIfHOI+YLU0k9qE195VT5GfdkgaucJ7+WUqV8uGEmBMLscY1IAYdmhyAdNjWXJnwgvNKhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218983

Hi Adrian,

On 6/15/25 9:15 PM, Adrian Freihofer via lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Looks like one more left over from the override syntax change.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index cb9d1f07af5..2e051dba33d 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -119,7 +119,7 @@ python __anonymous () {
>   # packages added by distribution
>   #
>   SUMMARY:packagegroup-distro-base = "${DISTRO} extras"
> -DEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"
> +DEPENDS:packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"

I'm not sure this is actually doing anything?

Nothing sets DISTRO_EXTRA_DEPENDS in poky, it's also not documented.

This line was added 18 years ago during a git sync with svn 
(3e5ee5acdca51af57c7b6ccd2136f7b548a80293) so history is lost sadly.

DEPENDS:recipe-name isnt' even a valid override as far as i know (it 
should be pn-recipe-name) and even if it was, what would be the point, 
we already are in the recipe so there's no need for an override. The 
RDEPENDS overrides make sense because it applies for the package and not 
recipe (and most recipes have the main package named after the recipe).

So I think we should simply remove this line?

Cheers,
Quentin

