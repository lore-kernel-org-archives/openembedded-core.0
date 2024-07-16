Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0235C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 02:13:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.1670.1721096010137767953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 19:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lhWQ4oU8;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721096010; x=1752632010;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7GEXj8ZePmVMjXGMG9V45zC2q69jqhajjOSlbJCUXMw=;
  b=lhWQ4oU8DOz3JMETn0L9zdLZAph0AJUhBNGJEXsLpb9iHIT4ugIt9qM3
   SE0Ohl5p+EjOm1FC6bqJAyvaGk+3YnuKHBF8ElpqGrlNglvtLVN/iOcjk
   aXq5EU8ESFpNaGNBSvkbEz4boU27Z/wHAUTKUIM/hZdCjjEvkjMhs6iRq
   Q1XGX30g5U0JBktbjZDTC6GA/1DAbQD3m3KYD79bUaSmH9efiIt1g5JLz
   bKbk8VLj6qyw8c+4fcpXuhofc1bgKTKZTijnpzSVrLOY7bLwJAMG8D9sW
   zeLTduXBjNI7/2TUr2wdUkjf+VZ8X/8MU/yVvw9foT/Erpmu5B6wmGbJ7
   Q==;
X-CSE-ConnectionGUID: Y/c6+H0SRJS8aJPladolfg==
X-CSE-MsgGUID: IQff+RmxRkOsZK1DgdbBbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35943147"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="35943147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 19:13:30 -0700
X-CSE-ConnectionGUID: 075/qsyTRp6rFWxGXeW6wA==
X-CSE-MsgGUID: DU1ZeZA5TpSC+ixPXzXxmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="73074149"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jul 2024 19:13:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 19:13:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 19:13:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 19:13:28 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 19:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUttb5T3sVCBVylNT/egJA/A8GwtfSTT3hnrPepH6wmONC29MHUTxj3bw0InQLhp+ohC2h/YO1xI5HG6wwCU1L10OsspgF4HbAeF3McutYKgLsEAUETlwOn6eUu7MEeTGbo7SJ3v3e7rz/jsdtEMQN6on+e1HEDWBf9DlVf3GC+s4a2HicxywhK+mE+aUKMxxyLzelcN75pLlR934Rq4aWOZTa6IlXx2mTffmB+Uhbv01CC764qcmK/RRLShZ01gSh3aRKAOHt/GC7kOdpaJFj+vSORy2muXPdvz4jtEhMLUD9MvbNpDZe6rTzBBlBZyP5bTGB5Ikg+lj5U4PzFfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ6OjEagZBtIetrcUV2HfDPCOuxJCGis7fZhM9xhs0Y=;
 b=nBKpYOfVg0/OZsv1fd/AhLcLWpEaWGFg1JWCEh/YQWRzAokZKqR+AHO1DGyOxj9IrVtT6ACVH8+9OCVDX5qqYSTqhDxY0VVEBQ2pxFLptkfG70R1srY8IvtsTZqsF5XyfYiSGpHvqROYezYvhVp6IOeczMDTeMeyNGUCQsbeWSnR2rgGgOa/RcgV3juEqkqU9vKTzK2GlqJsurtmRmEdNE5NB/s6Al34ixTmmb0M92KfPonOi5ajNtKToH5gl6J456UGMaOb6Wdhw9/g82+zlsA1rzx1MIZ74/5FDqT8AKKR0RIHcwMxyf8jIbfKyX42r3RyXhpUM14mb8DZsRo1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM4PR11MB6119.namprd11.prod.outlook.com (2603:10b6:8:b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 02:13:25 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 02:13:25 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.20.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.20.rc1)
