Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCE9C77B71
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 02:13:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.175844.1680833635059976485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 19:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=iPppeBJM;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680833635; x=1712369635;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=AR/CiI7ExOSj1wge/wiwfW0uw/wT8r6ojysZe7GO4ac=;
  b=iPppeBJMv5C04yzlXrwkr2Bb1dGGEfmqttnIDS5wHbrv9Y1Zg7LK3eSt
   FhUewJUILlymvBxht96HiiTc6d+xdikquAGGi5iEyDBdflWxWvNXcspfb
   DLkPkf9kRyOUThC+TlyRhcPSyjdeNGxWAnx7xyjIShfkWjbTaCbDA356X
   eEMpaLdsnqGEjtwpm/3ogCSdMJR2X6XV8dUX1Jt6e7E+zmGaN5eTp1w+j
   j3o2SX6ld5vhCXVF+uX9ruwjlYySaaMCyPx1Nq+oDfypJyfQY8J5ZP7P4
   aj+jBmHMoMmuKmYBFqbDo1W0lPFH3oQL3buspKyJjpwm6TR8Nzag/oQHe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341651849"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="341651849"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 19:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798557159"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="798557159"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2023 19:13:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 19:13:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 19:13:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 19:13:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 19:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRDkbIsFG1Il3ZEyRoVMsCPFGvds3MalukEn6+LXtjjOiPzYEeBVFjsn70vP18OeZL4Uv/nV3/g40dYIWl14noA6Lvnazg9vv4sr4OctegQJRQ2We2ZHRMsOGu0lteT+UzwP8AivmIqa5bN0KfJFRVk880BbMOKRPnpTBBNv+O7ryoAhDuxBfrCjqFu60kk+GV58wDh/9L5Q6z+AjyXkgUJ8T7+DMp/+jWp19DWpAuXXguH9kmr8D20M92V+EIscNhEZwxnJWCvxdCfNYxqifJ+uGseQduHwDRLjc86Yrckp2078YUXdFuJsQCN3EfDqbA6NaHBOl8QeMhsTXdgpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn+wGrzxcug/tD+ZqEStOjkpn7B0bsZXIjPmhX2PNKc=;
 b=fsPa2uEKKloPF1cu+uR48G05O3ckJ0WJOm8EXInfswjm542X/4/EXFXtRvRabBDC3hojs/LbVEWoicieRNpQPdPJrC5ueByTwdqCywhKjb2QR0u+QACiokj+KZiUjF5P2VPqvXf4xS0ZO896Hs1X9xHrOY18l6gIRB9+tV9KHepKidHuyv67I4aJSMpmhpHbB70Wix6dvoY5I+p4r4wucVRPr4zPBddYw/YA++/SWzx0/G6M9K4DCf1AxJ/thRVpdS/kkvwI0GALgOBCNbEsuaV3WeTzdE1C4ALSrwyZBoo+6D+BPMTTuuo4yTXMGtb6XrSpuQ9/e2eP/KZZ29P3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by MN0PR11MB5986.namprd11.prod.outlook.com (2603:10b6:208:371::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Fri, 7 Apr
 2023 02:13:44 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67%5]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 02:13:44 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc2)
