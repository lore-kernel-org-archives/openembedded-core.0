Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6842DC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:38:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.42])
 by mx.groups.io with SMTP id smtpd.web11.105.1750689524473787098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 07:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=gDQrkfA1;
 spf=pass (domain: cherry.de, ip: 52.101.66.42, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qehoLnq+NgVzxEfJGBIO/fqzCQwRdJKvvNul0749t2SkJVa4YaNJoK9QlFy8nbpvhRN13dVMDq8/CY1kZ6YHUOrXGPlhsSDGw2nAvrFDSbcJUxFOZJs+GRKlsMhnsTT+uVSt7/SGPA31qxKe7lfSZ+8XolpUTCSlLXu/AXJIsyXgAVBJIRHEn2CX8Psaf0x4hUditdXfrnSwzFjneyQXQg5oxdCHhT14YPoymknjyvlHQFIJgCkT77csjo+WNhgB3FtjKefmNtVE456q5YV/bOtLcXPOVHtusdOhAlyF6p/PZIc7E5CFIq6ZpVh8kisym6oJQM1tzWC+eprAE9/Y8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaBCdDw5E/m6SsXfqZQIrzk3KcDiE5SEClgKrKADSJw=;
 b=KIw7qO/AH1cwPAxRmw0orUP8hpqvdG0DygUrllczpmbxAcj2oeyNCv7nTPzcB5/cSDnUk1C6voJODDrB7K17UVP9fgj1hvAUod3EuMvZTuOVLN3SJQ3elwUHLTLEnUa15UBj4tDzw1L59MO5HJY9aIuOKgZZwJczbbZVSvg1cxC5yAPgVhDX7iN9OmtX0mlrzZX/d1SuaC6msO6oSNVsdSSCNO9lpqepLJk6D3oRaqnUn2+OBb34S6kJSOPphAAjdtNXbHiyRm8Z/JOt9/hkDp7Mo4hwiSQVpxcum3cOnmf3tH2U+2vyLNEv9B7Sx2eojM0o1MzErEj0uQU/vG+hjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaBCdDw5E/m6SsXfqZQIrzk3KcDiE5SEClgKrKADSJw=;
 b=gDQrkfA1WomOOtiTnTRguH3lW69nchdPq/gZF2k/biEZfBK436GyP8FELEzEgDgPbYZqQ+PO2Tc73cRQZHL0NdmR9oF16wWbH0qln4ChB5J3czbu8ZrG6IyLVtaexVOsWNO3dfZWMn7VV34OAsZ+Ni+bF2VxD+/qCPz+ZRkRWyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10085.eurprd04.prod.outlook.com (2603:10a6:102:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:38:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:38:39 +0000
Message-ID: <3a86eb2b-a2ab-40ab-b00f-66d29823ed65@cherry.de>
Date: Mon, 23 Jun 2025 16:38:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] json-c: Don't build unneeded apps to unblock
 builds with CMake 4+
To: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
References: <20250623091203.2859711-1-Moritz.Haase@bmw.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250623091203.2859711-1-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10085:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ab685e-b658-4287-1dd7-08ddb263a4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cndHaUtqNkU0NWllZkZuaUZMNkRoaFp2S0dULyt1NTlwa3pkQTI0MUMvbW9o?=
 =?utf-8?B?NXgwSkJHdlZhTW5lYUR6TXMyaFArRW1vRS8yK2lPSC9WTWwwVDZQRm1hYklo?=
 =?utf-8?B?MFo2OVg0bzltL21FRkt4M0NqOWp6RmdjSzdORGMvOXZxSHNITFkwbWl0bG1G?=
 =?utf-8?B?UVpMeHhrdGFEbXFXWVVqZk9VMi83VXZ2R2ZyNm5QNDdYbkxjLzV1RG5mVlk2?=
 =?utf-8?B?MTRKRGV5Mko5b1JRV3lNKzVRWjU2ZUVubmV6L0VBUHRmS1lRWndsQXBVREVq?=
 =?utf-8?B?MVRlRUZaREdWd3NEUlQyTGJWMXYrR1g4UVIvVEo2VUs5eXhPY21zT1l6MDVS?=
 =?utf-8?B?dS9qQ2ZqbkJpVzU1V2szYk9RSEplRGQyTEpjMlJFOWRMdlh6RXpBZi93ZjM2?=
 =?utf-8?B?aEZxL0o4U2JyQysrVTIzL0hMY2pvQW9TekxoUFcyR3lqVGk2dUM4bGxwTVR3?=
 =?utf-8?B?SDBuVmg0aTFjQ1RaWUdWUnIrdVM0cXhvb2FMSHZ0b0pBbm9CMjVBSDRjSlBM?=
 =?utf-8?B?akdUK1dtSzJnWkFLSG9Wb3NTRHBRMWZFUSt6QkUwTVVHazBjK2VOMk40RGRX?=
 =?utf-8?B?RmF0N2RPcjZiRUJhMGlzYWppb1krSWNSK3I5MUkvMjNUVElsMWcxVW02WmRp?=
 =?utf-8?B?bkxCMFg5aFlWdjRybDFMNElqWUpKbUNEVlB0TEJUTWVvN0VpWFJuVkpUTmZ2?=
 =?utf-8?B?YytpbWYybHE4M2JPc3p2OEN2endtOCt4L3gydnFCTjM1SWVWNUZjOGJuQnNT?=
 =?utf-8?B?bzlhVzVYSkdEVGx1TGpUUHV1VGx5ZGRrTTdRYzJHaFBhSDQ0OWFzekloSjFF?=
 =?utf-8?B?N3QwMEZVU0ZaYWY0NTdkL1ZDTjcyb3ljL3pLQTUrUU5uNDlxOVdraE4vS2tI?=
 =?utf-8?B?NjBrWkNNeHJKM0hyTVFsM1YveWFwVUU2RFVyVEE0T2x4NzRKSitialJOVWpL?=
 =?utf-8?B?ZVlGa1pKWFJ0UjhLYXl3V2RQRG1jMklJbC8wd0szUVVUWWpkR1V3YWRGaFhl?=
 =?utf-8?B?cVpzaUZwakg3dHROQkxpUDk3bU5BWVNrWlVGL21iRTJpei9DZVpNY0dTdnFT?=
 =?utf-8?B?VnNub2tRSXhRT2hzOWNOdGZ4eFRqQ2luVlVobFEvOGlpMnFTZXpaSjBwMFo1?=
 =?utf-8?B?TmZMUUFmd1FWQ011MEJXLzM3YlVjWDlKV29FZXpkOE9sWFFWQ2tHWGxPSjFp?=
 =?utf-8?B?bC8xUTErZitWQmJRc0dSekxldUx0Nkw2RFVBRTVwL2ZxMGJQTUpBK3hMc25H?=
 =?utf-8?B?b0lPbXFoSHJUNk1LY1M1N2xNK2FWOCtpUGhDV0JwQzRmaGF0akxBWXNINC9x?=
 =?utf-8?B?N294MUdnQmJkaUcxSVR0MktkeEdpS0M2clFYWVJXV1lOaTBWRGpIU1JVamZI?=
 =?utf-8?B?aGdpbjYrTEJkbXBuWlJtSnFpaUhTYnByQmdPTlB2eHRvb1RCTWpJRlZLNWFB?=
 =?utf-8?B?SXZqQUxCeDJUQVVkUjJuVXcza0V3eDNZczlGSlNVYmU4QkVVYncvc25PRzdz?=
 =?utf-8?B?ZUxsUVBoZG0xcnV5dk5MRXF4UlNJaDBQOFRORE1jV29Mek5zdGRFdW05aHcx?=
 =?utf-8?B?VXhFaVJGQVZKNnM3K0NybW5zMHpVOStOaGd4UzdDNktsTFIwU1BSZXd2REZQ?=
 =?utf-8?B?ay9FVTRQTEZZSjlDWExBNSs4WWt2TDIwNURWV2RqZlMwK1JMNThIQzRBRThC?=
 =?utf-8?B?NWFwRFp1MXgvSityQkd5S0FYcjZqNmRKQVJoMXd5MUpzMng3Yjl4ZVhZVUlU?=
 =?utf-8?B?Y25rVXU0Tm1SaWtJY3JzZmpWa0pqNTBvNi9RZ2hIV0FHWlZibCtPRmVzMTB6?=
 =?utf-8?B?dTIzZldEUi83T1JvZTJ6WlFFekV2SE0xNk1RN1d4dG51Znc2a2k3UjNraWVo?=
 =?utf-8?B?QnJITTRSVFpab1BkSmkxMnRwc0hYVnJmSXlTclp3ZnlNVlE1THptVktodDBH?=
 =?utf-8?Q?L++ZRcqglTk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c09nVDNuMnJVWndQTmE4RnVlVHpTWVJvd3pXQURWajU3aUt3QWpQaFQ5Ulhq?=
 =?utf-8?B?MzNybjgranVrVjIwVTUrenk0emxMazRvSzNrVkF0ZzJFdDFrSmR6Z005dU1I?=
 =?utf-8?B?UjloVDFMMkVDb2ZVOWZGUmZ5TDN4SmlmY29Va1orcnBQK3BZeG45amJ0NkQz?=
 =?utf-8?B?ZUpzNS9NQkZRVGRqRUtjYW9MSE52UTI0enBZUU5STnovWHp5WUlPK1dTNTV1?=
 =?utf-8?B?ZXhlUWcxRU9EL2VXNjA5TEJ1dEtuWkFheGZtenBDTVJ2eEtYTkQwQjhBQmxH?=
 =?utf-8?B?U2MrQkh1TG5JQ2dnQkI5ekFyTXpFVVFCR3R1Ty9zUGVCN1prbHZodGo5M2hh?=
 =?utf-8?B?VXc4Q1VLaENsY203eWUrbDZjcS9idUw5NHFEcDloUnNqRW9HUTN0bUN3VGZO?=
 =?utf-8?B?dElMTEVQd3IrUUNQV01YSnVhSzZGbC9za2srR2FCelpSOW9Zd0pKR21nTFdr?=
 =?utf-8?B?WVVGUFEvRVpRMTBUNllPN2YzMk1DVC9jYkRnV3daUTZ3RjMwbG0vdGMrRDc4?=
 =?utf-8?B?aUttejVSZ2dKaGY5cWFHQWdWYk9KK213aDk0d2dEYmN3cCtRcUc2STNvWHV3?=
 =?utf-8?B?TTZMNVpvZmJpcUJQckF4RHArOGlpdEhVZkFDRFp1cXUyRm9zaG1DWmVLMFZh?=
 =?utf-8?B?S0Q5ZkdSWWJxTURPRUtYNWtmVmNrQzVVNTZ6SXlxaGxaeXgzTG5HNXpKUXBh?=
 =?utf-8?B?QWJJemI0S0hjakFIZDg0d1MvQk5pR2lISWRGU09US3A3N3lISk1YVFF2Nnlp?=
 =?utf-8?B?WloyZXdCTEZ6VkFQNm94ZkhuMnh0SElvZW5OeWpDK3hCRjluOHJMR1Fqa0Jj?=
 =?utf-8?B?UjhBWWplLzV4bldRdVo5OE5sOXk2eCtrbVhtUWRKVUQxdDNNRFZaNnE5SXJv?=
 =?utf-8?B?MTNnZVhheG5TcElsanNvZGFDNVRyME1FZWdoUUthZDZaMWs2SHdVMDlETjJs?=
 =?utf-8?B?MHIvMi8xTHNjRE11QnNNNFVsbWZ5UnF2UFFwNVg0YjBVV3VMNU9QUGlOcjBU?=
 =?utf-8?B?cGY1b2VyNC93QURQbEJTVmwvOXMva0VlZDREM29nVkJpNGFQSTFiZUgwWXR1?=
 =?utf-8?B?dnM1bjU2YVpnWkNwWVhaWUdJY1FQdEIwK1Y0bFNOWkY1VnRacTkvQzJrRlF1?=
 =?utf-8?B?eVdPTTdnamZySXVXNEpLYmdJdTMvdjlkL3FSUzFzbEgyc0pHRkx1cExITzl6?=
 =?utf-8?B?cWFlcjlnVFNDdjkzam41YTRzY0pUQVluRE1UVWsvQytFaTdjVGRSSXZmby9F?=
 =?utf-8?B?UkZuRHh1d1VCOTdRc3BrN3o3WG5kU0ZhTXg5NWIzam5zZDlaVE5iUmNjam1u?=
 =?utf-8?B?OERzVnNRT0tKMTQ1Sm5EZjdaQVRhU3lYdlR6M1d2dXQ1M1RLYkJjRlhFUXUr?=
 =?utf-8?B?UUMrNnlUOXMvTlNTb2FEOHQ2SlFBTUUyRG9RTUZLcFVSalQvZEhpYUdZT3pL?=
 =?utf-8?B?YjhsQXZpSHZZRHhxN3FMUTM5YWtPQXdjVEJzVmlqNGhabTl4U21RWmVFRWly?=
 =?utf-8?B?aTlvTjYxMncvTDd0K21rWVNha3RDeFNLdWZuc0RvWVh3dmE2amplVHVqSG9W?=
 =?utf-8?B?eHFTWHBFeTEwa1Vkejg5ZFNkamhXMlFLazk3c0JRazFncW45QU51S0FWNG96?=
 =?utf-8?B?QjF3Z3R4MW9NbjFyZldzcU5hSFB0aXV4S09UNmFsNktNL1JuYm82WGxHVkRP?=
 =?utf-8?B?U1JDby9yM2lIcldrVVBwUEkzUkh0Z2EzbnZEaWtEak9rcUNXRlc4U3pwVGtL?=
 =?utf-8?B?UnZCK2o0Q2VRK0JCOHV3d09YMUtaUjlGZVllcHFIZTlYWnM5cXQzcnBBVk1o?=
 =?utf-8?B?S1pjSVIvSGoreEZvZmgwbUZ4ZWovbE9IZEY3Z3Q0YTFlOXRYaXlwK0tNSHdN?=
 =?utf-8?B?ZWZqbTV3M0RCUjRCLzlPMm13dTJMV2lOYXM2bGNVNHAwd0pySi95SWFTUVF1?=
 =?utf-8?B?N1dkbUF1bVM0SUdXakFWc2ZkMmQ5b3hFTzJtd3VIajdtZVBaZ2xSWFdsZ1h5?=
 =?utf-8?B?TlcrVHNjRkFvazhrTjc0dXlQaERuL2x6Q05XZHdxV25tQklUcVlEb3VPZWFB?=
 =?utf-8?B?T1pKQmdTODlOTzlLdmwwbWFJTkppc3docTBLdHNDQnQ2LzZaVDJSbmlYeE53?=
 =?utf-8?B?QUdUOGJyZ3JVYzdJaUVaTFVQZjJOc3BpN2pVTEcvNFVQeFdrR1FtZFRHZERE?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ab685e-b658-4287-1dd7-08ddb263a4e0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:38:39.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2KchkXuFx9Mq0Ayk1R4KiQL58GcO84WYykodWAgV328S4m8LviwsN1bb/q/1stBsLVuo3+1+3/X/VRQwKbp/+DB7iGu5UfPYRoNIIgr8E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 14:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219215

Hi Moritz,

Random pass-by comment below.

On 6/23/25 11:12 AM, Moritz Haase via lists.openembedded.org wrote:
> Disable build of the apps, as we don't seem to package them (upstream says they
> aren't ready, see [0]). They are the only part of the code that doesn't build
> yet with CMake 4+. One alternative would be to apply [1], but the PR hasn't been
> merged yet by upstream, so we keep it simple.
> 
> [0]: https://github.com/json-c/json-c/blob/7cee5237dc6c0831e3f9dc490394eaea44636861/apps/CMakeLists.txt#L119-L121
> [1]: https://github.com/json-c/json-c/pull/888
> ---
>   meta/recipes-devtools/json-c/json-c_0.18.bb | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
> index 2fd1897ba8..ece320d66c 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.18.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.18.bb
> @@ -19,8 +19,11 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
>   
>   RPROVIDES:${PN} = "libjson"
>   
> -# Required for ICECC builds
> -EXTRA_OECMAKE = "-DDISABLE_WERROR=ON"
> +# - '-Werror' must be disabled for ICECC builds

Maybe we can get rid of that now that icecc isn't part of OE-Core 
anymore, c.f. ba4fd5229893 ("classes/recipes-devtools: Drop icecc from 
OE-Core")?

If that's the case, then a separate commit would be most welcome so we 
don't do two things at the same time.

Cheers,
Quentin

