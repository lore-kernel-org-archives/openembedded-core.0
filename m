Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8F4C021A6
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 05:47:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web10.45282.1739771245314745879
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 21:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=LfHsWJ1D;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739771245; x=1771307245;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+3JvGKwwTxxDMtTBJbkschaqi7WmSrDlAD2Jf4lB3Ak=;
  b=LfHsWJ1DverosAEWYTUNay5yTQCirs3i/S4HxFOVTAIz78qJ+UwZXCAN
   TZz0SEyf1TaYVN0UJC3kWzQvII6HVF8sxuaAGFybfdaVWIMvIdwOB9mMp
   mgliwa9NaRkug4vI9x8OwCKVcm3C9fKVj2dZV/oQ6z9Q/zXzqdxy3+CVF
   YVUGgdoj0jMl7tFCe4RA61JiJ4oEQnzrLn6wAQiixWiVcGdas0kh8IpRh
   x3/2gTRa5vWQ9uaqvAaR5w4huJ03ZDe2iqNCqlrMIoWmwYWH6mQhf/RCR
   PaEnckvJbVZfXrnaB7ZXWgtr/WBElSelclDYJbUZQe7zgcb2K7qBnFw8c
   Q==;
X-CSE-ConnectionGUID: jDqy8nR4Qk2YNm3T812t6w==
X-CSE-MsgGUID: ozGtZ31cSkelUGn7L7aTKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="50657134"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="50657134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 21:47:25 -0800
X-CSE-ConnectionGUID: YuVs5JbRTNWhqsXZCCEFpQ==
X-CSE-MsgGUID: SLaio7KNRUybgaeBknUVeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="144869406"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 21:47:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 16 Feb 2025 21:47:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 21:47:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 21:47:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3dq0bfZE3w0OfwsI0+yGf7eCI32g3KJiXXGxBxPH/3CcLkcJDnwYMyA7TXAAlW1KLDxLzfq4YMyNvcrTXOA1JpFtfh5Pr8129IOAxcRsrCDdSkVYMU8U95lo85mLcBCsX2FpRgrPY0Zy/QsjQhv0zbJaFwC1uUxFprOekteiyoi28HRuVPKEbcHEk43AmJhGNVH65m4SAvIKgHHfBMKZCvbKzogzwaONjWQz8F1REbBKXlmzmfNqmR5vQ+Hrjrp8m551NaetxPPe8bwndnzX2fQxXaLTN/nD5xqzUWA+NdEPPA/02RCp/DS3ktNSDW/IhhxU65Uggzyy+dtE+Qayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vElxkLHtuH9oc+830pOR+Fpw3LcW5pJp1KlbvcP3cRE=;
 b=stqv2JvcuRKon8evi3sdZ1a5gj7fztR8FH4fnL10JaX03WO/3N7oomgBxH2bpenDk5pxTkHQT/rtTGAn+J4FHoURUSivLu9b6sYpq8Osz59EMkZAFzfRoPzeVdQLaRfs4yXs15Iyba+Nu3q6Cqy3CMEbSEED51B7J39KmZclF/oI/L/XQ1XM1g2x+f4LxTKcnAEc9h8KVxnsoNnEAQfktvdG3AZHgXuD61kwseJ6lPEzJhQuHAf/8jczSv5tnT7bBMRg9GVWy7sDm8knjUVE/tKqsqnSc0QYh+i4rt0yYoR0PHhNaKAF2z3Lcqeb+RPr0r3ZRrJB+s5dMLwTsqZs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 05:47:15 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 05:47:15 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.25.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.25.rc2)
