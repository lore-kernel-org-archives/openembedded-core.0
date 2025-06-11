Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289D5C71133
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 15:33:21 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.web10.1437.1749655994815541795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 08:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lTh1V+x7;
 spf=pass (domain: cherry.de, ip: 52.101.84.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Axv2RU2+Q9Z1Vwu/d8E973hK78rqxOkw9q5jNFiQSFkZBuB9x/ZEHbWrBJJ0uUzV5UcNpZhlneY/Wz2xsurZg2XYra79f+FpBSx4jV519RF5ZGHVhuWQ1cJFUl8WRGfr4+T/9Tq5wZM1iVAqSORtOp2ydUzVv78wigHLfm+Sjomg7V6ryIvhD1FQuu/YfK7v8RvshcmQIqriOs7jZeyaOCwXfKEBxnPcDvkHD36IcvzDwNQbvXYPKPF2rP2QCqlWi0g7Echs/FBr4ogj3P6Pvle+0HA9Z2EPFjYDyWU2uLQgrlKDs/jw2G7rmmJOeP8bdHXbx022G9DpnoZam6BKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6hvd+PPHbfk8TmLYvGUNljOOGgDWI9RFONSr4GhGx8=;
 b=WfOU+w0yEwSAnmRuRAWyP/qXPhtA2SamXxWtwi7jQSbrlLrxLq1g2IsaAkHxJwjdunK7lE/qHNnMlcG27/nDDwQiUoSg6BXgWYLGkroaiNIUF6EaT6eWJiTnyNiRb3wsUZkKV1fVkNpnPWZpCxoSHrtOoVseJex9YeLZFrF7YyDBptvDRbuaIibZTPJGj+Hcze/qWKRYi9W66IP/KZI4VT+joDJzp5axCbaKwY4PfKGC1QFVsFyAHTSjcuVtqTMHUQEFwItCH6JV345jpSLbCTPZwIJhKRjwNgZ5Xl2aHgtjjt5MUa+zu6nORGhDVQ0Q8OLoXMCa70TP/xSwzKunWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6hvd+PPHbfk8TmLYvGUNljOOGgDWI9RFONSr4GhGx8=;
 b=lTh1V+x7Yc0cvilo1gmsGSm2u3DRBDgGS4nqCg8Mb0QOg3zy4gbAcq9se1aHOhX5gj6DYecalgxKZshrFur85ZAT8ZSMc/C6v16YwWLjAb4DnmS0vtp3KpQFrBLLLtGTjS4WMNXGp1t29tO25FEbn56UnPs6GAHg6mjzlnarvsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB7839.eurprd04.prod.outlook.com (2603:10a6:102:c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 15:33:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 15:33:10 +0000
Message-ID: <c64ef50a-10d3-4fe0-8025-96defb817e53@cherry.de>
Date: Wed, 11 Jun 2025 17:33:10 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: How to fix Panfrost support in mesa?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: c42b79dc-add3-47fd-4438-08dda8fd45c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Uml1UTQxUFV5alZsWTlnRVNaZDFHdmc1YWpQenJEVmZaVFAxUld4MU5Cdm5n?=
 =?utf-8?B?QmpHeW9QTG5vNXpWaEtxM25NVm1TcEtsTkNYOXlhbWFwTElZQk9nMHlnS2lJ?=
 =?utf-8?B?Mlo0Z1hJbzhlMWlNdHEvS3hEbEhMd1BTRjd3dkt3eFdQWmJoWnFRZjJRUWRm?=
 =?utf-8?B?R3NzR3dZSERtcjdad3prakh0YjhDcnlvRjZoTWQrRTNDOVBwSmFtMzBaYm14?=
 =?utf-8?B?Z0dJUmZocW5NVVZtR3U2c0RBUnRnQm1icDAxT1BSQUhkN2s5T3dVUEdlM2pG?=
 =?utf-8?B?R0hPRS9jOUtYaFRHbkxyNkg3UU43RXNEc0FhOXpMeUtlQUE2QitRclZ1MCt4?=
 =?utf-8?B?UDFOVzBMQmsxdXpDbFo4bVFYWndGcnFwUjZVN2VRamFScmpIVFdqQzg0Qmlz?=
 =?utf-8?B?WVBMdytKZUoybWlLL2lEaVdCaUhYZit5cTV6d0x0RjdkUjN3dCtDaGJXREhE?=
 =?utf-8?B?Z3RPUkpFcG9HSjNIT2ZEQThMdXVpQ2YrVElMQ25PeEpwYTN3ZWI3NzAzQ0Zp?=
 =?utf-8?B?ek1uU1JsNksxOGg2aXl0WVNRMjMzUXUxWWxsamVmT2piQ2hTenhhdHd6TUJW?=
 =?utf-8?B?dkIwbU8zc1BvYzVxTGtSYk5lcUJDK3puRlc4eUcrZTJUZlFjNURrY21aYVZN?=
 =?utf-8?B?VVdrdFpYQ0NBOXFLZUtSVklERURrTzdGTmVZQlA0Tk5RVXFxK1NpVFlaWmtv?=
 =?utf-8?B?WlRzdnhQN21YOWtmbmNsQUU4L0ZWT1h3aVpwM2NZM0tDOC9FNWZ3ZSthWWRw?=
 =?utf-8?B?Z0REWkozM0Fvdk1FcnBKYmIvdnNlRHEwWWJLL1N4Qy9YU0p5NG4vMWVjUWhI?=
 =?utf-8?B?SHptVGxqYjZMU2x0TURGT1E1bFJTWkozelVJd2gyYnd2QU4vNlhOT1dSbzZU?=
 =?utf-8?B?OE9DY2ZMcWdQODNFTnlEUjhieFg5TVg0VE1EMTNhQVZPQVh3S1VWZVdCSWNJ?=
 =?utf-8?B?bDVrNmVEaEtRTithU21tUjNlL1d1dGt5VElnT0o1eHJIN09GNDBXMTc0bnNO?=
 =?utf-8?B?WG9NZm0rKzdGSVRkWWpuK21hL1c4K1dFOTlUdW5qVk9Ha1NnVTJ2ZU44VVM0?=
 =?utf-8?B?OWJ2OFdIdG4wdXdrUGhPWER1YmZ5b1c5a2JXSzhwVWhjS01KVlRwWXZEWlFN?=
 =?utf-8?B?aHplT3RkbG9tS0dDVy91ZHRsMkdBRHhSM2xmdFEyYVFzdUdZMjdyb2pCTDhn?=
 =?utf-8?B?dWU1SzFZYlRSdGRUYzNOWmd5d09RWWpnblhIV1BNdXExZm5DWlRYZ0tUM0Jp?=
 =?utf-8?B?OFRuNXhKSTVaUkdRNTBFOVZjNHNZN0gzV1pzUXVVMVVwRGNhWlBJc0w2T2E0?=
 =?utf-8?B?L1hiN0J4Y2FtM2hDcGlOcXdFaVM4Vms0YmJqQXZzKzRXMEF5YXNxWDY3aktO?=
 =?utf-8?B?RVd3Qm4zdkFwVnNMWDhmTTZXaVFjSzBSdEJRK2lUQTI5Zm5naDh2eDluNmww?=
 =?utf-8?B?UFlYcGoyUUZMeCtFdjRCeDR3RkMraW00V08xZGYwZXo3K2oyeWNFclBTWE1o?=
 =?utf-8?B?dG41cVAvVTIyYmJUdDNwWDg4WXd6MW4ycFEvNjh5NVlHeTQwako0cHlibzVy?=
 =?utf-8?B?c1psV2Nmb0MrZit1UjhjSmJWME5tSCtuWlllZHQxMzVKZDZoaGFySVZ3Z0po?=
 =?utf-8?B?N3hudGhTTVRnT2d0RGlMTmJTMVMxNXZza2dNK0tNb1NwWWhvRk1SbTZ1eWZL?=
 =?utf-8?B?Yk51WnNPNm5oMk9rUGlRZVc5aDRtMG5UV3U2NmtsZkh6YS9lSUFKdTRzSVN1?=
 =?utf-8?B?WldmTVIzSGxxbG1vOTFSR1EzdXgyTmlYbVoxbTFqQ2JCSjFkdzBzWVQraU8z?=
 =?utf-8?B?QlZRTzdJTExXWUNCcFVyVklDNlF1eG9Pd0RiK3dsdnpUUEo4V3h1RGFIT3cx?=
 =?utf-8?B?bUF2dmF0Y0hpclRaeldwYXBoL0ZkS2l6bVB1TUg2Tml1dkV1WUswTXg0LzhH?=
 =?utf-8?Q?jO+ANCC0QOc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ai9NWnd1citLSTc3UkZCRyswSFNZN25kVGN4YmZ6bWtpY29MTUNCV2JEcWJW?=
 =?utf-8?B?VHM1ZGo0Zlloc3p3aTBDOUlvclRYTVliRGViYjZTajFzd2pyZ3IyVGdkWWs1?=
 =?utf-8?B?bUlwOExyaFFaVXNTSUVjR0RISnYwajYwcWw5SzdsZWJrNzJTbzR6Zk9OTDVj?=
 =?utf-8?B?aFQ2T1FBRkYzV2x3aTQ4czZxSlZMYWFPV0Y0a1ZXMUtmWUdlZE8vM3d1cW9P?=
 =?utf-8?B?NG1pb1lVendCZTh4UiszMXVBdytWVjA4Y3grY1RYbFV1T0l3NENOL0VJRkZH?=
 =?utf-8?B?bzBmenRyVTV2Y3A4M29BbWZWd3k3MWFNb2ZQdWp0amlTVlo0bThBZWV1RXp6?=
 =?utf-8?B?bFdsbFNveG1ja2c1cVIyUlF2OUZKcm9BbURhb3FGbDBtVkdoeDNkTGw1VGdK?=
 =?utf-8?B?TFJLWi9aV053Qnp5MTVNLytrKzBmVTMxYkFETDFLWUUreXVGekpscjRBWkw1?=
 =?utf-8?B?eFI2ZDRWLzU5VlY4UHVSV3BHOVpXanpETEwxc01OZks0TkgzcnQ2NG43MDZt?=
 =?utf-8?B?bkpUT1BicXR3eEpZZFFmajdGQWVLYUFKY1hoempha3dUTEthNHA1QkNHelZQ?=
 =?utf-8?B?Y2ZPMG9NTEVlYVRDMms2Zm81K0h4UmxKUUwvVGFOZXU3Q3FtUDBubCswNFdJ?=
 =?utf-8?B?OWdOL3VBb2NES3NMdFRJby80Y1VXeFFyMkJRRE5DbzNIZFJ3VHl6ZGJMZDFo?=
 =?utf-8?B?OHJoNjlCMjQxQ0xjNFBiQVlDMXpFY1Z5dTJDZUxYeUorYXpCZjUvOXFVWmpV?=
 =?utf-8?B?Qm1waDZCdFRrN0tHUlF6cVBXL3Q4VUlyUGJtcWt6NmpRN3krVVYzY3JIN1Fx?=
 =?utf-8?B?eWErS2VXVDVYS0NtNHozR3hCV2t3TnpVTzVZWGRiaHlaa1lxWTRyOVJBTkI5?=
 =?utf-8?B?ektyTm01RG1KQ2tuZHJ4dDc4SVpLcERhRURxOHo0RFFTelZUTXVSOWptVXFu?=
 =?utf-8?B?UHZjcGdUdUlacUpoYWtGTFhiTVVYNEZ2bUh4VlA4cXNnMjZ3ZlJRMTc4alJi?=
 =?utf-8?B?enZNeU1SMG9sdmlydDhIb3lYUG1DSkFGZUQzQXoyUEhVZ2Z4SlFMeXJBTzZi?=
 =?utf-8?B?V3pnOHhJZzFjaHZnVVhqaVFMZ1hVa3ZMdkN0UnRKSkhKbHZ0U0dvR01KWjRB?=
 =?utf-8?B?S0c4TENGUmZiSEtvQWh6R2ZiMC91ZENJQzZwUGFpN1VUSVdUVms5NzF5ZEpK?=
 =?utf-8?B?dDlrWGxMZmtQNzI0Wk5NN3pLYmd4Zk81RkpQZUlDRWM5QmZhNmlCV0RBdzFV?=
 =?utf-8?B?bDljR1A2YjZ4WE5NanpFSlVBa09Wb3VoZEwyY1pnNEM4S0g2SU9DQWV1NitY?=
 =?utf-8?B?ZWsrR3JQdGhKVUk5THdBcjlxWkxEQnVCL2Rhczl6a21xa2V0RjlQSDhQcTZu?=
 =?utf-8?B?WnQ3UFI1ME1UY25kemVoV2FUYnBFME9ZQ0IwbFZ0eHdIQ0R2dUJDemR0eGZj?=
 =?utf-8?B?TmRZU21VLzI2ditHQVpnU21GNUNhT2M4YVdLd200c0tCYldZYmRnakJyV1JM?=
 =?utf-8?B?bG9nbTlKVis1NW91bGx4Y3FEc2pDVDJkYW9BKytmWDRiamp5OVVnbVpoQzV0?=
 =?utf-8?B?NUV4RThMei9aYWk2QWVQK1ErOXJ1Sjl0TGRHME5acGsvNlhtbXJvc0FScnda?=
 =?utf-8?B?b3VLSjBqL0lENEd1dXRRV2Q3b3AzR29wUzlkM1d3dWhSWTlWeERzbDhPMTE0?=
 =?utf-8?B?eGo4TXRBdC82VTNzdTZQYzdmWWtlc1YrRWFLa3hWTnRNZDVxd3FKempsa1Ji?=
 =?utf-8?B?T3BWb3lQOE5nc2QwaFJrTStLNk45azczNDBWQVQyOTJiczA2MHdZMERkUDBN?=
 =?utf-8?B?K1k5NE01d2VoYTV6a2ZtNWllYjRGYVhVbEE0L09URGJpcDgvM1F5QksyMjZC?=
 =?utf-8?B?UTM0ZXZScUxJbitEY1ZqdEFFL0J0WXRtcmYrbXNPZ2dULzhWdy9BSWJER3dR?=
 =?utf-8?B?dDErQjN4UnJHemxDL1lMWlQzck4yV1VvdzNSRlFxbnIwd2NweTRFL09rWnJy?=
 =?utf-8?B?NElFcm4rYUl3cFkzdjlmOUIydlYrT3ViSnJES1ptUytJaUhkRlA0SS9GWitU?=
 =?utf-8?B?a2JXUFpnQTIzZkNlanRIUHFyeFZteFRWYkg3U3RhWElBUnFxS01mTEtaSEM3?=
 =?utf-8?B?RnRiTUpQNTRxN3NEWTkzTEd0Tm5OcmtMeFN4N2tZLzNqRTU2OS9pRGhzOTNV?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c42b79dc-add3-47fd-4438-08dda8fd45c7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:33:10.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2m51Mc9FPAta7I7XMUsy6HiKyLducbApdwSdg9dPqtmMLMUqfh7R/E3DbwMqS7vuP8pPV4CRwcnyWfjssemSSPPpngxEtbogSaqOmezknY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 15:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218457

Hi all,

I've been trying to add support for Panthor (Panfrost for Mali Valhall 
and later as far as I understood) to meta-rockchip a few months ago 
already and attempting again.

I had managed to do something for an old mesa release but it doesn't 
work anymore. Worse, it seems that the current Panfrost support is broken :)

