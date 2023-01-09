Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5377CC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 15:58:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.75798.1673279917059624521
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 07:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Vdy6PQUR;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673279917; x=1704815917;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=otL2xeswQ/nIneaGxaLlPHi9MoYzG7INDpiY+43iOn0=;
  b=Vdy6PQURlvmvl5kfVVBmu3JNrNXPtblmz3rfLuVkx1mXe0U9dmxq9kZh
   libNOcDfdVQ+apqrca0rdg0mBLAQiRfS1rkZR63nF5f0rF5OGd8118K0p
   88ipDjkTVkScTDnzFF+mFpo17TJSA8IEwT+tA0QHZyBORD7JuMf+49oxo
   FwN1YPTshFzzL6rHqOciz8hzGG/Wy1c0r8ONy8bRWDeCyjLIjfEdf18eK
   woCJnNUreOzK3KAZgzolOzboTI/a6k+ifTMy/0sniG3c0c+Aya7Ket+pz
   fZC8xjCwZQNzUuy9Yq7O0GU3TZBUkrqsUlm9rRfPMAT7Z3ZMKnrpoJcSx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="303267675"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="303267675"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 07:58:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="830637399"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="830637399"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2023 07:58:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 07:58:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 07:58:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 07:58:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC32xPtp/MQa3W3ZPuUzh4zDa+f6Ww9bZav/us9FIWAcPYoIlsW2QJa3XvS5EOeNYIN5eIdnC+KzsNpj+xM/exaCcEKNnVZkHGK0dH1Rs+9bkGcDbdTrY0PiP+NX38vRtNV00pIX61lPoXHyiZhjm1YJ9tr2jIwqYP72yiZLtNkS1URaxmhO/5+mUlo47Bj2A96zGllFsyZNntkcjhyZg3bXM7ru6+rXZ6YAFd70x86SN9drTWcA5CUhBS/5dYkQq1h6CWz3MWgfPWBMZkY/VKXNYW6JDmJ8bHuTXMne22hfWHuBoJCR5ZeNxdDhCgqE3xl0n9SzFCGPYrH/14ygoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcdxgTVktHh0KsXm4OXEC460HhWE+BO5MRHkNYrQDN4=;
 b=SiWTP4wQokjrXzMnpRCNmGfsPh6KzYiSIcocbE1eECEU263/Y1XdczUewnt2FwjZwAf2CfSz9drJVTFb5rN/QFMQ3ENS3X1FOtWt9yKmfDnYubRCFyb1AuLU/Lf9RTuesJOaWmj6w/nKkBTYdY9gOcGaqaNBL2dX3EYau98b6dUDF/JToyqg5jCnuL7gXjzPg0s6wulmaSSj+z1IgN4eqjs7d0Yz1WrAlBsCIy9CSnzqeoW2w3F+ShjvAZ3Nnb7sslpwCRnoVhfTmZo3VihQ/4feLfxpqNskTyui7mCBNZNydZ5OBo0eSH64nuHNlpQHIc3AXlJYMRz3ZukBSKXqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:58:32 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:58:32 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, "Poky Build
 User" <pokybuild@yocto-ab04.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1.2.rc1)
