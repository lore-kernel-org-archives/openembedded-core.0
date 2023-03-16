Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42BDC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 07:27:35 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.6797.1678951653720771499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 00:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=lTiV3KB0;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678951653; x=1710487653;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SMWJqt2kPKtknsepMsBb8gQBOPWTpg/LCFgp2gPsZxs=;
  b=lTiV3KB0fj/v1Ku7fqH8jR1nNGT7ADcY0NTaX89gFCzLz3AbtHa2gGbI
   tH6jLxDyhr0P/yZs5qc9ItF63icCb2ao9ygdyfCep3V1KY6m9fMoYTNNT
   EH5WBPKy/gso98nOgQwnHb/OAMy48bfMnlRAJhyPCkNNGRhiQY5TBuyHK
   JoNM/s2/ULGOKreUMUZ41sSgkk9XJjKPMHbYpsLE4gBtpFykshj5X94dX
   kTr0o6wHpmv45QHI/EycBU1Cmw1kZ2/GPITLIK7UmItCN+sm+dEWMuCBq
   9O5CDBx5ll89hq1AS6mA35i2beCDmUmmVxSAJGkaCSzVwQPkxHjqtuA1F
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339442298"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339442298"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 00:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="744013478"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="744013478"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 16 Mar 2023 00:14:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 00:14:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 00:14:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 16 Mar 2023 00:14:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9l0VLVQe3F8L7QVUQmtRwInUhMDJJOS42BCriTAsjEnZPmRcdJlstqGb5SDDbmBsEC0iJnJVbhfkf9LTFjYytSbMs9ZRB0SQdJ+GoSamfFsyrGSYX2iDHBXtChZeZGVz7lpsTv+9hf/us+nh2AgrNypG9O4qZDwI6+ZmvdTzP50pvV5gzsEecAQNQJX28yQQh4oFn4PW/cwMxxkIwnSdOSggywHkGREF8nadGqhIoeB5OqZ2Ud2O2Zw1PRM6ZcT3B+ZEgiY9WzTV2bPQ1LVEX9TABkQTOoAo1s2qUFXsm2zUiwaWUJUfgw+YqRzeDdTTHiRUsiVUbhQ3tDjtqk3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BfBgVysZl7ZTXDlHGU7Lta6GSrHDvGqtRGPeLJDLYM=;
 b=QZ4MbQx3QYcpNCkhpfdYboV7C+glQQjVNv3PeXnTQ641AroNKobAY4caQOt/BRCl/3vRdr7QhD7g7jqGdEbX6Uxi8+MDAZvBX679nyFuLqqKn0DbcP1INGmvu09Zm9bDTz3iP3GDEAfyWTRJ6yZx9eLf2WiZCDg08WFdZzXFEE4gtfsxCGfHnzz99pysqEcSbWD5yTjAyyoSEBJVp9N/HX8WB5/HpKrnonSyp6f86NPZpLHBXPGxsLW1QNSf713iu4vYuKgnwNIMR9gQdJ4wrGxlxby58v92EpjfWkM6/n+LLNf0/QG0bDWub3nzQrFanV118GpO2DpxpXPpPjqpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH8PR11MB6853.namprd11.prod.outlook.com (2603:10b6:510:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 07:14:48 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:14:48 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.24.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.24.rc1)
