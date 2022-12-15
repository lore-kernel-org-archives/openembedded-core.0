Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07599C4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 09:45:21 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.129265.1671097518746533329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 01:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=JAcHJOBE;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671097518; x=1702633518;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+hLjjTvQE49GiVtx+GCxdTu8mHvaLIEdIudIV2/T9ak=;
  b=JAcHJOBEt17XEZoGFFTlbW5UwptZ787tYXX8LRwZQi8A+IZZmrxS/h/D
   elsSh5K5BH9W55qrW1QV/9MWTk0VFvxfg9JLSEhuJojgqDmrYtD+TGdfL
   wxLR5JOzyGNtI1pN7GFRDoBq0LwZhUHyfqbaRbdKQJjQl8ZoHcZLiAcT1
   CZg5l1hwPtAozBeRikghQm/Y8/Lj6XQTATlhMLTsEImCSkUE/OFW6fVx2
   OiHu2wYHisoMax2G8Bz3ihACiAc2II4H5OiYEQHL5JJTGvTkep0ip6Wvm
   9dVeokkVPsaJrx9CRE6h3bmI13Xgh8vsOKB84hxqpSA9rKwDGCRDWGgsb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="316273691"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="316273691"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 01:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="649314447"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="649314447"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2022 01:45:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 01:45:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 01:45:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 15 Dec 2022 01:45:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 15 Dec 2022 01:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx0rRnl+zoxAytT6Drp9sT99HNGjzDtDkQGXe5QPZzPB9N+pizCmg46R1OHyN4dvNvO2Nd0tBs0VN5fC+5o+AArAGmxkOUk2ZK+d+W3tnvZ4IY2KDabY/PgCbVh26XHQgvrdizdbq7R0n+W/j+Gw/eFSGgL6AzRt+NtqYHoB4XiWwJFORwc8RR9cAC96XeOsD/cXmfOQvnmjr9TwFfoMBmBcn5spn2OELGktXZC3XGCNfhDzUGLKZorQB94cA7iPDLUaDIoXAfiMX0ws2X6tEAJXOgIwTTcyZM6/EDj7lfKAJAf24QqCmeWOJwuNR/oObv3USs/vj+KnL/7N7vJvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jiu7e0xJSEWPwh6ISH29MLQl56dGh/y7jd7lmT5bdE8=;
 b=H6HOCmwVyHr4CnQX66kkfn4oZsdXowB9wvYLbklkrr4BfmGLDZe1fL58dgYEmsVB4miuf5FYTKAyzut4/UDlr2vskaykZDpbzdA1IW+jfpJiwRgUCDaDwJYFm+Hz9EQeak2U7HkgcSZr2qBrFXqNaAEwx6bTNdq/jwppHq02e3Rw0uzARqbExGb8ANiSZ7+OWdyqR7UXRJWIDmT2p6NDkrKXTjvexcXy2p5R+5IdZVUF6gdPWi9pWghj7NZoiSUte3NCiXBTkugqbOs3QVaKIWLBEueEeyKwXhW3G3KSYJ8gCHA7sFB8LNktIMy0e/SZ851GSW2BcVJfhenWurABbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 09:45:14 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%3]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 09:45:14 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M1.rc1)
