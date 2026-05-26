Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2725CD5BD2
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 11:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34625.1779794342680714146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 04:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=F57Mq+I9;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779794342; x=1811330342;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6ELtu0XYu8pqi0lyYRql8yX1m7ml/M4XaWaoQWfQxYA=;
  b=F57Mq+I9vYUYFkUH5DxLVxyLFeBAhwth9rHmtaB0E+KL3lWWB+YuTJR8
   xBMcA/66CYNUmXfJgikYaEeGMZUcORd/Nh02eJM8FhU9AL8k+wfCA+ZlI
   6OZstUVgnh67dQLSW8quxOe1yX2Np4AsY53+RXegj3Y5w0wMWgb9uYKx8
   mkYJg05uxttl84d3b1ooug6i/gsEGSr1eH5Symj0q6C+HDUsRjESg4Juv
   PLFUDVnYTIlaQFSV/nf75DDUZmN4qIUQuAiTb6jRKShoQdplnEmPM1Zyc
   IUj0XomKgB3/x96iA1p89706eQLbpXIS85gKKdXDcU0YwRaxsGs4cwB7d
   w==;
X-CSE-ConnectionGUID: yWsENZvnSqO9Qwq29vFp4g==
X-CSE-MsgGUID: HKgRFun4TIa45+eT/n7pFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80661437"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80661437"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:19:01 -0700
X-CSE-ConnectionGUID: lqcdFQswQiuPGGBI29I0Gg==
X-CSE-MsgGUID: hwumwID0RFi35ZkHj6NKwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="241953194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:19:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:19:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 04:19:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVttHxp47HoEwvpqCardLiLzwgfXQbtcpXc4ED4ICVRmPaUZRtHHtjPHNH/xOzeKIs8gzK3W98zOSI0fd/8xYz+x6rw0wUpKt4frjMtDEiumdv1HVRfz9sTWF1eOAXbu3JltyDG3CNXX+2P247hdzTGR+VPJ5i0FU1Qd6Kqac6St7m3n8B20TGjpXOjA/s0ljaWjvIupxf8VgD/egFCI9AI0FZLGXkJT5XQaUckW7R4AWBNlvDKQWBKjpsa5yr8RRClyFxHGobJLMkoy2jiVB7VnmjwGHa6lVFXi0liesUTYlN6Bif0uI6+by1nbTS0ZqmHpvw7dLZqn+AsMgww0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaZflo5EOSE19sshcOUoY0EFw0KefPGgRV2zCZa0q4A=;
 b=f2eO/ZxO22BS7iywkzwtr+qCQhZ0XU2FWdIvP7gKJ59BT4C8jSH45ckKhnDCjH7hPH4PDgWjtOMtzEo+HYPZ81/rxUIxWzIBeS5sPE7Dqkkla1s1OnhrBi3jbCLmsWE/XaVtUoM4vnuETNlkj83WbIEEJsf8zNPukX+91PxU+oOFxHDA/HOwOK9UlT6g4QFjsNQv1MqGkYBXMsNEqNQ1zj7JZzknAW7DhB59Ga4WhHUSG9yKjOoBkWJRs3i5So9HYQqBKKNrvDEk/veXKPUSLrfqTM5LFWN2iALnuR5nVGtxDwwRWry5tk8wjrtuwN/a8EyusNXik7N4mHkF9kTfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9)
 by DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 11:18:58 +0000
Received: from PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9]) by PH7PR11MB7027.namprd11.prod.outlook.com
 ([fe80::711a:ca91:859a:11d9%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 11:18:58 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Mailing list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.1.rc4)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.1.rc4)
