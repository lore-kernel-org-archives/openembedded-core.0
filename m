Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F27BC46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 07:09:09 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.39875.1674112139954085790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 23:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=LOX2TUMM;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674112139; x=1705648139;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RgRB/cAYHHVtQc9U2f46HEpB2x22udOceCCvDFEiB4Q=;
  b=LOX2TUMMMD0dwXOzO7qjY0L54e7yons3T1FFwIl0m0H/oh4g26h4v6oZ
   qMwv4++KouNTBdagxHJkSJBYREv2H+uK0apwakx8dpL9FxaXuuYMrkwh6
   mjtfUNeYtMcY4zR5DmFzt64NC1j6GrvdCgXeA7sMG8wyyrbYtXG58OO/Q
   D3fegvGPqrxxX8NKxfm7xS528Fi3ZFNEagr3NofW/zd/OiewAISAd6sdP
   Bebdb5h+401Q0jf1Mb7hUBu/nRkZSBnsRLBhY838t9SP6csG31GrT0q+M
   1jrCRVZpI44xPiYt7XC8xkjUO8UzuQeIlzk3XvM/sZI9Lhxejp/8IPHIP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304899032"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="304899032"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 23:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833891691"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="833891691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2023 23:08:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 23:08:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 23:08:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 23:08:58 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 23:08:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+QpBDySmn6BGfUxQz665J8n993Kube1pW/G+Mhi8LHcz0KYxlvQ6Ypv8XajHZBpWdvlOZnJhCfuCCzuOzgitDjYgQSwlQ5/Uq6+8peST+vRbJP07DjW2DiD9uttF6WTXjYThIxCrpt+ygHr2Jwmrc/paih1Vjm9fGUUlW/bblVyKwy7q2NkMgPg7WQl+n57c+KBs+ktQAOOW3DHsfEyZS4/qDXxw77VpKfcdPtqFS4ZSI3p/aQy/tPgPbg8s/TITHoW7213r/Lmp53DYRgiVDv5q50xdlCh04Wv7wgSpMk8oj1JLcNy13CGzZiwXCKB+IUksEVX5agM9To1yvoL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omGPa2frrJTX8UzFitLS3jXavwTPYE8ZJAyA/0WcXoI=;
 b=KaQNg/i6P8bE8EPRHjpnubb5TESYU2SIG6jIKnzOELwbRrWQ1IBgwgH5uj2QJE+T260mVLRhwWVHgdWivC1oZ8KBVhexILwPQoOkxLCeBuSRLm7COj4yo4xTQvOesaczcnoURuAZi28lpUX3ZkBAtURJZryTbzFBhneQ4vipFuWIjRVAm1/ZzYf0QrmOkyvWdeNXAf3jvgHh/eW+OjYKVpfpL3VHrs7eRoUxPWLxPe6oJ6hcyFC5Ml8ozzDojmtxthDVeVT4VGehzi6HS657cEakfZDnOi3fxqUYD8J1q5BpZv1IOQtikAzSoRYZhGrXuKr4yLa7S5S3oTbvQh6o0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 07:08:56 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%3]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 07:08:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.22.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.22.rc1)
