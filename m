Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02733FD88EB
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:22:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12618.1773199369910987818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 20:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hBFgW8TC;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773199371; x=1804735371;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8NyMu1n0iqpHNfGZOCs5n/uk5U0rCb2pX3Ny9E28FDg=;
  b=hBFgW8TCSj1uozegNp1JQKRp+ADdVQLMRwo2znprgPG9TgJp7bJoJ7uW
   CPs+n2GgxBfpzua6SvvrwiEa0HgSV6cmFBdI7OCsqryLxSnghMCpfO89r
   WVqMOcm3TPnmvuXPqyu+L2c6eM3SiqFOjpRvWVIuMqvMizsUQx9prQDmS
   VGpsgclEdismcQDShh9gc0yag3zUvgntOkq5LWd8mm1OtQsApBvynuK7g
   YNPeLMDO+Pl8RoymyIbkXa5IIpkrGawQF4N+oAP3ajnenuUoWVnNWFupS
   DjMLUywVa3hP2hZV/ZDybiC9yeNCn50IqiN5TuWvfaGi5QMNkz/LUthpZ
   A==;
X-CSE-ConnectionGUID: dQ/bGgOlQwuGrRJhELYdjQ==
X-CSE-MsgGUID: V0nDPfMqTIGg2DI+tpxzFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74232992"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74232992"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:22:50 -0700
X-CSE-ConnectionGUID: vTdUZupITRuckZ+YcqMuxw==
X-CSE-MsgGUID: wZI9EFHcQKSCpCCDG5tn6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217032989"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 20:22:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 20:22:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 20:22:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 20:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBI+P25iC1rxWujBEPwGoUY/gVU3mZ3QdWqICSF8SoJDRszcsSt6q/wZjbLMxn9BgWCBI4XEZqheWxlHTP/Pq7HPetGsH/8Oh6/U6jZTnnaxlcdJ7WEMMJJkCzjrgoMBFbE0xVvU2q+H689awB2/2bprj8Bxi23hPd3gC4qLV+ROH97kle0uJn7pNMLliD4BBm9e5JI1FQEsqZ+m2MkyQSUVy9kDrcHY4lPc/9nU2zY+YH2+y/JGDRWXkmo+sou2bQMD5CaEOcn43lnWqiW3onGq19FkZmb5tJZqbNw/TOaEH75rdy7z3RKptwMWUb4Qbf/J1C/VIR7DDh+zNXDoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXBJ2hWPgxNUTrkanmHKOTmY6CgGiFlXmphAeqGOTnA=;
 b=sPrxnYl9gkF+4bj1zkslOH7rLS9Y0YblOBEju+VO+1rY4vJlJG7fU791ellnmLCPFZyvD4PpaIxN4EGtiEhf+JkvfeFP40ygbSroMs8BX9KUiB/2LM6SPJ1p9UDDlEFrFC6im4/+D87IUjDyQQVCzB7BuXxDVap+nVihTDl9WnHdYpmFCuK0aVgxHtdO/HUo3+8hBf4Bi8P2qowI5wcJzgD1ZVGItv+w85pGsxu7Dg6vrD8vnChDabfZNDSOdoPYXAdx1W04W15dVxCaLKyUWuyLemFDXv/OumrdxTB5PghzPkmO263iJpHg9fNRAMbfJZ1l77MJEyTlG3HMvYXVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 03:22:45 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 03:22:45 +0000
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
Thread-Index: AQHcqjkn9HD6Y+57AkaJYCNeqkgZd7WeY1KggApUfRA=
Date: Wed, 11 Mar 2026 03:22:45 +0000
Message-ID: <SN7PR11MB7018CCC9244B06A3427B9C22F447A@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019cae57f45a-ae8dfaae-ad81-4664-9a28-1121fc1fbcf0-000000@us-west-2.amazonses.com>
 <1899A6FC57AA4CBF.971272@lists.yoctoproject.org>
