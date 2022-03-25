Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD0FC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 02:19:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.471.1648174775566872873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 19:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=k2Bxq8Ez;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648174775; x=1679710775;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QYAxksDOstYeem8uvff40WD/HOzkNDr/i0uDlI5yo00=;
  b=k2Bxq8Ez237riKxXY3NxWcoWFz0FyFhGOUy1vvj4G1o8qK5PUvpydaht
   9cVAb+1zUNV2OgSVMwRwUEih5x7fKsBJ98Tox/fA20zA1SbAclKqTqfeE
   n1ZZXCohk/MKx25r1DY56nAeKqbWCM5GV9lYutMQbjH/VQSwq5AxEJKIM
   4I2PiXpPOppVWMgEcOpsKzNcgzJpFHV5+3viN8/Auyy1gqDjfi/3DInMH
   pT4Q8mY8Vz0jmll4MthQvnyQg2AG23LmfA/LIBFVtX+T7LqHZacilnmJq
   DaUDl6EBCH8PT8hbmJupzzsKNuEFKC8eNf1YfwsyqBQVBuMRzPAyTwmWE
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="240692450"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400";
   d="scan'208";a="240692450"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 19:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400";
   d="scan'208";a="650080180"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 19:19:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 19:19:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 19:19:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 19:19:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 19:19:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThHmaC54iDW4sGJKuZ9ohwQ70BRHe0n8im1RlE22joU52PPGl9WaL1n7IyUqr5xa7YYimrOFUW/Cb+vbZJst7AJi4UOqGK0qLLgbQWHLhamdaz/iCCjC8Y4Ulg5/GbfAWRBVLCXSe4ooJECtwvStGVGaNgFGaCPvCMoEkBVloEuyumqqYvCwbeV24AjuQ+bxCYYLkxORFFi6UPkZqsKNsqewer4KxS2l/PrCBqZYu9Cmr0lDXX7U9x2tJnrFuYI2DPLv0ngTA4o2lyJkb8hGvJcnJRKXKMZY580tv5gDIOqx2BmiHKbeNomMqlTTvE+NMzM7bWj5W570e7ynbNcmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG+HLk+0+mKNYvX7sZIvW/ylazDoY/TJLr/y5w2Bg18=;
 b=MOmkyXGACCJKatmwtm/Ghfu0ef0UDOV27gWS6+7hTTAe7UKSW1bczn0yu+X5QZSGeDBi4oLmYFfAajFZR5c2Ux13gTvwRdMpEV5MnbZDa5Aunnr7bnLzuATJyT0xEZYzCPAZ0ivg7bdnuu4vg67z2gKwiEweZ48uOolxBMtUk57bCze5OFY2gk+1KjO7dTmX7lt6Lbazt09aR8NStK7oE4SfeVKhVEOQim6ewZZG6hj2Ilv68exXHx4yCI7v1t6SZSPSROg/KI/TeBeIcXMG5HL+100PNgZsFDtbxg8/fjYlr/UWK0tuOZf1O2D7NQrd2tzzko+mDNvnbrZrgeMtfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB3753.namprd11.prod.outlook.com (2603:10b6:5:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Fri, 25 Mar
 2022 02:19:32 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::5de2:7c09:3341:9a45]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::5de2:7c09:3341:9a45%9]) with mapi id 15.20.5081.022; Fri, 25 Mar 2022
 02:19:32 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.3.rc1)
Thread-Index: AQHYP5S4TtDWVj6DOUeldHZQC/aqvazPXL0A
Date: Fri, 25 Mar 2022 02:19:32 +0000
Message-ID: 
 <DM5PR1101MB2348C81D9F596544B3A255D9BB1A9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101017fbc90f206-a40c8f82-ad4e-4e62-aa9c-c427260a2af5-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101017fbc90f206-a40c8f82-ad4e-4e62-aa9c-c427260a2af5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 435e2b60-eae8-434b-1490-08da0e05e5f5