Thread-Index: AQHZV8l0yrMFzSW6mU6/tNSaYsz1P678/RDw
Date: Thu, 16 Mar 2023 07:14:48 +0000
Message-ID: <BY5PR11MB4152E9936F9B5E66179C0FEFA1BC9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010186e8eb6702-b82e038b-e892-43b2-92b5-f45b8eb9944b-000000@us-west-2.amazonses.com>
In-Reply-To: <01010186e8eb6702-b82e038b-e892-43b2-92b5-f45b8eb9944b-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH8PR11MB6853:EE_
x-ms-office365-filtering-correlation-id: 92e6cd74-5fa2-4c6a-b846-08db25ee209a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e0UfgWAmYvQzxqq5iRdH2VwFdfnZWOG9/VPxeWy39xHqtCGhkxp03B6cVfuyKlphhEugKULMrASZ7GpcAHTcwCK6g8H/HHXbnKywwzwPbSXS+9/WEJWYuMWhOfZFgGLMPcip14a3MBoYojf41RVWncmK0TVZicGBGCcy+ot8pjQQA685Qcv6UQs0N4GPC0KEdunV/Z1cTahWg6zQIztyEwMnRxO1LTX/idavs/OXZEtrO6zoDebmFtylg0IyKZcjmkcxJiKXsrOEjLJ9YjuYPMTUNmKJLhgGg/mdhGNn7wVqcsky/Bj8h2FLtZAM0XpP1TuXK0DBurMdM1QaDrnkmv75GNOw6FRRDMca6ypHwb9B3eykQQctEUhNXqkl0J1SCWyk5YImjsmitW46DtRHYaY02xJkq6Jy+v2UzkM8paCWa39fyRV23xpvz2wtsJ6UV3bDg0kQwuH7dMMHdelfAYjc9uG3WvGU7s6/4SKM5DkXVu4/6pDrqGTZKlSPkxNI/3h2RG3rXSxp/bS2aZTf+8qFueIy7ZMeonUNb9tHggIdQOLKVRkEQbKmhRjk8I/HpP4bhJ3P0KLoOjqiJUHGctxZN2BA8uJrWx391gLqE6RsQ2gWm48nWT1PYs9cQKsL0JRFo7ALDE0UuMo27zs1XnAzB1XNNstLb3wWYNVlN9Re9n9X1wHCqR1cJ8fu3tgD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199018)(5660300002)(52536014)(53546011)(8936002)(33656002)(6506007)(26005)(186003)(41300700001)(86362001)(2906002)(83380400001)(15650500001)(9686003)(64756008)(82960400001)(66476007)(478600001)(66946007)(71200400001)(110136005)(66446008)(55016003)(316002)(76116006)(7696005)(38070700005)(966005)(8676002)(122000001)(38100700002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cLWRcIyn/yUsZrQvXrHu77Tct0YQ3fiYsjdT0bCQl6fFmUFvB1snG8sbs9Pa?=
 =?us-ascii?Q?uUzdzGaHVRNXS20BWGAxss7fdDZL5x3lnEyNhEPrgUmXepX+8CmaRe3Gatww?=
 =?us-ascii?Q?YoZrm4qN+pxMw4USKepfbiZY+J9JbbjQynLEQ9DoPY29/aa5zElI76NjrWsc?=
 =?us-ascii?Q?6BGbTc/KQVD18RJ8Dv/X6GAOLK5/FWt8bDj890t22e+IuyipH5qSteddnmWc?=
 =?us-ascii?Q?ZG7Xt5m2QrPBj9akWAC495P67YuxqWDVHrMZZciHTn08ipS1AHmJ/GotbPgr?=
 =?us-ascii?Q?krwJoQk7R2mf4WdheWEggp31xRgePXjedPUAb4bSjSmKntmG+UcyHxRbGZk6?=
 =?us-ascii?Q?6MkABCMAn0No71NzERiVp3CEEasK1nbJrYU9RYl8HXYzOMkhPOn7YxXxFlhW?=
 =?us-ascii?Q?S3PUu+oPCg3aLdfOEpEktp8Sa0cHxLy1ynpE2/beHkxtZ0XYDmbTqunBfXjY?=
 =?us-ascii?Q?KzBj9vqcWTAhR5QkwuE9V6HWKL7Wm2DnQKnwRmIpNnbsrAD22y7jcxpHG0Fm?=
 =?us-ascii?Q?qnQessusDLyOD4MIQuCKkEFqhRSdtfraQU27I1a2pUp8NE+1kDp88hUMD8D7?=
 =?us-ascii?Q?kW+YjDWpGM8G9eZzZItzBNJzyuqawWBmeLx/KKp4BkXBbc1hT3NDE0vaKamE?=
 =?us-ascii?Q?k1RLVjK49EOJXBksea+sV7rD0+VMG6/dxLsaInDXWS6yK2wZFjNoeFyoc76l?=
 =?us-ascii?Q?4xUJkn8sDzrVUtg+YLzWNNwQev2Xp56vWBh60O2BlQ6NyDkFq+/PJhnnX3+C?=
 =?us-ascii?Q?9zkJgUKcF+bWuKM9gDE2XDMfG7Xeydf69iSAphNyspaVUMCiFVFgkWMfI1G9?=
 =?us-ascii?Q?pV/p2qYUS5dY3HJzRzF+phvLHRMpvGssx6HBLrP0lg4SgoYkLABPIJCxn056?=
 =?us-ascii?Q?IZi6+WnO3AOaOO+d2aKwHK7lnT1XGhngjrKXD+kQYSb4fmdpcDNcpfs8Knq3?=
 =?us-ascii?Q?EFBfCn6aumxNN9LYkqxq87aFLmmVcepfnHse+Q+ylhiFXY3TvlRv3skUAsW7?=
 =?us-ascii?Q?tFKaAznZUejTb7R2fTs/2W7ANuXPiK1iejAGHkLC+t2zN3RGnKPG3G2DirrD?=
 =?us-ascii?Q?kdDr1jt8wTBoaDQxPa7y7Q9PF07rirJsmIhbvZJZ+JQaipaHdpleviGUjOvS?=
 =?us-ascii?Q?WEDEYK6okZ8VJeiEZEOgYMADsHEJ1mv8e8hgO3nvOk5YNoMsowHxq1BuefXX?=
 =?us-ascii?Q?DoSBMHKMFbYdOeFxmklf49pwdOBpSkFoubxnbCWXX7cq6geoxVTv/plM/L4O?=
 =?us-ascii?Q?e/ubDU1iquWt7nC7rJoxAsvehtlO1qY1eLvUpv1BEiveg7z29ew0lPSnmKEe?=
 =?us-ascii?Q?3ENW/uKdScF36NfSsbLk+Mkj3fcxRgjOMp7hQAxBCbd/Fgx6yvYoeFQ/fai0?=
 =?us-ascii?Q?1BlK/Lk8i674Gsyn+ix84VBHMGhHh9MCrUbRFalyS9jhBxQOhTrRNsHNn+i9?=
 =?us-ascii?Q?6oYalnrvh/BXv1qDRRi4PGtC7YZhVayZgvEVAYX9gZht+SqYc0BH+IzAGfaL?=
 =?us-ascii?Q?YxBLtAvXSh3Dqtfpyxzr74rUs3EEHuDlqaky4AvhkEHLS7F6uuCytyGM0p+y?=
 =?us-ascii?Q?5TdgF7mLyzMNM8mGw4jfjMluLFKZKrQDeLgS052u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e6cd74-5fa2-4c6a-b846-08db25ee209a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 07:14:48.2043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W4F+FyufLchGsvmH0ws4U7cgqOMzDAporqZvLYn/8pA+dBGu5nH5KF0TkGtlfEpv7ptDv7oX4fM8ico1srAznw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6853
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 07:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178673

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.24.r=
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
ETA for completion next Tuesday, March 21.
=20
Best regards,
Jing Hui




> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Thursday, 16 March, 2023 1:36 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.1.24.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.24.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.24.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: a4cd5b0b4b355b7b75fb48c61289700e3e908b2a
> meta-agl: 532936bdd0b2639f8a8f9cb495ac2a8ea382737e
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 70b6bbe05d7a085eb2b902c3b9c456ce762f1db6
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 472ea60857a56c6b08c64af3f6ed8b23d7cb0d21
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 87571345059f82fb7599e3aa82e6fdcfbd361098
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: efb1a73a13907bed3acac8e06053aef3e2ef57f5
> poky: 11f05ffddd0a7adf05b1c016f73b10ddfa2daa10
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

