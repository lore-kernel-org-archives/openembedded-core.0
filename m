Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0947EC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 12:16:12 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.21472.1675253762655810599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 04:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Lx+uz4Nq;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675253762; x=1706789762;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=mo1jE44NeedZneobtnc/2k1MiByAlKcnNvnChXWaIeY=;
  b=Lx+uz4NqaX9dpTH0RmucDsRCXvY78yv87sispUfPE5i301sFCXhev9QA
   y95KQL4GmxADH/LkPMVFoSMI+Vg0UMXv8lPTYzEiftgfZQrTcr1LqHJD8
   hhY2KWZ+tgF3cGv7uikObvJP4qtV9kCw0++TuBJlRac1piHZITtCz0K09
   TJzn57K/LbZH2N2GxvmOCDtYPR8DjNkCb90xdq360dIhsGgBoCGiFUPkN
   nE7d5WsFFrZYMFsca0h26hN3RAFNShPYDoE6trx2ldVMtN6w4bzAmWeXg
   V1hv7q6nbKQscI9wBbS4CLrinCAzUGIjLAaCYA+2oh7i89kXd1K3ivq4f
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="325826710"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="325826710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 04:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="993670883"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="993670883"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 04:16:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 04:16:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 04:16:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 04:16:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD4Sgz/1UvwPgDFIrO8xpF0Qk8v2QXNyC27IuzzE8g3pDkusumWx9m7OqsT9wHMwBmgm2sQjKUAxrdS00bBjhMIdXUmO1KjcGNaev312GE2hXqPbOwIGj02lTCwdssMGow6/awRSlM8QLvoe0g+dM6jASj85H3dsoApgGM4UEkGQGHg5LeKdjxSJUtUAuCzrJLsR1GqslKXSdfM/uL8kT4pLFBpVqUWB3DHu3j5ideEVcs934flUVVLRHhyE86Byc+i5VjRJyIWWDzGtmvrGdgOHASZ+gaNoPww//9p5fIC9Vn9KkpT8+0b8OoaHTreJ64SVotvbcG1pD8ZBfhCrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6M8MUP+mJsrQe7ICVsH7p6tjM7GEAD35zapaUNBFSU=;
 b=dkTSMNtBnVUSMy9Eqaa6SQP3w8u8r6Mvoqa7b0KIHwFWPMHOI3KT0jGVTu2h4+GfrBszvMe/xatxYao6e4lE496qmVubGw+HsFLgAaEpXHsLaEpRckDcEDPt6aPP7zT6LpWbmcIGweqktu52JEbsQvHwcCq1roRzJhQC94YutEH2jpyoM8q3uKmzYoWNVjxwQh5n7XZhbbHb1lp2ojEq3zlzTyqFxTy3/UZUZokAyiSrj2aV0B2olySeqNfF1pHhntQ8pmoJgRMTgs4yFdaR4DoYTa+kRJUhSMu0NGopXp4/wKecRLkem3FV79ZuBumRZXFbAluqoKxmxyc0sqCoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Wed, 1 Feb
 2023 12:15:54 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 12:15:54 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.7.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.7.rc1)
