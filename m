Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223BCCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 11:56:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.54])
 by mx.groups.io with SMTP id smtpd.web11.7021.1761134192100166106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 04:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=nglHnthN;
 spf=pass (domain: cherry.de, ip: 52.101.69.54, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoU2yRxGoqJIriDZj5ySXBsIRw3UTh1i1h7uXmIRgSxuf37ERV5t7iz3PQsBFuE/atnuz6va09wywMs4EqRBG/Mn1rx7T1TbZIh3g0D75ydbuAqNmPQlusOqfpVEXF5zUPheyVhzGVF3ihydT2dahay+823OIjDcFfLsw1dhWEnO/2NwDDcHlE30m01wUA1tBrGO8YXhqJUc5L+EZO8vUXyDGmADlAFvanE0NHBdu1jN14kDoO28wdz9h6b0dkGib0zAjoMZcBlD++gnbMx6WkF35ukBrEc/GTNNkRhfB8lzlUUqSKz1r1+2QuhAiDeXzKUYLj/77wLoNKQb0H7+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WShCoSi7vUj13NBR7aX7+aY1lPjAz2SWs8LIGaGO4/c=;
 b=bAQaMQ9REW/GtoTEFXvOScBIe5rLgAdDQ+a39MEzo8GxBs+wKZsq7t1ufLLKdqDWA+IVtQi0ML8nU2xilaeJxF8wc2pAlYedX51BZtjllxMx5FPuCTb9/cXUJwi0HvmQ+hnqz/En/YsqbGTW3G9AJRWfoOUJ5tMSzfZWBhIdILTM1DXgHyd2JWjI149aT60tZEpTcXp93Zl0LrUmfpT2MChEz6R69qwC0mNlRTMARFf9Q/z/JX12LooQFRONIa4E9ebzOAJ7it2J0kwi1wELFdbT3s6C2Taf7U7pdEctY97DVpV8vtinP/BL+3419T2eNU52Jgjaslf8E2H+MtuHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WShCoSi7vUj13NBR7aX7+aY1lPjAz2SWs8LIGaGO4/c=;
 b=nglHnthNSgroqOZC6iDEKTk56xW8C5uY+bgtINrPmdA1TZF7E54pP3F0IId3viC0Ffa0JaZSvqsfQ5bWvjuUwxHqRKuyZztWomqBG4YDc+RrIVRZSf5+1c9WgK0ZLYuaA8Pb3NJFtS1BwQuntp1EflXBtU4/OjgY3GiyNP9icxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8581.eurprd04.prod.outlook.com (2603:10a6:10:2d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 11:56:28 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 11:56:28 +0000
Message-ID: <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de>
Date: Wed, 22 Oct 2025 13:56:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
CC: Alexander Kanavin <alex@linutronix.de>
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251022113212.3220395-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: a5322b8e-d51b-4cc8-b9e5-08de1162085e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RvW+nM7u0zv3RZjAGySQaJ8B+Q0DbGdg8fg1lrMGnnPQC+bcZYJYlB0olHOL?=
 =?us-ascii?Q?H0OMPQf5AOr0yu4L8G/vTsSC8FbVmcfokpldI/9Q9LFovQm2C69qR2QQDCKI?=
 =?us-ascii?Q?qIfDTicXZyLYzugBxyZ7Vi/5b0cWR5PqX/roQw5m03fp3TpGVxnIQEDROIV8?=
 =?us-ascii?Q?guEDWC69V6GNNWgVQBjJUYAMYgRkBSTVy/Aiy05DiaQsO3hwHIGiyAxWVDZj?=
 =?us-ascii?Q?78/YReXWY2mt338wTkYWt5Ftjg+GxJ2rnhnW9MJE/xpbwUMaAerwhaLTGh88?=
 =?us-ascii?Q?VvMB0LDkty0hwgdNg6SRfUWVv+XtZ3hxw8CL2lIOyhSxrmJQMBvyQG1B8DKt?=
 =?us-ascii?Q?p5BkF7e9YPQvfYSZsXajOfzkadtCrfiNVrfXJUdJRtrjeF95F5jdNIPTNm1P?=
 =?us-ascii?Q?5yXBM4a3qL5gkrdbg5fuHvElDLBC22LXON/YAAhM9EXdMJ2b8jOCiet1jCFr?=
 =?us-ascii?Q?Ki+9KKPBv2elu89bD3i9WXn7JX47DuD3oaqnVB2KRT/GYhUcuzGCn3rEajHP?=
 =?us-ascii?Q?N7Hj1CsrcWd8gGz1BTO5QR6rEksvbgMnC40Qc6QemVAK348V2XsSe0b/Diqw?=
 =?us-ascii?Q?zbBsxclpb9OlPiosLYTDrJ/AbAyws9Isn4rg/prRJUVwx39PN1WgZ2XXRQRe?=
 =?us-ascii?Q?YXSQDMK0Pc1rBhzu1hZUk4xZIiVzSnyF6+QeylidN+DISjhR9oM7iluMEyNO?=
 =?us-ascii?Q?kZeduh+pt36wsY/zDHoNefXK8Bh103Hzf2yh5LL/Ef0+EaIgaMhABGlWX4eX?=
 =?us-ascii?Q?755v8zOrgR+unKsq5b54+Mw4Hl+jCy3tmvshS32wtlAtFsVhHtS+OfqNvHpr?=
 =?us-ascii?Q?G2DCabCBTiadA7zF0iUiv0UEU59vfArcKEqNhIcs+6DObflN172mfmMnjd7F?=
 =?us-ascii?Q?/cZBZtSR63Qv1iAcIJrvL5A9pu7sOTX1PInfMMpYQ+uJHKHc5fxyEXO/VswD?=
 =?us-ascii?Q?RRRqawew7gT1eZVcL1vBHvAjYhxsmFV35J5pAw2g2xu6EjSZ9Ykc9AC92VB8?=
 =?us-ascii?Q?cvFuj399FnnL9fxfgOEL9d91e4jYNSM+wKzwbV5K54fnwSb5NcTEHnBV/ac3?=
 =?us-ascii?Q?54OsvENKuNB3Cy5BcAZNa1hlrMB4PiYgQDRpsl7Fcxy7iS1jPbpJfozfza8y?=
 =?us-ascii?Q?Ib9fL72FjEfl+JXtoKS3BGBQpGVj0H46oQlRbj/v4kA6urticdDk0mRgph4L?=
 =?us-ascii?Q?C2WPmkbZm8WDYD5FkSDpMgJSGPhTwrr4qOvdxvwifeKnSPT+7XuHWTofs8UU?=
 =?us-ascii?Q?6UseRK/0mGdjz29kSCKuYOtuZ8Mi0S6VUCa9UBi8lPfrFPq0M/TutjnaIXCq?=
 =?us-ascii?Q?Zg/O9kWVdvx3YFXGIkPvV3hiq5fQwh9gOJUqJQG5WT+O1g5MPzKnsVZuZuqo?=
 =?us-ascii?Q?Vsh//k8pa8DbKCktNi/sYSG/8QGyF/n+l3jNkyIfjIr3OljB0g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/FCDguK4iF3TSt9eA1cUse7M0NnZdZj4yewOouSZOI9S0efOy9HKYXcmTaZG?=
 =?us-ascii?Q?dRjT//PX9lXEdYEOD83mV29Q23XPMSJKanJg0AGLCMpZKDNozQfn2ANM6EAM?=
 =?us-ascii?Q?YCK0fUazfAW8gaZQ41ZJh3n2kidOCHsS5AUKtssyRJB52cc28k6pWLNJjUG4?=
 =?us-ascii?Q?9fD6a9z0eVfSWQ89XE/w8gob0odTsgmsGWgH/eOpM5vCOwQWWRfRi/jxI+qX?=
 =?us-ascii?Q?Mjp0opd74emhRmD0iwzjIxAAIZxfU1EBCaCPhsk9HWtDF743XSOPV4s8oD9Q?=
 =?us-ascii?Q?oYknQoXRKrmbNAadslugEUBLWyh2eigFAKG3hmCBZcURloAApDqeEz/Gk7UK?=
 =?us-ascii?Q?GDfldKWXys94W9HnEskAg/XKMHikwRQKLkFzoIgG7Je6JbaLa2bCO/J6pW9B?=
 =?us-ascii?Q?sbKek5IvOvQB9Jpf8ahmVW3QHRfIVGCGVwneIgJ0Ysd0XFsLofjhR4If2gEn?=
 =?us-ascii?Q?8yZ/KYZ0o+chLtuFcez6Pt0E1KWUN13TFzklbqusia4zZ8bnIhmNMUKaSR0Q?=
 =?us-ascii?Q?MXv+ucOnS922DBj+7YFg6KkXmEd6c7pLNNX0T9URvB7ooS/2n75xn08By60q?=
 =?us-ascii?Q?/nISbck/6nrZrmDAPrmH3BLnyZhQu/j1aFu9IJbwxcmZiD8vQxq4xNR5+klc?=
 =?us-ascii?Q?d3PXzyXBJf8WG3WwVgL7dCD0zn2teZfzeWZiUA3yb/1u7GQ/dlCgQI2vKbkc?=
 =?us-ascii?Q?2Hybx4S6sVUK3m9yNVATQ9HZJhd6tWtiKwhdmK0A2zxBmTdXin6iKmg6q66v?=
 =?us-ascii?Q?Yu2R78Qn7DQPEeBsg6BeR8aCAzyqoJ8LwjsLaDaDB4PA/KWDKfPyviPu/gSy?=
 =?us-ascii?Q?zONitUlOyQvUf9W/1Qc3yoMkMVB6sIzfmEAQFeaTLynlUpv6Zkp3ZoXHJU/7?=
 =?us-ascii?Q?ep6YgYb12uZ2/hp82GufaEA5NtW0TrN4exDPHptCqk38mpI8KuFTqjsmvXWY?=
 =?us-ascii?Q?nQTLW0hOsO9ggjqMG0F2EXIM8EfNvpXwbBzGRw5AiWCMNMAapksexugVUxi6?=
 =?us-ascii?Q?5A4EtdJX1IynjkPPjaxPuPXM3wddOO2cMIvt8t9+9dqPsPI4CathzkpLTdgd?=
 =?us-ascii?Q?ZZaThURyExd+awBwiH8cZyaCk0SxaiOfLKUcwXYx56JJfpnkdazctBIJqD9Y?=
 =?us-ascii?Q?9PWQ/cOVz8LHRlS4QM9cVd03sBkROigQ0bS3Qp3aNQ/iS1gwBjimWT3EAbzk?=
 =?us-ascii?Q?KU8Wwmf+u2JM4pfzHAF6+7WqQ5FNN7l8efy5Ip3Rp77baooQvLJYfixnVX+f?=
 =?us-ascii?Q?B5cYeLkaV9qkqBnn46IZZE15ROtQbT/IcWjs9y9jST0NDTqJFIlT0AfEL2Tr?=
 =?us-ascii?Q?9jeQvQzbjk5KtvpcqvnCE4O8Hun0Sar5Uo0UTv1P9OTyootaFfmCSJFW25Uh?=
 =?us-ascii?Q?n7uKIU2fbsbYj0/nTvaYljNnGzOi+0VPRvBvU9sLOkta4ClJABnZtM1fCbHZ?=
 =?us-ascii?Q?2COFNjwWj4Rxx0QsO612tiNqhP2iULY4WUz2ur91iDIBQonw18IV7UkVqMPE?=
 =?us-ascii?Q?GrpRQEh9MYMYNXOBj7P1UYmFKQYzsVDn+mMLG0ZQVDGEjUEPrIrV9uwKdk2J?=
 =?us-ascii?Q?vjPUGs1K3v2ijk7LsiqejiIpqn3Nf2fbexul8OUPL91tOzf27rGRbZE2Uxhy?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a5322b8e-d51b-4cc8-b9e5-08de1162085e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 11:56:28.0815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aMfG+UoP7MdK+WYfutwHdBK+6wpLW+GD26NtCvWuWm+OYiAUEzthd950wB98j6D1Lvn4Yy+JACSXFXuXqF6kLJRWf3hGUumgUHrZB7q2Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 11:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225187

Hi Alex,

On 10/22/25 1:32 PM, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Please see the corresponding change in bitbake for the rationale.
>=20

https://lore.kernel.org/bitbake-devel/20251022113146.3207795-1-alex.kanavin=
@gmail.com/

I would recommend that we specify which commit from bitbake we're=20
talking about in the commit log here so it's easier to find it.=20
Considering we anyway need the bitbake change to be merged before this=20
one, that should be doable.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/conf/layer.conf | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 54fa04e213e..6c05c0e1934 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -1,3 +1,5 @@
> +bitbake_min_version 2.15.2
> +

Does the sanity check still make sense if it simply cannot be triggered=20
anymore?

In other words, should we remove BB_MIN_VERSION variable and its check=20
in meta/classes-global/sanity.bbclass? My worry is that we forget to=20
keep them in sync. If we need to keep it, do you think it'd make sense=20
to move BB_MIN_VERSION to this file here too? And if possible use it as=20
argument to bitbake_min_version so we only have one place to modify for=20
bumping the variable.

Another question is whether we should backport this to earlier releases.

Another question is whether we can use a newer bitbake with older=20
releases, which this wouldn't help with. E.g. what happens if I use=20
bitbake 2.15.2 with scarthgap layers for example. Should we force the=20
version to be MAJOR.MINOR and ignore any patch if not specified? e.g.

bitbake_expect_version 2.15

would match anything from 2.15 to 2.15.999

bitbake_expect_version 2.15.2

would match anything from 2.15.2 to 2.15.999.

=C3=A0-la Rust version resolver, c.f.=20
https://doc.rust-lang.org/cargo/reference/resolver.html#version-requirement=
s

Should we rather have an explicit max version (but ok if not defined for=20
e.g. the master branch)?

Cheers,
Quentin

