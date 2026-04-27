Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C772FFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:45:31 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42164.1777286723038205988
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ckea/g+/;
 spf=pass (domain: cherry.de, ip: 40.107.130.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZwC6uIfrye28fXqtGWtXULuIL0Pfk1IkwMQJbqEMPFL6WXzisowQxFX2JVJWvubCFd2Hiuqz5I7RXoY6cfCqEMY8V4/IP2o0971wsUC5JruuCdDMIBPUyFZDOrrP+y/v6uVZ4RIfjpawo7kWi/USCNMd7g/MHZQk8/rvd8H4TZPAM0Eeh71JN8oHJDot3seq9PM6ireZTs4LzPl+k53N49N/7UsoGFw0at5WtKDDI0KupA0pUnH6I+XyvcSSee6iM2BBnHVb4qRxOh3mr4VSEVCgntWJC7WIzeEr5kIx+YPALR0PFzNl8yIuZY5tnO7PTK+R4a7Zzee4ZDO5GuxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeGUVJqjxTTaHaLe03gxAPOKiSCQo+JPLR/sfCrN5zA=;
 b=u9TnE9LuwB5a/J1i4Q8JpOaZNZgMYPXzwQffO1LvnvY6nhKdFrPdOSgHuNUtMpz0ClgwPxgnmAC52jJ48iYrMX1oxUdp15BbK2V27TyPKEpzr1Xoh4oQDY5MhNyu1BKYICv+y1r9BFZ+hUTng5tJOiMtfQdvSDBXTc/CaWG7niFXApssWyjbNF5JIwQFhOF/RIsnBZPATSMTZvi81Rq119aOYefuHkqMqEa7BJL0JNwy8Xb5hqg/VHJUy/CpO4uN6aeIEk/DA479ZF+5z2AgY3l/FtGfgOdG4sgnBWTQUKsKBCHWkRZPt5pggAr6sxCHmeSpntfWiDYZg4b/Enl/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeGUVJqjxTTaHaLe03gxAPOKiSCQo+JPLR/sfCrN5zA=;
 b=ckea/g+/guEhCr3OHgt+A3mP2uPNtJ19hDDWdH2/twZ2oJBx3zZkppXShqTHf2LRHazWvgCbulfeokpWwvHYK0YaHCJ/CIxRUrJiRHANOS0EiGigNa0f6UMHu+ynvvX/2ffBlMh18nALspEfuLJsaDG2UR11stMN+2apD8pVuJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 10:45:18 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.20.9846.016; Mon, 27 Apr 2026
 10:45:18 +0000
Message-ID: <f3192818-b214-4733-82e7-4799de9f2bc6@cherry.de>
Date: Mon, 27 Apr 2026 12:45:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: simplify conditional operations with
 bb.utils.filter
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 openembedded-core@lists.openembedded.org
CC: thomas.petazzoni@bootlin.com
References: <20260424151718.13081-1-joaomarcos.costa@bootlin.com>
 <f038565f-4a53-426b-990f-d41e9d1e3732@cherry.de>
 <d34abdf5-0ea6-4aae-a334-14f85e12449c@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d34abdf5-0ea6-4aae-a334-14f85e12449c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VE1PR03CA0018.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::30) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b14cd9f-6c06-4de1-d7ac-08dea44a1291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	4TjzOnVGaCKeCPZuNDdtEq4OCHD1j1fShUHVfEuq0eNVpgDWlgjVsxeeiOyJsqvUW9kHnsUkGjLAEzPu9hSPTg7ogFB17PXWvJ6FbZUSBavT9A+Js7mY9DI3WIn6vMgq1uzT5sgTkdUGzh8RZoA6o4GW6VpAxzg7uBTz4WsaZz5Wl1+za8HkeeKehR1Wql+7Ot3q+ENPCKml6Q2bmgBvQZyheX2/Z0XzwQ5S5r+cVREFRVM/EY3aR4fkEYBK7kX1eh4YO+Ko0DiXdXW485tSKvkHqJeWjNlrkym9a2y8uyUA9TVk5I06XSTVyeU57kA7tUTG5tsfi9mc0grYl7CkaNxW69PpZCjHWgOpMbEVxbwvaPHOYT/06w5cxxEL5kMvdRa6fXOAXLGhUArA/uA6Z4SLGNuSfPVnk+6vUHl/Rg+NEB9n6JbK/++BnAWel0rlGiOIN+FsWRJ07qptYg+i0SRzKDkZP9NgWEUKCyY2+I3aosnHwca/7kE76+IlCfTCr+1xX9w4DJZ10gTJKNulx3j2asy/RigJCX49UxgeHCk+I0pw1Y9agdN37V+XjCQEIm0xiICFyXpKk4dmor3Z1JXt8EoIkvD9/+3vsJmZXq1MvfHX1K4hzA/2nI0ZEEaIT4jAQiSYv8fe9IerU+2LNN/+wuo4NuhlmnIef2eth6IViRtehr0i3JAkI8dBewvIPUvIztnZ8aeU5saNb0Ru9KlQtsow9AE6jzt3wHblgLo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W4Fyb3gZzRKtQMBpQRBMaJr2+3UogLC/jgHxEGpGD1XZ6VpfkbE2eaY89Zyz?=
 =?us-ascii?Q?02OkDEy9ZTK0wTRKtCaIKb9Teomww/3wrljlKO1xlyTegO+ox8tgZ1gOdjpU?=
 =?us-ascii?Q?avMSW1L4+jU1IYrlwES8neGgRxmaOMBvXP00H7yMjXo+eAegNg8NHEuxe07w?=
 =?us-ascii?Q?PlFaB04K12C9/Mf/0YlT2sd0TD5Z8lxWG8k1zZmL+PPPn3p8cYcTGqHGr9+e?=
 =?us-ascii?Q?EOsvWdUZ6QKPVhe3z1zhyA+0OZz45D5dLF5j5UPZ5GolgUIh5nYgKYsb7smV?=
 =?us-ascii?Q?C5108rX9tIfqA/S22MC3aEx0Og99W8okymP8JkfI/11z3VszuvIM9lJVoufg?=
 =?us-ascii?Q?7RcDKwONWjJxEUFkV3N+bd/jYAJ2muY9rp8yWTf8BeaYHnL8zQnjKy9mOZZe?=
 =?us-ascii?Q?GKxiUXtfigPq2d+JR0RQm4m7QbVbB6mCi9LtbhqWmdYTLZQLEloRA647k0Zy?=
 =?us-ascii?Q?cXGv03uyF36T3ZGQw4XM1jcHczvUlQVwBJsFBU864Leek6nrUYBSbH0+OZm7?=
 =?us-ascii?Q?Je1trzY0ZYfML6dB6ZcrnBXTM1w6wf5skZkfE89iAkwgaCcu51R+y64KyWmD?=
 =?us-ascii?Q?1EWabStOxEV4n+wP3TMVFpfP0NHZPO2OR7HdPRgWC+zdFAbDxKcMt4ExSSlc?=
 =?us-ascii?Q?l9+z4ELiU/T3ggeNmYGYNNIuI2VquywuiqlRLlkverGHpjz0ecevvlytFB17?=
 =?us-ascii?Q?OHbcA+KLJqJmzq4jQ4Vpe3nY9dhQD/TkUghhD4h1GskOE2z0Mza6vFuexs54?=
 =?us-ascii?Q?N3UAsQh7CZRrjye2ltNqr+2d27eZywhVLYHXoWZOEHeilmI/DJ8U4O6vPh/X?=
 =?us-ascii?Q?mUoY8SxV1LP3gECauTbrT03UUYWLbU12aorUIVD24Z234VjebThJV7UdMg99?=
 =?us-ascii?Q?y7nQwSDZ7U/mAtcAgVekWUmvrVx/aHLLNm3Q3yX2ltD2EeKsSzi11wh0OwH5?=
 =?us-ascii?Q?m3ZUHWUCBQ9H03MNpov8zStnl9U9pnPtil8NwIi+oQvtZmW0OyWyVFFnGdui?=
 =?us-ascii?Q?YeQ4IoY0xAz5yMpVBCA18gmSzwxnkcyS8eP7x4KcyyjOgho67aRfJiVjZxtd?=
 =?us-ascii?Q?nL+sSfrQfhR8+HKsxoAHZOB9v8/gifybQGFCmfHZtEj8OGaQJePVx3tyy03v?=
 =?us-ascii?Q?VgDEmPZP8wUenzsox6X/d/yDjkKXxlj17NspofydD+oDFmYiUBPs12f7d+MV?=
 =?us-ascii?Q?6l7VHK2ncmJliPpcJmC3JTZc3UkNHNl33U4OtJ1KY4r7RoFEd+U+Dc/SKB95?=
 =?us-ascii?Q?oeXtIgp4/JQJQoUQSlvd303n5C0F2HEF63WGtPy5XxqY47asbFfcWYe3opSQ?=
 =?us-ascii?Q?YaYlakuG9UaGkFnmm9AvyzYkrMls4yaB5RrHMGqVoZUkB5bndihyIMSpAwfT?=
 =?us-ascii?Q?1DXCUQswGYAlSXhSgSBc/pqgTFgR9+kp5/vPMYnzKdWKqA+aoUdAsUTbBpVD?=
 =?us-ascii?Q?Zl3eQpnqnz2SkxgNbgz/3Jqrqs1xEY+T72sRUQaAj/to91Cc0R+M3taXzIlO?=
 =?us-ascii?Q?z4pCP6scBoXfaIzAISCE5vOP9qQmWTi1GlFh+3RrbCUKzbrLl4EKLX9SPR2j?=
 =?us-ascii?Q?XPhV5JZx9VkhRnRvnJeBEj5D1c2ILLSLNUB/XIsO0GRLo5iDresXcRzoEgeE?=
 =?us-ascii?Q?CFZXCcstVt9RhJ6Qfa4VwKeuNgvEUBiQQ/3FuGHR3Nl9+S+pepxEYI6iHUcr?=
 =?us-ascii?Q?BdotKQym8vUGMOtBElVlUxW1tfIFFJUBV/ZhNycG8U0FaEqg3QUHUz149YMm?=
 =?us-ascii?Q?nM2+sfOSbqZaUhwV6XzGo+n57HLIn5xlepHR54VRTiLjniCys2yu?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b14cd9f-6c06-4de1-d7ac-08dea44a1291
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 10:45:18.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sV8quPbNEQ0gizRNL3d8biBrPcEtz9VZIEcB2HBN21b+NnRwu8bVn081SgabE7/dRvqsApO8mLVXHbn7UbrZpOMdHlcqPwkOgZrXU3TMGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236004

