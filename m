Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE90C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 03:55:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.53843.1710129332593293577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 20:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PdAbA+FM;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710129333; x=1741665333;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=XZyJ7OKfdvWECG76/Ub3rf7KY5qGr5txlCuXS5K/C9o=;
  b=PdAbA+FMK0Rc8jAiNd12on34KijZ/HdXDf/JILzUuMho8W9yudfUNzRI
   nwU2tkUPwf8qzTWsjzR7KVZ81Os73deXaB0d9MP0yaDqTWH03BMH3yAeP
   uzBP7lK9gOJXH2b/F3eK+v4/nRTE9GoAOulFTVw//NcDG2bt6WRgPwR8s
   fgi3qkGDFNfGpylr8KQdzps5IdyVnc+R1Mj673ss51LpVPz2s8x6Du06w
   6iFPSUvtpb2J3BgYrknusDZwbFj86O+mPbf+bzMAExmgAKgx+Hj+6ZGD8
   xbE9xU2wINqGTx5+YWt10ykLp9FFsle0UUn0gNLjXFJ6T1VbNuQ8rie/T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="27245383"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="27245383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 20:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15685324"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2024 20:55:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 20:55:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 20:55:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 20:55:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 20:55:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/NhdVRIzch7Xb+q4jrh+Q31P//UkjPEQ9dp5DoWL4FCEBBGfOtwkwOIyV9K6sppZFjFXoNdIsGnkg9roioegvuWgc5tdLABLMfCUrD1TtZzCS2nG+NwHDON1DHe1/SBRvM52HTRTF5qMVJ977x1ENWoHoIoeSyfbfoYGxMdJ8RHY+X0GLwJFCdpNJdyZ9DhZxINl42HjxzznuF9TyO0/tcO4z7jFn6eteW9NFO2V++zA+0rsW1af+ZQBAhAKtS3RELaoyo8fppzttz/QeHohp/83Gkv+3QFqrA57rh2/bob1dfYztTs4gN7ezMAA8Z8QMzvmYtS1YRwEtwJXmDHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kigzkhNpTRPGqVBX+ml9cu2MdFYFpxwM9LdxqhCGWgA=;
 b=JFqRT5MSVz8XqWvprgqyI/962d7B5OGOn7eAeYwHT8QYnf0xFSCUfQz2AuSDUEAyvawJjM4+sjk0upFHDyL+U3oFmoJckSVeJy66x2y80/3DL6VkyqULqMgdqn8MMbatXbYcexJFgllQ4BHBerVZn8nEdr158C0zsCFlhmHBIMGgrUamcynhwcXzSVm2zhYPEz0gHOGrhHEVQAg7WzbyM956WeZ7AyF154UVaxcDz8teo7u/KOE7ST6+6dDfseiY9sNdclLpnwPsEc/1rNcitT3eM0ACxzgDL081nnBrsvIgaNAi/Ll9qD1JNHAhSZmltnvQ1Iiwf9yRVhY1RRqJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 03:55:28 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 03:55:28 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0_M3.rc1)
