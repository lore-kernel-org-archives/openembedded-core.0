Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEF1C77B77
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 01:13:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.44414.1681694024964088124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 18:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=k1Bt0QG0;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681694025; x=1713230025;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/sTpn4jf+4yvTSwcHPJyaYZbazi7VgnKQHJPFtV7qyM=;
  b=k1Bt0QG06LNjjkGmRhNDzoLZrpuJdS30wNlFKBE5zm8IwSkMrxyv9ccc
   d+bap3lp7js+2fXF5TYIJelInEi5DmGC9D+rqk/nEe2O0h0ntGe61cb8u
   eEl0jO+0kpQVNEKCbuxvgvHsja+iBLL83TUqXb2awRtHkqGCDftd+X754
   PGgH4Oa8Eo1eqDRg0Ab5g+Ryzh+SGxMiMITMlUz1pqxkQQs5UURaCPJ4a
   +gxbiu37A9LzoJFLXg7JzbmnJFIM+uvRx9b3i47c+hgJaGaSZjeQvewIs
   vNDV3KLQXsHFw8qa9pLTjtLaF2r3wF5QLch/UMIXT3UZb759zTBNXVxrl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="347512147"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="347512147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 18:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="755125078"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="755125078"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 16 Apr 2023 18:13:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 18:13:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 16 Apr 2023 18:13:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 16 Apr 2023 18:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUua7aPGxsrk29zEvwKpEM5vVEBXn6IjlKVJ+PbbzuMNKJzhF5jwuQx7U8msAGcxVbrJV3fQF14GaaGMxtFG7rp6mkYMQhaL9/5qmETIrnvxBz52aiYK8+ZFiYJlGvOzZ7iEPdHbVHUAH21ROS4Kvkp4VpwvfcPnj9Zn+XynzGqwmwUxcQj8DIR6q4X63ynWFbtXM2xl/Mi0C4PC5e0OzYbTUduw7wtuFMutV2E5E8hCSyFy4I4bZVFHdYmVuKJvPcw9IVoLOQ8LZxsGbeddsEqUqM8TAJsKxAU6l9T3W5c7zhKmILPxo5XY1DGIEKyoGPLySc5xpCtwnxrwR3HDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0mjV6KVAOAk0jJJP3zgytPQnkuCZc9BANz1XRRw5Q4=;
 b=krwEoyGsI97FSN2hHzvM2FPA4Iay/C+skxOBe+lGZxPZuH1zSHl48BMJ3QIHOrIOjmbcZF42RFucykRpaw4EH+DS5xZyiK+xaMVJhrjNuLCBzS7543DG+EtjGd0rGfjwT7lOrtXQgnGY2n2wK6KLEhp+WlpOwS1re39sybYXVEQC02/XgokKuDtwXVtHu83p9Gi11mCINWbL5ACxuNRNsydgTlQwPZJ4BUWiKAv/ew0GoKuc/8huD/ZO0VU33u09tjXOzKrC7rt+4//Wk0K3Wz21/seo0mTZU9Zd+wmI9hriJ62Bj1DiimOQMZ0mKwZczMqBYxXTum6KD/wylQQ99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 01:13:41 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67%5]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 01:13:41 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "<yocto@lists.yoctoproject.org>"
	<yocto@lists.yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.9.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.9.rc1)
