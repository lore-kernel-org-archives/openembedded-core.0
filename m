Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EE5C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 05:30:40 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.17003.1675229434272812268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 21:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=ED0xbTqP;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675229434; x=1706765434;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JTopjN1SUbFeHgjRX0dXI9eJ7HfbxMlXklRfxCUd/Sg=;
  b=ED0xbTqPC+EFTZ9ynEwuz3jhK43R2sUiNbJsm6LMlHR2fFYIx+X2Esdr
   nDqUQb/q1Gpki20vFzbqFDdUUlTkE7emgS3+5Feg9jae28UV2XYa4UrcW
   UADGNfXaWNCDJyHE1EyGHifcHzEPLJGmBpv4m76+ltCwhsQoy5aNjSlBP
   NzjTz+4rdsKRxxajrg8kxhGA1fmm1fc9e1IclbP/6X97mfwBRslwGhIci
   k8pTu783H2/XpfQVwkj58IN4rbu2h23sZd4gRbJCU6qZnXbW1BEV4Q7g8
   hm4Qaqz0Qv8ghIwVG3DECtcGFZnzUfDjuEupMS2nfuELsln77x8NuPyqw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="390417940"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="390417940"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 21:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="695217144"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="695217144"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 31 Jan 2023 21:30:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:30:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 21:30:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 21:30:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 21:30:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UASwFgevzFm7lq9PNNHGtyFITo32CJ8Lv/R10SslyQEBFfz7C+oX3K2wvOhGeX1zJGiyKi9LzAReC1+adMkcNd8UICbmH6EdXJ8+4ZZZKQStG96pX+hB3tUovZ55dQux81l038U60OjJpKArTGheI8rMxBqOypUaSxcv1kCNQTm8Sa3jN+Uh5+djPeSCvKbrKmz2WbJGZkArSxhE5gpg0COfwFkUHSZEF7PeQdyOl0xSFzs4CmSd4kWvnuTPofGBLtx7CzzavOG3XfmPY9U/D7Utd2kKzGyDkDxUjK7KgsmFZ1aoCaeH6WSFfeGh/oh9tkcxV0FMiuXpanNzCmJsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtAeIngvxyyIem12Jq12L2Nyzpq37kY2IZ3OIFHEoWM=;
 b=TRFf4JByRG0DWyh96rEaV10FmLRD36UNgUPUFRBn+ik2hL+SJc0ZosoyR4mUvDP33YoYaombMmi3Kk2k1R80u4HdWka/5xjXXyjGUF2iQhSMgFOdEIKpqcVVZ2XjoU4wRyVTHbadfDmH55/ySSKVlePVtZxtPKVRm8ZVKwZkhQjSCONsDqtYmzwVMc0X1FF1tLYK6TbYXdDknNl9u+Ijcif4hfM861WEs3cmWTuC6hmO1BvxyFaTe0SdzZyppCSo/1t4m54b4hic82I6WnLS8JvIgukt1kEzfui+OYMMSZYnWo+aD7v8NsllmzJ1j1J/20ihJhIg/pseOrTW8ooTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CH0PR11MB5377.namprd11.prod.outlook.com (2603:10b6:610:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Wed, 1 Feb
 2023 05:30:29 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%5]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 05:30:28 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2_M2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2_M2.rc2)
