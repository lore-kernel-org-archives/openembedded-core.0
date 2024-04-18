Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9ECEC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 01:09:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by mx.groups.io with SMTP id smtpd.web11.2315.1713402583135066368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 18:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=DPgRD4Sn;
 spf=pass (domain: intel.com, ip: 192.198.163.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713402583; x=1744938583;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yXmsUmHD1hMmWaFX5xOQIHVG63w0VG0CWqsyn7c0USs=;
  b=DPgRD4SnvG88lBZzj9jw2SfN/GpWsOOpsqo/DhqzaQerRdrwsYX69jWw
   59M8o/j7uzKOouLFVfEGMXzcFQYvVcM8G1WpB6Z55VjSAflC1nRhi99iy
   MxpwrQIAG7xlo9XGhHq9JIqeZWyD/+GhUVfK5KdDPfAaMZMuNDkYZx0+k
   fRfzkfhtNAa9C+tFjDzDRb2MpwfUwI2dITrvqqb/QaxETFJgz4S8mIr5J
   qPI7miydWZr4YGd/ZPRgoe5c2ZiyQgWmKSc8Nm+j3kwhDcYi20RfpRFAx
   hLdtuCBE2Il+ums7/RjREIen8Yc9NJJ6Q0i/JBXZEwNIIZWzr3N2pHCq/
   Q==;
X-CSE-ConnectionGUID: conB4FV6SymIwmL/o6J4AQ==
X-CSE-MsgGUID: 6si209MzTsaTPyBul4V61Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19627803"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="19627803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 18:09:28 -0700
X-CSE-ConnectionGUID: G8adOZk2Q42mY+5iQOWDKw==
X-CSE-MsgGUID: jBYpTQbaSJa4hUA2MVYvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22896736"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Apr 2024 18:09:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 18:09:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 18:09:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 18:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBz7OB4i22jt8uAmz+nHLGGJZxNOMgKyPoBcPcmw0IlZTDpg2SzsqVZCZeXJuYe4Sr87yhnR/L6UKes6OzxeffnxbnGGHk4GVyGdvhu7HYNbBzTU1NRPF0cKpDwQ50MJ5KBC9D45qH6ma1+p6UdktniYJ46YhTX4VL0VAJX7P9r66rt2UJvRUVIIN3JJ/iwt5OTaGSzMcNJTEFrwupqDcoPYPQnlwJTj2Y2vE5iEIjP3YgrqSRxkYY2GGnCPKvnbdVaaC89lQoWRpFWjXD354rVWltwVBhi7ZOXVdOQustItdMSuAoN2nB7Mf8QB7+7ooTcdQWOdpBu764CUjgP3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/Lfdt/Ld4DqGOpMd+3YFiZWLCQhpI663EOSA8YRBxY=;
 b=BJ0PkaAsNXiMGWnT/1xYb/8Utxr+mZm9aFlm6sTMdRsg+J3WPe8xiIOaeF+L4IXZ/1mO1+ulXSd/0ANAEcxYcdUpTVLpl9QMB8n/gWO+6/3t6rVysRADo4lH/YuMVmOXvzzcC+0BlElUncPhxcMW9W/GEjb6EqCpwjOiM40x4xok72gnABtfswna6LDjXtYvjqZUz4xmFsKV0ll0B3KqBvQodDJDKZXlxvKI4h1Ugb1MjPCKb6rvgx9Jd8UlPwZcDAalvNHpahzTm5OUjnkHDd4HxoW/603uxYrtYfI1TEoUzLRUg1QSQeyPXt+S76ciCSIRPoP62WgNysZFhoJjrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH8PR11MB7991.namprd11.prod.outlook.com (2603:10b6:510:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 01:09:25 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::3913:6da8:eb12:6a61%4]) with mapi id 15.20.7452.046; Thu, 18 Apr 2024
 01:09:25 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.rc2)
