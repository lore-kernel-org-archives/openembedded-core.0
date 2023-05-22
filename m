Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEC5C7EE26
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 14:25:29 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.23208.1684765525673201381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 07:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=QkhwDKS3;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684765525; x=1716301525;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VbGruI501vF3zOnWjKu451CCOaRMoAHhUnzRJcIDjVI=;
  b=QkhwDKS3p11Q06jMeU+lVQLwRQ30S1aNvAH/+JBF75LOeEdFW+NRPGHn
   Fc7EEsXpAmmg8hx6lfR6djRE4jANySEC5THPz5GNWTjsh2drT2JGqXo69
   apHewBmYofzKYJcwHlReAdmb7Dy3Zfo8stLM/v8ue9kX3a8Ec9zpSKwsa
   XjDpnZQvCUqgyDFgNLv+d8WJMc9bt7VAX6phkkcDc+TFH0icJ21y1xvUV
   6YFgS9Kh9P4Hv9UDw29xOfy7LcqzfIsALUlsgIxA2u7FUv5/+/knVnnmF
   mFn3RTwjY97Dsmm4aODhJdXxxFeVUYFVRkmcElY4KdzFY9bM0k2gUHI76
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="352955732"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="352955732"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 07:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="950132131"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="950132131"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP; 22 May 2023 07:25:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 07:25:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 07:25:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 07:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1wLfVDYr2DQkXC39hBXnF2ViS3/2hJGptg9NjjQFNS0N7vuXjNs6GywKzI+sT5crhX16iPToq9A2OQzzCmtOJQF7D5LOpf6l8JvgtNQMfYFP0yvQtJ040xRgb/J4xjiOe4YFK/VuNxnSq8InJg+sWAobLGCLZp/Jd4kuX3pa8kOpJP8cLyVjDrjL7Ju8awVR5BsI659S0yQ+c8bM1u0hMxzhNVCw7BiSTpyhrg3FAWf+IGeHRUX+ndSli0cfuSFqIBl2UkJE/4YGBm/l09vnFoJOoc6j2jV6KuHRE7Nom90BSFE+BFpwBEjktvPxLU65bZePrydKfBiD6Vz6fHjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaNeRUtLdNNdIRWNYIOG7EBlza0louhQNag9qLzV8ZI=;
 b=hHgvBU6hPSBb9seVasHrvOySng4GdTRLoPi/rpr9AiOhqg6s2O6MKAjYIuH35gvONlyqrMMUP6jr0Pjl37w7r+3AsrG9xmtzEfYeLvmunIMxd4Ohn9XowbYvChtcs99nFQsDUBVYYdttXhUT1Mc8Xx1LsfjrmcC7gKSnqLHixjBbqQI89bzFHla0ZIIPprQPr6YQHf1B3vcYW+jid0OUiMziwSkkPlBKtrP2lx2STRY8LMn1j7dUW68RXPaQKjBTkIXkRXi1/mJE7musn/WZZxZWT1F3h6PbJcTDZ5A/rbsXcKqx1ox+3TGWGaD6E8ZQ5rUJoFuXm6Xsl7aSMpHGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by BN9PR11MB5515.namprd11.prod.outlook.com (2603:10b6:408:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:25:08 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d%4]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 14:25:08 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.1)
