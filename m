Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4906EE0219
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 02:28:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.3412.1694658495885978488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 19:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bdV+OT4w;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694658495; x=1726194495;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Tqr9XrxOogc1+JU89ko8F/4as/HcRHbewBvRaFQcl70=;
  b=bdV+OT4w04+kVtEZzNq5cKxyb6dDz5cuPKtIqACDOaLy0C1ddTFpyjkw
   HjdbUPjnBT9Nagt5RAu7Jh3s4nQfMsIjv0VuYSwEGhob7D1fbFqsdhY5V
   uZbRbEeoTs73npxQbu2JFlznO6P/I0ATjKRR7RpFuKBki8grbSM/l6P+g
   jp7mBeN0aVyJm0rVaPzJi6TEwAm8T8L9Bdba27vLQmtd3rq5Jc1hCOWdu
   ramsJj2HIx7dXae+eGXagDBPYj3jR7ECwyfyMoxginpg7ldkeuAt4b0IV
   X3NWji0we29snUmc4CaYF5UKPi233+/ReiO6its0Hx6XRN7Rf2saV+/LJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="382639164"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="382639164"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 19:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721037756"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="721037756"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2023 19:28:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 19:28:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 19:28:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 19:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=of43NTukbsN+XuMX/7Jv4bnSsU6Y6KOgChmSt+QddxBmzF21/tAfcV1B7xxlWPW5vX9M5PpD4xrfTPjao7a2OosXbFQUMGSMKuP+VPLcK/wLjKB2lV5YUaCMRdcL3MJ7cXcBYj1+jrzLVxEuKGphf+DW6OWK3VC7rkl5Ra1Rwcver5OrJFCaDCvoVPGIgvxL9xO/K8RhxrnFHCKZhTOK5vMG+4DRXGssinO8IPpsfrj/dl8qYrRJYw0M4JMbJUIk0psRENdi1ME2DiXeqfIjGWGOH19EGwDxNZJrvZKq17wu3l+WMpbp8qyyjxtIjpereGtaesNUUNTKaRP6u4Y0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0r6jHefC0baD4yGDOQf/TJcO7fjQLP4ikGrwuJvU1M=;
 b=clQxXurAYWYaZjctfS5EdQvxKmnZQtDp9uUSE7g2FiZB0xwf/AmFChNN2ITQDZrDG8X1qarZ9hlp87jwQZjGlvJiZTq5pz0UsMJroF8xuBItUC/CxI0NGCj6RU3LvyBHLZoti7OVDQ7TrGvjkM6xQiV5WlSpRa1bYtkUeMLOAz64W8STRz8BmNEujBUO1m0x4jjRbjq5Md8Z7V5YoGTuq5f44prXkGSXRGyinkewPfZ2Go58msp80C91c1aY01RcDlktxYiOguC37VeJJpp31qPhySUQRjgutEZBwrcySdjrU2PGKNZTLEQ+4gslUpRICicd/lzz1g2jGBHOlLi2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS0PR11MB6400.namprd11.prod.outlook.com (2603:10b6:8:c7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Thu, 14 Sep 2023 02:28:12 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 02:28:12 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M3.rc1)
