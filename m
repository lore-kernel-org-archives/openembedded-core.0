Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72937C43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 08:39:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.8889.1667551180333869962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 01:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=DqOBEuqU;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667551180; x=1699087180;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xIyrsmzTJVf7wapjMGStGn/mwpOjLwyCSy4+Vp11D6M=;
  b=DqOBEuqUhsXItkE1id8Oy7Q49IziOlJYuMOL00cJZ795ap65OKN8dHFL
   Axt7KzPmbctphPPJMWuiCbTNe9AXo2+7H0W0FgpQQ9DC8uNlgr7yryCZB
   6eVPR2YRebYRbij695QSKtQCrhE6cnoUha3J/i8vCyijvxvRna/huATrf
   ZXH6HYvif9AHMrCsrzg584hgVv7HPILpwKaS9XCMdqKMe6Fc/IhNVoSm+
   tewQo2wnVsZ4ojrNtRT/kBgRNTkVyycW0uvDZ2k6JVC3JaaIoo9MHyEpb
   F1r7bjQh8l21T1Btmo/Lgo63E0VLbg1dC49wT/HWd3l2ghMwcsqg3DzMc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="307541444"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="307541444"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 01:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="740545281"
X-IronPort-AV: E=Sophos;i="5.96,136,1665471600"; 
   d="scan'208";a="740545281"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2022 01:39:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 01:39:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 01:39:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 01:39:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 01:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoswXEQjvN/j66yuT6n1tLZyalVmY7VUyRZiYpIiliTzPc1e035qFYr82r9wQToHMv8MTGiJ1wCPVW9eHuH0MZ7gDiLFXBw56tAHXgWs/1gIDIl5DcOq0RdFEz+GD21hxqmhOQCHDS2I89A+JKXrFZMb9f9vXcXn9YZuHaCJPR8im7yq1sYnTaSMjbkCRuwupvwu+wFJQY7V12oScyyKGYocKrbxSXjfhNfXgZDtDMSI5jMRB8Yq/HQe4Aw+cLS6bEXOGk7bnuNTR+96oSnLp5RYz1Xnf2lnRmuKZ5+lhLRRq+0q8ODjPqD1HJX1jAup1YKc6TN5FVtghn5WrKNdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdT+vghLtTuZrmAzRQ+VVM2FItkDq1xlaQw9cIZz6PA=;
 b=TFRsREHyXimpiPtk6y+bKUyHisr6w92E3kPWQxmiGCYwmSC2oXxKIWUmYYoWaf5XG5927LnmSLw9tKA6kzS0Gy6bOPfQtUFQiHdTLcjxt/SZBipqtmfot5vmExsWaa+AGF6lBba6fyVkpRFpabIRDl4D6pARUfSAJpciZDVVbZMWUfKdhsXCjyq8ylINA0j4zX2mP49FpbbMQ71yBPaqV+jUJixGtpQBeUTbxhe6WTSROMrhtKqhEv1dhkWCxbVGQNdzjN1Ei6cnW5Rrlk+3LVT2+8lSm9c56pX/cH2/ARjyX4MkBU9gnnf7Mgc441vBRpdVmzd+UIMCqsMcRmivIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ0PR11MB5600.namprd11.prod.outlook.com (2603:10b6:a03:3ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 08:39:21 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::f36c:daae:59dc:4c44]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::f36c:daae:59dc:4c44%7]) with mapi id 15.20.5791.023; Fri, 4 Nov 2022
 08:39:21 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.5.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.5.rc1)
