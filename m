Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22FAC00528
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 04:50:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.27455.1691383794601675194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 21:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QbeuS1AT;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691383794; x=1722919794;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=siyQvgbShB696EbTeT0TpRntsGURws36A3qZ5kaPq1s=;
  b=QbeuS1ATCUXTtiA8ylmzRATH3UscB2B6fPycjd2+lDZClspTKoS8ZIQQ
   F9wWOn31wobI9vlUbDBxQIYxRNSUnzpz2+UmU12cYb/ztBvynOyNkRF6j
   Vv6Ed419wYsE1nE/NA40zDnGvVMdYgnlDq+x2/Lr0cBWwQLyzVoc9utQz
   kcUvOK23HXWW5GKs37OC2PUIIVUrvNGA9x1yV9FyWaUXVy32JIkWmqjzz
   eVlIbwuVHWEztIDpN7O9gLVEY3n7r0nMylR0vitcga7aoIYgLMgJ5IzT7
   DKRskAo8lLviVASR6u3pmyhmQCXuHtffG41qdJW9LooLOPOQqhHAWbF8v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="434299865"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="434299865"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 21:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="733964174"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="733964174"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP; 06 Aug 2023 21:49:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 6 Aug 2023 21:49:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 6 Aug 2023 21:49:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 6 Aug 2023 21:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IR9a7bWac6w1zyokC9KUV2AMh+HEGJ7RuF8NH9lyn93+LITMmBnl91FosRDd6ag5iwYM77bSp+SZ4C33DoPDKt5hhQYphuYjMcn0B4AHlwoowouCfWbt9+CanQVpBTlosN7xAqijV7bMYHOimrwzv6GMPCFvMFWZmR/QugmqdTSCI17oJLomEY7Enn1PvPcMH6CBWz7kxoLrqGq1x24uOSNx1/mqjhaLG5HTUE6Jn39y1V8bUzQFtSuHo/kb8jh4NagNr3VRW2rrq4xnyIi/7zwIHGSt1FL2ERTAzOvpqFSBdCsRlmHpDPXrb8FBmyQEQzxOz4yqzlc2zk7QQB8FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zE4r0UNqteWm2Gs+RLxKUkZHJ2LTtjB6dzY/OvRjyg=;
 b=oKBuQRhtAtMqDV8G/Q+Vp+Gtx9EiMxNV5BcyzR35hwwHTVeVqqNQes/5F6rmthJh726fd+Zt7X8DlZi4JQYMCeJoeJ/KVG8QU8lmFtBBc2S6kitJA3iA1sGUxNoGqfnPYy6UB79DTRxbrj5+KZwmweyhKBRNyaf35GDYbujPQBfCzgMCWuMXmCiGLJRHBkME7BAyjV9Vq1b/73p4gzwaRjM4wA3dNjMnAqkus4oYXX4lqUwVJuE4IJKUFgcExOm5TvWMxJbTt69dNQlDgSBsycA9cJFWx9vObQ5WD35yxgPt5gCMNAk0lNz4s/2reCtoSSzyA8w3A7kwNbKH9rrz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 04:49:51 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 04:49:51 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.27.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.27.rc2)
