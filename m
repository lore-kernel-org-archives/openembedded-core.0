Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E87C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 09:23:00 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.34])
 by mx.groups.io with SMTP id smtpd.web10.12269.1749028979462727040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 02:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=L2R4hWwz;
 spf=pass (domain: cherry.de, ip: 52.101.71.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsAXzEiFNQPatb+by/aYHWlFsqHnTkoK+09qDRwJ1aXu+fELPS6FiU2DXcO2TjaNQAa7OdOOMCtMr8DuwHvjX1FhFWohK/axRBJhPyGBrUBysWXHopZjJkdJ1ep/505AzND9pvLYh34ehQrdIIq9jX2LzDyG4cME4g/HyBTUia720Nl1lIV33ug/q/zbu8KKcbiGKKULNAXPWxUR8kWOgvJhNAl/HH0H/Ns3GygR1ZX1CbpSbcdjkKM/pjhm5ZjVbgXT+KVrQtquVBc0P5l0G2TYFmk6OKBRpKaKAloikyMkPlR6GXWnPs/nXvUtbcH8q4d5tWxfPkq4C8s7GNuqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrSxsjqKDMy2CHmGszCbtN6tUPmRWvwEoL4UpsBts9U=;
 b=curiPyQazSxfYKbgd1MyP5j5SGcQmS2IzgSlJIpgO1o73B7vxaksM9JaHP/7kqYT4E/fFPbrCrBsh3J3tBo44UEOLYv1h36bsBdF2KjndADt6MJa8Pz86y+8ojaJ/bzh9bey54STPXBpxaiRfvpxnGP4PJL4uTvAigk5zJS8OYxN0C93bnecWbUW2QadJOioGGF2wB6wQmnKbGMFiW55ocoUNFvfCi7WXUDH3xS1fFNsUDVOpqGTJx/JcS6DD6TErEMswnm/LiIoytq3Eqk6A2ntMOcaGaJGTkp2bzvHOu1tonsylzEFsD1DfsU7DzTKWWnct0G6scJE64skqxdQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrSxsjqKDMy2CHmGszCbtN6tUPmRWvwEoL4UpsBts9U=;
 b=L2R4hWwzvESSIBw4xyjTFSw2l0goQlO8g5xrpjXenYns1H7UUDCp9/rvnTPe/WG/XOP8hMh/Lm0KvZNZ9rr2FVXfUtEl1tBQ/IBsWpCQdXFQv2VOPG3POUbJiwJeczVkojAKavdYcwjffRyySOsR7Vfni5sexydy79crJK2dXqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10442.eurprd04.prod.outlook.com (2603:10a6:102:44a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 09:22:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 09:22:54 +0000
Message-ID: <4c4f6b74-1397-43c1-991e-3176d2873880@cherry.de>
Date: Wed, 4 Jun 2025 11:22:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] reproducible: allow each layer to define its
 known non-repro packages
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
References: <20250603215916.2429422-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250603215916.2429422-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0340.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10442:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f69e947-45c7-427a-32be-08dda349632c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0x3a2F6Y1Z6ektldVJEZUhBcm15TEZaMDhxa3JHN0laSS9rTmpXS0pMU1F4?=
 =?utf-8?B?RW55enpQeW80cVdXYWxESDJjZ2gyMDBoMUp4RDhqY21OenFwaEsySzBXUFI1?=
 =?utf-8?B?UFROV016dDIrL09yK0E1aW1ZVkJnaDBRYjhYdmhrY1ZXVW85WnRybGVTMlF6?=
 =?utf-8?B?WVFFeXJqYUhtbjFDMUNEcEFjcmxuM2lNZGlrK1VTc2UyUHJUWWJsMVBOQlcw?=
 =?utf-8?B?ak12V3hOK21RaUcyTTRDMitIOFdNbFIrODhWZkR2OU0wZlZ3QzBPSndRaDJE?=
 =?utf-8?B?OHpxRnF2dk5zTmp6dmpUcVZOcnNZNms4RGl5ZEV3YTU0ZHFPN3lBWGJrZmxW?=
 =?utf-8?B?d2tXdFhQZUszNXFiamFoNHVpbnFVMU53RGlzakZvTHdBd0Z1M3RrWWRwTTFG?=
 =?utf-8?B?cGJyei9jemI0M1RPQzJhNnR5MVJFL2hNeVNkZ3JDdHlTZjJPY3VEekdxTDVt?=
 =?utf-8?B?WE9EaVUxckFTNC8xRC9tYmw3dmozVjZhVkFGd0RuSjBxQkdJTWxZVjd3NmdH?=
 =?utf-8?B?djhIYXVVcFRwSzlnakJITkF5dzl0aXJ3aFMySVNTQXhqbXd5Vmcwb212OTk2?=
 =?utf-8?B?amJ3Y2RKanNyTjJwMTNJQUk1SDVvRytJVnl2NDNHWGFVMXRLY3ZmelhybWdr?=
 =?utf-8?B?NGZ3TW9iT3FibUc4K3FUMWtwbG5kVFE3em9WU0VrdHFhYXhNckk1MUtYRXZ0?=
 =?utf-8?B?bFQxTnk5enZ3T2dvSzgxejMvRUg3NS9malhCTGs2SWZOaEFmZEJSZ1ZubVdG?=
 =?utf-8?B?M3dZY1RuZ3V6bkRzcDlZR1VLbUhMemNFcit5aDhYQ3ZSOEN5UnVWMXI1SGdI?=
 =?utf-8?B?SnY5QWgzNi9qZTJ6WWU1NVRLSmEzYmU2ZXIwNi9JaXc5bTRhaklNbFRFaWRZ?=
 =?utf-8?B?NExTNWtEb3J5R2YvUS9mbGhCbkZEMy9QRC9xZXJRZFZRbVFVb1o3TTVVZU51?=
 =?utf-8?B?b2QxVkRIRnlYQjJ1RXhNSmVqS1FGVnV1WkRac29zTlMrTVZsUjQyTWg1UWdO?=
 =?utf-8?B?UjYzR2VsdUU2ZHNtdG84VGZyUkpySWhqQy9RSWlkMS9zRDlsUzBkRjRmam9B?=
 =?utf-8?B?YmZacWx4Tm94RSs2T1JJVkRUaTVMdGZKVkxkdHZ4bmhXa2tERGlvL2plYTBl?=
 =?utf-8?B?bnNnY2ZWOUZkUGljeUVoY1kyRFQ3M21wODg3dzFCMkJZM3pxTDlzbHJPeVdt?=
 =?utf-8?B?UUNxcEFXQ3pkV2lsZWVZWC9pb1JRcUxjL05XcjhBbm5IUVNoOEJibWhZdzd3?=
 =?utf-8?B?M2d2U1JpaG9KcitRS2RGaHl0cmhVS1czMDVYczJTNG5VSmZlUTIzUWJZZ0dl?=
 =?utf-8?B?UjcydkY0dlZ2U2hBMmMzUTZEL1FQWEZUVEFVelUraUNISmpFQWdWWTJzQ1lo?=
 =?utf-8?B?WmlyTWFlVmd6SVYvdG1IRUZOcTFjYlhxdit0YmppdWdKUjVzOCtTQ2toVkpl?=
 =?utf-8?B?eFFhMzE0clhKUmcxMDF2RzhjOGlwZkc1dGM5c256Y0JGYWlxWXJ3eHltd1V1?=
 =?utf-8?B?WUdCVmFiYUphM3FoUmpYK3pEcXh2cUFQeHI1a3Fxb2FaSTJacHptbHhDZWFH?=
 =?utf-8?B?dmUxZlpDdi9SUjJMNWhzQk1Wa1BGVEZ3R0RDWlFuRVM4K1pnNXNVaGZpUHU5?=
 =?utf-8?B?UDNoTExwQzQxVEdOODJpVmptcEs2a3kxS2JCZmU1VXJPdXNvTjcxUFR0M1g3?=
 =?utf-8?B?Ny9BVmg4RjdtN0plYVk0cUs1UzhWQWtsdzRQenMyazdhNHU3Y0R3MEJ6Wm9t?=
 =?utf-8?B?bzh6RW02cE1pbGh5cnlnY05oZTUxdDVTNk93MVFxaG5oSUh1bExNckIzMUxq?=
 =?utf-8?B?TTRDRXJJWmxkRVF3K2RDMy9Obm1NWFpZWXRBcTVzYXpoeVcvSm5xeXdGSVFG?=
 =?utf-8?B?ekJlSzRwdmhtRGtaM25EUGFrdnlPbmVicDNUbDZPZmJSZHl5TS84QUI4WHI5?=
 =?utf-8?Q?3Ct35Fo/0QM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUd6UHp5c0J3R09BMzVrZHpEVExNZmNnWFdzV1RlWjh5VjJkSCtuMUxZQkpS?=
 =?utf-8?B?aGswdldPZ0JraG9KSUg3VkczQmFGanNNWU1VajFRSFFrbkxrM1l3Ui9ZNHJt?=
 =?utf-8?B?UzZ1NVBTc093RDlRcjEzeWpkUnZYZWZEVTRXUTN5TjJOWGd1NnJjK1ROVHdj?=
 =?utf-8?B?TWxoK3BrSndoait2ajhyZFVBMEJnNlZHOWRFN0lVdUxRQnhZRkVMS0hPTi9z?=
 =?utf-8?B?VzFNNjRkMVVBVExVcVR4K0txU3NaZFBZSUFZNTk2U1E2aUdjZ3R2U2E3d3lF?=
 =?utf-8?B?Y043VGdkbC9oTm1TYXg5M3pUOC81VHBKK0lxa0lKWmZKZnY3OUtyTkh2MnQr?=
 =?utf-8?B?RE1BbzFEMGNBUmZPZTdQVHRYem0yOFNZNFlJQjE5d0hEU2hDRFFmSjFybEE3?=
 =?utf-8?B?bFpqN0xmVXRMaFo3UTBSdm1hUVA0QjEvaFIxRnZnTjZrSURSTk1UVkk4QnhH?=
 =?utf-8?B?N0ljSW1lOWtJa2JXZURsVDlHeGhkQnJpZEFDQmV5WkxlNGN6cUNYbTdtQzRE?=
 =?utf-8?B?d1YrRFdrUEIySnVoYlQ5UldZYXNTa3pwNkFOVUhoaFg4cU9kajV3OGR2RlJ2?=
 =?utf-8?B?clBma3Q4L0lYeERiOVBMMzAweW9qOTVKVTJZaXVIT2tTbEVhK1NoUVExWTJU?=
 =?utf-8?B?TER2dTdKdGJqdTV5dTRzbnN0TTkwaWZqa09Zb2FXUVlnNXVMQWVWK0kwUnRz?=
 =?utf-8?B?Y0Ntb3JHa3pQZm9QVWNIZUJqMmhxcUtLZmVPR0x6YnpMVnVTRHl1MHBpSUNM?=
 =?utf-8?B?RHlBMWdUQ0x0RVlTaWRxbytHQXJwdWdqNm5NaUd4YkR1c3UzcHBsMFBzbi9w?=
 =?utf-8?B?WEJrNys1clJSd2hSYmx3dllvVStlUXgrVXNKVXBXME16OGhQN2RiWUNiQ0Vi?=
 =?utf-8?B?UjgxdzFhMktKem5GdDd1QmQ2aHFXUUpOb0xTeCtIMGRSNmpBdUFhY2xrdUdQ?=
 =?utf-8?B?eDRzWC83bndaQ051M2ViU2tBclhUM2oyVkpyZVgzTjRWT3N1dFZieDJiUXJQ?=
 =?utf-8?B?TUlXUHRWRmc0RytQdW5wMWIyQmlEQ3JwaU5KTlBBMll0cE1Gc1grZGdTSlNl?=
 =?utf-8?B?aWtzUWZUSmd2cTdzOWUxSXpUeHFkRE1HSGNKNnZEaW1KWUZrM1VqMU9YNlM1?=
 =?utf-8?B?Zlg3eXF5YWxKelp6MXVVM0pSVExUb1hwQXk5Q2JKNU1HaGMxQ3dieEhlYjky?=
 =?utf-8?B?TWpHenJRdkdwUVhPaTcyTmpQL1FVR0wxTjJxdTlyQkJjMmdiNjNXbWkvTll3?=
 =?utf-8?B?YWhXZlQ1bDVsSnUxYm9xcnhkTXIxTExNSmRDTFNiYVh6Y1hZSEtPb2lOWm4x?=
 =?utf-8?B?eW9mYTBocWRyaHRzNE9wdENPNUpoTFFoVXBGbm81eER2SU43cm5KR1E1UXlY?=
 =?utf-8?B?TE41UUpncklrQ1ZzbzVIbmczaHhMVUxmdmw3V0FtckcxVlQzYjdUMTFoeXVZ?=
 =?utf-8?B?cWtPdDhzUnNQK1BhQXd5eEYyLy81QTlMbmIzSjhJcDh6M2dYQ0lOUnE1V2tr?=
 =?utf-8?B?WVc3ZVJhME8wSkVhK3ZwMWJEb2RkYWRqZm5QNkhhbHN6SnBmUFRYb2YrUzAx?=
 =?utf-8?B?UW5kOVEyRm1xWGdmNXE0SXZPaUFZVlFnZ2NnWDc2RERqaTFvTi9tSklWQ1Ny?=
 =?utf-8?B?SDdENGpZWVo2Z3ZMVXovNm9HeFJxRXZFWFVGTlp2Yk5ZMldPRkVkU3l4eDV5?=
 =?utf-8?B?ZUJZdUFxTVFsbnBKM3pjRi9pa2RPb0I2Q2ZkTkV3RFZkblZJMmlwNDBUWE9V?=
 =?utf-8?B?b2YveTYzbkt6UlJPaVRNZVZEZ2FGV1dON3lNQXB6Uyt3STZFZWVSK2UzQ0hI?=
 =?utf-8?B?dnFXWDY3VTBrVDFkSW1td082Z0tubGo0LzNraEdBcGFNSzNsbEJoZnJhcGlY?=
 =?utf-8?B?NWdOc0FGRTZ2UHI4eUNySWp1aVRBUzRGSEF5UzJ4c0oxTE9UU0N2ZWFHYkRT?=
 =?utf-8?B?c0psNWpMU1YrK0M2L3NVNzVGTVVwZm1BL2FHLzdIMHBQZDRKamNCV1BKOEsv?=
 =?utf-8?B?OVhOUDlnNXFkd0ZDQXBja0dPQnVqbDJGZkJzSG42ZTNKeGhIM1BGbUhVM3Y3?=
 =?utf-8?B?eDF1VTdEQXBsTWhxWmYwREwrbFNiSS9RU25VVEViUDhPZWlXaXNrV28rT3dR?=
 =?utf-8?B?UU10eXhRdGNoYUZpSkdjamJYRzUyMWsyMFQrWVBIS2wzeUZMQWs1am1vcGI0?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f69e947-45c7-427a-32be-08dda349632c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:22:54.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmofnkgMlVbuZ8BOsHZpoKRfNTLuv5jw+/6TYiL0Bxy265V6LhAq/qwh6udQ0hiU0MGtO719cbrAW4K/LV+8hvKi6IBwQvTWZphcIBYlwG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10442
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 09:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217896

Hi Yoann,

On 6/3/25 11:59 PM, Yoann Congal via lists.openembedded.org wrote:
> From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> 
> With this change, layers can use a conf/include/known_non_repro.inc file
> to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known
> non-reproducible packages to make them automatically excluded from the
> reproducible test.
> 
> Example of usage, in conf/include/known_non_repro.inc:
>    KNOWN_NON_REPRO_PACKAGES_LIST += " \
>          this-package-is-not-reproducible \
>    "
> 
> This uses the new "include_all" in the reproducible test and will move
> the maintenance burden from AB config[0] to the layers themselves.
> 

A few points unrelated to implementation:
- maybe we can shorten the variable name? NON_REPRO_PACKAGES would be 
enough no? If a package is listed in there, it's necessarily that we 
know it's non reproducible, would we have a variable for "unknown" 
non-reproducible packages? Additionally, we already have a PACKAGES 
variable which contains a space-separated list of packages to build, so 
maybe we can drop the _LIST as the plural of PACKAGES kind of imply it's 
a list?
- once this gets merged, please provide documentation in yocto-docs for 
it :)
- why packages and not recipes? Do we need a per-package granularity? 
Isn't the recipe broken if any package it generates is non-reproducible? 
This would also allow recipes to add packages without having to also 
list them to the NON_REPRO_PACKAGES list?
- what happens if a layer has a version X of a recipe that is not 
reproducible, but another layer has version Y that is (or vice-versa)?

Cheers,
Quentin

