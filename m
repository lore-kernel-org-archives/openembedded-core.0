Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF463CD3437
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 05:04:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.832.1695099859209777595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 22:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WUHZ3Dwo;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695099859; x=1726635859;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5MrQk+zzLRwO+3C8itle9itZ4nSWw9SQ2k5sfNe706o=;
  b=WUHZ3DwonNdnajRFFp1hSzqNcbuf17bALAyi/YEIsa5K3jRSbgCyEvZY
   mqVjm6tysiQxfxxWz1DUwUOv7WVHbn7EW/zODeeUyBm2bPYgGwRwWFuaz
   tosd7K4v2v91l8AmgQHd1OSy3IxS4tuxBIeQk0siqbOqDXUZwTh9HuNk0
   vBdV3IS+cJZS15Mmkveu+33Rp5BIb1jv0kW24En3fEmwQNUgcztF+N8J8
   pO0jhYL2IXqj+OiVg+q4qOYUQHaPXeQAB++7P/3mhmW05jAmcE7mLXA15
   U9mpQH8jj4YuqFb1bWi6e6p1JKv0OEEd1kQMmrBWWliOuL/XnPoJd5mJY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370169701"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="370169701"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 22:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="816312686"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="816312686"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Sep 2023 22:04:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 22:04:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 22:04:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 22:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfMwVwCZiW1NIK2gmvsMa6bboN5Sq/CdR5TwgPYAuf+R3iRl2eYiukkE22TSWjfmbAHQ0Djey1VkrGBfoHDyKC3slqsIJzPpF1c82GksarmnMA97bsRK0fRcsDoliyRs3yRs9Cc03f9SiGsp/PIELAmVC1fhIn2ZO/96xTnK5VKl3yybQYxUsGCVyzYXHXSpyqR0fBOHnwtlxSKmyeqXg2ahngLJ2D/C4DT5YulDaA6Q9wwKqw+y3qVXnkhDVRcUlloLP3rWy5yicWyWQCtu+JWZVHAhmcKr5fj2oVJnv99cXVm7GXDUDuq2yPaUljKUnVfg0w0jybH0veS7eUXflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6Hihqxm/v4JTUUuRth/Cim+J+zhajk/Q/S4JkoxU9k=;
 b=iIbrthKIFmw7LIAWQ/6Ips22HBqXZPX9s4JczAbPVQDRun9NF5XRHcFJO8Al6D5Gkz+Vvsvlyqvg/Ft0gkgG76re70zUx9Qdwm48hGCG+u+BrQI/N+Cuma+QaPIi5qROh1OeQtFRWh6Uq81ScEkftr+U5eYMH6axqL7tk9gXoF7nr1w6URbqSqCgnpwJHJrv7HBOOLqARVD3iH9kw7DhVJ6KnjrWqlqAVp6aGDbcfuujTP6lUp2O/XmqSjv3PJoGwufZNtqJw0iTqVx+5X8s+cMS7cQAUoHy16USoYGy837to9dJyTMwc+VK8yTjl2MES3xBmH0whKDS6BfeLwTCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 05:04:14 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 05:04:14 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.28.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.28.rc2)
