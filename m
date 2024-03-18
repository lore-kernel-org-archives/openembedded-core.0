Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642C9C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 04:28:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web11.35625.1710736124011466974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 21:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZwxcLNxg;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710736124; x=1742272124;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0vyhn9yoQYBUENvHg7SgtbYyCX1LuyZDvPYac6oSpWM=;
  b=ZwxcLNxgqhd3eWj5ZJKwenpfeb4oHHvD3eFbca9qsE/8yPJJRMCcJS95
   1KE2y44RcH6SMZhhyW/yfEqYzPbc40FEgvvizqQn0PziEOY7HoYRH5//7
   1DJ7TlLMa7MqMDbGUWW2iB3OMQ0ReVbQVxQ1kXEscS3dGEJEmyY4VUvYi
   Yy9b/upq7KWiZXrc6MjULWAJV2l0X5vLuxzKi2ztWJzc9tbcfgJeJOWUq
   qTdvqOUMZ7rJxYPGuoXFNpkBdWNP0coR1bCGxxIH4gTJqEXtOMeQ/jd88
   7Zgi+zwqNq9RZIEGbqyvgfS/094pQHACcZcXvY9GV9lW7YOiW/8bVD38s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5657495"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5657495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 21:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="13739391"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Mar 2024 21:28:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 21:28:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 21:28:42 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 21:28:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 21:28:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdAqL0vNRw0LGhiOuDAAJDeF9aJM5Pq0W3ujBj392GTFjz5iSRkvMK6InqvJk/Tx0mHv/qY+OoCj1cQ1sq69Vgd/Hl1BqRh8AZhVXzCMnCSwqDpi8kiZbnFDahKqh+jyitBHWlqcORM/lztnhDOxi/OrSHdLR1wBeQ8NPthFhJlqfsSQJkWfW5x+Do6XTUL6btYUk20YmdbpfX6QMwaVhYTjxQCKDNFu1lZ8DVJdva1vTiYiz38DwUaqwCT9S+xeiJYiQrtH+KkPgLtrRmRYXePrkFiJcA/lZmJOmCip5MCR1m8G1l37Ly4/5G70aOEzKmBswh3//EAYipTpht0JZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iosI3orkKoGp/aqn46FLT3ZUzsQStbdlLbpHF+nEfI=;
 b=YsvR0aFu2cXH/mJAHHt+xvHR0H8lajrHHuuP5wlnc5AnvH8nkhvgI6nrJEEHM8A+8b1Hnv0wcUiMdObGLl6TUAHpJnu/5KBjGQKuyTtC7oPetS+odmcxpsRuVjPhzYvsod2pL1pmS3CETWbuGo2vZ5tsK95OsPkcsMys5xLIcYBiBOfMzH58AceyvwB34SoDVvCZkLA0UsM/8LIcrRhyPiitXyrlx7eT8efnPtgYq2BuXklxR47ujMwUzStdzsNVTEerWlBpnOQclp0aB78tDxGL2b9HL47MegR+P+q8TmB5ON82sc8xNsmmEymDGiRVZ5iQNSja5U5S7fRydcI/6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 04:28:35 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7409.009; Mon, 18 Mar 2024
 04:28:35 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.17.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.17.rc1)
