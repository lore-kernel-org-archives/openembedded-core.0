Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C4AD58E7A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:28:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155089.1772436474888715838
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OkxH4JF5;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772436475; x=1803972475;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=577KebWgZTmx0PXEGPz5OfHWpz9Aoy2mF4pAYMJoqwE=;
  b=OkxH4JF5kMZTv1U7EsaKqYw0D/VT22PVVLHIqzoLPs0xdI4MTbwVywjY
   JOL2w2/k4SKTvrcj2MKFHVs2fholrHvHaDGkKI6pd8Z0fpLea+U2brvRX
   m4kQqL6FSB08d/RYILFcuGr81dC3bemGzRy6TVjiqEMJ8plL1NfAqH2KD
   Z/gYWnpe+MT4E7H/1ZnojzqxabvImiiTjLe5tB0a0ZlLIHRYz+srg0lM3
   gF+NXTdPeLpsNl4Gm86oKLHITN9llsnhYiEHWbSYXmucn6z9Ks/ew8WZ4
   3EMBkXdHXVYuaPw6gsVQvpYZEBmQ+A1Hvgb97d9MZ9ZU3nlHehMcVu82/
   Q==;
X-CSE-ConnectionGUID: Fl3APB0xTneiDrShQ6k7vw==
X-CSE-MsgGUID: ERKC4v1CQ1WEOWAiK6Rz+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73304774"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73304774"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 23:27:55 -0800
X-CSE-ConnectionGUID: 0Yc+soxmSEqSH4ZtmOesdQ==
X-CSE-MsgGUID: etisHJPyRFORUYlq2OZK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="220661782"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 23:27:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:27:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 1 Mar 2026 23:27:54 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 1 Mar 2026 23:27:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrJVMztYyoANVOawp844+oEAanDTx2dJjGaOYVvj2vjH78+aiPnMS1z6+OMcau7ZP9IW4dLNiwo1+iVffNH/x9tcXkyEmxW7WuSdwSJ4okVTXXPCMU/gAjHqEsGYXSCBjqlHhp67dxRRTBkQRHEQf+D7nyQUFP/kFc4WcXQvW9GiM12kGnFBQXCEBjjuFkaFFLLqyoU4zfgNkd6O7pV/QECMc69/dQiS3Dp9rPEPHSb8BjCpNTGLDqvbDr0zUU1A8CjHHM2ExPZZy2qer+sW1KsXVV5KQ2bFYydhI9Q0Z69wiWhEUMJ1+Ohu73nN80/wVPnz4oWckobANCypazPb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Dc8iSgjoTMIwFDbBPTNT5eJiA4RePnO6PoY3X16UEA=;
 b=V1LIQ8hUbnvLjsP4swx3XKZb6vvc2DU6k3e+yLxFXH5Sistz6H3hfqAOKQEE2GnPDUQNXyC0oJMwaRvYa2FiF/+XwwGf+QBJCYSW1CxhELpBQtqCA0GJE4vGrWAZpc55MQMBdxKdNSec2ik/7cwWzLmZOyp81XtcuqiZDHmykXrFDqvgHkNoPpi0oAJI+3iwb1dYv3TehCxr78ezp2ezoe7oloU1YGysVV7yNm7/JU0LM6HdmMKjMtT0xWb8a4rRGaKNQVWNaa0vsqBwYNQtJetKqYYoL99vLABtxgj5KO6XZGkCdp8IVcYyvFWPxLBjTZTbbWBEc5L0VnAtjKsZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 2 Mar
 2026 07:27:51 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%7]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 07:27:50 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.34.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.34.rc2)
