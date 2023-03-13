Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD40C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 08:15:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.14919.1678695316122746600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 01:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=XmuldY12;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678695316; x=1710231316;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=w5Y8jBi9p9g7D72lPJO6evWl0gAUrcuJzkB3/BVDRiw=;
  b=XmuldY12e2dLg+Fc2+rsvt2WrkbfJP19YdbhXnHtXnHB4NGIAijWiaGU
   VhKZVLV642Kq2n5HKZaFIKNYNuZ6GtBXUsS5ArzKGgQNxQIGpyPTYZNp1
   8lroRJPdvoqIlSZWKwmMIH42FamYk8zPUcgN1Sd1NZ7nWgnZUyYOM4cyw
   ssbpxWxC4iKEVKW8oJwcC7EQPOisi0GFQJ/3GUIl2GXs/yx+CpVq2rpZD
   BglSaS+HK+DywGHT/gihkXMaImMvVrqIGiWryc/6W4dvs8W37HWucmNX9
   KltYjuwdscBvhCui3jqeEUXK9nkUWSGp0XHvVCC3Z++/MvxKYY6gtjM6X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="337110476"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="337110476"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 01:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="747521164"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="747521164"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 01:15:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 01:14:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 01:14:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 01:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP7hJpeG74Ti7FdPAApXhfdVF+SUZSu3iLZ9H0M3SANm6MCXFQv381p2OyISl3LN55hU5JZ0bUFnJB/h4Bh2D0LIYEfCH8L07dLKeL7bibMqJhHdoy80bc6AToa8eggESVb53/iAcBYHqZHFswFJNdByacf+XaKqN498dZhCSaqKazFF6QCX9xV2VJHa+tZHjU8q72eAS7osLgds/3ssajZwVPmjnWVzzcMy1NLqh2cuugZD3IHSdfhhcODaq5+ZcyOTYZVC2l7cBdckjxC0jHCB6kNFpcmTJhrbDAO3SHEeK9fMkytd9XZ6yL5hYfuCK7Ml7t/DZiuOx4QLSwg/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lsv/3MC0W49q9NsTqeW6StH0Sv8P4ODsrfXenHJRz4=;
 b=F/AC8gyCd2oaQc0QlcwYAjKhxQENOkuBFavaIdznlf7kGUIFt7EXLMWxji/RpTdGo3AOx3TTM7MJuw9FiAPLPtoy4lvOR9AObZ5M30uNlvc0SU2nJlbZqUpqitnqU23a+E5TzHLw/AoCt4qNzczRx8DU2FhGt3Sj9budcQGPcQ3MyKOqdcj8+X/t26Frh/PyLTMiGz9LKagFDtNclNCcncOd2OQdpT9VXEjKsn8hDAcQ84lZ44258nHl7O2amCgwsF3Lm3Ddc2ht1RS52SSg7xRXR+3kMuBJMmwTPxDRkfEtk2SLCAYGcDwQOh8NIJkxNiNl6fFCdOT2byXGqpYOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:14:53 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:14:53 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1.3.rc1)
