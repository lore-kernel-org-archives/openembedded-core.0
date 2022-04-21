Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE6C4708D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.18403.1650525927491088661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 00:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=B2AG2BC1;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650525927; x=1682061927;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P1DL2G4ONViTfoxSaA4p5iFOvbTjYg7YFkBA2/vOV6c=;
  b=B2AG2BC1xvZj/oaOKK6aGXftk5ezZvC8/5mC+4M+qKG3RTKRt/7mtkJT
   tuT9yEQmrIjY33o+Qps2ol42BkW9s2TN1gr0IHNsBVu121XNRKE7MS+BX
   ioiGDJ2RIuKuf7Ri1nIqvSjxZDIO8tLlf9+GRvurvIfgWWGiUsPTsFahB
   XfWQjTi8f5qaS56AXmtJ574nw2Wkz7m96GRj7XrIsF/VkIE31f6RU0u32
   Z7dvSIGP4o+zjoawu0N++BxyQRdJUkahz1tU7/nVnX3KgXKomcVCHwZYI
   oCcHArM2CLv8jrjx8bQ574wDOOukm6kIYTjPLGukr/E4Vr+2Sd6NJxwcp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="263118812"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400";
   d="scan'208";a="263118812"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400";
   d="scan'208";a="626400520"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2022 00:25:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 00:25:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 00:25:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 00:25:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laX/kVqDN9Nx3SqQDYdhcJ2cjwciigvw1erTjGly2JfPr+AT1Xuv7iRvxoW1yK749mWQS/8CqMGVUnGECYmuYmfGuGDMBDWYkhDU25D4AnUwkanLf/7+ld88ODaGpF/ENk63B0ljyaf1V0sLqVZuwBN2zj2YXWidwaPdEO9VF7p7cBmV3Ylkl6N7d5dbWPoJs28ra4iRZliIdAnGvGL66CiXnZfZxMjEX3yLnnKjENllgu8oCgfC0lchphVsDELhaPh2PJWv7SrMw1CW4/xcxG0m/SVTBMHnH9AUF6Goy5WHUrrVFpxflyZDHxCVj6/TQutegAHw87qTPmoyD3Ez9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aX2a85oBAN/qWwER9XtcfMCuu6cGs/9XWU/wi5cPiE=;
 b=YAZ6OIPCyQXoNru+khOhtqIuixWNEyvpAmMseZqibomiI+n4pH5HH++SsQMRgIogPmLCbtXrQmnxGi0zYziyJpkKijEMOpLaIFoeVcnFPgWAgY+nQ9roS0cztGgW7SA8wP1TIpQLb4Nff9Yg25uXVx9uj7XxELJUTwRgovKPYQDqPswtiDAvr8IXxSI9CXZOzyhTgCHmxS74bPBrqA9qldaU4OPJTWcXcdQu6a8JwucI02sJfNM8mw84m5JuNWclZoozqPle4RcVTWZwI179nnOGiJo5q51bvo9P7Cex6DlTLvhjcDc5P9o4V9uNCwJQiH8LAqSY366tQH2cjAUjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BL0PR11MB3010.namprd11.prod.outlook.com (2603:10b6:208:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 07:25:13 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 07:25:13 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.6.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.3.6.rc1)
Thread-Index: AQHYVHxAgVoaQxMCBkKgq963S2O0saz5+IvQ
Date: Thu, 21 Apr 2022 07:25:12 +0000
Message-ID: 
 <DM5PR1101MB234828C3D0761A2A3D0B1F2FBBF49@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018045908f0d-aec445aa-251d-4dcd-a10d-8d0ead780069-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018045908f0d-aec445aa-251d-4dcd-a10d-8d0ead780069-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e6d6120-794c-498f-055d-08da2368130f
