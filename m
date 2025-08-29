Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA2CCA0FFF
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 07:55:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.8239.1756454149525831947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 00:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WOHY7NrY;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756454149; x=1787990149;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=KbvWN0/emfWYhe+n29ozg15rLHlKewFU4vXO3Day4WU=;
  b=WOHY7NrYi0EEfYZcpZJc2Ef8YPI4EWrWHnpP+Nmig82H+NwbtTN3tTBa
   mS4Jmg+TrA9+DY9JN+7Mo5I5iKx3IFeeADjQ/uNahKtUVZe7YWHUaydUc
   Hdjj3HXmgVlbY1UmeTFrWo/irni/Niz6CE7K4W+9UhjuK9TCdnVTxmg/F
   /p6CThmb1yNKRL9ZaBnkjMUwZOHNVQ8Q1h/4mElC8SQNjXgpr01onQdqT
   TmC5Sb3CylOJmjLCJzEokta3xdEqg066cISkaJr8nlfw2ipivShvRfZi1
   PWQQ2DKWN9aoR41YcMUcKp3DGcVncwrQlgjGGXt4dfPmfPxFX3w9TbAeX
   A==;
X-CSE-ConnectionGUID: kmMIhTctSWCIi1sq1s+S5Q==
X-CSE-MsgGUID: bQPOhEThQRaqSSoIS0Ji2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76333818"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76333818"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 00:55:47 -0700
X-CSE-ConnectionGUID: zIZvvI9NSzysS7XLoClGOA==
X-CSE-MsgGUID: UrDR48jcTB+Q81sIXmJCZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="175619367"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 00:55:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 00:55:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 00:55:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 00:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6oQXWpCtw/g34KzheSq6nL9TQxM6F2o9klsgzRU7CARYMZdLU+KEMDTq06qRbewu5Vz4AE9ySkTgPbJ1Hb9FpSQOprT5GzXjZ4UsE8uFWkqYA7aezXKhGG1eDEv7V4C86GocwhHWj/ypT+dyRLEzDBsPWzL9IuQKKzlEyRWa6W2uryjJLGvu3dqYA9ynjJBXjpVcSySEjWTu1aFGS43jSppo+/qMQ3hHcO8Co6BoRYS+vdijYmlHJWB9HlcMMFNoKUDG5x6I8SxqopLqT9vWds0SpHhDYMli/jv1cnh6JeMN+fTQBSZxqNbRrZ2YRC7AKZnCeIcd7W7UgwKfrlTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wX9HhVbL+2P6oGETYbc2ZcoLOuuMgEc9SDDEF84iRM=;
 b=IguXWiksRdlHd9d9k/2QieoqhcfOVHN7smvdBbEWTFNC8OMvfeYthcHX4gkLmWcNrl83JEFFc91WpzP75NSzU/h30OaK1odMry9BFHgXvV+TkeO7j8/vWd/dw10P7+HSNK2yqvqyomxjOT74Gn4XKbVfHimtZqnCVEM/bfhzsP4O1pbxQNWfYfnxj9SbpI/lGYF/reD/zFqNo6XcPfmLblgh1zO3BTRN0VOvlpvfkK6+2vubaFmSUtpZEXAgRm9NOqzAm/FNpuiwRrjNEKy/GJuk2ILNgoQkOaoy5MyuGILgqYrOK2MyNKipwrLsmaturbHcqC1TXUuhcEdJKaaDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 29 Aug
 2025 07:55:39 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 07:55:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.3.rc2)
