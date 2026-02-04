Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A93E83EE4
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 07:20:14 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14649.1770189608287146165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 23:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Oo0IyOsd;
 spf=pass (domain: siemens.com, ip: 52.101.69.25, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4D/jz/1jRbAICAmakTVF+1OpcYMTwXa3FbcjjIhOIIDSdwKxmq7JudURleN/GcWizabXVKJLv3XijNgyU/Y0fQ0qiq5UnapWPDZ9l3B4gmN68zuhDXl+CNSfpVuuWi3U7WxKFlDW+20sPVrn4wPoVH76TxTy88Ec+Qkw5vj34D8uW8KyakzN7D1ofJ/+sqYPpkR/ac8b0c9hp16DtrZ0du0hf2y+h7UvD2Ssk/+YK+jNduGK4NlNkn3rm82NpuKSnfMTjqISgkwhCvZz2yJasf9xZ2Wf7raDUQZSc+CV2hLv5OvveECaYDW+/yPZUOvjUrzQv4bf95NCxcQ89/vUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mg+w70+ZR/exNCCHbfJahuQzQc/T702y48BZwDcCkUQ=;
 b=SzVj/zun07CSPR0yaf8MxuYzmRTsObQNa5UXdoN6JWcwOjgDecUZ6F3vIeuFjRlNIOtWQO0cWKU/+I/KV8pRgSpDNE8dSdDknRJhq29vbO3UEWQ9WokC88tDozf1LRrt1Ie6Y9/okCZC3kHcglH7CgONTEhuCqBMe1pJIefVQqkn20h/L0A7oCUuN3xlkvB7nq8wqzeXsP/UPNC2T/cw1pGmbU1RpYOb2189f69oQ0RciouyrDBWGKy6aSSCbAAzHmwQJgfIwmw2J0DrMBEFiee0TWP3RZ3yAs9a2gJx7aQBKB78ZQsMoAvLUna/RlRcGEozW5xlPWLEMidBWgqu8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mg+w70+ZR/exNCCHbfJahuQzQc/T702y48BZwDcCkUQ=;
 b=Oo0IyOsdgtcErS/7Syw/7VNycO3eQVDeCyt4gwQXemKRiXfJiPKVRo7msb5C1Lfj3nLSB7UKwnrpHjSR1Repxfl6ZChr7TTmXVXEaI75J76qZr8rnFTiICYuqp2qErGatUdV1337j5ZaIR3ymhxbKg6E25rBidZ1uzVDVBm8oXrkgL0tVWfUvn1G9f/abXqbTGn14NwlTlAvQfFZNPrXPiTAmtqffaK0A2lwRMYx5PYMEEWL1r8X1EYUbA4FgrHGv+BYaW3+wZ8YNYDH2mz6q1hLzuN9hC8gLyBK9WezSiwDBUOCU0pZjhgbcmXKm4FdnHO7ei1zKcUf1v2ewxrSlg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5343.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 07:20:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 07:20:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Topic: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
Thread-Index: AQHcgoLYVlzHjZJ27ECLrW+50b8uI7VySDaw
Date: Wed, 4 Feb 2026 07:20:04 +0000
Message-ID: 
 <AS1PR10MB56976FD8DA8A295D941E55B3FD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <1889800F45802F27.2902090@lists.openembedded.org>
In-Reply-To: <1889800F45802F27.2902090@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=acd32350-706c-4270-aa22-e0f1fb9c616a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-04T07:19:36Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5343:EE_
x-ms-office365-filtering-correlation-id: f7a1cc58-55c2-41a4-9c23-08de63bdd144
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?IDFlrk/Q3ALnN0k0EPOryS3k3hCwAoG1R5QfP7WzXKTwU78fggJjy1vOeB6z?=
 =?us-ascii?Q?LtpcRUZ/d9WrdmkX5FF7mlmgZXqkfScH+m9d+Q9dsNtUcXIzVeDHYFvx6tKs?=
 =?us-ascii?Q?ugegiGnTbjAEdTP8nUUySLhT+9uIvwPosqbRSImzTCnVKUor14sRW42g0gn/?=
 =?us-ascii?Q?Lo1f+GGO5FiKWBzEWKPtmtCxTOQwfePm7d8a6/GMIQNBhz9ahkIoqYWtrP+D?=
 =?us-ascii?Q?F0TjeRnE36GhUrRzkDT2IfIl0uBy/sLwUjT4wo4UGkIDYBvWKRXwUkG2hRl3?=
 =?us-ascii?Q?CF4RU/hWEhx7JA30MQQfhhKPt17FOfGgA2vqDSKKeOwEQ+76ufBGR6ftmSdY?=
 =?us-ascii?Q?qZhpqdTFQdIN5WTLJkmvktD7U410DlWG3HysYRwFBPOMaO8D6kdLq21DA1Mp?=
 =?us-ascii?Q?BI+xXDULGNhM/TN+ZWvn02RtS/VXxpUvstbK6haItzdtG81bdciQI3QsIU1h?=
 =?us-ascii?Q?LBk0o23vvVDOk5EhyQ3HnDljilbENYZKgj1DvrtAO3GcnxV62f2Gg0b8i7J4?=
 =?us-ascii?Q?S7/oQx+dLz0472HuVflkculicb7QiusWB5p3jIobU6ARU/WkRRjYB16ZDQuQ?=
 =?us-ascii?Q?9l1a4nWlhQufp/f0Bu6MTlrlunJ+DC+KGbqJKb12d+l9af4yWhyioSPWg97b?=
 =?us-ascii?Q?D4tNo7BSTP3V+slZt28zCnnCrPHzDnWgOUAIo3yx3c5gPsiHNJClugXvv+Jq?=
 =?us-ascii?Q?FBhHUGn1GtXVXEhz28IfHLTvMSUnryeLviZxUlF7EtGu2SzOtInebHEMgxtV?=
 =?us-ascii?Q?5mHMNFP4bALyfHwMV1Kv0lcH10n8OL3kr/LnvedoiXLC8d4f0noZ/NT2zVnF?=
 =?us-ascii?Q?NXcKvsFSWvPDczcOrPxgV8YfT/fOW8WPFfRCuEoL6vCHSeFc11NFh8wCo2mV?=
 =?us-ascii?Q?M6zPTPiG532CPc6ooX/k4sAkpsrkIBZm7tRbDMVLWmOotp9zMAb0mhrJJ/cI?=
 =?us-ascii?Q?ShHlH6Cnu0gpvcJAs3Z6qHJtWsFLaqdnvmbo9JACpFznd2TWCxvTIn+YCihL?=
 =?us-ascii?Q?xx3bAIuadeeN4rt21T3uwddwSSaHkbORIYC1G0ON3tdcIgkZRAmQK0LjjAYJ?=
 =?us-ascii?Q?D0nkhx/RtTNycGtZxu4moYd0cja1zuoD15ftoLzEY5Zdfr0+COaMQaLZI1Nl?=
 =?us-ascii?Q?5P0vuXEKYaotkLRI+W2SR5C1K6dpSPs3+5X0z5GNQ2Mb4RTZgXbN/As4VC6T?=
 =?us-ascii?Q?f3YZ7LQsCGCyhUBqWL0p+LgOE1NLcFkJSZIdaEA0SV8aMrGGX0hWxXV6cwI5?=
 =?us-ascii?Q?LoWUpr7pOFK8ovH+VC1VFbyAVKjq4CLQDp59VmmnTgmrZZ9BUlBmkprjMhkN?=
 =?us-ascii?Q?7gy0FeHedqhlf6KIjpbP8+nkd+gpamN4wtMMm/uaNv9X1iMZtS4ZOHPrdjEx?=
 =?us-ascii?Q?CrqVxTxnyJegCntM7V19hl9xl6LT5TDl4PCZPMTaBzxVgzOEHerttxCSEDYt?=
 =?us-ascii?Q?rCoxbMIEMi0MTx7SJSC7j1MObcGUL35wGNgcT3jdhrJbj0rpvJSG6UFLcEgK?=
 =?us-ascii?Q?UDoBvQtCoNhrmgQg0NHc703AaDHVPQB3HdYFn9rr+kP41OTIxVPQ239pPEpr?=
 =?us-ascii?Q?YuRe7ZQa7y12kRhkvNq0vdF45yuVD6G5qA3JiPxO6tGIAY2Ik/xvZ/k4RL8j?=
 =?us-ascii?Q?n4vNJFVmGWvIlWb8fIzFhio=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ycKJK2ZeuF+H7dCEbMvJxvF0oXH7gHZvgvoc1SwpN8lDXrROwIhpwTqS2hK7?=
 =?us-ascii?Q?jW7gRQx0e13XUEm4aTTCT1P6FrFeBhhGtoupoi+TQ/fk7KZNM3UtOg/+hSW3?=
 =?us-ascii?Q?my32IehL/YD6jQzaGo4rNPZqvsT3DODx0clAD8qNccOlzQWRhVYK2g808DhB?=
 =?us-ascii?Q?Dillc7/05Hyb6piiC2TxmavoHjsXGK0Ym4+GfJPkbUYA9W5mi90bk5EFzCgn?=
 =?us-ascii?Q?xRzgY1KUfoYsU5Asry4E5B1l7eawLAnk6OQ5FRAXP2n/c8NgW/152ynlBY5e?=
 =?us-ascii?Q?oe00OYeyJvQTt/o/Ayrl2zdN/Z5f/QdJlPgZnFgMzSu4ul5Q6XTLWrfTzp8x?=
 =?us-ascii?Q?h4DrOQbxlEw/8Fp+BxNQ3OhDDthuMIHeuQmC7pMSN5t5lyrcZB8g56dJi5hr?=
 =?us-ascii?Q?ewNojgZPcQSoTvpjYWAmNnlyPqNbAziFVZOwLXVjuC66Uya92FeF9T6U8HS7?=
 =?us-ascii?Q?hlB4+hYZ4IiLVjaazDP7zm3PQ0xtsT1IXKyHfpsbpYYudXPHC+BlOmnxuVJK?=
 =?us-ascii?Q?LFNU/MX40QowSAzahfYUo1HF7EMTMWnR3lG9RBUmt7v6/GQbdzQHFxB6gTX+?=
 =?us-ascii?Q?7Ydmlge+dWMGAMU5Wf3qGP2YKAUI2kfmcTjKpCcZdhufiUCjuZWpgOmRQcb5?=
 =?us-ascii?Q?SqtLL9PY5YULfA41p9Xfx3IQ8mz1cU26oxgXjBkbyBRGOSI58XzbgkLKJuDL?=
 =?us-ascii?Q?J52Q9xJLksvjmmR5w8LxQKTbqhTV8PLYnKoof1UPl1dn8aX8Y8T2waDQ4SLE?=
 =?us-ascii?Q?Yby9YxJbIp+CYdgtsa+dEY00mVeVCg54pXJ7xk2VRLjCGfOhq/Ehfa7KKu1W?=
 =?us-ascii?Q?JQ6yVF4E5+6iIyrAFAvsXp8ULMhqrPVGX8nC5BcIWgLrWo0KzUqLLEXRfUMC?=
 =?us-ascii?Q?j2iBjC/RPOaAJOWrwkscTCh864M1Ftt9ezVVKAecoRXt2xrCsYZ9+uj8JEPO?=
 =?us-ascii?Q?H12oQyfylMFLGSV0GKOev/jTf8balma67+ZXxE+FuwoFYcfD4Y4wZChEV/N2?=
 =?us-ascii?Q?z80KV5fNA8hI6EdaJJ8YWyL7B8ZRGozpBr65VjWhQ0HJR4aPDFpDVOUxUQ34?=
 =?us-ascii?Q?MRmEjijsjtUUJmuvlU1eB9leLPEg9dNydbtvI577kZkJ/OKJu1f7Wb1RG4/e?=
 =?us-ascii?Q?n8AJW3/gWHDzTkAR9JjvCoPwktbUlyjYV8sdaWNusV/eN3hbBYCio4RI1DFz?=
 =?us-ascii?Q?QLscy+D4GP1UT3CoHmAAky+Dg0PSg80m6sMprLxV7+kqsnRXW8BY/iPjIvkM?=
 =?us-ascii?Q?VIs1FKao3VusDZVVWv8XvM6wNjXExA+Gowe3uN/UtEZr8od5EY4VHdPXqYxw?=
 =?us-ascii?Q?JHd2I8d12m5JSljZ6rCtVnDz1OgtYdIItlUf9pIK6DWRLylIM0GD1+qBXUdG?=
 =?us-ascii?Q?loJUHY3DOcjGdGpsDP2e6Z60fjq13/aYWKO9fMScZFXgqDxLVmb0AHrSPXD8?=
 =?us-ascii?Q?jsK7sS1nGsBWhW6AxMSEW9QpWt04YArZ2PZZPZgt43jEjSJuo7nDxQMm4Gww?=
 =?us-ascii?Q?HT1cp4QVsOusTFjcf/iUKXf8NicnWh6NoiC8kTxNT+lU0MVo3BOqXvxc/MpB?=
 =?us-ascii?Q?NYfthuNuGp9cGpMW0P2x2npoqCwElNmy90qJQ9cUQ60k22T0ot5DhsaXR5M+?=
 =?us-ascii?Q?oRI0yvN+CFpGZlcswdmGRpeZKIbWef5WTKGjdsjxejNMOpeL7mLwGt7EeurZ?=
 =?us-ascii?Q?UmhSTiFYUYllykU00QhNx7a2ylAbnt18LdYqnqZVYTJhp1ZmF/aLN2ijQLHU?=
 =?us-ascii?Q?GawP/Cyvuw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a1cc58-55c2-41a4-9c23-08de63bdd144
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 07:20:04.3688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7em9S1T5uFnvL/XynpjAIHjmxCOFzMaCUzEUpoHazMvmFLWzShVX6OJ51kFMSEOv5IAT/bGQDhCA1ZnkKLULhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5343
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 07:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230499

Gentle ping

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Marko via
> lists.openembedded.org
> Sent: Saturday, January 10, 2026 23:45
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2025-68973.
>=20
> Refresh patches.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-support/gnupg/gnupg/relocate.patch    | 14 +++++++-------
>  .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}       |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} (=
97%)
>=20
> diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recip=
es-
> support/gnupg/gnupg/relocate.patch
> index ea0252026aa..655dd3d0ce1 100644
> --- a/meta/recipes-support/gnupg/gnupg/relocate.patch
> +++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
> @@ -17,7 +17,7 @@ diff --git a/common/homedir.c b/common/homedir.c
>  index 6f99f3e..f22aa9e 100644
>  --- a/common/homedir.c
>  +++ b/common/homedir.c
> -@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
> +@@ -1294,7 +1294,7 @@ gnupg_socketdir (void)
>     if (!name)
>       {
>         unsigned int dummy;
> @@ -26,7 +26,7 @@ index 6f99f3e..f22aa9e 100644
>         gpgrt_annotate_leaked_object (name);
>       }
>=20
> -@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
> +@@ -1326,7 +1326,7 @@ gnupg_sysconfdir (void)
>     if (dir)
>       return dir;
>     else
> @@ -35,7 +35,7 @@ index 6f99f3e..f22aa9e 100644
>   #endif /*!HAVE_W32_SYSTEM*/
>   }
>=20
> -@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
> +@@ -1362,7 +1362,7 @@ gnupg_bindir (void)
>         return name;
>       }
>     else
> @@ -44,7 +44,7 @@ index 6f99f3e..f22aa9e 100644
>   #endif /*!HAVE_W32_SYSTEM*/
>   }
>=20
> -@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
> +@@ -1389,7 +1389,7 @@ gnupg_libexecdir (void)
>         return name;
>       }
>     else
> @@ -53,7 +53,7 @@ index 6f99f3e..f22aa9e 100644
>   #endif /*!HAVE_W32_SYSTEM*/
>   }
>=20
> -@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
> +@@ -1419,7 +1419,7 @@ gnupg_libdir (void)
>         return name;
>       }
>     else
> @@ -62,7 +62,7 @@ index 6f99f3e..f22aa9e 100644
>   #endif /*!HAVE_W32_SYSTEM*/
>   }
>=20
> -@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
> +@@ -1450,7 +1450,7 @@ gnupg_datadir (void)
>         return name;
>       }
>     else
> @@ -71,7 +71,7 @@ index 6f99f3e..f22aa9e 100644
>   #endif /*!HAVE_W32_SYSTEM*/
>   }
>=20
> -@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
> +@@ -1482,7 +1482,7 @@ gnupg_localedir (void)
>         return name;
>       }
>     else
> diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-
> support/gnupg/gnupg_2.4.9.bb
> similarity index 97%
> rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
> rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
> index a6e777abf89..4f60a4e7b28 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D " file://0001-configure=
.ac-
> use-a-custom-value-for-
>                                  file://relocate.patch"
>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
>=20
> -SRC_URI[sha256sum] =3D
> "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
> +SRC_URI[sha256sum] =3D
> "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
>=20
>  EXTRA_OECONF =3D "--disable-ldap \
>  		--disable-ccid-driver \