Thread-Index: AQHZMqRhkr5w/Y9sC0yvL6TSIsPCWq66Bqtw
Date: Wed, 1 Feb 2023 12:15:54 +0000
Message-ID: <BY5PR11MB4152AD9DE6CB79438374A894A1D19@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010185f57dccf8-29734aad-b7ca-410f-9a47-21affbf045d6-000000@us-west-2.amazonses.com>
In-Reply-To: <01010185f57dccf8-29734aad-b7ca-410f-9a47-21affbf045d6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS0PR11MB7458:EE_
x-ms-office365-filtering-correlation-id: 8fc8fbc1-a008-4efc-3218-08db044e10ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vTmzC9MYeI4z5PLqQNvY9XxaDgtltquC76TMPH6KB3ZqKv26I9+crfcmol9XBmy1r+ZLZGTl6OT71lIXo9vb/HIgAT1COJQ4ckQbFa0gIqG7uo2ftxiEZFvdYPgLyzgeu8Ew/57fe9FI18Va3gGXcBjgFx9gw6ral+YAWXispggZaRiJa8L1cwtLM5wZ/kGDHIhBONYwkiWLceo9hAzKxXdxmsVBYJJsDvO47oiyJOVbCkDcxbj2GGg7YLQ11w5/4CvMJG/7//0yqga4jIhvAPt2D2KLKz1Qm3ElCJPSSc0DZflV+pijuMga6s0F0Y1fXtDDHkGM6LCB6eAwLn70DjEYsdVP87UPPcjLyVwf9R1e5lTVBSpi+iiDKhz61sFxCsgWqITjHh/LX0gihXuCwS9Xcnyucz4cSZYrQiGnbI1Gd1A5SNUg4+H1+lLilPMBlDtdNCwrgwnvWISASYm1I5Jxr04re+Y/UNzDwHooOibf+u7gdjAUxBjTUOo5Lt/dBho6SOkiSToeD5SnY3wiHNN2lHYnlTQ0U2Hc0kgeJ6F7wP5y7Y+AJMQ8UEHJMTePss5IA3cWsXZdKH8s8d/ya+0LKJBtV/c7Zqmcnf8PL0dllw91bPwXYAAHDrkLIzes7yLW0wxS30iP2ays63r8ptTwtrk4GFEANMlSkdVdH46O0zNU1KMd4Jog6lt+EafOyMvXCltAKb4zhJWKcGcbI/jId0Hy8p760ShBEMgfmYU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(76116006)(66946007)(966005)(55016003)(15650500001)(8676002)(66556008)(64756008)(8936002)(33656002)(5660300002)(66446008)(66476007)(7696005)(41300700001)(82960400001)(122000001)(53546011)(38070700005)(110136005)(6506007)(83380400001)(26005)(2906002)(52536014)(478600001)(9686003)(316002)(38100700002)(186003)(86362001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QwyYyad0rbf+3lfFUaBULRw/CCur8PO75ZPFvEGvCzjPrybiRsHEiCki+3az?=
 =?us-ascii?Q?ZN6H48DJw2iGvf7Kiop2NGrIeIZkXDYWtaJ/vO0dF6KeVDwMbyUSULCAZ5Yr?=
 =?us-ascii?Q?xTwRbenMi7PpMKsGL8LT1qSFoDKUQnXWHs60kdV5GPuBX2gb7ovvTrRGREw5?=
 =?us-ascii?Q?X2+QzqUdQOHbsYjV8HqNc4W3rzuW/BRO77/koaTEYStT7PVVy9fCP8+O8Qxw?=
 =?us-ascii?Q?1tBqn10q9/oXJ9yE+I4eOTYflDFVqOX4tbGzgYGwNgYuJvEst/0hvjM21iXG?=
 =?us-ascii?Q?2gRD4aCvvp+J6EmXxQ0y3iGleEgfGJtkqReFBpsB0AQSftGoNQ3U/+TCUuQO?=
 =?us-ascii?Q?2bauJxfuCL5gtPskx6dHG8N2EB2IgQMakgFOUfFefPYwBaK+tvQYENHVWkaA?=
 =?us-ascii?Q?hF4djlsW2ycWkNLojZMVHzEwB3SiDCVfySTyv3Y4v7unuua8T+VckUhU4QqA?=
 =?us-ascii?Q?aupZVYKMfM2olpbFL58or+EoIi5203BPbJeza3pTVVTJYDikYojJG7JJxd1l?=
 =?us-ascii?Q?B3qUU0ADGVkxckLsAbLfAX0PER8O06fONLJf2wpggvpF7S+/IWfiUTnR0yeg?=
 =?us-ascii?Q?7etAfEPEoDCRLy8Dw2V1H1hO0aDH7dJwJg5T9HOj4GItAqrI6FZ/s0YtvzU6?=
 =?us-ascii?Q?kwa9O8XCCe3JBjDy5rKFQSUzLUUw97o8K7uPG41PgR2PXJ+YRF/VsCZ2AtNy?=
 =?us-ascii?Q?wY40ZxRVbxSyZosCp+c+H9hKdMpZa/Za/n0dxASsml0337Jt1Xjd2CBV1MUf?=
 =?us-ascii?Q?ifeba6GvfhI209mCAqinIMInRWknYjh0Km90fSIAyKiNquUwui97CwS2k4CR?=
 =?us-ascii?Q?MtqHNa37EFdFSi61X0Kfg4xozcPR14mNtdcZf4TMqFYS7TuS7h0RPzs2pkzi?=
 =?us-ascii?Q?SXrGdA52lojmEkO47edwSGjt+ebBfwXwh7fxjKoSDicY5TjPbrcp+uBirYyf?=
 =?us-ascii?Q?684xHqIsqWru4AKlj5jUbmb2j9V4TA0KNR/wnpaEkBvUjDZQng3pmzD1MiRO?=
 =?us-ascii?Q?qbehiXqZHaWV1D4Sr/3VclxHWibp+vxYzyOTFumyRmKiiq+lHDh6Ljq0Q/lp?=
 =?us-ascii?Q?Uw9FiTslYxHQnCJ6E8WtlRseSM8osOmVVEgzYfIvVdOInOz2pR1fFJV7JXCs?=
 =?us-ascii?Q?qJvShPiPv7ZMaAQdvRGaYUQ6GT2V8nTIiQ3947nldf7H7jzxn9A65JXF9KXC?=
 =?us-ascii?Q?c3Ibcih3qdnH3D4oYVHJ6Nzu8qcUP0OgG7IXsPV0AlsFe331Z1UXZ8of5kPH?=
 =?us-ascii?Q?zMaQS80CxJixJP4QG/GwQStocPwiXsOH3mda/ZczrSAfVpBe9up+EAg9XON4?=
 =?us-ascii?Q?y3kUXVkBQpb1ASsiWmBhvddP0WfjsDj2mHfZyLuUtBJgZdV0rEiiQGo5z3bT?=
 =?us-ascii?Q?xNrMNQexyVoYSCE8xQN1ozsMBLtFesHpmDWEMJxHDBZVQxuzovKgnNzL9MLn?=
 =?us-ascii?Q?R9byOYAITI1W/UR8uqtfuU3QRCibWExXo4XR1NskTdiQbwgdkPerKZUf0SA9?=
 =?us-ascii?Q?6ZVsGOJ6HpEWrROUCPe0TVNLeGkcrqR3W83nqKteZbdKz5+QzrFsIaSnllkg?=
 =?us-ascii?Q?Vwt+a1SlKcE4J00/WuhqKAzrhAz2OShQS/t2xG/4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc8fbc1-a008-4efc-3218-08db044e10ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 12:15:54.1864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zovO3kX1URBFlPL0DbIj8DtleIhwx9I4gPUXFDdwAb59/SNst9teZJlRg1LL2dzQQnip4c0OstEGc9gvh5Kkbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 12:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176529

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.7.rc=
1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion next Monday, Feb 3.
=20
Best regards,
Jing Hui



> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, 28 January, 2023 7:09 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-4=
.0.7.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.7.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.7.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 7e268c107bb0240d583d2c34e24a71e373382509
> meta-agl: b9d4796f44a56c6a9c8233d82e46c251a82f6020
> meta-arm: ce41be0a7fe7c6f5fd2155866980388d3c83389f
> meta-aws: 9d9400b03c22839398756f505491718392907266
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f529e0594a784546926e89ce8e78385e00d0b0a9
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 1f31570d0795da90083d1dbf28127c90908e30ee
> meta-virtualization: 9a94fa2ad76990b0eca40837a98aaf4cd83a7248
> oecore: a8c82902384f7430519a31732a4bb631f21693ac
> poky: 65dafea22018052fe7b2e17e6e4d7eb754224d38
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

