Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CF5CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 08:54:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web11.18187.1755161631869495917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 01:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BxfY++Sm;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755161632; x=1786697632;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5M67a1MtjDI/BtBF1gn77i3cZibGxZLk3VYeZ6XoMXg=;
  b=BxfY++Sml/F0hJ00AnM5D1qCRsvD0S7kmO4Rz6aEz9UmSCuJU6B1+8ud
   J5KrutkVdzKW+CFG8PlSI0QlQ/aFxLZrZSa5Gbq5HpxJdeMpdbCA1ftms
   wCnp5TsyIlHCjS0tQPGTEl8z0WkWDJ+MqOlBScO8REZdrdw9UXbPkhcFJ
   kREqVVeQMl9TtyyWGKXFZMyPlZqHWboKDyM/3o9amJMKSqHpvZLSIMLSf
   JOHgNX9Xskg7jfY5HRPf6izsq+Ixy/qSIg0nELNEGK+b+WmJcElVbcCl1
   E/eShZmt/Q30a+a9pwpGd0P9BpaEYfF5zoo7ev6PrLTjd9dt4kEpWtKNc
   w==;
X-CSE-ConnectionGUID: CiJg50nCTq+hYkxz2cDCPw==
X-CSE-MsgGUID: j9nhw4tCTMi5qcbM5uqWNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57619980"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57619980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:53:51 -0700
X-CSE-ConnectionGUID: pLY+jAe+Qe2YWmv24rizbw==
X-CSE-MsgGUID: 7MOM7jqEQKWfOZ5wfZli7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167072939"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:53:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:53:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 01:53:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 01:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9OHPK/pwYbpcD8Yh726oxG2o94y+S/J2DjTdJ1QHyZTC18O28IF9PcR2CVQFfWO1sxiAxbjHxArqQXEmsfN0qTe5kQ981MgvjfLNzdhKUxlV+rny439NKwEqamubzx2tMtfzqWrLG9mwDzd1N8ETgfRiF5+z6v8xHlwOsGZfEH7d4VsyAhawh77O0LmQMP95ip2ALzQTKiYBYQh0rD/GEijZrsn1NTrbaNyPvlLIAHvdb5/MzRCdbJ+sc+bidJiHs5eAPbpetBiJEBSuGbBuNnsi0aUzZkuRFLDnlw8XxV8Sj7cmKnfxkCUFy+3oHcbSfJefsy/5SnnOztYcQ9b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFpKIUC7Werq3eRAuH1TttRQ/FPsFKryAvDYn0j8K2A=;
 b=iQMQswSqX/HuWUoqmjWQSR6e63PW2xZKxec4oCWU3GLhiaO3U/oPNy3G4ueLRw3M7hTNI04Wvr6vIZvIgIDsMwSslP4dk/EMLkTv/X1oGFmqWE70/ad1pWeOuvl3tjaSq3W48gWQfTvXr+DU36zQieOLUC76X3LMz3V0zuNcYWT3CXKMdxps5pb5c7QtQWllTFmn+Yevf93QGEalOECEY9L7e41nhGjNgo+NiWbW1+TEilDyP44ePquVWEbxXUM091KlKuBWwXch2H/pA9SbWmZ95qJEBxW8zGCun4ImjM3oVMMxYmM3nfZpa+iz2xp5PLW4mIBBFF2LUywcC3fU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA1PR11MB8247.namprd11.prod.outlook.com (2603:10b6:208:449::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 08:53:49 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 08:53:48 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.29.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.29.rc1)
