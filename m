Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0CAEE49A6
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 02:05:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.2331.1692583545156227899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 19:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HA7UlT+s;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692583545; x=1724119545;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JFWIVBWtxTLQkCBsD/qkZpIAs4GbA7cHN2Entgwl6ZY=;
  b=HA7UlT+sQ8SGlbY+6lsg8oN8egFkNU3SIdNDZVBxFGOG7Cps/VpAtnKd
   o1pdV5hgE8biEWAft1KK3jgCDzj/LT9IU7I7KLe47A5m00sbtaT8IG/Ay
   3lmzlD/YZb+Gp0Z2YibpY6bVFM1pY/RJi7olrWFxDGFMBUOUctdfUydGz
   6x/zkEMlbOify70gcv18yFe5pSV1WkHf3PhwU8A9djqOj0YQqpTkzvG10
   fFgk8mSOK0JRS4dRPLM44x3J05c2ICWO993dey5BlzsigSQvzBJLJcaxS
   LXsuVSfC83cg69YORNPOKFkM8+IOHgrofT120XgCISYtC6JOxB1OtRgSh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="363634935"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="363634935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2023 19:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="735700409"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="735700409"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 20 Aug 2023 19:05:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 20 Aug 2023 19:05:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 20 Aug 2023 19:05:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 20 Aug 2023 19:05:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSV8JPoifsyCT9OksKWak1+kyGNDz/a2nnCoEMsPSpkdeQyK797vUwXoZEjn86TBPYZBMaOebh0pR1Z9JxbrdgN88ES+d9p2J/wPgqMZdjAVCLc4vrnDQjTJ7/ik3K2ffg6zuCNEl2s1zgMde3imjWzeJqkSGirwz9BIDJYt4Naauv6axq92wk0hNHi5eIUhLzwgTCxnQks4pnd5nsxz6uWcqgDEqIC/qb3cqo/TpNr7lANuhyRRhQ83sT+euvg4o0f45GF/wG4wqEDlIkYHmnlDnYVNq1uflgRdzMAfq9kjC5CbiAK6+COBWaA+0G3a6Vb5+zVqU44pSHm0AHPhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0goPM6wUufLfZrPZh6QbR2Fap2LXNwUL45uQQbZGyYc=;
 b=KO3X+I2pBPfvsYpAzvZre7wzJdCG/D1Y4rf1aeb4Ojt/ux3C7F67ZRX/9hNjRHwyg/riY6ydQHXsgsEAkA5qgWuijNGTsCLAEWxC6z/P98H6wWsrlI2FiUu+Ox8rFs1A50HFnbkACg5nGZzvdIXPFXNJHSY7vHpZGwWxjeL72jml6i71Z9exgP2+Aem029hLAFkxKGXs36Cea1SNpdtz2SQMYGdDiDAMTQvx338Q2clr7ySfwkdjR9Fp/THt0ZzORRq+9uG/Y5LTqb1/PtaL8ibyEAIyvAWo91YGHIRMV4hxHlD7/H0oR2UJLJ7yPS+BdAkjLHRMPfe7n6RC9uvZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 02:05:40 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3743:9715:3ecd:858e%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 02:05:40 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.3.rc1)
