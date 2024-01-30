Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03B4C47DA9
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 02:49:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.web11.9897.1706582977500540737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 18:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=B3hTQ8QC;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706582977; x=1738118977;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/VBWFxxRJncVyZB9LmpYqCHW96Vi1PdABGU1TaAKGNc=;
  b=B3hTQ8QCUVJON9sSAKD6/KgFID76KHpgSiTqJ+Y/yAgKJeoeEV7xtG3D
   WEQHyYHgoIG/O878cmk2vLI9i3hcmGxz7IvxrXr3jKi3yNT9/iqrrsPGf
   qcmyLGXIa5hImjmOpoaWIURvvnfxIfp5dkuxpYeFdA2Bx5wJSMXz4Q2Rl
   AXQ5gWgp+PDSGdvLVZCfs1bg4Fiw8BkbYPmQDtZMaffZo6as3hgJ9ZLqP
   wk4ddMjYrtwXzbjq+y2ZZU/lTN373f7KyNt5emY3jsAvBbvd5yIk6EwtO
   AkzUc0/A71qS/8/YmNDLoFO0VHY2dJpekd+1FTy493+QavjDJNJaWXAen
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="10542269"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="10542269"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 18:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="29740748"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2024 18:49:37 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 18:49:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 18:49:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 18:49:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 18:49:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPaUWD6un/Rm99UkwQF68yQUrCAvmRZZtMkrWv5C2f/QpAgvPcPQUSpD3sNcL1UQrc1F+QYhs4Ap4YN1DhFw2Lp0BrKIJ6SSUcURE6TtDM7/I27XxtoQEciC4PlpXTElAdZHxz0rgIIkRaT2mLIaWv1ox1krQllG6xlaTkreGlBkyUJ5BCz6hckS+l82bxKu0Fr71a+TQXZ6E9aHpjgo1y4CyQDEOVxD706LQ1cjDXixlceElGpmIBx5pMrHJXAX0pPXic2btPw0drLU+GwONivpCIBJA2/cdZqbVpHmZtiNrv3uoRn19QtNYDDZu3ZQhoCtjfjwJsYXiN1i1pJTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wJwhXxczalHmtWtTNEOUHUUiyOTZJfxcM7iDvTLbnU=;
 b=ZCLoaBKV9Hw9DrYiG2zY33UO82/6/YJ9ZcDgQ9saPF4XveKrXcn/JBvEciagIsfcJC45+ps6jGih54wDyPhE4WG+Hp0JmXHZfjpny7LMryS28/yGpYHfKzzRcx1dUy14QsxUk1gYzHp9pWPH1KMA4LQN4HCLzAAVCyUOdEBEfMrEfxx2hhckQ1Z+Ddnu8CJ2B2tPSFMKggYAtqIaSyNOjUbarU53sdtIZx5uZxrNa1LSy3fjrBD1yipfzB+iDomj1MsIHxsDFPUUdbRzeJbe7e3+DR8vXQ+/PFhZuysLrt21pGbulv9QnyoFQojNqVn0doADnv5ZuJBE2rUhHrJ7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 02:49:32 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4952:7418:df30:faec%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 02:49:32 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.31.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.31.rc1)
