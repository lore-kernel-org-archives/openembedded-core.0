Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D2AC83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 15:23:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web11.43470.1751297015957107372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 08:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PD74koFn;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751297016; x=1782833016;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5fJ4Z836Uwa85Kqy1blIzrvxrR3nyGDzwSJ3PaIJ8i4=;
  b=PD74koFn0q5/qtlVH4GMDq2kOQbT0nQPfz/72za8WUyw+TmVfDtQmEzu
   lf1MXQdwiSou1x8mEbOIQ1CCapJqV55QscB66fQvcgczAA5LKKoBXe4sU
   wCIaic7Au8mfw04GCDnLgEN81FquF9J1AxNzEV8jk03iUVrT9Ig3QRACc
   vkC2xO2RPj5o0tDMAzJYwDEQrEj717DUZZw5r5d/KYjYAWTvplzbgybYF
   yBH/TP6XVIulZ55gcGEsuETzxC8qUOoZBOfn8M3SxAvNS1dxjnYLtamx6
   1yCD/Cnu6QxdALV7kZTJQIiEZn3fRPZz/kcw5iayDYvdtDqvfFWGhPgrx
   g==;
X-CSE-ConnectionGUID: 2G48Sv4qRo6nloVJTlxwmw==
X-CSE-MsgGUID: kdXIW2vhSr6jPzOCdFosWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53465392"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="53465392"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:23:27 -0700
X-CSE-ConnectionGUID: tCeuwibKR+aWDfJ+70faGw==
X-CSE-MsgGUID: C5DZIEpdQuKaCRH6I1dkGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="157524008"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:23:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:23:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 08:23:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 08:23:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Crt8YA3DetKXqAHExswhrnw4Lzbba0ihq9ZW62po3K3aB8Lr9ewmiL6Qb/pWCeb9UiaWf+DpdWD0fT7IMByWdHTkCGzBqKX+I4FGX2ihKWAxFIwpkQ9uhNepUmepEdIYUh22JpfRA7ybj4d5urdIQ5dWvl2fagmIRjcMyN1+VeW0NUWk3qN46+UuhgIFYWUSZ/1ct7QbACg0EU7xv6vPfdel2vkfHtnp2z005pyBYae1TdNJWokQwfxDwWNgABw928Q5yK9Y2S0hWPZwIYLhLD8Wa9CBRFW8p2S6Mqde6JJoi17Xj0D+CFJBbKPbpVvf5EIUhN7aZI1YZ1ZLur+k/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xv0eZqwMmc+HQTrvpi5zuvm+tj2g5iHePNaLhNeoY0=;
 b=y0Q3ha4LnHnwF1OAybRVQtXbtqHsyf/kAFeTwAzmu1R++Sz7Om2AuNLEEcTo5ZvAQw9LU7JgFQOG/LSDQnF3zSAysovbTY03v3iiy4gln51ES4L0EBm4j2OwkeQlKAa2Doaz4fJQdzq/5DpXzUB6Lin7dD6+c1kPPm0OwIaOY5nQP/G8VGCk3nFuNNtkOEx4trzNfLq8jCsW2wFoVNtSFYCw1Sninva79Es3Q5hHZkLYMmVWLVGW+fCtH2KcGs83iQMAd/hp3v80oc75ssQyAzInZIj5glyTSLp5b8hDg0/3cLW7RF4JLLS7gF+zji6i++yj0/S/iskimSOYa7rajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 15:23:15 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 15:23:15 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.28.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.28.rc1)
