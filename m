Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53EDC282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 08:31:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web11.48689.1740990708069110371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 00:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=iqZLS4Gg;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740990708; x=1772526708;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3+AvAtibjcvFA+vQSmmZ4FkREOlzVj62vVmgEYzs6oQ=;
  b=iqZLS4Ggo8CUg5ARIMDRGH9Rtlb/7THOFP0S7tzeklBXDWgD31vnugNk
   WNvX1AzR9rbUV8LWrkeG3CwpKW0R7EB66OrjrcvTjRVwcoZJQv5yh+pTU
   wMt1TBdvWSKyMnYNCUWuvm73/DD2R7hzcpREWQkFjnixtYdH9y84T9S2E
   WzilS6X0oQErPT6r7jryBJZg1OMrs7geEzHnLONH/AKJiaJNs8vcdYBBQ
   xxhbOdl9w6lpk56q5NgrFnTVypcHUJxZZLfK72ZIo5/0bgxpm7qcea1Mr
   38uI0pUsMCZ6NXzMbWFf2ikDA6zlHdVxMlnQuIHQ/IpHR8N5pAtzp+pD6
   w==;
X-CSE-ConnectionGUID: hRuYx3ioQlm2+FBegMAMzQ==
X-CSE-MsgGUID: 29NC//USTD2DSa55cdwCHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41742124"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41742124"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:31:48 -0800
X-CSE-ConnectionGUID: 9ADuFoddSWaH25YSBEVvFA==
X-CSE-MsgGUID: v56j9OCUT26VhN2dLdZ7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148842330"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:31:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 3 Mar 2025 00:31:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Mar 2025 00:31:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 00:31:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mj0/d1r0Q5KZSRpX6iDmFOLo1o+63jot2GrTh3u1x6U6/T2DylgONEN19y5M0JE+U6XqvwAAF9sItkCtt2Bih6NUQx1IBkgsIvxJYS6nlPcuxGPaeofc4Nd0gnKNJbmfX51fxg1hKimZgafT+oUPanbVgh+Y46jHnroY5sCMqbtQr4bWzgQnw6oS22XcsrPGOOn1zPys7NvBz1hNpSON5NBTdNtmOVqazxHCfRq3d5/MRnv7STpr/UNlPGncVKWbKQsJEiNkIY8xsbTrV6fctZAZ5VnNumZSrIoKVv5KehQDZOirjYZdyPMAAl772kbfELE8z/52hMWrZEETlEKbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LNBrbLBHyPiefMNdqFoRZ4kndvod2RF2PvVzVW71Qo=;
 b=unBjm6rHsXbrJn6TZapyTLwUqa5o0urm/Sfbn3RN4LDUyoJCzwcvXYOaESwtz9EJT9pv99CMVSI7uX6BqLjmdH3nNFxn/GNgZ/X9xIQ9GsxrAg6LkGcJfcSF7wUMSA7Mex2lhO+cxAEFUoqTRgWVjCbkocY3U3G52k/KViflygm1bYrO6zqSALZXRcBKQvTfZ74EIxALo5Vcp/CZO+86dhzfVJvckQBZEIOvC2vphKEiYu8wBzdqR0yLKtyAKPG/CnsumO2h6r9CpwX2pvMPbgXK5HadP0g/jhJBfCFxza2GNqPGUZ1Uv/R/Rv1rOCDpyc16SrB9HFH4PXcvDEAoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 08:31:17 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 08:31:17 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.3.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.3.rc3)