x-ms-traffictypediagnostic: DM6PR11MB3753:EE_
x-microsoft-antispam-prvs: 
 <DM6PR11MB375360A06C586484A1B5F602BB1A9@DM6PR11MB3753.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 srCkDWbcCuYCHCznjksewb8zfXh+gCp0Gu/PYtPuFXDJb1fN87ZYfyM46vXT1nk/UjCAjYnzMIbRr7FUFvDDVheeL6/6sRRMaWVukuDK7qLz0nPVzj3+ANnJN4g14KBTz+DX4TzJWVgdfMmiOoOR0NS0tFXyzTWjo7p2wsIfCzgArlvoNNn6AX1AS4jDqe16mmAU69hfP3F5boM+IxSj7tsdXM8q2XevatLxOgz7uxFcAE8pilpcUjpo8faahxpq79GlyruMAlAuClOJRspUG2n5LSve0COAWX+Ugs6uz3wOVj1tvo6IkA7wSKnTYSLqL2rJvE13Zc3HJSjJmIaSREcXcIL6cmxbFMTjXEkLSU2vo3/DahuqoOqdXSvngRVnXxS1PshYBjextLvZA3DsEM6yQ23V5VWs8D6qUG6lvELVPKFLcRZyuAImHbvjW8Wz7r/C76c7t+PSevoadPMVZwNIsmRGsalp4H2pVmy04t9ikJfoAAnnYv9L0T7xAtYcjGB+Fa1qFDUlf1neUQshuh8p0sHsrrFFi1wPAaYstp3ujX618nFuvyrMYdyljevAJPrMGmYE1EPtf3L3CAKfQFp8UMeW7AGTUetsdrID1F59p7fQjWkLLQPt0Uh67orGTOP7cUUhup4/9/xJ5gVsyKiN11CvVWeoK1qxB6ZBQuKPuNqtLftlGgQOL9K1s3kxrLIQM9b3BTTb9pxDboa+FQubuBy4Gf8v3v/yusque29WVPHszXHgG878a/cCVH4uZkWwYu0/mOWehVxJHMi+8JEmt5QqKWxLe73W0MGnpZ0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(2906002)(122000001)(53546011)(82960400001)(38070700005)(9686003)(66446008)(33656002)(15650500001)(83380400001)(7696005)(55016003)(66946007)(6506007)(52536014)(8936002)(26005)(66556008)(71200400001)(316002)(5660300002)(86362001)(8676002)(110136005)(966005)(76116006)(66476007)(508600001)(64756008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NwCxB5iyn0S2mRyh4utZwUJHGwIJZLsA5DPUzdf+LxblOcXymI2kH2Z/QTvv?=
 =?us-ascii?Q?L2XSTkBQIHilPCyHxWUlHWPvbcRRG5UA5S37FDyI2ZnBRLU5Z7pnZ6XQzGQB?=
 =?us-ascii?Q?Soov/L1w871wyb2z4WlBLbRITJvEEYqHYyv012IhtlJi8iUlySQ84qmOnZgs?=
 =?us-ascii?Q?5Ip8gcZZ3fFdoH5H0jQgutc+gGZueaMvv2IG+4hJdLMh5BjhWKONFbNrCxkg?=
 =?us-ascii?Q?P9eGIXBNn6Yienj+n6XQtKZ+5WqpwgyQJGRXCsTc/GulVD1sM593PslwPhW3?=
 =?us-ascii?Q?D7KmHm1dOs7fHHFYGaZ4kb3cP1rDyrq4gadoac5nIVfbphjoQ+Q+ODeyjZSu?=
 =?us-ascii?Q?tQNz+ND9dNYCWj4d6SMNWIImvgzI0lCRYZUSreYVhxkvYTkLTF9OLWdzntHp?=
 =?us-ascii?Q?FqnIfdcBKYA438oaiOSdv/VrSjH7IPLgEO13m9n6THZiJIrSmm+NGfqrIYmo?=
 =?us-ascii?Q?Qdv7z97zxD+3sV+mQLnqJLf8ghFyej+fH0CMxifv7AfOaufTZlOazDOtjE3H?=
 =?us-ascii?Q?phG/DX5xVKcV9OeNWkC3ZyDka3XdSWgzxWTI3VxfLDDoRs8ADR/aBnTi3NGr?=
 =?us-ascii?Q?LZYOi7RXJ2FD7XWID/UcTFb1GEDEa/0Epyl7Sf7q5VNM1sMBlsXb+S+Cp+QP?=
 =?us-ascii?Q?YcgKu1mgotp+XOLHjVqSzwNx29Cj/WfnHqPNCJsXwNBOKQjMiyKI/CGOM5c5?=
 =?us-ascii?Q?qX64N5BuLfe4RgwDn74P/cjOlI+qDaEz64Qn5ODf3F6MQ0cZSEK/EOFcFpsW?=
 =?us-ascii?Q?HW0HZb9WuwL1l3hgyDwdNJRDR17cJx+d6HVvpNxj/o0mggAEWE5cjt5OLFyB?=
 =?us-ascii?Q?GkhGKyn/p9Yxx9+ugpMYEytjsK1niph/tM+MxXXkEJNYuYXNn8zpPR1lbkem?=
 =?us-ascii?Q?qUpY4V2gBiVn3bGPDROcySwYonHVHTdBO6ibH9JJEzkWCjnaDexFypneNGmN?=
 =?us-ascii?Q?mGpu3Qq67zqe9dbVE6IAguNlptdDXxiPjEM/cTdd0x18fjb/GmcQyzVFGdnC?=
 =?us-ascii?Q?FJLRecQAXG4K0DHnWuXKYo7ftoWtOSo3mBp35oa3R1HJC61fa5/S+sDmN0lE?=
 =?us-ascii?Q?Gb1Jol4MmPPA8VwiHKO3QhqM75f8UxO0XP8yjKEaK1tXwR0i3OiwuzyFBZMj?=
 =?us-ascii?Q?ZUJi+1QWp0yzUSHgoX234dGFyi6L0SEU4PnKxveobPzlP1bYG4DrGqmqcNw8?=
 =?us-ascii?Q?uaeDwyl0kYHJ2izeVZPJ4fQLn6DoSm9ps5FeX++936afTdIdwe2/9HOw2rtE?=
 =?us-ascii?Q?+dcAW/KJAXSDbQJ3hX7MXEuaiGT0URea8y4YQ9mw07u5knC70rxReYk4/OTp?=
 =?us-ascii?Q?QPGedaZbzBuHAtWcuLzYRpewhTTVPLHcEZzkWnQ9agzD1SZCsG4F72QGYcEF?=
 =?us-ascii?Q?E7/dly93vxOfx7mpKg760uRyAOY6W4VAg6Jk2rV7CF3OzpzRZJzSfSf9lY9g?=
 =?us-ascii?Q?Wbmk3S+eTPR/B8IhwPaXWZMGHQFELgoy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 435e2b60-eae8-434b-1490-08da0e05e5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 02:19:32.1078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 YWuiur10w5amFrjaSGM5mpC9Nq72dmURH3GeFR1NVspiN44a2EoKpCmNxye1/CP9Go4M7qM5zWcnqvEEOvKo3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3753
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 02:19:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163625

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.4.3.rc=
3. We are planning to execute following tests for this cycle:
Please note that this is the rc3 build for 3.4.3, the rc number was marked =
to rc1 by mistake.

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. Coffee Lake
3. NUC 7
4. NUC 6
5. Edgerouter
6. Beaglebone

ETA for completion next Monday, March 28.

Thanks,
Jay

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 24 March, 2022 11:35 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.4.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.4.3.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.4.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 43dcb2b2a2b95a5c959be57bca94fb7190ea6257
> meta-agl: dd8e34ef5383d95d941a3afc9a03d3fcbba699dd
> meta-arm: 33bbdc67f2ed7189398292ff58a7fee42a85a166
> meta-aws: c92344938ab4d37de8bd8b799186dbbe3019a069
> meta-gplv2: f04e4369bf9dd3385165281b9fa2ed1043b0e400
> meta-intel: fb9e0633614dbf956da185d291333bcc1b137e5a
> meta-mingw: f5d761cbd5c957e4405c5d40b0c236d263c916a8
> meta-openembedded: 061b7fc74f887454251307ef119b808a90654d3f
> oecore: ebca8f3ac9372b7ebb3d39e8f7f930b63b481448
> poky: ee68ae307fd951b9de6b31dc6713ea29186b7749
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

