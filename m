Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8803DC47DA9
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 02:55:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.10264.1706583316687431308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 18:55:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FEWbaWR0;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706583316; x=1738119316;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Udei/NfPcaaqf1f2D7JoWskJ9R3f8dNPWWxPsssV2vk=;
  b=FEWbaWR0xX3WCwDHsf0KZ6TPMhHvtxo1XcaxOnqbZ71ui1NUa3OxvKi9
   gBtnZvMjEnNBgSrAur8Ke3C/ebv1IveGSS7rR17siG1U3ajFjUHwfGnVy
   KcrXQjIAfxxgeqz01Ze9iaRVqNkyaeI+KTrBhdGu2ZFuMCL0h7F3+NP8t
   VIQYeZvbXHt1cfp+BD0uKsVgFcAewpM/4MnrFmyXc60IwdapCtbQlBJxB
   UdKPxK0Sq0xOF1VA94eawQEfFitWCBwyqeKdmua6gr8v2yh8PHkOWTIFb
   FLRu8FYZ7tBV+wikOKuJH4PeMxhnNfCFI7XjH+MKoo/XiFb9Hl9/S8j4h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="400292109"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="400292109"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 18:55:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3577835"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2024 18:55:17 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 18:55:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 18:55:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 18:55:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBlTH5oWMXoYEadrH/vqG7GxPEDuUkm4AzHg3pbSFB8b7iDHjwwh2usR0PBrEeVwkw0JiWk9DUAaVDOjuggS+VZLzTQAJgFDoGXwPRUDUc/pqY7zwqOc+NFAPX4fLnSK+I+Ld336WWhRFRps6GDgaZqhDB18q4T9V8nIVrc1Vh5kPtk4YmyEv2WKkRXvyUUjX6kmkKrKwemicQa4fJjwZupu+Mcy5NHBG+944AdRdaoNGFFHCnwAr4YOH0GLLebE6Xhrx+4ylVPaOXeye8DLXAUs6XPs4rUNA8oxmxVsG7un/on7dSP8SoZxmZ4v+uEhITK/En6BbQLMr5L8jOsJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ6ooMAaA8bKlpu0Dg+ljZHx2UeTxF3DraRYuEiXMWY=;
 b=Ap3af9H7yCxYCJX1A9wtcBN2WCD3lFwN82CNim7Ac3I/l6Z8Q67SVnPHxFJfOLCDWK8vT68uC2+BhrOJyEd1kWWHi4WLdr883d8yyUEMH9LyDmo9S8B8mWjH6YwmdswUWKS9FzwcniRSsNnWhKtfibmdMkll8KsI2V1eV31YOnsvxWsjxMEdIwX+dA6o74HOdK9pzMUsLJnH/AoYUmXa0Yu1Lj5ajv1x2w/zWnJmiP4YDKyXqORDRWCx7be+tWQjhHE13W0Lrs4rIKLJeF7Ml2L5nf8sYDsHsbp7/NKgEkJwAV4oCnN+oHlvjcKN1SEvMlx/RvPPQmA76JapbI2RgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 02:55:13 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 02:55:13 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.16.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.16.rc1)
