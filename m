Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC6EEF4EBC
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 07:18:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50049.1775459919374345809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 00:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kg/QHOKW;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775459920; x=1806995920;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Hu/YzoGz1mGBnXjepHl67kvGOrff2vwIsTPs1QnjwD8=;
  b=kg/QHOKWguuudTWYagLYYGclgNqsG46AOY3m6UvgKf6cGZXdlC+sPTBw
   nMdSLJvFJ8Eqj4n/n/jZVkYj4SAXKDW6ri/9YG0/VML1JB1dYCcHeJhcP
   oj4xwADFkb2WWmseVfkLNUPBZ47Ws4fgwi2BLOrtiyWuGD77Byu/m3YzO
   v6K0Y5t85o8S3L2ZmwbaWc289zaXpmcNqQKqmeBBH96TtzHh8uX3j6L+r
   efP1/cK03X44kCmfaX5kL2e6sx5PUTxJx54X7CJNRgK/WIQqY2ocvkNq8
   7YFXCZhslX1oonmizU7tLfrxUH3Cc2mW52y3Mr9ZROSfXyjtrkK+qK57V
   w==;
X-CSE-ConnectionGUID: HZ7PZJ6tRrG25d4s/znXqA==
X-CSE-MsgGUID: D0cRFN/MTUCECSs56Ne+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76309798"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="76309798"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 00:18:39 -0700
X-CSE-ConnectionGUID: gn9PbxUOT1mBjCKcsrwRuw==
X-CSE-MsgGUID: YQTqE3qaSMm2KifPv+Pcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="226819261"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 00:18:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 00:18:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 00:18:37 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 00:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv9KGNvcFydioSjcr/HRZa3RpAQRbu0m1anCadQfcS/mIrafQmY5h4b2VS2WBXH2e7A5b9eeYADYU603OLhzDV/oPCi0OWmTrqm551mPgvY/vdoy6wuLnjkL11kWzzSzklAiZ8pE9He79wC1Uyq6m8glcCeR6kFdJYZTJhpxaRghCn++21NWn02ghBGz3fBEn4RNhPNbWLU2PiUOdCTzzRCVwNJrBcerIQsLE9bnIFwPsWHLH7FfPkjRTTwjAE5zdSLUpAtHhmKYWy8XVUJ11PQmuFsEw1hjkmyY0Hn3QgpeNzOwT96XTpVwKWRpVeepDkCDnAM3FNU5eLJPazvX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0x3gdLLtaNMdzLHrL0AhVO2TZQssaSnTJ52h+dLBkLc=;
 b=CnwvZm5rngjOi6xVXncKIkkve28xkU9mXui/RWRBUQAi6eMSbuPN2Wy+m+X/LR6zW3iNaMi/4Ddfg/bAzse17VJMSPgXSm5ytKmmmF4iiym/oOuFtY6yVfQetfnbxcz5319Jpfr8LydD5UYMI6zCVyfDkqoBMDPua/vtXowQxVQAqq8bnSHrtgZdjX+wemCEDXWbPgbobzHIsRxg5EX0mfgqjszBIS3edskCitSh+mRqfwuwLYhCUYKXe2up2/2Sc3Yq1mqcXjMPRIHgkPa4ud044BVi/DtvKfr4ETWBLzi5pVyQ5gIzuveHD1OmQTY9NR+4Zf7TukQf4BJJuOwGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 07:18:35 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9769.015; Mon, 6 Apr 2026
 07:18:34 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.17.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.17.rc1)
