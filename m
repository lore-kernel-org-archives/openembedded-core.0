Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1FEC021B5
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 06:14:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.83490.1740377641992418322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 22:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HhZmBj6S;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740377643; x=1771913643;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=235inun1QsGAQpOW75gQci5Rrj73RRivUx3e2jdqNjo=;
  b=HhZmBj6Sus95/qNe6SrdnKeRBIawGidVWW9tY8sBcYqTYWOJfIqZsJMD
   ZypANSER5q0TBF98uPkMrjfinxpDA+5uu7vQn0Z49pSH5NzVZ41W6UmXi
   NFCeBdKE8aYsIpWGy+9jZZwYIknFuaYIx4jWtmu+5OsqPxUsh+BqMBh+o
   6CE1ZNLNGIP3ZW/dlBFFg2cMomhiAzqFVnpSY0keVVpcHyIKZOVdufE4I
   21vGNAY7XkwnHssgimiUmUMTrVyaOGGD2aoXe2OszIJORmcgxa8dNv/bu
   FOaqli+ERWS6pMvVWIjYshW2zHvAzeth7IK45xigveDfDdeG5HT+jnpF9
   A==;
X-CSE-ConnectionGUID: /0EbB1IZT+ukTrS4bjkXGA==
X-CSE-MsgGUID: O8Db9ZTYQ5yJvbZsH0EmPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41032122"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41032122"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 22:14:01 -0800
X-CSE-ConnectionGUID: jKqL/TM3TnyK2OQDptfzPA==
X-CSE-MsgGUID: V6/BnUbGQDqBCztzQ+bPZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="146812935"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Feb 2025 22:14:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 23 Feb 2025 22:13:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 22:13:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 22:13:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ozx5Mq6KDEbCSAZjUH+N0BOeY5o1e89qWDTJFBJX6MO6rKk943B35sBe5uo4+KqnBqgCJsti4uB0R2yykBeD20QusFWw/HvW4eOOcFJcraWEpzaAmf4iVHoVbVZ7n0TGmzopgO6DtdDfXXi5spbQqz+OvMBdX5/rDlreR8xaBxzjuYc0TgeH2+i1WXAyVotX9Fkp5MqvqW1D1yR3Kev/DJg3PtWSjRJ+lUSQjISiMtHvwM5rncQG7WVy9j77XJLb1m+VYXvFHhRXLSKqOZaWAB47IzRYVJdLtXgtgRr8qp19qeHp1q2z6Joh/Ci7dd0khTJzxNqpNla+qL65Elq5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kclqoqf1jBSy++TYEwuKYEZMRcF2P1cj5WMp/b7LQ24=;
 b=QUr/oNFi25MOYhHVCt/TN+PETEiM3F2WoFRMkuOE9jQP9psK07NBWdZDFMJOmAr8WmIY/vHUKY4/u8AeBMDrBTOZbMtpqoIF90d8SWMGL7uxkI7UYeBSJtovelNWvfNFFrRCVgfCjK6VEjSDKXa0A9VYSKgVoE6o8g5qgqKEBSrQCUiU5jLAC7lsZDGBguEdT0GFYe5be7LKFAavGdAsB8Y1tnkLKD6mXOe/IXudy6PYsntJ2+Gw1TbNWUbRutbFYlwj0shxPOg083PsG/n18WjJijo37J6rRSTmKp6K7KQOCi0jAQ2+6BwPNdwteEMZvAkjruuUmeCcf7+TNGnhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 06:13:57 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 06:13:57 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.3.rc2)
