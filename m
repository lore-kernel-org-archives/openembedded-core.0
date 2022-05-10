Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9240C433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 04:14:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.5717.1652156039420103544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 21:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=R/uwq+0k;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652156039; x=1683692039;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L5Y5qziyPm0r7Ls2IVR9INd3oX+zm16dHEsm2cbOuHs=;
  b=R/uwq+0k+uPtxCWkkuINuZOm5pcN13rtxS1jmGIoDgBfYcCIWoL2Drvo
   YUmIYTi2phe0bCu3YMckpJVuTS3D3tBDS4x6x/uGL7+z4j8Tow0zcJl+3
   ObvPpHmJYUOFLNrdr50J3nZLWRZDpMo6xdDxDRkQcjUe9oeXSWCpg4eLS
   vX6JpkzdfBZGcyMKe2ZNEaV9JTjidL3NoAC4VWrqOFUdsEXoQV7kMuK1d
   WZbaMjhB2UwNOyrwxq9xPPGGgbtI65pLtncUnfSCYHnASQ6oL3QTnN7IJ
   BntBWmYPfbnJ7QrZV7Tz1+Zw8kleKt2BjF7Q2YDk2nHyFG2s4npXxkQZi
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249785758"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600";
   d="scan'208";a="249785758"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 21:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600";
   d="scan'208";a="593258818"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga008.jf.intel.com with ESMTP; 09 May 2022 21:13:58 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 9 May 2022 21:13:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 9 May 2022 21:13:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 9 May 2022 21:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euu6bmkIcd/+OgZVNPRkP0CQTaB3UGdYiQpQhUUyRrtAOhJktunkXJCjNSigsh9L8zTbFrL2oJm1UeA77ECG1+/0ZG3LOkKrb1TkpjNlYekuxU0Ig7vn3orTBc/qiEDSIIr4kJJEa2PRJeAm75dlnQ7U/zdWBJvCcgYKGeHNWpSC3gaoCYPuHuAa5Beq6o3AtL3dXqLaLY/PZ4qZ2MAgXD5nPyajZIHq3wEX+c815bF3sS29CyWwy6egsndSWdnF5jCxvEpM2SZDV8cAdQ/Mm7ulferKpmGBclwLOWnq5+NdkQ+VO/vxhbjISedlPqjb+PnJ7LE4D6oy6Uy/JI2YsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7vqc6zJ9o9J3cEiCg4ILhsSmNlsmsefHjMzMOEK4sA=;
 b=S5aB9hOoENNADZ4b4ESPDIkKMnXki1YM+2bdvZLtmY7s6fPdt9141w1/SkpxiypiETHm5Wu2aAfjUM8KuwG8mrkv6dqcDyYjsH5twVnQa8g8Wcyw2rAmUjVsmwyUnqlYxbWp746DUgHrOV2uGur4p3lRnDVWK/AD8o9SnEv8e7qboe9+cWjr/d4LIAZFWt+o62Lu9uSefrbAaQZT3Ybfr0yaVJvM7EXo0zn3kBY+KSrHnHO2KUozBG0MqPoSlbc9mK8RmkSebSPlpt1hY8dBEzZ828XOjsEGs4q2Ik1FX3E8r/E5KZiP94On8w07uf8zLmNsWCVjDy7g4Qmo/1saGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by BL1PR11MB5352.namprd11.prod.outlook.com (2603:10b6:208:311::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 04:13:56 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::c8d8:e76d:b1a5:f26d]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::c8d8:e76d:b1a5:f26d%11]) with mapi id 15.20.5227.023; Tue, 10 May
 2022 04:13:56 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.4.rc1)
Thread-Index: AQHYX18zt7Y0tlm8VEuJFd6fXX7uGK0XiceA
Date: Tue, 10 May 2022 04:13:56 +0000
Message-ID: 
 <DM5PR1101MB234831B19074FF796016A2EFBBC99@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <010101808ce91651-962b6832-98c0-412d-b766-0b6f9cfbf3e0-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101808ce91651-962b6832-98c0-412d-b766-0b6f9cfbf3e0-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: 2726028b-0aad-48d6-69e1-08da323b8060
