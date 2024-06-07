Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB76C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 09:59:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.38012.1717754377555416554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 02:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YLvdSTwG;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717754378; x=1749290378;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HmA+E+nKfMnnMspxi/hcge/aSRUawGXbh5vFQgyRAlw=;
  b=YLvdSTwGSkb6wyPsdiQGpr7bZ/9YP/+VdqguKlXZLo0/hwAioyynLL7r
   GQ7qqUNUgtI7BG2RIrPvpWiE+89Kvtkt5MFTZW8/vrpNmmzwCKSnsBCm2
   eq3nd5eVbjH46/GHPp2FTUJeTbYpu9c74esc06cAku4trXj47v2Rs6KBd
   daHAL2or1sylGvl8q3h6R+iHxCix4OrPxfszxjzSmuV85t+FvVij006Kj
   V/rh55ytUZk5tAV7rXFR4yhTMYHVH/ioElg2ft1JNzcELo7JOCJh9DDJL
   8kf4b5xaSOijZzwDjhyed6fxBjeoQqpCetEC8BZs6zkdIsw16NQsLofRz
   A==;
X-CSE-ConnectionGUID: pbTOctFmTiKNH3UVUQ5MnQ==
X-CSE-MsgGUID: Gnz/zw4pSESuAs37KkVWWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14349895"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14349895"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 02:59:37 -0700
X-CSE-ConnectionGUID: XqjV3W6CSra4/C1s1/5c7g==
X-CSE-MsgGUID: Bx5C9xzUSRapVzllec4G0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38400521"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 02:59:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 02:59:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 02:59:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 02:59:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 02:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dc+hMPGG9txXJBy/00hT/eDRLsCWeWfKbJbqmpMd9pKufjeElYkl2+btwJ6nn4VZTuYyijOtJneSG4UyPzXsHhd6gcC/S6qLN8KksDVK9EPR3dpbXztCxvlgpmBzL2HKSacYk3cotq8YOm2RaRKiXJn2SFhV5m2W479uoh8gyGYW34yEeIAQsBjwaJmalO0zjEUVVkqy3U0oa4oBkN1g/gcUJv8Yu1GWz9TEKrpKj+zLzPrBrSQEoTDiE4FS5NjNpPvfJOV9840BkvscLmRz+t2jlygB6H5TRdZHK/gvBi0Sq3Itfo1NSBRBSgJal5Ky4trEMblb+4hy0f1x/c8gcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EctaPnPye/xox0wpIrDnNmKoQcRNuj2mrXbHGZsolok=;
 b=oENIPgdZA/wawg5E+Bu9Q0+Dbk2akjXWsjjUqFczQsvl9/964bsFP4k8uCGcO1l1VnPPmdjgbw/TA+BvQCtAC9d+w8LOcjI2fGONxBB/yISzYl/wdPBTaJG+yfJBxbmDeCiSYNyyqXyShR6hNsKYRI/k7+xs5JaNArHxK+wgJu1e1iAmRdL8Uwe7auGfCPjKOwhuCtrikdcyVRK14sciINyn90rDeH0WTCmgz5UmW1Ut/DLrYqcmKJ3vuPlhcw/ZXLfKfTblOcyAG0VHedmkx9sEXC8RzYggLgcl98VU+pTeGsh4oQKo7mtoGIyeb36x/66uDoqPGtDqpLJI71h58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 09:59:29 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 09:59:28 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.19.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.19.rc1)
