Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E75BC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 01:54:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.11442.1717466062342781867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 18:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=nuM0yPFh;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717466063; x=1749002063;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=r3RIT6TaIezyGWv9acHlOqNI9v9Bw/Tz9g9KOU0m9Q0=;
  b=nuM0yPFhZ8JOkX5AUahb9ZE4LxmIR59P5tlzLqobqFpEPC93c9/YJsNm
   k8tKFODy2P4pa6SrZ74bS8N1XL1f5VhEjqw3IjLaMxAXbflG3mzIsvGOS
   gpp+f2UyJ2Pn37+SHpU8ldvTM2ONH9uKgQs+Lu+hAmwvjHZOHqr8Ucov/
   Bh6DaezhxzUI4mzJFH2UOugRroQ4xOmoqwq4bVFBdhNkvPVy1lv/0WwgC
   3zCaF7i01zi62QldImkrAhxsRnACchIX01iQqBrlboROxiZa4wmzxx17i
   HRbjvUxh2P5iTE4T/zX53NZ4/OUzZiStDXSGzqScKubbBHJeu5TYJs2ZH
   g==;
X-CSE-ConnectionGUID: gpGCXOe2Tc6zPeVRQT0EOA==
X-CSE-MsgGUID: Y2sEWDmFRQS5+X+ze2IZ8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13933886"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13933886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:54:22 -0700
X-CSE-ConnectionGUID: Qj4rma5USQyJRAdAJz+UZQ==
X-CSE-MsgGUID: CGz4oKtERduOr4PIXg07Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37185535"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 18:54:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:54:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:54:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 18:54:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 18:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZncThSnpvOIVh9mTmWdAo+nS/wPYiH5s2rLRRCooYKwpL52aF2M5S2HOZgVyYeSdc7BhGwoyzvyUBZJTFxgrrNQX/MbuuM18Wnk81l+mU2zHYIohBxQHsYd3gv3658HRqqjKraQig0YcHPj2EbkF+KARtU1p286ikglDq4jxlzaVf/ct3zGUC67i8nasfgCQOJadNaGragRr/jU4zGm/oqi+PTMmI0IkUrCgmEHTqfRwIwA8YCk+jjR7iiONXXlnMEes4C2jjt73cKApbXvJ/NyXsEz5RbXjtk6JKBOI6EAZ1R2rzDODkHg09qxvFVGGM43DVVvJGJqAICZVyWCUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdB7+/o7hXXnDkhmmnB06yJ+Btxvo6Zjdh4NdWd+Mrc=;
 b=erb2Uid6avtCsSB2HuvarZc7RU4dU+1N9qCYyCMJlNFWb3tzqP6e5Son/euNmSr3r7/Ip6valVWIdIG0joOqbVGXlj7M/lLfsHlWgM5z03y8PlFnrchr9P8Zcxu/WYCK4ZaZBoMzbuSkoDF2jxpLYLpsrDhxsBIq04v/CbVotAhttn2GckCrO+clqR2QIDkvAKtVrI2betzoxfT4j+CsgWcGdA75UF8Vo7ssrlqVReCeKstwOmC8MVpkpzUYIn3gtTnkFXU7HM39/tY57UmhVVIM7ei0mYfHsRU4t5PolI7t1aDbuoqjk27JbhSqiKWSRg/2S1DjkxcU0eCLEE7CKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA0PR11MB8334.namprd11.prod.outlook.com (2603:10b6:208:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 01:54:18 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 01:54:18 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.19.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.19.rc1)
