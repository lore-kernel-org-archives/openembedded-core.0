Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC41C83F26
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 10:27:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web11.16610.1753439271608445847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 03:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EvCr19UQ;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753439271; x=1784975271;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cSzKqcU6CCvy8B+Nz5PHPR0OoA7j4T73Gr4+j1LA5Os=;
  b=EvCr19UQsFe+qk69FVhmQeO8f6nfU9NCWN8u2fbVosZfkLRScT3IjOAk
   v0RpvngBOoaoF4lBKOgdXj6B/693W2VyOeSjAA+x7D8JM3uNbcqfGy6eA
   MZEZend58W0q2TR4QAkoThJqAcVphfpiFtJvwF++Wm91l21nShUh0Luu+
   kUmWWoZEbGeAx8oh446inmBij7hforT1009SgqyVmAE9p6ayVVuMUY1hC
   Ia/irhaTDmfDkEJRiV5eUJf9KumZ9BV7UTeavdRFrv6c4ILeRgvqvT9PL
   588CGCAgnc32xjIXqYaUamjH+R8oER8iG33zrf4PLrp8YuMadSfUmkTDP
   Q==;
X-CSE-ConnectionGUID: LwK7bQEBStC/nMyvERTqKg==
X-CSE-MsgGUID: 9OqMmq3FTWqkavZJsFXaOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66470410"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66470410"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 03:27:51 -0700
X-CSE-ConnectionGUID: iKrywEr8Sza63fW1m62JSA==
X-CSE-MsgGUID: Vo53FA8gS564W6Vzuw2T4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="164900954"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 03:27:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 03:27:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 03:27:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 03:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfhOp1+iThvgI7GiQS9Jq97LOxwWo70AJzvV5heXKQm+s/wHpSrwXr0UKAJtlrdunSDOGL7JyheYL4tiJTuZ6+g5VOzCWhtQWVmJ7VbLwLwVXg6SzIBLVCHOgazUp0Uvlvjrrlw6N8km2LFb3zxe2N3VVRiuiclOHVGBwCqbDZXBwx7HCtT8BtIK3sutPRbdV6roGI+iLypQf3AzjC0aF1MfSLCA5jtr5gG+tUl3ANxqHiZz7NPS/Mc3wsrMPaesimMO3G4V2UGyY1USGXnWOJ7iob2kaqSZ9EYTTyBSewXhe7lvpVK1CS6xM6jeofUv+goP09tBC4+R8XW780kd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucoCUETNAGu1YBnnjdwu1BpdQzXfJYTFbLxB7rGOopA=;
 b=FOajMHsGP388b0ldw8YSL4RTAbj9r1Zji1+nuuzuW93M0rzYsXUqbxIerOTmBtVtWRDn2QX1qF8xL7cEqQG3kIp8+iervAwHNuIR6FcSyvQY5QDw74XBqnZI2pceupTk+X8jT3DQIYE8FDvia4Edc8sbJNMTQOTujQYVhx228Qfmo108/G7dRVLqM0dXe3L1ct0cMBvsWlL8loXYr6FI4vaixY/0LSBqbw1d7qw+2RQ39JVAL6ExxzkbtmBstxX/2JJZ1i+4OS7gMhzr4iAjCUGWAEWUpJ0aOSOs3ZIAc16cwiV/ziQkajRBSMF2+8FCqWK7nGXUFCmXDGuSwNZaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 10:27:29 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8922.037; Fri, 25 Jul 2025
 10:27:29 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3_M2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3_M2.rc2)
