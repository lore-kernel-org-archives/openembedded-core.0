Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C721C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 01:39:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.38613.1690162796729034621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 18:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=it0zK6Vu;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690162796; x=1721698796;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fFVrc6MuNwHrF1tK/igceMtJsb3DPrcIC+x8NdJuQhs=;
  b=it0zK6VuoF/sx0fBFE+lkfAumtD5I3a368wwEsimnElxeylxRc77ZiZl
   /pp9h3BG3W5tgzi4/vEDc+xWFfghrkdnXRnWo13h4iPQ9dAyBJplNPgPq
   3r1t4GvEfnaPHzXtSTUv66fl+pOtu6gsywJ53Ubh89BHXpokUYvOgiplp
   xpwEYMUvWAnrM2WWxUQKSSmwiNHE0mcfcJPw75C2p9c/UNFn4NMX8qSXe
   8V3nZEYVjL0ZM+NkdsILB8FjBT/JjWM5FOfR66/Eg847Ck2dUxGwpuBbT
   DcU9A8sxOFvOVIVyHHaa9Y7Skof8SgGVvlEFVF8HWcQOvWYB8BWUyKFOI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="347611173"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="347611173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 18:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="755123101"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="755123101"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 23 Jul 2023 18:39:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 23 Jul 2023 18:39:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 23 Jul 2023 18:39:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 23 Jul 2023 18:39:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 23 Jul 2023 18:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFwesKcG/aCj0PBinbVo9sqBoChOvsDSu+zQ5ksD70dzn05FidzBsOfP+9g7ZIZwFhiRuW7W7yfWlL/2wFkzspujcfabrfkB46t2xu2dZp+4HCcH9XJX+8ssmMXkJOPF0lVxS/Pdq4J81J9vbUTDZx+OsgOfZHcHCkRGdYrSMh7cmbm/SmuWmA8rg3IRZa0QSc3jqX7RBnKSx1i7Yk3hHjqQs01Mek04zSUA2kd6czSGCDmHWNR1h4bZFjyHA77ZvBNDRP25exqXF0OovxP3YVm9EIb/bACYyMAX0hjBtb6p1zovYAvKh5eFu8W+PhcIWJN/5aRzCU2wd95TeU3RxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8SFlSxQx70LNeaHwONR3nt7WDoMnP8+9pNw7XzXJ48=;
 b=A9hmx14qLEmlstdz4XEAbGUe+k7y7+KYLkddCM6mB+VhuippgaMtV6KiccV6Tlio22vAUN7HSYxj0W3tdRWUAzuZe8pszTXt4qcXHttqpi2XKSYzYMfSoY7nLWD3KRD3vKnVoFLUUnTbvpHBrjBhb/wSTOuubtWkLGfF55d1XrtMj2vAJBrCNBAWaSeP1IIU3Ixh+UnndOp0FPSzdIfueM7+0iUBWqRvcU/dvlDnbIA0/U5xWibQ44Zo7Ihj5u2uGVtHOWa+mayJLs1sXmb1wZvdVdsojpSSKXdQphakaYMarxlfOCH2WMrl9sHPYDD5bhxp21mJvkHkxmbWopzSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 01:39:47 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ff43:1c5b:4873:5b2]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ff43:1c5b:4873:5b2%7]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 01:39:47 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.27.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.27.rc1)
