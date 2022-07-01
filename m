Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86537C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 03:51:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.34011.1656647494596876825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 20:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fE1aZZSy;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656647494; x=1688183494;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oB7p1sFfx835v5cBSjvQSYiXocOHgMaCXyesoRcPCMc=;
  b=fE1aZZSysrg4/PTt5OsI24peiHb45FFKs1/274wTIXWlDyyW6atP6mCz
   Ovn6FPF4lQtEhtddl+obEvCdQd7hdrYyGvSKw4FE/DQ5FEIiwGmyzh1kb
   2TsI7+NxN0rffDmfn+hzQ3ePJrBKKw7D4xb8nvanmByAhVxt1YSZqlIef
   1P706oK1esLSsuFx1Gznik6r9L1ouQnTk/soLR60W802yYRZnhPh6rMHz
   p3wpZaUWd9nLmzyMb6my0HZCZyaOWpA++xflMvdqs4z+Gqv8uxP/hHP7I
   ura1qPg9uGrGOqUj4VFFhFBAvNVuIc5GLKNHpUvK2HC9DsBovXtbytMZr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="281306820"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400";
   d="scan'208";a="281306820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 20:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400";
   d="scan'208";a="541587223"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2022 20:51:33 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 20:51:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 30 Jun 2022 20:51:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 30 Jun 2022 20:51:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 30 Jun 2022 20:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izg4MxOcKXtSJEzP7eCqbf+gS74zrBH7Y9ccxYuFRrVwJtFms15RClqP+OE3/B0coHFJfE0N09MyUjxBs7J5qZF0HYdCuRjeHLO30KtQ+hWNJTlzznhDvyJTG9prGXGiXm4k6vq5C9vr/ZidpKHMpuDKWIgP/x6IQ5m4Phn/W0LvyZRZu6rQVfDRTj/8SoILsGUtGFGyXNmL7tDlRMx5eI6kfsyxMEWqOhpykmtelX9Y8ASUUUCkmXlufEfz5Zc5SPgjlvzgguycizjEGQEQY63UdvpdYLbQSw+9vrdnfHzKvJvW5DrlqISpLxhgpWE2jrPtq5cjwE6VJYV7dRHfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjtLKflMxG9jao+4zzn0X+UEPg2I8z4KYltXyutvyD4=;
 b=foMMJq4pEc0WLbhnQYJo/kscNZk8T//lz4sK51f2KgNkCx7MPsW35oj4uQwBcF0/fr+iWWiy9ZS1l9NbChVzusu5R7rLNNeLAPd4id3oumvPpp5Cr1+jefGOuqOx4ItHEJEdgZGK8NdEDCMj9Y61CO99GSYpD1Q9C4AuVyuHWl2hUEkwUltTLfIutdUH98T5WYDzaajbdzkGq1Pj+QdBDdpMZ5s7t0u5gxh0KdoMTle/OkfnOrIse/WZnWJRl9LQHQJRQVWJqnfrfGuohKHA9PA+4rQNmfaSRJzQOyhSkEOy//1qOrUR9UrwFLu3CMsSKZPd++kBrgZEr23Lf4qE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 03:51:31 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 03:51:31 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.2.rc1)
Thread-Index: AQHYi64QWbA0Q4Xgk0+ukfJFDj2FoK1o4/xA
Date: Fri, 1 Jul 2022 03:51:31 +0000
Message-ID: 
 <DM5PR1101MB2348C9FEEC9AAE39FD04CEEABBBD9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <01010181af49cc59-7fa1b027-722d-4360-9ca4-4894f160087e-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010181af49cc59-7fa1b027-722d-4360-9ca4-4894f160087e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b19f47e-27ff-4900-2abb-08da5b14fc0b
