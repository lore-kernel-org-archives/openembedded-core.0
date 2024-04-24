Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD04C04FFE
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 02:22:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web10.7489.1713925339728230022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 19:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TbbgnPwH;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713925340; x=1745461340;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BYvNh21XHRL82axeW3uHgU9eKhXByTAa/AUtq2GYWEQ=;
  b=TbbgnPwHOC9TowZud4YkSh1qa1F8SPSOu1kx1R7HYdF5Htnyk54jOIYD
   Kc1e2/s/yM3w5EQfsUcw632l6EP5buVDJxGOnYoGDHdThsFcGolwY4IRO
   977v+qIXMjdlWWdF4xhriV1MD1SsDQ0fALzQN0aprCK3+vgyd10tb1m3Z
   cU2/LDSR2iW3sRcDgMEnT5fY0bWOJ0MtHc0KMm00rGbT1niuBElY1cLri
   vMYx4chzs6dfFcSrxbZO/l62nRT7OVe7Uaxwm0I7N7BSvJk7yREip5nuY
   KeeqhEVxcIHSCxxWQw3bUp/fU/a37wLjFwSyTlZ63RGGxOh7HaPmlowBl
   g==;
X-CSE-ConnectionGUID: u0jZX3cSTXedt2fAO8lDpQ==
X-CSE-MsgGUID: 85w6UVY5QvufMb4I1MomyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20232891"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20232891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 19:22:19 -0700
X-CSE-ConnectionGUID: Y9yRrJxRSyGINVW3M76EEw==
X-CSE-MsgGUID: nuQzpZBkQw2MEHKfWPjU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="25172482"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Apr 2024 19:22:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 19:22:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 19:22:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 19:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg+dajfX1EgyjwQLILzVrWGyTYS39b4uLqOJB7WZOZtveiGkxj8LDTFOhKxdh3QEESsPKJxs4vrUbJMVtKt4/jJrBbgZIOy+2z2+XAkoAbZDzaCJIy+CshjKJSR5MFWHbxYP/kk4Tk4YtQUECThOysRPZvKh2+Ja4bGf6y4bWfmdIOvyVO9VV4CSl5rewLxOX+N4uaUhHmxleBlKgi+9Urptq3DtGfSOwFYAm6p1uv96LA5FWIw9Euj2ceAUZffJCOP+epOjemHwNfGa8v0SEoTA92ZiyC1UVRGlsD6+D1vHLwQvjpJNh8YMEjFPb0IbUlnGSyP52HbVuOPSEshmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv7IFropmhit+fo1adxi0RoRm4lMRs/eWw9JbZDssz8=;
 b=IPPrLqgUOKZ9XOjGaMCvPQh4EntEXvvGoqmv0tQ2iV4NFYd74Q+fMWKTUW3skO04FowxgcL3xD3QS8fYZnPmoVtQblPTilIhNYd5t5euAbVuc/3Wl8MVDmISq8Aaw7ARbLtC2CNZCWR/UQHf0xSCUr0enUGao7SURTvWJwih9duUsrDa+kObOz5eLSjzRotN6sTpgXt8/6bQAqes4woCArRtg22VViFhxPQhxxzmgv19FcO6Hg7clptlI+QJk0PAhmyscPkyAuYexUGO9AGT01Uaau5x2B1pbs5P6HSiHeSRk7hYG9tkQjJfHaJUea1gGvK54snhIGfl73te7650ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB8524.namprd11.prod.outlook.com (2603:10b6:806:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Wed, 24 Apr
 2024 02:22:16 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 02:22:16 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.rc4)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.rc4)