Thread-Index: AQHakKKAq2SPMXyvUk2S+hE/jbFhLrFtNn1A
Date: Thu, 18 Apr 2024 01:09:25 +0000
Message-ID: <DM4PR11MB776048AACF2CEA6724F407EFA10E2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018eeb341f1c-6cbd9227-adf8-4d80-b90e-d552b36e72cd-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018eeb341f1c-6cbd9227-adf8-4d80-b90e-d552b36e72cd-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH8PR11MB7991:EE_
x-ms-office365-filtering-correlation-id: 9d961ed2-f6a3-411b-9a33-08dc5f443090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LAXw81sAr0AMnFrufviF3E9YxYiRcrPBTqmqpJsrjiJ/STYHkOOnGUTZYatpRyIyig3PaEn6BqYLKvfdrNnzEDLR05C2PCc7oMpoVYhbvz3xIZnNCeXyAuARbpn+Bg9N9X4Yo9gljHbgIVJHyqAtCtGZMCGK4UomCeX2BcGb7DfeQMSlKWyxIPgnAO+tyiRm6qhCRgiy6Zhg7BQ1hgE4WLnEM3PIceLaFSQ1giNnsTNCiaZZpaCjjcWmiBJ+GE2pbk2fgmrevdfq2YIsXmVmLDlqjjAOjDNeYYoqkzTQTXAe3oLoX3Oj6ysQq6h+I5JyqEDWhOK0vBO2WWJFPRSHZdIwfw0Wv/b3ghgE3EK+KxMyhvEXvenYdvM2ewPGaGu183P3HqQ5f0RdhHqhM0kBS4s2E9OE1IUFNArevS+yU7Bh7rzCjduvL8oNkWZVYF3l8FU6P1GVfRAlAKb0oB/CojNSB/Dr67+oO1fB64bm2SnDj+5xbsb9Ywz+ui0IVg0s7DU64SEwwCA/83wkfoQfsmyfZi+WW1cblHt4MmrSKbrcAV+Syqg8gXrjIgVMCVGugqiW9vxKFHfrIB0YX0voNXtaWOIxvoYZPbSJduoyKuQ6zk/UevYGBY4EXJ854tF6oLZhWz7BNhsv1tyEdcKovEUMiorCFs20LvmpGOHeD/wm4QrW1wPklxOzren35reh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EZG1bxsO+LL8UMaUnSol74QhUwI+SAf+U1Kvz/uyeXbvZ2uRjyfo8JOMjCc5?=
 =?us-ascii?Q?CE2EI3TsNqL834KaK+bWLnoZpTU7LAr7RmrJV1qIaKPff3g1QatS/q80P5ns?=
 =?us-ascii?Q?2IsekBwgQ5wD6/oD5PgmkwQILdxX7hEqyKC/hywQFwnHAtP2cpRlg6xaqgcv?=
 =?us-ascii?Q?fmwpod1urz1VSCgSZ5c8wU4REl1/hPH8Izc4vmjIJojQsHMUcp53C0SAXmNc?=
 =?us-ascii?Q?LeADse8XexBUlKFY0dwsa7b0sgRaOL0kSL8rTEDCjCDShKkud5dfG8jRmoIO?=
 =?us-ascii?Q?iM98STMfXMvNBQEu2Oaf6w1Wz9QC1+lxxnoklnFI96iAw8pge+VRV+raBNmL?=
 =?us-ascii?Q?5Sf8w6SGhrSqVFYumPj9+GkpJPkj3WsHFh37qzVqX5g5awJDx+HDNg6SobpE?=
 =?us-ascii?Q?IAXOb3EDYHey4LZ3hQTtdzCuRl+UV4Ol/np8Hv1NQVrUOPZ8n3wi2z72aYfj?=
 =?us-ascii?Q?Hf0SL4af+RjPosM7lAEwzOZJf6Cd+TzWsyN2NSRk/C0vjlqBh1aBvtT4xO6h?=
 =?us-ascii?Q?p05VqzdThm2wGbGKbCVdo8SJTt9II5HNpHQZSfrIV6Qzg8gzDeR6ynoo6ETK?=
 =?us-ascii?Q?tyDJ/0joNr9iVJsUANDD0kNoXrseGDn08N9CPH602YT0iO9Rafm87keuMak+?=
 =?us-ascii?Q?DDT/IlB4ydLo3oSLKtn4BTC/kCK+TEBA+OjbDUu3Nw5v2h0sIZuxvDG+Veoe?=
 =?us-ascii?Q?kYo3ydFIIPXdQBTS2U1xHWouO+Ea9YgJSeq4lJAp2N8tr3ulIZ4Sox740VNm?=
 =?us-ascii?Q?dvf/aGnGEG9GNWMWSWIil1o1k95V6F98IfB+cTkQsFb7GRdplSA+0S+v8Lh/?=
 =?us-ascii?Q?rjmepeOEkI05t7ANn4MYuOlxYXNu/NomWTfCWzSJ5voDAdCgaNKWcgjto13Q?=
 =?us-ascii?Q?JSjjf00nC0j2l4hSuElky5fulvH6+ijzhZnVxXC7tjt3aDiXVqusDQMgUnba?=
 =?us-ascii?Q?7pBdPF0Y3QMXhLIVdZEwLleFGAGjbksuvR95tjRbMF3+ieu5dab6Sff4ff/E?=
 =?us-ascii?Q?IKd70V/FwrXgHvQluqv3ycOb/BxW4xWwxnyvXDTuaZ5CrtYp9Drr2tgBuP+2?=
 =?us-ascii?Q?7u2Ut4OlbHyvDDhF1uVHyzGZt8ET9ZTxyBQXPG+LG+nnn+wE10TEO3/FnbmV?=
 =?us-ascii?Q?23I4pzfd7SLXHduyVSjrnxZociM9d7U7etYTNg05LllYbnDy52fgDjz/pnW4?=
 =?us-ascii?Q?RqV4BjINzJEI5rPRS1gLhPqggLvyntd+7y9B83pZqh5AZf4UNJljKMMU1eX0?=
 =?us-ascii?Q?nsRUzhjB22k2ta9z+/xmcvmjK9uzsx1g+1HAIIT+YiT4eTf1UmojTajaOywU?=
 =?us-ascii?Q?oqrF6hWJeZqwp2+eb8N3eylkOVWnN6RpL3No9meCx244KBcOc/rH7C3zCLmD?=
 =?us-ascii?Q?cAtWjKT57SYRR8M7nk1N4I+7drWrmfsslcEwuYkR1ZfdoQevWRYKhDvAhJkY?=
 =?us-ascii?Q?YuN7Qs/hJ37uW1jwDNSkk1hCe1wUi6TBBkpVTTlZBlbYNcbBtHn41mThDadR?=
 =?us-ascii?Q?oGivtd76F1OagCO8t5nGnw5Rb7Ws1JfvWF+v2aoH6smbiGg+ZqriPgHyvbti?=
 =?us-ascii?Q?yu3eUz37CnCdfeOSurQ5Y0wW8Pybi+bZB7vK0OkK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d961ed2-f6a3-411b-9a33-08dc5f443090
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2024 01:09:25.6615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vO2XYafOaLENyEKLz7VmIMwUh+PVbN+LhY4HsTuUaitNXMundGjuYriEzkbcvAyC9ks8UQ3ZZ4ySSexC2vPpdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7991
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 01:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198493

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.rc2.=
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
ETA for completion next Tuesday, 23 April.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, April 17, 2024 4:37 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6813
>=20
>     Build hash information:
>=20
>     bitbake: c86466d51e8ff14e57a734c1eec5bb651fdc73ef
> meta-agl: 8c5e4a89bd4d9436e9ba929bd0faaf32744f6a64
> meta-arm: 04187be11dc4bfc898d411c1a40c2a1e9f4ff925
> meta-aws: 216c095de9d546c141a90017a91a3ccb226de754
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-intel: 0e43ce8605006b941cdfdab1f2112c5afc8e4663
> meta-mingw: d1df6908922a5357c408be77ff18f812e9e999af
> meta-openembedded: a7c8ce7f674008db4d7013557ec375a35226f43f
> meta-virtualization: b7e77b69d309d8ee985720e88b19b6e9cf03fe63
> oecore: 09ccab7d0b4d815b812e49a5861a13a4ec0189b9
> poky: 5b727a8fa1acfa9eeb441ac835ca7d24099284a9
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
> View/Reply Online (#406): https://lists.yoctoproject.org/g/qa-build-
> notification/message/406
> Mute This Topic: https://lists.yoctoproject.org/mt/105573316/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


