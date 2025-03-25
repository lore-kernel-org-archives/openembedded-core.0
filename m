Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE95C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:23:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web11.61391.1742894608991096494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dUgerfRl;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742894609; x=1774430609;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tY9RLPZcAhztQFLC+ujmOHsHfPWEsWTKdg7PMnYyYLE=;
  b=dUgerfRlMQfhgaFQ+sJJpJJk1H4EacLunRBsYqh+E4bQL2wsGaSgRkeb
   nfURQfAaFVKGNFxYRWfrMF8pUZEPXWaCr8+TLY358yEj5O1QaEvjT5kjd
   cpzbe1KhtDw/UB/UW7omOeMwIQADyN/5FF3HYQadte9LuyUwu0P49oCOs
   nVJP55CRXUv0+zLcGwMOinc8iEL7msO4lqLAjURpUfgsJCa8NzNH9sLgk
   xVCyjkEkPe863R8fKm8+NBzFgM0McvNr1TtYDfWGxYoFFioX9I8HAaQ1W
   lMbW8fXlFCrLMSEaPyMbUjLTR/gDTFXx95ngpDEyGSkXsmBs633uWjxnd
   Q==;
X-CSE-ConnectionGUID: BZDYZlZcQ+2DWjPmQQBGjg==
X-CSE-MsgGUID: alIY5Fv0Rc61y1fZ8HYVog==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="66589071"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="66589071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 02:23:28 -0700
X-CSE-ConnectionGUID: YyOHpkxJQS2jWQPa1UBQlA==
X-CSE-MsgGUID: pLPCdVVDQhKLoKZCpnFCOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129141417"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Mar 2025 02:23:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 02:23:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:23:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYe+2966nvXd/swP2+6Gho+zlaCaAVJiM8v9tLk4LesBTdZ6VcoJ/VOgZmih/2CfDJq92zMVtU1scAI3Sn/2AoI+HZgL9VU6mvdpMUZX+rJ9IbOa7U3qP1CCuIXw/MRDte/6SwFPimjMLkU8OMN7d5/RxnzR+V2il69CJfsaikaJKoijl/tUCAmuVhyn/fHpGPDwqHiouiQqzvx0nKxKfTt6nxq4X6BlWrRhwKpPiIR7PX8YQwMsTyV6tYKi7yfNrYY+XS4ViXY2hz2LazmjCkmkqtnY2Bv8F3zTHyz1TWhhnCMpFa2SuA/ZwjPxY4DOkCmyVcYoUnnb5wAHW1H0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ72wXBUdLijkvfUW3plM+K2hH4wewV5dNyZtKp8/5c=;
 b=PoGw6ll+x1hgotWzCG9LC1thCk8Uz7Emfr6193Ga85cJtsO/WNc4xxaQl8JHDr0Sn54p2YD7IOBYAToPYHmy8lrYfZivhM4/CCi0qvEZkdAHSuTvFCovbHsjucyQxXTzCIESd4gI8ZYnp5dJjyKFoamxhz9dsHBw0jLSOQUtNd+rV+TI9F6wrBWJo2ZCusFY+vZ/QkRTctFq8uEg7tRi1V02as1dZ3WGo9Em4vVU0BpnSR4wFF2cMuMzU6u/X2WdmNvMdGNR0enKzjttPN+5Fs4VetlXafBiKWUrPEnvI/K2brxUPMZvCr0T9Q77cHvZkkkIA/C+DTjahlbgIgQY8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY8PR11MB7170.namprd11.prod.outlook.com (2603:10b6:930:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:23:26 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:23:26 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.1.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1.4.rc1)
