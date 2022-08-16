Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFD3C2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 07:04:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.12780.1660633459992002218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 00:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LGu97AwM;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660633460; x=1692169460;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gsaKiqB8JZGSB1klQa9F9w/JJRkg41zF+INKvGlq37M=;
  b=LGu97AwMQF1Rvrw3lTICm9/Vaj//P9g6cRWBaK1tt01GWu6KDU4CH5QR
   yurL0Kvp4nhwYB9IFHCaK9sxT6saya81i3qxV6W9/qZi6CpyguLpjDuNg
   X2ttMZJT9kfmR7I0VE+dKivBVEz7GJ3wATZKtxrvHezV0Ue5Wx+mSaSPI
   +1yPioVDhUbpIOqawxmo4fKQoUbAwk7870HQ7iaXu/XVEVULfRgr0oIhZ
   AxXKuVHmRhSYm7C4+IZfjpD5CiyjADYS1fOKWimBXHM6995qk0u6y5u6g
   S5ndGAuErYd/OSoGU2OaJLB7GEh14uA2B8yUoBIQVmVjxPRZh2XtDcrnJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="279105537"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200";
   d="scan'208";a="279105537"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 00:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200";
   d="scan'208";a="666985973"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga008.fm.intel.com with ESMTP; 16 Aug 2022 00:04:19 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 00:04:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 00:04:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 00:04:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 00:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqcQl/wGGcc/IEMX4rKzYGagPge+zcdJxOVKZIUkceVkbpsCNFj/rXt7QsZKQjYnSEpjL/nwUwF2+QJYDK0VUYknuXL2JXrWnmbpMFDBnp+CIxBIyNtCOosb9Z6cnsfY6CQWBam5pLD6JIHSyfJZNeIByNs0sC15ytIrdr0nwB/Hq+HWNi9E1HIL+f0MNr5AILqfhpxAZMdIFspyyg1qSwPWbnEumRyqx6bPCSUg1Bo36INf48zDcJkRmNbZVmmaDU+I5Twwa5Vig8YvJYruCIPQm2tJ8Rk+tAJycLNG+9VR29GTfol7aCViuN1Kww8TK3TODC5ATu6N1YaIk8jGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoJbBiM/kDqsKDm1NDCqsRh8UDkjFqVfXRB6XlRBcKQ=;
 b=e+UzJBd74pfghYl54vWhapVneJkt4iVgx10CS8bMsdZOzPg4U7oRbpQZNqFnO3xespGbzqNkc8i3EGKgExnG1gQmD2lu8LyEigw5sYw4bYV1ACXyzPeZt31ti3Iu01+wbAA2tr2tGONykRUsr+to/w0X+rLAnZXNjMjBKUX0BQFaisfDkEtV8Deo6VTVxSUGh3yaVYu4SPNRPj6ZZ3N4Pbe1EjqUg0Z/OPo7AK7Ch/NYp8igRBjVC6BdZUBblfQCJVslVGGeJUhoVVtgjDHuhZKD0iEKqEiZFBk/TME2tCuwuJHKenOMj3zfaraLXPCOqyjMDeoAWAirOvz0k4fcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by MWHPR11MB0063.namprd11.prod.outlook.com (2603:10b6:301:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Tue, 16 Aug
 2022 07:04:13 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 07:04:13 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.3.rc1)
Thread-Index: AQHYrO0DKJqanzOEKEeerb3Yk+1fnq2xIswA
Date: Tue, 16 Aug 2022 07:04:13 +0000
Message-ID: 
 <DM5PR1101MB2348BCA86E023D1098B71307BB6B9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <01010182892b36b2-4fcb2ae7-b8ca-4547-9fa3-8136464d7fad-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010182892b36b2-4fcb2ae7-b8ca-4547-9fa3-8136464d7fad-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7766006c-ed31-400e-1be2-08da7f5586d2
