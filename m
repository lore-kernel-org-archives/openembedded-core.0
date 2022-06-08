Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47375C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 07:58:57 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.3923.1654675135668098812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=oAJ4keTq;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654675135; x=1686211135;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ZvSvrbzJrLxP5pDwPSi8KIdfBTCKZpWNDDuIhATeVO0=;
  b=oAJ4keTqmw1Pg3XO0S4PDQytK87vVkNmBcHY8AQuA4ETK8yhQ57cWimz
   tLnBoNabSWBWgc4vmFToW0Q9ygLuD2BL/GOChwQV3KtJ0qvcmEi62hvde
   /eZJftkgk62UWmmJ3X6RG4mh0Sz+WGCTMImwBYkxSpgfDEQmYL1vwsFV1
   341KPP45uDoVCzVoNHHV3+7bZsERERpS8urqavJie54yimQxCaf36oqiW
   ATK+9Ki8A3nILxXxMjbyLU1JGuETFE7yPjjKqQYnGDIP4ik0xE9d6TKnx
   LAm0syuZGZ6n22q2SoNhKT7GoD8lSkTo3PwemHlT5tp+EwYIdEDWVsvy5
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="302167586"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600";
   d="scan'208";a="302167586"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600";
   d="scan'208";a="636662487"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jun 2022 00:58:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 00:58:45 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 00:58:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 8 Jun 2022 00:58:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 8 Jun 2022 00:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZq6HLSNf1XXVsrxuQIZ77P9U9WWDfqV8MlxrOrCkNl2DMBsSb0IjsvHd4Z+5QYgWdsaoxzFVis6LYaJkQjCmQfxHt59+tBAn46wcznCiPicJmJQKsgSLKXz0SpOKjNPT4Cm5B8NuOlmLQxLmDV6/dywr0kBwFUQ5B6rTyyE0uIRG9zidAQYvSXG39atuPxWy/GM+4r2cUln14r3nUUjBxIkwTFAUIN0yWOxKl0vFa8kM9VfkEBiW6xJiiJlqXWNrZzaX840UG/jeTG+1pqOufJldJDKMmCc0MfIqMzcbg08pmjLa6e2XZWMfa3u9qp0ht0MC253KGDH0zPoJNgQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HQmMskQmu50jt0kRgTkGt/SaiG8WOpDVy9vtSefhWY=;
 b=ksy132yoQULlpSaf0TFJ+wqOscU1BPBQJAzilBoaG7XD8QZptDtAq5HptskgvVTqmU3JKUK8nqaY/MQ6dGXsENxUMy7f4jIQNA7Vv3ksUZNz9MCjtJj11K21rMF10Rff8qPmJIXJLV8Lm1n+HljpeoLygJBQWgC7xZ62KaGrG1DUOpa/rRnvGzM44dVWAW+kMLPDU33Xp678reE4oeTmHOnZorDCJWvS1JJzxZei26zTqDzY+L/YxzMGU82JGfueZvxf6YUoiIsSD8I3XS/+HoizhykAEcQKlO5bKpQCfMaEinLcemwXdeYI41CFRM0WOcB4HNazXThX9fLp95uhQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BN9PR11MB5353.namprd11.prod.outlook.com (2603:10b6:408:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 07:58:43 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::ed13:88f2:74ef:8098]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::ed13:88f2:74ef:8098%10]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 07:58:43 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.17.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.17.rc2)
Thread-Index: AQHYepRwkP5aKH0IREO5sBs3J7yuZq1FJbpg
Date: Wed, 8 Jun 2022 07:58:43 +0000
Message-ID: 
 <DM5PR1101MB234868CF84B87C8C2529203CBBA49@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <010101813f1a3efc-5d841b2d-60f1-47ed-84b3-78696706e23a-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101813f1a3efc-5d841b2d-60f1-47ed-84b3-78696706e23a-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: 6bc8356d-6997-42d5-290e-08da4924b541
