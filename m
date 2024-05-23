Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CFBC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:43:51 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.93])
 by mx.groups.io with SMTP id smtpd.web11.17322.1716471828909703941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=dLN0GYur;
 spf=pass (domain: cherry.de, ip: 40.107.6.93, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJgGNudtCFbqFPnswHCBXEJbi3WX5srKawqYR6mX1lHQxVRkP2Y/yCPcdNP2y9Wkburjf400V6g1OadxLrp8Tp03l2PICPF78JAOcNw2DSgKqNvnj3YA5/8V38dQKdkhtqcf3v8gNecIm+rgJ0/38ZOTYYQsVPPMrFRl9NH1A+cA5/OUpw1Md024TFtgGsidyUHSpNGBiWDz/5GhqkS6hY0zERZahl7TlAo00ADHYLp+cwCxMz2ck14i6mDqhsUgo4tkQs8v+3jnSOP2pogM/w6DyWwbX/sQOx+0H3vYoefBJO5mmEOcxbADFUJUrSphZNNbiniYoFIZ7j7wE0CjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4cB8+XRwy9zQZgAZZ+9sIFhK+RqfVncJtIkyNkaF10=;
 b=Bc63uL9ARu1GIoTHy/tx7ZwoS3RKChS8hrRv6BYTtXjhJy8/t3YOeVlJDA8W9nFN/HOwK4EJqnJUp/bDwfeYLcz7nMoGRkIS7IMq2tKQgxVihFqeT6v7MCzvCd9oHGQEUpwJvu9+TeOHJnzBiJBR3j9X3azcijqLcybw3IxUWuC8TjDjGNJjNdumef08q0sCzLlOA+eSnO6EquUoF4//ouUU8SaJokK8BDpbCN5p4Tr3jhheEFBVpnCbyvGPpdeZb9UvOgG1Xi7lHRLL045CASeacqo7k3jtIUlqDA2yi/DXsGtBQDITRPIBl2qfnoyO8IOd4czyJR5AHzoSKutjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4cB8+XRwy9zQZgAZZ+9sIFhK+RqfVncJtIkyNkaF10=;
 b=dLN0GYurG4HWRO9996qqZREeI9eMPyDFHGCeie93rtEzXC+xmApSfMNJZOq/fahmTJMo8LXzrqUMp4AdhsuUxYp0Ny/herd1MajGiCDMDX/TZuCS6leEIb32+59hj3cMXQhSeG4HM08zMU7/RlnWRzzTm4olrvibn6jsC7JI1C0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by AM8PR04MB7395.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 13:43:45 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 13:43:45 +0000
Message-ID: <da23b251-8a2e-4bf1-8c96-812593f52d96@cherry.de>
Date: Thu, 23 May 2024 15:43:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: uboot-config: Fix broken menuconfig for
 "fitImage" kernel
To: mike.looijmans@topic.nl,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.cc544a93-e646-4932-8496-82717a21cde8@emailsignatures365.codetwo.com>
 <20240521135705.444470-1-mike.looijmans@topic.nl>
 <5340825db3c98197e448c58b88381562edbed66f.camel@linuxfoundation.org>
 <023cbca2-b5e4-420c-b109-445d7d8480a4@topic.nl>
 <5354eeca5b37a4fd3de0f9afec23ccc834f993a8.camel@linuxfoundation.org>
 <802ee008-2325-42a0-be6d-a2d0ebbea050@topic.nl>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <802ee008-2325-42a0-be6d-a2d0ebbea050@topic.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|AM8PR04MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbab7f8-75a3-4cb0-c263-08dc7b2e5de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tvxdygA+83QHp4eUam1DmsXkImH/vEBinruwsyweZd6+pMZ1qYbCBXSdN9/6?=
 =?us-ascii?Q?e74sKmRIc+P1ALeA2F+p0usgS/6dy0Gd+z1hDJtZFWNyinEwBYcq7G+hz4sP?=
 =?us-ascii?Q?oBobnfiS3HtqjEoaLDQLWd/qwdwWwaleLvUMIBuBWEi0PdV4dxGNdnDoMB2D?=
 =?us-ascii?Q?7aXyy9VQK3bhgYVJJDWiHAYZv/5RuCqczeiTlRmg1qEp3d0Kw2ZtGmf7JdwJ?=
 =?us-ascii?Q?8U7ofr7YxRMlKAZl2bCy5tVjScXHtqguVUk9zFVXg7XMHodNa8iRplo+UYW9?=
 =?us-ascii?Q?l2/1jNFCqm81ayhCXwlLLm+WKm+d8iP5XG53+KouszLOkdnNvWpbQIFhXh0W?=
 =?us-ascii?Q?psfx+oqqgs8t3CeZYI6XLITAYZyPcI4Fo99DwwbTRQI3AOeDY+ciPMN2xHPC?=
 =?us-ascii?Q?GxxFaxeZXb8bpgdKh58Xql+Hvq8P0twVr8eMocDhxnLmXoB8ZJNPtMsDpcOy?=
 =?us-ascii?Q?Zi95InpNQmeS9Rfd/133YPGbaipXaS0YohkNAmbYvh8aEnVlUus7XWLrrnII?=
 =?us-ascii?Q?t5eIdbXnKLvauE9j1ecMzGbCnKc9Ys3wNU1dGmN4SoTTy9FqSthCAQ60ed8O?=
 =?us-ascii?Q?dNFpwJCl9GZGpHlQvJWp2aqjPWsDyk52DgatG7K9i3UgFJ5W2y6Bd9LXQYCP?=
 =?us-ascii?Q?7US8TvI4rH6FHsChHs2BGVGhRAKUaY9e8KwI2/FaPnfRYO1ardlQJV62wp08?=
 =?us-ascii?Q?NifpeVhKZurCrNwqMRmt1qgeymSOH1gADZ/d0izK9Ll9OyjPNSTolLdob+Tq?=
 =?us-ascii?Q?VT6XJZfQi3QzBvGRX5FrgGtS/tXWKu5rDSTd+eVOIIJ28damgWIV0POwqTei?=
 =?us-ascii?Q?Igmd9bCwwf18vNIcDOe/GUq+UwDa5EbxyViiTSoWmsjz4NcNGIaJg5/ZQ/yn?=
 =?us-ascii?Q?fRVzF1UPU26i5Twgu5Es51i25gZY4KBtsnaS5q4fVEU8O4Z7BX025zLgaSqf?=
 =?us-ascii?Q?BuoON+Ze8tTz9h/9sV+xMVf0pLfuJ2lEfuE/YALRACI0oCpcdV3FNLyeud3k?=
 =?us-ascii?Q?m6R9grR/2ECz1rh+6qBRj7bNXx3dv7PWaqk8GCDLzVjOdC5SYIubUb5G6C3F?=
 =?us-ascii?Q?VpUIDQ5+ILt2TAWMkQLLOJaklf0xsHECibAp7FrQEOsNRp9MJsqeSXS2cuyM?=
 =?us-ascii?Q?2LGed95UwVkrHqSuKd9wx1q6lPO29h2BoJbZ725ek5uGCNtMVsxhw4Uu7Uqo?=
 =?us-ascii?Q?S0TKlc3DMYo38Jx87ZGK5kYcIYPRuLYBrHKef32iymrYSw2kyOSu2q9hmd79?=
 =?us-ascii?Q?Teayu85pzrw90Bo7+ww4eeAHQDEN5+cfuskbi934Xg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ln3KBSdViuajDNHBUv3OIx2GeMeq2cerfUn4RvSxXHk8PzmHV4G5df5QkQZ3?=
 =?us-ascii?Q?RxHIwm+2ekgvW64zF/v2pfOz5vqn9IFL++3HxGRMAGS4gevKNZ1PPM7fK4er?=
 =?us-ascii?Q?eUwO5DymVvRXrXXWiyzTBfaguQsdSKeuMSGciMg9nV1iHpAHPPeTy6gmelvv?=
 =?us-ascii?Q?hBaDPsBjFqERlEflLN3sB4F3tVvxnXc+BEn/Vucjm4dpUpO5Xwj268n2mRvS?=
 =?us-ascii?Q?t9qUVQBebcy405Hq9B5qRPJfEEMzsLvd/LggRySRfX+4tApdwbHBdoRyhm15?=
 =?us-ascii?Q?xOnLM5yg6h8S+8CSKR4ry1xjvr9Uc2YmyxZA3FbjuDnuR6/ryPFy3VHD1imJ?=
 =?us-ascii?Q?kWsDokoNwSXjNFurUVg8zj49FQTFGMGlGS0dZ9NjN44HExEph3B2RevF9Nh5?=
 =?us-ascii?Q?EEnhhFF9YYp5Q/zd8f+uWD3rXnN/qIDFgTmsZUXIm2Z8pCsTqcYRef3CRwby?=
 =?us-ascii?Q?qw/CJdSjjek7q/OtWhPIQTQtHKRYc1RR6GQWAym02+RVUwUQ6U8gUCqBWtsH?=
 =?us-ascii?Q?ku5+6sLYppusCTdR7GmBwwvESGNzQhFo3PbR1MZJ1t4kfpYPFKFME+HJJlUl?=
 =?us-ascii?Q?MrXa3UvTqnhIpmMvXUny+M+tYtaUvMDqsqOCboA7DSlWtfaycnqRzggmykya?=
 =?us-ascii?Q?IcAzVdiTo3YTMtcYL98wjV3k/SbJH9DnSFStKCbWDf1hW5oqAt/K8xvKcCAS?=
 =?us-ascii?Q?PODfC3k0qpkghz48fc+COGl1WPaEgZphIs5gEDt8JEuuyuNBiB4ei4oVRGh4?=
 =?us-ascii?Q?Gm6+Chm+lWbwRfdmbtoAx6lwO1hOH8+9fve2l65U1G/2srWFuhd4hwH2Fe42?=
 =?us-ascii?Q?MBLux332+jBMDVjvOzyKsShMtEgva2jzKxrk9RpbLUwRsH2sb7XVn2OdfeBu?=
 =?us-ascii?Q?4ud98XdyL9dhnaaQ/f7lyhoeA020I8Qh467H8jmIpRCRw6eYdbttT75MirRD?=
 =?us-ascii?Q?0t588JHR/zjSW/3PQNbEi1+cGccQ2PZJSqy6ntEzFeC2tPsDlbltviOfc4qS?=
 =?us-ascii?Q?j4uB+aso72/zNN2tsElDIr6eOxPWcELVKtiXkja3OBr+uZpXhnz5NRSiMrlJ?=
 =?us-ascii?Q?qYW2l1Rn0RNWyYdE4YEwGI1rGPCZYHLks1MGy64pGU+fVUIkQ1CAMeB5/zVM?=
 =?us-ascii?Q?DFNm1CV8eHbyDy/JKy4/YOnrQ37yK1FcjrPKcoWR16ebFjbdgBqkEo3q7CwR?=
 =?us-ascii?Q?opj1SpOwbnD+jEwifFd/uSTmDQK9BchXBDBeuc+IfpDZjLXAusKt/eeNb+VI?=
 =?us-ascii?Q?rNlY1eb+PUh7rS2ggCcuBnCiEnblqQHKPeX9x2Qq2hxH2L3R3lmLF5cKGGsP?=
 =?us-ascii?Q?I7f9huNgvG6vMbRRNCfPb9pWoLWNgPavArCsADgDcKgXrsRU/7+oYBfHGcKI?=
 =?us-ascii?Q?VhuC2VvolgyAXEcl3QYFaLKOtDd7OJOrKdUYaN7hjdExthAGSa8ypjg5mZ6v?=
 =?us-ascii?Q?FMCI5pAmmJmc6OhwprI3Kww4p/LCETkTXnqKVRI05xv/Y1n8jBHkeP3avmYO?=
 =?us-ascii?Q?/BvQaKfmUomQPHaTXXFJ0uPURiGy8KF9LkVpQ1/kPRUhsgJCNO1UhgFAA2iX?=
 =?us-ascii?Q?aeJvyQJLgHnSaK/eCfhh5wUJTf2ZkI4yuS+2e4QDoxm3W29cEQat7+kvFAPv?=
 =?us-ascii?Q?DfC7uA7ndCz5risZrojxiM0=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbab7f8-75a3-4cb0-c263-08dc7b2e5de0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:43:45.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2tB5GXCADA7bAPtY6OhggetgUFVXlyUtCos0CAkZBjMnsFD/HNQ6DLOOuoHVv49ITYP3mKw6Jzv7iuAakRyyLMqV8ov2Svh5hEtNm//Oyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199798

Hi Mike,

On 5/22/24 8:43 AM, Mike Looijmans via lists.openembedded.org wrote:
> On 22-05-2024 07:39, Richard Purdie wrote:
>> On Wed, 2024-05-22 at 07:28 +0200, mike.looijmans@topic.nl wrote:
>>> On 21-05-2024 16:51, Richard Purdie wrote:
>>>> On Tue, 2024-05-21 at 15:57 +0200, Mike Looijmans via
>>>> lists.openembedded.org wrote:
>>>>> kernel-fitimage inherited uboot-config, which resulted in failure
>>>>> to
>>>>> run "menuconfig" on a system that has both multiple u-boot
>>>>> configs and
>>>>> wants a fitImage kernel.
>>>>>
>>>>> Fix the issue by splitting up uboot-config into uboot-config-vars
>>>>> that
>>>>> only contains the "harmless" variable settings, and inherit that
>>>>> in a
>>>>> new uboot-config class which contains the Python code to do the
>>>>> U-boot
>>>>> specific settings. Inherit only uboot-config-vars in kernel-
>>>>> fitimage
>>>>> so that it has what it needs but doesn't break.
>>>>>
>>>>> Fixes: f9e834e31788 "meta: introduce
>>>>> KCONFIG_CONFIG_ENABLE_MENUCONFIG"
>>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>>> ---
>>>>> =C2=A0=C2=A0=C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=
=C2=A0 |=C2=A0 2 +-
>>>>> =C2=A0=C2=A0=C2=A0meta/classes-recipe/uboot-config-vars.bbclass | 95
>>>>> +++++++++++++++++++
>>>>> =C2=A0=C2=A0=C2=A0meta/classes-recipe/uboot-config.bbclass=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 80 +-----------
>>>>> ----
>>>>> =C2=A0=C2=A0=C2=A03 files changed, 97 insertions(+), 80 deletions(-)
>>>>> =C2=A0=C2=A0=C2=A0create mode 100644 meta/classes-recipe/uboot-config=
-
>>>>> vars.bbclass
>>>>
>>>> This looks like it might be a good candidate to move to a file in
>>>> meta/conf rather than a new class file?
>>>
>>> What does "this" refer to exactly?
>>
>> The variable definitions you're placing into a separate class file. I'm
>> saying they look more suited to a shared conf file, which is a
>> direction I think the project needs to move in generally.
>=20
> a "uboot.conf" then, okay.
>=20

I was about to comment on the v2 that this should rather be a class :)=20
Do we have some information on how/why this is the direction the project=20
should move towards? What are the pitfalls we're trying to avoid, or=20
benefits we want to gain? Or is this just some better/best practice we=20
want to go for?

