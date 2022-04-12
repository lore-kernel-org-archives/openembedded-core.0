Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02A7C35274
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.12940.1649781205021341700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 09:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ejXHNeBS;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649781205; x=1681317205;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5UiJnVGbWMYPNax7VlrEGkLCgUv8HJdQB+Ou5WrlPwc=;
  b=ejXHNeBS5eLxoto922Cl6FM+W/EfRXw4eU01SFuYo48CbdqJJpQzw7Bt
   LCkaMoSL3LPzFdqM/hO8oFfYvDwVMMJLr7EZBRdu+bW/qmL/nt61cCpQO
   zr8JgEgXsTGaU3B+lwblRWO8NDQiUqzLAjUa7G85Sdt8fAo3olNuiLzh0
   QlOeoITHD8poL+6828I8GdaNQdCG5TPE1ty9W12TwFtGmn4RtJnu7XgdZ
   ktAM3wFNobUmoGivQpw1LZcdUhVz4Nmg88jjP28kQVHc+LMIXvhknM9iz
   OVEm7dwKE+wzPVfcwjdM69vmgs7/3P7VZP1vflIBlVt7LGuMC7WQQxU9P
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262178391"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400";
   d="scan'208";a="262178391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 09:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400";
   d="scan'208";a="644796950"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2022 09:20:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 09:20:43 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 09:20:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Apr 2022 09:20:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Apr 2022 09:20:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO8RqsC510FIktLlJPZHSJbGai3y3Y95hwa8sSZXWh3ad3AhYkiDxlNqSONQSSHCbm7w0xKgOJP7Dx8UREvDKHqwZsazTiab/YCIgl51/+v1Snrl81OLKwPsHMraG1UMrguPcBhNvqt5Div3BMCSdYyAz7w6aT+/FBtICHY7dDiUyF2zhJ4OJiefXLpmDGnZUFJh/KzHqfeW2Nu9+iDBXfYAK2Ze/Pp4d5BdhIjABCVkYrQeTgWUFsbSOC2nY+VKXJeKhcAi4XBhkIaURS9oeL6u1HHVlnbExtn3NM+qQ3BZkkGmNFDNOeDfSPNEutAWvYJeSQrKLHSVNzB0BENqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihNp5KGWeJ4IrrD6EhKhgdlI91GY3NOLoDErepeQdTk=;
 b=PcBaOd8SnRJRCD0UoUGe3Rx1rfAn3lgZUcR5tiE9TbIMIMhxYg+tEfCqF4vMRrPRfT3kbJueAGvwlYapZV8uhGI6Q14dnQc6Y0VrkiuIFfG2CQukKmT5XhKtRtWj72jmCmUSFq05xXyMVy7D12aX9evmiD6mutrq5CwqfTwGKNM4HIuKaWUzrI2faiZB6i6sNoSm0ouBIrE489kuTk6FZJz3DkbDgPOSnR2ff30Cm6lphOmaaAyn6yzIq6OnYxkagbq2o6Yssezvn/F9fWlGKBCf4tbqNwglRc8DsotxwuqzWQ9r1Sf65Z3vE9GRWwjK8rNiMjKwxPQ4nA0EDRVIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BN6PR11MB1683.namprd11.prod.outlook.com (2603:10b6:404:3f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 16:20:41 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 16:20:41 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.rc1)
Thread-Index: AQHYSY3kljykFFYuAEOfzCEZffNzI6zsfv/A
Date: Tue, 12 Apr 2022 16:20:41 +0000
Message-ID: 
 <DM5PR1101MB234872284B26AF1D53F311F0BBED9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101017ffded4843-210c9da1-5b3f-4ed6-bcbc-1f63610acf6e-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101017ffded4843-210c9da1-5b3f-4ed6-bcbc-1f63610acf6e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cfdd773-9aca-4ae6-1f2e-08da1ca06348
