Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBA9C02182
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 01:42:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web11.2357.1737682934438856055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 17:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=auo3n7CX;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737682934; x=1769218934;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0EtqrfQUCYt2w8NNpuSSZLf+P94cbJh2F2/seEDAUCw=;
  b=auo3n7CXCN/law8iz7jN9dakiehhYgl7hFvGR1yZS9U25dR1y8bHo+7b
   ZHIknasP5IEkYNl08ucrGew8Ii57kTVy2qo+UXKC3n8dJ8MgR+LqMzcAh
   a+oA0sXxPYG0IlFPMRbXg53Ssvh/a1vhqU+PnGXUlFTrIqRvV903ZlILZ
   h6BDAOpldz54k5KwRVNugKlUvBOnTXIa/ZkOz6UlzIVOyfKfKsVgEuEiw
   PasoMS8WfrT0GXssgtX9naCQ3jcTfaCP6D+id0TBKKBSYoTR2dznSz0tk
   1xupzK3oKEhsgu4v5xSSC4ms0QsWEqtwGWRXf0LmCTXmzUnjW5jIPynrJ
   w==;
X-CSE-ConnectionGUID: EXxNPW0lQPuYUugWW0mClA==
X-CSE-MsgGUID: hXWinRsQSui+2QTRMSXGNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38094073"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="38094073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 17:42:14 -0800
X-CSE-ConnectionGUID: 5rIXkNStSDSjDi8iWbnbqQ==
X-CSE-MsgGUID: 4YuDSMebRD2u7JR/9sTPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107637471"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2025 17:42:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 17:42:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 17:42:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 17:42:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJcwFkMw6V8e/jrFT+zi7/cxGdxbZY8Akq2pExHKEjfGSBmWj5fmUUpTw881/Y672ZsL112Achc3iHxvMpfm7g/1l8UbRZ2oQvPb5Db1mZw61OslrJayG0Zw9m/1cU/pKG1bkWU6RgY5p0cSo0mP1B+6AQZXTPPYqrtgv16lGLK+LCOCdy/sKG80xVxPeSfk+sc9cI/Rem/aTi5ptwPPnsUrh69IzWKd3yYw55neuRKzfoDIJ8pk+qhfPPddY3eNGJgnYBQh0vyYuE2QkhUmg+AtRxtgNjOBmvUJJyA8Zizl3/vxGxk/vc/C1ApB+5lMQir+TwuLE2Y1iXRAgcQOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMNW9iSn1q69UyW1dEU0BbeaRTTSODIwHGeUtf9PX1A=;
 b=Aq4M4W5F3ZyQniHx4XzmnFCK/iqBnyMWwpdZN/jLslwFxVlvGJDaSx4Ni8d33mXoJ8j24QcEgcwnVs3l7NrnmpT+gVtaQCQuustuDXn2RdGdL/XdxhKqTrTYwxlXR+76h6xysKS3CpkrFgadFpvVAk7TZRCdVnIhRbQH+5FXtikBPh+QyyKSW7SqnnmG98aQ4ujrlzGqJwbhHyUSY9lzS7bGuqr+RbnPLwSX/6Fd1HPLV2ml5r+sy/gX+LvOwg5xb+wlWg+bpVPncp2dpdEpczrlVTXDKxtOVHK8loPceUxk74mke4AqdHrM6iBQ3s9kxffMzGLiEHnGCkq8zoaHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 01:41:31 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 01:41:30 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M2.rc1)
