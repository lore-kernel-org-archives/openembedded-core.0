Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567F8C87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 08:41:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by mx.groups.io with SMTP id smtpd.web10.7882.1753346464653783124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 01:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Gv3kbAN2;
 spf=pass (domain: intel.com, ip: 192.198.163.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753346465; x=1784882465;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EcoRQurKdiOAUpTZS2ktCSc5mqFBDfkUk9mnInh/xfg=;
  b=Gv3kbAN2SIGEsdfuopotydyDh3F5o8Lk+8lT6iCrhshh9C7xX7tGWd1/
   mgAT2RTCr43qRKAyO3ReUxSbgmBADMwLRLO3CFsJ1XmFO4n4UzBIzQqUC
   oDQOUQH/+DS1bXp596mQp/O595cqvX5qTzP3b/DdCbrz4Sd3ThRP+Qr0O
   nbN2dX10n6P2KodrABMdnqsQUQlZ1PnCtHBe47hNp1nBL2WvaFnb/EiME
   YyVvZlivxeRcBWj7k7eUDBdLlzSS6SD7F2kJkKGskR/kRGjXODL+Iqo9G
   kAUheMrH0Ssdsk7P15TPFbaIyxASBr6KZyG2ejRgfgE0hN5yJ76dUT2zX
   Q==;
X-CSE-ConnectionGUID: CreMSMCbR4WNXx4OIzkO5A==
X-CSE-MsgGUID: /OYvFFPWR6aArS24VLrGbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55793632"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55793632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 01:41:04 -0700
X-CSE-ConnectionGUID: GqRb+X02QMui3B90WA+/HA==
X-CSE-MsgGUID: Sr+uG4wtRhOEGmCGg0LymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160445927"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 01:41:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 01:41:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 01:41:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 01:41:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m45oCnV20iEtHtduTe5jGwvXEEn9TlyyHcdN6XQSQipZ3GvvwWYJwYRYCY8xxadYSf6IKK/3z+SQgf76lFmXRcm+tkmPQ4S1opXs+kG/JqPRtnSZsIj5j//rj9D1bFvV97MIeuEbT+8UCerSueAsRAhNOVvfIDf223u5+rnsSAjvvjve8mxjE3f+5GYuZJXtklmdcen79wDA9plJbTAxyWqDwodg1hIbbalS0ol4LUunzeu0jm0iM6Y3Zd7U5sK2F/c/5qWBvWu5t8E72iRbc2KCIyizOKc4oW3tpnQvtlgP22A8LWQLCIkWH5eHH8KNROYQQKacNKkeynBOQ/V/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HBSfhH5uuwlmTBzFDbgXb03HJzaF9MAOR17Pmx+UXw=;
 b=Y2JftlyeqZZe36UJmAf+ZQ4b53H01QIcJQMEjZ+ynNjMkNK1KJunCfJLgpasdsLPgWD2X8BzmyWwuhdRJ89Lbl4znxD5b6+/zFcFSJwJDWV5U0x4D+D54UmZfXFF7tGMPFi7/7cmO1BUX+2LeKoL+IDo8irAge/nqe0DPoPyykVDjqXpEioRpi3fI1UC4UZ6V8JgmljbEPiCmQWDuxWUiAL/C1R6uFc+ZPGkDDVu735HStVnnldqyjFmHNCwXidT4VgnfrfGf5xcWnHldzC2Db8m3qZVT+x+n8I7yxvYaPy8w3T3C/fzJYjPgom8uZcmR6+PI/3Xsd48dYW7iLpuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 24 Jul
 2025 08:40:34 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8922.037; Thu, 24 Jul 2025
 08:40:34 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3_M2.rc1)