Thread-Index: AQHZ6TT3eSm2ffyNYEajux+dgqks2bAhmqsQ
Date: Tue, 19 Sep 2023 05:04:13 +0000
Message-ID: <BY5PR11MB415244874A90AA7D1BACEC53A1FAA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018aa1f2c11f-86d5f669-c1d2-4ef2-bd68-f03f877b24b6-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018aa1f2c11f-86d5f669-c1d2-4ef2-bd68-f03f877b24b6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB4802:EE_
x-ms-office365-filtering-correlation-id: 63de5778-d279-4c45-b3f7-08dbb8cdddfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YFtePSEh+11gnx3OnRJiX3md9kpOmQrw6U/ucwrWohf0g5c4hnG3+U9FNUMRIypFZNWGofuP6ZpdSoQBWOsuGiHXsiTnAX/mDCf7VCbjzYiX0obMvuz2Hwlujou220Bdyi2D2ZJo1EhQlAqEGUWLghOxi7nWRo2XrTl8YJAqu0guQJTyFIdcbD1sxuoEG4kr99Y+965r2xDYoN7QS47k2jHeKGp4aqDqlkVR3csv1dWNsDWqcEta4emrX2yvxX7rTFbBZS9rZxjbb/maFWUgmPgXVUzLZbnHaqCAoiy4ZVseJjqlKWmlilICKQqY1iOKOn3ii5k44ftaoBwV8oY5gIEItommMsl1CnlE1FnSfU1FR1ZR9NRF4HQs8NDFxjrqOiQQNsv3rNrCYhAOEo9kK3Teknt9pDmTXiq6xbjRgJYYHIwl4YraFUfCnrg5BVwQiTBgELc30fVk+iU9X7jQTeUWnfqpkEg2jPFyuLUwi+xOY87oZfuHDkl3BqY0UiPLXK+ojBWk0Q/nAEy+BzAT6qTeTUC0Ii+F+yvOJWvtTfDGrrHOUMCAFPAT4rB2r60Jt+wAt7K/iEAM11kBkU8phWc6JJU41kZH7BQ7pWH/c0iXfAQYT9VYDngowkwADoxk/fEBl9M9AQe0ruHq7xOUWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(1800799009)(186009)(451199024)(5660300002)(7696005)(53546011)(6506007)(8676002)(8936002)(15650500001)(316002)(52536014)(41300700001)(66946007)(66446008)(66556008)(66476007)(64756008)(478600001)(966005)(76116006)(71200400001)(110136005)(9686003)(2906002)(83380400001)(26005)(38070700005)(55016003)(122000001)(66899024)(38100700002)(82960400001)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yo5NRYZBa58DvXQWbwVrybIfLz1EQygFXxGbiRp6NIChJDuTI8nG1iidwDoW?=
 =?us-ascii?Q?0e56TC/PsOdaPQKqgOGoveIaaa/cimg2SnqmKcUJaX72gCKSjNr0H/O3yuku?=
 =?us-ascii?Q?wceG0zSkMfOPDblYbhVN5Bm1HCvH6hWHWsLmycrqt9g6Z/Oznps4uVFm5B/o?=
 =?us-ascii?Q?PPHj9lCzcDouYcaR38g8pZ7szsCJw46MenujK6sYKM/aLe9V1ddjaBUQ5mTn?=
 =?us-ascii?Q?Eyl553lylb1YsQdNODSKKvd315lqwtdGBg0OsTr3Q+v5REVOiYUgRkvIGzx6?=
 =?us-ascii?Q?nlMoolSAAHyUHBAnqQ2tMipoWNv4xAfmqnR4FFycEsnsH8B9u4UR8sR4ygQ1?=
 =?us-ascii?Q?IR27oKjh2+8AGO1FBOsPZlAIloYxbnEbmnAp89ng7WcrK+PfqSpngocbj+Yn?=
 =?us-ascii?Q?Y2BDS3lBMDYjcR4R8Mb85ym41/9GY94kTZKsr4d6UHr//kPI0qlP1fzBDlc5?=
 =?us-ascii?Q?io17E6wgNXXwfh/sAH01RG8Lienk789DGU933G5gsI9fD6fSRHhF8cngjHvK?=
 =?us-ascii?Q?Q2It4fgHQp4jRjeOjsO9CP+2KAi096CajNrNqaCNr+VxFnh3gJHm1nbVArlC?=
 =?us-ascii?Q?ZabNzkX0i+ggwW2C4nhz6LrAKu+A1Y4ezE79UxywYGblTMcqCjFQwdc+i5bp?=
 =?us-ascii?Q?BdLyGluN2+wDxCSXGsIjNcFuYV0SJPvrQFmM2AlefOjjOjWDvHkDiISXbID5?=
 =?us-ascii?Q?3llk4H7K9PzAtcvL3QgDDUXFs2/uLH27OIJZdQuMq4FRZRZUUPg+sqwJO2u7?=
 =?us-ascii?Q?QpoTMLb1d4nnMx1C/tDF5wOiyufqeJypzmSuX82qQoDrXn7q+VAX9hjRrJQ8?=
 =?us-ascii?Q?rPlMzruV47pcwDR6ytd+jAQPTiJUwuwqd4gP9ejYQthNzR2b8159QLzgJUaD?=
 =?us-ascii?Q?qPjHpSJGrc6MsAFZARh5We+1lFlPHs0FB8Sd6PpXgxLR6FPa6Xuy4/fn2Ft4?=
 =?us-ascii?Q?fvHg5Mis7+GZZup4sypE876theNxSsm5o+Ht81FGsnU2NbCf0+b6Zsk2SrPz?=
 =?us-ascii?Q?Rqm3tj3dg6vi0lxs152+W4thyCsTHOs1uvhYTRRqhBtQ6r4137GRFJEdtnak?=
 =?us-ascii?Q?wpp9V2J35PEIiofDxXD3HT6Tm3DlofI9KVHMWNro0PrKUeZbIQPs+RTuCubG?=
 =?us-ascii?Q?DyQHYIo6ESgRRNsgHyvXSnuk6nsNp/5j76shgIOFWPArGAUQByNFsz+b1fAH?=
 =?us-ascii?Q?JRp1izCDSsspJQV3I+CZeGaQFzU60vTmbDgIrsxBy2L6g/y5tlvgHVZGC+hN?=
 =?us-ascii?Q?rqnMN0waU0B7Qpm2yFIPAH6+eowH+a9LRpdaLpu2BftZCaRtZ03mjVuGYv5a?=
 =?us-ascii?Q?S8+qbkSjqMHgK1DWAssEMdhaCDtNbDzIK1U0zNiro7o3jjCOLI6kAwDaDhI8?=
 =?us-ascii?Q?lTwlB6W34cRoUl55+YIpGKDr+fJQJz2b38KrepszvCyECudlBbmDdwZr0ngg?=
 =?us-ascii?Q?SxYYRb0Z1+3Y402kEdT+VagdvsEL0Hc4gcVLxehaRNTPADyDfRxn5RZ4KDuz?=
 =?us-ascii?Q?dTOR/3jtGvtHgJilVpedrDkxgCB4R48vkH/QrTFLgv5ro7TpAGnACT+lHuRj?=
 =?us-ascii?Q?F9IaoDU3NcxvtoNB9S5o3J+tWjj1tJ7koDa67fjt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63de5778-d279-4c45-b3f7-08dbb8cdddfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 05:04:13.4841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RmlNnP+fI9cp1anmvTnFY71K+T4o6kQ66Z9gMwzLWnwbKyfA4dmHe/KcBgKkfCRtWhNh/n/sE849k/LiMBJ8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 05:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187849

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.28.r=
c2. We are planning to execute following tests for this cycle:
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
ETA for completion Friday, 22 Sept 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Sunday, September 17, 2023 3:03 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.28.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.28.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.28.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: b60c7085ec370473bea9b3b4b65826a17638837f
> meta-agl: e0f6590189cb0a510bff0d4233667c552d964591
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 77e5438c27292ad5f8c7d3b100cb09b8dbf1c7f4
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: e42d1e758f9f08b98c0e8c6f0532316951bb276f
> meta-virtualization: 0dbb8593fa38ac2a04fcac04ff3e35611e849824
> oecore: 8b91c463fb3546836789e1890b3c68acf69c162a
> poky: 926eb08fe325e2ea13098f99d920840b9354ceb9
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
> View/Reply Online (#308): https://lists.yoctoproject.org/g/qa-build-
> notification/message/308
> Mute This Topic: https://lists.yoctoproject.org/mt/101411111/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


