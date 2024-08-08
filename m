Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2ADC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 06:33:25 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.40])
 by mx.groups.io with SMTP id smtpd.web11.53794.1723098802507834319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 23:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=AUaWrEQo;
 spf=pass (domain: siemens.com, ip: 40.107.241.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZyUUh84Tb71QBtWeM0doXa8Eh5OckM0qkKF11PV+CpF+n0yEWMJUm8Gv63yWD65SfIsa2ujSaH8KzK0EUiKbWcKN6/w4sXFx6TG2dbIGwYAyV2qAxuJ217xl/A0O+8LI0FEiT4HoCU4WST+L/Bpkim4CRMv2a1gPgyzp18Zwy2vnNzvhZaviDpM8mIvlqX0MfJCLVz6PYdX5th/kqiG0NW+WqQGp3746jkTgCeJWaeYAFVF1ezGWRIyhuQ1kG4PguTfKVV5SNH/TGWKIOHBl0hpEjPdy7E7rjcvXANO+dsuBU2kgLaC53N5AC5WI69qYaRCLlBZ91ZT4OPsorIdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmUDVhupLpjUzgkjSnjMHxHIsSdIiOsF99iHGRG0Sc0=;
 b=uIA9kDkHtbiSVI3zoJ/ZnOeCQc1uKSTQTXH0sxil9/M5V0TFFa02XLxiF/YQv7DP90Lp2RIESCC8zbHT4QDAjtCZU8oVsxvgSwnj4tKo9PRr79sUsAIFhVgCWP1/t2WRYSwykxtW9lCXtQxBygb2D80jBKTuaLC3As2KEGv6Ry8WJ0Zw2oyQLOy77yYN/FQTBUbgjaWO01SKDQ0xciJhtWcc+wtKinKkEZDQivpy7WnjNq4dZuzNzGopZfYagWN1VDp1GrtyfTF+nAe7h5VVyqX3PuD6LMI9gYHh7YrFLiC+dypz5uhLV2feualLJjXl5HudVR7jCUd7XB5RKrEgTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmUDVhupLpjUzgkjSnjMHxHIsSdIiOsF99iHGRG0Sc0=;
 b=AUaWrEQoXNo2th6DXZTYZujDruYux6P8NV0MvaItXVcqiIUP+R4u2X+6jH2rdKdKA8rfDjyfAJGKIk+lKv7gpH5HqHi7DcFoc5DLTCORmzMCqZ9FE5fOflh16rnoFp3wJ6/dF3qYt31goBX6QVrLRyT7Xp8FtTuuhxgS4e/dBggx0tl7mwGxjLyfj34Zef4QYBaPHzHJHaJjXqKL7xpjON8+4KUetqwuUHbrjvFHyPKtE0+XhL95AVMyfy44TgEHyO2gcmiL57lFhkY4txu926FU65YVAao232yt/GgmNh3X24EQ0c92w8yp3y62OJCz9zsYCiTyOKDP1/QY+C5O0Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8673.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Thu, 8 Aug
 2024 06:33:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 06:33:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] zlib: add vendor to CVE_PRODUCT to exclude
 false positives
Thread-Topic: [OE-core] [PATCH] zlib: add vendor to CVE_PRODUCT to exclude
 false positives
Thread-Index: AQHa6VuQEgoEKTp5y025XArhbsmI+LIc5pOw
Date: Thu, 8 Aug 2024 06:33:18 +0000
Message-ID: 
 <AS1PR10MB5697413E57F79E0C2E7B5BA4FDB92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240808062340.1511175-1-hetpat@cisco.com>
