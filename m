Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADFDC4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 07:06:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.17791.1669273573438541718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 23:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=IJLvJE/V;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669273573; x=1700809573;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wgM2Ug/AJuUzHdbumNkpLrJ7mvOQbWqPkCpJgIOvTjI=;
  b=IJLvJE/Vjqws2GA9z7V3FP4DZyDPsqyRelTtrIalNMTIvHp3dEDlwVyT
   s/eMk7c2iTigaojl5+u1bQjkXliqmOHcxsZfLocBESL0UOH8gpL3krjTU
   Z6Dh6o341lDNRUGxmVu85OMR2cNzmyftV97Ajju4FWBOZH+4Su9p7BzqK
   nnqNyR72yabUGObs8k5Vew+N+DS15nf0Kxg2h4Jz+ykeLyw8+YtSF/v0O
   7DJjm/amhwH1gqZnz2JnzIrUYpj8VLmvxWTiNdpgpoN2V9fBfmonfANfY
   I+CluY3TVt/r/yDDGFTsBv/AgL3rjJVMXtWy3i2kOPAKDQcszbQ4UEJch
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314267002"
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; 
   d="scan'208";a="314267002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 23:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="887247144"
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; 
   d="scan'208";a="887247144"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 23 Nov 2022 23:06:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 23:06:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 23:06:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 23:06:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHheoFe23tZ4CypvO6BHMY2EyM0wyVygwtNuQfV1/Cl0/5kMLh6Jng10DelxdTrMepFvgIb6HFKSI3Dbbl7XHWZu65JrFEjw3fdAeBItT3MNz7nib33fQvdDcaAWqp32vtrPLjFVfFj/yULTdy/6bH8yzn0rvp4f0BOE2Q2YUqeFT5TLxyU1+gWtTyPFxEkROhREq6iE1pO3aGePLhJJOHO7ZUtWNdGizZNy3LfLPSn80VUzVrw7iAwDyDNqOgF3GGUzYznxSbwCcNL+F62DReRCY2j5y5NlDaHyOhQxFHWpZ3O8MxXBkAf97aegEQXrgSR2G4WF2FG8UgAxDtPozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eKlWdkgdU4R1/U68zgCl+8ndUicof7OdjJsO/83mxQ=;
 b=LcLgBWuV8b5A3rbrteqzr4QOhWt1ezVHODYf23YzyojiSQjf0fS90r2eIeee2osjEci7phlMGDUo6gYJp+as12phhCW4yRuiTGOLhYfTSpUxWtzxNia8kqVj0/JbRdEVTFlJoQOE9FKvefs1Qiagd0xbdb2FcnD/rHRoC0MSW++T6HgT0kOGecfxGD4GTgK605EfcmTTDgbmlxlCOvl4zEHr7KVdjrZK86tCOOIgHgzhgrr1+eSNARpzIzsEuRJPBemb4Xo4+i5CaCXbiYfc9Y+a5003yijpw64rVU4mrgHVnc5cwAIXbQ/GTdnS9P/kJrcXhr4sR/Bo3TbdGCdxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Thu, 24 Nov
 2022 07:06:04 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 07:06:04 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "<yocto@lists.yoctoproject.org>"
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.21.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.21.rc1)
Thread-Index: AQHY/1mdiwLyhwAdAUeTSiXe5Hlo3q5Npvjw
Date: Thu, 24 Nov 2022 07:06:04 +0000
Message-ID: <BY5PR11MB41529E0CB8C4AA819A0F9977A10F9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010184a5581bd5-3aac18e9-d345-4281-b60e-3721c03106f5-000000@us-west-2.amazonses.com>
In-Reply-To: <01010184a5581bd5-3aac18e9-d345-4281-b60e-3721c03106f5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB7061:EE_
x-ms-office365-filtering-correlation-id: 0bbd6912-7195-4eaf-ecd7-08dacdea5a0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CTsi4UQKa3purnLhT978d3BWDj4atQITSomKg9gACEh8mYTwWuX6UPelgzSvRwPTKL3TWjKGHA3DbTHO+5FzIv3550a8YrmXBXjKMhYLZgg1Cs0ct1HIgW1GxtO5hxklTu8ol7iaJWZi/zW7vx8R2RWu2NrzJ4AQPt0ULAOoXSCa3J78mdi7s+f6lH2iK8wFfTxNlCJTL3umm/Y1ojNk8GrEoG9CwKEQfyJMTvEvdwaU6RbKwaQndml6k9m9HTDoD4W6dfgyWRCWfsPpf5bjF/gJg2h6/uE9w1brZOgiWVVvv7stkjF17AuDC84DIs9H7qMoG65bojLcmFyAnS/5rdO/w5wxT85OF/s3lGnEN5ZcvqXVMI6XbroXCyl3Hoxb18aE8lPcMETIyr1IjbtH0wtJNRJvivuvHQKNPZg1zWgLPXMGL/kYHtMy6Dq/XuRdUYEZ4yXm+n6GdouiUcXYMt56rd2/gX4eiim0aeBmBl8OggHE089Cadv82672vlqmIDSPMPFHZJHTMIWkUiwhOFWjtB0ZSeZcRg1Q5OlNQfDRriIIxvIfdmXl+gJil0HM4d9dVj2xWvVYeu2Y3jr5AJaogpBWooSjYZsR7USDHTVD80gfzNDkuiSkT6Lp4CJ4Ct5/dUL8MvrMCIkRbN72C/2NaDRgzlFkKaAh8P+szgCG8dzso5z81ejtBhm/O+/7xDdWgEdOYNQ7GkNJ6ziDJmJO9wYuSWRFfwuYBw9nU9zOIPbLxMqWwqe2lalKElrzZLrlxNrnufWgv6TqyavhaZrCCiLm2jLawdkmLvSNfzI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(33656002)(110136005)(5660300002)(7696005)(86362001)(6506007)(186003)(66476007)(8936002)(66556008)(66446008)(76116006)(316002)(26005)(53546011)(41300700001)(9686003)(52536014)(122000001)(83380400001)(15650500001)(38100700002)(55016003)(82960400001)(64756008)(38070700005)(2906002)(966005)(478600001)(66946007)(8676002)(66899015)(71200400001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?txxIgIGjycDFPQSexvWZp1YwTmsy7Xb8VUxzbYJyO/fGrK0d61mCPBPG33cd?=
 =?us-ascii?Q?6s4DxLAJbLisGhH5+Y+2PLdKvfmyb4r9pYJbaLZRsSIfMuKIIq3roZ68Ix9E?=
 =?us-ascii?Q?jCa8szApPsGMHVM9D3CWxu7jbgUHkGpkfMQOWew7ngD31FXX2CYblN3+XtSc?=
 =?us-ascii?Q?8DxwGgphavls/4DiYsNtAYT0LRo0cJGrto0HFfUdDvdFrq++7JtHFaWROOBT?=
 =?us-ascii?Q?dy8U+OT//5fOd08oqMjw5TNWyyxRcmzv8xaGYhg6ocNxHgpbiqtESAn6KOLw?=
 =?us-ascii?Q?jVekGdprKHYtrDIsho8P6n89vcDbyuHxbVgglanXdKju6ODDYfSQHIvIvLO0?=
 =?us-ascii?Q?ITfyRwCeX0yJhKhkX9MJsX+wBywoN7uHloz76Y9LMUCUrbZk4+fAKugRRKac?=
 =?us-ascii?Q?Ss3HVhlL6+9WNwW/sBP5vlEHJXtJL1rJ4MGCDdqadFDaM1nk5V+RpsR9hz6N?=
 =?us-ascii?Q?rHyFXM0mSMnV3gbvoz4T2H0aeRKh2+s39251Xg/cDK9m2RTjZAMiT10Ejq95?=
 =?us-ascii?Q?eoTmd9L0/Rt9z2MP6Tk4d2lyTitDJQKVH3MmZj1bqGUE/lIuDSXKbEg0CiZb?=
 =?us-ascii?Q?uHIpNZGfVCAQ8FVig/slN+9DY5jvDqyOukB3KFd56CbmOjnnKUEim9Kl/n1I?=
 =?us-ascii?Q?IG22JDNvQ6nP1E5yxGsQs2P1nfF/7b+OUZoMDDYRLp9/ZCuYzy4xk6XBjt7h?=
 =?us-ascii?Q?gBd5WeUGY4IWkWbEv6wrcrhHXbGzvzsiMyaBxp06WDu7HXnA2m8TEe48rySH?=
 =?us-ascii?Q?Ls2UwaSO2QdsuBtLf7emibB8/ouwmdhZWSapG2Y+ND8Ti4SM7/fvqgz81HIa?=
 =?us-ascii?Q?/AoX5BMmPdit6R9/ZpTwOmSW5PXa8b0EWNozYbjB8BFF27wb3V2baXJz9Kxq?=
 =?us-ascii?Q?k4VXL9NoEd3NPhsebP7ueBbS+8y2ZtyrgXM/P3wD03Emuo+EqoeqxwU/cD83?=
 =?us-ascii?Q?7Q+twJwrIVRolFmyk81dcMHC7jwNMutdyUQJBPC94bb+P63PJ/MkwbF8/Ji6?=
 =?us-ascii?Q?mpSzgpnEpM6UrPcMMGoNKU0Eu3haRcVn/QT4lK+yzh9fplYy4J50xrDtf8Is?=
 =?us-ascii?Q?pIuNhYUz8FRZl9c91QH2ZD/cSgRPb4BlFgxGdr0lLCF3rxmlDS3aDCPvmclG?=
 =?us-ascii?Q?lqkZjZYQOCiIeAoOsJJr12jZ2dSOZO7pEhahOh5i5bE03ZDX0+Jlvc8syrfT?=
 =?us-ascii?Q?IicijAAVngzfDClSCoPifPLszuUMUwQNksnZ39VRDwoltmghY3AJMV09Lnmq?=
 =?us-ascii?Q?cnQtFrdMnQWtnartbGdCkTBoc1Zh2XQFg0IpOYBV6y3FumqAeW2qSUfbkQ8Z?=
 =?us-ascii?Q?XrRF84Id3gJuYaV1b7h9hgd9+BYsFX3IRbdNa0ij9ML5H58RG5mMM1Aaj9wG?=
 =?us-ascii?Q?bkoh4csHw7nm6iFMYN6Xcc8UT3elI/e5mYLMR5TdNkp4Yhqxe1gIo0R5j39k?=
 =?us-ascii?Q?Ws9hNliGct4nhH1ehuGrcSLuPNDce+hNwPwy2HqkS2Rwxpdg0cz8HV4INlpg?=
 =?us-ascii?Q?N7WWSSsKLw4AP39sSCSAXyh19knytzWfY1E7//LNzfOzmxfflJevoNrey4H8?=
 =?us-ascii?Q?zycwln4lt9q4Qa7wpJwIWDNeDFHJKOQM05wD7KAa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbd6912-7195-4eaf-ecd7-08dacdea5a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 07:06:04.2493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7X2GNyUzlaiv1SV6AsHoVeVKyf79Tm2qtbD02pZk6YPIxMKcRJGjHUhPTpVu610RdVPlIL07638bSx3rr9CzMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 07:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173733

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.21.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL
5. Edgerouter
6. Beaglebone
=20
ETA for completion next Tuesday, November 29.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, 24 November, 2022 12:35 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.21.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.21.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.21.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e3db9c2e9eded3c5cb6040714a6054b44f6b3880
> meta-agl: ac1c1371c3ccf48d458d2d2afb591cdc220c56b6
> meta-arm: 08c44df351ae1913f41de8388981b03e21235f09
> meta-aws: 49e7a5ffb8799b9eee638a6a5425a13b00c33215
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 6c202291925bb179d2d08b5bde80192f9b032b88
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 7203130ed8b58c0df75cb72222ac2bcf546bce44
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: 1ee082e979baaba871bbe1d91181bb04951faf3b
> poky: aa0073041806c9f417a33b0b7f747d2a86289eda
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
> View/Reply Online (#199): https://lists.yoctoproject.org/g/qa-build-
> notification/message/199
> Mute This Topic: https://lists.yoctoproject.org/mt/95221328/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


