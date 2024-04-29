Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0258CC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 04:36:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web11.12870.1714365361694646269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Apr 2024 21:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=k8aD4wl3;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714365362; x=1745901362;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3LHc8Esg+MBaf4Yim0upS78m2GtdoeoqKecAJrDNPFU=;
  b=k8aD4wl378oBrHpc24LRY6aTbc0NQYMUb6ZOkfRH8sHLpDQqxfDWPoC+
   Jmz3xP8nT2Jy6vzlaw8YlfS7wRFPkPmT2hYXS8tROfj/1aUQGjy7PzSsM
   gdX8pIa2ffiK2yqAoUOSiUN76edHauDap/KlBj3gu4qvEQRKxOFVQm7c3
   y5NOAJwCHlxAWIKOjIoJGZ1OgUftwwc7lv9X9uRHTwSF7kv5aXff6FlmV
   6AWpH/fFKGSdGmOnyrVOUZ0wPF++JIz1uuLr8vE8Cah++8ovyh4FhVO30
   yTzj1YlqcYj6cjB2xa91DUqVIsWY91+Z0mobtuKN9RSrdLDBsRDaQKqFk
   A==;
X-CSE-ConnectionGUID: Biift1QZTGmvQ7o6fLK4LA==
X-CSE-MsgGUID: /QaGmJ1XTaetDF6PS3bExA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10135464"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10135464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 21:36:01 -0700
X-CSE-ConnectionGUID: aBiEDXggRQKPkpz/+A9+AA==
X-CSE-MsgGUID: WHEw+sfdSL6Qh+xgs/YrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26060826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Apr 2024 21:36:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 21:36:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 21:36:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 21:35:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIYDtnjB0s3oNfSHncy//aLufYGQLxyTyJhIlPmxgD5LLrS7/YGApBVjelJY9TBWDNG7Y6KdnVzwJerxwqOhoIX3J0Qg+lf5VMQLJyUBTDmQcVtqLkRTdSgmy1mlsZruGF77QGYFfLMZSsxOjsmV3mtzphhic6w26VAg9DTcn7oOR/tBee1/pBItKWiQH2bY2n5nQdiYG19ILGIx8SbNpnzX1ooE7Ui4lN39DJ9C9gJ6lxffSx+KjqKTEukqY3Sud7f/JGZ2h4y0+En9INgRo5vustoZPgtIGPYBUH+CSOxV0YvsRjCVX8chndrhGja9O528xzIMzrd+ulHw4YXV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4de/s1SIvv5SbVYoclb1fIdZdA+SqxVsRJh3gIiRU0=;
 b=gSJCs3a/CWEl8i58XqR5GSzbeUVPTQgK9sXhHwRCyxoekrR1O9YqHFg4N/sDA4qc83W0lq4QDgf4oNuDuZoULpm1ugkeVRMPdinQG8Fh8B1DTCEwR14WQMhw1sumlKJYWRq8Nqpx3fnIV7Ij0TrEbp4xJxTkdBVRQl4liaCcMfr36xAaPLY2ssX/YHE92Ozr37/vWrJ2RkTzXrdMYr1qdRdssJfhZSD/R5YZCcDUBs8p58Puic8/dLVN4LJOOdoxpm+mwM5riark9KxlXKqrPvSSBsg6YZ8t3tPfwWzSHn/f95Cy8HSVwfnyMsEGrw3xC/1ExA4pdKVGLFpSTVJzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Mon, 29 Apr
 2024 04:35:57 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61%4]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 04:35:57 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.18.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.18.rc1)
