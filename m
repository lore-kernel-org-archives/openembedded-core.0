Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BCDC3DA59
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 05:00:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web10.11351.1721624448677035819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 22:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NCyn6Gaz;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721624449; x=1753160449;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3bDk9XhfM30mOmPdH2LjDy6TMT85JU44VsXE3LuWh4A=;
  b=NCyn6GazEUuQmddd7PHxRM/2A1jjYMh8Ogljt/MenmYLeICvUukJn8oM
   1tp+rfLIda2SZp5lAt5W0/+Wbv/g5Yo145ArHrl6tdZIEQuE0u05PXcVk
   AugqzJhegfZ8GyKV7Guc2oWlkGzh3tzuRl0g3LpmaPNlyuwd1meCrRRBN
   zwyQ9CORJcnsG+vZ6XXhbCr3BlC1gpxFfd7COrmmf76b/LlqdwJDpvYJU
   syrGAUo6KkFD18A7mxXSOvfHVYq3W5UX6k9DlCqxWZnQRMwSlifRvzawu
   gU6ioX7/UcXzAYIf97lHIFCRtFKFnw2EH2uXcCG3L2PNqJhIX/ndQo5gO
   w==;
X-CSE-ConnectionGUID: CK+TSYrwTo2wXREfSJrW5g==
X-CSE-MsgGUID: sQyi6J3aQuqL7wmr7HgCpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22981964"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="22981964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 22:00:49 -0700
X-CSE-ConnectionGUID: /hAW/vZ1QnSKLqeFJF0/EA==
X-CSE-MsgGUID: wLt6zmrfSPeFSGDsLu012w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="55924676"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jul 2024 22:00:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 22:00:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 22:00:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 21 Jul 2024 22:00:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 21 Jul 2024 22:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgGrOpRJ/FwyvR3qecNO94Mn49ZM0MqJJ78IH/XT3gFio281w+5uuslGS8FoZGhLAmCsNAc6b61HUc5dl58F4zzRfhUw5CQmRlFfvGy0FbXYUPmbtaR1unLBLvasJP/szIkSPgaA0BhA2lClupkVQDb9yj9QuPvH5oSanhYBpSUBZv2BSeXf6RICWqzY32m0JOWwZV3+/8IPN+RyNVmgRsVde778qUe5WmLORSTezKGol+Gl/ePj3x/Vh+H+gSLaDuTXJR8tfejd24CYvI9oYtOqpD6TJY2f+2Ct5z6r4/+bJvHx1O7u16ZogWkqDhtqlbPgfDQzRfzRZM0mPgvcVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abvVV4ZArAoDkoiC8XIkxlYdWJ8XErdZUdq19fEyIBs=;
 b=i1xSbJXLcGiLRGPjSiZoJbBy1INSQCi8OFB+sRfdaLa9LPqA0aPuAfVxh0bgoZanoaOqymSOF9fAWIQkwCk5kFqUDtVrRhQR0hvV/0VO7ZARLFWaveRt/EqGozj3c3VbOSiqUFJVqIRANGhj4j/jDJU19Hv0L2S7tq2Z2ep9LLMQ+hFGuTWj1j0p+a/iLr+3RwNTarHnmVTm1xX1bNxQWJqtK4Obu9BnLEnD1kQvVaYIid2a8DeBtVd8rxztMv2C4YVaPnQhAuy0ffJUoWBJY0mIz9u1HYVny7scrRJ1evRx50hHVjUzR+jT9K8C9wcCvV0N3Yb9L6sgiowxOGB/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CH3PR11MB7817.namprd11.prod.outlook.com (2603:10b6:610:123::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Mon, 22 Jul
 2024 05:00:44 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 05:00:44 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.20.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.20.rc1)
