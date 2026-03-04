Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6DEEF8FEA
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 13:38:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18206.1772631530948031558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 05:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Pmnr4Kzj;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772631531; x=1804167531;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1a2SYf12yfrrmX1tlJ1FJbCCzPMEus7ZXZq9zl6E+G8=;
  b=Pmnr4KzjjAFrVUH5WB5L5keLjdSVESLM0u7ErKX8TI+RxqNxZSqO5AK9
   Dgl7cf47Sk6o1SV/kYrDoNNT9EJEP5cOwzxQTD2KP2x1i3AFrKOHx74cl
   OlN9Lit6kq2ZBJNlmKEUkLl4XCbkLesHK6VlqU7pLCyA137MXImVFIVFI
   oftHcfdGDQBFnM6POCamwLg8RI4rkWTK+C64C7JvilDGQuoBmGEJU2rm3
   WQmaXeomj7LeQCjr3dbqvwbe8ll4mD/kMISZ7+N+W5JUMczp5AkFAQ5x1
   +CYuGb1jeJzPwCKj7htjHjV5N4keZ3IAIAp5mHNx/+PA7INiplXDjQe1p
   A==;
X-CSE-ConnectionGUID: xzCo5IR7QuSjm4Ph+rLxog==
X-CSE-MsgGUID: iZxB7ZcFS2q5snBcR1fYKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84025981"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="84025981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:38:50 -0800
X-CSE-ConnectionGUID: xxbMQ8tIR3aApTi/7AXSTw==
X-CSE-MsgGUID: LEdI5WIWRayrptGmLidAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216190822"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:38:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:38:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 05:38:49 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:38:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5dwoVNhfndXKWQEKP+5vsKe2dvZTuNUe9aApX0515GjBcsFQQfCB2FeooKjh7JmiJGxftgy+S0UGwFp+XepSlkYcL7Ph25xPJqbmZPfbHh+fdlOUEHlSyUkt+A1gA7bLtNRWF6VwVaqQdVUetwr1McY/3btdTVgMPElsMjZ1I2MZ2xHZjWzX9LTQLLvbBWkutTBzndK+LFM6VAxXa7aoeedOwbuZun3RAVBY8/9P9cdewiBJn9WBoVsV06/A6h8B5VKx55JhEjRFShskhmmf4CuKc/kW6trEC2fvBlpQ/mDExirPwNHm4z/m4OqsSXyxlHTkLOLb9drl21l9DXk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LKqhonqI68yvFuZwdYi/sh8BL0T77svFXOqED+6OEk=;
 b=MHorAq28H1ouNN1NyPf7BrYJ+Z22bdvijltIh9FtDtY678uo7NLpz5bwAJYKOHEVhahFOiVYyHsYqC2lHfbyya2XOSGd8Ig5vbpkNfc6EeyvCB7O+WXpLk1a0SwMF5IuWv/nF5GtlOQRzS3Up7oRz8MUyTOXPO8FP8MK2nlAmsjBHNWRuhlKT61M4tBCCjTUw7MDmvkxZcwtKcx6j0FB4KaSrLIEeP/4jB8+g0heidYe+ofSzVSrSOBO3L7jH6y1bjCYJUyBQ2l/22jdjszpuhDXvo3Kd8Vddn/A6WrxImvI+6Z3a3yX7meFwfKbkOy3dN86UYyZDDihElgnjVk7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 13:38:47 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:38:47 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0_M2.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0_M2.rc3)
