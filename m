Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE939CD3429
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 03:45:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web11.15347.1725335128742237977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 20:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NQINRq3W;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725335129; x=1756871129;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WlNnOI7ZM0P8acTQ3S9tD4T2cYV6Cm2clhfaUhFcVoo=;
  b=NQINRq3W8gaV2UrDDGDQmjZoUK/FpyBS/B+fPly6V9SQPUgPlu6U/DRp
   u2/ieUZFOUNLwBr5XzR+nus4WMAau2I7BMW65Ln/bI0wX+IwhpYx+fLqZ
   Q1X3atPBj+aHq/6jO5EyABSSjXE3jowNvk1FfXyodVHlkVwV/jOiPYQlg
   NByb9TxN8CcuR88uDZVg75LKjim3wgAWcaSLA4bXwflUsmvjJ2QTqssaO
   mX/d8sCJQR1bH823gtCCFd8e6LdtXY+0YBLY28E5EAhyd+u2tn6jHNBEn
   gfgDI4RQA039qteWmY570dbdcjYdrpChkuxvKDPWpFaHZ0leYrpaFPRzQ
   g==;
X-CSE-ConnectionGUID: 5CHGu51/R3mt3U0EVYTpiQ==
X-CSE-MsgGUID: Fz6IWQgPRuWHgFS9kYJycA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41385396"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="41385396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 20:45:27 -0700
X-CSE-ConnectionGUID: qSuu6/VcTqawhPag4k/p5Q==
X-CSE-MsgGUID: gVe2HMWoRWiDZdeGVOvZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="102209562"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2024 20:45:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 20:45:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 20:45:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 20:45:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZf8z5cMSWHdeI0J7gRTQt/kagVheq1dBRgy39y1lXGacz1TOFXoaTIQWA8KhKG9v2OucfJaaqEq1MMyFJ3tFyRzYbTzzNfTNKVcvVxdvVCCXijApCP9FKOQOfLIxSqFW1G4FMgOg8rU38At+RU45vcATDDrpwRgazMNzGQ8qNZq8FJOCcIn26CDywwOhAanu3FvfiQjQmkR31lG+pboqVvNntpxY2P0NnY8b3cjZPogIl/b6W5S/R6P+tQurZjVG8w0VdbNXeBwlK2Aq34CpJ30BkqblA02/loDspTyWH3pVm9JUnNE6zPLRmwnhlAElSmwah91NCawyk2McLLXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kfNuiUgD5A4nHug/KyDP8+WC2uxm6HnJo7DkF7evOI=;
 b=W1u8YA0egE0NMtoCwXG/Or0BqXzk5LZE+eSFs/oSzExzJf6j3LL5OU14Yq60MZHBd+FK9EZYmuzcODxWzcKJ0UZMoKQ3yezIk28+OzUEOrh/r5Mc7A5oidX5vOR3bps3yp/2EaQiOX3QkGPCFwQUplLJqmh/kGsBcxJJCJXjD6tQSeKm4c9+USGQDEAa7Sbyy2o4cWfyA8HM3DBhvaWWVHQYrKuGLZiI3TYO1izdn5cHCbxjvvH5sYHdRVypnKClWNEb+GEsr9euBFwkXvC5yoZYmI3U6p5NurwjllKoJlMhs29bGznsttGzFKXPtR0+Zmb6k7rmXHBAK8IXPjJfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 03:45:24 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 03:45:24 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1_M3.rc1)