Thread-Index: AQHY6+uV9CHVUhDZ8EeOYsxaslS6Zq4udw4g
Date: Fri, 4 Nov 2022 08:39:21 +0000
Message-ID: <BY5PR11MB4152AD03FC691C49EB9F9F05A13B9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101842601f9cf-23f5c96e-dfa6-428e-b81e-5078d47c3039-000000@us-west-2.amazonses.com>
In-Reply-To: <010101842601f9cf-23f5c96e-dfa6-428e-b81e-5078d47c3039-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ0PR11MB5600:EE_
x-ms-office365-filtering-correlation-id: 2e3371b8-92b2-4703-a82d-08dabe4011f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oAYXEDIsQudjUv71QN2zWSiy5PGkc8WECwQjjRzBakh/xkMe4GQNmyWsScb0Mf4ALYSop+Ob/acRKU5bf5Jz1RQtlSeJjbVVrYgG5vVFt9iti/qKfIhs9dMjHULOB0xKbqnrtfULubwNlmCv/VKl+5ev1Fg4+GVgBLna6Icur1y19YVa+Q3ITU5x0rhIQs3ICmGEGpvi0b1l3RN7o3jGwWEpmB9SPStPaHwDepuVt1O4bEygJMweqQ4iMSShlpgk4TB/dvVSK1PhxLdUhfaPsDJ2CQElt55HeStoYo0L7b8bRTCg6uBxjXVkaga9OZUNMyb1LUBRKzqZ14hIWfP3g3m1/rUpdD1PGTQ2pli/jeJOqwJ1WgMQL6QsUS0iGINXWWVdUQ66ZFwyexgGtrSu6Ci7vcjevY6vcffBkTLOeQEIQ0twpIGMsLNRAsBo5NoCAhfksD0a+h4jxFglMz0BGJeMUCvTEr5opwZft7uuIwNddiP/bnE1iNkzqktp8U5U3wNe/UQB2MBXtIYeRIywTzSGeMjE4KNJnaLQfWwgtNG9J3kBDy1K/s9/unTUAdzS7v71ayXJHhtcWvpTpuOBld+jd9Z2oxr9nafwoWVHYfPuDfe7Qx2LBIWRBzQHV5SP7AvwUBERrTJad9/7lU0OdyMN+VAtSjP3qzWVpWwm+Es8VCzt3fWJlNIhbDZvdEAvmyom2bHDOuVHS0SfOjEkC4x/zQVAbI38Fk2lwkcdOtCxa6ly/ZTMZJx5vQHGi8XqT/tBT86YHMiCwmHb1Tfuk+TJJUbrvhK+5kIAjiozz42Irfp0s2eabrhNyYS+3StSYo8JIKyUqvZg8va0f6Fz5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(38070700005)(26005)(55016003)(33656002)(86362001)(41300700001)(76116006)(8676002)(9686003)(66946007)(66476007)(66446008)(64756008)(66556008)(186003)(966005)(71200400001)(5660300002)(8936002)(7696005)(478600001)(6506007)(15650500001)(53546011)(110136005)(316002)(122000001)(38100700002)(52536014)(82960400001)(2906002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P+2t/Ii68co+GPweJvdsi75NQh783X1MwZ00ac6NIpHDIyBfRFp8kcRbrFjA?=
 =?us-ascii?Q?lYf188QZGOrhhH2ZzcgqGW3kSZJqaZ/W7AB3TvbxtOoX0/hEEHko0U2WbCMm?=
 =?us-ascii?Q?Ng85k2F/s5PGqRFvU4HwHd2KMMsrYwzFULcU1A3AurlrHLCoIDMUA41nKDvb?=
 =?us-ascii?Q?PCnl0+R0GfgwszDKxKcmCAPnEFfBDbv5mRu1RY2HSUHzG32gAWcJqgwCf8Y8?=
 =?us-ascii?Q?3OJQCHoDTzL7fEaH3d15TW+28YceaJcZ5cO78uMEseXS+EArqHsqnfZQhSj3?=
 =?us-ascii?Q?UmzCJY4TvPD+pa5jPpydM+XTh3bUoqkdF5g+FrZxs2mdY+5fCtQzxjrYnHR8?=
 =?us-ascii?Q?KDq06Y7MAAGwDNCxi1xS9DX6ZZqEJDnkNyHPP9z3eKmL9hPBk+uSMSY7s0jO?=
 =?us-ascii?Q?7gr5CfY5NravkCtLvTalEua7C1FMzgWSdUZ0i1iarK9otd+VtIOjLsQfiJTN?=
 =?us-ascii?Q?/RT4HSllBp1v5abyL9S4iTE1w5dvkisLGWFxeGHgmJaIThsajjdoGldGuNmY?=
 =?us-ascii?Q?OJhhia01YdUyrWA6665QRSqnDtF4zLe/t7P4B0z2RxsuNRjqa3JNUFt1mHOb?=
 =?us-ascii?Q?fG5fC2ly1BsjOSawS+c48qZg8GBdG/NQWaYOtBFUie2+pFai84rXon0ccUt3?=
 =?us-ascii?Q?hlyPtzj0hyecM+e6RXtctaTJC4xsiPE07nIxGqoODTxvNc6pLNyWeh8z4Qqk?=
 =?us-ascii?Q?QJ88cI16AOHVo4pOqhPh6fLjbepAHQ8z+/JMZyU1y+8XxHRvjUNEtoYlz4hl?=
 =?us-ascii?Q?ktqhp46E62BXnUT1BPpEguI0ZP4SnSQRQEpjiptoUDDQsj7jiXYzhAHXkNiQ?=
 =?us-ascii?Q?VgWqoLtTSr+dtwvmrdvM13GY+6Ol9XXtiBRCP7bl+fjNGiG5DO7BWdAIOXNw?=
 =?us-ascii?Q?wzc4gz1LiNM1pfaEcNFJKsqwoqCtEfYnVNhhxbDpgPTle3jXavHAn5GTuO9f?=
 =?us-ascii?Q?tsJNTOLKYo67NuDyQfFJcaJygHNeXq5TRTSdj1UFvL0jjoyz4G66On53Pd0s?=
 =?us-ascii?Q?f5/drfvBylyPwCFatBRg05PDFBQox7Bu8Sx7vHXz3Vgm8xCdlVE0vuB4HHQC?=
 =?us-ascii?Q?GdKkCeOaSBqPjQwKbkisBUCoLNTLDFEeQe0ZwIPWfRde3a8h8YCyTOpHSWAY?=
 =?us-ascii?Q?WDF8krJRsm6vHyYrJ9t/ae1ghP08vjQSUsH2sX9I5QMCXahJ5fWGiDcZj5y8?=
 =?us-ascii?Q?0AjO1HWWyuOmIdr9CbFaBwaRMhGda8Api4/S3VqWTXZip6kx4i6Fgcg+pyrM?=
 =?us-ascii?Q?NNgHCTb6y4VKB4jI1HQFCQUA2we1xzMHFVBZh1fdDx8BqAmljdxZIENCuDL2?=
 =?us-ascii?Q?CKeHRaVCMLGIO0osbhpaydJHDxz3LFmL5SE1YFauH72cwdf8XGL/qki/D151?=
 =?us-ascii?Q?IyrOsG/M1v13a5qUZWkPE8OOfn8/AQv1xxOouorZRZjjF9F8bKjFq9PdYADl?=
 =?us-ascii?Q?GZzkwkvS8YFeraeNMS2cah/kKk/ZPkwVlwUWqthgEFr4h2Cneltg2dtt37cB?=
 =?us-ascii?Q?HPsEU/FPWmGR1k33fUrIXggCVSi3exNyLfYNIxOaNPXnSokpEj8zZfaTeSet?=
 =?us-ascii?Q?7s1pIRvK34hoRQwlbN5tVCzM9cEJ1M81NSCFyBrb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3371b8-92b2-4703-a82d-08dabe4011f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2022 08:39:21.4359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mwf1s2OAztc0zMpkAdriytrN6O1hxBBN1NpXErb7qV0ZTtYZBJh6dLzVhze6nRrDHJnU3EYsgtHWWXQmF1ZROg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5600
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 08:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172702

Hi All,

QA for yocto-4.0.5.rc1 is completed. This is the full report for this relea=
se: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

Note:=20
There are 2 commits are merged to add support for i225-LM driver, it resolv=
es IP address not showing issue on some machines.
https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-5.15&id=
=3D7b8c11231180c913824a3ca227f111ce1a7efb1d
https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-5.15&id=
=3D0b5ebbb75bb45a8f88628b7a51ea0e1f48d565fa


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20


Thanks,
Jing Hui



> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Sunday, 30 October, 2022 7:10 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.5.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.5.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.5.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: c90d57497b9bcd237c3ae810ee8edb5b0d2d575a
> meta-agl: 14b6f7b09f6a915ca8c30e9d069e2e5d97e3de08
> meta-arm: bafd1d013c2470bcec123ba4eb8232ab879b2660
> meta-aws: b764a5e90e7125ca2ca49a0e9cf93b10e1403634
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 01ad1a73aaab49d377d14bad8a7dec48f86cba83
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 744a4b6eda88b9a9ca1cf0df6e18be384d9054e3
> meta-virtualization: 9a487c1851aa2021cf24f951957e22fd429c8025
> oecore: fbdf93f43ff4b876487e1f26752598ec8abcb46e
> poky: 2e79b199114b25d81bfaa029ccfb17676946d20d
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