x-ms-traffictypediagnostic: BN9PR11MB5353:EE_
x-microsoft-antispam-prvs: 
 <BN9PR11MB53535F7E18A4122CACB1AD2BBBA49@BN9PR11MB5353.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1CKhhjarJoGK3+ISjRVXHfypSfbY8DMbf+lNcFeC1o/sc2C87GokHAyFnudLrFSvtrEbaJtKv1bSmjKDMbHe+dpa3g3MpY+gwgN5zXR6KDA7y5AgQl3/5OexKj69GoYvH4FioNzvSkelYAlHpsOF9wMzAPG9oGAnTIDZUGh5ptYom3hN0XDft764FfO1BE7piiRU1pqgZHD7p0qYGf7AWjGqt/ECn/81ymGhfNhoVDTnEzMrIAp78sq3wFUw++9Vj7UCtU4lP+8BGZmofIMm04NuqstdFGhzaOIYYmTWSGOuzgpJ/q9rfJuHV/G50gcPjmM1FvtHDp/1YkBw8vvSBksqyOxx5p48IP/VwdqIEKfcKgwGOmgMFz4AGtBo4sYwOOnYDRmtYPoUUXPjJ77dTbOKmg6C804LaNUGv+ynF9OOq9cEh6Lyu6pvgc3/Gmp7SLbp/gf/xCTWqwxTgEHzNPGX+cgJI0R+7BCcuteK4N2IXxZTOpbzI0M7U1Elqg7DKzTM7TZELZKTZQlxNu/NaDi8HWYM12mhGxQ4huygTQGHe3mtbwzxRDKdSGQHilfzh7YsZkXYX394ZbtDOdgSBAzowxyEii1vQFJw/49wo/+V5gwQWLafOfdLseG1QtQIL/cYCnRxAHhT7cv+FR21q7kOt09DaCJNQl9NhsecQPxaHcMnbhqgWxQzJ7U1X5+cfx/R9A6eDDNBvFFeTbDAWLky/vKs7tsEhkOk9CQEDJjuZhL0SStInFse0X/h+gKngmS8fRzOvtFmTuzqxMvyuVPX2+rxoPj7rfb6V43E+C8R8vlJSnAABg/pY/IoC01a6HLQZt+jBlsPCbEPcbDMMA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(9686003)(83380400001)(26005)(53546011)(33656002)(55236004)(7696005)(6506007)(316002)(8676002)(66556008)(66476007)(66446008)(66946007)(64756008)(76116006)(110136005)(5660300002)(52536014)(8936002)(966005)(55016003)(508600001)(38100700002)(71200400001)(38070700005)(86362001)(82960400001)(122000001)(15650500001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?rG39wdzdSRNgRuh66K9N4wFf4DY1qRGxjSmbqWiTxyvxw7SWOdMNOO2nwVcs?=
 =?us-ascii?Q?ITqa3IofgrxYbGV/RozLhxALMgvFtbyoUQcIcHfncRcLn+qn3JKHwFluDWV0?=
 =?us-ascii?Q?/2kj7i9tVsL83Ir+wvL5iAvg1HaDHy3zRCP+Q3p4DuDanz9Q95ui/elWR4lN?=
 =?us-ascii?Q?M3hexLiw87P/jxmiG9SjAZbVbb1fAJKz6+jbAij0jyI6+OjyPyjAcHkPgXL9?=
 =?us-ascii?Q?Cngq2ZS8rVBRVjrZB6zcsZKO9DvJ7S9rGG1/2Ap3JdDuda4Y62QyT7IP/6ad?=
 =?us-ascii?Q?kf3BhCDoLLmbujjDH+BxqQsxS+kNd3QFV05HxqYfigldRIoKrNHA+iscTEsD?=
 =?us-ascii?Q?6FdIhJwGfU4awLCq0y4ttN66iOUF+wX07A4x3rXttjyM2nbxNlj9D9rvMxyg?=
 =?us-ascii?Q?s8J948rh0RvafuFdqoF+ZaUfpU9u+lLZw5cNpAVkRTSDwvLC1Qr9DJmk5aNv?=
 =?us-ascii?Q?MMQcXJE0ycs00eYGxsWfBELXi33PnrN+gz5Tvot8vkUgiwj50FKLl7AERF5r?=
 =?us-ascii?Q?Fdc6SlQlgbw14XE/OvL+1z3RzYJM507bXjxbtFH+NsQzxmRq9sLHXTtmxK57?=
 =?us-ascii?Q?n7x2RcVVjpOy+18w91760d8jEueAyS/53sWnj6VhD7rn7Cev0rHEG2BSgm6R?=
 =?us-ascii?Q?peeRB5XtZwimJUR3hhXDZKLMdbeguxgD2Aoi9vXaV9eRSYtHx5jTxhzoXgfl?=
 =?us-ascii?Q?bK2+pa9craMBe7lB1aDGv94Y/i1kFgNeiiFk10RGiAvvknfmiPGYMYQOHaIR?=
 =?us-ascii?Q?EljlfsLwjb3FuWJLeQABHtaUv4GDo2nw8evVrj5oZlqREIkE9ZR2xULZFe21?=
 =?us-ascii?Q?jbOH0wtQx0NSqyElCmCF/vpy5EI7aJYAB6ZyVc4D++aouYti78ASr+WN8uxW?=
 =?us-ascii?Q?VCq9S7fblss33qrAEPXuPGaG2uoA++JcmFSmKOCBCm3FKqCQC6F2HGJIr4GI?=
 =?us-ascii?Q?rvc5qBW0A413uYpb9g1LTxHZr4i4qjwR8FtkO8uh2pVQAgMk3Q3uXyyMRM+P?=
 =?us-ascii?Q?10mv7WWvsGTrSzwsHglEbWr/i+rAanIglCiH21+3B7/Uihm4qxr81xrv+wVJ?=
 =?us-ascii?Q?aDh2QlO/KdeZxMaHcnBs7g1hgIhmFK1J9ecSoC4rQkyLSEgvwnfsaZhEkM/H?=
 =?us-ascii?Q?zTax15jaEspaXHRq5eJmI9fymue0lvEyGeG9ktqobPApI3MENsis07btaOvw?=
 =?us-ascii?Q?idQCDoYCfz+fVbR3IiJPg0IC1WgMO/jXe5tVOHSci5zcBEqccJvI7WGp8Xzl?=
 =?us-ascii?Q?vvAeZaqjjl8o1FzIQjOnSR5hVddw6zRXLyPoVHCGtMB2KS+hiWAlzto15141?=
 =?us-ascii?Q?bi9XQmCrCPmcjXKQrE2/mH0z0Ref0VZ7/awkTbu1IZzsJoGte5GS9zKdefnI?=
 =?us-ascii?Q?zZ0XXL1WS/lOsNzKiHKLuutEwb/R/RuqbAr2hld3N15eKhMs7iEw4tpPia26?=
 =?us-ascii?Q?0OSMwONHENzn54iA6Z3S/32STWX9DIWDosLcdNvF0wFIpS+76hekXAa1/m8S?=
 =?us-ascii?Q?g8If2Tw4w2y7Rn+Bgx0OHDilp6I/ode1CgYTpy12AC9xXe3FDM5mLWuwW+FM?=
 =?us-ascii?Q?2aZ8uInAISMdv4ttrh0nzFWIFtQexkoRryEp8vOpOPp4KOgvKIx1pclPV7bf?=
 =?us-ascii?Q?HP7RWytvyAAP0z95O6WMaWl4Eg/ynjxwlmTPLeziIIbvXqQViEsVBDT5aYPD?=
 =?us-ascii?Q?yEYiZ/NmWU18nzBrjftw6EepC0rOI29fBdojIgg5jioVrSjCjtLgG1CzqVjk?=
 =?us-ascii?Q?6oL7Dra/Vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6bc8356d-6997-42d5-290e-08da4924b541
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 07:58:43.4474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rbTBkzg24NQogu5Jb40ieeXmPimaeBBK5HS/HxGpMO2BJutD3JgKSCt3+1OQgYd12L2BH7pAsHMKmwHDEtoD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5353
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 07:58:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166697

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.17.r=
c2. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Monday, June 13.

Thanks,
Jay
> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 8 June, 2022 12:58 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.17.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.17.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.17.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 0784db7dd0fef6f0621ad8d74372f44e87fef950
> meta-agl: 34309bc1e6b092e3af5c5d559ad17cee77e99eca
> meta-arm: 5c09684863be8e803e3e987a5ce4940721c3f39a
> meta-aws: de60da566a16b1af8d585ff7d4d48290169d8f46
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: affda10724e5e3c7948200e888a91ffdb5d32a11
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: deee226017877d51188e0a46f9e6b93c10ffbb34
> meta-virtualization: f6b88c1d2f515ffac90457c0d649d6c805fff736
> oecore: 4051d1a3aa5f70da96c381f9dea5f52cd9306939
> poky: 1e298a42223dd2628288b372caf66c52506a8081
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
> View/Reply Online (#156): https://lists.yoctoproject.org/g/qa-build-
> notification/message/156
> Mute This Topic: https://lists.yoctoproject.org/mt/91605206/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


