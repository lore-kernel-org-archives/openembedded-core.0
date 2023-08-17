Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8508C2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 08:26:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.182617.1692260767100421956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 01:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=aU1xOXBv;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692260767; x=1723796767;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jkZouR/dH7bdeJAj5hzYcmvuuOifHOFXMfJMretbjxY=;
  b=aU1xOXBvDJacrEiQ9vHIbQHtNBE4RmpVjvw8fH/FGWsyU0tQnQMP7AUk
   epRbvDy5o5STIhwCT2WRXFUs5DjcIBZicQO2El607dbpao6uFzpTjy+1r
   wb17+ATgcaAP8syZEepgLLEre+BoBbkaLBfN6VkbQ9KBI0jjQO1RbhXPt
   0RznbLkTqPY60y+XqbcOBIVe/yox/Fjc5Uni8hX+IL/ezI/hu52Pb4Noj
   G+X9HnoKvUHq0EHEVKaH5UUil4FLUf3URCcmCZHeBWxIgWtV+WwgdWtHb
   r/LKTH49uhf22omXDxTVgXZhj6kFgunHXuxeKj1sxfNiugMmQDxb3FDiL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403728009"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403728009"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065161954"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="1065161954"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 01:26:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 01:26:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 01:26:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 01:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V88V0zEmmJnRN5BHBzzxAlHtGTULaEs5ob0HOWROi/tQM6SHbeL1CYG57zHIslryv2OD56p54Os4Ry9bR6S5Dr1eGzRQoBBanHnKr6PzL05zCrnwGKtNFy943DgUFzD1OZvSy0zK6OY8mH+kPe8zoLDTUPgTIxnSsaoF2RZenDN7cylPw11UcPIZTdqZijPkP3PMNmreFTaVAw9m5JjyuQ/G9PXV0voQ5hnEOgrF4TsGUE1sEyS4gZDpKmkVamfDMLFmF6EQrZCSegl3vH2PnC9PSXIQyk4YDk53N0L8Ho/unVOxHgelTHy+hYF9nIZUnqBG5MAs/+Oojt+Hdd0mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlmwwxSfnZKxHpFeu2JbxIUx+sZ9oMoXUkRaI1LoVE4=;
 b=PLpzTwy0Gbtp4a13BzbXYy2PpuX4+S2HzYHj048VX8AuRWLAvt0cNhWlhWQ2NA/Sv0QRBR5WMwu/svdtRdeO02LmZm+WNy6KiqRR8jPgnwR8W1nhsoxCwp7FSetra0YaeB4o882dmaZr/W6uwXLR38J4jRh8vklSUshlP+u5l8AynATFOchTlQ7fmLKv2WzJxtlOdfB6bp9MNh1bVjVh9BJJlteG2cZR38y6czajxCjkBGV3Vm3ylfKKBztp70lvxNb7C20cv8hiXtP7Gtgv5hnb6zsPrCeHat8RmzXqK/KdqJIbS/a22NXfMa/JjexP4XZSHIxk/rUB+bTOMjyw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 08:26:03 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 08:26:02 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.12.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.12.rc2)
