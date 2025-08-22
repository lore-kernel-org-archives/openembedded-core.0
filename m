Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE2FCA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 16:36:42 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.20])
 by mx.groups.io with SMTP id smtpd.web10.508.1755880595906970917
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 09:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=FXGx1wBC;
 spf=pass (domain: cherry.de, ip: 40.107.162.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDqov9hPjdixt3BF1qLK6gtfr1tN/wIskorxIWsGQE6kOMJeiuQWJ8IpXi0nula1wzWYX6DAae3FTs91yo+AHpnBD1th6oT737LO3+wBElyQeTnNSVoJJ9BsEu8dBIhSsvuD0i9vY4kvWeQExRbfcmv7lesazDeEuJjdMn1VZyTCb4hcHCME3sB8ozg6WkEBLPdGwLGbwG+KtmRfLN2t9IAEmTpMKBPkf+WxAn2IhELhQua4oBKK66LeemoNAFsDvLPv14SdtDQS7afHFg9HazeTV5h5sPgK73HuUixPT4B/+zD3Y/88hglqmglEuWUW/8aZ6q1jZJmMe8txfGCQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gn2gjM6+L9VEIV6AF9Grov7qi5usKAYxP8+6RWukt90=;
 b=yElclOfeZCpzqCXTv/5HqK1XUmj2WX4BUqfdk2d+QEux0TvEbDwieV2IzVINfDv8XvzOCt7rMgr7mDRzPzK85+9r8ZYKgZEqXnZ82lI4yg2D9W76Qb+Iu1VDPNGC4GYA1nmaklSA6Zd+OhBaEzn51gt3HjBPeKWZZfAB01B8hcq8GsEAV+qk/XW/h7xC9PCUHnE/in9tFWkw5oIGmEDvZWS8uNHZh53soLZYb9fggCCIcObPvvXzElRYYC+zJKf71y7lLCPclXxx7/K666foB+qK7YHLdwfEU8tvAy1YxWjaZ3uaIUKiColtbyFnLl6kJ56g+z8ciiJnNBLj2jTSMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gn2gjM6+L9VEIV6AF9Grov7qi5usKAYxP8+6RWukt90=;
 b=FXGx1wBCXNtV+4iCWYjlE18/c4ZVd0xDDOwoj54hUn8YXULxbcf0qgX7Vo+jGFCquoJ5h5FWP4OvJTVwt4yIAG8f7kdL3Sidszz/Bupt4vrdIpLacawcQW2S6jMNYIl06rYrAG0AW2foz6uJEZtl1BWfUDNNhpA7wRMH9zDqF80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 16:36:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 16:36:30 +0000
Message-ID: <eb12869f-c55c-4b5c-b1c3-bb7cc6b7ec98@cherry.de>
Date: Fri, 22 Aug 2025 18:36:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] mesa: use simpler mesa-tools-native recipe as
 dependency for libclc
