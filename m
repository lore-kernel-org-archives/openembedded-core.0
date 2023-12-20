Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2EC46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 05:46:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.15922.1703051166303628640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 21:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jn5Zmiqt;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703051166; x=1734587166;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=93fzIQPFsbemkJcO0457wed/x626mjSrKjEcfB1oGsA=;
  b=jn5ZmiqtR+DFckyAVj4eJcMaTXGg3sAMts4AWRky4I3vx7HOVrpwUq6p
   FhnuySe/4xoynygRDPYQJOufkWQ48HlaeJiyyeqGzn7OckC553xhdOpvg
   8t+BliRPdMsdqQS3cfysQm0ly9Sms6vslaMXaxpvjj5HB0Tpvw7cOrBg8
   NztQ2/uz4pzK/6ktXDMS/trM4LStfhmsjf5MMmiSF1zJMLtqpeO9vHch6
   EyKvorO5OJEmOISGLA7KqpjyOM/RrsA2qrWfzl2gGoYTvjRZ9WYp6AFVB
   Q4CNv1eNi8K/yrZStkD64372ZWkRxbeUiZoutCD3oQ3OpIANbtnVg48y5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="399599941"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="399599941"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 21:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="805138585"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="805138585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2023 21:46:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 21:46:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 21:46:05 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 21:46:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeEUsofpPLF7x31l3aJVJdbmXvW4OcZ9Y+4Fiv8keouz8pkuvWnPTaXYSs6OfcxhfYcQww9x3px+tzM+GcQzUqN+p6ZtRc8enHfhn1AuZw7m+hUAMjAQ1cIT+E+zqCRiuEWK7Th9CXj8M8H/pmR3iDUxvvqjRQxrXmyPutAeLjFXBu+lQelF50537qdS0UwlqnKr2gYYf8zUeZ3QRqLRu2je5XnrLW0nyNTyHCs8kuy7jIMCaM1zyDcW4dnuobqbUnv2kmY1qSvSsr9+cN+20SDoa4DJ15F8hJQae8zAbYosWaD69aA5syYjDuGyfin/LBSKqFUEsOYx/iWgvmVx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LGHikHC+4rD+7wsJNmLlZINVgBJqghLRltCe8sWw+E=;
 b=IaUNJKmVY8EEH+PiOV0CRK7qMB97VAkdHkZCZXBUEfGY4Yre0fhBV06WckZOKb1dVSCgb/4nZix3S0jXbsU/rP77HsfrE55DkuIR+bxOdbgR66XgbWx9VoTjtsrfPHUBgkpDVEj/v4gURVtraPBEX7BwIiFP0GmsKPz5KIzFD2irFlhEXMzloRj/SG5fvb89EN7QYnX350lXtGZPhJlTjVqK8A/Ovzeu6Blp58kY6KauFoZ1+dBjebQStKHvKsBpujex+IKX+yCtU1kqBn/W1V9dJ2jvgGciAUD2zfJEpObuGkAPc6+Qlk2i4IttJyp4FsVISpFzOrY+2vts0Juebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 05:45:56 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::3230:6041:e9a3:cdac%3]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 05:45:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.15.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.15.rc1)
