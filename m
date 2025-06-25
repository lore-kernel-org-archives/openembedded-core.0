Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C7EC77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 15:32:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.web10.18387.1750865526576759769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 08:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=h3z1SAo5;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750865527; x=1782401527;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Gv3Oj0onwsxqTeQ/xEQoO1gnxqbosFk/cKsm3A2ppys=;
  b=h3z1SAo5QeJzI7e/HgtbWYitmjx4lzpGAcnLPsoOgR68IOu0iKFkIdVa
   crdOs0Q0wD9ETJTOQINsj4ksi/Y1bnIVXu3vZLrtbfSyDTGupzGfqFMsm
   Wq/o51sN05hba0cO8NLeEbLMxiYTDQz/wmH28GWmHIibRBuXqvPyaIZtg
   lLru83eEEcpf7yrL7gPMufnpBu6F32MC04hBhiHVnVNswTzBbOPrRpYAC
   xyV0MiKa5SH24IdCc3pJ2ik/MUalUoCjr8Qecm7LbT5gVwTQhfT/HUpa+
   yEgwEwtGARV06vOWMK/wZN4UwwEKiSdOboPutUr66qFH2tSi5EtQ6axh5
   A==;
X-CSE-ConnectionGUID: vrq9zgL9TXOZ5wK1XsXrPA==
X-CSE-MsgGUID: kJB8YBUNQ/SamTgQuq8xIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53238842"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53238842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:32:07 -0700
X-CSE-ConnectionGUID: cuQb2MBERbGTJ+zpnxD7vw==
X-CSE-MsgGUID: VLoVURasRA+YKXlunvhpPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="157745461"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:32:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:32:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:32:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:32:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZv4fq59piZoqOmtzDTokJABboTxMOweN+QX8qkvZNz3SjCPNSc+YpOgI6FGnWLyjqYGngw2+nrFoidIwh+NvD+zUZ8BDx3HnYyumD0YWPkqPlZzk7nmTF20za+dWi2XthVVsFdFAvJbJxIs/AtT9VwXn/Twcxqw7VKms/4qnSVf1/XLEm7btHKIFgIiN2rwPjcL+7WwZif8M26omD4kpVEorpZkrKfJud38EmKhtH09ygG6CMo4E2P2eefLpXMF/pY2BHzX5v+xzaw1UwOVS3aRBvzO8zwdCzWSoW6p5rUWDKwrUJ8EVmarEEwHqpjW2gc8K6WpFpzG4tShGCod5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCUvJ/+2bju83h9KLiBGL5eXbfGvzTBkpfVhGrxOYls=;
 b=VS2EXi3CaVnWw+4S9k/gAUhWvEEOUg/Dcn0BTCVxn+3i0apG+e7Hk7/ySDwojUQQt+rCZgPUnd7wRoN4uxORDvhho6GMpxILMzJyEVxZ8Y1JzdeZRFwfji5OxxLQF6fW6uY8vSVG9ja41LIp+Ef64fpRTrCn5bo2aWjOAE/Tg0zMC2P0SMiBcnAl3GG8u54ly6uWTxRSQE4Zqe+/wiLYu0bv+Rl5KNEVlfkkc8x0/9zKhn0rOefSBy4yxP0VerQAusoELiZ0MXVMJ7AuGsb3sAy9aetKS0X9ul4eiY7xDg8B/fEeGYAHvwwIA3erfpj6FQ1xHt4WpEy4vA7ZHrAzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 15:32:02 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 15:32:02 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.3_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.3_M1.rc1)