Thread-Index: AQHb55q03gKS3o7M6EWhns6UpIojjrQb1iJw
Date: Mon, 30 Jun 2025 15:23:14 +0000
Message-ID: <DM4PR11MB776051C633AD3EBD9C4CC202A146A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197b2e383a0-0a867f4c-e19b-4f1a-9a6f-59e10ffc01ef-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197b2e383a0-0a867f4c-e19b-4f1a-9a6f-59e10ffc01ef-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA0PR11MB7792:EE_
x-ms-office365-filtering-correlation-id: bf4eca28-3b94-4cb8-100b-08ddb7ea08a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IB3av7gz+Vzah0z3r5tvIDQET+Nm6H5k5aHJWAbuWlc5Pr9GLjkoxKXm7tHs?=
 =?us-ascii?Q?gazoc0e5hrn57BBInpf1nb9N/02j0Or/1kT/eyikapQ078X4HzOfVSy69XWR?=
 =?us-ascii?Q?qzzcT8V5Ym1+PWELHPqcfZfl6J7eKdnC/zm6gDli3ozcc4ivlgAxELRdXZQp?=
 =?us-ascii?Q?6p0Jrp7egPeDdCKa7zhsSyRqh9cwT/RCnG5y5tNcEj8LyRbxaDnVRyeGHk3s?=
 =?us-ascii?Q?WQrl4P5FrMZl/ovwRgL1RVxgRMxylzZzD/mRwX7CX/gA7uwU67A5DpxSNUJU?=
 =?us-ascii?Q?5JX8DV0PZ62UwD4nmmo+Ir5NQXdKt4idaxvhwuELmrlXZLXBkgJ1oe6qed2C?=
 =?us-ascii?Q?FPkQSrO61Vj2PMzS45IlOxQ8r9VtFcS1hKmTx2i/EqMuPCofDqXA2wXD8T2j?=
 =?us-ascii?Q?Vth8LLCheNitKNkHWOKfqkYaphrFQrCxpfCjnWv1o54gP+EYRkc0yb6bSX68?=
 =?us-ascii?Q?Nralxpn+ayuBASsmtxxdWrDaadqT5ONyTXZteNobQ9mC/HSeFOi2k/FgoiZg?=
 =?us-ascii?Q?99k2Rcc7eafQ5P1mHsauJ4qo2HWJ7AwW6apAPY6VarSw+nW/pbhV35MABjZT?=
 =?us-ascii?Q?3Uhlf4VFCXmDhbLRLjmISaXNZeI0lfcKg1fAU5QmeHEQi2R3fQ08F6YKj/kl?=
 =?us-ascii?Q?fgtG7k1ztFSQp0chqjKXWbiE47YrTYgGdTrIW3R9IVSJ8lDp3GW4NY9pF19q?=
 =?us-ascii?Q?FIhH9kp6KvnnwvlO7J4ENE9dQB2bR5WmGeHihX9SlQ4/ieGQUHYtPwdKhNnW?=
 =?us-ascii?Q?7KUjKuUTQPKlKlBAaecPpRdgh0kS1IMEzhmAeCjBRL6uYRmkV1PXexq1B+kX?=
 =?us-ascii?Q?R9oA5TIGleY0lmjdYE2G01kybZOJZAZUHZyxKgneMJc9sxEH/w1ZuEdmqjgU?=
 =?us-ascii?Q?X2+nmUN7VhwW/oOCd2mJPdl9DrGfhA4ut77c9tY20gZ33CKZAO78Si2vQ4sC?=
 =?us-ascii?Q?O8aY+jCI58wf3NpNA0L+IGScMRtHoO97NnN3LiSXSf5/1FSQjLitxr086TwX?=
 =?us-ascii?Q?tI2MWXH1mZZ0eUvXKJmuR3UHL8NkaGhdgNYYtbr7YyuJC9I0YwUEsZoRFCUL?=
 =?us-ascii?Q?MH/BicdecRdxv1UwHe9rYOWnB40gJj+r9W7WYfW0uH6dklRIfGsFCOsNGla4?=
 =?us-ascii?Q?FiLmI0Y1cg/eWoCuHVb8x1tq8IWs4sE5COiv++GsVgGXGnVQzu6gzEymzVIy?=
 =?us-ascii?Q?MObsFZkWsVwg4xt++UC+5no3lrmqK8jYorlNFd5Kew6DucNDO+iN6u+NdfWy?=
 =?us-ascii?Q?LLKeVGDGIHgv46E7AQVgMA0gL580zIOCHACf3pLnRmE77JD/ZGag6OdlXypb?=
 =?us-ascii?Q?LfgDdxvhhsPeHE+HVFAdUHvMS9+8h/SCpa6DuKgaONqzXQS5eXhD06k3jPbB?=
 =?us-ascii?Q?NVHEezFP6MiYkzwRKqjbSP5ANm2TQeNLj5JPZtAOHVf4kX2mCATIKvPvIH6c?=
 =?us-ascii?Q?QduXUbD2v6Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8nU4ZA3v6DJMkGUr2cJ66dNXa5MoGfYJtBIWY0x+qfdM0xHTId/2eVOhlvcl?=
 =?us-ascii?Q?pPJzrS+m8nTdve1chGq41CpRkaiTKCST6n+JnvY+i+IWtYo1zZ1cP6tuvqdQ?=
 =?us-ascii?Q?0nqWriik2c8D4K5r4N6R/8ps4X3nSaXsuptZS7TpB2NA34VpyibXHdM7l7um?=
 =?us-ascii?Q?D6IMGcN5xTurAD6JUwxVeE0zLpMd1pvoKDXR8PKX9MQlYfJJL17BpjSUWuyF?=
 =?us-ascii?Q?ywOV2Xw4wIpwW1/pD0vMfzSeA/5CVsjN/em5zwMe+20x+XVEj+fzenNrkhDW?=
 =?us-ascii?Q?gCgSi2aJmmSkA9m8Hs6/hgGhm9XQn8AdYtKpWzobd3gZ0KwEhH1ZEYBM2w4u?=
 =?us-ascii?Q?Tqjc2PFIc546HlNKDvtjF4+GPL0Q0XpDkI4lJUflsDandtTEfNtgf/uAJLcx?=
 =?us-ascii?Q?XOJeg4Rxn6swTGPi/FchsFP7W0zlRjIrvMtffB5O7bdljp1UYJfxESn0wRdh?=
 =?us-ascii?Q?2Hc5uT493j513LBU3JWnmalB5cZDFlLRc8W6s44O9GtSmLAmqz5UTpN0iRhs?=
 =?us-ascii?Q?xHmPubQyBj5TPX3JP4AS9stH9GHUuO0mhC4ODBtUbi6jRAK0RWEBDo1YB6qk?=
 =?us-ascii?Q?SOrsvAVcSPwvn3EdLQFZjWrSQ8PDO3ibkxRg3AnmclRXHo5lnjS/FV3mMEPX?=
 =?us-ascii?Q?6NrsoJFRClFpIimNYeF9zjlhyvgnT8wUD5xae+FHevJac0evu0PkHQX0dvyF?=
 =?us-ascii?Q?y+vExs+LYCltZkS5SMvywS0HSeLMXm7qM1q1xh6WYy56IigFzbh6Ud6xagJV?=
 =?us-ascii?Q?fax+bNsN6y1SNS0QGZeg2H92hub6XKh5lEN4y5RzKxAm2XQNnzZtiryXkGLv?=
 =?us-ascii?Q?aeXvreYtI9xKcRfDJTgTX0J0+kr9ZdcNAXok+zH5xsJr02ZuZMpWaXiAMKyj?=
 =?us-ascii?Q?jEJNSaVfVYQ7HVRpd5g2p4fEdiPKL/TMBd95bW+PPm7T1Whx1s4EBz9b0HSw?=
 =?us-ascii?Q?c5YSEigbXe84+H2U3pYnJtMx9V/aNe4/OTvUGsWXfONglyWoAJDvgW7jR4ed?=
 =?us-ascii?Q?jJmrZ5tAwj7OFM+qjZ6excji6UpbLajJDgLYVQYcTdi6TL+hva+3+2fxEnMN?=
 =?us-ascii?Q?WanYPUFdGHfHMdUMR+EwaaQEGLH7nEGv/8PdHuVDdQNL/FwsNs740uAbJ6sa?=
 =?us-ascii?Q?skpAsv3CKW6JSnZ5zg7H5iU9aPdQ+aFG8pkabjoa37tsj4HvdTx6ffA+OK1i?=
 =?us-ascii?Q?Wq6wxcnseCe4vodwdHCfSvRpV61n/lSjWFOlPj7LxqrFNkUQtpHRLU9L3aA9?=
 =?us-ascii?Q?lxgJ62ASRlMpw0zoGogE6Blb1NB6WGcXAUNnclx6x/BiA2EWqmteRjXL7hPU?=
 =?us-ascii?Q?zjX2s8+FIou270w/SPuW0enYeFYCbmxCUXtYF0WfArRbBLj6WLtlarmrQo2p?=
 =?us-ascii?Q?OcYFJtlFqkYj/Fy6Nt/lWfsW1f90Fwh8jwZAiWjvGEwPd1nvfwOaojOTAumy?=
 =?us-ascii?Q?NbfMIpw0F7KfAxuqD05ojqMVfiUKmq/NS6iwVuh5o8RjEkvdlqzJYTjlg7Xm?=
 =?us-ascii?Q?Ao6Ry2TzJWoZKgaHjhyzkiS5uJcpWUHaWSiweLn0bOkRcShuK13rK622dMQV?=
 =?us-ascii?Q?U3kpd8BrJcy5+bdDwKmUnKcGjkW4sctpFHmbRgPo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4eca28-3b94-4cb8-100b-08ddb7ea08a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 15:23:15.1416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v6sM6nURTixI81EVvlPzDMtn0C6lC5NHAJxpEAmDtzUBQuysNUKErUF75xhNxFyqOXywGl2Z43IBSTlUzvXghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 15:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219528

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.28.r=
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
ETA for completion: Thursday, 3rd July 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, June 28, 2025 3:36 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.28.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.28.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.28.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1901
>=20
> Build hash information:
>=20
> bitbake: 046871d9fd76efdca7b72718b328d8f545523f7e
> meta-agl: d68bc4cb7cddeca1026a991ed405b9bec3d9179b
> meta-arm: 6b2d97cecd1b0e4bf4caee9a65595d279b57a686
> meta-aws: 12f6037467dc369f89629e1ce8d18d0a1bedde77
> meta-clang: 8a1d0a1993040ab9d2fb7259b71e4c9582f5cd17
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 95eb26cd3372439443acd1f4d4265989aadeca88
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 45bddd258a3d1ded925faf8389e01bb948dc7f5b
> meta-virtualization: 227cefa1261daf20b7d9737541994ec2bba629fc
> oecore: 75e54301c5076eb0454aee33c870adf078f563fd
> poky: 78c9cb3eaf071932567835742608404d5ce23cc4
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
> View/Reply Online (#564): https://lists.yoctoproject.org/g/qa-build-
> notification/message/564
> Mute This Topic: https://lists.yoctoproject.org/mt/113867803/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


