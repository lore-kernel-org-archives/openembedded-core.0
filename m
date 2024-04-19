Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA1FC04FF8
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 01:44:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web10.10757.1713491086814608320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 18:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MGkzoo74;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713491087; x=1745027087;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7rB6QFJeO1TFTu9UUNUyAeMV+PSktYW5stN3pPOeoNo=;
  b=MGkzoo74kVNAqjlkXDU1AH8u2KK7n5y06xePytQ0gqnVB8YN9V+q1SEb
   +mUsS2uLcIM2G1cFOnpyaEbkpthOZLXhPEIkJIf+NsF7/vX/GZ3GVEmuV
   8syEhYataGuVR69UqwaKqLy1o+AKU9j5LIMFDUjEMmjxOzmQR2a3youxw
   MgNiGW551Ce/hFdmEpA2q/GbR9MM2a91TKgCegjy0kwoeFeTrbhtOhLG8
   x2D4VhVFLj0cb9tvyVarpWvOD6iLtN3vsCbMa0WrFepCpXS9LTg68DCty
   aZjaxztRWaG5lYyv8ui4DSNUlXEBmj3F7Xcrs27Tx982cm4PfpQeTHjl8
   Q==;
X-CSE-ConnectionGUID: xOFnCbD5RiSjl5t+gEvZBw==
X-CSE-MsgGUID: mTGKrztuQ929Mrjui4t1Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12911577"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12911577"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:44:47 -0700
X-CSE-ConnectionGUID: RBuoqucOSaCvNPTf+zYRog==
X-CSE-MsgGUID: 4d0Y0wcDT8OFRynRaqDz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23799723"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Apr 2024 18:44:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 18:44:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 18:44:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 18:44:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 18:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lN1nl6XXaAU1a7EfWK8qkY4ni4+5O6ILNMbE/8UYiDipNrY7LFtEEQU5WNiwA5tCH1sWAl+PGDJ7G0BvdxoSeZQ6kpU/tCWrmJGSvEa7Hll4hBJvt5hCBR/XYwAwk4KYKnI4aW1+sdTLSI1O9qPImeFySfo8KxhXkCdxqlhcAbXuszjr61qTgzltbO3qRz3Pn2ntEE1M/crKFHQIUrI9rBphalCENBqfZCush69K6haBWSIeJhZxEnRoqgJdrE5oRWYSKcxEYaume3UyNJTpzGVChKrGDD/wQdiN//zwjClpwUNhX8Ef4qcTNLPqfysodM42jmvgbQ9ffLJOI/q4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcXMwwL56SZl/F9aqduZqk1JL+Oq67WvRm+uRJsRXZU=;
 b=jKkYEwopE5T4UfRas66J0M1zwxV010c82EV8GznahJPQ+nq1SuEKAKAZgLpq3dgn3uNwpnxQaG2oat65bZH338kpi0gfE5CKb+tkuawIT3dLqIUhdaL3a/AMOV9I9CoyPmc7j1nPXJXnHeRDEfbSiveq0Hkc8ZI8KS3pnjP1OMk03B+zOdkpc/JEULfe5bSYW4AS5S0tnib34/qQ/7WiHrsIzT8RwNAenRpCZMi1srZuWtVI/cU9zfEO3Hi+56o86+M7n1rlE4H8hDqUSiA5gWbRaz7urwHs4x3uH6xyByMo3QbsIBWEo+uLmdXdZ7RHJg6n7AsicCepbabUcW0/cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 01:44:43 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61%4]) with mapi id 15.20.7452.046; Fri, 19 Apr 2024
 01:44:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.rc4)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.rc4)
