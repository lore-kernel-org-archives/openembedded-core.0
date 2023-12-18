Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51E9C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 08:10:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.web10.39447.1702887050597413657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 00:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CSJOdo0L;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702887050; x=1734423050;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ohysuq12KEwK8B8VmUXKhDpC28xGC/0jB/+SbHFE29w=;
  b=CSJOdo0LJ5V/v/2ahzz+nNHRxM2GhIEBEoaiwvBtakz1AAnZ1N1OIx/+
   sqUYY7THXxxhpNLXKCiuFm4vrXYvBwquP5uTQQIofqKFAIuaONS1t0isP
   cZZBz/luFM0chAExFlgtZyeZ+DO5tXhM695XprB0hnVmvTBU4BBBoUrpH
   lvAAzxWiuj0HyrP7s/BAfp9eE4NgS8kPK4uvspC+2ZMcd74T9pd7MwI1j
   qGoGhJm3H9tSHjrN5y6/oCU/VID8EZPSEkebuq50DZKNSq+jR5k8Q/YB2
   CarNET+Cg9NJKP9TprGvpOnOP+gmGjoWYg3rIuTndPYb941+6x8QYVTXw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="17028348"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="17028348"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="893729347"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="893729347"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2023 00:10:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 00:10:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 00:10:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 00:10:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkUzMgRX9bkJZE7iEA2xYM1I99lUVyL1GFgRkGIW2TPJfzuZARSR6bFFhBJipiVKfzsb36p3kONO2ML/nLBAnfjyGnM/w9ppM/SM8tPtFhpM1o0W78tn//6qSmK2DkhNasJTVa9JaQpqBpGDFg+NISBkMKM8LgFSR9fs3hNxL8wgJRnCZzSZXbciiMr12hhCZ42FCxawor3xItEB/LYdZQfhXel/U9Hip6xqONmaIYNUbcCkwPD3iOwQDY3oxoRWqxUjsKi87f+3lMuOHY0CLhY3b4V5wm1+GVskIu2yjIjLSPe3g+RdCh5C0Yf9iEimLWdjhANjbmxf2uz9BvYSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAk3VIpGNsrRfVStcFSrQJuFHUQytSLockg01SbDHxE=;
 b=VhkM+TZ5GYrcNgYTnAGb8FoB1N792USU0B7jJy9TTqKO7c8wa3g6QhIElFKwTD8hoMM7cNJDaaWEbpu7/0zzdHdhpi/V83FTTeUPfBJH8Yd6yV3TotNXEuERoTydrfLNiFJ+SaqPMyxjThNtLU3E6/I4ReauClPTssFcWCHmNMNeorGc1vUgONiBJeBjki72Xrr7S2/kpDNWUK9hpD+186lroUpQT1i5/yWb5AfQtxWYzixDq1UPFeoXynNVSFmeApdKai3eGTY8hKP8WMHBHBmoxP49mGl4T8fl+w2xt5f0n/iykDG1//i2WoIncVfg8Jmi/BXGDP5CF6aIMbwT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 08:10:46 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 08:10:46 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.15.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.15.rc1)
