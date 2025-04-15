Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACF8C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 03:54:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web10.12373.1744689279201270204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 20:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=aXX+Q3ku;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744689279; x=1776225279;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=L7Aql42EXO5XvMtW6Fog7jm6qDIEB+NJMuwySJYJoPM=;
  b=aXX+Q3kuMK8hG0T56gvWbYVSIxX4w2HB8llnATshomrPYxqszx4rRW4E
   s1Vw1rloxWNRi05z77nK7Xs8JhaZqRqz3SpplD3zMBiyOUqeK9Rp+eEAY
   wonJ33LWJGyX1PA2zgga5V3bC9ss2s/SDM5uPXdYBtB8vOmEjvo22X6KA
   rt5COFcPYkAubrzcmzYkZjO4QAKnSicR0Dz+wTRacqD5XUhOt6KFKvnBo
   F3iDuEOYI9R8Im2H9ugcZ9BM+VugdUU3QOI2Z4tHyLKmitP1ubRToP8PY
   4ElVT1MjuK4JmQjS5fh4fm/JcllkhyaAD61obFqqc+e0iq3R6S2aq3hp8
   Q==;
X-CSE-ConnectionGUID: 9JVxRQw/T1GIq32i6D5vZA==
X-CSE-MsgGUID: o0vAsVeHQxyWDAgIiCHvfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50008456"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="50008456"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 20:54:39 -0700
X-CSE-ConnectionGUID: dRWn1kcrSTqaTZesD4BsYg==
X-CSE-MsgGUID: CVDJqcO1QkiMKBVniR+irQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130533530"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 20:54:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 20:54:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 20:54:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 20:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fa5T+GrDo7b57GqmRfnjDcHnfwt33WiP07dOBokZME4uQV6uVQBnrWT+me7Uc/mohnmpNXN9MnlvL0MvnlP/e5tHNlmAPKtg/BGUPVIMJ0/PMTNe3IvpVtoijheygkCpBowPl3NCNhOAy4bOnrtrfXEdPP4HlHIDxyrqgI1Ukw4WsFvCAc0P6lHOfEx2/sjYjFPjPfZpF2YKy8dR7iBRLBqJ+6tXdYjOlEve/t+vvq0PqppJQr/Zh2g981h0AIpGvmw9/0JprY7Eroj8q1bfQisHH50RoKEJ266Co1R6pKT9DLmj7nv01JV48y6o/JAk6qUtcauNzzxDA4vT2MiViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVnwwFJwo4Dyp4t3rhxXbfug9/1jv0pzUU67bbyixAs=;
 b=qFpY89rrsipoia0ii4id/gb2t00F+9q/VLoe4iQ3whsH1YQj6raHdWQAw8pjnabKqL9cwFbNb+nm4+7STLsLuRKKcjJutXLGn1mSBn1dMRQU0NffiXPu8DTL7bTd5EOfqQnXlxmWaZvOwOU6LOHfLU/p3yR6hBD971qjCOVbPjyw9MfpzjUwezL9Ze2CiJWNDMNuAFMX3/Civwr2c6Te7mymBMqkiDue1tHnHxg61JRjOQpyLerGVA+ckuSPcmbvr4IniDvvRlsqWCwsv4agEEJBuGXObMVbTCzHMF8sY2TNHualmLKBNYe/houqqwECKpPUwhnLIsLRgJudZHYhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by DS4PPF7A0031045.namprd11.prod.outlook.com (2603:10b6:f:fc02::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 03:54:08 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 03:54:08 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.26.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.26.rc1)
