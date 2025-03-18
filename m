Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C913C35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:18:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.6638.1742285876841651825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 01:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=V+o8xP2u;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742285877; x=1773821877;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OrTdjxaCg1Ra7MMdfNhHaPW71418WQA/+WniFRk1Vjg=;
  b=V+o8xP2uu9DXFmcmTE3KLhPVbmQ23/P1HU+WEBzPpSjR0RrXqqbvgw8v
   xpKrvHcm/jdMN4AE/ltLVRHd5wOABxvDXfgtDkXwrziAQtlmUdTERoU5M
   xqwS0Jd7i17AYRFb4z9BNhb2jXJl+wuSYPCgvxEaKBo9Upi7SwAohv2B0
   /WwVZeYQLPs6heLO/PBjiQFA11ICiXIUFydc1Leh7ZP9iajuQx+gMKUKc
   lsXK1UQIKvRcxC3GPmYC61MwLVZHyJT0/wPAbdtR+QbRrBdxJaps1Dbta
   ccVv26VerUtlbwYlKVM18c5Ovfpsj//mnkYGNnf24rWj4hfhK88uffHFH
   g==;
X-CSE-ConnectionGUID: NKmttEDIRF2ymKsTyi5aeA==
X-CSE-MsgGUID: L1HItqFlTLy3QKWgtJjtlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="53622263"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="53622263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 01:17:57 -0700
X-CSE-ConnectionGUID: 0ITnVWodRCmY7MWjD81Y/w==
X-CSE-MsgGUID: LPvvQHp6QG6UldUok0UDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127364353"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Mar 2025 01:17:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 01:17:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 01:17:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 01:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNynTqICkv5z+ZAk8Fgkh3wVvLTcDSiGbQDnAkQtNXIKPpZqXTHThdJ+Wo7O2BqEWTrLps9SFGy5kBHfx2sbEEw+vTr+21n/4ttxnutEe0yRy2KeRYXszRf04xx0sNu/v3pxq/rRhw0HnX7AFBHlGR2lFtpjccgL/LXAnTSi0IfyM5rJBatXuzqaBehVrp18TrdccWzvMEThdILjIy8rrSYvoCXt6MSHOzdOcRERXIuysBRmhRP71IvsyGUJ1XnG+vCfTdnaeA0vxlgnjh/s/+umpdGR67nlX8PFsfoU6Dwp2eSIuj8+WMjoORR/FWaFStsMF34+0z20VPBh6/Uy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbgtPjKbrABySR+wEZZoJ0FeZ0Jx85HuTr6dosYH780=;
 b=VT+/8yl8zFii7CAyECMK5+q0imfBF+Bz4omI6Cutue1y4sBxcZApmLd4yHbtu6zS4ejBn0o+1U2NJwrJ9tKiVOE8gMSafz30xniSHBgjZGuwBs4Y1fHx4s8N1HcYyIiO3X267XGN5bhNqDDXzZeASgQv0nsf2ZxrIYx+/cMsGP7h8AbsyhG62eoInenDQnX4h6/8OH4dkonSGflweGHd/t/qpceQGxNqDbmDiNsFOlB2+DNfIfEu8kM8bvym8/kbuRKPWyH7pBvDHWFaXNKIdMGY6Te8Ucj+hs6eATpmfJKZDSTXHAmZKHH87ogI6p8EOfzcogQR6Wql26PPt+katQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 08:17:48 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 08:17:48 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.8.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.8.rc3)
