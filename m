Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C378C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 10:03:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.3955.1655114631928642746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 03:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HFH1rQR4;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655114631; x=1686650631;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/ohbp4Zg9Cx0ZKUbgurNHJHS5IHXmTNFLwdq+JtyABM=;
  b=HFH1rQR40tZZVfL4a0KYsHg2G9T1e4gSohvBbvHOzrp9kJ4A5n85kI/O
   HCs45RrTLPELII1zOagrNs4Wuqf8Yd1lXZt/InzSUekXnGzGBoyNJDMSb
   MT4qVlKNe+Q6uTRpxncBIMB6cwDLGTxut4cKEGQxfOOdhu5SunM/O1Ann
   dU9UKg08g1kkRLPcJALoCL5wfQDviAHbytQUSpqFy9YBA4qwzHaJlRp0J
   GhNS02IDsbxprwfWOOB5/NE4XzmXtROu++E2KxOZxQjXHnFwPW/HwbFvH
   itSm6Ml7kKUun/0pjToSw24vs7dtl2vvNHV0jRmrG6mw2I3rf4s0sCukX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="258066949"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600";
   d="scan'208";a="258066949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 03:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600";
   d="scan'208";a="726188721"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2022 03:03:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 03:03:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 03:03:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 13 Jun 2022 03:03:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 13 Jun 2022 03:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgPccClhjk/8JKMN99+zQ/q/9wm+mV8BQytHpXpAVVkuMAp2VolAsj2kIKm/KSGak4sNbf+4xjTcs+NJ59UW0sbKtVkf9U70gZnHN4tXC1o6DxqKOiopXwtNHWeVvYAploU4QFpl7B0gT26Psjt96g0du3ZujkPZW6Vr+XoMFH3IOLF4FfGfUUxIBrwsP3H++Z6FVYREsJSefgJOs3wxtkM+/KiIdayniHSG5V7648Rt+lx505XoT8YG5o9VAGU5mtTdT9rC3DE47cDnALz29rgZChfSE6G62i+r/MbwM1RGWfPsSUrB8Jp5R315d6cm3xNvxr3MU60RgTxsXVjlxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0NgisrlkGAguT3vmD+dZ8MQhNCbRFRcVWazI3pT+uM=;
 b=A1sIPwIttwciSAEPJAixLfWC4D2JeBzDDTfcUr4czDMjfQE+0ccsnihIOBO0+P5h7hWGPsfm//aO7QuZ5TBp00rtMPSnFNcTq7o4ymxyaV0dtikXZYg3nnicM/9Zjj2LJNF6mpGhl/KjMsbhmezX5m3Upi/Fz1p02HtCoKPUQPLFYQn4WA3tK3DTW4h5bsoK3GufrZI4uxxAfPbstXF5vr1sk0d/Kxn4YE0xSis+ogxXZ/3ZAY191AFZDS6wOhmAUtF6kO7oXBuvvWC1aMQ0EtnuQJEDItqymlIPAxrT+wHezSqE20RnYkdU9/zSuwq+TR6tjftyfeviG4m0WkkANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 10:03:49 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::4d41:d985:2a5f:16ed%5]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 10:03:48 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.17.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.17.rc2)
