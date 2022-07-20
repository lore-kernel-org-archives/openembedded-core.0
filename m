Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A1BCCA47F
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 02:20:43 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.49211.1658283639559345167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 19:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gFcNYA9G;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658283639; x=1689819639;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gH/nW+bKbJ2g7cbA9vHUmkjlZ7CpL/naWuRCilQUtIk=;
  b=gFcNYA9Ggvg1W/iNS2JL7SWqkcOorFp5CoMdq+aQyFxiHjHlSR0kSz0h
   jlO5eo3NlwlTBdvdqB8reXZcy/ez+weBox3ikGlXz8MxVbc2Byy4xnKO4
   vddTFYEt7kW1uFE145SNfDwZJ6blGZ1cqnybvTrBDyre/qU70ZFLnFb6+
   oWqmdrsRoftyX/emNAiKDJiKBrZ8r1z08erzSyaslUZgfE2Z1tiWNxirE
   eO6tOiMuokTyYKXa34T/Qhcgy77+1ytQ8PE1WUI7k3mikT07WxdPAWMqk
   hGNXJwF+XnEQoocWQbPj+pySLNlR2DGLZ+JZLDq0rag2FYq1BNBYCu2sv
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="287815771"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400";
   d="scan'208";a="287815771"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 19:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400";
   d="scan'208";a="625458192"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga008.jf.intel.com with ESMTP; 19 Jul 2022 19:20:38 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 19 Jul 2022 19:20:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 19 Jul 2022 19:20:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Jul 2022 19:20:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1dAWIdb8XTJHfn1j3lmDCFimkRcYPds4ADlPrZEG+Vdq2KNhad0mocAK/rTP9NUpXvY+LU6ZH0VzTcUQ6g2THp0YE9CiV4SCSiDj5d1nBqr+3WIum+VOJoo6ZFIq/WeVz1GUThiXbL30JLzQenpKMrkDCI83/FjZWbYvSak0zCSrBmB7+jBFD4Vm8YTJAzOoWMsCkXPDxlan6l+8AdxB55GmPvqFF4OPhtYnk4es9Vq77E4PFXHzbnZOw/ctBEoxsBH9ZMia3PuxJFYNoVUdLSo9o0XKrMD7Mu4ven5PSyupj+7uIqrVTDkLyJPRbS4e7jWHxS20CP9dzoWw4P5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SS+zjhep2yZcmWdE430rksO4shN9BEK3R+1Rj6YpJU=;
 b=LbiTPOsVXIMtPCImo1jjn26wugJWbUR71dtyPvb8HonoBmiANQ8NYb+iRgSRSZbw/G9WBB8iOPL7CJwMJCGKPpJjTwYMrCs4YhnjLksc1+skDmVISntNu/4ulyvtHqGCl0kvbZeaUBLYBPp+nRo02rqH6T8d0EnmeEiw/rfwvIN/wNgNtvrUjfW+rYga2SB26KLZbcR5801PDGquZMvBiIskUBETPkEdZiCdFAZLbXKwZW6R8kliWHy/NScHedcAKvjSmUTeDubs9ji1wZaV/1tGIy8ZQZqPnBf7xDbjMe+lCqu/VMjW1Vr8mq/rrJ6W7eXIVlah/tE9ljUuDOw31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by MWHPR1101MB2078.namprd11.prod.outlook.com (2603:10b6:301:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 20 Jul
 2022 02:20:36 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 02:20:36 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1_M2.rc1)
Thread-Index: AQHYm6UN4GgPfMhK5UO2M/zdEEJnyK2GhvQA
Date: Wed, 20 Jul 2022 02:20:36 +0000
Message-ID: 
 <DM5PR1101MB23483549134C0E5026DF9947BB8E9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018217ea3768-11ff38ae-a6a9-44fa-a01f-495f642b5a1c-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101018217ea3768-11ff38ae-a6a9-44fa-a01f-495f642b5a1c-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01921f43-2c53-4f35-a386-08da69f66e5e
