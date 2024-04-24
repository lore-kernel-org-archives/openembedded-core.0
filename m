Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EFEC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 02:41:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.7756.1713926500291775852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 19:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=augzcjFf;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713926500; x=1745462500;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=s1EM/3BULZ9c/UKIZKcetXAJ13jcRmmbHlQYepjeAEk=;
  b=augzcjFfLGrOQKEiXY/zceWxd3Mxd54cOUBx+dug+8VnOR1BaROgVnNd
   rYi2o7Q261EUqzM18l8AQxigOhO5jg1A/Vu5hhU1oidjeYR9Ht6IrdPKQ
   wTUNFQs+C39r5v2mzULxlG6w5g1ZJ+7xbQEP6vShzTXtF2B8vUuOhblWC
   zbZBSkDziCA5s03Xweviawax7Ve++gEyC1MsBZL/mi8chsK8hP7YasMOg
   fV/HJaTdsLew6tKk4VhkxuDYGm06lORmEt7ctclVZJC9PdMT6ZbqB4CJk
   64aVPsWIbnDiSK7yD0m49aAzSATMVFo+slYtn5SjHnTVsmSBjI2zdNlVN
   g==;
X-CSE-ConnectionGUID: SLnWIid2TCqGbH74NCuP3w==
X-CSE-MsgGUID: kKGNsYCYQWqhuxm0oQlhzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9405144"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9405144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 19:41:40 -0700
X-CSE-ConnectionGUID: xc8MTboDSAm0qtwySkoaZQ==
X-CSE-MsgGUID: QGpNFu2MT0OamSMvAuL9OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="25001465"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Apr 2024 19:41:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:41:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:41:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 19:41:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 19:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2F3BHeOwSM5AkzcuRmKImYZL+eD8pAy7sxe9A2D8VACZIuSJx/EZszYYzemesoPFOMlttgYBs9AQF14vL6wqudh8hv6GHgzswu/FjgUJYlSpilcSCX+CKD1VnKzx/D7L7vCsVNJcXirfOkVE+CI2ffMGETrgB7kEcUTQkDLqZKLUPVV4oS8/002U+hBfgifpE3/jd3k0O4yy3n1II3zcF8E6MVWhznbtOJJA+X5Ec19z0O+ZNd7jWmxFsKcWDEjP1Av9uoBguhSOp6Kx+FZr4r3lZH8HgUYaona4dHZnD0XNBWNqzCEjXGhA7KXAN0MsidVrCTzdwt0I4kAjjDTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIPVp5DXoYLpTVTpRFtLYIiyDBLVYnc1WtSealLszzc=;
 b=EPLBPgB1c2gvOh3fXKpmtxthzs10rDDfWHgmVacYvyIjb76S4w5SPJEuWFsFsq/t4w8cTXj9rdSxJylKWT+Nmq8q6kr3zPaxQJETxi9AJx/2F48gfNpaASt0fcv+aMRyZ/ytoYA/Khwt1b4zYMQMDOFAHAnktbJOvC83k9SvOTrLvQGi3QEYilnBKA+D2MOzho4o6CqUVlc4igQeiuYf9Rg1qf1+gFX23oS++wOv7tW6+1gb3sKEiq9i6hZGk9PfOM1DlD2z9pg0pjOsyP5cDdBAW4DYuyKIKB2eIe9HZMQW6GgGVqHFqyGjQu8Uv76x/ViP+IKZVD/ywEm1quEdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA1PR11MB6444.namprd11.prod.outlook.com (2603:10b6:208:3a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 02:41:32 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 02:41:32 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.33.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.33.rc1)
