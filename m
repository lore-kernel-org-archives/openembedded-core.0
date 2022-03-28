Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9536CC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 08:40:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.8651.1648456840730012281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 01:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fS1XTXt0;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648456840; x=1679992840;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Y7KDFyLjqgbeR4HVgvSd1yzMeN1N6n7FuW/+HIXx7PQ=;
  b=fS1XTXt0OFLEpPS+vmPWdgKl3gwbU5Nw1l+/29oNaNa8/SYxDNoYj26/
   TQl8BuBQcsULDHFxjlG1j+4euzimVQ/SDBMNj4oV78jG0ZfWK4JahB08x
   yjxsHxFGFEsDQ4QcmiGNO3c/LbFE5d3V+Ab3yv2lIfOkcOTaoZdkm5/ez
   uVgMtikV/5tunTJ3a9Vh2IoxRrQURBOxg8ytzkrxnUppjH0Q6Y2ltI95t
   IxF2+glfp05f0ZptsDAFk344usK6QbXyY9WnzUQq9U/iZRt2MVbn8CSgO
   idUlN48b7Tcm7ir1A7sNxpfj6ONv/X5hA4u8uPZRGI325LqBSN7AiMof7
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="258662938"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400";
   d="scan'208";a="258662938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 01:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400";
   d="scan'208";a="563449310"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga008.jf.intel.com with ESMTP; 28 Mar 2022 01:40:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 01:40:38 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 01:40:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 28 Mar 2022 01:40:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 28 Mar 2022 01:40:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2J/vLb4FMD4Y9vXa38OWpGcE8rBBWqyNWBmcWg8dej/VqsWLhQETF1n4VLvWBRw8KsN0ynfxXoOyGY4A8EuEwiV/YmDBJflCxNQZ0jH0AyfFBlN48QKwIS4oLFwprpXN0bFVEcWY8oKhNMxUCHQBwIaXeWoUj5NYsZZ+tE7+xrHSvSkbFgU3DUDq9LwLsyV5cuCQt8pQg9rgIXffr9V9zHzgA0/8kifA1bJvkukx3hjfe/6MfSlP5364w3FUZ964GXIeCx/oJz6QQ8S/91gQeF0IqrxDbh+KYqkn75rQi7QOHAYe3TD8Zs3wi2koQ/WkLQhj9gXX1f4y/64BEkMrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZHOk6zlRqL/TUFIHeFDuNyBERIokwFuYzO39/DBuqg=;
 b=loKvI5neYutiX0/vdBVkUnk6pwwgdVX98P6B6DZD1WqXkkDiar8vFVbyTe79E/4BsKcpEhbKJDnU4B/3Vj1E38hUc7LVqwepIdqWxHUelh2lMDYK9twU9zpk7QOqOaNL0B1qg8WUZW3eqxK3UXJg3mFqTh5q5ibXYX/1TNcNVe1luCA7lopNW8ku1xu4uVf3jkBfzP6vOy7QN91ilv+UB5/CfOu8VXgEQZxLuKaY5wokuqyS8no2ojAeq4HLxFrvlclg8zba0muv/RJY7kd82GwwN4fy0z567jWcx99TvZ7LSbNMFTT0hahxMMqEM6cAx19fu2hqwh3EP4QO/FCY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by MWHPR11MB2064.namprd11.prod.outlook.com (2603:10b6:300:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 08:40:36 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::5de2:7c09:3341:9a45]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::5de2:7c09:3341:9a45%10]) with mapi id 15.20.5102.022; Mon, 28 Mar
 2022 08:40:36 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.3.rc1)
Thread-Index: AQHYP5S4TtDWVj6DOUeldHZQC/aqvazPXL0AgAUii0A=
Date: Mon, 28 Mar 2022 08:40:36 +0000
Message-ID: 
 <DM5PR1101MB23488D8E9B608501F1E7BED6BB1D9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101017fbc90f206-a40c8f82-ad4e-4e62-aa9c-c427260a2af5-000000@us-west-2.amazonses.com>
 <16DF7E3A0CFE8C1C.31271@lists.yoctoproject.org>