Thread-Index: AQHb/Ebbl9qEM49VFkq3Y4ChOnkxWLRA9FuA
Date: Thu, 24 Jul 2025 08:40:33 +0000
Message-ID: <DM4PR11MB7760B9AA59C54498E0D234B1A15EA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101983a5e30f8-4ea5cf3b-f053-45ed-add0-f139865ee87d-000000@us-west-2.amazonses.com>
In-Reply-To: <010101983a5e30f8-4ea5cf3b-f053-45ed-add0-f139865ee87d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SN7PR11MB7114:EE_
x-ms-office365-filtering-correlation-id: 762982b9-7e53-4a7d-4312-08ddca8dc16c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8dNqo9GHiDTQhmiZrysihoqFqArJZtRvZEhBLDZe7AzLOUWlov7XnXE0w4zm?=
 =?us-ascii?Q?YUHN3Q1wp+1s98qh03R/ELyh+QWKqiBp756+IHIM4lzZxO0pR+Qbnvwou8np?=
 =?us-ascii?Q?YTVdBOZRKVd13f3Js5w3QqApyDTOh898iWsF9jbrU99s7LTHFhVRCJ0esTUE?=
 =?us-ascii?Q?nyPgifrJQp8k99mF4qLe07txapEO0CWoNEm4NPepcwk+rOQJfSGLrdMDjCFI?=
 =?us-ascii?Q?OHpyRDdeIRBwCNBt34UJ6pIHmm2Rc7rDWyIwIapSdzxCb7RH2LAlblVvVCQk?=
 =?us-ascii?Q?t9snyOkOWI5NL4OiVrfj8ty52kY4xVGJ4HaBuKJH0SCDVlog6ScfCaOGj3YU?=
 =?us-ascii?Q?MA1TY59Fd8nYLi5YgyWjitqi1B8rohssbqwxRuWT84BHUcYXx0rvSFk3VwOp?=
 =?us-ascii?Q?rZTyRkf6agZaJe01sYgTzG1AdbUk/k5ccw4AgK7VlIqrBUob6SiM78ixWXqt?=
 =?us-ascii?Q?7Z1x3Em4MGHIK0mNA+uELt4X/AMMT+Smee3LmGge1ia+q+mfVn99NsQSKMLV?=
 =?us-ascii?Q?lihERhA+vnlEJ4+PgzRpeiAv0WIzgW7NDZ9fr0qzUK0fleSejcgIu4hQMrWY?=
 =?us-ascii?Q?JZTdRG9XFpAu1bHETR/XdnBsVfMpO233y1n3kITbZHT4VT62GId2PN69awdN?=
 =?us-ascii?Q?Vv6fwLwcFremORTdiD5c0m7sA6Jv1M8GYaDkiipNgEpqkbdvIpXHthLMtE7D?=
 =?us-ascii?Q?4NXpK5dbC9w5I/ip2XRINSwVCeIAjVRfreJ8Vx7m/C16IJ1qD2/hdOjDGZtV?=
 =?us-ascii?Q?KN8RrzLn/F6pmyfV/ZhV38RX/WnvS69V9ZHNgZTLyOSIF2NRf6BPOYitIZcX?=
 =?us-ascii?Q?+3w0rXMe3+iIuW1oQWt0ev+sPbNKkOZUAMis+pR0iaR5iWXAEXxDRKWxrjKH?=
 =?us-ascii?Q?L5Y7rn3M/kTRvMjuUtgDNDTKl1wX6uqjR/AfOkSVIm7stKfb1ZZIUOzo4o3S?=
 =?us-ascii?Q?7X9H0EJ7ag3wB4oHGTebuAuhvoHQYjtI0bqJczps909w5yb5puaQQo4YmYw9?=
 =?us-ascii?Q?BQmBKpcqlQTvyR4ljyJOXTfLgI0jpFg0TLzAhpOlRuZa1BJ5MCvWAUn5vxGX?=
 =?us-ascii?Q?gN2a71PihwG/qQf2tPcQFJ3KJWjmqQUvlk6sgKK8+wegcFraOxRVjH5LohUE?=
 =?us-ascii?Q?/tKTbQ/y8jql2SjQFOuEbGBClBCelQVoDMFLOcWZH3OkkuGjpc4GQdnD5g+P?=
 =?us-ascii?Q?xpt1eLA97wU21gV/Ob3mdKQxbV+PdmWZH+JpE6FIw/r6Tz4gKPqhv2xvg9kN?=
 =?us-ascii?Q?Vb+EzLxQtWup4KI7LY8srOlSFDAwbDLwaZCOV4QLCY/Jdt92fPXEnbETa9CA?=
 =?us-ascii?Q?BwURzxEVc2Xf/Yu2ASVJJldJHUaY6+lb+aWkbODdI7AFnwYcRXL28uUmJPHQ?=
 =?us-ascii?Q?2kyVglUXS17s6NgwNo8HLR9W+EQH+X6cKf9isnhkIrxcev2S0kHkvRUzUS81?=
 =?us-ascii?Q?cT+EPOISjRo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gw7ZBMf9DYkRt61wVUne7PrMYDuOJ7lCYuGr4JEjrrV683qt9PeUFO5AeESq?=
 =?us-ascii?Q?Kh+bgFM7fogRRdFyhnL2ORhLMeM2CMvtAVNkbYJXwOk2mG/6sismMc1XGd8G?=
 =?us-ascii?Q?hC0o3AKF+rd7gbfAXx5ShEE14P6x3K/hNpYUkgNfx1X/Guko16Cnykc2hjp2?=
 =?us-ascii?Q?496EHqLtdXgnamNx5JaT9vVvUflBMCrjRHeLzJcsSiJDI6M+mOAY9yiGzETm?=
 =?us-ascii?Q?ivOd4YU74mNBv4FZZPLhnoFSu+eJGo5ktlGs3eL4Ka1EI0uNGIOabX4WUTh8?=
 =?us-ascii?Q?ZLWpDQ01rXbkwqMMwRgO3WEXOsDslKU+PZd/jNKd8MjcW1hKqTrIQS4yJjzd?=
 =?us-ascii?Q?RqOK7l2uYSFpPxh6m/r96rBParxAJwiU4kixR2IrN3SHGxyrU5kSLZvHAcT3?=
 =?us-ascii?Q?oQU1PFo/007Iq8Pp+GPwvVpaSbD/sRbw2Fz1ufYKHgIa/MUoAEswKS466D5F?=
 =?us-ascii?Q?3RnN5xd8vo/4+GSyd2RpsBWZTwNTJqz//yTtHoe0yT/K6gt/GNDxH+ONV278?=
 =?us-ascii?Q?baHmYE0BQ9B4YRCUHMhQwanAOW7+ClBd+gZqwHoxVloLV/Pyt4vYJd3QTKOQ?=
 =?us-ascii?Q?g2SbGbad4dYBB+gKAP4VNZCCs+G0B3he9QP33fKF6br02vL8HtLHGvFrCl2m?=
 =?us-ascii?Q?iRRM1Z4b20NXPX61owzSoiWL4TJl0UxzyI/USHmRMO0DdYi+PFX9Agd/Oq0H?=
 =?us-ascii?Q?poYLDv8mbbKANZpOntO4ZrP1EAqrGxV5ivil4d02HcCTTXlzc6qJ/hJ/Fssj?=
 =?us-ascii?Q?hCItNlhfTEjK+389c8276RZVrKdsiZOPKmkVOTjfHEDj3DBjHOUZ9lKHAXPP?=
 =?us-ascii?Q?E3y0vOgvH8G5HtpdKuIK4F/jo643bKQJNF1BPs9Ejmesng0HtpvSFPIk7Kt7?=
 =?us-ascii?Q?QpYPL3ddRnoLgV9XAJMfaL+PzjBx0N6NuF7GI41gGZYs5IM8/okOZsGEPgXJ?=
 =?us-ascii?Q?tNkYuUai29kfG8SOXUE42LIcFGFGUBdYPSmkQ2eKkrpFouK7E0d/rIVgO9GC?=
 =?us-ascii?Q?pAfJkkumUw1wQzirOtJWA+CJ+GD7+dYmhTl/VdsCRvMH+ZvtxHVQv1oYKBZB?=
 =?us-ascii?Q?Iln12NolTcO2X/0tBtYGOrcM6YMFLsJtBLS5eO4M14OYbba/pWoR6GWp45Iu?=
 =?us-ascii?Q?27NKdXEV9NZFTss8mP4cWsDObn0E+1aV4f6/RrcqykmPsEOQOdqxbu11G8gz?=
 =?us-ascii?Q?8y5W3kzjXpHDkYecyH94fzBgkV0CAGlr6dfzOG0qHOX8KjWsJOxASWBm988j?=
 =?us-ascii?Q?gRJ7vuLBJEUhCsU9MPMBOOUdego0XSyo5QmvhRCL9yxbzmX9wnx0FjGAc+6n?=
 =?us-ascii?Q?ZMa/WkLyHnZ4Y/rSdKfZzGWlipBtHVCqRUqZhEtsjDUU4r8QEIenE1sbXozq?=
 =?us-ascii?Q?gWdiqxWFTEEyyJsZrcHwZKt9NWOl4kTNTWO5cb3Gxh9OtYJCYknMj/rjXx+N?=
 =?us-ascii?Q?hljSf6VkMYQ8Hi6dmus0UT2JpbZ1wBewC1h//vSmyv1GPpWEq1L2B954YRX/?=
 =?us-ascii?Q?4/PYBp6fXcfXiwdGEfpxbMZoOBYKMctleCAHLqv2cHymB9/iOj+cHZsrkXI+?=
 =?us-ascii?Q?ar35rHUlSQLYT5OV2BoIYpeCIvi5ecAVgQxcodXB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762982b9-7e53-4a7d-4312-08ddca8dc16c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 08:40:34.0449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NRVgFaioy+MDjwS1i1NGJ5kesTfM78N1EWOOleWB2+HIqpxYII7gjaGBe3jHaekUsjPfZCn0qa7ZXo6g3SNoLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 08:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220824

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.3_M2.r=
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
	7. Twin Lake
	8. Beaglebone
	9. BeaglePlay
