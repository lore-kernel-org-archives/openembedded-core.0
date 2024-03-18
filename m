Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9BDC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 04:12:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by mx.groups.io with SMTP id smtpd.web11.35456.1710735133437247166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 21:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jc0eDOXd;
 spf=pass (domain: intel.com, ip: 192.198.163.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710735134; x=1742271134;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Iz+D2STLk/EWPkW6E+L2FDyy7FzSbEdXkpvQ7HeWW+M=;
  b=jc0eDOXdjW/PKkYpPF+lCXo06fNZXhUMQ10A/O58ZoEY/u551MU0QXmw
   rXfrCNL1GbUm/YBq3GyT82qjGyK6YRRdRaHM9zVt/MBSF05RppTdnG2S2
   RSHBdxqG+oggYheIn9wesklLbKeHjBXsq+RgIVb9De156j6TifRklScvK
   jyXfabEJukyU++UPwoxZt2PXyoqbaxWHJV2f1MhuAmiz4zUlPU9ofv1xl
   QLLuSXjbBaIOIXBALY2WR/blc2f2OF9wuyjGtz6EY5roVfopcVp0CPWDm
   O7dXa1Dw2dkhxN8nQK6SQ+Hk0Xt/souQKaDUFBemWSr9XPg0yeMPaALqD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="8471541"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="8471541"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 21:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="17938334"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Mar 2024 21:12:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Mar 2024 21:12:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Mar 2024 21:12:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Mar 2024 21:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aeti61dNV2rQMRVqm7fom2gOPgFqFPSC/OznTc4f7X4SCDZhsK4YeBqnHoIpSE0PWRD3uv2v0pzxFqJtrmcpWQTP4QkluIdynI9E05JM2XUoalcdUyWEVpWavLN/Kd+DMVh9++hHSXbLHIBLAUXCUcSMETwyxZ96OKJriIul5yYDqthwRTyfFX24f/ijO/l6MPBz8UPN+C9Ko7AMs9hZk5CtIzLU/Of4pDqEvByw+aiiH+5BiDYw84FFzV6h/Rb5BRYihmQB4Do2wzKeiUcavhtgn2ld0Vdk7ShUZM3SS3grgDC+NlU1zPGD/GarvmPcuN9qxemnRgrgOGeNxRQFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaahSRGLk5+wU2NheZxPRi4wl2UH/kl1hhZ3dw54C3c=;
 b=m5IAdnvcNrxYnBkxnjoItGW3GNDFZDE+6zbdks8q9REJxlXcSkAn/QoSbL181OEbYPgi+Ok75j9WJaJI9yXnufGTmd5pxn3ZP5mcytU3UDZVAx1fV5Uhn2UectwHLy4SOzMbfYfPahJL0f5TTf4+NX5/czwg4irN1yGzrQh21TqunMNzjb4VmrNL6Ss5JH7oX2qFmZPjCmsqFXXhIZIerw9oUf+zkbLF/8U/lghfZHT7bZGo5Z2Tx8m6C2Qycz4d9nO5NajHZJ24Y7LfweeIGT+7tKvhcjqL23Cp/Pb9stsMxJ3xUMiwlPtRQ7fp42uZONIX9EjbUXRU+GfROxjnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB5945.namprd11.prod.outlook.com (2603:10b6:806:239::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 04:12:09 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::9df0:5c24:3b9b:1cfe%6]) with mapi id 15.20.7409.009; Mon, 18 Mar 2024
 04:12:09 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0_M3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0_M3.rc1)