Thread-Index: AQHatUttcdI60NhUhUKC4S70AbiajrG8F6RQ
Date: Fri, 7 Jun 2024 09:59:28 +0000
Message-ID: <IA1PR11MB7753E7F005731BF460A62866A1FB2@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <0101018fdb752dcc-d3076ef9-329f-4d77-b545-d13c54e3282c-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fdb752dcc-d3076ef9-329f-4d77-b545-d13c54e3282c-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|IA0PR11MB7862:EE_
x-ms-office365-filtering-correlation-id: 385f49f4-eae2-475f-d59c-08dc86d88569
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?9p7DQf0BjbWVhXpgB22MQgFQJmZYbLVg9dqleDLa4yeW3sLj4wqFkgVHW0EB?=
 =?us-ascii?Q?dJEyZ0qMKkPtzqcvA9iPAAGU59/Ivl7pT4D7skjD07r+P198urmNFHBGDx2T?=
 =?us-ascii?Q?RvBlFhDYzaK8bifvsGCXJ2ArhK5PxJrqmkHohjlgYPipj7THufbFZMoly6Nx?=
 =?us-ascii?Q?P8PT8lbjxN/Yk1I0DvPnPjBmeCBus/sugftgfLww2s/ymZDkfxKNW0TQ0Uq7?=
 =?us-ascii?Q?ziZCl0XmCCnuglkpdWH5Qjhw2JRNudNeFiFf7LsHZW8LciC9uabd1n70tlXW?=
 =?us-ascii?Q?N/xujHRr8kEn0pgMA0vKt4FT9f6c7x/bdSlmkjuyEmQ0mqOUu7UEUf1gNQo3?=
 =?us-ascii?Q?ajCIDb/are16XEkp3ewVWo3F/KQyXW/LlIFbLFL0HuVC3OJrC1Yhd/Je+TG1?=
 =?us-ascii?Q?kfczgs1kHuy54gYhP3TJfSb3zjBpmc8ixWZ4a4RbY0wWI6AN/+E+RaGqGhaZ?=
 =?us-ascii?Q?Vh1Tb9Ek/ch+cYSkjOqepbQ/5WTykV9w+Yfj9eGZKW3zwg9OCOpWYDpNICBN?=
 =?us-ascii?Q?ZDeMlLBfsT+5gm/2MXcXVCCkPy6VhNQxW9r4PLoaRkhnrUIj6WHCdro9Eq3B?=
 =?us-ascii?Q?seKA3UZPWiBXXci3lzqzvEXIqeoSnDsBfqZQc6/fI9b8DhAyDXDqe8sbcYno?=
 =?us-ascii?Q?YB0fwKfsudJOvCFRoEOSfwcGsNxInxuYTbLug8QhLGrn5/YDco1PK9yPvgZI?=
 =?us-ascii?Q?BAzE8/YwwQP1VzliIiwckHP38KROjaUCHaobks0uj3XzEDcnoaKaij5IQYbJ?=
 =?us-ascii?Q?mCE2m2M32KmFqR6CAJOCiuoU7FFwTskFR415X8daUK/97qzPTxJybqHpLhMJ?=
 =?us-ascii?Q?eolaPUsZTMFvllq6IBn+jFh9HZbCG0J/fBX9cZUX0bmi69NHVNvytVbnCw6V?=
 =?us-ascii?Q?aKas5EqBj1H0gJN0TlHqmmvbNsfDHkNGTPTf0+QtiO57naExU5ggxOyuqYPH?=
 =?us-ascii?Q?PYVZWBllgewpmumtbDMsdz3QXx0BBD+4178mJv8abjuGVyD6wuorRarIsHVu?=
 =?us-ascii?Q?tXnPOdkXhiBjT0+9yFTUjtHlvJVtyn75l03JExwBqJCpyZmWJmSXpJuYEMS9?=
 =?us-ascii?Q?YlzMeLiwGL/JVQgGsAQST0W6WW+L2quP64Fv2cy+Ny46zt1DA07VxsRArOYC?=
 =?us-ascii?Q?G0RKSUwkvWPUHPmH0KMNc5fCsX/926cHKp6pKUbWHhWlBSEMBjQPr/7Uvhwz?=
 =?us-ascii?Q?lQdM7vcbBW8iaOFr9gm37rX+NbSmvnqJVf/I9jhEM100GSmnAGIcfGkJSoEW?=
 =?us-ascii?Q?li327zc77O1g7JCzBajbwDk1YvgIrJdyf6jp/apBECOckEFb21M9FQU080ME?=
 =?us-ascii?Q?g12QENkunlq3QHhBATF3hBxc?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oYUCAkvISvdTJHUh3IsXtF/M85XSchtthknjIm8y/NaeEpijqf5rI6AcsWbV?=
 =?us-ascii?Q?pcHQ2BWhQLHpvtZ3hfSWji9wspFdCLlfNu73gC0FNOrcda1Ri79Smon9mYD5?=
 =?us-ascii?Q?38+4EyU9YONXwo1Ukulkz0eKccPgSbcRa0Ss2zDOxwZ9yGcBiRgdOslCJ8qs?=
 =?us-ascii?Q?bjWLhuM0h8NG1YL/82bhlV1+IsXzLwrLaoYlrbN4GVF7j6n7sqBCATuzZC+G?=
 =?us-ascii?Q?aRrhqqnGheQsLvK5f1sXVd9XXCFdEbgT54ucEKuFEh5/Nns3YfdzKXHY5IQ3?=
 =?us-ascii?Q?L6rD/fKmNSlSgt0qIXN8KchLoMLs9BWckPXkFNkBk34AKBWjFef85HSxjHcM?=
 =?us-ascii?Q?sAxxn7KP+MOdz2TRZIm/inU844+52q56Pb2K8Ca8y5jtysFJ40tFERUzr/p9?=
 =?us-ascii?Q?N0BFXdVFmHJJBI5rKG0f0RH11tOA/1KqhScxfAVyRJeu7gWmLpTJQRk0trT0?=
 =?us-ascii?Q?Ax5cRxHj/SJBLaQ3a4KSjbuQn/CiFZYcQe6vanKDHD2mVCXMP6YlU15JbATh?=
 =?us-ascii?Q?MO7nbgUnbru55kBVs+99yO43bHXqFBEjfzvFm8/3L9o/FDYNvKJqI637i4L/?=
 =?us-ascii?Q?hulYpg3z2jvuQIpWwrdArYLCPDFXuyrjoc3PSE/8PrPlRbOAbmp9tU5NTluh?=
 =?us-ascii?Q?to6c6fhFP7VqErt6Rg+1hScCwnUuipxIStXQ0Zt8y9YQPsfqZqnsZ92/AMJt?=
 =?us-ascii?Q?U43Bv+IT1qlJAr6NPJ6jOvND8gzw2DDmBL1WWlsYqAjvYJmP6usziHj5ZO45?=
 =?us-ascii?Q?31S4l4MeHwHH/ZKk5QYEv+BJW0TNK0A36ennRPavExtaswAZT8FPVrJiRswl?=
 =?us-ascii?Q?vwngAe+e2qaAzGvFxwNWjwhbnzR75Id/KEgAKnK/ZSA4tqrythu3NIyYJGNd?=
 =?us-ascii?Q?nSZMzojIfmGvVh8s7Xoijg3VjuCKwQCMQ1/kqPN+ANdO3lJKPMiwfXiesz4Y?=
 =?us-ascii?Q?85IYxekaumoIyECdsSH0/lmjsq0RNlXgnfDkQRwVxJQnGCVc+9xXpy2nd/Ge?=
 =?us-ascii?Q?gUe2ixpEF5Ao1SXPNOF8yuUjJNbvu6U0rKS/tUb/icA4ljnaw9+1uLz4dyHA?=
 =?us-ascii?Q?f6GRSXfgkMCztUE+xYlEqZn8bNXHFobjVNJ20TjzNMgSVKZP4GQ/huA8x7tI?=
 =?us-ascii?Q?VHvp9pJc+p4K5wMsfJ8TJyHYLB79emc/704y/f2Z6hTou27qVVovRsF5bWyU?=
 =?us-ascii?Q?zYj/YG/lLVoT/gXlWO32D/p+NQjmkb1e7odIeNVs8oiEqqr35cekGjVAE77z?=
 =?us-ascii?Q?AihWYKjYe6UUEoKf5NNWalt7legqpoN8lR6LXp3FNpmJHcN7es+bufXvrgOl?=
 =?us-ascii?Q?ox+q+Fjs6iOLbSrLI6L7iGegde/trQKVGHfv6s0kum3tE0rbSWckT0bu/N5Z?=
 =?us-ascii?Q?6CdF1oLkH/D8vRLbWo3ZePmjEIRt27U4c1FZvQmB8ZQQ3StMdQOcilBzW/Ua?=
 =?us-ascii?Q?Znx3bIJHO7sYWpG1yDyV5XuetXiHkRsrx69VKQaDlRj3/hF9NDaFOi5pqR2i?=
 =?us-ascii?Q?EvAsEiWM3uO55SqCmbHNlFPhwHq+9HT5A70zlQfbWFcv3vUyx24eJvbMiMEa?=
 =?us-ascii?Q?8f5Q/JRk7Tg9eJk1rLO/e6XKuTUlxukFYW0ZzOXs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385f49f4-eae2-475f-d59c-08dc86d88569
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 09:59:28.8739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rueQEQHzieex7PYy42KO99SNNMwy6GIS9fOedV+GTAPUnJvAlclqy6Q5LLdSj5SsMfuzJ3fGTZEzyki5gneq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 09:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200426