Thread-Index: AQHaUBfkHW7ixELtiUSckp2G24Gua7Dxrpaw
Date: Tue, 30 Jan 2024 02:55:12 +0000
Message-ID: <BY5PR11MB415265B46C660E668E4B2850A17D2@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018d44396ab5-09abdfba-e02c-4f2e-bb9b-b00d2b98119f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d44396ab5-09abdfba-e02c-4f2e-bb9b-b00d2b98119f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB8256:EE_
x-ms-office365-filtering-correlation-id: 0d71a431-c438-4653-7c28-08dc213ee137
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0OqnuHo6v9+yzU4Nc/FZjTbZ44iFG2dLYoEcD9zsA3hfPOQfXrwKfxAkJGYGE2R8l9dSUmpZdGK9VGDMpzD8p6CNg2ZESiUv3iF7VxmxtNtuFLp45r9hm9+iCv8azgEQpX3fuetnBO6Fe4x7ZM2gYDtrzAONetr7T8jf0o9HH1b5t2x6Pn5P0TMyIk2dD8uYuedg8JwfE/yjeWKo/KXt7acRjHGsvDm/RqNB3rCQr72CQoVXAI1gYbtYRuAm14Q76s+FhYjduWFo5LQjcLQpTqrrhs6eFj67dPbfAM9sn5nHBqVNlESLHVNrsK131IGJ5KRb5qwrdVd/IfjSEtlBVRFnXreqyzSlA8pDkJGzsOdqrgqFYyJ0WxwwVH6HRnsbXJl3msabB/U5JVq2wYyqIiGlNJAIaS/sKTIOvcwTs+S3931CqpdsqHxu7kLJSwBInglgvrwiQ1ngAn1lPBI4DgiC2mRrcOTGOibSh4D73/VkiIyfR9R8DqbQFSr8vkSqQ1Cyu6qERPWNfUyGPQOsGU22CpfAq5RBUzB9ZyATsioApx3Z17MDYesH9glCFDvijnm1srzfuLBMkQOk8RQo5oorSDc6XZbrGxtYo6AQkaeuCEuMwgEAlVRdFpLbsH74jYbVwNQx3AT6AcAUPGEUbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(55016003)(6506007)(83380400001)(53546011)(7696005)(26005)(122000001)(38100700002)(8936002)(71200400001)(5660300002)(52536014)(15650500001)(8676002)(41300700001)(2906002)(478600001)(966005)(9686003)(76116006)(66946007)(110136005)(66556008)(316002)(66446008)(64756008)(66476007)(38070700009)(86362001)(33656002)(82960400001)(66899024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R5+ZwP+KYJSglIfZLhi4YFw6o02QMkd04Lsy9FDuYbwoKMS3wT6db7yMVJZj?=
 =?us-ascii?Q?wvgMqGegXB1KuyAipYhdmHwjxfYHslYp76nat5/Khh+b6cko/mZjOjWHtzPe?=
 =?us-ascii?Q?BYVlrKpmwiN29CXklXZy6LOgYE+t92oYf2JojB0y7BLSQQFuRkvOBzPFrznS?=
 =?us-ascii?Q?LQLQi512EsKH0TzV0ksqszX79oxCDDse0JzyNSJAVRNjXg269J3yb+p/56I5?=
 =?us-ascii?Q?xZ7HEhzeQxeP5xUG+1GAxIAKOZBOX7PCq8pl3eRey8lMzEZ1/+1kzDPxmMFU?=
 =?us-ascii?Q?iM727moPRgCHEyn62trYuuM56843hLJ1J3VmIcc9Q0oeTPh0J0iJHBYhSEJf?=
 =?us-ascii?Q?gB8Uy6db4OZ7vJ+UN5Wn4Xit3aDsOELwrIU3r7zBk8fGpjkXXkyX73GNTUyC?=
 =?us-ascii?Q?416du//mTewft5tuv8R+4DfHjjLIMN8CkzmuvNvIF6o0A3bRrqXHbswe7dIy?=
 =?us-ascii?Q?AtC7ltkEa2XuMjYwfk+ooX0g1YmJ1kG5yHgDDrYo5katjGoPqfIb+i2RxrF7?=
 =?us-ascii?Q?8C3d1dOUsYExwE6ZZ6HI8k4vQUzFOlRR0GQHbjE4wlYXLP/WVUk6ACtUuskt?=
 =?us-ascii?Q?hlZr1wue0l3DATBQVBUSOEXtlH2EhKTHaZDsrA2rvJrW2GOx1ZnUqxSse8or?=
 =?us-ascii?Q?T3SiAXz187fEYmcbHCV14vQO22rXMxp7nZczgF6aDwo3TfkwY9nHJkbv4cvN?=
 =?us-ascii?Q?xghQEW63zU+/XMAy7y7df+VpzOGcgTi4EEMgwZcIV8NV/vzf9LXoP5GzXcPW?=
 =?us-ascii?Q?Ge6d4OT13y1sDXFuYChsP1duW31e4AKyGhyPnNI4aQ4iyTE73rGmq3KULoOK?=
 =?us-ascii?Q?TKnSgXR2//SjoczLst/YZD3Bk4bNDKZPoTrnwGZcX76NlDiBjIYCBCrnrSDQ?=
 =?us-ascii?Q?VwJaiDp5pLvpPFvnOTYdvWXnckOaLHyBNmBLtLvDIi/NOauDBBM6dElqTOHS?=
 =?us-ascii?Q?79nK6oCCi+O4I9yr9B1xqtd+kE9NkWueJI26o6EwQ7m81nyDHIntfUwAhTmB?=
 =?us-ascii?Q?E1hdEQPicNOcRgRsW51a9zv7Dq6QpfA9kv3n2peZi/KGcr2S+Bh0oI3Ougqj?=
 =?us-ascii?Q?Lm/zjSET8j4C1Oo86hCqRDBQtOeuOOUumr29Q3jMJgqUp2OfPtHMk0t6NkJD?=
 =?us-ascii?Q?Z7h/+dqJcYv+p6kjQ8stE3A+JgwmrJu8VRspd9ijid1R+1487B+XRUxgMe36?=
 =?us-ascii?Q?RWcq66MnOpalL85lzlj30vk7/PJkkRqvKJMVcUsxWb4kfeEbjbHD29rFntbL?=
 =?us-ascii?Q?u25cqEEJ2hlxdXAGrpO9OCWXh2xaB1rscV8gOrW26j+mVBWCP2j+wiUCaopr?=
 =?us-ascii?Q?h5UzyRkp6n9abDQ6IorYubJ6IH2Kci1fcPBBjeD0f6hhS3N7jKZVhu5OYcMC?=
 =?us-ascii?Q?pA3i/unRqUV2LI6ujLtN8D0bQHq5ukHboCIA4hnnyON83PklWtJMmv57WowC?=
 =?us-ascii?Q?Nqyi99bESyWJRfF9LVKva7b+YXoWhVSenIkGUIVMmhZHNm1dn6puvi0KO8C3?=
 =?us-ascii?Q?NAG3hyKtbuOZ4WDA1Kg1FFchiN7ECNuNJmDGzR1kcWgVEsVyF6vZQ2ZWhsyU?=
 =?us-ascii?Q?nWeX4ZP8HNWCQxzAZrEjPdR/YFnAnZB5ZN54dNVU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d71a431-c438-4653-7c28-08dc213ee137
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 02:55:12.9688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUUblnRxgjm2Bps94bkOAhKvA33rFi09cwouXppxWZLEorDXenywOqFrm4p9dxBT4UMVov8INEGK68ZB19PYVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 02:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194485

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.16.r=
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
ETA for completion on Friday, 2nd February 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, January 26, 2024 1:24 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.16.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.16.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.16.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6498
>=20
> Build hash information:
>=20
> bitbake: ee090484cc25d760b8c20f18add17b5eff485b40
> meta-agl: 35adadd18a6a0fabbf57cfdb2f2d72c2807375e1
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: cab60ff0f84b2335e933d4eac326df9fab5b9bb6
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f932ebb2544170f43edd22739f44307809bf8cfb
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 730e44900a0a86265bad93a16b5a5ff344a07266
> meta-virtualization: 88327090d26955a678c6f8bd2585aad4d802f6c4
> oecore: a744a897f0ea7d34c31c024c13031221f9a85f24
> poky: 54af8c5e80ebf63707ef4e51cc9d374f716da603
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
> View/Reply Online (#380): https://lists.yoctoproject.org/g/qa-build-
> notification/message/380
> Mute This Topic: https://lists.yoctoproject.org/mt/103971039/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


