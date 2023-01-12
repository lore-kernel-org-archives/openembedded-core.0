Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D0C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 06:08:05 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.48548.1673503682714749825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 22:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=FlpC6jPA;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673503682; x=1705039682;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=+2faF9t7jllExXcXyN+Fl5Co+zahEYgVOtHXJYOCnyE=;
  b=FlpC6jPAEDCr+zs8r/U9ITrztxQpwFYcPtZKM7tldf8FbsH7kRPSSGJs
   d6rVQllIU7xT+SWp/nuJ2ucoCU2xKDZ4s/uVQ1d7hdqQd+EpIBuT0KodF
   VmD9K7VPaRfNt9xOn4FgI3o8GniyYEU7/VUl8zfUEOhAsSuB7yHZdxbne
   jiVgj0tqAF+oYXhmmONjlnKk0ZgAB2EtV/QZ0H8z9GT2d1+4YOtzxIws5
   8ONQMG1IS9p1//7BvJrjXJiEa1GrKJX+5AwNqN9UmfwU3fjs8JFOmgg5s
   vNOMdP6WYx4p/mppd7cx98BjloMyYtKBk4KVceU+2zTNgPYZW2cqTngJc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="385935908"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="385935908"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2023 22:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="690007700"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="690007700"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga001.jf.intel.com with ESMTP; 11 Jan 2023 22:08:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 22:08:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 22:08:01 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 22:07:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXDzEbk60S/YxR6qt7cIBJT420pIMn+olFSNwDV2ADab/Y0DP7z9Yx8xQonAx64MhmfZ6TAc8qGQo5gxrMC0hwQSwUmSjCsf63V1xGJosyIoeeFADofsA1pyIzb6qrv/IA00jAOFDxefOc1SP7z2cFH/BM/LlpaFtRA0P85BMjuDy2fVKoEOovxTfbrZx8tdiVyBKlsLwup2oMEEFPvVrPYOh06Ca+UQqlapmabfAsMTu5XqptUmSThoG2uWYsNGjgo92DtRj7Lqt99kWUGl3lotD0zthfN7jdp+eM4WsfD37lk0Gd+xF0MzlEsdb5nfjgCxcr4uAHWiwaWrjOfPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylCAzi6lb2NWqtpjEmfueJM1kjDVucgDmNxV2xl6Cig=;
 b=XUAvSO9GfDoaZ0A9EBkK8s4HHpXuC3ThSNXf2lI8y50VCMJu95fryQ1sgmU+6JPvCpLT847NKB22uvNuJdGwj/7TDmgnLGa1Y7k0oS070A/GEmuLG+HWjUe8LogcW0VDg8WHsnDSiCzEy1ygvdpirXxcrjUnZP7o8p2M/5WTFtdryDzpMMthDJsDuK7J1TIwT4SMPBRP6xibdCmerMWbGNxREAUZBi/wZrMODfkvZ6/CkuqaEY8ig7rwRljkeXwoztvO50oRuXg5la7uk1lGcWo+fWNAAWXzEpkges+vPbzko8ZmHjnu6oQRDquzoCHWadbUJyvRlSDm1E3W3jadQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 06:07:56 +0000
Received: from BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::22d0:26ff:305a:7597]) by BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::22d0:26ff:305a:7597%3]) with mapi id 15.20.6002.013; Thu, 12 Jan 2023
 06:07:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1.2.rc1)