Thread-Index: AQHbpZT2IJMRM7bMbk6S4OJX30OdELOkKA7Q
Date: Tue, 15 Apr 2025 03:54:07 +0000
Message-ID: <IA1PR11MB77539931C820309924B74F01A1B22@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <0101019602345387-94562609-3f1a-436a-8818-f68b1f3cfc1f-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019602345387-94562609-3f1a-436a-8818-f68b1f3cfc1f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|DS4PPF7A0031045:EE_
x-ms-office365-filtering-correlation-id: 3f050869-0cc7-458b-3347-08dd7bd12c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?Kt0LNsB9+gyHOaX5UoJDuCY2yRS/itOpWaeC3nhV7Vb0STdVEBZIT3C2mFe0?=
 =?us-ascii?Q?sb+V12CPyY9s3zIv/Mh73735Mty9dvPRBHcTCff8gdcG60d+Oy1WEXW4K/H5?=
 =?us-ascii?Q?yHjxdlJem0rP2NLSTKd9COv9H32xm5KMM6HOE8cwDVJEbVHRZN2dltNmQZUr?=
 =?us-ascii?Q?9T2of/6I3gYpC+crogAeGj8QS44p+/WTA+MU6WPWGKc/ax3e902GQJeKTCr8?=
 =?us-ascii?Q?MCgp5/DP7nSrtyF3n4b3PrQLnAD9EuJYQCV6gv6pUOTtqBXUmO2rLSEy4goJ?=
 =?us-ascii?Q?/FWDi/uIIzXcLucRuZO2M7f5FD0ijzINamTy0raVT6P0lDbjO3oXBxW3wtU3?=
 =?us-ascii?Q?ZJqiYraRfHOyz+Bf3rkmZ0p4kZRDLcQQTXQ6gmhHSaiVSBA8W8m4uIiyv5p+?=
 =?us-ascii?Q?XBY/R3Jo7CTGc8bHix3FCdeEPZJmYuHDU8UmyiZCl7OSKXdCtkNxn4mGVc6O?=
 =?us-ascii?Q?icXgEfAJSbiktgrmYp6OfHzQUJgLKT0asWO9VyouI9ERYkSzejUGL/bguuMm?=
 =?us-ascii?Q?bX51Oaj8UzrnSGVsTaqmU1du6afqTWRNKxKbj1ITrnv6IU4DYoKfJlxHCvsO?=
 =?us-ascii?Q?db8WKH4b45FDD7i5R0cZK+9if9bIelDQ4EDbbLbAnlYucWHEPAkE4FmWzVcc?=
 =?us-ascii?Q?W8HbzzqbisiYd9yCxSd0pGIJNLQbySfCfJ87Ut7t4J7QyTsMUUYsNYDl5MlQ?=
 =?us-ascii?Q?ATj8FS4bfSSWkWHTk/O8/lcpCHy83pgHqhQxbe3gNRTLdGOFZ49kqMk8Pfj/?=
 =?us-ascii?Q?OB8ZEjQvwD/IsFMr1Q4t5UnEQ4d0JjJzgm58yr+EQtliNPDxGKMESZhyXvKD?=
 =?us-ascii?Q?F+6Zgwf6qLzUGwffmnUJ6EqQZgo7px8BFO1y0ey5OGm6IzGHJMqYR+i/NDOO?=
 =?us-ascii?Q?P/+DsWsh3ytqihY/dupnaxqZ83Pl7ZcRD9696FBKwoB3ezYxpsqLrrEckiZl?=
 =?us-ascii?Q?eVq/5j+/WUgngqXR442b1ZjvqBLUr0Phqa3jnQvKxdoz2e2lmpN8qapVhpz0?=
 =?us-ascii?Q?v5k0gvc/Z+RbP7/zLXzX+5L8xxasRFZQNE6ozVN/HipOqm9Gu4qIB3nMzC+2?=
 =?us-ascii?Q?KXav8j3bLBMZavKdOPWgz5U6hr136QPD5MtwhgFHkwIHTUkrkpeCVYNOoSk/?=
 =?us-ascii?Q?qdNkAUpfCfH8divVFo0k+36h4hvUOjeuBI6/AG6ma2dJK0jA+sAvKeAj6jVS?=
 =?us-ascii?Q?fd0eMs6f1qiS4S1/aufEMbgU6gXmL5QHY81LmYPpEtVZ9WC3Kd6wkY9TguQg?=
 =?us-ascii?Q?ixtTVyy0R0m0w/VuSNp1LiP0SI171Vd29Tb6xGTqvIB/7q9pw5kkpEfFMvOy?=
 =?us-ascii?Q?XXwl/zL0isErJpfngaPcCY0kgemOmL1qtbRVfM9u+TyMi+tonwJa4OkkuonY?=
 =?us-ascii?Q?xcA1qT6Vw3ZA/5Dm9da9TVU2cBDDym697lJEhXwYknYVdHr1AjdWpiFfRJAq?=
 =?us-ascii?Q?PBySugojlpM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(38070700018)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oyKsM13P3ncb2lDLbEsOJ4ePDqwMHZbfqmXUpcNhVD3qCKvmR1BwS/OZ7BEN?=
 =?us-ascii?Q?Y4XZsrbpGNfGfxJB6JAlfXZ6wqFuDLfq0bBSENQ7gRCFyZ1ejam0hzNkcsbf?=
 =?us-ascii?Q?2Okycj+Lyaz3txqQDyqhJlEQ5efnwJUobwHGznhAtUM43hIg4eeD6uLKvuCR?=
 =?us-ascii?Q?d8t7XSTxfiHi4swhzdQPzO6Z5TonCrSYn0WH0gigzr2c678D/9EeE3aPMrTu?=
 =?us-ascii?Q?csJiB9h5TIcvgTwtCM91HJLU4HB+1WPklldNof7eF9HNnPZCOQrjRsWPdUbk?=
 =?us-ascii?Q?xA8jhks2y2LnQuQqgdDNY9m3/zJ1rlbfgoScgLQRP6o/XoYnxqfSYafTcx2m?=
 =?us-ascii?Q?oY1fS0xbIYDm79p8TK6kOYy12iXUm4GiD/S/uWwCgBC+v6q31u1oO5Xsn34R?=
 =?us-ascii?Q?N/Jtzf+oWgQFA7pcNUAbbTIw9GVhk98ZCq86TUHs0wewwiVfrzDTfsAmNC2H?=
 =?us-ascii?Q?1+Ca1HinziN59K2kvotF6ew23kEXfBi6c/vL07MYkymEi4GQlmhrgX47FUrN?=
 =?us-ascii?Q?zxyaPUdMFzkKaQkb3Ci4UwiCLFMqk/12kDk+TtsVPJXb1vkO7zhjETkA0qge?=
 =?us-ascii?Q?v6nZtXqSM9TwzFWUQ+AcEvS/B+tO5F5cCCsOIrugMVOhPEYi2Ci0rNJJNsyv?=
 =?us-ascii?Q?ddZYO/kufwp/rZjBQtcekTeKV7L7au2aot/xOC//zT5XzlNlLxi9RADHho+z?=
 =?us-ascii?Q?xE6jVkXkkG+cVIQRMNNXi9AJ9TCkqWI/QJjaqSPEfoEJIHUkJFNp4C46+n+/?=
 =?us-ascii?Q?Fkppsda0lt9Ugab3Swj4Ygmwr22TZUVI8XxqK0J5TxI6ftsNNTCTT5ncwB1o?=
 =?us-ascii?Q?QG67hqL7GLM/GPfxfcNuN/VYkHpDhnUqc3O8Llez0vgao8btORqBqbxSrTeG?=
 =?us-ascii?Q?aEJgoV8sARD498YQt/zfx0Sf4Brl53pIrUCE/G5tgZgtnKPeBtYfKE1BX2yz?=
 =?us-ascii?Q?svQT++dYm0Qmw9/jD9FK2jYVbsb9OFdUi8KSFZvu/zR5/FtnJFvvj7v9Np2r?=
 =?us-ascii?Q?ObsLWSS/s8cjbBVqC5Ci9klf3gF6jLZ/Qg0QOSHoHZX4hsnIVxVg7JaTfOFR?=
 =?us-ascii?Q?dydUnpldRisIt6/3CQAhHwrZzNYskWljFpFKImC5blixHYEE45oaQcnr0Mko?=
 =?us-ascii?Q?UxnKZ9/x5OlP/XdB7kyO2OtVFixZVuVbBnnz0N6ePLkQZ1fElTqkBFVZWzZu?=
 =?us-ascii?Q?eTMMhWZ+x+/TLMi2HleP7sxIz++z32pttoKafV0o8Bd6m/Nz4K3enPbSbI4t?=
 =?us-ascii?Q?Ixpq8W1lyM++IHTTElUmEzeLLZbXSE7CLgRpqAA+x7TqMTga724cYUYjQPRz?=
 =?us-ascii?Q?xPzW5bBf3fNPP/eXrDOeCWbqKgdeEBPblJ7deY3IWw8x55ZhJp7LJHbr8GG0?=
 =?us-ascii?Q?CbpjD51lYybNEycsU7wsRdX2yn6tWcf00Vf2d9HU0XOKnBhUmS/HEf5+wWP9?=
 =?us-ascii?Q?3Jd34gSuqx8mbpw96JxcTnmDh8GwNbeAJ0nCzZAld8Hkfuy0VCB+wOfUz9kw?=
 =?us-ascii?Q?PLXs3zNcTMCK+faYezVg+OQu75U7iLqf+Ae7feuQpN99zO0htGISxoGFupeI?=
 =?us-ascii?Q?Ku/lWX8OwRDBm2wF1Zvm5usYtUqu/21Zel45pI+v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f050869-0cc7-458b-3347-08dd7bd12c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 03:54:07.8590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: boGeZMkRIVdHylA6ejaOeD2gbPYlIg9ob0ZK7bfB5iPPFGsABnjX2ghly9QoOMnrGjLWv68h3cF/AsgmWxX0HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7A0031045
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 03:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214818

Hi All,
=20
QA for yocto-4.0.26.rc1 is completed. This is the full report for this rele=
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
> Sent: Saturday, April 5, 2025 3:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.26.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.26.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.26.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1341
>=20
> Build hash information:
>=20
> bitbake: 046871d9fd76efdca7b72718b328d8f545523f7e
> meta-agl: 296d62ad1e6c45c04739645401056bf172e736cb
> meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670
> meta-aws: 4dcae212fd121b16c525f57ac7c7ee32df3650e1
> meta-clang: 0356fab9b788e6071471f82743964aec1775cd71
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: dc0948200594dacece4da91f4c501e9a9fb0394f
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: f8dddbfcbfe502cb71375a7a907e61a92e8d4474
> meta-virtualization: 426530794bfc0df686566beed50e245f40565d6c
> oecore: 1efbe1004bc82e7c14c1e8bd4ce644f5015c3346
> poky: d70d287a77d5026b698ac237ab865b2dafd36bb8
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
> View/Reply Online (#537): https://lists.yoctoproject.org/g/qa-build-
> notification/message/537
> Mute This Topic: https://lists.yoctoproject.org/mt/112090603/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