On a slightly different topic, I've been bothered by KERNEL_DEVICETREE=20
being defined both in machine conf files and kernel recipes (in my own=20
BSP layer, I'm not saying I'm doing things right :) ). I did this=20
because I wanted to make a switch between kernel recipes as easy as=20
possible while having some kind of common DTB in the machine conf file=20
(e.g. upstream doesn't have all our Device Trees/Device Tree Overlays=20
yet, sometimes the names slightly change between recipes...). If=20
everything was in machine conf file,=20
PREFERRED_PROVIDER_virtual/kernel/PREFERRED_VERSION_virtual/kernel would=20
be only a part of the switch). Also, I use KERNEL_DEVICETREE in the=20
machine conf file because I need to extract the default device tree to=20
do some logic on it (namely, modify U-Boot at build time so those half=20
broken ancient vendor U-Boot could boot my image). Not sure this is=20
relevant, but had it in my mind so just putting it out there.

>>
>>> Note that this patch just moves code, it doesn't introduce anything
>>> new.
>>>
>>>> We could add any functions needed to lib/oe/ if they can be made
>>>> suitably generic.
>>>
>>> What "functions" would that be?
>>
>> removesuffix is the one I saw that was needed in the new class file and
>> wouldn't work in a conf file.
>=20
> Interestingly, "removesuffix" is a built-in Python function since 3.8:
>=20
>  >>> 'hello.all'.removesuffix('.all')
> 'hello'
>=20
> And 3.8 is the minimum required version for Yocto anyway.
>=20

If we need to backport this to earlier releases, 3.8 might not be the=20
minimum supported version of Python anymore, making this harder to backport=
.

Cheers,
Quentin

