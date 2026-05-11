Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F17ECD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:13:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47145.1778494380596746044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=gQD8yztJ;
 spf=pass (domain: cherry.de, ip: 52.101.65.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkWhlCgsEGqv+gB82RLrTj9hS2Ra6ia4gVRNb/od2YtyBM43cdQVTcjxxqd6bUWORe+aMTHNu+yzhp9NMwaaBqjyOXWOSf8nuUbgH9C9BRtmiGmfyCpL3en1DiMCdPLrFsiKXIBrnYoedsyRcL6INFQGMtNsUEsoxAX8nsJBLSlclh3SFtbsKd8NMoDrbDqJc58gUN4h+64G/ozVUxogzOVvOS1SmlJDNHh5hYq/NbKXoupdr68b9D98os+yrVBNYA9WAmTRheNPth9NpEkI9OIu81b5Msf4dNdeVykaFGka6VDidSfArXAmj95xHqhJ8ANZhNM7IwrUfkazfM9bTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq52t4Q7PguCz8zlmYmS1uzUPdu0yFodetdpQjybNl4=;
 b=s1P8GtKni2NQCdk5WqO41oeEduKm+EQRczdDNtZUgnK1NVM5T6stBBiJmehWcUjKcMcUaJj1+GSeQV6ahCVMtFMHzxRzvAWNaKslJUK6EfgW0HAd3V4Bay6hZUnF6YIPnPZqK3ukblF2f2OExG4+r7Eql6yqJVd8o86FppS1SWDkYkOGcYmbfPIhk960ZB1I7ZKE+qphUthPVFGpnCrjZXDZkDRH+7dI9U8Sc4wXjHuPrOlYY4KChsD8TgM7U4pRrstuEpgXoqdm0eN7ufbC+siUd5zNihCiTnzNOF7qWrL/msKuz8RJ3W0Cedf2iWkIHIUvvYnQ7bJYHNgGeGUujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq52t4Q7PguCz8zlmYmS1uzUPdu0yFodetdpQjybNl4=;
 b=gQD8yztJiXcBy8DSRPPgBbkvUahJtfNJfQnvva/WgHRmDJDdbUz4s1f2+xfdPquHCMVF1UzLPcLl/XKObrqA+qYn+FIHpj+u9mB475aR997izjUGTTNG/Y3jU3A9MMdiU67jULriFKzgoDLVfg87s8RIOpiG3Kpe3YAhYGGShZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by PA1PR04MB10843.eurprd04.prod.outlook.com (2603:10a6:102:480::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:12:56 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:12:56 +0000
Message-ID: <474b07c3-86e4-41f4-81ec-f66394e5bed6@cherry.de>
Date: Mon, 11 May 2026 12:12:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [V2][PATCH] gstreamer1.0-plugins-bad: disble vulkan
 when x11/wayland not enabled
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <20260508022311.3112415-1-changqing.li@windriver.com>
 <4e742cbe-27ca-401f-85a3-05b0193ae1c7@cherry.de>
 <5d1436c0-4b31-4da8-8aee-f2a50e0f9cea@windriver.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5d1436c0-4b31-4da8-8aee-f2a50e0f9cea@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0092.eurprd09.prod.outlook.com
 (2603:10a6:803:78::15) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|PA1PR04MB10843:EE_
X-MS-Office365-Filtering-Correlation-Id: 69bbb710-ff5d-4a23-6a71-08deaf45df1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zAApeT0cArwO6kpj7FWZyrelnhhzU1da5sBW+CMGoiLzki244qOQzTRqlBdPBeb14pcsIQPLtHM86RTEaMhlQtrFAFXpm9zC98F7ts0u8p2z/J19YjLePJ4/Ie+phJIhxRf+gL505MZ+FXArU/KR3rl01Kpz0tXQJzQRrY3/vozCY0qEXmW0sJt9RhVIAhGkoxQ5rRXFpBI+wYbrcqKy3cDWm/BvAgJIe1s5dEWo3q6mKDCoHlhzp7imBdKYUekF77xzJ9ZwsOYjydi07xr9YtsSsZRZiHdE+Nlm//fir5kYipsyCf4OdIRxC8xg9O+GCYuPpxekPPFylq0yt/4GA6pzSQco4XwFcPLfhMwdEk5dGk+R8MI9Nmzc0ItjFtniQewNhB5KHGxiVL2XCPbNEx4iomXibkECk/azLQSPfJ/F6JpxNWbizealNT2zDWm3ZyaFn1rlxpBPopydNe9c72rfUS2BzmsrjU3lQwCOnnGYmTub/LkGdY6lxGO3Wix1uWJlWXyl2l5r3NZsYdpd+gPqF0rb7aTyCKFdx6Za08LcseuvhA1FqyV1WekDtGXYaPn7014YyhVgQjIKRwd/1SfeSoBD/4k1c2KeAAmbGvVv6w+ALF+LHtdhHvY+rDzpGnZwLRyT5WPfPshIpgFCwvMfCve9GRj6RHBji0dRylf0tUysgagQHA6kmy+XM2cD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ltnjQ4LW7CezlXYTCoxaFi3KZag5qHwy31cBo0lbuxIyuYUINs7sGcIeWPg6?=
 =?us-ascii?Q?VzDFnFsvZ7M6WiMewR6U0vqa3JYnRmU49lkJaHPBZZ/24IHWJ4hGl7rLUqaJ?=
 =?us-ascii?Q?5vxHJmvOSSwigSVUW1GdfI/sb+Ysi3pzDkEGEfTPLrciLYXWVp6YOKI5uM2M?=
 =?us-ascii?Q?tuw1BhpVr+Vt3ZUkcj/JIPWe4ZoMNr0NdyYKnZfG8fZrftLwQHnLEnIqTcjM?=
 =?us-ascii?Q?m1YILATKObs5GnSn7sjb/Zw81VErXuZsndnxgxSeMnGYiPdAWSwuxTxhWTtz?=
 =?us-ascii?Q?WVrvsyI6PTkuIE++B5OpYLiNozF5U6VY4Ii/wgj3oD/obpyUXeD/X4NjHSBC?=
 =?us-ascii?Q?pFtxgWCMGnHOtziGPdI8WNFgnO+5WaUA9TidVz4P6rqAFkVpDPwB6sSkLXjv?=
 =?us-ascii?Q?LI9wn7zT1DRlOZQ+K811uDyYQX6txsaVB7mPcFRgQ1GmLb1aV71rcI2obfqG?=
 =?us-ascii?Q?2WZ4+qRTpH7s8AE3uhuxZivr2j+SyHiyurCbibyRoACrY/hRuVGQEXScAVZn?=
 =?us-ascii?Q?rNYNCdQ6CtOmTsOE3909bfjpOLQj1k+3d1p5RzEJYjL9by5rcdwt101fMLzY?=
 =?us-ascii?Q?KLViONG2RqTZcAQXwuJmz6ORm3BW40az3IB35k5MVJpn0Cn0UfuVdZovku2C?=
 =?us-ascii?Q?RGMutT48d8RWm3Z6yqVQtjvm+NMJfIcmT5g80Q32GY5pcWJl0ie36FV7iN21?=
 =?us-ascii?Q?freVEEXKW3NjYln6rteO7kT8a3hKjtX1GTXFoUNMHagVl3+/uBcQdCQ/L/3G?=
 =?us-ascii?Q?vuvXIucLwy18+m7tPSQ7VeKUurOezf0e3hJ2sFOjCa/99nxmfLv9aWNOjjYV?=
 =?us-ascii?Q?xBtEV+YpMFXWkhz4qgRf8+zp+CrR5tRwtmKGQ7TTk4hA+c9xqDyENZImRuY6?=
 =?us-ascii?Q?U61N8t7JdQGtm+i7QMtpxzLb4yCQ6HuviK7rL5e44UBvqfObSnqFRzc5ZYy0?=
 =?us-ascii?Q?ln6Vwc7nMP2zSA664rBXxG/OEXSDEiRnAZAT+WY0oMsRaaxi7P7ypWfBNbTF?=
 =?us-ascii?Q?7X1eSWZbGbLdn+jfPUB7c+SL6OK8HktgTg0uJH7a/QOwrOoCWMnKAjeKV/Ss?=
 =?us-ascii?Q?/crVCWKXL9jIfzE3/WYWiKAtchpcOdMNdR4vdPd5PxqOhCpxEaWzCK8MGHCJ?=
 =?us-ascii?Q?eqKM+EkMF6sVT4WLW+H0Xzl/gvhzPfrtG+Ibzok0w99cQ8uS/9h837Cljx9b?=
 =?us-ascii?Q?1q6bUuaCCQIRXzmK7MfN2Sjke3fR73u1bEufwS8QKaVWra8YMw5rPdJjyvc5?=
 =?us-ascii?Q?/NI/0X+1b/Mzm73Dm20b/uf8LiYQHbGQNzGUdfH3kZkjEeLtLIfxzmZkwyWT?=
 =?us-ascii?Q?rQbLV+uH93naIqQfnogxcR/dfik2lryhXDV13EQK3+iGO2jgjPOy5NIpvnhV?=
 =?us-ascii?Q?QV5nmbCYiodRSP6vYfJhFzbmyaRF9fQnqkAGAYqUAN6XeEaUXS6WaAzQZprF?=
 =?us-ascii?Q?kc887a5XZiKb+pDDoU7Etpjm7vk6+pRipWugV8RWXVn1EEVLaP+K35kyHQ5H?=
 =?us-ascii?Q?Xd96nAA5Fmpa+hZnJT+0NC0uPVeuObmLOl3zwpfkohTXAtE7upZy1ncZPiEf?=
 =?us-ascii?Q?/gimD3aVXxZRQEjwyCzsS4HxqBLtV+BF/Ps0+FooFHvOQOSBefBv/v71XeBg?=
 =?us-ascii?Q?lSpHgsMU5M0GJitdTFge41OoWmxoarke/0FtKW01B2IIeWGsWH3fEDE9h7pN?=
 =?us-ascii?Q?tuR4cdHFUUVG2DFJwBpFJdGgn/O8VSHLi35SsqgSQSql5EiEQ0ZNeUGxuKeC?=
 =?us-ascii?Q?mjjCiksk5g=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bbb710-ff5d-4a23-6a71-08deaf45df1d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:12:56.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3iz7L8Y5vhLVND7VZ56YiFUUoh2w9NBcuHgarzuxY7eHWc4LbBxARsl6nXCQxj8mehSR2ly+pJwLB4Bfp1CocfSiVtz306NZk05GtegFqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236800

On 5/9/26 6:59 AM, Changqing Li via lists.openembedded.org wrote:
>=20
> On 5/8/26 22:53, Quentin Schulz wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=20
>> and know the content is safe.
>>
>> Hi Changqing,
>>
>> On 5/8/26 4:23 AM, Changqing Li via lists.openembedded.org wrote:
>>> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>>> do_configure will failed with error:
>>> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No=20
>>> Windowing system found. vulkansink will not work
>>>
>>> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>> =C2=A0 .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++++-
>>> =C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=20
>>> bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-=20
>>> plugins-bad_1.28.2.bb
>>> index cdf3a20dff..c7f081e25b 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=20
>>> bad_1.28.2.bb
>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=20
>>> bad_1.28.2.bb
>>> @@ -21,10 +21,13 @@ DEPENDS +=3D "gstreamer1.0-plugins-base"
>>>
>>> =C2=A0 inherit gobject-introspection
>>>
>>> +PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.filter('DISTRO_FEATURES',=20
>>> 'vulkan', d)}"
>>> +
>>> =C2=A0 PACKAGECONFIG ??=3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${GSTREAMER_ORC} \
>>> +=C2=A0=C2=A0=C2=A0 ${@'${PACKAGECONFIG_VULKAN}' if=20
>>> (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) !=3D '') else ''}=
 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', =
'bluetooth', 'bluez',=20
>>> '', d)} \
>>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vul=
kan x11', d)} \
>>> +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11=
', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', =
'wayland', 'wayland',=20
>>> '', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', 'gl', '', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bz2 closedcaption curl dash dtls hls ope=
nssl sbc smoothstreaming \
>>>
>>
>> Should we really build gstreamer-1.0-plugins-bad without vulkan support
>> even if DISTRO_FEATURES contains it? Seems odd to me.
>>
>> If we can fail the build, then we could probably do:
>>
>> ANY_OF_DISTRO_FEATURES =3D "${@bb.utils.contains('DISTRO_FEATURES',
>> 'vulkan', 'x11 wayland', '', d)}"
>>
> I did like this in the first version, see subject: [gstreamer1.0-=20
> plugins-bad: add ANY_OF_DISTRO_FEATURES]

Don't reset the version number when it's for the same feature/fix=20
otherwise it's difficult to keep track of patch history :)

For reference, what Changqing meant to point at was:=20
https://lore.kernel.org/openembedded-core/20260415021611.525515-1-changqing=
.li@windriver.com/T/#mf5e87479ea92059c8ade15922b960a57f0471046

Cheers,
Quentin