In-Reply-To: <20240808062340.1511175-1-hetpat@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=71423eef-f65f-46ae-a549-05ff61d68f98;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-08T06:31:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8673:EE_
x-ms-office365-filtering-correlation-id: 5cea3db9-8fc9-474a-293e-08dcb773fde8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ybeMIfAUpFa1tcFWRV3mgAjUPatGc0JL7tu+NotDU7v9y6WtFg4dEobB0Y1I?=
 =?us-ascii?Q?JjAOcJQe8Y8KAthgep4QGaI8oBbjkK1KvgYOO0SXnKghhqmBxBnr+5AVMjlJ?=
 =?us-ascii?Q?+ueknTOb2mOufy6B3419PRdUS8RpVrmyk/m77w9+6fxJmOoduuwN4/MmOizD?=
 =?us-ascii?Q?XbrLSOizg1USZE2gb6K+R848pGYM8QWhK6ErIvcvhvcCn9H+sob0N9e/UDpL?=
 =?us-ascii?Q?qJy5FGdCp8jAyfKPHlX9hz/NMDAoU5BpG3VUTjk44LiyqK7f3NeM5IFrncAi?=
 =?us-ascii?Q?SNI4dYu5hzxRw2Wnk8X3JnK/xl9L3ARmExZ/MOz5PQuylUmLWHcVg9jQIcus?=
 =?us-ascii?Q?d8rDj1nEQ55ommCQKfOhzaK57wFieSvzAFaOS9gh68xWHgc1aIVIyzNkstSX?=
 =?us-ascii?Q?kMQd504rhY/0lQ/zotULGx5S6Ekr0mboQH4D+RWnSOIK8bohRT+ifTu73syv?=
 =?us-ascii?Q?9wK1RkHXBsWtmEIjjN/xAjStyJi6CL6nNAIeX83HzLW/wG3AaRVMO7ZitNnd?=
 =?us-ascii?Q?lYlM/WUf4lLRoA2usCJrrNx5Zyr6KET2yroYw4tntTE+ZKzWyFY7kVSn0+Y8?=
 =?us-ascii?Q?4ck3zLRMFZnA1OjOdN3gMOWK19yqaABr2mR0Dpdg3C0bGwr5LJNONB/VRm0Q?=
 =?us-ascii?Q?1rHf2LA+Ec35X0QTbNJhnvhAAv/cu8exO3Ki8BmMlGGobxzLrZsTe7wirTNM?=
 =?us-ascii?Q?nhmGFOvWj7UuQj6lTG48rErmKSjNdY9QpKmXOQJVASmBSfgDpV3aK1Kc2+Yt?=
 =?us-ascii?Q?WxAcOCVsGofiY3IpPd1k0FDLZ4wMpAXA/pJDtLG+BzAS3wti3yCtTDgAWknx?=
 =?us-ascii?Q?A/AJ9VapNkGEL7pUCA5hJm261vHQMg6cstdOmMqz92i93v6JX9UJ1WtUUgFg?=
 =?us-ascii?Q?VyLHXZFdWZLVzwnSBPrW+pvycHRP+DtG9/HxrSoHjsvhhrw2mydQ8faydkUQ?=
 =?us-ascii?Q?rrjVAQlqp0VY1LNp9pf7VlPl2cw3+fdbDwTVUokMior4VHkKhzVTUDnHxWJc?=
 =?us-ascii?Q?+BkVACFDDSPh/sZW8oUIe3OlPcU02Z28KMyDo5t+HQ0G11YnKxR/jbS29Yhc?=
 =?us-ascii?Q?Hwa0rRidcraLJGYJzr2zjwW3gcV1tgMe37v7M3w2xyWMR59uXyWmq/188bAu?=
 =?us-ascii?Q?nR/dDg6jOhEGxEKTPIDbsuurr1IvuBGJvfaXXSYHgvTg7TWP0UdLX5F3JV3Q?=
 =?us-ascii?Q?cUF9HEH1+E9xTUTiAKzMKMZdrk2pOcAtjckrAs57GKK2UvQ5FWD+Ywt5h+x8?=
 =?us-ascii?Q?OndJQOZLVEiLUXHnQ9rGYRrG1nspHgVL5Uh70wWdP2Wp7zRL7EKstFGOPj6B?=
 =?us-ascii?Q?lyae0mxTlmLqwRLxiDgIYdMUPEaa9gHxOjTqK7CTAJrdXk4Gure4Uj+T+wwc?=
 =?us-ascii?Q?+PcvfBq/vVIjTkspBsBt6QLv9iNLRKRfU6jiYRosc72j1J/kAw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kP+nxZt6dP9hfs2S939hK0ET5qEd3b/mDQnoHsXW5deDUPUrgKmSn1LtauBD?=
 =?us-ascii?Q?tPQlB1a719lul1uKejnXKOSdascI4we7NDF2rAR9/N12Vm8t9sQrXiBDorbE?=
 =?us-ascii?Q?bIJaQka6BWHz2r3NVkeca+9/KOyzc+dK0RmIAMHsaDrHx13DGK/Iz5jV15g8?=
 =?us-ascii?Q?LdX47BywR+TNLh90TEWNkjnoussm9mb0cTygtxAhN1JpQ1oe8LidrQpnuhfS?=
 =?us-ascii?Q?tMCeDvsmQIQRLemb1fc5yS5c+K2yd44S25RAAQJHVb8u/wzJNQSn+ruRlGbb?=
 =?us-ascii?Q?nOg0ZfW4Xlx9+frzkTUn+E1K75i2lkmqHhy2rPQVR6LU9+/wGOWXn6zFVeUd?=
 =?us-ascii?Q?O90KQ3UCmVpOQUdTB0CcmpMIeSdM+uhN9Pc9oJTKZpapouNueMEZntcL+txN?=
 =?us-ascii?Q?WSGjwr659EQoqnCTQeFduStr+4bMbcYAOn+QY0JuXjnsdG0JQPbmbyQN40wr?=
 =?us-ascii?Q?J/z7ea+7hAht9gTSq8w9TgMlpMHU839HMFAA7UfzKaPyHMoJwnCy08FfxjD7?=
 =?us-ascii?Q?hIs3BdElwlenBUS+HjrfCzRVi0lPCMMWTDCcIs+4qmXXCDHkAe9n/1F/hEoW?=
 =?us-ascii?Q?haK17VcYsuH/T2Tg1XZ4gzMs05j4w97Exm8CAyVnkDHMQa3xfC0wbJcnIWmr?=
 =?us-ascii?Q?rRw+5eNlJn9eaFOwP1FeVgz1eQ+RI2hyB24YdkZxAccEE90n7Y/G7Zp48i56?=
 =?us-ascii?Q?78iSEYj0Vf3dYiCPTa3uOePgFXVDNDcruSVx7Ju035IGMO1/+1+l3pbc4KER?=
 =?us-ascii?Q?v2h5w15PN/7CGWEvAo9CTKLJE4oDSY58470EzGVNAXSJcvNroz7ptVxNmRab?=
 =?us-ascii?Q?piAMCBWrwMTlughoXllgJolz9OLM767q6Cd/leVR7QhSdRNOnAJkzrkSUShD?=
 =?us-ascii?Q?37DZY3HphStQwV0nGwbkHtUYu72B6VBOpfrlG+Oj7XEQmeGmffHcbFGW2kxx?=
 =?us-ascii?Q?rkz/Dc1Km0WaI2Ag0lT4pBwHG1eEV4RPMNEhRMzIzIAQzISUJT5iuzjeyiue?=
 =?us-ascii?Q?m+9VENFCswW+yCDqGG6o2LPC+rBhUYr5YkAXK22vki/aPnEqpnrZ/forYjbM?=
 =?us-ascii?Q?7B6X3l6X0X6p3EYVD1odrutK8i0BS/Uas+ECMRgNX9crBzL9yeSAHyNsQXaD?=
 =?us-ascii?Q?UHUd+pAPw+9T1SA3CWPkIMGAoCDRCI8FYt4TId2xH/2YvNTAN9i/hkBRgc0t?=
 =?us-ascii?Q?UWhUEmnKDinJAIAori/ld8mQKzRPEuZSipq+8aVm7FnMVtEuHtzK5PzNR69R?=
 =?us-ascii?Q?X7cbl+gvADyZxIiYiLZ8tgKaLEddFJQS1yjnvT9MSAjls3ZJkI0RPHekSiAv?=
 =?us-ascii?Q?WYRbFKvquAKPqKFVBmmpVT0MUmSv9dEq5j9m1OnZN3LypLPbUVmYMBFKCXRx?=
 =?us-ascii?Q?l60B9ZTEaPqOALStz7FMIFlWStBbK1vRtrVlLTsxSMFD0TfhIgN93gcBZvM3?=
 =?us-ascii?Q?ey8U7QFLcRUwJe2HJmoeRVau+yZvjnHrBEaJzzGZbhEkHGYjBsWTJd2xrtPV?=
 =?us-ascii?Q?px4R5VZh/0mZ98HyS7nXXdS58WEQ9DpKGRe0oCYTXUM6k7FQbJD7nZwaG8Of?=
 =?us-ascii?Q?3dYUMDSdB5sCCfMSY9/ytiXqGcxtwE22thqmBcsi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cea3db9-8fc9-474a-293e-08dcb773fde8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 06:33:18.8519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdS2M492APT+VHfyUhiEwE4USyvqDnokL3aiHaWgNhdUvrqUEFKRJs+p/rHPOpYYnUyeqgmuMbvXsSb8r45Aaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 06:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203118

