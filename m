Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEA1CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:35:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.51])
 by mx.groups.io with SMTP id smtpd.web11.15219.1758285304989067694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 05:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=v8N50ieX;
 spf=pass (domain: siemens.com, ip: 40.107.159.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwHG76BbZl5l34cFeHrDYPbRI4ngykMwi+I/Gcu+iC4549tQfldmF1lIloZIDCUXkY1werJge0ly4phQgF0cYCnXn2KZSjiQHVEBsf1hknR9oaTyc/geY9OZGO+wQZ7gVNbnCnvr+NyUYPcXZ2i9OL35tDSdmMcH/UmWcPM2oVl2pkGnbLGrUfZa7d/nkod8J9QkJah5L3y77iv4nX8HOBHG6uKxE/V9EUz0DntPSJQJovSkWDQo4O5cpjsyTco+ySnDUUdt7hmqZTl9YU+9MnBi3u+jMmHIb+VhBMzgq+IpND/H3UA0BTq8Tn8o7mxo65XknNKL1XU+07eL94DdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ce9eBJp1onAmiFYGc1vOplwOrlj+0izozZPWF/T/UGs=;
 b=KnXC4NVZ09HcsY9v3unInAnM9JHAiL6MHzXZJOhfwQRk2kxI3EmUi1gzP90Y2QNRwGvXRbY1z1lEkkVS47k7Fp4hdzvvdgEdP5Hl+b9LLOyjZsdsCi/hbyzDC48nEkeNw+lOej7gJpi5d0OYIP96Mi2wDcWAVHyRBJa2ba+r/scZf+5OMkwyWtRPtD7evdm+WqZYhakV+LDnhp4TOwLRf4NJnP5I7XpSh6C1jrss2yQ3fSwVSSJ4qZiU7DM2cOzeJNbvfanSDJ06T6se0hUgK4TkVpy/0wXR+zBuGsCKpjKHzws0/unr3dbbaExe8yLmfwO6bkrPuv1hoHab9Jk1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce9eBJp1onAmiFYGc1vOplwOrlj+0izozZPWF/T/UGs=;
 b=v8N50ieXWN/zm/mUzu6G4L+CKeYB2MqEqKpOz6JTKU+UV3fC8PmPIkr5cRTyfkb8oeXRSVqhiXJ5GKnK3Pmui0hLn0KufxrIVTWyY4stla3LV4IxIt/8ldpkayH4lMXMR9rOq9tVezhE9JdrGfkiUdPFBah2BLUzOoy+gr50VIF12KagRSHrCT5nWL64dj0f7wY1jVyUETvfeN/ZUFSqmTPGBTN6RgmJnKgPsq0nsgVgSx5xhT9wkqXdGvnWmBakMNgyYDvR6guUzwQx5lpBOh6eOh4rzQB0uU1FoZcJwS4iiQpgI8CzNECnrY69qyfRNMkUSGAicrp9+xiUR1eNaw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 12:35:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 12:34:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sverdlin, Alexander"
	<alexander.sverdlin@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
Thread-Topic: [OE-core] [PATCH 1/5] poky: bump default kernel reference to
 6.16
Thread-Index: AQHcHn+COtPDbOthFUSgyfOqeZp/D7SahKlg
Date: Fri, 19 Sep 2025 12:34:59 +0000
Message-ID: 
 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0baa853a-1baf-4431-959a-b8c82f1ab4e7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-19T12:27:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6521:EE_
x-ms-office365-filtering-correlation-id: dd28c518-8d26-4e2c-fb74-08ddf778f2e1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?K1qI7bNHOzWEFLJsg28PkR4mbc8sZr20QwiT2MuZfN9waRHtKaCS4+dd+jRe?=
 =?us-ascii?Q?oF/I6OTOhbwPu/kUc+0/lmE3h0JHRzA+QZLfSM884u1wMon0R6LNA6minMc3?=
 =?us-ascii?Q?r3FqXVgphYadHvl5utlrK+1pyEVdT9pUGe8cV1I44U+G2UJ8ZmwCdNNGXF/X?=
 =?us-ascii?Q?DTf2a+S4ESKpk6IR2s8fi0n7oMhFNJCzd7TLr9sS0qN2Xq5VS/WjKadZZO7J?=
 =?us-ascii?Q?cPXIy1CZfV5bXdoVuGVZz4tABimWA56f1CS9pNPqdEbTQ+l2CbaMDOEXNKRo?=
 =?us-ascii?Q?inOnADkALyveIWLSjj9EEEO5lIO0qEd5Jnn1tbUhKU48nYF6eavX5SGlLR2A?=
 =?us-ascii?Q?qhpiMpDhplJ9TxZv2ovlYF0RZmEu6X0b1eqkfiGLcnTdXEvYsByJLCj32tpt?=
 =?us-ascii?Q?JUEcN6eY2xi5E1vcf20aFZP7ld1/vvOGk4Amm2aZhaDBlG1+/+ztwNwY0VxJ?=
 =?us-ascii?Q?CunFpgYP15x68HuDprJrSHoeN/kd5L1APNkWTAxdvglO+MkgyfSyGRgFTdmE?=
 =?us-ascii?Q?5toBeVSjaKDkuLcl6N+uFrKRoDDIzmG9P21cBgepGTNDvADvYZDF6f/IlwJ3?=
 =?us-ascii?Q?4C7QkrE5XDl8kyGbrDjh1Yicb2Q6ftZ7yRFyRg87O1xHuDL1zk/lGXip0sbH?=
 =?us-ascii?Q?j66EjyeyQ2dy8Fjpzb5ZJIJn3/G1MlLMUYT0HFMqV2a81MUpKXFQyf909ukQ?=
 =?us-ascii?Q?tpKzg1miMEUskWq6PWDppERdKZudJIAQZwtw874Yk6H67Zl7d5HsrSMlocw6?=
 =?us-ascii?Q?H47BWggVjDEc6BhCy+QC3iyJe3U8lfD00Tg0SKlcjQ5ONr+xzmw+BE26KHzB?=
 =?us-ascii?Q?sO5BZpz6i4FrDXfUYXJ1SUZ/BCT7i/2DUyhlnovacxZ7VZn5AnsTzDk+mt5H?=
 =?us-ascii?Q?TEYX5Lh/R9GBmwco5IBjhWQtNZav9ymGHj/AUEZUZGSMOlUWVUHeWBC8PT7u?=
 =?us-ascii?Q?ShgL4m2FDepRXa5PAVOT1/GJ42vEyMErmyiYB4C+6QwOHghMRrO31jRuZ6i/?=
 =?us-ascii?Q?LtPsXAfuwwXEEY6KCnJqcP6frIkMRTYWVG3JFIEfsLjF2iPKwxjWR4obP77j?=
 =?us-ascii?Q?zKjU7LAolkAcAra2Hl66Kk32HsACByR5h8zqJqGbvOFJwSxrRSQCkO7XRiXO?=
 =?us-ascii?Q?Y5pSMfSEBOxXLlkdefn/SE1I/FQMv8t32FtvMAWvexcxtD2iGxWaB7K/P48I?=
 =?us-ascii?Q?LtbB5y+vgy3mvRqW6bCnGDwsQKOkySmTgt48CyX+4VC7prZgri+/ZXxXwv77?=
 =?us-ascii?Q?pIGts72OiYzYnkRcgApqLl0vQYzFqIc4QTboFbgX5T/7m3UE2XtHdYVlJneD?=
 =?us-ascii?Q?0iEJJ28kMY7rGVMkJxIDy+FldUdLEVhZuUv/0kKHU4nch/Z9agyrIkUNxaP5?=
 =?us-ascii?Q?Q3d8IV2pJxjLu/O/2hB7cn0dYWbpvE3E5pmZru5H2QzQmd/74NVOnd15PXAs?=
 =?us-ascii?Q?jKvDBnn5W20=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n4WqCLL7ziq8ga4f692myhHXKXMVqLHK+vgFi6pbg5WB9IzxHM61uNahDDoD?=
 =?us-ascii?Q?b0zL/pq25sSnU5Z6cvbpcXqGlw69W9hdEIiJeO79oVBTTUcyDe0H9SmEk7qa?=
 =?us-ascii?Q?ubHVfBegK7xz/AVivXcJDBM3BeuJiEgoXFKj3R713HvseeId3U68oRoBsU8v?=
 =?us-ascii?Q?VSHMWTvvRLKurNlWp8tNW5V1ko7fvXKd9peeVZopFrszyZJOGC+uDUWcGn+J?=
 =?us-ascii?Q?wnBmLiJILtlpDdQdWZ9OcGjsb02rzlolEFMjZPBuQmj9WMq6Vo6LUyHduhe3?=
 =?us-ascii?Q?HwlbK9pmTb7grNbQqcJhgBkkgdg/Tcaw3qxE1/b9g/hoZ9u00a2i0lGXlkGW?=
 =?us-ascii?Q?lXoQVyne5TyMzr/7CCtgQEGtxn2YQ0umxssg29dcipuGxAs70JmCoxRoxP0v?=
 =?us-ascii?Q?e0bkMPRqsMS7mp0gkjiVWr+cyxS0MGoZ97giPnvZHxh7MlDaeV1/G5PYQvjY?=
 =?us-ascii?Q?lYHGDJGyFO5AB5yF1RsrDNyjaQ85I6gqLuygBNjeMvzzgZHL3u7r9HASZ5vX?=
 =?us-ascii?Q?qge3VFi+mq9QYJyDsvkuviWlUr7ienToPO69DRYSlqUjJi/ya05+u3I0+KfY?=
 =?us-ascii?Q?dg+vZopuoIb4e0YxEMNkK654LxvrvbuJpe1x0cnDUH6Qv1ROu2MEbiAmC0I7?=
 =?us-ascii?Q?2THmasCUgh/mYRFBPI0eWTwy+3dRlU1Eygtpi+cgp07MUiELFgXEU+iiuxeF?=
 =?us-ascii?Q?KXQSJQptGZekPuSB5P114L1Q2IzuQ5MAc8MHBE9TzAg/rVVU8nguUC9+oFav?=
 =?us-ascii?Q?a+lKnPPXGzIo9scv4jcnvZlc0Glvy/iAGx02N1Qf3t7F3ah0jJiDjXsrmh+t?=
 =?us-ascii?Q?3+jXTKHfXGcYAUa6ei7mBzEd02xT08y2FXz7swyLOtN1UUbwsqOdn4g7YZqR?=
 =?us-ascii?Q?11i73QVJRVDB4WNiWwYvAymZk0wMB5AYq9Gd6qWix4v5fHKxOtNBjrvmWPkn?=
 =?us-ascii?Q?CjZLtzrIWIIvLyC9VZpxID2GjFwu9AjuDJEbaaAzpRuk9TrFqQbagHucyK9A?=
 =?us-ascii?Q?CWBNB55gcv4CM3Rfx/sR9rXR4SlfQfDjOg9cT7R1EWls+7CilXGSisTg04iz?=
 =?us-ascii?Q?e64hT3hJPZpdBD4nwE/ehHdlFXbwEUpjzRYXEv2u3c/tCsZ3tZaS/Tr920wj?=
 =?us-ascii?Q?BFWZvvENCR99x286wxl/6uQeRK7V44rNlumjouu9NE4DmxDqzSfbPLD+hScN?=
 =?us-ascii?Q?MqiwkW7zvpKJrLFHoCPJEPaB9fT/K9P79PyZrX3s53tUYv5zv4VaFuJIe/WV?=
 =?us-ascii?Q?ABQQqL+3OwAY0b2ccPLf9WUzdfCgq8GJ7vPG4B3XqSl3wS3ZS+M1/NvMQDXC?=
 =?us-ascii?Q?bw58o1wVV5L/mDbIYAqHaeTbYZD6Oz69JlsHzqQ7PUcdGgF+tWIkXDVDfT4C?=
 =?us-ascii?Q?61wF9VzDL4Wq2UIWZGuvo4lMZthnOTqBidk8JeB7OKJLUHXzyfkN9VTqsX5K?=
 =?us-ascii?Q?70bDN2TSEm0sD8Wvc0t1ATAzHTiLnwELIjvGy5RvyCpBXtyim1c/ajuqbL+r?=
 =?us-ascii?Q?h+v1a6pbQfp5Tgb+5rigOzaAKiS9//F6qNi/shwAalutGCjoli31LCcPiWXO?=
 =?us-ascii?Q?fOUoF9yCLCQrH46r7PJHReQKKjiI5UqzRdHO65b9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd28c518-8d26-4e2c-fb74-08ddf778f2e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 12:34:59.8992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GaMYWGznrS1ZF1pqXH5xzbIClrOH+tlUmJihu1DvObq0OIA89a2dtFykDrlAWbbyBOUcUUG0Bm/waBqhRP4wmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6521
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 12:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223741

Hello Bruce,

This upgrade broke build of external kernel modules for powerpc.
Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.

We have prepared a patch for upstream kernel.
https://lore.kernel.org/all/20250919121417.1601020-1-alexander.sverdlin@sie=
mens.com/
But I guess it will take lot of time to get picked there, then backported t=
o 6.16, tagged and finally this tag picked by yocto.
Is there a process to pick this patch already now to keep the pipeline gree=
n?

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Bruce Ashfield via
> lists.openembedded.org
> Sent: Friday, September 5, 2025 18:09
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.1=
6
>=20
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Bumping the reference kernel to 6.16. We keep the alt distro
> on 6.12 for better coverage.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta-poky/conf/distro/poky-tiny.conf | 2 +-
>  meta-poky/conf/distro/poky.conf      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-
> tiny.conf
> index 81153b3b36..84baef347c 100644
> --- a/meta-poky/conf/distro/poky-tiny.conf
> +++ b/meta-poky/conf/distro/poky-tiny.conf
> @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D "-Os"
>  # Distro config is evaluated after the machine config, so we have to exp=
licitly
>  # set the kernel provider to override a machine config.
>  PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-tiny"
> -PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.12%"
> +PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.16%"
>=20
>  # We can use packagegroup-core-boot, but in the future we may need a new
> packagegroup-core-tiny
>  #POKY_DEFAULT_EXTRA_RDEPENDS +=3D "packagegroup-core-boot"
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky=
.conf
> index b12df2be70..d86630b153 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-
> module-af-packet"
>=20
>  DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}
> ${POKY_DEFAULT_DISTRO_FEATURES}"
>=20
> -PREFERRED_VERSION_linux-yocto ?=3D "6.12%"
> -PREFERRED_VERSION_linux-yocto-rt ?=3D "6.12%"
> +PREFERRED_VERSION_linux-yocto ?=3D "6.16%"
> +PREFERRED_VERSION_linux-yocto-rt ?=3D "6.16%"
>=20
>  SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-
> ${TUNE_PKGARCH}-${MACHINE}"
>  SDKPATHINSTALL =3D "/opt/${DISTRO}/${SDK_VERSION}"
> --
> 2.39.2


