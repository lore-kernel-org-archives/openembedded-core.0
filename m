Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA9FCCD18B
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 07:51:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web10.10101.1726645906784404168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 00:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KdlOvP4o;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726645907; x=1758181907;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fdg3HvptJDyg2Z+iZAu2dv50/vnRS332HyTC0h57czQ=;
  b=KdlOvP4ogiteFlkQRis1jdHvCmCouttTrMAotvKeqWaZEGGYgXHDY75D
   etKNhP0PI7X1SgPL9MbbPXGtDQ830cfnpXkkpHVMW3dKcN9j72Kk8/nRK
   pKKFF3tbpLz1ZOUVID4q29pl5LCCl4xDZVCGEdIM0/548vMP8URJdxq0r
   4wLV6jYBLnD2qyxsDCZTNWxA/UpT4a63wsgM+VYt59nxY+FY7WwHANmNk
   TYTuLJSQERC7oy5o56YMDZmKGl1gG4pMQY8H6sEyoi2LDTc3M+7o2/rtR
   sj+t9g23IDvL+FRCufiE+ngCbxCTGlMEl+wFqciZipWh6RWw3xcL+/X94
   g==;
X-CSE-ConnectionGUID: 6sgjS93jSyievqL6l4awMA==
X-CSE-MsgGUID: 0H4O/vaTQZuX+si95g38zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36676815"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="36676815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 00:51:47 -0700
X-CSE-ConnectionGUID: FsaU15ZqTMe+YvkNfIftBw==
X-CSE-MsgGUID: +Rtxkeg8R/aB+u1HBtj6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69094661"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Sep 2024 00:51:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:51:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 00:51:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 00:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIk4fusOU8R0JolbjhnlP3YUbR/LKd5PIqJhGdRsOCROBCBs/Xrwdol/Drx8kRXaxYmskskqziNVGaMnaXRKv3EOBPM5UkwGpKAsrNS44nyfymwctBWFu1VfhjR4ceChH2HfhgvzCyIYFkqD6dsID7XzIMK2c1PM6RnnQCDRm88KtNyArbSjsk5AkV375cn6rBsQacSrWv8II7VkTka493nWwOGcVi29dmuQbb3P54LeTgyD0IZigNZAthflggvQdyN3z1bhw+s6FBbhixtwv+pJJwSQErH1lm0JYmbWWDeAtxZ+c0nnyG3Tu6U1ykeETJCbapXWUvgN/I1KpDzFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kkuRo9hh7tF4diHiw/rRFAdCl9IAX25iU9qPHq2Keo=;
 b=ypD1hnnMHbHbtxgqUq8ud5II9A/cYbR59p2CiJSMs7gId4lSbLGLjQadLA91zca+Cmt9KcXs2P3RGGiGrHFW25fqbxTiiY6btf1ezMI45YS/aPJeQzX4+U8PLrxJ6dRV1dmKotW9y/JER3YZdgVQUlrgPgcWyMvvTmcXYThodJJp3zs+ISoHW5kbH1LEky6q5kma3JchHUcNIg9Olkt1gzZ7IAB9BUAJ5KgKTzW+88R6BWBf6fTDrA/+wWlzfb0wZW13WfnqAfSDTFAD3ZCZuxdD2QI/OPGPb1lM3iSRNkLgE9enLSew5nsyXHnJoNNYxs3qhpv8ZoWFFK7VX6dVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 07:51:43 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:51:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.rc1)
