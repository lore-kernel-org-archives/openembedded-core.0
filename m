Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A30C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 15:46:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web10.63907.1722008790067835924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 08:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=btU+06i9;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722008790; x=1753544790;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gJ/r1h+cYG4UuLMyvPkWCa6AiUzRCwZdBz56/+Siu5c=;
  b=btU+06i9Fcd2f1cd0/+q6JQUW6f+L5PeY+A1Y9DWHccZgcXNg37naSwV
   c7ZJvJluWLP9UwbW1l4GRwsmAxPVnYPQ2n3DKFZrnXS6Q3GzQ6wEMJPnM
   rOJQvjA8Q0+xj3BmbNwaMqe9RzOBqXVa21njAXFl6CuuG3q+NA90RoLvc
   2m/lwcDlHUPFdslcvDp7Z9kE0LY+X4Oy0PFt0FEKOQiB79SGxV13THZlH
   3QV64m7G3aMkftsrW7yNd+Gs+nEdRs56XLmD4mQBhSXsb8J9E+gu9x7OZ
   kOU/1+X8YMHpV0BiUd+ssJFle4PsubXZSxC30GAPvkZRFKxj2oIaTr3R9
   A==;
X-CSE-ConnectionGUID: 0qg2PHOXTXyirLuOECYxcg==
X-CSE-MsgGUID: OA3Z/EuGT3KIqsf2A+3Xag==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23662177"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="23662177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 08:46:30 -0700
X-CSE-ConnectionGUID: UvdkwGinT1qsJWlIrwX57Q==
X-CSE-MsgGUID: Xy/zBcQHTEGaGiO/tAhtfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; 
   d="scan'208";a="58404498"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Jul 2024 08:46:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:46:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 08:46:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 08:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOGCIkg+Ty6qomjUlxv01ZAEABVLMfDlS62GjpNOGRiOheqGKXpn/d6MTN8kkh9JH+Rk+UGe86vmijkzFFwN1BVHiDaUelZQFpCJotydMm6WkBlxcuTWk248QaRAp8twXMbOJ0jXDUBUn1nUZfifpv+Jsg71xgTyGowUn2DcYs4TMw59FgTjNGxaypM4/9DY8FThA4r+rh9EIz/q5LXSyB9qAHmd+mTaSRc+D6Xy+FGRF8At0GAk1MdhosYbOWraqnERhoypDuJeAw3jwbi2gW/YPxA5u/6lPpnV0o4XHwxgidEK8jGD6E4H94I68yy7sRWedNN5mhcmIXxaWrBd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lMzkOfXYMVppDvKZ1+04YrQiSK/ipmFHZxnG6rCcKk=;
 b=kIs+3FJt8ufjQs8SPqRhIbgJmrLF2Yql1k09CMpYhXcqmUKIEkBZRE1ynbFO5PXFnEOHj56FdnBTrGTfQsNECA5ckFc+FRldf/c0/EMWRBW615hUYOviAEo5Tmtrx/OrOOKvkYaI2DGS8gD+j2Jell6EmAGjkM34e2I8Lg4WdPQYJaIY4KaYuy9YlV26bbTReOoYUIAPpS4iyA6P1t194gPSg9w/wc2r9Vpp8iLl3XC9RRLBnZ0DGHsEgYDzVFqf1DvW/9w+9q2m9VFPd4QFOrR7ez1fT8ig2cTpjK0+otH3TcyTy1y67es7VKt/NFzlQh0ijz+gDGLipsoYSJx98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY8PR11MB7195.namprd11.prod.outlook.com (2603:10b6:930:93::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 15:46:23 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 15:46:23 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M2.rc1)