Thread-Index: AQHZJ71ruTUydx4wDke4vca1CdgPC66lMWHQ
Date: Thu, 19 Jan 2023 07:08:56 +0000
Message-ID: <BY5PR11MB415255790E54A64E1456E94EA1C49@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010185ae0afe37-bd223560-9c64-4364-a9ab-e4708f92af83-000000@us-west-2.amazonses.com>
In-Reply-To: <01010185ae0afe37-bd223560-9c64-4364-a9ab-e4708f92af83-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ0PR11MB5200:EE_
x-ms-office365-filtering-correlation-id: 5f2f131e-9158-4595-a55f-08daf9ec07c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tyIPDDAo471eneNvHmNdgeWkegOMC5Bvs7mBUaPBz6Yo5mpI16rM00KvBaORRfUNd2RlCpftWsHX73un7hWwu7Ueo0OjNIcF1eWcXErYZ+J7TLc4n6nIwXZBk7aY4LYjnsFbcpVzq/TBkYDikIIcGXA0G+TdTXoFUcOB4osdnP9syS/+6yqT+MwY/Tk1S2zMovnVocO7BkQB4bWAFn8KejnY8bstpJgx2cb/2evWkRPfHAm+Sk4QNzAdQ7R3i+9MEi79vAEREP8PWNqSLQ2rJdeBxaAeq6buiAinqZAsPq3NIPAdIOVlFwXeexIyug5qhObFVZzdTTPpE/+NF0k2c59Gkya3DUc/MLMuDtreVRQ5PkchBsh5cR6U6r6PGnP+1rEsZRRTsqv4ri5d20cHxyDjxbLiuJDR1X5DV3ovzLlU9vAiiRVzp0hISArh8rsdPEWc4wRYaJi4SzzlgCfchEcQDzS0HS1gLQeoI60CfT2JGMtYsAG2bkagJw4UUM0hFPFyonnU0NvMkDB57CSP3P4lnJsxXDvpiBPtpMMpSj270bS89Hh4xlvdYaI7lwGCjM1H8rFKFHxtyx1GolUeZeLsygAn0c2T6oT48C4Q2B7GT4f4feCKXRYMOJBjtNafmcrjuH7/rcN8PQvNWGdoKoh4If4tKtVU5sjXatUGSxilC7FN3J4rfiG95lOxme8fR8c/z1G6kjxoZoSKpAVvCwlLdtAPyPBsNmftI/3gtUSssY5i+eaExZEoR3avBS7rvsbswet5vyHKvXy4tYRv/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(66899015)(38070700005)(33656002)(66946007)(2906002)(55016003)(15650500001)(66556008)(52536014)(8936002)(76116006)(5660300002)(66476007)(82960400001)(122000001)(38100700002)(71200400001)(110136005)(53546011)(7696005)(316002)(6506007)(966005)(86362001)(478600001)(41300700001)(64756008)(8676002)(186003)(66446008)(83380400001)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R3k3BGDZK6sqZFtVkpsRHkDxOlZP4rQ+fkziXcgNbxiDBwm4H9ew7zgQ+Tn/?=
 =?us-ascii?Q?cGeKPGer0T4v2djhLeV8XvYO6UH4PD/OwG/3wW67E9VYUDwPP87CzxNS2SzV?=
 =?us-ascii?Q?p/+s3kXcAr+8iF2u7ZlXtEjJdzvif4HUizwJfN74GoSIODK38Jo++4OTLn0f?=
 =?us-ascii?Q?PIAW9Xvynl9knZ17C+KFj4N6wGGWZxGdD7BWWkHHlUYN+3/wkh2MXFDeGZnA?=
 =?us-ascii?Q?f8liJ3itDvpq9DlVLOfGDETRy/ff5c7O3a1RWWJQitrGZebx0XCCM6p8botR?=
 =?us-ascii?Q?d0v9M9kit+b5hiv9wYiPUZXMly1wEd6gxuxj0quOEcbRwBJULyqO5k5D06cf?=
 =?us-ascii?Q?DloxYln7SwFYeNwCIxzXNgVyaiPn3diQI4xNOyfQXPo2w3GNpR1GfDmIwTf2?=
 =?us-ascii?Q?57e7FCg5ZmMSGV8aQKJHGm4gyqBf6iVLacFzmE+nX77Q/dek/iRwp4XhFb41?=
 =?us-ascii?Q?7XUEYpOGeMWMJiKkNwpqahu9lB5YRZnjRgaNRpGiqYYzElgC1hJ6U/2g+7Ap?=
 =?us-ascii?Q?StXwn8PseLtrasTu41ftEOIwiQ6fP4l1fOAxaOL1DTsBN7RgKuDMka8c6jJF?=
 =?us-ascii?Q?Us93SM+fxl2Cvj2dS8N6ksVBG3hgU82tuZwq14cQrMl2GGyVU1+qf/JNKicH?=
 =?us-ascii?Q?MXWc480BTZWcXKq8D9BX3EsPYEhBwqOlzSgW26+Yia06amx9hlGXU1x6JRcc?=
 =?us-ascii?Q?owxK3n6j0Yrba1R1O2Y7UTmsyxHbpfp1re0FpLYV6dw1Uqk1SPHrDqhaYMSP?=
 =?us-ascii?Q?94/UMi2PAfvdDWsMoDRZLlmZhEj0t4E6nChlctFJG6J4NNLZF80ZD+3CJbCQ?=
 =?us-ascii?Q?2zLtKaOIqXg7TCdfhfBGiIsIqVf5Yk6SFUKPE98uJ0CpbnIJxAtsobxwu7Wv?=
 =?us-ascii?Q?VLhHE/5AAKueL7nbLGD3irDW9p6Bwc0QW/Tbx5CjQLSzeI6B3xzLjVrLL/61?=
 =?us-ascii?Q?RqbCGLZldKENjP3ZmNi47oOFYJ064gp8y6vxVhCd1IV1DdIgzogjmRou7poE?=
 =?us-ascii?Q?5//rgM81PvCttcGWDdlP0bb6iqo+lZ7/WksbK5yz8jXJCi/GVvlcTEZut/h4?=
 =?us-ascii?Q?mJo7uiXlmUvUqVyhdrenO5KrmrGS4XzwDKkjxdy8uIxV58RtjG504w5ZuePv?=
 =?us-ascii?Q?YsRlpUF3PpWpBgndDXYwTPU+NVNssfkwyZC1ROnPqo4axHK4dXwcrxvbXifr?=
 =?us-ascii?Q?CobJrYGB7mHWC/760DCFqiBc6EwebELILxyViDvnixTxAPQ5QkhrzPyBFaeA?=
 =?us-ascii?Q?44/h84hXla4jNGkObyADMhvHLZzaJWBGRDn1vDdtrS+XoQ/gQ6Nwrw+hcFIt?=
 =?us-ascii?Q?pBU8teyQFSyVjxphdNAkLvg9IcbpcUvs5JVg6LGkDJRqmpzr1+nOiEajhnEQ?=
 =?us-ascii?Q?rvRY8FEXmv3ox3k+HUw4HjExfUMrlGYN+MymOLmC/fUCC6oIRW61Gc+aTsrA?=
 =?us-ascii?Q?19ISSltkzvNJ+kjwt3MuxdqpFKaPAbOi69gReuETjK+6f9PoQqUDwJ/nF22V?=
 =?us-ascii?Q?G6lApfPglgjrJ8rZeqxmxJjZbBHKyp8C0ng0kjQ0g22l31dXNT+tfkSp7M7K?=
 =?us-ascii?Q?o2m0vQCDxqm0JFjKU2ozSwhA+P+HZpj3H/Z4ovQo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2f131e-9158-4595-a55f-08daf9ec07c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 07:08:56.3869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5fho7xR41ceR2Y63jwFyhtm+hdR2f703OnNEphFvr9+6vdpyrXL22GOlpGodMhq9p0Qp3pBP7MFnPzn+vy1VOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 07:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176124

Hi All,
=20
QA for yocto-3.1.22.rc1 is completed. This is the full report for this rele=
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
> Sent: Saturday, 14 January, 2023 10:11 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-3.1.22.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.22.rc1) was completed on the autobuilde=
r and
> is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.22.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e3db9c2e9eded3c5cb6040714a6054b44f6b3880
> meta-agl: ae982d798a979ee5690bee00ca90a2855bab4802
> meta-arm: d13be36099aff7ea2975a1a197564e2e801707a3
> meta-aws: c013258cecbf99528291e55005e1db360d7eb40b
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 6c202291925bb179d2d08b5bde80192f9b032b88
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 7952135f650b4a754e2255f5aa03973a32344123
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: db81e3c7e7f1d4d9eba52ac35ac97627d0240b63
> poky: 6b8a307b7843af23d189d7ffcecf32c05afac850
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
> View/Reply Online (#211): https://lists.yoctoproject.org/g/qa-build-
> notification/message/211
> Mute This Topic: https://lists.yoctoproject.org/mt/96260839/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


