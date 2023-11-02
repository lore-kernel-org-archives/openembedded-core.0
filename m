Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455D3C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 07:53:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.25955.1698911612149022405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 00:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=LEErsDeK;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698911612; x=1730447612;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RgbirrdUhqaH7bhNkq9XGz5LFj8797u8mtKqKyeThKc=;
  b=LEErsDeKe522JwR7z43COeQ6+slOCVLe8+lj5jmkQM9nxhJ9YCRrDhFc
   atsSce43vvGO34nXd9p88XYlLWnEKZ0CjhY+iBstAGVUwxpZex/+YhLVT
   QCn6vM/2ImX6Y5dpePxr1e5J/jU5Sr+ZGvTsTSpeNCdh8oHchHN3cXFer
   +eJujLPa+ip3hUoBW1T2sM5g3jTNTiZY+Ry3rmNGcrRdQCtAEyfsBiT1y
   BiLswuv2gxKPnLVqqIOKLbGNGB1+1FK7eCW9nyUQdz9r7LkRBlgw9vrd1
   NTWrt2BnXcS7AubEIsXW8+Po7Ia3GeXswDBOdvMRUsyyfcu/vYJm4aDE+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="368863824"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="368863824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 00:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="2458787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2023 00:53:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 00:53:30 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 00:53:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 00:53:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 00:53:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAfLfLfb//+qNeM4w2o3AMd9/eEvQYv4hnqetVvmyTPN8JuZllGRvi5CwAfN3GukMlJCj2m0OmmuH2ov5Q0IdLvImDEOBqgLup2zyqeo6SZFGBn5tZUtVvCcxr+66GkdKreGtfP4xpzi7hGrVwTwavwHJbxkG41RpNFXhPA7TATbBpYJI5p33CJE8jibzN2NGV1mlnk9XrkP2j/oVmMNnKJWqneSgUvCwjUsHreALZq9Ktvoy1NfUq6QOO1VifHm4zvQczeXy5aT6HV3ga9f81BCEDDKYAAkfE9jXSq9eW4Hi70eiu7FMf+XGfCZPHEUqIQdVowFBTDBnGqaO+ND8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzCJf9TdJLb6f9LfiZ3/OpuapbvneB9Y8eiIy1xKJpk=;
 b=luSZAFa+ANRM7pp7VNVTcGJtfxoY47t5mRknS9kB5LBLz8JNXO4Xz+iv/jw8ZSGL27y07bqnaQNukwrzaXmsJkUse2z25cWI3aScHIMNJEv3xAdBBxhIvaqGOhArnbITxYjSgruAGewUZ0FhYvnxN63eaIrUf+tEwi8i7G1S8G///XBODDQG0zVdvGh297enXJzj8+pgButVwXPxdevW774o4kcIkJUVPsce3fl53o5Kq6PZ4GNQOmid9JOb6PS/LtZUAlztWWiDq1Q8UgEXuGR69k65cPrGtjP4++Cdg4+wyNauRH2JW87/EoHeyxhhlpFTUqJtftIVLIHH1CBWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Thu, 2 Nov
 2023 07:53:23 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.6933.024; Thu, 2 Nov 2023
 07:53:23 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.29.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.29.rc1)
