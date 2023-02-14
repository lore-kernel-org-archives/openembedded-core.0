Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69392C6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 03:53:52 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.36334.1676346826652560053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 19:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=gwwEyXiN;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676346826; x=1707882826;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ha4qegx6jQKVzjAQdkMB+PeaEBjzeU0BQ+kkS4uTFf0=;
  b=gwwEyXiNrVC5gaV2VmAecE6TLPDkb7iSy2wyGgwRRJxbCyUfUxnGbcOB
   RSNpYHbCWde3MEVXrZBtHu1G2MrB1h8hS2vEfwVhdvir4hXvxOhqg1PZd
   CdY0nbxOnvHj5DYo6tkZSztBcLfWlrDAX5xzHFVkS0rFdZCFaBnERMktE
   BVLNgEp1vk8EKil1hPQzd9Ksdf/80mQXIKGHDpQ/u0BIeppdbrJSr4Dt0
   qSOtaI2zcGaQCfuVbYaJekw4xR29nzEVuslUND9gJVlJxFcJvS7Zqq7Fo
   PNp/LPEniyEKaww7lZ3E5okTmTiT2s6ycyxBPVZCVk1rS61zn6Lv8tjdF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329699448"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329699448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 19:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="699402444"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699402444"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 19:53:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 19:53:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 19:53:45 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 19:53:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNM8A6Ygju4GEg/XZLvIMgvUkgBsqG6MHkuvhCCGJII+2e77ViklsR7cgntm2PHEXcsiIV7om6MCXCxYLH/oufth+K5oTxJjTq7wWq6KPs89zy8y0T4+F4SAeRi5UyOS7RJg9PLojVNxvCigp4mgIDL72QbHmhdRqrtfQIciNLvj17+e0SVTyOSGsSM+clGbmhXEjMkV4wSnt5UYvcBItj56QyRc8CwA6j3yIgadNpu72SvhZJoYaam5aNDfB82vKQfLqxdJolB1ijdbEibLmOR4LuQ/0yTX3nFI3IRQtzqNS78MLKu/0fOH0lNfuhlmal2KqSUmfDwRd3iZF1eRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lq68Y15qie2mPQCJHAD1OnhdhkMo3BXpHa999lDprGQ=;
 b=P4J/AybpuoYo8Jbsh1KmCdfwB6lEOpIaE7ZtxFlzdK00AriVz99Fd6i8qWitz5Vrbryu5bu7FvgxA7Fn5zLjc5n/MGc2+RwM4gqJjTa/TunzPfSa9af6LvXhEQ/X3Jq1fgvNc02jOrj8JXdsB2rnzAGxoDyioPVLOv1NwivAevr16guPRgLww3MqFmMtB0vA4Q32FI0W4/Bg2eh36Ws0UfkuELxw1fIDlZsa0SKls2tD6SfHJ4zZzN1D6NSMsx0xLqVlrMz6ltP2StZ4kIMLmB9GF1p6+tqlsUtKa6284oMFSkod0cUVQXlvg3ZHC/SaLHnZaxZNQT5dZO3mZ2hJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 03:53:43 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 03:53:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.23.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.23.rc1)