Thread-Index: AQHa1xtxui4DWEoCxke2onLaPQqJwLICObig
Date: Mon, 22 Jul 2024 05:00:44 +0000
Message-ID: <DM4PR11MB7760F891C4C240017A57AD8AA1A82@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010190b90d28c1-ff0955c5-d7b8-45e8-9c87-d5ecc57878fc-000000@us-west-2.amazonses.com>
In-Reply-To: <01010190b90d28c1-ff0955c5-d7b8-45e8-9c87-d5ecc57878fc-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CH3PR11MB7817:EE_
x-ms-office365-filtering-correlation-id: 84b553da-facc-4467-d553-08dcaa0b3dfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5c3FxV5j7Ba+0W+NkL6SbMXl/ucODmQ0TYE2a7m7915nGO8ugmKUuMI6fPph?=
 =?us-ascii?Q?qjPa1BbCxHSsLrCEkFqDRvxIE5q74rKb+zC87QHPm+hhUYNnlH9xW9KdMCve?=
 =?us-ascii?Q?2fNACj3h52By+ltXSn+Hg858yDwgui5FuOCXIAAvUSWyDNvGDRjlqpqkkY0W?=
 =?us-ascii?Q?9XHK6YPb587oKSBq7sKgHmw6kLhvejHkj05t+KrcrwmxusqiRO/nYGrfAYTU?=
 =?us-ascii?Q?btikIBhYSW2+ihXbb0rVZfDPLXBohlUe6Qv2rd1W3oOcu+/cps/y65yj18jX?=
 =?us-ascii?Q?ok8f8BB7vIQnbmndvhUlRmM5dYHhSWT3OpnCN/p3oUqi7M5IOTK3qtxQmj2Q?=
 =?us-ascii?Q?w9W2R1BxXz2l1QvBELoaoGTuc7WK84+NXJQYX5hD07c0uRdYkqqvedb8U4cu?=
 =?us-ascii?Q?t636mA+HMzjaAoe0h+kvI5J9emfnD7dqNVghgPFDBCqvN9fT+JNYGnE4lJ4B?=
 =?us-ascii?Q?JiV4xwo78pTa1zr5CzKzftz8dBT6iypVlXU7E5Gzynp3oV0G0jIecrE4S+FV?=
 =?us-ascii?Q?6VRaTEFOB9OwC6NYSb+8cdX2vr6LTL7RTjsMIJCLe8l1L839aF/dYq43mw4b?=
 =?us-ascii?Q?8fxiG+0JRvUmRLvqmC+ZCXhN5V14lBpqua2QlKJM7mC6yL7cHz7sx4zbxPlS?=
 =?us-ascii?Q?tEYOyIN41j0FIi2ykmuorXNQBz7UZbkyyhT1xEBAiVWf/BryPaFLz/qXWaSs?=
 =?us-ascii?Q?fvsZREFQqJwicC/eTdLdTr0D6Ypl9UnkoxQGTjowEQfT/GmIgDCodZvTFpjh?=
 =?us-ascii?Q?2sxiFSchLpTmIcjU6/MxTWgHcpoKLatHgePN2VhvmCfcjiFdcsXsf7VEU9Y2?=
 =?us-ascii?Q?dP8xqPlLXKonUQ1YvABMl1d90O2wlXly8eyamExlr9lLWGDGDWk3Fy+zTCqN?=
 =?us-ascii?Q?ZJQbW0D1s0DpXz3kkTTBs8/WHwcam1tNsPo5vK5pOVH1pbyMOBDyc/dLYaSm?=
 =?us-ascii?Q?fv3OOmd14lLcvkkdsgWR5R1U4G1V/qyyONicEHiOTe1NEvJ7HKmEMl4b1LbM?=
 =?us-ascii?Q?TtPr64nPOuSWAGuNf2fnSEwmCYMvgwyaxixVOxbhN0Aop5QC/SwHbBxdyxlu?=
 =?us-ascii?Q?kjOPHwx4wVpr+9tqitIdkI7JeuBW+r12HOazRzD8Pd1/sksBIK01KDR6cgPe?=
 =?us-ascii?Q?35l6Wmpvwoowt7Q0iO+9lIZIX586+kV8U9Q8BYnG6qY5kVCqsDRfLsrz9IGf?=
 =?us-ascii?Q?QP7aA2yIVGiFcET+xbOsD/LuN+B/aiVFnUVRF5WuBTeLZAhZKBfdiKIYiBmE?=
 =?us-ascii?Q?iF0/9F1W9CnpZPBlz+wDMpVB0eAD9unUrGgoIGcaMae8K+UO31wsrtM47YHo?=
 =?us-ascii?Q?/PSdxgjiJTEDEyKPxvoImC5vMvRoxncGc1XIHWd5Kgl2I2+ekDyjqQ8qYC63?=
 =?us-ascii?Q?wO+4ToY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KIACQBSQhRxMiNmlCZdm6sLghlQ6INicy23H35R4N+f5HPB91unAuB4ostYQ?=
 =?us-ascii?Q?Jlsvtmq4JGDva5sYDAU20A2jF7ltDlbeiCTQqCcP19RDELBhD5ZCDB/Wvi5m?=
 =?us-ascii?Q?9e4GcKPugqcVnryGy3Z6E89Wnd5CEeQ4Tai8Uf78SzREDx1cUEnid5uKkP+A?=
 =?us-ascii?Q?sHsfmfs5GvfLrAGzRVpBEO8RGpVOZeWyb8D9OMlUhBRmcm+0zYlWuMpFFVXq?=
 =?us-ascii?Q?xgl+imiZQv2gyYZ+dQI4JXtVJ5qNkDf32/FPltZdelBo9IL42J4fPJoEI/0y?=
 =?us-ascii?Q?CmzjVLQ3sJg+42QhBwFqZGQJFxakanSlmN375NQKGDhCLXAZONzpUpwXupAm?=
 =?us-ascii?Q?c6VUJbI9tnOCm9S0d+yckcJcFi7IL1SgER+/Xb0WfUOVQWAqo/xp56hdQNNA?=
 =?us-ascii?Q?06ZwAwCYEvkDnNiLw7C9eoyfwTIRtFNgeWZtuSEnBkXudyNkhzXq8L1/ScGq?=
 =?us-ascii?Q?3SjRDErNRMHCM1fA4C3NELg9OlnCNhlem3SnQHZVkW6VYcT4YK33IQn1mS9u?=
 =?us-ascii?Q?kinCZKy4Rl7uJc8GsBqez23tQtB5VtdqTGoOhMQ/VKnJ5iUH6Z6l+eyT3SXQ?=
 =?us-ascii?Q?MJqOru6LTNaGGjTUPI0ZT2eFvuRDqpx+Cp/55ofKSKfgIoZrHtdyiVV/guSV?=
 =?us-ascii?Q?OQbAj3YQNbHEGaZ5iduTRTnaMLKHSVEaOH9eIbheZxpLZGMGHYlBoRXbvt7H?=
 =?us-ascii?Q?sCoLX4rkWPp40G2S6tXbUzxtvTeAQq4uaNzfqXnyUnHg472IkUFmi0dD6ttR?=
 =?us-ascii?Q?UYHvEt5FYM/EBfdd2paX48d4CdhcJznTFkiceAX9f990eSrFyer3R/1dvecs?=
 =?us-ascii?Q?RCb+lBp9hu0l+TtPhlrjUhdbxQV47amCZj1dIDTgzeCFryVGZS8M3sQ+eetX?=
 =?us-ascii?Q?MzOr3/wdAuwGrNaNcmSAXlhKy5XcHUwh9zcymwAv9ArWDv87aBWDKLyGl3hu?=
 =?us-ascii?Q?mJ6V1t/cJEl1oO23q+XbpIuM98jGtj5LFIrrQzahXHk2xuUFVYXxrq3Pkb8+?=
 =?us-ascii?Q?wcLuA6JsaPUB4bM7pB9EuCd01J/mpe9EV5zR7aWdHCpUMHFwNHK0QH8J/uNq?=
 =?us-ascii?Q?Zd2KZOSGFt/i1R/QYRiEZ/KHNRHOqrQF6k4j3DwNeFkqmp2erzT1m5x17GsP?=
 =?us-ascii?Q?6GV7vHmcR5Z0MkTKqhsDwd0PF8p9LKioyJhRr0A1fEmsRgMvXhv8g5JzWs6L?=
 =?us-ascii?Q?eBeCb1vGedUbejv17pM/yzlqsvRgcr6YvsABkcOxJcRw+qq2SdXAw7/Gd6XT?=
 =?us-ascii?Q?2Sp2BwzdCtOe9W6W51eRF/MbejFWvSi/udg8ETKy8XgHLAsVoR0YCDeEpAKi?=
 =?us-ascii?Q?Vhj5bkWogIVAKcChM8Gj7d7x2Jn8Kye3iBbmXAieBcVmtnVMNtmUup6eo8xe?=
 =?us-ascii?Q?VVHpHk/VqqY6X3EFdHqZsmQuEWjn/jFO+wRB/h83094C1Y3LX0NPzy4NqKzb?=
 =?us-ascii?Q?AYlxQsPeKsxOPI5eEYUu9frGAWC2e/e3r+NUnArJ9l7qoZfw5om4Mk6dhzMR?=
 =?us-ascii?Q?QI0ImYTRX5sqpJ0WwMWY9FhrRZ9I9v9C308XPJi+PS4vqPVVdJBn8dIzGfwT?=
 =?us-ascii?Q?FC5mMpzYAmmf4fC8mehbqF0CjHd/sxvA4uEliQKx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b553da-facc-4467-d553-08dcaa0b3dfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 05:00:44.0765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FnMR8C6eamMGSKBb8w4qY3gsL2aRHRUMSqeyj6NU3hwa78WzihsWWItnd+dKxzjSBDhsndjy2nUWyJpU0Z97A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7817
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 05:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202300

Hi All,
=20
QA for yocto-4.0.20.rc1 is completed. This is the full report for this rele=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Tuesday, July 16, 2024 8:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.20.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.20.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.20.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7140
>=20
> Build hash information:
>=20
> bitbake: 734b0ea3dfe45eb16ee60f0c2c388e22af4040e0
> meta-agl: 75c7354a09c17447e0aa04aab945d8d4ea0bae80
> meta-arm: 260e3adc2bf322f52d81c0642c825088a88bb051
> meta-aws: f8eb3b8a70005655f3aa9f790538088a1dd9d5ff
> meta-clang: 2ed384c64e206016c628451672c688e59944381b
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: bb7c7b0f448ab6541ab42a316dfeff1f7726252f
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 6ff0748a4741517519a281985fc3cd95dadb633e
> meta-virtualization: ef76369f844f8b5afea416372172824987ad4fec
> oecore: 5d97b0576e98a2cf402abab1a1edcab223545d87
> poky: 6bd3969d32730538608e680653e032e66958fe84
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

