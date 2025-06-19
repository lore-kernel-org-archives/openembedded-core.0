Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCF9C71159
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 04:54:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web11.7266.1750308876779516624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 21:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=AFFErWJW;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750308876; x=1781844876;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eWXmzLznvaiE6KIulTFX2KL+YI5DwYzqD+O88FLvmj0=;
  b=AFFErWJWLJY5wOqeDdgIMltvhwr+KJAJstpjs0pBzzl4LLuZIhu0Klqs
   SbhVwjhY0Ya25Dt5X1Vq/xEtDcfAlhvrM2oBfslLvs267fG1Pa2fYKx12
   0dNjRi4AshRfa72H6W8TIpM+T8GVjXpJ5wuzG1EIFl6FiegrRCO9Ft8ne
   VsnYUpAmB76/N6snfIG8xSpgH4CffynvRv7RY8QoceWBdO4wK8JcFygEX
   Es/QADZxQRNv0nFc/0cwifjimV+eUXapKWNuKwK0bpR2S1feQ4UC4YkqG
   QuliSvveou80F+U6VxZWUafozhHBAlWx0pgnkphSGUIkqEWTZOyTB12Av
   w==;
X-CSE-ConnectionGUID: woCzA5gYR6qMKDtiGjQTTw==
X-CSE-MsgGUID: upyTIswpQ7i8/vXy9cyfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40161309"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="40161309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 21:54:36 -0700
X-CSE-ConnectionGUID: PIfNnCeXSHmEMu+iWWEHBg==
X-CSE-MsgGUID: +6EENYSRQmG+WSDrwXGDcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="155979581"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 21:54:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 21:54:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 21:54:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 21:54:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsZwiAhSjtvj6NHSpdBb05RRuGSeybKh+JxQocVRKMwh8tZQ3cZ4eZ3Ze2+jW/hKqA4IuzpEfA9puN52kMuTRondIl7GlAO/gH2peCcW0mt41B1GduIwwerJ0d/9yUx9IkLXcQs3srdujrXt0MpQy1JHdewHd7CDKvQ85/CVC7Iv/1ZVV4zN+jNEfnZHTZvMPLRVEv21HJjbhvo9OmTasnJ5oR32S0WdNXQVECem4/tBx3vWUU99XLgY89SVPJrSChblWrSdlZJfK78QoAi5StETLhQw1/HR6nHmxvAaZQ3VVvO4EFXqKWts8R7h6rMiMrj4dIU93PxxnNMgeXq1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiZYivtsJrmWGhwPUrqXts1GxuNE52n0mkkL5AwR1IQ=;
 b=RTOHdRkV5lwZKeaRtJRq8NT/XKBOFY0ttCDeH2BlDHYG3GBgBps2rc4roBsVUaPontGqjJAfDSW0BejpiDg4bD/X5iXdrajHHSc0912SNR1YI/u86os2vnm8GXJlNoq//n5msCCgBGZxugMxlKE420Esq4kIcBSUxeigEZuuu99VcvWfvZo3ULKDlKMn7EwJ4novt2jMlrr5htgm9nvQJU4/ZJoPyuiJ8zfsE9DzWBWwG0LVnLJmWdR6UBvFXrnz8fhyys8eAjZshzQG/m9YWsffnlEScB1o7mbT0Dk3WRj1TtNGKoEDE180qRyApIxkb5IaWBbR5BrkCYVhAYPArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 04:54:14 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 04:54:14 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3_M1.rc1)
