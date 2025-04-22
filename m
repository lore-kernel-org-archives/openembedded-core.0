Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C29C369AB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 01:05:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web10.29737.1745283937684080807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 18:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hR5lsfYM;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745283938; x=1776819938;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EFTzmuTPJVIKLKdSsCZIERPZW9ZY0oX/2pc6ARUcE7Q=;
  b=hR5lsfYMywkyi9aB0W9vnMKrLyrh7B2q9xUbn6SVh5wbtJ302dPAGE6b
   U5k6ZFJR1eVyOAYCS83q/alzZDkzqFFTzin6+GEGaxLb5rf5kfzLGvIN1
   IFLOdWWC3yblW+4WLExB77H9/Xw6VIfaMQ7BsLrfUQxoBBOGv1Sa9Numv
   stMpox3W599asX2YFbiK1dmDOA3UNmQH9fZiC+KCiUIy9dRgeiNn+mDCD
   GNE85fwJfYB/XgAtfFhKHCQKpn+7tTgpuo1rk4EkyM5QHxGNxJ+mURiIH
   GpMD6Z+GWRCkb6P3E7d/XJY4N07vlZv2jQHS9Fr9m/s7sCfdfIyEj8GEX
   g==;
X-CSE-ConnectionGUID: YTciNM3GRUyU6LBx70WZuQ==
X-CSE-MsgGUID: H8WiDIafQlmEw5WddEgcJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46930294"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46930294"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 18:05:37 -0700
X-CSE-ConnectionGUID: 5Gms0Dw8SZCDZJQEmFhcBw==
X-CSE-MsgGUID: UwFJpskuSmOeBj7hrpZS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132746349"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 18:05:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 18:05:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 18:05:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 18:05:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHqmgelsmc3cbnvjBXYGRT7urL4gfCCjwUGzy2F+fvOokwXGjfY0VXpf9BV2C5bRmnXxbeMuNqr/IhDk0wFUGmQB90JGt27DtTUJ0wJ/xinKU6O2vLWnZf7aUA+uJAHnQnvvShQ3YueSzDDANI+UC7vmfu5bQOkHtrTFJA48VuKyWRsYTIFSsy887aWLks6Sen5zAGBbajc1ZSxDxQvHKGWLMGsvMlU4PkZBVimjo2a7ZJRzfQe5DPW64y8UA8Cxy0SsKMMjkfQP73Xjg0XaWPz4ZzwmF42tYu4C7ZGXedBh7tPhxZIgEJ5vNZJF1mQL7Mv42VuORHFM3ZFJhK4AMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMV+fnpIHI9Jfh4R544jNwQu637fPXeUXBEfzdeLDgI=;
 b=gNh/ZmkLNMpoGFL33L183UUPj1vvchMafI3nWQXEU0qbj6VECSo7jFE2/Qk5WmmOo0OjRfZv5R/WWAZCSjZoPk+z7d7my/TpYQGF3DQDZOo1pYYeWzNiSZfC5xWSI6ksfYn8rcFnJdfqOHeCybt2l3FK78zZgcYvd5C0F9z9UWf9Y/dJHSVNcE2AIVbFQsH96cZg2LMEVa3DgCr1S/NSrvuVgilb30ROD2BR7JeRPk8QEQRhRc4TUXKf5xHeWEQOFHFQvg2/JU4k9iqfnPBxrU5I6Df5uyz8ZhuR7lozpgsQ/79/a8apioCyFQs8/pZMF75YsfUqAuloeSRlIWAUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DS0PR11MB6517.namprd11.prod.outlook.com (2603:10b6:8:d3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Tue, 22 Apr 2025 01:05:28 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 01:05:28 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.9.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.9.rc1)
