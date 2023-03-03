Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96424C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 06:55:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.17802.1677826514431642132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 22:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=bytmbIHG;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677826514; x=1709362514;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ob5jlE52EHzF1n5511nAQiwq8Rkq+UGOWTrvIoNzTJY=;
  b=bytmbIHGCF+sKOtE1NYnxDF5pLDRVPj3kgco22CsQUXL2tp7quosrTqw
   BL/J2CQRITRT1+AMFqvLY75dMEBcsc24IYc/cKsCPku/zaAfmMxehR1ft
   YBGGyJ/Q6h6/XACJlIeKIo6Sf5iJnEsNPd3CQ5HIaUepCNhljiaQGBQtp
   gkOzMSoHFT36nX0cCcujPdIm2Qbzl9UB6stO7fL4/OgDLGKQT7UYs7bpl
   posHthV7TseP9hBzoa4JbGoUD06tK+Cp0cSFyJbKoKcc1+ASgDM7/yP3A
   T4bhNbDKzX4a4sYv59uRRadztD2kP20Vu2E2g4Fu2Rke39CvQ8yM936jK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323269942"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="323269942"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 22:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004477480"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="1004477480"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 22:55:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:55:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 2 Mar 2023 22:55:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 2 Mar 2023 22:55:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 2 Mar 2023 22:55:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVhKaA6shgxKZa1wU4MvKET56DpqajT4l5yJ6ia7HHEYpb/pq487lMTUosOj1FQX3q9EeA8pj+qLcWZg31vdK3pyhEkstiHeTbA1U8uP0KpWrPoJVYQfn5jMUNVsWgokyfJlGgvfMibVJgSyby0rNEEidwvcwbSNdhp+xY+M7kqZJJUY+d0sxFxraIAsFdWWwjg9Jja3b8ql23P8VcfytrYHJ8A7fiCuHZwkJoH8S5I5YAmgnEny59Vhzh+5KKBtaSV44ePQEMEGNpb6WO4bB7Sn9WREhQruera6s96Ez1LWuZj6BFDogqdQHr8NuAHUm8yxKwpV/xPOVqjOy9UCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nevxx69KxpoH/P2wPv9udT8+hWeiMVwfdAJ45qHWc7I=;
 b=IUOCgnBd6Ppeb4iSfz8mETbVMxgE0gKiy1rnKLUWibtywCs/x/J8m1TGy0zwMO5PfJE0FwMGJZuUuOijL9/PlT7uOV7pCkC3SvXNyTOoJNqa+4vCi6l5EhvBTgxTMnk/F+hrQZiVketohQk7+zRzcSSrcHC0QFvn8CNmqwcOaDov+40Sd7+TrNixcR5JyMPjcAsYOrXI9AdU8fTIERsv2BvmeN/8opgFiDmUUIuK6irLNrI/iE63Qj0PysOPkEkgV4WueMuPQcSYFzmxxU71PRLqOKc8NVFo1eQCI8ZhrD8704qGDgn4FTW0ahoSC8Z0J7ECmcevoX5sz12VBPk3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 06:55:11 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 06:55:11 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.8.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.8.rc2)
