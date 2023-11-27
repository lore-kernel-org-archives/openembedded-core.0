Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC2CC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 04:52:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.86424.1701060741194501410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 20:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lfA0o+Iu;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701060741; x=1732596741;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mMDX/CJXkgXC/kTOSj9UTOME7zDzTvl8dGiSMMOUe+E=;
  b=lfA0o+IukgKEqtxgdZ/rlpFCZiUEVw3nsBTwKf0VP3D0jw6QgdXYI3bf
   +cTKE+UEssM8slgIsNWo9jkXwu4ZTeT9F3rd5Ij8oY2uUeSIjMspPDH5I
   Jcfce+CmH5ipip5GZYodmm6VkahGDWPrXTOjP8Vv3lNApM0BOvJjqvUAv
   /0F2Lgsb+bB9GvM1rncCIfpm6HlOIIWatqyTEO+Cyz5stnTurv33jkoh4
   pEPdBPw4XysV4REgS3meOnVJmmcYrxO28FNSRD4W3Eww1iJWIOAuGlG/H
   fDPlan35ch4wMB7MFn1zLABhFbeR8fMSCc0pMsjwGUSxRFE28+4SizEu5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377668653"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="377668653"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 20:52:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="744448259"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="744448259"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 20:52:20 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 20:52:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 20:52:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 20:52:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 20:52:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoYI3rUSi9CYPyMSgxamSMQajDgXAfontjRPcu+uclvoqQ8tWx0O0RplcXU0xGi4CQD60Rz4sakJPjJhfWt3Fy/MqmymALyqvh6nUuf+alDEghjEQvetyoxNck+VHDoNVq6BUXxz21C7z2CKCzqAjFPbHBIINDWGMbnynSIjGLB84RI2Mm4zwPCjyJdLozrByuAM3jHkzL1oABuIhaRjikVtP+YWedFdt3/gNXicQB76bYGSd2AqKQ919fTlP0DiX0nOcGirEJ2WC2D3eDjCpyTXtcTPZ2Rpy2CHJgwxMEGNVqeOOGTbVdZNuc/+/yZE/QdY6PIhwMYAUudQ5lLJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtIGG+fY3l7FHpaK+XSyWDDS6QvWOhWSie/0wXHGGLg=;
 b=advPz1WsYX6jSUyEYjr7mSFvCyqBol1fviBlHIHFBXWlxlErnix9WhfYdEHPbDS0rSO/qGLadv5Yk2A7cAr3xxh9TbDpyjBeYc6LPP/6wN3VQYRBwOcN3ug+1a5gx9elWRubTtZvMf3wkYIRiRCRgGKlx4M8M+/KLm/s3Wgc6Rfj3UxJ1Up3doLusjUlBl0yPSrjIMpOs1esAn/AOdN9QJbW8u70NblSxrKfUV5eHMySy7xRsATdT4Wgqp+Rv4xGd++BEhqbEvE4LLCOtHMhzGXemDE+IOz4TWqx3xdsPNP0hmdgQw1Ao9z8UdJOnNe7zA9ndDm0sBJBqXjGCRdjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 04:52:16 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 04:52:16 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.3.1.rc1)
