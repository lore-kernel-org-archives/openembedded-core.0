Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5430EC4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:45:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web11.11726.1699965899555356070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=IZmt40qt;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699965900; x=1731501900;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5Ki7Dv7X1rBifSU89ri0Nt2HkJpVq+FbnJFGs2quzWM=;
  b=IZmt40qttIZoRdVCrMIDIWiyYeiirrImJktuML2jksjbrlA+QPCfHFvL
   30ihpnFcaigYITunPvD9qvyjs+DPg5cd+QLxJhO3io6rHX1/dnnyP24OW
   i8LA5dEbHviHvXs6WiI/Mwx/+TEpOOkH1mO2T24R03Qi0PM+g2nQAp99X
   IYI1Lz9LK21xCFgfCZOGOsWE/u1/A7CwfIXl9DN34+g/iu53KUbtsnhO6
   2UAJi44Y/R/m7m0zA+8t6eAdoSrE8p+GbL8FHwMwo3Qxu9L4gZFp5yRw8
   a3TbCpxlBkTTPrBJ8rljhWKjVRll9A9uKmfyGPTqqBhJMmbu98OuwqHB5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="12192782"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="12192782"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908351883"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="908351883"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Nov 2023 04:44:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 04:44:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 04:44:58 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 04:44:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZBcPMgaIKetZGBOtDDt2H4eKbOKqOfoeJ8DQDmfGv26ZhJot8zea9GfibCGKtifwIbu3TCa4L9oU+lm0ujSydMaquEqoO5xV/02ytjXtzqO+MWU3ugVui/Nms0n0FG7GdTm9l8442Q6Bzu5F4gg6VKdEz3ilYZZ9gya1ZB9rOtufmgkKZNMyCtZg53CAICJnsej4lVZJtslB80gRT/LvsWSvrRNLOoSch32GJ944KggNG5p2wMdKpYdUBoXfOAlhAckwgB/LZGWGeQYO1YRSyaxpEakCrgRfqQ9QEeYv8/pgBqI7Untm74eVk/GTHWA5DH9kUdUAcaXWy4k9qzrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZXY0Z3fVxNYghDH41hr0uCQGTDOxJENMeQAqIWDPZ4=;
 b=L7DsTMi6mJqga7T9x2ycyKm8RGJNY6lzzjI5QGZ88EMVUGiaUH2EXPOJFXKL3BywViUQWGGliWgoqK209pOqAaqHA/lJ1zRRJ3D6FnIh/T/Gw2K6wZcpC3hsOhF80/7YotVPNgyU5NSrsAlxmDdnH3o2r+xU1sd6ObNomw+GV6JpDYK/2FZOK+TuHjODuLWbpNSKSdRiRqvJtMNNMalXOOjYjZ9j4c+LyPzYJEjGOGgN3DPFx0fbfqhNUF+lEay2kCfFUOF4uzTdxw8hw7MiVbcdjHpH8WOzI1hc5PTqG+94nYQUQqAFFAEB7vSXuTG2zps0UvgoxfMsCsRypVSD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BL1PR11MB5510.namprd11.prod.outlook.com (2603:10b6:208:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 12:44:55 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 12:44:55 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.4.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.4.rc3)