Thread-Index: AQHZbY95r7KNq6lyIUic2qx9gQnmsa8uuAHw
Date: Mon, 17 Apr 2023 01:13:40 +0000
Message-ID: <BY5PR11MB4152E68F35FB8D29781A5648A19C9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187779e6a8a-9f7af2b6-6b9f-429d-8340-d75d26017f8d-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187779e6a8a-9f7af2b6-6b9f-429d-8340-d75d26017f8d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BY1PR11MB7982:EE_
x-ms-office365-filtering-correlation-id: d0669ff3-286f-4e57-5d23-08db3ee0fb2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MZAdY1GgoFKLdXg0bfAovoJmLQZpSYZ8lMraPsy64Vpyhz8vKIJLhcv4WKrVOK4FE9cw8zsJ27g0BVMeq6lbGfjWuc8A0L8UZlPPrzXdIfPZkpSMdjjK9iaZDJvy73dWl51cRUHFMzcCw3lhGILBFQp9iY0FLVyAxeyMuVb0tK3ltqYd0Z/8RJuFz9F7Z0yyO52B08T6IR7GbBOIBAaO/WlkuyxUcZ5qqaTmcxvzQm0Ew2NaXpf1N+6Sh4v+7CE+ohBnptpOLQCLpfz3jGGgs6uLEfdOOnxGNho7866DDkqW96zHWpW74I0SLDanxc4/N5WF8G7duOZCn/Aq+/pPFiWqBCFYs1CJ9bXX+Aj+kZckgc5o+G7LWrSNyB71/GFltgMlHb0bhiI9UlyFRmwe5nHqIrng53f9lo/2W+KS7NCHqnodLFqniGbPgIDBIc4WqjKjScrtO3iEtx8ghax9WyRq4nZ/GL8KvsAZNEMOWYowmzRA3owoWyy78VePx4W/azzmcmIEOE6pQL5xDL5IomBetT7Vfj70/CD77LR7cBj2XnsK1VpQduWiCrRry2wQnh5IGG84RN4It8IgoU7MxA/Kuifas5CWZWGpxlRiypsPI8V5yZ15X9rorhGRpo06/wLqAufX3M8T/rxYyY2OyZUdE1WRd8i5X5ECO2kPEFs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(5660300002)(52536014)(86362001)(83380400001)(966005)(53546011)(186003)(26005)(6506007)(9686003)(82960400001)(122000001)(38100700002)(38070700005)(8936002)(8676002)(33656002)(478600001)(110136005)(71200400001)(7696005)(55016003)(41300700001)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(66899021)(15650500001)(2906002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iktOzLy3rrPYQrNQGGa+K4AaeJ03nRHS9oWP+2sRawwJh6n4OTktvVITG48s?=
 =?us-ascii?Q?Td8UKjqg4U0xFC7Y9R9RjDweLJCe6G/9x1HfT0KCyyRbMPC8qOMHo1UCcz+/?=
 =?us-ascii?Q?WaCoT2MRGqzHHSxecZkBVtzUyD2RRKWn7VAt9nFUkruldgXCUVOMrdzdsKK5?=
 =?us-ascii?Q?qyiIkqHf0eg5fOzjrxYEz4tEJx/CympZe6ILS3m+xJZWaJdWXv2mwjdcNnC5?=
 =?us-ascii?Q?f8pT1XfQCP0nPn82vZ5AR31F9vtQ5fUK44e8IREsJJCC9G49dLpGl2VxLovp?=
 =?us-ascii?Q?a0c2sOYmqzLKEXHMb/XLwKOTj5w2XeWavAL0HskyFM5nRHqVxhm6LKArLwkK?=
 =?us-ascii?Q?Laqjih6QMGIZ5mZCNrEUQbyvnB3Ahq1FKqK7iSh+X1Jx94ksU1yB8jrhgoIn?=
 =?us-ascii?Q?N83iMDUJpJ9RE7Zl3tMQmuK7OtO2YFSUNW4wfrD+vjuLvkqmB/D6eRyB3C2W?=
 =?us-ascii?Q?p0/NObLiNpZKvJX9hpP/99BAOHDBVlr8dTOFNe/90+2kWnhNav1ol3lx6RJ7?=
 =?us-ascii?Q?ogI9PFOYDap5FKUZ4q30u/8IPqkE92HjgmXYZNBQUHdnVH8GiK/UtAYR8ke5?=
 =?us-ascii?Q?wTjcHKupdKTOKcX0qgzH1YCsOoehk9y3kCYyRG76Qf4v9lpog5E8itLP+J2/?=
 =?us-ascii?Q?9/wKS5wr2pVgHayQusplqSEZtg4Dcrv/pPi6RwnawmlSil1cdSQpwmX854zu?=
 =?us-ascii?Q?YYiyDyIm/4EA/BE5RPFu3uxmvK7+VUC8oAaL2GRPgkx/61krOVR1QraPyI0t?=
 =?us-ascii?Q?SjLxOV5jhUSZq0x3bL9km7a4uzCSF80oAvEF4gMx5tgnOI+HGWgf2JDEGafW?=
 =?us-ascii?Q?H+NpSImmZGTetxRQcsAJuJ/0KEHBVM45ETl0S7HcdfUTJSQOIo+875naiaAw?=
 =?us-ascii?Q?7tzuN9fvscqOGAWcMNyYHVf779admnbNiYi5sXxCGQBwj0/UZK22ICgrG6Wb?=
 =?us-ascii?Q?JMdeHODx3Op2m5OuF8ZFR92flb6DWBb1eox4pbZ+JHnRACVB6F7dairRkjO7?=
 =?us-ascii?Q?DYv3LRLAxUnFPOmqof0EQMw+NKt8M9+RSr6XuKW/cJgqqlDQNN+s1YAl/SHV?=
 =?us-ascii?Q?Afj11GSpF7efRc0KgeKJsym/31NsLxwK2JWMmQ3J3fZQpK4U/bC/o+9BHj18?=
 =?us-ascii?Q?uBNDUW98dYbAXc36F33gd/eCP/kNWuCxhpIjxKUBzW5u+UqgyI3/obMcQq7t?=
 =?us-ascii?Q?HQ11GoqP/rhwiiHOwwpSdTNs/EVXvJx5KEwDgGMiB8Bh1wMxkurPSyta2t1m?=
 =?us-ascii?Q?lp0UXjeQADPKg4wd8aZUhk1tZzsf/LmT0iT2Jj7RkPX7fr7gKPXugYBclorh?=
 =?us-ascii?Q?VX3GZ/o37qaPx9gbJzaL5XJeq64zbcb1bpGcQBUQbUiJKh1qVCAc0yeLyYhr?=
 =?us-ascii?Q?LLBqCV5iSLloBBkKKIYa0JqKjjLo4N2mZUTOpw0348AjfmwUJ+jS1f3lq+DO?=
 =?us-ascii?Q?/GpBxfpRktEEMznm++wOcwqyQVqH2b3ZrSJomnRE2PQeMl52PkI87UAm3+T5?=
 =?us-ascii?Q?NadlIPAgZSBcOxW9P6wISi6ctooYDkClbnEj/VoFcxS7C7eS7ANhfexfAUPy?=
 =?us-ascii?Q?fBN5oEs6y5rYEMXiElOzeZk6QcPXZzX0kgMyP3p3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0669ff3-286f-4e57-5d23-08db3ee0fb2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 01:13:41.0304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /f49JtkB4T/sZjoG+B4ss2vkAqd5R79AbH25sGyNXyoz01aPD1g/zASHHHV0hW1pW4gD9wXsIME49H6ENQBvKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 01:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180115

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.9.rc=
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
ETA for completion Tuesday, April 18.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, April 13, 2023 6:38 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.9.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.9.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.9.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 2802adb572eb73a3eb2725a74a9bbdaafc543fa7
> meta-agl: 535bc8f54ce5fcb4a94204df5f2b3317beb53f23
> meta-arm: a0216a41bde3f191037332a9238648bedfbc61bd
> meta-aws: 3f7ab5912239d667764e7df885776b267eddf265
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 4c6cc14669d0e9de36e1a050ce4084ca14181722
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 571e36e20e9d1f27af0eb4545291beeb64f280e2
> meta-virtualization: bfa6727718bc4eb550c24e2c03a4118b4e7bc842
> oecore: ff4b57ffff903a93b710284c7c7f916ddd74712f
> poky: 09def309f91929f47c6cce386016ccb777bd2cfc
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
> View/Reply Online (#243): https://lists.yoctoproject.org/g/qa-build-
> notification/message/243
> Mute This Topic: https://lists.yoctoproject.org/mt/98230059/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


