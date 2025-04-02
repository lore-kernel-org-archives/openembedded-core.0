Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8178BC36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 02:20:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web11.4345.1743560401651514191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 19:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=m131R6nt;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743560402; x=1775096402;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GZaFZBgh3u4Z6sp33V/RL/e0zhwY5k8AqJq80yg3qA4=;
  b=m131R6ntGG1DPhrTVIQXUTjQMMqoZ2cW9o2L8Le5us8UlFLuVzZgk3H/
   CRqTVl1KWe82O4Nbg6MBnOK3EepBXVke4nLVWD3vLIiXCyl1PHMEewnHM
   3qD1Ws7OzzJf1gzIZyXoZya9Qu9ubBInaQryp3odhogZ+VX3+lpIhZeFo
   9A3OC400rsjV+cxcolh5crSnm0l9HKrmmMfEnOUzEYpmNJAM7o+4VkN9e
   +q2dBOnU9O0Wzzdig4hHqaEXM8/l3XBJpN+rx1hgg/uFsZd7svM9WNpwm
   RjB//hDqnXzB7EpaEoI5w8pzLXJhlShQJBoRgvnZYxUaSEad8ACopYdwz
   w==;
X-CSE-ConnectionGUID: MMY44sbBQJm82168HicJ+w==
X-CSE-MsgGUID: cJLsBKzaRAmm/8oNCk62gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56276036"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="56276036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 19:20:01 -0700
X-CSE-ConnectionGUID: U9fw+NzYSoSacWZO/DOofQ==
X-CSE-MsgGUID: Gmj4ZhEjT7umk2Y9oZD/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126447345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Apr 2025 19:20:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 19:20:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 1 Apr 2025 19:20:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 19:20:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuKbEV36R6+YF3Mubt/QlaXByMlYJ7dG7SfYHgj8/BjC4kqAc1Mc8/1TRmkR1myDMe46OZg0pM2I0eTy3/llK8u6/WEnbb1koBUYYQUtC/jafhZf4kVHz0anwSpejvsCgGtDbd4L/iFCCt59cIJFaJAjDlEF07BORXVKJEhvnWmHKzFmdHHvRnRBh1iES5OvzRpp8feqIqmcz2tpFQJZGJXzrWYancKz0oHkeVwQ8p15aDiLmw6563hPNvhcEaCygx7uKdQshv9pJMwM81r9+Ms1+fLbbZprDvik8bb0OEG7wbDOq7zY/Peny2K++gtNKxVYilVlQL7ru5lsv2VoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij1PeSgdl8yqZ/licRb7HZqiGV0UOdM8rvsEerkqjdE=;
 b=m0qP58PCDc9s+LO+TV0F/yNcFOg/lampLMRM26NDDBTl9wIEkpmX6rHuslgZZRBNYKWmyTq1w+fFWmawUEE16p17g0P3d3c22FoOlv+SLVOiW9kLfmmgwDgP1iOEs8g1eXRb3+flNMKCwLp8jGYn2ErwrdJ5a4MWtBz+hLAa8SF/Xdf+kN4VFVnWVQFLuACpkdSNhzMF6lc+ZLzXvNFpUyh5Seheas5PqdXJotGP+DmQ75onZ3I5J1fB0MbEV1mnx8bCD65cimzAG8HZODzzan0wNRhLXdDDg556RaKGMij8bN8uNnULmjBEzOo5IIQ13wTRwcgjkZ8gf1Ohq39/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 02:19:39 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8534.052; Wed, 2 Apr 2025
 02:19:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.rc1)