Thread-Index: AQHaCSHEX1uaUMFZi0GPLlSuvK/R5bBmsGzQ
Date: Thu, 2 Nov 2023 07:53:23 +0000
Message-ID: <BY5PR11MB4152B2DEF182BC43C5E1A84AA1A6A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018b732bfffb-12002d52-9058-4b77-ab53-1fa728765bda-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b732bfffb-12002d52-9058-4b77-ab53-1fa728765bda-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS7PR11MB7857:EE_
x-ms-office365-filtering-correlation-id: 17574977-af78-491c-fa09-08dbdb78c9ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iYGS/VT+uBK8l/fuA6W7IgpAfm8xFaROt9CsU2SH+feW6BjbqQLWlL1dS6FvzXvj6r6zdcVuOfpmKiWPQZQr+DX6cMUR+rBsJTlF0TWJ3SI4dN5Yg/ZuJDlbN3msm5RBlebEVbH7oPYvoTseD1PHAwRNz9N3HneUb7mAUDG7TC0q2d3FjC7ElQjYwJH/fMSF9gj2ABwYfoDqu0hjgnj8jEePiURjW0o9HbUJYkK08us7F+HLXvBU8/KzRmSkCxG2TSoAXJOrDLVinccjHAiLYxUFljM5pg/Jhd6fOyjI/69LsYHINo/TztvN7qYRqxGsflKfProA004xhDQP8DqunrCx7cJy4V0URvDnk7tf+g3kHQyvNf5JM0qaTxVtLgkT/oBs0fLWGrpxftb5t4WHxwvFqrHkuJT3QVWribNh7n9kvqGJnlKMyd5/9nHTO/fM5/Lsaqj5NFXAC+93BiHP0SIDbNiWZ1kZJ6qUujFj0/XBFX3PHgcFi45RKEzR0J0XBVLVyPp+gkhOMcfKAcyJzVfVmYEdLCCaSVKfCvcgRii+jdOEU8XJPGaAa1AJ6HzO5iUIRjPe07pmhIOdd7UlrQGF10XD89+mbw+B+RHxS2ME2It4Ttp8dhJWj6oStKE9xuFKyeoNVcDThGW8bTJwXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(110136005)(86362001)(2906002)(33656002)(41300700001)(66899024)(8676002)(8936002)(15650500001)(5660300002)(38070700009)(52536014)(478600001)(966005)(55016003)(9686003)(38100700002)(122000001)(6506007)(7696005)(71200400001)(53546011)(66446008)(66556008)(66476007)(64756008)(316002)(66946007)(26005)(76116006)(82960400001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H39oYkcXAXEMSOWEzQAThasS28m/LGS9JuQwt9UnuLZT5AipmtIix3tnB/e3?=
 =?us-ascii?Q?pBxfhH4vFVO77Rvml8/5YXz0L9NoK7y2y45Ru/wwgVZC0/lzPJvy/lOBhL3X?=
 =?us-ascii?Q?wBkOAG6dl4Y9YJTqr2DQsBoNlQ3KpE1mdf9MnBRUHBF/HYg57Ue0SecirYKF?=
 =?us-ascii?Q?lDxynZCfWQLdKaFSTUizfxVwjdGjCLNlFNt/Jr0dC4GDRu5XhAah4F1bTJPi?=
 =?us-ascii?Q?VuMQGwWGX5a2qOSVDiWmgSZ8oM1qe16Qse/wiHNZHvGiH6U0ZiU8DMNbWyje?=
 =?us-ascii?Q?iBc79PpiBwDIguJqnlpc/WhxFqLYVi/Kfnr4ygNZAJtsPm4psFggKg4yu3Xl?=
 =?us-ascii?Q?zWkvXyFFpjP2Lzg8h645F1KewMDci5vf62uUqwnMi+Pt3LaFG50YGBY0GpN9?=
 =?us-ascii?Q?Ezl3wR9ZVpA+/z+IqZxuZLRUhXKftN5LCJzol4UFhMb3g9fxTpEQwwWVJot9?=
 =?us-ascii?Q?nYxmH6A2vBH603ljpiRPTHUCcXZKyKVhCLuhYkOTqq+Nbnx7K394nYBvXLL5?=
 =?us-ascii?Q?DFcAWCNywnuwa6biPAduWb6q/XzBVM9zwVLU7X3pCuFIF1FbKAtygk2kNGeE?=
 =?us-ascii?Q?dEZ5wrP20cOPPiuphWVaGi97LoIB96yolmCamFZlMdYMLEYYg37LONhcmKWJ?=
 =?us-ascii?Q?QEoawPgvohQTn3647euZ06EqEGPLvMb+1TDvUVts7p5qGxyEJmH5DPpQ72H8?=
 =?us-ascii?Q?RAFdAMg/pCR5URJJELFVxrVkQZLaDBfoDSMI9A47qeF0sFoKxuEv+FHUfBJL?=
 =?us-ascii?Q?uKkWO+2kA9Z+wbPxx3u1yLAoIC0XYQi7TtJAmAgLpNEeTBU5qewEcmfy2qeU?=
 =?us-ascii?Q?zkAKgabv9Ifvw+YbGWXPEgN6yzqJI4RtKq4zAb3A2rxyfXIFE4kmWAxmUfdM?=
 =?us-ascii?Q?8ScBqEoKeN+QWe2MRhqe7+VzqPxEGbBKXEnxNVTjlMp2biai2Na73ewwpvdg?=
 =?us-ascii?Q?Z3TKxcr0RhqdD8WLItriQrUzG1LRMThXMo7e/joSIQtQ04ySMqrTZ+gbLHZV?=
 =?us-ascii?Q?7rr64ii5EILT78KCsv1U2sx2qDsJG9xZLJ8z0xZEETWa5FXQ7eZ8GIYMqGAo?=
 =?us-ascii?Q?etrUMr4YajQzGwvNrgcdoDn6DRXHZF2bbsrUREBspnOOD3ZOJCBSsWod8UaB?=
 =?us-ascii?Q?3k1Ucs9DbVk/boZ5jScizejKRfLBX7Za+5j5+JCRWg+EFOsg6mbgaImGKTWZ?=
 =?us-ascii?Q?ZTvGY2dwrtNxW58loKbzIZbwho5ujAl4POunq9TvDy1HNOtgpDt0kdxH6Jgi?=
 =?us-ascii?Q?Q9orwz8/o1TttsyD4anHMCjiSQJoSr9H8ns+F7vEZuht/HfYo0qvRIXdbMAw?=
 =?us-ascii?Q?Lke5Vrgarl8UOgMGVuJ7qsUR22FEchBcrJ/69k7PKj66jZPXltTSv29wdESr?=
 =?us-ascii?Q?ai+b0Z40pQNf1VvorpVX7b1kvCSl+Ca7XgipbUmGNvoxuizGbAwS1ZFgN8l7?=
 =?us-ascii?Q?c5ZVoS5jzz7ZGxS+WIw5iOxAhArFD5TvVuQMrKGWd8uYhRQllDQ+ktgzQFoV?=
 =?us-ascii?Q?RJu+zdWDXDUt4WlwWWipuFPcGDRkiMXFu0O7BfWmf+/Erx2hkoUdMZtVN9tu?=
 =?us-ascii?Q?wjw8RP2j2hhgXmICEUxPSU0aJet77QsW0m256vgG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17574977-af78-491c-fa09-08dbdb78c9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 07:53:23.1046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPVAanUklSyoVD7jwIClToyk5HmSw4IyAkrESINxoGoLEzEO1RE24e8ZDrB9Ad9SeGDbVeZUHMBisG0c3hK5MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 07:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190059

Hi All,
=20
QA for yocto-3.1.29.rc1 is completed. This is the full report for this rele=
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
> Sent: Saturday, October 28, 2023 6:06 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.29.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.29.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.29.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6111
>=20
> Build hash information:
>=20
> bitbake: dd826595414c5dc1a649f45a9dd2430bf6d4699b
> meta-agl: 280f7e70af30eefd885f6e60bd29863b46bb2eab
> meta-arm: b1fe8443a7a72c65fa0fc3371f607c6671b3a882
> meta-aws: 6e3ace380b609dadf58c81c734ef2061e9636914
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: 300be975359fdb3a3b2bf7c6fe15dea7acac575d
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 0dbf3a15321b8033ff8ed86c6aa261fdb9c3d5bb
> poky: aeac1034661725b5c83e79f76238429fb236b090
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
> View/Reply Online (#332): https://lists.yoctoproject.org/g/qa-build-
> notification/message/332
> Mute This Topic: https://lists.yoctoproject.org/mt/102231153/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


