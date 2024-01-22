Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6727EC47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 02:25:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.64344.1705890353227541021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 18:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mgeDECIL;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705890353; x=1737426353;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YmiJgj9VhFPn7ULEJ0CTf64ALzyoSKJ64jXQ8kPc8IU=;
  b=mgeDECILP7a0E4x5zubXuU/mDVZAnEMcngTX0FhF0ABKe5TB9zNVeEQj
   pfp0TdoWP7t9zrigAQy0Vrno5SR5eB9IA/afdQgDkvyaL3A+utmw9tYmb
   DG0PwP3x1M4eicovfGSyqSHnKZ5SDHmnzKJL7e/oaHSrXuHp7EIiClt4V
   Y6J2A3GW0u2813OK8DMajczaeN4JLbuLHBtVWfv//e11If5jVsDTXDlX5
   1Os5wD9Ru3b19KWvKldPhwjUPdbdyfHl7pFZI6mD+T0JltqM0FKth71tE
   8EmEHVfqBuNrBatoROq4n67cwgtauUhoxcJ1K3T4p+0aes8jAPu7p1Xoa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400740020"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="400740020"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 18:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1156702"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2024 18:25:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 18:25:52 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 18:25:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 18:25:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Jan 2024 18:25:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFIY1jSMr8MapwG0WXtHUA1glB6+Seq5KTlYYNvEnFBaF+m758rBJP24ijbCfx0yjxKtJ7Nj+kKE9pkQ9RZJ95ra8Fup1DjdgRrq4yzVkS+FDQjz/VDLkZ9V7Ff2pVq1ObP2BGsbe8Szk8/Blryj4o2Ha+YgzODDHc2gXIhnnwkeNZAzC+TQjs5mSRpnsBMRCHeoJJ/oQoHx+PmQZlqYhhAwxXYf5OetJDV5fSc17aW8cY78qfFywg4bw+xdyDAquSP54M9G3w4//7POJxSFl9m9NHx4SPp4zsUOfkh03fYq8lYi/Iivu4yBe1+gFTU3FR3x29sQ8z2mUKU63SxybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlFz6nmvQiGQeQrPhFQhD39XRCPkf/+iiV6QLbCgsC8=;
 b=JP2sNgopsQpOdH9VhHU0j+yagM6WurnWnImFdKjYrDD8ZmCh9FCa2Yr2x7uewfuKWIaZSpK0yn/WsDOcpFbTD5h3MB5FfpiDoK3smgVT3nPMXh9WRqJox8Qlmyh59wITZKY4T1xb+EaiHAIU6aaGWZdXMEs+s8l6THeq6GFEx0Ps5oR387yq7QNZEr4EF5nVq+EULmtz22R5v6khfpwWNAb//OqKEqXj5Yc3KAtwUb8jjuydF4o0mqRf6RUcHAOydWRHcaCS/uzHPbUqGDEkeY1xXGiBnab6QgHQLUHjGirW6/LCbO/3cGK03054QHZjwJa+Rebhaql+q8syVLMFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ2PR11MB8403.namprd11.prod.outlook.com (2603:10b6:a03:53c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 02:25:50 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 02:25:50 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0_M2.rc1)