Thread-Index: AQHZ0mQxLUFWUKbvYkS1GOBFP2FHW6/0ATqg
Date: Mon, 21 Aug 2023 02:05:39 +0000
Message-ID: <BY5PR11MB415289DEB7DA4C91C46496B9A11EA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018a0c6c4874-ba01cce9-59de-4612-864e-f96b74e5cf0e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018a0c6c4874-ba01cce9-59de-4612-864e-f96b74e5cf0e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CH0PR11MB5266:EE_
x-ms-office365-filtering-correlation-id: cd6eb643-8d02-441b-a80e-08dba1eb1e31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PXz9l4AQx/UXLEU3gat3S64NlodxVCMVZ5oaY9tqou2hKqH6zOB0xkmbxE8w7qu903zGM4DI5AlAc4fBabSugTOhRWlw3D4co55bK3GFvuEe933HuHcxCsnegOO2YzFmcl79WEV7wFSLlCKmeKzntoaRD5ic4+XGsXBDpOa1U24QHXR0sY5iSlNahxPcaNZXyKctAt2PeK0C+GrJQIDVP20FXyGQxrlBmpz40JuVRV32jm2n0B/uUx3TQ4Y+pcQb099uDwodYdi3B+E90RFX0aLemuaCFayIXWNAcXRGgb34WhnunKEUdqExkWx1EPKIlq6opCH5hgTjmDxh8FGM1keptHTCFGh4zXoZzZUY1Hd/g0BoTxaXs+f/V27DRDW4KGJ3S5UUQX63YWg8ckJhBiux4Ic2g2lOMMwNL+SR6MK7Hev2rqaC3jaE3JwUifFlxR+1KafwTFnJIcUmm4PiEndYghuS60x54e7JnWWBq1/nJ6VxjpGcq8iGMzbHQxO6hffyPei2P6V+hZBk0So7jKHryJ4FdpDq6PRzCkCHunpmDPUQUmX3F43e3n2ky9mXnVx/kGYp115m5NWyRyPDlyrAGsIh3n0V7sl7/xHXLWat0bh5vThYyRfEEwnhluK9Qg/W/fH+OzD3R+4HnFH6vQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(66446008)(66476007)(64756008)(76116006)(66556008)(66946007)(316002)(9686003)(82960400001)(66899024)(110136005)(8676002)(8936002)(41300700001)(122000001)(478600001)(966005)(71200400001)(55016003)(38070700005)(7696005)(38100700002)(53546011)(6506007)(15650500001)(2906002)(83380400001)(86362001)(5660300002)(33656002)(26005)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7iDz6t5Ccb7V29VRghFPaHL9v6qzLSa5fHVuSa9CmeNFZEwG30EdNxJM23pL?=
 =?us-ascii?Q?0a9s7iI3gDIuIv/ARi64dxlmApeJDkEYVgliab9/dOmNb5BhIKBO+TLc4zTI?=
 =?us-ascii?Q?Tf50ZXL6JiOsRoGQjrdDyhNDaL7w9kAyE7TC6iKvoDUGhB54Wey/EXAm55Xt?=
 =?us-ascii?Q?0g+Z4/9v+2mmG4W/9Nppp0eAW9E6DECnI5sr0fgKE0kMmXYaM1yRUqgZi/3v?=
 =?us-ascii?Q?v3AFD3nAwFZ7DAvoyg8s9CYSQvNaJIg0LpAau6EY6xGjLnsqa5p1f9PhIjs6?=
 =?us-ascii?Q?HkKA+RQx7Gxh6OSB99/Hc826whdiX+nz4kqYJE5yoY0+EEvjZbP0za9v/UP0?=
 =?us-ascii?Q?vx0vBeK5/g4CS2JOyKxoeOaxpPsOpPWe/G2gfsLuNMEF+EbuH1b8dVgu/Xsc?=
 =?us-ascii?Q?8yTE2TwBAFLA6QRpxydUHIorFTJoIL9hEUjdEXanWi8BdiUJxV4Rww4v7EFa?=
 =?us-ascii?Q?ZqzT4SsDWxKLDSAr1s4a7JEedj7rM2XLGMuIVHcE3ecl6wrispWtLX3QR8K9?=
 =?us-ascii?Q?XH504T/qJ5JOwmx33OlwpClag3F2QRA2OcOrfWpFriFLEIlUJ7uUrV5z1VIg?=
 =?us-ascii?Q?k/zZz/nyTKQx5FJllGLUodq2SP4rCQh6NG7MTb9b5buUedVpsK732NNulgMT?=
 =?us-ascii?Q?iImHmQr6oD3W2KhwusaFxnUe3fWKQh04y0eJBjg2l18M+gnAb/EscCEnDHEI?=
 =?us-ascii?Q?FQgniSmMHiQK45iKpccm3bHrPSZBgPdu880DBoIBWrGTwbrwgCAo583OvuAC?=
 =?us-ascii?Q?zF+fwTesrIwv57qY4FOcktpCkuWw2Hx0knYe+XTQk4RYHOFoQkOHPohF87v5?=
 =?us-ascii?Q?WQGa+gM7kCEgiVLyFiNoCfLv+iwXcFeSkYnS54lbbwbwX7VlWqlh2Rzx61pa?=
 =?us-ascii?Q?R4vaqikDQam7ILLti/kr3cAQyQ0dxRCeDiz4FXLacg5OSgmpx3AA6B4CH2uh?=
 =?us-ascii?Q?EhlneY1TdR/9bv9Mm8U7UQRdLbckYXYJDapygOGWua/uNCv88Z8NRLw0C3K7?=
 =?us-ascii?Q?EZlvdHuQkLR+6tWmz5lJbBoCcZd8G+byMHrkDGK2xCx90Tg8eh4OGhJIlzTn?=
 =?us-ascii?Q?PR29VSvy6Me53uqcytk0zZS95vN2TJrKaOUEP+5XVY1mGyFJvRb7ro07EDsT?=
 =?us-ascii?Q?Hy+zZU6MJ7yykZ/eP+tCO0FDd1oYBlReYkRWPMAopPd7e9Kl64e4B5hE89hR?=
 =?us-ascii?Q?X2oMQUKQiGMQqwxYVNQ6fsRiVcKIqO5O3GjTpEcxKR8wjVf17FUX4cj6ecsF?=
 =?us-ascii?Q?7x5sDVtMH1qVAo6Uy833d+knz8rgdod9q7bw7UrVDUN6gITJsEteFtVz8TrD?=
 =?us-ascii?Q?JuGNyaM2fa9aOaAf4epR0eWuS2xIUBVh089dG3xEJaZCZdJiCDOJGJ42zPS8?=
 =?us-ascii?Q?7Za2s1vV7llwS7jZqk2zYtElFMv8WMVEFstDA7nSXrrfI9BDHiME6GVAfAAA?=
 =?us-ascii?Q?y7m1v2RK5I251qk7If5pWO034MqzLe/iDKxVNZtW57f2Sp5A8VDVAhdNHzok?=
 =?us-ascii?Q?LdNmrNYkcjQUsUIfFhbG9rOxa+E3kghG09NOELIr2kRqT8jElmM3P7ovGgPg?=
 =?us-ascii?Q?W4CK1OQ6nrbi5TjRDnG94NvCZbhwp/MtaJy2loCl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6eb643-8d02-441b-a80e-08dba1eb1e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 02:05:39.8953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PIqxyqlxfzv42AoDjYgNrCR3aO2xvU0Pi3hAcVZ7Cq+/iUTvaSsXESMMUf+pOQPXxmKeWYwkFk4kzvDZEV8RsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 02:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186418

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2.3.rc=
1. We are planning to execute following tests for this cycle:
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
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion Thursday, 24 August.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, August 19, 2023 2:12 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.2.3.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.3.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 08033b63ae442c774bd3fce62844eac23e6882d7
> meta-agl: 2b1679097d7b5df438481d7966377a6c0545c156
> meta-arm: 85b0e80e7d6d58bb6aaae6edf88476b9e07d3313
> meta-aws: 7cca28f6e03f3043663c2ad54527c63826a7cb9f
> meta-intel: d24a6fae0229b6b4e79f6e796069c56d435c8ac3
> meta-mingw: 92258028e1b5664a9f832541d5c4f6de0bd05e07
> meta-openembedded: 75cf318cef3b4ee81fad2782cf063ecd69ba8842
> meta-virtualization: b8a964fc30de6dfd5a04d3ac57428809526d29f4
> oecore: 7e3489c0c5970389c8a239dc7b367bcadf554eb5
> poky: aa63b25cbe25d89ab07ca11ee72c17cab68df8de
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
> View/Reply Online (#301): https://lists.yoctoproject.org/g/qa-build-
> notification/message/301
> Mute This Topic: https://lists.yoctoproject.org/mt/100835028/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


