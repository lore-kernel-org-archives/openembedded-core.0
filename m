Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6847CF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:54:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.web11.52144.1728903245662741025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=IKcs4r0k;
 spf=pass (domain: cherry.de, ip: 52.101.69.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g283NwKYTxz3mrKGjoQ6MAxvs9oQ3itMYnELgAd98linrXBmawOvp0n+UZWsU0I0EYvJ5sMISwSQKJ3LL39Onlz7VhbAy5bfAE81+ugr+vMT7NQh0fqj8XXxBBOcSMuBoeJRqHT6MQ/pI7tu/tMvLUNeWfrnB8q3gn5AVO06XGypO9KJ/GanmAtgdQQaDqtHPxuepyYDvth1l9mDqXYxox6WTawxFEx5Al5GXXRPOjxA9VkdAeuEPj0AtWLXln9I80rdWpMWg2w8gH0SfjCBKIOqQpeXlM2DB+NoeL7D65CHV8vHbjoLZXbylu1+TR7niR3thTL3T4wAmRsDEmNT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOlyxdlytrDcjpLf3aFeN7SgQW43a5+e9z/alOWQ6K8=;
 b=BP36anYsIT0ata9oc13ABEfPsR8aEjW//sz9q9JSxaQdO0mgymDci1+snk9YF6ZBlEKnbTkKvt/a4am/fwyejx8FphR7w3N9XR9bNIaJKByRDe/qIJtth6Cj0TrODJvfdi0yLX4DdJaG0nwmHGUIUB6Ct/5MpeQb0zHBdq2JISqUpl6I8fQ7QOw+RdcyhjqxvQHez+5sc9POKIGuYeRCN2rUrBTp97mSKBMNG5w4kmXL+Lwjq0USD/4NdG0Fme8l35pPvT2yai9Ot/AZuYiqezMY3sv2Y/v8xXW5kDNxWILe8oHRPExOsNwFQksnkOU+5nllqWXrkCWEex9LWRV3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOlyxdlytrDcjpLf3aFeN7SgQW43a5+e9z/alOWQ6K8=;
 b=IKcs4r0k0M8/gsL7lkd9y+16bpxdm3tWNy2fHiTznJP6RM0mGsQB/5A23q3cKbHtZkb73EvjZjIkw2sEe6eKSn9TinosM6oom69GrH5ZATyf+0HoqK1Pcxf4VkP9cdgedD+gr7Hki2igt15pTmyyA8EPCPL0+u+JOzmhFDmEJY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:53:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:53:58 +0000
Message-ID: <2ef09961-4074-44c4-bb7a-d1e1fa17613e@cherry.de>
Date: Mon, 14 Oct 2024 12:53:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH scarthgap RFC] bitbake.conf: Add truncate to HOSTTOOLS
To: Quentin Schulz <foss+yocto@0leil.net>, bruce.ashfield@gmail.com,
 Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240930-6-11-kallsyms-truncate-v1-1-47fc9143fff9@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240930-6-11-kallsyms-truncate-v1-1-47fc9143fff9@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR5P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d70c486-d45b-4a87-3895-08dcec3e8123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1dyS292WWE4UkpDZ1BkYW1ocjNad2c5VVBERVRiVklZMlpkcitwcHg1Vjlv?=
 =?utf-8?B?cEJDcWdFUHRVZlN5djg4RmxuRit1RzUwVzZzT2pUUUVhVGRmUi9Wek9SZVRW?=
 =?utf-8?B?K0ZBK2p1ZlhQN0d2MDZuRGN5akdQQzhWc0RUTjVodEVpU1VGb05lMHhlV0Uy?=
 =?utf-8?B?dTZBV0RZNEQ4eWVBbGF3QklWM2ZjeDZPL0V1R0NPL2s2RzJUeTduL0RBK09y?=
 =?utf-8?B?YjUyZTdiNjIwYWFhTURiK3ViSy9na2piQ2QwS2I5cEM1aSs3ay9veG1aRzNG?=
 =?utf-8?B?ZG91MnFqWDBab0RhVkxsS3BOMjZwUURzMCtGUG4rZDJKckpCSE1pd21nK3Rm?=
 =?utf-8?B?SjBNanRvZHZORXVEOUZWdkJxY3M1cUhZeGhrQk1sRVNVK1JzcldhSlVVRUdl?=
 =?utf-8?B?RlRDU243UGlLcUY0bnhCRGI1R3oxZzdtM2FlZWpkcXFBbUQvR05HdjZTNDFj?=
 =?utf-8?B?MHllZ2U5NldocTJUUWZia2xFVW5RYUdNL2kyRFZtb0g0VldlclZsZDlWaDZM?=
 =?utf-8?B?TTFnK1BKOVQ4Q3BmVGRURFgrK1Nlc2ZZUTgxVTBNaytIdkVWNk5FamdvczZq?=
 =?utf-8?B?b2hLVnN5bUNVcnFMZmVMcGdZdFR0a1lUaWdtTzgwRWtSY2dMSUxldDhnNFNn?=
 =?utf-8?B?ZE45N0JibHdyNWovcW9COHE1SGU2NzNHV1NVamxrbjBocTRmcHlxL0w2MVho?=
 =?utf-8?B?Vjl2NjFuelhub0JIdUxXNW83d2FEU0plWnlOVGJsaGh3VGQwbVExd045KzBm?=
 =?utf-8?B?dXFONk1yN0VQbGdVVExLVDFJVUVhUWVqWUY0eFNyWTFFY04vRklFazBKZjQ1?=
 =?utf-8?B?TUhBZUdkUytDVXhZVURrdVZ4UTV6SVpaakcwVFAyS0ZzVHlKemZYd2Q3N1dC?=
 =?utf-8?B?NWRrNDFtSzQrdkdnd3p4SGgzRzZQTFZHb0piK3RaQ1RoZHZrWmpnZ3FRVy9W?=
 =?utf-8?B?NkgzdHFrRnQwY25nRGk5OGlSbzhtckoxTWVpYTAwNkZuOFZaeUxtaERHRWFi?=
 =?utf-8?B?SXJxZndXSjdpc3RYYk9jT0djYmU5Vjg2OHpGdzVnTHp4dmoxWmIxRFVYaHpH?=
 =?utf-8?B?RXRGbXVicGtSRTY3Y0dmeVpkUEdMd1p2SVVQYjBjNWszdzg4MDJja0tzRnoz?=
 =?utf-8?B?N2ZQVWlwUGUvZEhnSU9wK0FLNEMyeUJzb2N6RWFnTFRIVVFETmZxbWg1MU9G?=
 =?utf-8?B?TlVVcTlvWklYNTQ4RFBRNmNPOFJZZ21EcDBlbkxZdGY1QjNsSG1Md052dFh3?=
 =?utf-8?B?d2RWVmhFamtjWm1waGUrQldrNTNlbXIrOTRTMEV6b0Zmd2tmYXVWVHp6eTZn?=
 =?utf-8?B?emdvcU04T0FIaThNZS9HUEQrUnprVEtMd1BrRk9vaFF2UGo0dncvNXB0L0xs?=
 =?utf-8?B?ajdkSDcvKzdMNUlnOFFJU0t4Q09wYlhKQkpUN2ExZElVWTJ5R0lmRkNXeE5i?=
 =?utf-8?B?NExxOXlDbVhnRHRxM2VaYUJIWFViVUM1aDNsS2xIaVVUT2QzVnluQktQYUFt?=
 =?utf-8?B?Yk5PZDB5YThvak5qb2FXYW9KQzlEUDFPMWIwWklpSTdOZ0RKZ2JBWWh4SU9k?=
 =?utf-8?B?cGJRZkxiWi9ibGtkRnlIai8zSTZVTFh0ZlVEOEhqdEFxV3N0S3RQU0o3YmUv?=
 =?utf-8?B?RnBCWTZ4YUd5SlRzczBuR0ZOK1V2OVIxdUN1TXBwTnNleXdHZXhKUG5aMFVF?=
 =?utf-8?B?RXc1cU1DbngvL1UyQ0c3NzNyWVJnU1c2b2krOVBuakUyUHJKMXJQaWtRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VmxMTithYXZadzZqRHQyUUxKWXJOVkFZVms3Zmw5dCtBN2I5STJ2Q2c3M2l4?=
 =?utf-8?B?VEZOL0xDWW1Cb3cxOTRFYnQwV1N2QUZYdVNZU3ZHakdZRy9lQk9abW5TRExP?=
 =?utf-8?B?VDBnZVFmR2ljOE9ST01ZcVJKa3lBeE5hZ2g4ZWtTS1I0MUE3b1lUS1NxL3Zm?=
 =?utf-8?B?bGNUQlFDSG1uaEdpblYvL3JjUG1pOUQ4RUJmb1FqR00zbUxVUUh0bUlzY2t5?=
 =?utf-8?B?eVc0T0RQbnhQd3hvSThPMWx3T3lVNnNCSi81REIyNmRLVnJzbWRaNmNna0l1?=
 =?utf-8?B?OVJrRko0bG9uY0N2dEYwM1dhck5HSlZaNWt2bXBNRnAzWFIrUUV0TjdDT1lw?=
 =?utf-8?B?bkczaFkwQWM2c25zancvU243cTM0VzdFdld5VGI1Vmx3Tm1KdjZUL25wWGpw?=
 =?utf-8?B?MnpzTzZGTFZNeWhOYm9PTmhPNWNCT3NaRkFnUUZoaHY0Ti94SDRmOVY2NjFu?=
 =?utf-8?B?T1NRaVpOZUVWeVJCWE1jaGlEM1YrbTExcVVtSXRrSXdjcDVVMG8rVm1MZ2Zs?=
 =?utf-8?B?ME1sL1NSdU5ITld3QnZMWkM0MVBoZXNENzlGdXBJNitzbWJXRnhwaDdRSTF2?=
 =?utf-8?B?QW1kVE1kRjFMOUVIQVFJSzRTcVRpd1dheEhYWEt1QW1jdFZ3clp4NzNlL2xY?=
 =?utf-8?B?ZUVtbGpPbjdhWkZDVTRGbU84bW56L2QyOGIrbnFzSEZVWktSeWVIczZNVHBO?=
 =?utf-8?B?eFl3SkE0b0twejkzbTNxckI2WTF0dkdrbTFjOEdnaGZ3Y1ZvNnlUcHV3Um9n?=
 =?utf-8?B?bko2a01ORHh6bm41QkpGM1ZNY21MT3JoNXJFVWpLdW9yK0puMGVGWWdvMmg4?=
 =?utf-8?B?REY2bTFmNDFhNEdqMHZHUHNqNXRxTUoyK1J2cXBRUllDeTdxY212aUQ0Zlhs?=
 =?utf-8?B?aU5HYUlzM0hmZGtETXhVN0lrV2twbjlpdnQ5UDNKeVlsUkZnTzhZUUF4dmNt?=
 =?utf-8?B?dHUxcDBpTWZJb1ByRDlqemZkRUExUk5WZGlEUTduejVDd1QvY3BpZ2Z2MGh2?=
 =?utf-8?B?bnovaGRQcVoxaW1QTmN0SzRieXZPaFRMREJlN0o2cUFsSnowYVNBd3ptQjVU?=
 =?utf-8?B?ZmxuYnRTTG8rK2xDN0Jtd0xCVk1MaDFyVmRPbEVJL1l0SjJ3cTBuWCtsdXFp?=
 =?utf-8?B?K0E0TVVKOWNVbjBWZ1daeVJpTmtDa2dJZHpGbnpidzhDZVgreXNac3pUMGtV?=
 =?utf-8?B?ZHJsVG0xYlJsQStsNlgyc0FzeFk1dEVoLzNQMUwzNU1WZjJjdXM0Z1VSUkhH?=
 =?utf-8?B?TnJ0UElZUk1BbVdnbWhxUXN3TmFRcWxta3llRnV0b0l2UHJtK1h4bERDYk1F?=
 =?utf-8?B?TmQ5aVVYTzdJWFpRTkJJaEFnMTJJNXNKK1BzNWVRbGh1MGtncndrdVEzNkdk?=
 =?utf-8?B?TGtadHRKaVFGNDB0QkVtQ0I3dWk3Mmpib29kTUNCWTZlamtJMlRuWHp5aGlz?=
 =?utf-8?B?TjVDN3NRaFRJa2VWaTVldTVqUVRmV2pJdFg4S1JRbFlCWjh5SkU2ZkFWcnkw?=
 =?utf-8?B?dkpTQk8zbjd6ZXZlOG1Fd09lS2hqR2Nsc2V2S0dFaTZPNjNBVjkvRVBPNlQ2?=
 =?utf-8?B?RFMvWVVET25nbEY3UmlOeCtkK0FIS2dNMVZBbEFXV3dBNzlBTWRZSHJvTHZt?=
 =?utf-8?B?bk93cXA5T1Jiamt1OUVtaEMweEdmb0hDYStUeE40all0ZjVIVW1sU3ovd2JP?=
 =?utf-8?B?by9UYVdkR1ZHMDEwdVJzTFl4RHowcU5Xd3FIUTNONEFUYzUvRjdUQUZSd3o1?=
 =?utf-8?B?RmF6VDJBcERtVkRNOHg3RjVHUkczYWJ3M1dQT1ptK2NnVzRrMDVzaWg3SzYv?=
 =?utf-8?B?SmZUbHZmZUNoV1dEU2tYUmtsNGltb0hlS0QwR1RvUnBjVC92c3JRS1dFVmRz?=
 =?utf-8?B?Q2xPeDEwT1lRdGZtTVdVQjcydWVlR2ZTSGpZL2ZOeEtIS3dDRVpuZGRwWDIw?=
 =?utf-8?B?SXBXVlAyeE9GZHlwcGx3aDY0SDZpaU1maDl3d0VFUHpGMnNZMURETUZVbkFM?=
 =?utf-8?B?M0xVK3c2TzVZcGg4Z1liY1BYUGhzWDM3czhpNW9xNVZOSkt5MWtjaDgvck5X?=
 =?utf-8?B?dTJwWkJrazUxZjNIS3NBTU15TVJqQXBCL0NlVHFGMVh2cjZJWTJRMDBOYUc4?=
 =?utf-8?Q?FaM6yA7eplhU3qUa0qVMdt5dX?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d70c486-d45b-4a87-3895-08dcec3e8123
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:53:57.9538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IGGapVgujWyY77VUT8cYtRnacOaBuVIU4qa3ivL4wMS6pjpOnRnE01bEX5VOaXWrgueBjwLRbSc9a1cKvpIbPYDR9Apm+I+EHy3DulVuZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205745