To: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <20250822-mesa-libclc-panfrost-v6-12-393cf47e2fa2@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250822-mesa-libclc-panfrost-v6-12-393cf47e2fa2@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: ca70d487-5398-45a9-1200-08dde19a0c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2VyTUlMSW8yZ2RmSCtFaXpXSFREMWJNUmRGZFhzbDlPRVZDVGlNbUJoencz?=
 =?utf-8?B?dk51SWJ2MDJ3eFFTVjFWcHk1OEpJcnRoMFBCdENTR05kdkd5RnF0QXRKZ1Jp?=
 =?utf-8?B?aUU4dkVDN0dHUzZUOG5ZVGJiT2JkVk1CQTZnOU1ud0o3TGJxY2xiYW9CWXJP?=
 =?utf-8?B?LzJPa1VsekgrNTBFUUxGdk16R24wR2F4dTk2d1hUKy8xRTZ2blVaTDhNcDBP?=
 =?utf-8?B?aG1UeVhTN3AwSzZIQkdIVnF5VWNIMW5UbXh2L0lWOGJwZlNtN1MyRjkrNldY?=
 =?utf-8?B?RytUZWlsRkluSTdHcHhEL1RHeEhmaHM3UDRjaUdFUUZXeGhoY0RVOWxwSm1o?=
 =?utf-8?B?Q0c0REFSYnhxM3VsQWRwNmtUWGtzM0VtSE80Z2FYQmQzZTBOMFNZS05VWVhI?=
 =?utf-8?B?MGVxaW1xWE1USXgvUDB5aWgwY1NhVTVqU09COHkxV1ZZYlc4bE8wRkI5QnpH?=
 =?utf-8?B?QUF2VkNHM1VqSWlrdjdwMHJJUk1zU0pBcUZtM090WnhRTFE3Tkp5blZlOCtk?=
 =?utf-8?B?N3FlL3QyRUd3c1Y3TmNYRnFYek40Wm42TmYrYVpMUHJGV01pM0JYdXBaa2xk?=
 =?utf-8?B?VWdycWNKRVkzeDFZMXF2UmJhY21seWRuWDFrcmo2N1MyVkhlOFg2Q000SmZL?=
 =?utf-8?B?OURjb3BiekNHdTZzSzdBZXIvbW9vRVkrc2lwajBaVXJvRThZRnljanREaG9o?=
 =?utf-8?B?VjRHVnU3aFRKckpvYXpnSmZYNEhFZnZwbWJoVmx5d1Q0SE4yYkxhczJRbHlq?=
 =?utf-8?B?RzQ5dVg0N2ZJdDNZcVdUOG1sQWZaS3RmVmdneTl6OW1EYU1HS0o5UlUycXAy?=
 =?utf-8?B?ZTdWMXhpdktIVllyY1V4OUk2a2pJTE85Wit6UVErVW12RGZoanJPK0IyZkZW?=
 =?utf-8?B?cEl1SzlVVlZSUjcrRVlmUS9HazdMWWxLMGkyTGFwbXpSMHV6MFJZMjRSOHBB?=
 =?utf-8?B?S2MxaEpaU3VMZ2FPT2JKQlVubXM1eCtkZC8wbUJYVlhoL0daR2JNOVVpMjhL?=
 =?utf-8?B?UEUyU0VYQWhPazkzNjVUSWRHTVBTTXdQRm9IV0JPbkdscC8vWjFkWkJVNkVx?=
 =?utf-8?B?TGljdDhKWHY1N2V6emp5Rll1c2hMRkIvVFZ2NXdSSnIvazZSQWREN0lneE1E?=
 =?utf-8?B?OW0waHZnUUx5SnZ1MDljYnRmWUpEMkhpRHFPTDdtVjIzNFJ2T2xya0FSc2ZW?=
 =?utf-8?B?Nmx2OGpWQ1ZSdS95b3o4RHA5a3R6VVR0KzdzZWEzY2J4eCtlYjhNR01kYWtu?=
 =?utf-8?B?TlN4RHdLaWJLU05RYTRCVGdyOEM3YnZBQzcxU2ZaekVpQUdHQXJMaytWTlY3?=
 =?utf-8?B?V1dDMlM4MCtRUjVEWjhob0V3UW1lWm5NTm9hakJPV3lCZnlUcFAwZjVOdEFx?=
 =?utf-8?B?b0t1T3NiWG42d2RTcDBRTU1OUkZLaG5GWlRxY0txc1Zzbnd5OGZna2dXK2VJ?=
 =?utf-8?B?WGJjZFlpU08yZUM0cFdLZld2akxZQ1kwUjZnSjhhUmR4K0lPTTRLVXdHcVNR?=
 =?utf-8?B?U1dqSEtvbUpsUzEzdkgzbmlnU2c4M1N5SERnY29zU3g4T2J5dXMzZjZ6TG51?=
 =?utf-8?B?RjZXRGRWN3dnYmloMEdBZFpKcmI2OFJZZXlvYXNPc0ZZOU1jbXljV3BRRHJL?=
 =?utf-8?B?aWNGcUZtTFRvV0lhQlcwbTlWaVUvZzlPTDduRnV2enk1THZ3YmNsYTdkRC8v?=
 =?utf-8?B?OTl1dndhN1I4b3dmaFl0MDcyY2pLTjR0OHBCNE9pV0FPYUlrWnNNVkZNdHZS?=
 =?utf-8?B?WUlWb0JTRUtlMm1hSXVHN2NmRHJkZWFGSXFMdmxLUXBHVlBqT01BK1FzRVc0?=
 =?utf-8?B?c0hRZ25vM1VaVjJZTDc2SFRPN0o4M211aXBlZFNxK1MwWDdqTi9xMVR2M21y?=
 =?utf-8?B?dU82UzZXODNzQSt6V05DVUVZZE9GTFYrN056VkxZTDhSaUFGelNzK2R2S280?=
 =?utf-8?Q?KNSvQQT41xs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTQ1dWdsT3h3eENucFNlOTlZdURFZ1NLN0kxVjJWODlkcmdzYzc1WWlPNEVR?=
 =?utf-8?B?RHVxOEhnR2UwRTVWdEprY0w3d3VFMFB3TjJ4alVBblNmQXZ4bXVYQ2dQK000?=
 =?utf-8?B?VkgweTJza2JSNkQ5ZWc2SW5sdldDeldjOGlueFVDZDFBeEk5WXdRcllMVms4?=
 =?utf-8?B?SGxIbTFFVE42WWpCNm8vZ3d3ajZRRWNPZE9kWE9wWkRKL0JwVWQwdXk1ejhy?=
 =?utf-8?B?Vm1lTkFBbHdzZXN5U2kvSHJueXFwRzVqVzFmYjNRRVVwdG5XVmc1aW1Ub1Zk?=
 =?utf-8?B?bklONVQ0Tk96amdFcE1za3o3a0Zid21lWXBiQWJyempVOHFpZnJoTC9vTEVY?=
 =?utf-8?B?WEFhV2VTcDA0MmtGQUtvMHQxTFNDaUROSk1heDJCMDRWOWp1c3BjZnJKa0Vz?=
 =?utf-8?B?UWJVNlJGZmI5aTdwZnRlRHA2aEFSM2QyaGZnN3l3UWJMQUhCUDc1SVY5ZUNn?=
 =?utf-8?B?bDFnby9pU25DaXpLOGkvMmJidlVXNlZmN2xlSEtHVSs3d1p3SndkZUVCU1c1?=
 =?utf-8?B?Y0YvVkZHRjRHQ3lNbU1kMTgxVlR0WjZLUzRKMk9kVVhuRDQvaU5FeVRUUzlP?=
 =?utf-8?B?YmNZQUlPMWg0NTBzdnZqKzVCcG8rSEljQjRZNE9PVGxDMmQxbUJ5dy9WYVA0?=
 =?utf-8?B?ZHNIUWVrL3NQM1RMeFpGbXJBdnk1OWpmU3RJNmw5NEJoZHNERXlwZ3plYW1V?=
 =?utf-8?B?Wk42VVZrYThlK0RBY0w2TVZ1dTdRWUNjaGZ5V3UxbzVacWdZWll0ZXgvcXNu?=
 =?utf-8?B?U0tYSUNRYTZJQkNUNE1EOXhTcno1Y2FKUzVaeGVwRDEzaUtWOW5TVXMyeVZC?=
 =?utf-8?B?M0R2UVV2dEVTcUk2QVJKdVpCb0FDL1FjalIzb3lwcTlaTms3RlBlMTRtZ2Vx?=
 =?utf-8?B?WTlkSENOU1ZrOVQvOW80cmxlY1V0K1RKSDFheENJNGU2djdPY3Y2VjR0dm9X?=
 =?utf-8?B?WSt6SUFWY2xuNTYzR0NQeEc1S0QvTGNKVC9IcWMrcDRjVXk4WHRxdm1GVWdN?=
 =?utf-8?B?dEMwRzlaM29EUXN0ajRRVC8vdHZTOElESkI3S2tzZzdJVzdIR1F6ZVZUZ2t2?=
 =?utf-8?B?bjI2dnVyRmFkQ3daSWE4cXI0TnpCNmMvZHd3RmFramVENDFwdVZQV1lsdm80?=
 =?utf-8?B?Z3c3anpqZWJJTmNwcDB2VXJUVFlWK0xnWTZ6dlQrbCttS05NQ21sTUIvaWZO?=
 =?utf-8?B?MFk1aDlHWXFRVEdZS3N5bFdUTU84L0xFc3VMc3FycU9oVU5qSUcvSmxGb3pB?=
 =?utf-8?B?U2d2ZEg5bEg1ZkJKY2l5dUJYUkRGeW9sVWxJcW9kbTByVFVnT0Yycyt3Ri91?=
 =?utf-8?B?QXBIRktGYUJlOWtxdVVNRVoyZmpFWk9RWlVkOHk1Umh6ZThKL09tSkFDNnF2?=
 =?utf-8?B?Zk9IMzZqbWl0R296NzRHOTZPczFGMWxvZ3k1TUtQSVl3VEswcjJnUUYzTlBv?=
 =?utf-8?B?dEUvY282WE9iRS9PUW5FT3V6NWJhYnFIZEZDdVMyZzY3OGZiaEpCYVB5cWJn?=
 =?utf-8?B?UjlEblBrOFJXcDVDK2FMRGZaanM0eHhHQzJYRnRsRE0zcjVGeG53S2FLRmpY?=
 =?utf-8?B?b3VSTUloaHlJSDd4dngvRGU5YVNzaEY5WU1zU2VOck12dTlBc3lUeU5OZXpx?=
 =?utf-8?B?SDFmMTRmbUhUeUUwbWZjcks0YW5zZGVSVUxpUkMvT3BuYU0vaVhKZmUxeWVZ?=
 =?utf-8?B?cC96dWZKcTRoa0cwWFVibWpmdjhkenI5aGcySWlud3cycGZQVERnUE5USDFR?=
 =?utf-8?B?MTUybmQ1NG1JNGRQOTVraXRhRVF0QS9SL3VxL1VrczFJbWZOZ1pzMVo1aGM1?=
 =?utf-8?B?ankzU3UvUUpJS1VNUXlsa3F4aW5wYy9UNEdIaGlYblE1NmEyaGRnN1g4bitO?=
 =?utf-8?B?QWd1ZUw2eXhUSjJSMmRRbUE5MkVWRmJMY1hndlJCdm5HK0g3N3RiWnVOZGJo?=
 =?utf-8?B?MjRLUjBTVjRTcDlrN0R4TGtJUGFIT2tYZmhZbEdBbURLTGxRc29UZ3gzeFVq?=
 =?utf-8?B?RTREQlQ5eWZSbzN3RkRWZThIZW1paHJqU1RYZjFWOUY5UFUvSkxwM0lhSitF?=
 =?utf-8?B?ZzllV2JabXVNS3gwd25sM0Jka0t1cDNZQUcwVlNmbjFXWDcwdnJNdWRjRVNS?=
 =?utf-8?B?aHhsTzVRcUU0WVR5WnpwMk5XQ3pONjJMZDA4WnhxT1h2djdFWk1jTDNpdTBC?=
 =?utf-8?B?bnZQTU81NWxIbmhnYjN6UnJxb1N4RnVFNGJtUllKaUZzR0hyeGpDS0hUVVZO?=
 =?utf-8?B?V2llemEzbjkwZk5iQm5jWnZ3MzVBPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ca70d487-5398-45a9-1200-08dde19a0c19
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 16:36:30.9444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L67vk6Vw2pgRYB48LmryjEpkwjUb0+3PfcDYO6LEOFGJxnVhHGguZ6s93kPNHRfmII654X0nfzr3HnQvYTzcPBy82dc7KwAiq9DaNwxhSWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 16:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222339