Thread-Index: AQHalUOquyArFi+J7UyXn5Y0oMkSebF+spAg
Date: Mon, 29 Apr 2024 04:35:57 +0000
Message-ID: <DM4PR11MB776074E86DF3EE9E3E32BC42A11B2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018f098b350c-3212b9cb-2849-4dc2-9fc4-670ce7e4fd08-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018f098b350c-3212b9cb-2849-4dc2-9fc4-670ce7e4fd08-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY8PR11MB6819:EE_
x-ms-office365-filtering-correlation-id: 38001df1-8851-4e69-5473-08dc6805dd0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?KoPXfZ+rXijldxGrYUbUUDsffH4stwux3LCuITFYAbrif8WcZ+UEhYU25UtZ?=
 =?us-ascii?Q?Vu6/gNDbKox+15yyiLImmfM2N7cSiWf/SBs2OT7cv40HS0AvueN3Kp+YKDCz?=
 =?us-ascii?Q?Nx97X/t+MvuAiCNlRQk6ga6uLlqHUPbTyIwQmw411aWyfqKMhUiB733mujSj?=
 =?us-ascii?Q?8EkW3fBFSQeEfrgTyv1vjHaYux8yK1aOsoHbFIzkWoJnKa7LgF+Upwbb0pZw?=
 =?us-ascii?Q?XMABJb6DERqaW8sXqdgWpvZwxUhFB+bCMVfpEv9QTqcJFNuwAZ08LWnoWKVt?=
 =?us-ascii?Q?BG28YXjiOykyx9mqv6Fgxv7dPSbHhyz+AbuAKcprj4CliwWkci4yZvz51GmQ?=
 =?us-ascii?Q?MHnRheeN5zwnZYTy5rEQREUcC14HLvt4+oOk71F15P86l10Rd+TrROJCbnlc?=
 =?us-ascii?Q?UEa/gWcJWbb6o1+ctonsrtq/8Qe1cuCEzISqw0yT1d45LuuE5vyzFU7gWgWr?=
 =?us-ascii?Q?IrjMGv7gTbt3FGmMTM+UHBDhF+9aTXYsHpImTrCgQTHbraJWNxwnHudjsSMl?=
 =?us-ascii?Q?srDLBrPhTgkyrTloc99XEiZT3ukT/wNDvIYLK39Saur5ddgFV7XYUlbJYCC+?=
 =?us-ascii?Q?yT98RLBPRDk52yjvydQMzVUdZadLaJXkBDcaSTndk1G5c1VGHDHjxofQMcD9?=
 =?us-ascii?Q?3S9gMXNpBy8jYxOrsZ6h9NWY668x1MoI12St0jLlnbcabOPj13i7tS7ApESQ?=
 =?us-ascii?Q?C1miKzZYg6RQMrfMDWnt0hI1ItAoHGzuCR+BnW2+vkliiGjUHuIMknOeKtsk?=
 =?us-ascii?Q?wB8OBS4qIL0KnIWbXiOMoWn/F9Enzv6meENNVkO+xIQ9wugm7QOsDyuq6hyS?=
 =?us-ascii?Q?BkoPaZOPP5OqEWuAj7ZS72O2VTBdm4WTdjoh6q+Pd1yCusAf/voHc739xqi3?=
 =?us-ascii?Q?7AF7syDKgD2I1y5qCoED0tJtZa+zeoxRu6sbuNLuOCy9RQzj3+zNNxwhLyBk?=
 =?us-ascii?Q?QWnJg06ZmbLdSioVcnp2LoHFoMIYByCKOR3UG9MdOcn/H692U1Sp8Q5mlZSR?=
 =?us-ascii?Q?eoNrBxLenAvY8IWDs29dI+lcH1SllCBSUI0LgG6AJnKnu/eKM+OJWuA6ML7l?=
 =?us-ascii?Q?o9mV9xUYjOF68WyW9LdD2ezXiEScaS0PMim/8FgrFM/8EMNRy1aMpLc/HN4S?=
 =?us-ascii?Q?9caUwIF+eRliswmZA0xdT4TykNyi7MICwpzBR/xtM7pE4kUuS/+TlVqnPFVf?=
 =?us-ascii?Q?kVds8YfEi7a+05yaUWw6boQLpQAJvJAuUoux6pZQlFtnKwz0f3exaRegpYEv?=
 =?us-ascii?Q?YZ6ha8a9Ry4WvzodBwGhPDkUnHpGmS62bYRRy4uxJF4hcbgolSg1IKd2POKt?=
 =?us-ascii?Q?9qY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oQv71nq4wlyIWuQnAo6ErxGRMOdokTZxKpUtbRzpqih0042G7Q9IhIBL2lwy?=
 =?us-ascii?Q?vfK1L/EGEmT+DiSyJv0+c0vm6RVoXWyQ0hthLnTxejQlfD1ShSegQQlmu6au?=
 =?us-ascii?Q?WL8xf1WOlP9cj+6o9dCPHUib01uCL61vQyMVeTVdvnP1hudrcSaihVHdn8XB?=
 =?us-ascii?Q?FocTsbhZGTEGedrlJnmh5lXTNJ/KwKFAMIqIrknEyBm+ivg3S7wRzn5M/bQT?=
 =?us-ascii?Q?BzxQAfy9PhqtXYULqpjPIRe7t6gbhzNgd/NhhDRhBW49y46VvEfXm5w4Bleh?=
 =?us-ascii?Q?umJO48b5QoWfS4/ymu6NIj9kzBOOZjWQ6LrEgKzsyKyS7FZojszBolunSsdz?=
 =?us-ascii?Q?m3h9v5QI+9fF+iaRVxA4PfalSxLORAlXa/d8JmDWSqR7oa1Z1e9POlXbiND/?=
 =?us-ascii?Q?SDzzuI71vTok/Xs7ZuNfhQc0WWUj3aFoo9G/VbfMeEJCRoH1ORJ6ansMHWVS?=
 =?us-ascii?Q?TuEmE+7vdzKohsVBu/csgcPZfv5tb/qrJNgM+CUUTa9xiRIeStdDKnI4+x5a?=
 =?us-ascii?Q?M9U66T0sj7TtzMoE/ULdIAaQ4oOobp58bRpXAn6S3APv1GLsNc6XLOq4T2hs?=
 =?us-ascii?Q?Y+INDViVpkPwHzGxXWVfWXhGgiozmMSvkgHKjkh4P09daY7Nzdb30QOidJsx?=
 =?us-ascii?Q?N702ahhNpTnVLhDPqIno1Ji2fAd6FLDTAmUbqjPt9nnEJ5lx/hkvYW5vGqPu?=
 =?us-ascii?Q?hpqdpMHFpslaz2x3wdDwBY104kSkjAbGsz0/4eg0zkOXcm/q+8qCSPeqpjjX?=
 =?us-ascii?Q?CfjKBPcbr7SVE1Gso0jRTvHmaaWlPHpr9nLzIuHNKJ/FJcdYQ6Hq893tCgpj?=
 =?us-ascii?Q?w6xPKDRyBbH1SgBTW4n+461qnaYXrS1BCr82rv9xqD4zSi1J+xGSd1BjmJzX?=
 =?us-ascii?Q?9BpKRZfVFbqUfueGm/E73nzMbwQ/EmEFryeoZlmcEx5R1X/doyqiegeYoXb9?=
 =?us-ascii?Q?Of1/yRjl2G9+sXVY2n9fX7Y0MBkejZyQ8MDLtIWPu1MRgq3pim0Rkra0iz0b?=
 =?us-ascii?Q?togB3YZmTYhen9amDWaAtiNJChGe6BaUEJExgqOWwf72r87kgh/iztppfsjp?=
 =?us-ascii?Q?lnCSkDmcAu4POmVpT9ao0010zw1BiVfCWy24ZyWaQgdKvgCuLw//3bPEmtn0?=
 =?us-ascii?Q?A/vs9muoYyWVJeLyovcCTers6c1KNPzb/vyPF6IgMWrGmhDl3drasulmLYGR?=
 =?us-ascii?Q?6A/Pi2vyECa3OPn9pC6p4aQMVPa8F39T0y9s5nCTGebda+BVcYPyY43yxJcY?=
 =?us-ascii?Q?tKPUyv2Qcl3vDjgZVwCXbu8kl5VF+C8LjJLG1EamWRQafV2HFwn3KHpdvfry?=
 =?us-ascii?Q?7A5GkuddVvyqgu5XfBK5jecdeI3V51+tAAs6p+kUCrhIMzaY0HTV6lU3WQ+o?=
 =?us-ascii?Q?VOJ1Oz50/jlOfH+81uFVyWnnC3oxGgBlw3JnFqtmSU4fLMiTkFgvPo4MKr0C?=
 =?us-ascii?Q?JegnY0pnTYE4l20XYUGMUm3QDUd1T83HYfebJL1CS8Lk0TNjPg0F0r50Xc9g?=
 =?us-ascii?Q?DATxxskVag2MqjXmOlBSMFf90fGFslHOU5HQOsASmQ83Il4wNpQeOqg8rZHg?=
 =?us-ascii?Q?xla2JGxSwr/RpRdfQ/x2inFM1CAx4G/urZTU1Z9X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38001df1-8851-4e69-5473-08dc6805dd0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 04:35:57.2348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uw1JJh7q2R+JTK49FWWFYXVmU4qY9tEivp5i6Y6jupnjfUXuZsyxYQ4VucYSL3NS+mm1qOat8gCGB9YQGT1bSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 04:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198732

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.18.r=
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
ETA for completion next Monday, May 6.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, April 23, 2024 2:01 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.18.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.18.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.18.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6839
>=20
> Build hash information:
>=20
> bitbake: 40fd5f4eef7460ca67f32cfce8e229e67e1ff607
> meta-agl: 735f7aaf747129b0475bbb9d28404972ef2bb498
> meta-arm: d7b7b6fb6c7c5545e718e44f38853d1718ce5446
> meta-aws: fbf3b9a72b9178c305b4f73e5870f99d544c8051
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: c1eb7440d499ce1516f5f39c9684737072b15321
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 8bb16533532b6abc2eded7d9961ab2a108fd7a5b
> meta-virtualization: cb2bc17e96552cdfc141d27bd9f4dbd95a872846
> oecore: b7182571242dc4e23e5250a449d90348e62a6abc
> poky: 31751bba1c789f15f574773a659b8017d7bcf440
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
> View/Reply Online (#423): https://lists.yoctoproject.org/g/qa-build-
> notification/message/423
> Mute This Topic: https://lists.yoctoproject.org/mt/105685313/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


