Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9DFCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 12:30:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.91])
 by mx.groups.io with SMTP id smtpd.web10.164521.1712752230058044446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 05:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=JfOjkcd7;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.91, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBQmOkz3j82v1hafuPl+fQLlxy0DWJFd7+pKm9KEOzixnM/OK1hVr1ZQ0e03dPC+JWrOzPJF9qNR7DNjZpfD1ACvO+ubfSVSsTgiwPPoDQZxaVtyv5IcebQmNtupqoHOVKckq9rIoeN5WIFFP29Pb3C3+2dGL1aSeYPzW49P3E/ae5LRIsoWLBYokEZaKiLY4cGwc4ghf0pKEETm6qAuYHuP5BwDLgzsPTloqf+JQVrQ8Amj3vvMYbKPm2qZ5HDTMA+kBHwdmcG0O33cJZyqovJlon7m2/jCTdpgsXEiJoWkC+9Ck587v0LTP2B5DZ1gCjPpfXqF3AC64uloORAUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS+hE8wWe3IixXSz7epW3i1fa6bKi+DZE83BkJmBSfc=;
 b=PABUFkEZQUWypwJh5LNTxjxaewfgXDYcA3hclbZTEo6AxG/0xYkGAru+fuLYbKBHQd+5wc4XyUKEXgR8zVnywHagTZszWy8dVqUGqNYbRu0sE9psnByjUc/H19aVs/AHapQZmSbuwxNBMhKk5EuPydUI87aW/5BN5o2yGMSw/9GGjCaEOXJ3FbxqYqlkPihv7n4Qor39OrCz49UCEiFaEakX/0ekGw8cq2UHrilx46k6O+5V62sStfEV8sww12VX4JN/i+uOX426GKDvlKEo7RLGCGEvziRIl05cia34Gk+3kcm1BT4z669bfGW1aeybjdAXPjwUZMdFNLScPIPmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS+hE8wWe3IixXSz7epW3i1fa6bKi+DZE83BkJmBSfc=;
 b=JfOjkcd75onHTV60RKVLXBsb6eE7DXBQzpMj7FnFAfS88t31UeJmwhoruXmFIJUl+vXXamoOYVUKx8MWJuSIL2j+srajAVOT8i/PcNDk/zIwm1KrAb7O9hF938eQD1o9Y4eDFRdsiXiZMmRZKw9QxJLgmU2mTovZPyc4qtLUTPUoanMXzEuFzRMfYtH4+ZCYNR5ZB1+5R2T1AmPXH/AsAIr1aOzR0aCspczt0bDw9pMrJLXSjzYh5BW0kvXLUjjz4LzwDNd6lj94o2GEMXd86/Hvt72RRK8sfVqo50AGLqgA0ffK9y23tgzkyCcBYPm4hXYJbeUxViRVW3muP14SnA==
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 12:30:26 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::3e70:7029:faf2:7779%3]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 12:30:26 +0000
Message-ID: <1044c9e2-409e-4c6d-b0d5-95fbf27289dc@theobroma-systems.com>
Date: Wed, 10 Apr 2024 14:30:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto-patches] [PATCH 1/2] README: Switch to yocto-patches
 mailing list
To: yocto-patches@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org, seebs@seebs.net,
 mark.hatle@kernel.crashing.org
