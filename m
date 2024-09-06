Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F017CE7AE7
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 07:42:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web11.29705.1725608567150992421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 00:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=GmqjZt/P;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725608567; x=1757144567;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=x/xkh4PkXRbdfTdzYkqN60epUPjrqmH80kAeW8SkhSk=;
  b=GmqjZt/PAY5nw9ItGM8MX1JcW3ZEwfFy6/QzB892OA06RxwdHPs7zy1U
   qAN9lVWozkzlkYigAZuFkkWQ8bYP/Yko+CfQhob2xB3wwnikwonQsc+3s
   p9civjyGVeQuPxUnlTAPehhnNgLefWu2G6zCemACKY5y+4DQJ9e3+vlpD
   HGnsQ7s8dk+QLeY3k3rbDb1rwp68IBl6VmVXE2Q/HuA0XSSfpO8fTsjto
   mg0ONrBTVTRoW4Pn/lwFQfPoMsjIiSCvIIMs3yaISPHPfvBVxhp0S56Fm
   ESvU7vZe+fhs849mwrOmkaEzrU16HksZI++zKhRRA+dUVa9cHB0Cujk94
   w==;
X-CSE-ConnectionGUID: UreFaFgoRc+Nfv+butiTPg==
X-CSE-MsgGUID: zQUaJ1phSauS3EO/4kDEQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="27284917"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="27284917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 00:42:47 -0700
X-CSE-ConnectionGUID: YhDr8tPMSz+o2atFhn5QjA==
X-CSE-MsgGUID: kBTrSV2NRaeCo3xqyABaGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70671175"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2024 00:42:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 00:42:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 00:42:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 00:42:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 00:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcpVh0OZ61Iau+vP+6QClUbXMa5y3ha5oPEek15ttsUyQlpDTe0PaxF/eqVvSw4KR+gmr3VFQxFsoDUhY/3TwZjvBWdvwnfbjqIMxNuGVnRCdOX4kqyQGauTZNbNrDSjp847PIzow7AI50vG7JwzA1pHEst1QeTOI99DWsJuI2GxDnWGPuA4rlcCbrXeH/+/jp7PMoI0mcQ13TkjyumdQVflZomGAeFar0kjPoKbqUF5fYPpFFbINcpmOjrkyMw6tTFip/lKKmItZEgadssMpEcpqo2d+/LZVixwPIHhtIUkFYA6EiVuJRbcoGit5hQont2VjR+FWEdt2f38NPuv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZgu0yKoefMBfnOURpArcPFP1ekMwKhMUQTYjte4bU4=;
 b=aLLXm6apTNFDDZZ2tjsONxe/NuS4Mc6TNmUfO7G7qtcmg4nY/Ye2d9qjIgLdIAn84Z+fwlHNuILRMDla65m0WRPZuUxctVMM66+HX9i2PRBPD6/RHJI0GIBUagpeLYlBYlbpV6qeZG+LseRov1oaQARaV1i1suM0D/984+cRyB1zEuHJX4Wk5zsg6w13eAhovy9w9Ly+Bv/vrV2MqKRSpvJWJy5R04+ALDeMPpBaXZEVac728RQZA5m5aOznkJLqeu0CXoZwD0NG/iUZJWceT+258zmwNL0NSffUE235XpgquapEZ7mbNdKv2Rc5yMTHzB8bA22XNrZxBetIiSHNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 07:42:43 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 07:42:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1_M3.rc1)