Thread-Index: AQHb/K3mt7jVEjWv002j9oYhMiaPHLRCg1vw
Date: Fri, 25 Jul 2025 10:27:29 +0000
Message-ID: <DM4PR11MB7760838E2FBC51B510FDB3A3A159A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101983d016e02-c1eeaca6-a9ab-47c9-88ad-b4853991430e-000000@us-west-2.amazonses.com>
In-Reply-To: <010101983d016e02-c1eeaca6-a9ab-47c9-88ad-b4853991430e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB8035:EE_
x-ms-office365-filtering-correlation-id: b6a3583c-e579-49b9-4a96-08ddcb65db92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yruwI9WNpa6XaVwLTdAq1eGgJTMsIE0a39gn4PXqeWoJ0tjuI7IrnxT7d+93?=
 =?us-ascii?Q?pa0nWl2Re9Rt8c7Q3+h+d1AOdm30sbqfDmOwfSZRrA89L0KZRWil/BxugTZ0?=
 =?us-ascii?Q?jeFRskK//peAgE+kZKDbhLvLhxU8FkhT2dT8F2Tt3l1qzc2X8KWVgWNHXNV0?=
 =?us-ascii?Q?Cn8pWDHBqFaZyU4NoyYz1JBPP6BVDJf7iFFaggr5pZYRvw2IsHz/fGGHB6nx?=
 =?us-ascii?Q?yGl+juCQPV5i8F7xwspnFRMCMT88od6G9zLa+eIo86CCPVyKxe3U2mvrLTpa?=
 =?us-ascii?Q?+lNUGVdrobGPgRD5bYKmCMiu0vyzEZqJlFK+kiwrCPFQesQZ2VSvBf7RB8BB?=
 =?us-ascii?Q?o52FBQdhh+SYsky7P+OoKHMj0GMxSnp3/1IWVu/i4LqZx5gerLTeRHO01pM9?=
 =?us-ascii?Q?J6XTUjE3MwIshyX8s7HttULP8ScAXaYCZ2rbPnDccndZztmPPs+9ACCTqmWa?=
 =?us-ascii?Q?A+jhs7nqvUPiKuP/38ekAEv18U7cNmheBFteH5hypfPw2mmWQuXbBXOJObrz?=
 =?us-ascii?Q?XvyRXa/JjjAdRk08Ejax7sFZNwpHa0BB/lkaeek8Jwg3Dj8DKV2tXjPyo/aI?=
 =?us-ascii?Q?TrzD+1yi8JrUAI7oNqDgt7+CNNP50AovelfRGWu0/+y7WTI8CBKd46bD+g2J?=
 =?us-ascii?Q?mi1K76TXuJ9yNKX/aKbC9a1cvqcoGLfEgpxGvBBdWdASO3+F8BRTIT+SrsS5?=
 =?us-ascii?Q?NuVs/eTkLQK6iBNb0q7szcvQs1xj89t4Q17/59tNVBCAYJT2XRVf0O8XYFIG?=
 =?us-ascii?Q?rpdh3Fo7/ZsmFdjEbA/GAZ+dqbk4xVF1p9bkwtEccN6wE+T0kiDxDp9TcVPj?=
 =?us-ascii?Q?RPqY5Jus18XeXq57oUY9Pas6KH+N+6F3L0FZ36toGehpCRqC6yAcUNLSxO/K?=
 =?us-ascii?Q?F9RtQ9CPEC/wfRUJ04sy7QEgXeAQoMpXHDkAIydkf+3qKNon6Itb7E7ijBOy?=
 =?us-ascii?Q?4dS8fTvGq1cCVjG/zxPgtaFlu6jTR5vTxiq8ONOFkswulyWiEhWHAyrLefkG?=
 =?us-ascii?Q?6EKO3t7bYayGY+FfLOKodqtkSP2sMO7lWVCv/4UgjvD7quA5qjJzrY/VYSGQ?=
 =?us-ascii?Q?ErwTVgxAJ2IzxCqgjbyGarkv5mci+o2H06tygsT3CGkztAKCjdEgIHsuZwBy?=
 =?us-ascii?Q?Umq6Wvy87s3YvFmHaG5dMbGuN6hSObXQmxcyHv6R5xVp8VXrk/Ptz8JTzRi1?=
 =?us-ascii?Q?tbRhZPpFWGn+RIxcwan37J63fqZ/1yJd69gXum54Dw2ipsSDYBLI7KCwOPuR?=
 =?us-ascii?Q?yYmssvEBXDZ8ia2UpnY2W6XYKeN5YtNeB2LTrydAz6o05Egrt9KTdernIy4Y?=
 =?us-ascii?Q?FmFKmaVMLyOzPdtpXtEQj8DG9V99dD+tVDgT1D4zXAnuSEulyoCoqBOzQkoV?=
 =?us-ascii?Q?U7OEAOu4x/4ORdKdInZ7pukorTu0O1tBR1x+hwTUBQ6WE8fSlOczKmgJlYUZ?=
 =?us-ascii?Q?che8lZzlKFU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GjDooqYJ/BB8IDLB8OFmRgsHi6ER4wCtF5x1xkBYTtN28Rl2i0lKBSxUq6DZ?=
 =?us-ascii?Q?Fxg7hU1ODLqHhOflsNorT81IBrUt6Cctu35rXzqePi087JGA8I9ATZwMnGCN?=
 =?us-ascii?Q?5AksnZuStvi++zm8noGrzhZQCMKXiVGI/AMJniKxnAw2Cep8lMnUYybDgkG/?=
 =?us-ascii?Q?RvUOkiW9eBe0uaFRHxaU+YXl1pfQHqrs/9dSnhZszptpciRutXx6k6jlcj3H?=
 =?us-ascii?Q?tb+okd7xQkIecTvlee9MlryrpxEfqbpIREYR30bdM6vLr/XJM1onJ+78H7qM?=
 =?us-ascii?Q?5zP0P68n2MU/nfw5crptL3EiNZJAXzQ7sSUGWSeeXNsns6wpteC9GIEMtN8p?=
 =?us-ascii?Q?KlHzcaUoR/H+47EsEbs3LjKqyFGq5+s5/lO2TWTUznSVSg1x466SxF72tzV2?=
 =?us-ascii?Q?mk0LjwSjeOmOMMldp+0y7IM7f+P7LtR42ThbYD94OmS4rULhCPG6yfA/SoQ8?=
 =?us-ascii?Q?LNGav1fqz38pvZ7kLiCc8b2aYzh7TyJYj/KKOgZ7I3wV+ZvUI3ioom1ddykU?=
 =?us-ascii?Q?xrqbknG+ccpPhu6E+xpepGnb45M+dqkL/sGwOdZtzcwpiBNV6KDPL8RF8vhv?=
 =?us-ascii?Q?tD41eufM1RS9BYCf3nePLB+3j4UfWicNpYrd8URcyonvLsX2tWPsYqw8NPli?=
 =?us-ascii?Q?g2a7ud8tre6OlyM3SoRS+1/CI8jbmuBqOBOqlB+srZH9hjkb6NdSj/PCN6BC?=
 =?us-ascii?Q?CEtsOuiJAZOz7R5No0NH6M+LbTk5Vu3igzQwdCVYQ2pJQ+qgfc0++Mgw5FKa?=
 =?us-ascii?Q?U9yoDYxZJCazL14VPvXAEbfdy+OxQHfTYG7vUh5iM8kcOuoQ1sclZ1q+e2z8?=
 =?us-ascii?Q?mit/86h1oNOvJwlswyR5VZ0lOqPQZofgc7UV8hThwhJ8UvmO2c6e6wrnisar?=
 =?us-ascii?Q?6yz/+Nf9oOaawwsU6UBAPmti16FstD4BIaHWj2WiwDG7LkY6mrL6QzGRAqEP?=
 =?us-ascii?Q?Hqlu5e8I5kclYJYEkDIjf7V9p4B1yfV1Cvx1XrQyWe5QZYu/E7rG23Yj+5hU?=
 =?us-ascii?Q?rx5fiDD+ZCpRIZUabyVbT7AyHPB1wuEeOSY2BjRYG3Ri4QXzwqtrlPixAKH5?=
 =?us-ascii?Q?C9uWkfPYGY6IyI407kKzqOfDQtqRlVFNhHIZv2Ceeb+2pMqlqjUxIoIqDjor?=
 =?us-ascii?Q?7wx6kwRgUefcXc9dwa76mdAMigy52ugqmAMSg4JBSlRPSmYmX7Vj/ZvujP6H?=
 =?us-ascii?Q?wKH42hTXnPE/iiHgVsIx/9V78cM1VvRutJx9hInlYSFAZ4If/4brNUWKhNoT?=
 =?us-ascii?Q?W35A2mmO32TYE8iKmhbe104Jv8ByGkjmSVcw3HF2sXpm3fmwy74nbOQC/v7C?=
 =?us-ascii?Q?sXi+DX6r1QyPAT1AKijasfZOF91K6lhA+W7xY/KjHKZhT0Hh8FLh+6Tsw5kN?=
 =?us-ascii?Q?MqnmhXhJ3Tfzm1lJH/pvRK2FFnp02VXU/WzsA0wJE8r7gDI0ZyekOAiGa7xP?=
 =?us-ascii?Q?b50RJxmhNIIawMJHmp3lM2M/lTDrGtBVLCmjOz2Iao8vdZR/i3AW8gGTDGnP?=
 =?us-ascii?Q?DrkF5oviIgnyrUOe8wuApa45NeX/VcO4d65nmCWeqZRP8vU+jvXtisJGgY5z?=
 =?us-ascii?Q?ogHaGwCPWKhUPCs4sgyVcg1ue6J+NxeKFb5gRggt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a3583c-e579-49b9-4a96-08ddcb65db92
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 10:27:29.2160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: be/2bExdevNiogzDLK58ngHu9Oo3/Sag1SXgFNh/Yk+4Hu8OUfIDjl9ZWy0zjVa7skPpZ2/hevscspRTYMUZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 10:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220904

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.3_M2.r=
c2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S=20
	3. Arrow Lake=20
	4. Meteor Lake-P=20
	5. Amston Lake
	6. Bartlett lake-S
	7. Twin Lake
	8. Beaglebone
	9. BeaglePlay
