Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A9DCD98D5
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 19:34:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1296.1763062488132131544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 11:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XGtppsmu;
 spf=pass (domain: siemens.com, ip: 52.101.72.10, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaAtPV4aoJTLcg0OSCu9f/MazRcWiZxpZqkeFhCV1cYU4p1nv4WWMOukrFom40z89luVUKaBoL1lPQLc31O39vEtevh6HKtfSmgOg69E+/y9SQnVDhPTzdK+k65xWH27LrSepnufQdEp8B51LjYD6FNd7E4WmPjVXzDRkK+q8roJH5+SPPYNZBC1ydZSrCWFJw7oB0f2gPBgnzexp8skN23CQ6jCBPNt3Zz3au1EGbjHHsF4Vb9IP0HIy5yVc6dkm+WwLa+87bnb+Z0BXVCRCfwHr1nNbuRh//IB1nbBUl6WMKZMMbA2ADHdOoAd7kpzpIErugfXa90FIpgMEoTYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABgLJaXlKvp7z64uY4XcG6lY3/7Aoj4GgbNqqZVLrVc=;
 b=fYG1NZ78pjHoENbruB88a6p4NGT1nuIS4evPNrpsKqCZ5Cixxrerk/+SkGKI5SFcOJbRVx1OXJZLxsIOEC50SuzY1Ed2INo/uFXku47wa3Pmm5XqWO63D3o1tMHNOqRP7WZYq9pk3XeTGHPgul7y/q95zoKYvscuSWyqtb7AtQeqRMsUthLKEiskdt0g5Za1AWzfM8vlFm6PujGr+8e6IviodhcOKzh1YcaOWucVvxsZXn/F5x4acRj00D4WRdCoMSKpIFjbRdBAlyjhx7tyn16OohjkpwHAqtXtD/VVdeZ3YiNXGfEuWETO4cJyxBGFHJnUma4PZr7ldtjJdQn4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABgLJaXlKvp7z64uY4XcG6lY3/7Aoj4GgbNqqZVLrVc=;
 b=XGtppsmuT7r2of0J8R/5DgBINLdLYfheSK2ChSG9C51KwvUlmP/nHKurGqQS8L1Zq9O/sRjbEMYV8YzZo29rF2IuD+63zG79GclWR6BSnNJSI3P/44unIjUOnscAOTpOMWvIxlhAvHm4haoCnCigHrivumY+nV8zJygCtt6f5gCDk4AN3A0pYN+3JVCngT3rEh0E/2ldXKn11ZIQjkOoct7+/ioDmrDJg89DwHLn9KlyMwH3eUE10iQU2gBGonkEqY1mpL5QYTl5vzInmstc92WyXdNzVC8n/4Fyz8QhGBB9G250iBWFoPd8J54jZj5I27HYzpyCP4lSQYwtZcCZxQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8385.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:34:43 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 19:34:43 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "corentin.guillevic@smile.fr" <corentin.guillevic@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] layer.conf: enable test for revision
 alongside a git URI
Thread-Topic: [OE-core] [PATCH 2/2] layer.conf: enable test for revision
 alongside a git URI
Thread-Index: AQHcVMkR6tETEnrjk0m9fRvTSkCQlbTw/Z3w
Date: Thu, 13 Nov 2025 19:34:43 +0000
Message-ID: 
 <AS1PR10MB56971551CC05881D1874F72BFDCDA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251113181157.410053-1-corentin.guillevic@smile.fr>
 <20251113181157.410053-2-corentin.guillevic@smile.fr>