Thread-Index: AQHbm1Y/M9BhAL4uvUKtgkuzeXL/ErODlz0Q
Date: Tue, 25 Mar 2025 09:23:25 +0000
Message-ID: <DM4PR11MB776089B0EF53F72667E74C63A1A72@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010195bf101499-b217168c-175a-4107-a1d6-31b7a4428ba2-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195bf101499-b217168c-175a-4107-a1d6-31b7a4428ba2-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY8PR11MB7170:EE_
x-ms-office365-filtering-correlation-id: 60de63fd-bf3e-461b-4d72-08dd6b7eb269
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?Iy/0y4pQ87DHrfePNloTLPj88QlM9a79ZTYhCvcU3g5U+KkXtQBE8Fr/zZUQ?=
 =?us-ascii?Q?nVrJa23Oxj11bzwWMOJx8Ms3zVc31jhvI4GTuewHNyDDQifwwVQ19GXLyEwX?=
 =?us-ascii?Q?R/UInGRKPt6Luld4nhJ2l6yq+Nj6YrwwutH9S2dTnU8KOYJGURqy3B9DD3qH?=
 =?us-ascii?Q?V2c4UKcTwtdFTB2dN/zqAWR/zbVZILuJOL/PyhsDFAGxhmqeB/jDCw4NlZfQ?=
 =?us-ascii?Q?Qpg514Msr5kNXVS6j7u6ZMbrvNOKNN2VeeJc8K1AWiex0+aX9vzTwI3KKAeh?=
 =?us-ascii?Q?mtAu4Rlpwf29NhhiEuUnJDYDyIXHDNfnfrvQbL5OnvIHBJ//h/TSF+3Misxx?=
 =?us-ascii?Q?r8noJD08yH2v7F72GIrYGVeiHgnhu5XZyDCafdaf76AJBVUItgBKSOciPbSA?=
 =?us-ascii?Q?DfGDZ1wsic9/8JYBlniElt+guN4sVYjTWU1V2wzugqxQVKEfyWA1P2CGNaP7?=
 =?us-ascii?Q?ll2kXb7hpn++FmtqMcwMFbz2dm78bPN6S9FhEfK70JTnSZMhBPj20A9yCpoK?=
 =?us-ascii?Q?8Iljkx7BoCFQwLvvYI8E0r5GmCWkNveO8De2JDYm86hd5MVtQx8PkcO3yw/A?=
 =?us-ascii?Q?yVdktnhKBpXA4MTusoc4e9OsB7iIbsYjeEnP5HX7bwD9SRnpqAnZUzdywL6Z?=
 =?us-ascii?Q?0uC1vOKAp+hhKCCuJxc21ZLNpZACvMgcTSkcdGTp9YWG9S/3o7RsqxX0/snf?=
 =?us-ascii?Q?mVLyK0AkfaT1ZMD1w3sRv1R6y3n+uoHyTauSwRbfXUEQvEopB/OG9Ehk7sO7?=
 =?us-ascii?Q?VbpPG3yv+xUnIZpYlVEwOMhya8/m9dv9XR4K9mtNtCRw37JtCDYZZ2b0ZH1C?=
 =?us-ascii?Q?j24FFP7qd6GDzGDQ5QVhsV1ea8QBNGgc6nIiSGWHtSNh76mD4LuX5LXMiA6U?=
 =?us-ascii?Q?MVB14rypW5PCFVoC0WuvkXB8IMFmAj5ep6QnM/MDXhuu2FCJUIwCdIbVQSGZ?=
 =?us-ascii?Q?fmHOyf+ZD5eoga5LekJHUaDAKsC3+bUnUeXwB1sqkvaQ5qtBmjF9T6TxKPyQ?=
 =?us-ascii?Q?6h/5uvAnk1k2FyWYjEUWJI33sbaEnAVm4ug6ztpGJqdllSmhGRg495KXJm+k?=
 =?us-ascii?Q?GNbdBrNxC1SRkom08AkJ6vLstqsSocbSr27HGdscNf6d56+Y+tTukL8b83rF?=
 =?us-ascii?Q?ZUOBPYOZrVjBodqd1Mvd7tG45jADpibjP/n4tg82uKrMnPgu6Fc4cZbW/r4v?=
 =?us-ascii?Q?yG9fMrBTxkySY6AOIMHUKVwKuPFJtYjtZoNJSSOjr62tjEThg2KABrDyZskb?=
 =?us-ascii?Q?i8/RrTcs7KxtGFxlcBuoNdCK5U573WaAD+YLJPYIBhwiQ98fji95bOFGrnBJ?=
 =?us-ascii?Q?7zxLMWEndCM56ePqO+dt3HLyysAkpv9b7gIB7TV44OHrJl3wgH9vsid6ftP9?=
 =?us-ascii?Q?bxg1iakOxahbmpkSEdyNunK56RpA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jTxsLmkN0zc+/jE3SuQd0S+RjTloOFHD81pm6S7SE0Xdm0DNRRZht46qzEhp?=
 =?us-ascii?Q?yGWf1yLx8eW/thqjR4ai72eRwOVVARA6UCzbFwp6fdEkbkO7xEi4rVnBIz4T?=
 =?us-ascii?Q?uz7KnK32PiEC8igwWAlp1Zka1wDYiaGCvD6v4gHGKs86zp2RIh5vwIhiNuc9?=
 =?us-ascii?Q?FM5Xv8PriIIeJNquVUVIrK/0FoYYA5siw/bS65gH9Jd9hWoVDpm+iLhyZXxU?=
 =?us-ascii?Q?wRSRhl0+mCHpmDse9V9hAlRmEzNoXWNZ+D/TjJVMMcMVnmfFv4IeQOyfUp8q?=
 =?us-ascii?Q?pKUAMllQERanMGEhtJmnvFptW57AE4rBNzQrKeEjUEqr8ICf7N2tHEphpjPK?=
 =?us-ascii?Q?CVwRzI/OcDDVXcfoZigewaeeKiXU/IdG2bAkfhVkCw4vyd/Bx60gx4ztFGkg?=
 =?us-ascii?Q?NI+1Y8MPk4WdqU556nuU2RuvFva4P0nst0vpZUOl/AknYB5HKwNgthdZboOr?=
 =?us-ascii?Q?H88EX2a3PpBBJlb1ZoLOTGsCMSjc2mTb7phN4fvbi996DwITjI1ULpwhqenH?=
 =?us-ascii?Q?MXmKAK1dInBmhyLMQWE2RGAqH2TRBQPQynbsQdJQIs25Z9UNCB/m7cIdFLGb?=
 =?us-ascii?Q?Bv5htzPgMUVMQWan/zyIjvgVLtJ9vXrD97TYnjzr4VPHgefXX6DJWvQqqeZn?=
 =?us-ascii?Q?hro5ZgigTEzcAzg3isQu0jadeB5R5Dx5CqI5vYGCeqZrzaYbz/D8sK78KhHR?=
 =?us-ascii?Q?i6wu1r0Q3fVGNIEME5ncIM1dDVAejuLIhC8GOwrrwwKM+Cccuy1YePy1+M/F?=
 =?us-ascii?Q?c6/x+PQLLg0SIAiaVeu7X65ST0I0cfDfCLbmHzIYxlwaKswI7XtScaSmG511?=
 =?us-ascii?Q?PiNNS9vIo4cfc5I7uphHJZeF++H1rSA07Kf1Ib2cGyMOfUpTy/9fQLxIBNmC?=
 =?us-ascii?Q?0MS9+O0ff4mWZ3+8RaElzyvrMpTz3QNBUpED1cBDTUNgikV48Bm4XiggAAB7?=
 =?us-ascii?Q?GB42aR6MuQIX0x+74sFRN1YyLedr2UHgObmVxDLneMpjEy6wA4/9SsyCo5Nb?=
 =?us-ascii?Q?u6NwxTlFqOpgTTFK8q4U0FUnsR/tqOYpWhTAAe/l0Ik6SwFLBAObkznhZmye?=
 =?us-ascii?Q?PKazD0hPXl1baVNkGNCud6uc+PueVYdBSEwPDF5WJjIR1RAoD6gosEoAnUUH?=
 =?us-ascii?Q?+WNrpbh4crxb7Z2Trdl1bOlBJ46ebKN0hXRaaIU/kPE9tnRacSJQLkSuWv+w?=
 =?us-ascii?Q?cJgD5UG7c3n30EuUqgUIwnA84sKcEs0vFwai1JDP2tIsvFSfgYaV2w9cqJoU?=
 =?us-ascii?Q?tSLgna3/5QGzGN/MmTkux0PyGjObwKH1qcYOktO/y5eRCZgHLsNa7F6OhthF?=
 =?us-ascii?Q?UZTKIkHQ8bLlYI3VSzMlrC/2pWs5r8/Dg3h9PWZey5CV/ghfELorQ0ol3TsR?=
 =?us-ascii?Q?dtZXIIUanZ72KLJmxP3XjC1rYnZv20lH9noWr0N0HbFtITfPMzW1H4YUrp5d?=
 =?us-ascii?Q?bs6TgPJONbLGYCAwZO/Qa8GH/qq/dSwC01v3q7k/8ymZmcKxDAUXxoyWc11D?=
 =?us-ascii?Q?4XZMcesCwI1Y7u0Dc695byVP/7CJ/KpReXyne6S7XUuUvCUSqzzJ7UEPK5KX?=
 =?us-ascii?Q?y/UAxzzR1xJLvsO83uVzu3qKFyfLo/y7z7l8M8E6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60de63fd-bf3e-461b-4d72-08dd6b7eb269
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:23:25.9284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXH356ZQ85K3/xusq8zTyzBIyhnBrvCYWX+hUAmUn6uY/7GkNKVUJkfAqXgbH/foLqoVxT8w91ybrgiJyJCNoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7170
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 09:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213599

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1.4.rc=
1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S=20
	3. Arrow Lake=20
	4. Meteor Lake-P=20
	5. Amston Lake
	6. Beaglebone
=20
=20
ETA for completion: Monday, 31 March 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Sunday, March 23, 2025 2:14 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.1.4.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1.4.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.1.4.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1244
>=20
>     Build hash information:
>=20
>     bitbake: 82b9f42126983579da03bdbb4e3ebf07346118a7
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: e56a0cd6fe5e796aa59bd0d4bcbbb585ea626199
> meta-aws: f9dd433234fc42f1b4cd6d5f3dd2ac2e06ac9c02
> meta-clang: c709a5196f1e8654425b43b478064395386c36d4
> meta-intel: 0ee9e8454cd41dcb0f49df7dcf2182b4d5e7cc96
> meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
> meta-openembedded: c93994f1bb601c57548b588d4f77a044d90822cf
> meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
> oecore: 2d94f4b8a852dc761f89e5106347e239382df5fb
> poky: 70dc28ac287bf35541270cae1d99130a0f6b7b5f
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