In-Reply-To: <16DF7E3A0CFE8C1C.31271@lists.yoctoproject.org>
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
x-ms-office365-filtering-correlation-id: 5a8b8993-479a-4828-627a-08da1096a13e
x-ms-traffictypediagnostic: MWHPR11MB2064:EE_
x-microsoft-antispam-prvs: 
 <MWHPR11MB2064ED9A55BC510EF260EA09BB1D9@MWHPR11MB2064.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C6X6Tj6KMotry9/P1KIh9kqPpkRAj1QSY1nu6RvynXme9U8MXKeK7d0r2aVMO5KqxSXevn3BmeblQmbWBRRylB5h6SKA2tVd4JJO1nxs9+lo4JxVgK0/pdvE/K+w5HObqwjN/1tK1OZdoaGS15PZekXdT/GxxO50fAjIUgPdjh2RaEAlisuYZXRjLthdCS79uNz0TVHs+DTGA5keJDtCr0/ExHdebGlr11UYSB6KaxZ5z6Q75eRV9b8nikXqutE/imCFCX1LQiukVO0iH0Q2qwfQUoS5k/BeKvXMp70YxZ46P3QrhbGgHUG27BEgB9naOXui4clFCKx+JqGOSJsoSeefHznSQmCVQgf7j+UaggPMK/uOPM6mkS+EoKXtUMXewIjrK91+cvMWn8zJiMCBeV+I/QOuKkk0gNWAQrd1QQ5pa794Ckbtjr0T7lzz/FBQCl1ogJ8+YnZ/i+aKcQ28+P3oa3r7UJ86JTpG1+MNJw5npmoQq4YqWTLgje6ciGH4j/alxFdjh6hQ2YMNNPt1mBaVdZDk+WIAaf7EILPVekAtJTRcYsV4yFa8zn/yN+lad6K38RNLEBb88HjWI61z9u+Cs13jf0uNu2nbibQ5sZDeQ5cTSsNQYlxmqXI/c13U8g5jNC+woqYtHjPCNAGcccHtLY2cBSyvLowx+e8su3I1ZIb8EsQ0Ru1+7nFBT/+jTTwTUWKJraYSWlznjG5E+gm0bYakzM7FDj8zTI3L5CLJga27u4Me9JlDu2s1o3nnTam1VCWdT/8zcf9juKa+iWt6STZyfvsN3OeCncD4vn89+rhSX2RsEkhjnVCjOPeALPo51RnMDx4RAp41vCEdyg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(122000001)(5660300002)(38100700002)(83380400001)(86362001)(186003)(52536014)(15650500001)(8936002)(33656002)(55016003)(2906002)(82960400001)(66556008)(316002)(38070700005)(9686003)(66946007)(53546011)(66446008)(76116006)(7696005)(71200400001)(64756008)(8676002)(110136005)(6506007)(966005)(508600001)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XErT+Gx5eBde37SWNr2rwVHREk6FOAozYX7virdr80jY7D5xI+cUnJnsZRTg?=
 =?us-ascii?Q?jvRrOfhlMcG+zUrcwnXRCf2bwsVtmI41kQMiTfQo70ZMnzlLlwTmnfLvstXo?=
 =?us-ascii?Q?hqzxWT9+qvlntMI7CoYEGK+IykQNoAToEU0t807/ul0Vdk6bx42Qw2EPAoOL?=
 =?us-ascii?Q?h4cLbiSKltwp1HxIpFJESHrlbZMcZiPl5y27hKC08UvHKXVeahG8a4k9WThY?=
 =?us-ascii?Q?6e2qt+sJhpoqfsqpNa5sLEIJyUkM1RDGTSrOsbNiEJFa/uX7W+yo5SoE1z22?=
 =?us-ascii?Q?mup0RYr+SZUxGAgEQqqwJ3+iW7WZuXmjHWrYZ1boZLlQIyyD0sH3WhD/1yHx?=
 =?us-ascii?Q?/eCI/zSXuLKG6GJBGByK8caNHcdfq5ljOlQyK6uC83B87SsfFovtI7vj5LFI?=
 =?us-ascii?Q?mTJPoljuUp2vKu5FdEawLHbafkoY5l76kRLUDOwRbYFHf/VCjJLzQlzuRc5+?=
 =?us-ascii?Q?0pkWyUhJNiqeUmbygEo9RD2qZS9HTRstoEnYuJRUFmzTNbMAtjPOOAxDWNwd?=
 =?us-ascii?Q?8jUixMNAlwKT5tnZy48iuNgY2/aBdCuycBfhWRthmP5kODmBbl8wfv7rh6Xc?=
 =?us-ascii?Q?NN9xQZfNvbFfU4F8lFwmV3HF1c0qAgRKSwef70yWBFnw8r40kop0cYCK9Iov?=
 =?us-ascii?Q?nRiLeUsUmXpR3ahiK0QIx71JalBtxGIqIz3+46X5CfX/lrH2/j72gOdYrQrU?=
 =?us-ascii?Q?Cy2EfpYldYzwCekPHIOs/LyFhoSeOrb32CrKJGJN03waQsr+bOBFxPdsQUpn?=
 =?us-ascii?Q?JZRwtds91TV7WtIFbzN27VAq2zFu0ttbQ/d5LxiSQbJTEIXaOxPcBfqzXVxI?=
 =?us-ascii?Q?wxKoheH9e5p4YGEPZ4bmonR9XSgalRPNWnSrcXVFOO2r63IBUB/FG6qHkjeG?=
 =?us-ascii?Q?0ze25lneczNTovjZtempj3GFRzRuj+PGB2C+JJcQ0+NcSzJUIZlo3t6r4PlE?=
 =?us-ascii?Q?5s2krk5hHKipl+YgznhMBFNIpLwXqsMTLuVxJBZJg8cfcpOk1Y9TjdWEmbc3?=
 =?us-ascii?Q?JNTMC/s68uLtjA4ytyebpu9Okm4K+MJoGsd2XwQIru6jXR8K0q6rke9gQaTU?=
 =?us-ascii?Q?ItpNKOoHnKBSQlVjisiAss4m03N2xa+WKfK21SvSP7kzqL+Ejzp6Cz5RjjQr?=
 =?us-ascii?Q?jlkDdkPoiu5aYCpFR7XV55YR6PzVzNE8qzZIAEjM2DHOa0beglMB6whcifzG?=
 =?us-ascii?Q?ckfIQesIruhZDheOSbxGo5CvLDjk34YHzY0H4OblwtKZ4lM7JTmf4U1xRyGj?=
 =?us-ascii?Q?rB22rc1484Fb3SGI1TCZl2KhRlTmCnlyFWtVGWcNCcvLvvIxdzs40pJ3tHxQ?=
 =?us-ascii?Q?7TAVgWrdj9OIfIC9dXle0yK/yOnOQtmJ7RJnrtTOS6UoBSr8lzWuVrNLF40C?=
 =?us-ascii?Q?5/8s/PeE9xSA9T8fH1EA/YVJtjZ0M4LtFlyeFjF0hEmhVtaGFoQXuFREUPq0?=
 =?us-ascii?Q?ODLkMJ2FLRFqZmkxlwoifAeSUlVDWiFZy37R8bgcXSP2Np+OOTcKxjNulVu5?=
 =?us-ascii?Q?ffBKL+92AYljChJ3krAPN0dP40q9fB9s2clrgF3abX53YYGUC2cDq7u6bZH0?=
 =?us-ascii?Q?87JJoec2Fpfy6Q46PtpUd5HURoXP4WmqtZMqb+5BX2nhqONSxeMnYvupMlm8?=
 =?us-ascii?Q?9/NHPvBtIH56JHiNayFGMdlmp9FJfVez6ShLHRl58yYr+TPmU0U0iGj03FWX?=
 =?us-ascii?Q?e6WUEeq8tImIEnJkRPJ012tVgDIg9mbOndtU33we3Zd5Cu0BjRnOtkSzvZr1?=
 =?us-ascii?Q?otue5J9fl5DumfL1SriYkp7PReB3yWvPQyqpJstIpw0m4mDJ4vSdq3M8udbv?=