=20
=20
ETA for completion: Tuesday, 29 July 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Thursday, July 24, 2025 10:58 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.3_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.3_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.3_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2078
>=20
>     Build hash information:
>=20
>     bitbake: 5ba7c2f0797a72536a81f57276d4e5c75f23011c
> meta-agl: 1496a1e3d560a0f6fbfc17448f3881e24395c0d3
> meta-arm: 77ba0e68e3d6ffd380346c616a60bf0c7e35a08b
> meta-aws: 7e2eabe1aa248cf3c6a69621cbba40343a2e0896
> meta-clang: b2139ae4b027cb014d0137de0b46e9197a10a4db
> meta-intel: 7fc52266ae25215e0d510a792fa3a688d173d1dc
> meta-mingw: 3b92f104e024bcb1341b563f396291b41786cc38
> meta-openembedded: 2de5071f9ac17338ea8a0ec0bbd451c5455166e9
> meta-virtualization: 9b034e3defd4aa1108d7a6b4dcca600d4352b132
> oecore: 4908c71e25fa480c277350dd46d4199b29675440
> poky: b5ba3223c85eeb614b3f8fbf77fb7407f4a05d77
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
> View/Reply Online (#576): https://lists.yoctoproject.org/g/qa-build-
> notification/message/576
> Mute This Topic: https://lists.yoctoproject.org/mt/114315481/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