Thread-Index: AQHadaMkVPTSlLT4IU6GRGzQay9sM7E87YfQ
Date: Mon, 18 Mar 2024 04:28:34 +0000
Message-ID: <DM4PR11MB7760A233BD4ABB0746D39B25A12D2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018e3a457956-327c6d93-de66-472d-859d-7bf581132908-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018e3a457956-327c6d93-de66-472d-859d-7bf581132908-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|MN6PR11MB8170:EE_
x-ms-office365-filtering-correlation-id: a7d5e6ac-f097-497a-5774-08dc4703e018
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCW1bQ9kSsw4eD8zayZsN96YjmnAMVpKvWems+ELeFa6cOcadzTHZD4fcyLgV7OuNq/duGN44GPGrxzBAh3GJt9vG7hL8QpwgHtlcK0TCIeAIUkOqYnEd9bxHwAF94csOGDE4X6q3pRa3QcmFsCRD15f9G+danELGQQ79SAxINcnk+uoMwjXqzLmI+X5G9+e51//vwFzg0kwOgqQQ6AS7217eTGTyIoh14wSXm08HHxTnqjNQ/fLUT1D/zzhmPEU584JtQlURfEkl/GK96cfosoWpIB1C8ZywzmP03WOFoO6YJfYDSflV28NFr3a6icKtU1fS1bV6RMO2b05P6NRo5PA5HepveIdzmQUPrKlV5Nhigj8ZsRy3D78FD5jhB3ubsRHj86os4cTuVOfoztnsfcpZjOP70lCPC4XY+QpB02cBfNDg1RRjQJBVKFXqDsphJ2uEZnIbilhsCEhXY/c2Oju7thXyuDlKZTf7dlwv7xuo/JcaZS/oUWuWEnbczLEj+EZLpmWAmkOknQJtylWtl7SFspCtowp69lNGtEUjkxls8cT5P3Jd94pMTkaGMQUWuTHZOdSl+QAMlN0YNUOpbHjkHwuyQuk8471GzBPXdfLkKUTlU5fkbHmcgq8p5Iw9Bit/q4OtjyC1ZU0wKB3v9YKibHDV2jXtyy44bo7ziYwjcAPf0n+UazFALbYeGZk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OgiV/ZULH26YUqwMZEuvOyVsl+o3p56eX3Eqk1q4xPypGRlp3vPW0qiTrCY5?=
 =?us-ascii?Q?nEK5gAe6A8bOZsXPFLho8oM8fZVLTyEMUpngWySS/+I8V4myibc23isFoRMg?=
 =?us-ascii?Q?lYOKF99LU8it9ueiJkXtek663yF1y0ZyF+F40mYkDzOkOkSpICiVgMDhkMXQ?=
 =?us-ascii?Q?+ol3x67NJlUuf8GhJjzz5d7UJIC4TBKUO9mMso2RuNAK4KANasUDpkRRaWDP?=
 =?us-ascii?Q?BsjSQfaa6lymtpS0Qmg3ep9fj0jakU+EzAwle0k5ExkQlrlSrDFhmQKCRC+p?=
 =?us-ascii?Q?Rz6hD/O6Alp1mYSylNV6qfPU98DEUq/4e+b/2cNoSeSS0iW5MCHTSGhMk8Bs?=
 =?us-ascii?Q?Y1lOc4PZ1iOXOjebPxI2cx5Muz7A5B7sF5t+tFtArBkSLaB7M9XUmRqtBzVG?=
 =?us-ascii?Q?0tsc7fSkIsL3V1ESYkjCq6eqdyh8BUJihg/irA8rfJu2HLuL+K9ONJ9YDemK?=
 =?us-ascii?Q?dvnoZV3Wa0cY1FOfYKarppYWLQ7Wa1eSXAdSw0V8XcZvjfkwCn6Kc5RTjFRe?=
 =?us-ascii?Q?PqqaEHNAzWOmSU0gTg+3tv9e5ddOS5eJVe5uqjQfv5HU/PNVQgLnXNX0RM0G?=
 =?us-ascii?Q?CbDqpbiYIZw0EUjK44PU/e19lSWW3lvGz3Jun+3uB1qSxLmWUy+KHOimyACj?=
 =?us-ascii?Q?JnPm2L/g6R9cYv6cliihzAbAEXYSCJjY40olEI5HHp5boiycdlql0BJeTGCP?=
 =?us-ascii?Q?JmpWHuFe1Bg0FRdHA4L2mepF+YqDL/+IfBd29dOzm0lN5D7Mgi6Eefs4PLpd?=
 =?us-ascii?Q?YZ4DBUqjHr9m21MRH1JgrGqlwoubuz2qzqRgeiX7/zN0ojFTKUERxKjKHyxt?=
 =?us-ascii?Q?M+pMyEKZ3Q3dyEg536wU7mxYQD/hRxit3bAKRLe1YgHDi1C8nQqsXBvNnQLm?=
 =?us-ascii?Q?5OeBauJPfDu1n0QDiYl2G69EzjPlBsvfllrCYWSahEcHRhuHLeYelQv/MEdn?=
 =?us-ascii?Q?6yCIluSOpZvFnp4KpkGWcIvZ60DfdYG4euYJRcpTN7p2YEIO5hbrZ5YSILKr?=
 =?us-ascii?Q?tuBXUDw9T/IG25/sNAgK7dl3DBctdxpkK2lONFi+OcA5My3Tu8jN23WeR1xu?=
 =?us-ascii?Q?GrIw6x4HNh18G0WaS3ZXYwYZ4DVevMlnRH1iZ9S9q/aXWIoJT4/WzMRJdSbP?=
 =?us-ascii?Q?MEk9mCDaHyJURSfZsllc5OFqiK7QSVSUYHYnxLutkojxOHwogZKbQVhg6dNA?=
 =?us-ascii?Q?5MfIZbA8pTf3D9UMT4R3dBPNBe0FAm3SSllTuMrQMS18p2tFGBehYTg2jrKU?=
 =?us-ascii?Q?GP2QqZYkSmjMGa2tblS3QXdoz4gxGfxr/02+h64juktOVWyHhHnd0YwJiiFB?=
 =?us-ascii?Q?85LSmi8DRbcJqIFx87wrC46wfqXubT1iC5L2pP0RpP+1a6RvuWVMK+qJScqq?=
 =?us-ascii?Q?dLkLdS+z4vo7Zvi8rzPFb7JrGlgXu679CbQ3xIuDSH5KDPHVZgPNA/OSSwCi?=
 =?us-ascii?Q?pGwf/h+8IVlhct68VqXS8mlOHPb1ow8Dvs6bgBsH8xrFfrH6KNN5kUuGz8A1?=
 =?us-ascii?Q?teS20k1TdjoQ+q4mDQfnq5HYuHAZXZgEHMjL5ZThpD2DTkfF7lBOQjRrnbtW?=
 =?us-ascii?Q?2qybAPBz/9UjFPY5IBmDf9PjTJ0zODo/cNCc6mjE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d5e6ac-f097-497a-5774-08dc4703e018
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 04:28:34.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4dkDPyLH91XhtmpaujYq/4Zm8ajw+UJrPsm97B/0M5lUNnayO60TGuPXl0KHvJpO+Df++4js80TVPXbhn7Meg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 04:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197292

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.17.r=
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

ETA for completion Thursday, March 21.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, March 14, 2024 8:04 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.17.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.17.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.17.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6676
>=20
> Build hash information:
>=20
> bitbake: 40fd5f4eef7460ca67f32cfce8e229e67e1ff607
> meta-agl: 3fb5640211e4c3874036a6d4a61e852b348eb4ad
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: 11e0184fb8062c5384085e9c91339f76ccf191f4
> meta-clang: eebe4ff2e539f3ffb01c5060cc4ca8b226ea8b52
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f932ebb2544170f43edd22739f44307809bf8cfb
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: fda737ec0cc1d2a5217548a560074a8e4d5ec580
> meta-virtualization: 7902664f89678164b7fc90d421cee74cbec51cdf
> oecore: 2501534c9581c6c3439f525d630be11554a57d24
> poky: 6d1a878bbf24c66f7186b270f823fcdf82e35383
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
> View/Reply Online (#395): https://lists.yoctoproject.org/g/qa-build-
> notification/message/395
> Mute This Topic: https://lists.yoctoproject.org/mt/104917815/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