Thread-Index: AQHaS0C5enK7wmapPkSS+bx7AH1ofLDlHX1w
Date: Mon, 22 Jan 2024 02:25:50 +0000
Message-ID: <BY5PR11MB41529642D549FD5482FD238CA1752@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018d248092a6-f128af5b-9439-4c8b-ba88-4a9311ae7b42-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d248092a6-f128af5b-9439-4c8b-ba88-4a9311ae7b42-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ2PR11MB8403:EE_
x-ms-office365-filtering-correlation-id: b63e075c-60bb-4960-279e-08dc1af1733c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+Dgc6SPx3jxxWfe4oRZrRgx8dqxQSZ632PC0aDJR/As0hSkmkCwKLOIybV9vqbCqonR+BATWaIH8Y+DJH2sf52Ix+JeCnT1UHUWqTLLzmDgQOftHom7A1pEKnffZ1+Hn9sx6uiboiFXe6goTeppSowq2G1Ge8PW12u8qTQ/Qstm+gKXbqvV6sujHI2I57rRaMqxClYxCNanOmRXkXulNWR5tGwUumNVQgThZew+q+mnqMP2LgsojnocmkOtmXymOMpUUKATRsen2S20jun8nyFe8apLeZZAXp8TRujbDGGVqk9RtoupJKnrvbMqlIkLH3KktZYkdB+9/QYHNSONh8hPp8jSiHF2HQ68Rf73FzpcYEdqMWyvgKyTk/lgaTMGQY5nDONzfAFs8vWpwzmGjZKwi/ANJoJQrbxIZhcA4gHGvKx1+6jfYPq2IMPqs5A9FEmDaN8eeyDX0gx/5uSrCJW/tcyo7juK7sJQkNW2x9VHFZpnlmcLOU/U0iuOxWucVW1AhcGHRpxlIyezYQbS/+P+RD+2K+p4lrqAlfojHpYx0b3BzmTXpPLWNBNBAJufm0CNN8ykccHpUyd41MgsgfdmRMyA7T/MQSNlzbtovbvxT1TtUbfBHAmcV8hDkTyDXNvkxtcINJQjH7B9lLYK/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66899024)(122000001)(41300700001)(33656002)(86362001)(82960400001)(38100700002)(83380400001)(478600001)(6506007)(7696005)(71200400001)(9686003)(8936002)(8676002)(316002)(966005)(110136005)(66476007)(76116006)(66946007)(66446008)(64756008)(66556008)(15650500001)(5660300002)(26005)(2906002)(53546011)(52536014)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E8P9OUTwLBjqSIXAWPhLrKnTyX2qLWvcm0CHpqmeYJvVZXQ/wbo5eLDDSPur?=
 =?us-ascii?Q?w0mf1rvZEDiOuKNkFLUMmcmUUoNHeOBheAsI/4t9kJv8fzdSuUo+91S1HsAV?=
 =?us-ascii?Q?6Z6LrprCdiqH0APxLv6mt/Z651/C7zgaR4MQpHICnx1wUwVToYPrGZmTcbkx?=
 =?us-ascii?Q?DBejJgZaiyPwJuzEAp4Pex3wEiYj000N06s7IyNnF9QPd/8KRQ2QcG6LmvFS?=
 =?us-ascii?Q?W0kzo7qBKTSB8zym+N05EJRdkLJKctVEqVJwxVZp6byufllF8yD5+Qofam0O?=
 =?us-ascii?Q?/A2ebMdBXL5YH0/4rgcnXHpt75t5si2ykfysYRaWhBZscMIgdPtQthDrgtmu?=
 =?us-ascii?Q?qFZDAU8Gjh8FIDb7OcSG+Ie09PlKrlNifLJVqiDajDrdDpvForuaew3jNH3c?=
 =?us-ascii?Q?7OO7wICiEbiRWa9MrtuFe1sTtqj0YZk7E0RuUdNKSHMd5gr6HgUdLYkDuRGa?=
 =?us-ascii?Q?lh104Ju+FiB9+YsAW04Zsn4734b6vI89EbVxD1QcVkyp/E9Yufys+Vjxg56R?=
 =?us-ascii?Q?BCxhhunVGmdnbIOfxWf6PV9x4X86txtcnsTOMjognQh4okJuN25lZJ+Dv6BL?=
 =?us-ascii?Q?4lzEmt1ZjSyWrETs3KoPjg4Aq7Q1n2hHZxp5b11+oOl4ZoUW4hVe0Re96yY+?=
 =?us-ascii?Q?K5hpu/S3fORrNlUAv0hk2IqKAL6oqTQI96WfZ3VX09ngWow9YarAANnqKZC+?=
 =?us-ascii?Q?X92RUkWOFW7pSsheQz1REvxXLiDwphTKx9SrIS4tYireeHjlkm6nRCQZG0kT?=
 =?us-ascii?Q?Oop7uQ8M5WVyitR6QZz2K2Dnbo8lk3C+2aDQ/E1OKAxC81Pza6Cb1wg4Mw4o?=
 =?us-ascii?Q?xZ4OzJ1lKc6hHPqsuBBkZXPHk9ITNoKWV3X+WehPrfueUwze7L625BVolfJb?=
 =?us-ascii?Q?aBbFobpN9lRe+54kIX76RAkXHszWJx88r0F65QKF59OhYR0iihNHZOIat2+9?=
 =?us-ascii?Q?+8SsDLO0//oS7sskK1T0Mowcxbq6FavtGyzf9fzmJgc7jrFiJqwgTHHzWfz3?=
 =?us-ascii?Q?fZHiuR0FBYIhBFujGXjlwRdyW0Pjn9T+p2QTPdtJgztuQbZtXDJgk/Jq6Vbt?=
 =?us-ascii?Q?WVabOvVikKsEaLTBHH3ekR4SptCDKehULdyrsStXrWpHbSF5i6NkAQwXqMTC?=
 =?us-ascii?Q?ajvb9dLUxtJp92EjiEiJgXAh9toQh28Y7Qv0AnryVry0q211FPCi84rUbJ2k?=
 =?us-ascii?Q?qIC3Jky1rVqh0Dnqs0DFyLS9+mslorbxbeQb9ShzFMspo867pwEJRs/9nuU7?=
 =?us-ascii?Q?2y8NodVaW0HR3QSNMrCMbV2szkBqhyNTZF/xWaS8ExiO8Htnt81SpRkC1bjA?=
 =?us-ascii?Q?blJpleRi+7R8BjIlDHVaTqJK+5r7+/HQF33+AhPv7k6a6yDP7AbE1Z1esIM+?=
 =?us-ascii?Q?qWbsd6goh49XXHXVzvsQ0eF2cUzR+YWsywcgQUjVJ3zravOmIFoNchbKH8zg?=
 =?us-ascii?Q?jSIKq7NQxQkkCPqi6FftihlYhEGBBTzzEgoHByYeIF9ywgtQcqLG8eyy2WGV?=
 =?us-ascii?Q?ZVFXiYmujQ/IyIv/f0kiZXtIgdqjJD7JbcawORUnsm9E7dZJ9nRvWkdyJS0B?=
 =?us-ascii?Q?tRhZAyy7QlA8zTv3lgTDv1uRuhURUXww1C5p7MFV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63e075c-60bb-4960-279e-08dc1af1733c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 02:25:50.2386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a5BEameidlE6cjk8OyV57YmJ0DujAKTo/SrN/TKo3fNR0V2xYDNoe9yUIIq980X9q6XxQnO3YxfS7jykebf5ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8403
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194108

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0_M2.r=
c1. We are planning to execute following tests for this cycle:
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
	6. Beaglebone

=20
ETA for completion Wednesday, 24 January 2024.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, January 20, 2024 9:34 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6470
>=20
>     Build hash information:
>=20
>     bitbake: 5c2e840eafeba1f0f754c226b87bfb674f7bea29
> meta-agl: 6c2b8fbd7ed3e85f03b44e774de5b41099694d29
> meta-arm: c538ae49eea67a7ebcc9d77137a459a4b68edcf8
> meta-aws: 3c5f873a3d32a1017f2381509601f3e104518957
> meta-intel: 2d8d97f295df21e1654e77b7c396ca6522392f39
> meta-mingw: 9595f44230fd6e5ca88df874706d69c0160188b8
> meta-openembedded: 4dbbef7a39ad18206ca6cebf7a1e08aebe5b5a65
> meta-virtualization: fb67ee2b7ae76e315711bc6d1ff587f7f0f729c2
> oecore: 38dbede9a49195d6faeda61e30f098996e6713f5
> poky: 7af374c90c349af2c7ae9cf7d4fa14eeeb23b108
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
> View/Reply Online (#375): https://lists.yoctoproject.org/g/qa-build-
> notification/message/375
> Mute This Topic: https://lists.yoctoproject.org/mt/103843687/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