Thread-Index: AQHcCIMny3ZMFwVVr02dij74I5ry2bRh4KAw
Date: Thu, 14 Aug 2025 08:53:47 +0000
Message-ID: <DM4PR11MB77601D92CFF8EC3E4C0AF00AA135A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101988a8ddda1-4bcd7346-02cb-4e85-96fe-d5f0fb67d5d0-000000@us-west-2.amazonses.com>
In-Reply-To: <010101988a8ddda1-4bcd7346-02cb-4e85-96fe-d5f0fb67d5d0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA1PR11MB8247:EE_
x-ms-office365-filtering-correlation-id: 6c604110-c489-46e2-9e7c-08dddb101575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?+9hQSkpsLxYxIFGxW0WbVsiwM7xmxL54mXtCELdmxyJ0yfKyOocevTwBwZ6j?=
 =?us-ascii?Q?NrCWftoojzf/XOhtdMYWPTbnZvs1zTtuQUx3T3VE+jH/qzX+7VrHC5MLhbcS?=
 =?us-ascii?Q?g62PV+5mvLlzVHNdKD/EDMdDsOENYE+xGVtuhMyCRky+/YS4ue3Tz2BFBle7?=
 =?us-ascii?Q?L7wyFrhBFVCbWTPp2CPjqYK9w8qrLLg90MGid4z+9Z1X9jta2sGdu371HMfE?=
 =?us-ascii?Q?Y81g02T0TE4QttkstQl4iykXAmIeYgg/6cItvkSO94qlE4gCK8NpiUhnRtrg?=
 =?us-ascii?Q?sCygoPwFeedUlfB5Ubv/RHdXEUMoohYN7VnjIA2+4K2juHIatbsQAzr+SH7K?=
 =?us-ascii?Q?U5RJ/Vh/DDHGlrgsi007CiM1ZZBpGMCflX81WoGluLx+yfpjsVSe0xGUeJVM?=
 =?us-ascii?Q?yIGkY40laC5fjP+GmZpylQXSiIlWKtuKhk3agJIQepxxKEOyr9yHTpy3A5RQ?=
 =?us-ascii?Q?cpFNrijycz16r+BT8rA10Pif6e70abu1/3wV7NOX0pl81SJm20F06v7Cqau/?=
 =?us-ascii?Q?aeWpdzLea9sFvgAAoh7a3K2u1X5nfqlSPPqzJ8jt3k9ONKanKECL+8itT9HF?=
 =?us-ascii?Q?GfsP+qgb8VKhxoMGdXySIwTWxTcxyAuCmgDa4aWEe/Apt9ugYehw25ZhlOeN?=
 =?us-ascii?Q?LSxliVyaC20DqT8K6YTdCcJIZf79VkEUaTtp7B70KxXA5ZBk1/0vmQJUwG92?=
 =?us-ascii?Q?y2ELroOHJmVasra9J8gOO1zmCtp2i0AbXYM/Q4yb1GR9CVpaM5zfcuOsM9zL?=
 =?us-ascii?Q?lL5A7wp2XHZTcvD1eW6V+vvcWu0rt44tGwDbqSrEANNhOkWwrj2UoXgQ0CIo?=
 =?us-ascii?Q?lrpQttSpB1J7cVPoHTcW0bGWnE6hi7ClBXrLqTkikACg98gh/+jKCn9s+nx7?=
 =?us-ascii?Q?wjtoxaH5ubWR0j5FBpTpirHUUgkM6OQL3cabbX6VBQFRB2YI9xIwykOIrm58?=
 =?us-ascii?Q?ZfGV4okR10OKkWe8wMR5kjBr68CuEbdBQRySOTglS1NKd9C+MDyOqaL0qDp/?=
 =?us-ascii?Q?N1g2c512bmn2qMKxRS+2+PiNor8glClIHkMxHP10mqLzIqeVJ7PtokdMJkbv?=
 =?us-ascii?Q?AKahty5Z8MouelN0p/ZD/cm+1zBnn48X86b35OgFNkPax2UGIVLy4IQw0hwV?=
 =?us-ascii?Q?MVzYRlhSlPlCBGKdNU3jqChNr3caUdTGQ0avYptpxtRQPVmaF5croSz4wnYB?=
 =?us-ascii?Q?VP3J2H4p5mKBuChbiDAwcQMhxmiz5H7lSNCHBtHNKnOKZZ8Euez0WKceb1tq?=
 =?us-ascii?Q?HKb46sfUA7p240X48CFLhEUPoFZCbJKvCEAHFjB76TK9TRMRSgDwI3HnWjzY?=
 =?us-ascii?Q?a7Mu3Ubm/D5BcawUT46dzF8lNrE8dzr3tQxSJZ2dbdFufgD2m/jIa2MbVC8a?=
 =?us-ascii?Q?BNmgqaNbv8hYlmsRqpgRsBa4wjjT5qr95kw9sBMEMqaAUgW30KyYi6VMcuGn?=
 =?us-ascii?Q?RPppNX2/YPk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HfxgE24jaF4FR0w3UQceF3nZEjsYhF9O9YcZxbk7JeL/JmhqEHfJiPiFLjyl?=
 =?us-ascii?Q?1hT1rWeagxbE3VEaARE41f1V2z+fwL7T9lpVH3YreRv79/OmcrZZA+7141z1?=
 =?us-ascii?Q?a42M1zNYRgVM9a9tDJbaaMZLk1zsYR6wexB4ha55mfg9HK+MB2opPln/qbyn?=
 =?us-ascii?Q?0Rk9fbbw7eTJazzfNoxTbMI1k/Wew9npmcQm+SGK6Mf5YwGqBYacHO5IxCq0?=
 =?us-ascii?Q?lfsFy0hhH5QsRKGPdfci1RfiyLfbiZgRSdmzmrI+3pmH5MosaSHZVyDLKdJ+?=
 =?us-ascii?Q?n4ghhjJwSrLP7vIKl7GzJ1Ft382unDimQJPXA1o6QYXcG+sK5sOgybVgGnTy?=
 =?us-ascii?Q?hESmBIMskkja+rOsSiABT1dyEhVy1Eg8oFci0dOgdx1e46s7+2XIpu9dWhxO?=
 =?us-ascii?Q?fulVIIs50nREq+R5nuJF6AokwGMhZWJRFzJDbmBTh4bn1rFy/oBDwWilGKOo?=
 =?us-ascii?Q?IBItkFCuBoxJc5xLY3GAYuNaM8AGhTJ258AHx8q6xWfRsDV6Wi8kyoPTUwhX?=
 =?us-ascii?Q?IqgvGWrXEmn45GPc9cq8oyJZlMhadCGMgrBf+f6qHbJloqPmO0Ilem+kLH/l?=
 =?us-ascii?Q?OOaWX6xqe7OZJAolVyENNAjzgkaM8i89Yf9XN9SVN9P5XD1eh3kz4u53ITOO?=
 =?us-ascii?Q?veZJyGyAyWOtuHXmVDgk7eDE7pkAa81cHF7VmRT5V8UIs6G5JMEbyY0s6TYS?=
 =?us-ascii?Q?xj9EvoE1aL5C2sohp8aWeumXon5+vS4oanSkUh/tdUDv9q7vx90K328m9yX5?=
 =?us-ascii?Q?jVVO8YTdmbWsadoqBiEt1h7KCnIX6i8z61oi/aOZS20CuKD5CLc5KQ6jZL4b?=
 =?us-ascii?Q?ksiUQx/D3X0V3U0v9Pcvv1/VOi5PmN6f6zKfFz5hYgi4TFBGwpdoqlH/UWf5?=
 =?us-ascii?Q?jLIUvyoK5J0w4Ob15VA5+jzeenDCUOoNZVcvpARywWTHJMgwdm+mrrSEY4nI?=
 =?us-ascii?Q?8ChY0g6h7RmnboJ3wuyndjzmksJuzKWLX/fUBmuiUZTOGz1g0Jp3Jqm91Zhl?=
 =?us-ascii?Q?pvTFLr2+ooHlgjVveRXbllTyQoWyUvU1cHztlKhhV1Pbo/5xfNevkCG+vq3+?=
 =?us-ascii?Q?6BWv6ieiE86WIlZbPzbIBDSmXd5ssjfx5EAZC8j3V9xN8GYq5obBUc15AwfZ?=
 =?us-ascii?Q?YUk1SUqHY/knpYouGiz8YC+hk1ZSCuUDlf8XD8ZCmlLmF94kfcB/n3TrseCo?=
 =?us-ascii?Q?viaenfUtZ0A9aC+f8sCufpTLenlEo4LS1dK+lrXn5LeFmJKCt3NqvSsfm300?=
 =?us-ascii?Q?Klccq2tTCGx7obcWLP+ArhaG1ULAodnQfqB6tapXhTUIesiX6riZPs7KG/3T?=
 =?us-ascii?Q?y0kQeze4UngM++6U7wC3KlPJCMF57MiUfruTjUuDh/GYJyDGiE7truqmLTFq?=
 =?us-ascii?Q?0xAdi1/lO2QU6NJW5v6aQ5fxjWh4JvLc9fHC98i4szGxZMwpiZVMXSCFle72?=
 =?us-ascii?Q?wGN/y/4K8q+2IiUaHVV8WDSX+kAR29CDMo/Lj/q3ST0j2q+A1lmt+Tk6LNbH?=
 =?us-ascii?Q?VurZsIsTh5cnZPJdRMBm/ZNMSfpZORgcUMufNB/Ekqd23FNYA3r+hmrEKXoX?=
 =?us-ascii?Q?mDyAsJw6Hx4uPn2wQnKTtK9w8QxIVBinzGXC8Ygz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c604110-c489-46e2-9e7c-08dddb101575
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 08:53:48.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjdyD0sVsqYCTUMapiBXTa1dCoV15qCWqJqomPhxeqUvtXGhB6jK4Zv664V5adJkEgLmUvE7Ts5ZGwGNNsqtFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8247
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 08:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221854

Hi All,
=20
QA for yocto-4.0.29.rc1 is completed. This is the full report for this rele=
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
> Sent: Saturday, August 9, 2025 12:40 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.29.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.29.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.29.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2170
>=20
> Build hash information:
>=20
> bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
> meta-agl: a0cdd47872a252f9a9075ed5151bbd595fd6373c
> meta-arm: 10c27f061b22af78e17a23cf540b69501afc7160
> meta-aws: 876bd12dd82a5f9dd40a73288f0c2541c15a610f
> meta-clang: 8a1d0a1993040ab9d2fb7259b71e4c9582f5cd17
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 95eb26cd3372439443acd1f4d4265989aadeca88
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 06fc0278f10d630838d703dde707bbf0e2999873
> meta-virtualization: 3e4dba95e6b5f5f68d0b3a5899b106c89da59428
> oecore: bd620eb14660075fd0f7476bbbb65d5da6293874
> poky: 81ab000fa437ca04f584a3327b076f7a512dc6d0
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
> View/Reply Online (#582): https://lists.yoctoproject.org/g/qa-build-
> notification/message/582
> Mute This Topic: https://lists.yoctoproject.org/mt/114603423/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


