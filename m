Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF893C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 03:43:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.14756.1706067804963779848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 19:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=koPHjBAP;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706067804; x=1737603804;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=w737jCC712qu81NIhcghB4WXTahQ30nSBM1XbazRepU=;
  b=koPHjBAPEeAMNTgV5fRrTtjZ4zECZHwynOf911v+UrVce+kIevlEI9SB
   X+dc3c3IhPDeOHrayIYjXve0BUmeCKCUIJqccIsfPX8bOj+UL4v9h0Cry
   An/PtBM2W0X0A1ycY2zQEyGc298h8kOzmRvVlUTN0pyHGL0HIUDiyd/HF
   h+IMWYAJi8aQOtA8fbWXhzEnBVZswGHqigiTc49NrC1foH+LBh6UhTy6n
   aGLg1Wm+as5QhOTLFlD/yoHsaPeM+F/fKVyH4T53C4T8ZS+0HB5z4c2Q9
   Q9RtkJqjOavCBSS3tavvsJ1lvxQzKEeChXzm6mOKkgDwIlqUou09CKi4J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398885558"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="398885558"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 19:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876562627"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="876562627"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 19:43:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:43:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 19:43:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 19:43:23 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 19:43:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGqQMo+GC/9icfJQbagG9OMb5D1BbEi8VqqYdMhVPPX3DVTjjmdYzAbKfDcR5t92HD5GUrlG747ay+2FATjN4Yz+T/FMPgbE9rFkz4oIfLN+Lnm4cS9RSzeDfeW08YVgRq3F1N/Gzd2ezDgoMjy+tK0mZilXP1d+tvxnpPPm3FYG8qHabmnQ/xeZxm8wchPMED+A9w+2Uo2tABU9FmRsYDIYU/U7Ug6yqyhoV7hn7y38qE8ZGNq6Ml1c/r/b9tImdaaGA7yA4ihqqhPDVGjfOi75RIieZF2trWXsVrcacuKZqqqHAysX1qlR4rj7GkYsoG5a7E+FXwgGAore/2wIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asudomj5AyANGwimmtZnpMCtd/r9MronVx7XrQF2XOc=;
 b=TOM/0mnAyJibbHZs+BaSaXFgdwYXq+vsiTUgtH1teBC6ZE/67IGykzrweOPc/mgUD+svhUTD9SWFNgZTJgFO/7w7TupHDLCejiMkMMlmQEx6HvZ0upUq0qCH41qt/ujuP3331WC0VAuBt4X23KHc/kXYGHt0R38p2pmWzImZDBClXi/B1/Kgpye0aVGFVPbbH/xvhEzlqNBib/r33+tSHh8YqyV6bYYyxUonnJ9oxjLXsiqMppMXo3AAKcO08Yvu0xHGDECqusBzNw0jo9gbGjMtaXHgyBGsGEUcDAyOoSitbvf6L3VLiLQB6GWy7FtboTTCpnyXXCHMEPofPGbwBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 03:43:20 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 03:43:20 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.31.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.31.rc1)