Thread-Index: AQHZIpmSL4wQp/RSlUO19KVcaYeeC66WQM+w
Date: Mon, 9 Jan 2023 15:58:32 +0000
Message-ID: <BY5PR11MB4152C31B9FB08BA1588F083BA1FE9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101858c5b95ec-635ac4e2-63b3-4a69-b6be-fae7e497ef94-000000@us-west-2.amazonses.com>
In-Reply-To: <010101858c5b95ec-635ac4e2-63b3-4a69-b6be-fae7e497ef94-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BN9PR11MB5259:EE_
x-ms-office365-filtering-correlation-id: b3914fc7-5268-435f-9db7-08daf25a5bcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eZzUDIbyM4llizW+KRIDvMjVUon/TT3U3aDWKmBGuMOkKuu237NxniVe7j3IKZDBpH/sqC2y0cQeAjhWDVpQylXgmhaJCeD3/MFBuO1iX6DbX22BnmUz+ht4PxzAoUS40I6itEs9e3Kul60xPjxh0HIJJB0l+CS7BcA0kmgYbHchB+gstezmzkvevYI9GX7ZGDsBOIuUqm5KT1hOlL/BH/8l7X2YStLq7DbnAkUongVhyJuw+c6ihauGC4DSYL4cfgteoOqBux8/M+EKZmVyx3SMEczGhZkDEUQiZqNXkAaQmGngLAQ+qptXKg2RXKq3WD7miLChrA5Prp8WDe/uimJ5Ehc3RGBjM0N03n1cpKMay+sKOFv8oA2Mi2W6UQKFiX6Zwfbl5c95QVHochUkMI5LQPRJ8wGSoQwMs7F7puQmaf9hWNeTR+/ATnI8aj0p3OYJK+A7YpkHNGDq2QJpS8m8Eml8hk0FIwQbebcDjEmsD0CYSKIN3K9/2SJzN20K1T1gfLd0XlbtlqvRutJyziRecR3dBOS4OY7jV6laEu3Qf5DpmIGvkQdQurbPhU8NnZCcbKeRmDY8TEeq+5c+ssQzTLXxYdYBWv0JhL6msdxtM2Qpaw9vrQVDE7DgJxT4yZz9D7FeIMIuTNlitfBPE+yjGoK89XzbLjxBurdNIdm+KuHWuCyBVqbb+UpE2qIKQPcBCLY+S/F5uCuj7EWFSufPAUWPEVsvx61BCIA8y8HoHeyfwiF8jkLnDX73Stw3nAQ0xFPWEoY6A6M8ZhDk8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(186003)(33656002)(5660300002)(71200400001)(316002)(7696005)(26005)(9686003)(15650500001)(966005)(478600001)(41300700001)(66476007)(110136005)(64756008)(66446008)(66556008)(66946007)(76116006)(8676002)(83380400001)(52536014)(8936002)(86362001)(38070700005)(55016003)(53546011)(6506007)(122000001)(82960400001)(38100700002)(66899015)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FvOI7J/ZBAEZkJszHvpsr5LxgxIwATucUqoiOo9X5ihaFcsxM28z96hB5O/W?=
 =?us-ascii?Q?4HIls7Lyxp6pCJ5Y6swd//7CIHb397syvUoFEtGQYvAVptDyxBNme9nhJAPw?=
 =?us-ascii?Q?NiYgIkkJS4nNXSG7Ce0cjjGOyPmcAUCEOlK/Bx4dyeBU8CnHTueRpcRpABRH?=
 =?us-ascii?Q?Gbw8g7ioLCwRTYGBEjQwoZvuk89oeXKDYqGMC29CA6+r+KOw3gD1zpuwadma?=
 =?us-ascii?Q?f9X0Uxye0pz2NvdeYDeRiQ9InWqf/6F2jlnPIFxgD+5mIHADVD3xOJHmO4or?=
 =?us-ascii?Q?Su0IqBh6uowOTy59gQE3xe70AAsEZf5M+BjHm96Dk0u5Hm9k50YlbGM2XvHv?=
 =?us-ascii?Q?9l3453OcK9sgIvKqX4Y/IkkaGU7t7lVyV9rs4vKZqrkUHkcTpC12N3Qabyl6?=
 =?us-ascii?Q?jEdsCzqcdwCdvUPvmZhySXIwVI9k1GHDW7zUJF1O5Mb47fCKHulE8j0l2gon?=
 =?us-ascii?Q?9i/95NbjUmXQ/CpfDahHgsqm9AmBEzAv9TpnJaNq2/EZ7gyWxFCq9MPZfQMq?=
 =?us-ascii?Q?uW+2BXrD0q/ulVKH9NCwxkGmL+rd4Jj2fWX3ffowjnwdcBeo3YwIXTAHoMHX?=
 =?us-ascii?Q?WRQqe5RoRXFONnGys2aZTeZoNckOHfFGYxdbq3i95JqKtnwNyqcbODroPczk?=
 =?us-ascii?Q?o2LCo8Ef/EPJBSCoFcK/uqCAItVbpN671HKMsLoAty0EJkNgHUtiEL8oiUcc?=
 =?us-ascii?Q?/ZK9jjJ5OfSWmdWd8Dc7SIO7qGd4AfzcE+oGa6D8JiuKG0EJ2P7QtYcxIL/O?=
 =?us-ascii?Q?zp9dEJ9m+fLQ1IeMji5iViZTUtFaggPC42Ys4V06A3QdUEhI2crhr7S+0D7f?=
 =?us-ascii?Q?Uule/7dAApSF1+WUrz4YukKe6iJ38B4W21tMlghxbmJ3xR0TOx/u/NE2Fimx?=
 =?us-ascii?Q?RX1s67i+bKe9fmcPnMk+cSBaLwrqgLWgzuoQ8+3ZW3sRiNrXr2sBIMgnds9q?=
 =?us-ascii?Q?RMXnqwKZPqJWdMe0W54wDw4HFNEna42YhiwgPF0ZKFSQc4DVvRWaxL5CFpi8?=
 =?us-ascii?Q?En0NcE5iNHe7/xyeChHSQh31lQHkd2ffPXbpaaQb82oxxqN2CW+yu8LVLelw?=
 =?us-ascii?Q?zYIUH5mj0MxVTW6FpPoxwmbvMF8ICzk17QPQhrBdQkMtu6LBzEeTsb34Ol0q?=
 =?us-ascii?Q?YP6cei9bOoNcBZL8HZJX4gmTWEJ/Pj6lNtooUT4ky2NafSIKdH0mEAQK05/V?=
 =?us-ascii?Q?nrQfAMnl+ft/ZM+kWHFgXy40+nspPVACn0PK/QUQGFMX0CUlNlbmrmHZExmZ?=
 =?us-ascii?Q?aHWfWFhEddC0Sne1RHeDGZX5nH20GMEGVFZ5Rbdb8zBie/My0+hE1grUPK+y?=
 =?us-ascii?Q?+8sqkdWCs+GItorFhJ7BETlMyx+cQNBrGP5QNNDoYd6Y6SrjfDOtwH2TW/hK?=
 =?us-ascii?Q?EXhTIroNIQwsRjfAI/Kc16ZR6CqQbc7Gan4ZL3bfKKEVoQ8gXBVUMLdvnoKR?=
 =?us-ascii?Q?/LC23ERFPox2XqVCmkuFgkr/MDsM1BvtCFICz461Y9frIu9Z90HznwclMNdx?=
 =?us-ascii?Q?IvYmq+J3zfK3KqltsHbWDdlNc8VlRLeoBdu4YDXfJ+pkm0bH9c0UgSwCeZlT?=
 =?us-ascii?Q?AMtQhm8YYnliQpz708LNPQnJu+XR4TYYJv7CUd+D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3914fc7-5268-435f-9db7-08daf25a5bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 15:58:32.7148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThHxRheGduhn5ooI3U6t5Ja0gZ9CvsJKL24QhTGRaC0plMGnuuUQY/LCsfMH+QUpBc6Pb/AqyyEw8LYZVdFJGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 15:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175693

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.1.2.rc=
1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion Thursday, 12th Jan 2023.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, 7 January, 2023 9:12 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-4.1.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.2.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4
> meta-agl: 6fe6a57bffdded98347c2eab53463179b643904c
> meta-arm: 898a4aa99bd7c7a30a0613c56bb3cc6607c5b020
> meta-aws: 173b444a1e49b2497e4840ae70319cc868c1bae4
> meta-intel: 09e30d85e2e405e2f4a0e35c5d72aa285a2d8cbc
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: c354f92778c1d4bcd3680af7e0fb0d1414de2344
> meta-virtualization: 8857b36ebfec3d548755755b009adc491ef320ab
> oecore: 670f4f103b25897524d115c1f290ecae441fe4bd
> poky: 74c92e38c701e268406bb656b45ccd68471c217e
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
> View/Reply Online (#208): https://lists.yoctoproject.org/g/qa-build-
> notification/message/208
> Mute This Topic: https://lists.yoctoproject.org/mt/96112385/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


