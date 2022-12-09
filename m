Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B516DC10F1B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 10:58:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.10386.1670583494836287830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 02:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=EUNMeo4H;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670583494; x=1702119494;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9q6+rbEIvvDego8Ht21NjlOijj8YtTODlDVSlGTv9zM=;
  b=EUNMeo4HEu8/slTPzU/GAtxSvNuD77IG5KjybSGbncEoBYtSu6O27U8G
   70H+1vJVPom+i/yDyBmXM5JqrtUUp/a8OYNbi/48wjDgqZNqlb3f1+USt
   KA8ypbpXhyNIGl2/XfYd14oUvusCaqlO394k5F5aspjRCu36wZ09BwI0L
   DORcqtFXfxSSvBl3QMTouFXsUDOZpK5Ov12Sf6L+Ypc9OVHGY41LSwC6R
   mbUqVMHereATZ0uvloLOsBZ5RC73P2sH55IQytD2YqkQxmk65HEYE/PGh
   oICvxOXA6WrJd709we+WxVYzaCmpAZk1V0PhH56pUp9lsmGGWElTmPl80
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="379648189"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="379648189"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 02:58:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="789684294"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="789684294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2022 02:58:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 9 Dec 2022 02:58:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 9 Dec 2022 02:58:13 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 9 Dec 2022 02:58:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB4V+IedplnhgHio1paewDLE/Zrahz3D5/SVpE9Pf7y4Hismh7sayC6yblAVmhj/5VsOjdq29ZIkFOEyUYCVD3S5n11hkAhymElNaNAPzd7FkZUUrwuabGOgNLh72qn5HIx1Ice/bO5V0nmdjSGV6CMS/lzzTcEG1WlurYuiI4XUxxuGxTfxv8slBEwMlRPGKJhfDF9Nl4QTJGWLzTQybvBZlfE2L/+LlDhZs3lpLlBida4DELqwxy7uUID23kjEh7MCnvVz/GiwMeq6h8sgzQwkTMZd7NDlqMHMxcqQUNM3zJIZvmfJ+fKp8rvoBbXocVn7Mb7rOyamc8bIkUivXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVm8u5mAL21tNPYE+9KqatIvfynl5pGnY4JeP6hqXEo=;
 b=mbXHTGvpTURChMGezKCXqUDonUnG0WMpiVykk1gqlfO7N9ZrpJ+Czf2hBKjSIorRRrmhii0d6jnsSzAAgsRtPXKoCYz2YfHxgWJ9FfteZL08WvuONurvKkiO/vhACuClAN1q9iFWH467ib+P5eWhE+hAdE3qlZWXIU9rxEg1IxmGfBxSxibgzfv0DQyhDNtCUITtjG9xx9/DOpvPLDo4EEY+H9KPoB841xnEwMvbKdRTR/e2+SdCxbqzdFY4q5hiUkeTEZuDwFe52WvSM/vRHIXN64uf+oRKHtnUEmz/9BFJthhcI6IAQIO4uYLowMZ1UFvtfikwCH+xXJWN8CVkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CH3PR11MB7274.namprd11.prod.outlook.com (2603:10b6:610:140::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 10:58:10 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::87c2:e4b3:7962:f4f4%7]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 10:58:10 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2_M1.rc1)
