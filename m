Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE0C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:46:03 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.44])
 by mx.groups.io with SMTP id smtpd.web10.71389.1723553158546970606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qkrkItNO;
 spf=pass (domain: siemens.com, ip: 40.107.241.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWTIKY0ozAz2lUEPGquZ5VgdyuI/62ngkkgeHPZWutWyLCDSnrbVONY/UE/Y9UP1vW7FPCaFJ/wFMfNUuEgER1pxJI9Mxf4VsOLY70ZNCoxgspr8lX4hh9BcZ+ZZq/bEx02DtUwaY4q4MilHWhNWPe6T37Q2D729Jh8AaH68CBI6PirNzS24MMlxDZa6A+4s2vHlS20thq/GY5q2jGqc0APBiz6+6YYiQNKUty49yxsy8LSeIyt8WbFRzs+/AoibxFRUrbmuEbPD+/iFq3dcbqZ2ZNIciMNE6MTBtpkltbMAQp7xKJUUmjwDCut0tUkswv+3L1JwtKYcC1F/P8kKEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnpUE2mmaVm1vTLhnRfQjI2GXJOpNGLjsaSnqRXPPfs=;
 b=p6n3/ZyDDP0osy98uxB1zaBP82o+vFxu7PeHOWGdy8zCx82qKxC0Xjtc6ufRpMJJX5dXbEvJmBR6Q7HS6bCpixWKVF2X9n2NY2HlZa9k4RBaweEbJGzjY5R3RJhLwjtpWwPIRCSN5EPuZOQghE1Cx2qoGrg808JF6aFpPYgXeGbznv3etJIvG6717JijhlAnlZ/ON9P7U5H3VgYNrjCIco+vaUZfwQ9r5a2GOmvqkFo7PBkooZ4mfHS8ba+CroByO2MNeBW1Svr2KL8RGO2nZ02uKP2TLnlm+kN3dXVPeMx9ih6N/O4uPeDrdsEcTg/V83bVgpN/dYB4EGUcraOX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnpUE2mmaVm1vTLhnRfQjI2GXJOpNGLjsaSnqRXPPfs=;
 b=qkrkItNO8ip816V6+xjPTo7l9dW4Y39SlxDUzlSEhwTOfGymFq762QPfIvoiFvXLJAuv73asUC5ajvA8C2hna6yKw8HYbsGBV/ElS4ujCCUoOYqYKyr2TpB4E9UAN2fE4Y069i8+CU/HwjIetc4P82s9QlK40POnBYuPGZYKUh4fYrftTR9TwX8cQnt+rSVubqEFpkRWjLe4/SfSZovg95L0KCkTwlBl1zCqTcmLyX5WOc7h1RykpMyrJ7xa4uDZ2+UZe+cCLXOj5VSvrOMX0PaDjn5WO3HXw/8dy5mhbnoCzVE/BevaqiawN/6TAvOE8UGTgiVXhcWnaXawmTMX/Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8386.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 12:45:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 12:45:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core][kirkstone][PATCH] libyaml: ignore CVE-2024-35326
Thread-Topic: [OE-core][kirkstone][PATCH] libyaml: ignore CVE-2024-35326
Thread-Index: AQHa6RRCA8WDlWNo/0+IlWC7J+NnWbIlKsEQ
Date: Tue, 13 Aug 2024 12:45:55 +0000
Message-ID: 
 <AS1PR10MB5697AEF7EB765B0AE980CD5DFD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240807215441.11715-1-peter.marko@siemens.com>