Thread-Index: AQHbbfK8ljwtveNN2Uiugx6WDDEa+rMlJVAQ
Date: Fri, 24 Jan 2025 01:41:30 +0000
Message-ID: <DM4PR11MB7760CA3C77A65E9CC66C6ECCA1E32@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010194959a6748-40250453-a157-4f33-a155-893079bb12c0-000000@us-west-2.amazonses.com>
In-Reply-To: <01010194959a6748-40250453-a157-4f33-a155-893079bb12c0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA2PR11MB5068:EE_
x-ms-office365-filtering-correlation-id: e28661e6-63a6-41b8-b66f-08dd3c183a0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?DbkBrwZW9GcATegxaH055vZHI9HUMrRteKvQINoGFr/2h6PmEAPMf16bEf0h?=
 =?us-ascii?Q?X47T5MMp1zYAogUrYRSsgDe6ePVVBWPl0jKJ53f1v/2xJQ2oHaNY/T8cbZg1?=
 =?us-ascii?Q?yI260kdv5vHyeK0FtHmrgJlyR8b/Zk3+MO8GAmAEAN3uBeCszoDvrv7E+C57?=
 =?us-ascii?Q?N4uqEd4hbuHsamaFCxrLLczKpwbm5mL6Z4U7K09EQ37FGZGiH3+UkjmLLVx2?=
 =?us-ascii?Q?qtAPYlGCGx8lfaxsG1//IjpRRcZyjMSfODhSNyHjnfQdUvx/ZWaPApBbm3uO?=
 =?us-ascii?Q?Cq7OVSz/csnkzm+1I4kTzK3INJhLYlq3HDPVC2QKf4BnO5r318yxyPPlKCDt?=
 =?us-ascii?Q?HjAgUqVIqqKJnVjnjjia6OOXdSurO8tAckvJgcmd4TKladh8rQWwnwg6Mx1f?=
 =?us-ascii?Q?OrzS0ZDdNBSjZvlutG9oCpqlCSUErCkL2HeSMeJIlVi7YOuKCBneSPxdmmYP?=
 =?us-ascii?Q?DMY1t+F/SdQ8tnGETQnQsh/4Xu8h94aJVYpG4HCJW06af5e7rDxQLEwHblEq?=
 =?us-ascii?Q?8kBUJ9HcsB5r8gZfOYdcdtvN0NRhFMBrjBqagzdiYc8BDGdNllNqHCCDyRFQ?=
 =?us-ascii?Q?dcOHg2ophSfEdIMdrrBt4Mi1obyQYerBVbGl6gOBsCzGDV9fq2O6YP2tw5BG?=
 =?us-ascii?Q?yPVS3XLcArUYLZeEbsY9+SULYwvg6UwdDeikKkIXncFvwicp9En/+Fjwn7cZ?=
 =?us-ascii?Q?Ce4gljyaMaei4DaqZ2arvOzZs4b7+aG2030FOcOauCR9LAuJZWUHmjCdbAb+?=
 =?us-ascii?Q?te2mgEeZVPp9ixm02/jEASgeL2GnIABGy6mNWN0x4Czyf5pXVd0h4+kLJZ4P?=
 =?us-ascii?Q?08rVqUU9mhrSdtC1XPsbMdkXojjRXPFtLhQ1e8zTfvMNDUiwQsUYDVGCw1Hq?=
 =?us-ascii?Q?5WKNIh0QsbKXCSRk1EMf7riXLbWfb93nwJJU2l+27QccovYOkGtGwdSlgKYZ?=
 =?us-ascii?Q?Ll8VB3rydFRh1A8x93LjnDPp2ju8+lF1DC0Sv3sbqCdF0S+vemnqDqo4721e?=
 =?us-ascii?Q?PziNdk1vLfq6VDCfwlP0YYZl9oyOvI0OH34y12C5Oc8LFev+NdATzNO7ghsk?=
 =?us-ascii?Q?8i5LHNGsTd8bdykaZ6aStw5X67sGtN81T1bCyFgqRFcBUSH2qNPffsjvft81?=
 =?us-ascii?Q?F70tphr86JudrskkuFuoe3O4Ki2Cz4c23mzguPqRlPubxVQedzTFJswfHYFN?=
 =?us-ascii?Q?rPW9kYVTQ6ClIft8yc9j2qX1GU/HK5dPhRIiuN1veK9l2CzddQj3PeknIZEb?=
 =?us-ascii?Q?YJZIltTcyBx+4Pe4CoEulh/PVqmpy6EDosLpOi4Y5S+I+7MSnT1geZkKvZGK?=
 =?us-ascii?Q?pssaCPfR4DTVJY+5D8Jf9M7rH2l+3CQXcPswpdpPo89btK9KAdPVLcOBWtNX?=
 =?us-ascii?Q?f0tWQ5yDHaQUmsLJe5W3gjWJZBi4?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LrZLYqQYKLEDsZY0/KYz5bvqi+Ygl8QTJQej98KlS0nOm/02cQz/FPJ6PKWx?=
 =?us-ascii?Q?E+slV9wAWFHhdBz4H3IAPUQOuPToW5np2PtKQG/S7xe+ROjPcF91elqyGaF6?=
 =?us-ascii?Q?f1k7x01XQFxToperwMugTQEK8cg0CdiBZzxCNpEzgQyD2pews59gaiH4wjaq?=
 =?us-ascii?Q?YfNGQckJb00wPhhnCm5MUsGLcgMdYJNB51lkgQIA1/39ypaeSp4f+Q6TANJg?=
 =?us-ascii?Q?SDOwHrzJy7XEwuBP+BtiaheyzyPGkDAnYoiG3A6wJV3jiZthZJEcVfmFt+t7?=
 =?us-ascii?Q?BbFibA36xU6Pxsge0PI9ShQsWtJIT0oZpw82fpsAa3YJx602DnNhpr0hu/Rt?=
 =?us-ascii?Q?im4hDgVbyVRgDKuXHGBa2zufLvA7gNnvLnoJxNLGJpwBv6ToV2hHr0E+G8Qo?=
 =?us-ascii?Q?tFxNNg8xValKjOW59mYIXN3X3FzHWd5jfRLus/H2OpAEpOoSKvuQ9+MHh6q+?=
 =?us-ascii?Q?frQwSpNB83MyMxddNBTSPjhrtq1Zv6Pi22OrbEvaUbVvoeaMSxAGMO2pfczJ?=
 =?us-ascii?Q?OECtKQpFIMDhsiRcK3HFYfXQW9Ld5+ee/F7ZM88WXnH1XcDUhJwT+C/S8OjT?=
 =?us-ascii?Q?4zbtg6sp2qo6donj6lEHLSZqG5wiC8dfKnMLIaxvHUxOrdp6r/DgtsU5k4I0?=
 =?us-ascii?Q?QtHzx+q6kC27Wnzvr4U1SBcFAsW4R8l9T4ILgTPJzIzsMBt5pplSgRZgKi3D?=
 =?us-ascii?Q?tNcY0K7S783XblIl+U5h/c3tIbaRbNcbwLpnYWUurEaPQLPmMHayyH4ti7Nf?=
 =?us-ascii?Q?W9nz+74kBmNLhIYPEl7PqHVPQabW8aoiO8LAXoBsL/AsIbZt+xSVUQbp4EWs?=
 =?us-ascii?Q?H4ylZ3sonzdoxtkATrVRj1RoZNaZdpwGfZQG0EaCaFW3LJQQew8KhxsW4eEX?=
 =?us-ascii?Q?pJnuX5GtSqxSBi1+dvVVYQCeLAxXZ+XzUmh/eltt8qIV5zGPZtIvLxVxP91p?=
 =?us-ascii?Q?McWuf1r/MtZbgIpus5mgpmSHdMcqLP6onmZmrUaPG7kbEjq3q7c2m82weUwT?=
 =?us-ascii?Q?jKHkT4FKmt4LrP1q7mDf9LOIH2DG7nYRDEk/FHnA3pkbJYDfCFc3MxoiF9Tm?=
 =?us-ascii?Q?JeHjr+BiNHvnDA8Jq5xgH5eRjFiqF1UIKjNP9MVmh19egIb51U29s8lZkebZ?=
 =?us-ascii?Q?qmdEwOF/Z6cqp1z3dVDRmN6AW8SWUYwN3s5tVAFXshOvwOKa6mFz/eIN6z3+?=
 =?us-ascii?Q?q7Ya0zVAvyH83cXf9jj21C8cnQR5HxU1/xvFL9jjKissHlPCjsRkFlF00Wj3?=
 =?us-ascii?Q?dNDPHhxjCQ5/+iD1OVdZY1Rap8g+PgZRrkY9iGgHP9nyWeBdAbUJyHLjQjW6?=
 =?us-ascii?Q?ZgaK0GB6xn47y83x/CQ4sWwQ+LxwivTkBYEtnmkfPSzzBG7cSLWRC49SckjD?=
 =?us-ascii?Q?DKgxCiW51CpEKXMu7z9YM8m1rRmS+8GPIyJCzApG/OZiijGTHZUtx3Mxir10?=
 =?us-ascii?Q?g1DF5G8v6A8/FvLfkOWKjcAxOEcJORMjwdwPv+uH50pvYp7Jd753ciqqG77Y?=
 =?us-ascii?Q?ch9GiuxockWk/YwcSrkWRdPbjN9E4edMV4PND6NQzuWCqSmwI2adXp+DG8gX?=
 =?us-ascii?Q?tEmsnJ0PniCYtlXJidKhlBsLgBCwdhl5Xc3ngsBg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28661e6-63a6-41b8-b66f-08dd3c183a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 01:41:30.6833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dgo0VZ0RotpIgEbhB4cT2UM1tvNUJ1oS0p4CJWE/X17/Dk8oakt6hU2JjjsnDu5g+eALE83ynCGp6nNp2cFgLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 01:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210215

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.2_M2.r=
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
	6. BeaglePlay