Thread-Index: AQHcqjkn9HD6Y+57AkaJYCNeqkgZd7WeY1Kg
Date: Wed, 4 Mar 2026 13:38:47 +0000
Message-ID: <SN7PR11MB70184C345166E82E97174F74F47CA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019cae57f45a-ae8dfaae-ad81-4664-9a28-1121fc1fbcf0-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019cae57f45a-ae8dfaae-ad81-4664-9a28-1121fc1fbcf0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|CO1PR11MB4945:EE_
x-ms-office365-filtering-correlation-id: c3c448e3-1414-4d86-ff8b-08de79f35ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|38070700021|7053199007|7142099003;
x-microsoft-antispam-message-info: MSxDWb8WyVTi4cZvsKEwdKZtzyrx9H/PLv8eBnmHKD2UrTWVqdcZ6XfRGwfZ2g30cktIS06EtZomSEKbg3Pxkv1k91LX3oQzbqEP9TcXNLlaiH5nhGJInKn+yAr20pFvvh57FrMyd3sqJ84RImfxgsIPFOggRn3U8ev++8idIEYXlX24X7EjYcF+dUWOeILxCEqpky6s4QKbt+fjMcBxcLoUVYBS/0u7MzlELPAePLsfcVBVrrtNgREza7oguDnlGeLtZyYKhS88Sa0wRJWvTMPwETtAUQ2kgXLpsZFHSn2lz8UcP5s1fOr6Bd9D4rbWgy/eVMRWz5kCZC0DfUgJKJ43lat+6qhGLV1qe5Mm4AESJzgTsITXdPMQT6LXjK8BaPP3uzhXNqUo/5w5qQeCVF+9yVfwGr2F3m8WiNapzMK9WJwAeUwVHmaqJ8FKo2Aiqcs60aIm+MV6hSdzKSD+6lvpJBWXyhK0SvByXArjB9YItfFq5FE+g+js9Jh3ZlbbejK1Zkhw8BZ+0X0o8x1KnObY7KfyM7hwxdRuv9PYVgBsKFU2TMr6wT7RG8PvifrzQXHIzSOXH4SM8LhTP5UMN8joLNnBrDOv1tWnopfwMm2FI0tuAjmRhT3w5SHHGU8mCE/F0P9ZNlllN3vlJNmCYeJiN9vJ9Dp3+OImDl0U2B+0yYwPfhaMVDD0bUvB06SAtDfqT4PTRhZQeaisAwrjxW6tEU84EZ+6qL6p28uPjqC6kcrCOnqsFeFupa2VkpcD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(38070700021)(7053199007)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0ibu4Jt6Mf5Joh8UgUtHFYeZpX05S3tdzeA4wNx6JoRdOjOkhMi6PUBe4uPW?=
 =?us-ascii?Q?RvJhptOTHFbiNmpt77tdx97t5VplFIlwa7IKBB6ZHCj1sugNgEE+lT8am1L9?=
 =?us-ascii?Q?pFxiqIlQOs+J4emmzWuV7PsZcm5wHng0otcjeGCkT1WncNIhMaXFeuWYOWE1?=
 =?us-ascii?Q?kI04mUwzuZgjYru3ouBruR9+EoZANdaPopRDieLUiTAfXxPuyvvBpwWEjCll?=
 =?us-ascii?Q?CIvndh9rTdbjI3dh0Mv9HNbpOhZ4orMioIz7V+4uB4C4yXwtSFV174/7nwwz?=
 =?us-ascii?Q?hx3N1/uVTvBa7BuDWAbj453id9DmraOtcjQJSJxQFGaypOdJSsyojOiCCWRI?=
 =?us-ascii?Q?O1MsXrbv6fLND0g0/EcfKNv/jgid/7qGz6Bwb6DkHck9LK4c/Z43eWCLzHPF?=
 =?us-ascii?Q?O+0xzrOX8oHrBApi/lAAnRyBUqGfE4oWmSdlgmAS6Y+uaAgUom+BMp9kfdHH?=
 =?us-ascii?Q?bmSgn7OFHG8THzKBL08O4CbjBuJJPULNzkBEVsCErHCw7gyurFe+6pjjLBhq?=
 =?us-ascii?Q?TFl+pU4YOKjggaYHyljuai5baY3TyfCd33E7jTMEGEkmXfqeU6pW3HWH4aTl?=
 =?us-ascii?Q?UPfaH8MB9lBmWjH8DaShX7LWIKDWjUk0NP7Oc59bhrDIJlIQS0eAQBkxL+kF?=
 =?us-ascii?Q?TkDhHl6OQI55hQWrBi9i9pyxup70tdXX0yt7LV1DUnLdUp83OIfXKf8Cks/o?=
 =?us-ascii?Q?iQ797d17KQ6sLv4CwGG2/hjhRLx3pqORdUcQzseOBxxCS6fv6YPgYQVC04m2?=
 =?us-ascii?Q?rIUIY2UjdGp6nq9p9hzE0etzuB3P9LVrNMShBg1yDqhlekFvFFd9NeYfwNq7?=
 =?us-ascii?Q?AcQgJidSpprrQob57Trb9P0m4L5JOmbMVBAMUl6T0ztwicQdWTp+ec8lDNJP?=
 =?us-ascii?Q?TnQ5dzY/RLIu8F4STvq68IngvXA/jwlBtVGJnWZxLNBblpdicABgV7HI0rvl?=
 =?us-ascii?Q?cX7yDbBscu93ikqIATNnpYaiQwjwgudOP2Sd84zoAwtZHb7SUHETv6VVzfSl?=
 =?us-ascii?Q?RZGDo/FGhHKNhfux7QbaQHjuY9mA3AHTLnuHVLkMs2Y5ksyMI3GBMxwj4+6z?=
 =?us-ascii?Q?JLCp4ryd1U8OPaPdR2WlyvcjxL2tnJtLU5e5DqJrQIILq5Pog7U1yNr/q9YU?=
 =?us-ascii?Q?YFuJr8nJlIF1R+KhJmxct6qBtET8RDxOCtRopiiooT/3ieyhBcv72Dr6bHMx?=
 =?us-ascii?Q?QvVGgOGSO/MKFJL2ef9dm3AUjPGebxS48ae+0KKzila/O5An9F2gNeUKhPxX?=
 =?us-ascii?Q?Awds50PtsO/ehsjnSpROzdUqnx6By/H2n6L5mXUME+bJ0kazKRKMIrMGtQaG?=
 =?us-ascii?Q?cTi+u6nmA2bA1MFxW6dC/ycMVGwoq4DHUYRSxrOB7G8n8XJ9JitJlUn8GY6C?=
 =?us-ascii?Q?kYFdJsC0MsiDV28UtLrgjJanL602PLfSh7bhRSkU/a9obB6mt0YRXDsyCHk5?=
 =?us-ascii?Q?tV/AIKG74J6IUftM+zsRqvsnpG3iKi4l/w2ZmqpH2MhVKNV/2uTsTX/6rGWx?=
 =?us-ascii?Q?150cYA/ICwkVzjsX2dsLl7z+FPZgNSIq4imduS0S9os8lHoCcjABcG8xVIlS?=
 =?us-ascii?Q?DfkJ24xy/5rlPe6rqw+j1c2+cE82BgL6t+mKZFuX/YCVc5igQePJaGAadr4w?=
 =?us-ascii?Q?dw7PSO4KxC9L8cKfCDbA+PfPt/TaT9hnPzyh6Ypb13yuqMxqychC5DCWqOHa?=
 =?us-ascii?Q?96hPHEHMkBgkrX7wJALiOy1CbyMsKC/yhGwdfl2WkZkUAim8U5Fx+G5xvaSw?=
 =?us-ascii?Q?/wqQxpD71w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c448e3-1414-4d86-ff8b-08de79f35ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 13:38:47.1507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGge/sibMjnp8EtUFiJjWh0HNvgFdA3sLg/BUhY6G/Xf8exbFEuUDs3t0/7SQrHa01UFis1bYvR+sQO2IOwB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 13:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232381

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-6.0_M2.r=
c3. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw

