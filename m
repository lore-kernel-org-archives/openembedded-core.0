Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782B3C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 08:56:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web10.16288.1752828981832279995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 01:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FU8tRrRi;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752828982; x=1784364982;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NuF1oub0qjNhf6xEtN18XGJGfsrVnU3vJMCpBoecrX0=;
  b=FU8tRrRiyK3z1hYzlQ+ZokRQ7jRHG7gk8Z6mUmKF2cHLdS5AbmuwCiEg
   p49sveaSu8sn5co2onklU3LipNvyDMYnBxHgjdfCLkCDxAEClwn+3Iny9
   4ItxWqp5sv9vLfhTWaPUJtkK9WZa22cOI4/IUYWZlxjV4oH2Fqc9Oj/CN
   3W6znMthMmd15Mw2BW//F1uXy8u6HTkshuFdqeM+vP3u6oxgkGAxBMCKh
   UlIBu2zWogFRmzkemN6Lf3bCs/t2tDcR4B5YFfjdQZdM72x3zBF+rk4L8
   sAiNXN0LAKuj0XMWzzGSvv0vpmxbgwb/eTvuWS0UYI8kKuH60FjY86ACX
   Q==;
X-CSE-ConnectionGUID: 0T5k/+QhTzedZDtiqaHhdQ==
X-CSE-MsgGUID: 7bQu3gJGQyemIyb+04DvRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55083151"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="55083151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:56:21 -0700
X-CSE-ConnectionGUID: d3tUemcqQPSycdld/yTG7g==
X-CSE-MsgGUID: RieXS7HlRSCb3tFXyN9j8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="163634682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:56:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:56:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:56:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 18 Jul 2025 01:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yji2ZpVJ1qFxFBnRK34AXEEy0gRaYXUTwuv+ODZXpsf2nYbpr61p0L0zUoRD0N3pC3abBIBIbk6B0DzFTZUaYF3Ibv73Ah1GJdYYbLJubhEsLdd280vQmFg+XO5ph3dKEU8mHiQLnUuS/MqTfdjVcMHYydTeOTwcXZWyS4uiRCmHG52lHcsh1WZG15hm4f2MIvZNqDvqU22c/JeAcFbr+skN5FgiXs02PTmATnun+zB384b7sf9/xnCTEHhuzuxaCcBw4HW1Vk6S22uQejriST5BhdmX3V4df7bUkVOv3eeDKJsYSnK+TDn8x5NWioNhXRIEDvZkNCwsg8z/XT8/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ln0dmln+18UwViH5SyKOsFUtWtDpugxNz5Kj+2Fons=;
 b=OfiQebyQjqmpqkEjIvw9/CxE03Kh7V5Wyo7ftPd6DKUQxyr994ZAZwVLqe1j66VUpwy5+bJVDS0xXzu2r3BuBe1QlX6Ef+1XWZoF38A/sx1E7toS5Hfsdk5fYTMlmHfc6tU2DNHsYXAbkQW9uz7d+AlnbVQUsZ4Ae6TIP/6HqNxd1FVUmTWTJZAE8OKNevZp8wdRNmkMt7GosTf7AJ/Z1xjEk8HMpZdR+u1aGN4TyESIdOd+3VSefthsi7VfmoZvsGXk4htK38hMPWngBW9L+kPWXIR3u3wRCxSIU5Wa4FXKyEt3H0YGklZhLCYcMKo6Cz1B7GXXlwpOWvvFwfp6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SN7PR11MB6773.namprd11.prod.outlook.com (2603:10b6:806:266::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:56:18 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:56:18 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.11.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.11.rc1)