Thread-Index: AQHZCzy02DNcsB2E8U2T4g2VPa0Vdq5uvFyQ
Date: Thu, 15 Dec 2022 09:45:14 +0000
Message-ID: <BY5PR11MB4152AEFBA1E9A1B588A6C895A1E19@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010184f33f3b78-07acc2b2-ae5d-4466-bf8c-59a138757177-000000@us-west-2.amazonses.com>
In-Reply-To: <01010184f33f3b78-07acc2b2-ae5d-4466-bf8c-59a138757177-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|MW4PR11MB6763:EE_
x-ms-office365-filtering-correlation-id: b6cd2ba3-8773-4526-6376-08dade81111d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JBcjUoLQZqNU0qykvxbb7dpDU9UmxmdKLR4djviKv6BUscUtJW8V/jIgduPVXD3fgKlAOhgjbarsxjG7tFcVHJnCw7V5nzMZfzwzyRQ3nhxBaM220pXaz2DfSS8yC9bqOoXluFMBIEx9Zidpz0N9u70wGYk1vt8NDYdIXeKFU4fbBxWbm1LdKeIO/irLljCbAczVmwe+qNxpJS+8holh9ThHWwjGfQUU035Ybl8NJ1piwg3ZjuuwL4YInsMTpMBA9re1VuzlXwKUccgoJIatcW99SNvSU73YZpSMpgxwf4w/GVreElYFk6H6mio8CbRE7JjyTAmWCFexkYiqub4ZTdk+xBG9cm7FcrLYQGV3PeU8NGHGZUTCjxDVsFsmQrP/huctpWGjv9Z9S1dJP1SiAYfdSVo6L6J09HWAXd6nu9wUheBJS0FwArHJDl5ubct3SBECEZsVZGisDv06Of+1aFMRUf9qRhQpjNrWXuGVpsOvxD4ffzstnL1y2+6M2FBHSafQdm2Hfmz3rAvG4eSoNsLczP2oQ+Snus809cLyB+xiFIHMY9z8/g5DZ9P6Fc3H9vubfVjnfrkgtayUPQAaRbAz0tAJcurHu2pqWm/TXjnywE74UMTjWh6iZ9bZMOQGkptGaMCTX+h+Uivpg7SYHERRFRoF0pYOnB8MD8j2/gW0EgZKFiMvDfPsi6P2CpjQ1m+bscesOUMWYYk7jzAC8nGmNvwKyva3oPA9KOD0Czs8m1J5RnaKkZ+cI6hXlQoFz9A5SdGceOeCm3TCDfTPGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(41300700001)(52536014)(5660300002)(8676002)(38070700005)(66946007)(64756008)(66556008)(66476007)(110136005)(76116006)(66446008)(86362001)(15650500001)(2906002)(316002)(38100700002)(53546011)(122000001)(186003)(82960400001)(6506007)(7696005)(9686003)(26005)(71200400001)(83380400001)(8936002)(55016003)(33656002)(966005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HdQGrbm/tdT77Wh/MC8YZJXrgShExEXcEIXOs3HKCcBrSK7CozjemixAq5bo?=
 =?us-ascii?Q?iXCmGlHu16kMMG9JZak+Xku07E+sXK39hvMRhWHorYZuc+wavJA9G1glb8Rb?=
 =?us-ascii?Q?qIPPfSrPiYiG7C8xss8Rihxa7WdR61VwkkVWsAuZKm1VrihndH/heJcSB2Xy?=
 =?us-ascii?Q?4FirOyzVOorOyvw42FGqzwbRYEednkBEdsjmAH1SAEwUs18Yq9x45enHvNjy?=
 =?us-ascii?Q?UtfQk5O5tJnd/W/uQUJiXC9dxrBa6ZrDqck0D4Gli4fZ50+exIGv4pJ7SSSz?=
 =?us-ascii?Q?WP5L/ORzvoeTHnhutM2vT5HRBi+YJNTa/L/SAP22XumE5hVKbO7jdGZv/Z1f?=
 =?us-ascii?Q?HP3KisRh8x211plKPU0efkn9fc/gOtqFPDZi217jmFFyHM7XZvUPd8i4s6oj?=
 =?us-ascii?Q?2yWyPvGL/TBFZOoux3TKmSNnl40lMx8WFsaJjnEjTW6ZCOWqSzjGhGdz5Kx9?=
 =?us-ascii?Q?849o1kNX+YmAOGdOH8lj31OjxWBZ1bnvadgw+xrPjyZZNG/DdIpQl00MXn+T?=
 =?us-ascii?Q?CiebAWfDE6z5t1DFoMH6qTsN4nOg0nSgZuzVNbdi/r0sT3vphoGlp+18PMti?=
 =?us-ascii?Q?ZnVRUZz68IMYhBUA22ltkoBuodumGm7n5ARqUA7XmeZCNRRBD/+vk4fT3bFP?=
 =?us-ascii?Q?xRUlsaseNCs1LyMq3NoBdt+5krWnhnKTSTW3Gtd3EbRN9sm0wENJV0QUXBUl?=
 =?us-ascii?Q?Bji2YR9Jp8Jps3dHRgWfhCGLHUhj7jqdizRPvxTAqVR3PKrYyJ0n2aqqwf/q?=
 =?us-ascii?Q?EAS0+0ECoYLm3F7CeMqkMQ4QEzpL/QfwPE/nAmTuIpxYoyeccu3oCgEaxI0V?=
 =?us-ascii?Q?wIaFg+ymSVbLb/vqPaauiVXaaXCrNaLzSFYOH6A8NqtGCdXkVo1tlkIeLU28?=
 =?us-ascii?Q?5Mdlu/HTSqccoaInpjAvKi/FjWWGaX7BJMO1O8NoyWEi26sDVAs8nejhRPlo?=
 =?us-ascii?Q?vPQ+PxLGGxCW7XIMi5oW7XO3GYLrELryzhDryoFRLC/bpkSZKoX3/sJKcJFJ?=
 =?us-ascii?Q?kFhskj43i4+h94Hk3qmU3LkWyZJyjDi6/lTBTB2LHaP2+nNsp2Uidlg+BKDl?=
 =?us-ascii?Q?mE64lWVsBplcAWzgfJHSEbHXo+O5TmMMX1mbhOUfM4+nEO9XcdLmII1czVOu?=
 =?us-ascii?Q?9xUxZF/Hj5//4MR1pe3WuFV+kU2xFDzTBsbx/n3sX8YlialpvBpaOLjEyzdK?=
 =?us-ascii?Q?0/o11a9gmLxMKrDro353e47VN7ftjZEEkMcneKgQObuB7DYe6rZhYrYEcywr?=
 =?us-ascii?Q?kS0yL52YkAHVijkzN0/ivjmcvuXhmSJKDC1uMunpqCwjowZQgps63DP7FXhx?=
 =?us-ascii?Q?na5FzEOSthjwq9xtxd/FBBUOW+Igl4tTq4pQR/40yGCz1RQGNG4d9oYH7dBT?=
 =?us-ascii?Q?bbVqlPHmeXmaNMXOW1J7DWWoX9QteMt8m+eLq6v9rFs/Nk0izuF4G7BOe315?=
 =?us-ascii?Q?Arc4z3B2CyrkOTvhKUU3hMrkMcvoqqfUaks4rq2Js1BEbdFjD6QfqcYkvie5?=
 =?us-ascii?Q?VNoQPJRfT9MQNZVQTYRMUrFNClGZxdZiQVYrPUo0X7ijsN51/nA09tGfLC01?=
 =?us-ascii?Q?KfVvaRLnAXxp2Em6+SmPIY0oso9JZ/KnLBnc3wF+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cd2ba3-8773-4526-6376-08dade81111d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 09:45:14.5476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tPjTX8eJ53Hzrf/fqbyE6GVK9uRxc4c3pXHP9s3xxZRXQt6ErTJKe3uMOhfh9+NHKeiGKSavstA2P9j5KhCjnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 09:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174577

Hi All,
=20
QA for yocto-4.2_M1.rc1 is completed. This is the full report for this rele=
ase: =20
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Friday, 9 December, 2022 3:39 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.2_M1.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.2_M1.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.2_M1.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 6709aedccbb2e7ddbb1b2e7e4893481a7b536436
> meta-agl: e2c31ebda224bf6813ff861df9a51e8fc46944e5
> meta-arm: 02b430d045b50d5e5cab9a52b786d1134ba17c19
> meta-aws: da36bf8bc3f5a1cbb9396e8d28559c422cd96412
> meta-intel: de59d48ad2ce88ebe331a8355e742fce7c3b428c
> meta-mingw: 4a066511a944ec946efa7a4571029c992cf0ae00
> meta-openembedded: 8c58f419c299fe3764482ebe4f366e25533ea23f
> meta-virtualization: cb5dfda6f6d862a575f029ee8ded0bc3db6bc766
> oecore: 96ff9baa8ead57504f40f362ed3a4aaa776d1b58
> poky: 4d19594b8bdacde6d809d3f2a25cff7c5a42295e
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

