Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F66C87FD2
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 10:21:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.55])
 by mx.groups.io with SMTP id smtpd.web11.18971.1754648462624474358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 03:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DlMaa4x8;
 spf=pass (domain: siemens.com, ip: 40.107.130.55, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tefPaQ5p7AXSy8BvzHNRkZkS+63uRtUk7FFg30jaq9VQrHL6xePs9BM332DGlBdEa6bo9xeAA2iRoi3LJLlv3NIEcH91iS0zdeQni2/1C0wembavtMN5EokIaAoicLHikOTSl2bM9rYGyIfUWkwEQTaHV93SrtRLcKvKONvQYBxgJjA0N6poi8cLSeRqe7nc9iA4ozMy2ttkZoSxO5RoW4mTdFrKzqGvB736Fa8oWnteeCpjM516GrMasm81f9HYcjqoyWjjQyATFjaZYuMrDMB26f3HNRkJDGzanSjjPDZh6gKNM7FAPebNzgcjMjG2fP0GrEWmdy6doPCFoef/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YexyrthsS8kySqb62N+X1jDGMyZnwP30mUvnGS76OSM=;
 b=sR/YlwUzGuX+2628h1iiOFP4DFKw3/rWlT5V9cUrUr9ak0oWtD1ZNJOajlZpDaeopL18eftTKOyZF2N04PAjSAANBmc5rQ0hx4DkEGXcvHvxPMSsiBBgl3R09bc8c1UsEVu0ElfOtVtnTW28XmZHuLe9DRbi1W4vHDxPRTRoXUpF4uFY2+Fyerk0GdmHn9vec9H1HC4M62yxWDW2lsghyMu4mTnYiDggOasWdwLtry1f92EjSspPKeQKDmx3dz3kIDIKfP9Vp2nlpe4mfYrXiFhIwm6l75qqT+cikUYXny4Y6xnsSJrAZ3Adg3uyFTU1pH4m3ShdCq9pxlRIP7OlSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YexyrthsS8kySqb62N+X1jDGMyZnwP30mUvnGS76OSM=;
 b=DlMaa4x88UdWtmDsJ6OM47lcIsvKyDhT0skwq9kE+P1RXmHp1FEcNl6L1XKNcL7s+UJvdHsQNfCVotXGzWq3eg4MnK3IEFdXcR1UPOKn/CjV+tPrlcMvjNSP1XNcOXUjKYCgvjMWj1zSXyjCOPWXVVmOPWuW8vuWkE4ieQ7/PGz69j76fCT5VAVUVOTId9srkdpzFBJWU6a7F8ojnW9b0oR+rCdQUhtEWVYoKwZNEf5+piWsA8UcratsHoARqsR719m2Srcqf4QvPHK6IhdvazsBHGAH96U00dW4dFsJO0N0u+ngFBi+pNitocBpKy6NaA/WgxNnwkeOGhz3Zjmbrw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB5864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 10:20:56 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 10:20:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make
 without d context
Thread-Topic: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make
 without d context
Thread-Index: AQHcCCiEOy2HXpGez0SG7w8EVmaqTLRYi+vg
Date: Fri, 8 Aug 2025 10:20:55 +0000
Message-ID: 
 <AS1PR10MB5697DAEEB03B2F4546F8A2EBFD2FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250808055059.8851-1-peter.marko@siemens.com>
In-Reply-To: <20250808055059.8851-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=754cb3d5-336c-49bf-baa9-9579bc5c9434;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-08T10:20:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB5864:EE_
x-ms-office365-filtering-correlation-id: 906f9575-4061-4f9d-49e5-08ddd66542ab
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?E7XgwC1egGdgZXsZ/KZXZXBYuAmziiS6rAMqxlwg3apJ2otynxBzZ1Ro5csA?=
 =?us-ascii?Q?UaNTvO7mPbTun4hIt4svnRrQisUMPeo0Qe0iNedehnQIhToEcfhBz9XZ0VZf?=
 =?us-ascii?Q?/yIQoqwl6L517Jlgfu5Gxl98AY5JGdfuUsrlf8rC+kOOI3PabJtXNzoz2ORK?=
 =?us-ascii?Q?4ChqkQZzLlfFW0DmrXooOLBHoo8q81GPCZTnNkQQ2CMOC6n82MbMS3/bd/Mc?=
 =?us-ascii?Q?d+3NBxgNke7RGQUc42SRKohryThClG5qyDnvyQgv7GJFhMSN0YhE1/9PvpR+?=
 =?us-ascii?Q?wikmQThNIhp8JZwyQ6KVzgUY0nvYQISY9sEsAe7E8hk5Nfy7i1g/TJm8a0YD?=
 =?us-ascii?Q?mJ6DLfAd4xmA7NK6oI4JqqSKDCYZSgj5a749QyKwUka5J43o/o/5y4CeL+dR?=
 =?us-ascii?Q?mrGArTGdZqnmfMjkGLQ4Qd5ulj+kroogA/2f9QnJ1Q9yeyj+l8DCa8fkL/86?=
 =?us-ascii?Q?FgjVB3CI7EVDN1GPp/W5P8E1V/86stzppYxRoGBBLZptMrLLXI6x7gk+gbUm?=
 =?us-ascii?Q?Q9JvcpwkQnpz0NCJgxujTEYTrz4u4ZZKCQdQNL/Vv2JkmHnHBOL6MDXovVkL?=
 =?us-ascii?Q?+0jye7BGFxltO+twQM0ZvkDXjiX5AH7Q/PGu+Ck0+2+5+ThKItHwKfKyttPJ?=
 =?us-ascii?Q?PJqoDj7N38LdMQuqDeph4Y1cRRJkVYagwQVNn/jGoL+cUflvUzk2z1tFFaQ7?=
 =?us-ascii?Q?hVqez5wS1Z6XvqkmOEK6KqaMXDfxggGxPxmsAqu3E+kMj4c1Y0rcqy7KBhAn?=
 =?us-ascii?Q?aqgfKXxH8gnAFciSow4zezWSde10MnnyPlSw17GA7Il4FO6RWMlUvloeZP3c?=
 =?us-ascii?Q?nXJ4m3zKqQmPkKTcrbWoUvgs90GefcsB4FgxaWQR3osFCwsGCTsAogyVFC8t?=
 =?us-ascii?Q?mxFw67mnqVa4EWc7lwfoh0JV/ndQWLbc8mBZHoYgf6uZe/PQUdyh3jq1tzMU?=
 =?us-ascii?Q?vlP/o0VVkYRuq90E8v2Js4msIcxGai9L+Y3LqsJNpq2pH+BCtmkE2Yg5CfK5?=
 =?us-ascii?Q?DEzLYxRZnzaq6zziiOvgbsdZaiG2VHRt0xrPEMitHhU+dJBKwh8967zWRObm?=
 =?us-ascii?Q?mYzhtHWAup3bD6O+cU2CEN1jVtmHr3EbH20Xqr8v3kZm+sayvHTa2f/CVixV?=
 =?us-ascii?Q?R/fe3i1muGLhWAp7MVDjcrJtnxIMpf3lxxOp9f9OiKEj1+zDlDuF0yF2cug6?=
 =?us-ascii?Q?+0o4yxWlFdTJ2cPi1I5Hu0uQ9GVTlwjoxV4IKFW87HdilzJ1JYbx0JlkX2Vv?=
 =?us-ascii?Q?U45dPon6T/lUpqw1WwSExxtWuHCdyYmPhodFNiakLv3Oaf9NKvgHPMfqU997?=
 =?us-ascii?Q?KcYyctQOxISrjk01xT5IX8+NsLHnCFqxlBqJ2dAgIuDxS+debpoG7lp+Gb+d?=
 =?us-ascii?Q?HE+qqEDYmQ7qrvmCmXz+Os9MEtcUcbt0UOyhXFNRCNI2FcKQ5/RjC2LP0bVg?=
 =?us-ascii?Q?4SFIgxQK9MVGMNQschoAp8UCNdPigjFZmri5Brqm0KmhXI7E+5OWSA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CUIqxsFlAbjHjr2AD1rzaDJUyqsqFz5/2/K9Qq5cZFrvwrMTSHkEiJRMizTR?=
 =?us-ascii?Q?A8uaUwDbvVkx0TplnxfKAX0ZqAKBHnuoM6JwbM6xPSdaKsS2vTIiyt6YnAb2?=
 =?us-ascii?Q?8RhFSnl9t/2Ucemyg1UIeolEZ+t/KesALc8aI1eRACKfnwJohuOyDQy+UnVm?=
 =?us-ascii?Q?cK7u8KVu0FY8QSFgS66MA0WEJ6OaymkVaJPwoPaP5C7n9bmoUog1RWqa1488?=
 =?us-ascii?Q?2LfbkXleNkaanm1dOaYuiYUp2XEACkzZkqPSaUPLRIB+9etN4zzYzv4maNfu?=
 =?us-ascii?Q?LN2QG4gbWEu2YCmUtB4l+dBHmmJQYMTTPH2b7VU36n7P0AJD44EtSgaVfAxw?=
 =?us-ascii?Q?zDyeB6NZu49BuFxxBBwKOG0+wrdM7BZUH0iVqLg7hL5tKQpPN9jne9vnah69?=
 =?us-ascii?Q?3HNz0/Vv6i0bJbWQyNQ840Mw0TJKkXrT9Jz1/cy4VNDCPY93lnN5Qhms6HlL?=
 =?us-ascii?Q?eHIWdFiUA2TNhvhRI/gyiRgHdfg9B3WGavJde73B8I3Z7VqRwkqCMv4gfdvG?=
 =?us-ascii?Q?07+Yqbwvh6ui/t5SpVf5eaNOwd2Fc8SimhlWAxIIySWdm20FdCAWQWn9GVia?=
 =?us-ascii?Q?dKmp97k+JiuTw0pDR4ECwWsYKXRJU6mDu8jixsdZyXBGRwLmb6BopSHD39JV?=
 =?us-ascii?Q?B8weBs8nQ8s2Kw3NcIns3AgWZ1hlALqODOaoYOksnK+Xbqyc4Lmpc1W3fKmq?=
 =?us-ascii?Q?XUqyoP6a1J+cNefZ9oqQDsmZc583DEqhVm3NLV9AwT+1CGt85qeUx1lWZu5Q?=
 =?us-ascii?Q?KNenpvP+n+8izCFwmyP4AjcWHfhT+LCgdjXZ3iwk5eVNMyaZzJ92vgkAneMs?=
 =?us-ascii?Q?dvaSBEsYqyfwWpdXmlG7qO1pKwL27cNphbPzNGgiibxFy/dM0uFiY8jm9l+J?=
 =?us-ascii?Q?7X7mtduxGw4Jt3eZFultzU4RGtD3abeF/TjRN8+WlumX3FLu2HKc4YcTuszN?=
 =?us-ascii?Q?UQgpqLCyR38CoSF9YuUtKdoiqusMWVdlMfYysM5zsrAd6rBF3OeK7GfGD7xe?=
 =?us-ascii?Q?M1o04JP6ece0SouLT4xhchHR1z3oaIYGzcqE3fCxB41piKCy2Jgvy7tC6JbI?=
 =?us-ascii?Q?crOeD1DrhjFFJV0rqLuEPGe6w1WJT8pMBXaLKvoIWPx5wKrRcnT/ftC3uimX?=
 =?us-ascii?Q?yONltW8OxbWsb9AOFQ+1KZ9gmSTgQaIVvuhRBC/zp/DZP8MvIA/JnGGPQ/Q3?=
 =?us-ascii?Q?Dyka1wA7kXmFYyR7iG0Ke55zN00vN5AwsrS59OzvC6wI67o6Pi6pxloFObou?=
 =?us-ascii?Q?4dJKOubjTUoEQ5QRZemoBF8x1/4ZKcv3eZA3DUn+GZEzWqNycP74mlfnPTXx?=
 =?us-ascii?Q?bJ7nBxmOHpoAx4QjKVbavN23lih9uKvEUIL60yWtVvo4HKJFMcbmovBdrTT7?=
 =?us-ascii?Q?M20YWKF4KivKLGzuIVDYjfOj5LQ77uUbsgDdhKO6LlhnGxX4zGUQzXBO2Z9H?=
 =?us-ascii?Q?NBMS7xVxb1E4OpBAtySAjYlRbLxdTcSPZvBsHUspXH4RKFcW4nWL8If35vnM?=
 =?us-ascii?Q?76AExuWbqSBxY63Y3W41IkPTGIj7H//NJt1/Z+o8bvlIv20CxSjxXK2Vw3K6?=
 =?us-ascii?Q?GFhyqqARQsgJ3TJPXzD40Q0L9sL1zIDXmswnG2Ah?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 906f9575-4061-4f9d-49e5-08ddd66542ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 10:20:55.4646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41iUjPMk7wrfZTs6jrEwCxOSlqUJC1i/9+v03AkriSECL3jtNLap9mSN4uvwb7kv/HLamlwfiATV6F/Yofg7ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5864
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 10:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221646

Please ignore this series, somehow a broken testing version got out.
I'll send a v2.

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Friday, August 8, 2025 7:51
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][PATCH 1/3] oe/utils: extract method for parallel_make =
without d
> context
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> oeqa does not have general access to d variable context and needs to
> determine parallel make settings.
> Extract the code from parallel_make into reusable parallel_make_value.
>=20
> Also correct function description of return value from None to empty
> string.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/lib/oe/utils.py | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 779c5e593f..8aa15373f1 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -174,18 +174,14 @@ def any_distro_features(d, features, truevalue=3D"1=
",
> falsevalue=3D""):
>      """
>      return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue,
> falsevalue, d)
>=20
> -def parallel_make(d, makeinst=3DFalse):
> +def parallel_make_value(pm):
>      """
>      Return the integer value for the number of parallel threads to use w=
hen
> -    building, scraped out of PARALLEL_MAKE. If no parallelization option=
 is
