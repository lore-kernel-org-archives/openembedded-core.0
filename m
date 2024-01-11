Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2509FC47258
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 13:21:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.11125.1704979258054896478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 05:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ksAokZkZ;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704979258; x=1736515258;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=X0GJvBLL2zoJ9jfnHb3uEstVNBzp08scmNbj9ADpRi4=;
  b=ksAokZkZoFjwKw2vBTaAWcIVf7sS7nTk4+7kruVONt28NH/9k9i2JCYe
   QfGct7mtMqjlZ2m1aqfDDguRn3RSOEQLe7jQLWe9H6VwF95MTw8BERjuf
   jBZJdqV/zu11alZsgyUU9UKCq6BpI7NUIo1EKu3EvFxiQDTCFekv7eGsK
   979WI9mgKjXNMx3xeDTZTVVZEwcUMjLOeq9qmr1yb2K+yiluRPYqjYTk4
   ZZ/dUwCPBXgajjiHVNG3xnxOutiK7QcJ/ytLwgJwZUjhN2I043Ba6cBxO
   I75/WboBe6M4Hd8TRoPNiitcH0bsuMiR2MNIuQ0LIpz2TQLAAmSZe4sOo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="463128372"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="463128372"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 05:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="873018080"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="873018080"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Jan 2024 05:20:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 05:20:56 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jan 2024 05:20:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jan 2024 05:20:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Jan 2024 05:20:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Od+QW7sQ9NvpJ6ennYkgiPrb/2FSDnarccooNjPtekDr9EXysegSiHKYu8ZQNkQehspfZ7kdeD+0/JK9A7REpkLjAQlGlkreOBkHZ7Gn0fxc1Y33vF2IIaNGvgEKcLQhGLVYnWXtd7/F4DMdAtRKOUhiRmF+dHb02IKqIkkxx/X3tzE7g3z0PA+yRZBP1ZkLATEXd/pu/CF79uOYtlTMt7+SMF/fbH9miDltGk6clnsC79lJCGtytpcaKFvbglBRHJeRjxDW0L5Dd47JiPVGu5Sj64XBjxj3BxgWSQauQSWh5b+MjnUXjWp2+l3+csjyDjI+TNgO4lXjtw20gJiMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTr+rDAmTPGXMITQ3BeMzPg++yS+u4lo89nPEH+pnPQ=;
 b=Yttw2wBUA8T+Z7tr+lRzqkp8yfp5Ffpjw/hDzWoT+lTOTcixjs/D9pFtKeO7dxBMaSgDLiOPdN6t/m0pf6PX4+mfKpsHnRmLguc+J/F1TQMpp8JE5lA+9GSu/hF/b4voujbisdlgL4Y4V5InSdbQ2xusCu0/3uDhYFeuEZeO1VrYrelQa+lptzCdd9Wcm9And12eeGf9sAm6mrfY0RY4uy5Hvr9aHM0aVM1fnyBsa7i99yLGXmK1Ct0c6V5nz79YAVtRuoTWr0+D9ziAL8yizMphb4Bx6ppFEaX1zPIo2Jht7gAkV3Ae4WbGeyglNEHAdvWWfel1+JpjX/gdSv0/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 13:20:53 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 13:20:50 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.2.rc1)
