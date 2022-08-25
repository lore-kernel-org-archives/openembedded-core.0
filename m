Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97395C48BE4
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:18:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.22233.1661422687319730019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hm5XFvt+;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661422687; x=1692958687;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Edu3XXBtfD5aPn6b8gp6YMkjIy51J1RH8+qN7CLm40o=;
  b=hm5XFvt+hqR5XH/b3ryHmQtV4eCn5gnFPOt/rOsc0F5i3T95pJOiuEaH
   fWELy6LdBNShfX9Evahlx1e2A0yYmRgQnWBZgCECXtCjVBOyldTh9W1AJ
   vHO7Dv1eI78dKy00OqEc95fpKkDrXeCf/nGwy37kAx2gWTcBGdTvPar73
   1TRY9Ehz+MosC1PO398gb5hRQfxe+pGzwk+BR3j1SmetGpRQlmGJ2Acx3
   pu6OAtfDiWq2A4Ghic/NgnA8LE3nb6CY9X5czITDDkGl7a4j8zOvkc23E
   QCT7wjoRpNj1eoS2zccrFx3rI6YohZA7jjgJRs5dEi1CqFgDgj0g2u2+M
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="294981639"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200";
   d="scan'208";a="294981639"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 03:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200";
   d="scan'208";a="610117466"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP; 25 Aug 2022 03:18:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 03:18:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 03:18:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 03:18:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 03:18:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOiK+GA/HftJnFxm5dkYT/I3CLiWDPNJ+qJ+HzQeCTlGSWIaUuONe4WPl7wEGz3KErVbfGHQxyqyXLFjAsB08nOPtTNoER3Zm5tEZzcf2nABGOqmNLPSz5I6T62UQIrdeevovjsORujKVp0/U+dR0sw6Z0zGKX/yB4wATkjGTKr7f4HdHGf45i9KNsZAbt1aFccWUIaR3rjyix8H0THBC8G28Lqp4KJGl6ozvKRaHIdRtNkYEA7nbj6i4RZd0JNy//i9yF9mCQHhieIO+U0AsXMCAwd80eJxBwleGxPxW0JvD/V+e+n7LemmkhFa7BQiWkFG4ER7u7xOq1mXJ6nr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EebWAoDCACeR8ItDnTkfOtczFR9lo3RFgG7X2H1DnE4=;
 b=lvs+FWFhyRUFHij52dfKNVAXdwUcoH0DU+Glto7aiSd2fqhTU/ZSSckXc4Epsje+Rq7TcDW3+66BaxlT/lTCN4jmUO8vGlpziKX712Vgvl1yat3OR0MoV8Xho5CuWskLOw39ld6fwuSsAMXXCMbdklLyAvnzWAz8n6AT5ZWy1dEm4/UZEx6bxBFBjigU1yZRfbNW75i0xMaA+fGRIRYQdh7GSKW4EI9O2jRptDEuhX1Dl+wOMEevmMKCpa3mNtPxG8GTWrceT6ts3GT/aXrC3ZacqBlp7DmtK9C4uY2SzgmniyBx1OCg83TKU3gpvH8hGpZCRGDZ7aWDiiQWUJhafg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM6PR11MB3626.namprd11.prod.outlook.com (2603:10b6:5:146::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 10:18:04 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::9d81:b1a5:afe4:dc6a]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::9d81:b1a5:afe4:dc6a%7]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 10:18:04 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.19.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.19.rc1)
Thread-Index: AQHYtnJbQIJIOxjT40e45Lm87YmpB62/atrQ
Date: Thu, 25 Aug 2022 10:18:04 +0000
Message-ID: 
 <DM5PR1101MB23486DE735B20F012990D33BBB729@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <01010182c7908155-549934cb-cc80-456d-8a05-57f85ccb8c14-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010182c7908155-549934cb-cc80-456d-8a05-57f85ccb8c14-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: 49c5fac9-2cf9-4513-da3e-08da868318d5