Hi all,

On 8/22/25 2:53 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> libclc is required for some drivers (asahi, panfrost and intel at the
> very least).
> libclc brings very expensive dependencies such as llvm and clang.
> Building clang and llvm for each target architecture is very expensive,
> but mesa allows to depend on prebuilt host binaries (mesa-clc and
> precomp-compiler). Those are built by mesa as well, but can be compiled
> in mesa-native instead of mesa, making the dependency expensive but only
> once regardless of the number of target architectures to build for.
> Ideally the mesa-clc and precomp-compiler would only be compiled in
> mesa-native if target mesa requires libclc support, however this is not
> possible as a target recipe cannot impact or depend on a native recipe's
> configuration. We thus have two choices, always build libclc in
> mesa-native with its heavy dependencies and impact every build or force
> the user to modify the mesa-native recipe in a custom layer (as a native
> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> former seems to be the only option. Another big downside is that
> mesa-native currently builds drivers (amd, nouveau, svga) which we may
> have absolutely no interest in building, increasing the build time and
> possibly dependencies list).
> 
> A third choice is to spin-off the native mesa recipe with libclc support
> into a new recipe without drivers and only what's necessary to build
> mesa-clc and precomp-compiler binaries.
> This allows to keep a "clean" mesa-native recipe for whoever needs those
> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> and only bring the libclc dependency when required by the target recipe.
> 
> Because libclc is now only built for the host, opencl support now needs
> to explicitly bring libclc and others to build as libclc won't bring it
> in the build environment anymore.
> 
> Suggested-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   meta/recipes-graphics/mesa/mesa-tools-native.bb | 19 +++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa.inc             | 15 ++++-----------
>   2 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..dab1a037851cca6b33eae4b69a6a141fbbcd801b
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> @@ -0,0 +1,19 @@
> +require mesa.inc
> +inherit native

I think I should have inherit_defer native here instead? To make sure 
regardless of what the user does in a bbappend (well aside from using 
another inherit_defer), native is always the last inherited class?

Cheers,
Quentin