> -    found, returns None
> +    building, scraped out of given string. If no parallelization option =
is
> +    found, returns empty string
>=20
> -    e.g. if PARALLEL_MAKE =3D "-j 10", this will return 10 as an integer=
.
> +    e.g. if string is "-j 10", this will return 10 as an integer.
>      """
> -    if makeinst:
> -        pm =3D (d.getVar('PARALLEL_MAKEINST') or '').split()
> -    else:
> -        pm =3D (d.getVar('PARALLEL_MAKE') or '').split()
>      # look for '-j' and throw other options (e.g. '-l') away
>      while pm:
>          opt =3D pm.pop(0)
> @@ -200,6 +196,20 @@ def parallel_make(d, makeinst=3DFalse):
>=20
>      return ''
>=20
> +def parallel_make(d, makeinst=3DFalse):
> +    """
> +    Return the integer value for the number of parallel threads to use w=
hen
> +    building, scraped out of PARALLEL_MAKE. If no parallelization option=
 is
> +    found, returns empty string
> +
> +    e.g. if PARALLEL_MAKE =3D "-j 10", this will return 10 as an integer=
.
> +    """
> +    if makeinst:
> +        pm =3D (d.getVar('PARALLEL_MAKEINST') or '').split()
> +    else:
> +        pm =3D (d.getVar('PARALLEL_MAKE') or '').split()
> +    return parallel_make_value(pm)
> +
>  def parallel_make_argument(d, fmt, limit=3DNone, makeinst=3DFalse):
>      """
>      Helper utility to construct a parallel make argument from the number=
 of