Thread-Index: AQHc6X6Nr83hBuQqZk6BnfFzgxEngLYgKbxw
Date: Tue, 26 May 2026 11:18:58 +0000
Message-ID: <PH7PR11MB7027119A069EDE8223011FB2F40B2@PH7PR11MB7027.namprd11.prod.outlook.com>
References: <0101019e4cff17e6-5c625f77-2121-4c24-ac64-423227cf3775-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019e4cff17e6-5c625f77-2121-4c24-ac64-423227cf3775-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7027:EE_|DM4PR11MB7183:EE_
x-ms-office365-filtering-correlation-id: 9c49a4ca-dd7e-453b-b8db-08debb1894c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|38070700021|56012099003|22082099003|18002099003|6133799003|11063799006;
x-microsoft-antispam-message-info: lGZrrlDviGZPyXcWiUNVras2aNR+nSz19hf6uynZEDIMEB4MemeqPHfXfUGD63+EJPOAWv3Tc+/kMxWITkDHa3Mag32nWpl/feaEWu2KhtRHvGLpm5ai6122Fip9Vn7cxh0CAVLRoGO4fHNZwCKEisNEq/KHJn2jB6jhRfhH6OnUuxIiEyH/Cvz6A9Ov9MYcJ4sMgcOnat2f9DFs8HoK/Q+2SH8WxJmUmGIse1/025w3wFsZe8Egn1EyKGO7HyjuUew4Rw/byhLpj7uNNPKqRUhMrU1xpaqVDwvOgO/M/TyVxfqqq2d25KhpkpohNtTs1KlLj/f2euxGjpfthE2LVF09a3rVVsf7MyyJRZ7dS2e8grpxE9JGsNSanNRxrB0CqPoJCBanB1/Y/GE3eV4tgCO++ZHvt/VHVXXbnRiIgMe8A/HhYAxYqpSHSSxg6NHhyPoileCDLjLctRBXmmZFO6r75yeQrndRaFlh4k57NyM1fplLI7uWcEZ9w+PZXnim8T5X/HLykAEvCGlXsu8IfyMBof5kVGo6MgdccAMqebigR5Wxxaayt7p29v8tjtEYxvxATpn4E/RWZjUQCGbdit4UBi/Hy4QRmgmmMQcSR9Qo/hKozgzTBni3d9EELPQEpP5pUoiNs5utapZhfY+HWFSSKrXXkRcAfJ2/axZS5wfDVYhHNsRL+GYFlvKef6HZJz5dCrNtrv3XVKknfxbBMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7027.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(38070700021)(56012099003)(22082099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?veSNDGDtij3qqJWpEjwxF/S5+Pf8QB9QebsgMJMNkoJgmQkEkR5L7YCGBxqj?=
 =?us-ascii?Q?hhIGit5qLQpcNuL6pCsBX9X1el06ZF3Y7Y62tGmUWp0o2sSvAkaWjsEAh6JJ?=
 =?us-ascii?Q?wkdAlAmIFyDyPgDlfTS/Q4XfNdcbbUQ+GnBmwyZA7heKKt8eY8MjsUr74XQt?=
 =?us-ascii?Q?NTzqA2ownq82sSe9BImYmSiuJHwZ0nflEZFEKcRMElsSG7F1ShJcy8ssEqms?=
 =?us-ascii?Q?K1vZiGaZqTsn4+YwaZDDpStNcGHFBGw8V3tFSyKwtPst+OB7zpo9E3jz8WVc?=
 =?us-ascii?Q?Y1ekYFHL/bcHHK1c9B/8awLB0ew4PVGqCk8sV6IbMs2/YZI/fnY8ZxgULmNR?=
 =?us-ascii?Q?IoGqewBSwgTPuiOHUX3iu3YgzxaMnJWd+omgM1rOmv3rmoZTIErn2HW4N9s5?=
 =?us-ascii?Q?ITMwLl9Y0DcCzPTRMAdf637/6B/PsFmTxu4Ndtdkocr/r20e5SuP5A9RMhfG?=
 =?us-ascii?Q?3uOQAPRWpMZsSg20lEjKDXLeF2DpCagXUuXr8HEufpGVCwJ1bhIW+1Ob9nvz?=
 =?us-ascii?Q?O8EySnJ0r/1vAtTjxo3UWwHlQugcV/Ce3DcuIyw9PKdmQ4C9hw86Tte/yL7Y?=
 =?us-ascii?Q?Z6fHGD48FkwvhWm1c9Zf7RBMs11+EqZsiSaVv80MmbgPkJOuR0B6TmIma40C?=
 =?us-ascii?Q?0mr1kfPh5qveAxyqdR4fw/a1reFNujKAv9iDvF+OaFiEsaLvbC7pYSZqliiT?=
 =?us-ascii?Q?Y12FgDJSShd4UswnZT/30rJxm6L9e3mA/rA8QZc5+KcfvSLb1NKmNpGHuIvC?=
 =?us-ascii?Q?mWT8pRyF1KUsX+LX03fTCD2fniqB7bwMdgHwdOBE9D6jemnEycAOpKmEbp3A?=
 =?us-ascii?Q?EQwIHkurJWSJzb9T5bAVbn8Kdeuv7jrRWIJn3c2jsC6f+9xhouSoQ5OQsqYn?=
 =?us-ascii?Q?9fNitVabZ7T6/Zzro/76vg/nizRfEoiQ7dDa1QJUge/xiqwrvbJkj4Sq3z7x?=
 =?us-ascii?Q?VYN5Cxw7TW0VYC6G2y0Cu6ILwZ0eJle4z57dPY2KwLd3OV6c1w9Wxmxuo85p?=
 =?us-ascii?Q?vwIWX25AMOsqAwRO2IXXkv1CLlwI3COqIM0MbC9WDwKNEZveQmMNmD9YMK3a?=
 =?us-ascii?Q?5ixiYTjFQOZHYR09mRfGnltlDiQyY8MtXJ6Ct/h8oVYy+ZpC0Y7YHN0wGRl2?=
 =?us-ascii?Q?Lt0/+xB6phPcbXtZnrxs97BKtv4veQJfzeIFN8hNP4+m1ZtFHXJqXmz/0Yyd?=
 =?us-ascii?Q?lKKcrwz+fjdb9JwNwCPHZk/uIrIlemMFRM/HfipGrDjVbFgmy/R+wlSsov0S?=
 =?us-ascii?Q?4kjfUsMeBUfTcMuQNzT/li3bHWQbT/8kzNl3dFAK4ftAPEKncR7NiQnqp7Ix?=
 =?us-ascii?Q?G4Ls19slOBMczFHaAHJP8niK6ZiV+EfatdX73mN6kz3nwxFzzX9+cvZKP/yG?=
 =?us-ascii?Q?WEkVkBhylT0V2fxTUIIl8FcCYXZgd9zg1fxIUPNUNdCT9zJ2leRTZDDjaclQ?=
 =?us-ascii?Q?Zbap63ddEcX3O4Jpu4FcPwA7ziDVISANqNppjkADDczFZkTwHhtuo/RRhXB+?=
 =?us-ascii?Q?0jjnFxWvSi/tWz3b5AozBK0uvfJdsuMFvl56DuOFNHe17ujR2kY7rqRSfEly?=
 =?us-ascii?Q?VnTuoXbF5wt+orVdaHXi/Lt+vOBYtrIVRlbefcxHrxuGNcCka3C87jNcwitk?=
 =?us-ascii?Q?IvfoedW7riDXH/qZTAZ85WbR0yknBl80oWnIuJZNzzRSutbZcDlR1RZCPvv5?=
 =?us-ascii?Q?5vv/JyJZ9X46nTASPim9W+Y9uWMFuyjGD12bZROxPLk5ODLAuRXq9A8hhmQY?=
 =?us-ascii?Q?DxfL2zA6+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gt1cdSXfGVAy7Fa5tRqZwowsDfa7R0HQT7xI7NwuK5AWbiFKIQp+RUGO9J3dWnpCJaiH6oDM8CVUiqHmNOlpfdZbhwXJtS/3rjXiYRAEFK4/XvMKNoQ8JkfdoxwapKheow4ceIy0GjHqf9zujUa71UJDFrsHXIuhLWvP3OdpsKFgHgfW88nfct6Bt8QEycS0MeyOfn+0h3gg1RemWVIQe6ClVTmTDG7OIuHDlLsHRl4yiu+5w7TliiUjLPcrG88dzsdMUhmrel9rXCrdzS6WPppgFCCqnKi1+B0Z5f89Hkr2hDyP0YtINfCvSK8SE7OW6830plOFbYFeCr95wBx98w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7027.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c49a4ca-dd7e-453b-b8db-08debb1894c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 11:18:58.1828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2xjCZxtDDpF05ZeKM+MfB33nPqyeTgqABX2Q/n/BYWDfz1W5CQQdINyKDPdRkDHFRZg4uNysivot69o7Gp0JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7183
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 11:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237597

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-6.0.1.rc=
4. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

Alder Lake
Panther Lake
Arrow lake
Bartlett lake-S
Amston lake
Twin lake
Beaglebone
BeaglePlay


ETA for completion: 8/06/2026.


Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 22 May 2026 05:34
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.1.rc4)


    A build flagged for QA (yocto-6.0.1.rc4) was completed on the autobuild=
er and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.1.rc4


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3859

    Build hash information:=20

    bitbake: 22021758e66737bcf68dfd2b74adc6a0cb1d42d9
meta-agl: a0e79e40abd8a48e1e2256e447db56ffad21b463
meta-arm: 052c2cf333ecf16fc2ded4c5d09749ebaff8c0c5
meta-aws: 8bc16e7bb3fa0eee9a96f0d93fdac0b2fd978933
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: 55e0ff278f7040dff5e453c509357820e8ce4c9b
meta-mingw: a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
meta-openembedded: 9af4488d46cb4fd4c0d2d64820c86225ebd6ac71
meta-qcom: 531d7c4f5225aa88f23826c0746638efea24665c
meta-virtualization: e1bdfe90563487f0a3253cd4b0d5bb7fa5194d83
meta-yocto: 8251bdad5fda780a000fb41e6eda82eadf0fa39e
oecore: 06dd66e6220e5ce4ed4b9af4d8231ae5f0a8ce80
yocto-docs: 7ac955621b36a221126cd40f12c41fa98c213a24


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#712): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/712
Mute This Topic: https://lists.yoctoproject.org/mt/119434374/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



