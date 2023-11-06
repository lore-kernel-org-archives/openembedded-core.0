Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89003C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 05:01:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.47545.1699246899575743631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 21:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=h0Bc/GrW;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699246899; x=1730782899;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2ZQKVWkQ5PkLnWrtWryLVKjM1CL5lSVBRk4xLu7JyWA=;
  b=h0Bc/GrWjpSxvDF9fn1iEpsxbUJdTysxHWa8bSrf601vphTJM/YsOIrT
   dh2KaIgmb44DbVOJziQPZ8Mf63aZS6gFZg0Q7N573sTAwTvap+zg2H3bB
   NQXUy8OXM/tjGNn419D1CWqmvZFFJI8yFtgKQeOpvVcQTVDJAKMKaSAGs
   85j+8hu0X83rZnuhHdUUpY3hJrf+ON8T/k6a34RUGPi0SIc+EFZ5iMLIh
   qxrC7kqIocEk5/u0xDu4XNGESw370RxkatjBCEOuY1t7RxT7XHJ9xn5DB
   LxZrNtzai/YJ/9S/QZapEZbhodoTtaaSCNqOezwTJN8zFGHxwXxMvScn5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455691193"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455691193"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="738690923"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="738690923"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Nov 2023 21:01:38 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 5 Nov 2023 21:01:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 5 Nov 2023 21:01:38 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 5 Nov 2023 21:01:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StKvdlbAxn8Rc/DVh6deI9UY/ewGTbYrOlOjDK0RwjC0pinvLXXumlCyyIutH3L4Dhp7R/ZBROskITtLfSEg4K9NCAIE2FvRVY4D+K4nqt/Vg12jTtFhh32w8wioPk+Fn15PbFIYP023X4hcyPF//ty4L2lwO2th8zX66MU6C6pZq+dzjsLK1YlwHkIeDobmJiBBOfTqvsGIcT3TYAWOe6KirgrqUbCWZoeU86/GhpaiOvNi51q59659OPKEJptFkS45O+xYCZsRht3wWYqKO8PzEO4Kwlxj/kBnhUnK9x/SVDG25HVXxw8qcHlyn5IfVsA4T3HHNgeKgLJYfQzXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO2M3e401BapXu4LTqygSuSn9dmqRhuuchpeCgMLwgo=;
 b=nSQru2e13rIF5TeiLlg1ikeLKwR5NoVFBbP8goEPjGUOWnXbBk7/unvGNsav7kvLhn97n0E+F7x3rtbXzH3b5RX/0WYYzTiMJ8rlOcmitrcWeMC2eWjwhrp5YvIJhFPbwA/lIlRYQgQJw1SHOm+hdDfiQEnVRqmGdkTkOu9LUIC7Y51Ck9f0+mVSi0RHwe4ydkDO5EDCCpDownmYztNYYVKxf4InyCMXgYoDaCeVXoSq4J8CpnfB4m3v8CBEEGfWNHL1jSDkNhYcd1AnCWDtrzNvUW9fS1AG3hKoeYfBsDOwcqtlQCLoWJVAeSNZM2YcHbuTpTWE482nwnRsQcLY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 05:01:31 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 05:01:30 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.14.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.14.rc1)
