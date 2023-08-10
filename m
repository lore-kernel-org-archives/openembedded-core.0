Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F0AC04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 04:28:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.10392.1691641731533692627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 21:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OBeXDC8z;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691641731; x=1723177731;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8WtKvkjdsIfKqiE4zkEr96rPZ/6xIwMKiCRboGc7Sro=;
  b=OBeXDC8zL6qiGPtTmOFdjA5+GPbpibjegi1YeiEv9SlZcWufr8Q53SwF
   rX2RJnIEXcI/eEr2HiJ+Bcfml5Llt76bCne6e3zE7khhe0CHJ9YVvRO95
   hMj2DzvTurpGNBKjiVuQhcyWdwph1b5aZbBQfmjCICL/L2t5bBswCSP+u
   f2/mY9abcvwiDL4IbjFsZNiW2Y3VMY+S5M7ZG5sImiALElEGgV3pZ/yCn
   EMJpK6mdsBHT4lIcCoatSXRsgN9t0DPh/y0iQIkeBMkMaZQGnY1jaCaF8
   0KfKjU6W5FxIQV4ksEKuLAAcIyQRNo4wnGd2IOuDrqza91XE2T+xqunGB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350875492"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="350875492"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 21:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="761659443"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="761659443"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 09 Aug 2023 21:28:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 21:28:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 21:28:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 21:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKzD+s9mMVBaCUOOsegEwqqQrAwhChi7Z3FHnzRzid+V7Wwhmg/0RSPkdNz5X2Yl8yBP8n9nnmR3aTxz9NWTGvca3xWo+e5OVzs1CQgTRRGS89Zq/8KEaaWUujSpxzVAdu7E7UQKWVF3JMtCqGOqfUhjUXpsNgbtOIHVK5thN07617r2sbYRsOtyO1xqF+2caGWc0QQrL7FsgWnIw8SnnnuAeSPg31Dx7+xIRZ3bIRtifplEhqjdbkORnkTXqajOo1R8KXUyFpMO+X4UqScYQRTmJOpTv6c6KLby4UXGOYrRylARTLW0PvgB+KYb2OZvJso5cbcVRuaLIbyeJykccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUynGyTvye2NP6+jyDSqhBz9ort2IFHj+3YuJZ94i7s=;
 b=ZQs+x0T2JNAlHQnV+VZq7k2ePZogDeWnNwdptHLOOJ0NiAYW/WltjhLQe65oO+jYosYIzVx6+lcMarQHDPrI/9OGBKjIkOKXIe6fszgvuDHt3UL5rcdRz5ofoVIUyNTqS6LtyN15H8B0iecpCaPVtcIY9Qjt7CeC9jXASCjeGZ/h5t7ccVygmMEWBeYpXbzJMFWREtY402KOpGiHvS2vPG1JgQMvcmTpgV+DyH3OCNjIN4tkm+meodIMvQ4IzzSpT/7KTVoeThCjmtO1iAnHi+y9SLu17WRIroGoRjUpr4JMcWdDmVtz0U4H2dop0eSIu+IxSAv1fbqlaxHJ4VoiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS7PR11MB6015.namprd11.prod.outlook.com (2603:10b6:8:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 04:28:38 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 04:28:38 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.27.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.27.rc2)
