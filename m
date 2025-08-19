Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDF7CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 09:22:02 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.58])
 by mx.groups.io with SMTP id smtpd.web11.9651.1755595316283177554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 02:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=JKF9yF5h;
 spf=pass (domain: cherry.de, ip: 40.107.162.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsyZg+OgLr+KTAsc6t/HL0Q5n9Gi1rb7yNAWUhbZMBBuPVY0uqCyFO+dcsJpyhLHR1FdiVrvcaOcNCuxjJAacNNdbaym2ICfH0d4n4cKJgq6IvqnOBNubmgERcEPXVKZH/cC9fxn73IAx32FQGBDsUB4rmkx36J7B5pnq+1MFqgv/sBMVcbUdAipPdjHVKz9Udbk+jQX7Q2eLlgqY59SXz2caZ8sYlm5/uY4J11RonfCmsWgNf5kF9ppHySLvOhYqh4HNSSaH/rbld1cX/tZxPuUetkmAp+8UrrbiGW0Qwj25FSy6FGpmabzYpJiOh0TxUlcTveyN3jiFa59fgCZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63ZUHWEFa17JBym4E1MsLddRMnhoX1/pQ7VSoATdl8Y=;
 b=Z2Qysva/fKwqoyLk1TytrYSddmhBaBXGkTd4xuRAWhJEani52uXqc6C43S1N+jkEtjP+WDQ+z4vDJLGfoWV5AnYTEjCb2JYty6kqezDPaMsX6rhI9AwVnAub7FUTbmcbb4yoS2r1vikHKSG+nTRXuFx1EMKZfaTInvJEiewuBkRCLfOPGNSwJjVotn9ToZio34A35yebalHX15QWDejgHg+vgaHNitImDwXHo9b7NrzB+nLOOu8+4y+ScPjnXECTtqJ/xrDM+jh/DoGHj+hUmfq4m0YtKvd3pmb/1fFDV4lv1lAYIIqvvMRdUt0JfNamZnrcILyzPNFulWw6EpAiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63ZUHWEFa17JBym4E1MsLddRMnhoX1/pQ7VSoATdl8Y=;
 b=JKF9yF5hD9gFwsAUSRyBKCvDIu11fMPQ67TrqQvFct360Z+jeOz/Zy7Fe5OusqEEGbZCGA4U0XcdQg1GyvhliPKd21anLiddWONU3b5zoG6IrzwKLLg6r5QIMr7/p8CgJsWQtLkg2hdbAkVYcxFaKt+E5os/9KBvUTuNxjbT5Xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7380.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 09:21:52 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 09:21:52 +0000
Message-ID: <8d5f70ac-7a0e-4c1b-b1c3-3949412843c8@cherry.de>
Date: Tue, 19 Aug 2025 11:21:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure
 with gcc 15
To: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250817205033.3845672-1-martin.jansa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::32) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a7f077-db33-4680-302c-08dddf01d547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TDVDdFk3WFdERFZ6OW43SkZQTm9PSUI2anJrM2svTDg0Y0hDVXgxSmpEa1l3?=
 =?utf-8?B?a05BUzdSZFIrNkYyMExoS0tIMWpSbGZYOStrMWRyaFdaVlBkbHVvam1lVlor?=
 =?utf-8?B?b1NGUUxFYWhGU3JWMm4rblRVYU5PNy84ZjFnQ1hDUVZTbHhrcHlpbmdjZWNo?=
 =?utf-8?B?VzByLzZrWnZNdWREMzhHZ0UxR2ZDN3B5bm1ZVWY5ZTVvODNScXdkR05uZ09O?=
 =?utf-8?B?UTF4d3k2d0svUjZPbGdIOGU4TVRKRy9tTmt6Q1lHelA5RjcrUzRhU2s1cURR?=
 =?utf-8?B?blhPWmliNzFSUG13R0ZDZDgyQ0orN2pqNnN3N0grWlIzYzl0aE9vbVk1eUhM?=
 =?utf-8?B?d2k0UnpMZTg3Z1RiN2VSVVBhWGRTTnNDMGlKZi9zSm1UVENDbnJ5NmsxdTdm?=
 =?utf-8?B?ZTZvbmg1RnFHMndkamJXNVhEV0JvUnR3eElETS9VOUtlQkRab2RudjRQUStk?=
 =?utf-8?B?Ym1sRVZpRVF5VHVkRm9aTkY4Q3pxT01iYmcwNTBaL2dxeUdRRGVyV1VtYUNH?=
 =?utf-8?B?SEtleEE2WWdFSi94YnNxb2Y1VHJJLzJPNnN4aGMvUGFKSEU2Vi9XTlc3aG5E?=
 =?utf-8?B?SnFINUx4MHU1NmE4T3RNY0VpUXRnWFJIZ1BsR2twOERSOGtxMjFmaDJOMDNC?=
 =?utf-8?B?MzlxVHBXMy9xVlZ3MG0vMWozRzRWa3VKc1JIYUlRbEFOYy91OHJ2Nm1mMHRj?=
 =?utf-8?B?cTUvanFRMGZvaEx2cmdKdFIxS1lRbzhVbWFUWEpsVWM3UGh0ay91NmhQTjZX?=
 =?utf-8?B?RVh2eWRxcDJLZjNORUdRQXp5QjJkdXVOYlp6MWVCK3NXVFh5bVFJSW12V1di?=
 =?utf-8?B?NXBOUVZ1SWFNQmZybUZYa0tuVEt0SDhCNnp5RGlkSHZaeXFaNW9WMllKWmR1?=
 =?utf-8?B?NnVhRWwzYzQ4MWVXY3pzdmxRdks2cGJBeCtsRG44Mm14QWF1aUhDR2hhS042?=
 =?utf-8?B?eGFNWmduZzA5aHlSOVg5aWRzWUNleG1Xdm1iTnB4ZTlzNjJMMk9QTkRhdTlj?=
 =?utf-8?B?NUI3bU1adjNJcG10Mk9pVXQ4RTBya2lnSUo2UnRicEJIeFl4L09kK09EYjBm?=
 =?utf-8?B?REhQMkU1ck12UlVQdEl0WWI1a0ZDZ2p2ZUxYU2tOS3ZwRjFJd3BJaUpBWTFl?=
 =?utf-8?B?YlVKVWNWVXNGc1hOb2FFWWUxeDhtakFzYnlyUllvMWpZUmVlNXNKclJlcTlR?=
 =?utf-8?B?cEErbFVmNGY2eHZrYWovMnpJbzBQeS9scGVLSnNzRG5aTjd2TG1INUQzRCs0?=
 =?utf-8?B?Zlo5TVFvYk5RVkZJZWd3S3NnSUpGbCthYTNMM3pwYWc1NG4zOTJ1ZEd5NmhH?=
 =?utf-8?B?dlNRaWZCSTRZTm9Gb3RvQXFFNWdORGhkSlNkVUhGWDBsZ0xFcmNhYXIzWHpU?=
 =?utf-8?B?MlZLNzI3OU91cUdubHhuSTYrVW95RkdSR1FQU0RhZnFkN1E4NkxhYjhmYTlW?=
 =?utf-8?B?MHlVSWpHYlY3TWRyRWFZVk9qVjZxMTJYWjM1R2s3RlJBZytzYXpXL2w5blJO?=
 =?utf-8?B?WUlYQm9kVk0zNW1VSFNvWVpDS09oeHV2NU1nM0R3V3FHNVc4Sm5uRUpRUnNW?=
 =?utf-8?B?clB3L3BMVG9IOG9yWEJOZXRFVXpBbm9SdEE1aWo1M1lwa2dvQjduMk1vUWR4?=
 =?utf-8?B?ZDY0a3RYQ1BhcjBhNldpOVMyY3AzaDdIU2FZMkhXcTJrazdTcGNNMWUvOTdT?=
 =?utf-8?B?L2RsbURNV2pwbHZ5cE90dGNhelhxZ1REMFRsQ0xwNHZGSER0MGQ5eXN4MG1M?=
 =?utf-8?B?TEEvbGxhWjdOeUZ3MWcvazExcCs1YzFUMFFNQ05BU0RlNVZSWHlYRUhjWnJq?=
 =?utf-8?Q?nfMKTAPWClL4bb80A5uhReQLGqhVaxSAXh6uw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QURPU3grWE43d0UrVFNiMisyRWVXL1JwTHg5bjZ0N05leE02cVREUDBQYWo0?=
 =?utf-8?B?Slc2RlRBekRmb3BWWkk3Mm1idjYxR0ZTbXUzQXppNHRhRjdwV2I0cDgvTWl4?=
 =?utf-8?B?aHA1dTNxUndmcUlZcVZ2Q0JkVEtCdUlPYWorMWR2Wml6c29qWVU4dDJIVE5h?=
 =?utf-8?B?SzZQWksrRVlRNklSOUpvZ1BKb3ZBUG9WMVk3V2FlMHRaR1dnbytQWnZRMkRQ?=
 =?utf-8?B?TzlYQWhMeDduYVRrZG1VUWVjRU8wOHBSNTlsbmRPR011VFl4T05QK2VHK0tG?=
 =?utf-8?B?RXduT3g4OWN2bndlcTI0eHEwbCs5elJKN05MQWdmSmdSb0E3OXpkVytFZTFZ?=
 =?utf-8?B?aFlMaDFoVWFyMW9PcVNkY2RXd3UwUnJGTDAzQ1JmdFdiZGh0TTFDODFXRVhl?=
 =?utf-8?B?dlltSDRtUlRjU1pvQ2xLY3BIVzFPODMrRWFuZUkrMTIwczNPeW4xL3VNQTV5?=
 =?utf-8?B?aXYySmZGSG9meEpZNE5mWUUyaDZMV0svMmxjUmtTVWI2MHEzbVFuTXNJa0Qx?=
 =?utf-8?B?M0lUYjE0TzljQm1PQXB1eXc1dENlbWhVZ0tVN3AxVFk4V1NITjVQMHN6VXA4?=
 =?utf-8?B?RllHaTdQMU1FbW9UU3RUR1N1L3F0dFRDNHJrT2xlVkJkZThNS1dpNmcwdVVi?=
 =?utf-8?B?RTdrWGpyR0w0RTFFZHRDcVlweTdXR0gwaW5hbXkvdm9XTVZsM2MrK0tZTndt?=
 =?utf-8?B?M3ZkUm1zUjZvY1RvTWVhZUZ4TG91a28zbEUxU05WdEVIT2Y2dHRMQmMzampC?=
 =?utf-8?B?VGlDbjkzUGNmSG14WTZISTNQZ3Rmd0JGZXZQNlc0WUhHczRQcjJtTFlQa2M3?=
 =?utf-8?B?NmhXOUhaNmV6UGNSa0Yzb1ZmNnl4bXNPUkl3L05zTzJaaWI5cnl4NDVRbDdS?=
 =?utf-8?B?Q04rQWJjQ3BNbE95ZzA1QXVQVGNoTURLdDRNSVV1Uk9jMjdIU0FTNkljenVG?=
 =?utf-8?B?SWFuZXpSbDdSS3kwSFBYVzQzU1N6Q2p0UjNSK3pXZTdaU2h6anRRVHJ2Z1BM?=
 =?utf-8?B?blJ0aXFWbHpFSEt6VkRIUkIxVUl0ODNyVnJldVJWRjFYOU5kYm9KTGM5Kyt3?=
 =?utf-8?B?QjNDRDdWaldGeXFBd0h2dFVISXJzdXFyN2xNZFJSa1kyNTBUbGRXdDVrOUVB?=
 =?utf-8?B?ZktzdGdBUWVoVHlSRkF0cGtmT1oyT0h6c2JYNS9WVWxjcXlOczMzRVRDalIy?=
 =?utf-8?B?eWh4U3JBaXZYRDJ5RDZVU0hmUW42RCttTjE2MFYxSjFWaW5XdnEzRzdQQjlj?=
 =?utf-8?B?bmVERE5wNlkyTEpHeGQvUUk5a3ZLMHFpeXBOSzJjNmtocjJEdTZmLy85VVR2?=
 =?utf-8?B?TnIwQ1F3NUl3OGY0ZHYwWitZVnZRa2ZOa2tHdTFxYXZXVmptTElUZlV1b2Fk?=
 =?utf-8?B?dFBRdVFzVGRjVkszWjlpOTNsT2VtRmNWSTRRVW16eHpxTUx6Uko0cWZNU0dI?=
 =?utf-8?B?MTdjanpYR1Z1RmRjNk4vSnA1QlFXd3lHVks2elFYZm5Qbkw4bDZWUUdxOGpO?=
 =?utf-8?B?djZVWmpGck9ua3FrQ1ZETUZpUXBZalN6dkxBdmhDeGZwU3pyVXNuUGFmV0hJ?=
 =?utf-8?B?NUd3dTJGS0drMzdiSDkwSVJ4WnNJTHUvRnVGVlhCQWVhb3VjTGY3SEwvSjAr?=
 =?utf-8?B?YlorT3VSWFp2Y2dqK0JBSGVvZGhMNi9CODRZeTlZZnFER1l5K2lWVDJyc3No?=
 =?utf-8?B?dUlkK2ZGRm9tNGxXTzc1SklZYitUY2NFQkt3L2U1OG9RMUMxUTJVVThjcmE1?=
 =?utf-8?B?Tm8yL3c4SXNlQXM3U2RTQ1puQmxvUVppYzd1MUJpOUV3dU0yZVkwR0dnMUhV?=
 =?utf-8?B?aG1xNzE1WjFJdmtoV3djR0pXdjJtSlJUUllnTmFWQXlMVThMSWliclYrTlRk?=
 =?utf-8?B?bE90SHhUSVE2YkVJWFNKcnVSbzNkQ3psWjNzSk5hTzVSOU9OVkY5a1Y3YnJl?=
 =?utf-8?B?NnpPUDcxT1hwOS9BbDVtT29CcEszaSs3MXp6VndSWW5nT1RoNExxcW1EdHd5?=
 =?utf-8?B?YUs5MWppYXEveGNkbHE2OXhCNy9lc1cwNnd1anRQalNId25JTHQwRkxFVlRr?=
 =?utf-8?B?L3JjM1FFYjNsbkNKbnA2TCttMWxmWDQ4UGlZeW0xV1RvT1FzcnpLeWxDZ0hM?=
 =?utf-8?B?Yjhnc2JmNGJSV0tWOWpjMmJlK05ZQzVyeVVVRjdmV1hhcm1ZQ29iOWYrckkz?=
 =?utf-8?B?azBKT2NoUzFvc0FVWW1WL0F4YlRFOWRCSmp1RnlsU0drcEIvZm5ja1dYdWRQ?=
 =?utf-8?B?ZTNvaGZlejMvOVJ4OVZUaUo4VkVnPT0=?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a7f077-db33-4680-302c-08dddf01d547
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:21:52.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DApnac3LMfHkb7geygxR1Tl/SGqBTXRo52oCX6h8I7ZKXmsgvmIwzNSoqh+GojdsRWH6XAPtiLv6JHyRxCle1Kn80hk1njqBWqERvpdq33U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222090