Thread-Index: AQHaDuK4YSGtStUTFkSrHRKmwyMVD7Bsvi3w
Date: Mon, 6 Nov 2023 05:01:30 +0000
Message-ID: <BY5PR11MB41524D61DEA240F835326FA8A1AAA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b98e13019-57bc23d2-d205-47de-bd0b-d04b00fe895a-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b98e13019-57bc23d2-d205-47de-bd0b-d04b00fe895a-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB6550:EE_
x-ms-office365-filtering-correlation-id: a80afba5-b530-41fe-683d-08dbde8570b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JAKPh7G/vnonqPQYmhRnjwKbMABNd3i/va1B2m1Ik7UrwMs2kebAudQ/Wmrq/3ODCxZ2DJZIw+rDYXma79PhKwVruA+s8k5XW/YFaevLKxX2H6rsfJJd1ZCL3/rrO6pO0VDMg+p2i5Ilo4SHvV1yR9Av2EBopzOfL9areCXOlFds9ykBhuSne3jfS8kDfFeuRKfS2tvW4Iw0OWe9s6yLATWDo5LGikYV1RgEWrS/ltVzi33LqSGbZkpDtMBxNLXXD3UD15E6DuQ3n33HZLThV0PUbUEZpPQpBQUea2ROkr5qtkJCW1Dlwa5b7ntpcP9OZPsB3dCKHjfzk4no/HWU5EBfGTQsEMlwZBzV+GqpSyl50tWf5f9PiMrMBgklp8FA/zyg2bghH4ntm3AWqz4RoTkQ14fw81/IHNMxiIc4QKst1h/ofj3qJ6sTEVGa3EReMoCVZcHtuHh3gaAoGCCNdJSH+V0Jt1vxL7D3gFw67M/wENTXiQEZzVaZM6V8XDVVs8MPQiXKLbHBr8unaAfibRySYhC8Px5FnwPCfgCcCanUUBMyuGMw97AANvQJAe/J2FucMmzLp7yoz6U+cw/V6oL9E4gHvPwt3iNZNFAe9i5Qga1+EgYsPOoLoZ1QZwznXQJ/Veo2GfPd24X+rRLBdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(41300700001)(9686003)(6506007)(7696005)(53546011)(966005)(71200400001)(52536014)(83380400001)(8676002)(8936002)(2906002)(5660300002)(15650500001)(26005)(64756008)(110136005)(66556008)(66476007)(76116006)(316002)(66946007)(66446008)(122000001)(82960400001)(86362001)(38100700002)(33656002)(55016003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wj88xGtK90QIIELIa89m7m1W9PTPAjKQ4D+lAnIoXGa523mv4jfbDIwXcj7p?=
 =?us-ascii?Q?xdORN+pOXCjuJL1vDA+woGemeuQ/eQO4ZcKtLlmB3jQdFJ+8yeamhP2fkbdg?=
 =?us-ascii?Q?tj1Z5fqyvQSPND/sn+mIHKU/mYaSnI9yOhRTdyqNq9beNibLUTgiyPGawbJw?=
 =?us-ascii?Q?bnsCvz2ZekNI86/ijRrehT7FLjdJo0veAFddebQtLDTJukEGR15snaBslZ4H?=
 =?us-ascii?Q?oog9Aa1aMSVhk4meSVSeqtcrKUbZjRMae0rLSZEhA+lnvScRMTVPOWiJd6Dz?=
 =?us-ascii?Q?O/OiOC+57K/92Gu7q1ZhrwmRMsK+7wbtMvOYSHso9NW4bDFi/XTyw37SNUkp?=
 =?us-ascii?Q?dd/7boqzP9p5ESRfoJ8O3UzQ6ezxlLoF5+MRO1sfJVLcce/7UphYydfGMW3U?=
 =?us-ascii?Q?l8Oo2R05hl+AmA0RFP2L9C3jhlvkhAY2iOM+Fl7+QJ7jAxOSclymR6LZvTWO?=
 =?us-ascii?Q?tm+M3FpEcZIvgVdpGUlZsTh0N5antODYrLpKR7/Qf9dHIOg/cYlGLCYaa5Tx?=
 =?us-ascii?Q?1PemHGmpOJQmhRK4MANlH2OXY7THWue10jqmUGpejEN/JFAMbcffBg2gUacV?=
 =?us-ascii?Q?t6hIdQVoqiKRCY5toNkg2M3IbnAB6sAdoJFMVsg/1UTz2NfuP/OX9Pa6vHvn?=
 =?us-ascii?Q?htlb+3bV4243lnBgtCcO4Q/gaXuhYND5r1u18/A9VmSihyDHPZUs6HKyLfX1?=
 =?us-ascii?Q?iZ3dmM1cHPohb5p5AKApVzlj0syh1c5Lcj3hwbiGZtlrl+/YKaQ7gPOrFIsV?=
 =?us-ascii?Q?JPiNpClk0ctH5AcTxSCBjdKBpxi9CgrDBn/7Urm7DPOhrg52kAQ4kLjOWd6M?=
 =?us-ascii?Q?jhR3tcrkQcWAIVlEOzPFZJT0k59iO70yAha77r1dFLsIHFh9efUjlUgwSPE+?=
 =?us-ascii?Q?6cbMOByHYWve75XGc0rxNpxsq+GQYd/M8DkRhTPbIsOzsmd256Yu/CW1t4Kb?=
 =?us-ascii?Q?aCHBO7KjWLux78O4FShkF+WGmpCyZgdDaP0oXvRbEv37HqiTVnl/5yeAIlOk?=
 =?us-ascii?Q?mTlThCjUfbuY6IBQv5YXTz71g7CCj4ORoR9SCxgkOAHEDN3uRG2cFgn7SN6h?=
 =?us-ascii?Q?WoKhKs6dfB6av76PIr/OWTS5+ZNnXs3BFXXF7ikR9qzEOyy8dokJDbIlcdI6?=
 =?us-ascii?Q?lRz863BwcHDr65I2j4guC6QISCBUhmcBRxT2jCJW0Bf8RjvzylkjJd0rM+Ze?=
 =?us-ascii?Q?1NheI0r9eyV1z5D1CYAAZEt/nH2m3Vn8yPHJCFNABwpRo5N/bFXdxJE3rciB?=
 =?us-ascii?Q?p9go6X7MW/5DM7KxJHkZkw3k2u2E6MHT+EgCbfgcfVnqbkByzHH3t16rwZEV?=
 =?us-ascii?Q?3uoNojMLeIjMk9LSJEHv6KDfqXjDnmwLEIpbGt2cZO/UBFWDqjnEBs76LbWU?=
 =?us-ascii?Q?ogYGVdtMiNGIS6kSEzpsyx/pWcaUucUBBeXqnmRUpWUnuYc5NmVr+6OYojAl?=
 =?us-ascii?Q?IZ/AOpZA7GonY0HNFCHePUoc87jMF58ewQZWndvDf4LrYDaTaxNu+cTfzhXE?=
 =?us-ascii?Q?FQqNoX7UTjNdTkg/mAyLTz/Hv7Fs1oB6cClCOh/qFYMiKO8n/5kVBtWhzu6k?=
 =?us-ascii?Q?00j4ibXWxa6l1O7yh6Hd3epATgPO/y9XiCyXjykI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80afba5-b530-41fe-683d-08dbde8570b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 05:01:30.6187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Es4LsnJRzmuTNaeqw5mcDs28R3uXumszhxJS8oHwHfEMS1h4xIDQt+VVOF43udegVSMNOJAPRo5PiryOAF6t/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190194

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.14.r=
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
ETA for completion Thursday, November 9.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, November 4, 2023 1:50 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.14.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.14.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.14.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6132
>=20
> Build hash information:
>=20
> bitbake: 6c1ffa9091d0c53a100e8c8c15122d28642034bd
> meta-agl: 09890bc1ce3d1836f0e35fbae7713f54d70a72ae
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: 408f9331156ec101014cf065314d3b90e79e6814
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 3f0115e9e59f94af54b74838f4f33339ea7584ae
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 79a6f60dabad9e5b0e041efa91379447ef030482
> meta-virtualization: 2d8b3cba8ff27c9ec2187a52b6a551fe1dcfaa07
> oecore: 0eb8e67aa6833df0cde29833568a70e65c21d7e5
> poky: d8d6d921fad14b82167d9f031d4fca06b5e01883
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

