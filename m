Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D561CA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 10:41:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.web10.48273.1756723269920873828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 03:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TRvbz0Fy;
 spf=pass (domain: cherry.de, ip: 52.101.65.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0bilU7wH6HXGFMR6qDouRK00CUY/+oJ9pWFaRS3fINHEpk5Bp0tPX4eBY0hMRTEs+Yzjc2CNeGyeDs5selnFzwjak2zIbQH/DqAADFfiN6mixBOLRHSM5zSx9ncDzMUYb1d1qUUXI9zBpoawll2vUX+wBWFFgKQt/zo1w3jdCSV9exqJsohTls/xBZOIZh8IBRDurpLLyl6gcsOnIuLmZouy8OYVC1oWOv12nw22JOaLgOGzKl2bgFd6PsXeIs6iN3TJuJJa52T7g2UoVLSm0t2WnChuXvOCP7azsLOD1eOkg0avivefivYuwGiyTD0i3zl97CLW246gZ48xqNCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqRj0ukkRHcdI/f/BVL/WREKCNKwQtL/WK4tO4LYGE8=;
 b=dCKHyIFcRaGWV5A03S6n67PC/g2bYeTfXbVCOPueaRLY2U0t8sp/R3mXVfRR2jlClVy2jMSjV0GOJSiR1rqbX77BVjPZ826FzABk98x7USEqDE6PbX7Fm4fD/8rS6AfW8wvOl5An5IwzyiBYLMkH2qHk1KSd4vgPo9kWf0ZV1ddXtY5C8LsjCJjVu3LkfIvb/L8SF8ci+WGgfN6mfAMLtaOX7TXMt3+FumuvLoI+EcSPVC67M1lqhijEs0dv3wGfrIZlAoUbVjh+yRhWrvITNuM3i4+ym99GXsn3Bi3208lVZedmoIa+5DpeJhj3D/g1/ZWPeWqeQcbqPHUsMxnRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqRj0ukkRHcdI/f/BVL/WREKCNKwQtL/WK4tO4LYGE8=;
 b=TRvbz0Fyo7AriQrFrvA5Fhf2d9ns/FHLNQRQebP6mNF+iBaDhfLCH+yLmPpLFe3YRphV8RdLTi7URir5j20Va1wifQgqLa2uHGZMVp0ajaQmWHLJj/DRy6Yys2nDepG4Z1kye8I4QOIa3zpnjyYU78kOzbtUexD3zF2dpSGFEDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8969.eurprd04.prod.outlook.com (2603:10a6:20b:408::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.15; Mon, 1 Sep
 2025 10:41:06 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 10:41:06 +0000
Message-ID: <3ffbf6c9-567c-4cb5-ade9-39cbf6d81ae9@cherry.de>
Date: Mon, 1 Sep 2025 12:41:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sstate.bbclass: Open file with context manager
To: olani@axis.com, openembedded-core@lists.openembedded.org
References: <20250826134134.2164051-1-olani@axis.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250826134134.2164051-1-olani@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c16ffa-db8b-4d76-0610-08dde9440e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RktRRjF4empjNFJZeWRRYndHbkIxNHJ1VlF3ejJqYkZLa0l6QVhnUXptSEV5?=
 =?utf-8?B?aXNYRTVRdlNucHVwTWhQODJsWUhSc2dCWStpUjN3b2VNVHROS0hJZzBSbnZu?=
 =?utf-8?B?YytGS0F0SzMvNmNGUk93ZXhlM0xMdWhQbjlFZVNUU1A3dXh2Ulp1MXliL1BM?=
 =?utf-8?B?eHlqUkpKemxwZjBPSHZORDhLc09PSjdQTlh5OTBTZ0RtY2pKMHl2dE9CcndX?=
 =?utf-8?B?bDNkdHRvbzlQOFRIMTJIZVJqQ3luMmQ0M3QwSzZWOTRmeGlPaDRMZkJhOHE5?=
 =?utf-8?B?Z3lPUUUvTU4xWWZTVnVZTm12TVd4U0E5eHZYUURlRUIrNlh0UHdFemdCK0ZY?=
 =?utf-8?B?enM1M2tIZ2FWOU1TOUdKc2xrc1l1NVdQQlRyS0tKb3lqdStzTWFRaXJVSVpC?=
 =?utf-8?B?NzEybFE3RCtMR0tzMFhGUzdJNEtRcUVQbHZJeVBkM2VUVWhlMFZJcVUxbVZJ?=
 =?utf-8?B?OTBtZ1d0VW5VRG15M2lFODhMTjhTWWEwVU4vRm9oeU9RK1grZDV5RXp6TjJV?=
 =?utf-8?B?OW9FSUtBSzJzZVk2ZTJoTnMya0dGZkJMeHRuMnVNT2w4eVJrVlV2SkdKMG5s?=
 =?utf-8?B?QjV1SFZPUmY3ZEx6b0lNN2d4V0dXUTVTNXBGemJmdmpYTWlRNTVNKzZDOFhp?=
 =?utf-8?B?cjlIN3FidmxEa1NkZzZCL3JGZ3dpMDUvVk5MNGJabXV0SUgzRk81dm1hdTNw?=
 =?utf-8?B?b2p1elhwV0djcEVwMnFiTk5kSFNmcG5zeCtjbVdVQ053VWFJb3M2c2NlaXhy?=
 =?utf-8?B?WVFaV21vZjJhZ2k4b0ZFRWZWNWJ6Q05sOGY1aTNhR3hWdFhCenpISEdHeEll?=
 =?utf-8?B?b0pObU9aejdidE40M0xGQnlJN3p6M2ZEVTkvNkxoaE1qZXZ5MUU4Z0o1M3g5?=
 =?utf-8?B?NEoyS0VWbGJkWDBWTGN5eW1kOHJTK0lCK2pWbDN6c2tDQmZWWDR1UEY2V3lQ?=
 =?utf-8?B?QXlRTHl4Nms0blYzc3Bma2Z3ZmZCMjJwUHhraFo0L094c1c4bWxiZy9PMUlX?=
 =?utf-8?B?VmxETnlSSUR0bGRGVW9QamtRSWdhQ0U4bmlpZnBTUlpWak1QT0ZpT2VXVkYr?=
 =?utf-8?B?NGpkK2xPWEpHWnNENEYwdlpCdHRqbnNuKzVtek42RzVJcW55MnVJbk4rbTNU?=
 =?utf-8?B?VDZ1cVpUSFN3eE9wMTl6bSs4d05IUE9veDRtYW9BeHQ4cDBYN2IxeG1DTi9Y?=
 =?utf-8?B?VEtuOElLN0YwTGRJeGNqRUVUVmtEQ3NMdFZQcWFlNWlHRnhLcUJ2WG8rdTRv?=
 =?utf-8?B?Vjk0a3IrNE5hZHRVSTB4dWFBZ1hiSTB1Nzhxa3ltUFpOSk5HSFFDWDlFUDhE?=
 =?utf-8?B?M1VvSTMwa09OZkdXMGJ0QTFUcmd3OWxOZTA1ajVFc2xVVnBha2FoY0Y0WEJI?=
 =?utf-8?B?T0E3WlRzdFp2bG5KNlh3dEhHaUFNbm5VcEZGY09jVXlzeDhqd0ZhaHF5MkZS?=
 =?utf-8?B?Vk5Ray9zV1lGTVhLdjlHdzBDbXN3cTFHWGEvdXpPd0hybzhRQ2JFczVaZ3NH?=
 =?utf-8?B?bVR3d1BlQUlIRFpzcTZRbS95c2x3cmxBbmtwTitBMGpjQkE5ZEZlbUZLTWFn?=
 =?utf-8?B?WkUwNE5HVEpHcE9HUGxZeWFjZWgyTThOMXZJMy9DWExtT1VZYmVaQzBNbmhI?=
 =?utf-8?B?eGJaMmg0UU9vcTZTbEgxbVBrV2lhblYzanNyZVhJK0N2eU9EekowcVpiSkIz?=
 =?utf-8?B?aDlBTUUvSEFQeHpTZlZnL2pVaTQzanBMa1BTNXRzRkU4Zk9Ua3NNcElDb3RI?=
 =?utf-8?B?Z0t1cHNTaUpzZWxUUnBSc0VRZzU1RGFtSDlrNC9QOFZ4THQ2cW1mbHZkQzRn?=
 =?utf-8?B?VUNVV2Vsci9nOEVLSzFUeUM5R0tkdDdMOVRZZStSK2FlZm96bWcwV01wTCtw?=
 =?utf-8?B?TEdPdWkrQS9zdTgzTlBkVldTbjloQWs1UnFyOHlKWkZCYm5VR0dqNzJCUExE?=
 =?utf-8?Q?An3EO55qfG8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTJ6WU41UTJ6WFU2SERtT2NzTnUxN1lkdHZHL2s4ZExKbGJOYkFmVUhjVTcw?=
 =?utf-8?B?WkpvbkFVYk5ra01pNEZyM21saVFmbGFFMXN3UElIWGU4TzNtVjRuVG5yMmR3?=
 =?utf-8?B?WWlHTXNKQ2I0TnZONVlPWjN0TXd4Y3poYTNoYUdpMFhWb1lEbkxaNDAxd3pG?=
 =?utf-8?B?RE5sS1RPUW9oa0FwS0twZUdMc1k2bGliRWtBZGhQRDBTQ3RDV3I5WjM4THBl?=
 =?utf-8?B?TWdpK2ZoQk41a3d6Z0dXTEJiMXFqc2pMSzZzM1haNVlSSVE4UmhlZnkwQmZQ?=
 =?utf-8?B?SDArUkUzb2FqWGtzMXREVzBSb1ZpZTZMdGJUZjd0OTlJRXcwQVF6aS8xM2hl?=
 =?utf-8?B?WjlheENndk1lb2lRM1dZR1l6SnZUT0VPbGhqaDJQK2JBMS84ZEFtWDdubzBK?=
 =?utf-8?B?L25PU24zd1RWKzRtTDhRdWYvME9NaFB2V2lpcGltYkZGMlB5Wk1sU2RmZElx?=
 =?utf-8?B?OHR0bnNuYkVjZzdYclRwR2w3eWdtdEM0djRwd01EWUprUEtQeldyZWJ3QnFZ?=
 =?utf-8?B?cGFXQXZRQ0FyazBVZFVuQTNTY05CMDh6WC91ZUxwRzcrdm5YcEkrTmxsNytt?=
 =?utf-8?B?R2s5RGx0azJ1dFB2WXFDdndFd1QwaExzUXkyMXN6R1A3dEFxVlhJcXcrcnpK?=
 =?utf-8?B?L1ZYclhZUk5DUEdzaVhaSDhieGFEZGcyWHlCOTZBRzJuZmFaRHdZalpmdFBL?=
 =?utf-8?B?TVVST3Y5UEt5dWVmdk1nVFV5SUlDblBxMWhYTkM4R2N6THdZbWcxWUZvQkNz?=
 =?utf-8?B?b21SRm56MnUyY0JVcGNDSW1BbTVnTWp3ejFieEdGUmxTamlleDFlTit6V2Qz?=
 =?utf-8?B?cDljdlNRTnJoeUlzYzVmdHY1aUwyc2N5NCtVQ0FzZ0V3Uzhnd091bEZZZDNs?=
 =?utf-8?B?bHVPcFF0OS9jY2FCSFRlMlVCZDY1MXBKcWIzZWU2U085NWloaGVXR3daTDlx?=
 =?utf-8?B?bmFBTy8velQ4Z2ZEUHhpd0lBOTFsMWVzREh0UDBHMmJJN3h5alZVL1hJb1o1?=
 =?utf-8?B?NWYyWmZOY1IzQk4vMmdlRUdtRXIwWTE0SDg4ZWVydXRKVnIveC9KMWIyUjQ3?=
 =?utf-8?B?Y1JtdEJNZzNOK0x3TTZxU3RTSGFCT0ZQVDZNVFZBYUhDTDJsQkpMK296Ymlv?=
 =?utf-8?B?bkR5VWk2NVplS0wvYWptbWwrYjZacU9icG53dEFidXBCQm4rR041OFlyT1BT?=
 =?utf-8?B?NHE3K3o3Mmo3R3NoYk9IdTZFcStJYmRjUkU1cm5MV0hkQkZKdnZyVThQa3hI?=
 =?utf-8?B?N1l1b1ZvVlJDelZXT25FUFprTXhQcC9DWXBzNDFKcXBrbWlxU0Vob01zR2p0?=
 =?utf-8?B?SG1peFNDY0VLV1NVL0FrS2s4aGNsbVJ0ZDVJTGJGTVhPVllPZTYzZVhjU2RG?=
 =?utf-8?B?YkpST0IzYWhZSGdBeE04QmxGQTViTGs4TkR3eVd6UExrYnpRbm0zVGxFNVl6?=
 =?utf-8?B?blVSVHdiQno2RUd3VWNLODJXNURraElFRnVCNnlpc1lOZDRkUUdZem5EQWpn?=
 =?utf-8?B?elhHczFkcEFtdTFYcDRrSndEbmhrT1M0VFFCMUh5WWtSbng4WmNGRHcxRDBP?=
 =?utf-8?B?M2F3ZFZxUVNKVGpQQWxBOHF5RE8vNXRZVVZSc3J4dE1WRGRxaU1ma2Y5bzRy?=
 =?utf-8?B?dGZrZ241NVNFc09SQjdTbThTV1Z0a3ZlUnJCT2dNM01BL3RGYzRZZlM3Zmlp?=
 =?utf-8?B?YThrOFYxbm80WGtYeldsSzZjWG9DRkNCNWJ3d1Vya0g5bFRsT3ZlL3BtZG5X?=
 =?utf-8?B?aTluckNUcTBxbExjUXVwSjA3TG9iU0pxRzZ4MCtQRmpoV1pVYm8zRTRLQ0Ju?=
 =?utf-8?B?TlJqbVBoY0RqUUFBby8rOEovNWNVa2JCdFVCOUh6UEl2cFdnR0U3RHpSMDJG?=
 =?utf-8?B?bDY5cjRRNjAydFI0NFMzbDRBMExac05EQVFPV21SelplVXZwc2tkRVQvNnd4?=
 =?utf-8?B?eUx6NHpYYlNIb0R5SU8za1MwbnY0ZVM0UmxHanIraXVZRWZ5VzNFMUtTdmpa?=
 =?utf-8?B?dTRVRkhZNnFyNEdCaGFYNG15MnpIbW5ONmZFR21Ba2lKWFRkZFdyaUV0RmRH?=
 =?utf-8?B?eWRUR0lsTTZ2bGZrMHZLU1NjbGU0b09iT213VXB3REhubm9KSTRjMDhWV1JM?=
 =?utf-8?B?Q1hJOUJqdW5tb0MwbERVQ0x6RWVxVkk1ZTVDVm56VjlzTTJ1V25KQytUc3FU?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c16ffa-db8b-4d76-0610-08dde9440e26
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 10:41:06.2392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5MRMStrPOH7r5QDikoKmVl9BqMMeiievFH32rfwnLj9UMzg2piF+1YOw6chAJ1Uto96P06+7xBb1B6w7ngncTMPjWzvbwjVo1gQRWGuhvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8969
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 10:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222657

Hi,

On 8/26/25 3:41 PM, Ola x Nilsson via lists.openembedded.org wrote:
> From: Ola x Nilsson <olani@axis.com>
> 
> In sstat_install and sstate_clean_cache.
> 
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>   meta/classes-global/sstate.bbclass | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
> index e3d6373b3f..2fd29d7323 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -306,18 +306,17 @@ def sstate_install(ss, d):
>           sharedfiles.append(ss['fixmedir'] + "/fixmepath")
>   
>       # Write out the manifest
> -    f = open(manifest, "w")
> -    for file in sharedfiles:
> -        f.write(file + "\n")
> +    with open(manifest, "w") as f:
> +        for file in sharedfiles:
> +            f.write(file + "\n")
>   

Random pass-by comment.

I'm wondering if we shouldn't simply create a big string and write it at 
once instead of having a write for each entry in the sharefiles.

E.g. something like:

```
dirs = sorted(shareddirs, key=len)

with open(manifest, "w") as f:
     if sharedfiles:
         f.write("\n".join(sharedfiles) + "\n")
     if dirs:
         f.write("\n".join(reversed(dirs)) + "\n")
```

It should limit the number of writes to the file but not sure how big 
sharefiles or dirs can be, which means a VERY big temporary string 
potentially.

Since it's in the hot path, would need to run some benchmarks (what? 
how?) to know if it actually improves things or not.

Cheers,
Quentin

