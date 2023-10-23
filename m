Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A01CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 00:53:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.111634.1698022435383005839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 17:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=CN8en/S0;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698022435; x=1729558435;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2DJQC85s0Z6KMCOqzJ15m4/CcSrw/U92f0kXL5D6+eA=;
  b=CN8en/S0esffxnZfSfF1dqx9Nz4HJCmDqLjg6YhBD+S5V4GqQhx1iu3L
   Rz+5p6qP5RwhPLc5NA9UKKLH8msCeZrIryd6/PdI2SMfNm0vKFW7rrHo4
   zxIM7RFqWjoJ1HeMFF3vYxIc1j2VrGN6pU4wSXlXoIr/hswTs8+jWLeFz
   DPL42RKLzh6TPwZAUhwriZy68pkoG6N7k4cYff8kyjZkctDobKcT0fQGh
   NOyRxoCEdYhZNqB9ulTH/zAbk5DLDxU+IEfNFX3iNfKpzTAPQ/3e4zj29
   wNKxP9cZywpfIQi31lj3tYJsN1qTaqMHnonlMTF8Q8UeynASJwH6HTEhy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="383944630"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="383944630"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 17:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="931530214"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="931530214"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Oct 2023 17:53:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 17:53:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 22 Oct 2023 17:53:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 22 Oct 2023 17:53:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 22 Oct 2023 17:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEk3J1MJHhzvwIbwH5R9aw5VwOB4gKZCCWDO8VqVJzlIlbzL0gCbbXkObDhGI6LX6+sHC5kAAplVDdGF5924dJWV47Xw5d+6q3F/rckr3MEKo47tiCNxcfNbqHuNiYNp7gpi+WtCKYcZ20J4o1IugE2jax7hWnSowz1yarKrZ5DkGBrlkRX0pznOJL0xKc6WhOuTcq7w7jVGjx3Qb8Su3cwD+ahykUOSyVXigkqd9WPlWlG2GZJ7xtVui2P/hdY72H8sz1eO3HwvToqJoF2FH+sGJ3YctjICrEwMUmBDJ/GnSINFPSANoTcxAXnB0dquCg7FpfpUZxdfnHm4U95Vqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTHlJWv47CtHeSYUlzjRqmPkSAABdHInMPnzytzMddw=;
 b=JymC9pyLXtywqLWzmBKNxFHyh4S+yvzCkkFgOQXI+TyzxM84z9fHpuqo8IYXTVumqSjrV7PZci85qmhxRse4KxtfUWEQFhZcy12e9Yx4Jcr3aLlh3GKpGeA2kQukXuX6DU2KRuLzpiVuJb6lVQXn4NvoFuUWYUKDfohd+yKse1b7lAogJw6D1t8QKwQpNKA5l1fcsVbUWZXqBQBC9L+3TBq1x07HLnpYdoSDpEzYGtvBv6h1Ndph/1Y1SXA9XnqOo0uWNwLssAN4xqyw+z9cDP1KZhYADt+rFRkkt+3u42UGtfvvUys+8U3y2Otvyki0S07iWbBnIQ02UY2O+AoNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 23 Oct
 2023 00:53:45 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 00:53:45 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.rc2)