Thread-Index: AQHacWy1FGk9g6ok9UOWbRuvvKhOJ7Ex6y9Q
Date: Mon, 11 Mar 2024 03:55:28 +0000
Message-ID: <DM4PR11MB7760F4ED9AFE62987E5F8D00A1242@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018e1eaa2d45-070e35e2-d7ce-4363-84c5-e31d6b513774-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018e1eaa2d45-070e35e2-d7ce-4363-84c5-e31d6b513774-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ0PR11MB4863:EE_
x-ms-office365-filtering-correlation-id: 0179b9a8-e888-4035-298c-08dc417f172d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6yr1wFyhdZgdRst6keX0y2acc5INVP0poMAl87vrrIswdBPfdhkE0TcMni84kB6O3Y39bqvZJvv7RSdMIwEb7Tow4fKSCJc0TIBaqc6pWjURwFa2NAuc9TX6b8mspiE25IUKz1mRVuV6uJO8CYZ97nj9EsaYoCFUzEzOMTtdVymLXKZfh8SZg/wC6JAS8U3tpHYClmaKUARjEao0xc8f3zt+EvVIqWtgRLfn8UOZVPK1D7ywHe0OrKFLB8GelgboVxGYTZcbaL3gou+HbkwgcYPXB3ZGCA0Oa0MQBpi7drVIED/htYqqT4UDm53hAmhtbWQ5P99aZRHITJOwkTKRqUt33bcQobD/NCnPkrn7ZTJAmJ3+DEfPTWMYo3MaSa+174XZ6YtCAVCAOUMs17p0kOZl4MeCDnFtHeI/aNot5d2WuMP8WrsdrV6+UQH8EVRYMVpUcwpd0eV6fbEwxuYEXLCImeT7hpTTFS0QDc6ickzxyIoicLB94IxnMak0AhqEKCYLh+CFnePLfrcuz+bQLxJxknJZovJDFUFzUr57eZyMQ9tJplMS0FDSSYufZ3mrQP5G1O5NIarSE0BJsWdivTFYZjATjv3EOVp30gOkzmIDWAjK3tFsVu/HcUzzx6F8zpNs3J2BR5ahK9M4L1Hms8HjDeggL9HK/V1lR3wuJoerCPfaoUviu7Ov56Pa0/sC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tem4DbVLa77SUBytmM7+O9S+WusYdlTsYc+ukJFvF0cSvZ426Jc+p3HTTdAp?=
 =?us-ascii?Q?YaeBi9Ax4Os/RiUEhsKv7Nl0MvztFEupQf8ZhrMy4o4yZaKyVeVHyhRqjXIS?=
 =?us-ascii?Q?U0DVwdtjLmd5E+k1UiEnd97YTt/BCmTrQDhMpwWvnuHrVtCGfJyY2L0eLpvu?=
 =?us-ascii?Q?xyVlXaQmNYD0jRiaV5RNKFlbq+furs8Wly7AnSEKf9Z73DS7Ck68+FSUUOmy?=
 =?us-ascii?Q?FWZn2XltZTb6Or/VKA05Heb9tXHmduxuSbBSN3wQAVdaBNju7TF2cDR982SB?=
 =?us-ascii?Q?4yUxGhq7tBxDoMHevF1Nx9il4cBEe/9+EMRqNDaIsAAXNpfJwX4sHla2Jv2x?=
 =?us-ascii?Q?tjNr7DekLYShAEOUMFtTJZC1M85hOJGsy+/+/WnBJ5XQZhqqKHI+LpJWGXZb?=
 =?us-ascii?Q?h3a7RJd4/5meITRtfxjMc5dag10gsZq8quo6X/v3KXlyMX1BOKalJuaTSie9?=
 =?us-ascii?Q?QjgByqBH64CV//kZJ/Y+2LA2zkJ3u5dJgY/6XyVmxgSe3xqwvdai8ttwD6Ov?=
 =?us-ascii?Q?mdP7O6rPbgneH6W8hiwaepFUlXOgLxMp+LqwtKWXfhIm/628BloI4MxqZrQg?=
 =?us-ascii?Q?lvZyUMPsxJ4h1yb9xtp76/wZTtjBPXiwJDSsPQTFCPXjiSKDGC3gWig0ViiF?=
 =?us-ascii?Q?XLu1qZKwt29lflkirLiZK7xz3UH4dWzSMXow9efY9QkqStWfEztj2gDSarC+?=
 =?us-ascii?Q?NFiZi+v7E43kIA3LHm+htZ63FU3ahJC2pVV4rHKncSL+AfOudITHhqoqy4Us?=
 =?us-ascii?Q?ZnI7se67zR43OeN7XMeKIi/yUsJKMxWA0zc47Xx3l5DfrQdsrR7fQaXV1kpv?=
 =?us-ascii?Q?9h+DAYop+e0/ayeP8XbumCHKkztmMs/gERgYtRcikMWqmIZgbkRZpKBHU/Xq?=
 =?us-ascii?Q?ZF4EhiSfYnY+OygJN+9LxzkEwF7rcWLvAyt+yOL9e5jCsX5cBlU9laLjXa/q?=
 =?us-ascii?Q?mxk0vg1cnK1iI7sDajwHGJ78yS5IBFu8wEVtoLlCjf6E5CmET+dcAAUy5slL?=
 =?us-ascii?Q?+XaetDO+z7xwASPXZfLOAdIHY1XBCn7bOiTTmq0dCIgtVvdduTHLOUttWNq+?=
 =?us-ascii?Q?s4Sf4oQKMgs1O5FFIN/oHiXbwnhP+hFK8asVmaNEyfaK8dTbuEe9HOenyHNH?=
 =?us-ascii?Q?WsDfNZD9VoME721o3CBGFdVviYUW4x4GPFOFagP3ObLRF1WDFRcQ0aueGxk5?=
 =?us-ascii?Q?V8BZGrCMeXYN6O2fY2SzquJw1VaHZlduHMGGGCS99j1+2BeHZB4Te2KL29AK?=
 =?us-ascii?Q?WgsE29qBHaxbOfhO8F9ax9N0BwN1q4pqxxvIXaMjTRMI3DkFKVQSjhPuNJ7A?=
 =?us-ascii?Q?P8kl+sU1ygTuchbz8szIyBVM9tNEzTkqxSK+a/bLUkBPY0ZG/d1Zdct5St/Z?=
 =?us-ascii?Q?mdcAxXtROlh3qzTEgiUq6BYkIaqiLWeg2d9YUcbpPw+Uj9COwU/24rbZnC6k?=
 =?us-ascii?Q?5nMMlH4nONmkxsg8ULjETHgIMVUg0Rg3xy5yrQlLxF9gF3dHLfO/unrmA+pt?=
 =?us-ascii?Q?8A8vyHu2+/HgpNhTkT7XEWa9JxmWu+mfCiPfnhQtErbJuKJBN6rWjlZFx6v9?=
 =?us-ascii?Q?3SyLIChlx2iwDAmR0hdpyfrAS/9oEAVklRFKVdF5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0179b9a8-e888-4035-298c-08dc417f172d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 03:55:28.5160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqlJ93CktSkaWp/K9OLgOIF+wUC0TXFR3WiS7XdPJK/hUGLI1SHJTP45hjygQmuZwsjESKb99YkKUgL2R2rvsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 03:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196910

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0_M3.r=
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
ETA for completion Thursday, 14 March 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Friday, March 8, 2024 11:24 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0_M3.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0_M3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6661
>=20
>     Build hash information:
>=20
>     bitbake: 0a33b560233b983456178541603ab96fea22238b
> meta-agl: 403545c205c30df24e39ee03d6f188aca998b3f7
> meta-arm: aba9250494f62360c1ec8021f81922c005d92b82
> meta-aws: eb351722d71f5de128455b9f5bfdabfce5d2c725
> meta-clang: eebe4ff2e539f3ffb01c5060cc4ca8b226ea8b52
> meta-intel: 9ed54a13803e42ca40589d6ce02c76f3162f6b73
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: a0237019f5b5c003fd0c6fd4486859214e24be01
> meta-virtualization: e7f9c2dd2f9f4ac95942b69c05ed8f5d0494edbf
> oecore: bc793fa9d1fe24c102d91e97b7002b6e637cbfa5
> poky: b5624ee5643d881afa004571a096a189ab5389b5
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