Thread-Index: AQHacWy1FGk9g6ok9UOWbRuvvKhOJ7E88XjA
Date: Mon, 18 Mar 2024 04:12:09 +0000
Message-ID: <DM4PR11MB7760901039A57B52D268C9ABA12D2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018e1eaa2d45-070e35e2-d7ce-4363-84c5-e31d6b513774-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018e1eaa2d45-070e35e2-d7ce-4363-84c5-e31d6b513774-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB5945:EE_
x-ms-office365-filtering-correlation-id: ec06da1f-149e-4d33-6054-08dc47019488
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PoA6Tet8zT7mU2KZxTp0Jf4RBLoXN6QyLd2+JlUy4xfImVo5a16BbDi4v4PyN+u9x3nXCmJefjGeGJl1i1mRv4b88zXghiaNy32O3+v6zmmIErp0Mc+zPRIU58F5j7WBFm1i7XwMl+dfpjFh3/1cmFrIXx5bOtVeEZQ3ahDbvqFD0qij3prgRACZYiVaqxxvmDxsSTnJo6JIzw2KUW6TYlZyS65KJ5qb86I6tJogiiiWaU5GRrhfu3hZjJxj5J+Td6vjJ7Lq80Fc2N3B87WhGJXyEMSWUZnjrd4noDhNkgL3vMjg6Y2Fkg4iIKO54uLGaV4I13ax2NJ7xZxyY3fF+OKPxuS6UbGv8+4n/6kfHEhTLSo4drky5dDD9aQn2pLGXVOacOdlatKW/xB8gcf10o0/8CppU3JKJokctQSZ+nJ0rrZq25nuZWTctPFD82dqXCAEfmPVrnlPp2UziYevvvOPlOIdw08FhgkQaowdPwISUhu23HKO+A/PCNtJJDUehqH3G34Ns8MNrF0iGT5yxlVH3yhiMD8aUvG6TIeONT4QM3HOjqCkGehkGmKWQ+EwNr1cTl3Fy6Ly7wrg628GeOr7SH2szoHxCsAeus12+3aJRkUP5+qyofiHPh6OvKrtiI80/Lt7APn0ZRLDOQFf87/eKgw7my291pZTATIUUkkjB6fgv/lQsrBzOhr5ccYv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kIX9scrXt9vWvtY1bOi9YSwF2ltdim3ypoAa5S00TvuvhKAce8ZxEr8+0+ix?=
 =?us-ascii?Q?Dou9hai/BeGWWMEmc31xowzWeEjy+XhvRsGEZ5ggMigESFGR6rOxGPE1z1Gz?=
 =?us-ascii?Q?/cyr6STpAshMsqFlp0+hXxujDNHk/SA0Y0QG5nSqjjqt6YnkfIQUX+QdDMX4?=
 =?us-ascii?Q?s+Wzr5RAc/L4GMQ2CkfL2C/Ee6MSWcGOrtLqxGjbuWof2q0QjH61Ldg9vcnk?=
 =?us-ascii?Q?XzKYMwEyTj0F8TKMOA7el6cuoriybcDPW5BN3hYAABbXl8KIOgxQNvQ1Mj4E?=
 =?us-ascii?Q?PpQuGH/2fL7JeB/s7FtZuO5Dj8F4uTBf5nebkQmR1N0fli0xAJ7SN8TWqOVj?=
 =?us-ascii?Q?UHSNFY+DqwLgjGccF6KNVCzyRbr6MIVo6MfC28qxsIuPlg8b3JBrVGfqHC96?=
 =?us-ascii?Q?SM0fjcH1byy3GJt8y7yUiwFmbx5D72KK8ujg1EtrX3GqnuYk0q3p11JAxyob?=
 =?us-ascii?Q?/uFoKhpFks5vNwvo4P/KUTSJjjh5uB5rHwRQKZe4CstqFdN3zkBDaobMSp7S?=
 =?us-ascii?Q?IlG4AOVvdqWgIdeo+LTrsCRkZqdmDlGFOYBQFVafxpYsPP4Gyo8Z1BEZpO22?=
 =?us-ascii?Q?YzkljuPZikB7g7p296JX2XvP2Xm1uDd4jy0FOa1IZI/SgTeHnZ8ueHHuBkWf?=
 =?us-ascii?Q?6wQPP/nNj/743ISndOIUUsUcZu2favySVLVX5tEhDwV5z2u0uTvQKyT0vsgw?=
 =?us-ascii?Q?r8CvBZEdxH08AQrqzAeNZO4C806E2py3Y2EHgKvAy6S3fH1zjmFWqRCLhYDJ?=
 =?us-ascii?Q?cvFL0dL0wvEmZdPlmxMoy8OLtgPU7NtH5eNP+dgZJDC5fRhm95J2qFI2ZzTh?=
 =?us-ascii?Q?aUzl/Iv52soXtYOvoWAiQ1HKTvYTBeiTQf/2SV03WhitNRLoaZcm1WYVJMMh?=
 =?us-ascii?Q?rmUh2brDopfdev/qX+jiwhGXK0pAJg3vlel5f/3HkkdGEvFOKGa7SE3JqG20?=
 =?us-ascii?Q?/hqk0y1hPLTQI0+MXNm3+gMn5A6Qi+lt54KjTvqvFs9uyVYCQDL9BjKpqKwn?=
 =?us-ascii?Q?3fHuKTmuKZURl+G355PwuOD6R/qpF69SBqWG9qLaYewag0dRaKKWrM7VBbf6?=
 =?us-ascii?Q?ews5PglZQs24EkZS3hB5INdqe4bDByOnYZnoV4ksEbccWbuiBMwizxquPcm0?=
 =?us-ascii?Q?tCiq8Eaxl8kZpBtqqKovwAdABXhfluKgLsdnZJMTqdVnoZ+SbVN2ZmvET79h?=
 =?us-ascii?Q?UUrW7EwJmAXyeqt4s458CeKkskKBEPtDdKMuqoAPwHUsTT6Lr3t2McqRnf3n?=
 =?us-ascii?Q?9k6ZdQSnDFRAOymBLqkYheNEjzz8El/H683ZCmeUevTRNLBoHgcvYWhmcTWK?=
 =?us-ascii?Q?MNpxP3LcjE/a0L+lggQxKTt176t8hvrpGoNQKP2EHAR3W+zzf4blxqFRDrFO?=
 =?us-ascii?Q?YPW4oxKUUXHJ2KmCYMBGy1r3rNJcRV72eh1uB2n3mu2JlZz1fQost6NnVAEI?=
 =?us-ascii?Q?NlvEf7GAs0m7sLtss5Bx1yrjnrcIlEJCivTnYd4In/E6xBdiyilt5uSGrJVh?=
 =?us-ascii?Q?yYYiiWZGCEH5yi57eWNEvW3xgKdDkUpUGZIRrRT3zVNDHa5+ZPmwenYp4ZEg?=
 =?us-ascii?Q?P70y+mWRBPJ3iKy4ohY/2rBTofw/vayAwUjfo5b0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec06da1f-149e-4d33-6054-08dc47019488
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 04:12:09.1655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5XgOtAyncPFxJlWn1K+GtGKHJUs0h3E/X4AHeVzjwtlFstCDTqEhcNQzQNQBaBT+LNw2OasXd0PFC1BKsBhog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5945
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 04:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197291

Hi All,
=20
QA for yocto-5.0_M3.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
A new bug was found: Bug 15440 - [5.0 M3 RC1] Fail to start matchbox-deskto=
p on beaglebone
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15440)


Thanks,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Friday, March 8, 2024 11:24 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0_M3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0_M3.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0_M3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6661
>=20
>     Build hash information:
>=20
>     bitbake: 0a33b560233b983456178541603ab96fea22238b
> meta-agl: 403545c205c30df24e39ee03d6f188aca998b3f7
> meta-arm: aba9250494f62360c1ec8021f81922c005d92b82
> meta-aws: eb351722d71f5de128455b9f5bfdabfce5d2c725
> meta-clang: eebe4ff2e539f3ffb01c5060cc4ca8b226ea8b52
> meta-intel: 9ed54a13803e42ca40589d6ce02c76f3162f6b73
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: a0237019f5b5c003fd0c6fd4486859214e24be01
> meta-virtualization: e7f9c2dd2f9f4ac95942b69c05ed8f5d0494edbf
> oecore: bc793fa9d1fe24c102d91e97b7002b6e637cbfa5
> poky: b5624ee5643d881afa004571a096a189ab5389b5
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

