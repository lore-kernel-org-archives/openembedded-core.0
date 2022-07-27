Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AC7C19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 03:43:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.15976.1658893422514107177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 20:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jFkGIG0G;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658893422; x=1690429422;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=eikNkh8bg4yeIartJc3/zW+iMNV4OeXKRI7+VageXt4=;
  b=jFkGIG0G1IS5w0L/0b1uiqFXBCDf74SDM/xp0bY9zIDGdM20xkf0qxA3
   TmdL9ZFdUxWclSfBgVA20Cay/JxlLubCMiGwN9wAKlgcXPHllf4ARfesX
   coeFLp2yZ87E3huXlZQQEQc00TSd8vW3q4chUO2s4Gj9ySAs1O1UMd/Pb
   /yR46mIPl65EImnwaI4F5SRIwrdnLmXIyOH2tevKT6Hjxw9rg3iHkuakF
   Q5QKt3d8/116V96BEnb+hIRgZ3mtrGsvLdDGDLU3oUr6XpsnXPwwJJdGi
   u0EsbE9RToqNmHtaNNUcTR/i4xNae/fTa8KakxvMtdn6XBe2gNHRDIyfh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="313911270"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200";
   d="scan'208";a="313911270"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 20:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200";
   d="scan'208";a="604002340"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2022 20:43:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 20:43:41 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 26 Jul 2022 20:43:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 20:43:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 26 Jul 2022 20:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHEx0R6DgkOUYOjPy08hp+ApgBN7tzgk4Llt+1+ch5y2vdBRI8ZQ1UXWVamMfTeRA4Ld/uZvCsMbaXBK4wdn9/ZgUZgihVUCybHy+7m/v6MQ/xscP0mrjXPwrtJ5GX9wsZyuYv9csU8M/obs2K8ANZ+9HlQH9ySTNm1jZYNhrrowTw9Q+G0Y//Aq/h+cc0KYcKIRQaeKVCJG1rlbXOfSp1Rxxv99ObNLi2PiWmccG1KKXTWQ33l3kZAAQkTDDh5g9Gm2PBGU2ZquhjyTtnqupWTry+HrkQvMLQQ6JK6EJ/ok+0GZibi4Jl2bJQ+ygqSMb7Y9Ci51s09gQTLdx6nuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAwgIdN2d4y41XuYm/7nICY67IGGUsxA7K6DJfdW46A=;
 b=G1z0r2osPOwuAEQqg3lREj1jc9lNmmBqfGiBY0i+v71NDPn1lnkRsfNnSO389yeTbJpL3qOBPh4adDRbDBe7/CLVi9MGRo852l4wgoY1ZbfxGGVHxZkuERzq5rBGA8XTYEXMNCo9g2Ctycumm2YlKwYEuOWV85JOoXeF1jGfPOfEMhPX15CsQ5/Vpe4XrhJER3zmfDwpzPIoYbEatloE/U2qqLMf+9y0UfZgUpd+1dXHS/j+0gPP/ILaTRjm0SLA2we7iUK7w6Hb0ET6l4pz41+KQWISfznJB2/TFnbmknYt39J30zv/g5Kp5n5e/IU01G/jkdSQR6VqQZB4qcCVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BL0PR11MB2882.namprd11.prod.outlook.com (2603:10b6:208:7f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 03:43:39 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 03:43:38 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.18.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.18.rc1)
Thread-Index: AQHYoHAJl/c7tpd8eE+n1PGO5AhDPK2RlOcw
Date: Wed, 27 Jul 2022 03:43:38 +0000
Message-ID: 
 <DM5PR1101MB234876C14823EF2E8897D3BCBB979@DM5PR1101MB2348.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 595e4d79-d685-4881-6ec7-08da6f823114