Thread-Index: AQHbhtspV1YnYOKCik6hPKekcOBZQbNhH0vg
Date: Mon, 3 Mar 2025 08:31:17 +0000
Message-ID: <DM4PR11MB776003695EAF5678232A3034A1C92@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019538d6e616-8b7e7ff9-d683-4a53-b124-ff4ebb179bf8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019538d6e616-8b7e7ff9-d683-4a53-b124-ff4ebb179bf8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ2PR11MB8372:EE_
x-ms-office365-filtering-correlation-id: 9f7f1536-f42d-403c-094f-08dd5a2dc45c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?T112+MKfSq+KZM/+SQxNrNQvV6tz9xrTZgRczH6S49KHg0jpmO0WAhgU0VEP?=
 =?us-ascii?Q?HP99rWsfxQ+vtLFKf76En3RaLjDkck4Z/TgeCAW/gwyJXReGl91e1mjCYLJL?=
 =?us-ascii?Q?Qe1gH2D4lJZoWgeyUYLb8aQtClVLCXvQKhcVoqhoUnICHpbAqGrnaFwFa09/?=
 =?us-ascii?Q?4d+dAOp6Mct4wWPpruZiKDYDVN14q2vGa+LS6YcTKLyWDt/MQKmBzYO6Zzu/?=
 =?us-ascii?Q?SLOlrfLInVMU2PSxjtQX28EHDhbVl2bTgGqMMQYjWH+vP1rb2BjmkKDgqFyT?=
 =?us-ascii?Q?ANEVOtWjEBSbRoAZkPpjMo8MZMk0xJ1q3nfX3QCJUjWIObANMUrmGzL43+Fv?=
 =?us-ascii?Q?vH+PESWqRoN1gfVnJmaUsYaU+v4OHWmgeeEG9gTPN96eTnm7+cn29rE6rPo9?=
 =?us-ascii?Q?Z0uGGnvcw4GZcgEYirI/pgfC5IUGbgJgIbnehJskl04z3r9LA7pAbMyj9Z5q?=
 =?us-ascii?Q?zLHsefCswDvbPdBGUnd6T1A9sG0yijcf8hAorwKmI2Nk7CNtu4FzaxocBJZG?=
 =?us-ascii?Q?Rr9vLeBEDwLbz4D4uUjWGvmym6/IxAjfmfw4S4zR05Xh+oxNYYvpq/avB7AA?=
 =?us-ascii?Q?E7pn+bE3Ax3TbAlCz+MxANncCGnIOj5knCA+GMJzsKa7TyZd1d/cW4a3y6gx?=
 =?us-ascii?Q?+XddSIxUQrL5XdwY+odxu2ophyvo9II/kdtrHX80zlvRTpGiQXANmAMFqezD?=
 =?us-ascii?Q?p3AMxIhytTpswjdRU3NGQkpNaQfHUxHTirWNvgo5S433qTowPDQ32vqSUNbh?=
 =?us-ascii?Q?ahJ7X3Ng7/0JLlO+tSaohekhrt/8xaZRLny8WHuql63JN8DiOvEq641Z4byB?=
 =?us-ascii?Q?qNhVV5V5fTuhNskQJ430nzDWxN2yV9L9Lo2vjf1CQovcdcLm84QSCIWsqlbk?=
 =?us-ascii?Q?yx4exXHnqGeEXXpwGDW9kyNvZoquKo90nlo2RaUNaz7O+MKJi/Z9HR7kmaY+?=
 =?us-ascii?Q?aqJQOsHqY56pmgcqDQ+z6QVQye03ctkpAe90upjXvuXeQkuhuKElf5BASCkS?=
 =?us-ascii?Q?a6xxGBTOccqZ7TorWWg2W7uSdJB/21A0dPZ8BExGdDCeor5mfGPBMk0MCm48?=
 =?us-ascii?Q?d/3c2va0z+LnQLbqJPlAGEzxlwO7hWc744tcihAqcQhBvqrIXm9YrkjTXkAy?=
 =?us-ascii?Q?yVwnP/AxxK+D6Fv4hViRELw1BJJL0FgoqkOgycnSRCLz4VFVL1no7vBUdhka?=
 =?us-ascii?Q?vpG70sKbkszu5vh7TUmEYHSH7pu02wrSGOgTPyqzjOoH261FIxsG9jtk9WPr?=
 =?us-ascii?Q?7hymoVVIVtC2LG+o8oK0pDKT0Fa3zUtlCyIJKrWfswfc9SPHm/gy5L0qIBET?=
 =?us-ascii?Q?05+EYCfIlaUELfXvpgRwf45XIJpQQBhpKBp/bMp3iEKpv6qH7WI8R4SoYR5m?=
 =?us-ascii?Q?hc4QsX3leCM9wl4XuRhSOQTFeSHF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mSk7+TUh/p1KpekBTuMtS5htTLnyDk/gKb/njA73XCMe2FWaaGjFlQ8vyGTc?=
 =?us-ascii?Q?9j7mcZrAg69ioRL+jUl+cjLB8Xa9Gm7+iuiQTIKykwUnOxFzWkeEUaidhLQK?=
 =?us-ascii?Q?aFHkx1BycUS/Tynx+Cnp36at49zgLd/YW6C5Kerzgyq9Igk4cArIQqp4Sm7f?=
 =?us-ascii?Q?r3CP6QQ8vlFYyOHTA97KTevo8WpQOcYhthpRGtRx0HFkt9b8L513uoHtWMM0?=
 =?us-ascii?Q?8RD4x/6R/BvzQDwt/She3usT32gHjzfPsuzDB3EGpwDFL9AlFNKvm5ayDSDG?=
 =?us-ascii?Q?y0B496Ximuy/WSQJBM43CydUVvO8l2FpqZfc2tbkLJ2VcsK3/1dFduULv+sS?=
 =?us-ascii?Q?T65OXdrgE5XmDOrdeCCsoqWlICCvQbGola6GmL1RgSjqCfIERms6thrGUKOC?=
 =?us-ascii?Q?ZisceMbbDs7pWJQixx4jkhjChIR4k/YCeWWuTrqr0ZNr56UrD5jF+gZmBvE7?=
 =?us-ascii?Q?9+derpq6WomSGNsWFMYyg7d3+iVJJtujDqZcyjIbtyzSlrPwSHlltAxOBhXq?=
 =?us-ascii?Q?hYnwmpnzEMWfDNMd/YIA1D8gLMknBxfOEhY5ChiH2y9TJCpu2SilUmt90w46?=
 =?us-ascii?Q?RlpjAxhWe+LAmNGJZd5WgSLIhyN2NpOgYtVCvoIkUE0zLfgZjT2+4O9MYAYK?=
 =?us-ascii?Q?8+daGMwo2lcCc842pfE5lb+TBB4mnqM1Oz0RJVtIzG/tg6H/oZ/ebO10J/Yr?=
 =?us-ascii?Q?1A9AJeAtFwpvlnNCbG2gb7Z91OZjzCs28D2zkbO7CCzlTJD8juHfrW2KQ02h?=
 =?us-ascii?Q?4wyVkEaqJdDwrJqj18bi9yZrv4S9u9S7w8RyhLnXqEAQe0RvbGscIPp+B0Nl?=
 =?us-ascii?Q?ONtj6O1eIlwygHv15H8OC40qfRLadwaCQMO3xxwY5voTB56xMoUHEN5r+5nE?=
 =?us-ascii?Q?fa0l7II7xTrP1sWjZ+t07y/CzYG70BIXzB+imP5Xu2YGL5QUCx0o2+mbyl70?=
 =?us-ascii?Q?lbQYkrDoET6+64xapTgpoZF8GUvUkNSuk5XYqB836MF8SJeUCWmjHU78z4Ze?=
 =?us-ascii?Q?iZEZxFPBSmDM4yvNwocDDOmiIHe6odBeFLhUa118dWtsV62vbeIUjgLzwe2w?=
 =?us-ascii?Q?wTSoE5lK4ZSS+uhSufdi/cOOhOjhCT85ZFzdRgaukukwxZGB+g3hyYVQJfqr?=
 =?us-ascii?Q?1+OCQjA1PlIdknyL6nWJK1cDoDRAZB3ET1lP2V2brbw04zrKU6X4PQQDUDNd?=
 =?us-ascii?Q?gth2UdKt0KW5mlKUvVCI0FKqSBaIuEL35ggmmwJ7PQlD3/9kscJdqKbOBKJJ?=
 =?us-ascii?Q?9HFA+sv6ngZIqqHVztAnBh01L6jaiXYn1SaSOUnHNFvMxOW9/kSEDW7po1P8?=
 =?us-ascii?Q?B0H2LlvGg8IWmUbcOuf0mFmIK5Fewp8agtjV28ornoLNtjlQJuu8vUqbU1kj?=
 =?us-ascii?Q?1XXqM2BUbZm043m1KA/RAAt1XIhvkRTaTtDftfHv+GseSj65UkJINTsnm96K?=
 =?us-ascii?Q?Sv8HsRMEdYxWIOPOQl/VjaMIUA91GeIkcbgDImRQjEwR2jBRH3MwGniLo8eL?=
 =?us-ascii?Q?iVVvTXVK9PZS60aQPalHxGJZzu0rv1fkkXyjtCTECAaoVfpt67cb33TpK0mt?=
 =?us-ascii?Q?o/USYcssISFY8MvOKM2kawQZGoo6MXtCK/sbfov3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7f1536-f42d-403c-094f-08dd5a2dc45c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 08:31:17.0248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sJXS0vXP8wFxaea19LZpJkUlS3AxrGxlmfIColQPpeKMzwZHDD/b/ufzWImayQZFCeuWfjGqmEl82usQcakoaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 08:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212202

Hi All,
=20
QA for yocto-5.1.3.rc3 is completed. This is the full report for this relea=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Tuesday, February 25, 2025 12:43 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1.3.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.1.3.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.1.3.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1072
>=20
>     Build hash information:
>=20
>     bitbake: 58e5c70a0572ff5994dc181694e05cd5d3ddaf66
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: e56a0cd6fe5e796aa59bd0d4bcbbb585ea626199
> meta-aws: 9a8a5edc0ba8be96273966df0215fb921d8a6e16
> meta-clang: c709a5196f1e8654425b43b478064395386c36d4
> meta-intel: 0ee9e8454cd41dcb0f49df7dcf2182b4d5e7cc96
> meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
> meta-openembedded: 6851cbf026088a13b2b45f684838d3dc4d7ccfdd
> meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
> oecore: 35ffa0ed523ba95f069dff5b7df3f819ef031015
> poky: 11a8dec6e29ac0b2fd942c0fc00dd7fc30658841
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
> View/Reply Online (#518): https://lists.yoctoproject.org/g/qa-build-
> notification/message/518
> Mute This Topic: https://lists.yoctoproject.org/mt/111360898/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


