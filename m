Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86FDC531DF
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:36:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.142419.1723790165477490316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kTQ3bika;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723790166; x=1755326166;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LGGi/OqGL8SQkqcUjFQOFweBvPtz034ONKM2ALs0Btk=;
  b=kTQ3bikad5uW7eMnjJjECV8Z6GggUuz+Vlnih46s+vAihoIZZOyoY4lt
   KDm8yqkXPOExr5SMd12n2QaZD3VZKGYflxJntApaehtbR+CVrKx8N+M6i
   QIz/qFf0ssgc91maFd/eCYbVnZoK4UJtIgpgJnu7bNRq7aOge2YYvpkP0
   UyO2gaHdObtTKMdbCgnNXAXpnn+JJy5EY/0NaiXD7bFLKB9Xwv7bbaise
   +eVGyCapQ1yG79XSJCsNP/3EfObJ1fqgyvHVdepUpwL2xQ4I4Qt95E7Nf
   2nU7xMV8PDL8CMwDIamRa364E3f+KkE1K7u3J/jNjsC5Ow2L+O6l8BvUr
   w==;
X-CSE-ConnectionGUID: zrpIW/2sR2SoU3E0Q1vjrw==
X-CSE-MsgGUID: HiLuzyFASFaoRtI8uXQwVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22046279"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="22046279"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 23:36:05 -0700
X-CSE-ConnectionGUID: Ru5pCjjDTzKB6hYvM2JbyQ==
X-CSE-MsgGUID: WixFpKvJREycKV8MpuZcjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59606190"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Aug 2024 23:36:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:36:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 23:36:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 23:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVitWn77sc9jPauaeRXA/5ujWMYFc9odn4hjyV1aRo/ANKMZeP18NQBrUITmXu+L0RnMPt1El3YmHJlXo0eE5wQZ8UvbtJn6K4zhF+v6OB/W2GzdTGR/2WGc8HK21Awlhd53vBtrdK4IsDTIGB8oRA1cjs4FfyBnpXQgrUoctpyaZcGRkli/z2jtM5MIivjAYnIbHUbjdRddK/x52W293XU0rkcMy8j8r3PvKIWHYEXMNz66TJu0BxMuGXxrJlb6BRQrhGAQfuxSs6m1UhsF5dzdvZ37cVDApZI6XGafLfH1iZRufrmB5w3QKNSjO0TCTNcAm/Zjff8R5cpwcDE64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daTKeUldblXmCcBEN90xQg3z5LfjRqNsQva5RGccI4A=;
 b=IW2RNG3xcpPLfayz5f3Ey9V1z0OfFgeP+qbRytbJdk/rJbJrsvkdWto2dW3hlIShpNdpUlZ/KIEZzX86KPH9iErRFZ6epy00VaHIvoOsVENW+EkGLMUwE0037geTyZjaX6IrAFt07Kza7otcisSERgM4BBegZwVkFmMlGx2cRG3fPkmbl9aWon5xC/kY8nMFZdE3j/0LwDt6iuiE/+tZIcs+3YITquiYp6mNeL8IbO/HZ7Ozi2NraK+8YmS/kfkQrD3l7FJ3XrK7/sYaDsEKoxqKqTH+JKDFYIuiNOauABAKcuuGwrh/rdz0TFf8LnmpzGoa2fIBBETgk7U2wZnAHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 06:36:01 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%4]) with mapi id 15.20.7828.023; Fri, 16 Aug 2024
 06:36:01 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.3.rc1)
