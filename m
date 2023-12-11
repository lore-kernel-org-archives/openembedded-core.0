Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1475BC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 09:43:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web10.4799.1702287781684540614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 01:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Onru70mq;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702287782; x=1733823782;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DnnPhu87ndJfg+cq+IvtPYxY3wyw/SjVDF7MJOlMz1Q=;
  b=Onru70mqrQpc03U5Z+NqUNxwz9IklGbZJSAQsCqQzGRuJb8A1/ZB4ZVd
   Yectdji2GmWp4U7DCicIPkljJyjbILrGrqoW77jpMxpHq4m/5iXISS5l9
   VHMACUvE2PpMiwVtS7ddwZj8lW+DpM0/e2gff7A6+ceRT9PTUduG6BTBl
   fsUY0COwXlrLdReIvBQdnwGiaEoWWuLwaA+NyO3R9PTG7lAz8hL6TAz3H
   ufoXWdp62+L39094EEXxJWudZp6VfmeK/AFsJITdjTswx+/yoH7eSaAPB
   iaemkc2U/+zuc9PgHmKxso0ZpZOnPjkAMjMgZfWWWiuNSniq1EeWbKaXH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1689741"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1689741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 01:43:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="807236491"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="807236491"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2023 01:43:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 01:43:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 01:42:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 01:42:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 01:42:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2Kj/74ZR/DYJEcUUuzCeVqU+YkDKZs0+ULQe9v4GRlgxgfkKr8JVTZfbIiJ0yNrRAR+eAH0g5LChQ3N7QL0xrMt8tO/mARHNPnjOZJsd92sC8/tc3Q+aN8UlIl5oaT70j8EzDkDSpdnwr6KnIe1/isj6ROxRIXk5P1bWjsRatGiDztP3xpvy8FZCn7PTEK4bRy7GrM/Uke4JCcGud+Fx+SXVVOMafccKBVgMmE/eX4fKNSEVNWN8P4uTq3/fuZ45fcFHfIs4yGts6fFrUO2QrCouH0sqJwK28MC+ivCZZQe25G2IX806kbPhBrnSrr3YeovwFyg5oBg5+vXAIMiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7Aa1q4mG8lors5Cm/IqIiqbtaC09F/mlBAD0m9qSiA=;
 b=RqZC2CVw1PTOd2OpfKJwJQYVKn1eDVtQDqjNGWWdxTLO8jlUrYiMXBu/aAksSSJOzKGUVS6aFCtpLeuzN5ew4cIhnkiZMJzquTBm0lgs7R2nMNrWFz+0M3E4Xuu0AenxtR4+kdI78naGLxYO/R6+Wvnt6ReL+WPYboDyKyFn835lRWUfd7+ZSCsTyfcgoraRmKji59wszgXWRHI/qhk1RPwTN3i2eYJUnCEY0aMKNVFkxbJti689VHKOy1DNUi1k6jqODFCRWJ/qdlUNYm6GM1bJSMsn5uJdDLPyy6xeBXtRRriOJazXyQd3kWXfUWst3lx0fq8GeOx8V9TBP5U4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20)
 by BN9PR11MB5228.namprd11.prod.outlook.com (2603:10b6:408:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 09:42:56 +0000
Received: from BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::36a2:7233:6d70:f90b]) by BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::36a2:7233:6d70:f90b%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 09:42:55 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.30.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.30.rc1)
Thread-Index: AQHaK/JL+l2Y4xgDC0Sm2J6dSJRkRrCj1HgA
Date: Mon, 11 Dec 2023 09:42:55 +0000
Message-ID: <BN6PR11MB4145902E9E231ED340C50E91A18FA@BN6PR11MB4145.namprd11.prod.outlook.com>
References: <0101018c57550f06-92c50d96-7351-4371-a312-05e8561e6e9b-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c57550f06-92c50d96-7351-4371-a312-05e8561e6e9b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB4145:EE_|BN9PR11MB5228:EE_
x-ms-office365-filtering-correlation-id: 54a67e66-6e84-492c-3cc2-08dbfa2d8d28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qe0iXktwT6Zw+cf+RvQg1eHXhssPYOlBwIrfHCmVae/AJByKBtyrEBDgGVLX9vxzqXd0t8II3IWccM/lWtGEZB/diny2AhrI+oavh4RQb9XoVZdJIhUaGoDLatU0ZfUAqlAZTWmXOPMBDVSso0aVfG5zChPDC/X03dsask3bhuIsRt/FO7e1c9AbHMz7b8COAppcd5IVCiWAfMdka4pmUiX3RcH9vksC4X4Ptru/SNLKqctEmUEspJzSCrgS2eHJ+gv962HD4FoDix0A34tIsZ0T9dxMvkvC4JTi/8vLtTF3qZ09RRa5PhsymhG9V7WmdeVFYTW49zDrnMSETLIKIX7YW1K7XKE3R4WTzeQ4Z8TNELOsRbuH/h9qu3RUE6zAVXKh5tf65n15Z5+3PwN8n1Tozm/L/aM5tBCG0DgNleQxpgUqUvvcl7M1OdKYp3Ww4xwCkhf8awXHAiaT182LMQzm2dJbL/bHGKeU9pvhTSW7tENyedknQL9zyK5a1MJcGaUdg6EF3sGnRBmd/OeRRUvAcX/ju1Brz5E1SEvk2gh+i0lmVhR+Yadmk7Ui4G8gBi/QqV72q2q1tDCm7c8KkFmADmsmrWE9ZCymQTtMsuw1K5giNcuiUM2PDXr2J6N31M9D2KZkUZa4eAANRkEr9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4145.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39850400004)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6506007)(7696005)(2906002)(53546011)(64756008)(66446008)(66476007)(66556008)(66946007)(52536014)(9686003)(71200400001)(122000001)(38100700002)(86362001)(33656002)(15650500001)(316002)(8676002)(8936002)(5660300002)(76116006)(110136005)(966005)(478600001)(55016003)(41300700001)(82960400001)(38070700009)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b8TDARPCEKStJgz8x+4fMUAvij0W+/ITfwKnc8krVfKFVudL39CXleeK6Hy7?=
 =?us-ascii?Q?DtHwiWInFimVbCShS2dA1tLwTAvbJzke6qf8ftbkoD+ir1n2wwRsDq0LvPhx?=
 =?us-ascii?Q?9F0Vu3t8KvhUlKijTFGjaEp8XvizgkqEWYmMxIhmTEuGHPnIlh5/75TxNcp2?=
 =?us-ascii?Q?7nnATG5VXVJoemdZiHtLvxmhxS+NOTX79aoFAWzaLxbPu5uxOcX+mLJwQuMG?=
 =?us-ascii?Q?2X5AiXlswhUcGwBdv6YoKcK6oIGn48IWz0qsuEU+lebrjTcn5ilheIfEN+Xe?=
 =?us-ascii?Q?XaaAMOxBZJ93BdKIPHuAoopeBrFmaPGg2DqE1su4NKCLZ5VptkASzB0aA1Eh?=
 =?us-ascii?Q?MNHURAGR2BqHwokTtQF4UXKjETE6XXWT/SOalUshIJ/A9RDFUltXadmYn+If?=
 =?us-ascii?Q?Se1N+4GkoQeWZUjBa8Qr2FJxNlXq1GpeqJ1gQy80j6T2t4OLFrRWBYfAq6dV?=
 =?us-ascii?Q?V6rP84g3N45YuzU+5RcJYVP6G1ieOdOTY0/3DV6AmaM2m4X5/4RXFDS+ehJS?=
 =?us-ascii?Q?7jgJhLjo49OaW0998agT6a1+FwTbqBo77QbCSy6fitoh9bP/WtCvHBXUA7yy?=
 =?us-ascii?Q?CdWAJuiGQZkrgMDroRqHo6ELBbep3RgYUsZrDxwN7DCnOuFEEidF39WGUazf?=
 =?us-ascii?Q?EV51HT+KB1MPqpiyP0cGAvJ7DfPa99EFFVsbKnBKi/LsGq3pxmC/Cr1UZSGC?=
 =?us-ascii?Q?bwMAAJFZDSsMt7d72GHzleCPa3gm0gRqypSWKzitvutVla6X8Tg+pfbL/hux?=
 =?us-ascii?Q?PkR8qJT6w1Q6zzZe0L7YBSl9/K+pFfRzyppwuYJw63txfKBmE2ZyrL39Iwgm?=
 =?us-ascii?Q?FiIEIrWZVELpjmNv8vmrjliKeagyptPBLiMuz8E+gDivFW5Q7Z13le/RmkZH?=
 =?us-ascii?Q?u4/Nf9RghJT4Tz3nPeM26jlkO6ewqtZUA1zaQS7nLjV+wL8x4NiEqd2nV3kl?=
 =?us-ascii?Q?rAzIZyg0BmMcHy+UDWlLk4TvDxxH1540xr8wiwkdpBumb8K15ONy/baJBRYJ?=
 =?us-ascii?Q?64PH6ZyhweGuOJvZTumFNGuo5HLc+/kxXzfEZU8g43/hy26FEZ4l1KSFdTao?=
 =?us-ascii?Q?sFpK3lUY2My3ErtPuSDb32qQzPA/wnpIQP39B/5HFyImIUocIQbXILN4SzTy?=
 =?us-ascii?Q?vAnF1R4wViulivAxLtQS0tWQFOIivjs6Lopz1YRCKOLTOz9Kgo71iGfgB8Nk?=
 =?us-ascii?Q?t753UWGXzZVczcD/KGsZ9FqoRAJYYKOSfDhzLZhTlZydHLfG7SATtwvZpwMt?=
 =?us-ascii?Q?+9wJvEp2q1DDQ/YXES5//G7gobu3kAWcSQ51OMahJqscU9kC3Zq9JUo9Gofi?=
 =?us-ascii?Q?zvbwbOUAT4kqABXI9cQIY5HKG9azysKiLTkoI72k6FNAFhafT+B//u80FJl0?=
 =?us-ascii?Q?MY5r9hgI14jiRucdM9fUtiqBbUJYTXee9dwE67n+8joSpKJIEi5kkU+xNw+a?=
 =?us-ascii?Q?FwFOxLY5ZsEkeEphUKvfauMaSpqJiiKJfrt91LuiNgLcmSmpUhxbqDl1246S?=
 =?us-ascii?Q?B7LlrDdbeUOSBgOr6QopD/sV1hR4wB1JUbljl6Gx5i611rjXSOxPt1mg8IEB?=
 =?us-ascii?Q?3l/LPD35MPm/xVRgIeaw0dmixAMw8HtLvIrD6Ife?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a67e66-6e84-492c-3cc2-08dbfa2d8d28
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 09:42:55.1488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J8Y9vNCd+T16Wei5lyk2DAM3hQoJcLPIZqVcDuhncv3zfUBOG2Bx393TjY4rIl5G4GE18Y6j4R8e+oXDah5sig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5228
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192151

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.30.r=
c1. We are planning to execute following tests for this cycle:
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
ETA for completion Friday, December 15.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Monday, December 11, 2023 1:24 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.30.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.30.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.30.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6316
>=20
> Build hash information:
>=20
> bitbake: c0d60794a32e3f8bbfbbd6800d87ef2782aacf2c
> meta-agl: 512d244d48ba0d33f609f425a6e8a907b178cdac
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: f3ba81625dac2e5c009e73ad78fec23b1261bd02
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: 9135c7ea7350d5d241f4afc3b28087122ebe2d19
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 7e65b351fa8eda4ee7b9f1f2a8dbfe14e0ef697a
> poky: bf9eabafc257a7d3c39e3b4a46cabf7e6fb8270e
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

