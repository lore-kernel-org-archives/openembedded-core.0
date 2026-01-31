Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D737D49C9E
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 15:46:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11217.1769874371435715025
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 07:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=LC2ySwY/;
 spf=pass (domain: siemens.com, ip: 52.101.69.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4RNgj8ZYD+rpi1OXyrtJvvIXEnGOZT78lComUUrL0Ac6ZO+eqmtesPh04oMVoCI+SJdr8clwzkC59oSbamXe9kt1nn6FvS2iZC1K1oq6z/aaLE//Tv9F56jNwuW+Qb/icQbSQGaha7MlfTaeuFiCkuS5tQIJien8hjWlNzylKdnPzC9XQ8qvKvW616vesAhO0iVLmnelg3umlxYwEyun/ebd0wzAQ7AvjE5EKI0sc5unvK4QMnhQBKo0y0z4mLp8c/1uYRa0VhCuG+g9cq4tc6zmFGhe5DSqQJ6PpXJldAq1vLHQ443yJTVHIxeVMIEZzJJqJVdlxOKGTOHV8YDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF0LJF9eC3SlA8EcXYK1jYae93CguqCpPzHlESic4vo=;
 b=YUNF0mW4seoZhL7x78aHqyTnW5SyYjY++o0IZPkrnCFuj2weepGF9xo/OKnsHKqi8az43EHj7cXy2CthhOTtQjnSmhLW7gAEe2R1niJkyOr+cEOGQbjzrNBE60FmTRnkEOaWR1Wy+dIaWJnWkhxXhlDtl65tvn8z7Y6o9Z4FRciP7Tci7ftfG8tPhX5ad8oslDjs0qu0B87BfyZjG++tDqqsvXwNBC3umHsJreXNWmNpn4evenYKgIcKHfFiY+8NAZy4CXx2WzhTYyA8Cu+GZhg/AIIXYPtG5/XkQ09zlhHikT7zPde1KDqfJZuI5xlNP1oDCyZ7n/Czr1gE9F3a0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF0LJF9eC3SlA8EcXYK1jYae93CguqCpPzHlESic4vo=;
 b=LC2ySwY/Ul7YpscOYbRqW+pZetPwNAGUTYywkAtAIuAuBmQjSd75oGRMQSzoO2MW/byL3TPirKgbmK80xaDoJ5c2cW01YiG/47yQbwKvSYvnKpzJ4YhjPVplUDstdCfxMjYPGftWDLCbiGtYsbAJNi+r3HmlIfx4OvLDbjMYh86vnUvd9IkVRgWiyyyjNhzcFmuX3o3pbEahu+wRLCcCtTUdoSqkVXVDrssuv7Sc0OJ62gd+WXwsauhSYWbrPDKS3duN9xEC5aY0Sj9zzlaBR5HMDQypJaxvcAsafatqd0Y0pHQN0FibpcEuFwm5hhK26+I+seG4SdwQhTidWPiIRA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5555.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:476::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Sat, 31 Jan
 2026 15:46:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.006; Sat, 31 Jan 2026
 15:46:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][whinlatter 11/22] expat: patch CVE-2026-24515
Thread-Topic: [OE-core][whinlatter 11/22] expat: patch CVE-2026-24515
Thread-Index: AQHckodxytP2tWXegEOAgepxhfGNhLVsbBiw
Date: Sat, 31 Jan 2026 15:46:07 +0000
Message-ID: 
 <AS1PR10MB569778ACCC8DCAFD92900FE4FD9CA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1769845858.git.yoann.congal@smile.fr>
 <d23dc023e91c3ed1819abf1282cc301c3b05800c.1769845858.git.yoann.congal@smile.fr>
In-Reply-To: 
 <d23dc023e91c3ed1819abf1282cc301c3b05800c.1769845858.git.yoann.congal@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5378dfc3-7c95-4f66-987d-ca1483d228d7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-31T15:45:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5555:EE_