Thread-Index: AQHb4HtMrhYMcDcpPUCAGP2a26Nw8bQJ6qyA
Date: Thu, 19 Jun 2025 04:54:14 +0000
Message-ID: <DM4PR11MB7760E32177AF619A290F2227A17DA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197843595d1-42660a2a-9d1c-4a84-a93a-9937b791152b-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197843595d1-42660a2a-9d1c-4a84-a93a-9937b791152b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM4PR11MB6478:EE_
x-ms-office365-filtering-correlation-id: 910743f7-5145-49cc-8056-08ddaeed56fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?x2ZXNrOD9huhAf3in1eYq+LIq5jKU29Ph7DnU8BzszZJCyMilg9MHiWy2TPY?=
 =?us-ascii?Q?0inLJ/McscOE0qU366YdL+Xo5rZsBVF4KT1W8PBM8hqqvTZbHB7zx6MvWB8V?=
 =?us-ascii?Q?kCCp+oZ5SDrcFQHeGXNDSzRUhOjRzXO1pGWOhWlgdAAyS5Bv3wReBlkeMReE?=
 =?us-ascii?Q?RbboNdGrn7kPv7n2TPgyPtqj2pShnOrYxBguy6P80uP9mQjo2KODWawJA++9?=
 =?us-ascii?Q?ujL7PdYobgDA7jtat1BhNZ79mxhFO4YB1mXPF4DmbKdBQzVkx8FDRmB8cGqS?=
 =?us-ascii?Q?alqK9aSbiH8geyCsYYaWPHdSaxOQFhsI0oVnk++XOj5F+QV5ZX1wi8j3CGFw?=
 =?us-ascii?Q?K3idRWIkbihSv1cPwgXjUPCCPGCi1fCDqvczheo7OrhXEWeYuINLIyH6Pgv3?=
 =?us-ascii?Q?trnA65xgTVyf8khPRN6MQTXNRzNRFgzKbji8zoRD1WTwM1zHg7MlacTBC2fN?=
 =?us-ascii?Q?5pYsY0e8Oii/FwqlOVlS4pGp3cafdLECMBpUT2f6Nb6VVQoyPukKzoPwgC67?=
 =?us-ascii?Q?GEKzcOLX6xiBRxXTucCJx6qhkArhcEBXTZB00O1IF611b+RiFYiWrpw9jZCZ?=
 =?us-ascii?Q?d7TEWym55ix8fVbohND3W0vG/PZs0Gnso8avSYATU6TbpfdtYXRAY0OTrOd9?=
 =?us-ascii?Q?ClxT2xJhplEQU0ke005v+INrIPx8Lrnu31Fn04yZNfIZG+/Cqp8jL0t4KF+w?=
 =?us-ascii?Q?5qm2iMUPwETd6zxnRLE/zakMaRp3UqYQxkkN0VpR2fNmSzzF6yHDn0xv1WYt?=
 =?us-ascii?Q?l1GUOU7Q5kTaXJpFAzr9g/nnfddGExskC2571lBbE6HSmQYcZ1ynwW3pyGNT?=
 =?us-ascii?Q?KhUI3BuKmzdOLERjSD5k/hoASs8dlaUwjt1GI+GfoAd6S2Bh41ohLI8PCnIV?=
 =?us-ascii?Q?BrDRZdouMX/G7XnCqIPa0dP0HzPDJ1cFYBCQ1SqVjkig8EdiUy+mWLbKzUt2?=
 =?us-ascii?Q?vnjg0+vldpWNVBI9entnoRHCYbjofoBEEQxr3GouEutfa5pN2nsjTXQDqvDX?=
 =?us-ascii?Q?piUZ0i8kKNLnrsk8zomQpaFzgHCWnRJEQ++tKq4Z2preuTJj+ZYKoIC6gEEj?=
 =?us-ascii?Q?0KvlE/wuh96DpnOob5a0vFl4IJ5glq2dFhZv1rVcXlgQyfsn/G/AT7FpBJg/?=
 =?us-ascii?Q?cjLeAiNHWz2ifQf41B+Izw059FTXUXS2oNTUxtnHlU1ncY7ZOILeEEv/Q9SZ?=
 =?us-ascii?Q?YUEapX5C3uMsGEi8u9lYgGNXWJfiKvgbHX5XLJLW2obQ5W+eFkiRCnlXQKnm?=
 =?us-ascii?Q?V7jsEjp9YrbJ4UDzp/xgiEG5lzuzmdsEofq0ip43CPgF/4UPWb0xugQY4t/+?=
 =?us-ascii?Q?yqiialIs21In5PFK1Gkr1S5210VlJsK3fZnSCW48nJT1M9n9PcEut3gn+Gu5?=
 =?us-ascii?Q?7ZxaW/PEbA+Y/A+NWySzgR2pbZDaiZjWStCuyvdTFHIqCJz35ff++dYQFPc8?=
 =?us-ascii?Q?Xry09J6igM0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pr7GLimh8uXy3KOaNf7n+XkGBbmTp1wvLx8dgbCVNs8Wub0ZFMTO1/nlngp1?=
 =?us-ascii?Q?rcWTKUCXn5evAGLdbTmIN397txgbFLfjcfKEtSltx0VJgD6C7ka5rJ2I+Nv7?=
 =?us-ascii?Q?wk2cyWRAxfpGjg/c1s6es8POI2myTOROGx6FNp6ws+xdJF0137SJg8qimZfQ?=
 =?us-ascii?Q?tnIuQ6/8ZkLyrHL1CeBJYLkFYOS4S/0L66D9tW19T9w+KNFgTJrF4JcRhkFK?=
 =?us-ascii?Q?xwYbEJi1fw6GEt3qQuYw0BFS7rgwZL6ONF5v+pEBbct67Sh2UzoS7J/AsSV2?=
 =?us-ascii?Q?uugXLhTxMAK2Uo3hfItAT9Uk6TVZwqK21wfUcgslidatnj9sLDHDi2eTePJM?=
 =?us-ascii?Q?Ixc3H03+yh/uJsPwaYgJb4DCo2OH7fIsu6Tt6OiJYetOivXvjArcaL/Ph58s?=
 =?us-ascii?Q?8YatUL8OvLcnTOWAZ4Xu1lRFomUFLExlOckrEcUWs+YeVL1cks5b2wkPnWIc?=
 =?us-ascii?Q?LE+uFURwFC4J760HD4AYbnfSxe/Miv53XZjzNgJEtr2C/LgsWioQVvqqQLgM?=
 =?us-ascii?Q?JBhzNfHwvkYUl1ESPHFw/a982h2yGr1A4LuafIgllSoert7GRD8S6+Hsyaxq?=
 =?us-ascii?Q?PFuQ3QHJqBBBNAwmpbI0BGCKWw7D5MgPtVaJB3n+0q1iZ4MZ9G0ynXDnx+/X?=
 =?us-ascii?Q?33rTU5vxsYma5iTn8pBieXPW79nc/0vJns/u/zRBEZnyFto22Pa7GGz7FQJY?=
 =?us-ascii?Q?LWjD3Tl8EnxQz6kgsaE+CowjlwmhtxiBaVMHOsSfxjnm5WyT6VXSWO7LaoFT?=
 =?us-ascii?Q?P4hua8+iS92IIP+hw2gbCvMKTvQWdyIHdrv/AVnfS2KAyuQL4p4CZfzrCCcn?=
 =?us-ascii?Q?JwM3OkyIZ8bINMkBLGldHcAoA7nEsuL/qInZoMLTTLU+wW4ZXMCY+kV0Yx2q?=
 =?us-ascii?Q?Bx2MBZkUd0t5vUMSTRJggTJw/FE8kHF8QRvrIyvkZuANA8DjoP6VTvwTgqEz?=
 =?us-ascii?Q?TT2KBkKppNK4kaUdnnyowr8ZnFUBl4DXOtgiByrQU0vBXoy0wga4P6l9ysOf?=
 =?us-ascii?Q?nWRu+fDECQrPXT9LRxaD/DpsUQ4WThbrk2y0YOQaMt7v2sCmODJNhsBmeCo7?=
 =?us-ascii?Q?jfZ4liJ8uVChc1s1QAu6B7fsUH2wdj0Wti6MIdn4p5Zk6SvK/HtVsVOkqECK?=
 =?us-ascii?Q?xwEv2wWWfWaVnrIIvRVmmfQbSGynXzyFdWF4SA3bzUvs6ustJ90gVH7cLY+8?=
 =?us-ascii?Q?wHOf53qXhRRnKsmVUuEllx77GDwWB7Q2qkzVoNNKaetuACKIm8btdjy1gJus?=
 =?us-ascii?Q?W9Fw6mgiVTai3r7ZfLOFU3zJwcxL3lZZR8sKPuE2trzlV9Zy4Czd0eUchZU+?=
 =?us-ascii?Q?JwN8rylADoxbt2fCSRy+5EVTKpqvlrdb3PHtD5aabd/nhvy67201AzQ1o3x6?=
 =?us-ascii?Q?xKLXkv77WBB5diu3hHr0tH6+UjJ4LuRiSCcQff7FAR7WMfE49JPg8WA6Abp3?=
 =?us-ascii?Q?Sj/sA+wJ3Ve/qeZclPmVjyfNNIzQzb7fM9PlMeL7LGRq/kC3oI6EAXZ0+p7H?=
 =?us-ascii?Q?3TUFEMJwvEDdllb10tev1VQ0ibR6wAB8Ez57WscVsY7mhj3DZzv56IhI6W6Q?=
 =?us-ascii?Q?BNSRSjnak9vPaHmBRnhOffWunHYAUejmIB2wKuoY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910743f7-5145-49cc-8056-08ddaeed56fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 04:54:14.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ux/niYal/kiCHvMscuOL4DEyFhFJ1EA4PYZbtdDe2+AAfnqrZpgqAdh+n/+i8LfN736M64vYVxQfKTVXQKmR2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 04:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219048

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.3_M1.r=
c1. We are planning to execute following tests for this cycle:
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
	6. Bartlett lake-S
	7. Beaglebone
	8. BeaglePlay