Thread-Index: AQHb4HtMrhYMcDcpPUCAGP2a26Nw8bQUCxmA
Date: Wed, 25 Jun 2025 15:32:02 +0000
Message-ID: <DM4PR11MB7760B2078ABD89C7EED100F7A17BA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197843595d1-42660a2a-9d1c-4a84-a93a-9937b791152b-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197843595d1-42660a2a-9d1c-4a84-a93a-9937b791152b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY5PR11MB6235:EE_
x-ms-office365-filtering-correlation-id: 8b610345-6604-44be-9ef5-08ddb3fd6edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?67V0wYh5QScgWhHJLun6nn03RO0r/5RAZLAQ8O+SSPcB+kqwbFDEM5u8A3Sz?=
 =?us-ascii?Q?3GFGfmg1SA8RBXlIvkU0vuwuUd8+Og3vU+wX6TRLnvRkSUJTfr2zbFBZiT5F?=
 =?us-ascii?Q?Cg/0AvhNK12cGDBIKOiJVS+K1MN06X6GL/WJTihwO6xgAbb4JtV5ac8tLntW?=
 =?us-ascii?Q?spRZNNLwzq71vCmbCPOC1HaZhgTCNCniO8oCiyduLuXhaJxc6lj3hntBgl7o?=
 =?us-ascii?Q?Uo60oy0sGIDDpA4bnzp412RXArEB3IBf6OOc/STp5k65qCBGYxm5EhTFXuHy?=
 =?us-ascii?Q?/1YIHDwij56nu85EpUsGXoNKnWcQhPk1JZDfazO1UE8CbwKR3NoCU5P+Z6pA?=
 =?us-ascii?Q?9ZE/dMlBFukxDaTiy+TpZbFO+d7nXaWcHZuYh2sPB28cwgtjDj5Q9seJfcbK?=
 =?us-ascii?Q?/Cq2ZF3l8gKkwSTfVCfZG9GffFC9GNUUQrcCZ4FIbq9HE+UEI/FbVK1Ri2lH?=
 =?us-ascii?Q?BxuU+skKAkcvaLVoJo4sMl6Za4cm5wQFXYv3arJbn4sBBH8g10BFZxVLYZrK?=
 =?us-ascii?Q?PMsdKqd3yS1JQzFhKK7n3iyepkdmKR79QboZ7v5Wb80PboGt/0r9N5lGO3If?=
 =?us-ascii?Q?2pEmP95PMkRRkmec9iZzd4WX8e0NXxVFCxEG1bkFQehRpOdWZ48IB7zdhwLU?=
 =?us-ascii?Q?FhSaJfG34BU/S2BFoaRSp7ryx81Uh4qgJ9820ueRWBI/c0LlQTlUV1HG9ULd?=
 =?us-ascii?Q?SofWSyK0ANdlHDvKOBlyO/3tw9cziq3GNS+EYZWkrEn0HZuoe8SVtm534qCd?=
 =?us-ascii?Q?HT9nQfNaz8Uyi9gAc2/pFeMGCATQiiYN/dtCeXVdnzyG/ibGvWuJu4ZMbsSm?=
 =?us-ascii?Q?km/kqVZcu5DPs8ZBv2LB4F+Z5aSSXUdZ5H0MsMmc4wa8YE0de7Xg7NUjmtwS?=
 =?us-ascii?Q?/ANb84NNxrNMK3zxSK5nRF8GKcQSH5snDDbYb4/91yLY32XZM81q0r6Nv83R?=
 =?us-ascii?Q?Zy0Y3dKfovXOcLKWsu9MOUlgsGfBIuxOIEdipjofbMsMYoIv9x0T6k7EyOoD?=
 =?us-ascii?Q?f15RNWflxuUoW5xApbnUa1srnYfgu0dnY498qhxu44ivSgwEAuR0/rSeVB35?=
 =?us-ascii?Q?liY2jJ2NXe0xnyr4i6ZDJ8LRFcZxsbXewspe5oKfwhMkjIgd7SdV5ZBsm7qh?=
 =?us-ascii?Q?CI5AOHg933b6Liijnhrv6xZuMmG1P+Ee7S/6T38gPOpsln4QO1RJi8iUdNL3?=
 =?us-ascii?Q?mIn7RIXf2OfadZgf6WHtxzgXLeX2dV8rhZOC/Zy8ug7bnh7gkxr1kdlOF7u6?=
 =?us-ascii?Q?wAWxIV6nOsOxpFaDLcK+6guXifKfF/USjZO2BBvCIoc4imcw+m6xjy3Cb03D?=
 =?us-ascii?Q?R/9PiQwJXcTo93HA7Gu7s1nvvlcNFJsAd7DUDd6GIBjVdVHk48AdFjdMkX99?=
 =?us-ascii?Q?kodiBTMhS6I6dEt7WhnSlQqeGDAU7xyku63Wgbi34F1BOmMz+G5hdbC7V4Px?=
 =?us-ascii?Q?+ZCzUTB05Vw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mwuel88x5WaB3BTqIQwjpSV3RpDtdVrlpgMIDth218ZnVJ4WZzn/GAj8webf?=
 =?us-ascii?Q?Wd4uy5Lwi2W92hXrmPKiLoBqp+8fcPe2AdUldkUyaeWh9J6w/7NiXCs8DeeH?=
 =?us-ascii?Q?ZaJKFDev09Jyscg0HLhBQwFnA45KoMqj0DZ1Etlzqw+g0oCDl+oMK7rzAbsW?=
 =?us-ascii?Q?PM2gsczLjhVrF71WNacNJ32C4cmv3g7X3dlT0CcWolF6U0Uwwv6Esjl4Os+S?=
 =?us-ascii?Q?rZw7MWgUkJ0BpPTyh0/ojNFILGSPEcEVEzu5BcR0Zy6ITlFvvalcbqGwg0ke?=
 =?us-ascii?Q?bKIkx2v8JyD+G7Y44eCfcZ6cbz0WDWyEoow/N8iMEcf94z0ofLm2J62jXP+d?=
 =?us-ascii?Q?cq68QxJVTdHjHGB8MsC7XEXNPncYd9iMkAXJozrOBxafCcOYCa2s8Nl4s9Us?=
 =?us-ascii?Q?bNfHRaZyxvBTlqNR8hFHCez95Vcljqt+3ijXe6SSzws6y7kncbeEEcW7dRmn?=
 =?us-ascii?Q?rTW2c2enfqXRAfJeTZ7C4dRTwkLf3HvEXGq2VN6BUfTTzneOs8z5PbkckhBZ?=
 =?us-ascii?Q?2eiwkCtNaXQSKy7zaSHzq7M/McDb6n3xWgxpwlNoMcMUqBOCU9XAkEnK0I9Z?=
 =?us-ascii?Q?TRM0g7DipJ+JvILhzAiPVqIecpGSzVDnGfXLyD8UmxxNaHJXO64OHCgnhLfg?=
 =?us-ascii?Q?+SRqnokV+ZhxsADMziaK37mBfTPVxHIGYJ3GqV+NeJUcl5VAFbsUf0ynTb/b?=
 =?us-ascii?Q?cqgQQA8k4QH3sOAAP1n+YOgiuBrOAIt10/L6WvkWNAWGR4TDvWJwDPJEK76E?=
 =?us-ascii?Q?BEVunlogtpeGq5gJa+hFXfBoLdkHji51Gd/2XYA+hb3SzT8JzxfvaVGsrtOw?=
 =?us-ascii?Q?uNnPaIszLiKCshzV6H6YsLoSC3Tny5jq9KHnf4h3YKgyCf1nafVHhpiC2PIo?=
 =?us-ascii?Q?NhwXxLVeQyDfM9Krwue4qSdVxYROBjQcUdZQTD6g2Gc3CrG+moAdPTy0FxAS?=
 =?us-ascii?Q?vrpdvITRIc10tRLTQgCi4Dp1sS7y1Av6mXgIG16n/QRgpoWA9uNnRreae0Id?=
 =?us-ascii?Q?gQ1TnMjI6FZSwH8KS/p0lyUEycLVYKc2CrBKmyXYvUt0wCtTq22u5qumhUWT?=
 =?us-ascii?Q?C4ypSQtsMRb2nvdkPSY0sQiKBRxzz5u+UwHUU0qCgdJpBRmKvwdc+KHC8wpX?=
 =?us-ascii?Q?CGmB35Nl3p4gTIYamVsMY17+IKfp+pDNFS5d13W5GhlZuLo1HbUajrmq7rn6?=
 =?us-ascii?Q?e0yE+wHgLpsbwOjNu+RDaMdlJP/q61LD++7wjbANasmDnsSZFUvEobltWE2M?=
 =?us-ascii?Q?J2HzqbWrHcCBXjRLJdNKnVaRiWlkEgP3Yx07Va2kfSTaPmS6xl7Japy1W+fn?=
 =?us-ascii?Q?Gu2w6iyiJYfD4e+7q22UpJ4dp1pPtSVA4srr72W2lf2OBEBkg8EaDffSVy+b?=
 =?us-ascii?Q?JNE2tU7gVrBQ8+ovY2r1mqSAtZby8VPnDrcedTEbbQIwKP62e/x+SOGukMUS?=
 =?us-ascii?Q?ZtSgZFLmEp3t01XaERiD/o8pHVPbtQsID1P9thBP+gjdZczUvowsRyZMJYJD?=
 =?us-ascii?Q?kwlTxHEOX5YUHjjTAnD0w556mTGMYqNDRU0uo81XZfKDe4kFQOeBJsjRM4Kz?=
 =?us-ascii?Q?q2OOdKwUoAiYauiW5mSDwVsSBGuctqxeqQkOXNEJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b610345-6604-44be-9ef5-08ddb3fd6edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 15:32:02.4123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzSGSMhoeq7+CnXEdHK9MsGg/hEYmP+dQRV7UPGtGpWcF6balrV5OXej330beS75Ws5h5qvVfFmURmjko3zGaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 15:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219326

