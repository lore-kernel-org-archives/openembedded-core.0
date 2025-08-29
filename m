Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186CDC8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 08:29:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web10.8850.1756456167203085326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 01:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kzN0/NAb;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756456167; x=1787992167;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4SiK/SdtFOsLuHamNWQs7AXW2pmOCSqe6pmgXcorFm0=;
  b=kzN0/NAb0T+WNtRP8yfSS7e0b1mVmctuVGIsDhkauoxIft5lFZafPOrC
   miuowtpduy6XQjFIAzxBTMnTEKgMpz0+6tgiiBf6SG/Y7z6LLAA/6PvhE
   +ZcBp/RJYMCmZJMOBPMr9no1mtqMSAy4vHdhpocMXVvCOIBznZtdVC6DH
   CQ2a05e+6PnijhQC/s9gRiJIF/9oIXd8dwet8lNpH3/LtX3vYRTDD2dyQ
   kmPlckFmzc41FmIMDaTkxvOM6XP0f58n5YquoMPganp+YLCZC4Z88ld6b
   9FcKGS8UESD3OlfKo6aIeRdb7hqVCE+tQ+EErlfbqED0Fyim56vf8jAQ4
   Q==;
X-CSE-ConnectionGUID: vQJRdcQoTBC4patsLKkgGA==
X-CSE-MsgGUID: F/IrSUdTRii4+1mDfsXSGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61373675"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="61373675"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:29:27 -0700
X-CSE-ConnectionGUID: 1rkWR+NMRo2wpVbq8TdivQ==
X-CSE-MsgGUID: SsjU/FqMRZyyuCHZVttF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170494691"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:29:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 01:29:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 01:29:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 01:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkoD0HdXuB4rqf07bgNP2Hbz9Zx9wpXBIl6dbQtnup8ElkZ9PBm7JLI3q52hg4N/fUHwbUwyZ058MdXtjcKwHgJKYOY8sZNGGfAqm1fHJ1V/MKAp1hh9Wqz/fWJOOGkgswZ+Ai+UwE4d3LhgE7keNI6VwLgXAU56tIm3E0uAZBT+vhVS5PX905v0DiEJZHLFr1vmwjDzaydyF8nB0crx2ceu6U176rXtmPpxnrs3w+3yj32E2VPnGPQqxJwDrUH1J8X9bWVCxlpA1dXbgaawQzgbaUfEWaxIoNiKTOWI4DlT0D97CrTCYQcrrFr0LagYGLsGcI/rauRcmBqutMPu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2qehFlg4y/9F6/V/y9+kzyU7/jAjQSBsXjxJEzzKvc=;
 b=gCKsxsSr6X9z0ztSsPSMf+nefOUgc/lV8dJ/WwTC9CYdBwHYzCTNsFye4Ya63iO26MxUgmyMblIalwjmdcz7RSbOS/uTXXbvur8GETAyjBt+vz6uEUQG2AZr1WErV7U6ojHLgflwyVB1AuaTnqpU0D202iFRGIBA5tTs4N+QvBvae9KRRt9jWIe5277H2WovQLIiYhT/WbHBl3fECTsYHUmu965DJeai4gSJdUqFwsd53x0Cfa6DHAk780iqToKHFAwnbEGMOPQsIFDBaQWsXvtOS2tXHG7bW+i+tcSZFvvONFQ6nUy0GZ1IGx9IWl83NJWbCSIYRJvAQjLWuHC04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 29 Aug
 2025 08:29:16 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 08:29:16 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.12.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.12.rc1)
