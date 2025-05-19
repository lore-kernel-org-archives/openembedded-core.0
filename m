Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8ADC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 14:18:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web10.52289.1747664317261434836
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 07:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KJeILZyn;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747664317; x=1779200317;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=x1/ZuPze20SWfuS8heBJpty+mRggzot4+mn1QKfrwSQ=;
  b=KJeILZynpXj6MRBXwcom70J2392sYa1AstUjHZWR1L8kqyM153CK8G5m
   +0UrKbff4DfRlT2HFo1tXE8HErCMdnHqIae0nshCpSTtQn8pkvmXOt55R
   zYjN7nctRIRU2CFR4B6nGg4lDIP+OpBRpP0DcdYb4wy6vc2/gSBaTB2Hz
   /pSl49v02HdzPJeej/uGOwqfv2yr43jbPSxkikg+bbEz5rdaYXiMKg5KV
   kcllIeeKe+S5ijTTBUbSqhjtwfsdo9A2pgEp8Y8rkwQBDjbrRvEYj4ie4
   p7+N3RKJDuNmsCuMTKrSWnSb+65I3ZMTLVQwFaPVmRx1uIPI5pfBKbGVP
   w==;
X-CSE-ConnectionGUID: 44I5vQDpRf+lI6O/x+phqw==
X-CSE-MsgGUID: 9JckqfrNQZyyPEWD+8xRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49547752"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49547752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:18:37 -0700
X-CSE-ConnectionGUID: YYBCXv2sS/6nYwJtfTRFpw==
X-CSE-MsgGUID: Yrzhz++0SpCzIf1cMqSbnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="170291841"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 07:18:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 07:18:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 07:18:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 07:18:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9jruj8n3GK/3QWJvHqJAV6rB5rueuD+a2bt5h98reGlA4slLf18kJLj3MqaclN9O+Bs/C1VVlvw/KAcgfK6JjE8GH3Ihug71Nn1LUOn6xOEy1aWaURqsC8dSAZY6zoCxvGCMX+J8c51onfWoxldDSWMY3ZqPZY9PJnhEmUMwcPBBFtNw1A9kfExa4CptGdy0lmKe1shb20ClOyGJi2PyOKUEYvMBMmU+oOpjPee8eE9hSha95Tq6kMO7rxQfKAgDvCRbYcaVsqsNQahqJBnPja6cCeYlJUguoiz/cKniHtnvFRGFSgVcwAIL5lC7tCAm/yQljnHpb3n3GwPa5lVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myUv6Puo4/oQ0akQrQRJrPvUED+Mq8ZGV+s4mufOGD0=;
 b=gdjStdZ/ms3hghrilVo63Isj/2HObtMtZH0jYjIDffSGTk4/RDoM9yJdLv7EpKHl7H+MHI9QorUQELt+9EfZF4Zqu+Bd+GunqEZ7BEKQBtx5yvJQzuzbOvR5wGeLZwxHyDH/ScZOluG5Yj0xPtBuLOczz0kPCYz/wSd8hCygRtCHnYT9NJbM12cTPkdZCWZdzLGM3+MaXuGxNuNEe2Uj0Ellc2NHgzSb59Gj8afMfAglzbaOwIPOfbb//Ki+Kjj52ajP6nDjUvJMZ61MU/Lk7/YbIbXjiy/jwQJ/0L/pb708k0lUcuI0MPuDrJhuqT77a0DXHXM14L5aAbLN0FjwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 14:18:34 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8722.027; Mon, 19 May 2025
 14:18:34 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.27.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.27.rc1)