x-ms-traffictypediagnostic: SA0PR11MB4766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 e71PLi3gMHtQcWDUdo3ImdwNWg4yuKq5arD61Gi5fnxUcD6UnIfPMhMVt6R9Jla4T9rw4jEJIie7jCfZT3HqCCt+xWNVuqHNQ9zet7AG1iCeI9928S6Bvs91/hwwQAlJ3eERLVcoHFOdcEBnuvPb0LyUpma/wSLaiCTUfJKmorPZcykGxi41KrrZu6crmNMf/LP+dsXmYaXFOxfnn7XcPFdBp72xkuaWOJ/QIXb3TEd3HiRWoZm8RDBJaG0gRsyItSK64e1gLTwCg20Rac8zuxB509g0v0NR07f7/2IIzHkD7w3iVaaRv2SEQFmLlCVu3qRdhT9t1SxM6h09BhZiUm5C1T74KY+0/w5ix/cb+A6PuVKCzWVWeYzvn/SASJ7SmEWKQkPH7VxUBcigQTVGczojVIXObRvmU75SX0tou27lNboofOdrkZPjnZn6sOHbKGYHb57xQZxzxDhZhdn0ExTa3umnRX/ODwvPiEE1BpLHuqIYm1pK/vv6Mmq1aLxhT7cQ0Hif/Ppl4r53IdXIKp2O27NDVlKLJ57QJxrXkXTdMaApo/E/hPTgLi69L6wJQUJK53nNQ5Ur05XtqekT8em9ge0t1QKuRn9c8m8e7kS0i3AUBPA98xN5oZX1PHoN63XP+Uzytsd2xkG4NlvcFQexoIlEOecNVwaVaUdEI8TmEwsLxAxHuOvXyrDl1nT1UjyBiFyPxcebaTCP7gwn1q1yWxLtEveKoJQOTTeYaZtUuyWR/jGa/UOAPBoQPla6oN2lu0qvHRrNa9zlI8n9Q8ngmoR69LzwexFMtUu1zEvn9wcjM640fjxnUEHKiK6KLv8n725jQVGwkq+Z2I3GaX+PmnnRpIUyxSqkra8X2a8zEva2Im17Q1ccC1gYnmxw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(39860400002)(136003)(346002)(15650500001)(33656002)(52536014)(76116006)(8936002)(5660300002)(38100700002)(316002)(966005)(478600001)(2906002)(122000001)(64756008)(86362001)(110136005)(66446008)(71200400001)(26005)(83380400001)(66946007)(8676002)(55016003)(9686003)(53546011)(41300700001)(186003)(7696005)(6506007)(55236004)(38070700005)(82960400001)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?H3BqqL1UqCqm9Pod088nK8lyf+cb9IayDIOV4WYJd5LV0NWuAQm2ns8chrsU?=
 =?us-ascii?Q?9ftJXMNFYkS0c2SfpWfkV8mua/jd1DsdsR+bj68z6+BLw11fP356uWOZQ9X+?=
 =?us-ascii?Q?+yiwqrjqry28JDSb25IXumW2cLSQGk0qrZxpnIXQs3CWxG2iVQYbLbAjWQBn?=
 =?us-ascii?Q?ehPjPBHjYokd+vwHjzMByTBv7QEZP68A3hCagKmsL3q2uy/voh+kY5azQHXd?=
 =?us-ascii?Q?v5mdBUUAUuN23tbD55rdgXigF8NXGAhM3yjV7iqLBEEIplGS/OoQKAyqXhxT?=
 =?us-ascii?Q?tzsXtjDVV5ChMdUYkChHFmtPK4h/oiX6e4l8dtuEClG8a02hHni/OGEJsXvJ?=
 =?us-ascii?Q?m4LAfh6rBXCWbJOj5CVid0mB2qws8xLAA+jAlVb6LSUOrTN/z4VTKica7fwq?=
 =?us-ascii?Q?3sypR9CK6kxMocHTGi2m0xIN1vgoRuGH1QdAFS8fFRH0XnnbACisVDeLY0SS?=
 =?us-ascii?Q?Om+WHBRYFN8wAJ6V+/qRn6zqt6vih+LGtwlWWtfm/iXV4F92ZDFSa1J3YcQN?=
 =?us-ascii?Q?ldGRiuHASWjpnFe4StI7xNvQYP3Yp6F1ZasH1gABXWF6eEKOJAd8vWcti7u4?=
 =?us-ascii?Q?ifPTbHntAzvvnj1fTT9o/R/vRA+j2IPlLxsLTSyTChNnUOadaWjXr8lqZfs8?=
 =?us-ascii?Q?iXXcQCPr1TBlKLWAUvvIo2urgtewcbPwDMZnXD6wa61l3F/vgpW77CkE7dED?=
 =?us-ascii?Q?Amb2M+cAm+A7TgXAMsAL+76jeG7Ge2DaKz5fLbmeEcJl6sNt6EFdF2TqsEg6?=
 =?us-ascii?Q?dTsff23nGlQ1CvjDIsPcn7I51zmvCXolHPaxDvsWlA5C0eqXi3Q46UADfQdR?=
 =?us-ascii?Q?a2FEcPXsdSw2bx88EO4uFE0kCMP67afmdPeWrdyjCVrOy/l8tioms2ZqkpkO?=
 =?us-ascii?Q?KoJ0xgGRGMbphBWmwylCek7vFEW16IaQlnmO7AgpErLw2TZgnYU4hE5ujrIB?=
 =?us-ascii?Q?qt1CMGlHgmH92UePyE3uILmBkt+i1EQ5L8srp+OCmC7LJ2zfim3FovWyy3DC?=
 =?us-ascii?Q?poI3oC5lMHuRO4/O0QuZbpaN/ZAaufFlgTsBlzHt54+MRT/eYGjsNRU+Q6Z3?=
 =?us-ascii?Q?A3jefGi3cPKId+z+SJLEL7iS2EjEZXli0yFWI5upl+qqyzLzzZfUw6fw3NcN?=
 =?us-ascii?Q?BdYKSsCo1leQTDomsZ6lynn+gGlrwL/A2KYIlMBKx0kTgnkHQ+ewmouXt+17?=
 =?us-ascii?Q?DzQ1JXltB6aBQcpJcwQ3Y/pgonrH4M2AOEuRQACmx8MfO6E4zWcMILA+A/MY?=
 =?us-ascii?Q?6sMUtgI4YSWZxapSYO8eI30561Nxt5H2+Kot4imav2E2xc0wM98OYCjVx2wk?=
 =?us-ascii?Q?ELxxiW19b42X6lnProYpWPe/cjRPtWAevqYibUcUeVwq3NThQSUKqf5zTxJ9?=
 =?us-ascii?Q?nBsZLHaMK8rbtHicgcgUoUyE6rhNOh/dZVWpDk7k2vLRBox8vVm6EyLyEMfV?=
 =?us-ascii?Q?EPAUMl4PG6VrEaOTSBqulSYvcwb0NXIunTy/W9c+Y3mmKYEV8MJ3iUTz9plx?=
 =?us-ascii?Q?ZEx48USbgXhgd6hWFwmZSEianMTqQlKDuPSE3bC5Eo7dvvl9g25RJvq/NGnC?=
 =?us-ascii?Q?ERjOQaDjhS6QXKJt7OFCzAw5bfLbA5cenSDOqjLL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b19f47e-27ff-4900-2abb-08da5b14fc0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 03:51:31.2254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uhWQWkJ/sPFsfhTknk1/dG9lti3kC1hG7xNOKICWDCku0yxJxlMazr2V88U3UAMpfj2yc+XMeW+jgP6f8RTs0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 03:51:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167449

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.2.rc=
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

ETA for completion next Tuesday, July 5.

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 29 June, 2022 7:48 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.2.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b8fd6f5d9959d27176ea016c249cf6d35ac8ba03
> meta-agl: c4cc627f4d65da8c3b0860c791d9b9687ba8f5d6
> meta-arm: af928569b421431347c84f5941cee7aaa9f0ac74
> meta-aws: 8b8eec4bde3b1ff00783503bd77b3a5fb7d904ec
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: ef3aa3064b9bbfa19f600eafb1e7d3473f62af74
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7
> meta-virtualization: 320f44c6e9af463a85b58e0d87ca70273c6b87f6
> oecore: eea52e0c3d24c79464f4afdbc3c397e1cb982231
> poky: a5ea426b1da472fc8549459fff3c1b8c6e02f4b5
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
> View/Reply Online (#159): https://lists.yoctoproject.org/g/qa-build-
> notification/message/159
> Mute This Topic: https://lists.yoctoproject.org/mt/92063018/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


