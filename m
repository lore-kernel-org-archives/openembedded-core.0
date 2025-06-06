Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917E2C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:04:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.26299.1749182665215388743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Fsxj83ml;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749182665; x=1780718665;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=do4i+z8T+iJju9cEdtSulTRJOSp3AYyeO1NdYJE3i1U=;
  b=Fsxj83mlho0cHS9m2OJhaf3ESf6P//nJej2AYLXcfMJ0wXTznzVuI/qO
   /1yKN4jjSLJLw/vtz0vmCfazYWCEUtjK1+AIMSUVuvEm36F2CAmjAF2JO
   nMpy/lvjzRB6U+DluVgotnfaH9A4lprjSRkAHIkSmLoEyMURnDlN4vjYX
   NwEDQyZWrgliUthK21fYhtIyRkXg1IJpnTDF8GQOhQHGumQdIOp2n+J4u
   gtvOiTnyYMecsy02WN1q1xOAcBfJFzLRiDudB3wvVjcr5/0GyaBnD4Q6v
   lQ8/PJoYh+P5fGNma5sEuTPUueBlEyG/URBHfQxScjq10nhetMjGRcLqk
   Q==;
X-CSE-ConnectionGUID: KR7rkC13QS+aQFOg24Zgow==
X-CSE-MsgGUID: 8yev/Z9PS7mCixUf6VVRNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61950417"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="61950417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 21:04:25 -0700
X-CSE-ConnectionGUID: SbGmn9qlQNuJlZ0WhWaLhA==
X-CSE-MsgGUID: SdUqqwOpTG6iIWDzs02YYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="150730417"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 21:04:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 21:04:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 21:04:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 21:04:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVyyHgCRTic0mdW/0qEopPEsn1J4QboVR4AI+FqnsjwNMBxD0KvooWeuQR+g2Lja5zbwusioHnXPilix2wTZoFKVPcvxnZsD+Lm7zSOIgjKI7GnVjtekRqXlI93l30aqg7fbFwja66AsnivW5TxlFblP+joclTUMYGM3Q22rIzPiz1H24J5IpORz2i65fdIVgYfNYh5YV/oLrrHa4fc9UkMMEx9wh3g3hrumHZO4Z1I51OSInpRNbak4Cnqzlysg3ZJVYWXBGhgXWQ5PSjG3WMUW//5fDIJ+FqGBD8nFxvKynhmerQ6YfONhWZY0aT9t2rKYW5MZDa+IEvtJaG21og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2KNlbf1Fb0cO+GUezqYp/gT0UKyTrojwU3jlxtvXmA=;
 b=meL2E59sT+gRgN2SSE6loe96dbH16Iq1iuQgN4VK5gpKKKGH9Zek+6Qtk3TaDj9t6sl9UgPES6AhqHGZiu7eFWErR90D3VhtrUnK5VnPFCDPSJGUFsxRMXs6mWaB8mhZtEPi1LJJMBot8t6RyXaAFhyR0ne5Vo3HuQTX+3WVRwbPx7JmxNTB3ZgHVnzlMUr6nbRldNDIK2b3cc6Hj8vpGfPRCjJLMhJAX2jjfhqFeQmYn+kZMcIthaSb/QUL/HkHTtyHTOl7UmV3W8DfQLWbgE5eK4z7L17D5y2+S7bvnA7Je9jVB67BxwUENU5b8qp//lFmlKVCy8d4Y3h9CKfPjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 04:04:22 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8769.022; Fri, 6 Jun 2025
 04:04:22 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.10.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.10.rc2)