x-ms-office365-filtering-correlation-id: 5cc8cc72-c130-41fb-f223-08de60dfd987
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MDGhpDx8WoFx36DGqm0vVKfKh2jtAxrZyq18Bl5edMPrHIHJ2xBpS3Dl7a42?=
 =?us-ascii?Q?+9rWrhmgN4sOHkHU8uIGsCDWoiIY4cYlBtuz/njt0TidxyQCfgKPa0//S/Xl?=
 =?us-ascii?Q?utEBQ5S0qR2R1nbeANqR7LtRmshrAdLB+/hpxJY12lCAQM1d0DhUiRphd/ZO?=
 =?us-ascii?Q?SqgEwDYRLv8EybzdpT4QTR41E+ScfMVNO8FC0q/G8oJ+nZW+r8Qo5UDL4jLn?=
 =?us-ascii?Q?o8Jelx1YJRU/MFVq9WROsdj4dCXAPDPhYpxcixAeDpq5yz8unVarPJFBYfGN?=
 =?us-ascii?Q?1rXNSwvNJ2sjqUCu2Ehqmact2n77Gz+sv0JAgSG6AKFjfyJN4SAMV2YZE0K3?=
 =?us-ascii?Q?yhfHRKPVzz5u4DOs3RSvUlsRihxMv4dg6bi3gLnuHhv8ipfZFMXAiW7hswiD?=
 =?us-ascii?Q?QBbSSJqILGm/o4+JMRiNtr4CZnrjjzEsbNtjWkPpKlBouNSYwBmvHghe4IUq?=
 =?us-ascii?Q?8TuA5CMINoAZauJwKl0UcKchNMQaWtvu5+0sh9A1/BSUXDCuz1oUGhArvp+O?=
 =?us-ascii?Q?3Qfrwdx0W05oRC0zGyspEAZ4qAk6rBS973R7uaRCIRhHab7zZwyMibZTj3xK?=
 =?us-ascii?Q?5xjOns5obw335Nf+Sv07kDtHsCrgrAfdJIDZH+bZ5mt/MdVlicSvEZDQRRWO?=
 =?us-ascii?Q?awTtu1J5OXaQTktUUt+gQJPraJPMSD3SZnE7hzFLJn8DEA6qVU8diCVo303o?=
 =?us-ascii?Q?2AecVHSIciQwBCEzf0nExeaDWlhXqYXQwecvLJT6fDeEXXl7XX+7blJKbyTe?=
 =?us-ascii?Q?SN/11/KBPvdShAYTW5LCGQI9aFnHUQlVHA6o+yWXUDCkVbd6SSyOZQFcs4eO?=
 =?us-ascii?Q?6x1yNyWWjopwEjt7h/n/AOzViSV2VFCQjwDa/zj/zJ0/KP2iz2fFHp8g3+pd?=
 =?us-ascii?Q?c46fubqQddNjaGE/EmgFBicBGaRNuK2hyj1hmxWhmoIMVXX+GVg1n7OBfRZR?=
 =?us-ascii?Q?LQ5KUGHiGfmDT0eDZYGevJ7YETbDTqDBGK+0u1K5Z2fgNZAexfjo5hETEVW+?=
 =?us-ascii?Q?nrxt12ITCMUSKPymaoimNlBGhF5BJr8JUdyBgqPZSFXsrxJ/cDnhFcRU8qNI?=
 =?us-ascii?Q?ZPBBtnc5vdf9GGyxVSzGATVLXBsKtPOG5sPdtCqZqXRWvYSlhLaLuZjVCp12?=
 =?us-ascii?Q?7Vg8FrBN08WyOrPVPGCWsZSRhv+LpsuvEjFOrSufDasSvUinRfQOgxE4aDWL?=
 =?us-ascii?Q?eK1XuIuUPJDtoVj3BRe3EjSRl3IAAKQg6p7JeMZnGWbuhfTu3NoJWDZ5eHci?=
 =?us-ascii?Q?7ByxavLAZh+7wx7tK/sCHm51QqQI35GtIZS7bKL6GItQbB9v1dV/tP9sPYbT?=
 =?us-ascii?Q?PLPoibGKirXmA7EOaMtzasvV4cRFYdLGA0G4J4WMElpwQJlH+le4fY7kDCrO?=
 =?us-ascii?Q?G7QCldUKlrjYP4dIEQzBlK6H4bH8pvL8wdcNLX5AJKUQ2oqj8RoQcllzx1KI?=
 =?us-ascii?Q?9SpcSCZgawmsP1fhRjznV+KfTwTtl5KBlKIKR4K5KSNDJb+3DKgfONko9HKK?=
 =?us-ascii?Q?S1Nd9Lx/hViUO3v09aHYcBedJ/bgBMMafWmqXgHBUL5Dk+Sp6VebJy+SM6YQ?=
 =?us-ascii?Q?R1exdgjlNR3j+t6ELzej+f1v4a6ynbLGDgmKt7tdsitOJp4nUL4YQ8WQgNHf?=
 =?us-ascii?Q?Jy2iQ0zAmEzI8E4sdbdL6nGXa2cLK1KKKN1DF56+RdmS?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KP5mksL4uPD1VQA92rr4I/FHqoi/CIVlRBwo4Qo7Y05qavaU5oLlmL86xpRa?=
 =?us-ascii?Q?TW98ASd8SftSuqO704jhfXGm11fVt5lmi0ptqSmdGVyARVBzpIo/IzgR4hUu?=
 =?us-ascii?Q?wLNhZIsluk7LKI+Ubrp866U2BZuuVjDJ6mvjM4bpB66AVR55xzKvHN3nR6fj?=
 =?us-ascii?Q?pwHXwV0Q2iKr6oH1rsbp03U7bWMoYWXYxX1C5vi3UtFKQAmaewTBSRCIji+d?=
 =?us-ascii?Q?f8ar09N9uTWcLwpyYuFgs+Tyq4mGt7pTuW3uBYCkC77dfCHDynW09klzKJQ8?=
 =?us-ascii?Q?at3XzIg+v2unFPgv9k+44YLjdOXS+2nomn2ehgsypDCMXNgjbeODmZh3WH1L?=
 =?us-ascii?Q?+5xnqW1zitPaNnaWT0fFtft3AChqXXQ6qD2Dprkm923fciLxxTtcx4Xe6grw?=
 =?us-ascii?Q?gZEEypTrJNJEH4E8XA7bL2SAGN3p8vaOzPkPiSYll5CpX3NHae/5zqg72CrK?=
 =?us-ascii?Q?jm6IYNR1f0QdpFNI4dCOEUSn0cLFAl0FKHtbvky+CrFP6elcx+jK6y89s0xt?=
 =?us-ascii?Q?00B7w3BQzAi2JCSQcSQ9JA+srOSBehMgFWSGU+b9i7oftkFTH2d2zdBkXNzi?=
 =?us-ascii?Q?GtFtgnfFMwKbbLxucgXIEGlQNTn1DHFh0AdfJQznTKcMDgNTZIgjars4en+4?=
 =?us-ascii?Q?ofFvvqLg4kNsOrk1mZuPE9IkPNKegjfehD879ha92euQfbwpbzh4ww7uq6tG?=
 =?us-ascii?Q?wvLQP7xjZLkI8EuoqnGZiuWmaOzw6KN0ymc89GQUqlkpBU1ZPxRj4lYy9PrE?=
 =?us-ascii?Q?PPpnRWCTbVjj7vLVfuanulNvB9D8HfsZr1sGHdxtAJzVko7zBtAUUN8/88FL?=
 =?us-ascii?Q?kCxwnRVioma8XZzCSNbIAsGE8OAYedYqNYOZw2bHGgXWCnSs+JPBlwvHEzwT?=
 =?us-ascii?Q?fXB2GJy1ePevhSmZfJs1OTRBi8TPu71NxwbZmemqzxkwEdayoRganZSGrANT?=
 =?us-ascii?Q?pHA/nbMhHoUK1fS5co0MqdsfZz91yBxC4WDy1nd1ZGddOPVTD6kDOKYMptkv?=
 =?us-ascii?Q?MPky3fBT4ZaRpqZ4VTQ51rJLGRT33opOsEEVJOS7rCZ/SFlnOlF+kb0/cKaS?=
 =?us-ascii?Q?qGZO/phyroFtfQDnvnH8bRl12W4qPX2u6P3mInOHCx2ySYgjKZqPr/YM7u+4?=
 =?us-ascii?Q?Lcdbb9LpB/pYobLNvvSuoACTMx/J4oFT5XGWJiDvhwAoBYhHxKHkMNsFr1ba?=
 =?us-ascii?Q?l3O/EB3HXNZbDJ1B2CbKhVg7LOF4m59bvBpjWkbJeuyqw748xnrsgMyU+zCK?=
 =?us-ascii?Q?mWP3zh9vJePxkrALll4X+wD7L79X6ieWuT3Nq//t96I43vzGgdGaciML8eAi?=
 =?us-ascii?Q?75JH+vLwwi0a1EOBOXLRJAIIcV5d7xOJplDtBnsmuzuvCsAHQyPB+0acXfgb?=
 =?us-ascii?Q?DR97FmD2yQw3z7K6hg5cEL2toxjxiVmyq2M3EHn//tCG8AaFpqXlASO/wPmX?=
 =?us-ascii?Q?NPHVuCFzwu8IHqakkHvhlbRSTlsdNaGdXrny1Rhm4NZ3luCDE61wsYRng1gU?=
 =?us-ascii?Q?R3YfsVMzafs/q5dJKkplUpdgjVGK0iUswBXHdwqahsRfTp6+t7ep6+eTuKIW?=
 =?us-ascii?Q?3FYRbZhQsoG+08jhzLlV3OQQzD0yt5V+RtknZUZCMMpKsTsdGE4aEj4OYSO/?=
 =?us-ascii?Q?DNhswXk0Yq1nW7Q+ULkdIubHkqGslQ6u8kGcmOGSdh9jmaSmPQnLm5gHdvyV?=
 =?us-ascii?Q?LQ+UiDBGdkjLwNMo+ZKw0iaSG00SeMozgQVgsQZMF6FhNqqUxXoGYiSvnGdE?=
 =?us-ascii?Q?PKpQq8HUJw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc8cc72-c130-41fb-f223-08de60dfd987
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 15:46:07.5946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re6c8RCNC1C+E7dnLpaBEg4A7qGNI+vc5FubZDEAHlu2102AOJJtZPEfd+jBpdhZDcmyDR+VYXQkzQznRYdl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5555
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 15:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230243

