Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FE6C83F0D
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 04:05:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web11.52133.1751861109060914365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 21:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Zzh0Iev5;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751861109; x=1783397109;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=O8lzls7l5PrELoemM8MfmZ5KCUh44wqca1ZIYe5ZAno=;
  b=Zzh0Iev5m6XNpVP2p0I69ApPTzYcfg0nmBlAw/YNvxIOrEfV3u7brQZw
   3U0CmkRNzQBubHupl2qPPTK27cIPF23uRndpzTvqGIkcNeBGABF2jEBPm
   S/MysaENUJrIMkj/tDGWXkdU1kalQbxhoeOQv5yZGCptCzzH3imeF2tIl
   tgpcKLYCTc00I92nMO/HQN/GuSFmxaI3oypdmcTNy4KoRYdILOFxfpi4T
   tpeRgm9ALaDRsrTq1AANerpM7EitZfB7G4iUWlCYm32827cj8D++/hUlh
   f2t5UMdMhzVGJ+DsXidoDlzDQaiYWw7GCQt1Nd3mzoVz5vK9N6KpRPZmA
   Q==;
X-CSE-ConnectionGUID: oMTY4CtTQ7i105yf910xOw==
X-CSE-MsgGUID: Fd8SqlM2TnGD4Mur9V1Ljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="57847003"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="57847003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 21:05:09 -0700
X-CSE-ConnectionGUID: 40E7OhtARZu/To3xUvcdRg==
X-CSE-MsgGUID: r6JLchhqSLSnX9ixA1FcCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="159456598"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 21:05:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 21:05:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 21:05:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 21:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8SZmz/ZVno1e5gYTYO3kfSjBxnyqYsXndyFutkOWiUFrBiVyLoRVkWQLpnAU2Z3owW9Yz0xNscJjfZtS02/e9sCF7cs2SpWpJH29OfFqC3+Oc0jpyh5tx9rZOdkeoLTidXVv/E/v9DIwT0+5w/OMfqhAJbNULOw8lE547k+A/J3wiDSCtwpyRtqapwngRDFHZkNnatBBg3/MKlWDi7zEuvuQX7El9uWpaQiq90y6zBaUA1E44MEZud1wY1jKfIF8xLtphl+KCEo+RK4qu0R0oGp9eZxD2LQLiomu8ObQpG6nYHl9C8H2/jM28FDKkY+p2nICx3bN3wHBcYHNO/XiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3tZNzl3Q2DaIlUBvSbX+WzfAwlWOmqk6TBixNydsqA=;
 b=LnWDTptNdVY574sdEVBJOJgnT1hRvUBFNn93gAcRdtNEiYxVOmsSbUl8hVdAmZtaNETJmv8TBW1+7jeE3DIVS8dL0JI3QZ7V7oH4v0YTR2XOiORcCoSQkvtFLq58avchlQfmNIRapOWBmeI8ZgyhemdWyKGD0QQtAN1yQJyx1tnRV3faqOCF2OTTq3z//Lc9307G3KytwyJc1qEZuJJTin5OrEuGpIFtmDXlKFylYbj74Dq1J1bTRatr+AVGDAd9yNmX1ZK5SX3k+XYhq829MR7C535bIPAr3nceokIT8fAk1w3GeVWDgB45q+EYipczIWdZeyZDFmmt3AXTref7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SN7PR11MB7490.namprd11.prod.outlook.com (2603:10b6:806:346::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 7 Jul
 2025 04:05:05 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 04:05:05 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.28.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.28.rc1)