Thread-Index: AQHbhZ3k+ppHkMsemES+CwaM3hRdZ7NV+fqg
Date: Mon, 24 Feb 2025 06:13:57 +0000
Message-ID: <DM4PR11MB7760ABA94533065017A40F6AA1C02@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019530b7aed0-6f378277-b411-4c66-9553-c505360447f9-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019530b7aed0-6f378277-b411-4c66-9553-c505360447f9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM6PR11MB4690:EE_
x-ms-office365-filtering-correlation-id: 9f01eace-eb5e-480e-5b69-08dd549a6c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OCTM/uEqErOOkLErN49Vw2FGhGUc9t2pYFvYpGZLCNuMg2JkqMgkCgZ/awPb?=
 =?us-ascii?Q?7HTLnqV2FVPJ0QbUZnt4mxvYX8jWLtzfE922BVGJvsgg/pI7iVpJvrQry18x?=
 =?us-ascii?Q?1Q6M9GH2conKbgyFgnR809FJsxgs/zj1bp+3++wqFt9qntviPZBi2qyNMklp?=
 =?us-ascii?Q?QzOB7lkwPhwKe1PlhgCJZczJhVBK5urqXbS1Z0l5lSoCrJL1dnVwghhW9oeR?=
 =?us-ascii?Q?i6R2d4EpDSRu32zAdloNgNynmK3B3AyhFEBymbPYm2gyQPMa1dEe+i4SndRq?=
 =?us-ascii?Q?+VcjXsBhQVaLakpkOfvTvrbdiNDJoItGPTxGySwBsutO9Pajd8ksqlqO45R5?=
 =?us-ascii?Q?BtnIiduOJ+lOkfj6A14Q4/ISaa4ttgJZ102dKSpsRjZfeG9JprShhw0+ji8W?=
 =?us-ascii?Q?SNky8bHQTaM3JoxjJNoohQU/HhSj7KKYz9ihiLSVAACL2WYxaVk3XivRTqXv?=
 =?us-ascii?Q?pIAXs0vnJlt/0XMqCEk9xO6jw0GO7jEQFYv9jDvwtli+gQq/XVfkjQsMHhs4?=
 =?us-ascii?Q?wN3t19PoP+rpe26i8Tn+CL52OpXk6pOB2WSH4fdThWy+ubONdDtzk8StC0sT?=
 =?us-ascii?Q?HdZna8PmNnIohdkDRpDG/PBgfp4A0JGdzCQjZmRfUM75fBCr2X9kTPjZi6lR?=
 =?us-ascii?Q?w3py4HJo1deuH5fC7yUI0L9CP6fFp1gyLVTNJDju+fpJM9zPetYdhiIR366p?=
 =?us-ascii?Q?hZiPZHo8adtYAyNuQJaR7eyIwTJW8/iVf3fnimycL16qYb7mZDnIt1rlbDoS?=
 =?us-ascii?Q?P2g4KUDkNEAK7UUYvbAtvPlTyKRLTDTVSQnoECHLpzXXmMcP2qneqeMPEwvP?=
 =?us-ascii?Q?SGBYQXXkevkjfseNPf7ckZeyxb3q4vN5m0DsC+Yh1zpdTwRBq+9koQGlKHIn?=
 =?us-ascii?Q?dsyfJZd6nAAjlKuGjux4Z7IMRwcRYPbbl3cFCn6wKLaS5Il83nbHAymZwTNu?=
 =?us-ascii?Q?5ElSF/qdGVXpf21zQd/9motfJoJ9hyZYawkwk6yF8QbHX9Cpnuf5hEQOGmvc?=
 =?us-ascii?Q?RJAhMrOXWe8aXKDj412XxmullIL+K1M0NlVMw1mO/si3wTk8OvSadehF7T08?=
 =?us-ascii?Q?BqRxwN+2dj4VSTKoocfb9N4hZz9cjitWrntQWhMn6PL3h+bmoxjWYvLdEnr5?=
 =?us-ascii?Q?dm9sZohJ3Oaf3IluR52qZZvzajGzJMbClsHfNT9Z02BsYb/1nb2bKAUzJYn6?=
 =?us-ascii?Q?Zl8/7tcWRtgNTlLiGqbKdQXdHjk4pIaclEsynMTWWe0tH2RNEH1gr3r9Ysbn?=
 =?us-ascii?Q?ULabEIY374GtQ/M5ZjCBY67xi0TMbXHnK9nK92yHSfMge+Yhrn0kUk+QDJYS?=
 =?us-ascii?Q?D53ABIob4pCYv3kOQlJeEmvK9xXwFDH8SXQf3eVGuwhf9HHIEDrNX78FAdGH?=
 =?us-ascii?Q?rJ8XRfyZpR6APdI+OT4AfusXjagl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?71vshe1CHkBAdhBqKaRQd4CVhpsfnp7uWE4yJz/X52cZzSt1jmoN9t9Jsu4Z?=
 =?us-ascii?Q?CAuPKT5L50l6wY4YrclDhtJmZg2UTmKOHqlY6CB5y6cw+mtArlou3KnazDsM?=
 =?us-ascii?Q?DkdaS9GmNH62e7jwoofKI2KikB3Y7h4I4DQbgODOLasV0paPwIlfQh70TKHK?=
 =?us-ascii?Q?woRWZDR9fVCzEiELVL8RG/rqYPI0ZS7oJ36XBKYa4ceuNYRq1t1C89tGaIe4?=
 =?us-ascii?Q?N7yghid/SE+z7xk+MwwOvtUercoOoH0psghkzaU40Vni31ukyXIrThfdPTrN?=
 =?us-ascii?Q?bykeCA+di2KzMm1POEb9jDEpgb2SvFWSlV4UacBvffpd8IenXuQIZ1n6BELk?=
 =?us-ascii?Q?U/4ALO6zRrwX0WhuxUH6JiNdMSJwJi36U3pb3KOdbxTzAoHwtW/2ThqRwOrn?=
 =?us-ascii?Q?hhCnYcYM6V6P7+nonrqc9gUJMgu7SXRp5uQ7A68Df0NPnVOH/ECX68kHuuVq?=
 =?us-ascii?Q?J4IFl4DHqJmKGOqFJnbdCBOud5jo2W2zvUdH1h2IWBdLq3lyKg8EXDG5RlHB?=
 =?us-ascii?Q?BHC5sf74E0fEYHrsppR5znqKIjUQv39XSeCSghjF0e2XcQw3JD7Wc7fmtAbv?=
 =?us-ascii?Q?UbN1UrrEFmIwKM4rZ6XMZPpNTMld1nMFUyxu3W+4L9sA3TtnwcFD11D1WGqQ?=
 =?us-ascii?Q?BnV/KMvj9xZzDeeSogVmxj43LPgx91gzmuvKlrw3Osk+zRvwbDqSGl70zWPn?=
 =?us-ascii?Q?+UPqN3CYTWwHdKXo/bMIBHB0PW8kvj8V77pfv1gL/3wgZtH2TTnvuA/0EAOG?=
 =?us-ascii?Q?fxiWb9Lda69YZA4TjGXU++ocfEKAsc84dE9FlAORWmlrrjaQKZ2UEQ3LZ4+F?=
 =?us-ascii?Q?Dt+8kAG8sXHYj0LAvX+dgziwuKATHyArewa2uUKjmubqp6YJoS6T8lj6Ic7E?=
 =?us-ascii?Q?qMlw6xpLUqLCKozfJkWx/wzljRUtBWiqtdmrNPpBOpTQZqc7LE79j9MtQBb5?=
 =?us-ascii?Q?zkvZiB+0NrkBoOogdDZzhtF3x9C+IRuqrr4bU+yicjSolQ3JrRWglCaVd3N3?=
 =?us-ascii?Q?+gbmSZa7arBSPmHQ7tHgB6VEUYil7i/bQsuojWdwc46TGPa/rEy+KUhDO/mP?=
 =?us-ascii?Q?7amsqDdMmJ9G11LVqGBWkRrrZi3hu3gt3C1hIvVdz2eAt46OThDu5WcXHjot?=
 =?us-ascii?Q?9bL62glCv210PzAshItukpgmvzTKaPlPeUUaeiJd5yFuwmZTi1V6pSDaVoPg?=
 =?us-ascii?Q?7otoTufp135H7BDPHGtmUCsUTclRKIxF2uQ6QUxMZTP+j3fhVyExx+B4UqjG?=
 =?us-ascii?Q?f9naWaqaE7RL4EIJ89ta0siLjJlocaMYt8nPSbGwVQLhZGY1zoDPW9BecB7l?=
 =?us-ascii?Q?u1Q4ViVdKj1sqw6pV9vE80UJOzLWEMsmbXTTfSxOt3n4gKnvb59PN6xDk1BF?=
 =?us-ascii?Q?fSqEEnoz8r54B6kH/Kl9xl+BVi1anZGpMpyqyAD4FENTK41Zy5WLKGJlmnRO?=
 =?us-ascii?Q?qnex0v+t/B3G8fG4Tlkb5IVqOVtdPU8dbUsR847nMODG7QWqtgf1MeDbb8ZP?=
 =?us-ascii?Q?DBgVmtTwi2B9vv+N6QZx/HwRZGtLsRgzXcihtS2L30nmpaVuk0bbnR26txP4?=
 =?us-ascii?Q?iriActuPDcfLXXgsq5d5RcIJ93EiBUbAUy3xFZ9t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f01eace-eb5e-480e-5b69-08dd549a6c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 06:13:57.5443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: meZXT8iIIhERJEjHEoMSfdH/r8eeJ3AighZB/Wpsc/3BTgk3buAw48/wU06sblZ7Vjz5WQ+1+xpOclqxh8Xu2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 06:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211838

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1.3.rc=
2. We are planning to execute following tests for this cycle:
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
	6. Beaglebone
=20
=20
ETA for completion: Thursday, 27 Feb 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Sunday, February 23, 2025 10:52 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1.3.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.1.3.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.1.3.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1067
>=20
>     Build hash information:
>=20
>     bitbake: 58e5c70a0572ff5994dc181694e05cd5d3ddaf66
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: e56a0cd6fe5e796aa59bd0d4bcbbb585ea626199
> meta-aws: 9d8d77cda988ba59a00b723b0d78f49a206b5336
> meta-clang: c709a5196f1e8654425b43b478064395386c36d4
> meta-intel: 0ee9e8454cd41dcb0f49df7dcf2182b4d5e7cc96
> meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
> meta-openembedded: 6851cbf026088a13b2b45f684838d3dc4d7ccfdd
> meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
> oecore: 35ffa0ed523ba95f069dff5b7df3f819ef031015
> poky: 11a8dec6e29ac0b2fd942c0fc00dd7fc30658841
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
> View/Reply Online (#515): https://lists.yoctoproject.org/g/qa-build-
> notification/message/515
> Mute This Topic: https://lists.yoctoproject.org/mt/111335962/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


