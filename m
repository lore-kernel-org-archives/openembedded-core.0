Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D05FA3743
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 07:14:08 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.3408.1667286844431789270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 00:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=FCkSstWB;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667286844; x=1698822844;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Sn22dfChxkheDjI1J7wylBWB4oHzsncWJs7RC6ATmVE=;
  b=FCkSstWB0svhT8t2cT7F8TL4daAh7cZOCEO46URnuutBy0Adt7vrQAi7
   eaie8Ac+MxCyXt1ehIjHXWT8+HZdNPAhoFbXeCk8jM9Oohr/3C0YHgeXS
   U63i21/c8c41q1E5oqGWcyd3F93sxgHqyN6byQh9hzRu3Al3euklMVHAN
   Qz4EirzO4ybdb2dDvZlvNhz+hldjMMgvT0B5oVT/CIFiz3dvNOrhJ1ib3
   9Uag+p+WmsEMjw7vNCdB/Pf0/XZ2GL6G5yI2PrN75YV6MVERxlS3VCn4C
   vz5CRS4BHz0/bg8mrzGFxXwpobM1o0USyhaXh079FQMZEYg8mfYy3kpok
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="309081174"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; 
   d="scan'208";a="309081174"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 00:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="667107318"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; 
   d="scan'208";a="667107318"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 01 Nov 2022 00:13:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 00:13:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 00:13:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 00:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndKT3exYTXeRB8whEJb4RWUKCFIC7ZxkZy5qxj0Da58sLVf/7Fk79fEx5mCwzn919ptF3RRrslZLPU4nkvT91rAWNpzNWTbB4OAL78C04ZTVXGKW/1bcvJwI2Y/GN+cK4jUVHqBXeM1n/tvrThAwFoeo2PXdzQNCbz/9lrvvPI1EssZ3iZZaJK591mJSiy/DaIUHqXmqO7zF6OteIdASKpd20txoyrSac8mUMFGYdmZvNJ3Jd8l40d15DSutVZMmUfsXUYg1BL/GoPixwH4sIfrueL9xmgyIbiN7yjAvakihC1ZGZEXIM2F7MozvZuH6MM28plKrFwk/k3y5sMZYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p4Bsrw1XY9FIWjmYr2KvMOPYb1Ld25u9wKOLFIM+dA=;
 b=TlFOqJgrFMpwr+JRVk/5Nn+Ozw3vdGivwNU7tcSImRhkBh4lCfrl+EgTJSkEsH5fNPeHHb22xagLD7tqaTMFKjTSZGTbpCLgrsa1hnLNhsTC1HlVQB2Z1w89Z42o36c0soLj1FCF929qAr3bPBCPnJ5Q+e2csHg3Z9/LHCZyz3GhLtdcKZDVHRFzV+rz287l3rILTAe+PhHZ45ty4D4wNbHlUw/MMop/neEzSA2rL46LpfItPHwU4nWxOQGPFyKYzkHAZUCwodf8Jy+C85kMZDRxJLkajK1oOy9ixv8QgAKzqVamLJRUSWYQXWUnjGBP8mjNGiYUby2GEszw2pSj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 07:13:52 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::f36c:daae:59dc:4c44]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::f36c:daae:59dc:4c44%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 07:13:52 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.5.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.5.rc1)
