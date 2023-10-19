Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D71CDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:07:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web10.28825.1697724424599281728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 07:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=AF4Gq9M0;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697724424; x=1729260424;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZG8zmBVnZI3hKwXtgEc+ADZu9oKI14QQ5jxlPEoJMQ8=;
  b=AF4Gq9M09+6vsF3Emg+wBv8Ia901/pEy3dZoZtiXofP9iXkydqQq/HyY
   5jO+c7fEnJhqtFNyrxAm6dQ9UNrST3DYtXCpJzoIevJ3/8OPYfUqLonzT
   B4NGT7AOcbZJP0Kepltej15PnNHvhYR79rCPtosEnlV8DxaHnLSQKVr4/
   lQMLsWlXeTT1FzAb5RsKDZokynYVsq/3vr/MVOORQ3bTvRp54w+n8v690
   B4+eEz58gp1g15lzlh6EKhQ2uLm9jd0Bw52TyDwno8bjwx3Wp5uzxU1wu
   62w6xWPhB9UKsIygarZvI2jWYGY/VKlw5vrWZNSzPsZT2rrQb3Dv7BAnS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7822247"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="7822247"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 07:07:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4760110"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Oct 2023 07:05:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 07:07:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 07:07:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 07:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIkASd8XXCw3K0RXkrn6Ca6p+emNXvISOJJTmyCEGQ8J0wtOiRvCDr3iwa872Ue0jbPkIZCYenqaVE5NnXO6uHGtLDNH89l6vCRGC0wK9VixS2CWdD49iZLSfG/bmJFacWNmOsQd3DVV12ExmczCXjqcJR0Z3ajIuiIrYeODhUecZU14jkoQW+nCFNTe2quB+eUVInHdbSStfci7CRBSDzDHkNptksV6vDfgF2O4AHGf5zz6be3Zh7GSLBE4XSs0pF00ItS/s+LCrXApY3SQP7QadkmlxNCNYvgmB17GcJmn/kBInz1GISO7nn6xhBXZUjaK62H92Ejo30+PGWQXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMIbs7pzfCbRNjzDYrz7pV2kVeMwgeTF8BA5i3FwD80=;
 b=Z/7J48GGwd1ydpnsvWou0GBvwsZAFWBeG+3MfI+XrkCu0Lm5ugqCpAqZQ2so3G7+TTQRg3w+Lm02mbEG04Da4wONnqlOwmXfLLJwW0YteJSmkSL3Eg+spnew0oxh35RsnpsgMf45qlqkQPDQZCAwF0Ex/oVl5SyN/4lfV+GEBlotZZo3Sy9YqggRjPmU0IOfAYJH0ZeK+peIb9Qv/oEarZW8SoXXXmNzUG+2dbxv+xbTwA/OFnirAOr6VtQJJBdaIJptUwvjpQVWtRJeu8lvTTwHKX4Qewqit9uw3S3gAgJOZohFdr7h+KwdLudFwKNlR+7HDCmYaR+B2QkWr+7atg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 14:06:56 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::c14b:eb74:1cab:8bb9]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::c14b:eb74:1cab:8bb9%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 14:06:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.rc1)