Thread-Index: AQHZ4+YV7lTrNHBJdkWF30is78L4QLAZnVvQ
Date: Thu, 14 Sep 2023 02:28:11 +0000
Message-ID: <BY5PR11MB4152759856818B8886142E5AA1F7A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018a7f28f453-79784df8-0deb-4534-b9f8-1b3c60fd1100-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018a7f28f453-79784df8-0deb-4534-b9f8-1b3c60fd1100-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS0PR11MB6400:EE_
x-ms-office365-filtering-correlation-id: c85ae434-cc00-4d16-107e-08dbb4ca3dd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h46OP1+CUcZ4iOZGazG1sMhvaH853NadeTSWRVMq3wnbwdhosLMEFnEWwJqcbqD5SNlFuCAGxJAoT4twewVqjNy/H3U8Tk7bp/SXEhOXCSQevfZ+NtwU+tgJvyTmptnIx7Bx6Br5bmfjsBxXQHXHHmYdIydkaiZMz7e3vUSAjR6NYasgQ5prI6iKSGhOW4y5lfcZN+A6fGC/gSsSn0jQXH/L7P+meOFxGMEELCmyY7tnGaa79G01xGBC4KJIXySwPtVJHQrTb+WqesI1V3K2n2G7uEVE1CbGzDyU7jhmFVM2fiOOhAF2lG09Zdh1DHxtIEKew/LZtZAmGTbenr1RaLT3FmY4SfRnqOWf7ZOOp1N6TePUe9B6gddK8r9WDB7GptLvstNWry6F6en4im5wkAAqmVjgr24TQDOve7H4ZazgFDR/MBzCrRKiNyzTu5sKTZbUAKBe3RD06ZcNZolbpbNx5L+fbG8dUXkCze1Xq1kt905XmPG3mii2b59LIXwHGYIh17L6reA7McwK2dw+OoXrivdkDzfO4WX07xxMNw2BJ7sD3p9WViqRKNZxYFFph+WS84/0nRSX9w9keqdKTFPz2tZxAag5QSgM09xKlfDa/y/5UYBUUr8YbJ+DmUKHAqUJEOLPsUZ7A1c3Me/E3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199024)(1800799009)(186009)(55016003)(9686003)(66899024)(26005)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(110136005)(316002)(41300700001)(122000001)(478600001)(38100700002)(966005)(38070700005)(53546011)(6506007)(7696005)(82960400001)(71200400001)(83380400001)(15650500001)(2906002)(33656002)(86362001)(8936002)(8676002)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9isYbrv4VBCKlY+1Tu4nkz4qzeXQkh6XSEkO6LBw4omEwyE3eKVtT5IGHk9v?=
 =?us-ascii?Q?PArykB0TNr+opQ0htWvPPh8oEpWyi5FXeD4VfFy5KuISJ8x4BW/qXm9kNQWF?=
 =?us-ascii?Q?3N/B81QWBxslOyRoVSJzcAcGheE34fjwC67cZiRFp1lM9/KsbwApRxe6F77/?=
 =?us-ascii?Q?FtGfUd629OaKYAuzpz7liyxrdtfNWu/RM2xMOJ9xXQ1BUV5X7JVhHe5hOl4i?=
 =?us-ascii?Q?khKGxW9ReuUhcuNT0FuFG3O3TyqnflWl95Jl1TaWeVruzNS08Dl1CJb+epoK?=
 =?us-ascii?Q?fxkdzpr09Q3wusjl3VTrg+V1HgtiJQtZ7/+k66rcLj70T61jGrGZs8QByHcx?=
 =?us-ascii?Q?S0aoeQnA3o1b21LrKUojGssNvNhLF9Sav700l8cTwsvQIvVotyOQhtkiez/s?=
 =?us-ascii?Q?snhk+10uLikabnmUm2zFEUPI5gieROROJkGwWFb41jNAfeT0vwlTgykHp7Iu?=
 =?us-ascii?Q?HTIiK3KARAy6hNyYYwnsoO/2CeZeMsBc37cqCVE91BjF5hlOM5Ba55iJC9ip?=
 =?us-ascii?Q?zGpLuyIZpBTOn6wkjiRYLnCFPSzJXkSVYtuPEGyI4qkkG9MpNPFiKFfLPQ5a?=
 =?us-ascii?Q?9cv3tMl18otXsW2Cqjg8J2mCe8Rfp465bA5mcs48j6rrgC5Z0tCSfmwTiKUr?=
 =?us-ascii?Q?GhKelUvBkFRzZ4Xem7H7nb79JnmbF595/u3+4hhfxOA1ugZsEivtj9NzKq8p?=
 =?us-ascii?Q?X3UJ70p9nll4DceVpxejExkPiewa04SFZCN1ty+J26X+dFHXsNfEqRv9oCxb?=
 =?us-ascii?Q?ZiLu7cZovnDAWL6+R9hb9Z+LnMoSbvAbnxBNYM4e5sjbH/8jZRPjxMQR5QCW?=
 =?us-ascii?Q?HgQPbLmX9aEyw6zFHYMqzBROvxrwh97niQPYVyBfWASV8Afja6w16QvCk5ZZ?=
 =?us-ascii?Q?vf97oxDsu9uJ/yDc8Kt8IpYB5n2Bu2lkdnjJ7iOuE12JfT8d3b4AFYcH0F5v?=
 =?us-ascii?Q?60FY2/8vhA7SoQnmQYWVz5mbHa0IwSYGlwR+8nDu2LvYGCmtVVkNJFKTw9I7?=
 =?us-ascii?Q?6eA5kEECrknzzfwy/qSAj+hM5BLBl6O0KBbRH9nSYQB5POjQhhcsMpxytZlb?=
 =?us-ascii?Q?zZJp5U7ugOskcFML87L0U7NgpYN/7mcYYxa/OgILrOvzyZaDR5jRZ1bIIV67?=
 =?us-ascii?Q?3lrnc+9uZr8Hqjmfj9aalx65B7XQbwJqw12Dlm1leINp+HT4H8ZNNjA9Q6UF?=
 =?us-ascii?Q?Jz6b7CcEjzzfYin3ozxHqD1TdTswsX/TXOiPttq4wB7+4FxcVXukK/M5hxgz?=
 =?us-ascii?Q?mSdUuvHpXay7PMKRgeU3Im6/eIzwbCof1kiVvrRxsBnPgWh0LckxXnKpN94F?=
 =?us-ascii?Q?WEfTTMgehqN+ZoXL/gv+n1qZLJXA/bB4kkIv66vSmfjQJO0iVM8SJRICAtwQ?=
 =?us-ascii?Q?esSfsJrJKmWKCO9S1YVgeP2IgmhiVYa/6qCeVlHBMzksxnfaDUYMhw377Nio?=
 =?us-ascii?Q?czMNPRw3bm1PheP5Sh3XlXxxxgyOJmpnpRc17lhgzu0nXyrB7/35FpZFrinr?=
 =?us-ascii?Q?YKmvvVrgKvjaFZu7y+yaoJbzBxt3MOHmFo9AvOmxDf8o3D654VCuKKFVfoVR?=
 =?us-ascii?Q?lz0eg2S2SPzT95xYqrvsWjUVywkSiWU9vipwTtQd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85ae434-cc00-4d16-107e-08dbb4ca3dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 02:28:11.6509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNrdzF3g3cjpbUtXvqF70yEIE3dqnf5Zvgp3FHhYsURFbYmlpBjd8iaYz+1BUv6lCaqNTajLlFp2nxNXvCXCiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6400
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 02:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187623

Hi All,
=20
QA for yocto-4.3_M3.rc1 is completed. This is the full report for this rele=
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
> Sent: Sunday, September 10, 2023 8:55 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M3.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M3.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 033896da8daaff69df3c2adb4ad5fee29121e831
> meta-agl: e654a050a3a2f2e780b35f90e6be7a453bb0c305
> meta-arm: a262d308e78b9ad5c0f92c77714c7a354c5ddcfb
> meta-aws: 3095240fb84be8fc78facdd2cdb91f77abf4e62d
> meta-intel: 0ccbd5e710b827a1cc73acf0ac75c395edc57b59
> meta-mingw: 65ef95a74f6ae815f63f636ed53e140a26a014ce
> meta-openembedded: 7554afa9b38c12a066b5970e18c1a7d60584f47e
> meta-virtualization: 113af45b75d2a19726d3e084e9ba05826128097b
> oecore: 03d37854b1dacbecd2c522821c59ef01d9bd305c
> poky: 61531cd3956c56644fc1c4cc77f130e60db1a771
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
> View/Reply Online (#304): https://lists.yoctoproject.org/g/qa-build-
> notification/message/304
> Mute This Topic: https://lists.yoctoproject.org/mt/101272020/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