Thread-Index: AQHbsZsTJ1MG8iEGekiT5qXLRVeIR7Ou4aIg
Date: Tue, 22 Apr 2025 01:05:28 +0000
Message-ID: <DM4PR11MB776090264B1B1618DDD923D1A1BB2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101965100f948-c358e3d8-c280-4c1c-96eb-083f635841c9-000000@us-west-2.amazonses.com>
In-Reply-To: <010101965100f948-c358e3d8-c280-4c1c-96eb-083f635841c9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DS0PR11MB6517:EE_
x-ms-office365-filtering-correlation-id: f044367e-30e0-4322-6830-08dd8139c574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IkXK61gKNIlFfz43BUJrA3FOdBIaN3YbzqUFQHpBUfvt1RbQ9U0FVx/WDW7o?=
 =?us-ascii?Q?nv3XA9K6PdooS/uk64hSUrXzHeYUCZMfrjqmRFsrthfkskAzugFr1kf3jDt5?=
 =?us-ascii?Q?yUpA3d9Z5F6HfUsjopUhRHZRbA8C+CtQDIxC9TcigYlMLI4zlqAP7HcLEILZ?=
 =?us-ascii?Q?y+34Xo6oaJagxWLn7rOenZOoNZMJZ+QkcTXmnPYxiom4jLzWZLMp6wFr/5cY?=
 =?us-ascii?Q?GLKRzPcJ6TntvEsnG9IJSqwaSjQP0HN2e2WGPNnGU5kWS6WyoD7BmLqvJwPE?=
 =?us-ascii?Q?z6WgX+lvQEFt30wzpJTOp3AF5tgq8VA8flv4KUZfLQ1IX3wVTbcd3aBsQimE?=
 =?us-ascii?Q?ACVp9raeoHYg/T32wIa6lIyh1o0elcYKBlslZvOJs8kCB+YRyphsCZZ3eiZN?=
 =?us-ascii?Q?3XZKMHDZud+GEQ9lk45u/qbj7njquVcmFKlhe9D9Yp+HjC11ckOviKkUKCpZ?=
 =?us-ascii?Q?RMWILxkJgKrgHyskjgKVkSX91szTfEHj+kMmCvDWhf2XUR8TOQlvZ5UOJfhu?=
 =?us-ascii?Q?WPX12VV7xiLqGt2kJjUaaTECMyeMzur27ZAbQLMOtOh5GvENYfmWBCAsRivB?=
 =?us-ascii?Q?SHDiDpens6Hzqv5FgU0qQy0jjS45dEqrVPkIaMuqO6CskLVcK5Mads4wWhYa?=
 =?us-ascii?Q?TnaHkxXWzgBSBqYBUAVdjT6sgq312ZXX5c+oLsxp3bHj3QKtPGkEQeVP09uU?=
 =?us-ascii?Q?NcTmyvnbZgCIr30O+v1toUAquc/3HpwXJ7zJ70sAxdWXV8dXpkoxCFnTuGGI?=
 =?us-ascii?Q?+hBdBN3K8JKzIZOzt901q7/oPnLf7xF2BdPpTxNTv3oWIpmUZA/3me6JA6ZM?=
 =?us-ascii?Q?F+HZgLp0zH1gs3HV0iucB/tGODs83PobYS6mbkgKslAP/WfnHCZHJf//9PyV?=
 =?us-ascii?Q?jp9mBMsCnKLquV9/evivEHV4VrKZqltV1oA0AQT5vvhyZ1O/hlcXxbPpGLmw?=
 =?us-ascii?Q?7Dr1IEM+NtjCXnf3ZT0N7pNP9VZO32ogUtyqQjFs607BsP8YR4jBMYORfZE/?=
 =?us-ascii?Q?fE/oCcZKCzzfE0J6R62xvjZEQu0WU2gD58FMfnK+MnQHsw06o9sndClmzFr/?=
 =?us-ascii?Q?afIeT2xkyuH+UffqXBK3JTTf2xZn5jP/Qo7+IFJoP36wEWeGJgIU6307jHqy?=
 =?us-ascii?Q?abgyyHmIfHPzJboImvSLdsNTdZ5ihyUvo3WsLEYAVRx4jh2ESGu22cZsba96?=
 =?us-ascii?Q?l82viMjylb3EzgzQwEMGoh9dwsJYbmML31PK9T88eZzZ3IRJirozlJA7h5j+?=
 =?us-ascii?Q?upS+Rj8HE4uWCx/dexv0Is0y61hF9qjbNizMs4u+nPT0iYtr32ApfwIAtE1K?=
 =?us-ascii?Q?8vuuM5A9IhxzmW1E+ngLRLZ088DcUHMF6VM1luQeVNiXcWQnSsy7w/xToFRE?=
 =?us-ascii?Q?yxNnqyzu/DkYl4U9TvKtWo9LYM2i7wC801Hp9kObjA+JioYgLLKp9Ku0V/pg?=
 =?us-ascii?Q?N8kFUQmphUw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KU3gIfxPVhOYl1JPQHTDjwO20JXeLhkNXRMLGFYUU2WLNMWBf7lU99WKq0xq?=
 =?us-ascii?Q?ODnXHHlWLrVJOMGOSf2I1A0RLK5Aqyq+cAeYKAt8tMqP9TmuX/ugePqAniML?=
 =?us-ascii?Q?nLPDbE/bd2/i0ZG+84WlHiqO/xCXbZOqa/iK7driXs/PAPuBqkinxrGS557V?=
 =?us-ascii?Q?l21k6LHNeBbLu7r+Ci3FXJODDqMlbiGBBHl5Qn253AOq85FUrz7737eFD3Va?=
 =?us-ascii?Q?IAQw4ZaFpaFxbBn16wbKtPfcaWvnFyQKFJ/SXpr5NSNtOw/DuHVaqyNkd3fE?=
 =?us-ascii?Q?1D3bKkaQmGo4PZYDN5m0EL4PQb0Bf592yBHJWbmxNP2djqJnHwZ1Stn4C8S4?=
 =?us-ascii?Q?s021AWBabHDqXiCWxqi/uXBqFenSUIBo17JLQjnyU2ORwgZ61jRRzf64XI4J?=
 =?us-ascii?Q?nf3af0JtoplPsjU1OMymgWuMxN1/wogJZsyYg+hpWv4SkUfuMciVHg2geMon?=
 =?us-ascii?Q?6ro5nPKmiebtpxOuFueNxZh0FUVvx9DBc6FVfwTb2Jj/QroiQx7t1gQkS/pT?=
 =?us-ascii?Q?LIb/mfAaXFpwAPLZO4GcgQEHkUi8neURMx3UDKJfG33J4Ng1piL6Mg9tkwff?=
 =?us-ascii?Q?p34/SBtY84YRIyGw3GTC1hLteugCaODZqTtKZd0ObnpiPI9cLAVd4VjJlrL0?=
 =?us-ascii?Q?V9q/fKQeiFaRStkWv1JBtJrOjxZaaCKB3AnsmCcB/+dQFaf/pEu1HYDiSTNC?=
 =?us-ascii?Q?l7o01sbSjOMfKu9fDbM9c+D4/5CvhJiJKgQVLRF16OD0pLfeSBDFaW/0M6+n?=
 =?us-ascii?Q?qAA0Uo5St3pIoqigtl8OcXpUF1kUzWUliZ0eA6h5bxjTjXwTUc5R9oA+yrco?=
 =?us-ascii?Q?vK5Me3Cr0kfvAzNp3OA7QGi+kMCnHKahp7f29E5R5vIGx//4DMSpsPSYqRCb?=
 =?us-ascii?Q?bEJoeowFwwxNX6pqg8whIDxY4wK5bsGTorJb4f2bQzgZ7zOEXvbnsU4qvK3u?=
 =?us-ascii?Q?+qgE1gFJvo8xn+SlYo3EhqZERJnDKOaHfnhzXMi9MI8gqFu6kqfqgU8wYzW3?=
 =?us-ascii?Q?KB/ISavjr5cpahZZK42Ye0s8Gq8odR7NSc21TsAB3g1c2cXVdhK2EvXjgirB?=
 =?us-ascii?Q?exobyBzGHc1Flf7bn2p7anLjs+n4NR4nEk8EBpxelvFprsOxWbLCXKjEPAW3?=
 =?us-ascii?Q?fBlPVH7o7rUjPBUU/G5QhAlqGO7h8JF2Xt6S2QClnNCl28MhSUdkYEkQ5Ihq?=
 =?us-ascii?Q?sonJ6I2na6yevsEqFAgi7R4z1BAadKRFZHyTUOMeXNFK80E8DWFhjkLiHn5c?=
 =?us-ascii?Q?fvprKJ5gmKl8Kg/RQR49fTALJeXHJu3q0BNQWlpo4ARKPaN6Wv2a4YrJNvfS?=
 =?us-ascii?Q?tEXj5acs43WKEitCqaIOINxj3sdK/wrHECmzk/4HN4o2+swSFvCdp+o1zzYk?=
 =?us-ascii?Q?9Mxi5YDmZ7Obo7SMvAR8d5BZ56K1ZbDhWfGCoYyyzI/sKb9EGn+skI2iT9x9?=
 =?us-ascii?Q?qref/kEr/hS3GueAmsFRJuucu2Mm0UpGvp5GOYVEtnar6PGTtcs2466ib27k?=
 =?us-ascii?Q?Q6EQn+s+SbOnwt+XQZTQTOr40UcaFz6KeE80c7LNujjCmIp9+FsDx4N2MHRJ?=
 =?us-ascii?Q?RGs70Xgi2EFp3pmo2kICR9RmXcBHC/K8rL/0HDl5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f044367e-30e0-4322-6830-08dd8139c574
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 01:05:28.1859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4WwJ/cLqC+zJDOnzfplJxMVOPqdwK3zEPToC8TJtpeaKh5rhV0wZGjhTL2L88TTfrlqx5d7oI5FNLYOEOnySg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6517
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 01:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215189

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.9.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion: Thursday, 24 April 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Sunday, April 20, 2025 10:22 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.9.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.9.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.9.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1423
>=20
>     Build hash information:
>=20
>     bitbake: 696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
> meta-agl: 70d6b766edd16428e5a3e61c82b4bbb2dfea2de2
> meta-arm: f3640941c600d03ea53ce5b9254f0fead18f8bc0
> meta-aws: 66780aa4542c6603420b2a0c2edf9e15e8b99c40
> meta-clang: eaa08939eaec9f620b14742ff3ac568553683034
> meta-intel: 1a7ccdcaedc965f019a9263364437356b8a2ba29
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 67ad83dd7c2485dae0c90eac345007af6195b84d
> meta-virtualization: 9287a355b338361e42027ce371444111a791d64f
> oecore: 04038ecd1edd6592b826665a2b787387bb7074fa
> poky: bab0f9f62af9af580744948dd3240f648a99879a
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
> View/Reply Online (#542): https://lists.yoctoproject.org/g/qa-build-
> notification/message/542
> Mute This Topic: https://lists.yoctoproject.org/mt/112356251/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