Thread-Index: AQHaAYqivNjMDhSxSEeR6IVaZLEqo7BRJ3zw
Date: Thu, 19 Oct 2023 14:06:56 +0000
Message-ID: <BY5PR11MB41525A99B494424A5AD57DFBA1D4A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b416d8d29-59a72af7-335c-4677-b485-bc0ec3abd261-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b416d8d29-59a72af7-335c-4677-b485-bc0ec3abd261-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB6357:EE_
x-ms-office365-filtering-correlation-id: eb50237e-a4e8-43a9-ad85-08dbd0aca75a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OMgwWEJixgJ60oGC7hwLx0cLPsy0jXZEVhyuz84xwWhX9xJbpRkhSNY723pOM+UmcZSH/BQaFD88iJDtE49IsLC6MuIMmyjx+O3h1l7DQ10IZRyxEsp5+Fqgu7fM3ttWYKjDs+989dATA+KYAwf9Bht7/A9fGADPMgkH2ctCwFdjcGKtZkI538wSF5r6KVYJp7ueRK7JYDWPIMkMPDMm/Vzqt5lOsEP3/89JmlV0d+bmN/eBnZR5bXeY8AEg2jo6J1PpcmrDkSdjLgJkzEYZTXrqErVmQqY1MOvBJ9V0uXASOZrh4Q4ILc5YlmbjRajDLjc+acw0C+CBEPqzihZKMZD2S634N4kLmxMs6AmaL9H8YKTRB8jrKeOYkwFds3O4IcA6HtE+M8440s2CtsuKL4qf4TrmwKYdnbzb9L2kVsDImek23CvQqEu0nnVRn5w6KnrydQcrDW9Mj7oLuoUxAMxIX9z/lpeEc2gt/kU7MqHBSNk8kxuIfEsp3T4yrq9+AHGebpcFaKRXX/8v4smhFJLRTECMFkAWi+1IQzIyWczV6AyJUYUTVn7NcRL4ErerHzsq4FBgKfFV1IBCn644FdidmCahL24MnAlw9ll/VaEbxyjEpv1Uep6lV0F2zfuycRo490QeIowC7EsT0656hA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(9686003)(33656002)(66899024)(55016003)(66556008)(64756008)(66946007)(38100700002)(66476007)(86362001)(966005)(26005)(38070700005)(122000001)(82960400001)(110136005)(66446008)(76116006)(316002)(83380400001)(53546011)(6506007)(7696005)(8936002)(71200400001)(5660300002)(15650500001)(2906002)(52536014)(8676002)(41300700001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kB6xdS5uyBjG3b9UCl58iuzP8gAgYLYOq8hi5vZazOWSSuIftI6D+VyRjUk7?=
 =?us-ascii?Q?t1bph7nBq9BLXWqw+mrGDLX8bO68febkHuE6BgWApTj2YmEl4bQjSymjHTyy?=
 =?us-ascii?Q?/BChBNpsgFWZXZMTpnx0yKAZXmysmTP35G98m52a+GZseGwbdBFNqCEU/9Ai?=
 =?us-ascii?Q?xQg7/xDHyQsGo6smPTj8S35+p3q1PfPFRlIZkmHeU6b5rTSOVXrP4axx6ii3?=
 =?us-ascii?Q?RVEBPepr0vjrkAojZhodkK0pLm+xa9xCJMqI+6q2jUH/nl7jge2bUiIMy1t9?=
 =?us-ascii?Q?N4CZ5FHBpBzHS4wTgH/Pxor85EqViIvQoHtw48C82HExZzb7VGaDbe5i8eA3?=
 =?us-ascii?Q?zf4T/cQ9qbEMCPNmTLi2HdAqsW1Qq4ti77GY++NunCDt1YnGtEKejYuDFirt?=
 =?us-ascii?Q?pgqYjxiwUIqRX1dOxQifkfI3xivVLlRjt0m/nFUBCJNE0yTenPNu1Hp3sab9?=
 =?us-ascii?Q?6RgRxOsY/TW+K63MOF6EMZYYJDmY2kHvwqqlu/bbSnXCIBiE/2cVO6C2r96d?=
 =?us-ascii?Q?udX6vzayQeTJjQO+31Rqm1X4Yjuq87obnGQ4MszlHAKjs7hqmSyAiWhPmwZv?=
 =?us-ascii?Q?epn1dRN9kK9VwTsyRgSSnZGJFKxt4nf47x60LRYGOoP3RkKtFLJNxlCYjzJv?=
 =?us-ascii?Q?g20eIZbl1SpLO4BYjMZCdPTONf3nKJC73wucbdk9nmwFBdvrYx3OFo8KBo3Y?=
 =?us-ascii?Q?ZSgB73YfBGAlddmDS5seS6SaUx2r7DDG0ICNOJpA5KCsRfaqu7q5soIV+rNh?=
 =?us-ascii?Q?hdVkpp7W+EZZZ6hzmMPN04yxm7jkDIriePoTPnpno89sI8KO7Geq8x588myt?=
 =?us-ascii?Q?T2c1gXdm2kVDcnIKozivswqsYFfYn7s1hUI+GyK837/T9W1gxVHsCXLmJAlP?=
 =?us-ascii?Q?Iv9T0GRsURHFrmdtQSGVjqF6gTdrr+0PGcPvU+WooWTINslwZVe1HWVZtCJS?=
 =?us-ascii?Q?SBnXutcInPSnwazhtMJ1UZP/Xls2h26MuJC4x+NB2uV45KG+NvQhMNm9pnOk?=
 =?us-ascii?Q?R/I8ypo6AFGTJtpgB9dRPnBKIBMEfA/RHhOCNQB5skKHcpOJCEen0DES97to?=
 =?us-ascii?Q?QjAm0JkCvIwe4SQu9tZ9GWOiTjmjibuA/3Vai2OexUU9MW6Zzjr1IyLIU5B6?=
 =?us-ascii?Q?btXUfJEVWuwhMbU5JragaY3G0SNBZ1W4DV7CCRF1Toa8t+wT3/i/gc1y9CWY?=
 =?us-ascii?Q?1O2uWIkZ/mnfrS4EkHgVx/Eq6njx8qnW8UeNF5Jkp+tR7BtOIa6rwCLR55I2?=
 =?us-ascii?Q?0j+46DBNfBHUZ84TnIqgtOoMY4kuJo7dWCxa5vRhwPiUPtcFtU5aUCx9FCi9?=
 =?us-ascii?Q?D2brulAh9j5+Fni+Z4Oy7iC7tC8UemzybE+sR6e7I2aGgxwL0ANwWNFaA33l?=
 =?us-ascii?Q?2SDrWJNxmO/iPBMAgV/T+ZR+jjij2NB0Z2alyOYJ+bx3K0IZ6D0+PZMwU7dY?=
 =?us-ascii?Q?YRwnJ1voTxtDuvFA9gpZripw5zlQLlAE489DgUwryv2wGTDs0agl6a3nBzV/?=
 =?us-ascii?Q?sY4EEhE3PL1WmJh9zZaKdcRlgCbwcYO0iv31CZwmnI39QVFo3dQ41wx31+aa?=
 =?us-ascii?Q?aUkLAQwn9mqxy+Mkx/eIiykm2f3e3i4n+x6v3aNG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb50237e-a4e8-43a9-ad85-08dbd0aca75a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 14:06:56.3533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dOJ2YyO2QMlgKRmYylxiZm5i6+ytWZnbLDsUiNxNsoFbvUOy+RkogDs6JY4Ak0DoJdSqYMf/ma1g/mqBDcQhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 14:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189463

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3.rc1.=
 We are planning to execute following tests for this cycle:
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
	6. Beaglebone

=20
ETA for completion next Tuesday, October 24.
=20
Best regards,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, October 18, 2023 2:16 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3.rc1) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6062
>=20
>     Build hash information:
>=20
>     bitbake: 5419a8473d6d4cd1d01537de68ad8d72cf5be0b2
> meta-agl: 4063b4f9a712e32337c1d9678b2f2481dde2a346
> meta-arm: 3ed13d25a065f29bd46ee725c708d12ebc3f175a
> meta-aws: a30a2b66f1447dc5abdbca6c5de743e39c08b99b
> meta-intel: 1bca60610c597571769edc4a057a04bfdbd2f994
> meta-mingw: 65ef95a74f6ae815f63f636ed53e140a26a014ce
> meta-openembedded: 35bcd8c6ddfb6bc8729d0006dab887afcc772ec9
> meta-virtualization: 827092c2ec925ea3a024dcda9ccfd738e351e6ba
> oecore: 4f84537670020a8d902248479efa9f062089c0d3
> poky: f65f100bc5379c3153ee00b2aa62ea5c9a66ec79
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
> View/Reply Online (#321): https://lists.yoctoproject.org/g/qa-build-
> notification/message/321
> Mute This Topic: https://lists.yoctoproject.org/mt/102034503/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


