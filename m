Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F6FCEBF6D
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 02:27:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web11.60620.1727404050932650269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 19:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=B1nKifcn;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727404052; x=1758940052;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=bfMlKUCqcnbVKjntAgQ44SM8c0/7PD1X/ZHoUebPNI8=;
  b=B1nKifcnZeVQfmx6eM5LgKTVn2YbmNx/f8jes0YGIIR76ce0Jvv0wGtO
   nWnagEUz+XKIOSzMq5oANOM2j9o3bU+bIHgrdf0+vSqRNiZUfyeQpSa7B
   tGln4SlbHqFKft/rRk+/dUXn/t3YEGimK8hrFEuGG/aNFVByx7FsH5c+j
   QbAIblSTU4WC6zXdygozViczYTZdISK6mmFc063L9VwGWowEI0h6gUwTt
   fTOEsOLJpWHk7QQ38jJJtL6VfrB82V05/jdlYtVHWXpg8qTJoTzo4tsT3
   dPhcL3X9TExmvHDoUu4PovePAFWXMVO0l/963mKueH3lfy7gJ3q8OdqPE
   A==;
X-CSE-ConnectionGUID: sQijewaVQWKynVSLlE1uRA==
X-CSE-MsgGUID: CuK3vhCaTFiGuNxJD9EGOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44008016"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="44008016"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:27:29 -0700
X-CSE-ConnectionGUID: Zlq5iEpFS/SywiLyuMDscA==
X-CSE-MsgGUID: brIa26nQRU2nS1zjoDrK7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="77322902"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Sep 2024 19:27:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 19:27:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 19:27:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 19:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eybb4o+rY7sXBNHrtNUD6MKixg25ZOHuYrWLmjwNMiHQvVDdGwu5ZuWW+vFfCo6/wB2pN/N5puC4iasEj2MLzZXytVT6NyDeJV/OyD6XVM/2LxNSrKGzi/0JAWxEM58Zg1Wc7DC5lyEw6n93Y4zH+VlpdS6fj3wZ517VvjLLdWvoVOKjySfoTD4vQTlTvY80/uYgYDtVSk+i5cb5hMhoBBEjRalvMVaJ+1X64Yjs2lY4K5MwQtzwzl+Re41lZZWVPeC7cLtw5SLqtzOEqcc76CiG4wjaoS91nrq9k6dZ6UOMgl485NfkyEiiwr6VcLQiJH5k5+dpVJ4tvhiolNdWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTrLAHrNNzTTMcU8/JWxcNTpB/BKamM1dNnYbJodkeQ=;
 b=E2WTSlRloJf4tOSPfQD35SFhaTtzZhA0ZLovCX2RQxt7Pa3QbXGzI0qKjiUkESJidHRy+bRArIeCSxVk7bKjTwuRCyv/HjJrFwuOuGbt7dVpoptaCuGeFnmAbDtuNcEQBkhrXR9gMVfsQqgr0dbFnjgSj4iPi2FDXSDTtRkO/mUKRBfsLwyLjCy5gbQFdzocHYT6HL4y04Ji6zLpnAvVWVEBc6KPZL6gIot4zTtBJ3g4MWyKuVP2kCAC/UZlo/Tt32U55/G7euOlGuAe7ItRQ8LGCiEpH2RN/b9L7vLn/HlzuMkZ/4QeL97RZVgwMn52B9up7Tsf+IyUsauhRdUGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by CH0PR11MB8144.namprd11.prod.outlook.com (2603:10b6:610:18d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 02:27:25 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%6]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 02:27:25 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.4.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.4.rc3)