Thread-Index: AQHZMg4OSdKFhjV8A0WSPKyx5g08za65l9EA
Date: Wed, 1 Feb 2023 05:30:28 +0000
Message-ID: <BY5PR11MB4152CD6D06B6AB381EA6E096A1D19@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010185f1a4b508-6e5da1df-b525-4798-ad94-58ea11a96b76-000000@us-west-2.amazonses.com>
In-Reply-To: <01010185f1a4b508-6e5da1df-b525-4798-ad94-58ea11a96b76-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CH0PR11MB5377:EE_
x-ms-office365-filtering-correlation-id: baeaf0c5-d0af-4b90-92dc-08db04156da8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NJJ6uLSOAFkuUgUFfLuhvUqNjkCraoSPSUCUG1cE3lYxAGrmCnfZqAUrZ4N4ySdvevLBkf4XlrgykG9a3K7dtdsqPIj0kys3qfuzCMEN9N55vtOrTispfA6G1Okv6KsY8I1K7MUn9LdUgOgiP8AmjgyZAvoUS7gQxPXNzKwj2K1QlW/BZqVRsVjE1wGASILr+jgNMOrzZxqQ8jPm8LestMpGuZU2DGy1N+aNtySpC3bFmH4MPe0T8ifvjNZBhriQTjfD5eYgM2MQOdSevshmk8VjGTkSsblQPJKYwFuZR7LHxFrcbtFaZHtFglcR0mAxqSh57QPdNBasQQgncSgQ01txTjabx+yGqbnDVQ5BfWqGWqYx2+RmONCrZoEIXVBvFPtUfsuJZaos1VTr/b4DlS95CJWdcHTU5f1oNAX6QwP4viMSGZh5Ww3QuLaMRIuQpK2Rgy64+SMy/tLqEMcPjZ9Zvrx3He4A9MVNc6Waj992jggYhhMz24qdz/0vywR2jCr6gJ8+656Ua8RvbeTiffVxz8oSjXJJB99KeHe7qH/aNcAL5BIOzzfGPypY0MFXjyHTnqPLqHrYwb3+epdwY66yHQSus66qJO7jHgJRYuQQxJIWpvIku5SzV8Zppp8h1Izf9kIuaM+D5/+FLi+mZhzB5smfD5torGWFcNsl0Pa3w0zle20xxxHWHabLuXPXqEY7mMJDjo3yiOmoWVnzC6VnmifrLuPBWdCZB2JJQLPjWszzBPiATdN8uPxKxUjiRGonXvnwFuW1stMy5hMDSlNOR/gfJ/h0FdmIOOLquh0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199018)(5660300002)(53546011)(6506007)(186003)(9686003)(26005)(82960400001)(38070700005)(38100700002)(122000001)(15650500001)(966005)(316002)(52536014)(110136005)(33656002)(478600001)(66899018)(66476007)(66446008)(64756008)(66556008)(55016003)(7696005)(71200400001)(83380400001)(2906002)(76116006)(86362001)(8676002)(66946007)(8936002)(41300700001)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2meuyzsiJLTux96s/ijGQKwnFfV+5aiX8Sa49awjHoc9CdeDJjFonxV8ETS1?=
 =?us-ascii?Q?oRLxC40CTjXlkRdjqZIEhpQ5XYENckakRXt7ViP7Zkv2/fJdOIvvi7F9RUVM?=
 =?us-ascii?Q?S+KlbK03bq24EngdKOHx7tIdg63NelWcsI8hKWNeNeOf7tjMVOvYcSKHdVye?=
 =?us-ascii?Q?/L9DSKgjq78pAnHx8wKv5TXSjOXc8h3Ukc8DkAJMNHcBTCK2s4DPPFdjhuv9?=
 =?us-ascii?Q?i5/rLTXDTPgV+5j99r/heg0ZDjw6Nl1wkOG82u0pmB2kUkjQNcmIF7q/R4aS?=
 =?us-ascii?Q?McvObtQnN8qtH5WtFc4Vj/1vP2ph5Bg9HvRDB5klyPpIWhYTT36zp1Ek8xei?=
 =?us-ascii?Q?qMcoOEXtU33AlCKzpqiOu2bxDPigKn2bJ1kc4SDNHPVh68sq4JUSb+4rJXKG?=
 =?us-ascii?Q?sQWqJXBRIVHGJdGpr3HnXSQKNcp2e3/Be+mv4MlGPqNqqY9ucJePvnF00Gsl?=
 =?us-ascii?Q?f3ZJnZQeGYYvwo/MSbvN04QA7mtbTR4ExdCsTTHnNe/BZAVjISJMKLqjRQc/?=
 =?us-ascii?Q?yOyctv0sF+gXoRP7lRnCaZe5B7YSq6QnO7tLHR16UOZP23y4vYZrZYQ+mVpr?=
 =?us-ascii?Q?PSbOo1VTnRnwr02znIPeSGTEzkGfcKdgx7v9MHWz1hj7xUO1Bry/gFVJW/Bk?=
 =?us-ascii?Q?mTIwmF8tHJyQgj1s6iBEGvpvGff4HEehTxDoFE+h7FrNUV1Alhg6/mVtLzKC?=
 =?us-ascii?Q?DATLJJeLr7sTmu9Vjs8H71ZP6hZOzGNUOZ7oJSUGR6FHzYuxLwXH0h6+rPwo?=
 =?us-ascii?Q?swYg18SOL3ifwsyNhVrh94Y0+8NTcqrvOdA2GAoBN+ZmOlaxPwE36Kves1N4?=
 =?us-ascii?Q?InzVoTN99JJT1Zs+mBwId0m/LwVH30ck7572iPCI01KPft/HtTlDjfkm0Ofb?=
 =?us-ascii?Q?PhX+6ZZYhK2IdV87ptm28djmob9PE1acTaaDgxpqZfoYQY612EP25NiY5fMo?=
 =?us-ascii?Q?jei7koXAU5dWjkSmO7M89D7zIy7bEZPXLPq7QyllVfuez8miY2lGiL/Vq6BW?=
 =?us-ascii?Q?uiqSTFdkTMhE4Hi5jCVWE6KOpjFoGhqXkALhQeHJ8IPbcVWZQa4H90d1egqF?=
 =?us-ascii?Q?yR1aE/yFIKuBInKdZY8yo99QHcn4JJ+WT+JM2Lef28wL/In1gQodShEYXzxh?=
 =?us-ascii?Q?8yd+vIVP7VAZOAI2kGxgBuPRg+G9yIGGSYTdyJsaueTDaYIjYREMkluJMgJl?=
 =?us-ascii?Q?gj7BWPwfGUXKylAyqDfSujRT3W/ksKb4lp/no7O3k7SxS3etovAryaNTjDwi?=
 =?us-ascii?Q?kEmJGM4PsignliaCRYaS7kanc6NIDeqa+uKfmt0vTrdPcfAjDEe2BiF+l04R?=
 =?us-ascii?Q?8qyaKU7kkgLNdUBb2OvTL28n9ite+vYwEDMZMSvBji8iqZdyZaTdMShRK/1k?=
 =?us-ascii?Q?nwJvDpq76mtuHqINcSKUMqtcfSW0+Xw27xb3warDuueILuLUsI/Sn9wd7/Oq?=
 =?us-ascii?Q?7pxPeefABSRVmbbSwNRkMpnv+lmaZXCHWjhPG70SstNxinIVCkjYAoFKPGP9?=
 =?us-ascii?Q?NB/NE3O32BasMLgWOHpjzMyJPaCDMc0nyaeetj70vhkj0uUts/p2BoKLTTYo?=
 =?us-ascii?Q?vHUZV4kV00ONMqLeX94EVvRKdIjS9K5YC0Zrxim+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baeaf0c5-d0af-4b90-92dc-08db04156da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 05:30:28.3177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFwdaEGL3NbrT39k/lxntmWnVWajeqr4w0reU/jRWqZL0+mGAqZUPd49GTV8uzXJUG1BSKgJFN/FH7fA+zXC2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5377
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 05:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176526

Hi All,
=20
QA for yocto-4.2_M2.rc2 is completed. This is the full report for this rele=
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
> Sent: Friday, 27 January, 2023 1:13 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2_M2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.2_M2.rc2) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2_M2.rc2
>=20
>=20
>     Build hash information:
>=20
>     bitbake: c19035e8e71c419c5688a86bfc9c946c96f638e8
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: d8383c11f3f8220d2b989ec73604e5faff988299
> meta-aws: 7b4f54b3e1f675e2033f6a589ac519e44e62b58b
> meta-intel: b3c7d3ee44e4ab71df44b5be3c48d2f47d89d8a0
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: ceceffcb1e3ef4f9ba7708f77c27e30a7aea61e5
> meta-virtualization: 31954471605ae3b41627a0ab7b0dcfe8c5851bd7
> oecore: 493f2d163718d78560a2b3ad5d3c0fb34caae8c0
> poky: 5e249ec855517765f4b99e8039cb888ffa09c211
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
> View/Reply Online (#214): https://lists.yoctoproject.org/g/qa-build-
> notification/message/214
> Mute This Topic: https://lists.yoctoproject.org/mt/96560410/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