x-ms-traffictypediagnostic: BL0PR11MB3010:EE_
x-microsoft-antispam-prvs: 
 <BL0PR11MB3010FF0DCF7267112C722324BBF49@BL0PR11MB3010.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rNBJUBe4PbAnScuhzoVdYPYNE9U5Zcuf8u9V4r+FQNsizJx/S68Lx751VEFXjuF6XeDCOAiWrpTBXx3NdqW88L0ftz3VUNsPZWae8vDuaOQhh5D1FgSseOPEdoGFTadnvolA9pCdHleb81T7L0Z/q+1GD69QJReQ80EDSSlrkYHtF8+VuxMiOIE1SW29hktZhcYGailwxgwpceN1lWPKkXnzTLWZyVfVX0xnuwWpUDTWbBCEvSjtQVrzLUI2472wdGNcCn9gW3wPz8AJr3wm7pH5bCyRnHZ6ibi01shnbYloYpsJwYg1sF7b0i6M2GSmlm9UYdWe+kdiJ9pL4gvyGieMWjM19rn9K3XaxBO/Ip/Pd02me2j0+fLVkxKpttIng/YATbcRdeKNUhh1ESZWdmz7YcltmAD+H6mNBPEHbJi3zghkU9tfi8S7h75CRkOp7Lhik629IOVU6S79z+L27IC8FmUCZk73NW7rVR/0H0yVO3J61MQ0Kq8YD9AXxZKTq3Xw6cpYxZKqmPKpg9Zb0OPVKfCtLHyDqk4atmV59tcVtHC0LOhZXf0H4XweoYuSyvqMbChKL+jKAyIHkY14UPvlPvtSO6chTqetXauVZNjSKZQpSwQnAi1TmpGbM55+tlrvhHFz9LCcyOPeCZFKHe24C4FgiihYeBZQpM8MLZr4ZnaR0ftQSy/b0cdctsXScnMM1Sdu2thqYmwdszJk82NUGgUaYPsnZh1+GYR5ioeG+QKgivmmz86dv6N88hg/RHoq4qfWAXJSZDK9WaL/pGbpMyYhxRcPkdcncXKbe/k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6506007)(2906002)(9686003)(53546011)(7696005)(82960400001)(15650500001)(8936002)(33656002)(5660300002)(508600001)(966005)(86362001)(52536014)(186003)(122000001)(38070700005)(38100700002)(316002)(66476007)(66446008)(55016003)(66556008)(110136005)(8676002)(66946007)(76116006)(64756008)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rGnnTwQoGfTYmlhvQBYrPrBf4MRU3XAdtuRjA4e/PQX/quJlu21tpo00duQk?=
 =?us-ascii?Q?0pySE9mJQOinS3abyM8Y7/oUrKa5M/BuVk93CE6RRM1UCvD1xYR+R9Ftv1ND?=
 =?us-ascii?Q?AdW9lsxn2BDypYOsSB8jAJylMy3EW5PgElbL+r7IRNB1Sd2YUAses1GQUgaK?=
 =?us-ascii?Q?+ahgGENeKFqAx+yD3NtneaQW5BU28e2D9Vlu+lSKpnebJxDraI2WdddoeTYh?=
 =?us-ascii?Q?Mryz6o7E5O69goBoVZUHPzlCPvxPbGOL6iklrZfDErrXfd74W2Ken+vhb8/D?=
 =?us-ascii?Q?o5lU87LrP3vmCC8QB2jFO4KuoOommD8kKI2PavSoTbiSnEqax69n5vZ/kqW3?=
 =?us-ascii?Q?G9J8tBr42OZIzEn3PKbCZDPTairQCx2jHqz1VgKphrBO+DvjxfieBk0a/6Np?=
 =?us-ascii?Q?tdnQmR+sycAwURCb9z0MbbYUzS1ib6/C6YFW/lKc5om52i1VTrOc6hFRoQ3f?=
 =?us-ascii?Q?q2TfWP4/poDKVW3X/HdqbhYwgyDu3rKp61XYr5vyEAjTGjFKF6OOt42eGOZB?=
 =?us-ascii?Q?nPCQgla33SalVN9tIPRIJkAEMBLOic8AwnjUzh6wMvdbDkkkEchK4EdyRrA+?=
 =?us-ascii?Q?uJVN9RkwXBS6zwGRDfD+n+L5AD1G6iiFPgCu8qcmt4jjPgr6SeIb+vpCIokx?=
 =?us-ascii?Q?lwn6InNdtSWLeV6i6azC87jzpfUkqO4dVAQQMFd1vShUeq5mb2ae0iQ0SUzk?=
 =?us-ascii?Q?8npxfR5teB8eALh0ZqIA3JM5UxGny6/BVFj1ueAQqtSbFoepOKhbktsu1g+f?=
 =?us-ascii?Q?mu8ILh98+tMqe0Bnvq2PfZLua2vmF5D5CMjD7LfBOKYvkGvkEBWjNSVdiUZU?=
 =?us-ascii?Q?cmdUwkr6OtA8Gk2QObVthlIs203mTu3Xt/I2YTn90qPJuguRxrdHrwtuAeu9?=
 =?us-ascii?Q?GYcXlORP1umFLRTeXS28uHBFAJb2ID02MSuWKA7nmfDWrN2UTjtmTWxiLBBh?=
 =?us-ascii?Q?dS1vlZdpy5l/P5LkVq/i8EIWa3KzkVs9Kbn2OkVuT01sR+DEKv75HxtmDavS?=
 =?us-ascii?Q?DTQhWc7/gPR9h3Hg7gFCc1zRla8DobiyIiW++tFLhgeE8XkgSuh4i85DGbEt?=
 =?us-ascii?Q?/ZQ8Y/PRwFio8TRx1DFfhbFweU1DICiEn/T/xJ2hXjt0fwtyyPglHq6lzIiS?=
 =?us-ascii?Q?CI4+Fm/yQvABrahFpC902+ojtHlMqbuZWCt+4B/ZmI19NHwRq1DaExLUwihS?=
 =?us-ascii?Q?belNpuz2u9ODkAgHa8QThc437qH4O4BWOgRWIwmS4WS5LYT0a+8mO+NyGgST?=
 =?us-ascii?Q?uj3OTWFrpvx6923d63XM0sgu6MIxslBQlNKncTjV+VFtJXasBhAkr6zDxslo?=
 =?us-ascii?Q?ZRuykpUsT2sKKzNFjzsHvLsDEKKU6SGVm/sLzt+DdZRFDE+qfBaP3MvbPqTP?=
 =?us-ascii?Q?0aBOiIL3vvArT39RfuCRxNk4/AnCvS8SXfpzABfrh7fZSg0R4axJ66e/hulk?=
 =?us-ascii?Q?QrYIYw6O92elGKRFvWrQH9r3tICeCwj6OEJ2IvUGRdvIRsrLHxJPkMWfK5L+?=
 =?us-ascii?Q?tiV4NZ6fhCrVO1bgM7ZyNahVaf1g2ICNfxFz+nSgE2RdYYR6iop3UfAo8MvE?=
 =?us-ascii?Q?92tMAy+J9Z1QS0S1QUhdMYI2e7WStXYreuaFPoS2VlYnhBP8c1Wx1mqR4lrl?=
 =?us-ascii?Q?pzuDvtkJ10X/kcUh3pin5uIB7ZKdcGLoex+hMfs7EVgHtSRG5+wWxNpZjhvQ?=
 =?us-ascii?Q?47xWtRJbXR+fbQTqaAVF/g527RYPmveTTDH11W8gZZRDmSKMn8S+h7QzFFiA?=
 =?us-ascii?Q?i1POoGh1nYbJpEFk8vG5JVQbAJMVeND32DD3tbbwLIq7I4GaCGXoRqxNjZD6?=