=20
=20
ETA for completion: Wednesday, 30 July 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Thursday, July 24, 2025 11:16 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.3_M2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.3_M2.rc2) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.3_M2.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2081
>=20
>     Build hash information:
>=20
>     bitbake: 5ba7c2f0797a72536a81f57276d4e5c75f23011c
> meta-agl: 5df5ef43a26f441d8434ec25b2824ce1b8e9dfb9
> meta-arm: 77ba0e68e3d6ffd380346c616a60bf0c7e35a08b
> meta-aws: 7e2eabe1aa248cf3c6a69621cbba40343a2e0896
> meta-clang: b2139ae4b027cb014d0137de0b46e9197a10a4db
> meta-intel: 7fc52266ae25215e0d510a792fa3a688d173d1dc
> meta-mingw: 3b92f104e024bcb1341b563f396291b41786cc38
> meta-openembedded: 714b3adc3a92d42370a0ea57a9744ad2d031db7f
> meta-virtualization: 9b034e3defd4aa1108d7a6b4dcca600d4352b132
> oecore: fed2692c4e7b87fd2bf08a5abb4391b79bbfc982
> poky: bd4625cd4db0f02162092d85aeab3023914f768a
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
> View/Reply Online (#579): https://lists.yoctoproject.org/g/qa-build-
> notification/message/579
> Mute This Topic: https://lists.yoctoproject.org/mt/114322587/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