x-ms-traffictypediagnostic: DM6PR11MB3626:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mDRuqu6fOpXXWRq2TBW20vjyrlKIMaozO/Y8rlyKmmuIwIlTZuF299Tnl7H6VcTMHgcluBHMFw1OyWJ2oNINFGiErreIx9vjz2QCIHBAFduqR0soASOplDdJzoe8DJkMY4Qdx7qY1AecDOt7DCCq+RQwPZKGRUYU5cWJfIMz+DyvQ5Vds17nCsdIrQPmhtLhy+V5M2gF3GudPyPsJZz7cvMSGFsgq9+8XYznQIrCcySgz9ynG0lXoDyt2S0Wnjokaj2/jjJ7as4pH7KAoBPqTs3EEvsSuj0rAyoze1tuULZL50Zyqcf7Qst16WbzOctGIPhOk5SQRQiflIsehgykGe/YUPBAbsEyVis3EZnT0BvN4CuBYPvwpVUlc8+X48NKq+GDLJwcbqI/HoNanv3wwaFH7hvlKsAfsP8Fu+urmA9b5duMmktWPV5pAZG8MaUWRQeaasPxdE/QR5waI3PklfnLqYBnxK0EoVeS5FG+RxEmjIPBtpu489p8mQ8Kf+/NMysPYnBgvQKMB5AmBFM+Ni1kKPGntlP8gpd3qUctfgtATKsQX55/c4E1uM8hQVocINoqUybGIVAeZNmvG4Su0zBtgkXCulVSOvZLRrG9t1H/Eco22B/PWhmJhh9WgukFhtncm7n99ukEISpnyg/Jc9TnUnKi+kHDy18dXSTYf8Kz6Z7JSKIDUqa5B3JmcmApSTEXm7k70E3XHFZwLU29UpFptmC42LIAr2jBV0/ULhD7s3Cpbw0qGe2xSqR5y1ZVwXjurkz5CaZFBIu+zz7/O6e2/gjBsO39a952WnoJ+WW/IhbYdO/sS6U4aBsQtOBAfnDJu1OZSIpeB3Yw2Y6x3w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(376002)(366004)(346002)(86362001)(55236004)(9686003)(38070700005)(41300700001)(53546011)(26005)(7696005)(6506007)(110136005)(71200400001)(38100700002)(478600001)(122000001)(83380400001)(966005)(82960400001)(55016003)(186003)(15650500001)(2906002)(5660300002)(8936002)(76116006)(66446008)(316002)(8676002)(33656002)(66476007)(66556008)(52536014)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KYU/Rmin5lpbSpvh9JgO/uFAUmGzUy/3soq9cazN0JY9YL2nLkFcaAvNDt9J?=
 =?us-ascii?Q?5BX5MwzEA4vJFQfTSunUJkXVg/v39xnrs1KxTfAOhRuIExZ/N5E5Hnsnwd+z?=
 =?us-ascii?Q?1jSTTtPyDhWMYfaM3770cH8hJzEh/K9GA4xYqKp4vieuSivzgLIuVm+72iZv?=
 =?us-ascii?Q?pFmIuB44ICHmgagIQequSZc0TIYoJH0UxLso8fft5TSYl1GE7LbQcLYSpEcG?=
 =?us-ascii?Q?wY3e0rzy41X7BoDW8E5KRzQYRiPwljiAOXmN4hLtRq+smf6f/W0pshuW0iFw?=
 =?us-ascii?Q?HaAaw05Wc0/B3LSX4QJVFDhzQ/NcNpDOL2ilVIX0bhWhLE8lrUiNRGMYRitR?=
 =?us-ascii?Q?+inCg0DbCFZ6wmWvLQmPxXIiuVagGRAzARjZ9A8hgQ7cqcjTykmt061np3Ek?=
 =?us-ascii?Q?LHeRH1kKhgfxrOAyDKEqSsu9pXFgFS316gCmr1750CMy/9EBXPZWALw8ACdo?=
 =?us-ascii?Q?ZMDEP0brfrk56bGQBdM29MT2b5N0d99a0Nl78FocQ2+Wp46rT1RmO3r19We7?=
 =?us-ascii?Q?8AIDnULblp2RcBH8ZiULswNaaXDxKHqYbDAkFI1tQTAWoWNbKds1J433n5l5?=
 =?us-ascii?Q?N/SWRp2hjtWNF3FGTx7+1zkLCpWG4no6boBtfHB1Tu1Fz2C270fl5vQxRegk?=
 =?us-ascii?Q?tbv5oJ6wQ8Yd/DX8b/8+RfgXEc4N31gCtxB1jr2X66zcX/c1TJ5P/hY8b7vY?=
 =?us-ascii?Q?8vuy+HZPKGdTEsnRFMA9ZWMTjDE/OZJkJrQyQrM8PalW9ZqrWvxe4Wir3kZl?=
 =?us-ascii?Q?gzXoweihH6Cl56RMl8ewMFXjJOoTvLLmjuVZ3v5CGmNGhC0Q0kW82sAC3zoy?=
 =?us-ascii?Q?MY/LLCbd1JlwelP+Ack7RS65NIF8Vipjd0K2ej1a1xE2k/pSb44YXBijsB1R?=
 =?us-ascii?Q?O4fWNCgHAayN+bC8j7nrrNlcYvrRggYbUks2NdmzwdRjZxnq19Q2FlpHgsLr?=
 =?us-ascii?Q?ZZYsmhNUxPDxV2FzbcbfatxmZDgh8jGWfHr9ulouzqVf4EeGS8O0XLIvhiLn?=
 =?us-ascii?Q?qvRdgmwtCADOOSvKBOeqUtmNsIdQW47JFH1IBnsE+wG70rvd9IMq4VgmlL12?=
 =?us-ascii?Q?KulmTgw9MBzHjAlPLK7V+ArcZlRFJYeOw0LXyGanGd6r6dkdBZGeLVSwTCyb?=
 =?us-ascii?Q?fkkuxzSDYnvjlA9pcWzDn/G6695FyFVYcu0pF6EE1KeiPPSECLdwJsVROYob?=
 =?us-ascii?Q?4wKvDVCw+pJikaEZNsnjR2hLUIpM8CdY29XfaaBs4hBCsb6crwRCqE7+VbsI?=
 =?us-ascii?Q?JPBMWbyEHYjepIltNbPyxJO4Wbq9tkm1Ev2qQaZgW+hxMtqzuW2jfTYLWwDW?=
 =?us-ascii?Q?NtAu8jRlXIlwNWbQNtDpHsSUF058YLQH8AM5UbmypGPdZ+ChwVpgBRAAOHkn?=
 =?us-ascii?Q?fmaRWagbh8qBnPKGZ3MMtRMalgQ/KyQS4B5IzFRFxJr2QKGprq71BhI/fkmL?=
 =?us-ascii?Q?pbsxOrIzmeXWU/JmHKEcWtwJ3MqWoY33Vi5SwXrW/cBnF2GAkel56kW8tOKr?=
 =?us-ascii?Q?PocO9M+hhLskb3OsBZf1VjDLuPiNZbMgn+vVB03L24k457mpdQ90dZIF1vxc?=
 =?us-ascii?Q?txrVIkJ27LmxbTvsCwesNXjlP9HqUyycjs8+iFkb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 49c5fac9-2cf9-4513-da3e-08da868318d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2022 10:18:04.1696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rCv2g/6fG9tF38jLlsAg7zcml2IjHabE0AfLezps5NQh71Axx/tfzd4lgFa2VsGIe8pghxksVIL6w0dJqa8W2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3626
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169843

Hi Everyone,

QA for yocto-3.1.19.rc1 is completed. This is the full report for this rele=
ase: =20
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
> Sent: Tuesday, 23 August, 2022 5:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.19.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.19.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.19.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 17be38290d1e971cd89785e6bf44caef0a6416f8
> meta-agl: 8ce71214c1935c2160d139140972f328afacabee
> meta-arm: 69547052727a461f33967e64630aa03b34a7eadd
> meta-aws: bc38cc397e98c6d6d8d4b701de5944f72d169108
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 8ed6f20cfb116e88e573ee6a08637aa5ac12e1c5
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: f22bf6efaae61a8fd9272be64e7d75223c58922e
> meta-virtualization: a63a54df3170fed387f810f23cdc2f483ad587df
> oecore: a3cba15142e98177119ef36c09f553d09acf35ef
> poky: 4aad5914efe9789755789856882aac53de6c4ed3
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
> View/Reply Online (#173): https://lists.yoctoproject.org/g/qa-build-
> notification/message/173
> Mute This Topic: https://lists.yoctoproject.org/mt/93192448/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


