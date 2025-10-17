Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403B5CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:35:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.web11.13071.1760700927181308143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=jZUUaZW8;
 spf=pass (domain: cherry.de, ip: 40.107.130.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XkX6hKBAaCXGYtFOV0sPD6QCY2jXrHqrsZpn8NzVu7T5l3B/8u7QSblj8lmxmXWDTEUcY0dYFfwUwaLgNaHKeFfAIo+/vLOYuk2X3wrcELvn4+Z4JtAm9ECbhqhrVl5G2Vgen/7TcAPWVGm24E0fz/kLJrkWR4r+B0pPHvxdmd+W6SdIl/hH0EEn485NQONwgccaVMB9hEqaeIrrxQqkuswfOIHzWGEYePhMug/jXMqvKgrZ0pBilo1tDEnerjjLKkoJmkX36MTb1ch4kvFPySXJ7LfZYYQit5PPRS1EhU3shxMXrAeWpoafFdssYVnpp/1gfAvfOS8AxvO36qQh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJI2RRhVOl9aWt9Q0npkE5jJrHEy0RdUiCXq8DmCiAk=;
 b=nAzPvH6qflj9bOszwAXIeWGKTftsR1or8WBHxtUaGwBPTGmN1dBoLLbv+hrz75Niy3g+JwcooOz9yur9NmpRqAljaVW1VmjLBvJwU1QYX4HnFQvDeZtlxbyVPF8ey+dB8q0iAYKNgMe9LZ87Vn5zW+tHZ8c5Mx72TsHtS04ib/pCCGxhDauLoGKktLPVStfLU/67OamLtiGVZnh7e9SgrpCFWeieqcQxrjQJENvVvqp3+ECk/EPEnwAucyjgsqpM7bReN0jjr4LnGEJgWeWN8Oj1qq9L2+7tajDXklPfcH5NVB00lj3yRx/9LHfXGRLjwZaZEFf//mmmX+3FWAyfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJI2RRhVOl9aWt9Q0npkE5jJrHEy0RdUiCXq8DmCiAk=;
 b=jZUUaZW8rra+V6KE7grcvvP1xamzSb4GbalsRSoF7Uw0ZbBuJ7xR5/zTUXigJKx47L9LRgQ0G36PcVGjIThnRjJPqj4Z141oKrLcdGQ/6IhETu5wRn53KzgzoqUSb5r6LX9oT/eVwmdYfTMGqwl7NLBuU64zCh+VFXo0RLNGfno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AMBPR04MB11812.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 11:35:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 11:35:23 +0000
Message-ID: <b369764c-8bdd-4a74-b168-3a33f7d53210@cherry.de>
Date: Fri, 17 Oct 2025 13:35:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: update 25.2.4 -> 25.2.5
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20251017104135.2635981-1-zboszor@gmail.com>
 <92173122-0c41-4739-b5e9-eb10e20b92b4@cherry.de>
 <06c5101b-634e-427a-8f41-593e3fe72f43@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <06c5101b-634e-427a-8f41-593e3fe72f43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AMBPR04MB11812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bae4f94-dba4-4718-155f-08de0d7142c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BiUvDPWl1woBqON5WHkxY7tkWjqB3LLLIy7GoQYcnQN593jtjVvF2WMpgrt1?=
 =?us-ascii?Q?zgYrIJTwLg8/HSu2Hr2M8GHNjoZzbGQxs7qSEFASki0R4ndGjpcFm2EXZbF1?=
 =?us-ascii?Q?JUwozoJkovIj8iUkuzkVU/L/LU3q1pYVvwfxD4d0xVgRbcPh2klfXRGZiIME?=
 =?us-ascii?Q?VGvdN6ehnQ3UfKQ/p9XK4S2B0WSSvfhfmPqn7qIacpDqQov4tCWbSCCezl0U?=
 =?us-ascii?Q?L2NmKxfH/uZR10sDsAxA2fPz494TbAOs5FsiMmNuPz++aNTZ26PD9TUkIlTc?=
 =?us-ascii?Q?1QaQUHx1D/OSYs265P8km84v4DnfTB19YiYUUwi+C1N2eN6AU0D8/A0plaHW?=
 =?us-ascii?Q?EbfhjKN0FEt+WYrFlchMSrFIVS4AmzfGYf4KmcVJwMzWingSUwcq7c+lxMSw?=
 =?us-ascii?Q?NXl2vXabuYydovVAdMkHJ+YFaCVkMo+tGtCXf5u7pH+Z64I8ywGPO149EBPo?=
 =?us-ascii?Q?QHIx4zzHZOm/DjAhJf1Bm7ZRr6+ITP9QgO6hUsR0HpcG8aGNaJ+0P/SW0fk5?=
 =?us-ascii?Q?3x+9YuPuSUuUtlAQvoh5y/mfIAm3f+9OxWO8nbZrf8+VS5TK/dAVrcFsBsN5?=
 =?us-ascii?Q?l0AeS3DSdfDo2bPFWGep4X8LzuX1LKzVWSUVuplwoKqdJnBplc6THcynJXA7?=
 =?us-ascii?Q?+2BJ/gjejVk2TZi8NN8JpMqzTBYds4/84dAUF0nunTEijwiP5qn8a5PJ6VK6?=
 =?us-ascii?Q?jbC+C2Ii0eK/TnHejjqp/zbiMU5pBuMbGXLwJJmA3Uq/ub46Jppj7D2hkYWw?=
 =?us-ascii?Q?dq7MhC7VY5fQ1qf5M12PFIYxuvp03EB9rnVA0uDTTcji9HYb6hvP0fcnc49v?=
 =?us-ascii?Q?3fpXUfjT7IBb67OJA/nv2gP06iDAgUhcZ4wNVXB1L36gbdgjlESSo2K1cT0w?=
 =?us-ascii?Q?ZiM7LfeNjzHG78raddGycIzjvgnplpIv0HW3LwQXr9CmHZ74OZ6d3oiPjFMG?=
 =?us-ascii?Q?Wi/QjxPcgID+Om+27xl5B9Veuj/A8goz9JsVWGDSRHiS8OjQ9QzTH0XC1BV1?=
 =?us-ascii?Q?amVtxPrN1rqYsqmKszNYMK/ypFLWPAll6kRmN/WS0AGOzBOo001JmQY3Pp7V?=
 =?us-ascii?Q?3UeP7iLSgK+HUaFK0JDIwP2yHgSQ7hYstHBOPOOSya95i3toIdM2N+heh3Yc?=
 =?us-ascii?Q?Bf6IZOzqJgseA+EmYgoyTopIrpet1phAdVIiD0ZCdZVThfk9aMd6oOvPNtXE?=
 =?us-ascii?Q?Ve9zfI477fE9DIIjohJy2WkX5pLVOTXEIkAg/ouCFBYEgtEkjT86pnOYoqi4?=
 =?us-ascii?Q?2Nl0XqdfLtRBDrTex/sPRSAkyb5FEQhxJ/6F8TLOmpaoKMFD78GBXpmqAprC?=
 =?us-ascii?Q?OVheU+pgP/b6AKXs5ONBTepEYprjicnWwQitlJ/RCJxiJ0RBGD01o6Sk2elR?=
 =?us-ascii?Q?dCdWP/KAXnDS9YS8fxDXL5kALiw9hZTynZafMRUeUS0B5ke1CQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gFuTzpXyvSjexK8TfLx2QgpAGrH8XtaupmUKEW47fMwbovimvV+sTFo0hBtE?=
 =?us-ascii?Q?CZhooioe+uZDxA+3riuz4S+/11xBxCA3WHvW7XtJHbqTgCpn90sztfel8MxL?=
 =?us-ascii?Q?4KBZnby/Vunh9VVgeUyxJDioL0ZaoTUxEid1++ncNNkXeSVdx62eUvSt8EGd?=
 =?us-ascii?Q?TVQajYslnE8Ch5yC8ngnIsZaRc/PFZ0azP4cCzMc8U9Gplg2LwY+z0IqFpM5?=
 =?us-ascii?Q?rMspga9vwrfJzv3V4FVjM1Y5um7po8KPZJ+jNNxsmvbRIrQQJvhEz95NMdxV?=
 =?us-ascii?Q?npM8OJtwQtXpIhWlc3W0SyTcjnkWMrqsj32u8+A3Ji9EUYnBntwfOgAhh2eq?=
 =?us-ascii?Q?0RhIqq8bZv0DqzAjyszxzA+6CR2uEq/qu43QSKhaYLGbXVMhQlwMbu1IUmu2?=
 =?us-ascii?Q?mLsk7kbNnMqYz9k/97TxXD41rPMCJVlnQkRHoq+UYYwZ5ktpwMhGWexFsi+S?=
 =?us-ascii?Q?/yxkzzSuVKn9zljl16XrwZKZiqY2BfnwSQ8P3qsMe1IlZj42JnNUkUNwev7P?=
 =?us-ascii?Q?UMpcoumr+2Z/+EiUzQg9Gzhnh4CtA9SqIFOiKswWM+VQmio8tATZ03WkfQ59?=
 =?us-ascii?Q?MMNMoT57wFOJLVSNORTaoVE4iFe1vXe0avgBZaMmlNfk8acPVmHCfNGbKwbx?=
 =?us-ascii?Q?RWNjOiLTfULcnD9XbtCWC+TILaktmwQ1YQ95fXk0SELGAkanMsYcUuggJd3W?=
 =?us-ascii?Q?3wjrMR1bcz/O8nxZXY2B14UtgPIFDgHj7ItxzZ1fheQqHXNYNk7YJNGwlADV?=
 =?us-ascii?Q?xaVxrbn0R69lP9L/FrOyyxs7DSorXL5SJqj4qGRVvdNVt4CwU4ziYKluT9Sq?=
 =?us-ascii?Q?mCanvAQXCl3JsSWibToEI8x+3KC2oypf97L+uxTTWrbyXI/JwHYjhmHB7O7r?=
 =?us-ascii?Q?yyh4ojrvYI+XPQOC1xgqSj/tNNf3h8LkV/y0orVJnw+ZE/0LHG8XuxMmunny?=
 =?us-ascii?Q?CcupaWwG/1nFQqbmkQ/7wZJ+3aCTGAZu9drsPgyR0JgflUy4vATNeDrwyWpT?=
 =?us-ascii?Q?WiqdqJUrpAwBhWkmklAF50MjhkLuhi4l8OpU8trzZmMvynCBVX11kJgY6KBw?=
 =?us-ascii?Q?niA9SEEIAK3ZtvA+hEoFMp7Qw9FysycDqKqeSwM4vNLV2vWayu7iuPiP6IpW?=
 =?us-ascii?Q?OumXnVqTpbN9KLjB7zLmH76Z5+4L5j0r0K7Q5ewKmYic6Q022LYibItm7eFS?=
 =?us-ascii?Q?qLu9V91fVIuSirfbCVvhuDAvZ/XWTLkvQKWsECBeZ1zzuSVJRzk+67N4jEl9?=
 =?us-ascii?Q?kNvld30Cvi0hgT11WjbcYEdsDHv/a2ZQpCP+wwxoguTkNCh9+TyfBao/K35O?=
 =?us-ascii?Q?7bBKomeFpNcj5HRfXghs0HJoiEKXM127JRPtfm6DB2TZScPkIVIqjJBfzAlw?=
 =?us-ascii?Q?WrdbgGB3HBmBBSHU6JZ19VIF05zSNA4gvdRuyLuXfS0lg5T85oMKCDZG+ULb?=
 =?us-ascii?Q?eYF6WWK+mXW1XENMHwcPAbdLAwLl3wEgZ+reF7OW/0DZZq9i7s05G/+bj3IW?=
 =?us-ascii?Q?LOrSo4Hoj7WQnDxJ5a4HV/3uDpwfM2me5qYOLXkDCQz3gVXWsfSSpUY0UX3z?=
 =?us-ascii?Q?6LKSnB7GdkB3jyqALKYomJ+3d95kMinFPvlvam4wWpQE2BPn/ajmfbgrjC/L?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bae4f94-dba4-4718-155f-08de0d7142c9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 11:35:23.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPtVVcA4Fj61O5/DH7M3DxsLFdf9rRCmEMYXcvQYJMsLYxN75MzXo1fwIp4M4bFlfFOMgL0eHU2FIM4Mci3qWpeXyHX+QklcvO2e5sWJ6o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225011

On 10/17/25 1:29 PM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> 2025. 10. 17. 13:23 keltez=C3=A9ssel, Quentin Schulz =C3=ADrta:
>> Hi Zoltan,
>>
>> On 10/17/25 12:41 PM, Zoltan Boszormenyi via lists.openembedded.org=20
>> wrote:
>>> Announcement:
>>> https://eur02.safelinks.protection.outlook.com/?=20
>>> url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Farchives%2Fmesa-dev%2F2025-=
=20
>>> October%2F226555.html&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7C12e=
61f44640e499b0b8108de0d706a86%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C=
638962973625884261%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw=
LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&s=
data=3D0AOfTJ37rZA2Z4Tj%2FwohsC2FY0BYIDFIP4t9axfUmv0%3D&reserved=3D0
>>>
>>> Remove 0001-glx-provide-glx.pc.patch because it's merged into
>>> this release.
>>>
>>
>> Thanks for the patch, see https://=20
>> eur02.safelinks.protection.outlook.com/?=20
>> url=3Dhttps%3A%2F%2Flore.kernel.org%2Fopenembedded-core%2F20251016-=20
>> mesa-25-2-5-=20
>> v1-1-08035df5e74e%40cherry.de%2F&data=3D05%7C02%7Cquentin.schulz%40cherr=
y.de%7C12e61f44640e499b0b8108de0d706a86%7C5e0e1b5221b54e7b83bb514ec460677e%=
7C0%7C0%7C638962973625915749%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%=
7C%7C%7C&sdata=3D%2FN55onCLHuK4xPYWVf7lyyftzf8eotRcY4cpJ8OnqZo%3D&reserved=
=3D0 which I sent yesterday :)
>>
>> Considering it's the same patch, maybe you can give your Reviewed-by/=20
>> Tested-by there?
>=20
> Done.
>=20
>> I've been told this will probably not make the cut to Yocto 5.3 but=20
>> it'll probably end up being backported (though it remains to be seen=20
>> whether I/someone needs to explicitly ask for it).
>=20
> Pity. Some people use meta-intel and there are
> crucial fixes for Intel GPUs in the new version.

Yes. Someone can port it to meta-intel in the meanwhile so that=20
everybody benefits from it until it gets merged in oe-core.

Cheers,
Quentin