Thread-Index: AQHYepRwkP5aKH0IREO5sBs3J7yuZq1NJA8g
Date: Mon, 13 Jun 2022 10:03:48 +0000
Message-ID: 
 <DM5PR1101MB23481ECC7354AA3303E17555BBAB9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <010101813f1a3efc-5d841b2d-60f1-47ed-84b3-78696706e23a-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101813f1a3efc-5d841b2d-60f1-47ed-84b3-78696706e23a-000000@us-west-2.amazonses.com>
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
x-ms-office365-filtering-correlation-id: 90055209-8fcf-43a0-3f9b-08da4d2402d1
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_
x-microsoft-antispam-prvs: 
 <LV2PR11MB6024DA428A857A82E1F24955BBAB9@LV2PR11MB6024.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QwDhsYvmKGunj2UyU/2Vyxu0JVuqq0s1REHTmA3q4jIeBW8m2he8R4hiX1IeMJPIpJ5yXIJIS+eaiY+RkRx+s+5gcoFzy1EFclKJbgeUagJibMsm4+kKqcm1QRrecS5DFQWizoBOWxMUD1dLW5EFk7nHYBgI3Oxj3RQRLRYl7SeOc2P0sG6M7gs0UdjtFpXJSN2lDel+afRuZ9yTcWkFIJahO/OFo825IWBeD0YuV5XGO9A4TEiU55cSyZCD3yUTPzjxQYbImpDQpIS3MYCZmHPCUHVAln+w8ujWn5j1cERpRUblU7Wg62UK+47BNK4jjdOKIQHkwA6qFF3Tp0ZrWxjo6ifJ29K4s3JdJ6nOTojfuwHbqQTtqvAKQ+KICn2DKomqKoq+0X7kBMuvHHpH0pxcCeE9oqDMFJN9JqhDpv6pq9C/xW/8jGKRqYqmdPucKlCeTHxYRQtOfJPM+dqOdSm8LAL7zJIM/y/gacDLMrKPLhB8Pua4oNwq/9pob4lKcEdDdvpKMCWIEGnL0uXNz8hRwA/hrFYi4T+BBa3s4Oxl/SRBGOdftKkE24VgvdyReuKhzxEyH8mA+PTlU5/kpB409dcYps5sJWaHhaUndxiejwscxdMqP5zxZkhjMt6Uxj+cXYLLEFgrum/N7W4PhRABI8zbvXq00/n+idvXnd3mXNV7zZ7JTJrImeX6rQBZmoz2a8SMXJfRojERekHyfzEZUM2QKJ1MNEvc1oiBDcHdEqL6C0MnxEa+T8jXZKwIz+og4w989Pks0jlxW6g9lRtTsl2ZfgDQt7ehzPp8+A65wfPrkvUoLv728qHtRE3Ry6T5GS8TAXgNkUjetIEFJA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(26005)(53546011)(55236004)(6506007)(7696005)(508600001)(9686003)(83380400001)(186003)(15650500001)(55016003)(2906002)(5660300002)(110136005)(316002)(71200400001)(76116006)(8936002)(52536014)(66946007)(66446008)(66476007)(64756008)(8676002)(66556008)(122000001)(86362001)(82960400001)(38100700002)(966005)(33656002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?M0H30OXKqSJhT4xU9zEz8WOya9ugOxQ3hVRi8VEciHyozmLZhuCq6wgQr75t?=
 =?us-ascii?Q?skEvFOACAwsViyev54g5v0powyJJqgEknG9oMthqd04XREROWi6dhaJWluhV?=
 =?us-ascii?Q?3o1t1eVBo58xxA9YziereJuAK3/dLjACKpKb++jpdTJzXTpaY6wdR9a3/xa8?=
 =?us-ascii?Q?0b+oWlEZskLir41XpeiPXHOQip2n5+RLs6gDFJkJSFETtu+F++5OZX0yKuGl?=
 =?us-ascii?Q?muxIDaLedj6V5DmdP67DdwxcImi6C+8nDSWDb/zg8QqXtHY0+AzgEO+vdnbI?=
 =?us-ascii?Q?MVdQgPJcWzH+35Vf6yKQ/rbFCrvUMuxAPKETjYAEzdPq3IaX9SDIiIldXHkJ?=
 =?us-ascii?Q?410EnurqVKgqOV4iZceZZ4lZpT9mPVEmPpBiltyqIW0TEm3H2PQRDfc/V2zl?=
 =?us-ascii?Q?o8BSqB+mLMLRnsOC5/A88oUsMrdpls/VJ5UkAUjTn4SgY/ePw9n0tyXw2glr?=
 =?us-ascii?Q?6UfGWkejiRIq2+tqnHijMwjy5Wyx9qDF6zhw9N1aoB47ZJgKlpfmINJZjSXO?=
 =?us-ascii?Q?tf/+dGrOdgI7tRTn7cEBWjxMBfjqcorr0ajbnIDFI+x1aMsMWVfOz3cBElpC?=
 =?us-ascii?Q?SrZXA1eRB44psoOtFx5gDPEnTJy040DMMvUoHVGS9rqUcwre9YCs4UVERGhp?=
 =?us-ascii?Q?tOiiOFP5JajICjRvLPp7h/tjl+0oz40Vqr7O/TvMJ8/Z2sIHCRIa8DDznAGM?=
 =?us-ascii?Q?memtUAI+etvyhZPPecyC73AUmAIbPRvK+XtIzOrcK0WkmHKi0HW07ikhJag4?=
 =?us-ascii?Q?GnqJlEGL1n0SEKrbw4R918mR528hNZ4XS97gBPBlex2oHM80WTCGSZcZT/Tc?=
 =?us-ascii?Q?EZwhrmMaDY+Md9nTP9g7GBqnP5+XZSbRZAWj3rTTP8QB9SnN/MXCRPP9cr/J?=
 =?us-ascii?Q?12G/E3Ph+m5IjTKqvBA8DBn8hyERm8nzeUlgNl9Y6n4WqG0Scgiy5GtgnRPr?=
 =?us-ascii?Q?u9wRELnIqDMVBy0EpDxNq1510tAq9qhYjGqWddtGZB6/krnJvr4H73oRHm2I?=
 =?us-ascii?Q?wy8e5EkmnRIGZfTmtslklJZ91NwSkt1+j/J+lR0EPFd/meoGdgO3wXnNXNL7?=
 =?us-ascii?Q?DinXOv3NJnVzdT7RuD8YzB2QNGTz1Z2mkf7ZK9b5YK5OAJNyYZ6lErQwgkVl?=
 =?us-ascii?Q?d5+RVeYwLHhYdTbgAOQHripDY7ZH7PlDgV1IjBIvKHxZAaLPeYTI2JrvBKmC?=
 =?us-ascii?Q?5WV3sPdPQl0Z0uFcho3Q4Wd4fhRVh1H7eMQpH8MPNENTTEb0NQYXiMEJVyXB?=
 =?us-ascii?Q?m9JAsTy3swLijIYYAKMNpmIzsZHwT3EpUQwKWJFQbQR/ApK8/lfUbsdSahiE?=
 =?us-ascii?Q?EnDgcsa1aWUWC6LiMcigoQkmMAtAQBRHWK1h4mahSUjqttdFIZSGcYhe4yR2?=
 =?us-ascii?Q?40izn3Vcs1cgO8sGDatMvB1KvYo0K3ojAbchnrMlINUP8mfvZv2caFqNnqzD?=
 =?us-ascii?Q?VOaapUInJ6o3mmQg/5cnncRwxnoMU2+NNuHeMiw016XzaHnBfc6/X6PjXhNG?=
 =?us-ascii?Q?AtdEvdbLui22k+xGV5l4okz4IVp6YO5UxbOugX6b2/NFwTjAodebZchULz3/?=
 =?us-ascii?Q?36XtBar2s5qM+YODq5xwEeY2RsTtD3ZkAjd4s+MrsLu7HEAPAqQNPpukZyvf?=
 =?us-ascii?Q?6Ol3dC20jSFYm+sEXrbjERgig851JMqBQz1tEc424SLO1gxeyOFVTDQ5TOFL?=
 =?us-ascii?Q?XytWAwZ4zo7J5x3dE54SXp/F5VVToCFc4bORZr7hwG6YeQAF3uQU3ZrE7wCE?=
 =?us-ascii?Q?+9SnqgHJzg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 90055209-8fcf-43a0-3f9b-08da4d2402d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 10:03:48.7463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ID3xzp5g08LP+G+QJdIQJbfwsenHKYliBu/Y+Z1+29nAyx7RdaRJI+9lTjAGPcixFzsbhVGF3z1ozTtoWU/pZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 10:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166835

Hello Everyone,

QA for yocto-3.1.17.rc2 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20

Thanks,
Jay

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Wednesday, 8 June, 2022 12:58 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.17.rc2)
>=20
>=20
> A build flagged for QA (yocto-3.1.17.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.17.rc2
>=20
>=20
> Build hash information:
>=20
> bitbake: 0784db7dd0fef6f0621ad8d74372f44e87fef950
> meta-agl: 34309bc1e6b092e3af5c5d559ad17cee77e99eca
> meta-arm: 5c09684863be8e803e3e987a5ce4940721c3f39a
> meta-aws: de60da566a16b1af8d585ff7d4d48290169d8f46
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: affda10724e5e3c7948200e888a91ffdb5d32a11
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: deee226017877d51188e0a46f9e6b93c10ffbb34
> meta-virtualization: f6b88c1d2f515ffac90457c0d649d6c805fff736
> oecore: 4051d1a3aa5f70da96c381f9dea5f52cd9306939
> poky: 1e298a42223dd2628288b372caf66c52506a8081
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
> View/Reply Online (#156): https://lists.yoctoproject.org/g/qa-build-
> notification/message/156
> Mute This Topic: https://lists.yoctoproject.org/mt/91605206/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


