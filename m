Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1852D0E6D1
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 08:44:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web10.41726.1729500247885832223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 01:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Pc2d12/q;
 spf=pass (domain: cherry.de, ip: 40.107.21.71, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q82hyISJ5BSMTPz3IsaIZv31KFpkz4OWjw9zd8iStHltXO8cL+7pGk+q50hOU9LILTT14/bZJGhvqAV82iOi2eVCScBs53qMjZ/QPYBNISusHkO8nrcOo0EHPt349jhDmnNQLSvBgBfdUjpQzzCMtdzxU2CULzLUhRTjURMO+us+Ts10/U6wK3gtJutujkzTPVSZ87EVBzcH6634ITQRILq8TMz2bxB1W7KKKeBsBEIbpUu7X3S83DKQkHZ9UXzTYZT3Re03DhEr0eRGpqNHTqGJC+4v73IZkCsudqYUo9qhusuwPdrYmYQjbEIDmyD4KlsCg1nBmty8gJpf1z2aFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDVbGA+cjfkGXUgPhbW/oQgV/xEOtALmP5kMM43j1Pk=;
 b=Q4f3d0bjucnjXm3gilMpimjJJCcbmWHCg5gLP9xc7hcafwebxO1TShLLXv6iHOin9nxkFrkRW4FcllnSjV+q3UBssGSBEq6tQ0zGNZ4dTmVzJKWoW9OgwTWZsezAa+gkL0/tnBEqLA8/g5ZsFFMh72LNHL32zGxvK3Ag588jB7ABlCNcv9tYiuPnUFqVRQMBrqD8YAO3dxxISnZXKvD4vpIP5OqMeaU4pEog6tad1Nkt8VDG+F0wnGuUNRFoCeAmv8euRQgUfGfEx1IZVhZZYsGr8ytnV+c8nmKjhLu74yO/1f1wS8GD6Zl2Clqjj9uBGH8D/H/qf18q7yzkh74o7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDVbGA+cjfkGXUgPhbW/oQgV/xEOtALmP5kMM43j1Pk=;
 b=Pc2d12/qSrnLh10B1JkTfD77Ppx5np1oSJsnZTE3U9EgDl5NvpDYIYuQJ6+vBawDOtDrvpRW3Km14POLbCxQVfTPhVUUvYZQKvVI2seipEh7NzWHA/pJHKJLXumyePnRgSVbd9mjzZ8jKLlI/xyycqAMvzbzbtybbp9JDhvOFyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by GVXPR04MB9760.eurprd04.prod.outlook.com (2603:10a6:150:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 08:44:01 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.8069.020; Mon, 21 Oct 2024
 08:44:01 +0000
Message-ID: <40e35aec-8f81-4117-a49a-a18d04ea67ab@cherry.de>
Date: Mon, 21 Oct 2024 10:44:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] libyaml: Add libyaml ptest
To: thakur.virendra1810@gmail.com, openembedded-core@lists.openembedded.org,
 wangmy@fujitsu.com
Cc: Virendra Thakur <virendrak@kpit.com>
References: <20241021074210.751082-1-thakur.virendra1810@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241021074210.751082-1-thakur.virendra1810@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|GVXPR04MB9760:EE_
X-MS-Office365-Filtering-Correlation-Id: d380e54b-9fe8-4760-a71c-08dcf1ac82ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UkpnWmRQMm1sa0xxSGdCVnU3enBVNUZrL1JmY0NXSW1mczhnVkRpY1RrZ0ow?=
 =?utf-8?B?dGZlck9SOTZtdVRrSFJxc2xWTXQ1SU4yelJzNm9yVm9wRjJlYmptdnZNL0Zq?=
 =?utf-8?B?Nk9YRE4wMnREL2h6L2haNDlycFVkeUpNckxONlpmVzB0cnJVWnllMWkwa1A5?=
 =?utf-8?B?SXF6aGFtK3paVkNNeisxU1ZMRGFhVVBoZGI0QTNTbXBXUy9SSnZ2bkc2WFpr?=
 =?utf-8?B?TzMwYjd4bWc5UmcyNHhGbGhsTG1MOW5FMXQxbHlxM2xSV3hFNVh3WnJ5TVNj?=
 =?utf-8?B?b0FSeER0M1E1djVLaG54SFJLd21LQUhVTE1CcDBqd0VRS25FUzBnTVZWTEVu?=
 =?utf-8?B?aGJrTFFmWFM2dlBiU2NGU0pZTldzOEpYTW1WN05WWFRiYXppeXFWanZZNFpu?=
 =?utf-8?B?TG1pSGZ0eThhb040YjE2SlcrSkI5VVl4cVpwNUFEemdLRGRYZmxaOWwwb3p5?=
 =?utf-8?B?TEN6a2tSVzZFSjhrWWI5d1JXMFFmcWVuODFXMmtZR0wxR0Z0VlBYMTVZSEN6?=
 =?utf-8?B?YnFWOTF1eDk1NkFlajl2ODBPaXhaazF0L2xQQ29aZzUwU2lQbGg0SWRXM3Jq?=
 =?utf-8?B?N0dYL2VxWklRYzA5TFRFanNBWEdCVUU1ZHRHaHB4TU92OHpDU1NxNXZndUQz?=
 =?utf-8?B?eSs4c0JvRXhDVHdmcWdabXg1MUxIeEgrVGJrMHRnK25Vc0c5cjRMbDd2QTRW?=
 =?utf-8?B?L1ZPZkdBVkNRUGt0bHhTWXg0R1FzaWJKaTJIVXVVVTJNVDlrSFA1Z0pjUEdH?=
 =?utf-8?B?MXVyNnhIbUp5S3ZGU1ViK2JSOEFMdUN1YWs5bCtZSVlHVHVBTGUvY0pDYnNs?=
 =?utf-8?B?K2tPeXZSMmxhNlJEMTBUZE8yQndkOS85QUJBcTNVSGdNMC9FSjdhdXlhRklW?=
 =?utf-8?B?U0tucDVTN241RlFiSE16aWpvUC8zbmlmOE9PQ3F5WFZhVmRKc0ttUHNOUDFy?=
 =?utf-8?B?RTFxMzZkWlM2VkNSN2Y1Q05rUlVMR3QwT2hkQjIyZDJpbW92OUNyQVZtZ0Q2?=
 =?utf-8?B?dHNGQmhCeFZ3eVVpaXhGRlpJajU2ZjJ3R0ZVKzZ0Z2dXM3dTU2pab2UxTmFk?=
 =?utf-8?B?MS9FSkIxcTUxVU1Bd1Q2WmZRUFpoa1FVbTlXV3ArQzVseFhwUkpHWG01WUdr?=
 =?utf-8?B?RnQ1TVZ0Uit1bXo3eGNkbVFxV2c5L1d3d1ExNnFyVkh5Y0Fvb2ZCN2c4bnN2?=
 =?utf-8?B?VGpyQ0F4MnFPTzhqa3JVNG50YStJRlJrQ3ZqQlJhUlV4SGhnb3JDZVRWVXg3?=
 =?utf-8?B?Yjg4NGdwa2JKSDYrellyOW8vRzh3dHB0UmdMbDJwaTFTa0dvT05IbGpuYXZ4?=
 =?utf-8?B?cWZ3N3l4Q2ptR0F5emp3aGFWZCthWHdmUnIrWkhZMXd0dURRM1FaYXRRT3Uw?=
 =?utf-8?B?RXJEN1NaUDl5K2E0TkJJWGQ0eEpYRVlLYlJZcG5zMHQwak5hUVpFVnQ0VTh0?=
 =?utf-8?B?bUoyRFNFeGxSVktQQ3Z2VExEdWsydEJ3VExicG01SmYydlhhZElPa25aZFBM?=
 =?utf-8?B?S1lYd2kyODBUcGVGa2tFZ2QwaEhMSTd6NDU5NjJ4Tjd2Mk5WNldLTExCUjZj?=
 =?utf-8?B?aHJiSDR4ZTFoZnhDMTRpcnQ5YTU2elRPNVB3SklDMW8rK1NFeSsraDFHOFR3?=
 =?utf-8?B?eHUzT3QrQTlWdmk4dERNTlpFMkNjeENDNWNKVSs3clVyOG4wMmJ2bk9qQVBZ?=
 =?utf-8?Q?byclhB+OT1VpG1h4VKLs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmFKUWc4U3o1MHE2dmlOZml0eGJYYVR3UjdsWkpoWS9HeEtFYTVSZmdjeFB1?=
 =?utf-8?B?NzhMMHFoZ0dVcFJ2N3huQU9iMEcvcnM0ellwTTlDSzl1Z3lKeXdnbTh4UlNx?=
 =?utf-8?B?MnliYW5mQ0lCTUZ2RzlmdVRIbjZYZWxVNlFKTHZOR1F4cWN6NHpjVWRidXQw?=
 =?utf-8?B?eXpvTjQrMzhFWG1BeC9HaE5kTHAwUFptTmtYVkpEUHFtVEl3OFdjNDNISlhG?=
 =?utf-8?B?c1E1RGNUYkM4b0xmZTNvWEsvZWhab1VrVEVyVzFTOTJ6V1oyYlpGNkRKU09V?=
 =?utf-8?B?VDBRTW5zdFl5bi9JK1pRUnc3RE4vTUprWVliM2huLzdsZTBZdkhSWEhVOFFH?=
 =?utf-8?B?eWl3ZE1ibnJKaVhpd0NyTnd1VVJJSjNkM2p1bmM5czF6SU13T3RsYmsrZkpt?=
 =?utf-8?B?TjRTa1hXQTRlQUIxNFVUOTBTSUl4YUNoZUczTWoxVzVaRDNrU2F1YnVTTFJB?=
 =?utf-8?B?b0pBTVdCVklZbUhwbTZ0SHJmVDhDcGVWaE1FOVpSei80T1VUL1pETWFSQWNZ?=
 =?utf-8?B?Y09GeXpXcy9OdW5HdlBmN04xS3dyYjhMcDM3TnZSOWJwaVlhcTMxVGhqZElU?=
 =?utf-8?B?RmJXbUFLY0tlOGhyVzJDYkpiaU0rcTBFNmQ1NzQyTnRLZnZqU0prMkY1aFlZ?=
 =?utf-8?B?UkJXdm8wL0N1L0NYdTN0TEVOV3R1NlhING9LVWJPbTcwUXRkbWNPSkNJMGtI?=
 =?utf-8?B?Y284N25LRkkycDBNK0FCK3daalprWXdLQkpHem4vOU1yejBUNHU2NWhSR3VB?=
 =?utf-8?B?ZWU0dkxscGdzV2grdnU4TEJxc0lDRERHN2g4SEw2TkZRZDZVSGRvZkQ2ZVpr?=
 =?utf-8?B?SytYL0RiVmhhWW54UHV0U2FQRTd6dzY3SWIwdE9ocjBFbEdGQU1lTWtIVDlH?=
 =?utf-8?B?c2pFZFpEeTNLQkhTMWlWaUNaTm1lU29wQUdxTUhCSmFrVk9LOFI2SW5VV0Uy?=
 =?utf-8?B?ZExldzgyL01XV2JwRm82MEVmTUZBdktPUTVYYUxrMjlTaXprdlFKTUZOYWcv?=
 =?utf-8?B?b1ZVZWhrS2EzVVRZVE4wVVgxeUVEMjM0QmxvTTF6YlBjVDFna2VZZ3ptYWZ2?=
 =?utf-8?B?UWl5Z3o2cE9nemJEL0Q4UHphOHNOS21ZOHZNd3FnZVpHNkZnSER4MWJtMHNL?=
 =?utf-8?B?VTdNcXRBMVpkanUvbFdUZ0ZOeTFwNDNIbXFMSkFLNmd5ZHZoa05UYVZYbWRZ?=
 =?utf-8?B?TEJuUzY3RzRWSjQ1ZkFPOWhpWTdsS3NSdmxJTDVONjA2TDlkMTZsRGZxbmkx?=
 =?utf-8?B?S1N3eHl5VDJlcXo0QWJQcEU5Tnd3a2E3YjNCWDJoSE9qamk1aDdKd0Z5blhY?=
 =?utf-8?B?TDBrdU4rdWVFUzZXREM5YXNvQjBrOFczOEFIVStWcUU2b1VKOFdCeUpMUklK?=
 =?utf-8?B?TUV1dFIvVDczMXUxeHN3K3gyZ3NEQ0thdzJTMDJFU0pxeU9idlZpRlgycUsw?=
 =?utf-8?B?TmUvMDc5L1VFK3VHMjdsQjNqZVdBMmM2U0xmTXNEV0hTa3llWU1WbXNzcGhS?=
 =?utf-8?B?aHNlVHlhT3lUZjcrcFFDVzZNT1lDUnpFUmY5aHMzdmNJaStOc2JDRTVQOXVE?=
 =?utf-8?B?blRHbnBEM2MyalFBMGhGMCtqcHdlOWM4VFovbXd2V01TQTN3d3ZManduOGxE?=
 =?utf-8?B?ZHhnWVNHRENvMWxRd3FPKy9TNEV6d20wNnRtSVZyL25CbkhCUFZncTNPaG1H?=
 =?utf-8?B?aFhRZXVnYk12cVlqMEhPeWJOZVRUZFFGYVVSTkdFQXFUNlFaelJKQ29BdW9v?=
 =?utf-8?B?aE4xak1tTE9lMEFQdSsyZmVSdFVQK0F1RklPdU40ZEhrdWRnNEs2SnE5Ym1O?=
 =?utf-8?B?aXFkWXJGUzlQQW9ZQUFSTGtxT0kzQnR0MTRoRGhSRTBxdXRUaUFoWnZnU01T?=
 =?utf-8?B?U29Rcm5JRVJ5UEJoWXR3NnlQQXFXOHdRNkhLZE5pdnUvY2I4Y0JlTEczWmlU?=
 =?utf-8?B?Y2M0K045d1pZMXNCYUUxeitjY1hXR0lieW5ZNE5vZjlHbjY5SFFZS0k2c0pH?=
 =?utf-8?B?dXpFYnEvVWJaV0dHR3hETU9UZXZjRU5scThCandOSEZucmo3ZVJld1Rxa0pE?=
 =?utf-8?B?SlU5YnNFeUZGRjR2aG54eEovK210ZVQwbU5MaGYvRXNNRFJISVNOSVNYcXBL?=
 =?utf-8?B?SWREV2xnSEcrTVlsQUw3V1JvM3BTUVRyUndROG41RXFBRy9TS1FxcExhSEVx?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d380e54b-9fe8-4760-a71c-08dcf1ac82ee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:44:01.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5l00PeUBJHlU1OaK8n6ehJHJd70dxiQ2eWpHbAhgbATE3RiC29uGnNnbrZpJmgBmsGLjFz+OlY11GG9EyfTkmSNhagQc9FYag2UmDWJX2DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 08:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206098

Hi Virendra,

On 10/21/24 9:42 AM, virendra thakur via lists.openembedded.org wrote:
> From: Virendra Thakur <virendrak@kpit.com>
> 
> Install libyaml test suite and run it as ptest.
> The run-ptest script iterates through executable
> files copied from the host, runs each on the target.
> 

Is there a reason this is targeted towards kirkstone and not master? We 
have some rules for patches going into non-master branches, c.f. 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches

Cheers,
Quentin