Thread-Index: AQHZx0nfvQ+ppIaAQE6CcMKZq3RdyK/eRgUA
Date: Mon, 7 Aug 2023 04:49:51 +0000
Message-ID: <BY5PR11MB4152DBB7A387C14365AA67F2A10CA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010189c3a931b3-c5f1811c-d9e0-44fe-8866-ee1f73ac5306-000000@us-west-2.amazonses.com>
In-Reply-To: <01010189c3a931b3-c5f1811c-d9e0-44fe-8866-ee1f73ac5306-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ0PR11MB4974:EE_
x-ms-office365-filtering-correlation-id: ef059fd8-a6e5-4ae7-2080-08db9701bc8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2GPGXID2qGf5v0ANF1NOQh3wMKZPHhUl3Tnhsl7441/PlW2p229xnS8Lp6D34kbaMbi+UlbrEx4GNX5NtxFf1vY+8c3CFZ3vLVTMuJiIJcUR8IA8+K3dbU3sjqX9hmXU4NOjge5J0smsk2jB7CgqiQjxstv3JRd9rNJa5t5T5honeRdY/cgfMHi6uN1Rze7/3YU9aG8ZwFLhncKPOOjQi4nTgj3tVXsCCppruONLtCL9D3Clk3Zj/YXkR3JurmBQq/Ujue5TxM8I4tAGdjcegsnFLZSOWXxdIv5abnmS7JI3YSXUkW39YG3EJP+w8fL4FKUD62fFZVYPUeCfkTYsvRU8sPWzOknfgDvFyCzJDhZXrbBjJxFACI32z6UVUPQwD+uNgiCN0yRdnrdilgr190AQLc/7Q2JdFc90N1hqR1XOJhgEvufihVk9T3ubL3Nn/vuZyE+EWIWxdUSRGsSZo+q2b5pmer/mR7wlW16pQETbV4Ax+S5hCfTBctZWak1u/sHUTdRuOMX7gOSnIluWUig/uvE8pZPa167YpgRGsXqWSkZVqdRZMNG7Y8InFetw9ZHZpv6Hkf63spKWm6BDFXtRJjmfXrNTKN1yaAijmGw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(366004)(346002)(39860400002)(396003)(1800799003)(186006)(451199021)(83380400001)(55016003)(110136005)(38100700002)(2906002)(5660300002)(316002)(8936002)(38070700005)(52536014)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(966005)(86362001)(478600001)(33656002)(82960400001)(122000001)(71200400001)(9686003)(7696005)(41300700001)(15650500001)(6506007)(26005)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lw0k2u0lBvbKMWhm0Uu+6EMtrHB1wVVWauhYbI2UPW3gv/wNfptuR/ZSNkLf?=
 =?us-ascii?Q?Yn/88n/0DDpMnT2TcUAjg8iWSTA7G2xp0KnLuWoL/FSG1NdddIIeJvdWEyJO?=
 =?us-ascii?Q?wxZt2JKoXHeMh8wSs2qBU6DxcVLCA4IoDscSVBN8LaBBzdE+H/JuXyO2cRtv?=
 =?us-ascii?Q?2oIANHKybgWGvKkaz2uHDB2xwa15AahnUxQgLCpjgXUhOIOdOPSwWGMb/IuM?=
 =?us-ascii?Q?j2B+9YKTJmsOh4m/3/VvMmxqXYTo6k2uGqiXXFitom8BYasGiwy/PNKMDK4v?=
 =?us-ascii?Q?NVO3sra+MUFuWlPIzoQIyTCiHBbUYbcS4RG5CYWhT3QqjHwyId+bRGPxBV4k?=
 =?us-ascii?Q?aRk7E8JoT6fmigkp+wK63rP6Yi4R8Pdw5+oHPc2tI16GRTiDR3r6XZY1IVtz?=
 =?us-ascii?Q?qPZj2a+Kjuc4mTMbUCJ1leRuc22jpFZ0gKJmOQ2kEvqXnGie9DA17FILam7F?=
 =?us-ascii?Q?OTIz2kxaXKmtJp3JPq1Ei5VG+3kYbQy2/3ghT25GRzySicoNwMpP35ZuyOY2?=
 =?us-ascii?Q?OzH4MgKdUVwEC78RmOrVc6Bfyvr9dvkNDe5oAcwAWIZaK1uvEapvkQHBYEwu?=
 =?us-ascii?Q?+fgdhyIQSBgxba8TQX6b+ymPFsOpuCd5t8MHs2h+WgQZ7/gFQNh9rqcRrWd5?=
 =?us-ascii?Q?dFyiwycQXmYSj2kP1Tav5l39KoYjFhmC0oH0hu6P4AME3j9cQy0T9qBUaES/?=
 =?us-ascii?Q?YNf/NbufbEWUGLiaECL3qTgBjUB5V5CDb1VGtNnATIuPFICX5GLq2GUoqob9?=
 =?us-ascii?Q?/PSZowfrQb4KF9k+rVRkPTpml76uoY16+x8qQg7M+ZgF9kfAOcZCqr/pJsLa?=
 =?us-ascii?Q?edgKCv6ZrHNwWdYK4TD5adPzlPuKdTuMk2MVIKPqoGkKboyF/l/J5cQaAhqU?=
 =?us-ascii?Q?Ri0mgZS9S7Hki6K/S8yXfvRCx9gbyHSllfmULSO89JmZnGY5R2oKLVuiHSOj?=
 =?us-ascii?Q?aHLaCHI3CnSm5HJMOVeyd0HdLhwaGzpt9SlozpRUVrYClD2/q+lD4oduoljv?=
 =?us-ascii?Q?O3FEzCGTzTTZ0D6+wm1DbNZ6JYACXsWmJUc2ke8QqwLW4sug5MNkeLxBp6+/?=
 =?us-ascii?Q?XmCjWlzJnFbI1e8Z6itCOwEb9Y3uRT3LJzT7COk0B0wdp95kcdVmKiagYgp1?=
 =?us-ascii?Q?0mpvY3b3oFacJA8U0fjBK5Ce0kytqxf8fmM7ebxrPEyfQuM8rpSKBt65R+sB?=
 =?us-ascii?Q?xn9A8AbaS3o5jT7hoZbAg76G8deaWFztNgZAo2nuM1V9o49CCi3tSDGp0EKq?=
 =?us-ascii?Q?VVcae32rxmN/6dPSxO8TPpq1XJTU+6Rxw05MN4E61ihIafQiTKiThrjqWdqf?=
 =?us-ascii?Q?BBrLwoco1QPFUknNk0YNH3+mmFfWnLygj/oLpaMjdK5RCxAmMQWfLVytFx8i?=
 =?us-ascii?Q?6ynyxyFM1/NSBFLblyybK798aCNoBykdyseplAVX+EhaXBposVgFOvO0dixi?=
 =?us-ascii?Q?2mRELRCD75N9J7HCTYgnVLR2TMFsEouOarpShZKY8jMVooks/4VbE5FaDCOY?=
 =?us-ascii?Q?6MQOnuzJcE1RmxKLcWYQsNTdBVB2cfOX2GJRrOIiIBo57oy26b7oTK9bSyPZ?=
 =?us-ascii?Q?xQ9ID/38C1nxYX4hoz4oe3J/RPL685dQjKnqVpRF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef059fd8-a6e5-4ae7-2080-08db9701bc8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 04:49:51.6495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a27aTnw92S6Ky3RDmI34kWRK2gO0vtDkn700dfUgttRduT9JcpFJtNDQMZpNqDePBqwIYtRaOnxAfTsU0VTGrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 04:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185581

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.27.r=
c2. We are planning to execute following tests for this cycle:
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
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion Thursday, 10 Aug 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Saturday, August 5, 2023 11:07 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.27.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.27.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.27.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: b60c7085ec370473bea9b3b4b65826a17638837f
> meta-agl: 583f80f8e9d085a98f1cbab3a9d8082503ab739e
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: d72bb6b38de88caab73047feba16092ca38959c1
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 488af577a3f21f038c551612bb0af077fa2b743d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: b8b0b06821d4d4df0cce4f07fa31a8ca1dd38f46
> meta-virtualization: 521459bf588435e847d981657485bae8d6f003b5
> oecore: 6dd64ca2d726d0b222a7608c65eb0a20454c3f99
> poky: 32da5ee9519119a16392acba29f9df4720a55c0f
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