Thread-Index: AQHZCzy02DNcsB2E8U2T4g2VPa0Vdq5lYl8A
Date: Fri, 9 Dec 2022 10:58:10 +0000
Message-ID: <BY5PR11MB41525AF8A89547219C6D546DA11C9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010184f33f3b78-07acc2b2-ae5d-4466-bf8c-59a138757177-000000@us-west-2.amazonses.com>
In-Reply-To: <01010184f33f3b78-07acc2b2-ae5d-4466-bf8c-59a138757177-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CH3PR11MB7274:EE_
x-ms-office365-filtering-correlation-id: 5ef6f7a7-6e96-4e03-706d-08dad9d44301
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F56heoTBuNNW2O/wzUzzZ62Zbrmicmz/yQNJCmM6ZTd+ODP6CNdCJSluipzLvmfrny3zTtmxtn2cXoIpGxbek9Gt1qEKlGqRZOito+Qig2Uv/TSSHUS35NFLSocmbDywoayHNR7EDfPcykHy/S7LDlF3IA6tJgRi5TCDcMOG2oDa7KPb2oVre2y0LYLLtcuHrz+o5envzKorrDdMA1FWiOnyoWTeJNjXAK/KGD/ZTkm7iFYALrzO83NvWYvq+FQu9yGvg/nzTAJoA3Ehfxzw5OT03m3Qc9W/gPupqYtPf2IwWT437xCmYwf24kNLzy2CEuK6bHFLvYvFaBsRQh2+9zIG53SO77J0d5OJodLMXvA6Dd3riiR60GQgNiji/uXx36NPTzUkJXb5BB4rPxouwqc1DrA32G0AdSRaJohuTEpttsJA9cduTTl0P6v3+7VexcZrGhuc66iIGVC6k/Xi7QajhJy1EELHW5DPYQjzArPBY0o9zcqZJO6JFg3FbSjYSqoN+amKC/J85caDxccV1gT09ymfhur7PC2g8JSSkWl3PnBMoNsCj2wKu4smnGzlBd4JRgp5nAvRRPpRo/LBJi2hsNteQQC+2R8ku1pTvacyxIOR2jJBV2zAQ1yAiLJwkhg1ccOVRABIH/lupnMTa0eGmdcLEf0u/+rgOJ7xEltjJ0g3mGsL+ljKEn4LZ0aQ6JlzdB+bDWI9kZbfm3wcrZJ1i8N6v9p6vXhUMriebU4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199015)(71200400001)(316002)(110136005)(15650500001)(38100700002)(478600001)(186003)(26005)(966005)(83380400001)(41300700001)(9686003)(82960400001)(2906002)(66556008)(66476007)(64756008)(8676002)(33656002)(66446008)(66946007)(76116006)(38070700005)(5660300002)(53546011)(7696005)(52536014)(55016003)(6506007)(8936002)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z1QCgB660ZNXz9pAlhQMX2yZEHWfRPtlpgW+yS9gDKOpPeHdRu7BARBqg8uG?=
 =?us-ascii?Q?hgEjiBU5sOgI2cH3CvxVn5gxomsI/xH0j5Dfkm3Ha6yoD9oa3rBw8RnC5SZR?=
 =?us-ascii?Q?4yamElc2vqf9nxsJLbJs5JnD8QlVxg5Y7F5dFzaprBfHsjOzSam5ZLIfV/rU?=
 =?us-ascii?Q?NBnNubylMekxUG/EvNNfLZusPd847eaNbmz+VSWIu58sta+hmgpfqg1njcON?=
 =?us-ascii?Q?SiEcFunQkwlTvf9/wroL0aXdhseROLn2zCQqv+qP3yJjbpTyE7EOYOcMRFt6?=
 =?us-ascii?Q?F2jEjFzMFAaBwv5drlZWO/kHj2lUzm8ogO4gE6INI1RX4Jtonl8zEv3382gv?=
 =?us-ascii?Q?SyBJLrC6huUxJWVZvnZTIXzUefpUEYN20Cz1vlKDqDPJERcoiGC52F7hKjkz?=
 =?us-ascii?Q?7RoOK6m9zN3oqGVEyY5SluW526nFVHCwei5KowgV0/ZRF+sXYwPLcJhLgDZr?=
 =?us-ascii?Q?pLVCy3gARJBbDxaYu6LSh8mqSQhXwIQLjNGYDLZSfDnBiPmNhhyqgwf0fT8E?=
 =?us-ascii?Q?1xe+KRL+Ve+DQt4ZqFUNJ0vmiEHUqB7R5XYCfpLtVRWHS4t1VsFnn3j8NWjh?=
 =?us-ascii?Q?Fm+XzNikE4dFBbAbcyufrj/SEZMdQMpj3P0rOQst+qP9t+WI6Hp1fH3KRoSB?=
 =?us-ascii?Q?k4vA1NCw178EitPzVrcupbhwDsgvEJrh3CAltEhNHajj1aLZ0VwCkywY2gu/?=
 =?us-ascii?Q?sUkYtgo55O9ptb+/pw2VMXEQDjBfLb0sTipmoBVGD+wu6RZ6WszXY4bX/jeQ?=
 =?us-ascii?Q?CVSwA1psl0MoJt4cgGETaHdOFH2Ep0Tf2ALxFLFKidEoSnl4PiWILb9qA0c4?=
 =?us-ascii?Q?rrZHbCV7HqMNmU/R/TnkMwSA0oD1G1qPO4HdsLhTcatqkCmm9mrYRgmlOOzI?=
 =?us-ascii?Q?BEiQ8RVLl9mWMXr2wDSaSsizc8TRW1UeyYFf/jCBcPOYYYtLLOmJoin3l/a8?=
 =?us-ascii?Q?/PkaBwOy8ChR8LDKHhUR6YT10IOaBfBe2gevHKlsJ8cv9yLj6zM52HInBlwp?=
 =?us-ascii?Q?vfW64XTYBVffHBsiDOaDhXyST948JhGqYrxo0HLd/rrv+6rbGTdZf214hqGI?=
 =?us-ascii?Q?QCgI4uZiRkWnFWkAMeIWfxRccwjXv27LNOxIopNyMJ4zGyHGbdWnHQlk48yO?=
 =?us-ascii?Q?JclYM9Qlo4sHC0aXkmJtU5IYNwSdEsSc+BM3JiNJMz4gZKJDodloJO/wiPiB?=
 =?us-ascii?Q?juez7LiShsz0/frMP+tQOw0dkT4jR5VT1Vp44LcHRk7LaYivPUjcsMMdiVNG?=
 =?us-ascii?Q?D/PeE910K3aMdEEmloMaEI4Uk3vlr6uRCrn3nbQta/hqLSgRkJLb+lC9m+pA?=
 =?us-ascii?Q?ezwlKe3gvWyqfCdJ1Nz4VDxJlWi16PJcWzTw6dDbmPhvAK6qrq4MzF4FVJkG?=
 =?us-ascii?Q?2dEPTS0+mOvxQLFyEfecRFA1ch7JuY3zZrs2vcX3tI+zXCPN3xs+8rPyYvKQ?=
 =?us-ascii?Q?O4xj3rI1KXl8TbM8qCtSwD3Q1/tNncQOwg5usKS7osHne52RXuMjVUQ5wl7b?=
 =?us-ascii?Q?a++i3Tpy/JJv+heg1dhPMktMqDrUmUaxqa0MDcEtw0l0qUjvoZoF6E7O6VgV?=
 =?us-ascii?Q?k6JXLT8Z4T2+qmBJchlfRkBu85vtjh73X8ccIwOT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef6f7a7-6e96-4e03-706d-08dad9d44301
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 10:58:10.6183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKpPXWDGbCgDMpGoNcRBRucPqWU8W/TdDaSZu1TdZZTvug/aUXnt9ekeNJ6W7Uy9nzuyhtb8e0xNjgMdnlK8zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7274
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 10:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174445

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2_M1.r=
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
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion next Thursday, December 15.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
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