Thread-Index: AQHY6+uV9CHVUhDZ8EeOYsxaslS6Zq4pqgsQ
Date: Tue, 1 Nov 2022 07:13:52 +0000
Message-ID: <BY5PR11MB41520D9DCE429F0981085D41A1369@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101842601f9cf-23f5c96e-dfa6-428e-b81e-5078d47c3039-000000@us-west-2.amazonses.com>
In-Reply-To: <010101842601f9cf-23f5c96e-dfa6-428e-b81e-5078d47c3039-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH0PR11MB5111:EE_
x-ms-office365-filtering-correlation-id: 2683636e-e953-40ed-d064-08dabbd8a1c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jp1ssbh+Ok2nF3Lv2aWxU6y8N5WmfgOmY7uPe0KGhXXdjUQdlreLxqXo96P7BQ09j/qNxig6rmTZyEWh6RGCYqTjx0fODB+zW/EDkRmOamkYmKnYMORm8t4sNrC8m7E+XIZiKs4TT5IZ14QfIvN9LIJ1JaSz6vH8ZLljeUlq99wv5vIDb4KMIrJeH5PUheEDrwC5TNDfL3icp5haDczuO9qAW/3OnmzSzPS9ZIPPUcDojt2Cd2N5JZv3yrjsb4jxPGIoIkuaI/qVf7oleBZKcTVgWCDHc3JyFopjo/SDL0POliWGkjIFpaEX/vZ0DxpTzGrN5JXXPmKNtJ5Y7l/gOQCB60wr1FjgGPofDQ7Dq/mU8+i0yqFOm9EPofX7zEISy+I5iPRnLweJ1trSPds6l+KoPRIDiPoyJ6pSf4ItW4doABGJZkMkbsho4r/B5ZqwcBlopI1J1FV/2rJe9q9Sh+3GfExlQHe9mCn2ZlpXhPOAfkLihPAf8bOt5jhTnfaJy6i4U209CEKjIPUT/0rq8vTZi4fsZIGpAWZApKPLOrnzpeGiu7vh2zIXsmx8M6Ik5axtSvdeJ+5O4zjZL25Xii+DSTYP9Tp0TfnGpjgJ9jgF/q5CRa5XSVvxb1Gzuhs5WFhQDKUCDH3TpZNj3X2Q4Z7NFmDneKrpkH0YNZ0Ac6ylxdlPqYo+8J5ZwyAzOpghF+MHoM35qqns8m4Oc9XuBZOPuIemtWkIL9esJzmoqNb5izqZkcA33Bh0VfsVTvuFwQ6WO3cD5+LTnbDG4xuSBHEa4Mpmvf4/eBsRr/ltz00=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(38070700005)(86362001)(122000001)(38100700002)(82960400001)(33656002)(55016003)(2906002)(71200400001)(966005)(66946007)(15650500001)(76116006)(64756008)(316002)(5660300002)(66446008)(8676002)(66476007)(66556008)(110136005)(8936002)(478600001)(52536014)(41300700001)(6506007)(7696005)(9686003)(186003)(26005)(53546011)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BgPDmRwhtf1g8YXSQNjwYkFAseFGftUj9UKCUnsvkSfAbvlAUJpjb2UvX5GX?=
 =?us-ascii?Q?LRSfXNYMZ9ANV+mpLqgKtoxbX0+mIjGTl0/XUJ8Vz7yWeNJ9+4mpxFbBpzxN?=
 =?us-ascii?Q?oQu6x2/92Noi8yAfhcPdQN4Cpcp6bovemRvWNiZGDpUx4k4KiMmvrnOczMcE?=
 =?us-ascii?Q?MeFcnMiL5UHZ2vqfrhBTaMpn0JAV0h8A3AZvVpPrVQf4OSR8jRqr/aodROr1?=
 =?us-ascii?Q?WO8NDcgOALqRucU/jVtBPgHUWzanrg/bwHVVriTmkhxXjZBbbX8d/EGiC/hU?=
 =?us-ascii?Q?DNZHgbwenWY90rKVFfdUGqwJa15Y8KII7BKSmxUq2OLGmaRnT7ycGQ6JlE5j?=
 =?us-ascii?Q?RUWMGYV2TaFRydQE5ySuvl4tdYnykUA3x4V5RuEhcDQ6T+kyvgZp5hsVNGc5?=
 =?us-ascii?Q?G57Q9cBJfsMcUWmlNU2HcQOk/MT6el4bKboIZDPdZZgPtFP7TxMhJItRtBB7?=
 =?us-ascii?Q?e7hZPZyPpGyoNFi5OaWJalf8cca2OIgW4G41VWemwoOIZAusKoB+3zxbh9bn?=
 =?us-ascii?Q?4VDYzKOekBJ4cdPLMR9I452Q6JmbbWXDB1WAvBNRCEvbJXCdc8Xjl7pjLIWG?=
 =?us-ascii?Q?T0JGrQpNzcoNOx1sKswOLddjRmWRvuDTgBXih12x+DDOq34RTg1Sx0TB1qLJ?=
 =?us-ascii?Q?f8hHViXshGINcGX3xOYbsqYS9z5OUf89098UCfiHMGunMSoYGrZx43jL5s7R?=
 =?us-ascii?Q?2IrRhmvNrP6ySGixCXfZDqaXnW3i3v2HxtV3nzIf5hvQ/4pxlLVM8L0mYOQp?=
 =?us-ascii?Q?IgSLYLCFbDxRAcxD+QStSvpd6qBQkXaKo/2GtSsgQlwd/AWsB6bWHycJzv5x?=
 =?us-ascii?Q?RiutvFj55RF8so7YEJ/bzt6syhM3SEmOb+WPvrrUgmSeJxfmPlIhvkSwczYo?=
 =?us-ascii?Q?D8wvgDuHkcxxEPvpH1xNS3nzBjXVRNVSFX8BmQrNgS+bgYuXIKFEPuAuIKbI?=
 =?us-ascii?Q?VBYXfqp0T6T71zFIzxKdt85VSKhBH26xI+HVHgNwyZNRY46CBDnebNoljCQo?=
 =?us-ascii?Q?KxWH/mgsfqjA+wepVd+F+wHn+Gtkv2UMRgo9OvoQgM/u2uJUMtXA6P0awptA?=
 =?us-ascii?Q?3Bgq2ulLJ3dCLFGiYNBBpFLncOqUN9I2r6fK9JZjGnsAx9gsLunv+tONwcDi?=
 =?us-ascii?Q?1GuJaVybd08kGtS/WoyGo2M9WMGxncL2fbRf+ZLj0EmuK1bF5OXmSe4aIT1u?=
 =?us-ascii?Q?LQxEo6Q91FM/IMO+AEj/C2l5+b99TMFTboEadOeZTaeiHJrGQdih9WzW5kHJ?=
 =?us-ascii?Q?hg7L9DcihktKXM7X7h0UoxXVhQbjMPfHJWuzP1dVR4tYzk0RHO9rmx1JNvrB?=
 =?us-ascii?Q?SJNbV+/G05wHeJmyjSXDEY2AZnp32MZOPhMwCPiNJ2Sd6hAn4kAfF6jKAtlJ?=
 =?us-ascii?Q?mIdRt6fVp0QhKjjJkx9Ez+TbSYViPFZwzVAR8BNERsNNhcgyfCTIlny1zdgn?=
 =?us-ascii?Q?Ipgf6qS9IfuUWsyxp0Wv7+HdeVMv7GuW8Nfp4CHyD9vgDqyvqQeJu33TgXMI?=
 =?us-ascii?Q?dYRYDN4tfGNi8rlt89/W3LR+3RNlhAqRcpa3I/kE9l4uEc8ftObn7j1Dzfwb?=
 =?us-ascii?Q?4dfGZDWmsa3r9K1nz/eroUVEidCkE5W+hqzNWUsY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2683636e-e953-40ed-d064-08dabbd8a1c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 07:13:52.7878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEE9kxScn3CjcBLHdomYa+g2ko9qR/zo0LwosAFvPWOLeE60ZBY1uC18HWONSMn4w6YwCKqhdFmTT90Rhfu93Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 07:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172351

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.5.rc=
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
ETA for completion this Friday, November 4.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Sunday, 30 October, 2022 7:10 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.5.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.5.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.5.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: c90d57497b9bcd237c3ae810ee8edb5b0d2d575a
> meta-agl: 14b6f7b09f6a915ca8c30e9d069e2e5d97e3de08
> meta-arm: bafd1d013c2470bcec123ba4eb8232ab879b2660
> meta-aws: b764a5e90e7125ca2ca49a0e9cf93b10e1403634
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 01ad1a73aaab49d377d14bad8a7dec48f86cba83
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 744a4b6eda88b9a9ca1cf0df6e18be384d9054e3
> meta-virtualization: 9a487c1851aa2021cf24f951957e22fd429c8025
> oecore: fbdf93f43ff4b876487e1f26752598ec8abcb46e
> poky: 2e79b199114b25d81bfaa029ccfb17676946d20d
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

