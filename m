Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9D4C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 09:35:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.117744.1699522543421629685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 01:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FKK38BI0;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699522543; x=1731058543;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vL456/cGjfXwV+zjmyslH3fudsMvo00CAUjcqaA3vGw=;
  b=FKK38BI00JZbUADJN2o3505p0wgaQzOztpVWY2NtKhHZXg8gPeOlj8FL
   ZItjJZLmk8NZ4wLh9p4ICVVrGCb1+nUTOVMF+0dVgOmj4h3YoJ9Q1eotM
   SGwDMHfxxfq6bo0wHOUPi58VEGHPqZKmT/6xUqVWsX+q4Zpq5hA+Cree7
   B3H1fTRAroawfg8B+K9fh9GVPsQWaUeZDfS8Ua9I0QO+cllz8MY/yr1Tu
   zFEviTDZMZIgHM0NOR/7D1E6O7EwGtEs0hTHNLVMlKQnFZvHdV/3wYNrS
   bT8bYnvPgLMXm7q6m/4vEpUEAPfPqbKYoopEj9T3HMMusQHwk5b5iiklo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="476181238"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="476181238"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 01:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="713239707"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="713239707"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Nov 2023 01:35:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 01:35:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 01:35:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 01:35:41 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 01:35:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9KqKWU9JvTRlKZvwFsI6R1TKbz10D6QDOorLO0XlOOHvJu79zsnowNt/It/ydyvPGlWr/1ugESJs4RG8D+BTobppxoUxwvhRBHdNfjAb9uRJF2JnV9nSPuzF9asWUN58p5elAx1oQ3sWS1hCJ5nLkEVHR0Nbgg/Qp44IzMsVJ610DoeCL/fkc04lcBnn/uNxL1mshw4Ix8Wgh8AgaandcArRAp8ugBKzO7rbGIOfE7M3qZhIcYhjzX1ZaGbDPZpxqZw+pEYtcC2XiDKtvKxavsyV079q3T3RcWwLmls8+X+ZiYaA8qoCxy8LBm1C2p5Sydzxjk32uYO795oTatQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jso2sNwVfExtxYEPPumsCVxybAyJYB0HCpZVpD0ToDs=;
 b=bdC73qeOTgT1PVlC9Z14XJmkQO31FIixSaeybN64Ve8D/2Sgb0T1A14R8CTN2QVRGTA0Aqyr5XxvhdGQohKG/WZTDdTpe2onvMqxgsaoaMoVMl2+B+QrVV3fgAt3C+lJpV5yW601XnsD52akJuDU6XYo4O6eGQ6uCsYNtDV0jCXiq86YkBXpxass5pj21r43wGG+a7bdCGlh+OUMpzzuNp56iGSlW0ZdmZM+GNLioyQtaJIbdaOdLh8Cn6OvSP9eah5Xv+t9AEwjw/uTltyR87qcMWqKVHvPFjAzgdPODCFp4R7RvAJXcTTaZZ4oU6MnkdVR354qOfOHO/X0XApNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 09:35:34 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6954.029; Thu, 9 Nov 2023
 09:35:34 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.14.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.14.rc1)