There is also gnu:zlib in CVE reports for zlib...

sqlite3 nvdcve_2-1.db
sqlite> select vendor, count(*) from products where product=3D'zlib' group =
by vendor;
cloudflare|1
gnu|1
zlib|13
sqlite> select * from products where product=3D'zlib' and vendor =3D 'gnu';
CVE-2016-9842|gnu|zlib|1.2.3.4|>=3D|1.2.9|<

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Thursday, August 8, 2024 8:24
> To: openembedded-core@lists.openembedded.org
> Cc: Het Patel <hetpat@cisco.com>
> Subject: [OE-core] [PATCH] zlib: add vendor to CVE_PRODUCT to exclude fal=
se
> positives
>=20
> To avoid false positives (such as CVE-2023-6992, cloudflare:zlib), add a
> CVE_PRODUCT to identify the vendor that has been used.
>=20
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta/recipes-core/zlib/zlib_1.2.13.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/zlib/zlib_1.2.13.bb b/meta/recipes-
> core/zlib/zlib_1.2.13.bb
> index ec977a3035..8f3814068a 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.13.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.13.bb
> @@ -45,3 +45,6 @@ do_install_ptest() {
>  }
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +# adding 'CVE_PRODUCT' to avoid false detection of CVEs
> +CVE_PRODUCT =3D "zlib:zlib"

