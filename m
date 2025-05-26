Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAACBC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:09:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.25031.1748250577117991072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 02:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Aor+AUYs;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748250577; x=1779786577;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=O2WPEgQXIgVmoDwVpSQjL92x5gHlKbWsXdI7swXfO/8=;
  b=Aor+AUYs56rCdkLxyLM1MmcBcDAHL3ihcAs7HJ5ifWi/yWnuMTRlpx0B
   L70kpltZnxMr/+vhHm+MNibjBYn/0KYb6P1nxqRidUyV+z1uoRAgf62xs
   YtoWmCeWKCtfuQ0FuSYPcRy6xJ3gS5iGjWqY7YV816Jr5+PwYLhVvsQdJ
   7OtUU1DdXbvFniU32hyaa+7GNQ9AdS4IK1qvq8I1OWKa4t3A+nn2s5W0+
   XF/9P2VgJxBjxh1RzH/ySZUp1SaA1tsT6oHjkSzCAHhMkCC+fn7m2WK92
   SlIVwEF77wLadD80NrKHaOsYbIttpR6GN8uTO7wTJqzksJUUu1oRs26eJ
   w==;
X-CSE-ConnectionGUID: ZVWKzZkwT1u+ytn7ippXbg==
X-CSE-MsgGUID: yOYExABpSWSxk726z3ZY9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="72746502"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="72746502"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 02:07:48 -0700
X-CSE-ConnectionGUID: caNYvrtiTcuNFdll69lBjQ==
X-CSE-MsgGUID: qnf3n4QUSQqEf5W2f2XmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="146185025"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 02:07:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 02:07:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 02:07:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.78)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 02:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTCF5VDgfKXp5z/0eijB8WhXel6fJ3NyjKpGDv/w+0IwDId2KXaiMn+tVThmk2GlZSwt5aDGhNrHcn/ssMr5uvburoFVIvA9PhbqqnSzf/e7ziLU++iF2CcROHvvx3IvBCTmI71ChKIq4FCkD9a506NaaeE16ezG0/epGJ4Efpytj1QK3PsOVb2ZN7A+4cbDAnuAwtF+LIv28DNy28TdJ258DSf4rQ57BnoWnxSsP4gTXoroefZ7TRVl2S1lxdSpIvAhe/mcM+q+xlwQtVnIPRBYNj4LkKRzmkZE0+tkzxpqvNIcVi11T7KbqL3x//gu1V/CXiQSHXJYwp2J36UfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD+1pC0Y3FXZ9J49rp57MKW0jxej+mIhDpehK/f8XsM=;
 b=X0owjhvRz4dPQ3IwURkgjKeDTIOe1FPF7vkQfGmap+HqMQd85dNkH5K4KzNCKtluJQ/IJTebtLua93ze0iucZ2Olq1yQTQ5GHTvip28Qi0qXCDG5RHi3PHr5Eu+CXkxhhm0tIp8VZphLMzDo2ZJILwpzbNvrCz1RS/qSy8AvfkOXb4Sg50gP5ptdd0wy4LB7vYlARVZsPh8k/YXI0y59rUHjWb5jD3JLA+jIj8xz+TiBYrt4JZtKvBGBfULKorIZV3doJSn7GhHsW4SJ1Yw3QlGISaLiKEpnOQqVhsO2i83xTI+5BLIQRVuTS4ZBBsf9R062MfKnm5fPgUJ5jBC2dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 09:07:30 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:07:29 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.2.1.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.2.1.rc1)