Thread-Index: AQHaDuK4YSGtStUTFkSrHRKmwyMVD7Bxwf8g
Date: Thu, 9 Nov 2023 09:35:33 +0000
Message-ID: <BY5PR11MB415240B80EEAE123558DCE6AA1AFA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b98e13019-57bc23d2-d205-47de-bd0b-d04b00fe895a-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b98e13019-57bc23d2-d205-47de-bd0b-d04b00fe895a-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|MN2PR11MB4533:EE_
x-ms-office365-filtering-correlation-id: fe92b166-16ed-48ca-02ae-08dbe10738f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CqiT8FSiUwMnWofgZv1c0NnHz069Za4oCsFmwd8rZxlNmDczs9FhQLP6N2UMh89Ww92ByNWDBoBiYfAmiDV1TgSCdTxfiAM/B48MO8CLx7iDHG8GWQodGdfPMR9ioLJfL3Dq0ogNP3wJXNW77F+KgvYW1M8qZdEs+RoVyC1qG9j8d3SryoeHw04ssgUbT0tA7MsFTV6oAtFhjSF3rs3mw9HyTzHGBlpT5CVW6tEkR0CDZ6icpFB51gXFs3TNcoDvrEgi0h+HgW50ojOkWGkt1GMXrclj8eqd1exOZ//OzthzUHPVa3DSRU7lQDTmdthXOnUfL6flGI1lRWTxueqp99aGBfCx8HT5M7aUs/JGLEPuORBsBpI4rL7CwcGJqJYS6vNfsKoi2RpjVozY+XDNXpnRG6/to1CJtWOo2mWZRkH7uJDdRMVyM67Dvx4Oq5hR0nG6sUKeFASJ9Nafw74uTQLFBNE2x4Gu8Sj6tqsmgV0EOm49wWaF7q5HX++KYg3OFhe086GZBUoVqQAh0rmxeqLtz4T1g8UfuBT5aEfT6rybOUG/FXhQlIB9+K2+KPhnfNXySCJZNvCYI5R7rOeaetT7UWEFvs0jhu29cjIkGTOdSfGUVk1aV3DH6egrHHcQbzdGm21LhFtR5R5jCwANTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(5660300002)(71200400001)(53546011)(7696005)(15650500001)(478600001)(52536014)(83380400001)(2906002)(8936002)(8676002)(41300700001)(82960400001)(6506007)(86362001)(66556008)(66476007)(66946007)(64756008)(966005)(66446008)(9686003)(26005)(316002)(122000001)(76116006)(110136005)(38100700002)(33656002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nyPV975qFtnRXvOe9vNfODwEVhQQE7hSlz9m/g2CarEHYuEbpQWYmj2DFvnl?=
 =?us-ascii?Q?fq7C4Djd5ZUJ5pXtCDi1He6JB7Z1JlP1nJFJrJ/rg6L7vG0Mfwo1RS5UaNvf?=
 =?us-ascii?Q?uoRjYrc1dHLR1eIRV/hS+X5jPV9XlsBf2kvw0RuyJsg/RoNXDOt6F95JMpbv?=
 =?us-ascii?Q?monl02H07FOk4/fsK5uV39USyl81hHxPKIQivadD9ba4YVmHF+3A0SOjQTfl?=
 =?us-ascii?Q?wN286IKSkEjHpg5fTM3aQ8xVxwiyDbP2o0cpObaTz1UpnUSzeozOFtaaA5HA?=
 =?us-ascii?Q?+BTYYVPr8D2SEsL+cfVGl8W53+iRDAopfnMzKI5qnevXIl1VfFAzvBd8SRZF?=
 =?us-ascii?Q?T6vTFuDHNxnwFBNOX9qfHMa9hjKHkr8xeImv4e2L0QDqbSrkfeRkWEiTRMu8?=
 =?us-ascii?Q?nfOQdgSZCgL9y2am1zH10OrFiH3ePem0eMbnS2O/KfbBouG+vlCZXCbb5BVu?=
 =?us-ascii?Q?AoszdNFulhUHDp594k2GZPp0n+xFRZH3OZywa5qMJTTaer5/r0gY2D9IohZi?=
 =?us-ascii?Q?l9WSnB4GI0aZwpHwNv84zC8VlWgBvynWht0dL89aXHz4H6j3tsyk3ZyIjYpr?=
 =?us-ascii?Q?enuk1c4coOwXnLPn+JCWvCvxv/khb3s+8xCuZoKXb+3MFqeF5A/ubf51rMWy?=
 =?us-ascii?Q?4KzQtYhG3m8bOcI7sZHRUZeD8Ax6X5RNDe+4PBKjyUi9dMbND/K0OjFVCy05?=
 =?us-ascii?Q?4LHTv561ikFG3Ioqw9zzt2GXDQ3tJni7HPIcsDfqhr7BMVcmHKYVvmrtCrGf?=
 =?us-ascii?Q?2uAOVM6qTz+L13BVHmhAF+5j/CFEW+GyUmBXug2bGjTVcMNKoTKa0ntBn0P9?=
 =?us-ascii?Q?z6NgbpVqhNMQN5659y22PoP/9POiWvU/lEAEDOBDqWozc6WaoD/3b/ielVN4?=
 =?us-ascii?Q?pwM8kxbnDsVmC8Bx3aDjC+D91IwM7oHNh0NxbVYs8/rsanlQb+w9WSdiXXZ+?=
 =?us-ascii?Q?wNypQW5sETD62So7d5vst8xeRHzDDUSSL0GlWgUlLTOlQqlE7A2Kc63LbboE?=
 =?us-ascii?Q?FIP713nixSsvZLGjzM9uTZlb0ZB1t33kKtRG0ActfBxkxmEWYOwr8mdc2IWD?=
 =?us-ascii?Q?w+sr4u0/2dFLvKb+iP0PTKPLs6ORlsj9u7JbwOO2v6SFc3JxRgSTn7dnVgC+?=
 =?us-ascii?Q?oRls+S4Pmfi3xRP2+EwOO7H9cam4a7TPmQkVEB1ksE7lPzKJgQvgw8IQLCNh?=
 =?us-ascii?Q?Zxzdj4oX22pZ7Sh3J2S88vkpAQ8TnTvWVEbCnfm4fXsm5XN5QkITruA11NqP?=
 =?us-ascii?Q?Sbi2yRc2EDQzb0An0xUjiqZoBh5wj8XKFdmRy5QHEdYhs6X0ZyNy0ht6ub9d?=
 =?us-ascii?Q?hnzrRVh9M990yyhUa8tQVWvRVsLZHdm27tQ91tmzmlzh9SRbsbohoPWfbrgi?=
 =?us-ascii?Q?HHNu26+UzzCZazgUgdsslpqZNYkRKIoA9jQkHQp//2skjsgg2YMpE3zvzU25?=
 =?us-ascii?Q?LRPlSsqwFRMWdCebWPVhyWle5ar+skLMdB+MDrgryE7kTHKFBh163IxeFcfc?=
 =?us-ascii?Q?ekh0PrzhtM2b6/6A172zrgxvv41S5QlYST5TG/C8X97AWHshucp5nU+LSqjC?=
 =?us-ascii?Q?LwlSHLjH9CliA0NNKtTYJxbI/ojrVsjvvl/8Uso9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92b166-16ed-48ca-02ae-08dbe10738f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 09:35:33.9117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfphB9NlIiXa76nb6TakKzSvliqs4WvOYXSS4PAiiJSwayGzIylpzbBmD+EG3fMI0dGg/mGUESEXI8/Nt1g/og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 09:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190379

Hi All,
=20
QA for yocto-4.0.14.rc1 is completed. This is the full report for this rele=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, November 4, 2023 1:50 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.14.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.14.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.14.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6132
>=20
> Build hash information:
>=20
> bitbake: 6c1ffa9091d0c53a100e8c8c15122d28642034bd
> meta-agl: 09890bc1ce3d1836f0e35fbae7713f54d70a72ae
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: 408f9331156ec101014cf065314d3b90e79e6814
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 3f0115e9e59f94af54b74838f4f33339ea7584ae
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 79a6f60dabad9e5b0e041efa91379447ef030482
> meta-virtualization: 2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07
> oecore: 0eb8e67aa6833df0cde29833568a70e65c21d7e5
> poky: d8d6d921fad14b82167d9f031d4fca06b5e01883
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

