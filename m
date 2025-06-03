Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D769C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 02:54:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.2557.1748919284231724584
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 19:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=SzTuLrIC;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748919284; x=1780455284;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ddXN1bnqXlUPeVBH5pOmzGCJMOcVN3jZXeRgNCjXK1s=;
  b=SzTuLrICKszCpHtr1Np3RIdQ2PHnlfgdL1Nt360/rWVzAXXI4buEHmgC
   3pybDdowGT4Du5TWTcJZ4zVl7zROtvQWkK2Iq8aZ+5hmsVsz7v2M870J9
   2wV1aADUFxtRAJCEbD0UFFTUUM0sVIJLa4RAstTYZ9h7Zgj6NDDXkMOcU
   W4PERV+q4DPsDOKt9Ly29M2pln3+V9bvVIO4H95AXCuIrPM+HtSYh4FqH
   eG0m3VBQjzJBwaEvNWwX/P3OBqrPi7EXmq9AmonF3YpFoAyc6UfB16duf
   1rIiakkZTjXa5FMFqLlXkj07wf6YkN4An5ZltB4kfz5KkEwIpdAqsx2Zx
   Q==;
X-CSE-ConnectionGUID: u8D0wDc5QA+OAdrRA7jQgQ==
X-CSE-MsgGUID: jI5TD4WYQoeSVehcWauo+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="38567104"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="38567104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 19:54:44 -0700
X-CSE-ConnectionGUID: pEvtiUNIQeanKvh8uSxl8g==
X-CSE-MsgGUID: GFn6ejVEShaImxKD+4wdQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="149500607"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 19:54:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 19:54:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 19:54:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.62)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 19:54:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJW84IxIhZ5mLyvM6Q05W4yo4xTlx58yNVFdN21afA5s0ZFJuje60urGxQRmLL2KUzfkyFa6SVLC5OJ23AyT+I6xCnj5dnzOyPOEUd7MttzWBY6sGV0MlMT6yZiEQsf1lcIiodEXT0qWxEwu3EpPm5Qmg21N9e1Lf+II7OsxOJuzQO49fTFfEa2m4/D5V9bA4N2KQPfmJT6Esx8N2lXQS7qDlS9T5JQGfnF+hqIdPAbHX+MHH3MO18j5IN5ANxmr8L2ye3nYsMU6AtBH0QZn4q+N02vUaIzlf2hs1y+nuJhXNcqX05g5smpNjlPG5+RsHR3MRXtO3c3InBEJfXgBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTd05VS83dt6QB1L3FCOODJEevdd76+EbkZX9lXL0Zg=;
 b=gZsrd3x1MV7KWIqmoi5sCgWw+F80J5XQJdkvGruVtCWeMLSubWrbmwXPv8jOx2xjozNuvVOdQAXbLIYtoFkwGKxA9X+B7BqbuVZ1B6L/GQBdHcZye3iXAgx3jZ9oYzpXcdqhM/Ems8iuOuEx2oB2YHnBalQzYB2cb5SdJUtzsmNe4DI6DiASMYFrkTUiduSPxGRI5FB5sV5eGpngMknshMWytjfSFZ+Wtgq3GVICF2mRc/yp2gnh2L8bQPv91kqCYYwj69C4XYFmZMabN8wFHwQduZtFEEapdbSGQkp8j/X71o2Lxz5Jo4FdKEUwMAhp3fx5v1EUvxJ80FVOOOnkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 02:54:25 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8769.022; Tue, 3 Jun 2025
 02:54:25 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.10.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.10.rc2)