x-ms-traffictypediagnostic: MWHPR11MB0063:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0j5U7QD3p2ks37uHwARJDMMu7sprO+zbJb3glDLWBKcNHTDaX9FDGwXczBt2/dFEP3cOK+6X8zwoCDkGp5wTwZBR5bGEwmLofGI4gCY/Hn9HmpA61pAiBb4M2RCLgvQqbjsvi371w1mzMPzFqVLoWwmYGnIkl+z+Q3Fm+NtUfXMOyIn7JSwrda94kQ1p+7CsoRHqLvv93VxGA09FSwByskQ6tuniE6M61e/S3x4kXcBHzO2waS0A2/ho4SzOVqLz3/m8LkwTED7wDwyTwEkOh6C4t36Ao1jI+vj1ptQvX0xKbiKtpL5aV0wUajXvFkjJS1ZOw3ePvheYqgy+GUlXGp9PiGhqCUC2mN6SeXuBccMk8YsriaYxJQpVQmBVpnTE+69YPiqA1SaVSySwy3fCNCwSqA1iGGcpOKYguJpgVzIyU41M19yjJ0eOA1cZEdtt+cpD9FnDXaooICUftr15yxcm9tP7DKZV3LYpkelbweZtHRj9b1SLvLioLoTxKhljmHPzA6h/i6Nxmr+ftRolWpJVZBS2RxjN5BtP2FHi9Q3dknIRRcUsqiAczgAnzXKHfYEv4TMB4jATa6iLtEmRNWQVpcapHlxPIksopp7Zd0NCeLxfwkH0MrdqYgorv7h3rNyckIl9lv9sI0NlhhvencsFBz1/L2DTxtWvrHDEW2KMsLanYMMrRpKhqo0jrhLmSjA8H5/U/JcBqj8e5wEZal7tss7VAkmWPvuNBk6NaOYHgVBbVW14k6KLAt02LynWArTMNkp2Bw1vtEF/zVwvQg8spGnE8jgKRhxCTdN+e1jM/WQaa1tjxuwkAviV/DPNbaWUlilabR1NKSJM0uZLvg4WT5fe41HS9wxIp6XEyvQ5dOUWYQtLyolv7lFYjwi8
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(396003)(376002)(39860400002)(966005)(71200400001)(316002)(478600001)(41300700001)(52536014)(8936002)(64756008)(66476007)(66556008)(8676002)(76116006)(5660300002)(66446008)(66946007)(15650500001)(38100700002)(110136005)(38070700005)(33656002)(7696005)(2906002)(86362001)(6506007)(122000001)(55016003)(82960400001)(186003)(53546011)(9686003)(83380400001)(26005)(55236004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?l3r0J18euQF9TjjzZ3eRw7zUgmk8i8bA53tRxWTHJ1AxbJurLiz2L74xbEkr?=
 =?us-ascii?Q?sTQut9keGoLAzCtyI8vZF6aLTYen8zcdmbRjzsSE0r6oeWgguba6BGdCOyoJ?=
 =?us-ascii?Q?Am+01WEYI/hcByrOQVuIodbDbgGmHzzfCqX3qt4XESBu+uojSzGwHTH0qHNy?=
 =?us-ascii?Q?keY97rBTH1dXJLWfaKulhRNdzPXF7KA7sgfxhc5p1anBgPviWzYn2oooQOSo?=
 =?us-ascii?Q?sczGA7aPvEmskVirCxuQfTKFJ5EBbyKqGNuBv44xD9osxYi3tyqXVClcj5Kj?=
 =?us-ascii?Q?1+rxBfm0j68S/e3HL1ajHPNGXfeFcd8NXCmSBzMqF2ROBQZjfCi8omHSVUTO?=
 =?us-ascii?Q?0Ki65VVTML/uXOlpHAMxlYTeyjus59ZU1ePnqCBIbbj1TemedXaZzn2jNBMY?=
 =?us-ascii?Q?JXgPkZmCeS7q+jH7XYAt7DTTPTSyM2WsEyDmNR9fErFGItQ9HnvqxulJD7Nu?=
 =?us-ascii?Q?xcH4ZiS952lIM8Ij6n+pRahKd5OP7C4pDgFNamKHWhufbb9ZHfZn4IuQbO8F?=
 =?us-ascii?Q?VyyJziCQfBmgp+n3po24BLFK3/43H+zXhgw5PkCJZAgyZ3dDYye1ceStKB7Q?=
 =?us-ascii?Q?UX8roNAOdSm8zOMIVmHKg+hBf0fdcnKbiTpKN0vaBDw/7DyEWLpvOz3dV9AB?=
 =?us-ascii?Q?k3Turhu3o/11b1J6eL8Ufm0Z2QFnPOpY6We9VBPTYs2dpNpLJx+7iUmW2kSq?=
 =?us-ascii?Q?W0ZGCAu3D0zsuskSdwBQQuEX77TAi4HuHdohKsGmh8Z94X+dYzjQTP6n85sG?=
 =?us-ascii?Q?ybGe5CcKA3CI1FIfgqN9uaLOUWq740p3AJtWpkpHHcueVGbg2kDi20xHdMVR?=
 =?us-ascii?Q?DvRNiEbT9EUuUuafdSDyX9Xk0edbdrz877llOhONqLfR9MKaBoI19b+noE0y?=
 =?us-ascii?Q?WrMh+S34raHR1q34+NeDW8yW+wjb6ZACO+VDw09+4gtkuHYWHARCosBumGy/?=
 =?us-ascii?Q?2R+ubLp3LkUmPa0D9F40vHzjNRb1xuHfIR2W6ATE8Rx6aSgGX6VbQN2atTGZ?=
 =?us-ascii?Q?zEepJkEI/d1HiRMIr6V1A4kRFbk+SsRb1zbtzD2yUqxVP0xXjtYyi29CDrqw?=
 =?us-ascii?Q?eJsP9qjzvO09Z20AVD3Mi7wr1sa8baWVLmF2Jc8e0KKqPxb6JXvLkglFe1We?=
 =?us-ascii?Q?OKhj1mbKzpBJmDKn28zjfaO4EoaPK7TFTKBp3FItHfaq2wPXowYgc0JEvyiT?=
 =?us-ascii?Q?eUu9Y7vPT2jv8aBRupquNDq945GQV85oOze9yEPVIJLQkwwFM2BFoPNfZ+of?=
 =?us-ascii?Q?N16AefPcCQ1dsa5RQ28Cd0+BWWB56YhMvWegGGSBEtVC7h/NmgmwXBojRf1I?=
 =?us-ascii?Q?uC4xL4D1QIE5N36vZiKjQrYGodmAQFHC3g1q5GK6XyDdyKxjEOK1Ygpo6pLU?=
 =?us-ascii?Q?MyvpKDom/xwNANRdKU0q90zsE1oq1wNuyEVz2YfzZZj84f/FzcdOvT1FtNQZ?=
 =?us-ascii?Q?th2LovWs1CJ2nsV7k/VM+AGyZaDBHQHPva8Fjk0jYoSZ3vkgTI84sRXJKPoi?=
 =?us-ascii?Q?IxfBP60ASgL5VSo/tdy7AhlUtHId8xusgn6rZDHoxV8saWX3mqfE7l2mt2+Z?=
 =?us-ascii?Q?KzIm562RvcwF6adWjyE6RI5LKXtMmK9vKQ1ukd6p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7766006c-ed31-400e-1be2-08da7f5586d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 07:04:13.6585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 XvXeg81dDaa56FfBuRRcFq/hJE7afbW2H3a0GaH55jyclqpdDvyIR4A173FtxKoAyZTH8nhlkbOQunk7RLL4pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0063
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 07:04:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169426

Hi Everyone,

QA for yocto-4.0.3.rc1 is completed. This is the full report for this relea=
se: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, 11 August, 2022 3:11 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.3.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b8fd6f5d9959d27176ea016c249cf6d35ac8ba03
> meta-agl: 3ff972228b08c37adf41b760c2bbc5313b90715f
> meta-arm: cf9365fcec2e741c56ad88db7f3838f636e29cae
> meta-aws: 4ffc63cf28ff925bb67477cbaf7e390e968b1f8e
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: ef3aa3064b9bbfa19f600eafb1e7d3473f62af74
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 8f2dc1023482863e2630d1b94052c41ce748b38f
> meta-virtualization: 26a361a39ff5ab6fae22efbdc582f84d13330ba2
> oecore: 2cafa6ed5f0aa9df5a120b6353755d56c7c7800d
> poky: 387ab5f18b17c3af3e9e30dc58584641a70f359f
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
> View/Reply Online (#170): https://lists.yoctoproject.org/g/qa-build-
> notification/message/170
> Mute This Topic: https://lists.yoctoproject.org/mt/92943671/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