Thread-Index: AQHbxppjaze1LuyhKkCwb7U7F8ONErPaBA6Q
Date: Mon, 19 May 2025 14:18:34 +0000
Message-ID: <DM4PR11MB7760242437D4AA2D147533E7A19CA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010196da9c898e-ea7e03e6-5552-402b-a021-4e0f3dc851d0-000000@us-west-2.amazonses.com>
In-Reply-To: <01010196da9c898e-ea7e03e6-5552-402b-a021-4e0f3dc851d0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|BY1PR11MB8005:EE_
x-ms-office365-filtering-correlation-id: 005a89a5-d2c5-42ca-32fb-08dd96e00a10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?f3DUTkaaErgDiRUgXWq7R24Dlg4y6qT1vTbb/4VRjoufHfknOT02BhfSGitj?=
 =?us-ascii?Q?fcDprOi98hg0W235VBoQ053d2IDM1j+c+AIu4eDB9xbl03ZGPpTAG1w0SxRR?=
 =?us-ascii?Q?2r3IiZdU31ZBP57bpkLaYWVTz0TIVLv1W64GccbcryFH9WEzX++q7FdZrKHl?=
 =?us-ascii?Q?asGCzjhlZVBvyd2cbZee6tnk63PbWwpJOw0rprNzzqe8hHgV6eWoSAlOB3JL?=
 =?us-ascii?Q?oJVkPhHu70yL3iz07ZyrZqr/g/5s8RdjczMT8mKxrLjihfUFqAhdvKGL1BUy?=
 =?us-ascii?Q?hm3QQ+VYOj44a/CAqKwX/P0Ql8L/7aAy/QUFFjzzjZ2WPx/l3Z+nxb8K4ooi?=
 =?us-ascii?Q?0vl3DdCkKhzYvgzHdI+QqyWOSAK1KUEQoZ98RJZRRnDX1Nl0VlGlsgNpN4bG?=
 =?us-ascii?Q?pWFwRgDicrRovzNcHnl0JdwHD+bHw7PYqwYMp+INpMe69r0JrgQ1q+260YIj?=
 =?us-ascii?Q?QFkGZ/Kc6EDVg2jkO9OcKGaS+fKtwOndMiMtRVQ/YFBGO9tuHbTM4I4yr73n?=
 =?us-ascii?Q?Y3E4KE6maMTMEJVnKkwER6n7VFYMOjmGLsA76X9ArutvtWsYj7GFaxST3qiy?=
 =?us-ascii?Q?yHR46tcuZFkIh2m56iUhuM53fgG4s3cIyIBwe+NtVqA2Zy0iUMiUsPmdtAaY?=
 =?us-ascii?Q?OMYzbE1BYkjyLkOvry8DJOlO/+pjNDuq+n9gsLajW/j84jdkX2Mz+R5UzLMY?=
 =?us-ascii?Q?FoRfSPYQ4MmIAw35/rLkum4qxF8K54XIOMWu0fam1TtjNBjCoGVRUy8I1U2X?=
 =?us-ascii?Q?w7M+yaoIqzoKVzZtbYwSKAs9yy/vd0WAioLNeHSkzeNcE4GhZR0/4uq0mKpw?=
 =?us-ascii?Q?N4lJ1+/2UEW+TOkV0FYmjI+ujmi7Pey5gRsorpF/PSMhQv2rledFmGQGiesf?=
 =?us-ascii?Q?yyN9YEl9YlQldyZyqcZ0QfvK07gfVJBZc8aw4V/yKXnEDY0X2ha7xJJqmin7?=
 =?us-ascii?Q?k1lrS3c2CQz2bBsVgqui3BnXcJMqaU+Jp0A1HvMgHLwDb0gzdbJfbCjqFdI8?=
 =?us-ascii?Q?sb+jIXXjEG+0FhGcGyeXZw+X5fW06lisTgtvSElG4VLNkiT8YS1+JH/Z9zRP?=
 =?us-ascii?Q?eATYVjOEi9fAk406Wv2aD5i+vLDK+FZpIh4NETdZzN65ZFNiRc59pH3DP1PD?=
 =?us-ascii?Q?0AZRibQ02CVizwrq1Mzo0kiEJ0ykPY342rg/TJmIS5/QjgE78U2wpYHuPRZR?=
 =?us-ascii?Q?a61dJshgxV5hjlLPKLD3yn0+LPtP25TW/4/nXCfMNqPJCm+OdZDVXFqORLMz?=
 =?us-ascii?Q?h6dQmo1WnrLEsCankMV68PHuOa1koxba6jCgh3m6910WH7eeKKA7rs3BPszG?=
 =?us-ascii?Q?wp8ocCw32wIVfFDk7IK239KfGXkBoAoCi9LmHTJyWuQBcQZHyxrCgYvVOdbj?=
 =?us-ascii?Q?U6qvuRzzK9IgLArirWVV6Wo94DUhuB6DX5Uf8XW2k+y4+TSWy/AKXVXuYE3R?=
 =?us-ascii?Q?sKCLivS8ww8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fujJJqJ1uL/XZobv6K+aTb27HiPVVlIDnzARF69Gr7VigryzTzQi8Vtcbqfu?=
 =?us-ascii?Q?6tscrY9aU4lut5FHcX1HwcJPtirCipbII6bzSTICJ0nkNKhsFh8Yxrtgrs2V?=
 =?us-ascii?Q?JP3VdgCN5v5Vvn9oV3AKVSNVrFQ8i/nvoAlYLNDUUzaqs866giQJvqXEzxN3?=
 =?us-ascii?Q?PErKIeyGcEw3PzgUAGTFMaJA2Cf84Eh/wQvr7HP0OXw7g3hXqmKlyHR7XYcX?=
 =?us-ascii?Q?QJT59IH/gRp1+A2nzeowWCJAKUQ+JwlaPfLM0N1J0BsE/x7iLxkQRMtybV3t?=
 =?us-ascii?Q?cp/M0Ms1oiYZ/4PLF8N8oJnNKL6Mpb/uBPLVglIkKHG/EbkHRIB6rGPKjbAO?=
 =?us-ascii?Q?tk/b7C43SzONOSBetSp8LKnITwimxrp21kUOkywdNbJn0ODKcy8VX0TX3O30?=
 =?us-ascii?Q?mIWVWJW0wz4aCHmi8n7J9nQW629lmQLplvR7L+79/sSuk2ksTqs0GBne+cFo?=
 =?us-ascii?Q?gjO1KW7yyv8K0YRXxGx3lF/GGjX9taBUt5nWzLJoe86KB0zhxaj+B7r/wRdj?=
 =?us-ascii?Q?QrU0KkknzoPBmylZ06WtKOx8+YD22yq6vwQhi2qTTDYkOBs271MxcAr7h3xT?=
 =?us-ascii?Q?CGM5PmUClX8JeWPWGtTzNWkdBxGTKRhwd8x5XNkAGSwOU5tJq/0mSo8yd37o?=
 =?us-ascii?Q?wUdcLCkz2ro9LnsaZdyBpMjuuFW6B5fNN140yHx4bRvDp3zXGeQOQCXc/zxo?=
 =?us-ascii?Q?5BlF4F30AuTPFt7tczsSzCFWtVkPUFKmMmVzJNoIi0vs+ctnf6jymvmOC0jd?=
 =?us-ascii?Q?YCL1h3AFL95yVJnqCKQyB7W+dhsQzqPVa0zKlG6QzU2IYvQmA+aqiNUNzOb7?=
 =?us-ascii?Q?HMk0hjXBs0U/zUYCSXaj8hYn0NKF3bpFkdNdacH99bE0G+xAMUJhXGBpMNsl?=
 =?us-ascii?Q?SqTYzfVnfSwCG/GKCCU3kqY2wjx5PR8HQXaRBvfjMytl99N1OSqYYo46hM7b?=
 =?us-ascii?Q?UGPLEaSM8fmg37DTo4BqosbFrAkAgATUBke8m+TLW7Lkhm/xcP2AAPygZI9Y?=
 =?us-ascii?Q?LOd1dQhN7sRSME9BmrkVY9+wYyC6N+PCBtzwuzbqRkrbU42YJ8km7d2gva+8?=
 =?us-ascii?Q?nNycOjSWUQ4ys/pWORXzBszNinKTSiC9qDIeGiOfJI2LTCbtoJEg6l+b2YUu?=
 =?us-ascii?Q?s+dhyJn91/XDgJQ7q3DsABUeMcvV8gS2bbsrutxC8NeBGwLF1/DUE/DftEaL?=
 =?us-ascii?Q?bHfaxZ7lLIrPwUua9TJful/wyoU/GdKYrBcuTxVXofWi0w+iZ8gAx+GGRgQl?=
 =?us-ascii?Q?VTJSFJRsjzmCxy25eMb2IERO8ZCpIqvvMb1smUm/myvo+OO2T6+PO8BmFzvf?=
 =?us-ascii?Q?Z5qMf/ert6H+qv0F6SSpZYvaCezGfuszZA6aWt7K0L92AvnV9IjvmnIe22Qe?=
 =?us-ascii?Q?NDJWP0MuNAYfvz4ReaCkpUd/94kNVHq0iTWLVJvOOtd5ydy+y4/7kbzi0Nt2?=
 =?us-ascii?Q?ojS6X9TrXxI7CTlIIMzM2vt4+wTr/tKLzmJrYZMOnj0cmKL0+x9Yq1m0Rqly?=
 =?us-ascii?Q?HfQE9M84u9UgLG3yqVgBXfs5/hqdOH02n76ZqDYEwW7UgipPVRCUBO5kHgZR?=
 =?us-ascii?Q?hIY9ie5zMI7+lZht8FiNM9rR+f52lkFfWYhuXfof?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005a89a5-d2c5-42ca-32fb-08dd96e00a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 14:18:34.1644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h4+DB9UIYgvMWCd4/J9nzECvq2fgxuQQF2UpOpkDNIJNE2uNyTrvWKklifs1V3p1kjyv/kHlKg82DCSZKOD/dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216859

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.27.r=
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
ETA for completion: Thursday, 22 May 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Saturday, May 17, 2025 3:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.27.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.27.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.27.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1605
>=20
> Build hash information:
>=20
> bitbake: 046871d9fd76efdca7b72718b328d8f545523f7e
> meta-agl: d655b47bb267e6e167baaa49421b1ae26c25f74c
> meta-arm: 6b2d97cecd1b0e4bf4caee9a65595d279b57a686
> meta-aws: 9dd75f69c59f19125ac96a796bc97f06c4dc8a40
> meta-clang: 8a1d0a1993040ab9d2fb7259b71e4c9582f5cd17
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: dc0948200594dacece4da91f4c501e9a9fb0394f
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: e42549cef364ae09b3b7c8b64bbeab32e50f1bb0
> meta-virtualization: 227cefa1261daf20b7d9737541994ec2bba629fc
> oecore: e8be08a624b2d024715a5c8b0c37f2345a02336b
> poky: ab9a994a8cd8e06b519a693db444030999d273b7
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