Thread-Index: AQHakSKpYlQ713ghek2rGztplLux0rF2vyYg
Date: Wed, 24 Apr 2024 02:41:32 +0000
Message-ID: <DM4PR11MB7760F969A805CBA319ED9969A1102@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018eee7c0c50-f4c06ca0-8b15-4f96-a5da-269fbdf07dff-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018eee7c0c50-f4c06ca0-8b15-4f96-a5da-269fbdf07dff-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA1PR11MB6444:EE_
x-ms-office365-filtering-correlation-id: 1b65cc8e-c37b-4636-3bc1-08dc64080d02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?qLZJVyShGIGb/x3lWRVi82CcZe19Yy+4VoX4+It5O9WcMewn8XNMqMFqMLLW?=
 =?us-ascii?Q?8HsI5n2s6gAu75p1SAiz7XNe2N10ADRXQ7yUldg6V1HZmyTD6dbRiFxr4vAC?=
 =?us-ascii?Q?/D758qL0JrLsiX/HKMTnCQMYKjAfFpfQyDGhqWnsMudmEjWAYiFRifQyEcsV?=
 =?us-ascii?Q?05bboAlYLU20ri1R9jI8z+UqCERUw5hozth3EyIq2PYVyBi8Wq4xkieOQWL3?=
 =?us-ascii?Q?/PrZmqJmB1drTsPOGMSSr/1bAsuZjm20D2AM7JY7PjoV+DfeWCWeYaBsrdRD?=
 =?us-ascii?Q?v5qUSOGws92kyL9oDiNmlzxTvI7v7UukqDnLLZnLx6fY0SQxeHJDSljuUm3Q?=
 =?us-ascii?Q?3nn/WaYrVD7RrszLIIFTmrXE0i1LfDqA9ZKxbi+ko2fCZINNLAxtlTBRXp+E?=
 =?us-ascii?Q?6eX1kBVPQdy8DH+M30Q/GC+RPxacBSs8p/DQ9FwOi7t+bN2iOF0iwxMzeaV+?=
 =?us-ascii?Q?/j1JnpQ/AHu7bIL6rz4cGs/urq+i3ntjNY95iedMdFP3l7Ry8U7VQXThMG2N?=
 =?us-ascii?Q?ESMAdFdQNapY4Nvpp5t7iWRkRu/HBG6OVrD/U2w8zt7Y7EwaeaPtX/QFTrGj?=
 =?us-ascii?Q?TVUWdqA0pOLcUL5hUHmjGsKxWYmoNafOtfSDN0nCwvFnWhNRTfeKmPiYYIfI?=
 =?us-ascii?Q?GE7zmxv9BHJjsFmHUmyIu0RwwA2dPshKzT2ht3gViJjdiwEww2oOvPGMOk9E?=
 =?us-ascii?Q?spEzBaeDvnqbqcVLrRjHngyyKWiDf5036Wm8B6JINnPuxb/XKSt69q8uuqW4?=
 =?us-ascii?Q?VBZX8sjZdi2G44qx8/qj+j4mx2BKwp0/7zjmCBEmT9+6hOq6LS2j6Kax1/4i?=
 =?us-ascii?Q?j2c5MJ3vbfnM++E5HGHepL9+uc6AHjtY/2vmeX93AoQd+Zj+FJdF0YJf3lhx?=
 =?us-ascii?Q?LeQIXAnWk0L84kHKr8SkIuGRvo3U1/NItkSh6aQdRbeq/GaZmQk5VqZy0hq+?=
 =?us-ascii?Q?cxqdveDHo1bIq4wOTOA9vRnPdzT7xR0P+HCfInRZIBhLXj8piH6hKXHYaGXB?=
 =?us-ascii?Q?e8V7veK1XVnFaxgYok463e9cHlj6LXzdoDItNPoBIp1lgwcSQhrcDfzwpVJp?=
 =?us-ascii?Q?fI6z0vV4srOzy9RTJKSUgxVVge17DTg9wLnYLljs4DEEvJFCnd+f3KPfa8Jb?=
 =?us-ascii?Q?UXAAYTvLsNb/BmbE4befFzFl+jJTkZvqiaYBFem/ouwt9YQ7wCNa3uRTT5Oj?=
 =?us-ascii?Q?w7AIDRHSbpwgYETHpJtbRkCMvJEyqvvDo8szzNTn2b14HgJBAtoQGg4XFSC+?=
 =?us-ascii?Q?kxkXVq7VvBhYpUyxwPAanG6LGEa0yTwRNIYT/ZXO99VosmcjCtzAr1fm/kgh?=
 =?us-ascii?Q?TGQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gi9gIbEngp5QcviqRG1AIgUYFCon44X9E2TswoP8jFjc9uoukEKUSunc4HWV?=
 =?us-ascii?Q?I3ujS/8KwWs4SEPbhFPKeI3npNEZKVWBlDt6Advm4duh8So78gNY1wUNLA5M?=
 =?us-ascii?Q?Z4GM1rZClWEBwJm1Xt73HVub0vChltI3IsXHKoGntg+2FYDLQv6uVUAWbKC6?=
 =?us-ascii?Q?mmSdQ871hfLWzwyyCfRsH4J+nKrOflc7LtI/tlw+pTOWd8thlnCGiJuP029l?=
 =?us-ascii?Q?O/Kj0/xPxJuz4seMBrxv1fnmIRFODQd0omDqk0NMHxNQ+Lcj9TKqwA19anhA?=
 =?us-ascii?Q?LwuAJJ36FAJawo5DETBYHEwZ8C7oA1Sn8vUVIrN3G8/iIhCqfHedPHxzkEZO?=
 =?us-ascii?Q?AUPJa8efQ1TLZVFN4q8DVe2meGJneRKlnludwtbaucmsgF00+gJXT+XUgYLw?=
 =?us-ascii?Q?IJ5Zb9Lpgb0j5Q007c9dWAGG2nRZwcHSIU75CJ/GCI+hCZv7A9Etr8YhLFcI?=
 =?us-ascii?Q?BSKCQapL175W655Zc2mqLIVRL3zHnQg7McLYouVj4Ky52je56fRvUfiU/iaV?=
 =?us-ascii?Q?XeC2/j0B5N35y8BWjKWkOfwf0zHp6jfXYVKu0jj9Lx/fiU2WdJG8LWSP5hn+?=
 =?us-ascii?Q?XZeegJQCUlBgcx+Pnom0BwEH3SVzfyX+sKYZn2fC8OIcj4pseYTKx5msNPJ4?=
 =?us-ascii?Q?zFKJ3rOAeYbWw/y9AuOx5gEK7dH0pS5MPWoplPtKeyEIcGKgYyuqPE3knJaN?=
 =?us-ascii?Q?xVlVyfWjzoPyFzgRYdFP5I/u9jGHSZlrqbbQzff1Y5KD1ymIZl8vVOUc57rZ?=
 =?us-ascii?Q?pap96hTHLqB91L1gsWPlDbBQ3Uf9GK11je2uUPFYBnAEvYkpSfOc/bSONvx2?=
 =?us-ascii?Q?Tfj8jMYX1leeZNYNwQYep13JDYUxdBs8U6bP2fdgWaHCb1Cio9/MDwNcLhgd?=
 =?us-ascii?Q?sW3LdqI7MepVEczS38z9cvSBoyMXXb3JuikyEy53WSrtL7Vi24A4Fiw59o/8?=
 =?us-ascii?Q?zkK7hsfb3yhkIUBRDixi94EYOHwBp2DMsD1jU4fuYyZ7SCeArUNUCyBbaAH0?=
 =?us-ascii?Q?/bn0qPY3xMBJrIIK++iMNysS2ywM31WCF8AaPj71XlRkx+AKNYH8VOLDpJM6?=
 =?us-ascii?Q?jQFn8BRxSdoAYJ4VBWzJvKKPLeQAiPUSdxvGv/pqpusUe0PEz28/DDtFqyni?=
 =?us-ascii?Q?TsS3l6en828ikrJfxO1T8SkxOLqq8CMh5HVd0ZwxaMZRDzb6DAYxpqBL9yPN?=
 =?us-ascii?Q?rOhYIrfwDni+ZqZIBRahpPUUDhKHLp4gpWkFPjvElxMH1SpfWqJbFd+vmd/j?=
 =?us-ascii?Q?AA5NP1bcA75LCArMrUhhBMHcQ2VDCSYqAOGabFXwplItS+Qx0BmvMGEMK4al?=
 =?us-ascii?Q?ldD7WzAcYCS8ty8NPu1N0pk35ZsncW4OV3vvNIoKoYgXWTBuKjC2aq1b0ryt?=
 =?us-ascii?Q?QWh60Jcyks+pqLd3xR7RY214B6NCmOJoIy586QZz9xFZeoSaWLhqbh2BCyZ3?=
 =?us-ascii?Q?dC3kr+6dL9130gwvV/bi77MPVgiwDAbr4/ecHtedS2UVyJEvhx/oEZPsvva9?=
 =?us-ascii?Q?A71ezAvzoS2UAlYDuIHQh7AgvWYjRXPdvm3Jgjbi/ef8cc5IW46m9tfkN8VI?=
 =?us-ascii?Q?G4sDWlizmgBv8Z2ELf2DAHmORHqs7aij50OHfDj1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b65cc8e-c37b-4636-3bc1-08dc64080d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 02:41:32.0329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ebF8R8qF6wjGyaHIWpKmfcaaiB6na2s3OIFQZq6VMYhrVP3882B62OpMSNEkZ0qENwV5h0cLUKjCdTYz6cyq/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6444
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 02:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198639

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.33.r=
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
ETA for completion next Monday, April 29.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, April 18, 2024 7:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.33.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.33.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.33.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6816
>=20
> Build hash information:
>=20
> bitbake: 7ce4107bf824b3e115b40558336de25f99af31f8
> meta-agl: 6febe63dbdc2655efeac2596f7a2d9cdbaa5bc6f
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: a83f0fe4cf41261cfbd22ad5c34c36d7a5106903
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: bab936cb4ae5671ceaccf50305a6c0515e6f0222
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: c74ebbddfd9dbe02d3f7422016324451eb218e1e
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: c4fb7d1f0f157ffafd9f907f49ea74b93b2c1d40
> poky: 63d05fc061006bf1a88630d6d91cdc76ea33fbf2
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
> View/Reply Online (#412): https://lists.yoctoproject.org/g/qa-build-
> notification/message/412
> Mute This Topic: https://lists.yoctoproject.org/mt/105589020/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