x-ms-exchange-antispam-messagedata-1: HCQbwgcIWdf+vA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a8b8993-479a-4828-627a-08da1096a13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 08:40:36.1299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 iqyudKW81+4/KT3NbuNsOyO+BRgwZqW8xWJTpM63NDfik96jULZ3Jh/CozwTmxeeZEmCXqXWWCQASwUaI8TZTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2064
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 08:40:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163686

Hello everyone,

This is the full report for yocto-3.4.3.rc3: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Jay

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Teoh, Jay Shen
> Sent: Friday, 25 March, 2022 10:20 AM
> To: yocto@lists.yoctoproject.org; qa-build-notification@lists.yoctoprojec=
t.org;
> OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [yocto] QA notification for completed autobuilder build (yoc=
to-
> 3.4.3.rc1)
>=20
> Hi all,
>=20
> Intel and WR YP QA is planning for QA execution for YP build yocto-3.4.3.=
rc3.
> We are planning to execute following tests for this cycle:
> Please note that this is the rc3 build for 3.4.3, the rc number was marke=
d to
> rc1 by mistake.
>=20
> OEQA-manual tests for following module:
> 1. OE-Core
> 2. BSP-hw
>=20
> Runtime auto test for following platforms:
> 1. MinnowTurbot 32-bit
> 2. Coffee Lake
> 3. NUC 7
> 4. NUC 6
> 5. Edgerouter
> 6. Beaglebone
>=20
> ETA for completion next Monday, March 28.
>=20
> Thanks,
> Jay
>=20
> > -----Original Message-----
> > From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> > Behalf Of Pokybuild User
> > Sent: Thursday, 24 March, 2022 11:35 PM
> > To: yocto@lists.yoctoproject.org
> > Cc: qa-build-notification@lists.yoctoproject.org
> > Subject: [yocto] QA notification for completed autobuilder build
> > (yocto-
> > 3.4.3.rc1)
> >
> >
> > A build flagged for QA (yocto-3.4.3.rc1) was completed on the
> > autobuilder and is available at:
> >
> >
> >     https://autobuilder.yocto.io/pub/releases/yocto-3.4.3.rc1
> >
> >
> > Build hash information:
> >
> > bitbake: 43dcb2b2a2b95a5c959be57bca94fb7190ea6257
> > meta-agl: dd8e34ef5383d95d941a3afc9a03d3fcbba699dd
> > meta-arm: 33bbdc67f2ed7189398292ff58a7fee42a85a166
> > meta-aws: c92344938ab4d37de8bd8b799186dbbe3019a069
> > meta-gplv2: f04e4369bf9dd3385165281b9fa2ed1043b0e400
> > meta-intel: fb9e0633614dbf956da185d291333bcc1b137e5a
> > meta-mingw: f5d761cbd5c957e4405c5d40b0c236d263c916a8
> > meta-openembedded: 061b7fc74f887454251307ef119b808a90654d3f
> > oecore: ebca8f3ac9372b7ebb3d39e8f7f930b63b481448
> > poky: ee68ae307fd951b9de6b31dc6713ea29186b7749
> >
> >
> >
> > This is an automated message from the Yocto Project Autobuilder
> > Git: git://git.yoctoproject.org/yocto-autobuilder2
> > Email: richard.purdie@linuxfoundation.org
> >
> >
> >

