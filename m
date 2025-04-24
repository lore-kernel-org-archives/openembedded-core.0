Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC80C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:42:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web11.12074.1745491369443793442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lExN9bD2;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745491370; x=1777027370;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2oee+yGRJEPAF6r5urBIGN1lH8XSJCsGmq+eEg7jWIg=;
  b=lExN9bD2TWMMaba2nIv8L+O3wirPazRwOrBdCyUQ3WzARG1d6DHfRcz5
   6nCm/8uxLo2Q2A1x8tffOAVLGV7o92A6Ja+LSUuioufxxK2nw1enFu3u6
   LTcBFAKgtFEm2Y+F9p5muS5X9LyALR9p3Z7o/Nh7cQ7nbOGUprQqaeaA9
   gC0bKzWFrl3Xfiq3dVbpfeyVy4jOAUJoZGVsJ0uIVsyJUiribTAfkyY5A
   Q6/Bty14941gqAyYNYymzV+uIUE3es6RztwNhRJ5iFPn9jurq1O+BOODS
   WJc3xBsFhPr5F0ubCO87FLSKhScJ9qaltcL9EqVayLq/2nuN0y/sTB21f
   Q==;
X-CSE-ConnectionGUID: VkuUHIdFR+aziJVgbfSu+w==
X-CSE-MsgGUID: tKdzvwqMRiqBlWV0efnZuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58109598"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="58109598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:42:49 -0700
X-CSE-ConnectionGUID: gIoHX4HXTXy6CdzrP9Idiw==
X-CSE-MsgGUID: s19amaO+Q++lPcX5/I6YeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132487965"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 03:42:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 03:42:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 03:42:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 03:42:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4Jbexe4LLzKwwdI+ywpmZRESan2GR1fFfSRSaN5j47AHMplrsjoN8T3JPMQbzu3Z3dnCXuTZf6mHq928my4tX2s3MjG/dJu4go8ibQnQzr8ve2F9AP9aoCn49ka6gmAWPE/hFBWR0XP3OgPcOwgioVnJJZBce/P/CwS3FLuIO1k3fQEgKqUGQGtVA6rX33Q+GDTWjUCcbe+EBE+gnQUQOddcpCP4PbLB8tCZjLfdHlfjUMqTwaV/SoYQIGmr4Lfyw9L/Rkg3Q4cLwgeg0mF+XOu7Kly0wfnBxljIOc+W9Mn04AaDWeCBKoEPVdxTUM82D5sbsN9zVC37C0WzCl8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnKY55kgx/7tzdOhaZ0nnixZW7TCXquKuREKNouWGf8=;
 b=jd2fX35c4v1vUvt8LBlTFKfj8/FoL2Z0wA6zA652DdFhAlUOgHUZRRQ2el8I8eXmL3PpESBo+BBvI+8GjHHIk0DMrLK4+KbPO6Di8D7vqzTzHjoHFZ1/4n7BKjKTv+gPqCDw4MvXLf2YSXTQZ7eafId9EpyKVeEo1gNc9eAfii0x8R147MJER+yj9NFoQ6fhF7o0MTh7T0ZqzxOCq1oxQ7UbMTpdxun5ITE+MJ94IZ0igKOlYs1W6lFQh7vryTJpC/UMeb73FuA2+hFHM8iUC1d9hPhVKyoCft0tLsQgKK3Xdi+Y32rzetAE4AQ/tbf8zd/Enzth/4/yP0hTJy2Sgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:42:00 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:42:00 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.rc2)