Thread-Index: AQHbf9JcRs8s+QGXAkiwmeUdYe1ieLNK/q7g
Date: Mon, 17 Feb 2025 05:47:15 +0000
Message-ID: <IA1PR11MB775369BA30F6C86B70A32A83A1FB2@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <010101950abd2b72-1e207827-710f-4a40-9c8d-baf72f7d50bc-000000@us-west-2.amazonses.com>
In-Reply-To: <010101950abd2b72-1e207827-710f-4a40-9c8d-baf72f7d50bc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|DM4PR11MB8092:EE_
x-ms-office365-filtering-correlation-id: 07094c29-76be-415a-a088-08dd4f16884f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?sbutOBkKbeiZbyIYtXYbqXH1YIOVyASChD84a9qms1qeXbSnjlJ1qE4kfvZv?=
 =?us-ascii?Q?SQEZYHno7q0Lkhropm3LP+kO0pB5bvSC5HMX2r98JRX6wFbsKhR9+MOwNDcu?=
 =?us-ascii?Q?MG1wDFOVNanf6NbV9Tb84jHT2oiGrUZy8k9GKCawHhOzUPObZO/vojRE//pz?=
 =?us-ascii?Q?GVPSzSY1GfZNleQqCTS0ujCGIpzjc6wPglsZW+WXGEghffw/hmyfxpgjEVL2?=
 =?us-ascii?Q?Ouq9hqUzKbT0/NLTWpL2U6DHlTvP2Yvc6XunKsNhNJM2xCrNKsb3ht041nlU?=
 =?us-ascii?Q?8QKVSkMNnZSxlmumaxRChDvHnw3wrVdnOOvPhg1pfxF5keGZW/SgHT5B1SUN?=
 =?us-ascii?Q?/VTO/+AQ4uy90jffC8ALNaNtOMyydbxwbb6BjIFmTGeh6PaUi70+MAiBdZqI?=
 =?us-ascii?Q?o8tDiboKuZ8/nN3Ro5RQO9RT5MLDUvlyGtLEW9BLhv3+fy5cFxDw9F6b/e/R?=
 =?us-ascii?Q?OC1ejJmXYAe3llzQbwTxqEAvVA6M2EC/T1UTHJG5MpGWJ3GV8rTWzH2ov48/?=
 =?us-ascii?Q?1VsVYJqLCSAkorVhK0jtmQt76lkY0xhGBV9OTfsoSG6yxO48oCF0kIChYotP?=
 =?us-ascii?Q?BqHT+YWoVc8gWwdsEtbES9tetdSm4w/kU+5UmtCyOwDDfobNj7A4gb9ft2xd?=
 =?us-ascii?Q?gvGE7TurHL6CCVJ34sDZBI/6V+OzMnDMxYclPuro8OWHET4JPAtC6qdKy+m8?=
 =?us-ascii?Q?nO+EO4u9hjFhoFBHfGgAlrfiINk/cjfLoCbqDOk769beIpCwtGGEq85LRPma?=
 =?us-ascii?Q?ovQ4/Z8Xi24YZXzrzD1gTAxsFSs+y/LFwtgHz9BFdgZVdqe8tEP/sxmOx/9m?=
 =?us-ascii?Q?hGeuZJhlECocWQRupO18Hm9zv6jvwuCENcjOWgYL5yY3EKCHNc24MIAh7kw+?=
 =?us-ascii?Q?KfeCb4v97gg8ZxDaagh6pwqkec6ywIAT8p5hrnOsH40RiMXEZOhBr2xCQE61?=
 =?us-ascii?Q?J6VwC4LRaIGKOzH6DCdlaaq/ehlQqCyxUuO69Acq02/8rDG4QvDFB9qYQy3x?=
 =?us-ascii?Q?gc0C858ldPbSwY0lCBNnOOpYUq6Lz1y2BABW+iIXhZE2tx3I6SqOBOA89FHf?=
 =?us-ascii?Q?5A6Wy9neUCHe8S51scHJT0nri5Q33H5xB22S4fLLbJ7H0//+9PbggFeMBr6j?=
 =?us-ascii?Q?RA2w2PqQ0uP5bM7ZgnTqP4jnXHWfqGZyhSaeSq0j/TOdCFqIhvJBhxATvgld?=
 =?us-ascii?Q?eptZquUDYp2m1rfiE5PBakk7YCmf/ilx7JWfTL8Vmz8ystF1T7EyUP6rFZUX?=
 =?us-ascii?Q?4JeIb9xB54cHkxFSmn+HuGvA9BjBgKgxgIHG0oUn/zaJCYqifRfKfHni9xGY?=
 =?us-ascii?Q?sz9e/xXghCDWYUyoHrKrailrs36hK/G9mZP1sPkvj+/wWiBN5nQ5UY++GsGw?=
 =?us-ascii?Q?kX9kl+f9fPrsfvsxcu3h4a719IKt?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FN6yS6pHVLnLJoHOPtB4+WtkrP0AxOhpPz7tKPtpnBSOq/a1+h9MRhdfPR/7?=
 =?us-ascii?Q?ozF0ApPz1k1slkS5ZdeS9oe5HUbKSiEHLNU3qbicgs/eBLsYhFgUCM6MTYG8?=
 =?us-ascii?Q?b1TP+u2D/MHSF8sJPuH90Yi+C9rG3GNkyRQlPSS5kSqEzjsYrsf+3YHl/zX8?=
 =?us-ascii?Q?BmVsdpcxSMRRW6klUrlwieKY15ib9pzogAR091Tbcea4b+HDylBDmQ6X2wcz?=
 =?us-ascii?Q?aVQkaHZr5fMPW7kNPSuba+wnh2yPPwD2KT8uOmabYGdTkrLcMJ/1EHX+Ls/R?=
 =?us-ascii?Q?gqLEFzqPZZsd/gdMqd1RqtIdvQpbVz65ZIM5C4tQILQ0327Uffz2CEOf/d3k?=
 =?us-ascii?Q?3o350wubd8EixsWczMtt53pwgQF4u9KhSugNqV5mThgn+LgZzIPpqwh/+l98?=
 =?us-ascii?Q?ZyUO6qWBFpbrD7dNLSby35aSg3quNkD5F8eZE9Y2qT4MLsj+/bg2IEhamX1p?=
 =?us-ascii?Q?PVBL/ZufvIljy4qEmpxvee3h1dvsf4QTETTDILAkNI6uURNwHBH/ZhiZz7I4?=
 =?us-ascii?Q?i+fuUzgoNQFLkcWxKqXamhvOKFpz8wib6e1YhEpUHqbPhkVuXEJCW7HvP0tI?=
 =?us-ascii?Q?fZBEMYL+qEXGkB3aF01Uj6Xd6MML4EFk+CKSdss5pu73dzKg/YSEB2z3AGiX?=
 =?us-ascii?Q?0FhTLf52RPWPV/QSssmP724GmpatVtMu4TVN4WVWEfoZwgxhJfIt36CpJwpc?=
 =?us-ascii?Q?vXB7k3vB9bH9fdUr8tIU+Ws1fb4ywrX+EtF10jKJ8u47KbsJFZDDJbx2jYkO?=
 =?us-ascii?Q?/trW4Pwnqlmqzysl3I7maA9jOiHWwOb8I5AhEwMPLldBWJKjZgzQhXArlghY?=
 =?us-ascii?Q?HanmaAKZ4CG+uJ8sRmAilJdOtFxh4EX9XrZQd8q9M9NDC4FAC1RGCzrP5Svf?=
 =?us-ascii?Q?dfFa4k3ao4eRsLKqvYlQ204gaP2jq3H4i3Mhk6Nin1UdZGpkwB98Y1pYR0/i?=
 =?us-ascii?Q?KnuBgXdKDTd2ic/UEbm/Wp6N6ZKSopnVGqeARuquZZ+7bdVhfXqREr6BkIN4?=
 =?us-ascii?Q?nLxux8zFcw5e47JK+B9Lq+LId0zpI/TjCvmLgw2sIYtCE6wbFx13kAdmLzq5?=
 =?us-ascii?Q?z+8xp48459tZdc2sQOjt54N0SFnPPjPKi/VU68xAfRpn8uO5GJCDBNi8ny24?=
 =?us-ascii?Q?hNsvWSejBkUUO7fQy9ysXgl/ajeCVuJQBD8moYdVn4V3eeFThCEUlKMOQls/?=
 =?us-ascii?Q?1W8edgSu8TuhGE56FnDiVmYP5khAs9I2lG19/bt14gHjLMJaWF5hkQfv7NPp?=
 =?us-ascii?Q?yVG83I3T+5DlYtdXVQdYCXNLzywSbQvoqQToji7Dy3Qg4g9/VdrDn5GxuyzE?=
 =?us-ascii?Q?ahy1MA5up6jXJsweoqxtZFogNEl3evRNp9RYcodcfhPsDdMEmMl2EV65hijM?=
 =?us-ascii?Q?7XvMEvoV4CThdaLr0tbW8+iTC/WzIW8JtaLdvYjvBk8Jwa6DXfFIXN8gxRhR?=
 =?us-ascii?Q?kUEAR2a/k0Q12/j0rc9EzXRQ4BDYVrRWDcs0mfP5b6hoayDr5C5kOg4WpCtg?=
 =?us-ascii?Q?6YRgK1/6XZGprWC5JZUfne0mgL8quCkBgA+5ZKZ5VVhXWfqEJWfoaE+ZJHVC?=
 =?us-ascii?Q?d4/9O8TcGL7vrV8fFDnLR1Yf/QgB/R3gGbJL8KkA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07094c29-76be-415a-a088-08dd4f16884f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 05:47:15.0698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jptku303nDjX3VKdrsqGllHbJzJgFzNlYvnfh4YtEMprevnVriKHVXOr75cJA+wuR+dXuvhgSagYu1toHEe/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 05:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211512

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.25.r=
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
ETA for completion: Thursday, 20 Feb 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Sunday, February 16, 2025 1:52 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.25.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.25.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.25.rc2
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1022
>=20
> Build hash information:
>=20
> bitbake: e71f1ce53cf3b8320caa481ae62d1ce2900c4670
> meta-agl: 9a490176e35eefbb5932f2c838eeccb5de7c8b36
> meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670
> meta-aws: bc3d881492006e7283b089141a1991daf77c6f62
> meta-clang: fabeeadc6a1cbf1a81fbdb7dc9fa4022c7e5e851
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: dc0948200594dacece4da91f4c501e9a9fb0394f
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: de8681b4a2a101b99dd2c48d89a7de2ccd9a961f
> meta-virtualization: b5a1645250c17fb657b7f10166f1c665ce192aaf
> oecore: 5a794fd244f7fdeb426bd5e3def6b4effc0e8c62
> poky: b5aa03f336c121269551f9e7baed4c677c76bb39
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
> View/Reply Online (#510): https://lists.yoctoproject.org/g/qa-build-
> notification/message/510
> Mute This Topic: https://lists.yoctoproject.org/mt/111203052/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