Thread-Index: AQHa1xtxui4DWEoCxke2onLaPQqJwLH4nKXQ
Date: Tue, 16 Jul 2024 02:13:25 +0000
Message-ID: <DM4PR11MB77605F0D9634CD1D23E612A1A1A22@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010190b90d28c1-ff0955c5-d7b8-45e8-9c87-d5ecc57878fc-000000@us-west-2.amazonses.com>
In-Reply-To: <01010190b90d28c1-ff0955c5-d7b8-45e8-9c87-d5ecc57878fc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM4PR11MB6119:EE_
x-ms-office365-filtering-correlation-id: e76a413c-d601-4159-3247-08dca53ce047
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?aQAja8XGQxtHdh55MfD6ogMlE/dtTk6plzWstk4kwqA8rLM6dDsaY0GqGU8E?=
 =?us-ascii?Q?TKgRZhgxdkPRMIlVai/QN2LY874ga1EkAU68kEwstNj8HzmeXTNOfBlQqt71?=
 =?us-ascii?Q?ffbixgdMFczEF73M5AkSyb6nW9Y6KMsGvXa1q5u0qoGu4T1zZpxwT19j4GIj?=
 =?us-ascii?Q?erVNEdAr8GKArY+wK+jE+DxPxWCOiFRJeiMEOpCzCXCig+lob86vsQm2KXzK?=
 =?us-ascii?Q?fUzD5ltxOpLr5MlYRm9bhVkFbIrFY0HdNuy8/EfT7GZ8iAP6790MUyCtK/02?=
 =?us-ascii?Q?crG6iJPjBUG505VX1anqxTMkw6wHkqhs59hFJKil3078yGe5RNHJati6I0IW?=
 =?us-ascii?Q?D2oVVx1fVwW9tSNiWlF2KFndwH5tVEtunQrphWdLCZS3eRZ+KEEMi5lRJ3H0?=
 =?us-ascii?Q?OSqd98hKgHN9mlCMrP9x27g8rkCDH4tzqze1BHm6pxjrVs8Gcm24/n9pSRQB?=
 =?us-ascii?Q?oo2BLHb9p34eJwK3gBW1mef5xlJMTkf6hLcfdksPvIYLVePmEr4xgcqpp2cW?=
 =?us-ascii?Q?0PDK0qNWV00bUrYM8z4Bu5hsyZ+0FioTCI+YOxaDdW8b3iV+DcXGZf+yvRo/?=
 =?us-ascii?Q?AF1ApZE+CCPXB+GiH5T9/NpmLqwiuA5UfU6MOvdwa1LSi+2VRzKKU33NyCZj?=
 =?us-ascii?Q?bry0QJNVAoLCWq9a8bQfoIYc8EN7kYHmuycJupBjBnFPN80iqkG5Domnnfqf?=
 =?us-ascii?Q?o/qmPULfi6UgY1kXi1fh76VaZb0AZ/x7pOJvKcuuo3rXTTV0T81Y+mXf+8YC?=
 =?us-ascii?Q?Mp+7DzzbGLK/zyORnkdoRvu+qnWUwCzS2aOa12DGyClE6HAXxlTSnRLTKdNb?=
 =?us-ascii?Q?fjY0zwS97AFe5p4PyzlI46yCponLVGyN3CsPgxkVhqY/iBTuSzVAVg98WxCu?=
 =?us-ascii?Q?dVIGo5oQlM9uJCqLv67njBZL2ju2ySoJGTSQPA5n5RNrwBEI+aVj2/xdrX8w?=
 =?us-ascii?Q?2wwOxg+U9x5F4Lh3SR9AE23qfFs0rm8LVmwDBAN1sl7qygRMLHoJfK6GYdWh?=
 =?us-ascii?Q?GAgNxLsqKybfES0ZM3A62E4qMRJOLut3bcb6jX4Uc8XSzDVIhd1RGZ7doiPv?=
 =?us-ascii?Q?i1bzYpSi2+m+TJeGKCSwtpkY2jxF1tKgJwzsHLBVcvwl4LPt2g6kUL+iybkZ?=
 =?us-ascii?Q?6aM1jOWoLWCUoPA9lH/93QhAQFBo1hwUgzebbYq/iOH3S94oXg8SIszRUJoQ?=
 =?us-ascii?Q?cKIqin01OyZJAy0dkx0KVjxdhd44KwKyQdQXiRk41Y6LLxEmKgFdZCQxZF12?=
 =?us-ascii?Q?VjyqO1lb0qAGQxpO7Ak366nAr4+SiOoO+EhEGSotInumvh5aMbQwNp2WELsY?=
 =?us-ascii?Q?Caq2FyjoFQRSpINYWGlBQ2aemxrUi+qrqRglgyrwLSbqF+7duKSPuxc1ipVE?=
 =?us-ascii?Q?A/S7glA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PTxPqV3E7NRH62b7HzvJP+mHiBMN6MnDPrRrRJKvjLayxAfCD2yc6APDkE60?=
 =?us-ascii?Q?FuFaLtI6rbGaTfFZwkHXfU82vRVNaBqY9FY8kUhkkmwRvh8TIYmIkO7y6zlS?=
 =?us-ascii?Q?3Esm5kBCuyfbO+SbuHkzE61EcOSOGAbLrDuhI5bmp5vfprRCEr6H+iDXMsSs?=
 =?us-ascii?Q?eAmFdw9KQ2TnAxzbxWc27QogLWg+7xsG7F5kB6uqeEC21Xlj9dVd4tSc6i7g?=
 =?us-ascii?Q?UMEGpcAfj//Zqr6c3q+hqbhIA0MBKpYcNG13QBwRPoqY2owPlpYGhkFMtYCs?=
 =?us-ascii?Q?f/xh/BGQzhPcE16pUwlDr5jOJlMV5NTZTqbp5eWvF8GJ6dYBHdCWiBb7104V?=
 =?us-ascii?Q?o7zODoLPVDZap7vhPTA13/snyoDMRYyJyo9It9vZo2sTyUQldjxtUwpUvQjM?=
 =?us-ascii?Q?fwI3RZUcL1coS5W2/kLiaMgyrLOKTwfxJL2LWJr/86FvxM8uOlBtE9sJTfAO?=
 =?us-ascii?Q?UAeaeleHVS+vfA3tkkux2Yqc7WC0XHygIth3WEY8AbQuL523i2oLzfKmUEDk?=
 =?us-ascii?Q?XL+LKMkiuBjS4VvcC78E512x1FyRurjigrs+qsM1pD16+UmrEIT1xxJe+ywN?=
 =?us-ascii?Q?0UmFsfq8+Y+95tp1zktrIM3KHh9kclapx1WXBNtZ/QWlaOkuMmNqYJT3+fs7?=
 =?us-ascii?Q?A/YgZDgLWqCNtZ/YphK5trImQfJS58lR8A7vuKb0HB+nu0nosK1biPcDoB3m?=
 =?us-ascii?Q?b0C9gg7Lo5SJOkftMooklE/Ulvs2WAihP2UUESXTTN68ebqmQ7My9vgn3zKr?=
 =?us-ascii?Q?9EDeLMUZI1MnA1Do4TydiWCXs7ueZN+pF3oENVBn/NqmGW1XbTVoyB7ODDG/?=
 =?us-ascii?Q?kX9mqt1bCvUfjVe5f8vHcDJtwK+IgtwUuSC3tz940wyCl+blBZa8FoFJ+Cuy?=
 =?us-ascii?Q?aGlGpx/4O6G/1BxboE2/nTY2GziXEZjeg9p0fqMos/TROIQGFnTthDCnE1kS?=
 =?us-ascii?Q?NUSUXlRkSEaCDIN1cIx1pIUua7E94018siwybB/3t1Wv0YTZ5eVv3j+WCgd3?=
 =?us-ascii?Q?nEKoDklISOlInsYgA3n4QMY9fni3tokad/OESrYxZh9X4rfAquTWZmDujt+o?=
 =?us-ascii?Q?Iq3WJ8RPaZs84LoddkYavV2fCmhA/ZksPxVcKYgKg2wGiM2kZFqT17Q2PdFE?=
 =?us-ascii?Q?UrWWJIZNEYZ9Tsq7C7TK5vitCcz/axB/WswVHBE5n5UjQVPLmnCT5xJJ9wNn?=
 =?us-ascii?Q?3iLgH+CIWy0apPHuF3N0WvmGgxSbVD5XeQ58lFVE5lxF+osC5CyEFyQjQiWL?=
 =?us-ascii?Q?EZhXgSHf9PIqSwvGu816hAgwuUT1wbeH4SmiphMsp7IY5t+iumfXQ+o+d/4m?=
 =?us-ascii?Q?yBNd3LBw6X9fl6Pjs2U84quAVeudCbBvB9kgbx0wxxs8VbNP3OKZ3HRq9TpG?=
 =?us-ascii?Q?l39HidT9vsJNvfx54KPlfeJ42XjuP3/HPE2YvvptWroHAwYsIiliIh2NwcLp?=
 =?us-ascii?Q?aIpx6ie/88nm0VDjj9BR4YYzlzWvdr7ul6LuxIO/274AKiu1FUOoAPsHM97Z?=
 =?us-ascii?Q?s/tJz7+LwHQKSENUhc7vn4xTCDEizfMW1o3g0SYlaqYwR/C39nhxjEalGdOT?=
 =?us-ascii?Q?emKnCI7Lot37jLKIgPk5dR9md062CxhLRG3G7aX0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76a413c-d601-4159-3247-08dca53ce047
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 02:13:25.9005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mEHzv++203dRVH1FfBe+jHtXBrcxaWQi0XOwWS6lkIfOS1KMP8+zZkb0wZzMp3TJyJfGa3/PRIWJ8d+4vvTJSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6119
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202078

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.20.r=
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
ETA for completion Friday, 19 July 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On=20
> Behalf Of Pokybuild User
> Sent: Tuesday, July 16, 2024 8:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build=20
> (yocto-
> 4.0.20.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.20.rc1) was completed on the=20
> autobuilder and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.20.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7140
>=20
> Build hash information:
>=20
> bitbake: 734b0ea3dfe45eb16ee60f0c2c388e22af4040e0
> meta-agl: 75c7354a09c17447e0aa04aab945d8d4ea0bae80
> meta-arm: 260e3adc2bf322f52d81c0642c825088a88bb051
> meta-aws: f8eb3b8a70005655f3aa9f790538088a1dd9d5ff
> meta-clang: 2ed384c64e206016c628451672c688e59944381b
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: bb7c7b0f448ab6541ab42a316dfeff1f7726252f
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 6ff0748a4741517519a281985fc3cd95dadb633e
> meta-virtualization: ef76369f844f8b5afea416372172824987ad4fec
> oecore: 5d97b0576e98a2cf402abab1a1edcab223545d87
> poky: 6bd3969d32730538608e680653e032e66958fe84
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