Thread-Index: AQHake8XuyEQrDjR3EiaLK1lGvKvv7Fu0LZQ
Date: Fri, 19 Apr 2024 01:44:43 +0000
Message-ID: <DM4PR11MB7760A49AF8A5FD4FB855367AA10D2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018ef3b7ba30-02874709-13d0-4a8b-ac90-e3eff3a6bd60-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018ef3b7ba30-02874709-13d0-4a8b-ac90-e3eff3a6bd60-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DS0PR11MB7972:EE_
x-ms-office365-filtering-correlation-id: 1dc554af-8857-4878-26d9-08dc60124938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2qwh03xIQeRAoOZhunyIOMjrB+vvhOKDBnYdmEubsWUlp2GuPpKgVtuYtCjSo+2sDB+2qqvKjgipSSZpPHu/r2kOmWrSuiyYpN+Cog6pqEw/TJiCYooHecGXqFIBy6zO/m6m2BX5lXsO4cnb5IZmgdpYHdBDXI/gQIW25E39m+JSmRAA5XnULj7uyWB+Xepj+mVt+NtsmXrR6UTj+CKJ066iagcDqhSzFCCqAg+DEenFeBwIZxR5QA1vgcz3LryPLg42b5LlJ2evPqtjQX59ZNRmmx9xcUp6ca440LeCf+kGa2CSK2FGtc+wHpGpdg1jfPNfx3YUG+4NrOMB5kQGOPm0qI+V176Mqi/rMLbt9embWsfBUl8SGAEpVcrvgrWvBOIsq+h5lOnnMgjKvBpGptp/g3EJg0lPaLdhLPCcg7xRj/0D5EVJ+WbKnsKHNqvBF2lzFBaQRXy5U5PaoIsdPSd0x2OWCzvdn9Kao1iEO16434X6gBQmzvvjsstZa6q4A9DF8eiLkzaa2v+3KVHS4YQj2ZGzdeRmtk2qvOGyrxJLSoP+CJ2sp4xHKhd/MYFrnziHQJMCtCs+k/Wvm4aMrPwHtLTJDsvw0p3UyOiMulWrc6GI27ErrPQxA1Esq5BFzYXvneQhp/XjZtGvbCJ1yqN/7Q+sc/TitYDQf60nPvGQsy+ZS8QEVdSUIywpx8rj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lhDcKuQg6tfbabi4r5awutaX/VNhBT2xGGJGSyIRMJhO1L0Zjt3TZtBbrmJc?=
 =?us-ascii?Q?sDb6C0rv2F9wrBvvvjg/uMzpqCQ3VoZ4LXdibwAsZ7L3EWj7wmzBSl7GOp/L?=
 =?us-ascii?Q?CHGXsp5SVklCy4ok94k8FtxCWz7QfKvVi5lDXJMLOT11+QMgjMFAJ9DcSYxn?=
 =?us-ascii?Q?hd5f26xN3QDArNcKZYaKnns7GkPWYkGPNGHpqDSDxC9QEX6BZ4QQYozImYNw?=
 =?us-ascii?Q?0zWHcySxvVkaiG5lRB5ewL9qckCLAPb/ZwyO52s2l34KPXcEo0mYpomidau0?=
 =?us-ascii?Q?GwIk5mI0Oq20Ge4sRhsOvMBAci1HAb1rUA0FhnV7H+jMCUHdklpK8lNxPWJ4?=
 =?us-ascii?Q?S6juAYMSt9rpl7Z2gf8J60pfKv5ESN7NJGK8Dfrqt1Vy7vCNHPQHnfgGpSHl?=
 =?us-ascii?Q?WuNG1bq2f5vlYnab7D3M1lImRWKRlpqYkAAk+KmwKgwznuzGcKfcu8joUdI/?=
 =?us-ascii?Q?rRGnhDqxApV0BhlaPaKLKoKgQNvJI06V6aHkayKAvnGBEVFVTbFs08x+QK/z?=
 =?us-ascii?Q?tJjvdv8up2BE+bLdhMfjzXpEOb/3J7uD27UZWQORCNaP3mvm0sw7ftbnMKau?=
 =?us-ascii?Q?wSIl3gFA7eEbbhVJ++R+LxhQq3vJg3r4YARGDRxcdqaOEKp+HfWXCRCpuLCV?=
 =?us-ascii?Q?34WXLLVcVdlTuyKgn45yLmJG72qgJVlApWf0BliMeOE+3KUHjpw1I1wKEDmX?=
 =?us-ascii?Q?jq7Q2hycoFjFGXm9sBEqsAtIUz4Sron2P0uHbZcOwKTpQXRsyMSS9N4xiO2h?=
 =?us-ascii?Q?ZVJQ6lr+VApxrfo1JhwYF/MAtGy8HZtfe5/foEHCQ4mIbuGBBzwl+ogREn+I?=
 =?us-ascii?Q?aWOpJ9Lo9ftODs3n2wrMZpHsdTwAYX8z+Cq+v9m2UkywcIvWgw27X1OLqRmU?=
 =?us-ascii?Q?A1dqxuiVF7mpTjdYdchrSZJBLmrqxSScAYFsg6A+bearF0FCrI3KgMp7fpLa?=
 =?us-ascii?Q?7mlhP/aa6JtmRGqIlXyvE88wXnjthaTk/1Zf904ZnEBxGLPQDxb1gQcy6TNo?=
 =?us-ascii?Q?OCMK9Iy1TrxUdXWYssH3IkyjWfK5uYGty8gDJP1i3gyB4jwPYsi5ssbBigJw?=
 =?us-ascii?Q?L/UbVC1lyPeTx7uK0d3UgMnGPqGcl3IZclqgSWcNxOaoHgE1cIZEEJlIlvzF?=
 =?us-ascii?Q?l/C3+h1oJXfQBixJNIe53nahLuExp17YuzWoCvLtnxqdJSw8Vx4tnROWPybJ?=
 =?us-ascii?Q?VRscgSwK/Sj4qlzcKGvXlpN2TJXH330bFV+CqTKSfya2cH4Q1eFOPrrjJUw4?=
 =?us-ascii?Q?M60IRfLM0M/UJi6uFsq/07eN0axpkUiS0e8g1GwjPXpNe9H7qrBT/KhvJSvp?=
 =?us-ascii?Q?n7LMz9+OG8aozzXp/Ucap6jyixBzfKs0nQpDPqNlCb7yXtWiRCiZoxI+6AVv?=
 =?us-ascii?Q?cyGBt+4uoetEf8gnlIwaCySu8sjwqiZiqVcDA+ndouuwTiQyuXbkc2kuMmNr?=
 =?us-ascii?Q?5eyVdBwZzrmGTo1KlAja5dk7KgzgBY4Y2SrIInPUSG7t+2Yl3nYM9Xq3N+kg?=
 =?us-ascii?Q?ZeEjGqkh/HCJxk/pujc9kmdLDx+01yXUFpoWlxKsCxC+qPW8TnIN7Z+B2rzX?=
 =?us-ascii?Q?mtEJBTolijbNyTp25LeF2UBv5HFCaY+8Nix/CkMN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc554af-8857-4878-26d9-08dc60124938
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 01:44:43.3507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qJIJuyDoLMSYFwNoc5eKzNZCT4IUUyEBWARZWSl09YfVGRckvkASWuWerX1aPNWm4qqqOiMF6PlJuWa0V/hByg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 01:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198527

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.rc4 =
instead of 5.0.rc2. We are planning to execute following tests for this cyc=
le:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion next Wednesday, 24 April.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, April 19, 2024 8:18 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.rc4)
>=20
>=20
>     A build flagged for QA (yocto-5.0.rc4) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.rc4
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6823
>=20
>     Build hash information:
>=20
>     bitbake: c86466d51e8ff14e57a734c1eec5bb651fdc73ef
> meta-agl: d5420276a2d6bf1fbc4a948e4500744608c3a39d
> meta-arm: 80f3b85bbd4c459a7c58afa754b40a89c2c9c102
> meta-aws: 216c095de9d546c141a90017a91a3ccb226de754
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-intel: 0093d9f2eaf97063c81bc73736ebe7c29a69200f
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 24044fd3a010dba91f22e3b6af7788529f622795
> meta-virtualization: b7e77b69d309d8ee985720e88b19b6e9cf03fe63
> oecore: b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277
> poky: fb91a49387cfb0c8d48303bb3354325ba2a05587
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
> View/Reply Online (#420): https://lists.yoctoproject.org/g/qa-build-
> notification/message/420
> Mute This Topic: https://lists.yoctoproject.org/mt/105609427/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