Thread-Index: AQHb55q03gKS3o7M6EWhns6UpIojjrQmGTdw
Date: Mon, 7 Jul 2025 04:05:05 +0000
Message-ID: <DM4PR11MB7760D5B87594AA69CD5E1210A14FA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197b2e383a0-0a867f4c-e19b-4f1a-9a6f-59e10ffc01ef-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197b2e383a0-0a867f4c-e19b-4f1a-9a6f-59e10ffc01ef-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SN7PR11MB7490:EE_
x-ms-office365-filtering-correlation-id: 4a8022fd-fd18-4564-ade7-08ddbd0b7481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3C3yqzjPXbS/0JYlUGj66NId5DCgMdQzZtw/iPsACKL9tqWrLpJEyLVaVacm?=
 =?us-ascii?Q?dt654KKKIMKW7F2TchqdgOWS8yjOg+9/k40HZ1QDZEOgcd/hjAUg0nqUN5Su?=
 =?us-ascii?Q?2X+Pgd+dUCnlSxzY6SjXcN3aiVEHGaYD2ANPR0iPXjXdrdP3vmM6Au3012NY?=
 =?us-ascii?Q?0LClANnwKV6LcC/eFzRTn8DrVYix99UCwvbT2x59X4r9kJTKaUC7LKSkagqx?=
 =?us-ascii?Q?Iw3WFOvOtz5EMb3ELa26hZ1OrHuylHEzyuXYr9TaKX+jsJBsZSGufXhEFdWP?=
 =?us-ascii?Q?8PJv0XLdZAgk68Wa9p5g3MHLFuFR7woIc5AN51x4aExkCqtXjxYQyK7JHiFA?=
 =?us-ascii?Q?pt9G5LHdUQe/8/WDnXIBzipGoDeWZy4jmJ6s21PXGpWASgn3T0PBptGbp2w8?=
 =?us-ascii?Q?R1t213Wa8Lm0p0kgNMF2l326zztp3opSixHSklpRpIG2W8Xd5vnFU5qh6eZK?=
 =?us-ascii?Q?hR0sqC1dbnswnMyqYRQ9tDXgyG2A720yovk1+d8pxgr0Q3LeZ5ESvNUOrFv6?=
 =?us-ascii?Q?dM92z6XK7X9ZOTcA4BGKRHiVSMnWyakl5WIvy4CAfogPZOOezuoKcT+vEX1B?=
 =?us-ascii?Q?GKQouvwN8KU2hOoxH+DgNVgcYqcRMDER7QSn2X/istrlE+MrcqIs4pWSohW2?=
 =?us-ascii?Q?euiBVpT4/ITweMMZ8y9FMUhJPUj3U9OpQ9UrDE2xshHKBM1YKWxoihogMJGV?=
 =?us-ascii?Q?+j/1DEUyYeCU8GomNHk/gzzem5ymHC1rHWW4taGPXc1gCQqiTL6Q9ssSeBAG?=
 =?us-ascii?Q?h2WNbV3utQOyhs9ujqwJsqAnw8xlnhUjQAB/s2aRHRPus6yLGwxpX0b+taHe?=
 =?us-ascii?Q?yn2BzyCvRvEXkf5stTN4vht16uEqGTRRmAeQiq99v+agQoKDG1HIWfY95YnR?=
 =?us-ascii?Q?ms1ovbC7P0UD1LCEC1rQA4bbG3c682w/vD9iM9mzyfrMjhFXeFmk4Bne35/m?=
 =?us-ascii?Q?GBPwv57uwoXexpy63Ph7+c0z3YW6Bokpz7ovJpsl2W5KF3ydZBI8d9rDSyKS?=
 =?us-ascii?Q?2+ATtWASQOWEjIVk3tonvBgQ04nngOpPq8TKc4wOeEgMkLjXw3yG44TW+xQZ?=
 =?us-ascii?Q?/PLzSpsdpGB6pt2L0NKPTOoDo3/Agx+l9rd8OSpzWLyOS/A39aNVmfqZQj+G?=
 =?us-ascii?Q?9/fSDuyFlL7p9y5mwJ3JsUbogtAk/yFRkwJWZtMJrjwBb00htyrhr4ALJwVl?=
 =?us-ascii?Q?LE/kP0/Iz/meEUsxrxCOG8zJZJvu+Qf7WuZ+fbEICwldPdKvujZpNMLnWQYL?=
 =?us-ascii?Q?/ilzjufWDHPjim3IcuKNs88errji+5rTInauuHIgXkvzKLWfS4Vn37RSrS82?=
 =?us-ascii?Q?yC9aLHbf7Qa0+6NSTUPLeQuehDwVfnjFflrlxs4cUJzwdnjK9VH5rLbnd+HH?=
 =?us-ascii?Q?42yIOf83oZrUEIfl5y8rLqDrixBkVd9Pc4PXlMTFKswpNrbWANR0555lNwSR?=
 =?us-ascii?Q?4F97l0zxlsQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A+ITH3JwQTkBTVPDWWO49mf9Kb/bqC+mDzTnSN6KBVZ/lJ/CLTsySDiTO8yj?=
 =?us-ascii?Q?k9ftDZsVLTYOEM8KYeFrhG98YEYbYFM6X+4yxzXUxZvpdv9hbmWoRx96fShg?=
 =?us-ascii?Q?itD2I0fLudlIYc2LZKuhPtXlkurJoFBH8ihA1T1SoS9p4F+IpxBVMuGFY134?=
 =?us-ascii?Q?2C2KnsDL746Yh7WWQ8Ba3OtaCu03c7Z3CEv4/FF9lotqHrp3CyrZAmLflvOp?=
 =?us-ascii?Q?9eOT2EcXBrzZHzBcTg5eRui1mqXS/FbNfGMYRfZWuuZ+A+88WaI4qa0FdYSS?=
 =?us-ascii?Q?I3kpBhtnElmtKqSyKPLXA2pOok9BiZPHILIBY2OnxQE2zpeQEf6Vc5Oq5R45?=
 =?us-ascii?Q?4cLPI3isPOx7CYKx6zEbHZBNK5dpOe0d5ZkVfQ7OR7hh7sBx2YJWt7+OcAXh?=
 =?us-ascii?Q?VstALdxxhdftQNIy88cVstTRY/xWNVROUySRas5OCZjgNy7e2PJsC2725U6d?=
 =?us-ascii?Q?4aSwJn8bboumd82ukQQ8dj4Tmg9cryCKKg3Nn88kND+JZPTnFvQa1gTVyGjP?=
 =?us-ascii?Q?GRLjjYOnC5Ep7r2T3cgin9VKj84Me1lR976Bn+7RPjZx7aSF2RigvEC/le9I?=
 =?us-ascii?Q?bfnpMj7FgzSw2C7x2YOUVVwYMjtSHfShsOrFXReIy7eQgoFP8qsqzMA1cvc+?=
 =?us-ascii?Q?OrwDeLPQ9HBJWjS+e4953NDQi2WP7jqiLjs7KkRwIarehP2aoR9bPLA7tu1O?=
 =?us-ascii?Q?7aBDBhb9IN3cOD+x3l0HxWurwdlzJWYURplX+1bGXWaqPf9XsnMhBHk3n6xt?=
 =?us-ascii?Q?jLRDqwhh/is9OyDiFd2fYhWbpskUT4UD3iB3Dv71qRbUPfb9Ig9cAaGeR2oa?=
 =?us-ascii?Q?l9vTJIk9ZRuaaASKG0BOKYCCO4AfeJHxIdjd5tw+mynamawmibTQ/YrgehZI?=
 =?us-ascii?Q?EznvGby7p9AYAoz2sck/pfv/3YB6FeROZ9f6Ih9YRUMAJvbQx41yD8HdFieF?=
 =?us-ascii?Q?oCwO/J6474wgZR+7OobBY2+NqUXCrGPGz9qdSBrRKwOgf1fLbMflDFtYFzop?=
 =?us-ascii?Q?oPklPj5C61PeCn7SpwTLlgJEDLzaEAk4Hg3P1FTRiJN53racPj/v9zEP6sZl?=
 =?us-ascii?Q?UaAPs49hBQGBXvygpuxmmXe4ZKg3JmD1kXp8bWmfvh1QnEY2jIdVOYfVGqTr?=
 =?us-ascii?Q?1yJlZK6aJQ0hQgzj/R6bkiNUsMlR+HxRz2nMKuT7Jf3wzIpCNuYQdVCGlqiQ?=
 =?us-ascii?Q?9TE2pRm/gzLrvLOGvk9LgeBLQcFZiJtNN7qhIE3OsZj52rhCoAg3S/btDdCi?=
 =?us-ascii?Q?kVlyd7r4McqgFfYfiw7Ab73JxxNXv1iIFvYqo3QLpfEAj8eMhBjvpwO2irWP?=
 =?us-ascii?Q?oFNHz2vUIolzFxaNcMVPYiQAk7zFxeFjuwddbUUDNHTxsNbEwazbMBZiE2sU?=
 =?us-ascii?Q?Vp1QagXSYXYGHJMhhsaf9bcYLewojXlGGh75KN2c9IW/gze6rNgXVVHlCrQT?=
 =?us-ascii?Q?zqC0o/YLMFbVvscscEVTJRZ19MacZQjVXbPHXGmrWJFfwOR7RFSOqjytS4eJ?=
 =?us-ascii?Q?jmAtJGPiGXKzctUxOqd/9eByLXbQCjuJmFjzzuJKFEgc5cozbNb8wJKNkkm2?=
 =?us-ascii?Q?AH8eYHAl4YGSd0nzSncamD+CLEMfYvXfKdFdWQUA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8022fd-fd18-4564-ade7-08ddbd0b7481
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 04:05:05.2826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJoMUJQfM2baxIVJoLXRw0Hinf7ofZhfq6nbiFhLtQzAdj3Bshh42GUmF/4BAFLlHKPslmEcSdt9un7OBqQpzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7490
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 04:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219970

Hi All,
=20
QA for yocto-4.0.28.rc1 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, June 28, 2025 3:36 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.28.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.28.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.28.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1901
>=20
> Build hash information:
>=20
> bitbake: 046871d9fd76efdca7b72718b328d8f545523f7e
> meta-agl: d68bc4cb7cddeca1026a991ed405b9bec3d9179b
> meta-arm: 6b2d97cecd1b0e4bf4caee9a65595d279b57a686
> meta-aws: 12f6037467dc369f89629e1ce8d18d0a1bedde77
> meta-clang: 8a1d0a1993040ab9d2fb7259b71e4c9582f5cd17
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 95eb26cd3372439443acd1f4d4265989aadeca88
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 45bddd258a3d1ded925faf8389e01bb948dc7f5b
> meta-virtualization: 227cefa1261daf20b7d9737541994ec2bba629fc
> oecore: 75e54301c5076eb0454aee33c870adf078f563fd
> poky: 78c9cb3eaf071932567835742608404d5ce23cc4
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
> View/Reply Online (#564): https://lists.yoctoproject.org/g/qa-build-
> notification/message/564
> Mute This Topic: https://lists.yoctoproject.org/mt/113867803/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