Thread-Index: AQHcqMRA2S33eFF4fkGyDHjum61dnbWa2cXA
Date: Mon, 2 Mar 2026 07:27:50 +0000
Message-ID: <SN7PR11MB70181DA7AAB107AC2D538CD7F47EA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019ca4cc139a-4cfb220b-7fdd-4ba0-8591-32dfcd501502-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019ca4cc139a-4cfb220b-7fdd-4ba0-8591-32dfcd501502-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|PH8PR11MB6904:EE_
x-ms-office365-filtering-correlation-id: bf573416-504d-4741-200e-08de782d360f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|7142099003|7053199007|38070700021;
x-microsoft-antispam-message-info: urCsAwmRWcQxT8uxXnxfdFfhfseCmn/6AJmElfVZtxZxWJJcb36DhUdV55Er6jgpvhcNCZjEt+N8W+m8Gittz4RryTHL2p7LEPvtnUvstCRiovgNKbrYGcGwKW6Kz8QjrB3wjmGfON/VPR0WzKP7BzyqCOg2gnowLXFhko1TnwxhHI/5gKpndtRXbQKa4+4Hpcn6miNF/aHSE9Ljncdm0FKrwQ9D03V5wEbwnExuoZoMzGFRsKosJ0U+k66nRQ1YqwIUFZSCjU/Xfzqr9a7H5hbAkaABhn+ukG2JGZrclg6aXSnJee7dqzOh+noi80jEL2o6LTlD+XIBJ/uzANn0AeXQr70rWVAAi3PUxre2mE5njKSDnVRl5yhRb57pDsjskTvlEVcIjYqRzzGXv1Kc8SXSHJWQ82U0/Ae/AgEdMDN11Dk+p29N/+ZZg/euMT2OxFSWtlqsqswJW037zuT8MLHcEEtaFwkHJEzCpSlG+FiXjB5CuSShT29qlY5cqzvEo3rJV6Vv9Rp37BBdduzxG0X6OSsRJny91nBeq8Ql0JX/FfMgxGRI8rQnO+sJ134nLtDfob1k1sWi7nFC6HZwBmb8mAK8YUlESGbCUxemrzDIRMAoD3Z+w5uEEQ7rUk9oBZ+3fCea/J9z3fpjvd5PyGhUWeo8yXVd+onz3XZX9rR1gSFiFlnVj+j6jjNuZT1irc6iVLLp/Zx7IFRgtB7OsYq792SXDn60+7fSfHTLzgsRleQrKxZY9/2qUGcWnETp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(7142099003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2foq1zC1UTJbI8Gp7cJ2IW8lqfr9I+1lchvj90HJ11IVWVA1rDKHWfFBB7pN?=
 =?us-ascii?Q?arlQd0aWHJCnvXkoDLqMS1N1+ojdsgYDrCBpgIC+fWS2Udfe2gU8i5BjgWOo?=
 =?us-ascii?Q?vP+6o1rWKw96Py1D1OwEqXh9RSbk1YlDvGd6T7bLlpGD97C/dNPzSWFK6OHh?=
 =?us-ascii?Q?nBG6+EnhM6fs+oDagRs/q4xtpzVnAz3v+O/nvsPFGkPaGCMkwjNQ3FmJKhrK?=
 =?us-ascii?Q?vtHjpzOThN+rgnTCIvDRO7UWTOYQE4KL1uZoDxhcOb/jEsBqDCX8wj4Z4YyP?=
 =?us-ascii?Q?iPGTdrtaQvOsQvSenOJQLWTNCeYffG0MiErsglbzItDisvKEB404ggMlCm9r?=
 =?us-ascii?Q?okV2QWUkaB7ZaxAR96A6FiOHnJyRIuGt70moSlnY0icv3I7Wn7zOWeuaZETg?=
 =?us-ascii?Q?EKrEtZT0bwbOWTIA0nwbkJynfypc+fH4I2fOmARQ8BZ/WxhEoliR+8V2hx/J?=
 =?us-ascii?Q?gfdm/+hhTXXwNuUKknn3k9MCMJBMWCcukcGAjngOzuYRpZM9UmfRn+PKZMAl?=
 =?us-ascii?Q?lV4Fk+xMheTE1W+Ycg+N4A1JDof7/hBHQ9zVIlLo30uFQ4tlXH968lCK2Rfk?=
 =?us-ascii?Q?unoQspXSzhD7+fSv2+FwmH4h7ZwjocnTW2/1N5r5Ln71yzFtsUnyQzVQa/cl?=
 =?us-ascii?Q?ooJuYqoGMx3Dxn2P+2dVsm0fridgi5EtgzfYuuazxzpshvdMypeuxJLJnTT3?=
 =?us-ascii?Q?pbp4wca7IEhB1RKsutHrbRRxgMl8U+FeLTlbvMv5PalvbOwLYaA/QVVqLZwJ?=
 =?us-ascii?Q?zqfUtk89CXRD9Tz25jcDEZF6MtgjHR8qyJadry/0kilsnztRHmMwJosb2aVs?=
 =?us-ascii?Q?MBo0DG93Lx47DlkpXxlOTPEEBnA9LyPUUQg6lG92AvZqaZM1Zb2jmy9Aw16w?=
 =?us-ascii?Q?Zu3c5cnoKu4U4Mtcqa1KJ5R6w4xH+/vsSalmJ525ckQb0rA/kzFMYNnFRGyN?=
 =?us-ascii?Q?0Os/+T8Te09H/kMJ+qcEnUgzpnVaNu6BDodYpc5ih9XS5fTHgmW4sFhRPqG1?=
 =?us-ascii?Q?moWzXGh0UgQkLaJ2SZ+cJHKtIDQ9TJsczpirSKASyuMaROTRKhRsU1tLJ6H0?=
 =?us-ascii?Q?BHasSARc3SKEKAbucUmJBmIGMNMXVDAOsDd3SY5sQZZU7YAibPwyDKh3Kj+L?=
 =?us-ascii?Q?2QPjAMH0ynkiEX2trlrXTtqv9mwabbKS7NSETrf5lxioG6AhTeWvE4rtpgBT?=
 =?us-ascii?Q?GkaITsPefx9M+gKBZuukocqoHFnrMGqiLX/xYUvykfrVSoWmMdXmlRVQiFMr?=
 =?us-ascii?Q?yJeOhDRO0k8aiTs27ljUwpVGMm8vFUg9KKEGfEMcqrTfkyfvKVAQvY3867Rq?=
 =?us-ascii?Q?BTQ0Cq7inhmkmDKkqX1RRNgcFS30PpfJKtoppG3cOYWhsqMaZ0Nf9HaYkJTV?=
 =?us-ascii?Q?ru3Ff3HGjb5PSjN6yeFw4IBitDUvNtRL2Ht+2KkCNI0XZq/ugSbmG6VVfcej?=
 =?us-ascii?Q?IG5muEXQ312th9mPIQWPhn2DeAPVDzT9Q1hvRke7UbsxJ6OSat6BleY/Q9zf?=
 =?us-ascii?Q?9nWt+qktLu0SkVXAXiDZHgxXzlEMklBGQkMqNupVbhCrSe5ALxcvJzKGhp0H?=
 =?us-ascii?Q?26Io7Mc0E/eIeredFO8YLqCm7DaUiUi2WdqDkDZTWewsaSmlfhiBdTizCea9?=
 =?us-ascii?Q?pTZUijFA6a8tahsgDJgtWM2VvknlSJTU1yQiuln3+o1ZxHQIR5ESli6Xffya?=
 =?us-ascii?Q?wM+dIcruS7I5Dnqd8za6/LN29B3rlSyGEs3CT5MW+ppbTSrNqBwj7DuQf4yP?=
 =?us-ascii?Q?52sB0jX9iA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf573416-504d-4741-200e-08de782d360f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:27:50.8945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7/pSsJdkpRxqgnjDVQWJGEdsQ6ozz4yi3R5ji1rFI8+CISOBV38ydT8B0UCUXgRW2miND6hhkn7sF6KK1r9Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 07:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232185

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.34.r=
c2. We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

1. MinnowBoard Turbot - 32bit
2. Kaby Lake
3. Tiger Lake
4. Alder Lake-S
5. Raptor Lake-P
6. Edgerouter
7. Beaglebone


ETA for completion: 16/03/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 28 February 2026 20:39
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-4.0.34.rc2)


