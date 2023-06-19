Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B00EB64D8
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 01:44:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.17818.1687139051201414170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 18:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=PLtviqCW;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687139051; x=1718675051;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=itoTqcqb4hbBBPVty4UuVs8Zn7TH1bxzOM3Qe6f0xNI=;
  b=PLtviqCWQl5Rt8ADRGS8huf29FT2zJa3hRAF3GbteAtkK5+fjWiEOMhh
   IYwF8RM3F4ekKwRHo9t8tOqghhzGZZk6YaUYO0JHhgpMg0y+toFD3xRzC
   UWYjoFgbgVPPExAzu1vXsb9jDwG1rgg4nlpNlQgI5V6aSWMeyuFWeugSN
   Xw0A2F3xq69G7MZYGgcttamWA9++kJHgJQY2eqIiwDH5Ag5vpbmvWxKS4
   GjJ6CAUV2u9y4Fuh3lAQbSvKpanIZwe9iGxZlnsuanH9z1JwKfxMhriCS
   vaBx0maOmnxgH5VdzvGpZYP3Xns/CwilcKKmSe/Kf2+0d6f0cb3FFdy3m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="357011882"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="357011882"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 18:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="716692100"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="716692100"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jun 2023 18:44:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 18 Jun 2023 18:44:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 18 Jun 2023 18:44:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 18 Jun 2023 18:44:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 18 Jun 2023 18:44:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7/EvI0FST5LivF18zf6oPyW1P4JjbNhmxDSkQS8kJ/FBAqbAfxgMGIs0auiBXtHVCziDODwknhr4HdhncDWG4DZkJqxp4qNUKtyMuoOqgt+kmlBj8OKDaBGLGT8C9ajGSgdyiNJQT2hWzv+qUNoLFIcBCVRebTQx1BLWM81wkwguafIAL4dAenpPdBi0RfzYcsf8h6hgjlT+lFz2qHmCXSLfTKYDqOcAk2UeI2ChVOs96pR1lzfsuSrQVyHuy8gQIhZ6fsdBCj8D+NoA8FR1jOkci7DOl+MCOJuDvyTqnh4R27q53Vvoz1JgB5JcT98wyCaoxiSz1LXDXkqYecNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+Y1COQe9IgUcPiT2BcIw2xTCRX8ZZ20TA8TYC01aYU=;
 b=E9U/FI3qfZ/mgUfm3oKZV+BRAq55MnOoy4dQvmw/TAOXfMbKAxoEJUZb1FLDMsvb1kKgDtjkBTxicB+CFqpGCe33syamAsbrr5xZ5KCzW3s75D0xO2v6hoNMog0d6gFunW3gW4Eei4MhHo3gz3N4fYeJ0rtsHHYfDlLLhx5QyZAz1n4iODYgNp7zex/Bz75ySmLHGIAmO+DuW8fbN+E+4VG/H0icVJzB5AAEY4cJK4bgActRHt2CZBegiVGrjHEi26vvJxBENT1IgX7uA/6PpAnw227T3CG2TtW3PIidHHnAF2gaeyxA76iF+CoLrx5SwFJr704K62FHA+yoIMnEFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 19 Jun
 2023 01:44:07 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 01:44:07 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.26.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.26.rc2)