Thread-Index: AQHboOC4pOZ9ZIQmrEWBdKubkk1817OPqHVQ
Date: Wed, 2 Apr 2025 02:19:39 +0000
Message-ID: <DM4PR11MB7760C5283243BD13FC373AD2A1AF2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010195e3602375-1bca3d69-ade5-4ae3-aae9-8c6d381adffa-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195e3602375-1bca3d69-ade5-4ae3-aae9-8c6d381adffa-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ2PR11MB8470:EE_
x-ms-office365-filtering-correlation-id: 7df5d361-386b-4db0-fbb5-08dd718cd290
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?Euf73lHNQziT8wKJqsQiaI9RejFfMDJSMUVQzMLkubRrujqZZvofknMBAmD3?=
 =?us-ascii?Q?tqxhfnGySPCloXGKdUCeecB2bgvesupMnuPw6IV5SvJT7iwBpHnt9QoxRbdg?=
 =?us-ascii?Q?q8q+NB3zpqckEJxf2AHewHPNewkqjamU1fQiRf/M/QoYCfVNsMgGRcEbFDcg?=
 =?us-ascii?Q?jlynJI+Oe57vgG2kS5vqucoSRiMaBFKdTv83gZwmIyP3oGkvnyrSaBagz8j7?=
 =?us-ascii?Q?ReRAuprACI62YHY7YtjnX+qCtM1RO8TnnYSL9xtV1ZWUayWgb7fi6Y+uNPAJ?=
 =?us-ascii?Q?pnPCU/jIjhnMxRUNtrJuqDMyoZxDI5TkVt5hgopF5HwgViw3nxyj+fZV/Ysf?=
 =?us-ascii?Q?E7SkoyX8SJNJgLRDpL94bumpozxYOX5UW1CjVVPOhDWdDYVC0t7AN35LN3hJ?=
 =?us-ascii?Q?1UB0Nf1UXNb0iMKx/FMKx6VuH2NFDCLFDO8xw0Y7Xu2l9CS/X6RPMhfDlKYL?=
 =?us-ascii?Q?FokfhVofv1jc7Q19JAaZQnafMVg5ycpmT9HDOcKkd8+t2kJqrD3G3ambA4ze?=
 =?us-ascii?Q?EL6KAY4LyiF57TcgC8Z+V8AUN3VWdcZEHYBPLmkVO44SF4kJ+ENZ5VHyMrIT?=
 =?us-ascii?Q?x4naNIb6keln/50PZQ4jinQ9unO+XwactloVZt3qcR51MpIJjiQoxPedUmGh?=
 =?us-ascii?Q?UtBLtdNVZl+QKwZHRaa9R3MEYUo1j6j9C93GfMdCOS0iyfkDZTwghFdDuvKd?=
 =?us-ascii?Q?Cu+ld1piyY2foyO5NxDwjk15+hbNUqSRBYKZYqOxyntM5vQg1PGnrYF1Rsny?=
 =?us-ascii?Q?ye9n5uKV69klXXHX4WGOQF23utBdfmPhqY0J0N2uYLKBlBoGFAEZT5tqNdX5?=
 =?us-ascii?Q?t2fNUsW4h2giuFjGTvCD1MOvDzYN89uosrHpsnVE1aOHo+Le7c2QEdrqVNg4?=
 =?us-ascii?Q?pz9Xyobqvmpk3Cr5h1lZmRBB5/UD8isPUrP8Z9J0lEifS8IYYR7lFkxyhKG9?=
 =?us-ascii?Q?l2g8x11F4nHi6HI4n5TB8iSTSzQyqJipwcWBXCGmxxwb9L4FD+AmtkdM5dn3?=
 =?us-ascii?Q?jNagq93DyoN4hb38JO40lPnUISNfnHhbwmO8t7LPFL3tDDtbjbjPZybUXYfI?=
 =?us-ascii?Q?vdk57KKd1terGqBrbz99dFcjKoeZeqn7U9Ayld1+fYDJta7/wxTxMEWGMalN?=
 =?us-ascii?Q?zsHwRJLOgqKHVF/Bd9P7c6McY/0icFSLftzjSXDYbK/76IToEPXAVtCfbH/i?=
 =?us-ascii?Q?94boJWHR7vrUHbRLjlmziXmqBEPGIgsGDinOhq9gWrP8GKEQvoQ/t234oamG?=
 =?us-ascii?Q?otq37llmlL0gkhL+MtJm0oNNy1by4gyGFuz7xOsbaBBM5MdxglhQMEk78eQT?=
 =?us-ascii?Q?B4Q5Vq+t4dKK2w/qkK0gRWAuDwIN5ukrBA6HYcXmW2we6g3gz+gEgzdZbEj+?=
 =?us-ascii?Q?QiaEEfOxRovvdSbXZKNH8Q+GcZ0N?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MrEx7PV2QuK7PxVgnSzCpk5GjrDY4j1w4u+YbXWgHiowURofrBEhJLy86RYj?=
 =?us-ascii?Q?U3jSufIranDEvny+SQB97HKoamk4OgTIFH1+zgcKESIIoyPR2mB9J4JyGqiR?=
 =?us-ascii?Q?pGSfdiJhGHr+71pVFSIfO5LkTSAdqBse/J0xhfDFO/SZn+R8zeT3Kz4PWWcQ?=
 =?us-ascii?Q?S9TewpFAWZVe8ZEY6wBDd2EKQsVFS9+I91NsTyk6huQvno4V/DFGNNYwQmqN?=
 =?us-ascii?Q?9tu0b1xs4tO5TqhZVMU+2GmRd/Gb6v9mEjynBoLN5hTLnz85W3AIzWFaBxwo?=
 =?us-ascii?Q?3mmVk1E9Dc1mAFdD18X6PGx2v1jdCq4964yDo+nRp1iffbkIKefT8jvJLNMI?=
 =?us-ascii?Q?OxuOVIWoXImgrgeRmLrMwYaxx8uWXfUMgQTo3N3hgwKwcCAuGn+nuvX0UsKH?=
 =?us-ascii?Q?tXLNATFBDO22yJhC/92az3iSTQp9cE6xJDixKF2VhVS7Fl3AtLEFOUL2jwrI?=
 =?us-ascii?Q?CKhpbh8wxn82v8HFle9S/C8bEyIeb6nJlKmBYesGCWLATns5qTMLvql7q84n?=
 =?us-ascii?Q?Hfv8ycBI9evN2ANBcTp2VA0HQy+wTOavb8TPTCKQbo5knStSdzn2JIDX2wi3?=
 =?us-ascii?Q?puHmgtDnuwYZjjWG7yP/IFvuYbUf08qNbs7pFxnN8mYW9LFW7YT5twQyMhu0?=
 =?us-ascii?Q?sniCm08oHcmyqyQHWA0G30s6J+kc2vQ7JF1FaawweksO5xdVtXuwBsHClu8X?=
 =?us-ascii?Q?0WifyLNPgsTJp5o0UqKZwGCulc5ZcCPVq376ogc/L0i2HCbgnbpvrXi7FGQt?=
 =?us-ascii?Q?XrZnr+Q57FIHKVtEAnON7iUqN0vmwm2d+g3r096qo4lSnpfsomvhWR2/T5B7?=
 =?us-ascii?Q?/qSyNTllE1EynHX6BfbuuyvFgmWjSSa7dQE3y2OD0DfP+zbeilces8Xuo/dV?=
 =?us-ascii?Q?6BljzTCXr7InfuQftCRavpsPmhyjDGfaHrYUkKZW6dmTxWcwqCqtxEyagrHa?=
 =?us-ascii?Q?wTP8HwNmptPyM7+0AlRQ+yRR5uu/ajxvT7ddCjwcNp/GMewGBUsVIH8lhw13?=
 =?us-ascii?Q?hRvYKAmKE8lvTsIIpuNeFZmdZDVbZMTghk1VdgfmPGJwEu9wwCEXoZf5jorV?=
 =?us-ascii?Q?ay0j5eaD/RfjoVEMDXlLzSF0XJf6e5ofoB1mwosElff7lBxHGmm3a2Ji/vir?=
 =?us-ascii?Q?987rDYJM3Ty54GGGJ8wkJkgPfgOV6V85few3RdBbMCw38T209ERJvf/Dzi0v?=
 =?us-ascii?Q?bJglTDpdnPIJGXf3IvrrDE2fs3V0w4yrEtJvqrXgs77E+U5gCC+bw/oVWGvQ?=
 =?us-ascii?Q?Rr07Qpl4OPoIsG5BZP2Rp+dzTDKYz25trJH9Rt5Rc+AwqsaPqILpFx3HGOEG?=
 =?us-ascii?Q?dodGbWHJ9tOHaXRyZ3S3RZQ5rI7kNQB5gbj68BQwZR28vfhMgrKMsh5+HSf7?=
 =?us-ascii?Q?w4foQKjiu1128nx39ML8NZQGP5ggpkDUbnvhg+BJh6nApTydeR5jJM4roTGB?=
 =?us-ascii?Q?+hYMO0Dm0F3HaqKnOEg9iVGyaJ0DwqiDO40Rqw8aDTWywlvfQw3aer/ul7ld?=
 =?us-ascii?Q?Cp5y87WCppJ4v81OIV0bFzEjJXQQILBC7SBOJnVEve/2xgNGr65CWADe8vjz?=
 =?us-ascii?Q?y48lp3beWOjCEs5kIbn3ySiR+JwUN+o+2x2wMLH4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df5d361-386b-4db0-fbb5-08dd718cd290
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 02:19:39.8094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhXBj30Bl03/5JH6i+A8IG55Igybni7pJUYyEm1L0zTKvTemfFjNFI/OZxz47ap1rGTHfBkPumCZBmo7zoecew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 02:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214166

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.2.rc1.=
 We are planning to execute following tests for this cycle:
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
	7. Beaglebone
	8. BeaglePlay
=20
=20
ETA for completion: Monday, 7 April 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Sunday, March 30, 2025 3:28 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2.rc1) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1293
>=20
>     Build hash information:
>=20
>     bitbake: 5b4e20377eea8d428edf1aeb2187c18f82ca6757
> meta-agl: 17fd501fae2361588f2af72c229d56612cdca40f
> meta-arm: 49cad31d10e6a3d4539c171205254e1ced443e33
> meta-aws: 703760eff82035093ccb89b73ac9a6f272b3539a
> meta-clang: 892380133becb17d95ffae95de1df025c9d72088
> meta-intel: 79b1fd3430ece279f14903ebf5d34527fb80b027
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: a2a531a61b779fc666cb161be029b8ff801d2c97
> meta-virtualization: a309b738e73860781ee9099de5fc9df7ee22950c
> oecore: dc2ef2cc1183a14cd3a05d388a1d0485a1bc8d20
> poky: e894acce6ede8bedafc1859ea0345ee6d80e9c74
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
> View/Reply Online (#534): https://lists.yoctoproject.org/g/qa-build-
> notification/message/534
> Mute This Topic: https://lists.yoctoproject.org/mt/111976499/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


