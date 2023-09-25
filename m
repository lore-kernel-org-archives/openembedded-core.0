Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE011CE7AA0
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:24:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.65417.1695659053740934043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 09:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=GiuUjOa4;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695659053; x=1727195053;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=c+sANZl4DvHTXdyMkTH2KsWSTz2U07vgfYeOF30RNRQ=;
  b=GiuUjOa4TklM0ImehFZ7B4Qfv8CYFUsiyVilhPOa/+07nNirWKJIWmum
   ++SeLDOfoQ4yWzS3HJjyOdTsfMTj6152MgIjtLcpn3RhPXnLC5QwKBnnY
   0VMEvmV//l4FDZBz2EUNAQAPSznPwMCAmYv6SOsouUJ+KV9SDZzsn9rbu
   Aup3BCLaAOUOUp7BQXSHk2+uTKIh9SqWkhkj3PM+JHf9j1h0z0jvv5Igx
   KnIkNikIB/wNZ2CVLo/zJUHIFrZGdYfY9VlbV7kneGcjsTxL2sb3cp3Uc
   uDc5uTeaMaMH9PLuASXpeMR1uPg6/bVtAWkLegJMuH9GBkYtW0JLHu7py
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385131542"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="385131542"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 09:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="922055138"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="922055138"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Sep 2023 09:24:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:24:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 09:24:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 09:24:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 09:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYy79F6fJLbWtnRhIEpPy5DH/J51/Zks7v2i3ZpnN3PSrZRU0Xv40DRJvVmG2muPCUB6WJnRVxlm4A0M1ZP96wGPTMBHPdK3lRZvIzvWBsJef4L0wMDRKzi92JVGKEMoKN4OnRcDVhrVhQcvvPc1aMtCRY6WpfZIdcAAz0v981gbES2LEloanRzgPRedQTEiunO4Ho3wpnJK7z+XJ0X49Yju2pHLYqS71NdA8NFGr64T0rrL0OSDdIWaRTICuzNfUKHBZ+L1e4ACRGCeOZzGgkqyF5MeancAApvNa7WyWzEaVTUzyIB1uRekAMHn8IZLVsFvjcBnce0paArILU94JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wTJ2klAVEB5mTEme2rdPGVIikK0TFAdUG1gGrN5cWM=;
 b=RAubgEJAEbKldJ+I5m0f5t2MNmypP983+YTOqXue0nj2imrLBJKnPE0HYfbAGemfBNUtpXyMGHtruJqq4HdJPhn7XYD5Rr6XNU0SCE+fmwQFm4Mrble0Gq0ljGkyCigdD/VkUXOwUlpnBP5Kk01lUFj0xDA6TRKq7jCkoGBf/HJYCLu5lz37LJ0ZnX7Vc6+/d6paki3tkuRQWNLqaDKvs9jpkBeIwXZrMS9AZS4xurXa979TYqO6rfi3TTvxKUod63sj1NBvgN2QR8E3ajFRvlu2rIpuGU9ovBVizameUKIZpME/RKokc9NXqHh5sX/DOecL55PauNdiQJ908QSnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Mon, 25 Sep
 2023 16:24:10 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 16:24:10 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.13.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.13.rc2)