Thread-Index: AQHcDkpDY1ZEicWvn0a9AsqPjUiv/rR5V7Og
Date: Fri, 29 Aug 2025 07:55:38 +0000
Message-ID: <DM4PR11MB776017FEF59097151639DADCA13AA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010198b06b7c42-51779eb9-71a7-412c-b303-16a3ba0a4eb1-000000@us-west-2.amazonses.com>
In-Reply-To: <01010198b06b7c42-51779eb9-71a7-412c-b303-16a3ba0a4eb1-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM3PPF0644BB20C:EE_
x-ms-office365-filtering-correlation-id: baf38a7e-965f-403f-e217-08dde6d171fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?35IpQEGdtLTRgHmcwpA/ZVE/lf+K5cjvThW7PTvPjSZ7szQ66K3O2TnY5rEF?=
 =?us-ascii?Q?ds/T2W3L+h35OATvboRMBVRcFLDKrEGbcX3M8r/7u31/BqcVoIY1O2KXszqC?=
 =?us-ascii?Q?+q75K3fLtbLAtkFfGSZKh1AVh/+sUksZN3rMttsmEs1Blb4ANvRIPjyNXCtc?=
 =?us-ascii?Q?ZSSThWl9zyJyn7bfaXGDDieQRJsVeT+3Z3j2fBAKZJFgaQ/6MMSGK43eApmg?=
 =?us-ascii?Q?BoIFza/5e70snnQlS2+6sFgJa27glevkjuUhUGemEUs5LTHQHWsbWPAdjY8o?=
 =?us-ascii?Q?AhXyb+Oy6O0KlZ86T3SMfNpvV3pI8FSKAQyFKNvfKrW0FB39v/Rv8ZB8Y0h0?=
 =?us-ascii?Q?0lIsc/1g4NeGtv1/DYrCyWV7++p11DooaEV9JQbz5uEk39xKJ3KW7+/crCyQ?=
 =?us-ascii?Q?WinwuMb2BATKK4umE+g2hwIKM2MaNvOKknT3z+Hk9IhC6DYueeJGz1LnucO6?=
 =?us-ascii?Q?0EUvXaJbSXm/c2ZzUUk5orsWCJnFnHrS6xzWmikrn0/VLSSt1v/craposV5s?=
 =?us-ascii?Q?mAPUINtMDebVJorEmZOrrijRkROpeopBeC/Y2XYiKNWYJeyuw0NuRlonknzA?=
 =?us-ascii?Q?W2iAtLRaj++l7z6BXTLwZUsDYRb/Dy4Lzq/+hZNNuqSFjguhta3QJtNORU48?=
 =?us-ascii?Q?XDV2P7JZXEbb6uZ3J/E1vqp2bYe6sMbEqLjmozPuS91Meo2VUXV1QAw8Xwgb?=
 =?us-ascii?Q?GQHJAJ9+/4MYCWHhlioqptcn+fceExkjyE/I8F0WmVwWGj6mzTm0dAXwXrbN?=
 =?us-ascii?Q?YZzyaAn+sZAV4wbKKCby2kR+Xpk1KlahT/ygh1Jh1fpfr5u8aTrLTuNeJnFW?=
 =?us-ascii?Q?ZfCKx7vjewH/xCtIcMfkcg1kFSCDHF+BP++sF5qqctuFnurdZUEnFINQxHXN?=
 =?us-ascii?Q?ZIG4MnH3NwHXNh5L539LB3VLMajttSk6FgVl/FWOR7Cb6+R8E2ZzdhUikr7+?=
 =?us-ascii?Q?vIjoHc/ObZIJ4WDZ+VBFrjW86gKstflGEcE9ylQ2GqGbb9itzIahzCa2zM4q?=
 =?us-ascii?Q?RDr6bcnpAriqRFZzdRdynStNZl5kY91+1ieDjFJHRjAEpMij1hKkMychw1SL?=
 =?us-ascii?Q?IM0c4R08N+ZAmlGTj3jJxyLY1Z+SyOk0bj1nb0NdYyDUGaCQNbRLa5qTPLc2?=
 =?us-ascii?Q?94xGRWZxqyTs5lO9HJamdzO7e6Yy1X5IrHkKdeKRnTdQShprbA5P7mG5/qO+?=
 =?us-ascii?Q?hZAPupEGhrw6YkccudZp8TvpPFUhzEQWsdJt0ob4N6BnNfB0HHsThohfQdti?=
 =?us-ascii?Q?ItiOjHvSJ7/yT23qVCio7JzhICzxmGDA1xxiuMRh/tctVPAaqGh3lxqvtP/X?=
 =?us-ascii?Q?k9D+MqT0lOzuopCYAPzUQhlOAAfCSWXJyROtvHMwHnwkBajQFA9fuX15xHhT?=
 =?us-ascii?Q?X8i7D8Wtk6gN8M+qbrZ1ROJqn9n7IPG5Spix7BsYusKY7SuXYp/QHGu7dfvg?=
 =?us-ascii?Q?oZeF/fxkgCQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AkgH9DZWlAzanThJSx4vcc71snXokESEX4SY2TdRGwCcZiFuZEXEmKqPiGTY?=
 =?us-ascii?Q?pbrl6qJO8K5RRPEMUG5RczK4ORAvI05XiSW51iZ8TAvgcW4FkX6LMictkoMI?=
 =?us-ascii?Q?cwhev9HY3BjJSJZXYPuC4F6a0SC4+6D6CABOFj7/muSY8JTJXdgzhM2HQUN2?=
 =?us-ascii?Q?9VzeXv+FKzbjr6LAieflHpFjMv268TyPOISKuGJ2zxyT5OBKXCkSJ1GLMLja?=
 =?us-ascii?Q?0PnpvnNMeXFoHTHs5WK28FR1OvfQ3DDz1pvBUVY+am4cJp431Q6Ju8nd0cVe?=
 =?us-ascii?Q?t2SMX7urEl86M6IHvCI1JFT74sT+lFtG0mJ15E/BdNmKLmAynZncCS4q1kah?=
 =?us-ascii?Q?F/yNZUZhwVYBA3zWKxxpBSBE1hv7eatDeNiVn52sjH5163A2fWpVPQs0Fik8?=
 =?us-ascii?Q?RQ+a6Ri4GzOCHjIi2k+BvdIlb0tOZjzdDvumaIov17CbkvDS11iuq9JmIJeB?=
 =?us-ascii?Q?vIOjScva+AtFMZIKw3pAeQ70b5+Fj35fOIUV93tWTmZzW6rp0QXsAJ33CYY1?=
 =?us-ascii?Q?Q5I1pm6yFJFcVUSboCixFbbC4pVdr/0tNi19Q5Wlk7E1t1kDijhAlHDQLHiE?=
 =?us-ascii?Q?DYFg8LuXbsZrV5doj0VWMmNkvBo3KAdmPArOnNtStF19+Gb4mVCQ+hSoO+Av?=
 =?us-ascii?Q?KqXFQWGxZml2cCWfYfPJQ1Z2jO6tFeVYg9Dr7D2C1sNd31ZkDIuNvB0eTzjQ?=
 =?us-ascii?Q?YtjaSu+NtOHHGx5aob5DI6enKqCS+okiT0TDX9hf5x5YG+mtBKqb7Qioql0t?=
 =?us-ascii?Q?WeEoW5OqjrK1DJNEd5ITMjL9HfKJQ2EKJhJrGGEADZFy1ZsoO4wwFvTSWd+m?=
 =?us-ascii?Q?l/QHFSvaaIjmNJjBN7JK4LbknukYjYP2sFPr0p6E6vpuHSOlr5Xc7zsr6U8k?=
 =?us-ascii?Q?jXu3h5r9AR1LtP0w5zY4zgAcBNUSVmutaJIlqyfzZHXawFya4ZqWqpfH1lye?=
 =?us-ascii?Q?HHt60PpkrZG9+yjpSbLD/75JoKlyOpGbHdQ8C6M9IIfKBis2GG3PfE9vPd/f?=
 =?us-ascii?Q?xsZvAAR97cELFtKbQL41o9mEg2m56HpUMd6yroRU0nvm4/wSst8gQshHCH4s?=
 =?us-ascii?Q?u1bn57YK2G+hhMpZpbMMzO3IEUkHtrGhgEHierkjsrw1dwJ3srYMkSAfBkoA?=
 =?us-ascii?Q?fbpI2cThxdtqa1SAYo0eDOh6tZ5Fp0edN7xDmGCa9LMGWRUwsJm+xNg83Bl9?=
 =?us-ascii?Q?3zLqtiDQ+/nOqWioIKvkYGmlYi1fwPIZZhw4j7NeGbZ7fotzDmn7X9FOcox8?=
 =?us-ascii?Q?+rkRQl5ScTpcTBJOTk8e1gnN56vQUzQoYJK2BOPaSEL7F8jUad1m035zbwBx?=
 =?us-ascii?Q?Li4NJUH6GT1+y1/Mz7MWaSgXvT5oXsHBLsFdAdbUYY5sdslQH/l3Ud2VyFJL?=
 =?us-ascii?Q?Uo5fD19zKTv6AimQnPhgkdIzj2rBPhEeI4P2z95AYHTIFs3rZ9cRYbbbCM8j?=
 =?us-ascii?Q?gk2l8phHVpy+WahGo/vX46GtsKorEWgvsHQ+9CZtSAgur7P9rR8QqsXsD1N0?=
 =?us-ascii?Q?PttkH1ZPDx7KCtsyuVraqdAJQwy3Kw77LEU5rjA28wZXj1hk/QpF4pHT4w8E?=
 =?us-ascii?Q?dq1e8NZu/3IMKNlNMpYODx6wcejeZ9DJ93Z/3aYp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf38a7e-965f-403f-e217-08dde6d171fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 07:55:39.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7Sq7BtFMMceOhsG+k4MbeSxPbT3NWqRzVvQb7QdJi1XtIewGj/3aC+0Q+PPDfVg8HGntWVyZ2v7xlZfq9dpvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 07:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222602

Hi All,
=20
QA for yocto-5.2.3.rc2 is completed. This is the full report for this relea=
se: =20
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
> Sent: Saturday, August 16, 2025 9:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-5.2.3.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.2.3.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.3.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2213
>=20
>     Build hash information:
>=20
>     bitbake: 710f98844ae30416bdf6a01b655df398b49574ec
> meta-agl: 435a9b13b8486cf7d51a86cebaa72ee382202a50
> meta-arm: 2de04c3d31e119d4bedbea24b9c63a8c113a1ce3
> meta-aws: 3cd3b809390120059d89cde45b21615bb8948be2
> meta-clang: 003cba92e982bdd565a6889f28799f8bba14957e
> meta-intel: 5640f6592c984f4832ff5f2ed1a35a607e5d21c5
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: dca497d728792e3cb655c78455c2d649af312ce8
> meta-virtualization: 898239e810acbb7db93299f20deec8afe434f11b
> oecore: 347cb0861dde58613541ce692778f907943a60ea
> poky: db04028d9070f05c3b5dee728473fb234bd24f05
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
> View/Reply Online (#586): https://lists.yoctoproject.org/g/qa-build-
> notification/message/586
> Mute This Topic: https://lists.yoctoproject.org/mt/114728690/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


