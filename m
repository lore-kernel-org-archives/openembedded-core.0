Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808FDF531D9
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:23:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3698.1776115410408882845
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GyYlD2BQ;
 spf=pass (domain: siemens.com, ip: 52.101.84.54, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCDmm53Ezl2J2D3S3inDPnTgHjU8jOn2F4JaGE286jSQukjri83o2xXJV7c6fNCPOQy0R+ltjwbC2Uk1OnANL0eK36tyNhEtsBAK1L+oDYwLxU+xF+2TAKKc1fTpJ6BVC+MJ1uUM748RRHdkobbLcGxlKVujTGJjUTDaI37b+f1Ygmb/q/ZuPY4qPGrdGAxp/KCatCX0cYrdQClELcWqHSCMKdhPB5Tj3CAqiSyJvUtnTevbZTq7zDdMzNfNDpVkQki9u6U1H6+9vqbhp8+qo3DX+aggg33kyHRyGsCF9cvQFBswzWm316AFKsBw+SE3shmFiEvUplerO6D7260n1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjTY3SC7Lg7nYRDKsATMmfAeUm6z92v1T5RLjc6rfOY=;
 b=EhG67eTiXJ+orFKEDfpjGiqKvMkv1n8i0Me70kjMl4wjZ8L0lVxf/6g8Ps0os6DATzFr5+ywa5PnohtS/LmAHxndhXjzqhYv36rR/s12s/lBfDgfE2dr/9TztbndFq9w0k3DZ8jX217X7Dq/iXUwatdPBIN1nERCDablTTMYLd/3gZ5oU8UyYj9E/jqp0DHQXyv7sjIBiobVsZX704tv3+ah+AZOmsdV4TI+QDKP/MctiYVR/217A5rtqlVfXYj777/CHrxJ/7OmZLHG2CiENO1EI6JNM52DWbQcGHUityOQqwK5sDMkowrrl0XdyVPw0ylyo6IQY36uLYNkl2IFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjTY3SC7Lg7nYRDKsATMmfAeUm6z92v1T5RLjc6rfOY=;
 b=GyYlD2BQnQ/sYgwfc2mAgWT7VKGJYlpychPDDLLR3/y/e95Eftsi0p+DcQWLfUGpS/79BUEoGFp9k/s2YjF3ezXTClJ8EXdujNc/Ozc+oiMwE37ZcqiL4xze6J/OU6GIsvT53eNzpCirfqzn7dW2MthDmi3kJ0ev2Q1MPZ1mSAYTZlgUlF4VjBlNo4247nhS1j9D1RNorR5Tjl9Vi2ZJv/zALIZbVU/k0s/aw9Zv0aKOCTrKNeXfzR3PkFraqpZBcZljrfX/oLVOCUhTFldgG/RnPt/QJzj130pNPJ7VfQ6c7vjNHHN7x0oNmOYlx+KaH5ZGoNGkh4pCD17pkBNTpw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB9050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:443::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 21:23:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 21:23:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton <ross.burton@arm.com>
Subject: RE: [PATCH 6/6] mpg123: set status for CVE-2006-3355
Thread-Topic: [PATCH 6/6] mpg123: set status for CVE-2006-3355
Thread-Index: AQHcy4rIGUtvTustS0amULY4gmwCarXdf3aQ
Date: Mon, 13 Apr 2026 21:23:26 +0000
Message-ID: 
 <AS1PR10MB5697198A4211439AC1A131A8FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260413211447.564257-1-peter.marko@siemens.com>
 <20260413211447.564257-6-peter.marko@siemens.com>
In-Reply-To: <20260413211447.564257-6-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=39cce0dc-afaa-4c0e-a4b7-a7d01b2832e8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-13T21:19:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB9050:EE_
x-ms-office365-filtering-correlation-id: ef0aadd7-6b52-4bc2-835a-08de99a2e6cd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 0pVyUSmj5152Sn+jc8q6OkLvzVOWbZolE5x7x9vfnIDsSjlKh1F3r+YD3M+QDx1M141N3ktpY7xUgdDnnYAOiT8tbKr8XL2672MNHyOgicKF898UbLlqCcSL8YGyiwHDl5ME9Fna4xw9ckJOFcxnjZrCq8bD+3P5liwFzOUfXucOrmwWzFOD7nF7Kg9hpPVsqHy5WDJ0nYgkbrGdY8b5CJEd4zHJ6D5Ea+D3lkP18WOtePY8isIRlFoTVzgR8uYBt50vGFqnVuI06/rwc3uMzDt9JXfnmCqByHA4qHDXpSAX+cOfRTQG65N347CqMewcpCQ3mPx/xLqKBdYPVWo0Lu0vRZMULSjXo2BLfttuV6DI2D2tXSFO6nXnf75wI7HCKhlvqz3HhwBiBIqz+d9zMYFn5rF51h8Nn75so/lAgghnOsISXW4gUBzCs556O+96aSxxkpH3lL4g+iBeHlhVOiCoynvN3xdjlSBHvQyT81QMXuI34xt4LcfSLrcH2RcCZdZZQEI2d8C/c/5ap2dvNJZdd0F20s+QUnJKLYbN4eY8NNgQ7TPwIf+8wrfFkZk/GuQtciGI62Dr3Z8B5qn767spBGgIaQxduZdXL5Tc+a2TAq8HOXdVGsUIXKn76GQ2YeWZZp7mrqBV3hf/VMqtsnXpSIGvcjr2LHIE37C3GlL7LmG8QIy/kVpOfiYr5yvXLzxddc+CRJr+VRjbXe8HhcvG3JHoKwiz97cA9yrgOBML7vTRdIpIIulTS3MqB8Ez0ONkO825SrcuFPx0qH13ZH6mI2jVesSQhoOLKEvas0k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8XUbjs4t0PZeqUtPJC1N6V1JnFTVK2EtKnCCrLc17y1T4L61KoSq4YlsK4fl?=
 =?us-ascii?Q?1JKg9W3mAlQ9yhKiZNzhCoGdDNnhETbdAitqFuiLrMEhUA4zsaePTki0fVRB?=
 =?us-ascii?Q?7Gj9LqKAwzRegI8YoPM1u9S7mjaSAUXQGZjcH0MzYcFbKehzsTmn19mbPIYA?=
 =?us-ascii?Q?Z72O7ttbG9VO1Nhcr7CPppkMV62qGRNS9IAogatZqMShTASqW3KVhxdK2/ss?=
 =?us-ascii?Q?vWcp5wFlsf/n7R7nmMIweopKN2FvNo623w/00bRjE3CanHirN9IzCmMXMnkc?=
 =?us-ascii?Q?ebjlpkWTZUiHSJsfSb3xLwwFrW4hRwJZ5QGx42JHRrrhS4EZTZt8Vl+yqmCK?=
 =?us-ascii?Q?tygjGd1H2/DDXED9K629E2WZIK3cw973JyaMW8Tk24rrwq3Sjg9O34Dyf0J2?=
 =?us-ascii?Q?68jlTwRk3Ig4fzYPlh9M366Oyo/fF15hN8ZEzdf2vUgvt01AbI0s8KGVCcju?=
 =?us-ascii?Q?HJZ9Xt8o6vk7+/5P3l3oxbqXnImdBi67rif7Kx5ViN5Zjq5ZoDnwk5OhPl5s?=
 =?us-ascii?Q?Aflogxfw+NC1ovxVuTrTzskNbM/3iDn/BPr947U6/MdBCfXcWiV/qXX3j8eB?=
 =?us-ascii?Q?ehtMyO+DJg1e/6icOi8xdfZXNzGTbcfy+6U78WALu15y3XOLp1/75LIobuI5?=
 =?us-ascii?Q?V7OcYyT9X5C+9W+0p8zYfzVw7RJeIQTxwJUf/8JdruqBWjxmyCtVOYkU8EuL?=
 =?us-ascii?Q?WxqPEDxeYp9VVAgskNlWBtFEQnzdbrgfqELhigvOgsDZnr63DRQ/eB6S98Cx?=
 =?us-ascii?Q?odgLkUl9v4zgllRCtuIPu+MZdUZ4HswTJdLnD95N5jIPgZHa58xtXm9AMbRD?=
 =?us-ascii?Q?zAyuAg7u3vAfP4C+lzuPO2dUNgKOCABGoAJ7glSgludAJFJRSxCxloEoZB2j?=
 =?us-ascii?Q?7B1FrV8RcJ+3XxyYsMlhuMRwSDWDNYX3qkIvIXNKnFp52efjSzyMb/EY4e0n?=
 =?us-ascii?Q?kURz21Mx44L+T6CHfoCpW5KCKerBD1lEQubuD30DLVvJHvFG8k8xVJK8P6WM?=
 =?us-ascii?Q?/QKy8B193t72FRbo3/3HDJ7QyIZhWEhDSvGwbTuVfkppej27Exj2D18K0rTQ?=
 =?us-ascii?Q?Vg6yj+HepaxSWOkfxc4JW3ewXvGMivA1zstxg0DX/oTCuxlnaG5EtLmwtKwO?=
 =?us-ascii?Q?T0Lw1YYA8Uwn1P+uvhVfoNIO0dkQmcTOQ6MzFDEhrEzt0yXDUA1nLSN+7+oZ?=
 =?us-ascii?Q?VcQMJFUMopZUKvLa73SSmnKFc7fYrHJlDOzmj1yUsuq28boyuALpuesYtl69?=
 =?us-ascii?Q?/GFgJ+YgRtNabZnTbGqGQ6JlPXz4LAq3n36NDGCPNq88Ipos0m5CD3eqIr3+?=
 =?us-ascii?Q?Pelt7C9CJcFn1BKoKHG9diJPp9PnXI85bhXliufF3l/oIPMq2GmbuYt7UdB2?=
 =?us-ascii?Q?Mg/kPLq7iDxym0nq2SZleSvzf60kGkSYowZubwAP583O60Tct5U+VLZpKmV7?=
 =?us-ascii?Q?SoOj9K1pdZ6g3+BmKjxAU7G6rFUsNkvWL5ExXxnWTs8qd+aAEGTmsxLnC9qO?=
 =?us-ascii?Q?ZPpJD//dFahA6GS6pwDxyutSMyMkk4QHiAHxP4JZtlk87FAjCQRPkXquzKQj?=
 =?us-ascii?Q?fO3+rCoeAKXEXG7oMnwRs0J964fFEbKxA2fptU5qX7HWtMUPegxhNmV/DxQ3?=
 =?us-ascii?Q?2ysi4h0XnENhsLrMBbhmLUyYFCg4WPvXXZZmXoV2w2B0kYIWlfLJmLfz92Im?=
 =?us-ascii?Q?+Qx10lQUlHSBxw5HqapvE3LFfoft1I5D8MI9Im2DdyOR7MwNIC5tS/cp5sI5?=
 =?us-ascii?Q?TGrRLXF5Qw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0aadd7-6b52-4bc2-835a-08de99a2e6cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 21:23:26.8829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0X2harqxq74pPI5zEg6zExikkPmJ0AmMzCrYAbLLaU8N9k+lHrrLiw42XGyBryM52L52SLpTSEFGjG8vMTOFRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235130

Benjamin,

This one is weird
How can someone debug the sbom-cve-check script to figure out why the match=
 is positive or negative?
That would be great feature if there would be some option to print the comp=
arisons.

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Monday, April 13, 2026 11:15 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [PATCH 6/6] mpg123: set status for CVE-2006-3355
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This seems to be a bug in sbom-cve-check.
> I could get a clean report with following fkie change:
>=20
>            "cpeMatch": [
> +            {
> +              "vulnerable": true,
> +              "criteria": "cpe:2.3:a:mpg123:mpg123:0.59r:*:*:*:*:*:*:*",
> +              "matchCriteriaId": "1F8EEF7E-C6BB-4669-81D2-68AABF8A7686"
> +            },
>              {
>                "vulnerable": true,
>                "criteria": "cpe:2.3:a:mpg123:mpg123:pre0.59s_r11:*:*:*:*:=
*:*:*",
>                "matchCriteriaId": "9765C6AD-E1F0-421C-B7B1-C09AD83A3DB7"
>              }
>            ]
>=20
> However I'm not sure why adding another vulnerable version should switch
> the vulnerability flag from true to false...
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb b/meta/recip=
es-
> multimedia/mpg123/mpg123_1.33.4.bb
> index 648eb21500..dd5f8a53f5 100644
> --- a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
> +++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
> @@ -53,3 +53,5 @@ EXTRA_OECONF =3D " \
>  #| make[3]: *** [equalizer.lo] Error 1
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"
> +
> +CVE_STATUS[CVE-2006-3355] =3D "fixed-version: fixed since pre0.59s_r11"

