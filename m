Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6BAC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 09:22:16 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.26543.1664184135213494652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 02:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=WjGolO2t;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664184135; x=1695720135;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=CVlzB0pJq4wTalDY5F4hRQqyBFB3VwRuLvkWjtLfzM8=;
  b=WjGolO2tDJQiVkeVVsaWkap0ac7aF6ji43bM2IxNBNYuOjJ12RUuPCkA
   pUBHoWua5QUad7TnlzsZCMBZs/DFsGXfn+iLMaj/MJcQYWEKLK28efDG2
   GIqOjs78DpA/+ZNdqnmNAiQL+7nmp8Y/YgXPwIkwsMMtYmHMQcf19injb
   XcRd9SUV3vc2EQSFWpAtdETUs6fe5TU9059gkYQ6DiXUXFkqo9uWSNnCd
   7jY242OhWvE/eSyTKMdk75k3ydHViyPeds1r7xEZ5xJwqPfkQA6iisaua
   e8MI54Ec0nIikGlNSCN7nnkjN94skA1V5t7oXnupnSGpD5g1XPUQewMdt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="299705629"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200";
   d="scan'208";a="299705629"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 02:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="724975947"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200";
   d="scan'208";a="724975947"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2022 02:22:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 02:22:14 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 02:22:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 26 Sep 2022 02:22:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 26 Sep 2022 02:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5K2H1seCTxu9VmjscvCUq+DinPpX400BlW/sIUfX/CyCeDNY+F9tIOFROh3LVJ3ykcA/0WYFln/rL7SvtTAB8xcEkG0dyarCMB7Tl3tcaqjS0Z9tkbRwT6moU47rJ5nW7eLVT+6iC1dRj2KfGZPNssvxnBntsfj/P2cpRoG4CPLavNzks6Ah8IF9WuCmj3nl5BY4L6WmlhWWMyK8wAx1KW4G/gnZvNpbN8vUhemlcSDI4tMSaqNKre6YQ3n1Tz7ncuknQPUdBZWXdC6hIAzkU2ln+UK8wb1UuQUSvjnSMTTZC1+TCqDKDjeOmRvKjbPpuTCelpFBpF2ekF5r8MhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fsfv4JowktgAnATy3rKDK6kS2aevVM6/m6f5hx+zMPU=;
 b=aYu7mayEi3LWToPj7gUh7gh6pEfYFwWXal/kq6IcN+AcywgnCy3ofsAwuJSJKCbBIUrXvKcSMc5Qkjk0d9TJtvzO+v090Au8muH8tHWamMl0NeaV5l/UR2s3hTkWdWamrCAAi/SgIUVhAC9YTycTSKd4BbkiLfZKSKIfff9OWLxs4MWQKDc0ubOa+25t/pfycxgayqU/38tGq7OxZTMesS2hrJYUtQakp2ldB8Z1j6cgabyLLQ2ixHk4K0mCzydbHf4MH/fhpomjaY2oYiS6CkPD2H+Y05a9qTMpFrNhYRBr5XNbn64LPZbA0eliiIsVM2RTwS6Mv/+hCmin6K9h9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by IA1PR11MB7317.namprd11.prod.outlook.com (2603:10b6:208:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 09:22:11 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::6172:27b6:2f0a:8180]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::6172:27b6:2f0a:8180%12]) with mapi id 15.20.5654.024; Mon, 26 Sep
 2022 09:22:11 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.4.rc1)
