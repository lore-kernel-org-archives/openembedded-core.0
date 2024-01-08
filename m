Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F20CC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 04:07:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.32683.1704686860412386136
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 20:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EKsJGUjp;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704686861; x=1736222861;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4w6EwZJyVdgRJNm8yIpg3VJIo8WHyjPUP5bvbo6b0o0=;
  b=EKsJGUjpPSD8mH5FQiaz/jd5ZkP5a3sHHwiwBMnmsZ26NgR8CULT0DXa
   XC2/77wkFX1G8hJLTS9GZL67IdBO//aP4vUgjFI2p3rfNGB9KI+ULjcFv
   mYSdZwWTfBGlxF6lc9KeXHnzu9LAPcencM60fximVmd5g0pS5F5x2Em8O
   yrfMQjsovnPZGHOfeqzP+dIgUUIuynePCcb5BCpLWWGQwpEgkdd6BMvZF
   3kQzULu/GVUYDCQoAx+lYmSdQslTDVi/K5Ws2zugmHzO8fXVx/nzLj5Yo
   FSHWRBRvgA92wmi/e2CAEvQAmq9syt0fRu5injAznmrNATDLsCApkKPe4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="16388479"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="16388479"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 20:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="924741299"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="924741299"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 20:07:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 20:07:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 20:07:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 20:07:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpBQNgUnyEApdus6y5RAXaWa9yQWq5518W1QiT6XzimzdYc8ZA3ME41+bP09WF1ph5FTypTtX6QhXmUBrvVUoliQDLOSnXUsVkwh5eHXYL5KLOFklUjnn7zzdb0XB50SAN+rC37xI/FF8/SS3td3LR9f5nZg+7zxk/3Hf+Nr4AYCSCgR0p6Srk/EG3PU+pm6Y0H8LIciz3BbBeJny4UBlZoRtRDgMJChHg761dH0vPKDW06x1P0g2IqLJxAPH4Jb7dEqitQdf9TyBbyNtwhiCNXJ4bUNvehydsRQnknVnyeOHkPmTQ27CKwPcbTWcxVE8dhHlD3Gzy7co2tM/tVEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7U6lzKQ+HHo1oohHKb2qJhuEJgwSgg8QEPOMVe1m/Q=;
 b=F85ezxb4fR8KHZbgLOnjJtBtOkUV3p+2scX+zDS9IkNV5BVB69DFzfy9JRC/OXqUgmoUYvQLMtkKc/zg4H+Me24Gr4j5Yxs5NWgz/SBP/a1zpjp2OAX3thKw6mctOzoxroRmn464SkD25pVRQ+LkIbX1IdZVp0yvAR9MwG66YICpX6EjYa4pH/Q5zCeoFo3YZr/iV5SOYj0zPM4op1TrLtoDe2PE++XWQbOv0fG6pDDEqU8+UqMDk9YNiCCI6fAmVM+7mqVCoSLq2ldO1HyP1tV13Na1MQnyWA58otT6nn2t8RDbLVmmQtDYMZ0HE31G5cbi9Rl8cawiI3/IM25nWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 04:07:31 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 04:07:31 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.2.rc1)