References: <20240410092948.1989389-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20240410092948.1989389-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB8682:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9/iEANCZxBFX1/mjQOu7yjN6ogDJyKWZdhjoEsw7znKdkJGDwKOWSaeKAXWG5eAJb77dem3nuU9LRKBmYMsYzTNTXQG6ciedaYZmhq0l/AxFUogX3jF2Dtl8NTrxt6itKRX2zz2BiR0Vx/oF/vndBBvrZrJdFHMA+iV7iIDeINpcmasuY9y6JMRlodHO7GXNmvuvkxmTsqCWjmi6+KVBlLiCSsirOoHXTlHEw+xn2YRZXdawLq/b5dbJz9ueHL91ab8lD1cJL90FlYfFCIZxxTXPAduWwOUJ84CPfTPng6faTHt5gkqBCLkb39IDnq9sd0DtSSleOzqGzjT7I6kKfQA2pue4U/6ga5OSSZNb/xLKRHIdEUMBds6FwnsfVaYxwx16fbBr9IxQE0URdMtNmXOZhwVa8ACPT9BV31v6vavfZYslyRZoN7LaGyhGpk/hSw3wDwwLYoyvKImJSW47vvCTLBzXitKolYeKWTEq+1FTY+f1O//SIVLR4LYmAav33pLTaGWtJrnePLWSO6CLgyVtWsiq9AVSOQobpiF24b/IBM126yJN4Q9MY3/av95kfKgmNtaue0wJDQ8jmOI5jIDHgPXicrAmlVQVT9xBk2w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWIzNWVhRktnMW9IRmRQd0NRNWFpMjBpeERwT1Y1Uk9IdXNQOXRrWlRpTFJx?=
 =?utf-8?B?QUV4QmpGWnJIRXVVRDJhbm1VUWxLallRMWJmY1JwN2loUlE4U0x3NUwvQXg0?=
 =?utf-8?B?V2FiTXhxVDc0ZVBhZHcvQkZPYWtIZUtrM3ZXL01pVGU3Q1RnQWFmRzVoZE5u?=
 =?utf-8?B?bkNFZmlEa1cyajVJSWxyaEVVdXlVZW9vMmxXRDZxWVFXcFlmRDFTeWt5Vzhu?=
 =?utf-8?B?TlBDSy9tWk9lb0J1NUpCMEEyUlc1SWkra2xJdS9XclJQRzRPd2hRazZ0QU9t?=
 =?utf-8?B?QkhacmhhcVdtdy82d1VheFIwVW1zc29yV0FpWUJ0Qlc3WlJoL2NoaEEzUkx1?=
 =?utf-8?B?NG1LY1V1b0hrRklMdUVwMG1xTjd4bkZsaUVBbTFMZmFycTRISTN1SkFMWHNt?=
 =?utf-8?B?bmtRUDFkQ1FtVUhNd0RieUprZTdoTUxNK25LdExPc3M3bWszMEV0enRFTC9u?=
 =?utf-8?B?Q2crNGxBWVBmeTFhWWVPeU8vdlFuQS9KMjFNN3FFMmR1aHcyTVZWbWNDMkta?=
 =?utf-8?B?NjB5eTFtdDdibEZMQWphVU9EY0xGaUlYdzlRbitvMjZxQ0gvT1ZwSnhGQmlG?=
 =?utf-8?B?TTA2Si9FYnRjNTJDZzNEcm8xTS8rNmVRKzNjZGFCSnNQcnE4Qkg3ZUllR3pw?=
 =?utf-8?B?T3JCUGZDUE0rZkJDQjJsdjQvTmpPN0NqTFdMbXp1YU1ka05LdnpzcTJQdkVv?=
 =?utf-8?B?ck9wbVpjRjI4NEhnNHlNWHpXTVM0Qm5Va0ljMjNhUVdyenZ4U2dQL3dzQXhz?=
 =?utf-8?B?OVBEbGFVcWFGNmR5emh2bkhOVXJQWmhadDRhWHBLZzFrMjRPZVk4cVMwblY5?=
 =?utf-8?B?VHQ3SmVUY0tldXVORGpqSWluK2dYNlZpUmtPN0kyY0NrRUc5SVJFeGhGQ3J3?=
 =?utf-8?B?eTFxZ0ViV3hZeEVPc2tCWWlWaHc2NTJhQitid3o3eHQwSys4VXoweCtMdkhm?=
 =?utf-8?B?T05vdGt0eTYxMVE2Q09MdUg2MVMwWElqNkkvMmpxQVdRN3VSbWdsVzdjZnBV?=
 =?utf-8?B?YUoyZ0VHMENZTVRjcDBVR0dTcjdyaXdOcmNIVWNZRjcrM1NYK080ckxoMTFO?=
 =?utf-8?B?VThrNEd5aDdQR3VnZHNwbm4yNDM4SkJjUzhncDk2WlRaakdrOFZqOCtwYzJ6?=
 =?utf-8?B?aEEvNncrTHlvOGFMNENia3JSZmxsUHJlbW1BTEZqMkZxL24zNzBuTWNOSzRZ?=
 =?utf-8?B?TmRDQ0RIZzk0MkMwY0J6YkorVDdZTU5XdXJXd2xMMVZDMW4rcnZjMjlHUlNW?=
 =?utf-8?B?K1drcEFQb0xpZUNWakgzdEt5TEVqVXNPN3FvemlBR2RRNDJZVDUrTnczcFB5?=
 =?utf-8?B?emhlQ2txWFpaWmJGM0JwUlc0dyt1dWRqZm1mY1ZzU3JmZWhzbEtrSGozSTBw?=
 =?utf-8?B?aHNyTlFsM1N4Si9LM0VIdVV3MzNXYlpUZGdzR2QzWEQwV2V5b1ZhRElqNmlN?=
 =?utf-8?B?UExRUk9mZE5ISEJkQkVOck9COXg0T3RhVHNZMDk4d01VRm5KeVgyNG1sOW1V?=
 =?utf-8?B?bFIvOEE4M3FYS3RpbFFmYnBZbldoQlpaQmxodWQ5MENzaWpITTFPN285ZE04?=
 =?utf-8?B?Y3J1N2hwRjZlUkM0Wlc3ckNCZkdpZ1EyTHVZbEtFck5LN2w0MXYxeTliTVRM?=
 =?utf-8?B?WVlES3hGS3N3MFBmdzJkTktTTFFUdkpvLzZkRi90VElMc2U0cUJ1c1VoejZr?=
 =?utf-8?B?MnVnUStsaEd5NU1WbHU3cWlDS2ZFQURXVFBYV09PMEJhNDlhS0V0cmRHVS9O?=
 =?utf-8?B?Z0FVZ3ROTFlTMXpFNWNqWW1PM1hTY1JtMTVwTUZpbzlxbHZ3SXR2WXVIN1BH?=
 =?utf-8?B?VEJoWi9wWUtZTWwvR0NrMnppQ2RISWdrWTBpWGdxQmZyRWlnRFg2TnVBNm1P?=
 =?utf-8?B?Tm5YM2F4a3k5OThBQlJtNFM1TCtTYTB0U0h4WHQrS0V0RS9FZkV2N3V1RFVM?=
 =?utf-8?B?SWU4T3c4Y0JLQU82Skw1TWpHVStTOWVVQlhDVTlNMXpwWmpHdzRUSjR0b29I?=
 =?utf-8?B?NmhVbUNqTk1DOFY5T3lXQnpPbUFOT0M1bkVuVEFaRFRRMng1RDBGZ2QxV2tw?=
 =?utf-8?B?Y1JDQWd3dmsvZHBGMHhVQzI2d25vWGRsdUI4VEhUdGljemFNd2tGVVJBVWgy?=
 =?utf-8?B?OWxFVlFNWUhkcUpYbmhndTIwWDNwWU42Y3FnUTQxQ1kyUkQ3Y2FVcUNzL0s4?=
 =?utf-8?B?aHBUdjN6Qjc5OVF5K2VTYWs3NkJaRTREWjNpeStVTEhJMHhhR1NpZ3J0dklh?=
 =?utf-8?B?NDE2RGl5WjRtMDFsdUcyNUR6WUVRPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b598b6-0872-44a1-e0e7-08dc595a0012
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 12:30:26.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhZA58UtyG+G0fnL90bYT/Um9+lX+8zOLSViEftjmoko7I+Y1zk8t+BsyjamXNUK4MH66g8zzqItvtdh3AdWR7/p7x8jRpGcPcmosb0h/+kaN5sVjMn8m9wt0nlx6r//
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 12:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198091