Thread-Index: AQHaAyJ4RVzgeYR7u0aCw4IO3F76wLBWj/SA
Date: Mon, 23 Oct 2023 00:53:44 +0000
Message-ID: <BY5PR11MB415271D296A9BEE6F55EE580A1D8A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b4bde33b6-a3fab4b0-bd55-4084-8c36-15407b954459-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b4bde33b6-a3fab4b0-bd55-4084-8c36-15407b954459-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ0PR11MB5937:EE_
x-ms-office365-filtering-correlation-id: ca37cb6f-f528-41f7-562a-08dbd362825e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qVRXSg+EL8cDE0eRq1OHKS0vz1ufV/qcu+9hXuNSJwKxv9bc4L9+FwWwvNqqw09hmU1q+aZTbNIzZP8KUjYErcxxRgoXTerA2efCL4mZOW0JIg5WlmckfHBweCZdPHg64B27vtOuH6Jjlux+cBbcwGYsJnyaLY1/Ex+1LZ137vJ9aXXXmCzmwpjHKzNWu4HXSpdiwdB+5P03w8XWkhNCV1Zt1bMKprcUawI/XPmQKPPGMaWD+63MzqVYoEjRICQdqBCklGMJ6ok77YgWFDSXsil67oyfHBQ6KYvfr5ZckWVCMeqdWu+mY7Qq7xt4GAaXo/CAEHBwX6TJfxDuRKvUtcCvgo1ppJARlyHIAzABfqM+44OyjVxA0jruX5foJUWetZ6LIemNzPQt5LBzR3POPe4rkqexTkbMKIdWh3vPY+RvG0v80IHOUvwGhHr6Q/DfS/UX1BsvBexpnuzIScRQ0zqA1senezfRM1ayuDxGZyA1btWN1HkiUpY4WaIhNBxqhymA0U/QD+Kz6o2Dd2V8hTOT/Cn92aVq23w+jqLEQXJ/qgXRrdJ+F1KBgzpUtTP+YoujZGJqKqmcdOHTU9x4whhm8uaGLbgDFshPzpzxFnRC5KpwkDKTzrbl9nmWRmlB7f4F6T8lI5MJO5u7AWJ6KA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(2906002)(38100700002)(76116006)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(122000001)(82960400001)(110136005)(478600001)(6506007)(7696005)(71200400001)(53546011)(9686003)(966005)(83380400001)(41300700001)(15650500001)(52536014)(86362001)(5660300002)(33656002)(8936002)(8676002)(38070700009)(26005)(66899024);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yZmRY7iim0lVAp/IqbsG6ac6iaJT3xgI1uNPa/GL4zvQAt9Gl+2EJrInMUo9?=
 =?us-ascii?Q?Gi9OpijEN9vX8r+Us1AahTZm6ysZUflYwTGj93Ns5ppsRQUepua0S09uu/r/?=
 =?us-ascii?Q?P92W2wnqn41cBRAM+hJsOQWH1jhcJ2PQzLNLz7aEVe74U4gqCtfX8rU6v/Zn?=
 =?us-ascii?Q?SkGOP6myUt6l786gaoT0uLaDLeYRn1aJKXPJOKpJGwMTc6M9AUB8vpOrEdDV?=
 =?us-ascii?Q?bf18Npxb8sWdp28I9xMuCw/NBnrpnCHVGKS46MNd0WhrFWVuvt3QzhJGurO3?=
 =?us-ascii?Q?m+r3lX9erceQo5Vh5gV8ewS9KYpjDxfOyb9mk63zSX94qwQO+QFgemnKPv8v?=
 =?us-ascii?Q?VFIgdEkuCjnG6zfZLkezjJRK/0iHDfJdwMt5NF4Z5cnDjZq9QYvG22JGu9y3?=
 =?us-ascii?Q?jCUPcL88PQLbSapjYB6lPuji1DOD+XPsqddc/UVtlbWv5sNOiRpiSqwFHiEE?=
 =?us-ascii?Q?19SEVMciC0DMVMAVWU/C4nUg7kwThuYNQ6WvMI7QWuuiXR+RUM0UiB6rcaCp?=
 =?us-ascii?Q?rnzibu1sC8HZfrefPz5PXV8t00+5x0SWlgEYLDQVxSFC211c1UDjOBIyV5Ke?=
 =?us-ascii?Q?+z8uSBvKfl84x4jynXfA5m7T8KO391lyVyepjZoS4xcg06tCvpRBoncoPrxp?=
 =?us-ascii?Q?Uc9kboPH4H6Ws29oroqVhrtFMeOWZd5F+qP0MU/lvjAu6Qxt7UD+/cQe81Kv?=
 =?us-ascii?Q?Ha8LreIsDBKRnPextpHH+i50V8Wguj9ZNp5yR1aZNhZJ6xjYBuy/3km6U1GA?=
 =?us-ascii?Q?w25+BlBbnAeNLRktjwbz4HR2ULmhB7qbuUksVsK2u2NxzVsoAnlp+uyj3TBI?=
 =?us-ascii?Q?AcJWkg2DJlQibf+zEL3IPFzgpeevWjNQcf/Ex9r5EttBgNyGJp6mhdeO4+j3?=
 =?us-ascii?Q?+L3DN8M2wjuKQZ1m8yV6mS+mi0htNmhXFUZkftlerf69tGV+vYC3HUeWm142?=
 =?us-ascii?Q?kIVH1bGl55Wj7hxPqlf3EtyyNzy8ElSp4UZfJsGqA+7xqyYaZxYPIC7NT+Xm?=
 =?us-ascii?Q?bhAW4eZe5Km/lvdg1wKCYgY+937H2dGP9ICaSNjhMeoR8Rngzpeb4zRsrEKE?=
 =?us-ascii?Q?AyJWzajJfZyGAhu2qN9Sdw01RvGrTNMmED4uMgB5VmCgT9rIXxy7HX8nQ6xR?=
 =?us-ascii?Q?usKczWlH2Kozav50gl0rLDxUJqz+kOppN+W7s/LnhqxWP7VnjSAZjBdjYAsG?=
 =?us-ascii?Q?JAGSvNPYQgdjIpSNHdeMKsJfKGS/26gRqusBegldahqvjPz+PLhw413xmUJn?=
 =?us-ascii?Q?PJYLIhtnGd05XsiUyKWNtpL0uIx1C6gMpGiW+M7U1Kp91Cu5dRpsLu7RN5i0?=
 =?us-ascii?Q?ZBW16g6F1hxp5Xqr2UDzNtVSNmnpsrvgHtB4Tn7Ea1+WqSnCcBx7VvmEAUBX?=
 =?us-ascii?Q?nHlJEbSyII4uXCGIS9FLNSCzrNIC048bZlslwxAiovJVMyXRqoF0DKnFP+3C?=
 =?us-ascii?Q?UxHC7U4QRwJqNC4/wIu1PsQ3aaRXoh0MSz3WanOWqCgA/bN7MocSZ9gBKTZb?=
 =?us-ascii?Q?fjw0COrnZ2FVsVxkeVi9jL8qmD6Uxg1MgFBMfJYuz/ilk7KWfD0MZMm02YOE?=
 =?us-ascii?Q?VSVUT9kiwZN8nZut1vJiujeeGL7XtDgYvqOE+OIP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca37cb6f-f528-41f7-562a-08dbd362825e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 00:53:45.0015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/8O0M71hgo19vQDi7GzjfhXrYnq93n4gyu+rzDkXCcbtpTSKmTjSjSasdfR9RU4WP050TvcDnQD0/EkTuk/EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 00:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189612

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.3.rc2.=
 We are planning to execute following tests for this cycle:
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
	6. Beaglebone

=20
ETA for completion: Thursday, October 26.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, October 20, 2023 2:56 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.3.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6080
>=20
>     Build hash information:
>=20
>     bitbake: 5419a8473d6d4cd1d01537de68ad8d72cf5be0b2
> meta-agl: 4063b4f9a712e32337c1d9678b2f2481dde2a346
> meta-arm: 4bf3246b7b1147e29d42a835631c89279a6ce520
> meta-aws: a30a2b66f1447dc5abdbca6c5de743e39c08b99b
> meta-intel: 1bca60610c597571769edc4a057a04bfdbd2f994
> meta-mingw: 65ef95a74f6ae815f63f636ed53e140a26a014ce
> meta-openembedded: c66ec8776ec6f467937918a114bdefa28ac036a9
> meta-virtualization: 827092c2ec925ea3a024dcda9ccfd738e351e6ba
> oecore: 4c261f8cbdf0c7196a74daad041d04eb093015f3
> poky: 15b576c4101231d248fda7ae0824e1780e1a8901
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
> View/Reply Online (#329): https://lists.yoctoproject.org/g/qa-build-
> notification/message/329
> Mute This Topic: https://lists.yoctoproject.org/mt/102076568/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