=20
=20
ETA for completion: Tuesday, 24 June 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Thursday, June 19, 2025 2:03 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.3_M1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.3_M1.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.3_M1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1833
>=20
>     Build hash information:
>=20
>     bitbake: c2f29c9475c4b9cdd12af1f8610f2675f8fdd964
> meta-agl: 40f98a677f182e7e7779407fdd651ccaf416a65e
> meta-arm: f4438fdf7126b7e1045cb43ce541ffc7876b2c0a
> meta-aws: 3e91782318cfa7858639a577da2729432d586f5f
> meta-clang: 02e254ba1fb4937530d94a154b4c713c904c2d06
> meta-intel: 5640f6592c984f4832ff5f2ed1a35a607e5d21c5
> meta-mingw: 8ad732e5aa174e2b5e80f7f276104cc09bb7212f
> meta-openembedded: 3f77bb395c332b12135889bb6b57caee0801b43e
> meta-virtualization: 0115e61cdd5fe8c705bb0350a0d75ebebcf84c79
> oecore: 826ab8dde34882c3ef705f715d8808e46bbedcde
> poky: 7733ddf733b883d6fe75768d5f9b6d3519d47dc3
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
> View/Reply Online (#561): https://lists.yoctoproject.org/g/qa-build-
> notification/message/561
> Mute This Topic: https://lists.yoctoproject.org/mt/113712766/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


