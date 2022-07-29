Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BE9C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 10:40:33 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.6595.1659091223445912481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 03:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=JuGOB7d3;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659091223; x=1690627223;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lBW/4ISs8JquazSR27VveyCDDhqurJoCSfg8G6btqZw=;
  b=JuGOB7d3haMHuzVsf7oAeIH/I2zVRDevYjc4kdm7948XV8jXcUD//n83
   WV+S2LBQxY8LMZymGeVbr0VDNIeKnSAG202q4Yx7UMGwV5g69w65O8OhD
   K1XDuF+RUejLz2ynlHjZeld4SunWL9kV9FhzFu08Hv3yZSt2rpYxxS9bY
   iP/ixJSFKqueBVZmA/PQ51FAJuDTbuqMjZejx/kilHNJ7BP/76FZwR4rF
   /Jiimrfy4wBGfYWC0DARCR0dL7X0g5Y9v/yt/vnzF+1cWtU+EbqdWdFGV
   CormCKHwG/1v7GXEO0y3+Hp2Fr+wibetaar9l7Y4rHDL8wEjCmlFU1Rwi
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="350447878"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200";
   d="scan'208";a="350447878"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 03:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200";
   d="scan'208";a="727708008"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga004.jf.intel.com with ESMTP; 29 Jul 2022 03:40:22 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 29 Jul 2022 03:40:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 29 Jul 2022 03:40:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 29 Jul 2022 03:40:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 29 Jul 2022 03:40:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU0YknnKQBoDlUbvP95q7OhIRrD1ZcSHfUxN5BSaRFH0Y8mrweMAwYucgKEjOkqq4Y8kFjM/fodJCdWY0bWwScM6iK/7AARPMNeuj6KNLfT0DPwNK5RmtXMtEa1R206oOnKNkeE7lv20OsqaVb1ATAoHSVu91aELHOeSDg9sJ5icJYJ857cXVF0lMFMPKzuKzlG8TiQOKuE+pptOjfDifKsL6mVPBe+9RwqiUJ/6asvVQ5qC0vc3WlGCaSiYp6UTBby/goyoJwQbhmoy1jCd/ViZfhg7HXRyLm8tX4kwqPhLe62eP5axLj8AefYV3e+IQC4wKfoV6So5crYeBEflyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGBd1xgqtLpjNahu7RsGFnxN1VdBfxuWH/tqtHxJ+f8=;
 b=eYGWNGYG6H2qwNJk5Tw1wWq6sTY32vUWkLymuWI6YbLBuIiBX10z2v2qQwnlDdwYvVpBzvcg3MiGLRgppSPjtxWsyOsdeBBSCLzw9eWt+B3WxQNA3u6YOm7R5v9FWWYmhDB86ZDHi3fwBUhnJCHGGVDoehcUuN2W81PaqVphtFUfv5eYCu8VxFk/DZ6BMO5Wi3fy/hmennzFO/hPzoB3xQyOvdyJh84tzdU6zvHPZtO7Cvnf02Vgw02v6AC/AYIPxKjD89QYaaA1hraDf9AD4YwQ7eGzi7DRkC5Gse6isx1qPqGPxrl+CLd5ma8of3FcJNuOKNb4fNV0wMsV/gh8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by CY4PR11MB1541.namprd11.prod.outlook.com (2603:10b6:910:9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 29 Jul
 2022 10:40:20 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5458.025; Fri, 29 Jul 2022
 10:40:20 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.18.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.18.rc1)
Thread-Index: AQHYoHAJl/c7tpd8eE+n1PGO5AhDPK2VLhFg
Date: Fri, 29 Jul 2022 10:40:19 +0000
Message-ID: 
 <DM5PR1101MB2348F433835B77931ABC72FBBB999@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018237539254-f6b986ca-1380-43de-bd08-061d94334983-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018237539254-f6b986ca-1380-43de-bd08-061d94334983-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: ca51f7d4-475c-4be4-96ea-08da714ebbe1
