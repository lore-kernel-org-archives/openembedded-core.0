Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2777CC3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 06:38:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web10.12517.1721630284814952675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 23:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JnQr34Qi;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721630285; x=1753166285;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mV49taHlLrqredR3wSDNHUIU7Nn+Qz+ypZ1bD0HrtAo=;
  b=JnQr34QiW+p3qOEnWFlcS0GuAPI329ENxHyRORwLLgcwXBUvGXdjKlop
   L3Gi//gSJCp4028sJCU2chOzA/ojmWgPOB/ccGnzLEclsU3ty0utTo6r4
   dMs9k/KMdz+ZkgM0CIXuTnSptGGmD6DUkAy6iKm3hmtgeN1ZadpB2JB/p
   YYuPUOruZlDoxkW9vrj30ThfDcV8fbqsEyk+JNv7FswbIud6KXogA9m9A
   b6jzr2vU83Hg6zAjl4XPlyXWN5m5HAyPV1c9+msj3PCMy/AqtFiBkg2hT
   qNoBP9KFjqIYlTzRREdUKTxv6hDv29UGFZ+u+gO5eekP/10Rej3zgaqPN
   g==;
X-CSE-ConnectionGUID: v9oDSdFVT9SskRR4DmZzxw==
X-CSE-MsgGUID: M8h3aaPWQ+KpH7jTlATGPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="30334228"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="30334228"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 23:38:05 -0700
X-CSE-ConnectionGUID: iY4fIuyLRlmWB7dJyBjnEA==
X-CSE-MsgGUID: JE+SOTP7T6us4nXvGgnyDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="51849095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jul 2024 23:38:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 23:38:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 23:38:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 21 Jul 2024 23:38:03 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 21 Jul 2024 23:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7rSO0i8RzuT4M/Dus0Lyq2wj/zUTvMxgclt6MiY1L8U5ZoXBgJeb/WEpG2JQwDXGFcTkoowdO46OjEq9kLd/tPKsrd05jXrlLbCoPbDgsrKFBjpsAhlX+9o6TJOAL/QdJnVxrzs+5/FAgJl3M8F6vnvnBVjjeSHBOc66Xp3c9ATp38pTLGljm8edc11cAoAoMr4yaB9+QEUCuXBY2YKzwokXxhOtwb4c+SHhCDH2XkZS8IT5b5fB9OyO+fqAbYZ/yFKu0+gPE67awBSbKRKaWy9Rcvs4+MQhwCrsIYk4A9tq9vcGFEub+7oQ5Xna33yVALrUxCOeCTbgPlnyrl02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MexWVOxTLEWAhwkUfl2gUTYtXJbuh4GUuP3GVufrkbw=;
 b=mr54u2067qigIkrP/E6ATsXhpCwWOxfaLUVTwY34n1uD+2wSdf1S3vTtl4GxbXVVRqWVr/9S9M9xQopEVyNZQuUYOPluZp0AbxdAcmcDvmEKpwUcIPjQvBO+eQ6njc9S8SYyWA701J6W6CZTz86Wzb6H8AMgEGDf8g8ZAZti+MNCSRbn+XcgYhIrcHCg+3m3I8Skh+fAZw+CkU/1zciCFmF3ywE0bBqXLlSh/OStHbaYLdzlTpBdqVx/zZvBou/XxDCn0yJ3KCgDX9N6QkvdAjatazlayxivj5d8tigI4/MG5S7pZGRA6K2KE36khPP54sI41Zgy2z7IHwhwstYZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 22 Jul
 2024 06:38:00 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 06:38:00 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M2.rc1)