Thread-Index: AQHa/M4/w/8vPs04ZUCdJoO84LzlprJKZuUg
Date: Fri, 6 Sep 2024 07:42:43 +0000
Message-ID: <DM4PR11MB7760DA088B506E2BA338B9D6A19E2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010191b01c9cd3-1677ddfd-65f5-4319-99ab-a84885d84b22-000000@us-west-2.amazonses.com>
In-Reply-To: <01010191b01c9cd3-1677ddfd-65f5-4319-99ab-a84885d84b22-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM6PR11MB4562:EE_
x-ms-office365-filtering-correlation-id: 696ef8de-fbfc-4c08-1d70-08dcce477e2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?B2XlSDC2TYrdsK2c3p7MdZYu02ATgJ880n2z7HGU7RKpW1bczV789N3cW/Ku?=
 =?us-ascii?Q?wdjqYDByHl1hYQHVox5foaZH0SUdcOJwjP6RhAI58hQ12mleKjU0HSraP3wD?=
 =?us-ascii?Q?2WeWfvt0Gc8VyuA+yiNXR5uv5P8B2+VA4FixSQhI83kGGMS5190p6Wf0Ex6Q?=
 =?us-ascii?Q?5W+44QK+Rftr4+kfpIgT4ersVn7Cr9wYR3XTp1JPTT6kmCTy3TV3PHTcVQ+w?=
 =?us-ascii?Q?fweYGtsUlqCOyWVOyxfV8vv7c7OLn26Y26DOBRRa/klJfWfjhKwxu9K19VBb?=
 =?us-ascii?Q?b7/WV6FUEWW0tKzGS7rJxP41hyNShN77wNDrhpvt2Iz4OdLaxbd7g46dWFDU?=
 =?us-ascii?Q?+0QImr0b7xa2k+WL+8tl4/qeujQ0bMMnWGwklkOaxZEw8Vl4ws+FWh2grX44?=
 =?us-ascii?Q?FfKchP6GWZz6nHZTn83+6UaAXH8KzavJvtv6MxlqglGnMe1LuXh5KrOCr9LU?=
 =?us-ascii?Q?hBcCVuMsoilHJPFkB6TD0eF2DAb2gWtibBykdFsCwwviBSt1WrB5+/LkS91m?=
 =?us-ascii?Q?rgtFiy+bNuu3q8dWaDoPMNEZhwlb+Lf6jakg577SQ3uBBoNqywDCbLO6cXJj?=
 =?us-ascii?Q?OWZMB+yBIoBb3lEEbWqZ1gQtekY85HSel0rfq4U89Y4nsReiL5mZ897doWdS?=
 =?us-ascii?Q?jJkdr1cpacbAd2CU54uhOIhhLulIZzDHdHOvXeWYT+/5tfWU0loLB7T40PhK?=
 =?us-ascii?Q?Zxu4enVnqviHoXKBcnc2lQJerUtSdLBRyOWD+2YUWhoTL3dnUVboswee9rRx?=
 =?us-ascii?Q?SeUCi/UGdWP/52JDBadHmMwObU2smfigUk318oIJztIRLzbDjLJUQ4Lv87vz?=
 =?us-ascii?Q?feKC96U3kVb7SqMCghYMLGImqk/rzU6N+bFYWTfFWTJHIZ7kcz4kCdLCQ0qC?=
 =?us-ascii?Q?iRMnqdBoJ06MP6GUFqjZmTXnSQYbj/7snIq9IneF/w4W+95sgP5+eOP+KNVl?=
 =?us-ascii?Q?frKbvp7r6qcbSgqVntmghhbLmjCYUSHA7kEV/HiGlRxuj8BKf62jl/xouDDw?=
 =?us-ascii?Q?Rh51Ddp00Y2LhSWgn0VAxNIW7/8n2hpOVxbUp+UtMHDsEoGWmCbHoQjDetHS?=
 =?us-ascii?Q?rsk87wzjCL4Jx5YQ+JBtyroPQGqaMJ6FOClEuAztcQ7yh/ZD+5sXCsF85j9o?=
 =?us-ascii?Q?C6qYYJXYRdb3Sj6H/o6+HAtYnEnada2HW7rkSabH/GMcK5qGXcPZoTUdgZgm?=
 =?us-ascii?Q?BA1nz3fNzCD0wHi7WIKslB1Cam5gYe+dOxS+NWBt9oCtCoOpN4ovkTROmrNs?=
 =?us-ascii?Q?JBj80Fq0q8jm+mn085lXNCp3FX/YxQnhXzAe1PJfwRojCMKnABemVdqrk+jh?=
 =?us-ascii?Q?rIB96lIIDss4XJ1mxYVEoGrvyHrh2fS3v2BRQci7HFfGygk2SqtXvSxt73VA?=
 =?us-ascii?Q?ZVPuMKA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G2CvgMSgRYqKt69N/8VVTOW7XTrMx1+uyiTlNFDbSaLA+XSk0oW3Ws61ogxi?=
 =?us-ascii?Q?yUU1nQAYcsjBXfqgUBGqoespXYmrueXiN2ILN0uMS8lZFJeVZSSzLcYlrKQX?=
 =?us-ascii?Q?C90oOnsPwc3lOTsmP6XbIgsT4dBkRLDz7+Ib+HWMEz4AnwrIjf03BFtXBOs1?=
 =?us-ascii?Q?/xwRQ1DAVG3TUdzVz5nUIorlyXAxwV2AbhT+bO4hSdcsDCznkHK/UY5ALQyL?=
 =?us-ascii?Q?Ib/jzF8SBv+/XY5KZModoNSMn+bD+4aeEfzySMxf4zeoq5soRQMCCruEyxhr?=
 =?us-ascii?Q?783U11fVu3r5tY1nuu2bD4vvc+38102XJ9vcKpdckYKdZrhE2fHdgcDsPPd5?=
 =?us-ascii?Q?FaLGEGC2BkUYvAuS4uUbiv2xw8+O4jE/KYLxPLZQaMwTWmZkGYjAr999+nYu?=
 =?us-ascii?Q?J6wFDQAxmsL9JLcfgaOIqqqpGN3RtEsFGKEANMlEIGQc2B70n0rsA7+O1jqo?=
 =?us-ascii?Q?IKIBnBBGC92wlyq0d975xinx6FYSSbjqpyqDngcsIdEWKoMFs96l4auKF8Tr?=
 =?us-ascii?Q?EVy28oD9TqTF0lBrvyZMlWybO2cGOUYyz3+wHsWL7a43zd7AY89RZ5ysiAV7?=
 =?us-ascii?Q?Zs2pDJyNHw2hCo7NfZHKW9SRThYR2XWRX8ZU2A+mm8r595UZl7tEAUhR2hJY?=
 =?us-ascii?Q?g/Io5EyKChlEK+tyuf9+g7O0f039D4lunMhU8CkaM2JeoUCcWzLW/IPdx9NI?=
 =?us-ascii?Q?YxH+rRq3j3p2EvdfkD7FtqTcmwrfwBU38kW8MJdJ6R6I+47NTpQhAskjk65b?=
 =?us-ascii?Q?EHID48/bvlgymJVbiMX/9QUu3RdOggLPazWDzgIev/ctBIizzETibtfYZhzB?=
 =?us-ascii?Q?MJArvgFZ7/EH1R9aK1LT2lnBHdsdjJwBK7CHInQFmHqeqxSg8FqL8Y/qkSQD?=
 =?us-ascii?Q?UvlYMHBw04J1dRBn/bTtElWqaiZSoarDG4LeUS0IKAVNHCuLK4xZdJbblfR/?=
 =?us-ascii?Q?jalo+z25klyX5W0aCCxi78aiQP+oNAmvGfBQaKhW7H5xL4qhdJrUew5uEFUx?=
 =?us-ascii?Q?ytvNNeHkT3DMWglx6f3pi/xdjjVDlQ5Ypsmc/cmR4QCrVzLIPwIPc6ndl+Qg?=
 =?us-ascii?Q?BaHPkA1l+RncOyuDPf/DTNuGgSYiymeQEJTBP3qJzMBrusMPTthnmkLAcOU1?=
 =?us-ascii?Q?YqEm5kCRH9djweEdpR0CX8oT+KdgS1o4M7FTdQ4qsVqxMgCWBt8vAmsYDoOF?=
 =?us-ascii?Q?Ae1JBc6BM1N8/NupLSyzGcOe4d1RGxpg5mgbeuDy9WdMWWFrov5cYCCtdRUo?=
 =?us-ascii?Q?eBFhb+2yhBThTlTJHESIGjhbveoTdxUOR04HqvsCuifqJ46OVIIp1cYDvTPL?=
 =?us-ascii?Q?LbWht8Gv8+dBvNJPKylUyDNqODSosgkq1agEP8L3ViS/NPhKLksg9+fZXbgD?=
 =?us-ascii?Q?1s0myVudYU1D2ut2gAuw4nEtBEeB04a5Z0n6PUh7xcNQTBTyI7PVmVlHelZL?=
 =?us-ascii?Q?yFgP9AgjjZVd2jZ9L6psL2SnLybwUErN6iDC8SaOYjYY7nUF1C6jezLO3F0Y?=
 =?us-ascii?Q?VcSYVmWIHU4rV65MG0u3EtzbRTOVABuVqTbA6+Ql3/qGdBPClwARrBHnq3qe?=
 =?us-ascii?Q?o+pm0QbNE2UGphcGlvIHNB2J/rcZ9gTVwfHmDgXb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696ef8de-fbfc-4c08-1d70-08dcce477e2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 07:42:43.4588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnmSeEvIGlZk3MxS6cZ0fwaA27tJ2WoGyl3NxBAil3YtphMtnKSxvacSS/Mkctzh0lGqRKBqVjQiKv9qSq0IkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 07:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204250