Thread-Index: AQHZTJcbLZJmolpwok6aDizVCu+s0a7ooB8g
Date: Fri, 3 Mar 2023 06:55:10 +0000
Message-ID: <BY5PR11MB415264A76E9366903605A754A1B39@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <010101869f8b3dcd-f5d922ca-3c22-465c-9885-e608464a37a9-000000@us-west-2.amazonses.com>
In-Reply-To: <010101869f8b3dcd-f5d922ca-3c22-465c-9885-e608464a37a9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY8PR11MB7729:EE_
x-ms-office365-filtering-correlation-id: 68837858-3302-4e7a-1c15-08db1bb43b78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: afY2kuJbJXFyK03OKlApGiGh+LYPXIDvBFYzwTcfM25kWcyM2lZF4BwogHSIF4SRCecVubAGjKmKKIjG4HjxKfHJM0eCwbB/N8sOUXgi5LxIZw9GmQ2Thrv51+5KlzfSYWBR4o54Z8A2yJPON9vgiB5ecfG2dKrAX4xCMrUEAHwbpaa0CvXHTmSlpmR0/gqXnVO4fCb0WFgmqab+3ZWGXFrrskbBAdgJK9tCIliLY75TmWBkCxI0eDbbfnLd/qsHFoEXQiHELq3ImG7taeXfo4blyu9RkyXWyVCfUYdl1rxLTCU2ciJgFo6VP8iKRYbhsm2a+7aFCUDEcYMC/re04Aie82+GbT6Gm84ANle2SyBxFUCJXZc0EQwYOZgd+QTlxt+mSZoPZQArtGROMO0EP6MrJv0XYlOm1K6vYgykillwWsXRFWGe38EaKiCENRbYh6bKKKmlL61CkzYLP58ZlZJBamPHo4KAEwz1UNiO5WCidmI+J5/OOaYbM3vHV35jjmTjEYpWJUPiXjrsXGPJGMaHp3k5XblQH5gSFcXjM7vIDLlKlp7NXYLEZU6S4VfnwXmoUz45N7RQkkJFUR/IOFFW3l+Bq0JNQsd5cacDb2jP0tI6qUrqzn5BhqN3peUKKIn6kvFhgtV5oFrhRPT6GUeXjXFn8UBWOIyWk6++8oWkg1ChJ1P+bEP0Vy3zfxcB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(38100700002)(41300700001)(8676002)(316002)(76116006)(8936002)(66476007)(66946007)(122000001)(110136005)(82960400001)(52536014)(66446008)(64756008)(66556008)(478600001)(38070700005)(5660300002)(83380400001)(33656002)(53546011)(71200400001)(2906002)(26005)(9686003)(186003)(6506007)(7696005)(966005)(15650500001)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OR33HjMXHojEWejsIq1zEHO56s6izutTWddPcL/BYpXC/mKtVNFljqhQDcEj?=
 =?us-ascii?Q?uyHYLIwwaN/KyGc7kuYXG0zxWAQXBGf/zqolsiWUa5r74BYoldldnLzYdePz?=
 =?us-ascii?Q?/qQ9Y5J24Ee3AImlgk6AEyDpl8h8lShiad0l8pdEfvyIRgm5/zsYKO4C/Qx+?=
 =?us-ascii?Q?t+oFn9vT5555OkqQpojLpVhrfWux2hLuQg/kmaaiz+Pedj1lxzBjJXGS1hdg?=
 =?us-ascii?Q?+PGYln1aNVDzUZJuE5L2+HP3pT3Jq/GwrKRCzwq+30ylL1H5x180vmYD4pJ0?=
 =?us-ascii?Q?4RZv9gsy5f+m7p72ZYpsSkmXtzRHJailtsq4IRQFPypj2SDTJyhqkBne0u+S?=
 =?us-ascii?Q?1+lLKBoWo4CTvC6T9boBgR693yoH1q/CUdKHGnsLvuQlYwTxtD7iIOY+LRUr?=
 =?us-ascii?Q?/1xrUjD/iw3/XxQkMcI4wa6xC5h4z491zxXXnbbn6Ge+Op1BPJbU6WJGx7Hf?=
 =?us-ascii?Q?ocLENoqBzEoi/a3MDHqXsS+zLWamra3xhML2Cvwo0+PNkzL/RkP+r/BQ5KrA?=
 =?us-ascii?Q?yiASrwwOVsAkwY9O2i/TVYMhy4e8f/mfe2L+XLzaAmDCphWI4SNchh9vJcY4?=
 =?us-ascii?Q?Tg0s7tpaIg6KmMk/GRZvdW7Z4WB5pXomcdAaa0FoiejWlsud1vUeJfLha/1b?=
 =?us-ascii?Q?1g6fU4NgKPY5WwMHDBsB4kPdTaljdt4dNY64+2Uok5H7WIlMR2mSecwNYUsH?=
 =?us-ascii?Q?KqeSuEh3HrW5psIKeB7kMeE1XogGneRUmurI9ZQYcKvnd4THbtlgvdN166wj?=
 =?us-ascii?Q?zGIGseXSg6edwAy9iwnrCC3bSDliQnMKgQmXeHyqvFIThJtBmJjyfiCYdO35?=
 =?us-ascii?Q?MUz7Q9hNB3AJz71xM6rVDCyIj/YtKEVUyVoPukIyV8lQ9BCZyMGVuv/uBTGM?=
 =?us-ascii?Q?mJjSbJEcxpvbKExL5Bs0URCRg6aAAe80c+KvBwQk7xgZlc9fRaYG9ZJ2BRx0?=
 =?us-ascii?Q?UrhyjZc9YHZX9Mx6PC8gqoclO0voDwP4tH1lS4vodg+cb7D+NBE0WKeqS9yE?=
 =?us-ascii?Q?/+WFjFI1Y/FooykvImkumXE/J1+LakWLYkU8coPg0YnApVXQ2hnEO/qka/ui?=
 =?us-ascii?Q?Lp2lXJiMFZqBliXjRN1ZscQfWL0BHN1SAldNIZS5RTsKQf4TXXFp5s7f7VpF?=
 =?us-ascii?Q?BqsbZmIt1zO/XWYeC6rU6HnR2oalPT8P9IMxKRQV5hfJwZKKuczHUOlP15T7?=
 =?us-ascii?Q?h7NtM/+318OU6mxEdLfMmaIhQc/RXxWonX1YSWdkWd8skIBbrrzkkmm65YgF?=
 =?us-ascii?Q?MvZQHoWAL+6GKl3srJ2UMcW+Ll3hbOd6B/uscV6FhL93w9lS3yaAlYIZtzYZ?=
 =?us-ascii?Q?EEpH1/CAEgg+NnoC7UY7P6wQLkQltSofNXTE/hKtbbT+Z5nDNAFulrz11ItX?=
 =?us-ascii?Q?ymvrrgV7etl2WFL5Pcit5aYeIiHxVrERtzYLX1OMFkt+An1wIACF4kdcKHCB?=
 =?us-ascii?Q?z7P0zzxM+j4CnFVf1zRIG6/dd+2TWLVYeSEu2viGqSoVbXmj/gK8R4DKRECB?=
 =?us-ascii?Q?DGYyIwEC6IScAW2RLouFJmSEPygKKQQcfcwiZS032D1l8CYkZ4se6+SVFyz4?=
 =?us-ascii?Q?8mVJiglJFMEdvSgptVT3RX9B/q5zUKebqvEGthso?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68837858-3302-4e7a-1c15-08db1bb43b78
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 06:55:10.8378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lk292ZvTtek6YfAq7AdMKnhFC/ffNo4JxjJSJ6+E26MOtg1TYmaJ3hq6w26GSlr2JOvY8+qZZ8OitV6llQzcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 06:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177976

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.8.rc=
2. We are planning to execute following tests for this cycle:
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
ETA for completion next Wednesday, March 8.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Thursday, 2 March, 2023 7:39 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-4=
.0.8.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.8.rc2) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.8.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 9bbdedc0ba7ca819b898e2a29a151d6a2014ca11
> meta-agl: ac4fed9040280e687e45b38b4e59940fcf2121b3
> meta-arm: a0216a41bde3f191037332a9238648bedfbc61bd
> meta-aws: ac332252f6b50071a2de47ddc2c92ea65f669d16
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 64e8ccb47e11fc021a2a679f2e05d849b7518461
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 82c75b466e55d7dca7a2364986ecb704cf63d141
> meta-virtualization: a7413c5d7568ce91b809ed11f84305b1afb468bb
> oecore: b20e2134daec33fbb8ce358d984751d887752bd5
> poky: a361fb3df9c87cf12963a9d785a9f99faa839222
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