A build flagged for QA (yocto-4.0.34.rc2) was completed on the autobuilder =
and is available at:


    https://valkyrie.yocto.io/pub/releases/yocto-4.0.34.rc2


Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3309

Build hash information:=20

bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
meta-agl: 12daee6a859f48d3d65545d4fe79849fc312fa21
meta-arm: c3e9fb12aa31d25e33d8392c4a233ed1275a3278
meta-aws: 8f7bf66699789eee7afa907b9513b0709ef79a01
meta-clang: eafdaa3cda9000c6d9bd1819ffe1219c7b66e4b8
meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
meta-openembedded: 8a598a2bc9199a4fbb9008a32ab143fb509a0933
meta-qcom: 8d273808334daef5922000c8e0548b7ff2b3d72c
meta-virtualization: c474ae21b11a816be607eb7b44d2cf77d1125bce
meta-yocto: 1d3874a383023a5e2433e0fcfd87ac5d1e6d341d
oecore: 7b6c9faa301a6d058ca34e230586f6a81ffa3ffb
poky: 8334e82e1d85e50557bd3da64054fc9e3eafc495
yocto-docs: 7c348dd67cfd169b1a56bf969606b03dccb76c56



This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


=20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#662): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/662
Mute This Topic: https://lists.yoctoproject.org/mt/118061580/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