Thread-Index: AQHbtJ8E0uM7d2AGOkq8ZRx0Xa6gcbOyoQ0g
Date: Thu, 24 Apr 2025 10:42:00 +0000
Message-ID: <DM4PR11MB77601C0F5678067610B8BE1CA1852@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019664c3ea31-a6e3bc5a-d6fb-4dc3-9815-29e1bb0591c8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019664c3ea31-a6e3bc5a-d6fb-4dc3-9815-29e1bb0591c8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH0PR11MB4998:EE_
x-ms-office365-filtering-correlation-id: ac6f198f-b415-41a5-4f27-08dd831ca514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|7053199007|38070700018|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?UGgg47Ye49cmtxoAJl4MbS1eBKDK9EzVSrJLeY2dp7Yq2SJi9dX5VLgcSqhR?=
 =?us-ascii?Q?Xsn9FPpwjA5bA2nPAj5tcuU+qkmTkcRuv5YWyDnlFk0IoDWCH9QTCHJDjCXD?=
 =?us-ascii?Q?gonZZk/My8YQVZkA1lF0TDurY0t2lCcuzzlLsi62parruQQC8VFDVfdUH/f8?=
 =?us-ascii?Q?PFMfT+DaMm2QhbRIQME5e6TKLY3oPIvgow7kQLS58sFo42peWK2Q+rQcXo34?=
 =?us-ascii?Q?y/bazaS8+XOwskk5NzYHida9kT/p/pA4vJKi7gcVKJbPUUB1gJZjZjmFMOBP?=
 =?us-ascii?Q?dtHwcC83wwuOA5+q1yYcK1c5HhFdwhqf2XAnGXailfMKbNbc68fAn4fXf5zG?=
 =?us-ascii?Q?eD4x7w0MQ5maCIgSLcUNqPyzm01qmu/qv0XhVfCudkpavpwRlrAcw2g62bTU?=
 =?us-ascii?Q?/YTRMfNJ4/CJ0HeP0k6qyxXz9v3CXZDDj28J/IJXKsr5h4jtOzM27IV3G8tm?=
 =?us-ascii?Q?wME3BtSa08E0CjLM63GFS9+Us8SX0cN80Fwl2MJ1DaNFkmocHPg25No9DhLk?=
 =?us-ascii?Q?+4te/lq/xlykQNlKiMctH5rzv8YuYtnpWSD4El1ygnwUSYxhzjACfzkT5REF?=
 =?us-ascii?Q?GjSfn3Qw06O1vm/IMlnlHbYmgss6lhKkrXYtAErdGUQu+hbRQOMS9AubCVy1?=
 =?us-ascii?Q?DDunVkmUIqblVxE51wwiS5VjCx+XKWBDlY5zRo0+apve57wxLXC6gV6wVpVq?=
 =?us-ascii?Q?N7/iCxBzNfiSaoL8391PLFFW1RRNCGDqrzEqzCum0Le1mQobjA/glEKklTlf?=
 =?us-ascii?Q?B+uEFUH4TBHu/+BHAF/hCHzJeBGxmWT3OBoaPw662OhiyC4+sgzvBvWmRag5?=
 =?us-ascii?Q?N//eI+KSyaM/Hv5c8pLwPb2A44OUAyL6MEsCz9A9fStk3jQ0g9leONu+oKli?=
 =?us-ascii?Q?bMJfef5FH47nqNwu0k7P8w8Waua6XzytPkdVEyDfGX+CZKtUmjrfziwgesg4?=
 =?us-ascii?Q?nFb3OFkt6on12TQxBzqBqkXrVVkxG2lp8I9RCxGs9Ng4SfJY+VcA1dLEUxHs?=
 =?us-ascii?Q?ykbgdimBoeZreeo9usXxY+WelIRfHFp/FivH+f0T2zYjSJGy4fuXX22d/Qbd?=
 =?us-ascii?Q?TOvT98SxHGNieuoP9fB7GwIOm3Cz7jrU+WBRVVBi7pou89I6McZ+vkhEGBuu?=
 =?us-ascii?Q?okbEo5C1Pm/mg785PKPtuEemBM1vInGTzcKnstfLMTwPPApxMeleDmjJ2uJP?=
 =?us-ascii?Q?NO7uKYc0uwIceLPlQBpWZRYEOGo072M0ijtd5ahj7ayQ/R8GjORIDJGP2Ir2?=
 =?us-ascii?Q?f9g9b+yKtU2OQUe10UaG6uIj45iZ2VZEGcxzWgnVpSegDlQGmgH7TbY3ubHF?=
 =?us-ascii?Q?QFfYxrMXII95zWa/NxJsf5tC+AlE9QethTr8tAHyOQh+rBa3ZzJ4qU0R751a?=
 =?us-ascii?Q?C7yLCqvY+x7YuSbeOtL6h9E1MLkewowKEO/uGPu65fHpASFPGKhI5em3G3lQ?=
 =?us-ascii?Q?2Zp+6qfaT/Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(7053199007)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bCRFhnbxTkozvV8aaYdbzEwFwo5VTeVUdcIOuK3jBE2TFeH/+KznPuXyCFYs?=
 =?us-ascii?Q?qBwjaqQs2Peb1Xdgtap5X9mjYJjXpQvtFk61f1xiDURHRIr4gHzUoJmTDnLK?=
 =?us-ascii?Q?JaZzLU3CjpZjI2jd4hvpo3DwS6+XKAW++HsmlUPl20hdgUIkHvEqWABTL2tl?=
 =?us-ascii?Q?n5ImBqPUN5v2uQQrVN3/DMOW5LFmDBFSmYaSWxlNlnkYC2LHQWRWAJMtJT9L?=
 =?us-ascii?Q?8xLTjRXnkt5AfEv/Jcn8FGPyhPu0o7rOjwfIUSIqxiGSX8Szxmp9ql/Kr80w?=
 =?us-ascii?Q?tSGCT4dwaq47PEef3yGLJe8qeK/am7h4ay+dDUYpeOMnZtRDNLcVetNiHLZ6?=
 =?us-ascii?Q?oabij6zLrkh8RNhQEt0cU4V7oiiRYRf7A96HecrnnJyfU0P2yLTuhxjxYXju?=
 =?us-ascii?Q?V3US/D9Gt8erTjbjq09bU+xXljm6OqaSh4UMeydyeHnkKtILV8ChZv5ybXrU?=
 =?us-ascii?Q?SJ7d1PzeQzIvckUQxYeanJy2orpoIDtbQPn4q1yd5OS8HPdYFJTj7E0LDnxz?=
 =?us-ascii?Q?oyiI+3UwVlMvks6i2G+wO1wmdEnkvxEy+yWEoHa3CwpGF8Wu3NIxXf46PC03?=
 =?us-ascii?Q?oI//PS4hqEiKZR9KkzxKZVBATy2TB6dT05fFKa6lRTMBDdkTVwilayz9Om6D?=
 =?us-ascii?Q?c2OsWXAr1856Tvush4nd3vvbjQ2QLw7CpsyppneFc2Vq2s5JjElRzZ8pTO/p?=
 =?us-ascii?Q?bkMmlgjwl8IQOrZbpiAmB7u9D7eQoTIKS1ytOk39IWMAsgY0iFy6GN+fGQdE?=
 =?us-ascii?Q?muTt8FiDACyLKigZ3HKpnEuDd2gHJ2afa683PBOdVBHD0HtHSLwuZ04m99lZ?=
 =?us-ascii?Q?m9IS/S5gV9irto4FHIbds27uxR9z8y2g6zZT0Nik+MwAEXnoMxwlPIVBEI88?=
 =?us-ascii?Q?jSc16A+Mm5wxhO0vykgY4Q2d2OV16erug52U2DpgCdnWiBFYAxdQnwtmFU1z?=
 =?us-ascii?Q?RGjJRO61aozUdMJ3Zzp6QrLuVnf30zzxzTq2ontuMAe+U9ZuOtgxLC04u17J?=
 =?us-ascii?Q?z1TgFB1TzNPX+GHXywYCAs4MGk+jaHQ5ycKc9ewVVoEi/Pcb8878q+TbVcdV?=
 =?us-ascii?Q?G5QR8YoARxsnGvM2DinoSjuR7MoTU/ZWsCYZDt4aC7n+UjwH5u//VWH5AxCu?=
 =?us-ascii?Q?CAHDos8VwisBful0F/cIj9xE8kT0jZGu7nMPPd+uAW/c8u0nEGJge756CoR3?=
 =?us-ascii?Q?AKwi7qZq3+6T0UlpZvMV/fnCrZRyjoV4rGqSATfNgQIn0CngszzSzeMNv2g+?=
 =?us-ascii?Q?Lsq3pbpRWQbMkphThD0gtNqjzvOTZH1gtpziMKd6N3TtOgpMm1a3OSw8jYiN?=
 =?us-ascii?Q?xSy4UwJGRh5ueJtxAQ7N3JAAi1xa3hHhKSj/+ESiAab9zVF/Z9rp5MtIL1sE?=
 =?us-ascii?Q?6Wk6i2xQnDbAxfcuollDD32VWjiCJLxeM2mZb5H26khFI7PEdfUI35LmuLrn?=
 =?us-ascii?Q?a/x+0zVoIvUzPhDET+/QWHdzDdrFUgrGTuEL5JQzibOLrWyhMlZEaHG9/PZj?=
 =?us-ascii?Q?PTdbf3JN3Tv/ZSvZUay17/WTKKp4x0ssjyCddnAAkFWsP0KWcgQY6jHIPczA?=
 =?us-ascii?Q?KlXw0R0Okptu22Z3XtCN3iYJF7OGI+vHwW9H/nQ3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6f198f-b415-41a5-4f27-08dd831ca514
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 10:42:00.7775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ulg2ZdrZzwcvrhJPPG3yx+YmjvDaE14lyBVR0zIGhHO1+NtTc9sxME+H0h+C6VQGgYdzjhX3+AOV44bz3qKaOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215354

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-5.2.rc2.=
 We are planning to execute following tests for this cycle:
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
ETA for completion: Wednesday, 30 April 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Thursday, April 24, 2025 6:28 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-5.2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.2.rc2) was completed on the autobuild=
er and
> is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1451
>=20
>     Build hash information:
>=20
>     bitbake: 5b4e20377eea8d428edf1aeb2187c18f82ca6757
> meta-agl: 39eae92ac42a4ae6900ee012324614714750ce36
> meta-arm: 42928dcc171629b495bbfcd8eda17ef6b8bdbfa3
> meta-aws: 519cf7e251d7344014eeb7e979d2dee16fa9c748
> meta-clang: 2c9678cce413fa6c6c84a8a631f4635a4f862f11
> meta-intel: f1b9bf5f10a03b357fc9dc58c0fa0614baf6b855
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 0d2d2d193a1619b6dbebaf335f1ef785478049e3
> meta-virtualization: 4fedb61ebf60745a367d857af255006bd3509a39
> oecore: 6ec2c52b938302b894f119f701ffcf0a847eee85
> poky: 9b96fdbb0cab02f4a6180e812b02bc9d4c41b1a5
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
> View/Reply Online (#545): https://lists.yoctoproject.org/g/qa-build-
> notification/message/545
> Mute This Topic: https://lists.yoctoproject.org/mt/112423836/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