For starters, the build doesn't succeed unless we have both panfrost and 
libclc PACKAGECONFIG enabled. I believe this is due to 20970bcd9652 
("panfrost: Add base of OpenCL C infrastructure") merged in 25.1.0. So 
there are some changes required in mesa recipe to force libclc 
PACKAGECONFIG *in addition* to the panfrost PACKAGECONFIG for the whole 
thing to build. This shouldn't be too difficult though.

However, reading the aforementioned commit revealed something else (or 
maybe I misunderstood :) ). It appears that LLVM is now required at 
build time for the Gallium driver, so that would make panfrost part of 
GALLIUMDRIVERS_LLVM now. The issue is that it builds with and without 
gallium-llvm PACKAGECONFIG, and it seems to be running glmark2-es2-drm 
just fine on RK3588 (G610; Valhall). So I'm not sure what to do here? 
Making it part of gallium-llvm drivers brings in clang{,-native} among 
other things which is horrifyingly long to compile.

Additionally, according to the same previously mentioned commit, there's 
*some* OpenCL support now through rusticl for Panfrost. I wasn't able to 
compile it though (seems like Zoltan is trying to fix it already but the 
patches didn't work for me though I am testing on top of poky master 
5b006dbc3d8669e0530ec3d633982617923ae215 due to meta-rockchip not having 
migrated to the new kernel-fit-image mechanism just yet).
I see that we recently forced the opencl dependency on Asahi Vulkan and 
Gallium drivers, though I couldn't decipher from mesa git repo whether 
that is actually required or if it's just to bring in OpenCL always.
I assume we could be doing something similar to Panfrost but I'm not 
sure it is worth it (especially considering that the commit listed above 
says they are only planning to support Bifrost and Valhall versions, 
which doesn't cover the Txxx (Midgard) Mali generation.

So.. what to do with this panthor/panfrost driver for mesa in OE-Core?

My attempt at making panthor a gallium-llvm driver:

"""
diff --git a/meta/recipes-graphics/mesa/mesa.inc 
b/meta/recipes-graphics/mesa/mesa.inc
index 4b1e427ad5..8880330c9c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -110,17 +110,17 @@ PACKAGECONFIG[wayland] = ",,wayland-native wayland 
libdrm wayland-protocols"
  VULKAN_DRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', 
',amd', '', d)}"
  VULKAN_DRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi 
libclc opencl', ',asahi', '', d)}"
  VULKAN_DRIVERS_INTEL = "${@bb.utils.contains('PACKAGECONFIG', 'intel 
libclc', ',intel', '', d)}"
+VULKAN_DRIVERS_PANFROST = "${@bb.utils.contains('PACKAGECONFIG', 
'libclc panfrost', ',panfrost', '', d)}"
  VULKAN_DRIVERS_SWRAST = ",swrast"
  # Crashes on x32
  VULKAN_DRIVERS_SWRAST:x86-x32 = ""
-VULKAN_DRIVERS_LLVM = 
"${VULKAN_DRIVERS_SWRAST}${VULKAN_DRIVERS_AMD}${VULKAN_DRIVERS_ASAHI}${VULKAN_DRIVERS_INTEL}"
+VULKAN_DRIVERS_LLVM = 
"${VULKAN_DRIVERS_SWRAST}${VULKAN_DRIVERS_AMD}${VULKAN_DRIVERS_ASAHI}${VULKAN_DRIVERS_INTEL}${VULKAN_DRIVERS_PANFROST}"

  VULKAN_DRIVERS = ""
  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'freedreno', ',freedreno', '', d)}"
  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'broadcom', ',broadcom', '', d)}"
  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'imagination', ',imagination-experimental', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'panfrost', ',panfrost', '', d)}"
  PACKAGECONFIG[vulkan] = 
"-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, 
-Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"

  # mesa development and testing tools support, per driver
@@ -173,12 +173,13 @@ GALLIUMDRIVERS:append = 
"${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink',

  GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi 
libclc opencl', ',asahi', '', d)}"
  GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel 
libclc', ',iris', '', d)}"
+GALLIUMDRIVERS_PANFROST = "${@bb.utils.contains('PACKAGECONFIG', 
'libclc panfrost', ',panfrost', '', d)}"
  GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 
'amd', ',radeonsi', '', d)}"
  GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
  # llvmpipe crashes on x32
  GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
  GALLIUMDRIVERS_SVGA = "${@bb.utils.contains('PACKAGECONFIG', 'svga', 
',svga', '', d)}"
-GALLIUMDRIVERS_LLVM = 
",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
+GALLIUMDRIVERS_LLVM = 
",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_PANFROST}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"

  PACKAGECONFIG[amd] = ""
  PACKAGECONFIG[svga] = ""
@@ -212,7 +213,6 @@ PACKAGECONFIG[lima] = ""
  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', 
',lima', '', d)}"

  PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'panfrost', ',panfrost', '', d)}"

  PACKAGECONFIG[tegra] = ""
  GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 
'tegra', ',tegra,nouveau', '', d)}"
"""

On a side note, I'm also not entirely sure why we need 
softpipe,llvmpipe,r300,nouveau always enabled?
Can't we make softpipe the default only when llvmpipe isn't enabled?
Do we really need r300 and nouveau always compiled? Can't we have a 
PACKAGECONFIG for those too? I see there's an amd PACKAGECONFIG already, 
maybe we can use that for r300 as well? For nouveau, a new nvidia 
PACKAGECONFIG maybe?

Thanks!
Quentin