Hi Jo=C3=A3o,

On 4/27/26 10:38 AM, Joao Marcos Costa wrote:
> Hello, Quentin
>=20
> On 4/24/26 17:40, Quentin Schulz via lists.openembedded.org wrote:
>> Hi Jo=C3=A3o,
>>
>> On 4/24/26 5:17 PM, Joao Marcos Costa via lists.openembedded.org wrote:
>>> Some recipes and configuration files use bb.utils.contains to check for
>>> a string inside a variable, and return the exact same string if true.
>>>
>>> This can be simplified by a call to bb.utils.filter, since the result i=
s
>>> the same, and the inline is shorter.
>>>
>>> Replace "bb.utils.contains(A, 'a', 'a', '', d)" by=20
>>> "bb.utils.filter(A, 'a', d)".
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>>> ---
>=20
> (...)
>=20
>> I'm pretty sure your changes in the conf files won't work, but maybe=20
>> I'm wrong?
>>
>> Before, we only added a space if there was a new tune to add. Now,=20
>> it's always added.
>>
>> Considering TUNE_CCARGS_MFPU can now possibly contain only spaces, the=20
>> check if TUNE_CCARGS_MFPU is not the empty string to access the last=20
>> element in the list returned by split(), which will now be the empty=20
>> list, will raise an IndexError exception.
>>
>> You need to adapt anything that's using this variable to check if it=20
>> only contains spaces or at least remove spurious ones, possibly with=20
>> str.strip() for example. Unfortunately, if TUNE_CCARGS_MFPU doesn't=20
>> exist, d.getVar() will return None and you cannot strip() on None. Of=20
>> course, considering TUNE_CCARGS_MFPU is declared just above in the=20
>> file, it'll always be defined, so maybe that's fine to not check for=20
>> None.
>>
>> If the space didn't matter, we probably would have used +=3D instead=20
>> of .=3D, so I'm wary of this change (the rest looks fine).
>>
>> Cheers,
>> Quentin
>=20
> Thanks for your review. And yes, I'm looking at this part of the patch=20
> again, and I'm considering two things:
>=20
> a) Add the strip() as you said, here, and keep my changes:
>=20
> -TUNE_CCARGS=C2=A0 .=3D "${@ (' -mfpu=3D%s' %=20
> d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if=20
> (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
> +TUNE_CCARGS=C2=A0 .=3D "${@ (' -mfpu=3D%s' %=20
> d.getVar('TUNE_CCARGS_MFPU').split()[-1]) if=20
> (d.getVar('TUNE_CCARGS_MFPU').strip() !=3D '') else ''}"
>  =C2=A0# The following deals with both vfpv3-d16 and vfpv4-d16
> -ARMPKGSFX_FPU =3D "${@ ('-%s'=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %=20
> d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('-d16', 'd16')) if=20
> (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
> +ARMPKGSFX_FPU =3D "${@ ('-%s'=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %=20
> d.getVar('TUNE_CCARGS_MFPU').split()[-1].replace('-d16', 'd16')) if=20
> (d.getVar('TUNE_CCARGS_MFPU').strip() !=3D '') else ''}"
>=20

Yet another option is to do

(d.getVar('TUNE_CCARGS_MFPU') or '').strip() !=3D ''

but it's a bit eww :)

> b) Simply remove those changes, then send another patch keeping only the=
=20
> changes in recipes.
>=20

Yeah that works too. It's the same change but the implications are=20
different. So maybe three patches (one for machihes, one for QA, one for=20
recipes (maybe even in two, one for PACKAGECONFIG, one for RDEPENDS=20
since Chen Qi doesn't seem to like the latter too much :) ) so everybody=20
can bikeshed as much as they want on one and still have the rest merged :)

Cheers,
Quentin