Thread-Index: AQHb1B0xGo9q7ODC70uGnPwsAc7bF7PwvAEg
Date: Tue, 3 Jun 2025 02:54:25 +0000
Message-ID: <DM4PR11MB7760095DCF4AC0ED8AD0E15DA16DA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101973328442e-77dc9a4e-4c12-4be8-9021-49468ec66a14-000000@us-west-2.amazonses.com>
In-Reply-To: <010101973328442e-77dc9a4e-4c12-4be8-9021-49468ec66a14-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|BL3PR11MB6410:EE_
x-ms-office365-filtering-correlation-id: 84b42120-eeee-4742-554f-08dda249f318
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?ibYl9iulVb3YB8wDGM/TdVl0bLxMCR5QFJOf4EOsaa28sSy0Q+xHw8IxW1su?=
 =?us-ascii?Q?DitmlVxjIthxty7aOtzX2mAImLv+JGwhFqFh/4uc6lKSlvOv3Ybd/nR90eFD?=
 =?us-ascii?Q?qOC3Qewna4R2xdm5KV33XGT9K1cWzl17XZQYNLxEmxImpE2nlklsdRS7Rf28?=
 =?us-ascii?Q?C7zfLdPGDQrbdP4Dff4wT3nPp4WkNMeEHNaPl3ZLUZov0XirMX6Ph0rTLC/u?=
 =?us-ascii?Q?CBrqUZOxynEJ5zwNTjHcyZsSSxPslQbiG67PQYPz8GPGg168ADV9u4zQlAb+?=
 =?us-ascii?Q?tbCDzY43+u+F2dUyrFtVcLOhJeRdsmtSfN8ltSQqJuLYlHD0Gw1020jgUkSU?=
 =?us-ascii?Q?x7biErqErcsS4haCJbTWz5jtZ0kcMTDbMsDj1MLTBPbuzvwBdTsgtO5n30hh?=
 =?us-ascii?Q?n772YypdskVcbaeS4Njn6VQ+6E0SHMoncpG1T6vDTZ9lQNyhJyOorJRcLBwD?=
 =?us-ascii?Q?qUOyiOlxUEsYe+hsj3b5yKd1NKPZzWSC/X/YHDiJ3hqwrAz0K8xOI8Kb2MXR?=
 =?us-ascii?Q?l0ZFaoy1gh31DlarXNrlaTgOa7ra1F5jGdmfaQQgc24uABsUcN6+FQfnYCkj?=
 =?us-ascii?Q?4t3HzyPwP9tZ4mPBSdykm/riRveRP08BhZUVay3tkjGbRLlYy7tDcViDqLq1?=
 =?us-ascii?Q?0apjmBxpbSXucJhHHXcy8KiJjNFCuVkClLgSLqY/4Ij8iiJlBYlxL4iDfGlJ?=
 =?us-ascii?Q?l3CQRZbie3CDHmcAxqmf70aVjot+BDCWtQHMmbmuNI4HDUpBCSKme1igDhJZ?=
 =?us-ascii?Q?j0hD7jQba20k5mpkgtkUuXBBRNxTAJWeGaKbq6ErsxtE8bHCZrtw+aXMjwCm?=
 =?us-ascii?Q?NmlOBcob+y+Fld8XAcWZCzL/On7AL2iqiuPcNLlZaiS7rlOvCWUblGihI/Ym?=
 =?us-ascii?Q?QQLnBGUgwll4PQWhZwU3VfvaB9S9AukOU7/33i1cTonA8Nm+VlKBfIHyEL6B?=
 =?us-ascii?Q?l5OCcAtz0jEBomcbaWqustZVdp17M2sDv2JIPRO+mtPcDTBkr8BGtFpyl13B?=
 =?us-ascii?Q?mFmEoDhromHvSHhfie2TxbyBro9tF+1+T4Sn8d8p6sqlGtnI9pRCQuBOblzI?=
 =?us-ascii?Q?buCbj4IMh9CsrpPieTk+xY5Q/zqDuZPhiLyn26o+ic44aPQWFlIQmMpFwYxq?=
 =?us-ascii?Q?/SLj+CWDzUSj4aYby0629KZYe9OfOLHwB+v2Z7Q4TS77ng7R/HUvKjCJ1E90?=
 =?us-ascii?Q?2REenuUf8+SNx1KWBxjtNM60Ts44K5pI3+aYkWt+HLhlJyiNdfZ4WRSXZ5bM?=
 =?us-ascii?Q?07T2LpkSeYNt6DPAZ8MQTmxgJ9KFmHPhMDl8Uh07ieW8GYUoi5UevMs1WlYh?=
 =?us-ascii?Q?WPA9a2uREz7pMiuMN+i81V/gOLZIBP/LkZsmFJ1XMa0ZZd5p1WBEfrY19W91?=
 =?us-ascii?Q?fjdS3ToEEqmYo4j5b4arPUCIBNnBH2gtvdKGeHTIwREC/sWWYDjC0Okqa1nd?=
 =?us-ascii?Q?oGbjpJIpu48=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m1gjsORGMVu28rUHggLgd6CUWPEGNi9qaRrRh28jy6MuhBmCDSASi7/5rx0j?=
 =?us-ascii?Q?8qjBPJa+dUutEqsstHb23DMKy9lwFP/3ChIg7lsanKNPSf7P2QUPLka9/VT7?=
 =?us-ascii?Q?vbO2d2UE9uIIndvYeAhUbUZhFhF6w9JAE6S06ylrpOHaxTT/9LHsekcrv/5F?=
 =?us-ascii?Q?iQK5OENWXAiVoSB5fYV0i4lHQ+mVdq20ufA10a+YmMmA4w/eh87NKfS87x+A?=
 =?us-ascii?Q?lnT5lk8bDcbpz5tXGdgIG4MYGDr7pV72kE8x+rYbwP2ZUf/Ew7jgdDtzCgsG?=
 =?us-ascii?Q?equ5FyX5nCtv0KN27PjfL2bu5vqKFpRE5ng8nee+XFVBzKU0cZn191ttjmTJ?=
 =?us-ascii?Q?27OZHDn3D6I0CgTxqTNs7ukN25aiSX2ByHSjuDdV6kKZUIR8BX3/fJEGKS43?=
 =?us-ascii?Q?gd1Nzgp+CiuT5gIcIAQn3ufDMkVT7BDzcqeis7ze+AUkzaKFNZvScWJ6hsiU?=
 =?us-ascii?Q?Xn3EITvlGyo0jtFLItRnu89oBa3eGM69lyxDqPyaDJ3lD/xHn1N8KgpBQSlU?=
 =?us-ascii?Q?o6cOyeX3PGY4BNs8xvWVvLUwv06qbIah0BHTwvYdFwXIH4r2cKBiqrEudD98?=
 =?us-ascii?Q?nq9mEBkfTkGB5PMaixRr9DbkVBZVs/h3cvbsrsQozbqexir1uL0jg9JuLpKs?=
 =?us-ascii?Q?bTKbWB+2tlbt+lWRqUEdsC3HBXjOPUa+nEWUzE5GNzXnbS7mUzWWhgkicdd+?=
 =?us-ascii?Q?6rFse+m0lPgLWWwH1Fx9l4d0Xt7nvxs0rV8R1PVutIX8o65fmRE4kLx2CPT9?=
 =?us-ascii?Q?seeAyk9fQm1Jo6Ic5sL2pTyzzPEyS2h1QIGtZZu+Pbu6rYFav5nIvCRNLvUN?=
 =?us-ascii?Q?j200z1cAxtK6e6UjU94K18iF/8ajhMXTRGjvH2HAw+smPojIMI6ChSH89NH4?=
 =?us-ascii?Q?J+/d+/NdNmMZm0oBqMKMXbvDf3dbLjLKRS4g83qpzITAYeenjY/s2dDF3k4s?=
 =?us-ascii?Q?DdNLjdDy8Q5fX5UwRdJJbI3FwlkOgy/BZEwU6kCY1AqCqBJ8PZQR5CSFW0nq?=
 =?us-ascii?Q?mGJx78jD3ZCRwMe81xgQsPxVqGXmr8fXkTgDtXhJUACfz9TwTjyg8zjfrTVu?=
 =?us-ascii?Q?kAKAQ/bYFvE2Rwek63vWtzikNWRKNtsHkrvOpU4TiAykbwFC7zNL/pS7fNpv?=
 =?us-ascii?Q?7lSg+0JLvetrVIS62+rusAPFjuWbWV/llLgpRBsAju/Z7hDItSr6jBWMVR4S?=
 =?us-ascii?Q?sIu8Q023IbXXtY8VQFiJCuCm2eavS9ut1ggfpKoxJZEmYJVJVxF57YNqJhHQ?=
 =?us-ascii?Q?SbYGgwAH+nXaYN+gOM0RMO4J6vNdiP+CqvCUNSVO8Q4CGTxrOfwlewN34+Dh?=
 =?us-ascii?Q?Ejf8kj1wp9VP1EoBXpl0YK8KQa5OC9dGeAYn1RzVUmZokd7DzV7dUqgRE+H7?=
 =?us-ascii?Q?TXNCDEv559p78cpYLk8wH0JXdTTgJqFmHUC89RH+w3Y1Yjw25etb4TedgPn1?=
 =?us-ascii?Q?3cHAZctag/XUorYuIdyMqAP31yeaW9/GvB0xCet15YPCnDuWzLis1SUyX1L1?=
 =?us-ascii?Q?2yulJghJv6HQcVCboCObFbT9piS6svFUEBqWPs/PY3q0bfVASiSqZlS7yMlP?=
 =?us-ascii?Q?BlRwKTFcThFtZJQ4zrxDaT2LZviL20AHAgUkLudA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b42120-eeee-4742-554f-08dda249f318
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 02:54:25.1169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAWQhT7viwSopYDdNRKgc5JK3Z6tIHtHnSptO8Or943J7vhfP5H5179IfaDt957YMn4O0J5MZhbtMnGvwXx1VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6410
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 02:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217747

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.10.r=
c2. We are planning to execute following tests for this cycle:
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
ETA for completion: Friday, 6 June 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Tuesday, June 3, 2025 8:19 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0.10.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.10.rc2) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.10.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1707
>=20
>     Build hash information:
>=20
>     bitbake: 696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
> meta-agl: 225c289b7245c8d9a896709e924dc0e67eff1e1f
> meta-arm: 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
> meta-aws: 584e2a00acb65eaffa1d3b9058f0301d982a4f85
> meta-clang: eaa08939eaec9f620b14742ff3ac568553683034
> meta-intel: 38e75c8c1059e5f37659c140c010eaa203238fd2
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 491671faee11ea131feab5a3a451d1a01deb2ab1
> meta-virtualization: 9e040ee8dd6025558ea60ac9db60c41bfeddf221
> oecore: d5342ffc570d47a723b18297d75bd2f63c2088db
> poky: ac257900c33754957b2696529682029d997a8f28
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