There was new release of expat today and I have sent an upgrade (including =
2 CVEs) instead of this CVE patch.
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yoann Congal via
> lists.openembedded.org
> Sent: Saturday, January 31, 2026 8:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][whinlatter 11/22] expat: patch CVE-2026-24515
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick commits from PR linked in NVD report.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../expat/expat/CVE-2026-24515-01.patch       |  43 +++++++
>  .../expat/expat/CVE-2026-24515-02.patch       | 117 ++++++++++++++++++
>  meta/recipes-core/expat/expat_2.7.3.bb        |   2 +
>  3 files changed, 162 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
>=20
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
> b/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
> new file mode 100644
> index 00000000000..c61e49aefdd
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
> @@ -0,0 +1,43 @@
> +From 86fc914a7acc49246d5fde0ab6ed97eb8a0f15f9 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 18 Jan 2026 17:53:37 +0100
> +Subject: [PATCH] lib: Make XML_ExternalEntityParserCreate copy unknown
> + encoding handler user data
> +
> +Patch suggested by Artiphishell Inc.
> +
> +CVE: CVE-2026-24515
> +Upstream-Status: Backport
> [https://github.com/libexpat/libexpat/commit/86fc914a7acc49246d5fde0ab6ed=
97eb
> 8a0f15f9]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + expat/lib/xmlparse.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 593cd90d..18577ee3 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -1754,6 +1754,7 @@ XML_ExternalEntityParserCreate(XML_Parser
> oldParser, const XML_Char *context,
> +   XML_ExternalEntityRefHandler oldExternalEntityRefHandler;
> +   XML_SkippedEntityHandler oldSkippedEntityHandler;
> +   XML_UnknownEncodingHandler oldUnknownEncodingHandler;
> ++  void *oldUnknownEncodingHandlerData;
> +   XML_ElementDeclHandler oldElementDeclHandler;
> +   XML_AttlistDeclHandler oldAttlistDeclHandler;
> +   XML_EntityDeclHandler oldEntityDeclHandler;
> +@@ -1799,6 +1800,7 @@ XML_ExternalEntityParserCreate(XML_Parser
> oldParser, const XML_Char *context,
> +   oldExternalEntityRefHandler =3D parser->m_externalEntityRefHandler;
> +   oldSkippedEntityHandler =3D parser->m_skippedEntityHandler;
> +   oldUnknownEncodingHandler =3D parser->m_unknownEncodingHandler;
> ++  oldUnknownEncodingHandlerData =3D parser-
> >m_unknownEncodingHandlerData;
> +   oldElementDeclHandler =3D parser->m_elementDeclHandler;
> +   oldAttlistDeclHandler =3D parser->m_attlistDeclHandler;
> +   oldEntityDeclHandler =3D parser->m_entityDeclHandler;
> +@@ -1859,6 +1861,7 @@ XML_ExternalEntityParserCreate(XML_Parser
> oldParser, const XML_Char *context,
> +   parser->m_externalEntityRefHandler =3D oldExternalEntityRefHandler;
> +   parser->m_skippedEntityHandler =3D oldSkippedEntityHandler;
> +   parser->m_unknownEncodingHandler =3D oldUnknownEncodingHandler;
> ++  parser->m_unknownEncodingHandlerData =3D
> oldUnknownEncodingHandlerData;
> +   parser->m_elementDeclHandler =3D oldElementDeclHandler;
> +   parser->m_attlistDeclHandler =3D oldAttlistDeclHandler;
> +   parser->m_entityDeclHandler =3D oldEntityDeclHandler;
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
> b/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
> new file mode 100644
> index 00000000000..b160f4f343e
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
> @@ -0,0 +1,117 @@
> +From 8efea3e255d55c7e0a5b70b226f4652ab00e1a27 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 18 Jan 2026 17:26:31 +0100
> +Subject: [PATCH] tests: Cover effect of XML_SetUnknownEncodingHandler us=
er
> + data
> +
> +CVE: CVE-2026-24515
> +Upstream-Status: Backport
> [https://github.com/libexpat/libexpat/commit/8efea3e255d55c7e0a5b70b226f4=
652a
> b00e1a27]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + tests/basic_tests.c | 42 +++++++++++++++++++++++++++++++++++++++
> + tests/handlers.c    | 10 ++++++++++
> + tests/handlers.h    |  3 +++
> + 3 files changed, 55 insertions(+)
> +
> +diff --git a/tests/basic_tests.c b/tests/basic_tests.c
> +index 0231e094..0ed98d86 100644
> +--- a/tests/basic_tests.c
> ++++ b/tests/basic_tests.c
> +@@ -4570,6 +4570,46 @@
> START_TEST(test_unknown_encoding_invalid_attr_value) {
> + }
> + END_TEST
> +
> ++START_TEST(test_unknown_encoding_user_data_primary) {
> ++  // This test is based on ideas contributed by Artiphishell Inc.
> ++  const char *const text =3D "<?xml version=3D'1.0' encoding=3D'x-unk'?=
>\n"
> ++                           "<root />\n";
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  XML_SetUnknownEncodingHandler(parser,
> ++                                user_data_checking_unknown_encoding_han=
dler,
> ++                                (void *)(intptr_t)0xC0FFEE);
> ++
> ++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text),
> XML_TRUE)
> ++              =3D=3D XML_STATUS_OK);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_unknown_encoding_user_data_secondary) {
> ++  // This test is based on ideas contributed by Artiphishell Inc.
> ++  const char *const text_main =3D "<!DOCTYPE r [\n"
> ++                                "  <!ENTITY ext SYSTEM 'ext.ent'>\n"
> ++                                "]>\n"
> ++                                "<r>&ext;</r>\n";
> ++  const char *const text_external =3D "<?xml version=3D'1.0' encoding=
=3D'x-unk'?>\n"
> ++                                    "<e>data</e>";
> ++  ExtTest2 test_data =3D {text_external, (int)strlen(text_external), NU=
LL, NULL};
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  XML_SetExternalEntityRefHandler(parser, external_entity_loader2);
> ++  XML_SetUnknownEncodingHandler(parser,
> ++                                user_data_checking_unknown_encoding_han=
dler,
> ++                                (void *)(intptr_t)0xC0FFEE);
> ++  XML_SetUserData(parser, &test_data);
> ++
> ++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text_main,
> (int)strlen(text_main),
> ++                                      XML_TRUE)
> ++              =3D=3D XML_STATUS_OK);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> + /* Test an external entity parser set to use latin-1 detects UTF-16
> +  * BOMs correctly.
> +  */
> +@@ -6416,6 +6456,8 @@ make_basic_test_case(Suite *s) {
> +   tcase_add_test(tc_basic, test_unknown_encoding_invalid_surrogate);
> +   tcase_add_test(tc_basic, test_unknown_encoding_invalid_high);
> +   tcase_add_test(tc_basic, test_unknown_encoding_invalid_attr_value);
> ++  tcase_add_test(tc_basic, test_unknown_encoding_user_data_primary);
> ++  tcase_add_test(tc_basic, test_unknown_encoding_user_data_secondary);
> +   tcase_add_test__if_xml_ge(tc_basic, test_ext_entity_latin1_utf16le_bo=
m);
> +   tcase_add_test__if_xml_ge(tc_basic, test_ext_entity_latin1_utf16be_bo=
m);
> +   tcase_add_test__if_xml_ge(tc_basic, test_ext_entity_latin1_utf16le_bo=
m2);
> +diff --git a/tests/handlers.c b/tests/handlers.c
> +index 5bca2b1f..d077f688 100644
> +--- a/tests/handlers.c
> ++++ b/tests/handlers.c
> +@@ -45,6 +45,7 @@
> + #  undef NDEBUG /* because test suite relies on assert(...) at the mome=
nt */
> + #endif
> +
> ++#include <stdint.h>
> + #include <stdio.h>
> + #include <string.h>
> + #include <assert.h>
> +@@ -407,6 +408,15 @@ long_encoding_handler(void *userData, const
> XML_Char *encoding,
> +   return XML_STATUS_OK;
> + }
> +
> ++int XMLCALL
> ++user_data_checking_unknown_encoding_handler(void *userData,
> ++                                            const XML_Char *encoding,
> ++                                            XML_Encoding *info) {
> ++  const intptr_t number =3D (intptr_t)userData;
> ++  assert_true(number =3D=3D 0xC0FFEE);
> ++  return long_encoding_handler(userData, encoding, info);
> ++}
> ++
> + /* External Entity Handlers */
> +
> + int XMLCALL
> +diff --git a/tests/handlers.h b/tests/handlers.h
> +index fa6267fb..915040e5 100644
> +--- a/tests/handlers.h
> ++++ b/tests/handlers.h
> +@@ -159,6 +159,9 @@ extern int XMLCALL long_encoding_handler(void
> *userData,
> +                                          const XML_Char *encoding,
> +                                          XML_Encoding *info);
> +
> ++extern int XMLCALL user_data_checking_unknown_encoding_handler(
> ++    void *userData, const XML_Char *encoding, XML_Encoding *info);
> ++
> + /* External Entity Handlers */
> +
> + typedef struct ExtOption {
> diff --git a/meta/recipes-core/expat/expat_2.7.3.bb b/meta/recipes-
> core/expat/expat_2.7.3.bb
> index 069254e13c3..12ca9b004d2 100644
> --- a/meta/recipes-core/expat/expat_2.7.3.bb
> +++ b/meta/recipes-core/expat/expat_2.7.3.bb
> @@ -10,6 +10,8 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
>=20
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-
> ${PV}.tar.bz2  \
>             file://run-ptest \
> +           file://CVE-2026-24515-01.patch \
> +           file://CVE-2026-24515-02.patch \
>             "
>=20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"