Thread-Index: AQHb1B0xGo9q7ODC70uGnPwsAc7bF7P1hdlw
Date: Fri, 6 Jun 2025 04:04:22 +0000
Message-ID: <DM4PR11MB77604A6D8E8ED66ACB53C2A0A16EA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101973328442e-77dc9a4e-4c12-4be8-9021-49468ec66a14-000000@us-west-2.amazonses.com>
In-Reply-To: <010101973328442e-77dc9a4e-4c12-4be8-9021-49468ec66a14-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CH3PR11MB7276:EE_
x-ms-office365-filtering-correlation-id: e260f76f-0cec-473c-80f5-08dda4af37ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2PwWiphLMgkZBq5cpR3Y4Qo8deLD0v2k6qomGSBBSkY4VYXXW4GvrYolEi18?=
 =?us-ascii?Q?g5zn8aRJ2p6MI5m4yPuvjL0DRNxRSt7NMp470MRXZMDkqbBZxyynPkhQPJ63?=
 =?us-ascii?Q?Q+25ZROoDsHnwnzMGOEbSOmPXXW7quQEGsdpZ2CcClHEit5yJNn5Ccxhbeuo?=
 =?us-ascii?Q?Ro+DtChCdyw/Nrw9dQIhhkfO5X+aXaGUrnWe09j2n1ke1aGmt6DbquRBmefc?=
 =?us-ascii?Q?MeQG/UbQg7urlPjRqNe6+5U4++6dWPa/XXoY0Q/X8LV8e1ua1BwWHAR6MXXf?=
 =?us-ascii?Q?g+JUXVAZ7DKgNCyHEhZVVFoehRyZxwU88JjKW00yr1KAjSDhH4PlxOsYKgud?=
 =?us-ascii?Q?X3JhHzuhIC4Z5arN5pMDEbIqkHWK/VfR0ac+S7muKM0a4ZeMasL9OI9hDs7U?=
 =?us-ascii?Q?3XfCWBjwj2e3DCvG4/3ix26DyuwYquTEO2jFPmvv5AQBDxHUPI/oxXKZD9w2?=
 =?us-ascii?Q?SH+U0yzTZZBWaKRnjWvpg5Ew/VcbFV6m9yOoLgOeOov6UgS9r/lHL7Rox11l?=
 =?us-ascii?Q?xUgmCxSt5cfU2LdTBLNEFVpI4f3v4/vShAN5fb7kUqN67N2V0Z9zhG8cX3/s?=
 =?us-ascii?Q?e1VZN0TjefrMTREZgXX5xroxunTzeceZYB4fLfAY44EY7C5xDT3dZNUx6lmX?=
 =?us-ascii?Q?ZBQTN0pAeHgpmQQtlUxCu2WmJjZYQ9hIDW/caxxT2vvVonoB7/NMiAVS7Acv?=
 =?us-ascii?Q?EcnU+UdSufDRrG9jMz7RFyIv4aQeaxpBBVppbvp9QoaziowcGeOhIl8N+2ED?=
 =?us-ascii?Q?UVHLVPHb8e4z27OxznUq14dtakffDoz5lZTUJm+pAlw42+az8vZgvP81si3F?=
 =?us-ascii?Q?B2uYWA7Jc4Pp+PO1wN/UkGflUIX2Mtb2qfQ5a7o4CDdARyhUuw4zUupun6GO?=
 =?us-ascii?Q?LZ5n/83s0qmHlbKJQGtV6W7T+CB2dTTMzULOf+Mm7xJLaBcgcJxOckPajO5J?=
 =?us-ascii?Q?g3PVT1BCYTZ0wU4uM87m5mNHtI8rlLQwoE7g0KVgmp1CgDiKL0nOc2D0B3cr?=
 =?us-ascii?Q?Hl4/BjqwBeIAS3omot/uUG1sj3ROalQKcL7oAaaAJKCwjy2rUt0qaQ5rlsbo?=
 =?us-ascii?Q?Lt83eGpuOFUahuCKY3uy6KSL7g8dpFc+/UqQbWMjvMqHY6LK4sRp0PY7juKP?=
 =?us-ascii?Q?ADcSDzTqT6g/ZI67U38yOeJHoubh9kYDVfWCdsBtlp5Tto7U1xH4bRCnnP7p?=
 =?us-ascii?Q?PGkfhY7VgBaFlD1yGmaJ8GEtpAC6+Yjo3e/E8RMVhOzp/REQbz7G0FytoXug?=
 =?us-ascii?Q?MEpGIx/Yx9/Ji77Eca/rtdh80m16P91FWdWyZq+q+KQc+AGMXiS/JRvKGxVE?=
 =?us-ascii?Q?w2pJ+bTtoyhPixJPcnxBuX1Crnwi5Z+QOF2JBL3F8GZSnJbzhu3SnL3wya8Z?=
 =?us-ascii?Q?TQ0YcoDAKnVjDMJQzMAHWP/w+GEc84UgwtuSBdM3z2RSoHzppQ/u7bYlkQug?=
 =?us-ascii?Q?lL+zix98bDA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vO4jJ01WfKh26f4csxGkUemMyMfW/3ovenNR21rC8I3CaROJbttWLGJNoSXt?=
 =?us-ascii?Q?Iln+j/Ssfz5cK8fJCbCo+qW9vEOi/RL1GBMnM+6hZHsX8zXMN4Hbe+l07RQh?=
 =?us-ascii?Q?RtRULF13G72O7qxRK7Lu2IyElu5PqqYs8y7LTuk68i4UXoA7P7nnBHysDEJu?=
 =?us-ascii?Q?NLWl6qgSnZmo84pgIiKmeD47u4BFxdRouvfLfVRVpmPsuHl9+S6Fbm/uk4Pq?=
 =?us-ascii?Q?BzTjXtcHzK6/LZlRSOu6s/Jn3DBn1kUDW4zTGm1Va+KBXFhQfyYmzWG7KqKt?=
 =?us-ascii?Q?asA81GSMSyH+czmZBscGgvaNThxCpF2+zQNLXVFwul8oZSvDqWAT8al5Yf9f?=
 =?us-ascii?Q?Sj1CkQ0VX05S/WmlwOuWw9TIVjTwGffovo77ShwviLmknpTuDbompDYLxyaz?=
 =?us-ascii?Q?3fHBqGHQvIWGJ9HsxuKz2DcSPpqo1fegCSloYXm+xpOgUQI8b/3FMsfuMA7H?=
 =?us-ascii?Q?ZIeOIG82aOz6g/kQhOjfxngXHJp4qMxm6vDCZXHJ20UzVd1cQLpO3+kfNMQ1?=
 =?us-ascii?Q?0ODKFZzAtoFW85+7vFeHHPBeuye7JgyrHM7KMPd0sds5YTEx2FcyoNs+QPjA?=
 =?us-ascii?Q?vGgNZFJN1r8S6BKaqkgGeVFZ1N8IAfMwCtwDu/oAVj5rVUqN11YbRSGouABL?=
 =?us-ascii?Q?9zXbMnBbX3cJBOuR8YCvPYj6a1tvyNMKhke+cQuaOOLedgEIVtw2RNLeuoyU?=
 =?us-ascii?Q?eiIscrHm7CryZ+ZAA5j9bZGCdU4RXt8jj+tHlBqJPBLvYD+lDaMuzpQJ3bwy?=
 =?us-ascii?Q?X/tgOOmTrfKz131NaD/31xrvhzyWAEGL1XSoC90ZjIFY99j1W4BU+Zz+DZzI?=
 =?us-ascii?Q?7NSdWRXrZq4EkAwX0ZNFcqDYCMArx++799bjpRGm28+RmLtZQjXVT1rgTuKQ?=
 =?us-ascii?Q?HKon0ZTFP5k5SN7nedudAqSbRehCSWLftuUTga+zMmAK7NDjKZYWdI/lEJHR?=
 =?us-ascii?Q?DYpi7a2+6ZKupTYMxG6UkIM4gaxV/GxnnaCq1ueC5OsqTlBJ9RGlnKip2K1b?=
 =?us-ascii?Q?9e++LsVaMhH5fkc/bUsedw395HlTH90em9BeicMOOQiEukNSksOkAsLyBDu4?=
 =?us-ascii?Q?SUcQxOYxN1NtY03GBp7f05jcEGBhp5pkGNt3ic99vTUSn4j0iExzI7UyK/aG?=
 =?us-ascii?Q?de0WHQIcms5um9VOUPFQr7Le12aBJJsxgA0N6EO5T0PyPxivrygzfb0MqED/?=
 =?us-ascii?Q?XptOkHV78EFvobXPzdW90E2S1CNd5v56dx20OJsYv264XWgM3dLKWgdEUa22?=
 =?us-ascii?Q?Eyh85Cdr8Jr8J3kcdtMfumrJfJoB8Rr+a8Nv5XyGxbNugkIgJXZDg5Bt2jDw?=
 =?us-ascii?Q?ANjbChq7WiD9kDkq/9yRFYESnUstxa4ahl8l+n/tR5RuYlj29MuQ4OcRV937?=
 =?us-ascii?Q?TwREBRz7lmTvh+vhmh51P6zXoHigKWQrcH/rAfhI2NuBX79TsKb5TKpEip4D?=
 =?us-ascii?Q?jeKEWdrVQ/Jh6QADNz+8NIU40mfZt4Lzyudwv7N7hrsTLGBEVI2v0AOeeMoL?=
 =?us-ascii?Q?nHlm3M1AsN6bmyCo0bPZEM5BZlzSkmrq7ib6FowxqhR3FAwxe0w5lLBVcZd2?=
 =?us-ascii?Q?JClYF3fefCTOn+ekHOUNSgKLCmb8Tql00d4dkYPl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e260f76f-0cec-473c-80f5-08dda4af37ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 04:04:22.1618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OattiIncbVMJcMnfrFdF2VMqCt3l+6IcMqbmUb6Mb7QI32UbrDMcIHeqccaAi3jy8qAll83xONKqOhRCboPV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218091

Hi All,
=20
QA for yocto-5.0.10.rc2 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
A new bug was found:=20
[5.0.10 RC2] Fail to build libsoup-2.4 for beaglebone (https://bugzilla.yoc=
toproject.org/show_bug.cgi?id=3D15893)


Thanks,
Jing Hui

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Tuesday, June 3, 2025 8:19 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0.10.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.10.rc2) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.10.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1707
>=20
>     Build hash information:
>=20
>     bitbake: 696c2c1ef095f8b11c7d2eff36fae50f58c62e5e
> meta-agl: 225c289b7245c8d9a896709e924dc0e67eff1e1f
> meta-arm: 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
> meta-aws: 584e2a00acb65eaffa1d3b9058f0301d982a4f85
> meta-clang: eaa08939eaec9f620b14742ff3ac568553683034
> meta-intel: 38e75c8c1059e5f37659c140c010eaa203238fd2
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: 491671faee11ea131feab5a3a451d1a01deb2ab1
> meta-virtualization: 9e040ee8dd6025558ea60ac9db60c41bfeddf221
> oecore: d5342ffc570d47a723b18297d75bd2f63c2088db
> poky: ac257900c33754957b2696529682029d997a8f28
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