Thread-Index: AQHZaLP6h44AMbFFeUGWZJ+RW4Ih0a8fGGZQ
Date: Fri, 7 Apr 2023 02:13:44 +0000
Message-ID: <BY5PR11MB4152EF482E276E73E1EE6A79A1969@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018757c8b227-79cf1abe-7919-4afa-9634-ca4415075597-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018757c8b227-79cf1abe-7919-4afa-9634-ca4415075597-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|MN0PR11MB5986:EE_
x-ms-office365-filtering-correlation-id: 75b0707b-0d77-41a7-9a28-08db370db69c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kSsiof4yzXllt/gcji1awRk6Rvmo5MtkQR+Cr0y5PTmBVpjPaD6q5slU4CLdPA6nF8znO3+yKHitv1Z0B/EblSwFF1R/4s6ABMVCrFzQcavdTLWEYgc6jVnZm4vFmBBcWtOz8lP4RNTkTy7a2rnbdidHf4PIM2wk8Toj4eHX9qoJUO4qOfVexBMf17V0KQDu1QJOOMpVxeXydP3/UFAs4V1UsFjLZUppfWhK0BtbMBZTax7rLGucDaT7MJj2y31U9/74igsaRtLxZv4KG8QPVwyCEwnUFJOPTALk3f/tQqktMlQ5/rvcJAQTQZh/MT6Y8DK0uWwsWwI2wRudAddqZTAOMtVYIrtbxfVNxhpI8G6J4n26gBXFR5EQiqv/ueqr+QkVfYOqAgCYreHdQ7AqeVkORkkmWBXF241G2uVPzJe7YVUhGau8uTck3td8BtM9kxoaqiTSy8JWGR6K51dS/aHebd4BEDY4oEKZKPqrd6jUKHKJy7YVnlKjtvPPDOTbvQ8DprI75BsGM1vj5ZW8P0mx7JnhciIVXxGDg3vprvDdJJLOTiLsrkP7OBrl5avzsxaVo6Oa1xgDlybnoNoAtNVGkcyzjMGUeOvRYLaSU2o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(55016003)(26005)(53546011)(83380400001)(66946007)(82960400001)(6506007)(316002)(478600001)(110136005)(66446008)(64756008)(33656002)(76116006)(7696005)(52536014)(38100700002)(71200400001)(41300700001)(8676002)(66556008)(122000001)(66476007)(86362001)(38070700005)(15650500001)(5660300002)(2906002)(9686003)(8936002)(186003)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f+dwEGheo7TNj5yFcENbIKlzlTEcjPEw4tmkkie3Hsa3WUygGJClQX9c7e2G?=
 =?us-ascii?Q?Y5M277xvVoraeaqhVZ+YVwSpCVxMklRSWYC4iBJQnaPEQL5Rxxzez8xF/W5e?=
 =?us-ascii?Q?IK7+Sa07jmA50pS+bAD4yisve4QPRKPIo4apYdH8dp850tfFdLUQ9DxFKey2?=
 =?us-ascii?Q?ED1RIIXb9WBF6Qg6iGcqiS8L3JNy3j0aUabPei0w30TbwD0oSB1rOiBZG5rA?=
 =?us-ascii?Q?kZDMqdR4zRjMNoqIsR1iL/bniKGbEGOWWu7vrJR2kDJiFOJsm8eON1Q5JiCX?=
 =?us-ascii?Q?mBlPU8x05W/7qE+VVNVv5ytV5rc8cBOo//nnR+JHBEZv+m2EntcgvL7Bgg8G?=
 =?us-ascii?Q?0QU+lxaix9F0LTVnwNnsId2oYmX5lSJyw9TeHRAgZwRlaRRx2vFsyB8aHhRu?=
 =?us-ascii?Q?m39dsgzpgRVMtbgQD8DrLwuYCXhnxmIrcq42dFpyHyqTvdyCxJLCPYfe5NdC?=
 =?us-ascii?Q?P32JrT+W8OXBxren+BGAp5xDA9sb1NbQBhjV42yi4ykev5cCasYK7Wo//htE?=
 =?us-ascii?Q?qfR0KL4uN0RWaX90H6ppS4lMg63U2TrLvfilxp3j2FxZJNw/awarU7pXnXVC?=
 =?us-ascii?Q?JwjBRFe3crcpznplS3zfn5NUBt4VZKtPmXIq/G5PvlsBoB73LYZC8qKQ4w1j?=
 =?us-ascii?Q?F09Cm4rlSADzp+LATXHU6b8ERttVMOmoMHvjgyEh9p0uZqtiJuKM+L70yZzQ?=
 =?us-ascii?Q?ddY7uqXXcYorP69Pne+gmpt7FClYOz913kkHQOrc5h9Fr80XNnjUZA+KS+0U?=
 =?us-ascii?Q?8iw3Iw9IJ2bcJaouoggf7+pKK9R1fI/hbJo6CnKTs0Af0J1cQtVqVzA2Uqf7?=
 =?us-ascii?Q?iWbl/dqYxs7DhHK2EZuMOhUccOLV1+rUdjG6tKoXdF+/ZoAsFwNZlfCBv3Ej?=
 =?us-ascii?Q?37ThZjZ6kLmQ6Zc4p2HTSZBTg5Nu39GFE2D21IywF2xM5TVndZKIDqruy7aH?=
 =?us-ascii?Q?bizLqoz9nRCurODCshcT4KOE66BaknwmedyTOtYSSiep+nHn+OO1UE/4l/T6?=
 =?us-ascii?Q?OVIWEXy7T9sZSyJTU4YxBaZyKsRgbQ7SW2X1mhpa2GSdhZa7+tfRU/FFL6KZ?=
 =?us-ascii?Q?/JBzgbJd0lQ33PBVjtuc4RCkJFPMFtydIbpsbFrcdKN4iLmTH9hNUJb971km?=
 =?us-ascii?Q?Ev6WMwGFpHIKDc2l/f0juwBonggNz8mNwls4wY8XlRxPzYnq/jncMTQeEdWe?=
 =?us-ascii?Q?h/puMvA+jgGw0hfRmui+ear9JgcP/OvcJY4ZpDRzOs2ygvHVuDfuMkVPm9TF?=
 =?us-ascii?Q?0V0Hyx4FaL3bV20zsKfgh5RXGRdLvvCMjulMSjqskONasD9zq2DmnQm6OQ8o?=
 =?us-ascii?Q?IXysB5eS8Js3NS/RKwiceZIaqkOt10U4H0eaukFt7VTL1TktudfXUS0kyv2c?=
 =?us-ascii?Q?LzqIVbOWi5GlxQof4d6hpgPN5lqHDVKmK6JtgDzynTnKBJN+/OZAZKcwgdrW?=
 =?us-ascii?Q?aAJUNa21glQGdn3PWQtPeseQ44BWCZwGZZtvJ+iB4uVa1fo+KDbGd8oJtOWI?=
 =?us-ascii?Q?4vBG54uRR4skkiViTXkMcskivuUx5agk5qKed+uN2kcMzWq4mgS6dP/wC2jq?=
 =?us-ascii?Q?hU75q8zKgKZZwHpLLFoWd+QhLsLucBPC4fb9YWGD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b0707b-0d77-41a7-9a28-08db370db69c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 02:13:44.0795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SuDxLjUVIH9dZJHW7rWkJZZAnE2442Fe4zrvoTsn+nM+QaKnFjH9Sd9gEy4G/9tYpxBh5cE9QDzKTesc0K6rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5986
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 02:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179809

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2.rc2.=
 We are planning to execute following tests for this cycle:
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
ETA for completion next Wednesday, April 12.
=20

Best regards,
Jing Hui




> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Friday, April 7, 2023 2:16 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.2.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.rc2
>=20
>=20
>     Build hash information:
>=20
>     bitbake: ae2efb05196f9e29ef56ad9a84e2eae5fbdd8030
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: 8acd61c427bc13024df59cdf3d8217e6e2bd2ce4
> meta-aws: d243fc1ad45dde57b4caa182a92b685540475cb2
> meta-intel: ec3147abdd0727fedc707330d58593097357f944
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: 2e0a581bee7fc15a78f6e19ba1e596930edee414
> meta-virtualization: 48c07a48a0e7d56266f20a01bb0c8ebc1085453b
> oecore: 2bcb015b6fe72aa4c928741285c49d3d9ec55e85
> poky: 09bdad16f3a835eaa5b6158a2f8bfb180aa4cde0
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