Thread-Index: AQHbCYq0L9/cueBBWkSj6zXGG0eru7JdK3ig
Date: Wed, 18 Sep 2024 07:51:43 +0000
Message-ID: <DM4PR11MB77606A251CABAEBE6F5991BAA1622@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019203947c20-b2528d50-bc02-4975-b808-0f39e1b8d01e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019203947c20-b2528d50-bc02-4975-b808-0f39e1b8d01e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA2PR11MB4809:EE_
x-ms-office365-filtering-correlation-id: edf99751-9071-4f65-b51e-08dcd7b6bcdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WWXE1AB25soBKwlfLuNaHEK91JMFoqsD7lz3NI+NAhcI9bcn7ChqNACOebOC?=
 =?us-ascii?Q?loTtlWW/pjlZjEWW1BWReaDVREOqUxNmasjB9dtj4tV5q/1gpRa6ltJ6lotj?=
 =?us-ascii?Q?s4vA0V84hPi9XIJrmfM4pYc3bPioHOavfcMXXDu6XY1WXKgH1+EPNW1Qd+tt?=
 =?us-ascii?Q?iJMYyZe2M4L70PW4V4bqcRjt49IFbI+Z47RTWPL2OobCwS5SC6P5Qat5oWSN?=
 =?us-ascii?Q?rVmt6uNNXXGcdWq/jMoSl/7oMMQ7VGf9Nao8hmItWpcKgyxdjIeG5r+Q0/ok?=
 =?us-ascii?Q?gQLV63S+/IP2b5zfTIGQhAOrT9PjPm5Hna/CYu+icyTgWtsKqFKTrCrOryA/?=
 =?us-ascii?Q?48GsJ8q0kAsGslZLA9jZq+xoZ0aTYl+2f2yQEhNpfxhI97XYhgl+fOfpb2Jq?=
 =?us-ascii?Q?uOoyehzzHzAakS0yT28zsh447bVhErT3UEzCA8VmKLyZ/ZikFZuze3MDJ69z?=
 =?us-ascii?Q?yZHo10LRLlJi07nsvbn/tlA4nIgq4d+KmVAp293nsj0S+mZr4EKF2E8gtfeg?=
 =?us-ascii?Q?4RdniJb7WTWnT79QK1AJOsld/LRAddIQ9Ng+pV/WyNVyjt9I0VWZjPoSD+DR?=
 =?us-ascii?Q?aixrDRqUctF0WaLP8o8Z2WF1Yp+JNqKEHp27iv/M5KrrLE9GK9shNWZzSn9y?=
 =?us-ascii?Q?FB4ni5f+77oHan66SFOuHoD0lgVoODhaxkrHRsckc0s1Uh+fX6JN597NXDsU?=
 =?us-ascii?Q?JPNLc7KHlcx2DDgNIo4PKcQ1mB/Lauv3p96Z5hnDSGCN/c9p9w7lbmatksC7?=
 =?us-ascii?Q?9Abgi64EzAlrFaL57e/bqIQEIbQ7F0aAALP+b0UIRBopgYaxq5tMzRTzNvhu?=
 =?us-ascii?Q?UF5q9fa7oQpx0aCkM3GaXSSODEvYENaZcjXRgki4NOwPGCbpG6d07+dnNBXd?=
 =?us-ascii?Q?PyP5L2uKVNiZFt6SYJDfO/MzmL0TxsekN7K+znwZOi3bGLMlszkbR1oTXOI1?=
 =?us-ascii?Q?VAa4AnkA9KPoagT0Aa9RFoAkgv9zqf/FpV7vapirLGk+grgeu1eas2TdmHNA?=
 =?us-ascii?Q?48ZbqqvzwJRUO4+M1M4Jt92iPd4/OdrEc8cw3b1H9QpfmNh8kFdW1+VcImkS?=
 =?us-ascii?Q?SjR52s0ftgGD3uDpklp40uJk0QdJF1HvPiT27ZSrpoJpaampZ32cnM73WDrM?=
 =?us-ascii?Q?BvtfoQ6g8+cHZEvB9lyv7Vkx8xjtBvqCm4Kd3aoP3wnz+4CE8R3OTdfKcoGa?=
 =?us-ascii?Q?x7zoQ7J8GYfTuhW0YuMsdQ7ZbSTfF09mB2t1Nw4/1oy93msX+G/5K8EF9f20?=
 =?us-ascii?Q?gAHftqElYw6+jykdf6Gr1MDX8SfpOaR7o0dLej7KbWwMbbyPv8AFGvaST3e0?=
 =?us-ascii?Q?wxKPPF3nk/9lS7QqyunDWeLC97HJXUA2LMVJ8M05lrupNDjFSZdh/YwZzzcS?=
 =?us-ascii?Q?/iBTaYA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?suL1IspZs7+m3jp+jG6n9ghlQKi9LdRwuuddFPvDV5rbHqpH+9xVUr73s8zM?=
 =?us-ascii?Q?yqnUdwtot7CMiI/MI7JBfbXUPXI7jN0JUloVceQjBnwTpYLsaiy0ZFKyE7Nx?=
 =?us-ascii?Q?Yt18NVQjcKPJwLTlI0TtyfMo6EGHgQND1/B4lc89hnDQ+Ghtvoi+wdH16xhV?=
 =?us-ascii?Q?mcCRFVwVEDUaylYjHDS8vNdrpMHbKz72dCAmlkICgTbIy10lE8vvrZnZZDSY?=
 =?us-ascii?Q?7UfooOpqHIx2m1TheTvtkX1l/Ke7OtJKEAbWyPfD7Pr9rPLy5IFMaFX6K/O5?=
 =?us-ascii?Q?fqPlLJKYHl5z2EVdkFwZsTUH5N7aipMR6+VcptW+bR20z8IrlTlxsAA4SilP?=
 =?us-ascii?Q?9L5a4TOCiaQpl502Dlf2Kc6eZYWBAdAPQx7VWPah8Tgq1CPIE2y/ld+fQ4/P?=
 =?us-ascii?Q?fYas3hlVcelg8tCwTuVwZ9/KK8PNyYXNo5baakl4cuMklrbG5GLDPKPBYE57?=
 =?us-ascii?Q?blW/PeLgCjnwrBM7lzkfTjfaOtbHdeOG9iJV+3KL+UWsBcL/bnO8vp3lbpD4?=
 =?us-ascii?Q?4vI55QiRTcJfDtYj86ToD2Vi/rcIMhtorRvHA1ykMZITnrYsD0I4UJJf35On?=
 =?us-ascii?Q?Le46UIXXfQJbx6GnGQOeMuy82UQBFZXT+xl+6Go5tKOsVROkVOL3RRAZZvhM?=
 =?us-ascii?Q?yUrm3c7ySVmqkx8wXgpKuB7CCV1CQBmWMVTwgK22k77V8b1Hd/KRG5zUIiIo?=
 =?us-ascii?Q?29cZu4x7x6Vv198LK2kiIQ39x9yh45ILFdgc1hji2eLULgxD8PtT3SntL3uS?=
 =?us-ascii?Q?0+umX1zVNpzKkKBj4fkqYBjnxO9Egg8N1ovWnJZXazaxf98r7uginpnILcSu?=
 =?us-ascii?Q?CQ2g24aMqtKuXQG9Egyw6tveshuQSUt3i8Dhg8C6UbLoqhQ04YkS83gjWtvf?=
 =?us-ascii?Q?NmjKU/2DD94qW5gcFM15Bs+dj6o4HUSSNayTh/RvnMMtVHF7LcsjQz8F+Igv?=
 =?us-ascii?Q?rKEW8q2aKY61nEaJhdzugEw4ABgfCS957kw/ZijL50TirrQvU9hkoPMudCK9?=
 =?us-ascii?Q?BILRjjZWjPVkJanzStar1Hw+OpXpyjuCbtDxp/b89HD07TK7UaccbhQCJkyu?=
 =?us-ascii?Q?LwQybGxlKFbWdxTIsZZe8jW8YcAlF0tRczJTFPtS9OrRV1sQTayzBx7Y6aRe?=
 =?us-ascii?Q?gat35kwyQMRRAwRQQBoxR8P/whikRVlA2IK0Ud/8IhemY9q4uK6glTlpEmR1?=
 =?us-ascii?Q?376j9fIvcyLo6m9irzymjbSClCyoyRKMjlqbBbcvqMg13QHQTY2LAa92/S57?=
 =?us-ascii?Q?jZYWCuhXWB9jdHUInwEWIHJ8NZHsFy0pBBYwSArecTuhJJvGK9qQadeFMOms?=
 =?us-ascii?Q?ZWfnT+AMK3vJBTB+jiFBAm9vw2bpxqzhrFu3qmnQVCMrFSPKOWPoCXwid6ZN?=
 =?us-ascii?Q?88E8z0dkBBTk633ZEZx31PP9C8UZPaanEfY3yoyvm0CwP8Rm8v4mTB5FwQxx?=
 =?us-ascii?Q?koRBKPz/W+L5vAueD4tBo76Z6ipM90u5EEwoV77cpelOuwFuo8qPMfR1KNIL?=
 =?us-ascii?Q?4p264rpn4KXr+rw947AjQGyygOSE3cG4nxNVUNJsry2Lfn+09/vjCaqHL2HJ?=
 =?us-ascii?Q?L4toR9mMRqh1VSZCtqNhpwBZELokTphj6LI5HMqJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf99751-9071-4f65-b51e-08dcd7b6bcdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 07:51:43.2073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xIWey3qK77Mfsvpj9+KhBrzHpTvAfowUaomLxoe0x1A3Lsy6w3IxbiU6iS3Avbzyy7MW+NDsC6Mi+qWu0GlLXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 07:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204636

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1.rc1.=
 We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion: Monday, 23 Sept 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, September 18, 2024 1:22 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1.rc1) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7338
>=20
>     Build hash information:
>=20
>     bitbake: d3c84198771b7f79aa84dc73061d8ca071fe18f3
> meta-agl: 5f5296f39181ab01c6bd616d6459edaa0d3283f3
> meta-arm: 60361945cf7943175274bc4f4cdf842c922dffce
> meta-aws: d85b2bf3078444654873abae6e93324cfdc4c669
> meta-clang: 814d20901a71fd4d98a5a67789d69ef7e9a2169c
> meta-intel: 4b40ffcc8daba6bbe50c9405330b6280d1e4a64f
> meta-mingw: 4ac6cbfdce1f85294bd54bcd8b074f7ef32c378f
> meta-openembedded: 3fb5f62b02f812da85e818e80a1dd3c229df41c1
> meta-virtualization: 8138d9cc7e0c31171230110db0cfa881c46a821b
> oecore: 161c5b311f1aeb8f254dca96331b31d5b67fc92d
> poky: 8f01ae5c7cba251ed25c80f0141a950ebc8a5f73
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
> View/Reply Online (#465): https://lists.yoctoproject.org/g/qa-build-
> notification/message/465
> Mute This Topic: https://lists.yoctoproject.org/mt/108515640/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


