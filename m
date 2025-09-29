Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90943CAC5BD
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:00:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.48538.1759132850795528058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VEUFgOoX;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759132851; x=1790668851;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=F3HtcKazR13gbqzofawC+F69+yDO8uEwdltqh/zF/lk=;
  b=VEUFgOoXDDm+kQH0v9dqSBS9xo6jY+mcqBwXN/YNVf00X3aboACTbjRN
   J7cDlEfPsDvP0FXoRR3HphuwCCtST5Aider0TKcMEEjQm0nwQxzJxs/Et
   LjX/cIFBQm/QATNbLM5gBOjZ0GhhRFqwN0xwjxzvlNCQvV3q6Pij5eNpz
   I/VLncjjCRR95tvwJYSBl8xwjU2IYk87Qwp5S3/t//r1YowwjC4SYUcDt
   mYOGAf5E+Oug97WGX9NGeDOsCi+Zba3ta+jZvSzXWrjnjoXlzYoXdQivk
   Dq+OJUvXflqx0QhL4wS8wM8Rb1AV4ISy/0UtkGtTLWtamA982u6hmGSI6
   Q==;
X-CSE-ConnectionGUID: kAGJPhSER4KdJLG9+weyeQ==
X-CSE-MsgGUID: 18z77AaTQ++7sEEJiHGBQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61287228"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="61287228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 01:00:50 -0700
X-CSE-ConnectionGUID: bKJ8jBXSSW6+WcyJlLJBCQ==
X-CSE-MsgGUID: sqNltnagTFu4TD+kFXaA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="178554961"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 01:00:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:00:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:00:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:00:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5kIG8MYA8+NXtlMsZF+rNAE+9o6r6V4f2eGWD8EGHY4Js7oR84QBRkkZzM5Ri2mlm0DtjlDME8DF/Wd/HP+7wAI92yOVe1fOK7Afk8ZcoWzjResclRp0BSQihhwCKYQLbQOHtOOgD46b3hipKtGlch1IJx6uWWHdYGz0eQYj2apJouYUwNjqrZuyNoU9giAGEyeyUTLX3CVezQIB3lM8Z3t90pX+ecA3JVyYmrEAuujSmC1voTSPCCJrk791hnRzF/yslrDWhDScYjB3BiZhKEZu0W5iTEU2WH2DJ7T9WD+NTZ8Lz6SFzdrfsM+KfqCaSSL2O3+G2wblS4htGuB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYyriX6GylCBDlyvLZgMY4F71ltEDbFDF3x8Cz/sU9Q=;
 b=WTwcFjez0rbfewOBvuRp0MTV5VH2StDdU0biAOLZR/Z4Srq9vaNsxuXQ72pdCsriVh11rqHUl7KVlfTsx1Pe8lEjvaByTxWKVWrH+KVDmwfu4Vi6jfgAwgt5nMdFxbP1SgEgHI2orSHpuvFzEfmYK9cnhmqcXCwfXZyltL2oLOK3/XFA7S8Uq/oC6LI0hbR4GRQ8qRIGmpWrlR+ys6h6fvOHPdD0stib6nh5a3WKtdtcp9yOSLdFS7121lO/0P15BhP41hxOvb47yva9YkWRvs9yEG3O4GIsashPcs0fGxHWeTGzHNwPwl1mF0RVPPJgxX1EXiRRBQrDAqKcM+HjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 08:00:44 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 08:00:44 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.30.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.30.rc2)