Hi all,

On 9/30/24 12:36 PM, Quentin Schulz wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Some wic images need this command. Since it is part of coreutils, it doesn't really
> cost anything to have in HOSTTOOLS and it avoids signifiant build dependencies on
> coreutils-native.
> 
> [YOCTO #15571]
> 
> (cherry picked from commit 522000ce5c4f0201cbe42d7826b6a8489ed10117)
> [necessary for building Linux kernel >= 6.11 with CONFIG_KALLSYMS, c.f.
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1472464c6248575bf2d01c7f076b94704bb32c95]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> The Linux kernel in its 6.11 release or later, with KALLSYMS config
> enabled, will now fail to build because truncate host tools is
> required, c.f.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1472464c6248575bf2d01c7f076b94704bb32c95
> 
> but the kernel recipe doesn't depend on coreutils-native, which is too
> big of a dependency for what it brings according to Richard (for the
> original patch destined to wic) and Bruce (as discussed over mailing
> list for the linux-yocto recipe).
> 
> Let's backport a patch that was implemented for something else (wic)
> from styhead/master as truncate is pretty much guaranteed to be present
> on the host with hopefully no compatibility issues between
> implementation.
> 
> Marked as RFC because it's a "big" change and I don't want the ML to
> just gloss over it without questioning it :)
> 
> Note: I'm currently NOT building that kernel in my layer, but it'll come
> at some point next year, though I did hit this issue when doing a very
> quick test with a local tree.

Any feedback on that patch?

Cheers,
Quentin