Thread-Index: AQHaTakbvmmpS+tNO0KSx0pYcQQvvLDxskXg
Date: Tue, 30 Jan 2024 02:49:32 +0000
Message-ID: <BY5PR11MB4152EA9091296E64721F4EE7A17D2@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018d3447f66b-648797d2-e0ec-49af-ab0c-4d8010a07ea8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d3447f66b-648797d2-e0ec-49af-ab0c-4d8010a07ea8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ1PR11MB6082:EE_
x-ms-office365-filtering-correlation-id: 51a807c6-0ee6-4d08-ba35-08dc213e1630
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 14lB70FqnEa0YPZ6V+5JVum5CHfSzaE+8AWOOh0uNQ34BsO7nbHqwxcauSoSbRg9E5zU7WiDlQJyyWKI3lH13lvKYtYfdQ/9HkiFUnRC0Jm+wTe8Nm5w4BNtc2iAfRl6GVbS1RetOf6DHIKSMantJXknnscoItiK8TbvsDX9NiYj3eilzOLc4wzN4cqa5BM3Yvo7eeFIdgfX5F6ycTS4oRgoufWZUkV0/QusKt4cAbIdChCF9Nqlp7OJuzF/AopqY3s9wZYN23olJCxa1LvFMGeqArUtnZnf0Gk41l9E1GE0+UrvDJdxS+yy5s1mQRLJEfmaabyGl980m833HKjaiU5QVsXX3fTDXewpgODdHZlWaQwTZNKRk4hK1Hi4CAzVhu6u1QdrosmjEK3893HykGtLyQcHOwtQokWm1IXdrE/5/XTOUAgSTdSuqer2kkgI5VKZlZRapdr2HlyJTrZhNu1PoreZDnsMREvY+X7l4+91Oiequ1nHcNBTAsTL+7zLssW8sBJg0st9IrSHy38JcPjdExdIaqaaoWDl3JZz0K6sl2x1KoUXSZrxkTc2eL96FD2xo9A9S8gWGkzr4nzh/m5eH62Aq3sjzYp1QMrjJWz6BVTVoQbncp2d9Ps1Vs7hozdQ00wtxZfn9Sc9vIBf2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38070700009)(55016003)(66899024)(2906002)(53546011)(7696005)(6506007)(15650500001)(71200400001)(5660300002)(9686003)(110136005)(76116006)(316002)(66946007)(52536014)(26005)(66556008)(66476007)(66446008)(64756008)(966005)(8676002)(8936002)(122000001)(83380400001)(38100700002)(478600001)(33656002)(86362001)(82960400001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5qcNH0Omf9RArsH8/7hj0IzmaEsrCwwCMdN+nPj/u4Om/Mz9o5y5O0nJGsi3?=
 =?us-ascii?Q?/mpHLeRANYGt7MYzqEQr/krF3jN6+VcXOR1iKG9sInmZE8EjJWljAWllN//l?=
 =?us-ascii?Q?Yutbpx3A/FMyID+00GCjEHRweTypv7fj/IrAXZLaT/qO85mLHwV8zQnEO+LX?=
 =?us-ascii?Q?1rlWLBaHngbdtWYa/99B1x+4DGVp24pTpHDUHNZQfeq87gyteh2W+gC/AskZ?=
 =?us-ascii?Q?1e1EU34aipXtSsgKhLE3t8bx2ZIEAbd+vDvFnz4RLyZHslvRg//gdyfpdNd3?=
 =?us-ascii?Q?E8ZbVREy0+W/njz1/T0cOqbZjP2m/ZSTINCO/tOQjl5ks1kztXuH1Mc2J9FR?=
 =?us-ascii?Q?FSs2FUgvBrQ9W3MKYbjkdw/ooE6I9WG69D4+EP/xVTSy3p1z1U/S3rFiLOln?=
 =?us-ascii?Q?OmJoGQSrY8vnWLdwYM5g3Q4JUMnfYRb/tTB/WzuaR+VvK3dl3pIze6z8ikXf?=
 =?us-ascii?Q?vboWbWLeL6pIaj9b+CbowG3i0QlNMAlInzhc0VhBNrKAR7miD9yrhnOjwu/k?=
 =?us-ascii?Q?/h8bxVt/XIDPSMEFugwU4JaEc0DQbdUF5cz2MHBQ0XZgPMJtz288QlptmjBP?=
 =?us-ascii?Q?zUd8lPHxVapFYiisBXgEVDOZSs17bwx7yCC8Mf8t1wPU8vvoe31eeRIIoO3H?=
 =?us-ascii?Q?yWn/2ED703fvGbCwnEPTVcgcq27QMsAmqOvC7ZRTqX4U+qkljrFVqHB5V9lL?=
 =?us-ascii?Q?4XveM7kYVeT7iuGdAyKywQHMqlH+skWQ2QPTLt2BTbMRKNNMroVaQA7kQvLy?=
 =?us-ascii?Q?XiJ5RdlDP43H+WsRmppgdKz8vvCwfnczYthplwARl6pLAeJSf/DAuuBLGLrG?=
 =?us-ascii?Q?8UDFRLqtvc6XhZ99uToMjjcvA85l3p6SkXA3YPI1kQrG7jvC/rLBcQknw0RT?=
 =?us-ascii?Q?v7tNbz6HhRI0LHpxDW72MhrC8ogFvyBOwjzMOdWwoj6fgoSJ/sVMgQ/rhQHv?=
 =?us-ascii?Q?pjqpDWb8fg6kZ+hTLCoKqWkm9JzwFdKFoKc7/5L7c5zMRuaoCFp3TGBge5um?=
 =?us-ascii?Q?/p2IoBKGAhV+BPlVt5/fR0QBjg8LM7BdenVsWMRMnOFZ9L5/NQV6IuxM8lmL?=
 =?us-ascii?Q?CLsiqPz9/Mq76YUR3vZ5KzNsggFVyLkMIp9t3URdpJ6RXwmyDPh9ufrCOJkp?=
 =?us-ascii?Q?r9sU6Fx+vkALMvszIDGWIBu1gPh1g2PMlUkggG2IHOhiTBJmsuIxEpGRylBI?=
 =?us-ascii?Q?GsRzjMPKdOJogzELWslP4gWKabpFO2fur2qTXl8GV6E30gYNyLfoWq8yPmTH?=
 =?us-ascii?Q?9U3D8lOiKi7GyfvntmCcc96+SvkHBww+Je9kkmwxKX4O8j1qnC1BF9K4XpKx?=
 =?us-ascii?Q?IzGUtBwodAEplj8eo2gJHxXfHQAGh71Qc4BK7NNCgy/KRajA+LHS4p/rpvVU?=
 =?us-ascii?Q?gnIpKpD7lYzBWrCFNwOhQDniAHzlcwt12C857acwNRZSyhjZ35CmPQYS/4AA?=
 =?us-ascii?Q?OsORTrT+471xPzxgelAxhiYtRBtbX9kOmighIK3i8ibcxGNUbh6VeVPMWlhP?=
 =?us-ascii?Q?laYJGoVenzC2fqkIhyfBE+8aDc9PXldDBHIkyj+qyxJ8GGbLM9Kv/a7yraSz?=
 =?us-ascii?Q?M04OqbnSuWO2hDiPX3fQ4U6J2KKh90vzw+htSW1H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a807c6-0ee6-4d08-ba35-08dc213e1630
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 02:49:32.3395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: huLKjSADVHVl1IZfvmDNs+kiGxJ/sBhPCCtpDbMHpZ33pA1hN5g1g8t1y8/9iJ4VuVG/KxjtAhoP3ZA9FgqqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 02:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194484

Hi All,
=20
QA for yocto-3.1.31.rc1 is completed. This is the full report for this rele=
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
> Sent: Tuesday, January 23, 2024 11:06 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.31.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.31.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.31.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6478
>=20
> Build hash information:
>=20
> bitbake: 36959b25c64044dd4bca65bd1bb1243823d51545
> meta-agl: 512d244d48ba0d33f609f425a6e8a907b178cdac
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: c76dec547df106f6df19c470ca4b3d5bf8b9827a
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: daa4619fe3fbf8c28f342c4a7163a84a330f7653
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: 82e67bd9c77f0c5cbb652ca91071b9e57bdcfb33
> poky: a9e3cc3b9eab7a83c715bb8440454e8fea852c2a
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
> View/Reply Online (#377): https://lists.yoctoproject.org/g/qa-build-
> notification/message/377
> Mute This Topic: https://lists.yoctoproject.org/mt/103902878/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