Thread-Index: AQHZvbBfrOd1JmJ13EOoyHPRBAVAYa/II3wA
Date: Mon, 24 Jul 2023 01:39:47 +0000
Message-ID: <BY5PR11MB41525E23ECC50EE2109F4DF3A102A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018984bfb447-6fef57b5-dfcc-4b0a-9cb8-11dd75284d77-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018984bfb447-6fef57b5-dfcc-4b0a-9cb8-11dd75284d77-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH7PR11MB6330:EE_
x-ms-office365-filtering-correlation-id: d2bcea68-7415-4633-8259-08db8be6dd4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6gBM/gDe3EqU+V6BES6KWl06m2AkpE9VyTstukU8gTiog4lM2hzXxHImQ9VLBOMUxbrpsk1TFswYsOyiKYRdt0zoMeMngKEEiREVd+DhfWLt0RreQixR7VtGMem2dQGvR6LZ7xGukkAAza66uC1+lK1SF1PzeDWHLv/POhIYI9IpHevdl3D3pT4T4AhVHYmbll+CXDG39Tu0fBLRNmSFoXIbj5tOF/9bqCZAs9GbhKLx6Z7qF4QByXiBHdObC3SFkDKG++dLjSqJCq8l8PgAfDdJeOlLNId8Kfe1CqrrqQBj+DwQ/qHTlgSsJQFM3g2eCWb+gzBfrbTtVfTPKmBuqzKAuQCMSsi1pSaol1Ty0DCHHTUs5CXQmI2dEzwRrZIx2KHhrIzdXdqh9zVk8EC7vJdaNFCe3SBep+c6h0PQZKczQ6WLvovUEi7/Wb7nMAE7XF6XzNFMGzdIVUajbTMLlpVdzNrwzhrw3pzif+hVewKXKNGB2DprlxmpFxVO9nqCGLodceGeZcVAlCBdg+YDmCQaFg44EJ9ebHy45GJW7BNV+b20WZ7j/I9aBs8UjnMhlCcD+70aa1XPuWxunRlXJ4uyiSyg3Xs5B/c51rTDxZs4o4YxmiUR6Q6oVomyylExUvPDD0LVWRai75i6ZLEpTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(2906002)(64756008)(76116006)(66946007)(66446008)(66476007)(66556008)(71200400001)(478600001)(7696005)(9686003)(966005)(83380400001)(110136005)(86362001)(33656002)(186003)(82960400001)(122000001)(26005)(38070700005)(53546011)(6506007)(38100700002)(55016003)(5660300002)(52536014)(15650500001)(8936002)(41300700001)(8676002)(316002)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JRew0IJnoVAnc1zSU/QldggdWqKv8LziUzC9XoQHDVCeD+UMC36a/JO/uKVx?=
 =?us-ascii?Q?rdymqQuQFmM6b0H5tzWzCgnDZBpzwiZvcGMGsJmgapiAolDEVW/ep3tgN8to?=
 =?us-ascii?Q?oX9lqYBdgunSksQIHEaTXXVrhY1p7piam4O8Qi4ojP1YXpd4WmXfGFulGvec?=
 =?us-ascii?Q?EuMfRG9aLPIh1rWizt+viT/hVSv0V0jkZZeZN3JbY2g0TB2EYx/NY5kGTqtZ?=
 =?us-ascii?Q?TQyT8Cg8dIRJgDovSjt23R+AZzqy1hkue8BtVl++PnuLgxEqVm1QwHNCwSdH?=
 =?us-ascii?Q?8SlqQ8fIUKFlDhdf/UmKncJR18l1tV0uGARiYkhrDxIV2stihsfpv2jhbtcZ?=
 =?us-ascii?Q?oR5CtAEFqhVGrZsU/P2i1nXUNMp01l8pXW5hYJ0zgV1Xw0ITeZZQ10ygamyQ?=
 =?us-ascii?Q?CzEubuH6BBylPZ4g4lRSCXHMASheIKP2Z7Q0jQIvsiphLweWD1TGPNGTvuQI?=
 =?us-ascii?Q?GEbA4p2mTKas9iIKgTkLGtcUyfCh4ZsB7fqmsQPqOLuYRumu/CNv2jYIZL2h?=
 =?us-ascii?Q?tQcSYFAhBmF9p8Bl973PXT7wF+ZkgRKCAcy8wXyMGprpvHqOFPb9dd9Ho7Yh?=
 =?us-ascii?Q?R3987YRtc4G19b0qOp7R/tigzn4kbzwXOmcxxM+QJDWWCEjbiAIOD8SiodQT?=
 =?us-ascii?Q?OFniLTRlhzXxh9AUABYHxZyvdmx4kVz/SCOKGV5ME156jnEziGePrJID8IbE?=
 =?us-ascii?Q?9BV9l6dfHRgiLPWICIhfMd6Xf480Z/y5QYeXI9B8IMxiCOX9kuScEQYG6N2u?=
 =?us-ascii?Q?CaF6lgfENVAIwkAgtTEAlPw6Nyjksyz6Fc9H2kFIwnb7NFEM8rOgV1AXcU4H?=
 =?us-ascii?Q?QH256xTItVkfYqTPUcL6XA1Rq7FKOrBSG5X/sIFW3oo8psQJ07tKfgsKFODr?=
 =?us-ascii?Q?6SiHpRoAxhVrDnoWis52kvMwIlDZS0JwQ2U6XaMJ6ZB8fUIXvn89v8ps/6Nd?=
 =?us-ascii?Q?zPUNYHfCIJLxD+jNMsTG97R/kzQgOVB65iWKlGcgoxWZXhAL2hb8e2XF4NfH?=
 =?us-ascii?Q?rUWL1WQ2xBQU6+qkHlokSKDpYmSc/UF8NdwQ0f5NbIpXeMmbtvwzDSP053iD?=
 =?us-ascii?Q?MesLEUt+fpGtCtnwkz9yd2Y/E9u198XVGgSk7GgV/85+UTE6Ex8p9pvlyHYv?=
 =?us-ascii?Q?clasoE870ADjw6BO/jMia3bAm3/9Dj41K/FAPr1pkce5pjH3f2t7mBSCt4XB?=
 =?us-ascii?Q?GJXZBqimzsok+fMRCVgsg8Qji4xTPnaAfuUOfqBtI6ADUk3A7amm/c1WtDkC?=
 =?us-ascii?Q?Pi1cueU+YIss16qpwBisY0uJq0i3/aZ7rZ6rqPgbI+9vvnAyAt5lUqT5Fb25?=
 =?us-ascii?Q?DroMbF+Duy4bVqlEokaZqHoL+25p0CMFqazXMgr2KqkX7jcI67dkoHF/JTvF?=
 =?us-ascii?Q?Z45hMYn1VGn9nduxuFR1u4/W4ayKPhn2Gb+sWRsTeLA7oJd2iEnfw3Aty4V+?=
 =?us-ascii?Q?MUa8GDjU6uCQxPe49gD0dkbIgf8O85tDB/Ye5++0R63JhrkADjhHCd3SE9m/?=
 =?us-ascii?Q?+ZIq8H8za3KcspwdD3F6l6d978PZxQF8rMdtilpkchJ2gD30EbuXzYAk3X49?=
 =?us-ascii?Q?O8mZq3KtPdyq2XUCu+xiaeQmzWMrD2uyUButckfY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bcea68-7415-4633-8259-08db8be6dd4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 01:39:47.4335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSSGlRSShMeINX+sTd8BOplbZUqiqDhWJ6N82i4TU7Wva/7kKgpxXfgTCScfO2l6jDh01VqBag6182npW7EPAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 01:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184768

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.27.r=
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
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion next Tuesday, 1st of August 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, July 24, 2023 5:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.27.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.27.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.27.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b60c7085ec370473bea9b3b4b65826a17638837f
> meta-agl: 583f80f8e9d085a98f1cbab3a9d8082503ab739e
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 9d29db04581d732313a5b17a84d1df004056e002
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 488af577a3f21f038c551612bb0af077fa2b743d
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: b5282ece919f016d91a1043769676efb02b4f0fb
> meta-virtualization: 521459bf588435e847d981657485bae8d6f003b5
> oecore: ab6a0d053d910c3d50fcb06e9c2ca98430b673a4
> poky: df86cc15d0a39d8d85747f7acc2c887cccfd9fa7
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
> View/Reply Online (#282): https://lists.yoctoproject.org/g/qa-build-
> notification/message/282
> Mute This Topic: https://lists.yoctoproject.org/mt/100318994/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