Thread-Index: AQHaHzqopYqdlTHc2E2hkD2qSWaFR7CNnAUw
Date: Mon, 27 Nov 2023 04:52:15 +0000
Message-ID: <BY5PR11MB41527BA21B2966249AAF8E51A1BDA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c03fc64d2-a204587c-6202-4a4c-b479-8413df9dd87f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c03fc64d2-a204587c-6202-4a4c-b479-8413df9dd87f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|LV3PR11MB8725:EE_
x-ms-office365-filtering-correlation-id: 620de92f-d306-450d-bcdd-08dbef04a0da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w54mxONDtiaUSO7yZdj/TjIZs7ZGOToDFX1yXFEefC/Ojj8wUxCqinJop7RS0d/VI5KTgPGY//oAYPvyGXAbHD5zqpG1fFW6jDQx9QfdNA4a2V3aCGbznYzBC3BM4wU6+D/cS5nu0mj2f9bOZlXSE7S68vFkOksWbs4+QE8PsVlo8HDQlxBAb3TKfneRHiojfBc67uFAEDAfClq/d1ewdFnLJN6fmQxtgRHjkYkwRJH19FBaeEV+4hUPilP3l8tNM6BQKffP00Z17VL8IW00o4Z1XWDLnYxd5vpdSTxf8ntYesHECQxaAIWkk6o09zCZ4b8mO1d3ycWD0twJjWUtefeFW8DrTMI8a7nU339WlEqxfhxdhmbvXBWeQIE3tWKybL8CTCL8zXKahsxbeOkLlWZSygwtwH0KUu3vAWTpf3lOledMVxPrsTGAGptRbvk94LaHbiiD9NOPNGnH4/gGEEbXXzL4dhkKAg/+NZB6+wTpM7staivE2NFeTxkCd63PAwPd4LJqUaLNEbiOJMRnkMFpneDeqsRBas1XmYrAmf4eusUrggcaj6F4ZgH/TNHyziwEGew7R1aG7SmoZoqGixN2FxiYmTiLLYGbDXsTgs9PZWE38ndKbP1FpZfS6IoK87Ha15RgE93kpOZPM5mywA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(15650500001)(2906002)(52536014)(76116006)(66946007)(41300700001)(110136005)(55016003)(53546011)(9686003)(64756008)(8936002)(8676002)(316002)(66446008)(66476007)(66556008)(6506007)(7696005)(478600001)(71200400001)(966005)(5660300002)(26005)(83380400001)(38100700002)(86362001)(82960400001)(122000001)(38070700009)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YnnMw3AluqQpzqySZtb5Ldp4MHs6bR1x+8WDNg5BZ2ct7qpmP9Ki8tZKN1eo?=
 =?us-ascii?Q?UmSI8fi2gZvf15ZIM1krIt9/ZWcJ6FLULQCMpi0ZwsFh4rkDig9HZF+xLZ0O?=
 =?us-ascii?Q?oiwfoDE8blmRalD4yIhfmjF9d7RIz9FtK99nSIHotwsHaTAZez1fS5MM2ss+?=
 =?us-ascii?Q?FkSST2ad5+XFQhTn8ZxdyoE1M5PfZEWSAF+ZlNeD3WspbWRkmPy45yxr/7zp?=
 =?us-ascii?Q?mQKJIZ28X5R6rvFY5+vdldaaFW6bz8q+mnjsMdxzTv4o95mrRgys7BurLokf?=
 =?us-ascii?Q?O9A9Q+fgf5yaKvTBFYs0OJfpKgz3jYDmqaRFa2hAPvTZv2MkoewXMsQxN8Mz?=
 =?us-ascii?Q?D1rv3jhWFTqZ+i5aDRIWoXoHvx70DSSJojmXVNQ3q79QV+/7Pk298reE4bkh?=
 =?us-ascii?Q?s04KBxULlFuLXJKPmJ2Nzhqo0rP3YhSl6BYDmLrIxnaHoA0MNMgF9UFDOrI/?=
 =?us-ascii?Q?wnXB1/7ZgHIUGrmXO7k1uVAcSp9MEyleS4U9AhoKWrjgdemqY8fFPFcBRrCG?=
 =?us-ascii?Q?7Pt3GTm5zDw6mh2/odBu/tLhLOPA6idpLZFN8MbgBKIVowWCg1vQ02tbuwaR?=
 =?us-ascii?Q?tokCHkBUP5JMUCELqHKavDmsOJ2IBBqFM+n7PUvHcKbRwMOjK2uHdGat7bkX?=
 =?us-ascii?Q?d0aA89hP4m+hK/6gj3LOsvXNLiSHZ3K0C6P0rXtv3B3bCByKJBjtg/k0G61Q?=
 =?us-ascii?Q?mhWs+6Fn1ehQRLZjQDV5AXLIVqojFGXkQ5prAtwGpywu3vE/yRdFsFW2HEF5?=
 =?us-ascii?Q?hLcxbZWLSWBjz/dVaXW7M3oitIcbPMyZvXoynk3048gLP4LZ6K/bQYar8Ho6?=
 =?us-ascii?Q?s43CG52UvdXitq3CKMIp6omRgTDBBtPm+CnC2RvxLZEp5SDTfvIG2mndyhOj?=
 =?us-ascii?Q?pBK1k8ClkiTvpbrhrhCgyAJ2hgsSTX1DOClGkJzhiiJPemViIPf/KGWy74jt?=
 =?us-ascii?Q?BDflpVJ37+eyXXSJTMiyp5KABZmwQQ4f9IMM1YDvFUJAjFowMUWdPrn2jUYy?=
 =?us-ascii?Q?5WggGXA8bZyCg+9McJFn7XBf1IrJ6BOswUquJQblmtxVPvW64hI9pf9CvR5h?=
 =?us-ascii?Q?9bFRyjge7abyXqxuTU5kuKAjZeMjtT3UuWs9FoxRU/iHJcx2AuaKd+gwSyuc?=
 =?us-ascii?Q?+zWalyxPSdRieLJOOpWZnZRzVc/Lvz+v/1OExe65spBH1My+NKxG/pBydnMy?=
 =?us-ascii?Q?E21sAsg7TPCTltTd2iW+jtsxpJJKvOH7K8P15ecWKpQmh/uT6aJ7GwWwJR9T?=
 =?us-ascii?Q?4MbS1TLRR6UAIYi5zWXfzCkqmxN7TGL4xI44pBchN4KBWmvAsrtMJtJBdHzC?=
 =?us-ascii?Q?du/fYARyZ//JRSPyQTMDCmsIKIbP3gKa5e9cevYcUqIxbVGJ3zToeWcQ1i+q?=
 =?us-ascii?Q?F2L09Pr3uBOyQ0j68VF2ohM+545yNi2cfI41g5uCnPmfmvOL3A+2b5qtxJef?=
 =?us-ascii?Q?87lF/HTMu2KaElLiPoh4lkW3/v6mCZ0wAy867Hqkv6K4Q5ZKW+8TWWc87niv?=
 =?us-ascii?Q?0OcDr7MySocuatimMoI6DseybcM3JlRpf/pnszSFUjaWlDEaA9Nevu6GafUL?=
 =?us-ascii?Q?3WYJkgPDdry/0jsjd6uc1wdL11IIwDTyKWboiWmB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620de92f-d306-450d-bcdd-08dbef04a0da
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 04:52:16.0187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7csW6uN5XwHLl6lx5JeNplFR9XtkE3hXdmtH4ofjPKGu5+ew3GLAJyKTEwZTJou7ExSKs/NW7uj+bLy1M9h8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191253

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3.1.rc=
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
ETA for completion Thursday, 30 November 2023 .
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, November 25, 2023 8:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.3.1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3.1.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6242
>=20
>     Build hash information:
>=20
>     bitbake: 936fcec41efacc4ce988c81882a9ae6403702bea
> meta-agl: 22ea97e52898c7ee3e32e0c683166c9071e37adf
> meta-arm: db658a77af7e15cdb8e4d9231bef8c48c5d327fb
> meta-aws: ac6f26f5707c51091ead00b26bffd3fa899dab71
> meta-intel: 52ce86a7f5f1ed751d80bc5e1d6b76db1c5b84c8
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: 991e6852a53e0fcd40af8f0386d7f46bb318015e
> meta-virtualization: a215d8320edee0a317a6511e7e2efa5bba867486
> oecore: cce77e8e79c860f4ef0ac4a86b9375bf87507360
> poky: bf9f2f6f60387b3a7cd570919cef6c4570edcb82
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