x-ms-traffictypediagnostic: BL0PR11MB2882:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LcRMyyHar07Px8QFB4yN9c1N/OhcrzSunfTg4LBrLEGBIrYEB2SvgILRXvfwx1eJE+L81kUtt7m56unnGFkTpi562YZ/iRcxigiBa3lm0kIeQCBUJ4v1QTw1FseeWTatC1VsNn4KxW1dZtWXG+SnedOfr4k591WRpqPdagWru3mV+GiKt6FoWhC/taR8Zu3ZLZE6AAJrzvQBAqllv1S5KFSd/skMsTb88vTy6TMFQtjuHlnj1g0F/39SUx/NUqz7UhulEbbJztg6zYJ+CmVZlxBbKztcYagPJIYdGEvt1wUFJcZG4c1fbvmwVb6783fP7IEBhe/68ea8RlDhAAAdyBIbSU7ehMIlzMJfGLfLeNSlXDu5mOrWlb54z4QpbrYoqN4zE/U80SkcgahMKbbHZadrnpUEUHKQ+i/MZwkx0QjBZSytpLzohgmgXYupJk7DaLoGfE4AbQZQ6m2O01LvcXUsABQav0Hp4tCUkZVG7BLG/ScTrjEUAVs3qnlI1aGNG1s0sGZ4m7yePqf48H83IReKZtgwx/nVodbfp8ut3gMYxzLVILefbeWYyCjts5rXXmrEdvgCY6gd2wS8zGqnmz8mYNccHkpIViMm6QtT1hZubxRB6u1rFqcj46SaXJdBXerWSLIoiWuAsuYYH24aXxtuXrMOGyvhYpr1bM/W7p0Os3mr2smJM5EKdy8a8kNOJgV9yDUNcvCT/3P3TE7XVySDANKy9j92XxN7fM3e/IH/FhpdX/j6Hxoqmq0yRuVTbhOkMC5bXmdSxt5oVc1bWfUgg5gWwhnu5GJNJgjF5bmM9aqM4lwNluR6wOwwE7ztReViKQZrr0nnQmJeV5BItSOb4kX8oP4lvL0dngBOG3uRzHNCVzlb38pawwnb1VU8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(366004)(39860400002)(122000001)(966005)(33656002)(38070700005)(86362001)(38100700002)(52536014)(82960400001)(478600001)(9686003)(5660300002)(8936002)(316002)(110136005)(64756008)(76116006)(66446008)(71200400001)(66476007)(8676002)(186003)(55016003)(83380400001)(2906002)(7696005)(41300700001)(15650500001)(66556008)(26005)(53546011)(66946007)(55236004)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BtmjRB/I9/gpKSi4UcX7ud30mL66CuqI6tWeogveRcRiUQkAmVmxb3ecGR04?=
 =?us-ascii?Q?FJWncmSIEiM8Ixb5dlg6VigccicfG0VtU6nnbUeElfvKBkuQyvKeOL9Zl2yX?=
 =?us-ascii?Q?tkZKyeuiIcdO0obpC3VQNFucv92yvGk+bpvsFUS5qhmmE+xSaspDJBOYOVk3?=
 =?us-ascii?Q?Scuerk1a9IsnMfkdtnqQUwddxUB5lUKWy85R4ps9bq3a+SVsdJX9kg3QSUc9?=
 =?us-ascii?Q?S1OJ6AALyGI8GPeWc2LZsULTR9g+3loRPA/oaihqV7tQWxdEr0gr5oUrm4mB?=
 =?us-ascii?Q?o9Vbz+mOgL9ttXjkhWHeG2nGQLO2hUFmFWKtMyMwPq3uGbCfqya8aXYVmfnr?=
 =?us-ascii?Q?ZoGwDZkimEhsBxyYWQTPX3r0twy8tGEIpNZdpR9DMpJCX2Hl3LSBr9SX8A9z?=
 =?us-ascii?Q?DT6bTmFv5qMFcLqtTAgkVTWxJTljAHFrWKP3YK7sjxGEj1g2pz7OT0A+NnAp?=
 =?us-ascii?Q?D9mYPaTe4IyuCO5UvxAHwbylz1TZH48CNJdLGegrRBDsGmT8HPpMx7P9eI9Y?=
 =?us-ascii?Q?1p4aFQmNn1bIe5BRFdFAL1t+n7ZX80y1SF6ByLBn6vOjXVPW9nAUqapBIQfR?=
 =?us-ascii?Q?3VzGPGIj2uKdY5xDz++BtEtxGpAuXrPzlR3dIeoyYc9Obnj2NMv5pzi3BAyl?=
 =?us-ascii?Q?DBmAQtcswWJZSxSEk5j9oXJXl/6QzD/h0stZ7lPocM51ygTfwBdgrAMKh/X+?=
 =?us-ascii?Q?QLJ2cvoxF8y+uUAEXFgsrUJYqruSh6Ra3C73P68mUTFxX/Th2om5wGPMdSDD?=
 =?us-ascii?Q?xVHBXRoluMWbXsGgc3LVy00oLV8C4rWBRGxzi8Xarf64a2nv3JK0z3JPC7Ru?=
 =?us-ascii?Q?4/0prUp4CQgXEHb/GoiokafKw+qajP8EIl0BzHvu5rp4WDIX3GiEMCamNKFT?=
 =?us-ascii?Q?64Y+CP1jIyD0chgKrJMF/mfyLbuHl9Ima7u2YF2pRm6lbAseK5FOKQd1q2L8?=
 =?us-ascii?Q?7p0FkC8B2ueko0CaGJYJunCCveJHFI1TfefhU3cZPrAf0Dl8ubnd87oiv+5x?=
 =?us-ascii?Q?wULXH49rTMnkBldggGiKe9mT/k2rdveh8Kgz+4mDM4zuuMWnTPmTP8nSLG2T?=
 =?us-ascii?Q?JAxQ8PR/ujD/nD2SQqqXzOQK2OQiTfr8411+r3f0+QpFlLLa1Z0b/T2C1LOV?=
 =?us-ascii?Q?YIEkqZoopXdpuC8qYHP3jCNIaiwm3WNRZv5T2dzc5BTNml84LN9WbS8TdtOx?=
 =?us-ascii?Q?EXJKKmEXnZ5k6aOpv+E3+GYM9i/5wzFbhVHHJevtQT06t4s88fsK79G6QLda?=
 =?us-ascii?Q?HEruQ2FUJJFJ7YhV3FUAtsMaVN9Zb49UFqhjT4LyHONNkGjle/qTOWHKCaHH?=
 =?us-ascii?Q?nhxbxBsL9/nOijO8YTgUN72oDpEcHPjPTjnAydV+q+3hrUiL9TvPTwqjd8ij?=
 =?us-ascii?Q?j7+KOkvJcTd87RB2QMtu9UtgLEtGy2pC+NGvGQYC2DLzDrjjbzVA8hpIaSSd?=
 =?us-ascii?Q?Why9AX40SSQeufbVBwa5aR7HRf4VfzMB+D9JBO4E6PK5eRVtUDfO0401nSpR?=
 =?us-ascii?Q?Z0KLofDla0Lm5j5HELkUV/o9B78Lx51IBD44mO8pTB67oDD1QTqIAElNfWVp?=
 =?us-ascii?Q?c/LSKCHQHzYExwcL11kyMcogHTMFqlWS2HLgDflx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 595e4d79-d685-4881-6ec7-08da6f823114
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 03:43:38.5888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rSPKibcgoYMdSRUzZONGeBNQFCIFbsAbqScqEPTa0Yd/ibfcmUusicJY1Akezal+LiDIloSdHasSIJhbdv7BWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2882
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 03:43:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168541

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.18.r=
c1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Tuesday, August 2.

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