Thread-Index: AQHZUMh/yWTkKEn+2EGZjglD2sNPD674ZKDQ
Date: Mon, 13 Mar 2023 08:14:53 +0000
Message-ID: <BY5PR11MB4152C045F415B7931F36B3FFA1B99@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010186bb063a56-686e24af-8c58-487a-961e-b7fb780aab15-000000@us-west-2.amazonses.com>
In-Reply-To: <01010186bb063a56-686e24af-8c58-487a-961e-b7fb780aab15-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH7PR11MB8011:EE_
x-ms-office365-filtering-correlation-id: 91cbdb24-90ae-4475-bc86-08db239b061a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h8YTt3n5hNHu09qxsOTmdpoNfwj1h9pK+UwjG0EDXIASjDJX4xsjcue5SY7tmDXy0+C7/YtW+Ke/6ZcDZ44DJprqMhj+uy5UawKb6rrIesm6WoYy0bAjQu4lgw1rhGiK3eACu8EjpuEGUhcZjP9YgNjVadvdTEAtOp/E06e6HjMFCbUpjlZUGxdOrCPqS79nfSuWv+ZzHqtnSoS3hiLqS1yGgTogmuhAT94dVzRmmPPqELL3SqB702GTL5chJKErizqVvlIddQnXFO/q74fP5aXJ08lzOUyRs4PcG64qu1LilAirkIkwsZtDXqigRzKG93GeJXHapORXUuuMQl71TNkjTOCxvW58NDJUAQexBkA2Z8BnMFPyHnW5pEzekt3i5e54G21eDKgHv0alUZvnt7tFZFvIQwqX/BS+HB3KBkPU6WnpIxb71YyJuzdwSkmdKPzIJ7qdITrMtJiKbev56tjethmzlbuRkCEOvzIhXgK/r1OKb+9iNoBqnAU7Dz6LLAmIMBuzLGpIedirrTvrFvYzXHliqbEx1GObn+fphOff9EJGTqVJxuWOAfSEhgwhPEtVorFXhZcPHjaTWlWwjSSqkpKRa55zs3aN9KIQWANkFBacSwtKNvIH85k8iy7z80C8A+MzdUU8eX1VD3aQWeJYIat9aGiegnriAtlfPj5skLcmuMNHS+vLx7YWA20MnVzm80Mtmh1OzATL8dMfPISUN+FE0MUt2i+NXuCG6jc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199018)(66899018)(110136005)(41300700001)(478600001)(8936002)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(52536014)(76116006)(33656002)(86362001)(38070700005)(122000001)(55016003)(38100700002)(82960400001)(7696005)(26005)(6506007)(966005)(71200400001)(53546011)(186003)(9686003)(5660300002)(15650500001)(2906002)(316002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xHgVH+NF7JMMh7mLKfV0w7ELoO8O3UGpj1VAnvUtMgNe1lkseHgT8qlH5YrG?=
 =?us-ascii?Q?/F0ZUpwmCgtnEcM9+s3q1iaSRLoyD9jmX+QIz+PUcAU7Zv+MgYbxhswwgCBx?=
 =?us-ascii?Q?9q7raFagi/glzbjPw5/VYrAWRQomyQA58s/+jNRk0jS28qTG6O+TAWTMqQ7o?=
 =?us-ascii?Q?6ChhTbw/qCzt48Sy7T4TZvDS4HsFn0rkeFjH0rksiPsHVQq1nTFfzLby4U35?=
 =?us-ascii?Q?CPAh9nlmmVwBfnUDHVMVwvvoROTQfViuC2ecEyvY4lZhkthWDGxXlSM1WLnJ?=
 =?us-ascii?Q?U61jue2QoTaIhX/xy59UCSO7tCY5Xz/DUeyANQNRfAVDIaftJn3DIlzTJM3Y?=
 =?us-ascii?Q?hc47S+943A8ejX1rkjb0tOU+IoBWci5abiwr/oowYnY6ueZc+gqwems5QzUX?=
 =?us-ascii?Q?057vBihn5XY7Ueadn1nBKVtJ8s4b3CdCM7XcCu0BqJ228frJ0rV3W9NBxanN?=
 =?us-ascii?Q?n1kxHcFCO2SFVNxUeigBUQQvQjWicVcOEoH2ovpHzB9SAIWhG4/N9CONtmgg?=
 =?us-ascii?Q?sOo6Q01wW+dQQdDQ0W/BsWT/DPmTfi9q6tPKwajlpXSXa+J1B6F71ebxDQ7M?=
 =?us-ascii?Q?ROsskU2XCRAsXr022zV2XMg0QsvI7IbtmDLTItoXKYraPpajvTQ8UHTPA9hN?=
 =?us-ascii?Q?jL0DXHv4bYxTDyw+wgqgoUfWgOhQE6sGRLxEVJ10kZHvQKWozPogZcX4vJb9?=
 =?us-ascii?Q?f+fN8zYKZoonEg1WBBFhUKN6vn+7B9Xm1k+m+HK/iAjeQVmN5gPSmlI5IWrC?=
 =?us-ascii?Q?pJ3dt7folUw1YXrM8wH8exBOhYcV0If9sJWMKues18PF0UNUA2LLThHAT/R8?=
 =?us-ascii?Q?pSihpK/ZTsWmOd0s7478waxcQY+x4lB36Bb/Vk5myWipJcmhVQxkNZkyRMIM?=
 =?us-ascii?Q?VgK3aI/+Be+R00RLw3u6HLQmZbq39gY6iRYVHmktBZIC8HDHynW2rUK8Bqxl?=
 =?us-ascii?Q?k4GYO0V5jyITv+0rZy/bpzQc9Di5IDowEwPi6osMi79ebZxq93f+pqwVklkk?=
 =?us-ascii?Q?fyE6+sPDx+zjYQkt++JX29IiDncvbO3rdYF2rTgE28xyLCj221Hea/PegXoH?=
 =?us-ascii?Q?ZBxAAnvZKLjzvPPyRo639CM4l5Bi49Ff7X2DjvNvEP1rQVC05Q2D3DNzPnl7?=
 =?us-ascii?Q?+paG4vZjsULo+Kx4nJMOvZtV67emRUnY7laPuOwygG94rPD7v/4l06eWZOze?=
 =?us-ascii?Q?mKmayLY17g+InP8anPR0L7b7zQ7eDjCn7q8DgLl7XwPlP0sPrBySuKc97Y8V?=
 =?us-ascii?Q?Nlf23BBEk4IxQ2nblyGxx+zCrU06xuFK1+ABGDFHeoZUYvSHt2RuIrJdZI67?=
 =?us-ascii?Q?+tJ1W/keaDmtO3Dy8SUF7GvyOiids2qT4f0gjYuVZKgUjreoqE0TDeyXC3rW?=
 =?us-ascii?Q?rbqdJTyk4PscS5VcKrthQqJcIgWUGckkD6afgcV8POR3Cpx/QG2O33aL6p8m?=
 =?us-ascii?Q?YJJXrxM7rAE7HPrUaQlMTauQyLjklerBXbq5xVaNA1DNIjw6RmbJwi5mxL2E?=
 =?us-ascii?Q?+TY70kHE/J0WQpW3x7CXQWKoUeShmYzISTte1guQGf2DXlwTfGiHLDj32h46?=
 =?us-ascii?Q?xbaPJs9DpZqdaEYf/bYDd5upKAVwJRlnnuCuJFkb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cbdb24-90ae-4475-bc86-08db239b061a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2023 08:14:53.2219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QSj/BIl4KLWUCvq1RNDoxUcmVwmXh6antpXrChA81+7zGQWuR0w0C4U4lfeVT0XvP0rqYxUmG/YZpct8J2IckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 08:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178413

Hi All,
=20
QA for yocto-4.1.3.rc1 is completed. This is the full report for this relea=
se: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 7 March, 2023 3:43 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-4.1.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.3.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 592ee222a1c6da42925fb56801f226884b6724ec
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: 04071ec9f5091ec76da202ce610e256d8d347a60
> meta-aws: 93a2f788e773b36d9813243d2164987c040d6cf4
> meta-intel: de84b34a9596aa96f9cc4c187efebdccc6690d06
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: b5b732876da1885ecbab2aa45f80d7a3086c5262
> meta-virtualization: d1cbc4c9fc44f0c5994a1276e38cdbb7bdb5bbd3
> oecore: b995ea45773211bd7bdd60eabcc9bbffda6beb5c
> poky: 91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f
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
> View/Reply Online (#229): https://lists.yoctoproject.org/g/qa-build-
> notification/message/229
> Mute This Topic: https://lists.yoctoproject.org/mt/97445052/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