Thread-Index: AQHcKdGV5tujwCUw206WcvfC+kYRxLSp2iIA
Date: Mon, 29 Sep 2025 08:00:43 +0000
Message-ID: <DM4PR11MB77608A3E7C3385E8479D08B3A11BA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019964d4d762-b79f194a-8ed1-4579-9c27-90439b076fb2-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019964d4d762-b79f194a-8ed1-4579-9c27-90439b076fb2-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|MN2PR11MB4760:EE_
x-ms-office365-filtering-correlation-id: d6674ea7-1f68-49fa-e0ab-08ddff2e4aa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7053199007|13003099007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?JDD4CamXf4iL+nlmwmNwBVowIF8bheuk1K7rLmScacAtZoyqsZf28/XzmFAZ?=
 =?us-ascii?Q?uwd+IzWx0xSII3OQWSXmKJ1npN1n4+byCWQ1AKVbo3XxgORGCN8KjDuXc1mX?=
 =?us-ascii?Q?2QXuMgcEh3SjwO6wTZBjdzRcZY/DRPMnFHZFLimdNj9joGGFVedWExBsGyUZ?=
 =?us-ascii?Q?FOrdABvITxXiNWprEauKVpZZYm1ZiPtzKdlyM5eG/Z8EbLNRBxz+XsfI1gMk?=
 =?us-ascii?Q?oM/EtTod1PmOKkhjPtpnyx3kJuGxik/gF5908KC9spPde1MdvJlLAqA3gjR+?=
 =?us-ascii?Q?3/hGPAizsQ8gOSzHf4m2PZZ1+UwsHdQQJcXzOhXaSZT7kVGZmk51TDR2fzoX?=
 =?us-ascii?Q?WsrbFGTLSs64cU7HckRJDlxKekC/fauLMIOe7gJYdeg/k33Bln/doqncNU/w?=
 =?us-ascii?Q?IzBiI9vyyPOxep/ZfqQGd9IJvzyB+Ro7KIdHbLq5gvxNsd4R0BfkLLyoaAH/?=
 =?us-ascii?Q?+h4B4VGEQfXWD03nIiixcuKPNgiN79mPdpWZOZAouSNnxXkHv+Kiv6PT2wk4?=
 =?us-ascii?Q?AOaha5/iuOHImtzO16Tp2lfPurOy6M0grnzpDp5Y9YBdTPmF/8jQDCDdelFc?=
 =?us-ascii?Q?yp1/XiUgJv8Iy3jRbCIV41FdExOiC3ULivKHeG5FbDCGD8Ep6LVLu2OlaqKO?=
 =?us-ascii?Q?oIQuNt2N2lkYZdhXOYawyCsk9Pz+adbs65m7HxKhzgav4Wrqkj3AQq4s6+TH?=
 =?us-ascii?Q?pcopqCuIkYPKGW/HnSHUIjbo0ffY9N+ycurjxKl4z6Z765Ge8IXngkgqSXNO?=
 =?us-ascii?Q?lAGk4TkJyAEBACWe0X694SGgPqqWegzdCBfGqnxGart2FqEM5C2MuEIUxmvC?=
 =?us-ascii?Q?gTl/cM/e4lA+dU+fPOlH/pOaOfOq4r6d72mJ4tUfy/MbXaMd9FtzNPo+pfSS?=
 =?us-ascii?Q?gflFMlzdHCmbuwUl11co6+8Bhdf2dX8fDVu9rpvs4wzPqRk8u8RRbtgY6C/f?=
 =?us-ascii?Q?BCnvH+ZruP3F24R11qrOvEwCom6hxcWRw4QQgBK6r6vl8sHoq2A+SvsFJ2wO?=
 =?us-ascii?Q?l6telFcc86Kq+dpW2lgDqj5V84fdOfi01Bs2X7jMvriXNWYpdemrStgPH/zD?=
 =?us-ascii?Q?Fhzha8wuxhGnikdEx8zyJpHtqKTVkP742MJ6zo6LUYCNhPX+GKX+m9Zwzh16?=
 =?us-ascii?Q?fmCswj/j8BFWQLe3od3hsecbb32kHBctFsiLz1zM01gJdn9fo0aZ4OKIwRNZ?=
 =?us-ascii?Q?g7jDp4VkKitoj9y55J186NQk3SWRNOgSUAboDENilqMoVXdprjdePUup1IhU?=
 =?us-ascii?Q?0EsGaxtyI6nIObxizrZ9NG+byUW99kIuPR9F1xY3ldHwqzdUgfV7KRK5R4jQ?=
 =?us-ascii?Q?XH9acQqdr0pOuj7O1fPJGD9eVWFJX0+eJTiLeeq9+TA495F5/hu0mgzTkyDY?=
 =?us-ascii?Q?KJQNh8YK0rm/QXgf/XA5iV71vqM92uB9D77H2qqHuMD8gYWjcz6zS4ngvMUP?=
 =?us-ascii?Q?YmuqSflP749zb4uC92TzNhXCE5t9yVPqASxUDmSdYyXUR8nOtSOocw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7053199007)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ra9yc+DJ7BjLR8LBw4rQ6E7DBJItAjL95h0fcZ7vg3Z6FlRp7r4mD9jeE5Lp?=
 =?us-ascii?Q?0l5JCaeWn6whx5Sb6u5gQ6KO7uG07vexNfSJfXgtzHP0DeAWyiR4c9Slw8BX?=
 =?us-ascii?Q?QjezroLunR4/97hwqOuyjYx3tdR/uKXjN3TDkXnFOgVJxhYpLOncsk56D6Q3?=
 =?us-ascii?Q?14qGwwJXDl4/2ARwsZhC+b3bAu/Ellg1NYO0SyDZ5l3CGsL8IiYnWezWiphW?=
 =?us-ascii?Q?xdtYftC/RhzZ+gY/q6jsoFR2Z3va/c2/P2IKK+To+HrZRSg/aV0Y8xBSxwpO?=
 =?us-ascii?Q?WcF3dftEDBVv95R4imfcR6EN+CzYx6IqnapzX6qVGUoHknQOsyAGEbCWZSkr?=
 =?us-ascii?Q?Na/AB8QWtep+U2+bLC1O8lrv3kjN+VEzUWgjjJPFXb29s+iHPAnCL8UU1mWI?=
 =?us-ascii?Q?KMWn2mpjJ8n2oeDE9o39kuMjLujKdOYEyEgHWkD3dW7iYj2YeXxk6AmGKT9R?=
 =?us-ascii?Q?NrIEmC78uE5Rx9uhY5ob0Z6eE/M1z7OeFsU8TGx6RDyU9sUR/RdnM/66KvqS?=
 =?us-ascii?Q?Xz3XIy6vuReGrlAErgbn95q3vSTFr4Ur9LlzTocnTo3mEJCCDkP215dHy5Eb?=
 =?us-ascii?Q?dxI6Se+UbzvWEl/Q6l4H0WP82d76Vz2255hhb/ConsvFEV+S0s5MkUeULy36?=
 =?us-ascii?Q?2SvTRNxGZQtHADjmuSom+XWWIXxXfcVdmhofLJLIf466gQnFL8dXuax/OOgo?=
 =?us-ascii?Q?TjktUtkMzII8OV9pNyYvFoU/cpJ5IHjJcOb0M4VwLdEk2oMUn2e2xBWY0YJr?=
 =?us-ascii?Q?I0Aqx1Iwga1XZkZ0csMgMSpdGEnyC32XSqcPbiNKJql0CyL5+Bbi2cfaZEwk?=
 =?us-ascii?Q?Rv8FH4u2A1cKIbwgMi8gZyZCxFprHCqEudygehi4iDrjxBFdSah93GPsKVrP?=
 =?us-ascii?Q?skkeyBXuq2YPvjbXW7oENsoBuQYmIaZoqeA93nCTWX3yJgcVOedFItX6Kpdz?=
 =?us-ascii?Q?lMIDrV4IVDmmttTmgdSpzNfY3yuVgcpJ6EWYF2s+p7+jpf3zXT/vUIYEcZGw?=
 =?us-ascii?Q?jnEBmMlqM3ptBTBUfIzne+H/qocaO6nh9P7GYiRyDJfWuwIuuoytrd3Pm0oz?=
 =?us-ascii?Q?SDOEJNpNhvHnnjkcfNuBgoXLGSbAUp5XCWhpV8ZSwJcjSLqHwIAXS1i6x9oU?=
 =?us-ascii?Q?Z89zH8ullaLaNSSBNbQ79xSTADhzP8+kExYoOaseF77YWFpdyQoiuGcc7PEg?=
 =?us-ascii?Q?sdjR4QEvfHjAYaOp58FTha8iHk2fWGhcgpajofSwqQGZdvAz/7n3wB88i2fC?=
 =?us-ascii?Q?vQUVpTQyJ861QbqUSjz8Yjxig+2+oG1sATsKW+ou2TxFmq8H3Wcc2BJ/P35y?=
 =?us-ascii?Q?VjP/7HzM4EmY1PF8eZV8mNN1Lui3LTR7cE42X1Lmjs0Om0SmfczowXo8Qp2c?=
 =?us-ascii?Q?LPCyvC/jddbkVpAUcLAGQ0PmIzVM2E6sb7TOdF3OM/75wkH/qbWNCGi8uBal?=
 =?us-ascii?Q?qSPQKONttwYzbUsiLlKBNlndvfrKpugjCpKjeWVEogtHDgXJILso0bia7qjM?=
 =?us-ascii?Q?2yCwYvBMoa8s1BlbmR0ZROgyE/AbMaLF7e1MJdtscT2mHhbMrjUKN3vz7QpG?=
 =?us-ascii?Q?ysKIP1hudDrO/Wz/j+Pn0Q1hd6F4SNn1I0hCSnz3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6674ea7-1f68-49fa-e0ab-08ddff2e4aa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 08:00:44.2161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2Ul9zX1Ndh3ZkS8hOHdYYDPupGLqoWEIY3wWSl/1aprnkZ4C9WjaCzQ47ZGsOAqFFRNhddT3OmMdStazhxhug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224121

Hi All,
=20
QA for yocto-4.0.30.rc2 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, September 20, 2025 9:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.30.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.30.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.30.rc2
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2410
>=20
> Build hash information:
>=20
> bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
> meta-agl: 8ea88240e6ff89b006da04923171736fa07bb84e
> meta-arm: 10c27f061b22af78e17a23cf540b69501afc7160
> meta-aws: 66cc5b4b07a1d4aaab5eea0fbfe1e311ec674fbe
> meta-clang: 26de1c560ef3caf3cf641cd54ed0b7cbdc219ed9
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 5c138125018fef4b240e62b664a809d19f4b26a5
> meta-virtualization: 5429fc0f5c2ebd7187e54913220f579417fcbaed
> oecore: d381eeb5e70bd0ce9e78032c909e4a23564f4dd7
> poky: 51dc9c464de0703bfbc6f1ee71ac9bea20933a45
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
> View/Reply Online (#596): https://lists.yoctoproject.org/g/qa-build-
> notification/message/596
> Mute This Topic: https://lists.yoctoproject.org/mt/115338850/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