Thread-Index: AQHaP7aVqORo2bcwf0aJy0EFUersvbDUoiaQ
Date: Thu, 11 Jan 2024 13:20:50 +0000
Message-ID: <BY5PR11MB4152F04F6899B95F8FFA8F69A1682@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018cd8df6342-36454e00-32a1-4f54-b7d2-47db56f288e9-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018cd8df6342-36454e00-32a1-4f54-b7d2-47db56f288e9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB8255:EE_
x-ms-office365-filtering-correlation-id: 2e2acfcb-20f3-4e1e-54cb-08dc12a8217e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfyl9tHSeyDJSc4chlPusXZcS/XswdFt9GS4ZTuWhqen4f5jMfcBQlz43RWIp5txc/ntisHqUmdxYtnIPXE+/QuLaaNqaEeGtc6uBYZ3ynoS1BiILsEBY0eI5Fkxm2I0CEHaQeIXfCNu2bpVaYtaFboKxUcVdJfB5MqfgvyEyHGlI0ozkW7rIIEZUxROp00d/H+ZwM31ptKQIEkz+YM8414+5Z1E39MFqNK/DYGCFjFo4ws5oocoxaZVdCox8Rw+IM3/Zc/zHURBMx7arlmOR4S0aMvJAzoZQuAnScewiqF0dxedJQmR2od8h9cUfrrPEobbDtQDEHfnMZTwlHJvQtuw0kuTI8gtFUfBitzuT0jo7y7lJaKQvIwDM9lD7d9YOUxv8el/7OaQSS5f6wXuolty9KGS/ebfEt4Mjh1lGLtYmvZrD8El/5JGQP16azkZtn6B9F+c+dZybol3Xfjxujjr7GD3VNFvnWro5SOCrog6/Ug39qhUyW7bVEdEqzgsuD78nVvH3UOxkDr4SNhFI1QIx0v1mEuhhaRn0h7lPckssAcf2A8LHdqO80I+qUjV8qTitk6cIHJfcJ91j6i6lbuqeWBt+0XwqY3vi5LNddL/cO21jqK0h4Z390FzylSW/NGzUU56sYhDyTVT6GFP5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(71200400001)(26005)(7696005)(966005)(38070700009)(9686003)(53546011)(478600001)(6506007)(15650500001)(83380400001)(5660300002)(2906002)(41300700001)(76116006)(66946007)(64756008)(52536014)(66446008)(66556008)(110136005)(8676002)(316002)(8936002)(66476007)(82960400001)(86362001)(122000001)(38100700002)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mg5+X9OoxBPWXn0bkzC2Vvt3hDLSDVjcW0HcsL/Vp5GsbLHYNVTAGd+cbu04?=
 =?us-ascii?Q?juFnxsVV2nu11dX4zPIBUBj5elv6zDHHCndWfG1P13nUx7+qaZCXaDHGSXOd?=
 =?us-ascii?Q?mmZzRSQiOQlnouey9eJGkKIgRkg1uWlKAARr+PIEh67OZ3AzVV6eQkment6x?=
 =?us-ascii?Q?Sge5f+JLM5/JEXgFegzs7mErbVtH2Jn7oAinXO10Gam+C0h8zq6Eo7mC8H8I?=
 =?us-ascii?Q?fwYYxuHLLZXNkpzNpxC+CWirP7vdV2E1zHb8y0fzG1S4JOmsxnrMj93hNS1G?=
 =?us-ascii?Q?hmW+JXXPvrjT/dLKwA0IZ04ukmbnw6B4zoDuRxYiLaxwMEI56aahtquPtsul?=
 =?us-ascii?Q?2dOfgIdgxvvj/jzqqShuzaNkAL7nvJJTHIMyaOR/gkc+5VdtkI7HxDpiURXE?=
 =?us-ascii?Q?efU1gbMfIjayrsO+maQ2cPTb4GF7q+XPB6tbPO1P19A1JkORJekVqk/3drmM?=
 =?us-ascii?Q?ER21JLbzMzusONtplp+y5lYtanwYAh5mP1nQdLUxkqPFjFndX7BloUrjw+rA?=
 =?us-ascii?Q?CE+sexmpOkRPca/FICevPNd+ugWso1AHYgnQ7lXta4sBxUQP7SnWgbYKJVt2?=
 =?us-ascii?Q?8yvaCOhU6NEf4YCCz8zy3BfzaPkZfTu16TeyQ/qIlFzHrCZGKGsh3QJVx0Ug?=
 =?us-ascii?Q?28AIiqeIg2Kqyp5ooI+VJaqyA3nhbgBBw7n1vdjT4VkJuw9pCfYV3qWqkfo6?=
 =?us-ascii?Q?yKAL4uWww6O7dIkBP8FiLCyxiKEPvarqAxCnmkMtCGu39QULtRtFnmV3oJmq?=
 =?us-ascii?Q?iveoIzCZXliq19Zo3x+gzOattKkLhHXsC/d2lOn5JRxFkT5cXvRRWEtLWtk6?=
 =?us-ascii?Q?hZOexKAGF15pFPIOxkB27T9fs052bjihqWF4V+rCorv2vF1vON+MOT7gLk4K?=
 =?us-ascii?Q?Ct9mBC5my5LhbEO1O/UTWx6OdC79/zlEQPSJHyikTl6C7AAEQlLNrY2GUg47?=
 =?us-ascii?Q?ZqR75VuLCghgtocqfSnu4kHK/0M1EpWWAN8eeNSxxEsMgKAMGyUr8NS3CVNL?=
 =?us-ascii?Q?Ey86m/E611zYkV0O6RhOud+z5DuNZFzMKKzI4MkL3b3bHCZ3sfO4dJ27Xylo?=
 =?us-ascii?Q?M13+HP9OjdhMUqei9/2ImDceZdoiaBlOePE0yghUN2jKSGsYzERap5QD+VnQ?=
 =?us-ascii?Q?z4QPSBTbYTyd1alFjaRBqDcQN5KN8ESlXX/OiQ9Mte3X9YplqTYjqoeVjYCh?=
 =?us-ascii?Q?YnKhKMIRfWUfq5zD5CGhW8vfkOoaL3UmuXjME/YCmehi4A9YiXAgstxa5/Xh?=
 =?us-ascii?Q?Ip1+sns2hy4rIvvi0dkPP626Gb0NVZccchCfXVBZyFKBNLmb9j3WMk7W3Ei+?=
 =?us-ascii?Q?VH8cSdiDYxn3EGWNxiqa+JUSX8kmQ7c0yjwh3ImPTkXSTX5r/KM75h+TIofE?=
 =?us-ascii?Q?hY+zLlhcWspojRW0No8TuQRqE2ixwMQdHuEwRsF9xFPRrF+aUsaZA9NjA0WI?=
 =?us-ascii?Q?ADqyKqEc9+da8H3NX1OlAA+AHdlY2jivc5JdEYEV4PTSEPmiASsEKazSCdXz?=
 =?us-ascii?Q?HfOtOJImcSX3UB561d/oFOVmRfXiUcCqvQzN9c6156hN1bAz6LbZwxQoF6Ph?=
 =?us-ascii?Q?2rmgTGSFyU4n3CgBUvn24XyzDTphtF7FCe+HUh0M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2acfcb-20f3-4e1e-54cb-08dc12a8217e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 13:20:50.5178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 68Xzkvkv9BCqFWbLCwtj/XnJCNz3OlO9uQd4Qi+nnShprBYX3ON8qYfP6oZSMOJOhFUbGnySkrKRnqC5+8iQVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193544

Hi All,
=20
QA for yocto-4.3.2.rc1 is completed. This is the full report for this relea=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Friday, January 5, 2024 5:06 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.3.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3.2.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6420
>=20
>     Build hash information:
>=20
>     bitbake: 72bf75f0b2e7f36930185e18a1de8277ce7045d8
> meta-agl: a492c25c1d2dd7a1bca42bc13d4b7449ab179a6a
> meta-arm: ae11c9d47374b7373dfead6b4217374484151f6f
> meta-aws: bdaaa71585e6d154ac34116d0f6c1e85fff86f63
> meta-intel: 039e45e21d2973fc3ce318a25beceae348e4428a
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: 1750c66ae8e4268c472c0b2b94748a59d6ef866d
> meta-virtualization: 9e92984ff47b3ca2106b1d27a93af061b28d1e8a
> oecore: ff595b937d37d2315386aebf315cea719e2362ea
> poky: f768ffb8916feb6542fcbe3e946cbf30e247b151
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