Thread-Index: AQHZ73yFHjR8RZEid0qig4vN/BKa77ArufVQ
Date: Mon, 25 Sep 2023 16:24:09 +0000
Message-ID: <BY5PR11MB4152096BE91924D3448F863FA1FCA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018acb19195c-0619b075-ca67-4522-86d1-951e55dc7abb-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018acb19195c-0619b075-ca67-4522-86d1-951e55dc7abb-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH0PR11MB4951:EE_
x-ms-office365-filtering-correlation-id: a7996295-20c4-4307-81e4-08dbbde3d924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jKDpCQLxFLlgTK9lwVbJY51S+aPDOD48PFu5JY7tRvleq99tUSra7cLo/4ZHmJ1cofsYP9Q0VixpCZl2ptxMgaFmlB5+YHJSfBRQ058yRXxk6+jpJihhDRICxs49yVLSa6RlYxguXhTBXv4H80M/rfYfJ3mZFriARld6ncdBt/iaUA7zzClWDpUl/Nh5sbJR/QBzV8cdM2U32ouhwmUdzODBe51RFKeZh/t+hx8vKhkgdZf03Thda3F+I3efgIGTFVqXY+00x/6b+UdyK6yMzi5ZROLUzbjYs/uGJnbMNHXhTvMWGTZzF/dWOrUBL2XLpp7sTXhDPEz3IKm+GOQ0EoZEEb+Cy/X6ph7n1XFQuED8pecwji22koayFgPy7oKSkA3/pattehLaGTTNBw48C8HVuy2LlFntlIXGe4d+yqOtGAyj4TSN9uelV/2h2UXlf7RO77RJ3xa6bNEEWZ+iru5jUdTDcQ2KVrGM1uVBV/vwy5uOyVPG/zjVjU3tZBo7kzIM3w8V/gPMarMJVuJvnVs0xl674rP9TcXIsThHdP45bbVkUv+lYbf9ZiwK1vVGfdJq49cmYd9yHGSzpbF/3imbUbYh+yIGvmFDbBzeFehVGFf6SGjkEk5lrJdaGZuU0ov0Vyd6GIvDWMHYozpZsQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(66556008)(5660300002)(7696005)(316002)(9686003)(53546011)(6506007)(122000001)(76116006)(66946007)(110136005)(82960400001)(478600001)(55016003)(66476007)(26005)(66446008)(71200400001)(8676002)(2906002)(52536014)(966005)(33656002)(38100700002)(8936002)(64756008)(38070700005)(86362001)(15650500001)(41300700001)(66899024)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KqAnommvGvfIGLu469Qhlo8GaHMV0oDc0WFvRuhLBA4MPSnxfG7ZyV77lBPb?=
 =?us-ascii?Q?jYXgqH9P1ix36vmud7987XsKtLi0N+CiWWi+vhG4mRY+MN07ZVwJ/lQ/cRFM?=
 =?us-ascii?Q?z8hZh2XGVW2K4tOXjpODWdqqvUe7rhQCtOeSOXDoMA4J1FOCsaNfx4EKlNkf?=
 =?us-ascii?Q?iKK8uzymZL5R6csKih4Zc558r9UZ1z0JH3/EqWVQ7y/cfy6f+OoAZBo+eVqr?=
 =?us-ascii?Q?whZ2TReEvfjJdGSwgmCzJA49RfYRaJtI0Wds4MT5uuyg3Z4LjcDYivl64XmM?=
 =?us-ascii?Q?EVKVWoM3DsDnF9P5kbQZLgGy8pERQ9LwvGmk9cBWOHwgJtt0z09dbj0H0Fm/?=
 =?us-ascii?Q?HBTr0Cce27BM9RBkiP9fMCXpXdmX9p2/Brx9HjCHGc2EtHUGHbBukm6qU/Ct?=
 =?us-ascii?Q?Rlx7607QigqVJJLhOCoE94myHuglRxWI47gZFB2ABwQK+Gy5lJ5FLV+y2dwL?=
 =?us-ascii?Q?EZRZTximumtck/QcPy7pQBRBlCETvV/ZMV91UF1yc84tDg8GAON3eciiZy0K?=
 =?us-ascii?Q?SXG4KwSaLcpu6rTTQ9tdbkX1JwmNxbIZzRnBlk1fAI6bLdHgkQMTpnm/IA9S?=
 =?us-ascii?Q?xMFT/KglM9KZDIs2rFceVXz2lF6D1E6NcXI9uTPQy1+Gygvv0QP29yyomlt8?=
 =?us-ascii?Q?ZEHwwASrD0/XjBTT3YWUJrMSa9VhAw8m+rZg+RsitpldoC/bHtnETpVEW3uM?=
 =?us-ascii?Q?6oDNJ5MnqnIqNzu2O5U899pNOyaxqwdZ2s9DtskdYpvYJqDblxHFm4jFoAto?=
 =?us-ascii?Q?YPqPQKXvX2oQ6eUw8B6b4oUWgyFNtgPN0cZkssHEOoD09YPN7NOdAxHfyBPg?=
 =?us-ascii?Q?1CXyU9uBUUCujl9y3GvoDgqjytYplR/0EUDpRlvVDV5I5gm05HP0DZOF48q6?=
 =?us-ascii?Q?hSx/0I4JR21XuqvScC+rR9lX3kxQB0q9IrcapyrVGFdmIGerdNNx5OyfSO2U?=
 =?us-ascii?Q?nWxQVzOcZSmsDBdeJGKnQG2ORd4WLEUSFMZomQPB6E6atZCW2jzWJRiCAtO+?=
 =?us-ascii?Q?IJyTOfNOg983pA/Q23yv/DuHAdA4qI4667QyPiVYVyT3h2DRw+LcPsCu28s1?=
 =?us-ascii?Q?Ep0na24hDGZkL7IXIKL80q4yrYGbEDpmmU5SXPZuZ4qlRi5r4ZRTdDWpF+Yu?=
 =?us-ascii?Q?K/HgdUrL5kGXOqFkGaOc24x0Tfu65WMm/+g952IK8XfduIs7FWj11D+3gtZ9?=
 =?us-ascii?Q?yMt4RB9Ggg+6YmSBGZVU38wDAMBzb3FmWkYRGGZrh5Svh75e5vC7YnciRyW+?=
 =?us-ascii?Q?gKOYyNqlB66HHnHxL7t3z+pvvUpa8ne/rLhaRwal54xRJxEq6EZ4W6TgpmWs?=
 =?us-ascii?Q?1tQry8aPkPQB0cIywhGAbanvCzaCW8/CVSfAqUGeOR5drkTf7sIH9TUNvFlk?=
 =?us-ascii?Q?CR6VpALXkRFjv7b6H66jsB/5BZe9n3O7co0K0IpwgFkx8eMMmh3NoETFH6eo?=
 =?us-ascii?Q?+xlo7hVffFq9h29Adr/r1TsP/hwpobaQXMCe1uoK5K5xbKA8QnQWYoF2mNGj?=
 =?us-ascii?Q?yKBgp+RYPs9sepbLA+Nom/XqY7TI1+NGAxLc/jEREyQsZIxf6PELYsxlb5Dq?=
 =?us-ascii?Q?T76v7Gn1jedAYwn0xtyt9UJMQCMvADAYSjdQfR4G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7996295-20c4-4307-81e4-08dbbde3d924
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 16:24:10.1265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Utsr/L2NK8b9IuzNVaIf35qdN7+bNfH+2Svtlkoxx8E8j+eL8dIhGrt1I1WfoWsVxd9qToOind78mp+TJJF+XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 16:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188194

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.13.r=
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
ETA for completion 28/09/2023.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, September 25, 2023 2:49 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.13.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.13.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.13.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 41b6684489d0261753344956042be2cc4adb0159
> meta-agl: 666f141563fd7fc12b7638479d5c0cd38dae5006
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: 60891e535ce219b3c473a89d8ae89cdba1d396f4
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 1342bcdc5bfc6620737e7d195e7d9bd744348577
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: a88cb922f91fda95e8a584cee3092083d5ad3e98
> meta-virtualization: 2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07
> oecore: d90e4d5e3cca9cffe8f60841afc63667a9ac39fa
> poky: e51bf557f596c4da38789a948a3228ba11455e3c
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
> View/Reply Online (#313): https://lists.yoctoproject.org/g/qa-build-
> notification/message/313
> Mute This Topic: https://lists.yoctoproject.org/mt/101569753/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