Hi Richard,

On 4/10/24 11:29, Richard Purdie via lists.yoctoproject.org wrote:
> We're trying to align the various components so tweak pseudo to match our
> other projects a little more and use the yocto-patches mailing list for
> submissions.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   README | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/README b/README
> index 468cf66..425ee6e 100644
> --- a/README
> +++ b/README
> @@ -1,17 +1,9 @@
>   pseudo -- an analogue to sudo
>   
> -IMPORTANT NOTE:
> +The official home for pseudo's git repository is:
>   
> -As of this writing, the official home for pseudo's git repository has
> -changed to:
>   	git://git.yoctoproject.org/pseudo
>   

Maybe we could use https here?

https://git.yoctoproject.org/pseudo

for example?

> -The old site at:
> -	https://github.com/wrpseudo/pseudo
> -
> -is no longer the "real" master, although I'll probably try to keep it in
> -sync.
> -
>   OVERVIEW:
>   
>   The pseudo utility offers a way to run commands in a virtualized "root"
> @@ -88,7 +80,6 @@ available for other people to look at.
>   
>   CONTACT:
>   
> -Discussions and patches should be directed at the openembedded-core mailing
> -list at openembedded-core at lists.openembedded.org. More information at
> -https://www.openembedded.org/wiki/Mailing_lists. Bugs should be filed with
> -the Yocto project at https://bugzilla.yoctoproject.org/.
> +Patches should be directed at the yocto-patches mailing list at yocto-patches
> +at lists.yoctoproject.org.  Bugs should be filed with the Yocto project
> +at https://bugzilla.yoctoproject.org/.

Maybe we want to add a prefix here too so we can identify easily for 
which project this is for?

e.g. for meta-rockchip we have:

"""
git config format.subjectprefix "meta-rockchip] [PATCH"
"""

maybe we want

"""
git config format.subjectprefix "pseudo] [PATCH"
"""

?

Cheers,
Quentin

