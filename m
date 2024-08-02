Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6BCC3DA7F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 17:52:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web10.1812.1722621139179364689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 10:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MAJKFkal;
 spf=pass (domain: siemens.com, ip: 40.107.20.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yziuR6NjCTZA/jYyRDcLG87PqUqLxPWubI+OQgnBHQrCwaXuaRf3LMEdMf0LdXIe0svJNLiReoW6mpB891k599Mm4XsKa2Gp8OLly5LWKvyK530+NOpbG/wVV0VSRom2nIhdxsmVVes7YH87OUfBxLjNF+UwQnRyMlg5H0+vAwfyMI5fJhvYI2IdR4Utn1h6O/RElGQdb+p8NbzWZmMrTXXym6uTqb6w7um5B59ANIv8lO758N/bN3TNf0JlZ8fHlR7Ow7td7Opf4BxNm5F1Xtn5ve2jsEeia/HqQi2Y1/Qi5NJtU9TRByrBzNjkuSsGvqZhNJ/OWtnpP2522lzfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy65uWON1Pt3wGhBmou6WVRozpx4j6whoewGjJVVRGs=;
 b=njvQtIsIQ4hzCrRBZb/LS3J6pkGfs45Jflq8dWDMx+NYYdq2vzhqNenr011jn2DcaIMYx9Dg7NwvUhK9JIBfv5U99KpWv0ooSKDXl8579DTtRyKQsZ8/WGI6XzOj5K8Nw6D0VMtfSiNpaYBSGcFksXAI4tIAtap4AD78Udtz2dIDpCcfavxgmIUin6x/uX9fW/B7ZRa3M8MbNKMUfgqM/cx5gmLB5KkKtvx/rQO0C0niK8peJ3E+Uu3p0NmbLTT9Rb5l4y9XMDPJejBCmlZ5d1mJIj8nJO1Rj5BPvgKN4fM6lw+/8fTsozXyl4tQDQlgykwY8gPYNTMYGnkp/KcDow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zy65uWON1Pt3wGhBmou6WVRozpx4j6whoewGjJVVRGs=;
 b=MAJKFkaltSr7ZxOyD8Rah+dTMYm8v+lXn7xdLTJDzxDIEVQsCqSawrA+foLzwfF759My3i4pZ8yAZ59b/mqXo0fri6YRzQHqz2uFNBZ7t8LwPccUYIGQTM7yKEVeDNYvOg6il8gG1SOIqgZ6tQR9zQqXNfr+JpwZxajzJOJyHvIw2fDeoHLdn9F+ec5aEpK/6862ih55vn94AXjB2GsB3GFmoWcbxOemZNyFJ6KclyCDUgscFPEkQe6DnK7JXxFVbJYiazAQV8dLllioGT23Nmxgm/KRzo/PlqN9MXr+iOKFvDIyhhVY8BOnEToH1i9cSnf+oDAD2eEb2Z7mRwOdog==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7698.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 17:52:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 17:52:16 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "alex@linutronix.de"
	<alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for
 native builds
Thread-Topic: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for
 native builds
Thread-Index: AQHZV+t4Gmd/AlPZUkmzqDhyOvJI7bIXBHrQ
Date: Fri, 2 Aug 2024 17:52:16 +0000
Message-ID: 
 <AS1PR10MB5697ED6BE1D46C5AEA0B2267FDB32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230316094102.2628727-1-alex@linutronix.de>
 <20230316094102.2628727-3-alex@linutronix.de>
In-Reply-To: <20230316094102.2628727-3-alex@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=31a771a3-cf51-4f69-bbcb-698dc05baaa8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-02T12:47:39Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7698:EE_
x-ms-office365-filtering-correlation-id: 78fef573-7c69-44ab-d347-08dcb31bd8bc
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?wcj+71/yaf4ATMSsgSZQTzMS56tx+AjQ+8/GZU9VP+A2kanNjfXTUSPjYUfX?=
 =?us-ascii?Q?k2wCHQ1Xo3j6lSY8XS+2mmnd0yed4Nm3dGdyVIjEDn8lx2Xp3ILK335FCvAq?=
 =?us-ascii?Q?PBFvfYFo/B3aNroD5NH8if1sxsD5j01aLs7TsnsnIbdlClPbjQ+nbR4AxlM+?=
 =?us-ascii?Q?rt+h78ocEu0VJXYXWC1kZ7FO97yzIoQtEuljY/bS4+oXsokrl/7L5MxB4OlE?=
 =?us-ascii?Q?s/0hP7hSkwSyZNwmMtcLPnGj7VR1VxDcmHEowpn+S/R7EQMVF+l4tj8V24aN?=
 =?us-ascii?Q?fnFKJlDtbBZ6qFEYX038448xj0A+fJVrdS7tOPVv8/FGZ99udssQX5FOW1St?=
 =?us-ascii?Q?J7VX/FcZhI8U1IG0m8joQGq2GIidkMCokJH2HUsTuAUamhedJnDaPrxfSy2h?=
 =?us-ascii?Q?a6sJUmNLIoUwRHeVDEeVh36oFQelxGEbhSJTlLrz7ZFIKYusq2QLpPZrdwlk?=
 =?us-ascii?Q?NsbVYoNAiaD+MlEKMOLdRiR/KxzlpAarCwAketc1TApnjApLnF51WGEoBDLW?=
 =?us-ascii?Q?VIZ+LLdkU6HinNHCRporvoDTD3CpTXW+ZmeWTfk3DpymER9KtE9UQCqGaN+a?=
 =?us-ascii?Q?DkIEokuWjhR3Lwqz5tUWS/cW4AMFRMhby6n6+wSu39Xy0DDKWMmDidr9tFne?=
 =?us-ascii?Q?gR6xBr9djoOhTeRorqCXkfgRIQOUKQWwN5KAXH7gfV+KMmDpfBoP3CnRD4II?=
 =?us-ascii?Q?0+0XzNXIGQ1ywAm2iJMvcawdKZDTbEgVL8JmeZf4pSkwkbl5kEGjQ4IX/2m2?=
 =?us-ascii?Q?Z/kvS9jtbV6evRzZEXejJGL0Jsq7qPkKWw3wxCUs3YXNnrRvhWEtTGPFuAFg?=
 =?us-ascii?Q?G0duovQAjUQt2cYOLWZKuwX+JddUV9gulo4T48u4vTsKTioyL8wHIC/n2Ka0?=
 =?us-ascii?Q?dlzkjk45zmB+bt8xdsRnk0QSFuHXS52L5eaVe+S6Fubs8IGtzYghAaXIIpNb?=
 =?us-ascii?Q?YVKDw+g6vBWC4gRkg2cUJSZa/b+mfU+OzonVNa97kfcs6OjQt7Fuvbe3NBvR?=
 =?us-ascii?Q?Xz2IXQLnXQ2vey773HH/9JDHUDKlsi0OiYPIVAsziyGjfpuTWiD8ltbtJeXn?=
 =?us-ascii?Q?QfFQ43MEeKJHtqDJ2iNsUafr4mUIIaWxVOIs/4ZaCiEZADXwBEdSo7vdsUKA?=
 =?us-ascii?Q?E6tQn7hMDz88J8dqCxKVxXYSYOeGBKbfstBbM75VSA3YKQ+njHpdHcTUvckB?=
 =?us-ascii?Q?AsQlApuIFVVgcdNSEuLsCeA58a3cbJEOS3F3kL9+MXzo//xJgVRok4Vsdq3e?=
 =?us-ascii?Q?KJIuF5P5m/945rh2SkiBEAaifvAvn1ZDjqUPx5SW4fLA7hcBB4uzU8EaC4MC?=
 =?us-ascii?Q?M28QYx1uInRwXOJd+n7/YJ/UidZRvjvJIZAT/Co+yxbf0IziWn/lG6dIwHFv?=
 =?us-ascii?Q?18oR2N2TDhR9rZ0TSNu+BVztA4Qs9f/m5YwJtBm0QQB4sw1Wtw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oP/N/vLijpyJMRl62UXaUyGoZF6a7lyKHU0aLXq227YEtzwC3EKtTUPIhfjk?=
 =?us-ascii?Q?UTgUb6vkN5aDnpNbZFAlOgU1jEUiFt8DnjGL9VgovVzulbYOSaedv34Xst+S?=
 =?us-ascii?Q?KHOaPCRJyumdXv3snguM8rRogaaNWhkbF4kSA/PBHjWUnfz4k2d2z5E7/vkU?=
 =?us-ascii?Q?Yed9idbXvea3hw9DzOhljtTJd1zsbT7GCs9odPZUPnFklBpUVccBinyvAH2t?=
 =?us-ascii?Q?1v8Nrmg/6DVRQV1a18eBdWq4vY/8kOPZUyDBwM8OgJuo6Z9p2XgRZlYY74Bo?=
 =?us-ascii?Q?KjMXv+DCEzKkLhiCaJLDmZqXixiFVhfwUmgAk1Je9R042WINfCR1rJhNqSSd?=
 =?us-ascii?Q?DEQcW2f6EP/OuNGNjxZPY718Wx1tXjcDU3AbglP4xC+cxgL8YB1fEQZ1hb64?=
 =?us-ascii?Q?8PzvcFbriEz/leM8Zu6pGAqFokhTEGw0BnVw0aoiC6c77RLODeWIqOsFOO8T?=
 =?us-ascii?Q?Bg1pfwmFCjO+6LLTr2sDbf6VE2HkuTmHouXKbXD3vgaD8na91T140p7/aYcr?=
 =?us-ascii?Q?0HEYh7EWc7Ld6yHHyeIPAAZKflrXY4o74v8FP828dshwo2PZTNFr2CN2O0KF?=
 =?us-ascii?Q?trj6M3L5ObfOVFQX/hr2LreY8Dt/ttIBuNlc/oAoh/caxofc3ENfU2nOUMRF?=
 =?us-ascii?Q?0y3ksJEoFN7qDcM/kiFlqtFMKNxLUBEgtLInjfkEOi+kDuBAFFP0glDrilMA?=
 =?us-ascii?Q?SRfrbVTCNCgYYysJCOepiPkGJS+XQ9uAkSgB46xgZSLwtIBMKuRpmUeBl4pU?=
 =?us-ascii?Q?zYMSf/8bIxyjaTgc5+lg3nHaLcJtT0T0vqUteo8QvasZ5PtKVgBte4Yekfwv?=
 =?us-ascii?Q?Ng2vjAVnvcnzhS5S0vGUp95EfE94qu2nUYdpwH4v3Mmo2HXxZ+qYqKZz7CEr?=
 =?us-ascii?Q?4Tp23c9ZPBdtn7g4t9L+e1MH5AnVW9fgQVF4hfYgwTlPU8oE1ioYxMMe+C0G?=
 =?us-ascii?Q?ntiOoezBGifu3eD+DCUHc1Se8tm2X+Bp5erYxE2OMqAgG10+b/XvIy78fKA4?=
 =?us-ascii?Q?rr5qwE7vvBzVQkmSrTrXf4dupxl1ksc/Xas8NZC14wvaERGEJkhVwVb7xDtT?=
 =?us-ascii?Q?Y1QylpNAC7d66scMFKYkS2OjII7JaKAP1qkUYxhkTYHK66oGh1NMpZiH+i5h?=
 =?us-ascii?Q?UPGz2MCpKguB+QINO59NlhtgCY7S59sAQ81UP3iywu7oH+QJmOQ4+nvgkvsF?=
 =?us-ascii?Q?MBxUsRmNDrHkDPjMihMds3fm1jxH4itPWVy5bCHQvvfc2k7T5EoH0FqFv2G2?=
 =?us-ascii?Q?tKxEzVR3qfv1au2vht1okCXll4ETXH8kAiNtpdCszlf+PaDLtpalAqfn+9I5?=
 =?us-ascii?Q?ZlW/NoY//dxO7epPzOgJdbcaqj1uOE/hncaY1VABPScfAyiBpUWntxU0jsPJ?=
 =?us-ascii?Q?EY3/Pum70Zyh1///VysLAw99rBYkevnE7rM2t7WTM+Oj87/MbTF2XLeN8L+T?=
 =?us-ascii?Q?8ngTVOfkf99FuJk5qi84VVO4clSxe9QggyUx+b95ZkCszB6z4himH4iJn+0b?=
 =?us-ascii?Q?6LFL5qa3iaXbc5NHMXobWnkRZPoZC1OG0dePGgai05O/TNAh5JxMrvFdWt8e?=
 =?us-ascii?Q?R3UaESPcFq2Rh6SI0T9nZpoBdvwswtlgr5Z5HQFp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fef573-7c69-44ab-d347-08dcb31bd8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 17:52:16.1311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5IN0YDIXC49IBEbvsLg8T+YtiDxCTlvX4BmgAwLsIzzovgvG7NWGRBUpK1O22qfTtZG1cg1gLnEcWLjpDDxcPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 17:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202928


> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> lists.openembedded.org
> Sent: Thursday, March 16, 2023 10:41
> To: openembedded-core@lists.openembedded.org
> Cc: Kanavin, Alexander (EXT) (Linutronix GmbH) <alex@linutronix.de>
> Subject: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for nat=
ive
> builds
>=20
> Without this, the only available driver would be swrast
> (without llvmpipe) which is far too slow to be practical,
> and so qemu wouldn't be able to perform accelerated graphics.
>=20
> The one major dependency pulled in by this change is llvm-native
> which takes just under three minutes on my machine. If this is
> undesitable, opengl can be removed from DISTRO_FEATURES_NATIVE.

I was just hit by this commit when migrating our gui layers from kirkstone =
to scarthgap.
We include clang-native in our sdk and this creates conflict:
ERROR: product-image-sdk-1.0-r0 do_prepare_recipe_sysroot: The file /usr/bi=
n/llvm-lto2 is installed by both llvm-native and clang-native, aborting

I had to create mesa_%.bbappend which replaces llvm with clang
PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled -Dshared-llvm=3Denabled, =
-Dllvm=3Ddisabled, clang clang-native elfutils"

But bbappends are bad idea for config changes and should be only used as la=
st resort so I'd like to solve it via distro config.
Also update-alternatives doesn't work for native recipes I think.

Any idea how to solve this in a nice way?
One idea from me would be to create global LLVM_PROVIDER and LLVM_NATIVE_PR=
OVIDER variables which could be automatically switched in meta-clang.
Wdyt?

>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> graphics/mesa/mesa.inc
> index 775aab9297..dd15046438 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -89,6 +89,8 @@ PACKAGECONFIG =3D " \
>  	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial',
> 'video-codecs', '', d)} \
>  "
>=20
> +PACKAGECONFIG:append:class-native =3D "gallium-llvm r600"
> +
>  # "gbm" requires "opengl"
>  PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
>=20
> @@ -102,8 +104,10 @@ PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -
> Ddri3=3Ddisabled, xorgproto libxshmfence"
>  # Vulkan drivers need dri3 enabled
>  # amd could be enabled as well but requires gallium-llvm with llvm >=3D =
3.9
>  VULKAN_DRIVERS =3D ""
> -VULKAN_DRIVERS:append:x86:class-target =3D ",intel"
> -VULKAN_DRIVERS:append:x86-64:class-target =3D ",intel"
> +VULKAN_DRIVERS:append:x86 =3D ",intel"
> +VULKAN_DRIVERS:append:x86-64 =3D ",intel"
> +# i686 is a 32 bit override for mesa-native
> +VULKAN_DRIVERS:append:i686 =3D ",intel"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'freedreno', ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'broadcom', ',broadcom', '', d)}"
>  PACKAGECONFIG[vulkan] =3D "-Dvulkan-
> drivers=3D${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-
> drivers=3D'',glslang-native vulkan-loader vulkan-headers"
> @@ -149,8 +153,10 @@ PACKAGECONFIG[zink] =3D ""
>  GALLIUMDRIVERS =3D "swrast"
>  # gallium swrast was found to crash Xorg on startup in x32 qemu
>  GALLIUMDRIVERS:x86-x32 =3D ""
> -GALLIUMDRIVERS:append:x86:class-target =3D ",i915,iris,crocus"
> -GALLIUMDRIVERS:append:x86-64:class-target =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
> +GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
> +# i686 is a 32 bit override for mesa-native
> +GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
>=20
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'etnaviv', ',etnaviv', '', d)}"
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG',
> 'freedreno', ',freedreno', '', d)}"
> @@ -162,8 +168,10 @@ GALLIUMDRIVERS:append
> =3D"${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '
>  # radeonsi requires LLVM
>  GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'r600', ',radeonsi', '', d)}"
>  GALLIUMDRIVERS_LLVM =3D "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
> -GALLIUMDRIVERS_LLVM:append:x86:class-target =3D ",svga"
> -GALLIUMDRIVERS_LLVM:append:x86-64:class-target =3D ",svga"
> +GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
> +GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
> +# i686 is a 32 bit override for mesa-native
> +GALLIUMDRIVERS_LLVM:append:i686 =3D ",svga"
>=20
>  PACKAGECONFIG[r600] =3D ""
>  PACKAGECONFIG[virgl] =3D ""
> --
> 2.30.2