Thread-Index: AQHa62M9WTkfVU5VZUuI09QzcRCJo7IpdXOw
Date: Fri, 16 Aug 2024 06:36:01 +0000
Message-ID: <IA1PR11MB7753604A7E19C32D0540D725A1812@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <010101913df63521-cd4206a2-d62e-4e3d-b569-433d8de9d111-000000@us-west-2.amazonses.com>
In-Reply-To: <010101913df63521-cd4206a2-d62e-4e3d-b569-433d8de9d111-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|SA1PR11MB6944:EE_
x-ms-office365-filtering-correlation-id: 6cbfaed1-082a-4cb5-c3e4-08dcbdbdb22b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?k+gufLLMBhpPQJtlSzcHYyoN+ktD0ktBbTMEqn5/GggigR8vJhIVJhd2Ctyu?=
 =?us-ascii?Q?NLQZ25REuAKIjXeCat6Z9Jw6vWhVg/R15BB6vU1MzIITpUicrN1odr3uMa03?=
 =?us-ascii?Q?k0EjgDPN4Gq6jZpRR7Rb4uwBGIgcALLvRnwq01W4Y0Z+6W9mW1cQtcvE13ne?=
 =?us-ascii?Q?Av8+KgA2PJLQ/9EPvM3OhJLw5Qpn4YuWo6hZZ+xu4H1X8mBjOG9MwIeVDp0n?=
 =?us-ascii?Q?K5M2HIKAtO/E0BQ5pHArlTWfELDOYV4L5wQmLqtwz7pQKrUOCk92+FP562Al?=
 =?us-ascii?Q?MvYWbl0sblg0ce00VUln9ZkeVo9bPa70JZxnygS46DDUGbprcbWJbV2pZqX5?=
 =?us-ascii?Q?7Hm5xCPHnmB2KPB4K0TEQz0rmreQ/Jy8Nk8FRZob7La0CUMKtJ1Ro9po9cSn?=
 =?us-ascii?Q?TratbEML3OP1yYfdlWfsQfMxItUmt7ytS0BEFHGFKwt03XlmTmQMNuyeAkfk?=
 =?us-ascii?Q?m9nJmgRJmi37fyWuFdNHa6czt7PI1SjTJv0KoRdBvL/EwuUsf6GtXJAF/eLA?=
 =?us-ascii?Q?jzq9fOYq4PFFQB186aJ00yF3DK1Om92tczttId/jXrYHXhzGl0lf+1wEa+LM?=
 =?us-ascii?Q?YmRsiR2cJpDemv0IRN8ug3UmrQJxABLhVBMULotHbZ+V4/67S3R9OEFONpAc?=
 =?us-ascii?Q?r+vNE9CDFCV+1AmFQ9UwKp5LRRFz03xmnlD8i3dyNKLGdNQ8DGqwcACtHsBS?=
 =?us-ascii?Q?/kI2bUZIfF3Sbzchx5WoRmCP1V9/WUh5Fl9CyXeVcD396WjUYiP3fjKvzRSt?=
 =?us-ascii?Q?ihmzAtZnVIM4cf3oITVjeGwbOlJcYW2lyZZ5hgHAYBKWnwOKCrTOr6M5hQbJ?=
 =?us-ascii?Q?8Klkpkjk2QAWpeJkrZFs/4sIguAPuJQ5NP4WJ2oRQPf5mjf4bkmvah58i8nH?=
 =?us-ascii?Q?b4Tit6rI/10WZeAIbTh4iipsLri5ItZbPYyySrvw0n1S2T7Mv9crYS7JU3H6?=
 =?us-ascii?Q?YMvHYipA0XwSjYeUp3Kz5dmwsA/vbAHZz2Vci7EB/kGWmaPLM6yVwStnnhhD?=
 =?us-ascii?Q?H13dbdCtkkabNu72tdmqJm4YPuJzMLgSn1+rA7jqRoGHvF3ST8vd6SiukRKX?=
 =?us-ascii?Q?0Ygkk3DzM3yQsHzwxLGB+j69f0drDl6zZ0yUSVdrQsnKJYjnXtxWxSLlFW3a?=
 =?us-ascii?Q?QkhinXFGHs2hcXO5lNHZudkl+0jeaCgdaYoV6gJNhmlc4U3Q9zXKyuefROxs?=
 =?us-ascii?Q?QCwf5IA6MgFWBw0GIJtslMmpAfuix8y06IwzKzc1g9k2WhBG3T7vRQoP4qb6?=
 =?us-ascii?Q?73BApAFZixpo4nAnaH8gTBspy8UqWqnkwrCvXdNSf301kER6G1vaagsv67N0?=
 =?us-ascii?Q?qx4WJoL9KZ2OZc/NpxOijwRBJbx3kaHi2VkmkSH3eKFLk/v/clFssHOoHOPX?=
 =?us-ascii?Q?GMLS2L0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/U7uXwvYD5g08Y1vgE6YHkXHsB9VSh4dOVGaY8Vk8rhnLCQHhSLgYXpttuGH?=
 =?us-ascii?Q?vbvJaQJQdaFDA6ttAl9So8ue8ZPBjy/M/3WSs42yPIBIrwQSBEyYQwt7eNb3?=
 =?us-ascii?Q?660+ZjZjgdqan9GB7RZGrcVYI2qAk8Cy6tGPqTVGa/MXFa5uzu9cq10p7b5p?=
 =?us-ascii?Q?g3e7q/tmDPEMMuCKChMnYYr8bN1gBeUggpbxXiEHePA1eYrmC1lF/BljF7nx?=
 =?us-ascii?Q?Bo+g/YMOChChByvzdpgVGjJv+wpeOnuY8EuRMhIGjPnF9ZS8cKYN8mPASwea?=
 =?us-ascii?Q?21i3WvdHw3Pw7zP4flknvaPH4jgJBEjzZ+XYYxn8s/mEcfAj4C//o4tcM4Q2?=
 =?us-ascii?Q?ZhE/i9EiK3H0PANtM1BFd7zu2RhzkrZ549SWOPE8FuWYoV1A17AbYqyAzCHN?=
 =?us-ascii?Q?ste4u1C0DUzwEB8T3pRNqPWYLElFUX8SVWR1Kj5ZwbuEaLPvnrOXg9tB90GR?=
 =?us-ascii?Q?300jeTfVHTeqxxk1gFt6K7kS2P70BAq2mUkYT9kmQyFhVeC7AQjATxdiWn9c?=
 =?us-ascii?Q?4RGrGg6O/X23pPgm+byqgtf5s3vL4C8IKC9HvU+MLdKBynrpA7RnTs2F2gVp?=
 =?us-ascii?Q?vsjVOPG5sbTEFmwG3bGS5Wpb84+4VyKUQ8ZzUPmr/hHMSz6jJjtxc5ghek9h?=
 =?us-ascii?Q?m5jf++ilE3wBmqL7Mgi9Yseh77/fI0FEsW6iBAAXxk9eLSdewb/Fc4nBdIaZ?=
 =?us-ascii?Q?3VaORlAqwnvIfUjKS6T/aSzdpkwYcz2oqS2QWghrzZIxFOP2lkrnwLbucimp?=
 =?us-ascii?Q?js0hDrSde6dgIIGJwMCxQzlfGbre6Got1MsdL0HxA7QqOlfJwfS7g2drcbmX?=
 =?us-ascii?Q?lCEK2DnS7TktWnacdp7qSmSyclg3/0SfGG4nqEjAyAg4fuXIQSZ2WqPOqS92?=
 =?us-ascii?Q?0t67qyHhTpZDcZcDKdXi5Z7YT5xj4HpWdrNg8QoAuwUt5DM/TKF9bI9SWtxW?=
 =?us-ascii?Q?zecEMdRdjZwZeSXAvi3I/rVMOO5l3Ss+dNcAFIXSL3qcu6EPvAKilszViHvD?=
 =?us-ascii?Q?OccwM/wySZHNCTXZ+VO7v9XZZXYpYVj9IgrMdtJjRGOeUAIPZgNxcTDZGwC5?=
 =?us-ascii?Q?LYFLMbe8ReixxDJTehhbqKPkWNcf50Tr43Y39QyjB0yg0zmpJc7V9ID1CB/y?=
 =?us-ascii?Q?GxfNKj2QAG5VukXEWpbbk2sqdIZZBkOnyrXdaQ39S+0I+8bBbFhtqujyHdaP?=
 =?us-ascii?Q?l6Fm1RR8TVmDwbNqRd9DHNxBrnEtqoaEChHgNlaO+dB8QbEtMev8q8Tha+kX?=
 =?us-ascii?Q?7zcDFPY8ncHApcSls6dz+FQf5+OlAAruMtV+Z4MS+rg429zmd+tIpvia7ma2?=
 =?us-ascii?Q?zJ/ei2Djwq/9llxrASTa0hp+ko3II2dRVe9d/OYbi1ZnmHzGP/IJJCinCSCQ?=
 =?us-ascii?Q?rXaY2np+DkhyINcbdA/nVNflwxWmZLwGRTdhT8TKrk+Qm4sWwHC6auFyS9TT?=
 =?us-ascii?Q?Iz/4OUgpH0iSM8gbl3T25zTqULkkzGs31HUK5drrOOyOuLbySEiAg60bcmyd?=
 =?us-ascii?Q?bC/r20OFiMKVM/u2Bgbn3ubvu7AtTmj7ek5pNcRoHBO/Puw67bcDHD8CEgvI?=
 =?us-ascii?Q?8QOY+fUldd8RfQI4tSL+L3CsvBZx6sZjyVOQY+p4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbfaed1-082a-4cb5-c3e4-08dcbdbdb22b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 06:36:01.5274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bOFlOkiOHaLPctsdbNPqt21rhrwzViRVTnq8xleIekfHovOxcM6Q1BZrQycqrLC+gYzr7jvHgby9NhQnmz0YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 06:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203457

Hi All,
=20
QA for yocto-5.0.3.rc1 is completed. This is the full report for this relea=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Sunday, August 11, 2024 4:24 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.3.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7230
>=20
>     Build hash information:
>=20
>     bitbake: 11d83170922a2c6b9db1f6e8c23e533526984b2c
> meta-agl: 2505bfc2876271663216a95e87cf01cab6585019
> meta-arm: 38bce82e42ea093333a53c4a10e51d1b26cbc989
> meta-aws: b5eedbddb3f75f04d49ca7851d9569f5147e5e3e
> meta-clang: fe561f41aef0cff9e6f96730ab59f28dca2eb682
> meta-intel: d172a00f487a8ea4391b96e0f6cef5279c5a07d7
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 2338409efc51cf2022ff5610a9fb689251706e2b
> meta-virtualization: 54b806b1985f3989722ee308e1073530fe3328c1
> oecore: 236ac1b43308df722a78d3aa20aef065dfae5b2b
> poky: 0b37512fb4b231cc106768e2a7328431009b3b70
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