Thread-Index: AQHaP7aVqORo2bcwf0aJy0EFUersvbDPUGcQ
Date: Mon, 8 Jan 2024 04:07:31 +0000
Message-ID: <BY5PR11MB4152FAC2A8F0163A08314CCEA16B2@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018cd8df6342-36454e00-32a1-4f54-b7d2-47db56f288e9-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018cd8df6342-36454e00-32a1-4f54-b7d2-47db56f288e9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA0PR11MB4767:EE_
x-ms-office365-filtering-correlation-id: d979effa-56f0-4787-e4e8-08dc0fff561e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ie3LuepSc3T+n7I6ZRZEfDFuJpKMyV5LPvTAKBVaokekEr8jR7OSjQrGnLylfxnhOBDQS1SFjAuFLIlfdMB6ZizVgobCJX9+u2T9oZ7A6O+mN9KnKEBYqGkNVIzePAvBnd+b0PkZKt8kencd72dcBOl+z66KxO7k73IIGEwSuE/AbMO+tXjgGfVpGSyah+2dj49ZDlRJVk4rEckLLO2jWSq3FJBc18d+YydEwsBYSJlv6+DR7OV41OyDD/JOHQ+2fgBg3m1T7eVVyZsVpkcbqVSXgu7TyNvNevucbut6CkygvCCikA3G6/MdeoN90eRsaaRncKAGqdfDKkHwcrrmg3C8fjzQJb6A75CjrqaaNG3Bf29nICaurKoP9liOQ1lEO2C4phNPUU4CsWZIwrhkhlDxrAVTeHcvp1cT2xm5ySYBxfDHiFlKbj52yHKe2nlNtqHAVWkouAUYzjgiCPz24CIJSoczRLTrWj2U323gq7sXZiAxFPcTg5/SuOBpoR9+cqT37S8KBMcg7OYEyTAKclOHzfWXCmpKEvVhu8W/QiIUx/dPpwOsx95/tU2T1OmL5FIIxPxTlLbrw3ilSB1fv0BsOO70LWzMGpfqS/QrLro=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(86362001)(33656002)(82960400001)(38100700002)(122000001)(83380400001)(55016003)(38070700009)(26005)(6506007)(966005)(9686003)(7696005)(53546011)(478600001)(71200400001)(66556008)(66476007)(66946007)(76116006)(110136005)(316002)(66446008)(64756008)(8936002)(8676002)(5660300002)(52536014)(15650500001)(2906002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rKHJwvLSjmTf5uo+13ZljP2M78Ej11Y9bd15Pb4ary+7H3aUxQbC/iHpUT9S?=
 =?us-ascii?Q?JAc4fFxgevTebyZf4jf3YVI1DlWM80FnsbcK0WamEQuxsmpeZwBgtBYsACK8?=
 =?us-ascii?Q?BHxt4rGO+4a4uMqsm+PyCpdh6kraNxY3DoiK77lZuOIELF/UqkzvQ7M8G1kb?=
 =?us-ascii?Q?rB9FfR3jkRAXuew5AGFOCr44JpC25hNw7kaKlQneq+o7N1XUToOG5WKj6vMt?=
 =?us-ascii?Q?f/vB4q1QM1yTxdkUb9wfN22f31ZRDr+VuKmm2oySFUEzKwWzX7hqammC/bfO?=
 =?us-ascii?Q?dNRtdXIX10T7+Zml+FmZnkriX+rqg95gqM70ln4cyLdeB+SK5z1rbVYNTzli?=
 =?us-ascii?Q?cGJDG0YO4rMpKCMXCE3aFdGyPChnUKKDfdGkOHoVAud6Tkm1PkMdSMByVS9f?=
 =?us-ascii?Q?ItO7ABqsHS1fuabzubKA1O5L5Ge7DV3CfMwVv8UvIoSDKpdrUVNTs3fKheNQ?=
 =?us-ascii?Q?AJdXlWks9dIribh9rlErBYfxdNxiM6pI6F1/Gt1V7E7PeJdNeo7DdL2bv3LO?=
 =?us-ascii?Q?vW72FcUhG+hw8paG9JeUTSpAS46YSS6R6jdjWR9+rLU5vbqjVjVOaJqmo8XR?=
 =?us-ascii?Q?OH+sdaN182uiPpbdB4LUyKKIczjp8Brel65ikNHE8GwY/chLoAfe8SIdQ/pT?=
 =?us-ascii?Q?F5rhAkPcUNl2QW5zfY7yPY0c6JwR14G1Oy6uGloRtHMakdFq6ysO2NEoX3Q1?=
 =?us-ascii?Q?zxZAHEg/dE5ryZI3/+3Li8EkAl8Ci1K6KhL6j3JR68iSBg0f87Ajc+pcF58d?=
 =?us-ascii?Q?EuxQbsW0+zBqbqkUJnu/ROFFNttLa0JQGHvXNwXjYyQ1VqD1GxnXXg3cfx3A?=
 =?us-ascii?Q?gwengOcxVEKTd3okR7X7HdYh6CGacyOtkI1QEn3JzHf062nAtiYjcM0LmlZc?=
 =?us-ascii?Q?MKnJFF/z1Br6gLQy3+IptwzInvsyypFxM0bTK4Ulltjb3CtaRsh9FcSMXH+H?=
 =?us-ascii?Q?t35pZrrl/zoHcoTF2etcjOjycj9fdSuWRAZIin8Eje+7RbM8ocJfu8unVSV1?=
 =?us-ascii?Q?FydtW9ouYDqVQahbfEjTxssxR2mu7EKTDq0oRjHZxy8RivUQiPHJ0lK6lniQ?=
 =?us-ascii?Q?LCSYho1rxNB9qgo1zK79o0h+Ke7MVlfjiAp3e9QRuRl6inaVgadERqjPGIGq?=
 =?us-ascii?Q?uT6BXVjuGrop0ks8n3NBN5+ALEHTl+LPThqR396sKEgT2QLEXwdY/GaTAZTz?=
 =?us-ascii?Q?xRdQ4c1bACQl6AOyNcjhtIyoaOFRjGvOmlqo5VcXM5qtEte5wsbtvIEeBChI?=
 =?us-ascii?Q?YCU49KBVgWoQJehtIPH2Wg8QXuKTbhdOYBVIlAsZzVDhs1XlZTGTpFFoLbTk?=
 =?us-ascii?Q?m2PExDaU5/t8zrwHSRyuFkUSDwAc4pqHbsQz8H1nkeJHAjtj+JPyBwmwXlly?=
 =?us-ascii?Q?8vMU62iadhMbMtWMj/IbrN0PZWeywYakamMltYdxrg3Xkk5AMpgvQBlBO0II?=
 =?us-ascii?Q?XbsPJ6GPTWRReZC2u6ZWNZUITLNIWdQvtOliQylgWpmbjO2J1a0g+MgZhK3Z?=
 =?us-ascii?Q?iWnjZw7gpY9cmFF2qlEXCJqf0bdRdDGUj2RsT+/dC69g8zrJJvigFmLe9y86?=
 =?us-ascii?Q?bXpET3x7gMVvEm0eT2eWcdxGBF7Qc6vKaYO1F7PF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d979effa-56f0-4787-e4e8-08dc0fff561e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 04:07:31.5097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OCSEaPp7XouqTkdDRsIWGr1SISf/z7kXecRJ0RUfULsUG0zS/ubK8U1NG67alPMSvs+ZuBSiWB54OaVQlTlG/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 04:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193394

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3.2.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion on Thursday, 11 January 2024 .
=20
Best regards,
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