Thread-Index: AQHake8XuyEQrDjR3EiaLK1lGvKvv7F2uErQ
Date: Wed, 24 Apr 2024 02:22:16 +0000
Message-ID: <DM4PR11MB7760027C38E987727FC0E617A1102@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018ef3b7ba30-02874709-13d0-4a8b-ac90-e3eff3a6bd60-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018ef3b7ba30-02874709-13d0-4a8b-ac90-e3eff3a6bd60-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB8524:EE_
x-ms-office365-filtering-correlation-id: d3a7c55a-9dfc-463f-35b8-08dc64055c11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?ruJ1dv29L5ROWobfPs6rDpuhAEk7MIOiHE6yCTg/vbBhLKQrz2ntmGE+v1Fm?=
 =?us-ascii?Q?HFqt/vubsdJ9cR5hAOLM7gwa9HbvVLBKAA5Ru1CYj99zFki64GfJtFfCspkN?=
 =?us-ascii?Q?iIR5z36/FDHyN4NH1KhUJgF0lj+2CcGBrku4Yro1/qfIYPUK0ewb9ZaZm8+g?=
 =?us-ascii?Q?Y4VosnW7erfNWv541kK75GUY/lgnM+sb360xk5snsuMExVLHYRBsEdkroyQ1?=
 =?us-ascii?Q?+2AcjEh7n3L55c9FfKrR4t14ZsIGHHwEQ4Exgq7WV6WiPGDExptuVnq4scH+?=
 =?us-ascii?Q?2TdSZ+QzJsJXSHALBUB8dIHynQO+ibR2XUcSVC9trHrvSiUq0SRQzB4tyGqD?=
 =?us-ascii?Q?4tmmEByLq0w0cFalqUC6Su8ton59vx5fqj9M1lyEKihjJ8ys4N72Mw1zivxn?=
 =?us-ascii?Q?XzDsNOBTSiTtPdvHlAvjHDgvd+9nT1ec7KZWIsXmEuixz0HXNs0cQw+hry1m?=
 =?us-ascii?Q?QI4hUp6ylwlILl2hk9viv0WKMCTjizgjjZRYQvreNMoR1MYPYBrD683cQaC3?=
 =?us-ascii?Q?9Z/7opiikzbuT4AEkHQ3JjbftY2Fmjgwt+7vysZJraWYjHA160Onz0a4TUi5?=
 =?us-ascii?Q?0XsOk5JgWKhOTFFrjESQ1jmM5e5p+lDnaRiBdjbvIyD3OWUBZAvgrRiMEOmY?=
 =?us-ascii?Q?oNYE80AgyMNXyil6Y2/0dnscMVhvOEH8FCVhiYBFeEAkjPvLdnZlUDsuNtD/?=
 =?us-ascii?Q?KZfROLe4MldSL22F6z5CN5/9iAVq7VuZn7tbD9wT4Ml/Vv9HIdUtzESJMZmF?=
 =?us-ascii?Q?Nv0eGpU9oFTfr6xiNY50YR6jqGTIvrL7BvGxji16Vx+1fI9VYqAJ8q5BKbzx?=
 =?us-ascii?Q?OQNfyR+Q8pDEQvznHjAjbo7X+luWAVfdKtamWA6gpPEg3CH8MmN4e9hBwW7X?=
 =?us-ascii?Q?ODFLoeBge83jATd5Xq+8aoRHmODjbckRx0ihE3YF7gULHiGCGuMlF1wItHt/?=
 =?us-ascii?Q?tbKeO1awhUoCqTVxd9r86WNpdUo0aRPONLPjnTvqTR8HIEXapXK4hILE2BJ7?=
 =?us-ascii?Q?/KOtLp5rZAKbROk3xpaF1tg1lzna0Ybm0zWHZvuHGV0JOHzqcQc/rlP/aZ/E?=
 =?us-ascii?Q?FE0NZF0q9bhk3KsN+SEldqo8w5Vs1YO9Um0sKarXXa0LYAuSydgMeMzbvkf3?=
 =?us-ascii?Q?b2sHzG+YSmbW7BxvDMnjG0ulAUr0tT2kPVQm+tJQDdX9tePclvPxDD6fB2eD?=
 =?us-ascii?Q?iHL5RGrDLdz9uqJQMgOd709GttAMultqbiEGRhcR1efwFQaUQg1EfBNbkGha?=
 =?us-ascii?Q?YkjwkV4H9GXSkXDFwG1eQRTZZRMg/CRYy3ITATiFGVYFkAVHkeM8FN49QvgB?=
 =?us-ascii?Q?dDo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6cOb3RTf2KYfPHlHvU8AqSpLtse2Fcb9mAq74g153DVkKL1X3OSOTlCCNvPx?=
 =?us-ascii?Q?yzuFEInuH9NIqJRmT8ffSu45Jnj9M630xfpIMQsqRVuaMhGNzHCYznY7JoEe?=
 =?us-ascii?Q?UWGeQJniHMvdcMtu14ZqP6r/LbywYFQhDugcFZEuA8+lUVdxIIGO+TQSqZNF?=
 =?us-ascii?Q?JXe0UWQXayRmhne+FFK/EpMHNwOg71K90dBBMrSBoi3yBEubIB90w/4H056f?=
 =?us-ascii?Q?PqL9m3zBTlZo4BHhhJJyX+PlYRuuG5Jq6DhzlVd0jDfWeJ5VKOV/POQtThsj?=
 =?us-ascii?Q?e3CXeh9pUKGCoMCpBG1bVtk+rr+ZLMc+DYeM9L613Fkw6dN9O+iDV5Aw+4zL?=
 =?us-ascii?Q?s1p3nUbmg2wG2NmGiU+A+CPVXjEUtYZUyuRYpIw1kbcJvAaTPfHPWktCslsb?=
 =?us-ascii?Q?xbnyT6jL4prExZo99BZMYJGZvXm69eoFD6psJE01x6fOCoawnPYASxjVXejm?=
 =?us-ascii?Q?I89FyCo1qy9vxICGvcrB/LeUEv/fai0R7RNCBJc4HZrmLgO3yI9EK3FkrhLN?=
 =?us-ascii?Q?BSQB7xNFT2G5iRCf8Pi3j2JileqmOIe1BNe/UAyOm1Vj1kzQw6aslgr9LZoN?=
 =?us-ascii?Q?RbzUpZpJGhyK+oLjPzVjbSo7qJgLA5mFb4DYCrd5MuYXA8hwk33OCsYIsBit?=
 =?us-ascii?Q?gq5RES4ISa56C5dV/XYHFzy81HM/bttBFkxzugsWh5Vi13Eyyj78pRpn/L/l?=
 =?us-ascii?Q?KvddxlTlIXKYomPy/joTxrfw7tSFBBMcFi9CqNEl354wcsfXAgYv2GHRvszx?=
 =?us-ascii?Q?eNu5HB8EJk8aMv5xF+TvLFK5ZI3DYq+fN12pyRcYspvH3dUX271NR/WKZBRg?=
 =?us-ascii?Q?udqhq38kK2+79USXNEx5CyIxf4wgLwFYbvC4pe7eQEmPHgbJDXyZllCMeRSo?=
 =?us-ascii?Q?+QVUIAM9Vqmyyfh9es4eFu8f3iILza+0/Jdat3PTDIRKH0biWhPdGF+q0tta?=
 =?us-ascii?Q?1oEtR79DwCbQ/5UX8RbThDG+V3o0TWHF2twZU6B1DLRc431QwJKuOVvYr8Vs?=
 =?us-ascii?Q?LBBa9ikLVh4pskmkjKkkBxWYJywsSAJwufZ8HxfWpmIGW6vunD3yKrSsf6RX?=
 =?us-ascii?Q?HUWE2v1KW9UJ/kk6vUVlXEgSmon0SenN1hYFmM6RzX/NGIukNtiMt+TY4JII?=
 =?us-ascii?Q?/5Flb8tu4PofaWoZg5yPLrEr41tMAfqVuTEpilHq/bXzYKZZKyZwzhFBUILE?=
 =?us-ascii?Q?EWXUn2oYoad8oV/znQIBwqAyiO/JEhc8YNWXmp3l95GPNOOaWAus7ZDoYJaD?=
 =?us-ascii?Q?CgdiLxfuKYY8wtDo18ncRDrymidwRkp+hQddueOomySweIIeJnfBbt6gI5tU?=
 =?us-ascii?Q?JA021F4WuBQnn5BwkqNop0OpuRFfT5vFwlv/GSYGfeQmvGCOL01ZCIv76vq5?=
 =?us-ascii?Q?DSgj3QI2aY30Ow1IY+RzkNXxVUx8icVqZIIKpth41BvKWsUzpsF9FbeHwxO3?=
 =?us-ascii?Q?YyM045ncSVokIUDb1UP7Gq0jf0E2ROLBErKkcWgd5ZpNLL1ZrS278bmfo89j?=
 =?us-ascii?Q?98nvDDbZo1H3pQbbjQpT26ijNzS2B4FT0Tj1Q2mP8cNpWzmFM24/kpIQmlOT?=
 =?us-ascii?Q?I2gv/ckolbeCI/6N8TOILaoRWv9JZImuIYgFDJtF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a7c55a-9dfc-463f-35b8-08dc64055c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 02:22:16.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hImANm4R+cC4S2DdoR1kp7bHosnjuPtE24ST+MF/y4akW+6e3oWYd+hHDa+LvrCiRZbyRhIWXqXA3MjLdxbxTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 02:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198638

Hi All,
=20
QA for yocto-5.0.rc4 is completed. This is the full report for this release=
: =20
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
> Sent: Friday, April 19, 2024 8:18 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.rc4)
>=20
>=20
>     A build flagged for QA (yocto-5.0.rc4) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.rc4
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6823
>=20
>     Build hash information:
>=20
>     bitbake: c86466d51e8ff14e57a734c1eec5bb651fdc73ef
> meta-agl: d5420276a2d6bf1fbc4a948e4500744608c3a39d
> meta-arm: 80f3b85bbd4c459a7c58afa754b40a89c2c9c102
> meta-aws: 216c095de9d546c141a90017a91a3ccb226de754
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-intel: 0093d9f2eaf97063c81bc73736ebe7c29a69200f
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 24044fd3a010dba91f22e3b6af7788529f622795
> meta-virtualization: b7e77b69d309d8ee985720e88b19b6e9cf03fe63
> oecore: b65b4e5a8e4473d8ca43835ba17bc8bd4bdca277
> poky: fb91a49387cfb0c8d48303bb3354325ba2a05587
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
> View/Reply Online (#420): https://lists.yoctoproject.org/g/qa-build-
> notification/message/420
> Mute This Topic: https://lists.yoctoproject.org/mt/105609427/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