x-ms-traffictypediagnostic: CY4PR11MB1541:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nFXl74+rINEqxlO+Ox6qgTFwCiY/sLyiU+oS5i06xSVd9W1HQ5sTnsOIRZS9MuhAnjvYpYxrWbDMsrLP9m290gFNPr2LOhKslkbGDx1pWuRuCBgLNzBhiN0Iehg9I5lICaY7m0U1ByMxs7tAQBSgjXlU+qarGcnCyzi9Ok2W1iGgcRCwV/S0skzI6dmin7NxuKJKw93ZI9pnWHAjpLRjypVxFy61AmvSImA5xXit11F4vO+YI7ohlcmAP7iiZern8gC9VGAQDJ5IfPyKKuXFq1mwJh/2335t0m64higmjAoPImCqfOUiHRihP8o4POM7uEZbU2jl4qcLNk4Vzvb1iW2sPR2bQ/+6S9A5hySR92NXHcJjbIDIAIWH52NsDculfPKrb5RrKeus8jE6oxQz/RsuS7EyIyGkYuKJsaLUFc3PuCs8iXFMsMu60vY5D/qXoGCdUH50egqU/b+PtPa4ugK9P/8PaVixBrzM83eiccl8AVwAt2E+AJYtF0i322DZaU224rhFbcy5oGnkq2rndwlnYVB22olNDSiyRBUBpEo3Oc3FiQ7liwBpnSdBWncskDC7POdqRBls21ZnRDf1pr/Qcbm9evuFFoL7aVwCclnMSnW7iaeiiQoAJJvSU05aQY2SD3exPtz7Y3jpPmdFT8huXDXVE5YTwIT6hhUkqnPDW50B7IwLmNO3dtA2pXtoNDGXK+89b6quTcGrqfFyyILV9PIxcVEXeVhBUcJJCeIFp3S6vvOsRbullrxDSXbuHZeVzOmqt4bvER2pnbbkFsFbDx4fUblA99b33JntvGxsZCaPXhk2sVWFp8SAJ0+p6CqwX/g2ksURjlMIb2ATnbN2Rl4ea+/7a9saE7d8/J9nwE4f5/j+5GR0WAEQRWxd
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(376002)(39860400002)(136003)(366004)(110136005)(82960400001)(478600001)(6506007)(71200400001)(41300700001)(38070700005)(186003)(966005)(26005)(8936002)(7696005)(83380400001)(122000001)(38100700002)(53546011)(9686003)(55236004)(66476007)(33656002)(15650500001)(55016003)(2906002)(8676002)(52536014)(76116006)(316002)(66556008)(5660300002)(66446008)(64756008)(66946007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?a2Ze7rKnOK+fBJq0u4v3ZBRUspXWczj7Zk3F9eMpSynSvqePjvNl+3loSWFe?=
 =?us-ascii?Q?k/4QyhEFM3u1uhCF2A/LCwDhxYTTDzrV/zCD5Ii3i+ag6gVxxW/NITriuJmJ?=
 =?us-ascii?Q?dxJL6Oa8fQtEaJ+iD8fLqnifFeXeqbawHD/QcNCsJF283O5D1oXrFPdmvQjg?=
 =?us-ascii?Q?6waG32Laxkdou+Cxzysm+rMeRVtiI9otrmU3aj6eIcAs0IahzEPJ2cNC/26d?=
 =?us-ascii?Q?wrlqtoQFjdGuMc8a1p79CXxojsJWSoCfKo0yD26HpdlOCK9h5BAhGk0x4D7Z?=
 =?us-ascii?Q?VhZYOU351rFElVi/HAP2OpRbhIkknngCPEesaKkqIIu1kHOWGSaEIi1vbQKQ?=
 =?us-ascii?Q?/WRFSnOWE3pqgmsH/i3M44hCLNXO3oJ8z/gn9mGOhmW675DTFXTlNpdGMyUT?=
 =?us-ascii?Q?g0xHbTpQd406K1YPS9Zj+eroBtCwV5F6qnXo4/I5gaebYT+UJEbp3jXPUGLc?=
 =?us-ascii?Q?x6HyRD2IU5Tdi/i/ljydY0D+VChZnlR532Qw+TUrbIP5IcsYMns05H0SDk+j?=
 =?us-ascii?Q?e3ZVHAoxhW14eEYkwtdzswJggiiRW5S3srl3YP3YIXdxozkYQlqdjcOJitfn?=
 =?us-ascii?Q?3eMXdS8oK+nUcU95pFx0femH4EX/9RCVHaZ6cG6kYFRqL+mxTnUwqkTDGWg+?=
 =?us-ascii?Q?18oPrHjsGUxhYg+vYPXcWh/YMyO/zY88JzPzQ8w1YtlYunlb34mg+dXhDvVN?=
 =?us-ascii?Q?EryNqOjjCHXfUNTsw4GAJpTpgK5wbv+H8y3KtUDEHWYCCRcKcGlgcSaJqKnY?=
 =?us-ascii?Q?oYChQzkMlqP/ms0fGiQcGYE1hxKHoe5JDC4PGXYSk2dtMReNnkaR3hF6Kb1K?=
 =?us-ascii?Q?DmWBqr4AMqIPko0hRAyetgNwRq31Z+16UL6C7X2CmKlfTMVZrdtsRTdUcIzp?=
 =?us-ascii?Q?5eUrn1tTCQtIcsRlIXGZrzUyU9jBbOczlodcMkoo5kv671+RwbkcAUGNeg+Y?=
 =?us-ascii?Q?v/KvU+YfKcv4on2KXPOo511/Ggx4BYQI8iqRsIsWrcg+uEPc9EMWSMxrvhVU?=
 =?us-ascii?Q?KJRehSguRRaibNSYfRU8DnkMBOaU3OfNrG9bNz1nxpRy8ZSIFHcc0LFzpYx8?=
 =?us-ascii?Q?Aj65W1UBdqfybPNU/mNylrqNyv1GTHsQQuFXkbeSdqPbUvY51z+k+zMR3EG0?=
 =?us-ascii?Q?NUZ9QXI0EYNIg6AUkPkMRfQ9fRdA3HcCXcBll1gs2GsjI4ZNNpoZA90QNt2F?=
 =?us-ascii?Q?BJ0PJ1eu+qti7/dMlV96TQcGWAy+on7IzL+/q0532ms0oThjSrWadwmpEplz?=
 =?us-ascii?Q?nhAv0nn0LMKqB3QMPG0eJ/i3tf8AS+7Ij3j75zMZXHTOlV6THtl8PMgsE3sJ?=
 =?us-ascii?Q?ekTps/PNjpxgqUx9WkcQRy0+QK9RRwh1uHX8ANbeoLhqV1AjTAJGos0mU1bm?=
 =?us-ascii?Q?+svXibVlQrPxpY40nGouCCgxxlzN03YgBKldqwncwMM6bdz3463D5VVIvysS?=
 =?us-ascii?Q?ErGwEcKzp5aSfdsYfY7oXJk/AvzRn69aOZozJG2ACZHkKmi3bqgimLYRJkWz?=
 =?us-ascii?Q?xnxGIDS5s2QRiQBx7EwVxBIBWV5zRItfYkgv/1kZqcOWxPFs1rKg5Vd1IHx+?=
 =?us-ascii?Q?fV82TJkKWzOpu06o1TDiyErkS9bDyxeuCpCifnst?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca51f7d4-475c-4be4-96ea-08da714ebbe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 10:40:19.7670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tbMym0M2Czefw+AntDzmdXRom8FpNK4zl6DN5BWicJh0k0GXic8i90MwgQqnxmWOPFodAUEKRqrvDSYqwSHz5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1541
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 10:40:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168624

Hi Everyone,

QA for yocto-3.1.18.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 26 July, 2022 5:47 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.18.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.18.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.18.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 7fc4cffebf5dcc1d050416c0b7f7d58c765c1d69
> meta-agl: 6c9fa75459cf86576c47411fc239e0d7896d483c
> meta-arm: 5c09684863be8e803e3e987a5ce4940721c3f39a
> meta-aws: dd742bafa5eff33ac930e97dde851f41cbde85e8
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 1c1a8f769ef93d96ae488f40abbcd11946403169
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 52cee67833d1975a5bd52e4556c4cd312425a017
> meta-virtualization: a63a54df3170fed387f810f23cdc2f483ad587df
> oecore: 3f40d5f095ceb099b604750db96058df00fcd49e
> poky: d695bd0d3dc66f2111a25c6922f617be2d991071
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
> View/Reply Online (#167): https://lists.yoctoproject.org/g/qa-build-
> notification/message/167
> Mute This Topic: https://lists.yoctoproject.org/mt/92615446/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