Thread-Index: AQHaL5KAdzrp6A53ckC5hmzfaP3ptLCxsDfA
Date: Wed, 20 Dec 2023 05:45:56 +0000
Message-ID: <BY5PR11MB4152AD8287278278FE728B3EA196A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018c6f18210f-b2be4f67-b8b5-4e25-8065-8de14c821569-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c6f18210f-b2be4f67-b8b5-4e25-8065-8de14c821569-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY8PR11MB7059:EE_
x-ms-office365-filtering-correlation-id: 821e7e6f-5c04-4f36-2002-08dc011eeff3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dOHc9LwaPzYb+QQMnzNj6MOYsOWs+7Wxd7859pjOQ2z905lK7y+srmtouVtbo6Vaiwe6u1Rgg4CCxtVaKXFY8VjJrIgYhQOTV0OmSPZ1VKLU+rbBmC2JkdxNM9PJQCCWPkshJ8IqBRtDC7ucY1GqYpNqAHXDvf0KkL3eoR9VVMp5uPtup/cJlSEesS2+3qCiC6m+fj8LSvLUfrJejc36Qxywv/MVjv8pb8Xg0vpW6jFtZ8/gnAs3IrGrY/VvYh4rYwqB0mRdleAXPlTU53foJPyRuvyRVvj0EVA9buORSVZgH/bat8AFdMOURmLnSlrpq9s0zmVU8ZcOb6owxQCDfbD5QSZ1oZL1zIuekkjDTqzDFfmSWqE7A4s2zsiQ3F6irklarCmRvsgOo7vy23kE1zfuJdC6O3Yng57RuP7D4DwCuLhqWfIKVFyjbmoM0ri8gywwEvSFoXHNaOzo0mxP61T7a3McDeo33ik0DjoMEOSSbQiUCJKayCBjwSAxgVqqIIprG4chHgO2eAph7wtOhfIpOcm0NxF36XekpdN2dfVKhnQ2pj0vR2krZSJfyD2lYmsPsBgV3OB/nYuWcmcJAB+1G7REl4PMpEJzzrqBOoo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38070700009)(53546011)(316002)(83380400001)(55016003)(66946007)(76116006)(110136005)(64756008)(66446008)(66476007)(5660300002)(66556008)(15650500001)(52536014)(8936002)(8676002)(2906002)(6506007)(71200400001)(7696005)(9686003)(26005)(966005)(478600001)(33656002)(86362001)(41300700001)(82960400001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hwHIwhThns8Q42kdMtJ7D1aWESKm8z+BSBKu9DGWEBvxqsfIqtot53YbEmGr?=
 =?us-ascii?Q?bv4FBJFvCU2X0Q3QVrq26JX3rz68QiaIpylUH4enO4paw0GOK8c31QBlQVjQ?=
 =?us-ascii?Q?wvC3liPLZphDH0B6JbqVsMnUU7DposvdEOt2R8Fq8puOmDJLVcHeHKHSlCoV?=
 =?us-ascii?Q?ytlxJ/UCGyqMimXNP3ybIUltkGeR35zLKqswdqcBOOMh0u1q+r9tIBkOcH3y?=
 =?us-ascii?Q?PuuWnN9dv1VUxLuVigM6thGjdgIvwZBaiH2D3LBsistqu7L8/HYzj/Z8BlqG?=
 =?us-ascii?Q?BZxr+flQTIo54nt+X6pahc5xfsvtVlAXyqLDewwCUd9in3z83kJvBn7xmCCK?=
 =?us-ascii?Q?noVzq1HVpqYw6NPHvx0JrdZbvWsN8K/vkbMJETMpSyNX8AxQvna6iQdHqoCy?=
 =?us-ascii?Q?FuawavbcKXGnbrDL5uyufutaRU68vIXGyk4LasUQKph0ooectAH5X0EcpOM7?=
 =?us-ascii?Q?0cAuwieJAb2DvtvXI+NJxbxsX9UWmepVo6r2gpZgxKGpiFYHCpRwFYu11NfP?=
 =?us-ascii?Q?LM1OrpwvL+uSneHTrkp2skGKjkohN/v/2kujFKYUlPHozH9vIuciUSnH4En5?=
 =?us-ascii?Q?akFZiOnWN2cpFWAUCit46XyooYL5d0QapmfyaGMrFuCRZGTPXF5Y6lU4Xeu1?=
 =?us-ascii?Q?c4rRz/pEVAXpkFKTxddtZH+EuFrUy9223kqRD4MNaHM05eRoGikWbl8G/P9m?=
 =?us-ascii?Q?xf7fPChYafovpcIsIb/cbpH1SxD6XkjBZEsNhQ+AwwZm45dQ9sCHyHPCnH0r?=
 =?us-ascii?Q?jM+E+OQEf341h7iaMIv4CnxOAwDX49oQKRCuQiFNJnzzBHxTZhRYCpcx2vNO?=
 =?us-ascii?Q?KMN9bcqCgh9JGlLkcC8ObWy+VI0Iz49p7u3UMYMa6r9IpFFTg/zy1E1VVEEU?=
 =?us-ascii?Q?hcBVdh2quNyStVUqn3WdcLIRiAwbMKiFzLcBLvqV4b7gDqICJdyhWXwPNpta?=
 =?us-ascii?Q?0wSpC1aCCRqUsveoL/cDmi0MApQFl646MLja2VeTaV7JNQOpIo94pCZmSB7G?=
 =?us-ascii?Q?Ln6OLQ+x6XlJOHW1r7ip0TKtBHis/Mn4euXBuGfYXC99wTtumLjANcLgYMOD?=
 =?us-ascii?Q?9m7Q/eicJcmkkh/HwdCJVG4LO+6PNYw+AXLY8qUbm0u08XcvhoJLrLfmZ1Hj?=
 =?us-ascii?Q?rHJ8n4YQSO58QAv8/SNiLxWY+uEfANZPphPy8tCIRvarWvNQ12lJT+h0igit?=
 =?us-ascii?Q?lX81EgPM5m5vhHLopp+TZb0xnxxT0M4keb/agf8uG6j3fVWljNea5tUxWKYN?=
 =?us-ascii?Q?Q6wCCCWpaxlhgNIUwJB1ft0gcbk1AxjI9MjfFmj1m17pbGriC1yW5lo9dz1C?=
 =?us-ascii?Q?Nd7I4kLF70azrgpoaqdzsn3XF6bbVT7mVLijJQNFQt52BH3Nh/QBngMxjyyO?=
 =?us-ascii?Q?g4XUOR0vOa95eZScjCrESuDfC+XVe7cR+YdYDS3PNH1e0/U6iKRVDkDu9MmD?=
 =?us-ascii?Q?YEI3+uXwjLC99w0ke9VnEgJRHN1+mpzgCYDpiTjh/8z7gDYKrMEbyrmMKFtp?=
 =?us-ascii?Q?N4yyyU04FPbtQWNCLBp34F9YVXuQGV1uUKpID6ksqpYsyXVYeceKEFyDiQOH?=
 =?us-ascii?Q?pXsncvQPtKXOKAoZYQpQgFtlSxzPatJth4V8q563?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821e7e6f-5c04-4f36-2002-08dc011eeff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 05:45:56.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qiU8Mv7QbCmSqiIVk+dt/bgE9KtgFP4ejxc1yBOM1L8+GUnzcGQd+zs94rLytvIMEFI9qLJnyYtFePgKWqUDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 05:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192771

Hi All,
=20
QA for yocto-4.0.15.rc1 is completed. This is the full report for this rele=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Saturday, December 16, 2023 4:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.15.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.15.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.15.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6334
>=20
> Build hash information:
>=20
> bitbake: 42a1c9fe698a03feb34c5bba223c6e6e0350925b
> meta-agl: adf081bab632c0fedfc064b50b953252c8f72be1
> meta-arm: b187fb9232ca0a6b5f8f90b4715958546fc41d73
> meta-aws: f438745ff0e8c4c6b07b4fa66a7bff7881bc0287
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f932ebb2544170f43edd22739f44307809bf8cfb
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 402affcc073db39f782c1ebfd718edd5f11eed4c
> meta-virtualization: 88327090d26955a678c6f8bd2585aad4d802f6c4
> oecore: eea685e1caafd8e8121006d3f8b5d0b8a4f2a933
> poky: 755632c2fcab43aa05cdcfa529727064b045073c
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

