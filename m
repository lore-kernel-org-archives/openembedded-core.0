Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B550C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 10:49:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.web11.84692.1754045367643086005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 03:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=k7EsEanB;
 spf=pass (domain: cherry.de, ip: 40.107.162.62, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/WcSzGfyP5HyjGGh10WaY5Kl9/id4xtgfqSY5iHNdql7BG52Dt7BHVCBP0gA0dZ+W2iu3lvFyhjnFSrYdYWWSk2oVM8XOrl/GUO04yOItr/IUShVZbM2Egazl3cw9aGxEKjUKksJxO0EAEC1k2JOSWcdbHk8K4OX2oaSB1IXWPW/hm9tpwTw2dtvABKkyrENL1KDoSUdpvqtZDrswk7ltuwW+/zU1glXwtokCPbLJWxWzjJ13PMPOU/hFs5fwa1wWzgUBSK4kC5rDJOIDkRRHwOOejftKCvo+NtZ6YLPv2Ly6/pZgZVpZIml0SgojEX7nrlwjXMaWOAnPZajZMUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Zin9yeDJHMUAv6+hhTxAsU6PSQv06iAAX500tPHHMg=;
 b=j/Toe2hb9UzB2Rt4sh8AFgdpNgEvrKM4y9G0T8QIkO810mIyVL4U1cntVoK2RkThMmU27hEHWpHvsIwlHrkfKPhvqwEWPWrRTAG+ArPVefBF6gAOBgC0WWYsJAE5fgQUzmLklDxlJGTSOciGlHdLOBKKMgdTHKez/9OM5RUUBEWxiVrVpRWSvNZbilThYOEd12Uc0jIqs0nXyb5Tx+9yYUfIM8aYh3ZZcWnrWvUG3jaW2Wtm6twRhw/N5uOHL2X81OZ0wXVpd5dLuO0rsu1YbrkNd0AY9nCU9vBmsdEq6Vlb2UpUwW4RAGRAaR7u508eNeC/ibdAxgBY5mXP33AUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Zin9yeDJHMUAv6+hhTxAsU6PSQv06iAAX500tPHHMg=;
 b=k7EsEanBIBPM4cJLDQKUBb94azYjiekhoyKitnOVLa0y/sDvHDecciAislF2LAKExgMTiYGFqbtLI63dc7F/O7ahT7xObcTytS/KFm/ttHbb59wqBoBR+jzmIQJX7oApAqICrLQllVlxRUzMEQiuiQsB0pVMWcwTEq6k7YmZO8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 10:49:24 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 10:49:24 +0000
Message-ID: <0bb1a924-2288-4034-a468-bbf358ff28b8@cherry.de>
Date: Fri, 1 Aug 2025 12:49:20 +0200
User-Agent: Mozilla Thunderbird
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu
 when crypto not in features
To: raj.khem@gmail.com
CC: openembedded-core@lists.openembedded.org
References: <20250724170600.1113476-1-raj.khem@gmail.com>
 <d4128d48-9dda-461c-a932-d31edfe1f43c@cherry.de>
 <CAMKF1sqWyUx78Nqc=LsMPq4nLGMzSstV1XePH1hNs8b=vr+JjA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMKF1sqWyUx78Nqc=LsMPq4nLGMzSstV1XePH1hNs8b=vr+JjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PA7P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 34852ccd-c9f7-4901-add6-08ddd0e91409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rKqtNMiKCR0ZhPKNz1R0G/Uf4GW28LJqWLOk/sgKx1FZfji7l70X2G/shJYa?=
 =?us-ascii?Q?LVJ49zENVGAi8h+EK2Mft3S6A/q+c4LP7xV/AVukUnevSAFjx7VtAdAwlGJm?=
 =?us-ascii?Q?inhON6B+5eq/v/2lCN/Uo5CYhUq3wIPhvR4Tpt5fDRWuueajxnfTZKDBvR/L?=
 =?us-ascii?Q?9pvv/NpYFN19JYk6/5QuDR8NJH+yQetEPGhi3NXrHFc70QSTB3dnHxW/fPkY?=
 =?us-ascii?Q?u5LuYqQbedJe/fydiWl+R9TUGH3EetHZlpiwEjbE/KUBhA506Mxa1mCNgw0I?=
 =?us-ascii?Q?3M6bzlIN/Nago7S5Hu5quYVjYtZGSSL0ia3lN2bMXA7EUjzuuAEKyd2r7E3I?=
 =?us-ascii?Q?MkBn41JcW9tEXPqLxMqdiKsC2fQfsTNH6RxGJ7hQeDy+VZSFepFUkOna15pE?=
 =?us-ascii?Q?KLnkLEvWdZgewCiP3Rtl1IYXL5pPSg0xmu5tuizwjl+x6uegLfG8Jt9t3N5r?=
 =?us-ascii?Q?0J3jFUBZOwc1BJ7htKHz/NrZ+qj13MTUrm4A6VWIhymFthsDcoo5YVs+l01N?=
 =?us-ascii?Q?MGYvlzZ9N5LSOdZO3I9avPV6Te9YOWGf+Ax3G/GplUztrwOGk+Kh7/bJ0z0J?=
 =?us-ascii?Q?+1FJoHpfjI4USVnRtJ6GArLlhI8rUYKaCy9wkvcyg1ZUqhzdgb/QqQ55HPY7?=
 =?us-ascii?Q?+YlGzeWOLk5IEptYmTDODzyE5XHIGR7pzmJXHahPgZIRNLQjKEw7o8mS42Zw?=
 =?us-ascii?Q?9UwJFHyAZzuvaVonM5zikQx1XTmp6i9+r7FAEy0CkxWJ/Sr+X94SFoGq2qfd?=
 =?us-ascii?Q?JP0odgF+bjOVR9Dk+UI9QTOYRhUzAVKAlnsz9Ib6FPQp3y7jX+dwdu8Matp0?=
 =?us-ascii?Q?Nu9AU+LdVALWT7qCF1WEaJKJoP1rWFWQsAlfmAIeQryItQS4WJS7zmdljPFA?=
 =?us-ascii?Q?3lYpLx8pTO5LPRBnpeRolmUXz2jLQVkOVWM/l9DahV6UG9V9Si/3naqBBNwm?=
 =?us-ascii?Q?XT3HYFOenHOpxAdEqofbOXKqBhETp0WPgBdlAONFMaCks17SH0fC88FUws+L?=
 =?us-ascii?Q?uDexVbV2SPV5K0pA3nIwQUeA1gNH18+clPb/IhktARk6coqVwSXrGyqHPkkU?=
 =?us-ascii?Q?pgWORPZhC6P1EuZwhtEpYRkJs4ukYPuyFYU4ZJOYW0hfHoaXNLupf55WMlXj?=
 =?us-ascii?Q?mYs4grM28wzO9xXnKTMw5TT7xB0d2/qv/fZvPR57XxZ9uNs1q5WEPtxeTDZs?=
 =?us-ascii?Q?6TWeiDa4aaYSUPLspx9P0CiKXbg03B8Ef94sJKNe9hlB/GilpouYmYR4z1fM?=
 =?us-ascii?Q?pJ7J/EAzYKbGKsZ6fBG7MdGW6phUAz7q6LUAbiCjzdmAYo6D8vFuJO2JCMZ7?=
 =?us-ascii?Q?awc0fvnpzUM4gfyWxQYCsIYjBol2tpNPxXYWemKRF2SIZo0IOxSBQgpHAMA1?=
 =?us-ascii?Q?GF79RhPZFTNi+b/synBMC3pGvQPRIhPk3ILKOCj/UO6558Cy7R6ErvxSzJdG?=
 =?us-ascii?Q?VkcLIcBiKGE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xv+RVXdALK/xZ43l/LX0t617cpyf/QqcQ3X1UWY+T744YOY3YK72G4zv4wn0?=
 =?us-ascii?Q?74gLPHN87KIjLvcNtQEVGTmZpEkjXQYThzj5QLfciUz8jPXW3sDqjHwcHuBR?=
 =?us-ascii?Q?fYgUriKd58s31czDgTmgnN3wi5lDHOin+XCF+b+CtjTX7znSIvE0NH1Xi1DM?=
 =?us-ascii?Q?tdZphgyzi22ajL5IoOTnZKuyYDBXxMEqjywzWGtqX1y6DZO5yTexgY8zIR6S?=
 =?us-ascii?Q?y5kwmqLvgPrAW5Uporm4U6IcfZ/UxzdoBRiZCwgLTfRpI9oTccFTcFUZZKyu?=
 =?us-ascii?Q?3aAX9PmahvVzmztQZBbahXkYWBfT01opRTXYTFSuMKZNHaXNK6wDDNKs2bfB?=
 =?us-ascii?Q?p3xkUl8W8HslMEZY7txuFASiwh2e6Fp/KPPRMmSNtJyj1o1r70LNF4yLUdA3?=
 =?us-ascii?Q?8fLkMoTFKi+qgoCgvjFB5CyXOLib6gESNDtn8lWv17EQGt6Q7A8ojfqD9yzx?=
 =?us-ascii?Q?C/2V5IPLWRBfV0Ud2MMXea7CDKGf8++7LCfSqIuMxPeWymqKGwic5xrDpZSS?=
 =?us-ascii?Q?1BEvYT1RA0TI5BLERKUQ1c1kR4kyvCaRt/gNqzziUB3nR8r7a2NcOHPhgSbe?=
 =?us-ascii?Q?n5WCBQVjqKIEN0C8bHOy+3Z3CD2xyleCA1nOfTHmrpZnrFUBdbT1MG9AFi8q?=
 =?us-ascii?Q?LyPhSzuoqyCPQPE9Phdz7MaPHOrtvje1QIb2CPot0tjhZjvg/6oZWu/EN2gn?=
 =?us-ascii?Q?lREVI6kDyp7HGY7A4NACjjtfgU00Dkcq1CU/hVfoP6ynB2FLew5eGVw/b1FR?=
 =?us-ascii?Q?eUrrUV8jnV+M6VnICkkTNN+zUaFAdk7uI1NXKZL6VMUtO4hqSmlRtmWS/8fB?=
 =?us-ascii?Q?kuixy82JJT/K0A3Q1skYDk9P1yvGbRp63yun0HsDAt3vD/Gb7UmwmgeY/uM5?=
 =?us-ascii?Q?0DD+/+n5v9aemLsdy3AMfzqnEtF8wQYmZZ4FNKFIC0LaNPIfRHZFGyXOm4P8?=
 =?us-ascii?Q?LxMXoLUwyEbviqntcEYjJu/OvmR9QUCUGZ0SeCicuDSFyYyp8Uhs9X9el5pc?=
 =?us-ascii?Q?xYQi3HxmNmeS0d+T5M+zUVk/2H5hF+XkAM+eabWrRv2TpfUkJCUG+DlnwQXH?=
 =?us-ascii?Q?1syuWxYmuhxgJYiVm6jl103Py4C7ARQ5TYzIXEzfGj63NqEMGPGUs1mmsElM?=
 =?us-ascii?Q?z6gLbna6HCbcM11KZhOF6rst9gjgpIyzl/pJotw0DHhwcdOu6Sfi7qXyKj4z?=
 =?us-ascii?Q?lsh8hOJUVy087+AFdBHvbNf7OUB16yCpzJmSrqQCPpPG2orNrcjFhysX6A9s?=
 =?us-ascii?Q?foddeCPjiX2bveSoddoIENblEX3Q6TUqFwnpDKaJiaTk0/dIfm9BJb4fK8tZ?=
 =?us-ascii?Q?DZ+D/BTUEtcZDHt18JRO35nON8ypaCuQ3ZCh6RjbWGpL+A6X9WhR93ZY1/0V?=
 =?us-ascii?Q?K10ZPYLaoPzDdwNaalNMNk8AkA3eAEnPO56qRhoKCrOF+Uiw2+07bh/ONOxH?=
 =?us-ascii?Q?/aPirYWwNGYjJkeyTDvQ2OO057N1SmDEZ09Z9cbqYN3QUoKbOiRuC1lmbG9j?=
 =?us-ascii?Q?xbHpoh6MxcSWfsFz8rgcVu4lrwnTIXrUS+tXscg95LU/u7yK/riI6wotRDyh?=
 =?us-ascii?Q?/JKZj1RcNYbPNcuRMI/TNRRSBG55g4mKiSdyxdI5Pb+/M4c3siASkREnRmpJ?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 34852ccd-c9f7-4901-add6-08ddd0e91409
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 10:49:24.0708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcFkljf0g4pCviNjC9urxfrFxqe6Sg8KFw22utVS9HzN2Egwuz9uEe3684y/MdJU0QT4yF2BP7bU9L2iEizJ3tN5MUl7FR3IutxLRFjC1QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 10:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221229

Hi Khem,

On 7/24/25 8:32 PM, Khem Raj via lists.openembedded.org wrote:
> On Thu, Jul 24, 2025 at 10:10=E2=80=AFAM Quentin Schulz
> <quentin.schulz@cherry.de> wrote:
>>
>> Hi Khem
>>
>> On 7/24/25 7:06 PM, Khem Raj wrote:
>>> When crypto is not in tune features then add +nocryto to
>>> -mcpu explicitly. This makes the behavior between clang
>>> and gcc match. Currently -mcpu=3Dcortex-a72 has different
>>> behavior in clang and gcc in terms of what features are
>>> considered default. Clang enables different set of common
>>> features than gcc on other hand. For example clang
>>> enables crypto with default set but gcc
>>> does not, gcc recommends to disable unavailable extensions
>>> in -mcpu [1] explicitly. crypto is optional on cortex-a53
>>> and cortex-a72. This is not as common but Broadcom
>>> SOCs in raspberrypi3/4 have dropped crypto for cost
>>> reasons [2]. This results in illegal instruction
>>> traps [3] [4] when building components e.g. chromium,
>>> qtwebengine, weston etc. with clang using -mcpu=3Dcortex-a72
>>> for rpi4 target.
>>>
>>> Adding +nocrypto makes clang behave like gcc does today. We
>>> do have separate tune if crypto enabled cortex-a72 cores
>>> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
>>>
>>> They are added to default feature file since crypto extension
>>> is available in multiple arm architecture versions e.g. armv8,
>>> armv9. It is optional extension as per spec [5]
>>>
>>> Extensions can be enabled and disabled with -mcpu using the same
>>> syntax as with -march, and have same effect thats why it is
>>> intrumented via TUNE_CCARGS_MARCH_OPTS
>>>
>>
>> I believe this is incorrect. TUNE_CCARGS_MARCH_OPTS applies to -march,
>> not -mcpu.
>=20
> Well, it applied to both in cpu specific tune files ( e.g.
> tune-cortexa55.inc ) we override
> arch specific TUNE_FEATURES and replace with then CPU specific TUNE_FEATU=
RES
>   This results in  TUNE_CCARGS_MARCH being empty and TUNE_CCARGS_MARCH_OP=
TS
> are still valid and they can appended to TUNE_CCARGS
>=20
> in conf/machine/include/arm/arch-arm.inc we have
> TUNE_CCARGS .=3D "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS
> }"
>=20
> Due to include order this append appears after the TUNE_CCARGS is
> appended with -mcpu option in a mcpu tune file e.g. tune-cortexa55.inc
>=20
> TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', '
> -mcpu=3Dcortex-a55', '', d)}"
>=20
> so in the end we get -mcpu=3Dcortex-a55+nocrypto or
> -mcpu=3Dcortex-a55+crypto in this case
> if you were optimizing widely for an arch then the effect will be via
> TUNE_CCARGS_MARCH and
> TUNE_CCARGS_MARCH_OPTS
>=20

And there's no world where we could have both cortexa55 AND armv8-a in=20
TUNE_FEATURES? I assume this doesn't make sense? If it does, then we=20
could have -mcpu without the +crypto and -march with the +crypto, I=20
assume this could be an issue? I'm probably overthinking this though,=20
aren't I?

> I do wonder whether renaming both TUNE_CCARGS_MARCH and
> TUNE_CCARGS_MARCH_OPTS to something more generic could help lessen the
> confusion. It's there because we have -march and
> introduced -mcpu options later on.
>=20

It depends. If there are some scenario where we can have both -mcpu and=20
-march specified, then:
- if they can have different options (I doubt this is legal), then each=20
have their own _OPTS is desirable,
- if they cannot, then the options likely need to be repeated for both=20
mcpu and march

If we can have one or the other (mcpu/march), then renaming the variable=20
so its name is more generic would be nice indeed :)

Cheers,
Quentin