Thread-Index: AQHbEGPIxLAcA7K9r06kbfAQ8OfHz7Jq5Iwg
Date: Fri, 27 Sep 2024 02:27:25 +0000
Message-ID: <IA1PR11MB7753429F7EFF7F802E2193EDA16B2@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <0101019230758073-d0f599c5-884b-48cd-bed3-7ed67d2ec5b0-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019230758073-d0f599c5-884b-48cd-bed3-7ed67d2ec5b0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|CH0PR11MB8144:EE_
x-ms-office365-filtering-correlation-id: 9a919cd0-2a23-4c3a-7cae-08dcde9becd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UZtHMUWn9aYPMUv3DeNLqhwEc0fY/H/xzI/B6KyiTfhnVVQyyqQ2xwbQEv5B?=
 =?us-ascii?Q?ZC7RDwn7xGeP+iG43mgwkq1ADZE9W6elYRC1BziFiZ4SGcCUFhq6WksFp3SQ?=
 =?us-ascii?Q?orR9s+lGmqluLHnJc+/770hr0x/TNpR9S/nkuHLHF4HXv2bb2N6ChU7LdJP7?=
 =?us-ascii?Q?W6veOFdHTJ8B/oezoAV1K7qbLfuFw28Ox8shQ1CG3FMQ36RjgkuVBQJQATH/?=
 =?us-ascii?Q?uulu+z38S+cEYp8RpqaY6Z4NhBtDiNWpgC6BGkJGaLYc5LTDfEDttZYy1DxO?=
 =?us-ascii?Q?zulV/kZJigvKtgwDW/SwqxzklQWyuil0zqVL7nzA1i8tlawPvz13/nfa0oRd?=
 =?us-ascii?Q?z9LTy+EJ0yH+NtewlDTTynQ9FkEM+YqJ5gIotMd8qhGPUnZRDt34X2b5J0Sq?=
 =?us-ascii?Q?5X6KSPNpScUUDwMUrUG7tchaykpJQvfePbQbOBosVz6aLwuLjK7nAjQA1nfP?=
 =?us-ascii?Q?wab4hmpAj+D4lh50SeJGlOgWXaw5Sl5N9W+c9coqbZ8E0XgJ7uSTTiRRdfC/?=
 =?us-ascii?Q?lP9/i90J/7rEAG+5RtaeRxSoIznT0Z44hAB4sdNcfAoyjDQEKwQ0axOud3Tm?=
 =?us-ascii?Q?YFELdC0fSOljxB95cYKsEIBmA4t63UwEypSet+XvN+vCNEPJE4gMxOpCAi40?=
 =?us-ascii?Q?FE09ecFWPUl7HLTzlRONwU4ffxz5pgDH1xy6lpgh4fzLKyUYeTcb4lG8TGAR?=
 =?us-ascii?Q?DyqOgkGQ0kr2rnJzfx5VqciYPUfDyHKsZwkukyXeDsxeFgJ3JrNMDQHEnBuy?=
 =?us-ascii?Q?ja8966sHh+f5DJretjK1HHK+ck1cmv/fBI+Ng8fuwuw7ufGg5x0n7WgZzzUu?=
 =?us-ascii?Q?goiOuAnhtKRkQoL5usWM6JtclfMMFnQPewmqdZYRsSu4OdbU5R3ycxOwpZyN?=
 =?us-ascii?Q?9JasW3n0y7ZZefGeQFRYt2n7SQnGp70cfl6+qBNXzdMoDdY84exmKzOOTEPf?=
 =?us-ascii?Q?HnMFBiO1+r2HIwlShVmnAK0+CZj1pQRoyUVYovs0gekEY4TlfNbuR7y75Ola?=
 =?us-ascii?Q?f49gbo7LyttlQIPJW8+VbEIvnknxUTO7Qpyf5HnaBNVlL07W0treLZE3IEue?=
 =?us-ascii?Q?OXlSf+LjzCh2LS15Rr4muQEpolGpD0o/eYn/lZIJ/21gW0ty+u0E6gc9xPzi?=
 =?us-ascii?Q?g/B6B6TMUZAvRqR7CU6M9ATgZ+d2Ukduq9o3c+hh/STdWzajnDufTlR2jKz4?=
 =?us-ascii?Q?vSSbWLdkJJ2FmfL3dJLDsF6BUyA+64zsBkoV/DCTg4htG/QbTkKDW08Zk8on?=
 =?us-ascii?Q?lBAdCz3qiJj+coULdfV4DmCwOUBKwhQe/21tFezl25jdR4PIA1mQDgqnfREw?=
 =?us-ascii?Q?9Nc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bLNetSKc1ykWwAijQQJYZszb+uJ7CbLeTi7rdohRjJ2O/KjY2b7apVeUM3yV?=
 =?us-ascii?Q?yhjGIzcrw5/5SvzZdngOHEH0kYg+m5/ih4vzjUqqBSAHVe6pBHvGpYbJLGjr?=
 =?us-ascii?Q?sFgl8f7D/chz9aCXS9lZEqzpIdwUkLN71oEymcl1h0Km3ZxPtFyD8quQJhYk?=
 =?us-ascii?Q?OYpXrtSBjm8CSyOQGRuUChHoFbkL765D+ZB+q4EdpPEyg6F2FaGwSgOk5F5q?=
 =?us-ascii?Q?/ZuVFOznXgVg32Zy7vUFMEWT8pufEE0yEjxocpzgXKz3Nc4C2ZHaOSgSYXH/?=
 =?us-ascii?Q?8GMO7/rws9+42EGmAM4+jUbZxv3GbdInxoG5UfYNDC3o0Ku6HA+Utcle4Jjj?=
 =?us-ascii?Q?LcZ2FjAY65Ht8+hsNPfmxUVhHBwd+cIZzXP5bGv0iRpMqWzogkDFtT55cquR?=
 =?us-ascii?Q?lu4TLQu5QxefNWagGHcTnsy48OXXpkE5MMm7NaaWvkPyEkoqPj7tNg30yeNR?=
 =?us-ascii?Q?jngoEdYroENTD7DeqP+MDq1zZFyiGV3DqQibmC8SQ5J6h4c2uzmbD6nrDOIx?=
 =?us-ascii?Q?zws/SpDB6u+olZVrS/c0azaW3qV/RteEpCUvcAIJ3CYxDlYzVogRpvVcjX46?=
 =?us-ascii?Q?0twUT5WvOuvM7it+KPz+kjNrUmHYvj06CJ52J6L0b6RthO+uAQTKFMkGqCdy?=
 =?us-ascii?Q?IaOumlpe9ayqco8DoMSEMJ2i9K3kn/KRMaXzaeYcjovzGnYamrwqazuMg9v0?=
 =?us-ascii?Q?QvmWoORw6/GpEH8ccFCq9dxXz1i248s9zluKo36B34TMoGTd57pv6VBaUoNY?=
 =?us-ascii?Q?TZ2WdjlTpK0kk1FWrFZyT8dWQHfJFCBGcoKKRe/013y5zTRDgaW+IaqeSs7C?=
 =?us-ascii?Q?QGu4AXJwKVmF5j06Xyi1Ik2o1meAdLwYUALS2d02kyn2TySZitUMo3P3lPWn?=
 =?us-ascii?Q?TqFqSwV+KO9Y+TAZG/io1i/4eR9T8GsevpNquc87VSLyg5/IEYRvAcJraxZb?=
 =?us-ascii?Q?DPQ1dR+rVas3SON/LID3QZV6DMbL5CrRT7NiNszetUgCDUGSxwFVauRU0Wam?=
 =?us-ascii?Q?gBmls765RFW/hySRslVKlVlpqVFmrgA0CIXNqedq3EvLtWM5fb3QWO9O5A5w?=
 =?us-ascii?Q?xyzNDn9c0rzqeJeHoRvXPg7lWuM0HrZOZ9BAlojtkavGv1LAYo+FHlIgzvwy?=
 =?us-ascii?Q?pvAG+RuWOoOTqH2n1jzyyG4wzDKYbFEysWSTHf3Pdzf/rZIjfBmohqcJtamT?=
 =?us-ascii?Q?GxJkCEFWLGLJgEJ8HfurpFPfIpmXVraIpAUmTPSfOGRSRA2dVFvzJTeRCipx?=
 =?us-ascii?Q?kkzZ5T1gLC2YansRCRjODzpD8D0lVebOXcoza2RAIMXSZDIN3SJCkQ95NT8w?=
 =?us-ascii?Q?gMlxGo0bcUUNFhd2z/Vl6ld5yXq1IqIvnLkpOqfF8YXM6HzLp0aQzJuvLSUi?=
 =?us-ascii?Q?KRSAEzKFcnOnzvEnINGE+9QxqItj57yBT6p5rJ+q7AFrkFwwWukO2xoCMTIb?=
 =?us-ascii?Q?GfdQS1A5SleeVIZi7IlZyMVY8tKUh74n0T36S0QcoSTgSL5LL8j3bOFJ3s5j?=
 =?us-ascii?Q?LScIB+yhSb4FL3LvgJMSrZ1LM84nNuco4uojHWe8lsv4EN6Kc4TxWNZzpMaU?=
 =?us-ascii?Q?GNWBRN3u+m4U1PjYbyQszYhClCVVQnLKKqlOk31d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a919cd0-2a23-4c3a-7cae-08dcde9becd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 02:27:25.4320
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dswjgXWI4iwOOv5sdKJMVy262KKf+fh319yBpKq6il7X/i5+pGLpI0DQfK4ziA4K42HEcQoqH+T32D5IWF5rpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8144
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 02:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205005

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.4.rc=
3. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion: Wednesday, 2nd October 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, September 27, 2024 6:31 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.4.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.0.4.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.4.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7360
>=20
>     Build hash information:
>=20
>     bitbake: d251668d9a7a8dd25bd8767efb30d6d9ff8b1ad3
> meta-agl: 6debcd5420b798dd8c0b3052620cc5d8f3bcbff7
> meta-arm: 1947c000299c0330e8a866996505221a14c0e1ea
> meta-aws: 1bc413ef26efe835d7c2f68859cc36ebd4233903
> meta-clang: 2b7433611d80f6d0ee1b04156fa91fc73d3c2665
> meta-intel: c2bc8e27e9cc83654a23e8d89525fd9b1e781eb6
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 735ae0310870ffce07ce0c55c4f87c20ac161ff9
> meta-virtualization: 66ee8d268db25a9f2848bda6858c284c745f549f
> oecore: f888dd911529a828820799a7a1b75dfd3a44847c
> poky: 2034fc38eb4e63984d9bd6b260aa1bf95ce562e4
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
> View/Reply Online (#468): https://lists.yoctoproject.org/g/qa-build-
> notification/message/468
> Mute This Topic: https://lists.yoctoproject.org/mt/108677431/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