Thread-Index: AQHZx0nfvQ+ppIaAQE6CcMKZq3RdyK/i9ypA
Date: Thu, 10 Aug 2023 04:28:38 +0000
Message-ID: <BY5PR11MB415297F15C5BEA3B68AE9204A113A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010189c3a931b3-c5f1811c-d9e0-44fe-8866-ee1f73ac5306-000000@us-west-2.amazonses.com>
In-Reply-To: <01010189c3a931b3-c5f1811c-d9e0-44fe-8866-ee1f73ac5306-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS7PR11MB6015:EE_
x-ms-office365-filtering-correlation-id: c88528bc-3f55-4388-3937-08db995a44b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YU1nmGcLSrno4k4MAHkbBIGa6WqBV0ZqHl0HMV1eaf8iWk2G8l6kDmKQ7v0JEIWsTThobS7GGzRvKvMvBhDsrpkjwNO+eMKdnnUIFb98w9XJ5+gQFTuaZPKF1bkTXsAI+eayLdVEYVqYl7+Ic8cYtetZRmFqhgRCnJYko1Aivp8zto2D4ntrDH0M4e9tE61bHyGFhezonS+80oaUmmbVGsBXAr54LEDAZjViYLu6oqF+ejF8fQtw9fKysg4yMHktNVfYJNVeDDjlOeYyciw1a9L7g10bUjzvFWg+MZBwMUYDgn5EC8njPiPtSxhUX5bfBrVjE/U6QyAz3Bkm+7Y4STS+s+XGz7L2hubOStO81/Cy64dBvRUxsFQPRdQVoQvn10g6TG0SceY9n8NJO/O3rYz8NmhKu3zo+SHPBBNpnP7aOzkpYrTDYtrVAN7L0usGMdWXTeLRj8z392oiIElLg3JesB/VaQPd388moHnkwa+YbDLIc6HSMZMjl5B/R6ySftnq1e1hu2id6AjgRe732bfXLGjG7GsYdQoiLTHswKC00a/9xeWBk94tLNy+mYyDirHKZooMkckiQ8jzoDuouvCfJdr9QmSh0ahqKTAObzWAa4EoYwxsvNIl14iC0FFdiA5mdY/AtOXjgzLWA0EqbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(1800799006)(186006)(478600001)(15650500001)(110136005)(83380400001)(38070700005)(33656002)(26005)(6506007)(86362001)(53546011)(122000001)(82960400001)(38100700002)(55016003)(2906002)(9686003)(966005)(71200400001)(7696005)(41300700001)(316002)(8936002)(8676002)(5660300002)(52536014)(66476007)(66446008)(64756008)(76116006)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wSKmkmRY8lDd06yjpUro84kS3PxIwzL2b0wZbL/0tLgWBjE084c6c/qIrKVf?=
 =?us-ascii?Q?I+lW9cCWePB5vqoJvDsklQO+ddr1li4bQI0hbYixWxdjXKBOWNZA7T4dMgWB?=
 =?us-ascii?Q?E92Ey4qxEGDtMn0K+HhXc+M7cVItwudaygETc7M8IiN9t8Ezvpypu2UOLjPA?=
 =?us-ascii?Q?T2a5Qv0p56doM6TttQCQV7jsJHOPAnERZjpNrOHsUGtETnpirzX8uGjfZ88F?=
 =?us-ascii?Q?aS5eCtIH5o19Eg50dnlhr6f5jS32pFBC0QGqQocshAtE3BWIRBwnxDl+TNfU?=
 =?us-ascii?Q?m5xHj8gLkkt+7T2bF2+8yZVSlC2syeBDpMirDQJGZhXFJ9r1fGJO337CTRdh?=
 =?us-ascii?Q?Dsc3MeqP96Dikn6QM18CRXZXBXQdxw7EsUrR+Tmb1BwxAYl6JWoHH5Uct7dN?=
 =?us-ascii?Q?wxjnZ/kESD//bgO7uCdYAL0qO0echBLHeDQuAeo7wzNHzsvzG+pDoRQGECHm?=
 =?us-ascii?Q?HkQRGw1s0Yz9SsjL5hr4xRt/pkFKqrspJKJFk6pt7UTgrTZrt1K6E3zTiTYm?=
 =?us-ascii?Q?8PVH0hQZvlX7QKcvbmLuQdZnyo5B8FsTb73gKxSQ1V2/+H8NJmVAKseR4hnR?=
 =?us-ascii?Q?94quvATPmWWUteAq6gyaaO1dPaRkv2lZBTvyaxfmHBFZwtdLYrVB7V3+IrN7?=
 =?us-ascii?Q?MVF4AwC1QMEuonydexOYmABBgYVdNyBilaMsibTPTLlkJIIY0IMJrm+Twool?=
 =?us-ascii?Q?V6upH4JLR3nP/I/8DiVx0lVktLUf4yBM81XMWmHq3+9M+gs203+L3isfhlHh?=
 =?us-ascii?Q?v0baZVFi3txd7GMh1WBOg1MEs5X/YbyS8mV/wU2ueY13hxorZHb+NjBkbxhB?=
 =?us-ascii?Q?pavYlZnrhptX2djHfgwnLdffQWyO4awHQhsdkKDg9/u8OyJbQvAO52wNooI+?=
 =?us-ascii?Q?V7Y4Wpi3+dwD7e3OvjhVM4b6lQto8G/OEGez7sR+hvXTqORe05AeDEE63RDG?=
 =?us-ascii?Q?L48Qs4Zow7H4c0ffykZiq7mJaEKXmckYPZNDx6DrFb861u7umo2dvmvzdEvf?=
 =?us-ascii?Q?/bldiQMJ1N0Eri2J5iFtBNwhdy6VLiruEt8AuamybZCO4doHrkkHNl4LGtyX?=
 =?us-ascii?Q?b4Ff2yI6suwTNcVJeyhcOhexT9bTrpZ8a2yAdNjcyyAavksm4GtPNt6V783p?=
 =?us-ascii?Q?FeWXTr4ibQ/6hTehahYXvxeEAuHI5FHO8lV2N/QvtSQmeNRYndF0k/yU5jed?=
 =?us-ascii?Q?bx0T+D3yByFg/D/U9LyghQzHeU3oHisamcfQa8GGwEHNHr6fxfRpLcGNnBAF?=
 =?us-ascii?Q?4G1PMETQNaZtOJKlSLBStQKqOFO/cDTDQrctlGvgYf5lDAjBL+2rziVwKxWM?=
 =?us-ascii?Q?H0G+wG7R3Q+2FLBbi4T7LR1q2RUJrb8oKBtGGW9FeqzOkh9zByVhaNymtkMS?=
 =?us-ascii?Q?CLs3OQmp9Koax21IGCHy6ABQxQrMIE5mtMi9lptda3TgNNKNl11ZfW7nvuJ1?=
 =?us-ascii?Q?SqVJIg+HF0Swio4QezZNu5O+vBY2utIsgZKV2JGA+nNzJaAm1lYShD2/zgBZ?=
 =?us-ascii?Q?Pfzt3iLnpwDlZZanWjAzdsl7NG3U71eYelHNKCgFxS6An89AsXueuRU1ACeo?=
 =?us-ascii?Q?a6FxbP4BpHwsvkbWN08/nvefdp3mqMPLqWASHMKb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88528bc-3f55-4388-3937-08db995a44b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 04:28:38.1958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NDdnW2fWgVvk8TA4niT3TUeKB7kWflo/fsUkD48vSGct83Hn0sCy83+pJdm5m5ITpY/9D3Du/K0Ta4KqMY0RbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6015
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 04:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185722

Hi All,
=20
QA for yocto-3.1.27.rc2 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
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

