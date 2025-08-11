Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AC5C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 13:08:16 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.50])
 by mx.groups.io with SMTP id smtpd.web11.47280.1754917688369205083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 06:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=FDLzTDj1;
 spf=pass (domain: cherry.de, ip: 52.101.69.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JClNKE45QQ6hh3tAajs7HQwWqF6fxDQwohJN+ZmDRs5FH86AQ34JLIGniQ9Zoujh55kztSdMHytKr356jqgibhnDva5/3k4s4OWUNuRKJktTjev5MzblFyAG6WTbLfULX16fO+x9xuO3xCl6AjJ/aM9e4rIvjW809GN6DovgxGXMljtM6hxrB5NtGfTAvTIfsSXmVTvaPJ89x9uAkNxHJXGOwuEYmF92EfkF1yAWUqyNAQATL4at9++yakZWNSIsjTZyrHuqBAjrpxBhkhmN/F7QsW/Se0M5nC4pgmaenM7lsULDFkVDOCIqVH/yaF4st7fE/in/AIh11NmMniYJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYE521wSDZmhFh1hDiDdo62O+OgStcJpc+VviJZ0uJU=;
 b=c8dLpbFeIwT3JvKDnjBjJhKlNd9parfIQuvRl54N4psyY167Hi6gL1fwoqo1jFtC7Q5XYtVJWpPTOPJCUMi9cgOMWFYjMmgY7gfHhZvzVKAyK1PKP8SPV4A91Dc0RqiQAQlBItd4+0Ufhb8XISa0yjDeTZ2BzeOytwGgofyOoH2xmt176+BNs37qUW8M3rXnC8M0hveFeMK6BN/P8+sU7YvpttkFOkSpNqy7gK6trDRIJvObC0lypxmuPk3CLoP7CPC5EPPxQyXxKBnk9/AcJznOdNIkFcKcJMsBP/XKIFslpVTSzUdW7089ory87dZOLSLZtxAXLyw8PyRBvnMb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYE521wSDZmhFh1hDiDdo62O+OgStcJpc+VviJZ0uJU=;
 b=FDLzTDj17KKfUooKi36zAuYd8F23k4+oyr0qrg/0epYziMeQfXKr6wey+M8kou8H/tlDOccaXLGck9wMw7/wehN5lzYq0YV0gEhBh7E9cIFScnueQ0XL1jZxZrx57FiLXGQDHsNeMU7/8zhxLGZOp6jxGN7coA+hFdAMlNXG9pM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Mon, 11 Aug
 2025 13:08:02 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 13:08:02 +0000
Message-ID: <b0fe3372-39b1-4d86-8333-02a6b5eb6828@cherry.de>
Date: Mon, 11 Aug 2025 15:08:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v4 3/9] mesa: move PROVIDES out of include
 file