Hi Martin,

Do we actually support any distribution for Scarthgap that has gcc 15 in 
its package feed?

On 8/17/25 10:50 PM, Martin Jansa via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Backport a needed fix
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>   ...-libext2fs-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
>   .../e2fsprogs/e2fsprogs_1.47.0.bb             |  1 +
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
> new file mode 100644
> index 0000000000..01ab9d5afb
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
> @@ -0,0 +1,42 @@
> +From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Fri, 22 Nov 2024 12:36:32 +0000
> +Subject: [PATCH] libext2fs: fix -std=c23 build failure
> +
> +gcc-15 switched to -std=c23 by default:
> +
> +    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
> +
> +As a result `e2fsprogs` fails the build so only typedef int bool
> +for __STDC_VERSION__ <= 201710L (C17)
> +
> +    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
> +    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
> +      113 | typedef int bool;
> +          | ^~~~~~~
> +
> +https://github.com/tytso/e2fsprogs/issues/202
> +
> +Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
> +Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/ext2fs/tdb.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
> +index b07b2917..98dc95d8 100644
> +--- a/lib/ext2fs/tdb.c
> ++++ b/lib/ext2fs/tdb.c
> +@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
> + #endif
> + #endif
> +
> ++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
> + typedef int bool;
> ++#endif
> +
> + #include "tdb.h"
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> index 940b47c155..0288854527 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> @@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>              file://run-ptest \
>              file://ptest.patch \
>              file://mkdir_p.patch \
> +           file://0001-libext2fs-fix-std-c23-build-failure.patch \
>              "
>   SRC_URI:append:class-native = " \
>              file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222018): https://lists.openembedded.org/g/openembedded-core/message/222018
> Mute This Topic: https://lists.openembedded.org/mt/114753788/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