x-ms-exchange-antispam-messagedata-1: z6v7TD8BIK9JMA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e6d6120-794c-498f-055d-08da2368130f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 07:25:12.9044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 a9tJG1lFGefVSWpqjvEuPlRq1ZbsIut3EhZ5DxrL02kz19A1mb16sOhv8wkOU/P4yz+Qy9yhrBFxBSc40N0dEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3010
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164744

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.3.6.rc=
1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Monday, April 25.

Thanks,
Jay

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 20 April, 2022 2:02 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.3.6.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.3.6.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.3.6.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: d01d8326331cfe59208674cfc53aa26c0028b313
> meta-agl: ca53308f8803fb50709b3f17bb1f9e476366bb62
> meta-arm: 878fabbfc720da7d634ed9a2c0e24d4b8845ea20
> meta-aws: 6801abf40bb255a31bce5061c5c6b72f5e2a8f58
> meta-gplv2: 9e119f333cc8f53bd3cf64326f826dbc6ce3db0f
> meta-intel: 16bfef2d1e0d0c8c596741d0bbb820541c432f6d
> meta-mingw: 422b96cb2b6116442be1f40dfb5bd77447d1219e
> meta-openembedded: a970ee45c2335c37041ad1658323481874bb4f0e
> oecore: fbbb689c8df7f82644b8a9bc5bb6884bc6516660
> poky: eee9fba7b4d5d7a268a495688039027390894e6d
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

