Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171ACC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 09:33:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.web11.36447.1753090380949823841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 02:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZSgpB4VK;
 spf=pass (domain: cherry.de, ip: 40.107.130.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX2WgkYTd+f9NUKWs0DaKV7uPVmEJDM6lmWMxiSQzx54vLIZeMWY90Z2x9Uro/l9qd5MLTv6P0X4+GupULvvWm4SEgCbhEVlqLRGtdO4K49RVgYdZmVdGfFljuUnzjflbzyP2gt8kTgCjPpUiTZH7aqWNIr2EvE48cUDDvM105vYntg3U5v8r78wBe9g5hKt9o+K7ifFrufitXVF3lHvPWy4181o3RfqgnHGbEqTS57zBkvmDRhp+eYpEkSxCJsjkbeHMPw2alau9mmG9ZAfxMLAFV7UbPm0OoLz2SLkRaVzqh/YB2Y2Rx5VcOnjaMDwl2p4VQLIPKv7hvbWHXI/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0QIgswlhh6sR2SP4VFLZc53DoxQsb5XCPoAekqCGCA=;
 b=H3sqcs+WMx2WYYSv7HGNpgvEqF5mtj85QP6v/UtbsYWHDKfIyWcoKdcvtxr5ZQNFtcsl7UbljHPBMDK/QINsV06WvUvUWT2mVi5+FHHClRztc46GeA+SsVY/DQlOft5GQtOTXyUFMJS9Lui6XKydLhOI+/qBVGwqSS1p248G4g0413n37Sd+/VBjuM12F3F7xA7odEGPrOAlbZl7/gRMsDWMoc8SvkyhYAKtnC7sRZ0gF+PqXsrzuCf1/MLdVzM2IEwbSYjgh3RT+MLSm3mzmjCT6wGE73zHPA666Nms4RgROatXRLPsOdgpSj0mJGRcW381NooFRF39/guckoHkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0QIgswlhh6sR2SP4VFLZc53DoxQsb5XCPoAekqCGCA=;
 b=ZSgpB4VKOF/509VJ+ANpAldsOvsZ1Kg7E3vZy/FGqB7mbBFkv55tZIgCB35x7mqiW26C3hRKOpzQ2ZXU14RUSXuNqdOIkiZaTAqOU78b3m4RQWVPfujdAocykB5LUPVWDf/KDupTvqWHsRShGQsmSaDIaQTBGbL895WFG3Wed1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM0PR04MB6947.eurprd04.prod.outlook.com (2603:10a6:208:18d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 09:32:57 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 09:32:56 +0000
Message-ID: <38fccadf-0b86-4937-94bb-042ec0b6ae39@cherry.de>
Date: Mon, 21 Jul 2025 11:32:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] systemd: add libblkid and libfdisk
 PACKAGECONFIG options
To: hiagofranco@gmail.com, openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Hiago De Franco <hiago.franco@toradex.com>
References: <20250717211621.7122-1-hiagofranco@gmail.com>
 <20250717211621.7122-3-hiagofranco@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250717211621.7122-3-hiagofranco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0143.eurprd07.prod.outlook.com
 (2603:10a6:802:16::30) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM0PR04MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: e595d74a-7dc3-49c5-2c1e-08ddc8399338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZVVFenhZYnc5QXdFaUVCK0NUbGtZc2xQYThkbHp4cFVHVDJhb2JJcFJnN21w?=
 =?utf-8?B?bjJ3RlFlY2ZVRDdUS1UzV3F6a0gyaEVLamJEbnc3aWFFdnFMcXNNWEpuaFFE?=
 =?utf-8?B?MVgxTUluNXZzNmw0cVdFQWtzdnJXRkY4ZU55RHNWTHA5QVB5eEI4M2RQcTFx?=
 =?utf-8?B?UXJrSjZsS20yOEU1c1hUOHA5OUZYYkJqdE5JbTMzQ0J6bWVTRTl3djk5MnlY?=
 =?utf-8?B?bjA5QkEzNzZwU01JLzRnSGptMFd6a0hUZUc4WDR3dmpEUlhBaEpkdWRxRjZS?=
 =?utf-8?B?VHFoSGxnQWppZEtrWm5NMGRua2ZNQ1VVWUhsWXlzQ0xnemdmRHlQbE01ZGtC?=
 =?utf-8?B?eVpCejhLWVRUamNRa1FJYzkvb2xka2ozbHNkdXdmeWx1djFSWnRkWHJPenNB?=
 =?utf-8?B?UCs0R21OZDJhNkFpRGpBZFJ0dUYza2RHTkhDQlVhR1BQYjVxVVRZaFVlcEZJ?=
 =?utf-8?B?Wk8xWVo3V2l6TjFpTzE0L0laZWprSEtHV1NBM1loRzBZTndOMy9PVmM2dXc2?=
 =?utf-8?B?dXVpdkptRWpaTUNncHpMV2I5a2dGN3NnTWxrNEt6em9aeUVHcVVVOE1jRmE5?=
 =?utf-8?B?OXA1Ukt0d3Jsb0ZncWVyWGp3d3ZhZkFNTmJRVjBJOTJpVDRQb0ptOGRlV090?=
 =?utf-8?B?NWFWZVFQcG1yZFlrYlF6dHNVU01tMG5adERqcHloK3R1R2dZRWoxd3FsSUk0?=
 =?utf-8?B?blB4MHJCMjFPL2pYWGx2NHVDMWdZVWZoblVLV1JQbWtKZk5XRFpFdVBtdWN5?=
 =?utf-8?B?bU9OdVBsait2b1BoMHZhaEY4TkxLWVFPMXN0amNnY1Z0MW1CaUEwcjdaL0Fw?=
 =?utf-8?B?MzdJak9Bd3l0OVI3VnRBQ2k5MEJNcWRDYjhGMHZvNXYyWTZPeWpNeUJHcUMx?=
 =?utf-8?B?S0hXN1BOOVl2K3doWXpvdUk3Zjlwako5WHM1QmxPSGFPdmNyL1kzaWRKYnA2?=
 =?utf-8?B?ZEtpbFJqTC9SK3R1U0YxekFueFB1UE00ZmN0UENOSHpqb3RiWC9wV3lGVkIv?=
 =?utf-8?B?emI5Y1Jadi9EM09kYXRCUld6cktyRk1RbHZHblN4a2toRFdjSXJ4c3lhV3Bv?=
 =?utf-8?B?eTFuMDRTSkdYbUxCUFJSOHVYNnB6ZVpHZG1EUDRadGJYSVZYZlBJVTJ5V045?=
 =?utf-8?B?SEZDZmxzWTB0R28zZkJyY0s5bXdNY3R5QzF0RzVubHJlV3grdmdvQXlpK0VD?=
 =?utf-8?B?MDN2SGY0Nk9EYlU2bm83dE5EbmpydjUrUTZWU21UNzk0T2l5bUZjd3JyN3pu?=
 =?utf-8?B?WTMyanhRY2R3VmJRNit0cGxFeExrNkYxY1g0NHpjY0wranhmdldPY3BIdG0z?=
 =?utf-8?B?OUhxRjl5amNMMENRT1dodkJkbU04YVZrclJaM1hWd2lka0xkUituQzBXTjBY?=
 =?utf-8?B?VHRHdjZ1ZE9lbnJsQlFzdnd4NjdYaFd6T1d0Y0F6RXhmZExNa3Y0K3NxQjd3?=
 =?utf-8?B?SVZOaWFONkpvOEtqbU1adG1WMnI4UzBXV0NKVDRnbFhHc0ROVnQybWx4ZE9X?=
 =?utf-8?B?TUdzT200MHhuWEYwSlBrNXc0NmNHNWpIZjR4ZEpqR0o1ZFV2QjE1SDV3MWc4?=
 =?utf-8?B?QTVPSWRqcUJuTFJndzN5bk1IOTZhRTdadTQwZ21lM2ZINjlRQ1d6VzZsdGsw?=
 =?utf-8?B?bW5FYmx2Y2dTNXMrdEVPMHRlL0hPNkl5d2RHRTR3alE2S0p1V2lpRGdSQncx?=
 =?utf-8?B?Wk9LUDdDVTQyekJMY2VCQ1JyOTlSQ2ZwTFMvaWcwSHRiQWtiTVNSTmYxQ0Vj?=
 =?utf-8?B?RHI1aTRINjhHcDNwNXU4Z21MaGZBdGpsVjJMOHM4d1UzTWpxam13VG1BMEUy?=
 =?utf-8?B?dFpzc1Q0dUUxT1o4SkxIMXl5TE5NbjBXT1luTlBvN21rL3RubTl3M0JOQ2lh?=
 =?utf-8?B?Ym81Y2R4RlNCUWZwSktYR0M2YzZUemhzYzNXY1EyRXhEVXM5WDdSM2Q4RGZl?=
 =?utf-8?Q?MHWBjuNtQ3s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dG5Yd3lTc3J2c2JFc3YzdGZtLzN6aUxveXRpRjl6b3o3UFIyNlhsRVpNMU5W?=
 =?utf-8?B?VVpXd1R5NllwNzF4WGRXUzRiZmRrZDRhSXNGUkxtNnc0dVJlejhjRllMTk9G?=
 =?utf-8?B?UEd3MmZqT3NJanNUNjhzbnJNYk9kY012MTBrL0R6NTYxdWtVRVhGWThZZEtu?=
 =?utf-8?B?dFJiMDFtMTc3dFo5dmZUeHpiLzFBTDdVblhxQ2l6dkZqaWkxK1JzTUs1MVlw?=
 =?utf-8?B?cmJZK0lDUFVmUE1UUFlPRnYyUkpRNFVOdWFZN1pFRGJXNGdNb0RQRHBrekR3?=
 =?utf-8?B?ZkRnV212azNCOWZYV2VvSlVxdjdmSGlKT0lYQzhaNnR6MXZ4THNCam85dlYv?=
 =?utf-8?B?WWI5QnlxamttS3RMUS9iaytFTTdNU0xWeVI4dllkUkhBTXlPdFR2TE5qbzJU?=
 =?utf-8?B?VGlhWlRWWU5CMkJpakZjN2hJZEsxUUFVV3pNbnNFT25vVXdXR2lTM1VUc1R3?=
 =?utf-8?B?MzJ5MHVUVFN5VUFZUHJOSjdTMG1SYTZGSDJVNlhsMERFZEJ2U3FCNkFrSlVj?=
 =?utf-8?B?MTFEeTFpQzhnQ2lHRlZnblNHZjJCaklHMjVhVnZ5Wi84WldNRi9FYVFWOTdV?=
 =?utf-8?B?SStsVTNBU1JNODkyTzI2Ujh2VmF4d1QxNDNpMDUwMmJNdzlJUWRGSnVncmlQ?=
 =?utf-8?B?ZlQ2ZkVleDIzekN1WjF0OXJpdW5NNzhuVGUwQ2lGRFIxSnFVRVY0MWluR2hu?=
 =?utf-8?B?dlVpdVpGQU1TNkE2UGVsV2ZmSWxmVzhRc1pOeFhFM00zWVM1NENZSFIzRlA1?=
 =?utf-8?B?ZXltVllOUE4wc2FqbWJxUUsxL2V3OXpIdmxaYldhZ3ZxZ2NIMmhwZGw0UzM0?=
 =?utf-8?B?MVZ2VkNoaEpWanBpQjI4MUhQa1RLMFhiWllIU0cvckVVOC9ITEhURHhZQ3BI?=
 =?utf-8?B?THE4OVFWbU4wWFZ2V295Q1B1aW5URUFyNFBEcEpkSHVyOXJQcktIU3NISUZS?=
 =?utf-8?B?VlZVWmZZelpzaHBnMkdoWk8zRk8vNTNLN3grc3B3ZFFvaE9WaDk2WUJwNHM0?=
 =?utf-8?B?T0NkOG5Pai80eTAvRnVaNS9ubElpTHArYSt3SFNqLytVS2dGN2VzQWd6Qk4v?=
 =?utf-8?B?S1BuaEF2bGhCTVBSMXBUUlkxNHVBS1RoRlVqaTk5bzUxcUZ6ZHNBRHVISVI3?=
 =?utf-8?B?cVNPNGZKcGFQbVVmTDR4TW8zWC9VbUlETkFPRTRUYk5IOHRTYkE2Y2dlL2lJ?=
 =?utf-8?B?RDRiNCs1QkN3QzFnQnBuc3BqTTFlVHpmL1NsZi9ZeDNFa0dsWHZ4a3JFd0Fv?=
 =?utf-8?B?bk1VclN1amhqSTZPbDcxd25ZeVBrRTV6N2M4bCsrbHAycmlCUkpVNFA2Y2pS?=
 =?utf-8?B?Zjl4ZzBTMi9ZTkR4TlNSOGhBbHlJWUVJd3RjWFd4ejZRczBXL21LZ3Q0WFR5?=
 =?utf-8?B?Z2FTNk9Zc0JJTG9uQzZQNDlYQ2toNEpDY3NlNGVlblVRNEUzVW1Icm1XVjF2?=
 =?utf-8?B?bjgwb3VRNlJoYm51b2JsUllqZ1ozSGhyR2pvTzljcGVNZEFkaStYWXBIZ1hH?=
 =?utf-8?B?QnQ3OVlneGtacXBuemtDN2F1L2VUUmFrektpMmk1dDhleThManZoMzA5SkJS?=
 =?utf-8?B?UFgwNENFMEpzL3JKa3VtMDNJbnJOTUhHVmJ3S3FUNjg2aFNlL2lSNnpIRmsw?=
 =?utf-8?B?eWVMSUNISjhzeUhDQWhBQm5ZOTg3cjBpeS9wQkZTdU5FOXo1aU9ocTdOZkhV?=
 =?utf-8?B?WGhEbzFsY2Y3K3c2Q0E5RmEzNk95VnlBWnVQL3B0YTkrckVaZUM5RitvS25T?=
 =?utf-8?B?TVVPR2dUZnFaYno1K29XNWRNR2lTS1lPQmJkYlRPeGs3Qk1nRFQ2Yk4xbVpy?=
 =?utf-8?B?ejl6TnhLYTZIWFU5UldMVWRmRjAxcTgwalptY2srbTVLZEd0L0phY1NldEd5?=
 =?utf-8?B?cXV0QWVmamN1dGpBbnBmamUyWlZFUmlTeEZSdVN6WjE2QnZJQmk4dUFNbUgz?=
 =?utf-8?B?MlBwdlRENXQrTFRGWjMzT2Ewb0M1N0ZWU2E0eVBld2RpRkJMc1hxenFJdG8y?=
 =?utf-8?B?SHVGWnlsRE5UWXovWGs3MGR3WTlSVUk0dFlUNzdDcC82U0RZNWxlajdWLysx?=
 =?utf-8?B?NkVaT1JPcDJ2cG9hYmVtTkRtV2Q3ZTVrMmtJVFFWQ1FMMWtvQ1FlL1d5QzNQ?=
 =?utf-8?B?WDdwU09vYnRYdDRKQTBEalp2U1J0ajI5a3kxaURBVlRyVnRwVVRSd1lLbW1L?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e595d74a-7dc3-49c5-2c1e-08ddc8399338
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:32:56.7041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0Dou+Zap5gmcCimG1Wz7ZcfQUWbXgKYIpaeUlBf5UmABeZV/lTlBgpMkZ0e9844NyavjHrc4jasFvfvarCOngLt/OOo2oHzLp3X7DWIolg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 09:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220670

Hi Hiago,

On 7/17/25 11:16 PM, Hiago De Franco via lists.openembedded.org wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Introduce new PACKAGECONFIG options in systemd for both libblkid and
> libfdisk [1][2].
> 
> Set blkid as enabled by default because the bootctl command depends
> on it to be built. For example, images like core-image-sato-sdk rely on
> bootctl and have specific tests for it.
> 
> Previously this worked implicitly because the upstream Meson option
> defaulted to auto, which enabled the dependency if libblkid was present.
> Now, without explicitly enabling it via PACKAGECONFIG, the feature would
> be disabled, which triggers testimage errors.
> 

This seems important enough to be its own commit without the new fdisk 
PACKAGECONFIG so that it can be backported to stable release(s) if 
needed? I believe this is the result of commit 43abc59a275e ("meson: Use 
feature options") present in v255 (presnet in oe-core up to scarthgap 
apparently)?

Cheers,
Quentin