In-Reply-To: <20251113181157.410053-2-corentin.guillevic@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=364d695d-79eb-4a20-b8e3-981d68cb33e5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-13T19:27:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8385:EE_
x-ms-office365-filtering-correlation-id: d46769f1-e9ae-4618-ba30-08de22ebb262
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?KRARDdSUI+yugknj3ELdKgsORxZbQfC15FlTcROT6ZJ3nb1GBP+lJ/pV1VIh?=
 =?us-ascii?Q?d9hug/pBrhsv5dyeGmoGRfk/haDApL4t9+1YsDI/buXZhrLhxjAhOBliAdJT?=
 =?us-ascii?Q?S0XXWuvPIy1yfPC+N1GiOFs6GGD2ymUdWqeFitmj4UFabpHM4z4855RDOHCD?=
 =?us-ascii?Q?j0FPxkcsOtjfw0UZF8jjwR540+AOCuKYJ8V7kL7vthauroBzEYktvDSA/cRG?=
 =?us-ascii?Q?CYV5WPHPljW1544rFzOQLPVOjy21wDZfOY+O45VvjKP4SnPCcsgoRcYr3CJw?=
 =?us-ascii?Q?TSWejhWdsRbfF3Sf7SUkXIQu3I55I4NhVDE6CV5K25mcWl03ig/XaX+bH5PG?=
 =?us-ascii?Q?kRkOtDZ0Il40gA2C0GayPOmWDE7KVhdeBzCyYvFaWy5urS+DQVqkp4AMWd/j?=
 =?us-ascii?Q?yU3FGH59GSwdpg03JL5+d0CI3z+HMPuek4kfsJ8AvSZ0T0bnZFqKEkBXZMd3?=
 =?us-ascii?Q?Rch+93CvpE8SqiNv84jLcuETmE/80HGdm5cuyhvrjtkJ2BVrgwh9gyhppVE1?=
 =?us-ascii?Q?sPw/d0MCHzdQuP6LCS3Le38T9tz93rN2saPo38uidKuaSD/QkVk1WNE2pIkC?=
 =?us-ascii?Q?S/F3rv0thJiTMzxD7g3ZLFqiLxHRwqPJwot5Voma5/sgQ3vKbyoATKkROfj7?=
 =?us-ascii?Q?uhUvoTQbGKII1d9ENW6vzK7KF6DaHxfczgYFX0pTwUc4ayCxdzNDaKGqDCV4?=
 =?us-ascii?Q?r9v6X8TblbCVJfl73bDVMm2uvTXCAHdGsqfX5KQ9WlOVJ386xJOha/zOiuwU?=
 =?us-ascii?Q?mYwImHLk2+5jihGEfhcqMaBS+lNpcIml3pArlSGSjmnLtU3Vt5tl8gVUOrYK?=
 =?us-ascii?Q?C4XWwvdKNScifwF5N4s4lpNGoMbdZkgK4VuSuAGwJKRVNZh4O9usYSIZEBrY?=
 =?us-ascii?Q?ZvnvehcXOJjD69Xu5CbAxPUeMnNSb6Zwbj8aQs3ZLR01VqDK4jNWE23M16zH?=
 =?us-ascii?Q?owZnWulRWWHw2UG9Pz8zSQ9iv8lduDFml6Fq/QaObXX1yK73X93ptUYL9wMJ?=
 =?us-ascii?Q?wwIA1QOn/4ANi9bk+O+6DzPHOV6U1BUzOkfM1NI4Coefzz5p2Pk9g6W0fxkD?=
 =?us-ascii?Q?zPfKQb1F4Fvd9+TVxRkp+QmMgUTIJ6MaIC+yt1iMcOKCQZUFkd3AgvErPUue?=
 =?us-ascii?Q?FL8ZchtcUkf4rWH0wlD09RdgkAKVnPy3pa+ye35NP3KBhfmeLNX5UiWtZ7t0?=
 =?us-ascii?Q?tuGnQe3If2wiB3Vmxk54VjVcdBPDIx+mI7mYbFp6ZvyMa0jkvp6Om0yM6//A?=
 =?us-ascii?Q?XKCZEbVbf+8YRz1Er5h0mIgu3e/ctiV+PXco7qyyzWtX1UtJvaiP2cO96Ezo?=
 =?us-ascii?Q?RNqE41jzdc2WKrH27MfyPgcP+KHFKnMcbCNlnfXN01W+KEDbDL9OGZhUrdHB?=
 =?us-ascii?Q?S2665l/ozfJkG2E71CAV3D3MFr190pzvUiFDcf/4VmyxqmwwnqskmHCLxzYr?=
 =?us-ascii?Q?hqCgAfFu6rxfVNqZHjnOiYoXidEm+jod+CWG51LcxGbSK5firmptQaIXZsUF?=
 =?us-ascii?Q?DWhyXFMPY2Wgk2/dGBXDDS9kHBD1TA0b/1pN?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Fm3PREN9yoE1EKLqLRq7OLtJB5sYP3fQrs1DRNbsmyV5pi2dgMpowFfpXisf?=
 =?us-ascii?Q?OfJcZqIKgdvP0Qg762fQjWL005lxQIADt0nN2ouUU0CPWgyg/vA2MXFLPnLu?=
 =?us-ascii?Q?2N620sgXKDKurzfoveUvLituxSjjRTolOigTyhYxWsDaxOJ4S+K4gIzmuzgI?=
 =?us-ascii?Q?YIbV5yiJpQVkCrGtggZ/LzZIqFYDjZtKabI2oUi67FO03TJvGfviSXADDZ0+?=
 =?us-ascii?Q?AwzhCuvx+LcYYscvj1yTQiaOKTcOJS5MgN987UCINeaaaDa0AgA0WOz7JbEq?=
 =?us-ascii?Q?uobMGhoGtfHxsq3f5AKkiMAvNMJJnl6100ahCmCwMtJT/UcCIjA5gdCDFfAo?=
 =?us-ascii?Q?HZncp1DWwOujBghJqHUISk93G5oimR+VAVAMs7ov3gl+BBCr00aTIQQENG9f?=
 =?us-ascii?Q?QhYfw8E1laTwwjp6z1npB18gRM6fUQNvneo9RJwEuqKUH/KZrivgpX/KqeD2?=
 =?us-ascii?Q?0HpsL1ZFafDS9mbcnFKnB6baEgbR+HZQAVnp1lNbEedyKgW24e092emM0Dbe?=
 =?us-ascii?Q?XgWos1e9Ai/+8DBrHK9l6cj9o5KsmUDCFIAoymyrss35AJjjslRPs2HLmkgd?=
 =?us-ascii?Q?vCGoZOjcGnEY36RK0tn1fzclRGrBRyDLFfHiBXpdsICIr5cWNVfcAIQDzDVU?=
 =?us-ascii?Q?5Mn5ojH7EVd54n7Eb44UmQEeAondushZbAf0vZkah20dRNdU1QR+wkIqUOI8?=
 =?us-ascii?Q?bMql1enEx9wHcgf6CdjDSNmI7XBGDYCYCHJeJOFpKwQC7EPv9JJKFbqLSi1P?=
 =?us-ascii?Q?cScTX7wrh69XAfkeLiEUoDyXviylbRrYT4iOTqXtXtv6lZH6Wt9kor2fh/FG?=
 =?us-ascii?Q?WtnLHvVFPTBW3pfOSpuUinHUE+4FYvfG7NWTxIDj0fZGkPrV44cVEw2AjF1l?=
 =?us-ascii?Q?VbdZ6uaIlCQCWJE1zUMm+GNdGs46babjJ1ZvGMiMDdFW+gZjs/p3J+OZymHw?=
 =?us-ascii?Q?qfGS5b7GlmgjLzHA35e93+AzLVKJ70pFlDAFb4eeAe11zKY50K7N99eZ50Dd?=
 =?us-ascii?Q?QD53iaXsfwC96NwAHac6wxPzZeojuUaFpBqYyESBPIBH08Hw+LEtiBBcyIRM?=
 =?us-ascii?Q?zVMXz/8dnzi8Opg0SdeqMcwvGkiaR1lKc/J1lV6nEVvPEU6EiQ1kurdDB4bG?=
 =?us-ascii?Q?MmEPoW0bybgOWf0oMU2bNlf1cXN2NAtwoxwhx9YKY2OEQn958Wb+6LP60xGp?=
 =?us-ascii?Q?o28hdEFh3/ihyuXSkqV/oefMVqFClSzD3RFaA4bL31vGlMkJfBu7YfwuPnq/?=
 =?us-ascii?Q?wIXFmcjpQLCVNDHI6I/ZEBWAbL6Y7ct+g18pfWpFamdXeiEnJVkIU40eNrC4?=
 =?us-ascii?Q?eVUosSe6yB9w8HoL+uvcyF9sGepF70rjhZ9O42tH+2E3xAF0qu4WfP3ec2wG?=
 =?us-ascii?Q?CyJftaKA1megw1ihpEecDxqj5ffwl14a6mPWVdh/Kh+XAO26QjtsyO4vGWbi?=
 =?us-ascii?Q?knZ0SrraPxSJUzCaKuO/qbqVx/lPE443HiXmVOG5L8Ao+bffcOJv9ATwhqWW?=
 =?us-ascii?Q?Tnp2D8hCpRaTq6TVQS2iMpSJ47RfqNqQAzjXHkJ5lZfwNkhocTuxRplT1zWV?=
 =?us-ascii?Q?9w57GBLReLxK+D2kQw5p3x4NuJ1ggRthOZonWvTO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d46769f1-e9ae-4618-ba30-08de22ebb262
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 19:34:43.8294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErSTh1X55ml3OUjyBm/SkVL/08lxRcTlM8InkzJTiXV3yAt4v9MTUJuYKlnGx3bypMLXAlvYpLuQihL3yiHzlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 19:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226265

Perhaps this could be a warning by default in insane class and meta-poky co=
uld upgrade it via WARN_TO_ERROR_QA?
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Corentin Guillevic via
> lists.openembedded.org
> Sent: Thursday, November 13, 2025 19:12
> To: openembedded-core@lists.openembedded.org
> Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
> Subject: [OE-core] [PATCH 2/2] layer.conf: enable test for revision along=
side a git
> URI
>=20
> As meta is the main layer, its recipes should fully comply with revisions
> for git URIs. Enable the check for this layer only.
>=20
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---
>  meta/conf/layer.conf | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index ba25ca3029..1f95867165 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -19,6 +19,9 @@ BBLAYERS_LAYERINDEX_NAME_core =3D "openembedded-
> core"
>  # Set a variable to get to the top of the metadata location
>  COREBASE =3D '${@os.path.normpath("${LAYERDIR}/../")}'
>=20
> +# Raise an error if no revision is provided with a git URI
> +ERROR_QA:append:layer-core =3D " missing-srcrev"
> +
>  # opkg-utils is for update-alternatives :(
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    sysvinit-inittab \
> --
> 2.49.0