Thread-Index: AQHaL5KAdzrp6A53ckC5hmzfaP3ptLCus9pQ
Date: Mon, 18 Dec 2023 08:10:46 +0000
Message-ID: <BY5PR11MB4152E21FDD5E353893990D44A190A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c6f18210f-b2be4f67-b8b5-4e25-8065-8de14c821569-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c6f18210f-b2be4f67-b8b5-4e25-8065-8de14c821569-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM6PR11MB4675:EE_
x-ms-office365-filtering-correlation-id: 713d7b27-5384-4ac0-102a-08dbffa0d6bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rKPtSyhoGGij3z8cQOSBCNS4f7W5qoKWP/BIiGhtaM1zMuUeEfkMkVfEZlMOkZfpVeAys2Y+k0CgIM1/APtAIKM35nrxfAJEeIh8DIj7NEVzqDx9X3ZeZpPnRGRbwx0a0jJxIz2JB2v4XAhNLEq8q77v30pw+qHPXZgEFWpfbTphaCyvlHX5N5LbvWbzmtquu7AC4UsQDn2wDyFJcfFCB4fP/nCMxwocF8a1J8FwAM+mdUOatnSsA/TQjlkefP5RC4OSwwHcktKAthbTE/TgqmDvCZ8ZVaaWSq4540hukbQHLzFAjkh1XA2XBY9ua1Gou8ldUJPM2fWTuTH9N/JlNzEilwIXvhVxzi5htu1/z/lcnYnaR6Gqi/aH0m3FuwRBWzCJaHLc2veJ5FjUvS6YPrFzj3SqnMUURXkTuLvE4H56jm9QJk94Its50iFzqo30TljkdZJ7tttpslelX8ZAs1/AYRiDKmKPltKMW3JTXhx5vzzBshxR8rMsuQSxUAmyGbSRaPoS9incup2HdFaElA9NSTUQo/U9B2xvulQMJq8eibwADbBqNh7KlqKSHbVuuqLOQK2WsjYNsZYAiln6Y4+R+rkbw5PBaYhjGvTSYtmhzoOei9zyAH443qTyb9IZwnzYyZLGb1e4jxzChHzgNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38070700009)(55016003)(66946007)(66556008)(64756008)(66446008)(76116006)(66476007)(122000001)(82960400001)(38100700002)(33656002)(86362001)(83380400001)(26005)(9686003)(53546011)(6506007)(7696005)(2906002)(316002)(8676002)(8936002)(71200400001)(966005)(110136005)(478600001)(5660300002)(15650500001)(41300700001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vbSwpkam8207uWX9HFRsckhsu3P4R1KW1IpasICgLQOUFifTpdYCmFaJjCaS?=
 =?us-ascii?Q?qDwSFH4aNsmByOCfswZ4rum+tPjw0GsBXKFLjggmGyZawOZ+3HB9+vAtrXAe?=
 =?us-ascii?Q?sYK+u8eJtnpRygXXvQQ+UVbMY4/8kttgzyLLV4R2NfXP6D6JD4FMToKUh8ze?=
 =?us-ascii?Q?+2LaKdEsKKM1RJwWJKgET4/VFJKPfNy6/AkMUw+bDen6h+ndw1i3AGbohzxv?=
 =?us-ascii?Q?eP+ZIqSw/YBtgAX4MdWXD/XYvdkR6k3yHiSW2T5lDk9t3EqxDFa4swPTYvvw?=
 =?us-ascii?Q?GgLMfac2a9GBD7/wjd0JtsyPfivsWGxshR4XD4G0OjnIKcR8Av/IafdixBuQ?=
 =?us-ascii?Q?veZovuFIlYu585ozTITmcUvuTmJDiGbcR7Fg6+ksXBb+E/7xmjNj+9T2NOfI?=
 =?us-ascii?Q?aDm67cDDla+RkD0RPdSM5U3a4PkpGOAoclMCtAX0a8jgKgFXL+swHnnqkBDJ?=
 =?us-ascii?Q?SimRajh0d4TeOVI98QkNh48LacB2gNwTeJbYm/Ex4AZwkhyPUdb+ZREU4er7?=
 =?us-ascii?Q?4WSaO/GQJrRDHLHv7fwtIeTIQ2yc8EuiyihR175M6GXDZ2tNQU+DkRy+BI0a?=
 =?us-ascii?Q?FxmdsIAb0C4JwnFAVLmcQF7/Fd1Fiubx/0g09bhcvYcLtI94RPcy3Mfzs+as?=
 =?us-ascii?Q?VZIfoszSxg2z3bAJArYhcHUibuQygDgF6bS3ErfEMn0+HVqfMXzTagE3oOn+?=
 =?us-ascii?Q?HyRxzMoe/ByCk6zNjcUZtFUO+hzR6kmC7a41YE1GqcHJx0P56mV+pZXmy0QE?=
 =?us-ascii?Q?gjjSL8c5i63/HeRKbqFfxcM5ThQEpapJVpUfebSHNGpojJstnkzJ7wEM53Kn?=
 =?us-ascii?Q?A1dSG9rcnUc49gmLUMnSnmqj3+PlCNvTTTk0w0khy+sGFm5hmYbpwPFEg2vX?=
 =?us-ascii?Q?YpAaf+ws4TB5PQrXp2p3fBYAxFbqAhkq0FdfZ+3hFpNW+s8uiDx2ka9e66RN?=
 =?us-ascii?Q?oS9Q3tt/V0/YWaFyBQPHDarctF2y0qkvVb5/o7veFsCqMQ3z+h2W86fPscnB?=
 =?us-ascii?Q?dXNGL1VlJHyo9NSV2Qv/mnpIofjRduX3uiUChL/EK5ry7UyzMUPMLar+KyDS?=
 =?us-ascii?Q?2j/AjxptPlV8zjbl62wDXsnPkzh5WGD9DiAqKQztwEQTGabm49fn7meQgiwB?=
 =?us-ascii?Q?KyRO0WXWc+rMFPudVUf8SoU0ikVaCqLii9+AX7T7YOrBX7sa2KO3DroVb9J+?=
 =?us-ascii?Q?RF+NHa1Z2Zvb/g1401KcurJWzP5sAE5uvc/e6GcclmNV9oCel6VyCVe3vCQQ?=
 =?us-ascii?Q?Pybaxdkvb/1FEke4RwPGW43BB+PMxMd8qlF41WHBcIDBwKl8kgi+M3DYSaA4?=
 =?us-ascii?Q?OsU50LmOhlO+gmoajROV2AowSzZ8XrDHZ9Tz24ogYfKubP7Uma2uiUSo65KH?=
 =?us-ascii?Q?qSW1wdKX8qFCZHd4dcUe4I8Dl+0HDYwiKgbzAxt+U5XoP6VY6cb20+AGn/Xr?=
 =?us-ascii?Q?TmcUYuMJ7ScwDttCEBoxlhlqXfAKyrYK4b812G2ge3jrwCiVsblz8rEKPoIC?=
 =?us-ascii?Q?jtA82dspjyrYvMbkIAYhoRmQdze7wMchNZwSaPAnxaCgcD4ALu+Q5c3a+8YK?=
 =?us-ascii?Q?5l701LLgLzIn683wMRPzWy9hD9Fmo0F9hQSR4D0y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 713d7b27-5384-4ac0-102a-08dbffa0d6bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 08:10:46.5225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eOH6lqndVM/vbR1tkD5FK7rcFZwTNlAHvgFe2HRWRYe+5gcDZDku7Vl5L3gS3quYHFO2vgcly6XeI39dvLtaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 08:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192610

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.15.r=
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
ETA for completion Friday, 22 December.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, December 16, 2023 4:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.15.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.15.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.15.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6334
>=20
> Build hash information:
>=20
> bitbake: 42a1c9fe698a03feb34c5bba223c6e6e0350925b
> meta-agl: adf081bab632c0fedfc064b50b953252c8f72be1
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: f438745ff0e8c4c6b07b4fa66a7bff7881bc0287
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f932ebb2544170f43edd22739f44307809bf8cfb
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 402affcc073db39f782c1ebfd718edd5f11eed4c
> meta-virtualization: 88327090d26955a678c6f8bd2585aad4d802f6c4
> oecore: eea685e1caafd8e8121006d3f8b5d0b8a4f2a933
> poky: 755632c2fcab43aa05cdcfa529727064b045073c
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