Hi All,
=20
QA for yocto-5.1_M3.rc1 is completed. This is the full report for this rele=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, September 2, 2024 8:23 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1_M3.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1_M3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7302
>=20
>     Build hash information:
>=20
>     bitbake: 5bd0c65c217394cde4c8e382eba6cf7f4b909c97
> meta-agl: 5f5296f39181ab01c6bd616d6459edaa0d3283f3
> meta-arm: 11d6e241677a34125533e7f00440eddf933c87ed
> meta-aws: 5deeda317200760d9b0157eb5026efd1d487a829
> meta-clang: 685abe9da706985c3f9c3d836ce4969c2cf5ef03
> meta-intel: 8c4ea4cd2f241d4d82a15341b940595888f71ad6
> meta-mingw: e4d377d5ddb62b265536bd33dbccfbb0904f8701
> meta-openembedded: 65bac5505f306c693244186c769cef18aa436f60
> meta-virtualization: a940a0e873f9163d4585555b3f3d38e99400d237
> oecore: 557400648b6f4f31176847f8a068d2e199b7793d
> poky: bd2159719c08c101a25a5012fc684163135653e6
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
> View/Reply Online (#458): https://lists.yoctoproject.org/g/qa-build-
> notification/message/458
> Mute This Topic: https://lists.yoctoproject.org/mt/108219778/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