=20
=20
Due to next week will be having CNY holiday, ETA for completion will be on =
Tuesday, Feb 4, 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Friday, January 24, 2025 7:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/873
>=20
>     Build hash information:
>=20
>     bitbake: c83444d1210740e27b1744d3aa7c5cad4e28db2f
> meta-agl: 17fd501fae2361588f2af72c229d56612cdca40f
> meta-arm: db933d55b46683f6349b027d6483a3b99e1fec3f
> meta-aws: ecf4fc6000d0b21aa10c0fcf197001420be1a1bb
> meta-clang: 0ea2df0462edc0c01e787b6ee6c0e20cd6a42fc7
> meta-intel: c7c7dface32f187bb0ba724b8eb79152f7453f0c
> meta-mingw: d609536003715f61564c41e81bd04ca9113d968d
> meta-openembedded: 27ab1bbc95b27a72a6a8a750a7fd3e98526e2050
> meta-virtualization: b57f8a25a35a93b95e3baa950c2d359fffc13051
> oecore: 3ca9192cf16e15e95ba1c3db4ba28fc6130de8e0
> poky: 59db27de565fb33f9e4326e76ebd6fa3935557b9
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
> View/Reply Online (#501): https://lists.yoctoproject.org/g/qa-build-
> notification/message/501
> Mute This Topic: https://lists.yoctoproject.org/mt/110782371/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