Thread-Index: AQHZylD4g9odbdbTcEWBJ2DR0UEsoK/uMs6w
Date: Thu, 17 Aug 2023 08:26:02 +0000
Message-ID: <BY5PR11MB415260E615C56133E1249351A11AA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010189d780e41f-1d695671-e532-44aa-8536-5470a6c0c916-000000@us-west-2.amazonses.com>
In-Reply-To: <01010189d780e41f-1d695671-e532-44aa-8536-5470a6c0c916-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB6944:EE_
x-ms-office365-filtering-correlation-id: 681acc37-46a1-464d-be0d-08db9efb97d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: flwbi2tCXD9eaBDB4KRcnM5tVvOXPiANLIC9ran/hHmlgeWfexu0vPQjhug3yDsIdnEKMncT5mgOlwh78T65+pB5Xjp1SLF30BTYgjECD2qi9OH19fvmxSK/ak/EJtLVgjBVU/6ZAsw/eYYzSlwiXDVwjhVu0cCNCC5SHEkS1uEBu2D0CzE2q8kuveJZ8neUHClpud2S6fl0LflJ3VHhcNaAhNfOTyRxKtw2LXFEYVlszsPaq2sZWD593Y8Nl62jDwYRh2XCjLHQZo8sqc53AJJlEOChD0z3S2X/WGOh36nzixLOLZm1iHZg/EWEXA0ZbPNdowJ6f1yatQxCz9fKwFZoZ3s4US+G/wb9BvD5lvGpGMg6bQEvmXdQNR1lC98QoMm4psMrexHabBT6Ap8bPKxfug1aZMaA1SqM/CNNNdf7/9ZQtEAz1qgcf93rermD1dTqDh2Ls8LmAm9/Ga3K3p7s30bd/gDjQS8vi0Ian3khIPZ4VroPYb5IUvMkmaNR6tJrV/Py7HgEvBXF+gUOvGR94O6lJA0Uuh/tYaDyMuiIJsUYmSTdbR6tBIYKCjaz/C1WWgHbQy/b6Fhdsh0Io9tMVNFyFzhR6i9JXRGIaPr6AyUGY2+ku4zQvZBwmVwwMMal7shnjxAEOyfM1rbGLIJUrIrnGMblRh9zJg3uPE05c0nKF5dPAQe8GrAZAuvh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(55016003)(66899024)(83380400001)(2906002)(15650500001)(478600001)(110136005)(76116006)(66556008)(66476007)(66446008)(66946007)(53546011)(71200400001)(6506007)(7696005)(64756008)(316002)(966005)(52536014)(5660300002)(26005)(9686003)(41300700001)(8936002)(8676002)(33656002)(86362001)(38070700005)(38100700002)(122000001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QqCn6Yf+ULdfp5leThY6IFMtLG2cW2Xh9+JTlu676ItOTDIKN6UOPQRdQ77m?=
 =?us-ascii?Q?ob2CDJI1dpjvubfmu8p76pBrHutuu30VyWIvfoV2iPWnI6fTJt8tV/ohWuBd?=
 =?us-ascii?Q?POGZzE8fmGvTzO3jdo0WnpniRGbHXZLTiWs2A6R2ICKbpja4lJSHKBL9dGid?=
 =?us-ascii?Q?jK+s05DzndY33TmdI6oA5gdhKkVrPD0I0BtInmvRJVaVWEtOA588RHb00/rr?=
 =?us-ascii?Q?rl8BTkWGWFZ2AccM2CIaKC62MZApXWHiPpSYqm0JlTVQ2ww0+o7mGHVf16ES?=
 =?us-ascii?Q?PBm8efjfpyBXZTkxptn9V/o+UAP223sTpFKmJQzzwLt5/aP6qubF7L6byRjK?=
 =?us-ascii?Q?8KyvKTWjjXHLXfzSILCqOIJtnYsgEYafAuSzt59Sa8oTBb9MwoWPGTkJoSi0?=
 =?us-ascii?Q?vCN9PnlpyrkfcZyK7glqT/TfozAVf3LQEfPVGWV5AOr+NBUXuKy78JBlSJFQ?=
 =?us-ascii?Q?WovOalGTGlBrrz+BtlWJcW+3wA88uifcN70CjDPLfg7sLOYYvvkyNqv7BXvK?=
 =?us-ascii?Q?BP8VMFHwv+ICoJOEGRjenWm8ky5nVzODe4i/dGxjORTuQMQ9ccAdDnypXvKV?=
 =?us-ascii?Q?paGAzv3ZwhdTbe7Veh6kBTQPR0Q8GiyVoe82vRO8nTxE3KlkXjAKiUawt4TD?=
 =?us-ascii?Q?9c8Ge1+LbFdhpGJoDAboQnm/EtdGnER6mSlzWFg5TA09IlD33v4ZcgXzb0cR?=
 =?us-ascii?Q?3uvV8uU8YNntn2O8v5zBGDk5+c+OMA4/wOKz1DOSEGRwsUb3ynXm7EQuxoDG?=
 =?us-ascii?Q?cPinP4dHSuzWtktDSALd5S3HoSMIhZq+AhID5QGTVVNxsxA7HCg3Si51HjWa?=
 =?us-ascii?Q?TfsFfG9NKqXl9KsNOaXCpW1FBLJ1Q5G0M6jsEHWuczR7bNzkIK9E5wogMUMn?=
 =?us-ascii?Q?Esi73AHymoUXELSR6QW078FQdK6greNbUj1CNCjakElIcRz1OmJOFHX4hiW9?=
 =?us-ascii?Q?pxiajJZW9eBkQaEsFQXBIlmUtwomLLdmOkfMkWZ7xCkl9CbVwUXkU70mIlSF?=
 =?us-ascii?Q?Nyk6EZe5LkBUsN4bhn5Cq7Mkpqj5bo1xreaG5xarv1qNjtnHGuYtJYaW3lm6?=
 =?us-ascii?Q?G/8YKZhcTx3Oznq315NsoxSBWVEBaYoKx/fERA/HT9ZcwsIe4UfX+G5VeiTb?=
 =?us-ascii?Q?5TEeGg1z2XFM4RTdZn2HX6GGCkIinbPS6RRxLc1FIJXsZsCqBFyNxh7udOre?=
 =?us-ascii?Q?CLX6CbL5GaKg5EGzBTUycJdQQyIwOmJ2MCnw4yZ3MOdsTPSvI+xTNVo7BBts?=
 =?us-ascii?Q?AnYhK+teac3yF+EoDSotqCqgBP8x/2iivngm5ybaGaDP9lVxMvPHT9nWSGIt?=
 =?us-ascii?Q?uBLwbT6/+7hpKP5itHeTSZ7EQf9LHUQ9bK0TiwFPjsiywgBasMMxkCRDqbe8?=
 =?us-ascii?Q?piupLo78EGmmdNt4XcdvfG09aB0rcG9kMDxcpXjCunc1b6iC2pKQ3H0oMqXY?=
 =?us-ascii?Q?bNgTnBsgjOZMO4gwvkpCrQGbfYcFsdCWUChOIAyUUkG+qIzsO4CfjtpEi0b6?=
 =?us-ascii?Q?mQRORqeKpZ+nUuru3y8RhyKc6y8PJJkp+mh100YzpgutKOGdFf8vlnjPbGZB?=
 =?us-ascii?Q?/VIaLVtqQnvKIbTZ5KPGtD/tW3/v5kBjwCbgIixo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681acc37-46a1-464d-be0d-08db9efb97d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 08:26:02.3607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQM6qZXOSukb1kr0C5PqORTh1+24Zr0uiGF63MDlRgWVxCPwgu/e6D8tenpbBc8lZuXcm7rIk8TofPtwlLjGjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 08:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186297

Hi All,
=20
QA for yocto-4.0.12.rc2 is completed. This is the full report for this rele=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, August 9, 2023 7:35 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.12.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.12.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.12.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 41b6684489d0261753344956042be2cc4adb0159
> meta-agl: 45b1b63c35c52b8283e1893dfa099607baa0cdcc
> meta-arm: c39bb4ce3b60b73d35c5fb06af012432e70d6b38
> meta-aws: 723a8a04965af482fe65e8e56eabea858858bd88
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 1aacdb4ed1e639cc6e19c541b058264eb17eb093
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 4da92ed9be41734f6ced46b981958e2e868cbff2
> meta-virtualization: af02908efda1580e77b3fdeed25b124a2b8d9482
> oecore: e1a604db8d2cf8782038b4016cc2e2052467333b
> poky: d6b8790370500b99ca11f0d8a05c39b661ab2ba6
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
> View/Reply Online (#297): https://lists.yoctoproject.org/g/qa-build-
> notification/message/297
> Mute This Topic: https://lists.yoctoproject.org/mt/100633804/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