Thread-Index: AQHZiqjD65yCQ2LAJUGAXgzuf6yK6a9mXJUA
Date: Mon, 22 May 2023 14:25:07 +0000
Message-ID: <BY5PR11MB4152D19B8A0C67A3BAB116D8A1439@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101883651a427-23e1e997-8226-40f6-918a-0e48838ecd82-000000@us-west-2.amazonses.com>
In-Reply-To: <010101883651a427-23e1e997-8226-40f6-918a-0e48838ecd82-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|BN9PR11MB5515:EE_
x-ms-office365-filtering-correlation-id: aef0d696-7dae-4806-b6de-08db5ad057f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bbh3v2F5VsS6OE+VqeULlZanX12A6IuSaaW1VzXkms0qv6X6N1yqcvCPwFt4KBmLR1d1O6X9gcIkOokygy55BB63Ih75mmyJsh330jfqvf8Momi1lqLhIFIj+FUJqjW1Dy15ffR/O4f9RChDVTu7392VUzpaQlFCGCNfvJrohCQxZleBYjQxQiJzRWLmpJ4spyEpmAoUFv/HJ9NcahlxlS0cbyGaSkzk5LMO50qEN2zAKsTlsTmuJ73LrEwvPqlP/20z5YUSxnJCPhfGECb2nE9oUKUZ3SKLSwy7k9Pf5CQwWAT+X+zeYNcTyOEXIcAQhPBjjJWEnce4rK+neWXzLpDp02XDEQlpAUJRcrvVRwqxVA8ouA09IjuL0nUlBUQowHsudl0lj4NcvS9S0roozpb77DyeV+bRrkYG+j7aUm2O2WZ9ROENSmtkrRl5dCv7QA1uUCD1N9p79HUYEplG31v8SC8ZPXFXz2ygNOgKqw3wPNuFvZjFRZQ+ta2e4BNHnYGhhHgLXBdko2eHZ4GjwEv363aZRuIJp/ELUuu6wwKRFj0m4jS3W+8GCdcoyZ5mgpwHF4KzcXnGDxQgXe1btDTF11EmxzSCJdDIXrsBiCbS5BtsqQKXFjHdh/9hNO+eiz+JJFMp4Frb8oLyHyWNQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199021)(478600001)(66556008)(6506007)(26005)(53546011)(9686003)(15650500001)(71200400001)(66446008)(64756008)(66476007)(316002)(66899021)(41300700001)(76116006)(66946007)(110136005)(7696005)(52536014)(8676002)(8936002)(5660300002)(966005)(86362001)(55016003)(33656002)(2906002)(83380400001)(122000001)(38100700002)(38070700005)(186003)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bcTDtKSeKmu0qrGl5byiiDt32iCi8qlUbnuXY/WE07VaHi1rfE6koz57CP/i?=
 =?us-ascii?Q?sMUb4G3EMcEORaFD6zKB5qOX3CUmEXMTaxT4K8IBQ2I0rsLW2h3CFwxHStBE?=
 =?us-ascii?Q?vlVtFo85d3NL9B1rHGil6hy2gyZa/HHyBo5GZX4CFCnJe69qjgrhdm+8ULl7?=
 =?us-ascii?Q?iPorqxppmkLH3XXHJLNf9vhvuVOqP5WwX1od/eWTn2t3Xf+QD7NyW+fnQNpA?=
 =?us-ascii?Q?Lb8HhHec+g8n+yUUmWQiuv1OAs5EUe/BO3B9TzjoClXmzKnF2KEsCFPHHZ0x?=
 =?us-ascii?Q?7heeCrS+UreTLSeiZGZFaJRWQN8c/DVgaZFSgcjoHVYniLPYVV6O0mNprIl1?=
 =?us-ascii?Q?ylqHVBoZoMktgRRIqbidLYByrMGH0ryek/35JZk9zCNfuX7PwdKQeWIcZHVo?=
 =?us-ascii?Q?LGmAa7Nx4kOVuok/wuXOCjRwFiDbbjfv5PPDIFulPNVUdJwNZkf6JU56995U?=
 =?us-ascii?Q?LKyub67ehHdCYRy3KoAFxUcYYvwEQKLYgc3YyXe3Ym0g3klrBp2IBkVlfaRh?=
 =?us-ascii?Q?wQbicMe0RRuRD2QCPyR3UgJTIp0lHUdAVpj+n8ODALecG6nqBScvA5OKOrlt?=
 =?us-ascii?Q?N328CF/KjmHl6NySFapAenUtrEvarO3GKGOVY6vl6T4t/3T8hdsXOVMeEWtr?=
 =?us-ascii?Q?1nKdndT/tjX56mjNbB9f4psaQFg4Z53/3lTAT1odskATpeNibmZ0DihfvhRl?=
 =?us-ascii?Q?Iu7w5my334FfCxvdoLRnWA4bY2Mk+yrBD0d4q4AbvBLfMOa6zKN8UwNeg8xQ?=
 =?us-ascii?Q?UglSNUa7YTxjIu4MBLaWRBqwT77Erfz0hO+EpLnuPyW7cePXTgUY9DLsABoY?=
 =?us-ascii?Q?Pke9pkXqKbighJ2lNCrqXxa9WWogg3g50xAyQwP9pDMmik9BDa2jU/YW2U5B?=
 =?us-ascii?Q?zEkhlviPPlTzsLF+8X3ttcoVt8vEmVR9mEtef/FlFct0DqIzRofkLUvNkTod?=
 =?us-ascii?Q?QhaI7y97y5sfCzfkbfhl9BeZzdG8t0JI/UNaCKV0CxGUpDDKEP75rclUYjmG?=
 =?us-ascii?Q?A6eeiFi0HwjNiEFhK0YkdchmjeZBm1z/wF6bSuwODHfasnlYGkDiRBOlp0Rt?=
 =?us-ascii?Q?LNGErg5F+7wrZycqsRpbWCpwE3/6aS+i4knxhFG23JqMGntajv4mawKKXmjS?=
 =?us-ascii?Q?HYezwMRg0WoUUJvua/sc2Y96+mBQtYrRnzItVyWzFXam0JXf1UJoLQA4MaIe?=
 =?us-ascii?Q?1MpesF7SOt8/Jvq8OhdIs6fdqWqTk7rNPdn3bjjTZiP0LqLUm2bI6twFyYJV?=
 =?us-ascii?Q?SgQAuA+zmch/dTEp11fOnmmjNZ6ScjJ/ThDRKdicE9T5e2Sxwbk/s/NmE6Jw?=
 =?us-ascii?Q?3lwx/fs7Eb641DGS0pzvcbqx2GMijLL7CzKupyz0a4q1K1YNeyhLEVhC195B?=
 =?us-ascii?Q?KXUZw2y8lMgS7UXRhMDKKmfH+bgPX99DvshazclpilpH2MQKGTQfIkWqKt/j?=
 =?us-ascii?Q?VBSHDx/PQrE3YHPjj7cqovEO9urWPrqw+Uk8+1zgiBQvkxPvxqJPntk7R4Db?=
 =?us-ascii?Q?R4QzHUnOSsc85oQ7nAynuumrrKnSFcm4FIHwEIPoL/x7rO2oAvnw8vH37ef0?=
 =?us-ascii?Q?slXBW0ssaY6/aTc4MZb2vVOnisPYk1FB3ZeIQlFN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef0d696-7dae-4806-b6de-08db5ad057f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2023 14:25:07.8443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UzcwcLFUWZNCNvBE5QXqLa/t0wR8wcum56IMS9wiZePTJSvvkjn05NqhA7kHPihX5jbQqnLiJlTo/SZZS6ErA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5515
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 14:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181595

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2.1. W=
e are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowBoard Turbot - 32bit
2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
6. Edgerouter
7. Beaglebone

=20
ETA for completion Thursday, 25 May 2023.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, May 20, 2023 7:22 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.1)
>=20
>=20
>     A build flagged for QA (yocto-4.2.1) was completed on the autobuilder=
 and
> is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: 68509775774d9cf304e2b422927f2a9636525155
> meta-aws: 98efcdaf375df31c53d0f8d28240a079dae7b4d9
> meta-intel: a0ea4e5d395579e70f1057f1f1222c8a2b55bd96
> meta-mingw: cc9fd0a988dc1041035a6a6cafb2d1237ef38d8e
> meta-openembedded: 54b177f4acb3048d21a68f180fc183d0fdf47a94
> meta-virtualization: 1e338cbfd80dc34f90f13f92fba2e810f6858ed6
> oecore: 20cd64812d286c920bd766145ab1cd968e72667e
> poky: c5c69f78fc7ce4ba361363c14352e4264ce7813f
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
> View/Reply Online (#260): https://lists.yoctoproject.org/g/qa-build-
> notification/message/260
> Mute This Topic: https://lists.yoctoproject.org/mt/99022866/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