Thread-Index: AQHa2AQx8ch0dv4+z0aOOHyncPiz6rIJM/mA
Date: Fri, 26 Jul 2024 15:46:23 +0000
Message-ID: <DM4PR11MB7760B180E51B8A7E662FC4FEA1B42@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010190bf027a1f-d75a0402-7be5-4a91-a98e-e1905f9e0340-000000@us-west-2.amazonses.com>
In-Reply-To: <01010190bf027a1f-d75a0402-7be5-4a91-a98e-e1905f9e0340-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY8PR11MB7195:EE_
x-ms-office365-filtering-correlation-id: fbef334b-59a1-448b-d021-08dcad8a19ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?403E/sm0aoms3IyPT4sjRG4/d2vXM1kuGM/nmEOdP3045Gg4YJZyZYdHFjii?=
 =?us-ascii?Q?YCbQ9BLmVS9dT+5v/3MhG/lOr5U+B7WS40pM4ViLnqFg8WeNg6fh+tIZshgr?=
 =?us-ascii?Q?77oTdTF2xLzTQgPrQJ0OJWLBHqvj3vGeiyJytE3ySkez/nLh+80PgAASMtMb?=
 =?us-ascii?Q?cLCKDbjYn5+9Io0n2ywePfI6wfZzt0fYyGb9yF4cQZxlMYHHJ093kOxYCgK+?=
 =?us-ascii?Q?UyR6Kb1Etr89Rc4PROzC7dKnalXcyjA2Z/vzsF/5DOD2zaoUCJar6rahIflb?=
 =?us-ascii?Q?SHdrzS911tkbabwa5jsVOx0ktSHhq+ENl1kZoFYxQ6DuOEfGv7ZXWWWET9xA?=
 =?us-ascii?Q?ew+tcG0gN6eB400ZqpobqAH5P3gSmmrbNByA4fP3vp5frkIB5GtcJCgv4TiZ?=
 =?us-ascii?Q?+WzwnQwJ+SIQbvaHvg2VndHPZGL06HLKvqipjs9d3pXrnrvo+0kzxuwdVLEh?=
 =?us-ascii?Q?20XxtuuUsJ53ZuVUfuMmzX261HE09Hl0A215ulvj/IIp2lAcsu13wF3fa/Zh?=
 =?us-ascii?Q?oFdX3mhfQaO+q0xdgKp08rmM+bYNFyqav1DWT55Rd9UTXNy5YKrcGtTIdNq1?=
 =?us-ascii?Q?xlR1+EoUnT9n0zPjuWIaGpuHyQe4gxKdQpKdRnPKGxS5JlFtNCTwJvCeP1T5?=
 =?us-ascii?Q?SG/wwa7dvP33AVmJ1CTlGv0P7twdjcwUM1AZcebiG+RkB9MlKjy85szGspQu?=
 =?us-ascii?Q?2Hs24jcaqDZlAym00Zex5yk4gymsMTwai6EAgVN1+8emo1Z+8wSVEE/1pcro?=
 =?us-ascii?Q?QvhtEBk3THHl4ywT82taybflu2ikl+H4fHV8lAMvIlEquZCWMk2f9QtiTLTj?=
 =?us-ascii?Q?V/7ibIDVMa1Yv9ajXCprnpoDF7ql/wcsBheQD+stb6C+ZLfqbTtzUywr1ch7?=
 =?us-ascii?Q?x4sqFnQoPfrpX7np0QrxPY1O45PhJKH2Y8+bDaDjNwBXNRA4dyns7Zjr77wA?=
 =?us-ascii?Q?prDW8o/oydQryY54hU/w6FQZKAz1cQ8xtJEF7XzVV59aIQPCApS9Y4WQv0cp?=
 =?us-ascii?Q?oqsFqd0H5qjFCmFb29a8MXoV3DfHbqDN5X5eOjMd+PsklCAQilApv42MHCMe?=
 =?us-ascii?Q?YhutGVPr5zoCOuDVMtu9yPnHaRSBlC5+YFeVb8qSeGWbryF2Qcd1NJkQgPVk?=
 =?us-ascii?Q?XfkQ/q0q2o5AGXCAsgwlzoWdLXo3uGtc33vzesQ63Wqw0KJdEuWm7x/zpUie?=
 =?us-ascii?Q?7do4NPftu0fOlJsGEtKB6xAGouOI/aynynB5sMndpn7V1SPtFrG1AbhwjFHp?=
 =?us-ascii?Q?JjAQLWWaqxrtJLuDUR/qu282+zQylNuvRDtdzxlKe6xgI/6DUL6NH8D9I2x0?=
 =?us-ascii?Q?kqPNpE7lQDMuOgYEuL67k2XBT0LF2A4Qtqf9lHY72kYq9okibTR2GrnrZW/3?=
 =?us-ascii?Q?+6wgdfk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LBWN5gfVd8m72AheULuf0+JMzOq+XYP+ghXokat7OQC6J7KPFqpR79+VW2zV?=
 =?us-ascii?Q?RyLpozk1oZ6rqng6e7xTZyagPkL0cIh14qTUz8v/0ltEp3ZeuiFjKQn1pfbv?=
 =?us-ascii?Q?IqYOWMsm0Z164I70C0mABOra+aczxxLAuKMoSpncIFYqqfInVP5ycQwKpQ54?=
 =?us-ascii?Q?yIsfdu3+53UMHnMmYohfzvzku6AfQxUBfouhoaU5mD/SEREZqPZCQ6gGpncn?=
 =?us-ascii?Q?PKq4ZjL08/rrwUDEPoCyeSF8/8sTgLXSDRGnYg+TvF9gTVUJ+NZAN1BNTLD0?=
 =?us-ascii?Q?ztC5/mvcMSk+ZC31eNe8FUHETdf1tTHqF/aRIJg2Y5nXNmMe1SBvy/Xj57pj?=
 =?us-ascii?Q?kx1lVS1jyoVouunIttBAGnYctSn5eJnyFM7zxxHNTj950YGIn4Pdm+gcHlnA?=
 =?us-ascii?Q?0MRqI8LlXbsiyzK9l8Twjfqg1NwSxmycSWP9eHqWsSXnxu7Kq7usJimDvV+l?=
 =?us-ascii?Q?lWXvW8BRczu5Q+7SmVThBVO81TOZFqdws4PE73IcbMFWu3T0xWgQjYFGs23X?=
 =?us-ascii?Q?Rvrw3QSwCiT/6GVAX5bB4IdkG6uB5HsNCN2ML37ATbw+tRorINh9IkttlRqm?=
 =?us-ascii?Q?GuH6pfvb5o5eCR229ULvI3YNaEMnb9sWLqpKxuSVBCUBVITVUxAKDyRHHRkY?=
 =?us-ascii?Q?xPvw/zvUVzXxJ0I/0wmOUtJy4LA2Ajd52rJSW0vWHDdEcG96M5XdNyaDp3Ij?=
 =?us-ascii?Q?76jaS35OpWTFfX5haEQ3SEHQec3xFDpwz+SpcFTzQRrN53qWzbvt+qwDpwuR?=
 =?us-ascii?Q?/9qM4zeEKjaWPDvkDHq8YmBOnw4wnHqYXi0TMJ+gttQh58pndIUkj3aWziaO?=
 =?us-ascii?Q?ZY9kwScJaeTWoyhQFtNQ2rPiFwrrUZ3EknUSwAhH6nFd96ADnbdRcN2duXMe?=
 =?us-ascii?Q?51OJ5ntcOkEhCectjvi0SVE07xqK7QH1QeXERd9X7a6lGPg2OHzhlguClTUx?=
 =?us-ascii?Q?2C4MNAaMol/hQBFD5bxcWZAecTxZZgRAHU5s8I1BYMmT6PUV2bfo3nuRAaKV?=
 =?us-ascii?Q?bHFiuSWNXrj095e3wYn0tGWEv3UUkBtTI8maBvbm6R+M0QlmZS6t3xNgWVSD?=
 =?us-ascii?Q?2CefWCqbNBVmK8NjQ8jlA6EbLIkipEJVHFbbpFOzY8+5CaalhJChQTm0aNCf?=
 =?us-ascii?Q?j2a2FRIhwpqc4YplMOMV1CDKF84+PjnPXnEAngBFdvD7p6OosI+NzrOqctUc?=
 =?us-ascii?Q?Rwj9c9rjzn9R5880uvjVklnMYJDtFfkJ/IAsrKb0D3Gr39GfX7uWqAJvit6H?=
 =?us-ascii?Q?Yn61zuZy9IrB/g3MtuQbvKfbRCBdha24Bw68KnAZsSvzT/D1XF4y/pp3YRtG?=
 =?us-ascii?Q?lESqhFIt9Fp8XmRnhYWOL+ajuyCAg+Id4aJkiYeKhaQB+MlBGzDAYlGmlVqf?=
 =?us-ascii?Q?deAzBm12G3+4LlknuQHu2+McVYJmDsBZFS78WSfHBGmoGYqvuzCHAn613OGc?=
 =?us-ascii?Q?HE+mWKwt5+ef1RqKFUF3yNtSlR6v1kUDcczAmBk54NLqPUwkJnhmrxX6YDGH?=
 =?us-ascii?Q?IZZCNp7rIFuubdDLgE4JDPkNqH16pELIc67JCqd26+cJC0LmJZMh/kcGd+zo?=
 =?us-ascii?Q?2P/MTzpt1ASTzohjXJCwWm9yR7Y5vuu7lofRj86B?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbef334b-59a1-448b-d021-08dcad8a19ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 15:46:23.2656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: InqXBu7rR8t0LxHSqk+IdiHQPOBKxS+7/6SawPWKEgd0fuylokymRPNw8RINnZOnsGsmQtP4ywWqXM0KtI1qyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7195
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 15:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202543

Hi All,
=20
QA for yocto-5.1_M2.rc1 is completed. This is the full report for this rele=
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
> Sent: Wednesday, July 17, 2024 12:45 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.1_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7144
>=20
>     Build hash information:
>=20
>     bitbake: 1d7360031164f04887c792fb0b2dd86c6ccfcc23
> meta-agl: 3f3bbd3871e5a7a4e9e275e2c957b98515cc30c3
> meta-arm: 14d24b5526298cdfd6db65b6e11b54804a6a553f
> meta-aws: 4d048eacb5cbdaeb3f37d0427cc8a810a8ba7b69
> meta-clang: 1fdde55d951b7a8f1e537ccf56aca2dc90c40091
> meta-intel: e97386254712047f27f5554da6470fe3fb65d07a
> meta-mingw: e4d377d5ddb62b265536bd33dbccfbb0904f8701
> meta-openembedded: f8342855a440fa5c4194fc57285e8db9e034fcaa
> meta-virtualization: c138943fed29e768df990061c30d6f071b98ffc3
> oecore: 758508614541c68dd6a2b7084e07287c71f40a8f
> poky: e18d60deb0496f7c91f2de900d6c024b45b7910a
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