Runtime auto test for following platforms:

1. MinnowBoard Turbot - 32bit
2. Alder Lake-S
3. Meteor Lake-P
4. Arrow lake
5. Bartlett lake-S
6. Amston lake
7. Twin lake
8. Beaglebone
9. BeaglePlay



ETA for completion: 11/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 02 March 2026 17:09
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0_M2.rc3)


    A build flagged for QA (yocto-6.0_M2.rc3) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0_M2.rc3


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3316

    Build hash information:=20

    bitbake: bc8be83aef0a6de85cd33a6f132f281d518594f7
meta-agl: c1761e898d7fca3d8438e9b010eaf234f94fa407
meta-arm: b00fe8862bc31cd4b6f0299b6a2edb244f19487a
meta-aws: b570577bf3ae3752e27bac15faf8733e45a01360
meta-clang: cf20f8bd1366d41094c945597b95dd746e87b871
meta-intel: b6c23896d3eee0f925cbe189ff1e67b3c4953353
meta-mingw: 11666fce6a3cc98bcff6fe2c6bdd9e48faf03767
meta-openembedded: 6ba45c1f94e1c2015df940ec9efcd4568346df56
meta-qcom: 1a7b6b0363fa75232d46ffb9fd706b9539872e10
meta-virtualization: 506d5af230f0b41809dfe754e84d5611b75c6585
meta-yocto: f3b63d0d6882af61020bd6f7150fae68a0322f63
oecore: be8cdcf13a658e9e81ff2f7b71d1c8c37a920ce7
yocto-docs: d97cfeaa55ed42722998d3313c1857aa377f6881


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#666): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/666
Mute This Topic: https://lists.yoctoproject.org/mt/118091755/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