In-Reply-To: <20240807215441.11715-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6ffda8e2-d1e9-4c3b-b42d-983a116c9c2b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-13T12:43:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8386:EE_
x-ms-office365-filtering-correlation-id: 536d313d-ece0-44cb-1a3e-08dcbb95df4c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?H7ano56w0Htwm1ovV4MsLtwx81PjWOsnk8ArA1yF203IcnYjyF53kbQ1yIvY?=
 =?us-ascii?Q?Tyj/fFiLq+5SRJhPmMLI0/gacQ3taKTmGihBXkgm/ZiPiCShLmwidUZsBjgU?=
 =?us-ascii?Q?TDKSmmlgqNlG3qpcgthVvBssQcU7yc/X2Rkv1fVhM8JrlzC1ACDzh6nJuuLJ?=
 =?us-ascii?Q?luRtWkyQB3c9iuGnio0UDraT+zOYTGRmXTup1ZCNCwNaBAT6u9QVs9HnKCGB?=
 =?us-ascii?Q?iMXvClG+Kbk7PwHvhyZ5hmyIVPDaMlqOaktWhyUubKx3Th4p7B/2XiVvCwWR?=
 =?us-ascii?Q?jPa0rOgT7rpwCBfJc4Saz3LGyJB5Wx3F3T8R1PX7vAe6h+XncxMhzU6BsIZA?=
 =?us-ascii?Q?4ZfrqNnZfnxszjxKT6OppPd9V+ydcVkJS6jAdL2qK+mI8qu2xZ8eFsreFShL?=
 =?us-ascii?Q?ubj8piqTXeChY0EIg07HUJLGTx4DPHLh4BjB8ibQ0oOzzJOwjB+q857LQRv4?=
 =?us-ascii?Q?qkqaPSOxzDVdEjE4XUtbmKMgVwqT4w8T7pdSpsiuunbhRaSq9WjxdQGOhxNF?=
 =?us-ascii?Q?ACr+tlw+5rcSeuxYb6hGWTyHAJrn7jU7Pl+81Tv5hyc5Hz+N1d/RDOG6teWt?=
 =?us-ascii?Q?utOD3vHu/y8Koz7fZeXBnx1OOEo0WMwRlFqE2yQHIW6gnRcqzJYW7IfSx7d8?=
 =?us-ascii?Q?GyiQTtiFcekTEsgGMkau1oTqMxwgW30/OqJHISrKG1WT9RCXq/whw+KntTTi?=
 =?us-ascii?Q?hUloaWdSltjcURdx4glYz/Id68ZM4LNBiYmKFRc07DRJ1Boz2VBxNMgdGQkA?=
 =?us-ascii?Q?DEJWhnTXyDbrbgu9Q3wVSBKIycCXyI+QnZ9sAfwb+/HKcD7MtCXMGjMsHQD4?=
 =?us-ascii?Q?ylr04RloNjaqo5UHLetoBo10419cOT5Rnnt6IDfxi/EAH6TpBhrF60p857og?=
 =?us-ascii?Q?N2kL2K5v4Qo9N1JS8F69QIY/xW9ri+Gywkrynl7S9vhOc47vFedwbEe+yIsS?=
 =?us-ascii?Q?r914GY4YCBdkVUw9cZU1cBPex23PmiOuIlGJ4DzM5YPHjtWxSAM8xxWTt2EN?=
 =?us-ascii?Q?iQeqbGepnsNI8jPIHUS6KiiwUcSxm8oftIzHYfCrkDqiidEJF5Y2427To8FP?=
 =?us-ascii?Q?51OiR9D3ojsFMvp2wj9pYPVZOR0Ao7Nf0HcYajcZUZNbD3gokJcJFt49+/QS?=
 =?us-ascii?Q?nqtq3EHGaninSYfyvXilYIw//FHkSjfIOubWbbh2MGt7KOiAnefHht2xGKV1?=
 =?us-ascii?Q?SkoKLSqPU+UIVfhD4X1tIIqs57kpwGR+z/xaVmikTgEyPx+thhXzAKD0FMQP?=
 =?us-ascii?Q?mrmD9qga8ju94rBvmBTvvsttqojVbyDxbhHDqyKkMO7JeANFw0fgTPkAsYP7?=
 =?us-ascii?Q?WbryYtJ5X5wBPZl/3uvonGIFdcgS/u6MwBiKjr10M+R7lTc9WqLalHSCbjzR?=
 =?us-ascii?Q?/37A9gE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?zrKe4MHn/0R7X5ifvIxqOWqS58by8a+5hvBp7P5poqg4PjNTxl8H7jB1YAcM?=
 =?us-ascii?Q?6CwXWQdXNjeiaPTnx1Zd1pEPRnQQExoHYgjDKea/m85SXFTifEMV+8ItxcNO?=
 =?us-ascii?Q?dinT2IRECzfdMZ1t8+qdch7HdkSIE+cSNR54j/sNsmIUyvES8rXHKBxl13gi?=
 =?us-ascii?Q?yFsx3HDOApv6cbt/S7s9eZR4e43xYM7mFyLL7CZPe5lhFm2WRoI+a6M1qfpN?=
 =?us-ascii?Q?g6nKDsKAIT5NWSMGvKc+BhOD2xzmIi4C4QcHYYO2I1nOwM1tqVo18OZ0lGkl?=
 =?us-ascii?Q?pHfZ6gd2i9qkxxqJkAhjgi22rQv1paHpthefxVjYyKYwWbQOhx4IHmikj49S?=
 =?us-ascii?Q?a+VJSSbv+sEvmNwS+p6WvtQx/6Cg/qn8YOYv0jcsfZpt2idxqqHjpXiwlKLE?=
 =?us-ascii?Q?q1zEMAcjVOKl1d73l7V8C/Ew9E5g65EOxYF/UTJNI1Ecj+kvGdhlafvjqVUN?=
 =?us-ascii?Q?xWu1QwBz4z8AHd92ZlukoVdu0kqqvn501enRcW2lKs2GWSuEWqURIjRjU67L?=
 =?us-ascii?Q?0AFxmBJVKXNNMuXSdZ0mgrfb80wbPWeP5+MbZyQ6oPo9yw7N43OSZn/btqlr?=
 =?us-ascii?Q?Hontlvhto+dEEeGJW6LFCiDJBq/V1+EjbIxlVS4PaZdKB9dWm4Q5m+196Y3E?=
 =?us-ascii?Q?Q0stdZ+aIRN7++/ngaGLwMleFa98X2B6jwzs3ZVWgK93G3ZbPczoDK8SuYSf?=
 =?us-ascii?Q?ixwGoJuIN/9Uz6bo0g8uZHWSo2acZ+WCEScliwNIYIB6uv14PSIXNB/7eu8z?=
 =?us-ascii?Q?14/Cm2gh7OLM7ujSs7HqKVFz+GjxSUKnDLRJyAJVhhc9SIas0jAjvAQCYxjy?=
 =?us-ascii?Q?voHISgD+p+BC8nftWu0xx3bdGx+HXvnL2ttxK64v2e3yqlRyTWf+6TyEnxtY?=
 =?us-ascii?Q?ivfDWs7kpDPmNzem6xB5dXuzND/LtNiziuVCdz2FTKIgEHvtz3x8IKANXUnf?=
 =?us-ascii?Q?aPopQhWHZvv57Iwwlq6r0gUj+mxqvprkRXBMWcYUjrqGdywrx36hCNz/QEX8?=
 =?us-ascii?Q?M3bv0P1z50K2YC41au8+oIMSCIqkjrG7I/Kuvd7EPmJ+f8YbasECionw8gCf?=
 =?us-ascii?Q?RVG8ST5iwOSqa2qoYIGA6m2FZmsMzzJiHzak8mPx9JKPtuto3+qidn4B7ZTV?=
 =?us-ascii?Q?tKcbG8OjaAMuUfniIcLuAce5napikUN7X3Jsc1RTGbyUDx86uIEg9Fs3chON?=
 =?us-ascii?Q?AL7CrNUK3XIRjIlnUsn2cBAeUygHUjZ8Gu5UbktGrknuKv4vyW8yMntuYRLO?=
 =?us-ascii?Q?dbKTA7G0RXsJJcf5UlcL7nRteZVaeejBV5OcSA9ra3Gbg+K1+GbJVtP2qxNz?=
 =?us-ascii?Q?j3r+36UFDlIQjATr2NZqoCWLJ6CfpXa3BUJw3nWngDbdVPDUWXODnx/qYcCF?=
 =?us-ascii?Q?EEXdfo20RRVQ9h8g/9/LypHlo1eoG4Yx0nKs2KFT5VISZYcsXfgUkLjTei45?=
 =?us-ascii?Q?Y1gBtdtR1ymZraSKTWa0YWnipvHQ6SpCmi3fNrnP/BZt4p93gO3gtbBsHR/0?=
 =?us-ascii?Q?GiNMw8S9YEF51y+JgsTxXpR82eA/8q+bz9Qh94s61NJJQlPokS/dRluyUEtX?=
 =?us-ascii?Q?Ck1C1onxnm/KXqSrMTY9dvYJ2FqFfnZDL1oBA/Mu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 536d313d-ece0-44cb-1a3e-08dcbb95df4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 12:45:55.0542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0EERjBEMHAJkuZnr+cFJfJWcm1ESvjRrjHRAGOz0mZRGmcG5DOh25a3iGTBEwoA37aw3sgrVbqn6p01Yp3Jxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8386
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203276

Gentle ping
maybe this was missed because of title similarity with the CVE-2024-35328?
Peter

> -----Original Message-----
> From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Wednesday, August 7, 2024 23:55
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][kirkstone][PATCH] libyaml: ignore CVE-2024-35326
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This is the same problem as already ignored CVE-2024-35328.
> See laso this comment in addition:
> https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes=
-
> support/libyaml/libyaml_0.2.5.bb
> index f7c29e7e0f..e30dc5a43f 100644
> --- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> +++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> @@ -19,6 +19,6 @@ DISABLE_STATIC:class-nativesdk =3D ""
>  DISABLE_STATIC:class-native =3D ""
>=20
>  # upstream-wontfix: Upstream thinks there is no working code that is
> exploitable - https://github.com/yaml/libyaml/issues/302
> -CVE_CHECK_IGNORE +=3D "CVE-2024-35328"
> +CVE_CHECK_IGNORE +=3D "CVE-2024-35326 CVE-2024-35328"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.30.2