Thread-Index: AQHcwr+Z1uFm7+dMSES/hscBpyn5r7XRpJXQ
Date: Mon, 6 Apr 2026 07:18:34 +0000
Message-ID: <SN7PR11MB7018EC8104302476A06ECF46F45DA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d4f125330-7e1f1d56-809f-4925-a977-4c36436ac0d5-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019d4f125330-7e1f1d56-809f-4925-a977-4c36436ac0d5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|CY5PR11MB6282:EE_
x-ms-office365-filtering-correlation-id: af745b92-baba-4045-c07e-08de93acb722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: wbXNNGEkpm1mNnZE1qXU1PntClv7J/yPp+Fm8LnOc/6+Z+zX6uVaq8bLjflh6AtUheAxq9+BTDGjQQ/0rpCQ95hdACkvgs5v/LUBln9QmN/9hv8b1hpPY1fnP8+e3bjLhqzDWyCqqnXU4BUtITmPCW7ibAFUHzhcK28UneFHYJmlIzxj8i5tnYIkAFFHVQEpT0fEkKdbvjBFhaAtSdIlNwSzYakGZ5PlQy2Ofp2tbtAZojtgU79g2eYZkDeoxbqIo/jM2FOl65oDjSFchB5Pm0ZyoK3eicdgyrbdFrPwEKeKTiMNu5QHlSMEYd74q0a59Uqk9Kp0jTMAyeFFzJIAcFu0b/ghTYBgqsbBYS+GcwDIXTc8v4A68p75CZra+Ckf5Wl/An4mxG2FQ/daoyArPyH2Uy6nahsFvgnfIzZSOGqbtu2grpErDTF8b2cEcrQBc2W3SnXV6uAYtfo8dFRLs1HDPuchjOWTPpmT6qGgCYVhab+RYi5s2fEHKdlW+shQEakFf9GyNmYH6JpE5BIHy32Fgx/lOxVCe62ZkIGS2WEj4Fwt/TayzWukiHKzklWczaeB/6QOm0lZJj4o5wuYwUwKzWQOTLVbrzqboriVttN5ZmZW2Udy1ayABHDqtLZIpM5msG4LY/6rVpMtGB52D2tIEFuAgxgjfyK6Wa5SekmIi1swOznRhxMc5sKdpUeCpm+GtfNpi9aomKx4Uo7zSNHk5lpYcDaKOAIVGwum/Pmd/grzHhcNtF5aFQYl+JOx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Rs1qtSCYs/IHMIlBr6Bmu5YkJUXnV0+WplsKU4OnyCyYr3wUrhJOID3DnUs1?=
 =?us-ascii?Q?vX4wMt/8ZRbw/coX86tp/9QiK/973Lq7pudTUxCVA7yhHJEilhE7Sz6VNR5s?=
 =?us-ascii?Q?zM5BOdqLnhrkUkONo86ke9xVmeUxIJSwLCwfh9TmKAX9djlL12MjxL8Vff1r?=
 =?us-ascii?Q?KCAGTF1ATVWQzbM3BHHWEMkMG0i2XF2Pp5LjuULzhZO9j2XCIW85zCg4IzLP?=
 =?us-ascii?Q?qGgmEL+inXtojxfDTLA9UtwGQgc8N0XKa67xOv5qLPPqG99l11dgivxXBGMw?=
 =?us-ascii?Q?3mG+hm0O9iHTzb9/9Scc4qa4rEUkrdbqNzaATfoQcxO8ilJirAb7RmTEdMV0?=
 =?us-ascii?Q?KFCZJZr29WI8snyi6FI36LpIQdf57N+1CJY8kb+dQFYm3wdbcV6NWmUm7QQG?=
 =?us-ascii?Q?DowF2VWhw8kYRd1zu4q6XJ3RCPoaCcZtNdpt9ZPlS+0I0ogaPc5fYF5NI3TG?=
 =?us-ascii?Q?YcNtEW7ji8WqxI0oRTUgUj1vmYqS57NhEPUTyyIjs+2oc9BqbJL/EHXKZhQ3?=
 =?us-ascii?Q?otLWrYaElZVqVFHFlDcAAe+IP2x5u3wpMH27hQ3IDmueieilabLvoyrT2EVN?=
 =?us-ascii?Q?h2QdNOY0HenELUcdgbOpqBn2YOce6WA/UKD1MqUv/dDS5wXW0BIHDTpOio6w?=
 =?us-ascii?Q?u1Fuid9xx9aIq+QASJIwRRxVttnDkIrtUh/6jzlB3sLDI7/4WbwVlT+f5yCS?=
 =?us-ascii?Q?SZ6c3eWjqzkbpGljasIe67UnghfNr3d3TO9Yen/te3VufZv1JwWW95u2h7qn?=
 =?us-ascii?Q?TtYyd4VidNW3j1cF/wx2ZeO58jwJkwBQS9Oc8Ua49clFlzqARXp73bhwBiZD?=
 =?us-ascii?Q?/jaI1ueuCwJpgZMeC92y4iAN1lvbaVOAGIIqB6h1fV1RtUhOjxfgIQbk2U+C?=
 =?us-ascii?Q?xryiOZgqhcLdbTXgPD8/ioqAbKmzDmFnir4UuWJlzN/81/KNVs95pqkxI4DO?=
 =?us-ascii?Q?1mojZzE3M8MyqnQT0hJVaqWhPFksHX6V1v8yM4HLNwua5g1BawN1EeHvAdZs?=
 =?us-ascii?Q?IP6PZdk8lhWhchMf09PMI7YZAkNnLJUaMfjk5NmliMsNbT3vVsKhVrkw8pBJ?=
 =?us-ascii?Q?ZAyd2QUC1+2M86oIAdk9cDcVa2rw2WriANV1khb4t2q2u6OUKYHNXmt7jRg3?=
 =?us-ascii?Q?zNVtR3ZtivPuJXx0aiq2OTbP42DJn7QUR1w83/5lfKgqHzwByN4y80plH9P6?=
 =?us-ascii?Q?xuzglQ9bTMJiFgQsEj/JrnsV1ZLHPsNsspJayrKiWz2UlScBSfi3TNN7+cU9?=
 =?us-ascii?Q?UEeC6EnJTQrWL5Uy6OFk0h2sNduV0IvuW1HHeaB4wc9AGJt3pbsSYr3KYmOY?=
 =?us-ascii?Q?GxXDXQWduOUf07+iG296eq1U1qgaMeaZWxVNe0glkRDZeTA+Y2Q6nP0JBRKe?=
 =?us-ascii?Q?qUZBBufdH0BCePUV8mgwR879HPglQaAQqxjVBBQ90wLswveElX++rlQIQFKG?=
 =?us-ascii?Q?An82wlC8gEWqAQO6d8KUcOGcx8RAykKbF3Ap83KvPA1U6xP4zjGClmGhSsrM?=
 =?us-ascii?Q?0JX8ep2cvlwtVepj1RteG07fwamU18Iwxb2k3S9Rad8vH4oqxrNUUEr67YG2?=
 =?us-ascii?Q?q/sYvFTBruqjTcxJyLL0/IIcqiL1MD7JLqNkLtVxJRQu7Bj7G+vwhj8xlBM7?=
 =?us-ascii?Q?7SKvWS1SpjBgZKwgxEcQHsmmHEQyYOX+/MbF7CVGEHdrU5/Y/V0QBjAsLprl?=
 =?us-ascii?Q?b4MgYpvZlgM/EjjRPqavXMXqoZ6lv904S/9gbr2Q2uSwFqcv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NAyKXvPKONWIsdzDBOT1UdpasoXKi/sEfu6XLvAqeXVIGTaKVhbCCztFOKggToMDJJ8bdVcNlM5h1E/JAkKS7kg+NBZqh6ZPN46yf+oVhhlHSXOYpdTfU/fw+gziGSc6ib1Fa98f0Vwp5oyhnkdoaihNjjApbjJkkkoFGhygV1Epxu1LMPMaL9aS8xLbHn6dQwvPCdp9GtREARk0GE6eTz+OLGCRF1kFc/HL+4+jwr9M+wOjldNWH7d/NfP3yHRQFrPVe7kEx6TxGG6vjov9FTy+KlYht19auBcuu8jPKKRbMfEyH6Lb4VOdTUFU6959B3H1BTCOow1SAZty3pSYcQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af745b92-baba-4045-c07e-08de93acb722
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 07:18:34.8918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEBwMjwoGws8PQ2JKMgWhY/RWCR/MF4ITxYGgmEeyuIZAXQqd0uHTjiskRqjnsiEIG0ydjJevKvNnxIzMba/+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 07:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234668

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.17.r=
c1. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Meteor Lake-P
Alder Lake-S
Raptor Lake-P
Beaglebone


ETA for completion: 9/04/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 02 April 2026 22:12
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.17.rc1)


    A build flagged for QA (yocto-5.0.17.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.17.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3577

    Build hash information:=20

    bitbake: d3b4c352dd33fca90cd31649eda054b884478739
meta-agl: 6937866399dfbf3f37764522545426fde3f9f97a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 78fc3cf6eb3c8f7501d1ddf05d1787c43526b11b
meta-clang: 5bce7e26a38a58bb52242494e54ab2af40009574
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: 06f846a325fde423bb0a6d49d771d8c1e144d7eb
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 3dd635f613f7299d986a8ab6bc9f584370f8ed1d
meta-yocto: c7c38663a1cafb1fa8593c0b246811e51d3bbe20
oecore: 52380df998b3a8fe6a091f8547434a3231320a8e
poky: 1e8099846661571ede077f533eb1b6c86818ddce
yocto-docs: aa7226705451e6c1ef964d49963bbed29b267c27


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#678): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/678
Mute This Topic: https://lists.yoctoproject.org/mt/118636557/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