Thread-Index: AQHb8qMDBgu5lsgvhkid62so/8uazLQ3njfA
Date: Fri, 18 Jul 2025 08:56:17 +0000
Message-ID: <DM4PR11MB77604B3606B87F5B4FF571E0A150A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197fb30e9d5-ef39166e-58fd-4885-a2c0-93efc95705c6-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197fb30e9d5-ef39166e-58fd-4885-a2c0-93efc95705c6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SN7PR11MB6773:EE_
x-ms-office365-filtering-correlation-id: ea5668ad-c33c-41ce-5fb3-08ddc5d8f58f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?7BWnW2C+mavRNVUn7zg70HjV4XMOMk567QezMyZS/ll0o1bUj9v9e8c/Yq2X?=
 =?us-ascii?Q?mB6QbMNC2n+4ObQIfrOZ/DIZIYKlLQNHtwy3AKXJ3ins/WUr12//rqoUMhP3?=
 =?us-ascii?Q?FWOSTV340vKTk5RbQJwQ28HBmNS1sp8wKYhyr5QYZ5XMfjaYolTkh/NvnFZ+?=
 =?us-ascii?Q?uObjqJxO1vNQJkBuvWRBADOfpL4ihOsrVEs/eQAFusgfuX+T2xkJtHlOL+6B?=
 =?us-ascii?Q?R33uPw/U12DdYWwPTgB2+kfjAo5g47UqLtGxSK9UWzP8uiq6Zwtqw5E+LsyB?=
 =?us-ascii?Q?JPsGQa2W+XEjqj52y5NT6hlyCRGHGYWtxd56nqsUZxRFfA3Dc6iWvFGEhCy7?=
 =?us-ascii?Q?fvKDg5bV6+uH7tdP6cmSVH2JodDmEl0VYVQ4Rut09UkW9KacqVpWxL/pkr/B?=
 =?us-ascii?Q?gE+galudARglJtww63MCNonjgWUkFDPtH4nRNm2Q0et72BKQ9D9TVlVeOC61?=
 =?us-ascii?Q?arWFimK0a9SMACnc4bD/wFMf+lIjbqOKy8i6x718j3oAT295Xe7fG/udzfI1?=
 =?us-ascii?Q?rcow4hQsxNyWGl4+A7O/SONmxTROwa1O6veWK3PtmYrP50gezswT/JCrwg3D?=
 =?us-ascii?Q?x20uWjuFMWKmJK09ZFIPvxWoNn4P84Foyl2IFuhmaR1nT31IK88mHA+5PpP9?=
 =?us-ascii?Q?vSNZ4SUmtcPJ/9pbM0DTNv21NMxSW0+EQuBhZEr3bikalXZoOtDcRlONmaqz?=
 =?us-ascii?Q?6kTZmdw7QQs7KbI+rhQbz/GMqgnqEJyH11R7CwVFaVaB99sw+Hrv7eJcr1uz?=
 =?us-ascii?Q?vN2oxyLFsOApLPUURLNWj5Xum4SzwAysG6eWyt359ynAb0i8FmbVtyKfQmQB?=
 =?us-ascii?Q?b9/H1y1dTkrVHnqnXb0eK1LWBzgjLdgQvbirFdfdtUH7jcEMZNZwj3/zUT2n?=
 =?us-ascii?Q?rcPo3MQdte2N2ooYt11daIYM/qCdO0Er4/KeMJAwokjDu1cwargl012DEjYO?=
 =?us-ascii?Q?Xupx8qXG1Rcb6tHtiQlwtw6umgRC1bqzWsB2pKZZB3nWXp1erwW9UWZGbKDm?=
 =?us-ascii?Q?CdOWIVeg1SiDZVK+wlL4Bj6GRrMoJn0R3loe6dJhZXIweAThY/HNHVo95EGM?=
 =?us-ascii?Q?OnFGkleEOsVlDrt6bilbVdhi5+eSuLDH7ZvvDH8FGWbHTzV/Fcno0/MmYvHY?=
 =?us-ascii?Q?6pjyZE2ZT3fVoR8VkcXxhswyR4+XWipjscUnHUg3QrGogL+so+MWe5p0gM7y?=
 =?us-ascii?Q?3mgnaShUh9T9bVTgNf+q11dwAOwEz1lWUmJlin5jO/SMEvBBNOE+ftwim+zg?=
 =?us-ascii?Q?6TdrodzTVPA1GZ7lSSHIzClwyri2Wd+qY7t7U5Ym/NwMa4Ba4R0//1oBEGPZ?=
 =?us-ascii?Q?Ew9MjQA5iNVR1NJZQTvKqR1M1VAdwDtdMe6kU+7XbZ6vDC3apjaX+xH00iV+?=
 =?us-ascii?Q?l9bT0zdepFZtbra1X7QQreAGV31QyDqLPnoxxuR9eK0cNdnZF6iSg5FLtdg6?=
 =?us-ascii?Q?J1cpwMe72ZQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VxYAlBCEOWIEYCQfZwcot9xmBzy5RT83LKG4y6h4gbgKl457C1KRzT3hAn8w?=
 =?us-ascii?Q?bScl6eFWfKjhOt9Yr04dobx9BAxcqAlbu7AmPtI8jZy8TwpY3/okePOfQPi0?=
 =?us-ascii?Q?a3mR9jJrGfu7+bwL+z1TzPnwMO+LezuNazA94Cs0H/EWcu1d19jHNSYq+Lrc?=
 =?us-ascii?Q?pjFgZZcGX/GiWR674KC8UazdORTu5tVv/Ppdkvfvc73ddPP7B8i5nbbHOzmk?=
 =?us-ascii?Q?kmM2HcQKOeBdT8TPSVSexKOLZCbtWXFlWKEsv44ZpBSze/hUAOKhS1dp33Ym?=
 =?us-ascii?Q?EWnjCRJZZmc4MD/vzWar6xr+xe5fRj1CKC9XU+RY/N7Vq+p0VnC/2CBZJLEd?=
 =?us-ascii?Q?zeC1Jo/532jcIDOI33pwpMlqVtDzK1UfQP/uPzZsiu5OIOk3Bo/0F5yAT4ca?=
 =?us-ascii?Q?68MT6CMXBiioabNEVNljxw5hWF+87c+4mPP2FmfysKCjhyXZzkLfGWPkiYcf?=
 =?us-ascii?Q?gC7ASr9/x0p0G8t04Co4FTQ4rGz+bMbYsybnkQgzYlhEw7XJMFnUeD9d08M+?=
 =?us-ascii?Q?TxGuktFwgT685MHO7HcGwU4nwLTrnAX3mOZgKT+EX2EvT9nyWs2S225GPkhZ?=
 =?us-ascii?Q?dx2gd0Te5RDhG0tlPhUzB4A/1ZuS2qw0wRFntkCUJOI7trMOQ8O4209DodZw?=
 =?us-ascii?Q?k8dLvsXv+aq2BEpfOxDnvzA9zHvuPLs8MAoQv64Xo5v3UpDuIdyAD7jzpL+z?=
 =?us-ascii?Q?q4xQs+NSJg2HRfgFZ/RDJAx6+/FamPkU5Ewe6RNMIyZQ9QKSI1JUObqnzUCY?=
 =?us-ascii?Q?SZk9VXZ3bzvxit5fh+KVKJOUMf/K7V8lFsk2tjpwsxZ+fTonhdJhg2/98TgR?=
 =?us-ascii?Q?6LMdvBHksLm6TT9HccMW+PDKuqq/9ZSaunVkIwgc82R9NR9v0bDZ6kcup6WM?=
 =?us-ascii?Q?47yK5bAe2mQFVNxEJtduNumS9aahZ66FWqP7Mji1iyxKL3szd6GIy1ae48vp?=
 =?us-ascii?Q?whas3dao5mgyl+bsokHqwIl1RVIPyv/lky+HRqwK9pU6J3oPasCqaPlTFDUr?=
 =?us-ascii?Q?/31MRFN60OeyhcCENgFXuDDk7gy7L6RAQAn0MY+aZsTcbNmamP3DfkswDYtS?=
 =?us-ascii?Q?0VT9FDlZpTK1qY4VaJ+3x6XR3syfOsBVgq9Bvq2+lGcWP4iuXR9rYqB8kFwQ?=
 =?us-ascii?Q?75vKq6LJW53gYh+bkLoN+oHwrHHo8LuLjrIEwR3ZCSXEqe8A6IuJQi0BWeBO?=
 =?us-ascii?Q?vkb7VBPoB8ddNVSHFjeGUiG5ajRJnzFIIBPHHiOBPzC7Ir0UGHUPOICYdv0B?=
 =?us-ascii?Q?dsNUulYtauuAt5cKtjEPxEx1vGjFd03O0BcgYMm6t/N7f3KVjJOHsPCHrxlS?=
 =?us-ascii?Q?W++9UaNUKatkoduSEkzsX5lG+F+QktzcXsRwYDwEieLZhPUVLc2QSJ1iRX81?=
 =?us-ascii?Q?2jALS9E2obKIa447tp9WuNl5vdWClyJ3npfBKRief11GjEd6RuI880E8iSTq?=
 =?us-ascii?Q?zJx8AaY0QKbre+IFvNPKciPIgSc7YVIlu5IM0e4i7ExP2+qgQhctc8hVhqJz?=
 =?us-ascii?Q?KN8GViOxkfAWtL0F+IeIuDYciD2fp4Fur0AM6RT3YRduUYBsPZOM4lMDmjEb?=
 =?us-ascii?Q?nG7zsPIOnjwJdHsfLz7Z+t9iPI1AuUCHk8gQr0A8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5668ad-c33c-41ce-5fb3-08ddc5d8f58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 08:56:17.9266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBRfstdmK9aIVg5RGp7xTlu2zpggRi1dweP51jG3U/bmNTnhhSSYMYPugH8dTMRgDTisJ7yWs2RjLKJ1YCT2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6773
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 08:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220586

Hi All,
=20
QA for yocto-5.0.11.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, July 12, 2025 4:33 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.11.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.11.rc1) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.11.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1997
>=20
>     Build hash information:
>=20
>     bitbake: 139f61fe9eec221745184a14b3618d2dfa650b91
> meta-agl: 6ffa98047a37d1c04f60ff07f29db625e1066e91
> meta-arm: 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
> meta-aws: 99809c787fce30b657487518af3efb1ebfe7f64a
> meta-clang: aef850f7fa53121c74b244b7ae40d31fb9809ccf
> meta-intel: 38e75c8c1059e5f37659c140c010eaa203238fd2
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 727811eaf256b88fd135be99559f2cbf14c82fce
> meta-virtualization: a5449c0c50aa07d02186f548fe6bb6c1ce8823dc
> oecore: 7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b
> poky: ae2d52758fc2fcb0ed996aa234430464ebf4b310
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
> View/Reply Online (#571): https://lists.yoctoproject.org/g/qa-build-
> notification/message/571
> Mute This Topic: https://lists.yoctoproject.org/mt/114107581/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