Thread-Index: AQHbkjc9giq2X6Pwl0u5vuIjFz5FEbN4l39w
Date: Tue, 18 Mar 2025 08:17:48 +0000
Message-ID: <DM4PR11MB776002DF565C0404C166A6F4A1DE2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010195834954e6-2d7ab9c5-20aa-4966-9ca9-3546f4436395-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195834954e6-2d7ab9c5-20aa-4966-9ca9-3546f4436395-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DS7PR11MB6247:EE_
x-ms-office365-filtering-correlation-id: af3cb9cc-5213-49cf-9013-08dd65f55e79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?MFurW3qvnORhzwOxvoiQXKKTdci0yGaWPLUzYHpI33KKxyQXEctfpw9E4ghf?=
 =?us-ascii?Q?kkWlo6K27eJPY4hr1S/sUh4JuArFdGqyMNYuc+IjKOaYhpDyB7DgZF05S6iK?=
 =?us-ascii?Q?5gw+RidM1mHNrS8jK68fRQcPJebRU8mcI0RLEpjRRDez63iwIrqfDv6xtSOb?=
 =?us-ascii?Q?1yLz/VVHUyKbkPkFTiu6BpqJuYlkLynCrIiVgZ8AIBN4DwSTGoNOyXa/zXxG?=
 =?us-ascii?Q?WeiFA1O5Sgzr5nslkU9FFW/rw0IxvIsNCoZqyX0485d0C047/IFCDvXV6XVd?=
 =?us-ascii?Q?vxwF2fTSlI6khoBz8rpzJb7Q2q50CPcBLB+gi58cmeN8QHlxzBvIRP5pNAq9?=
 =?us-ascii?Q?NyQ70yBPBOnYMnbMMrDZ3HMl4BcgIV7JQkjMmbmSD1tlOtjM7HF/kT0eyZjY?=
 =?us-ascii?Q?/PmDTOfPe5rq6/Rt4Dkaj1NVFnfGUUGd3RLH+tPZ9cBSKyInrtOlEeymUiw7?=
 =?us-ascii?Q?g9/td1THLyMQvlfhofXOxC00Dc87QWqh7oFlmoBuxy4idUq7EPnfaQixxBnJ?=
 =?us-ascii?Q?2rb5x6fWnQUvB1eE8PpxaVIfwe6ETvVrMlFxsw4e6RDYaayHUj5LdQSCD3xQ?=
 =?us-ascii?Q?I5j/x+1q9NmQPekgbA8UWniEsJkfjoNLtOG/EH2HOD5f/4GanTK8Se3GV4j9?=
 =?us-ascii?Q?oNdatM6zd/Xdqvj4Y/YeVAtmcrthHl0d7BkamzreD11H4nN16ZoHePfSPaVW?=
 =?us-ascii?Q?DbyYPpf7g3nXpZ4IM/Xv8f42elarHXU01vmouUJRi3Um4S4d0toymmr5mD8t?=
 =?us-ascii?Q?qBo6E7rR9jKgrmdzknin6dvwdkdXR4iHQKKuzxblI2jHxVSDZMs0XG9wjaB6?=
 =?us-ascii?Q?wwb7EA5cAAb5MflMTwi3R2GlUUw8MtVLrmKM3yU12uhhgmSXLk2sNFpcUoGw?=
 =?us-ascii?Q?zR5FSMOFV8fsmIhRFvKwJe6QAWylUwzByD+YijXn0yjNAnUn0D3ISeZ5VcOh?=
 =?us-ascii?Q?0cIt/KHOOs9U5VT5AMa93w/7jKgV8zsNZAJDYWyyHBUCnFEiopCMEm8wLCPr?=
 =?us-ascii?Q?hkdktTFaNCO1rxT3csRcfYdhoai6Ft7/q1z28kUuntnHZVX7IGVJXc0ilxsr?=
 =?us-ascii?Q?MZZMWjSuf4VG3TuxY31J3dWhInQPC36VckJPwbRFZMrpjoIYXoGK8CFbKcmx?=
 =?us-ascii?Q?Wh8TTLgnJSjuy77WOXe0W+YX6WBgschcCIxOHI02lgdgWouXvnOK3N0gA65J?=
 =?us-ascii?Q?++pddh1VgEAF+134GU/g0t9kDaU6wVLuWNJcWu0Tw8g15KdVVxppuD+Bp7xc?=
 =?us-ascii?Q?o6jV7o1vNLtC3pQzYOTbk5nGJC7bxC75S9aZ3uume43lkrKgKFJjH6wQCfAz?=
 =?us-ascii?Q?5vD6idj1fUgZshf26LfOs+4Tw0tOVIs8CEFqqYUWgWgHnOP7X79Z7JOEsi5i?=
 =?us-ascii?Q?DiuG9x09vJs/5mm9jdLDji+QPvle?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x/mvgdiLkrg17rZg4o1XqrwNyaLkdesnrfbMdXtr5afqdz+j/MSKObGhIsBZ?=
 =?us-ascii?Q?Zm4DoY6WwnW5AzMmjbcvq9vVbkysgF5ojjJSywveeHExuSkFZ4JHqAX4FwZm?=
 =?us-ascii?Q?wgIG4ZL5dT+GYvl2xLcDcKwlteI1i6vm2jxyAvu6BaF8g8MjohMeJA3WhSDh?=
 =?us-ascii?Q?J0apXcZ3+DUTHqvmwBOuKb7XVcApzdukv5fJ/V3ysgobrDfrEXLHZ9jrzNBo?=
 =?us-ascii?Q?JWG7CZFWmBp1eU5cssPh6jIGK9Zb/NS8STY/gY307r79P3WmDpiFla/3cp63?=
 =?us-ascii?Q?lR4+aGYxfeUy0NKiBHfbfO06Rtf7uSe4FM3N7FX6hMYhkTVTkFBkjTav46vG?=
 =?us-ascii?Q?dYjwsRjWXon57Rg7xH3MSA2H8lzriqpn5+y80TlER+d61guDG6FV47d1TzS5?=
 =?us-ascii?Q?oXlhRjJ6dYw2g8Qi+N5dTbJXiQejSLq7zfHW0StzTItEXVMsRm+NywhipNcO?=
 =?us-ascii?Q?Kwe3AkgXKQjS5we7AOneR8P7YIsZllrzHIrZtO/z/7ofZW0TjkOzv86yFjIM?=
 =?us-ascii?Q?v4Mxk9KZly5DknKTwBuGmXEz587JsA4GDJ/erFhhstR/Uv5N0pkjHvBP15Fc?=
 =?us-ascii?Q?9T4NpppMOnDm6f3e96sh39f6kyzAEyPxk+k1Fx3VEMInHVeTrfwg2iCNSi8y?=
 =?us-ascii?Q?ZynpP/OtX8m5Cu6dWcGjJqbiFbd5RejviddUCsPI6+1uKm7GJ8vvYa3QG26p?=
 =?us-ascii?Q?KhKava2SlIiFISLzUPRmbfRxaJhIBbnkuXWMLY8WLdGY4lU9cEaMPjGhiQRE?=
 =?us-ascii?Q?6uwstv9dF8daRXpTdDky5+irNtKorREPKkYxd/eGLAUuBuGWsu1tKhGbrq2l?=
 =?us-ascii?Q?8gHvdbpWpedvSNVOQJzaxUNfJcqIRLc6qTBZL7p0ms5hWuzm4kKqbIDKFzmW?=
 =?us-ascii?Q?ggaWVbv8oEmRObo975396+y7T4YgaIJd7EXpBLDupEpx96CEypJ3OhrU+sbO?=
 =?us-ascii?Q?RE1weESHYqjt2Ipsr/MNiJ//Wcbq8WLvBT9QJajlyB1X7uC/DKZgX/KJpfIk?=
 =?us-ascii?Q?h+eIUP4Bt00PHZzXKXuCoJ4Lg9VEy6kstXh7HiYV9QICoIGcDozKDocGCQSb?=
 =?us-ascii?Q?2N/+U1WMidiDw6QRt9P4NrSjLu3kmjTCobjSEW9yWfMcZKvNIiHZE/NKlIBO?=
 =?us-ascii?Q?nS+OIQanZ0qKtosKkcUCVSWcfPC45kydYi2FyicWZM6sqswT+EEvmact/QFz?=
 =?us-ascii?Q?Hq4NVU247h9lwVKyN1kh3JgI+2+B8AXAqFHMUtDVXIYJBTrHWHprbQGjSunx?=
 =?us-ascii?Q?pVTQwBj5VjvLpPEnOuTBWBrrfE7v+NgPkZnRA2iegV3X/z36aWgOElZ2yjF6?=
 =?us-ascii?Q?SsSFV4Tzif79qzxOyTYmpjCiYbrYdL1a0JugzG/Yt+4AdMDDcI2AgOY4Sf8m?=
 =?us-ascii?Q?k7BKDbxbCMIQcFZgiKVPvfbSwsx2iwcO2VtC72UnGUI7yd5WiBTtiVLIM9SF?=
 =?us-ascii?Q?281pBTS9t2rIEPMtckbF94HzT1qMSFw41G/e6hzMlg48x/jaZLyGzAZWS+AB?=
 =?us-ascii?Q?IRLwCifJ+sJtwlsWOnGNtJj0GOvfRHK4eUFwJBMLcjrlCA15HGy13PexrrI4?=
 =?us-ascii?Q?0PIuyBe4/maJ6U7ylCp2ekHXrc7suaRXiFWSyDRV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3cb9cc-5213-49cf-9013-08dd65f55e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 08:17:48.2325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RcxoKP9sLu/4pFH7jmphtwoPtoUg9sP5tmJ2R3UqXdypsGti1CtQgsR268DsvBoR+MwsErGUaq+QfgTFIEJfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 08:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213186

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.8.rc=
3. We are planning to execute following tests for this cycle:
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
ETA for completion: Monday, 24 March 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Tuesday, March 11, 2025 11:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.8.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.0.8.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.8.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1161
>=20
>     Build hash information:
>=20
>     bitbake: 7375d32e8c1af20c51abec4eb3b072b4ca58b239
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: 3cadb81ffaa9f03b92e302843cb22a9cd41df34b
> meta-aws: f824b120fb367fa53cb39a68dd4fcaf474ce913c
> meta-clang: 8c77b427408db01b8de4c04bd3d247c13c154f92
> meta-intel: 1a7ccdcaedc965f019a9263364437356b8a2ba29
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 6c9f1f8d4538119803bf793747b65e4d23c33544
> meta-virtualization: 94ee980814d7c5824449b2745a934664adbf3007
> oecore: cd2b6080a4c0f2ed2c9939ec0b87763aef595048
> poky: dc4827b3660bc1a03a2bc3b0672615b50e9137ff
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
> View/Reply Online (#525): https://lists.yoctoproject.org/g/qa-build-
> notification/message/525
> Mute This Topic: https://lists.yoctoproject.org/mt/111633976/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