x-ms-traffictypediagnostic: MWHPR1101MB2078:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wWGrVAaop0qna6ug7c/C22fD3cgeu3GDI3Rim89AT6GwXvuoAz3dn+dIn9/++EI93k3SUXsD3UpS57h5FZwyRmSE2XUShqpsXv9finQKxKPzNkfgmHBREUQl0TnEneWKR/jLLrOeNGw1JV1b5Q2kb4hMJ3eu6avtl5HDQd4mqpd0qWTihPn7PVKqCHNbfCNeSv2YxZCmu3zo3wwh1qoqP7T/NMR7WirKbDoHdDrKfUUFwG3F0RXu6RV7mzBjyM7DDmysKtuyJem6mxBdiBbOpr8Qi94hfsrzbJL6ITQP+ds0idAwAq5UQYpuU/ib/2NfFZPS5X/50OemU2gjEV+G8/pig2iyaDdB+65ksP644Z0tqp7w1wWHsTwv3/XXquCoNZ17ApCBGJuWoG7KerP3OmLFr3oEnGLfvs/0LgeI40Gu5te+VRRU7ISqA/pqBmTq/iQJ0b5cJu5YiHfjv7ALJc1oKQfpksZir21JrCnu+Bg8XmLVhkF73RKzzD+WFraJKuIWJgIoQoZcSb6ahB8XCnlM8wWi6RVHzCC02s9hghq82sJnKltt50vsO1xWm0+W2VQDL2HXJk8Dtit/k75NVLwmqt2/FJ7pgw210V43GTC9DEt6us32o+HWjKBd1YYXL1W/tcnTgUbtnO99tcaAhSFM7pVcbHeldKbBDy/RvFUAVIwhrpruTwmblty8t4AVFuyqPeJMnbzysuI02ng7SxIPgs/8kxxCHkxYe0RMxA0dRaE2H5+nDsFrUuhzPVTN5GFTJLo/rhF8vwtefyFB96FvW6L74HifPhbqwqPNvCJGQ+bZzdjtfV4SJXzUQe5XGzUeJ3Syj+0ajW3+XG9c+j34JJr3Kr1CVqlLu3epH6AzkpyOmacn3ZEmZvOlFjxE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(376002)(346002)(39860400002)(52536014)(5660300002)(76116006)(66556008)(66446008)(66476007)(8936002)(9686003)(66946007)(55016003)(15650500001)(2906002)(8676002)(86362001)(83380400001)(82960400001)(478600001)(64756008)(122000001)(38070700005)(38100700002)(41300700001)(33656002)(110136005)(966005)(71200400001)(316002)(6506007)(7696005)(55236004)(53546011)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MPOJMIR5qOk+rcQa/Xraa11TI8SYI+nNivM6VlBGuqaKL1X5OwnLAwSvaLZx?=
 =?us-ascii?Q?vQiFSAvHRniWG/aSmNHv5Qvq3YsaxSDSvTUGmaiQ27amju4f0NV3MzEnsv1p?=
 =?us-ascii?Q?sM7aCLnr5WkAVQ/8Vs3RuFcfndrDPDxVoS7EaFmM+jxp56p+JffP4YLPHHfS?=
 =?us-ascii?Q?YLpz5/xnoBpAO9Jt8WEJi6sQqjfOKW3BnhFgp+w2sriOQBYsmv0TuqjrJxiN?=
 =?us-ascii?Q?JwLL7xvDczzxWfkk9CjlSK/yePXovq2uTn6iStgenY/llyCcI7R8XkPh+TmN?=
 =?us-ascii?Q?FTH3dHEt4fbGTHrkJPpTouhxFWycu7MuFkUDkCof/erUllJ9XCixMBQ92nUW?=
 =?us-ascii?Q?Gwnmxu7pWtF0EEPkqsMHXaHKpzc/SMPfpMLnc3+33OIsBWELAvX8bzgWqGKJ?=
 =?us-ascii?Q?gsOEBbTCFea1HMbHuldfviUoI4T9IB/sRmkxuSDeeCntSz8RXxhBXz5w+aXM?=
 =?us-ascii?Q?jOnTLp+Tm8Ac/3kh4aMVR0yF16zx/HocCSpJgFmpGsr41ac/+lW16B/RXIaQ?=
 =?us-ascii?Q?jQg6oV7k7zq0VCR05fsQofAUSMLUd/GfWeZx29BF0QzeUQTJclVkhUbEuUZt?=
 =?us-ascii?Q?eDkAttlKNMHb8lIoyGmZwip+JG/A2zUSezXqmRpwOdJmdak1LW5YbyhEM/EE?=
 =?us-ascii?Q?FMjt2UhI/HyRpx70TU4Kq581ByAzzLvVl1l+Lk73ul8JbaKxsDko7o0g+flp?=
 =?us-ascii?Q?MMeg9hWr1iP0VcVOpp99V06Wtual4B42lV+rwwFdGpa7E5XseLW+BTwIET8l?=
 =?us-ascii?Q?MYA6kS7I+E3mNWoDdTpK3E43nfYsA9qNKachUZNeYYYnOXkQTucMsIOWaXH4?=
 =?us-ascii?Q?rUhSF/PSZjjgVJdfBjrwkEYgvP/hQ13CTSSz8GYzwTOxuJHYwCk8Joc82WOy?=
 =?us-ascii?Q?wl6af/7uCusqdVTNwr44ZUUFT9CwrwTOaBnZNBneSju1RMTwzVOTuhnmRudJ?=
 =?us-ascii?Q?q4wlVffnQEdJB15YPc7fbRdSiyaQ7M9hHjkbRSz4K9OuyV2Eq6XQj9aYvIBN?=
 =?us-ascii?Q?38XNlY+uYXZEhyz+wD1yQJCZTkQrbI8DWQz13fIxaCD/0GuXcrlRhQXvCdXa?=
 =?us-ascii?Q?BaC1lfSFVNWTZfTEH5dMq9n3Q2Tv81+/yEqsREu19Ix7SHv7xyrnAgp02JQQ?=
 =?us-ascii?Q?MiVRngc2ZGvIi89ShqiLRA3gDcomyAet6CnVq2VyU9C6KXYkYA5TzbYD9ODc?=
 =?us-ascii?Q?uTi2s4DpCSHINrdKA8PUCnB9kjvgIeXv1MFeB3gFC7PIYc5isEExDEvsGHYX?=
 =?us-ascii?Q?wGbH5KxRJ8x6aAtDi/XYg7oIpBE6hINiqoPd98uzAaYqOZW3IHwRBuFNTIt5?=
 =?us-ascii?Q?xEfoBxlMnBVXa9l8sNg4nSz11YfNEkwjIsXFWEkzkYu1HRV3fK7uCR51Xql/?=
 =?us-ascii?Q?MdmFRB9TPCVvkW9kp4waz7+rqlPbJqXuXRncsyhUQ2tQBM0gV2Fij0x8dA71?=
 =?us-ascii?Q?Nf6K2s8NOhOYpQuLfClPIXRJJTswgaNgAv8dfRMYG6joq/vALM44SUBWbwC/?=
 =?us-ascii?Q?Gt9/NP3E2RtqWzPfs8JYqcvZpJ1DI8fr457bdzkFmvaFQ6chj3c3hTP95Fo1?=
 =?us-ascii?Q?4qabrO4cSFxG1xFpTM60cE5umIkGexZhK6xP2lhW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01921f43-2c53-4f35-a386-08da69f66e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 02:20:36.0445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 12v0ysNX2Kn4Y1P/C9rbQKAAEUfFjEqzQU/5+9gi7rBPR/e5VrizuyOia941aE9Ff9YDcmTDCiZx/Ta/uadyig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2078
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 02:20:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168291

Hello everyone,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.1_M2.r=
c1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Monday, July 25.

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 20 July, 2022 3:23 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.1_M2.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1_M2.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1_M2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: b171aa45fb8518dcfbba315b303a4fe9bf2180c6
> meta-agl: b5044156fc318a4881e766513871611a560170be
> meta-arm: 6481a473d84f84530e0c48d56acdc185919869b6
> meta-aws: 2f5075673489ee2d3fc318f6626d45145f65d5ea
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: de5851890f9a268621515193d2ad84f8359fbe24
> meta-mingw: 205e9d942bc8ea1643a8d27b79e773625d173c00
> meta-openembedded: 0c2e416567351d55ae45e67513be6f20aa754d4b
> meta-virtualization: 7ec4b4746d9d76062a868ea77818a150ddd53c54
> oecore: b4f1b78aef77198f26a8ef9e105fa690cc12e836
> poky: 899979696f68ff4414cebf7782b37d7bae27144b
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
> View/Reply Online (#164): https://lists.yoctoproject.org/g/qa-build-
> notification/message/164
> Mute This Topic: https://lists.yoctoproject.org/mt/92490173/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


