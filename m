Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08882C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 09:48:51 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.129294.1671097722983052554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 01:48:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=kZI0kupa;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671097722; x=1702633722;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=B7DlWfid0zDp52c+XJemGsN+hZVrfqJ2rXXTonN3NOo=;
  b=kZI0kupa1rjx4T/70WGEiOE+k68QynJXbq8pUCio/aqFwdxvqlSDG6gV
   nmONVlFLSWpsGbIwpubHggDJowe8h2vZdJeH13u7ZuhabEgvZ7eAbFB46
   2iLGBT1k/88IW4BKDYUwBitXFu0UBBRTlezTDAgnkqkAGMNNY2gc0MwGA
   Bui1TZIdmJs87JwpLClReESxswzgGVq7VRkQEt+8dNGtXGJ7E9LF0vrxP
   uWTLKZmybSt7ZDSht369QMXRYPlWPng7Ie5ntHpGaIYO8e3+TOug36ydO
   pDuFtMiGg1RRGAl4G/dpZnhAwgNmo8of62zDW7B8TMaKnKwgn2KvLA2Fj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="316274373"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="316274373"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 01:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="649315487"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="649315487"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2022 01:48:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 01:48:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 15 Dec 2022 01:48:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 15 Dec 2022 01:48:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 15 Dec 2022 01:48:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+Dw8LM1tcP2eZ1tNSqgfn3M5i9Xaa8EIDm5ob2n7+/DHvBbIKEKrHWAbY1Q+PWf3E2T8iFn69eIsnfAmUHRopt7pxChw+y4k2peyv7+0OMav2TihS2loEVMUG9+nn2xPpzm3BMbU4QLRZ4IxnIzUEOsKJGAfl5JZcoy4WKrqvDMvf+i+YU17B4Hf0LBc35SemPzeUcnFMDbnSVlzsqj3xWUXk/gBwOkSEYII8K1o9bcrt2sTMm67R8tnFuyRI+8r6nnB/L7qw9nxd196hTYxoGVTNKEjDoOvp4NYHeGuFp3vfTZcvpVb49J/T5tkqTbKOVEy8GLb4+OxxE95Kvryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Na5J3BUnrS/+K2XEtqPRvydU9Dpk53P89Pk+AS4bMXY=;
 b=CA5ilGTZYSLEB+9ft8fAgYSoybOSVgQaoXO19tRl5ByNN0kajvbrYnHTOtouPAGjZbOs0dXx31bJIoM0JuvkVGyo7V2AetE/jP5uVW7/2njoi27THVpw4MFcqXYzgOHxu9n9ozKVg3QVGoIgNjNJilsm1oBaC8a9tGFbm7owxXB9ACMq46EGK7F6yK7QKlg7IhXoAGtilLEq17fMS3XoaIN4Mswxl08jr74GyMjoKtDwxNhL2xeVQRBGwO02MbzVnqb7Rdt/rDIIrIz2JGSwfBE1v1SJZXPAYEcHxdUn3HgkIPUSX/xRKw4O2sJVcpAL0u0zTe+NvOymS4agU+fNRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 09:48:38 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%3]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 09:48:38 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "<yocto@lists.yoctoproject.org>"
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.6.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.6.rc1)
Thread-Index: AQHZD0hkEl11XS3XMkCseMyMTIOpja5utapA
Date: Thu, 15 Dec 2022 09:48:38 +0000
Message-ID: <BY5PR11MB4152612186925AAC3E9F7876A1E19@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101850dc2bb84-1a5e1940-c1ed-4638-9517-f86ee55e6b5d-000000@us-west-2.amazonses.com>
In-Reply-To: <010101850dc2bb84-1a5e1940-c1ed-4638-9517-f86ee55e6b5d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|MW4PR11MB6763:EE_
x-ms-office365-filtering-correlation-id: 7c0d00b6-fc09-4783-b2e6-08dade818ad9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i8IqTPcJJfjuSdEVF2FF0sZTzLwHzCmWAr0vDG4xrWEiiEt146OuIOBePtBSFOrRz8IG61+UVnhqa36f5BLV833MxoEB/Q2WhUtXcgDheJk7SalEqXJPWdHlWXOFlLF1L5crGjWAZiCervrhTrVvBfdXrzFAJso6rka9+bmUAhJsAa2sgcIUXsnFz3PK7Xly1oVpoREs/N9cUieP3JTJUcuAbZIrU5dftnlSSRwSn5sZRQkBvzOkoxAG9yRW6puoqHMu+0RqdUM1WSefcfZKiDMKsnc8eSQLM0VrQqOGi/s+F07YLYRCUePLEfBG5vRhjovBs7RRMFHxL7Idh1JexJBbaNDo7yilwOhwgIx1gJP8bN4ckQ29lJa0bJGzWzN3vZ5RZn2UYyExDLvHYd3OLtIbXl4vNa6HPidT0dE6czuk2T8XE2ujqGWkiEzmbgyb6C9IuzkuJV178aKZCmKP/IZZDVOJQDu8+C09aijQWin04Nlg+vuCgv2mrZvCX+fgR/8txOtC/astTY6OulYM9MxCir8JwOimXrQBXYg6W1dFNRXpLuFqM7I2PAmcHYr3cDF01NMug3fwiJLxOaFUg54wO9517tPNx25jadw8GgMfoR0RH1JLffkIfCStLewnEgvHLO4Ju/32do2sA/jHx3MjUT1Z8eVoMXA3i65CGJSgVyHHbjzIQKlsuRAboN/vMnzEd7IwPoV/jyIiJDF9kSUk6XItIRVQAtKyDjCt405PXg7FXLIJkfvsMh6V4c1IJIuR9aDKihcs36cCrQbjMG83SgwCUjSi8iGfX9d8LbI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(41300700001)(52536014)(5660300002)(8676002)(38070700005)(66946007)(64756008)(66556008)(66476007)(110136005)(76116006)(66446008)(86362001)(15650500001)(2906002)(316002)(38100700002)(53546011)(122000001)(186003)(82960400001)(6506007)(7696005)(9686003)(26005)(71200400001)(83380400001)(66899015)(8936002)(55016003)(33656002)(966005)(478600001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OX64Eyi/UQgV2Hz14a83csvxAmsrL8G16O0ZRMI2AcHTnk4V9Hq4avKnmMra?=
 =?us-ascii?Q?71xXAtJEnuZ50DuOT2Jk4YPzLye6t5myIeH1dFf3B/O2Ni3ZnRE/GcU/37il?=
 =?us-ascii?Q?ujmS91DkSDzbNe+NeuqzmALfDoYjHA8p9JnjB7bSRiDNm/QVTZUiq5UOORvU?=
 =?us-ascii?Q?bacAFseNEZsPywJxp9un0ud11UtfjCN50vPVV/f84UXhXAOten9EQHyB8itE?=
 =?us-ascii?Q?/+Mkywyn0Vp1CV2tnKMIM43reeRAhUR3FT7HfGN6hfN6Rl3SfanUQ8kdmWxI?=
 =?us-ascii?Q?J89k7DEvPoSkqiuYegCawTS514ZqHxFPqawZvcVheZOHTGsFlHLTJdG2mry1?=
 =?us-ascii?Q?oSyY6RYP/Rn73PJciI9kzLW+1Wex6KUI64G00lcpxshdAoG3pLvtQ/s3xtml?=
 =?us-ascii?Q?/q2GyTmrAv82AEshngrBiNELp289dAefE9E6pbL+vtZBRZEOlIvEyk/Up/yj?=
 =?us-ascii?Q?pIDqcAtbxWQ2LLdp39Cz6bkR84rZTYdzqkphlGSQfSZ2tCPbgzxNMvbZUSKt?=
 =?us-ascii?Q?nj4w2bznt9ZtZmhqUnFbJSbEjZG2lXHtsDPJb71BcewtooQ01QkQnB+moqpO?=
 =?us-ascii?Q?eqKnzBUn/vXEbpOApJVYX7kkywBunV0CEfWDxOLkLOk9zyrYYjwQWMQNo2ct?=
 =?us-ascii?Q?lOyBY0Big7un9hcCg4AbI/3uQXUtHBWH1pD18T85j2aNhtqf0kRO9Z0xA43h?=
 =?us-ascii?Q?JZU+oV7ZPJIm+mzA/bbmTD6yLOUn7IJWNw7m2vLoRU6vslQknGbV9NrwmXcD?=
 =?us-ascii?Q?Hy/3bSGf2D2P74uEql/ByBqAC9M0dZetYF3KI7uweC8VzaTs2s1b/k2msgmo?=
 =?us-ascii?Q?xtNRzujqGypeiX1OzyZC76v0ad1fBItLSWLGikOG/CFHC1Pl/VrVq160sYIQ?=
 =?us-ascii?Q?VjsCQX4m0/aZpvvP8Lw53yj3LixJtcZcUhgUeAoKmvYCUKWglMrbyMourhFD?=
 =?us-ascii?Q?4cYc8z4pfFr0wNynTvoY39fZv1SwTFerJpCuY8gNN1aMQLELu+UY3EJBO9IC?=
 =?us-ascii?Q?8G2I7L5TlmV6WYmK8KBcyNDeX4ueDG4CjEFOsKKAx29620TH96uDAbKvmMXU?=
 =?us-ascii?Q?1IlzLXzSAHFpt6wSkgAwKgH1qDZaaygmxRK29wVa0rUNzba7Jxsf0IAS6aFD?=
 =?us-ascii?Q?ToKWuBLNoQ2r6kCzf02wqGnVEBe4ucxUFhpX+3nncmbsljWR0MS241SJ3jTZ?=
 =?us-ascii?Q?EjbSlw9udDoe/exnbfKXPaJpJNpIRuwim8Lc3EB9VjwY9CO2vKDUfYVGU80w?=
 =?us-ascii?Q?BoL/n2Z5VlxCairKMlXg4AO770szE7ieIB3yhfnUAp2Lhl4QbBmXJ6hV/PdU?=
 =?us-ascii?Q?7tLWj2U21CV+3Rl1A2r2qhZYYNECcexKfIP4ih/suMGR6PccRmjboAzgMp14?=
 =?us-ascii?Q?dhK6If1wrk4Gv8q6yBr9DMaU8Mb99WuiKawEI+18LNL7VdCajIaw/wvhX/K4?=
 =?us-ascii?Q?9NtFgRfuf7BcKjYZi0JB8Bq3yET29WI8TjGRQOn9GTObrnUBnP5hwd9xPXDg?=
 =?us-ascii?Q?rP3lid3sBtcDDc+pgS9LtWchkkG1WOEErhznzwAqMlqDVeWpjtEenDrCRPma?=
 =?us-ascii?Q?yaoq9bSJPeyhwIYbkU9myyDqRWpidiNlRAPwCP4U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0d00b6-fc09-4783-b2e6-08dade818ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2022 09:48:38.7860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9+ameXG03paRcVLaO5/hFgTg0hMcCuWp6xzc/nPxAvWnrwCoYseILDMQtu4wih6axljQqvNFo85TEv3kHfI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 09:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174578

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.6.rc=
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
ETA for completion next Tuesday, December 20.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 14 December, 2022 7:12 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.6.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.6.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.6.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 7e268c107bb0240d583d2c34e24a71e373382509
> meta-agl: 5e3a4f5fa0e9adeae54a2a47d1daa80c64c7363a
> meta-arm: 67578fcfcd8ee8efcaef67ed7db1dfd55105872e
> meta-aws: 09db18354cfe358e38913754d24b71685f2a3ed3
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f529e0594a784546926e89ce8e78385e00d0b0a9
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 50d4a8d2a983a68383ef1ffec2c8e21adf0c1a79
> meta-virtualization: a0d0f4ff48f874703d9e24a5d969d816b524c8b8
> oecore: 45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2
> poky: c4e08719a782fd4119eaf643907b80cebf57f88f
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
> View/Reply Online (#204): https://lists.yoctoproject.org/g/qa-build-
> notification/message/204
> Mute This Topic: https://lists.yoctoproject.org/mt/95656394/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