To: ross.burton@arm.com, Quentin Schulz <foss+yocto@0leil.net>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
 <20250801-mesa-libclc-panfrost-v4-3-101c6dcf564f@cherry.de>
 <2028623D-6052-4893-80C7-17F7FE1AB92F@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <2028623D-6052-4893-80C7-17F7FE1AB92F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: c12c16e4-d62f-494a-6d38-08ddd8d81a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yxb6jnKoQvYwwJ6zrtj2MjX24mLhXBgTAyEJasAuVnTsI6iVftzsHpNAmXeA?=
 =?us-ascii?Q?s5ufP8o4aJXm3eyBPWAUyHv/RFWTbX4KKgmMx5XTabyoKXvjJJrchWkICt/M?=
 =?us-ascii?Q?dpVEPLPp9JwrV76gy9JP2tElfCaz36Sbzpjh+T8YTWnqmcv72V0QgY70V7z+?=
 =?us-ascii?Q?aRqA+fGu0R60VkNofY+lPpv+WFWuuvySIIjQODbCYtcXnGFUHk+eooAD8g9k?=
 =?us-ascii?Q?PAe29EByQKLTBDMXkEhCdsy0UIg9rxwRuwCm9CGxgUMqpeD/RJ9O1KZUeyQz?=
 =?us-ascii?Q?/HoVd3TdpsHr/9npX52wy4p5IsVGVg6bzbhRYuHfC+urCBwavBdw35mrMjGO?=
 =?us-ascii?Q?/BeGd8Aa5AtK1AzNiP0KNbgeKZhbFiF4h2kOchnd4inDFgqgYHlwkv9JF9A8?=
 =?us-ascii?Q?wnLGOZWCLpcIFmHJb9+gNua679aVOYhcy7GnmQmbhQdWizrgrd2spDaXByWv?=
 =?us-ascii?Q?psfiS4ti3MTbZ6uUurPluuGtKl1GqbXIp7BmhFB40jlKOyqs9cRA3pJxtqdA?=
 =?us-ascii?Q?8RsG6EtBN/0TGm6a3vVUIV6c12c/8JCJjAYIi3e/HvoB0Qm6F4vHh66MsAf0?=
 =?us-ascii?Q?LQVlP/yW7GPfh/DsJEGYaDB5lm5PNFZ0Eka1couizcIF/7kuTRymttBh2JX5?=
 =?us-ascii?Q?4eH6a4mqWmV+DE2NeIw/u38soEZsivUoza65Q6fc/pjSoJFs+ktkBVhCq9LF?=
 =?us-ascii?Q?wRFgKMLzy3tfKzFg5Gn/aFPdReMbilaUiGiBHKjG7Qa/hzSlZzpLLdRi7jrr?=
 =?us-ascii?Q?XI7YNA106G6twlHsHec5OorMQqUS0IxrHAgGsaN024on2/Qt+gZSliGRVFbo?=
 =?us-ascii?Q?4dN+imIT430EPwBjZvH7l5iSQCxOPRri3BEUKHl+NV/4I3VFgYM61ycojrh4?=
 =?us-ascii?Q?f29IGIfyyRnA5noi+BekwrONLcz5AZK2LCdebf8dNtNjy5BIj1H16+e8PGuA?=
 =?us-ascii?Q?0y5k7s8phZpfmEkuKLPQzdrRHKhQurk4bTek+q+w8m5zZ9p3KsVgekKGM1BD?=
 =?us-ascii?Q?rdXo57fDGu01cRJrhilIZlMK2aStONF5q69DUi3UwqNri895V0MOj+1muW8N?=
 =?us-ascii?Q?5Lf6KemRxdhxXYEhjezjohSBobOfvwFqLX9damY+PHoMz198uwszFP3f9L/r?=
 =?us-ascii?Q?d1EWkT10+9SGv9KOFHsxrcrRUj67/w5b+ruS5o5aOrZNBkEzvZehTZ2LPXWv?=
 =?us-ascii?Q?egTIbtOr6e7aSmky8lEW3nlJnQerzu6tT23NYXj/lIQ/SxRnlgMdOudRUROW?=
 =?us-ascii?Q?hVBLCo0fKxR2kTm+ijRefJ9ly0tCZcx7bVvEBhDOffW8bONg4WAck2b0fclS?=
 =?us-ascii?Q?PZRBNj2SethULS39O69PVOQdVBWyn1iC6LbwQY2IPGLET3yd0wESkhSN07Ho?=
 =?us-ascii?Q?004k9iNTfYSCq6LSkWPgJA7xkfdrcDUM/tQGZUFaqnx2UJgLYA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nZWKqID5zuuOhM0g17YUwFttqMe8GuIQj658JpSsThn3rt15tFrmRrpr1nob?=
 =?us-ascii?Q?SLd+kdMxzdbqfWsDqheoxvPSnnrsE+fplOQHfgruZ7zk1EmeOAK1ljSHVOqU?=
 =?us-ascii?Q?40/MrqpCWgCAy+MKjHeEWXIVxgn9lhkFB5Ru/I0EFcq7XaR2RIHmVHIp+Btw?=
 =?us-ascii?Q?oG15ya+sXR8EuMIsCVLCI4aYURMF1NJaJAT6h7tXf3y+tRj3Y/Y/kns2lX8c?=
 =?us-ascii?Q?+sP6tGJSRPe8IME0W+AtZFUK9TiA/lD/DXrJlgt9pLFkX7U+i6ahR2jcFMTN?=
 =?us-ascii?Q?FfxI6ac9783gjH/vI6e/axbdZ18krVO6hfHSfnmIJwwYbR60GZ0TTr8tmxf0?=
 =?us-ascii?Q?xDuYL3oCXZOtzTPOobNiBya047nT08ffU1F93dasulChxoiOTPu0T4o5aPNO?=
 =?us-ascii?Q?Kdv6saa7KYo+ISh9ip1WHwHlzSqelf94vsQl7MavH+BUxtZc2rhPwkUM6JLw?=
 =?us-ascii?Q?+h7i1dobqFO8C4WESLXVp2ve7+QIWEUZoVKQnZSr8xQVIaFd1fhgcqGc7l9F?=
 =?us-ascii?Q?XMoNKoSFYitXlydxr7bdhZleCngbnty8boUXYhvPZBMdOu5ICIBaj0jQBva+?=
 =?us-ascii?Q?XMOJYLm7scbTwkscWaCvWhoRuWZr8NfGO6vvXDh8gCD20An+Rvmnn/ku9uX7?=
 =?us-ascii?Q?jjt9W44NedMIcTEWqfRH33HsuQ4uACHv+39vX0SimShjLgqqhHnzh9Pnnlef?=
 =?us-ascii?Q?g8Nyi67Tj6a/KyU91j6By7k7YfZZLAkj37AQavsTL07nKZHtkMPSMRanIN/V?=
 =?us-ascii?Q?Lmy1fokTym2vjyL0l+QVmuhveznJsLvNPoiluVuIeluE+5lYiZj9sfAzfIb5?=
 =?us-ascii?Q?ACh3qjpRvZqPam1AImcPuTaA0GBBoV0ksoRqjolvfVISNR0vuZiXa+q+9rVD?=
 =?us-ascii?Q?SiOBQCtAksSCMYc6DTudYNvMq5CXt4UFpdfvE01bt2U7i36GifDClIbZ2JJy?=
 =?us-ascii?Q?gm9/10uCxaN8i0CzKnIOcWQi5CvVZiM9RNqr4PK94Wiy4muqWXch+/8+l/2z?=
 =?us-ascii?Q?TlowkTujer8nuxKWSMODIXkmDt58Go03pjjOMyvuLCpTPEaGeqVEqnZxxRaB?=
 =?us-ascii?Q?QElOnp8dc1XtM3uFbPly9woTGV6QvVn8lCmtL4rWgTexNqh4dSfoKXfffMtU?=
 =?us-ascii?Q?YIss0f84OftHTyEZ4uVcDmW9xkGab6hMwRJUP6eudEYKxGQ+9iqYE7Qj36+g?=
 =?us-ascii?Q?jES0TJRMHE2fgwGHNJc5RkKfmWd6pkp9S+z+p8oW0C3iEGI5yLi0xu05kJjb?=
 =?us-ascii?Q?jdQzpr7CqIa2wre7u1Q9/RzmWyIXaGcKPUjPd9Tnuo5/OPMSUsCuI8/RNFUY?=
 =?us-ascii?Q?dgxzcOcbWACBSDzmB1cKcL69n/cZzmD4dhuh3fzEPRKTzLS9B1+Z9y8T9/af?=
 =?us-ascii?Q?pL3n1DadEBGINvl0ht+tEmAiYunMQVfK0HyTRiheg4SU0CINDk7QwY4amnpc?=
 =?us-ascii?Q?es7Mv+rL5/4l32F7Tcv6gdXQkxv2s3t/PFOo6dfbFRvVvEMpd0pAAPx6pdAx?=
 =?us-ascii?Q?f0DN5yXfPkep4dBWvFVn1gWfZyRke37rkxrvsqn6iWxon1Oz706i2Eo551ej?=
 =?us-ascii?Q?9AW+uqDgG+4x5xCmJLI1CUADQbFGsn0qmsdLSjUHyUQB+zzIc0XyG4zU+DWZ?=
 =?us-ascii?Q?FjTo87QrtNxHTtfXIHDXmrEoLU+zY00AS0woSGzKKVgLlMTJJA5jAJ7uKms7?=
 =?us-ascii?Q?HXDW1Q=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c12c16e4-d62f-494a-6d38-08ddd8d81a60
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 13:08:02.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxhlOz18QJaess35OqueQ7FTcObWPIvy5VSo8cTgxP6PaYKdbJR7zL94poN/MLuRSqfbF3M6NZe+x+xV6iaqnr7TZpmvCY7QTlYUUn6k0ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 13:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221739

Hi Ross,

On 8/6/25 12:50 PM, Ross Burton via lists.openembedded.org wrote:
>=20
>=20
>> On 1 Aug 2025, at 12:03, Quentin Schulz <foss+yocto@0leil.net> wrote:
>>
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> There currently are two recipes including mesa.inc, mesa-gl and mesa.
>> The former overrides PROVIDES and the latter just inherits it from
>> mesa.inc.
>> Let's just move PROVIDES to where it makes sense the mesa recipe.
>>
>> No intended change in behavior.
>=20
> Doesn=E2=80=99t this remove the provides from mesa-gl?
>=20

No. The current mesa-gl recipe does:

"""
require mesa.inc
[...]
PROVIDES =3D "virtual/libgl virtual/mesa"
"""

so whatever PROVIDES is set to in mesa.inc is ignored anyway, as=20
explained (worded differently though) in the commit log. Do you have a=20
suggestion on how to rephrase to make this clearer to the reader?

Cheers,
Quentin