Thread-Index: AQHZP643Byx4/GIMOkaK+rZQTYnpwq7Nz/2A
Date: Tue, 14 Feb 2023 03:53:43 +0000
Message-ID: <BY5PR11MB415233F1F5DA8A0D6AB37D6AA1A29@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101864af0bcbf-5f7d4559-c8d1-491b-84b2-2bf6028c59b6-000000@us-west-2.amazonses.com>
In-Reply-To: <010101864af0bcbf-5f7d4559-c8d1-491b-84b2-2bf6028c59b6-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH0PR11MB5192:EE_
x-ms-office365-filtering-correlation-id: eb73b52f-45e2-4a84-f5e6-08db0e3f10e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zrp7rIsI2LljWo8gcKcN0mj+nJiSKix8WA4QHCdpNRAIu2nZZK/iAL1e+WqdP0dW4bzReLaX1Pl/RHHBr4WEWzNrTcBXG+QKrEQ2iRatX5xv0c18T8ZXG32VKkf8peoonnvmcJD5pCDUuzzJOIx/PeBkfs7kMsAR9NKxO+CZtxaYcG1lF+zpz52LV7Tg4mhqOTO7/dS8lpspeaeUqB2/olgjstoe7VV20k4cE1C2TUGe4p9O2FJRmS4TIbzNRq0Bbs8NPDospxg5UHwaP1vFiKH8y/hMsiQvlPALNXovmsAy0/2VKRuHkrcYg1BdzuTFPoq4oXNyZ09Z74MEbVZatGw+Q0k52m/rWaLwMFmD9GUzxI08gVVt733wQxT2inPw66xGmId0NlO3pneBi9SmAtiS/FbTuBMgtlt5Bw3ra+pSoC0oz9S9mqyQiPC/s51smJUzhOZ1tGbroZfcghWMz4TnV+JNS86n8jgd9ax3YdYrqcsmlizRQyy9OZNgQFGu9QUMJawDhqHoALtkel9G34VQcnIMgRCReOw6mvtmftEA81V/4tiLRcWVCGutHGwACF/u+v7VQpuOeiiszLlm73ZNb3XV5GwyPrVNBpQ2hFPoNZtLqgs6VlB1zHPAHA4hgKzQbSN2UG2vhj6Zu1cDprbcf1X0gFUNIE3JHlmvM2qf0pAY62bmLzepMQGIhTWCuWG/yAiAWCUQsSXnJaFWzF68U+uXYlh6MZSImlJkpaY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(66899018)(33656002)(76116006)(966005)(8676002)(71200400001)(316002)(110136005)(66946007)(86362001)(186003)(53546011)(26005)(6506007)(38070700005)(38100700002)(55016003)(122000001)(9686003)(83380400001)(66556008)(41300700001)(15650500001)(7696005)(478600001)(2906002)(82960400001)(66476007)(64756008)(5660300002)(52536014)(8936002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HAjxc+XNgWEGPJzbHZItndHpJI0+SR8kTQy7wkAOhv4pgMIFTBRrDQGmzPmy?=
 =?us-ascii?Q?2NOvOLymuEukea91+N7AR9/xxF7CumK/49IK+d9D+ggBur5BQ7LOnQmJ96U7?=
 =?us-ascii?Q?dOZ5QnSOcveZixSnJpN5OLJWTApQrwGcLt/jH9vdjMY/Tw2+ZOJq4+hy1Rxn?=
 =?us-ascii?Q?Wk9mZsoS3UN7SHC1z6Epzc8NfR/LZn2G+ytQrYNFLSbytOl+8/Cc1d4nBpqs?=
 =?us-ascii?Q?XQfgC54lsNeLBDKGfO7fiGiDK7K/OahIYnz70Ji4MW+WWvrpcRS2bH26LCsI?=
 =?us-ascii?Q?uxLFd4FUlpXE1/Yzcu35srSA5CVgwtx+JZE5VcM5HodrjubcgOaH+3XNLa2I?=
 =?us-ascii?Q?g6ju3GXmNiOqKee2N/WgWDMhECXjcaipz87/Cb+UntuavR+U0HQ2OGCeI3CS?=
 =?us-ascii?Q?IcXgreUTEl31HgOM/Ywea8F4741Q7kuST8r5moc1uMv9D6Yomu0zkRkIQsII?=
 =?us-ascii?Q?1xnz37TpNj1sjbwPqbO/Brq+NJQgKq7PDdKdUC1be5CnEXHEgoGJRb3jkDpF?=
 =?us-ascii?Q?Uwtj85FgPTDsxFiL6dWbkZStpcHQoDNWWLMCWI2jvRzX2m6LMT6bGIQ5v9z4?=
 =?us-ascii?Q?R3ipqOK4Dm1m7JcANpwZGB9Ymge5zfcZWqQv+PXbMEth84SHyAvTemXR7qdp?=
 =?us-ascii?Q?isNySNjOtUkFvEPfPI7PoTrZ7hYfK2rjmBiEJdQSAet3RUW7P4L/wBn8ItDd?=
 =?us-ascii?Q?XJUWXTMg9nj43Tc235NQqjXwHxwJLFTEeINIwU98LatARKtMokT3F7uRfXOC?=
 =?us-ascii?Q?DOs68mJwjlLd98Cj43tV0P4KfJwUGw9duUuHZXmN/0jD8zm/GTqTqRLoo+KO?=
 =?us-ascii?Q?CJQYPbMKytHX6cyF8iH2rjoMwrpJf3QsTmYd9p7RHVn163vQLJwX+1dlSOE2?=
 =?us-ascii?Q?wn0jUO99ILH4DS+f60oolowhhYi0wCXjxikJUd1cIxsycaZ4E07crutiTr/D?=
 =?us-ascii?Q?McGUiKLDUEd0aeala6K/5Au50CnafVTKnIjMT9dZZAhPHD2bv69/1GBsxbDE?=
 =?us-ascii?Q?xjE8uD+RN2eGirSodOAzIqMHmGLbeUyCf9aBiR7KQVvLadZsG+JW9RvKoHc0?=
 =?us-ascii?Q?ZcQfEWIHkebbpsKASemVGBuDFdBmLHh32A8djDwoAfgQ1IxC6x0mr31sdzlc?=
 =?us-ascii?Q?V9CKGOgPWq1gIOB0iccRtH94m1akmVJF8AOs9o1mtqaj7dIPL/wH0gZJdUgm?=
 =?us-ascii?Q?bolnpUgdF3hQ/Zv2gApTFJSILlrVCnJ862zu8OozYXY9/1lprM1XgwEqj/ey?=
 =?us-ascii?Q?fZMW0ACKwmqZ7tZyo1xTLZDGsbph/xxP0RKQkO+XG1ph1QMw9F0W50lCLRxR?=
 =?us-ascii?Q?q2e2VHoNhv+/ckefmANK4BuMrRUCYIIkCywnY3dXBC+WC0+EouQuVTH9AwaQ?=
 =?us-ascii?Q?E3JTASU0Eo5WQjR5iNZW1yTjeBNC/S7oAnfRqfh9CXAqHzZcwZ6IGEa3U5ic?=
 =?us-ascii?Q?mMJQd/t2b/5yDIy2PE6Q3X0d/ney9poBMeHwD+WMCYMC6XqhOkRMb/o/Z0n8?=
 =?us-ascii?Q?WcPi+WBdx9A9nbc6UrM24gIVbHxwwPSPtbMGVCuHux6M3ADblUpWRUFPt9mv?=
 =?us-ascii?Q?2UDcmNErNVxciwAI1K0zt4swNdbonhTjonnSBwn9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb73b52f-45e2-4a84-f5e6-08db0e3f10e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 03:53:43.2004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoGMZBa/d7edxmnAQVu3qbqjEl3Flmj2qHyh2fR+y3JHzhkh/OvmtO06Z/75ietp/rHURYsR46VG7/ryE8ndQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 03:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177120

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.23.r=
c1. We are planning to execute following tests for this cycle:
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
ETA for completion Friday, 17 February 2023.
=20
Best regards,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Monday, 13 February, 2023 9:22 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.23.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.23.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.23.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: c16d364dbf68d2a500fecaf8d6e6d62b11475d9f
> meta-agl: ae982d798a979ee5690bee00ca90a2855bab4802
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 99e30a393f980694bf46284521b137eddd6a753a
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 6c202291925bb179d2d08b5bde80192f9b032b88
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: e707e9b7cf5c62bff4fee029965a87b22dd4ccba
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: daaee6fcb0d201f041678af433d8e1cd6f924d09
> poky: aec83663aadc871354b441eef0a3a41eb3780b13
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
> View/Reply Online (#221): https://lists.yoctoproject.org/g/qa-build-
> notification/message/221
> Mute This Topic: https://lists.yoctoproject.org/mt/96935139/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