Thread-Index: AQHZoiurTiOS+eDQakqw6f9odErqAK+RWflg
Date: Mon, 19 Jun 2023 01:44:07 +0000
Message-ID: <BY5PR11MB4152273075C08034FE10B261A15FA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010188d0678397-042d99a0-69a2-4f4d-9116-724649c71dfc-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188d0678397-042d99a0-69a2-4f4d-9116-724649c71dfc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS0PR11MB8070:EE_
x-ms-office365-filtering-correlation-id: 96a73510-3ef5-4224-e256-08db7066abb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFqLh6kzJoHPVcDAd1WBMyMlWYbt/j+k1DikiPepmxB8uP73J/hUM2p2VJ9OE6EROSmVyaf+OKqEHznsZqVQRbIerQe6ebRwQd+j1f6AGFg7/xPOWy3o7BYDdgjauByBy1AM2eWBML3twHYF8t1sfpgi2RNio7Gg8HX7CvtNt6YurZV2uVYsmyGAMpg+cMcsqbri/zL0I3K/gGXsiWtQvGcM//0Cyyowt24WiijfxQ3Oa7vABJhMN7p7RrmtTTJYXXnt8uUKWRpdcpP7gsHFuZTjrmpCt14GX6fDuJddjJ4XaJ8Tx1fFai45FseKC9vDPO1EaHcA3mL85S6cSUYZdKIdjsk+Lx04HGZf+UZz6vbhxRF6k+v6wCLDZ6z6DNWGbQaXnyZBcWihDkWst7Yq9COvM5o2OypBUEYsVbikZPXj8L47gy9Adq9tBPz1+w9npGUKgcTz1vah0QaUmu/opzgDir5Uk7JexkHYqezbFdM6E8z2b3Awso0buyMF15fFZGLSsd9VohArZbjX6KEKXlcNKMlAR+TuaNXPWCsY/IL/3fErCEDx/yN+CVIYjoXqjL2axG+1MkSTkTwZ4uh/mY0LTwBUY48Pky/tY5LSh4h83jmbYuThK5pmJLVm4Qm3x/00/f4wn1W2BbEPyhUoZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(366004)(39860400002)(136003)(451199021)(66899021)(66556008)(38070700005)(66446008)(966005)(316002)(71200400001)(64756008)(66946007)(76116006)(66476007)(110136005)(478600001)(86362001)(33656002)(38100700002)(15650500001)(122000001)(9686003)(83380400001)(6506007)(186003)(26005)(53546011)(8936002)(52536014)(2906002)(41300700001)(7696005)(55016003)(5660300002)(8676002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AsAJG7xPAnLA34Q41GxJgZJ8agIlmYp1O0lI7FgOc4lDbpWMIQU5dezwEkEe?=
 =?us-ascii?Q?P8+yYMcwuhbKzjceMIyMlu1n168+fdfcEzxbQV+Cx2ikukphO0wctkNSaiC+?=
 =?us-ascii?Q?jJQsdw99hpZ30QwFprSAGt6/4s0aH4qwo3WYgiDIZrVNNOLDLymnxU3W6svi?=
 =?us-ascii?Q?Cm+bNN5xu8o/owsCoQ0nJ/MchZAZU2fgIkbmjeny3rgHbc6IZdcGt4z1YNd6?=
 =?us-ascii?Q?ebOd6BXeUkYiM9YUnNt/jN5R3wKq92bvGrJjjhdTLAmEI2rYAHzbHpVG6cGM?=
 =?us-ascii?Q?O7yS/+YmKKVKDmKUOHeUV7TidejhcKKJFLN8arGOEYwIkpDI3+mmKA2TvAVt?=
 =?us-ascii?Q?325WNPUkEnilEwL7+nOqj8PZ9NzJyrpWb66C4FySHEJW39IBkp386ji/pX5J?=
 =?us-ascii?Q?LJoT1iE/MFxNXRcldBaJaXXojAU+Pd+BeEWgwTbDbMo0y4SP88dOjsGWum7K?=
 =?us-ascii?Q?d9Fxx47qKCHqVaXloNU8O6UGcbNnB0up7U3LMFJTwCz3065Nc3GRZhNvLQA9?=
 =?us-ascii?Q?xhJCvIAKs2Egs5ElMxsoPBqYcf0XRH1uPReON06ResYdOqamvAVlOBZkrGvT?=
 =?us-ascii?Q?lwhAI8DiEo/TqCnj50JTQF2+FfOZFQy6Qy8s18LNZ6zv88b/2bsAydLaep7Q?=
 =?us-ascii?Q?7Zxp6ERt3ywAJk4bM4GFUuC/RYwUpFn/7RTavFsNSGURm+Kh7S2AZ8pBsL/3?=
 =?us-ascii?Q?kDyViwMLEj9/KmcZszxHduFj4P0qno5JJyt7k7U+taO7UYeb09yQPA0wBPmr?=
 =?us-ascii?Q?QM/AtQIEjOL/pcOpkWRXu9VGlk6WwBXmlx4ACuWguoqmw5T6uYatY4tH3p/Y?=
 =?us-ascii?Q?SAgjxVtdsFxEU2mXkLiG/pyhBtv+ZeBtDC/CVyZGf50QQg2xGA3rvnXYLdte?=
 =?us-ascii?Q?eNK2UK36EoI20qUrGLQN0tmky1pCuMtbygT1gnMdDeWEElCiK5S8Hbm7qh6S?=
 =?us-ascii?Q?Dw/pGeTkIwT7XgjLq8gFOuvumYui7vs05Fh3q1uAlJrrkscvUg6AfGFBqXUU?=
 =?us-ascii?Q?MungFpF2b5h7CbQ31Aj3/FiCusHMWwflStXQRGCGrf7ZrPaYDMzNKHEXicuM?=
 =?us-ascii?Q?P5yIU08n84DoYg9d9yB9Atj+tp0jxfIhPOyGAzNzeDkDflySqHJeaPijlicK?=
 =?us-ascii?Q?C2w6mX6I0goAtreot9tXWOF/S60OEQ0ujXVT1jTyUm+HIhV2fxZaQwcxmttD?=
 =?us-ascii?Q?kuhfj20GyQpA6HyCj2WPGknMb9uBIXDTayBfzGoXFtNUgi0N8rcTJzA/N3Cg?=
 =?us-ascii?Q?XJUB8+w5v82ItIY75VZiU9FnsQ2m/okFNsw2qrO/3NPcCkKWKfqi4c6G0x6i?=
 =?us-ascii?Q?tQhCeFfpaIx4ecXJLifZPqL+2XfUZR+MPmosKuImM8ZAp4dy4tctrRjjDShu?=
 =?us-ascii?Q?TwKymNK16vj9agficBlbYUtSIeduJpNcdpIkTmsSzLwvJwZWNP0MVXvX8iPf?=
 =?us-ascii?Q?26zr7Mr5gPezaE9VKkaKrJfGBXPNYxXfDQ9kI57gmHPVPtd/PQipU8NXKaKR?=
 =?us-ascii?Q?3Yy+YI+yNuVl/j6iGSvTxKQpdjiQuWIn3el1Gxj1M3DHx1jiKi0hKe4SPOzJ?=
 =?us-ascii?Q?O2UPLqonasZdYYYBRQ5Gf8V+r+ly3xQhTkIhXaUT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a73510-3ef5-4224-e256-08db7066abb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 01:44:07.2971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kz4e3X9+lARQzUZ9U5iO8yKOytcR5YM0UTUZIcBgOMvRN5qJY3Q/bPA5lT6bxJXYRsdR75kq4EO9Yhhet0xsvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 01:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183066

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.26.r=
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
ETA for completion Thursday, June 22.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, June 19, 2023 5:27 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.26.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.26.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.26.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: e16a9ca7e9286790ac37a067fdc8fde3a35a1c44
> meta-agl: 009153010c138d1a5edd2e30bd3d76c95de636d9
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 6fea710d1b3c8a5ad93e7811e75d8f4cf5962bb2
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 488af577a3f21f038c551612bb0af077fa2b743d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 116bfe8d5e5851e7fc5424f40da8691a19c5b5ee
> meta-virtualization: 521459bf588435e847d981657485bae8d6f003b5
> oecore: 77f6fbfa18b4ad77c3756cfdc45d441a20210781
> poky: bab87089ad998afc980adb45c11ae356bc35a460
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
> View/Reply Online (#268): https://lists.yoctoproject.org/g/qa-build-
> notification/message/268
> Mute This Topic: https://lists.yoctoproject.org/mt/99611548/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


