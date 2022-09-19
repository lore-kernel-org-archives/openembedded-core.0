Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2334ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 15:04:41 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.81])
 by mx.groups.io with SMTP id smtpd.web08.110.1663599876977718658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 08:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=AOES0Aiz;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.81,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dejsU1D7Dr+1sLKGSMwu5dg+uHYcBT+I+e/UyqQdby2IPCteIszWkZkaMSGT72NV7bHBdM1Ms4DutYaFM5X6U93rKhRbbyZJjcWACSJclzIDZyC5+NjF6DvBeQilErK1OVjrqCo2x5OtRxyrgYP5gFFStQzmxmr39bUgTSSO2NpXnLfErXiP1HK5d+iInAJJAruOIZR1KoTYpiNyZyrNRnhL53nkb4LeUNB19VNufcQVW3y3/gFdT/avw8kZzaTOVQFz4AHx7bEcSTuLk96x6bd2w8njwaQNZ0muens+R7SqvUNrXOJbU0/Vf2P6zpG0Jcez7r8aI8+bvDEzhk59KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkmEFswdLjKl957q+lLuN5Ifz8eMT6GBNu8yI3mEoog=;
 b=LzR95FRjFtSwjBy4QKREZXrqKNBfIK2iKl3aEJ3YymErl4Nt5EDCCi90rtPM5A1qDGe7bMx+J0byQe/ScM9fx14voVSLRyqDnLjnvbYVWeTjxRh5lCyIT76PAEOTxCPpVSq0rjzdkfVrrzkay94FQTKqEnoOkw33I4v5Wyi/NVLg0BsA/IRrX2CayUMHqb/uaxCpUCm/0HUtgfOCmbrLG7UG0uZabkS1uYqCvEh8KK2UC/mTamyjeueCwLLOqFHczbHZiODx92ma9sxlQgLzwpN3mYg88IlfDseNVVmsgBf1farAqd2vbX+G6QUzh3eAK1rvzGpC3fhbE7OungRbFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkmEFswdLjKl957q+lLuN5Ifz8eMT6GBNu8yI3mEoog=;
 b=AOES0AizzeRjom7WrVQNBoJvJemSN1ZpLWhXhoTL5KKYeXHGmzzPtrSQwpWFeNyvKVOSnbRFtf14lY7K7tGU44twxA7gdaR75p3+DHMxE3gsDTTse9byHKL9UyL5AGHXE2kN7hAaK8/q2V6cjqBAWtPBqeo5KevrOWF6KaY5M1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7857.eurprd04.prod.outlook.com (2603:10a6:20b:24e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.19; Mon, 19 Sep
 2022 15:04:33 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 15:04:33 +0000
Message-ID: <f0c891d5-ccdd-41fb-97b9-ce987818e18f@theobroma-systems.com>
Date: Mon, 19 Sep 2022 17:04:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [docs] [PATCH 1/7] common-tasks.rst: remove SRC_URI:append from
 examples
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
References: <20220912073221.16601-1-mikko.rapeli@linaro.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220912073221.16601-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5406fd-fe9c-41d3-d837-08da9a504283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hAird2rwiFiYsJhfhRK1oam9VtyN7QqAj+mtUayWzfEE2pVg7uP0aPU7iwViIhjJpAXwlBj0IM1GexfkOMN2TDZaB5h2rwDbm2yQeMCnqxqC9zI3rZPoy/YdmG6W0xUas5Ua5wYspr/OEJi9qUUnmysuvHzxnpdA5gUXr142sojaB+IZ88hU2HbbhMB9NIkzckfZB9xcRhpySLSRC3vnXjL/hDB/dnuL2jyaome4Vc97BOFqgocnQnGL4pWYcsIEEppjnn2DtBZPRpdnfs/cIfwfO6VFRV/WWcTkdI+dfBbSHi2waRotJOYZLXd6KJgL4MYqxBTq/qR7JOkg617gzbh1id8bnF31ysujclT+OJ0Z3033N+IEnOiQhGeyWDk3URjtJJP52ZsFVOXTZko2fMpnVFrIvYdOIWrpEr0PUvd+wRmvGDLaZA5FxrsqyozUmrWD4KTw5+jN5n62u//juQcWyjFNWPBpuFf4dRMzHfYhmT4tH2R5eVsLK4FVQoajUMhPzkUe5oaLYkDXBlEpGo9qBFLOPj69cDPHw4P635R8RG2y/BzDaVQw3h5h0lCS/ozNTiz5ibUumE5m5RelkILGBWHJaeYaWdRTl21z7pkFPWAaij/rjSvFTh0RWxpDeHy1yt68gJ+3hMo0tXTUBunQjdBv39NGvWWXv6cmOryvFXjAoWVREdhKmVGyeZZ3qRKiPxmWsrzqT9KCwHw9EUiCGgTYq0n4LUpFA5gVXkSIYDGqS0tAtn2jH9qt1eShEdmy+00aBye9J+SxWh6twjWC9MbdjcOhj3Zj+u5bIJA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(39850400004)(136003)(366004)(451199015)(44832011)(31686004)(36756003)(2906002)(316002)(38100700002)(8676002)(66556008)(66476007)(5660300002)(66946007)(8936002)(86362001)(31696002)(186003)(478600001)(2616005)(26005)(6512007)(83380400001)(6506007)(41300700001)(6486002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTVTcEF6b1VFZS9jbGdXSllnU3MrSzdPTVdhQXFqZ2hRRnozWmhCTmVSa1Ar?=
 =?utf-8?B?dG4rMnFKekFVRDYrdU9JQmsrOWxIQ3lCczZESi96dW1Sa256MlQ2OEhuYmVS?=
 =?utf-8?B?NkhlQ2FselhHZE9wZEFMSzR5U2d5cEUzdFB4a0tZRDJZZ3Uzd3pJVC9VK1c0?=
 =?utf-8?B?cGdQU2ZVdldpcGZFQ2NpcC9LM0thbEd5VW5ic2hpN0dpMDU4UndnVCtEMzhG?=
 =?utf-8?B?VlBzTmQwTXRlMkI3SmZEZ1lncldDL0RBcWhNZSt6bkloMUZhYjE5bWYwcXd4?=
 =?utf-8?B?SEJMekF2akhNb2RYOWxaaUxPMHlGRjdzeXVQc2dMcURPd0FycEMyUzdEK3pv?=
 =?utf-8?B?N3ZXL01LVE1ubGdJTDZ1UWx4WlMvODNWYzZqSTVtOG9IVjZGWVpHMWI2N3hy?=
 =?utf-8?B?L211cjlkbU9DcFNBK0FkTG9GdFJweHNJUGNjMDF3ZEJXYlVSV25pK2Mxd3dq?=
 =?utf-8?B?aTdrQitXY0gydk5WR2xJNndGcSs3QnlWSzFWamd0RzhkMDhIUGZHZ3d5dmtX?=
 =?utf-8?B?bVZSNVBKV0xzQ1l0eXpjK0ZRYkcvK0NGU3c5TSthK2xES2lsSnB3bitISUc4?=
 =?utf-8?B?b29BekRZTEFPK1gvak9VNTNBZ3lzdVFOaXJ6NFgxMlA1VTFhT1owcnphdURE?=
 =?utf-8?B?Q3NQWHVkM0xYaGYydmlRMHlxQVFUNXFRR0xEejJnWXFSU3VUOXNhbjFPcU1l?=
 =?utf-8?B?NUZaUGFoVEp1MCtHeVVmL2FJZTdaZUNDMmlOd0tzQ0hpVjU4a05RNDhrWmpE?=
 =?utf-8?B?dGJUcnR0RkhlQ0NyMU5vQVhWNTRrU2kvaHprbVJFUU4vSGZpYk0wOXlWeklj?=
 =?utf-8?B?ekVua0xKaW1VZndVSHlhelNYZFlPRzNEYjZWU2MyZndDZW5PenkwRTBWVFE4?=
 =?utf-8?B?SHREWjhuSFZIRi8rdktJZytYZkVLUTM0ZFhmWTZaYmkvUDVTeGFCRERKVXFM?=
 =?utf-8?B?bFZLRDBhM2RIcU4zNklxTTZlUC9zZ2NUVFlwbUVqREVSYlVaZ1NGenhKckFu?=
 =?utf-8?B?N2JuUHpqaTVyaHhFR2kvZjkzVDNQcnMxYWRab2RZSGRwMnFSOHZlVHUrbjhr?=
 =?utf-8?B?SkVjK3lEMExvWlZ1ZGR5S3B6RnVMNUEwcXYwbFNMZzVyWHV5WndoRXBjemp2?=
 =?utf-8?B?K2tUaVZ4TUFiY0hvcGRUeFhON0k4SndwMitYSUVVWmJGc3lETHZRbXFMU0Mv?=
 =?utf-8?B?YjI4OXFBbndlcE80WThkc05WTDJSRU5zd0NJeEVRdkxqckQ4NUgzNnBxNEcw?=
 =?utf-8?B?YTNHUldaRklHNkdTYmhKZ1hFWENTZkVKeWE3L09IYVpIS2VCd3Q4bVVQaEdR?=
 =?utf-8?B?RGJBYUsvRGxRU0lkTVNmQlZXd0E4TmVzQktMdEoxMDdGL3NXc2JvOTVQYlBE?=
 =?utf-8?B?N1ZFSFdTQlQ2K3hnblQ1U0ozcE9SQ1cyLzhNK1A1NmdDM3dUUHNOQjg1b3dO?=
 =?utf-8?B?aU1kYitCVVR4ckRxaHJwbXdhN1ZXUHZVV01aY3puYllGN1pJRDNNdDExWlhs?=
 =?utf-8?B?dkN2em1JZitJc2tVYmlXZ3hMUUg3Kyt5Zjh2eVVrMTVpdHhZQ1NEcWRDRWcz?=
 =?utf-8?B?bk5NRS8yWTRjVitGYjRPbWlKUG4wRUpnQ0RwT1Jsa3gzWGtaU3pvb2ZIV0xn?=
 =?utf-8?B?SGNTNUQ5TG91MFdFWGJ1MWdOelNESEdwQ2pycnIvenZJZlV3RmhTbUl4NXRS?=
 =?utf-8?B?VVF0bU9jYzhRem9WUkIxM2xzbGFrUlNWNzl0dWlTLzJya0llaXRRL0l5Uk1I?=
 =?utf-8?B?K3VST1dLSmV1aHlLbk9ta3V5SWhVQTEyT3Jxb1FWbEpOaENJV3dLNlMyTUI3?=
 =?utf-8?B?S2JIVTl1aEtkaTdsK04yWDQ0a1NUT1I3TVU1S2UvRVRua1JYK2k5Um5YQ2Q2?=
 =?utf-8?B?dUpQNHd3NFBrbnF5YlN4ekNDeW9jTWtsMXBrbUVkbWF4T291dm5CeE93UkVr?=
 =?utf-8?B?WnNYV2dITm1yK2RjR0xtcGIrNFlTWUQ5TVdWSStZK21oaGozLzhydUlSeHQ2?=
 =?utf-8?B?KzR0TDFhSHR4TXRmV09qdUpoQmdaZlBuL1dJM2V6eXpmb01ybG1NRXlaaXZu?=
 =?utf-8?B?eFRUWmJsdnc2cVlOa1JGcTQvWEloWWRZZ1dNd2JIMHB4QXh1dGtjeE5hQzZh?=
 =?utf-8?B?NG5Nd2Mrd3Z2cGo1Q25NRGxLK290cFVXbkR0YkcwaFFiWTR6V1RlSldja2pi?=
 =?utf-8?Q?kk1T3357HAizm2gUsuJ9nsg=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e5406fd-fe9c-41d3-d837-08da9a504283
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 15:04:33.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DBo4V/58ykzvACYmdS4yzChJ3T3Uo4keY7MGxKPtaCAINH6Nxf/ufjhVwimJT56z55yLgwuOwGy0gSq/D0h82HaVHQ4s8pyybximDs3Z6mbUD0ycqZvCUQZH/tJKLGeR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7857
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 15:04:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170878

Hi Mikko,

On 9/12/22 09:32, Mikko Rapeli wrote:
> Using SRC_URI:append without recipe, machine or architecture
> specific limitations makes the :append'ed text unremovable
> and thus users and custom layers can not change the variable
> anymore. This makes it hard to e.g. override SRC_URI completely
> in a bbappend to update the full recipe to a newer version.
> Thus common, reusable layers which users are meant to re-use and
> customize should not use SRC_URI:append but SRC_URI += instead.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/dev-manual/common-tasks.rst | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index b08a55331d..3112f9b893 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -2577,7 +2577,7 @@ chapter of the BitBake User Manual.
>   
>         S = "${WORKDIR}/postfix-${PV}"
>         CFLAGS += "-DNO_ASM"
> -      SRC_URI:append = " file://fixup.patch"
> +      CFLAGS:append = " --enable-important-feature"
>   
>   -  *Functions:* Functions provide a series of actions to be performed.
>      You usually use functions to override the default implementation of a
> @@ -2708,19 +2708,20 @@ in the BitBake User Manual.
>      to existing variables. This operator does not add any additional
>      space. Also, the operator is applied after all the ``+=``, and ``=+``
>      operators have been applied and after all ``=`` assignments have
> -   occurred.
> +   occurred. This means that if ``:append`` is used, that text can not be
> +   removed.
>   

Pedantic: it can, with :remove. One should try really hard to not use it 
though.

The rest is fine.

Cheers,
Quentin