Thread-Index: AQHZIpmSL4wQp/RSlUO19KVcaYeeC66aUuWA
Date: Thu, 12 Jan 2023 06:07:56 +0000
Message-ID: <BN6PR11MB41457FDE25D67E46562CA401A1FD9@BN6PR11MB4145.namprd11.prod.outlook.com>
References: <010101858c5b95ec-635ac4e2-63b3-4a69-b6be-fae7e497ef94-000000@us-west-2.amazonses.com>
In-Reply-To: <010101858c5b95ec-635ac4e2-63b3-4a69-b6be-fae7e497ef94-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB4145:EE_|SA2PR11MB4874:EE_
x-ms-office365-filtering-correlation-id: f3565ed1-2c75-4cd4-9017-08daf4635930
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jOfM8bHkY5EnzD1a4QynhGSDWcR0af4xtUC3umXdaYpG+XTFQLIHcrQSB/ozSinNMXacdCBTqAq7yzWH4C/wdzNOYpWQ/fENycAQ8fPLRr238GP/fCEl4pJZ0bnjEQFBs+sFDP81xvmT/4K3Lneu+PEpb0sZOWGB1XeHI9HAgylykSwfHR/I97VO9bz27YeGRdNiS/X7Hjp1/nBRvZA7g4nG5SV5VdDIlQ77ePxhfGAow/ZU/Ke6Ok3Ttkt4NVHVXa5URtuKjSBEUsAWKZP6Qfi3oAEhW3oK1uH0Pp1nqi3DgDUtd869eUyURO6sBFEZevIDqPB9uvSER55ISyBoZO067f971UWVQUHpdnAQnUp18DTb4Wv+0K5F6KJaJnrLGFTHRElvsUTziETEQJYDrpCLNAc0W8HEJ2jFeQScujbeY6kUJPP4WytdX0Jj/icPVXHwZmbIeZGjCqTLeHgOURfawtiXihhF72M/ohsDvN2oN6vLVX32EnFiVEXGA7SX91IL4gCtP934Wf0LL+FpbO9P5p5k1JgIJucS3NhA+Y0s4R1V/0Vc+BuaM8QUAUFMkwd6K6jQ9Ut2P/GuIiBs+Ik17YvtC5fctDw/DFqRGVKT6mBVp7zRkUeq+XLnUee9Nxv1iKk6mvqJkx7ExfjEhdhd+X6h2voPj8nDxNuCRiRtaEiRlEI2bQyFcwwvCIAKPIl2DH1C9vdsacaKhpCtv+6EWPmYMF1DkgNTnEKxmSq7WyDb++SDv9XOhKbg3QmO/d7i5fGPapTavjuZvDgI03lUfrCi2lK/ltOoPeP9NV4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4145.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(7696005)(66899015)(71200400001)(9686003)(186003)(966005)(478600001)(26005)(66556008)(53546011)(316002)(66946007)(66446008)(66476007)(76116006)(6506007)(8676002)(64756008)(33656002)(38100700002)(8936002)(52536014)(5660300002)(41300700001)(83380400001)(55016003)(86362001)(82960400001)(122000001)(15650500001)(2906002)(38070700005)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CFdNSMAhbawECyspOQR56FGgdAVPUg59AduD69aPlu4zPndcWLC/t6yTgrFB?=
 =?us-ascii?Q?CrR44ZjUEKvnd+DbMM3DESefQlT4xICEb+YH4sKf3Ox+0JYRvYh3KCENYAtl?=
 =?us-ascii?Q?vfIt/WjO8NRnyenStN/Bf9/g0CsiUgZstou4U9OsIDrrcshhV6xbvlsk/OuI?=
 =?us-ascii?Q?Sj7wmi+XuF92wF01CoNzNr1VOLeZkCVkijmII75rl2g0/qA1fQOcrCc+EXF+?=
 =?us-ascii?Q?cY3nWw+rHA0gf3o7DkQGwRMT9U7L2UK9AlSm4+N+EBQKJZVr0KTLEVvEw9qt?=
 =?us-ascii?Q?OCyUAaGrb9nD32AhmXmibl5eD4+y07d/qiyMg1Uw7qyf1vTs8m37Q0z68w/L?=
 =?us-ascii?Q?n03liJMVRWCnFkFFoqQYL2n7/uAkwzxlsy2EIuYysCdTQLxZmptpjevsN6k6?=
 =?us-ascii?Q?FUloE+Nzr+xy4aIhdQlgJzL4W9v3RwgOOj7h0sB8dYW7dtg73TDTVu8pI+R7?=
 =?us-ascii?Q?gxBLG4bMBzlIM/WFF1fd5oBTC69/JgemWC4bLWgq4KreuTMZKgJV6FOGxWYB?=
 =?us-ascii?Q?nQIjO+kI6JgMRwN4/22VHn3Xu6xedJt3bAaOtZXtkXsknWY3yMAb8xI6vYNp?=
 =?us-ascii?Q?ZX73k8CHVT/BkCpEYZfEm835tRPTRxLkRxIFfvXVjSDuWM4YeShgPZ0v9B6z?=
 =?us-ascii?Q?sF2DCB8aXsPh+yigYIOyRfwfvQeK4coLDC/FUGBDKruPKc8hvLXtGXODMLSO?=
 =?us-ascii?Q?9W7HOcm2utzKp7vTVbDbjp2reksShvupr9+KPM9c7YaaX9GjkkDYu64r+JTJ?=
 =?us-ascii?Q?ywfcoNPqFoX8G+67mq6s4z68Hmw8QkKQoj+KGzfKh+5ry+7iJcwONbXXYFfd?=
 =?us-ascii?Q?MLOye6Fq2t9vZCFytUVVt/20sBxdnc1b3iM6dpdfjHZe+m8pNyvWuRSJ/BZz?=
 =?us-ascii?Q?GVAoQugQ+LqceZzxcpGBvS9vdwl4Yk+b5sF+9KBEvEMT4g7KchfabyMK2bKP?=
 =?us-ascii?Q?QUKHWn83Bi8laf6UD+zxHHmnE/kRmm5VuOBBLu7tkx3PqTIxyiTN71i0QHOR?=
 =?us-ascii?Q?bYffEJCawmdOF1ku38mdKZ//Q+ZkVdX6FnHlYJWHJt375bWHdIAi9KKhs/pq?=
 =?us-ascii?Q?piMrYBEZytXAR6ZuwQB3TvMihst1731ZhGiIAnzUIWA+PvglYuGbQftziFkg?=
 =?us-ascii?Q?fTaru7lX5sQX1RKHr/aPbEtk+uztvB1d/0FDXQgefOXEJ1fc4eXbet2mFRwa?=
 =?us-ascii?Q?uMIpyYY9IcDwTHtcDpi28vN3SFwBMjvKsPBG9v7Ih44s5TbXk31jvlfG0vNp?=
 =?us-ascii?Q?3IeBtS0cevzRt5kvfePW2Uttf7Jm0znU8CG5cKbHNNtlAn16fcJ7WmLWyX2t?=
 =?us-ascii?Q?IvI06bQYjmDq7ctkHW8Hph/qP7u2OPYFql2vUbvhUfNH/DHSN4DdcMnGZmXw?=
 =?us-ascii?Q?eD+dWYSDNY377ldLUa4wxKSkJXsBnI1R3Fi068CcrrFvFQVH5VCy6X9Ozdhj?=
 =?us-ascii?Q?+lliZYKIiq7FNqBuZ+LKJXWlPMGbWZ0T5DwtTsfm3Djyg9l3K+jh9lHRga62?=
 =?us-ascii?Q?mHfBqpZbSDyC6tdFeTipP22fstLl1D5KmwuFNnAXNiTrlKFq3QK6EZZt4RiN?=
 =?us-ascii?Q?zHFLhHfAPyJdd1NDHV4BKhysAi4nl5rdKVTal+Go?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3565ed1-2c75-4cd4-9017-08daf4635930
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 06:07:56.1172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xaGd3tKyMpOtSoukO48cDWA4JgModE7+4q77m60cQs9nVXAGpEICJLfW9Dne/peqCeroanoN8hHxQoER/MFa+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175787

Hi All,
=20
QA for yocto-4.1.2.rc1 is completed. This is the full report for this relea=
se: =20
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
> Sent: Saturday, 7 January, 2023 9:12 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.1.2.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.2.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.2.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: f0f166aee766b4bb1f8cf8b35dfc7d406c75e6a4
> meta-agl: 6fe6a57bffdded98347c2eab53463179b643904c
> meta-arm: 898a4aa99bd7c7a30a0613c56bb3cc6607c5b020
> meta-aws: 173b444a1e49b2497e4840ae70319cc868c1bae4
> meta-intel: 09e30d85e2e405e2f4a0e35c5d72aa285a2d8cbc
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: c354f92778c1d4bcd3680af7e0fb0d1414de2344
> meta-virtualization: 8857b36ebfec3d548755755b009adc491ef320ab
> oecore: 670f4f103b25897524d115c1f290ecae441fe4bd
> poky: 74c92e38c701e268406bb656b45ccd68471c217e
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
> View/Reply Online (#208): https://lists.yoctoproject.org/g/qa-build-
> notification/message/208
> Mute This Topic: https://lists.yoctoproject.org/mt/96112385/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