Thread-Index: AQHYzUX7PjeICq/PCESTg+kSRkpa+q3xeASQ
Date: Mon, 26 Sep 2022 09:22:11 +0000
Message-ID: 
 <DM5PR1101MB23481E2C394B7257B569B59BBB529@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <010101835d2969ae-38f29d77-d301-465f-a510-8ba455d8ff88-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101835d2969ae-38f29d77-d301-465f-a510-8ba455d8ff88-000000@us-west-2.amazonses.com>
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
x-ms-traffictypediagnostic: DM5PR1101MB2348:EE_|IA1PR11MB7317:EE_
x-ms-office365-filtering-correlation-id: d7270c8f-3186-48dc-01d4-08da9fa09786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AXx/ANpq28RFvct6Q3Nmk9evFIHSHbmjnWC68QD18P8/wGgUkkPT13TIdcFciMjbcPMGBX1clesOKsKzXxgbyFsDivacirTECWTlcG4N+/DLdfC9iZ1/qtVLUQnbTsKU0DBOUOhuS1tzI8LwbO/4IW8qhQrVBcEsvPjwVLfk3cpnWyERXOprakJhaTM95/+bokCNeb08hC2erKdH/Ffx4P7q68ok8Me9qnzMGdxIYqTvVG6nmLGoz/NsVufJ6Pva2KQHPqjomMO3onMOOTgmtO8IDua+zAo8ThPplhUknGMjFwEqo6pEdpIIQHsgNPCH4d9F8X5RgLoAazuKorEQOUBZnPGelmbrNE6fF0t2mXt0Wyb2iBLaY9NHV2N2DNwKvJxq8MNixNYmNalXOPJKdEolY06+vCATO2wy8LNhEW3zbrwzOLvRSwHQVf3GoOKwunWsyIdB7Bbr3NZ44CQjtfQuiZv3G/zkq82ylXS3s5E0pfCoRa5/CSF2vbpqb1v3jCQZ3Mv1uTikXMtSDR+oDjJ2x2b6nleD4N5kv1NF2PrRbnn9GwEfZBItPsIXdAy2n3gE4+lFl+Y2N+v8VLx37DwiPeRJqqWg6d5c+U38Qubxb8OHFsL7LhRGuOSdrDmi+880RCnqYxfUrRQKnJaKEeHGP8HKY7tp3cA9PThQmsCBn8ErIZLZklRh5CSITZPBbmULxcoxhDvhmmJMSCpYCCY4FAHvYJliogVNqROJEOgsAf3zCmGJQZcPcsmx2H5N65MiVI90hmaNgzjFVRHfzOP1e4Fwd3HMuiPlBWiAx+nhxkyR2SU0F6rBkZ8ZXVN9/0ruuXdsvFiigvQ1s8xxMA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199015)(186003)(71200400001)(5660300002)(8936002)(52536014)(15650500001)(55236004)(110136005)(76116006)(966005)(8676002)(66946007)(66556008)(64756008)(66446008)(38100700002)(66476007)(316002)(6506007)(7696005)(41300700001)(2906002)(86362001)(26005)(53546011)(82960400001)(9686003)(122000001)(55016003)(33656002)(38070700005)(83380400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8W0Rkvqeig7aMuOGKgPNT2npcn3ae9vbyr6n0tGng/3Sd1X52zv7Ni/sVoD0?=
 =?us-ascii?Q?m00WLxMt/z7gBXYLUTQzOr2pSB0tH6fAlkKGUfTZVyXAXVVycMrd4tJdNvAA?=
 =?us-ascii?Q?/Zeh1zFPY7w6YvGDW05jCJEvNXNVqYx8ozNjkcbov9tqjFpIj66rL1S9NSnK?=
 =?us-ascii?Q?xo5Mbpatv4oH+00k+ywW2FARcfUo/ydBwIMVAwkV98gggFxGyrngheDo1eDA?=
 =?us-ascii?Q?fKk2ojbKp0JlffZt1/wJgmU9J9NzY3J+868M86MVgye+5bdomjD/Vr7S1d5B?=
 =?us-ascii?Q?Mor6kdHXOZvZisuOyCYOKQGygK5cuhNNC7TNlQhAPBW4BjOZL7JLUPOhU8tn?=
 =?us-ascii?Q?cxJ2SQnl5V1t7gBFP+PbicShFBQypRIXz3eSEXJPEaDQnxa7yGKAyMxlyrE0?=
 =?us-ascii?Q?WMQ7GHGVaZAZWmIukhZ3L5b4I3F4NYq0XPmgidjD8zZT13vS7x3BjaVKCKsm?=
 =?us-ascii?Q?X2myPjxmD2BSUFXIJpEXks1wUnFn78TorTT/OCqyfBSrk0gRvanDvFOqMRkN?=
 =?us-ascii?Q?FamWw1K6YreihQr5N6IvXyU9we2WECUQcCmL4IPG+QljHyokL1k7sYKJij/e?=
 =?us-ascii?Q?zJa+76vHWbuFXGVoeSGMqvANDcmQJjscj9uxNetFvyi9CUH7RolXGzQwIsDJ?=
 =?us-ascii?Q?y72dhO0cwLhOPcN0HicGFJ3U91+R7JFWE9EY0wPp2fcierwUX+mitGSRNQsy?=
 =?us-ascii?Q?5xiyewgQmxekpN1nfOOc6+OwCke6D+jVyMyAN9DVwL0T5Xr2utwNa1n8R65y?=
 =?us-ascii?Q?jCJ/1XVduEODAKbTLvWaw6N8Ynwg6w/qubSlYWLuf1DSwW5XEc4FNOe0dOP6?=
 =?us-ascii?Q?ajEMX1K5Ae0yiFEZjGSNfNAOC8N2Qv43sMuOcq7QBF7Xq3MmGIoGbZvs7WPG?=
 =?us-ascii?Q?sXakmI5yvMXhVtXAYdkYhkvYKUI05JWeZELnbJSTOLWHfDZeRotxIkwYFURC?=
 =?us-ascii?Q?+qfzZjAXrCYjQtks7hFWWh3yIyx23KgUJ8VUr5MgpZM3pe18mDZNRtsXti6V?=
 =?us-ascii?Q?TiSAPYjqJn2k+eWIZb66159LavVN6SO4oSjyTOfn7xpQbbQFgaiP9pnShazq?=
 =?us-ascii?Q?2GDEYGbophatfypHVfK8ebNuPjjVONg16Eql/cy43CmKet3cpX679gF4cQJl?=
 =?us-ascii?Q?1OP+B5RYTrJ74qA1xPZwND7Xi266VXBFTczCr+WQuoQNfVvRxs1P7F/DXOgp?=
 =?us-ascii?Q?0Ppveq48OA6Pj8pCmhVXPrC2Fg5EcLYvtJpwGNfcJRTQCob88OnRKA4PJYoO?=
 =?us-ascii?Q?a98LwPG/KYrJGyvoQOq1lrHTlpvaJx6n1j9yqaH1kk9aK6rRRcDB9fkNzWh+?=
 =?us-ascii?Q?xb1bsnsfvI8A+tA3RJRnBUF82MjxzXVrAuMr7ua1gXcHEut6TwZjINV6GIb9?=
 =?us-ascii?Q?meFuGjrSOTmOWFDOp1lGXCkQ+9TAF79so1EXmoe3pZpeg6fWO3dgOnqc8N4n?=
 =?us-ascii?Q?2XOEypwzhog8Ehh0MS3y14dW8Feoic/enqlMPnnSCWJpwQ19lHRA2T1vnLn2?=
 =?us-ascii?Q?x1E9L7icXZWVCnNDeOQe8iVI5VcD8t+CBkBGMcIEXu5kk4XnR4kq8Q7aWR+5?=
 =?us-ascii?Q?3B+iOpDyCXmB3E7mT8oWUOmZJfto6wHEzZu52rUF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7270c8f-3186-48dc-01d4-08da9fa09786
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 09:22:11.1915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 hWuzkF4jnTs5eD4E3I1px9RjQVZHcPh/yGDlDRqqKTgHlOInsbU2VwEWpEPoxNdYffXeOcFwJP7rDfWcVzR/UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7317
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 09:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171056

Hi All,

QA for yocto-4.0.4.rc1 is completed. This is the full report for this relea=
se: =20
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
> Sent: Wednesday, 21 September, 2022 7:09 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-4.0.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.4.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: ac576d6fad6bba0cfea931883f25264ea83747ca
> meta-agl: 2e8dbab520652afa5e39e74793bdc917aa9ee86b
> meta-arm: 0a5eba13d81f5c5722a13b816193ebf93c0fd198
> meta-aws: 3b4ce1c62e3d6fb7d4695e9b0c04bf7f922f051e
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 01ad1a73aaab49d377d14bad8a7dec48f86cba83
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: 8f96c05f6d82fde052f2cb1652c13922814accb0
> meta-virtualization: 8c5f038cb92fa4b02246d2d1479a003eecf5fe93
> oecore: f7766da462905ec67bf549d46b8017be36cd5b2a
> poky: d64bef1c7d713b92a51228e5ade945835e5a94a4
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
> View/Reply Online (#179): https://lists.yoctoproject.org/g/qa-build-
> notification/message/179
> Mute This Topic: https://lists.yoctoproject.org/mt/93815846/4899463
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10406805/4899463/715389995/xyzzy
> [jay.shen.teoh@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