Thread-Index: AQHcE4TiKXYqaHQUjEmO0YVOu/9Di7R5VdRQ
Date: Fri, 29 Aug 2025 08:29:16 +0000
Message-ID: <DM4PR11MB7760578A42D980F2FCBD56EEA13AA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010198d2b032d4-b6a1e13b-b204-4fee-bded-d398501a60f5-000000@us-west-2.amazonses.com>
In-Reply-To: <01010198d2b032d4-b6a1e13b-b204-4fee-bded-d398501a60f5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ0PR11MB4878:EE_
x-ms-office365-filtering-correlation-id: 75d30abf-c23d-410a-d0cb-08dde6d62478
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?X2X+Y/1dSHT7+kOI3SGxxjWmr5m8J3Y6qppUUBVd9ct00YCrsB/7g3VFuadk?=
 =?us-ascii?Q?E17ozQNXgsD3hQ8ZX4RmMx3yTxta8GDxhuRlLqsfH2Fay2as14PqwOOl3Rjb?=
 =?us-ascii?Q?5XnEYVChJ+Et9CyHI0EAc/uWAsqw4j6X9/ubGqngBtnb11GkWWps57ApmAZo?=
 =?us-ascii?Q?fSuzwGbIJ8IlTq/OxvKNgvXKFGAa1EJRCishVE5YYyaitiLpgUIdaKpdcnD2?=
 =?us-ascii?Q?dAo1UCA6H2qug5trzBqdkbVi44WzMel+dUBNd9CDa0hDdAOR2JaISuwZrarl?=
 =?us-ascii?Q?CQ5+NFJ6ibTFOmspg4l2Du7nnN1tIw28wVy/xKH5LJ/4WFhUL2LASF2mjslS?=
 =?us-ascii?Q?bCngg0oyvroX3taTp46ZHzFLR1lDCchN43VZnzZbKjPDoSlf7sherESBQRxs?=
 =?us-ascii?Q?l/GOPdSfdx7DNbTWcilbGfOyUnic2AxTTWZ1fXzw+1wntMPRCtScXFJ4A+Mr?=
 =?us-ascii?Q?QIT0Y0t9YlqCLSnW/8oV9EiGu6QMJDl6GWGcGeG/185joJ4bCj18Dpfz6x3c?=
 =?us-ascii?Q?lJ1RSVdmVZV0AhET9Et2Q7VF2scX1vhq3/fBRqr49iwp1hHjSRSyqLitUUD8?=
 =?us-ascii?Q?/pLu4omUYH+fl+giWqs968RsUQCduS9MPDk1Y2lldCj6xVIZmtG0EINFhBCB?=
 =?us-ascii?Q?JyWw+XHobE2vN5fJrCLULu1kUnGt1y833K29Vaioxw1RSEx/VdES9yvGqfbF?=
 =?us-ascii?Q?V6wLCntfMPd8SCE8UDRlX4fRimUtmEEZAQbBicRGoGfHon3F9MMxea758vZy?=
 =?us-ascii?Q?Oq0JRdKNpePAKHnpaQSqBijMXhGDWSuhplyzU8oGMyawS5+q49O1t2rzmcqX?=
 =?us-ascii?Q?IdKFjct9hjBkqnXsXViqiCtub69g4bPud27/xLdgoqQIt5MpbPq9VNtf5X3Y?=
 =?us-ascii?Q?JLH/iuVe97Y51IOD6g5vJvvhTN1M88K3SwwItf0j/voVzHQ+bFTeHjsTEg90?=
 =?us-ascii?Q?QZ4B1cp0LbE9wNcdmKtKLt7ZdY9I+YW6EfjsSLCzjb7fMvjRWs3q2i/TmlXm?=
 =?us-ascii?Q?tm7fZRgMJ94R0/o14r+ZNtT24IOaOpTEeXkly9z5A9UT3veC6c6SbQVkBKyz?=
 =?us-ascii?Q?oOKJp5U7htvKK9RTOt3SFLNKQTFbXS1faMVEVp3821LYMImJRBjUX+E2/V9s?=
 =?us-ascii?Q?kBj8Ewgz2XP9hKNUyri39CTvmUIneGYvLox/MVV/VNqSg+icYN43tnwG6/VF?=
 =?us-ascii?Q?lgfxIERaz1NXFRpoboOSNYp+lVYePI3/499gPy+IqwpyQb40LGq8WWml0+WF?=
 =?us-ascii?Q?DUcYkwFI4R7+UBvCaUVvmQF1mjFdTgCTT0xIGvb9fmhOBXzxITNs0lo8i/UR?=
 =?us-ascii?Q?mesq16e8vXAu4BkQxOEDvPX2lEE9Qpnd4281UHFEB2vvuRnl44MmKSo+eaOq?=
 =?us-ascii?Q?jAdULHFgajvcfPJpdqZFsXOHmK+uFulhl+yFDl6jhO/JzB6zVqnIb6tbvCZS?=
 =?us-ascii?Q?xL2lqTk8iEM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1iN5P4ZF+AfCi7CSVq3bDG/fe5oZJ+EAbt5uFSim+UhS4FseBXVcFK8Gf9wn?=
 =?us-ascii?Q?LrjqqzuHkggZel+DvEkFMSwHhHgodhXvyZBxDzNvXnR5ELVS16fX/j4k8csU?=
 =?us-ascii?Q?gu/1LQ2ZZSvTv2xke8EgCQhprFYntgZd+ZGmtZSAJx8FcCIAL01eAhgpp4UW?=
 =?us-ascii?Q?wuAHwMvSFVv71GdN4SkGTDmm2+zYAczNtYCVi/Ufx2T24Dm1pRK3pMrJlvvt?=
 =?us-ascii?Q?gS8S0zdSRA2j5e8wa91yrS6ldkk+uyfT3z7NAByw5U4xq7g0Yg8GDfPM++y4?=
 =?us-ascii?Q?OvCenmIMGtgtgpaxxo18BH6WNFBnxkZJep4MFwV64x4+xAX7W1egz+3LhCph?=
 =?us-ascii?Q?rCZW8EtQLHKe5LZGTuSvmF8hcXqsn4/rKpnQZ4x3S3R2pnys0rgg4jyc3yAy?=
 =?us-ascii?Q?1753l7IKbXwdwdFByn06XUDxbfwC306S3eP4xiFbgwjSaIXVmakKflhB3Kxi?=
 =?us-ascii?Q?UIgEngjOLYJ8VG7zqBtgrU91dC1g7cB6iy2yE+EJUoOTcPCuZLNMoMJAKUt3?=
 =?us-ascii?Q?kO9zWMdGsSe13S6gVDdFkSoQGc1uydFBOZDKin/hBYVndDI/3zIR0StadMQ/?=
 =?us-ascii?Q?WlqUUgdInVXWrckg2ISsA+T9KwiRibNCbO+uWAO34HgxmsFj7Qh9lPfSqONT?=
 =?us-ascii?Q?o8jAdDId+5wj9Ui5ZCWyY6MFw+zheaUUvnEZQCLHOvQa+CjbYm2OpmxdxqTT?=
 =?us-ascii?Q?TyGVEENjYZhdVbqtjShwQfNAXSd+dbgBVKGjJWiZr9IvthGDy6Yudoz30S6F?=
 =?us-ascii?Q?mJjALUTPW5kdNn14FIkOIt4UGU9co7/dPD5OIXqVJoI6U9oM9QSxfWGzcUrt?=
 =?us-ascii?Q?JKNdiah1VkDp6QvcjnYlpRliZXsHYei1emZxCb4+j+52JXghG8aUelnt25a4?=
 =?us-ascii?Q?SzShMy31eUks4LZGzMG2oCEtxk3w8Y14C3Qk6DybiIbQezcgVeG0W+Cxfwm8?=
 =?us-ascii?Q?nxtplWD5qs+fDJ+sid3B28uSeGI0wpUCnwhzfsWQcTgDkMYc9rxOqw91DNtB?=
 =?us-ascii?Q?j9LbjLUktKz822JHyiZci62cz3Zv3q6WE+Q5a1u41Yi0yWPQIf8RyBZ8jTeR?=
 =?us-ascii?Q?XmRjGgNktfT63Y53bOKRwFh+Vca+mHhwZ9bTud4R8hjBsxwGGI2DUcFs68mq?=
 =?us-ascii?Q?fiFkAdCqflDUCVxeP/KdrMuIHe3PjrZf9ukLPU7qNrq7jDYzbmQ883pHkh2z?=
 =?us-ascii?Q?hAkLySv8sJOme2cV+OFiU+qOIZFASGOi38oTJ47vFrJHC1zBenKC7ivMURGN?=
 =?us-ascii?Q?W1CRoPYxv/AtoxC2Xw9as76oU19gJOn3OXzNc1Q9JzMFMatakEaYxvNnIGtC?=
 =?us-ascii?Q?NkoFfWlNvF4/luH0SloKNl9XwHQz6Y7XARdcutUeF2ru/RC2C15zboeBXNM+?=
 =?us-ascii?Q?MmOvdIKlBv3NDeTxFc+MOK9RxQzu8KBgfeG/Hq/dCwRdquHfYoLC19qc6tf2?=
 =?us-ascii?Q?8wYhuBjBqlqZH6SNxtizysCg/aF7z3WOAVLdZsEWaZ0thDQQbo7D8SsvwQVF?=
 =?us-ascii?Q?I/dlRXId8mI1myiYjsCfaYd2Wn+hPmxgb/ywQsB/n4d6MNpB5HHjOpaewiDP?=
 =?us-ascii?Q?T4xJB//PVnsnl+sIw7+TFAzh+/OZ8tj8Sc2/gp4L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d30abf-c23d-410a-d0cb-08dde6d62478
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 08:29:16.5746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDClpco0q8qq3hjfTfnSXPLhPtYmF0WNJzmrepb1CuiNrJSL4KyLWfOh7ycopKAv/Ul7ZatCrV7+8U1QV6a9mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4878
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 08:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222604

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.12.r=
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
ETA for completion: Thursday, 4 Sept 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, August 23, 2025 12:50 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-5.0.12.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.12.rc1) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.12.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2255
>=20
>     Build hash information:
>=20
>     bitbake: 982645110a19ebb94d519926a4e14c8a2a205cfd
> meta-agl: 435a9b13b8486cf7d51a86cebaa72ee382202a50
> meta-arm: 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
> meta-aws: ee15a57cea8899e436c2c70ab8d2f18d07ad00b2
> meta-clang: f915bbfc71f7b58c38607b8407718bd8b5cefa44
> meta-intel: b065676a83371b34559f2077d9b2f6a6ac5652f7
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: c29a18fa39ede952f3f6108ec007c1906e2d9a0d
> meta-virtualization: 02f72c96bf9acd0bd3ae0463f482bce8feabe749
> oecore: 93c7489d843a0e46fe4fc685b356d0ae885300d7
> poky: ec220ae083dba35c279192b2249ad03fe238446e
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
> View/Reply Online (#589): https://lists.yoctoproject.org/g/qa-build-
> notification/message/589
> Mute This Topic: https://lists.yoctoproject.org/mt/114838825/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