Thread-Index: AQHaFsjDZGusHAzObEC8MuCDfpihkbB5wjgg
Date: Tue, 14 Nov 2023 12:44:55 +0000
Message-ID: <BY5PR11MB415276845BACAFC541918E44A1B2A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018bcca4d9a1-91c73446-5e5e-4431-9379-e87da1b67ecf-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018bcca4d9a1-91c73446-5e5e-4431-9379-e87da1b67ecf-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BL1PR11MB5510:EE_
x-ms-office365-filtering-correlation-id: f549f826-c907-4995-f921-08dbe50f811a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O6KKoDVM14mu2VZGo79QgR5rylhsSvAj4VEs1j5Rb95VkD/eMNXQKUSRJkle1OgWrnUcislDVEYXuP9yZjopQWLop7gsxJ7+k1ylFLjHsMHBcqi1O+IZRELc5nQVcnJX2iMnJO7wWbBsLhfzTwaeax7RUa7W8Ov4VznVl3GxiXNuGlN2HHsHe4L8aD5ZbNBw0lJX9XMLDKiH3mVg5dnMZACbD+G7J2cldy2ZyBcz87/q+EBSn4BOxt0Rt5j3mRmvHLasibYVqU0Ffo2TgWToBpI66N+QR3aasH4mAmSIwQ/Px7EGs23PadhT47Fi0oAxSFSAY9kxRzwSCybzc4w2IwXVKAVTogtvNqUyiUsNUKgT7BnSwkUSO4tt+y24vX4l7vLXfT1tIHbHI0BCblBWS7RY3AfS34y5JyrEmh6Ui/IkCVdAanAGMbqRX8uBBEOcFJBH2TmhEtV0Lkns5Mb7eNRDWcAJjYTXsBcDHitqyIOFt8OEEr+WvKIXxSf13j048i1s84oIJU1L/8Z9EhA+ixJ8sK6KBjWDyKeoVg5UrcHhmL3yxs/pA4+rdf2YvXFBkS28JqsS7ASKVtN3ojxuFNn32PV9SCbtwsYhCRRD8ZAz7ahXbUsAWDoHNX+jK4hEcOQO5b5CDU5elpDg//SHLQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(71200400001)(8676002)(110136005)(966005)(55016003)(8936002)(41300700001)(52536014)(478600001)(7696005)(53546011)(6506007)(5660300002)(9686003)(66946007)(66556008)(64756008)(76116006)(66476007)(66446008)(316002)(15650500001)(83380400001)(38070700009)(26005)(66899024)(2906002)(82960400001)(122000001)(33656002)(38100700002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B4NnlVXe88ucjCv42AKP7h+7OmSAFDg0/UVuHT0q/f31qyWYl/LBbmG48VYF?=
 =?us-ascii?Q?ubaEfC780MxyFxanga8pJhvqXg4uiKaimFtuyfqcKEQyP/gRl565KD4+bs1z?=
 =?us-ascii?Q?8b3PWneisJIXfDstMwBQkPgITzgvGwyHFAJRzYPk9quLfSNvl+LZ5lopJ+NL?=
 =?us-ascii?Q?MxPFH9k5bNs7EMPYjj3YU0i5pXnUMsXH6DOW0RJepOJgJlonTxKmT4LagWSi?=
 =?us-ascii?Q?P/FZC5cdSuhILY73iWxWCWMsm3vDd7SNJBAVgBrbTZrWy5twCraXj9ePMsK3?=
 =?us-ascii?Q?Tp0rJDhsSWBpg6naQXayY0MqKpeU1L96K1UWXoYKxx8cZgphOW0vzSSXDdRB?=
 =?us-ascii?Q?rPiJGlRrz5j4IBOPu24+nDDQbPs2cmtSRJWuIxd7b66mjcfsghlG/JzM6rmb?=
 =?us-ascii?Q?hIFI6J+8TF4ZI7ZgrT3s38Jl3fNPuFvBhgSFXhj9gFRARQjbcmf4UzMXultE?=
 =?us-ascii?Q?KRk7286D+Dp3IKjmbb293dJSHGoFNzyeKTbiA6hC9rNhCXlfZI43VhTyClJP?=
 =?us-ascii?Q?Vjl4grYQd4exab5VcMpRXEdm4idLY1X98LO55/vM6F8CwvgSKl6fQg7Qylj4?=
 =?us-ascii?Q?l41JGXqdw84qVgo/0lKOcpyHgZO4SFF4BMsTYnIizAtX5+JIv6xYGlDoyeh9?=
 =?us-ascii?Q?r/IjwKNxqpaEWX2GiB67aNmwoIsGV2mm0jh5BCmF3SVu/Xp8mUysHKf/iYii?=
 =?us-ascii?Q?xu2qdcDzRrl22MDWk5Uhfv1lH7ALYv8GlaA4pSyd4U379kjPFVNwicuRA1VF?=
 =?us-ascii?Q?qVWpezwYu3UvdyHrOs/NHNPjVZmrqS6Z/25L/aPkAK5sF8VO6RZnugTYquV/?=
 =?us-ascii?Q?UY5gqMXQurC0zB4he+I02XbewRes9V/k/arxdqOiA71wnaRf/SQBuajwGNWR?=
 =?us-ascii?Q?SPh6H3eddLokk/tNtwgrFQhuR6NBb9L6bwD12Y2MmGn2QyQ7IR9OfyYwur+7?=
 =?us-ascii?Q?9oLkin0Mmt+8mIgocDSE7MpQBY/I5L8CoYzdBS2wgMuJv0sOqpavh062sJVd?=
 =?us-ascii?Q?6M7fbDai0XRQpDX9dzZYS8qVG5tsJjuqwk69IoBcl7elxENGaE/W43jcuCg+?=
 =?us-ascii?Q?8zzew+A2Rn599yUajIoXV+KEN7+mFkYfV+2GDAwKlah/2rGirPV9bG3Nwmi7?=
 =?us-ascii?Q?nYfva3J5R8L9jSFsoWrOf/FfbPsLimdKpV3bacrFia5Sj+AFCuqAEsgLeAE8?=
 =?us-ascii?Q?lJWjbMbUYRVoFmjdE45bo72gsqe0HU6tpgQjSgaZluMfBO59GOcccj8e+eAc?=
 =?us-ascii?Q?OuZVnytU0qDrfybNnOq66HF+pD0+fP6AO7JDV/7lbFnCQwZDq6TaSNI4EsHb?=
 =?us-ascii?Q?FCqIuejR7XyN2p/InW9nhsAEY2gyUmsLTPIfg8RJ7diWTc5/KMD4kpCVAs+k?=
 =?us-ascii?Q?VoMWIssUfKRiQxKPUu1hX4fE/IR9THGYIAXPA///7Z2k/HGeeH4+cpazKjyN?=
 =?us-ascii?Q?v15D77rzm1Zs7urzFdYzgwnRlxvXKF3QWNZrJu0EMt5T2e4mdeGclIK5mneu?=
 =?us-ascii?Q?NV3bNydmL+WatfOrrG91vKFZRWFqkUGbqQMObbmXuRuQhmN35gvUNsz4KMvT?=
 =?us-ascii?Q?xaN3BJ/heIfgej2LiCuQK12jhxJx8Bi0rh8iaSFa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f549f826-c907-4995-f921-08dbe50f811a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 12:44:55.5960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JO72O5E9GMAVEkXIOPwV9ttdGxyYWSRYDuaTNeElKYKY9h23oxOMRClGlABT+D9SyUgy/HE9LU5TaOtyLiMlwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5510
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 12:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190503

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2.4.rc=
3. We are planning to execute following tests for this cycle:
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
ETA for completion next Monday, 20 November 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, November 14, 2023 3:04 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.4.rc3)
>=20
>=20
>     A build flagged for QA (yocto-4.2.4.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.4.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6188
>=20
>     Build hash information:
>=20
>     bitbake: c7e094ec3beccef0bbbf67c100147c449d9c6836
> meta-agl: bf791cba6a3bc53864bf719dc913cea352146f75
> meta-arm: 9bcc166bd5bb717aa86bb0464621a36abc51fa19
> meta-aws: b288fb9d29f67af79de07f039429fcf921e2abd3
> meta-intel: 0ed9b8ed178782bbbb74b80dbf713f50aa253dcd
> meta-mingw: d87d4f00b9c6068fff03929a4b0f231a942d3873
> meta-openembedded: 39968837196cb48209b71e8852dd04a2f8ccdca8
> meta-virtualization: b8db7002764712f2902fe9dea098c171b1128076
> oecore: 23b5141400b2c676c806df3308f023f7c04e34e0
> poky: 7235399a86b134e57d5eb783d7f1f57ca0439ae5
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
> View/Reply Online (#344): https://lists.yoctoproject.org/g/qa-build-
> notification/message/344
> Mute This Topic: https://lists.yoctoproject.org/mt/102579220/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