Thread-Index: AQHaTakbvmmpS+tNO0KSx0pYcQQvvLDoUv6A
Date: Wed, 24 Jan 2024 03:43:20 +0000
Message-ID: <BY5PR11MB415299BC4BE89155635038D9A17B2@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018d3447f66b-648797d2-e0ec-49af-ab0c-4d8010a07ea8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d3447f66b-648797d2-e0ec-49af-ab0c-4d8010a07ea8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ2PR11MB8514:EE_
x-ms-office365-filtering-correlation-id: 2c7ccc84-e060-43b5-f93b-08dc1c8e9bd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Iyb6mEYrEXCvDmcKLIsg3tZH9tcLiC9E+IaDuMLBJbFHzZQ7K4oEUBA7KgJe/BGmy4WpwRJumkMvVCSUkMS2K0rtEpqqGO+UWZzSbuNMz/ZtPY1rfp2WBAiVRkaX/7bvjvpcRlXB8/xA78/K2aHK1jSeG0A5qJAOMk7HmpWUeg8v6yJsKvjGaOXacl/MDJ99jtYghiBWUQ2n1aWiBrh6s4J6wpd6wKcxywEsulhGbi6UXbDoH8wdwFxf77v2tyo+05hxhj7ro2V6XuZ0PiVqZZxTa8KNp1sayQtRfXPGUWJQ1/uADN4n7+37Eb5GoDjT3UOprmWSKSEMpctiPETH1EHFWQMjBsea9FWXHF1BKLLd9+KKT9XwtUxzqO4JAtzQy9lSn+leJv5fW7c/OKVjpg0VwsTHcMi9rfEAgODWEzvzgbep85keUXd50G/q5l23Qm6bNVYhGnYwFa03V63clFMYAZwVgV4KiVdkZVjifb/1yRqnsai+95bZ2l2GEkIO/YWyLf7affNWG1dZfgdXAsl4kMyYbXP37KQUEOOrSYu+P72wLvHyS7903j2AwR0HfQb1txzCXkyjdFrYXispQqJXLrojtva35j9JPY88QtTA0Ly0Wrqpsrl7xT0gSs6efC7UycSr8L3jMqwoowSHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(71200400001)(966005)(478600001)(38100700002)(55016003)(82960400001)(122000001)(76116006)(26005)(83380400001)(53546011)(33656002)(9686003)(66899024)(7696005)(6506007)(15650500001)(316002)(5660300002)(64756008)(2906002)(52536014)(8936002)(86362001)(66446008)(66476007)(66946007)(8676002)(38070700009)(66556008)(110136005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1kvMPLP8kbgTYXoFAsjMk+DtCOBnEJteQyG1nj3274LFs5OOJUjnxylXYdBw?=
 =?us-ascii?Q?9jTI2HK+BhUe9zKX7xMo7g7aa1K4U1yl2p/eHY5rJp+x1RPaDqZrpOGjebbg?=
 =?us-ascii?Q?yZ66vVtULpEUBjXsc6ALQXsNrE/dsbVhuQLd38J1fD4mJR3Qy8YFDmxIcjmX?=
 =?us-ascii?Q?o8UETwspcaG0h1TbMaWBimzVUAo7hDppoXgVOK0Becid5Lq4+MZ6JGCVrMdm?=
 =?us-ascii?Q?V+geNt34s7QiAKrpv5BJLJoPHZQsVomICw03tnhCivYH8ULbRbzi7M82x2Q2?=
 =?us-ascii?Q?Y7mAF+Eylw30i6a/osEBGxKlhD5EvZu/Vz0YaWH11YuT8NUfcFUvsvKyGkxO?=
 =?us-ascii?Q?alCl/z320lIChOlxWrmQsuJpbyk2TUey8Mj8PnR3Dh/ELj3zGzL0Sm3XuRNH?=
 =?us-ascii?Q?m3R35Fd5ci7Sd3RIma4SJ+MhEtCGpK+YglUU0nblS3H9cKuQex+mc9z4XbXh?=
 =?us-ascii?Q?yh6D/oP+LXxYSGEXtjGKjcKjpf1L9pPRh8382Je3XRJFBTSEp5Km5Q9jmjcR?=
 =?us-ascii?Q?eTy8EhIwyM53EmnqWkX1xzN59tsKbF6sdztC7DKfROzyN/h5mVOYzGs8Y5mS?=
 =?us-ascii?Q?aWHUVbd8ceRnn0TnFNwhXbWuwr14huURY7psdwggIMYmQic9zxXgFXrsGVOF?=
 =?us-ascii?Q?9/h/puP1eIHRsMoRMTMJg56nGhZEALvRBe2UNEf59h+d53N0OYQ3SSqAPsii?=
 =?us-ascii?Q?b1k7N5q9QYDOun8fumwsP2+ttssR/khryBsQb89i+n53JMOYFTRTIzQ2irKg?=
 =?us-ascii?Q?DumILu8VzPSttiTJ0yx54qMIm/nsOKwRPlLkcH5HSsdwbANQdGg9uVlWc58B?=
 =?us-ascii?Q?yD8/WBNEOcDGD1GWS8x/dYO5DyHdceF1MMzOxeiXLd15VecjMwkeBBrk6YtD?=
 =?us-ascii?Q?mEMYrvFD7RlJ/skrdZwpaIHGjcdXnoY9FwYaIWDCJCnZo4EdkUfWven1sKqq?=
 =?us-ascii?Q?Tl534MxI0o2cbOR9RthqHQmAq6K3RonztdOWkiem9RwFo1ssLgv9zaZsCfPS?=
 =?us-ascii?Q?65QjFmMR1AOSo88SCi082885Kpi+njOVhLf+g/7mHXoRsIqsBmKmNZ8OqQpV?=
 =?us-ascii?Q?eTu7nnInslqjYbDu1Zld9pY9gYnRWc4R+EmQo3C90OLVojtddjg046h+w2JT?=
 =?us-ascii?Q?afyyTAnXr3lh02CnhOP9hHOWVuqliGtE2fGDQqgmSpPjTqJIeglCpF+djcya?=
 =?us-ascii?Q?M0TzUYoCp57tXoT8gyZnDjDddskqj9o3bh2YmMdndciVIhA3oS59Agq0nE6G?=
 =?us-ascii?Q?rcNnoFWkLiZGQcK6Rt6qJyGD3BjMbbBQU76mgKXwCKstV7+wUQ/4mPhoqQv8?=
 =?us-ascii?Q?oikHWS/rP81WNVz/LUXCS4YP/IrUyRObS92TAO/6ZQfczKw8IogDyaAYOup2?=
 =?us-ascii?Q?CKgrhH5tr85E/x0W0ALQSgz+d4vONBCiPHp1Mw/759qV9SGXIwPywuglXX+x?=
 =?us-ascii?Q?ZOCKVZApVPHV3RJU5lIQyWJ6KItheKOOvVV/czqAtg8lnCK2s1esKn2NMRrW?=
 =?us-ascii?Q?UxhkpJJntnLh/oGvQb4D8k+Y7glv1OYlUUMLL0VvTDo/zzcjxlTgJODiqN+p?=
 =?us-ascii?Q?UmzmyZz0Lu666tEFUjVNQe4ms9P4ilEbh51KncVR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7ccc84-e060-43b5-f93b-08dc1c8e9bd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 03:43:20.4876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+AAws88dXM0nGKP2TADTwhRfLexdPd7+4DgOfLBnfZExG5BOBLIbYIL4vjcJRJ+Auvp4orwO4eWZ1F6zgK69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 03:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194259

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.31.r=
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
ETA for completion next Tuesday, 30th January 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, January 23, 2024 11:06 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.31.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.31.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.31.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6478
>=20
> Build hash information:
>=20
> bitbake: 36959b25c64044dd4bca65bd1bb1243823d51545
> meta-agl: 512d244d48ba0d33f609f425a6e8a907b178cdac
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: c76dec547df106f6df19c470ca4b3d5bf8b9827a
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: daa4619fe3fbf8c28f342c4a7163a84a330f7653
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 82e67bd9c77f0c5cbb652ca91071b9e57bdcfb33
> poky: a9e3cc3b9eab7a83c715bb8440454e8fea852c2a
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
> View/Reply Online (#377): https://lists.yoctoproject.org/g/qa-build-
> notification/message/377
> Mute This Topic: https://lists.yoctoproject.org/mt/103902878/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