Hi All,
=20
QA for yocto-5.3_M1.rc1  is completed. This is the full report for this rel=
ease: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
A new bug was found:=20
bsps-hw.bsps-hw.media_player_-_stop/play_button_(ogv) manual test case fail=
ure
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15915=20


Thanks,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Thursday, June 19, 2025 2:03 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.3_M1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.3_M1.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.3_M1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1833
>=20
>     Build hash information:
>=20
>     bitbake: c2f29c9475c4b9cdd12af1f8610f2675f8fdd964
> meta-agl: 40f98a677f182e7e7779407fdd651ccaf416a65e
> meta-arm: f4438fdf7126b7e1045cb43ce541ffc7876b2c0a
> meta-aws: 3e91782318cfa7858639a577da2729432d586f5f
> meta-clang: 02e254ba1fb4937530d94a154b4c713c904c2d06
> meta-intel: 5640f6592c984f4832ff5f2ed1a35a607e5d21c5
> meta-mingw: 8ad732e5aa174e2b5e80f7f276104cc09bb7212f
> meta-openembedded: 3f77bb395c332b12135889bb6b57caee0801b43e
> meta-virtualization: 0115e61cdd5fe8c705bb0350a0d75ebebcf84c79
> oecore: 826ab8dde34882c3ef705f715d8808e46bbedcde
> poky: 7733ddf733b883d6fe75768d5f9b6d3519d47dc3
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
> View/Reply Online (#561): https://lists.yoctoproject.org/g/qa-build-
> notification/message/561
> Mute This Topic: https://lists.yoctoproject.org/mt/113712766/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