Thread-Index: AQHatUttcdI60NhUhUKC4S70AbiajrG22OZA
Date: Tue, 4 Jun 2024 01:54:18 +0000
Message-ID: <DM4PR11MB7760E7E32B34BD33E9779C1AA1F82@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018fdb752dcc-d3076ef9-329f-4d77-b545-d13c54e3282c-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fdb752dcc-d3076ef9-329f-4d77-b545-d13c54e3282c-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA0PR11MB8334:EE_
x-ms-office365-filtering-correlation-id: b1a3d688-f1f7-4cf4-afdd-08dc84393f35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?ptwfGM2gB3ChAeO6HakhSpCGmtgaWcMdphhJBYtATGmJRxaLlLkBvUkstVW0?=
 =?us-ascii?Q?I7ewMMSuTaY4FEvH9oAttxiTbFj7mCkoZnqOkK8HwwY52pSPEBbnyOqHGggW?=
 =?us-ascii?Q?ZciOtSSWk8lMyfds85+suHBY6hGXSBXk74RuDJ/6iJYSJwcvYMw/+tyv/cRa?=
 =?us-ascii?Q?lq2yjCgxULkmRnr46bRhzYeysgTz2KFskq372BVvHuMMwrzfNcG+Uk07F/mc?=
 =?us-ascii?Q?7yET/W57LoyYZ9QP7A9daIgyl2jRFKGQzWlU8tJIPIuq1s2Kd6rDrA+UD/P2?=
 =?us-ascii?Q?2iVl9wqMrcMoUYTfoyOM4QDUXVvvfkRV2ubeYEgI0KJ0TzJlSWER6z9CoLBN?=
 =?us-ascii?Q?S2WcrfxhbRWFtM6bXAS7EU7eC/4cIoZGXtnFsLFKxsoFqWYGQgXwi4rr4ZIu?=
 =?us-ascii?Q?Ngk/BPjgu/8vBOpfgEx4JfkznckacCmanrF2wfZaO8V8W6x0k3gUNAF1BvCd?=
 =?us-ascii?Q?Q8A0TNj3VlBWtMV5CS8nlbCZQmS7hY7r/1T/tJrLeilZ66g1N/270wV/+c1a?=
 =?us-ascii?Q?txXP+NO4aQlnJd5AghxCBp9FTLSvx/f7duiTJahtVbjXsAEMD9KhodOP4TiW?=
 =?us-ascii?Q?Hn4dtVJ06d/A0WJXVuCPLllH3C4iIy7o8jBx86T8aokpPzLbqH/YfbubIyA1?=
 =?us-ascii?Q?GB37JDXJxlNt2XFRKPMgk6OHtdF5mUvSLrJrEr2b/f1NhXb7faIUmlMfNS8w?=
 =?us-ascii?Q?o32ei7XqtChjJgLYmVzac+Av7GYOPn6qx26OzIDTyIF6RLYhkzyURiCKX5Qg?=
 =?us-ascii?Q?oXrVaC/IlYKIHQM7hmU83I0iCOUgJdRlXoGRsb/9FmpSFJ6ahq2UkOXKBu88?=
 =?us-ascii?Q?ThLYAwgS6WqTaD/Jml5/gvtUIh/PWFBQRfimOiZFoYwrDbPe4ahz2QZl9dSG?=
 =?us-ascii?Q?vU9DWIxL86Xrvz4qX9vgj5KWV9z5ua/qJ0go5ytveyfyJvRKMe5TZXmeaL6H?=
 =?us-ascii?Q?bvigV9ucfDtTUws9UhRMBPdyuH6WABprrd2jnmu4tNfTJu18jdS+pEYnzgAr?=
 =?us-ascii?Q?pRLL5G9MJF6GeMOjm9tSiiBqC56VPcFbSlMtioF8xn+PlYL4DwBRHcrBh6dK?=
 =?us-ascii?Q?pnoQoVPuhYGZWEEqo+Vsfm9bdBmbnbLXT0U55kW8YC2iYs4E8x2UWTD2TUQa?=
 =?us-ascii?Q?Fx2ciC+xkRCwAb1Oo3KarSUJyeYLGTuU607smif+gcAIIDPYzBEfL53awGey?=
 =?us-ascii?Q?69tlBF3Y3kx/TRqF/mDchR2l897DCTpOAUibuSNiZpfjYMWIqRtVuFMW3oXT?=
 =?us-ascii?Q?lv3IFVppumKWRax8qRfYg4ZuVCanESm47krOm+HQvkwG2uH8pkKvkE+4G69r?=
 =?us-ascii?Q?Iw0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pm4Q1CrLIPdCGwX5FVt3a49f/pIlDE3K0yRoE1Ks4soSdnkMGCuhA3HPuDw1?=
 =?us-ascii?Q?JWGX0F2Zju4dZjDGACgZJriPWXoJOjZkmoR0QT6fWjDrur1OdNVDyqWzbMEE?=
 =?us-ascii?Q?O9YEsJiR2YZQT5f5pFKK30wN7a1CrGZK0zMCgPr9uk6XXglOUFG8bLP/GGLh?=
 =?us-ascii?Q?3g8DQwe2/q+8ctkr5AolLW5fIRGcE/DUAl3dGQap/gliW+UMrBa4MKaYxIdh?=
 =?us-ascii?Q?QhDx5UVqgWnK7y18Gp8Jeohdkzyb9Dr6JS2MPLshmxaXv5zJZVc7Y+7XP0dD?=
 =?us-ascii?Q?EeAUQ2ue/ScZC1YDINpTmoHGqg6a51sqcx4T9JRI1XYIYF9HSvgq1A9Y6m3J?=
 =?us-ascii?Q?n7nzMUChjNrkFw3F7U2pd+4CE/Luan/kI0aDvm7yNqXv7HaXgTTzoyDRNIF+?=
 =?us-ascii?Q?UJ+j0ClBbnXy5uzBqdvYQAVISuDAOotqEvfAcovtnSaHPuXas2fMO7FMzBUr?=
 =?us-ascii?Q?Ykxho+CpNyJXnepD2MaJD9woBVHrSAGXo1f8Fv6ny9Jp6dQjGsLCiY2vtXzH?=
 =?us-ascii?Q?aFELjfjnw3jPbyMxy+1grCFxQw2y8s+CnBMhTVddcx9kHDwqZkBVS26Kq+48?=
 =?us-ascii?Q?veuwButcTJm/9HfPMddwJvquzOKFzvQ3esbzhXdhXXxR2bRzf/qDe1JyL2ap?=
 =?us-ascii?Q?Zk5rGKeCzeMyLQrnlPXK+NJOfaTozetU+6XsMbJ4YWnQgqq2eAKKsyM28ja+?=
 =?us-ascii?Q?mmlTXOqwQlF7zFOotrq2EZyyU9t243Cb/LWyE0DuU2Bn5HfmHBFjVWRpnGe6?=
 =?us-ascii?Q?THf9u2TSmns9TIRCF3twPolG28NC9EpMCyMu0ue7icQlS+GVQi1a2V2vM8l1?=
 =?us-ascii?Q?ZoxRvfA5GuNHclDQSoPDHeVAJWbbg6MGuiAQvh5qZ5cXK09H/aSaOnFTJ0CC?=
 =?us-ascii?Q?5cKnubhzqh/y40+ihC0wEFW/JysYKLWDUQgnlyONPTBAZ9Jgt4HQzQVi7FRM?=
 =?us-ascii?Q?1p0Yu+Z/Ri4Ae1I3gOZowg1DcoSZRC5W83a88QXmP1noYVyNHcRScExKMvTb?=
 =?us-ascii?Q?KHZrIhsxq+rCZ/j9xvCWUdT+JKOBzQRwIubgCKo9juKXleeurNQTfPsq8osz?=
 =?us-ascii?Q?ggHGFiv8zLaHVqMBWWoAsW3fU9BBBZh7QLU48JRy7/MYAplljn46OfK0sk+S?=
 =?us-ascii?Q?JPOI4U/NNg9+Vh7B4C52IbxO4s89dvzrSCITyOubLyK2oLh/OOlKgIt6satG?=
 =?us-ascii?Q?YyfbuS6LDZtmIa3D0DImosUqMbHUFJLdPYRVV0JHGPAqh4kAwkuNWZYlSusO?=
 =?us-ascii?Q?OcusCKCNlGolqrVbzy3c/Mke20+p4+B78u6tvA0zAqyosPGREiaGYnGSpUkr?=
 =?us-ascii?Q?xCg/QY8pkNry+/5fxcP3+lKXiQOt1QF+QZzu2YSxCkT3+Ij9y8GcS0wxAmwk?=
 =?us-ascii?Q?vyCDMg9yUoygAAgu8ZaDqC60AB5rFgA0CmPWl99QxBDhXemZwndVvuIdTC2t?=
 =?us-ascii?Q?Htp7tjJqwC6en/qaWY3TwtRVDP2m5Qz4cT3CwtzML3GizeuCMyaqJUmXMFn6?=
 =?us-ascii?Q?obbcnDfOuCA8xAzwxxsgPzsJKw88DyEXhgE2nuVh2ypSzZI+P+qxKGGLdNAM?=
 =?us-ascii?Q?tzcgONP4S0gscthw6ltc65ctOI5tf9xYk95krwBI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a3d688-f1f7-4cf4-afdd-08dc84393f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 01:54:18.7812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NfN4iiq/friJTbfjVrGBzgoh9ZdvuoFv0co2DRLiTIBx8O5dhVxgElivA8cWSWyz9ikfINdKcc9/H1wXVYoVBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8334
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:54:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200288

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.19.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion Friday, 7 June 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, June 3, 2024 8:17 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.19.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.19.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.19.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7000
>=20
> Build hash information:
>=20
> bitbake: 5a90927f31c4f9fccbe5d9d07d08e6e69485baa8
> meta-agl: cf2cc9392b12466fb3bd72eb9171577c4b2d24e3
> meta-arm: 260e3adc2bf322f52d81c0642c825088a88bb051
> meta-aws: edb80a35af5e68a5ed6db31a61d9ad7a2350c39b
> meta-clang: ce7d354da7a498f90ba260c006d29a4d23e3b4f7
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: bb7c7b0f448ab6541ab42a316dfeff1f7726252f
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 0560b848996a0feb410a8cd8ca07c60fe2f3b5bc
> meta-virtualization: 8b356b91ed0d4bcab72350a2ddcef880f4fa5c26
> oecore: ab2649ef6c83f0ae7cac554a72e6bea4dcda0e99
> poky: e139e9d0ce343ba77a09601a976c92acd562c9df
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#435): https://lists.yoctoproject.org/g/qa-build-
> notification/message/435
> Mute This Topic: https://lists.yoctoproject.org/mt/106453670/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