Thread-Index: AQHa/M4/w/8vPs04ZUCdJoO84LzlprJFZLSQ
Date: Tue, 3 Sep 2024 03:45:23 +0000
Message-ID: <DM4PR11MB77608732A91F80BCC69054D6A1932@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010191b01c9cd3-1677ddfd-65f5-4319-99ab-a84885d84b22-000000@us-west-2.amazonses.com>
In-Reply-To: <01010191b01c9cd3-1677ddfd-65f5-4319-99ab-a84885d84b22-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CH3PR11MB8444:EE_
x-ms-office365-filtering-correlation-id: f0078998-2708-4623-5bc3-08dccbcad78f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wugXMSxIrwzY5CtoEXgHKPLmtBbMvBIK1eaQtCJKgIFpW+cOPa8nF/cEUJL7?=
 =?us-ascii?Q?I/zd4jqg4NCs5ntXb6INip56JcTiWobHtkAKKoKKvne/HO8KT/gOl+5fBzJD?=
 =?us-ascii?Q?LP3StHKg3ICJ9YrqcMPs0uHrTB+beOCBMoCccYcKdOalBZSHbUHQShcux3Mv?=
 =?us-ascii?Q?fbA0juGRi0i7PWLyNhTJwQZCDrSJh3ewx4lhHdJBXk//gNrec4rsy23h7xw3?=
 =?us-ascii?Q?ZN4dxGOM5+JvRjgNxoHJLH0lke52qaGFlY99qo/bI2Ic88O2MPWnUBlISLth?=
 =?us-ascii?Q?h1tTBidKaqP0AHvGQl2FUsHZisiitrniUMCPig/HIyw9gO+amxgCYmaGhgxB?=
 =?us-ascii?Q?IjFzri2prHGauvguPP28roTJ158dotAQrYj2tY5sxzZalG3V/WWJ/McJ8hFN?=
 =?us-ascii?Q?yp/0QqYEnMOF5615HbEVHPW0dXUERzPpSXKk//z1s+/VbH5hiaqcWV4Vs8LI?=
 =?us-ascii?Q?OylWs9bdg+QVuXVnJbObrBbsyvm7iZ8uk82v/Y8z+NHoWlcdrACFO48nATQb?=
 =?us-ascii?Q?C+/rm5p11XVNrLoaZwuir/8N6G5wStHjQIZ/dWYpCZ6mXOr/V26MVox0tG7S?=
 =?us-ascii?Q?kwLVhyY8ijyjsI+AXz85Xr20cSH45x7+Jbs9JOiGeJHOxA+L4xD7egHwFrrG?=
 =?us-ascii?Q?AwC2/pvxu0hFGmUmJrnd9Tq0gaeZUMOVPTQlFPwkNZu6/dTB+2cEuZHMY1mK?=
 =?us-ascii?Q?kkOeoQGWWx6dbvRy0y4DKzIkDRpxv+kLo0yHpTws3kMuOWItkZjEzYvYLhqx?=
 =?us-ascii?Q?UcSdaw6IX8AqNy8FUljAvcDx/qDo+kUsz6j6fJF5Q1GNJN9TWCcBIhIJs+TM?=
 =?us-ascii?Q?ozfa8U4G5XqPO+JyLdI0hbch0aLb1K9O6tAUzxtqpQHzj7O6psqFbUwJjr6p?=
 =?us-ascii?Q?/lphdiNwVQI6RiMJ0hGbV0X6E3vYvVLeUqTS1/VcpA0gc3yyW/bYG1Ol85Bj?=
 =?us-ascii?Q?r68rpkndl4qVsqS9r85TFmr6SYh+4Y/8JGz3YLLTR+ZYKFUsRF3iw/rdMsjg?=
 =?us-ascii?Q?+WMaZxxTk1d+kMrLNIRKXxaE80HJutZG5Lp4eGi7u6+HQL9JvgYTK0Xhrd0v?=
 =?us-ascii?Q?AgQmBlYkdLfKMS75n66rYjUYDviPCfJob3y+lnmrA+JeM067EkQZXuALEo1q?=
 =?us-ascii?Q?oS0K1e00YBlVUKcqJm/MtjcbcLOG+zS2eqTpP9mIWyktMgUQ6TcfPmegT2e9?=
 =?us-ascii?Q?Z+qSu/pVNrzjPCy1zrMRYW0pV2uiETLC6MGDYliQZpLmXGj8Q4UpnmRfpbCM?=
 =?us-ascii?Q?5hghmt1lwcxq/FnJdPBIkS4+VNbL4/XrtLSEQMa448GESvSTZQhvG8R4DAzv?=
 =?us-ascii?Q?UTcx5eQK9Ri4UTJnDHsJCPh69H9cyJuHdayo98VVC7Pk+aWW+askN5ejVFqK?=
 =?us-ascii?Q?YQBizCc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CV6z6J4IhQB8ap2JM5ChTn4W13VvQDVYmQusRPQ0GEYtLpRleBzExgfYaxRY?=
 =?us-ascii?Q?a3/esDiG5Mb3CqMJAfdQCkXHV6pI+T8OJfJBMQlcNbtc4zf5RDimE34qnKM+?=
 =?us-ascii?Q?fjX4AprtvIby4eKmgHQwznHyWvTwZ//3y2X7LshWsyLXnizcdqcRO65NWa3x?=
 =?us-ascii?Q?yBk2UKrmOp//UnTaHf4Q316e19vyidl/cKBecNqi2+rJ5wbIgJpAFO37iQJt?=
 =?us-ascii?Q?4KrMHoMYHaEiXgMjUJTqbfA1zXzp3ATIxMjQZ9ZavgeIEBnJzGQ6GOsfR3CL?=
 =?us-ascii?Q?Mo3BkvzPFoVowRZGDYer2m89t5bm+UJ1vBG9uz4VxfVroHNO/i9zPZlTrf1C?=
 =?us-ascii?Q?y/PEHNYUAWR15IjamfcP+czDIQX4ZlgGUHqU0HJnVeeoxr+jLu2Oka6MZXuD?=
 =?us-ascii?Q?HfDwdaUWT3uiN9e9tVEwiSN0xMYvC61Wsgi7gjUdQAdiQvPFfINYGVa08iJD?=
 =?us-ascii?Q?x4eDRCFSjG13lhyeHqnh0/3/FL1PJlA1EgpcujtnYENnV6u8X1F+ssCDuMBS?=
 =?us-ascii?Q?cifuljPo2Zn3GN675fqlGtNDU88iUkuL/jU9IQLTsH8XV/lUTTeo4AGEmUTU?=
 =?us-ascii?Q?+y4Xnq8M/ATM1jB82fkWFBwfMauuehkTN6IwjkrPsB3Ennw2gOEAKlKKF5r0?=
 =?us-ascii?Q?O0cdPnmmhaJYlNDAxT4fFWiM0j/arULa7+qGI066S7oajbrFYgx5gVDInBG3?=
 =?us-ascii?Q?BZUs7sOeiXJXez1XQlfLYLwm7swAaMuGqaqOrTLHBZYk5EQjyfNNPDfGcR61?=
 =?us-ascii?Q?pvw9vYTRrRjORtTBh0XOMNlLtPGHtNKQJ8OFYKtZnBJeYfIl0qBbnD468U19?=
 =?us-ascii?Q?H2u3Yu7ytJMVZzchyMtaqj66glhH71vddoMhssbK8io/YNW0jX0gu7EcwTpu?=
 =?us-ascii?Q?y+PTsIl73ShIwkP0ZbKR8vzpQEx/YJBlODlUzN5z3oaCdOHd/3rggsf6Gfdk?=
 =?us-ascii?Q?7fh3N0hrePc91hrRuwZ3lRbKPdFBF9llFMjD38b4nBU14FlkoX500DNNuoKb?=
 =?us-ascii?Q?BrHKrpZnjGPTPioi0atQd/R9v/WiTqhR5T66lMclAIGG2BgcLz6tu9ZdKX/G?=
 =?us-ascii?Q?4cnwC2k/Dg3hrDxioWpcy+LFATIuuOTNF38MfB2wmXZoJrFTRHYupU/v6tu1?=
 =?us-ascii?Q?Cie+QmneCnNMtytgvuBl8GlEINz5LQ02QA59InXST6qS0mT2KNwivJ/HBsc5?=
 =?us-ascii?Q?Oc5V+PremqQQ00WBVCryoaNUHFYXuBHK0ekgTNLElz/Iyfi3g9/dnpoZxJ3u?=
 =?us-ascii?Q?U7KBLWRfq9XNjMEwPDPX9PRxcB2FFEaB9vAOLlb301VtBZIOKcPOrgg8MG6y?=
 =?us-ascii?Q?eM5bxeg8ritB/kTayLX721zg69pvMF6x434YAy/jsiS80PBOZtvXOG+V9W7n?=
 =?us-ascii?Q?/ny6z3a3T9//RWEBXTeAGVUBizIrrscrWUFP7SegjPkwk+bK1JiVRmTSBFxv?=
 =?us-ascii?Q?fNq+8hEet+KPy/5Wag1Zj5iUwQqYRBF+oDvjDqT3anS21fKPeBsQEiBl2nCq?=
 =?us-ascii?Q?QXp4qGvei9vFINzx+uTRpMEvLwii2xxnu8Nfc9WoHLbeycukh4Q5V0MV8H3E?=
 =?us-ascii?Q?RufB70cKNcpf/6D2sl1lhiep6T7z/2SC2Z6/rmwS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0078998-2708-4623-5bc3-08dccbcad78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 03:45:23.9690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OPKSBwTMtP2f7IlTPVJjZIDvoaw73ZuF+MMTr/SvHgTJeuZQ9L9JUF4/h608uL+n8PTBI14ospEawxJuAy2M2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 03:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204116

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1_M3.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion Friday, 6th Sept 2024.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, September 2, 2024 8:23 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1_M3.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1_M3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7302
>=20
>     Build hash information:
>=20
>     bitbake: 5bd0c65c217394cde4c8e382eba6cf7f4b909c97
> meta-agl: 5f5296f39181ab01c6bd616d6459edaa0d3283f3
> meta-arm: 11d6e241677a34125533e7f00440eddf933c87ed
> meta-aws: 5deeda317200760d9b0157eb5026efd1d487a829
> meta-clang: 685abe9da706985c3f9c3d836ce4969c2cf5ef03
> meta-intel: 8c4ea4cd2f241d4d82a15341b940595888f71ad6
> meta-mingw: e4d377d5ddb62b265536bd33dbccfbb0904f8701
> meta-openembedded: 65bac5505f306c693244186c769cef18aa436f60
> meta-virtualization: a940a0e873f9163d4585555b3f3d38e99400d237
> oecore: 557400648b6f4f31176847f8a068d2e199b7793d
> poky: bd2159719c08c101a25a5012fc684163135653e6
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
> View/Reply Online (#458): https://lists.yoctoproject.org/g/qa-build-
> notification/message/458
> Mute This Topic: https://lists.yoctoproject.org/mt/108219778/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