In-Reply-To: <1899A6FC57AA4CBF.971272@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|IA1PR11MB6242:EE_
x-ms-office365-filtering-correlation-id: 979a56db-f497-4fac-fb43-08de7f1d76cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700021|22082099003|18002099003|56012099003|7053199007|7142099003;
x-microsoft-antispam-message-info: SaXpMQPXMM9Ompe/a45U2JUnKZLIaEsV0iIVCzGZ37C7/6AOjg74SkIKmJQ3fShVKkQ9z6/lNSuNbh549wtHKRvdgVtZIaM4iVL77AXP67D1V08513dSYockP2BTFqAmXCBoe5YVkFwFTPQNUftF6kyRUjymI5MR+ND0BMEIl48sDr0fVdndmu91X2eASBbGsIe0iLKu27QHHiIUn+2djaY5E/cIsQqaTJPxB7zjwpCTtr27S1t5ROUGrnO8GEKruT+ALnk4m2R25sI2gGVLoldsN/H7gLF86wD1aWcpKArQcAqOD51mz6RieiAGuPWjrAyfQQd9XYG9ltVorEmUcPz1BQyaegYzY4NuHXeVyUCqYqOMluaFFgVcX0jeLYRGqQtK62FUAz/0acyDYHLfmn7sqEH034oqlEYqRjg44GoBPqRSx1sPDbAclxFgerkP4K0WKGSfTx6j9nToH9PAJHhbjmxbXiHhapRtR7ESTRv5vB2TpoJWDPif3Gciaw8U6K462Oq0v0xemFkXjVy/HL54VqCaWl0pSz/ElUJVFwKCJElLxm78k+vBBo8UHgRzSPcPujyc+1Nflrr27T3yUiduxDxeNOVWIonFnyZNxUGYX2xbRm05p7czAf0QGUj5+ljkNH5Bowc8WJRSpNpMyl/myoldaYuaxlkOjr//EKzcpvPLkslM9dABWPXXTdZiXn/m01DrJkBDREhvZhtLRPU4z4HJzXvdcdd5iESPxaRCjO2c+W12vpQaISfP32IR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003)(7053199007)(7142099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KpG/YPCoNKMwzWoZ2goHHoS3vW6u3U2li5w0wRsrcGV3unUpO+viROheZRCd?=
 =?us-ascii?Q?xf+ooMRzEgi+AJc1mRR7E29u7vehReUEcu2u/QtWKUhKKT9AZ+FQXyqZ8W+j?=
 =?us-ascii?Q?mNcVup0F51/AAICEKVUYjxXvTDuM17jliQPZAvERWejy6nCD+JOF+hnfDJXc?=
 =?us-ascii?Q?qRFOWnFSOi+PvPWq2At6OKLjMpl8WO8PFQHcKAEAYuTguEHFTaYr4GHeFupo?=
 =?us-ascii?Q?ImZ25tYC9rkBsgpqziQNu+jL0X6hM8OyqfcZJy0I6DzSP3cCRw5+6fdKF+27?=
 =?us-ascii?Q?Pz9+s6Y1EIrKt5NusO9XG13De46ynVN150Tr9klf/ZmxOYa1bSKEMlB3abio?=
 =?us-ascii?Q?mgWCtMprthgUdaIB6v89XrVOOZyIjubW9GY96EXlAj14yLVOTWIxq9GmMkOX?=
 =?us-ascii?Q?2FtwGBvhXBP0j2DUuJfPoKUxrJSeMq882orAUeQOocAlv/QG5ogZIMBaqJ7o?=
 =?us-ascii?Q?jVFjFMgHzzfDKLHgc6UZqISkS9KeNMAuKzB2ykiQgvSKlg4BG/4HGrE9d07P?=
 =?us-ascii?Q?J8LEGbapEDnMYT9Jee17Z+OIa/FTzra9gm/eYiwZ0kAP1g6J/itZ2Xq8lka+?=
 =?us-ascii?Q?2WRfKqk7a+PM525WD3rjo/BVCzLt/nSmyV6ZPsGalqYOaclzgvWUBg2S+2SN?=
 =?us-ascii?Q?gZkodU87zfYct/mWjW3x2OP7VeHXWLkGZRGiQvOfvoRsYNZh2VtITJsnlrNe?=
 =?us-ascii?Q?YZSWUjscrxLPUvJPLW0bweGWgKXRkg69rOG+LyqfzBjev7G9t/nMtFj3GiDp?=
 =?us-ascii?Q?WbkRw8putqrt0ir1l6ZTu9duvEaKXVXORs0ctfbETA7brffYMArilZxR2P98?=
 =?us-ascii?Q?BLUngP8w16hWk5hDUpfPyNbtb+AMdZBWGfDsCgxkNrzh0M3e5BT8NosNkPz4?=
 =?us-ascii?Q?RqXhSQUCTCf6F5yOn9HslhhybNefQmoT4XjQUDVEXRQ/EMl5M599pz8tzMUf?=
 =?us-ascii?Q?Gr4iRiN7auUIAIiTLA2fLfIqSFFKpywb0tFM30gnZS4+7bnkEHSiMFX2AyP3?=
 =?us-ascii?Q?rg1hN4boPW1sWMDzS0e2N89TYmjwQmhnlmwnxbQG3Im8BbyQKHSSn1USIDv+?=
 =?us-ascii?Q?88jWM9gHVHNx1bA1kWY0UilwJJOocyezEfqd8xWAn2tgMSdWjqkm+CgHSHcv?=
 =?us-ascii?Q?cXgeokt3vRr0lDTBavvxvzzccmZjLuKwNYAp8KnVbSorpLNN60p5C2AoJEuM?=
 =?us-ascii?Q?mUYk7O2ULy2DHQ8US5y49W7SeXe0VINkfIKd5OyI3exVLGi3PsDD7y7o2tK5?=
 =?us-ascii?Q?NE+jbxCnY9WuMtx5+QCJp+mcn619bTcWbTFKqK1FZQRvZbmuN2KTTgCII145?=
 =?us-ascii?Q?fF2rDAXZdRwlbekSw9XkvUksHGu0RFV9UNa0hjQwsI5E9GJDk+tDaYgUBMp+?=
 =?us-ascii?Q?lJwvSJmCLOkjiQVi5YjCHYAIMp2iPzd5SdE05I827Xy2r+rIch2hFGzM6frd?=
 =?us-ascii?Q?P/JEIlKsiQSDCwP9GKJ3BpMeONP2spv00vYoz7fy9ThW9JyeSXeA6YXmErRi?=
 =?us-ascii?Q?01wvH97aj5rU4SXSJYWy+3LsKV4yMp8KuJIMHl/V9RzEqpg1J38zvBGjItGP?=
 =?us-ascii?Q?xh1+voTLXxZVu2iq5yGSUGW7NYZrmhFk8fb4h2Im1WQAtKkpEYJUwABlCoJy?=
 =?us-ascii?Q?p+up0gcgzAuyrZOBesNhA5lWREUkMw76o7Zh53LZB20uEVj7jKPlXxTQY2V+?=
 =?us-ascii?Q?2ZL0vPXftFLpGXzDEnrioHCR0tED69KMM1ejRolZfAwrDRFobEVValFIKOqL?=
 =?us-ascii?Q?LSDedtRA8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: N5Eg0Fg68ZKnsJcu5SgsJyl8mBg6bvHiDFfYwShm27WcII2qHq6zkFRCRZF+iRVWQ4dPAaxKm7J8T2xBL5/keRadsCmb2PbBb9XNn2DTB4PoDY80GqEhMobM8QqNl1nXyShkUaDLK+q7MW+y3eutmXp0L3OG7qFvIamJtp9KyBhq+TFx3gSurxIdRqnoVq5cNJPEWmyNWLoDXH8SRw8X0mVTWC4NK7UEQ7ppGN6ofXya4BmWS86ifrZWBFi+hrXA+HthNWsIn8ic/wezTG5kHXzdI1aFcwhaTxNAoe3YtlhSk0nVwmyDfhgR35KBTzW7e5hDV1t7u7CqkSRo3VzRsA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979a56db-f497-4fac-fb43-08de7f1d76cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 03:22:45.7027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvuChScSL59FlsoP/MRrnB2a5yfVXqg19Yz/FIkDiKzY3dGtxNvfXSCK/0V3LsRV0GRTuFsEjcUO6HfBIlYaeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 03:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232835

Hi All,

QA for yocto-6.0_M2.rc3 is completed. This is the full report for this rele=
ase:=20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults


=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.


Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Ghosh, Debal via lists.yoctoproject.org
Sent: 04 March 2026 19:09
To: qa-build-notification@lists.yoctoproject.org; Yocto-mailing-list <yocto=
@lists.yoctoproject.org>; openembedded-core <openembedded-core@lists.openem=
bedded.org>; Pokybuild User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-6.0_M2.rc3)

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
View/Reply Online (#671): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/671
Mute This Topic: https://lists.yoctoproject.org/mt/118091755/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