x-ms-traffictypediagnostic: BL1PR11MB5352:EE_
x-microsoft-antispam-prvs: 
 <BL1PR11MB5352168D663DB7D3F65ABDE5BBC99@BL1PR11MB5352.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uNqseUHkJ0F7hrxQU2mHSGXLswlOJJhtykBQ+RR0wc2ev0AABer+OJFBt6V6GYETiYDxJ4i9Z0mdBMB3UeJ52BvC6wz5ZcGi+1EHMa2KjMWMvWfAdbwF0Ooee4k4s05inSbODvHt6RTUaHM0OVOIQqzwVDm6rFj+r6hMD2O2UPLgipE+bwIOd/bTUC3reMz2ChpjLAKsNAjOLmocSbQf/MhUMtxUQtLr9CtzJ4NS/GI7Pmak7uZzZpQC6bSAyYF0tHNGbx22At1hyTodwkaKLN/C+RrgTYemmwBu5d9SvEoZuvy8dkF/N3vN6pJ2EHIdUUtk5zftQ8cdvzCeQR1zrM9N2ZBaYzFSAsKlkKykRYB2JRtjwPNTlbe8By8ruZ8jcU9aFFs29CDt2Ixig7EmCMEPFp2tNQab5XSMiyyKWtmZoMHyVVl1coDqzLECOadcELd9TVK+yIbziiwquetpQsnThoQOLUm3w7BeGFaFZ9cNCWvFhrKglVOzjwvVbB5K0WGriqPx+Ijrs39BzHY7qHJsLDl3f+yYqj9hAfYHeLGexn4qbVRp2HhRgxz5rfJXuD8Hztm/nFoiK1XKVrHiyR31rEZvZ2Nta5MI7Jq5CpIFzk/Sx2MsZGrPjHFdktFwEy3WlPiW8OOfPZcJRuCPaAhn8swxAp84OF3um30hguyG5HoN/loBE74ZozscUaCwO3dHn0u5znCmJUxbawOqx2cMXDS71KRoZqaEE7cX3BnxyRme7aGwEtCDv/Mru2evCH40ORRRqy6yWO+8+/eG99RdHLOSNQIYX2Ym299r/ad57H3deL71stqPnkIC6vzX0tIIESewV0oE9PkSpO+ZHA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(71200400001)(66446008)(64756008)(6506007)(2906002)(76116006)(9686003)(8676002)(7696005)(4326008)(5660300002)(33656002)(86362001)(66556008)(66476007)(53546011)(55236004)(26005)(66946007)(966005)(508600001)(52536014)(55016003)(15650500001)(38100700002)(38070700005)(122000001)(110136005)(316002)(82960400001)(186003)(83380400001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?fb9XxN9Gf5hWRTeLZx85zuCK2JE5uZvy5PWWuzOyrieJO2fXWFfL5hRHMINb?=
 =?us-ascii?Q?XHweF/jAcP7N9poe3Ua2Wy3BkG9IVOvDaOM4u4LXyeFlFT/0vD+CQV27Zgri?=
 =?us-ascii?Q?MMsIYhQiSaJp/CG2oIR6FpNdGotN3oz2FbUNxUhnte8QrPR63TTd0Bz39cRO?=
 =?us-ascii?Q?yb0YDxwwOwixFuAtJ1AvJgzd9OIOFcoSrrisLPuGY32ZlEOgtChnRoJNdJlM?=
 =?us-ascii?Q?3SMiNl43j6FMmQVobXrlzDRWAUsSLUY8LIG/2TcImurCcXTtrF/g1viOZ+Ke?=
 =?us-ascii?Q?bzE/PUoW+ekThsbQLSh1DMwEkh9iwjH5YFZgtgYwQtOzurUfbKZmK+yOTHXv?=
 =?us-ascii?Q?YMA2NuwxuVpsY+MPnKHYs8pAd/4WzDL60G0vPfGChz8K+SaS9EUQhPnixfiM?=
 =?us-ascii?Q?Ut/tKEmsPnpeLpK53rxdvgwP0Km2lX1w0sV7ZaAM2u7UDtY6LuAkWZI/4CZs?=
 =?us-ascii?Q?2kLn85UVLWoD2D6j6pDyiv79BJmXXcdQ/DLp9OKmc2xmsS0piYL12Kko47ph?=
 =?us-ascii?Q?krDuV0im8xZNS/NZTh69gSwQjZhsz8Rr+QfCsG8zqF8M6Ex12wHRCZxa4+o4?=
 =?us-ascii?Q?ckn6i8sF2XtxE9LW3l5n3h48WupSP0ksKgkCbKakyp03D46kFsom+9E2+DNx?=
 =?us-ascii?Q?4ZMf0u70LIq5xq3tPhdgvxNEzvMqos9F50f1OxWv3PSMfEcK6JBTgufEVOan?=
 =?us-ascii?Q?ZaRXc6nEI9kNGhndX1BwCBGK+m/gcHfZb7GEqcGsrYjBtK6wThr57nN2Fpdz?=
 =?us-ascii?Q?c1p6qBsqpLexWFqdcqQN+npR1ku0IQgN6F5E+5XLhuG5U8CYOpD8sB40HE7D?=
 =?us-ascii?Q?rrOR9p3ybc5szmZao22nXT100dI2nwq6FIV6PLHVb5UP+kQYQXTUrJOIP4xA?=
 =?us-ascii?Q?GU9y2hrUkGf2tyEs/UHkKLZ/X/bHw06wrHFuff91c+OkMIVy6ssAvCWydiPo?=
 =?us-ascii?Q?/yJ15wMz5uh82KW8hWqI5UW4CDEpg5JfB8N6tFuCMA7CtW2XxKIxIUKQx9PL?=
 =?us-ascii?Q?Fi2OTdlcjG3RGiGLYkT4r3jlQZZhs/zGn4zOBHFSLKCkB2smLg+jR3F6xLMu?=
 =?us-ascii?Q?G2ffIiJonDGXoNivaxQ7zw4D7I5nff6sYZVeZjUArSdiOhH/oMb6TXRCVJnE?=
 =?us-ascii?Q?XiE6iQb0aDXaKzGHo2PsoMOI6WTxLk0ZN+ng3D0bbEOSHRCYbS65FQ6lSEFt?=
 =?us-ascii?Q?Qe2G98wFBUCu23X79sIzNor9qWcxGDe17o/SPkgO4r8ihg6dZDCquQG6wcU+?=
 =?us-ascii?Q?B9c7wZKkYbQ04XKJJv/O0/DhRdPGO03TKtzAfHSL4Ljc+h+3WqFF6fXXEkkm?=
 =?us-ascii?Q?DMzwbiHrytjYDgBjdBL7pt0vorNyfrG2LUrQ39rNkRpz2h6UaEvN6MowEJws?=
 =?us-ascii?Q?2mBTGmnUBIMRCtnbhQf6F561eMtBqiYkQU1ZnCHHGIpx1kBhERO9rLSmpo/N?=
 =?us-ascii?Q?/mvgxdC/2wdwsLilurlwHrU1747J9HTADw4LoYLaOD0u5JjQNoNXZUUVTxFD?=
 =?us-ascii?Q?JBNaJHh8EOb0+GTyhZR/zkIzyxfk7mbp9qV1qqMG7csWZe72hb58eVzZYEsG?=
 =?us-ascii?Q?AowgqJ6LXbmOhGOTTgJPaYas6DohMi1QxrVNEKr9sF2Gl8G3D1gskZqxr/mX?=
 =?us-ascii?Q?K3KUGOUpnA7mCNLhxNbSNirn25zMtRlzbANaO1RsSJH5n6eeKQM6HOlYiEUN?=
 =?us-ascii?Q?NDvt8T3Hr5TeUsVplDag+zRTRcv8UGkXiXar4cEpLiD8+udbIRVMZpyn1J5r?=
 =?us-ascii?Q?XmP7xiQuhQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2726028b-0aad-48d6-69e1-08da323b8060
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 04:13:56.4139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 AuxGs7zMMySJb/qDV8VCPt5xqJbiIFOk2WM+zHswxFnFMC2P5weN47Y7Csq7XLVzhJ2aMcsSQPlUWtn2gzRQrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5352
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 04:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165409

Hi Everyone,

This is the full report for yocto-3.4.4.rc1: =20
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
> Of Pokybuild User
> Sent: Wednesday, 4 May, 2022 10:32 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.4.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.4.4.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.4.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: c2d8f9b2137bd4a98eb0f51519493131773e7517
> meta-agl: 8543843eeb47fa9b45786d3e09bf497fcd5f95e0
> meta-arm: 2623e69db362b357db45c343e6d504909552c2d5
> meta-aws: c92344938ab4d37de8bd8b799186dbbe3019a069
> meta-gplv2: f04e4369bf9dd3385165281b9fa2ed1043b0e400
> meta-intel: daf5c125a744d45d8fa395b576147edd5a714f5c
> meta-mingw: f5d761cbd5c957e4405c5d40b0c236d263c916a8
> meta-openembedded: 9a0caf5b09e14a28a54c3f8524d97530aeb8152c
> meta-virtualization: bd7511c53b921c9ce4ba2fdb42778ca194ebc3e8
> oecore: 1a6f5e27249afb6fb4d47c523b62b5dd2482a69d
> poky: 780eeec8851950ee6ac07a2a398ba937206bd2e4
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