Thread-Index: AQHbzM6OLZWY5mm8X0ejtkUdfgw417PkoS/Q
Date: Mon, 26 May 2025 09:07:29 +0000
Message-ID: <DM4PR11MB776046B2D4C9595FE07BD872A165A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101970344de7e-a0658898-c111-477b-b2ac-093e5ac89415-000000@us-west-2.amazonses.com>
In-Reply-To: <010101970344de7e-a0658898-c111-477b-b2ac-093e5ac89415-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA1PR11MB6538:EE_
x-ms-office365-filtering-correlation-id: 5c475341-936a-4fe6-5a6e-08dd9c34be29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gA3VMAPRnlCrj1bG5yE62nbgQifUUHQcsjjSIsS8nxC1/b7BbaBnCiHsvRn9?=
 =?us-ascii?Q?X/8RoRFMObwQoC4zorcU1bL2XpfIEzvONKS9DSw3HSTgkixPaNjjP2E0fiL0?=
 =?us-ascii?Q?SLcHjf5avftin04SVfQm6et4tgJkXpXcIoaGl8tb14x+sUZ2xolsGLyKZhXb?=
 =?us-ascii?Q?zqCSYqvQLR/7jf7+AGPMNr/qsUq4pZED9yHjhJPibbqbQk/K2iC4+ISAsB3q?=
 =?us-ascii?Q?08g05bdUp/V1BomhJjsEpx6zoLF+fa0KwmEo1J4XUDkc86qo5kdNDK73+cZj?=
 =?us-ascii?Q?JBscl8lUaANxM60QbAH6yJtQV8I1z8gZstxvzVrBrq302Q18rZjeJvrWyWhd?=
 =?us-ascii?Q?DLL0A60lGnjIeG5fWuLDgUgxcRQYcae8g+9fH7jYt6UNzlMph3388YJWwBpA?=
 =?us-ascii?Q?VDaoixAbMI1mnsYc+DwrsxlGZFfqsvxSkBPWzDcZnAhUp1gCwZ7CkoPfme3+?=
 =?us-ascii?Q?xMerJ18JQSK/7fDToHALn3V84GSArvs4Ozn8o3TPSGhxudRdXwcw3sZFaa5e?=
 =?us-ascii?Q?6Xp3Xt/jtvWXz92anLkRskc+7x0S4IlJRL+Yt3grPiWRae5ywF3X6CX16/i+?=
 =?us-ascii?Q?HAigiC9lvMHjpz6XLXLxn7Rgt5rceOvG8SH4cXMPIVI/6yGxGVCkZsOlrH33?=
 =?us-ascii?Q?WznwPN7GlPjkxN90hj5chuAzxdQbZrVcBB0USGKD//ypIc4+MmKdlq6fJXqH?=
 =?us-ascii?Q?hiHZCKLvtai3CMD1eNqrUFLcwbL3E6ly0NpDuaIU1neoXPuWTVgnzNP6FZkR?=
 =?us-ascii?Q?wJDcvEZOqB6hsbO9aFlI8Xr6tSeYBo0cKTc5I6gUTOtNz+4Kh6EM9CJN+tPZ?=
 =?us-ascii?Q?uoxkq3M8xJeedLagS4lqGxi1WkJ2vLde8+8CyX81qpUH5JnqPT06OxIQ94Ge?=
 =?us-ascii?Q?tmwotWW2f46T3V8fu2ydID64O+mbd3Ms4BaUsAGd11WX1QTEXZuaP2O+lVdh?=
 =?us-ascii?Q?neOLIQo8TXyyqyElf/GC4rBIGyvaEB0V5a6uCCnWxZH2tVdV9tBbik1tUb3a?=
 =?us-ascii?Q?q14zp9uPQx7Skm6Cxc3cwijiUVT3Fs9fJ1xRK28QgYuq7+9hxC8Z+KNcBM+A?=
 =?us-ascii?Q?f2GGfjc1HIHtfH/SE8Lo683cquVSfqm9C52gcBicjLAb+myN9VAUWm2MzMR4?=
 =?us-ascii?Q?UwUjPod2Rklx3sP0CnEinUSIwq8jqr/4pL6JcK6mBWHXFLVcQYSbgO8ezM48?=
 =?us-ascii?Q?gHGLOjk/LQsVplPubX5nXx+6HhJH+Gg6/vb0Z+mVVoS6rMe497QTno36sy+W?=
 =?us-ascii?Q?cE+ovKHCgV6bGH1C06xPU8wnes/xzjzc6uaIjgbSpo6NnlIlSWKgNl6DPH0Z?=
 =?us-ascii?Q?dTDmbDG1skSJ+Y1SqOI+8fnxxp3niLgnBRTw/ZsjgMSo3oJ+QPNqoxQi1lA+?=
 =?us-ascii?Q?BNQ04Xtdco/gscaiKg9kCN2L02v/9xhEyWBet8a549U6F48x9LUsrzPc+cjm?=
 =?us-ascii?Q?8lDHeSRGulA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c2IsxD2Jmc/mv/DMF7VTzCciYoeiMPQUGBXM1yb2A3aYyYkf/SP+DhShSrjh?=
 =?us-ascii?Q?0ILbKXO3byQjWbVzy6O9Ttuw7shtmnQwPYOBou2exAzWkjuFgfqR6kc4vlQI?=
 =?us-ascii?Q?eMBhy9zf+Dj01NUigQGjSuaWXXnChpwVxwxVuxAaMxXX5hFguLibl3s9wk5v?=
 =?us-ascii?Q?VOhux7Jf75ABUItWAm2NwE/4Njp/RkOU++BvbhbmzxmVhICprkviqabHvUJy?=
 =?us-ascii?Q?kd79J22qPFO1Umwpv+rJznEY61GjfxJWVIMF6Y3N1Ccl9FUcgd0Ol3ZT3K2k?=
 =?us-ascii?Q?3oD7r40VmbZrdbIrRofuT7N/iKpD7PxgN6h8OtbaN9QFwnwvwZ9NrH78P8nY?=
 =?us-ascii?Q?/M9frSWuKVLK3JkGyrWBHF58qA4XYXaLyJC0xJGw/fitucybVbUF9vEHCyJm?=
 =?us-ascii?Q?5Qz/4NggXHSct1arSQQU6f12aVC7eXGEvG/+guYQlU7NAnUTZH2Bydi4MsrP?=
 =?us-ascii?Q?W/0bHKN5EHjQuI74FlbNcPIt+IlCUIWgvKibzKIaXuY4Nh0NkxeKfRjMft2m?=
 =?us-ascii?Q?+CjEYlFct/nYXG+8NDbOL69zdU4kjy8+C6vUrJJCo/cxXiP9ofBBi9iQUAJZ?=
 =?us-ascii?Q?ItDVTckcLe5nDYZ8Zhir+volZNjS6XRRhBw3Wg5X614fwSmXJLnjzQwTN/En?=
 =?us-ascii?Q?ZyFksXLNUrJGBWCSlj5lKiKrn0X6vs6av6pxJYz8bI7Cl2Fq6qFwBi0ye1Md?=
 =?us-ascii?Q?gNIgj0s/pMC3bm3FgC7CJT+AA+Wgx0hEfSsGi0wt45v0v95qkM+FABhSSZ0/?=
 =?us-ascii?Q?abuR8CJlfBkAfUeJoqJzaylcE1Y0fnYWRKKf4tIIdkx56jhsvlF6fMYiLVCY?=
 =?us-ascii?Q?8+tnyfIpw+c7ctkO6utKe76uNR729MO/rX8WQLEOSfpAGBJ0phM/8AffR0WN?=
 =?us-ascii?Q?Gx4ZYMfq+e4tJjNkb53IKHBuJj2I+Fek7eADRCKhh1pGV1sdpKbr6eslLvkI?=
 =?us-ascii?Q?aW+MQRu5Siask7VcaeGyWzOBdHtYuDyAcTCDwlrke5VJQqKW0wYfzilGhtz9?=
 =?us-ascii?Q?b+FPMvzJUcCf75qhdpoiVNWzsy104TG59tjGyCNkySGIHVVpJOm1HcO8RHEu?=
 =?us-ascii?Q?Ix2FIfvZq87q6kHk+qyPJjtl21kjzGbPgwp/fbwYwY0uZlIiZ1ZrXaBah13L?=
 =?us-ascii?Q?wXo0kYOz0QkY8clELxzgmJ6qwWSiBn4+wTblvAw0D2h5JFCDnrcslP50zruA?=
 =?us-ascii?Q?9V0pHdF6PBgMFN9G8lZ4cDMv3IXifojyrBw+2Txuml4n1mT0FJzCi0SSqURp?=
 =?us-ascii?Q?Z3+lHf5fjNbskO4qmxXEJajgL2EmjOfxxKvfGHsFihsah7UP+QHPfSXJnaIN?=
 =?us-ascii?Q?HG1BzyUU+zkMQL8n6PDeiKbsLxUB5wjorx7MYINEHMxlQm4BCBfn65BbsbGl?=
 =?us-ascii?Q?iBwwr7eVxL3PSEaOLaFjkSjKn4IIBbSAh/3RihecHqLMOFFWX3r/zHpbmgtX?=
 =?us-ascii?Q?Z+06ibcxsDSYKOVWYh0n9EWTKWxxyotPoFUQs8W/ByHNQMnkMpz2k3/i99k3?=
 =?us-ascii?Q?0Y7WY3EKYesFcFtk2q5RIm4mcFt1yzrF65n5a7WM/rH435nnPzkfSRYnvVfN?=
 =?us-ascii?Q?L/8THBZpyTL4ZsLIAF2iN2u3oXgS2046OicGNJdZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c475341-936a-4fe6-5a6e-08dd9c34be29
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 09:07:29.8894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQzuJIzzZSq22VsVftfIjQjI6IMOo0qafm++5Okiilwxs68+nGLaVjVk+vpsQHPRZFh0KgH4K+a/3ZZ+pNVpbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 09:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217262

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.2.1.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion: Thursday, 29May 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Sunday, May 25, 2025 1:09 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.2.1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2.1.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1654
>=20
>     Build hash information:
>=20
>     bitbake: 5b4e20377eea8d428edf1aeb2187c18f82ca6757
> meta-agl: e66db9b71ee6566d5931f590e5491661e94b5e13
> meta-arm: 4f8d2f4b2fa23b89098a8e7347d6bb26228acd68
> meta-aws: a28a159b336db6531e5482ca5c6f92b25231b184
> meta-clang: b3e5449f0156884d18c17efff99654cde8251411
> meta-intel: b5c65864faeff4ed95f4f75daf5535a95a809e5e
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 2169c9afcc0945045bea49f58011080942d4ddb4
> meta-virtualization: b54f05a85be5e2b80c111506b7c4d35d7d4eb54d
> oecore: 17affdaa600896282e07fb4d64cb23195673baa1
> poky: fd9b605507a20d850a9991316cd190c1d20dc4a6
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