Thread-Index: AQHa2AQx8ch0dv4+z0aOOHyncPiz6rICUwRg
Date: Mon, 22 Jul 2024 06:38:00 +0000
Message-ID: <DM4PR11MB77609AECCBEE7A9F8D7BBFD3A1A82@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010190bf027a1f-d75a0402-7be5-4a91-a98e-e1905f9e0340-000000@us-west-2.amazonses.com>
In-Reply-To: <01010190bf027a1f-d75a0402-7be5-4a91-a98e-e1905f9e0340-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB7097:EE_
x-ms-office365-filtering-correlation-id: 81f623ee-d9fc-429d-c1de-08dcaa18d4c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Z5ZGAWC3fRxOlkJCSUnNsWmet+1nxUjpzKyULO6tYTkacoFkNcM0BTVN79tI?=
 =?us-ascii?Q?QLZHZpVY/DO4oEA2TUZ0NDi8Gitv8GKZu4aVXrAVuxBfYo1h1sxUcnsvb9mm?=
 =?us-ascii?Q?4t6VlVyZ8ZsmFN1ybQ+GlGR9sjP/47NFeCBZNkdO61huFNhHeoafIqPZsZZf?=
 =?us-ascii?Q?qryKvLjuv5cxHLdYD5cBIvDuBxb407nQ9vi0dX0v1qWLlL8XCA81QBiU88Ep?=
 =?us-ascii?Q?/MEB+keESV9Hx5UkGFDLgHM/hLUxVdCR+BPpPy2968BSR8sU77/6tt5X1NBw?=
 =?us-ascii?Q?aS2dpRG3Kr6k01cisg0x7nlod45iZsWdIP6nX0KJ4WXQZUEKTNhd9Fm8Q9+f?=
 =?us-ascii?Q?MFQBWeolCZhaFf8t7837hDHyf+LfRg/W+j8KPkzmwr8GLaov3+em4WtXffY6?=
 =?us-ascii?Q?IfVsNCy2FF3lYCBifLFYgb377wa11zAtHO/vcJnegnO1cG0oUH/I43JuO0h7?=
 =?us-ascii?Q?NAapJn/NfO9tMG/Lu/8nt5WOPnftOZQGwCE2mweMZ7SvbrL5s5iz8IbgaaZK?=
 =?us-ascii?Q?+ote2PADEvb6wzaAZPqYStIg0F5jKjm1bH7FyF+/mfKqgEOLgSYveVyB6v+r?=
 =?us-ascii?Q?3JJFxN/rel/OaYWSjdatt/GHdHAFBS5aX02UmldJQutUYdtnPwHaWzZtIzVM?=
 =?us-ascii?Q?pgE3l7DpYFlNZUn+c4gkrhjRgRQumlA1/OsN9UoZ11WUEwDWy3yaGZUOdcLn?=
 =?us-ascii?Q?xIGTJsa5+TLeoMWSbGyHBrPCc1wDwCK2nmikQXSNYLJdS0FuHwTUZxoUMxae?=
 =?us-ascii?Q?5QCytdFopEMYQJ4YLJUV9IY3CYPparVBO5aMT+3bd3X012dUEx+zuyC7ytit?=
 =?us-ascii?Q?IF7udQ841mR9wJBDTEgdtjNa2ih3Ib6+0GzREvwXUefdr0+02l1BITncmyXA?=
 =?us-ascii?Q?h4S/A1fn2OLCpNHajEJ0x8v7dPcMW9N8nUqSoPV96VOPPXgJIqGNMdUa+GvH?=
 =?us-ascii?Q?VZBcWiVqnEEjVr8+nLq53mPzTeBPZPHcBxJnDWsBRVExwPdX9txFYyFP5WMt?=
 =?us-ascii?Q?12VCLSzsxTM7Rz7fBJJRtSSbZ73TaTQnWmmOC+zV7xqmhjFqsGgjEVHpyDzY?=
 =?us-ascii?Q?OKzxoMZYeG2rM/JvBvjB4k6oxfMMa0HC6rgthOvHwiQzDXCVrGGlMIi7EyFa?=
 =?us-ascii?Q?1s+yraKk8OEZ8kAs1gRDpqwTUA8qWBNulziIL8W22s7HMvNs2aV6kDhMSzr6?=
 =?us-ascii?Q?dTgJGy4C72lbkkiLJzcFkX6460LWgAiVqey0TlCDo13hkgns4DX3NLhmdnBX?=
 =?us-ascii?Q?C8k95mKqqp/M84BCmyQieJ4d2mAuGuL+U3TRlTqSVreiQR8EJyAH+7Miv9ss?=
 =?us-ascii?Q?cb+7yDu/742qc2mhNFf9v40bpxCvKyyX/0WGfOR4KXN4PMDvmQCaUUQgW4PQ?=
 =?us-ascii?Q?e5Tyg3Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7XbY2v7A3/kAyPD4pfp/awVLj2qn0yssAPY77V2ENyolq9/GdeU8FEU1PS5S?=
 =?us-ascii?Q?O+g1VhRk94J8nOXCQX9gjS8PpsgddtjdHWNRVoUGB7/GBLXwTJepEgeeQwnI?=
 =?us-ascii?Q?EdUl638UhwlhH3mS4fdU2rv0IN9fVn5BW6i1mVfPFKXLNhEk+KiUf+mr60rv?=
 =?us-ascii?Q?amU3i1G8BjEMZTL1hg4hksDMuuBDV2+4SRLXeAeofEX5/oqU4UGIKlOfmcQG?=
 =?us-ascii?Q?SXZdgMVxCNms9hx85KQFIgZlBcK6uRpE1tUOqu/l8ltcX9QIjSbDZIuo6SDC?=
 =?us-ascii?Q?oQUTimSznw5YGiNIa5TuXs2nZvpGTXm5IoY8jADkrovRSCgRcsQ8LsgbOOs2?=
 =?us-ascii?Q?gPvrmep/XU347vaAcSuD/Wrk6xsZ4cThTmvPWi4xpU6QQBk9rfFaXLc8jXc6?=
 =?us-ascii?Q?stVI5UIXPJN8Rlek84U+4OhExdPF53f/sEwcCuYhHeSTqzSv/yVS6vTn8bf2?=
 =?us-ascii?Q?2xPatRpjtbHbuaCrA5sc1AWtH/BlpWD4RevCG57CEcNXeN1Dl0M/Q6CwtG6s?=
 =?us-ascii?Q?K9f4Rjm9Oh3NHnuPayuz4oBuHeSck0xJtOquVbx18i7DZaJa9UGjBsP+fqer?=
 =?us-ascii?Q?OjyllgfNtGUOwM/7Ahc0drf18peoBM+U5RnmeWVKVi2Q4IfqQVgIrGPjvqok?=
 =?us-ascii?Q?QnuQSWBev8/17atGBUrdxu64JTkM1X/4i0KJ0d7qWbP0o/IZIqIKD37r1jU1?=
 =?us-ascii?Q?TLBjONw+GAMzY97+F2cd0hXvfD1LB5hWrEsomU8eX7U3DbXSQshjn3MoRviE?=
 =?us-ascii?Q?iK27RgX7xmW/P3N54vEq+qk+sQ7U5ed7lStJeDvATTKh224hiOOdAFj7AMeV?=
 =?us-ascii?Q?/hJA0M+IA9FpXLMR4xUu/TZzFmTYFIvrOxYy7OAINKMDqVP0a2l/6fcJR9YU?=
 =?us-ascii?Q?QrmuLPO3VpDv02HUHHHfynuSSWU5WPSgZolsO7OoksVT/E5B3ciR+5X3OCkw?=
 =?us-ascii?Q?nqAXWJRuLKLsKR8qNj0bxQfGp1JpV/eKINOddh06Bcw5h+d4v16WyJyTfQEd?=
 =?us-ascii?Q?DA/2lrVZrDalR2FbEHAEz55eaplCw9hbdJbEc2HYuDdu9rBjEx8iskMzzNSp?=
 =?us-ascii?Q?+TOtQEQeqsZvVg/Gw2xM43PC+f1bsm+4U0qaU7hnfaUGWcB6+6GSTnfzng+5?=
 =?us-ascii?Q?0oyruyJqFwT3uz5Yy3hTYhec0cR8rALUXk3X4/QT/Q2O85NO8XrbB6azSJyA?=
 =?us-ascii?Q?9TGCy8nIZQCvPLvvCvP5Vg8Aj3X0eYzAFUGz89p9DucEtMIYYPYc9jjaZ+Qp?=
 =?us-ascii?Q?oQqKjA5tS4+hRfW9FZlIhmXfgMkWoX7mnsN8iQefSaHdXAH3t2dFrQZ6t9xy?=
 =?us-ascii?Q?8jlprLDTCm5iCUQWfCPI12XaZ+R3CfwVT/k/Sl6wwyWuRDpYJ0HoN8xCmvup?=
 =?us-ascii?Q?dfJqWLEg7CEfIJBHQUkZ2QjQMNvqgPlptEnYlap+od1hNs+aBz71ASSea99F?=
 =?us-ascii?Q?Tx6l8eoNqP+b2/c9g+JI5sBX2Frozp6ZxIurio39hEGX9XU6rx6i3v+p+Trs?=
 =?us-ascii?Q?W/nNK0jiQNZNKYc7xdmVAhVuKPR4tw8mhc5Jj73C1LK2XrId4DVVnIDvjKw/?=
 =?us-ascii?Q?D83itiDi48kOZWnujLJFm9XEzlxCWHQzBqAko38G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f623ee-d9fc-429d-c1de-08dcaa18d4c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 06:38:00.5181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/8eIHD0wEcOFB0Ed3uYix+8oJcR5bHiPHcmOuDBmzzQ9q9ckv2Bz0k7OcVOxCEQ0wr/1nXEgnLQ3fSCs+68oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 06:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202306

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1_M2.r=
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
=20
ETA for completion Friday, 26 July 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, July 17, 2024 12:45 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.1_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7144
>=20
>     Build hash information:
>=20
>     bitbake: 1d7360031164f04887c792fb0b2dd86c6ccfcc23
> meta-agl: 3f3bbd3871e5a7a4e9e275e2c957b98515cc30c3
> meta-arm: 14d24b5526298cdfd6db65b6e11b54804a6a553f
> meta-aws: 4d048eacb5cbdaeb3f37d0427cc8a810a8ba7b69
> meta-clang: 1fdde55d951b7a8f1e537ccf56aca2dc90c40091
> meta-intel: e97386254712047f27f5554da6470fe3fb65d07a
> meta-mingw: e4d377d5ddb62b265536bd33dbccfbb0904f8701
> meta-openembedded: f8342855a440fa5c4194fc57285e8db9e034fcaa
> meta-virtualization: c138943fed29e768df990061c30d6f071b98ffc3
> oecore: 758508614541c68dd6a2b7084e07287c71f40a8f
> poky: e18d60deb0496f7c91f2de900d6c024b45b7910a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