Hi All,
=20
QA for yocto-4.0.19.rc1 is completed. This is the full report for this rele=
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
> Sent: Monday, June 3, 2024 8:17 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.19.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.19.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.19.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7000
>=20
> Build hash information:
>=20
> bitbake: 5a90927f31c4f9fccbe5d9d07d08e6e69485baa8
> meta-agl: cf2cc9392b12466fb3bd72eb9171577c4b2d24e3
> meta-arm: 260e3adc2bf322f52d81c0642c825088a88bb051
> meta-aws: edb80a35af5e68a5ed6db31a61d9ad7a2350c39b
> meta-clang: ce7d354da7a498f90ba260c006d29a4d23e3b4f7
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: bb7c7b0f448ab6541ab42a316dfeff1f7726252f
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 0560b848996a0feb410a8cd8ca07c60fe2f3b5bc
> meta-virtualization: 8b356b91ed0d4bcab72350a2ddcef880f4fa5c26
> oecore: ab2649ef6c83f0ae7cac554a72e6bea4dcda0e99
> poky: e139e9d0ce343ba77a09601a976c92acd562c9df
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
> View/Reply Online (#435): https://lists.yoctoproject.org/g/qa-build-
> notification/message/435
> Mute This Topic: https://lists.yoctoproject.org/mt/106453670/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