x-ms-traffictypediagnostic: BN6PR11MB1683:EE_
x-microsoft-antispam-prvs: 
 <BN6PR11MB16830BE1FE532C934DBC166FBBED9@BN6PR11MB1683.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cF/70BBSuKmriv1HVLYD2dn8vIqiW+t28P0xLFQEZIYO8t+BzQIi1ysTlQidgqeF2g6jgtq2WVE1bEKvaO0mCcrA6Hs/VE+uiENLnAW+srYcOUsns4Vga9bzX3q+JhF166OnnITKFyRrjQ5h3G0V52LO6ZVk7Uvio0728MyMVxoWy5wJaXvwb2fqgZ4kaoUzjqC3hhtYPj+B7u8+KNm4li00ArOTv0U8+5YTq+tIF7vtK3gWUoP6NJWyN6kvNwU8HnNM2Vy1Jsau9qzp+4M4/RG30JUaxCwoqoKuHJEeO8c3tBShkDLUE5x1CgJJI+y9r/qAnpcFYc2T59vkDSDBPHsp+OLyZDtmPdPQQnfmGeZEiC7tCG86/xwLg0J+XkcRQtXx284imXg4ra5vaskIfddpOxlKivFX1Jp5RrE2hoDx0doIlz9nLoLIRakYOg84jZQPW1xcOx0za+qAY08QkGP/o+LVUAtXuQmI2gIhTscGqICKk4SNYKJaefJMnxDWHlqNzUfmTuM25wwV7FOUmw93DioC59LjaAgSAe2qHsjqA1YJTR/3IMHHb0XlLbMtQN2D3tXd549PXm6IMWRy84Mm9lHvEv+Kc1Fy+HVOGa1q9/f/839NJiKHw3/fu2hSGTftGPyPgj0YCo+6J7E6u++wRDOiHi+bXnW4mhXEFKZs8hPEUAQ4xKckmOvjOOitTLQlGAeljq0ax+6qwm5cslF+IOFQN0QeoduLOE6zceihkZo7QzmDaw2dtgVPZ6d+hIfz5PinsEWRYcR0gYuKRF9GedNjpYTpXR0R1CGQVvyn7gLv4OwfZDwfHYamaFTCoWPs2dgz8bCeiyOW9xalZw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(15650500001)(33656002)(316002)(82960400001)(9686003)(55016003)(38100700002)(508600001)(186003)(26005)(122000001)(38070700005)(83380400001)(7696005)(110136005)(6506007)(53546011)(52536014)(8936002)(4326008)(8676002)(64756008)(66476007)(66446008)(66556008)(76116006)(5660300002)(66946007)(86362001)(71200400001)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DNdGkpBK4uPM0VFmu4ltnaRG+dmMW6SGTEbmDONAcJnzGiGYGqtR2rSGvi+j?=
 =?us-ascii?Q?WpFYzLkQGXqpDhxB6G00e6tmK9Vd9MRE9OSyUbXZNi53xpwZUoKwALch6KlU?=
 =?us-ascii?Q?YfbwgqOSpEM2eSH8KZG1Pt0Ip9Eh3UeFgQg2CJwHs5xE255v+m39916j8QuO?=
 =?us-ascii?Q?q3juASMazWmO87tvGO9S/1kIrWlXb6uxCJhalWrTmSwsVwznurln7bVX8/Ax?=
 =?us-ascii?Q?PrlYNBoH9VS6VkqKsXt9vkc2OBZX8YUJ88c0CQMIPAhqY9/78g9Psv6/K3Vs?=
 =?us-ascii?Q?RqL4Zh78vsYZydfKxyGnsP6FEUoHC+22U64YsrbJuFgUhQlSNNprNfM8Q2Sx?=
 =?us-ascii?Q?G+Kx8OIZZaBb/D2KVVVUq3YRSQjVaFeM1nocuLfaoZAb5dlimj727TTZajTn?=
 =?us-ascii?Q?JV9fjwMrlbFHrOZAtK6TRf7N9Lc6MUyoq5yv0ElQC2oQKYOUhTOiA4zS3wPJ?=
 =?us-ascii?Q?P7WblXWDVohsxGwxykc6iwLzlrxu008ulkpVI0zDyCZQ/JXDu/Ymn0KHSpu7?=
 =?us-ascii?Q?qe3fXQjAGMRY7uzpD1R0oU3mXdI76geP4zz65bdWqZuiqheTD6SZuwobRsBF?=
 =?us-ascii?Q?h9Quv2FjN0UQatz5tbmuiYfIPXpzdzv+q+haSK4RNk5RGZ6aaOv+hCJo/jd+?=
 =?us-ascii?Q?9myZeVjhz0dzcn9qIJtNbHA3Zc+30CXv0zLqW86DzbCPWay2JpyvXDxBkbqe?=
 =?us-ascii?Q?lB4448U6udvg/MaXrebMoUnZT/tIlIOuBIHoZhN7RZ4IV9ejJSCLU72aNtjr?=
 =?us-ascii?Q?i9PaaW0WiQAYqWcrWuUkAYOzdEO5lTSo4iT1ci2L1lBeI7JSZ1eD+cIwulDZ?=
 =?us-ascii?Q?6Chjtj8SIL3HjPjt5ZPgF1N+H5fy9Rc/0jgPugV9dAW13bRZXuyMUqd9lWq4?=
 =?us-ascii?Q?kCtmVhEvt43skYoIBduaaYhC7D2+7myAsoknTxGyCDQDKuRTe8xyjodkL+5w?=
 =?us-ascii?Q?D6oLBd7sMNg36i5Vj9wwQP/i5dwTOuuQK+4kQJMr+8q04TCoOyOfIOS09nGx?=
 =?us-ascii?Q?3SzNZ/EZnbDXrOILlBH8gNtUJhSAIWQnVZRsIMflL5Jzq92C45EqtOvQSQgr?=
 =?us-ascii?Q?kf5OYoThcLKFqw8SoiNGTthQ9BpCO7GbJtShxAZzFrBZ9tammH75ZVphsOh9?=
 =?us-ascii?Q?jruTQtz44h1be+k+Z/43G50ArgzUqNxe5qjIge8AjCQWZqv/QhABoh9o24GK?=
 =?us-ascii?Q?MR2b1JWc2TwaPAq260pevI9gd2gdfpeWu5SndrJ4bnKdJp1G/UFuJkIkfvVE?=
 =?us-ascii?Q?FDjhfvMFXR43QsCFebhskkMqKM4AjTaX1UbvjvivYW+LMIE/LpvQZVpkncf7?=
 =?us-ascii?Q?JU5hxrzztfnsho/hvDe/E7fUhFlhs5Fy2c6PwZfMYSu4Juz1uka2gcJ2Wxbw?=
 =?us-ascii?Q?FX6b6ZEalz0bgXTPRNw3EtzbDcxlH1GGww7+1MYb3JEPYuDGvkKGzOZvYu+a?=
 =?us-ascii?Q?lZJdWPlgZ6R0qznpcsK/Sf/3fwMfQjegH8i+EC9cSjfuf0asnVTzkVtdECdb?=
 =?us-ascii?Q?NY1ahu2sRmfiPsjvGG7D+GZRz5Ak5OR6lbYxkZzY8qW2QjniGM+ZhbdPFXuN?=
 =?us-ascii?Q?u4128Jz7bOFbS0VFV65cWtKu0MoZDNFtR8cw68a4HEUwjT6jdC/D/sHU2k7V?=
 =?us-ascii?Q?IsUc2xScRnFywfkeGeXneoFwmbIOIM0Wj2/lrliAn9XEd9TW9IVIpSdQ8un5?=
 =?us-ascii?Q?fPD9YMf65bP4Yw78hTUakbTpbpBLQxCxLbrMhROi+8YYIyhWtMYeYuvrlpnt?=
 =?us-ascii?Q?Wz/TXPCv9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3cfdd773-9aca-4ae6-1f2e-08da1ca06348
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 16:20:41.1425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 P5Tkk1jqlpph6WKoPjOTvYebOcoupwNtKg2z8PSzMwZs9fDGn1VuWfd5F21HaxQ9kmqf933O/EgSaZ+nGbY0QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1683
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164279

Hi all,

This is the full report for yocto-4.0.rc1: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

new issue found=20

Bug 14779 - [4.0rc1] Edgerouter can not boot up=20
Bug 14782 - [QA 4.0.rc1] - Icons not loaded properly
Bug 14783 - [QA 4.0.rc1] - Abnormal responsive time for File Manager PCManF=
M application
  =20
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14779
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14782
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14783

Thanks,
Jay
> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 6 April, 2022 4:11 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.rc1) was completed on the autobuilder a=
nd
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 41eeb4f34fb2306303f7688ec5e0ae965a573aa4
> meta-agl: fa5152323ad2bd3d433aec72c4fec6614656f06d
> meta-arm: 5c83fa83649c522137c96d3c5aab49d660f8807f
> meta-aws: 214a5867b3b0d9ba54818aabb1711eadf4ba9eb3
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 68e00896f2c669044f6ad8cbbc9958332254a4e4
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 173352732d17b3d1fa469b6eea43a2a3c8a670d3
> oecore: 62851965fc180f33ed6feb62ff5ac14706e4732a
> poky: ed98f1a1ae7e4e2c8e089003a619ae9260a852ad
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

