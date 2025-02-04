Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410ECC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:48:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.113370.1738666080431860783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=k94qzHCR;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738666080; x=1770202080;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8UQV2LtCvU32bqar+AyvOoE1lUzJBS1ngCe6JldQZGA=;
  b=k94qzHCRlFU0IIfYCL2SF/gV6JLus5jgRRGlKTrtyz8GkpSa8Tac4E5v
   QjQ/r80q1AccACvl9V2sCBoQU4mDr/TJwUrxDG6hHSs8XeRBGXDQYyIok
   vF7Rv6yx7ftPYJgg5znw/tGVdarVPh6MaM/0z+kimGo4xsJTKN3KlAFGS
   PQ8UghZfvficaAzLdp9Dzz7noDImyjuZmEUsWJo6MwFYIidAFHSJaVp7v
   6X+2IymXDHcOjJs4FofpoO7eSeo6kBhsD7YMz4nxXnkdbHhI3bhWvPHha
   ih3fNrM/2wOuxsuWFJoEn/y+ThPuReD2BUXdvALzzuSeBzxRmMdswSp7J
   w==;
X-CSE-ConnectionGUID: L/yCzl2XQdilOrF4KlV6kw==
X-CSE-MsgGUID: ghpBttM6Q02Ol9ukVzfhEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49801232"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="49801232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:48:00 -0800
X-CSE-ConnectionGUID: 2N8rwDeyTmyuJmlVIH1cIg==
X-CSE-MsgGUID: Ex9czCvYTbWwtQGZyuwRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141416674"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 02:47:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 02:47:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 02:47:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 02:47:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIgNMRomk48KMfocQzob1uI2nnDgxCXKjFNk52+Or+hb9XOJIVLbzQB394m1LOcHlaTgaibuXwZOoEMAacaaL8BQm94A6TA4PwzyqZAw54FXxQ5QxUp/gh5Q1hV26Q4x/c5CvhU7L328AEToaiqOILRSjkGOA4E16B3Ik+id9VDEN3236/U8qtYUlYE3FJgaJE0x6plJPKPWMS9Ps+90125MHsVg79+h2kkHySvytBCmuPpH2ajETI0QDe8qg50lxrxK4AgUH5LN7gX0cBo/QCiR2BbwrZ6iBEyTmmTswev8TcLVcEJuPBzwpKFf1lwCjQqZRWGOGyqfY9FI19eWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj+to0WTgfe4wM6DECnwvzzYqHlhhMrPCuTohbToA6s=;
 b=Ls33Zd31LWrnoqCLbrbZnkGL9A3F43dVa7935vLmMCtpJmkTVDKIGb+ZsCLQTz1tgQXxk7UwhYT5eFo4WfmJUHCtj7MxLSobgFrhOWnWY73KLCt0W994pSl/es1YgekXFrrd8ai8ApTWRHOQsdBrfxs4EtaF5gcFCT4rMe5/MLDr69VW2XkeX0TuqsK96b5BQ/EbIHbtcSz+uOV9NvqQZpqF4lBMNrky8S9OY2kqc/Wg1IvOEJLu39u4TR2FAREGkvLo5EOcMOl7Dufvqp5ru+R0Xfg2VAWEODwxqeZACrj0n/83mBLvzB6PWsneYtjEUn1qD9ZCkUE2PG06IqhC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 10:47:56 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 10:47:56 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M2.rc1)
Thread-Index: AQHbbfK8ljwtveNN2Uiugx6WDDEa+rM3CCuw
Date: Tue, 4 Feb 2025 10:47:56 +0000
Message-ID: <DM4PR11MB776036F5F1DAFE56057665CEA1F42@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010194959a6748-40250453-a157-4f33-a155-893079bb12c0-000000@us-west-2.amazonses.com>
In-Reply-To: <01010194959a6748-40250453-a157-4f33-a155-893079bb12c0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CYXPR11MB8732:EE_
x-ms-office365-filtering-correlation-id: c9091ba3-c263-4747-bf70-08dd4509628d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|7053199007|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gsHI7wjNSg68uopltm5XG6noTKkpQNNXHyMLGnEtQ49iZ/3ZN+4fOqdnnh1W?=
 =?us-ascii?Q?nvW3ooWXoVCUo0qEmBK82vxjQaWzfQBsvjqD1PN2jP2VXuCcpLqouJI7MLMD?=
 =?us-ascii?Q?U9G74vP1I/smazd+KododnJucK0+sbd3BYkRUaLiwmsmmtLdQ0e0zHIZekfq?=
 =?us-ascii?Q?uonHamJV03VqhMGrbWKpvUOT+Gm8ldbnyvQ1cavup3q1Ox6ZxySDFf4jW1Yg?=
 =?us-ascii?Q?g3Iuzwdjme9oa3rZPecLnqTo6Rn68SEVbOc+MLnxF3eQ+wy/AQZKY24oDU5Z?=
 =?us-ascii?Q?pp1cZALZfDE6ledka0hCSwDDYJ5qxeMNb/Zn9+R3ULSjjtmOIAT7qlLmAI3B?=
 =?us-ascii?Q?Mq+EitCNZy1Lwepm+oDN+H8Lf5ThjjascLUBsWjNje3f80ltgNZylYHogMvc?=
 =?us-ascii?Q?G3WcoLT9SNy0RDy5dkUcYakd5Q7GFJbSgG8lCW8lKNIdG+j2NsMYMpNMogz1?=
 =?us-ascii?Q?7mMCqlAT3TCwujM926tMOzDh9DYq/PG0k6RiZQEZVJV+iPiZCNqdOUeGVTl5?=
 =?us-ascii?Q?uyLf2d7nAoOaxFJiijF3rw7Q2832vk2aqeIp35tjTQh9vriTxT/SiXNU0tDw?=
 =?us-ascii?Q?WMtcumHX/hwcifLl1zfpDICLkp3pR16EY0D/V5UHxsu7r5RGhD8pcRFF73JJ?=
 =?us-ascii?Q?rQwSp1lzkpzIQ9phclL6u1FZUwLd8Li/gfnDkQT5aN0VfyHrF5jvCm18tKHh?=
 =?us-ascii?Q?AkpPMjMD7asBbAb8AxQvt7YnyfX8XVtzVNA30yryeGmUUWgn3A+8ZDVPthHq?=
 =?us-ascii?Q?v8g83+wDIz5YE0vczsaX4m2tVjA7UApAOvtx8LT5fNz0b1vdoaLG/ZwIs9+v?=
 =?us-ascii?Q?XZQBWM4pCjwB7a0uCmZhHL5mJdbTAJhVQy2DcNIH8lZ1bDYLVkR7IFdOAp9H?=
 =?us-ascii?Q?hsPUQRWiiUdS7YEgJrvzY1a3bE7UwSesN0t2V59lrKusH8zAYJFmyYSY7WvL?=
 =?us-ascii?Q?T/BP7682RvlCSgN1Gvggrb1hzTFedZ31+sKZGseZy+9dKWq4n1+SieT/+wOV?=
 =?us-ascii?Q?3mSYzhK2rujT1OIEIBCpYmrgMeOKdxnzBP7ih265cN+6+fR5HIuamWTusNNb?=
 =?us-ascii?Q?QTENCTtdEtlINks6pMCzR/xkJ6DwCfpEGOrYKcBmBO2909HmVQ46qESV+dKh?=
 =?us-ascii?Q?ms6Lnwq2NgbMPIVFhreOF8NLfZa5AD5NVLvzlWKWUCf1zGliGP2Js8tIEk4V?=
 =?us-ascii?Q?eVLFevSYP6wHeVJ/KRE64P7gmJISXQXinZrgP+SDIgwdtLllFqjAyj7U1pYP?=
 =?us-ascii?Q?/+k+RE9wj2jm2TDc9AWrI8PV+2AtItW93UW4lN6++E1FQx3tVpYoZ7z+Z8Gl?=
 =?us-ascii?Q?W8U+BCT03Vw4bZbYtr2MUixnawAwSIsZlBO9yp+1PT1zts4iy6cmKChTjvZW?=
 =?us-ascii?Q?4W7bRdfkdWUpNHBND1saplG4KYLR?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(7053199007)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yPbbRxD+80gfROeuPDr8/nGgsjLHSpjJuNilqYXTuVF4Y+x+dtTZaLF1TndX?=
 =?us-ascii?Q?D53Q4i77aw/apU5uZhm1l3uVbn43nrKYXK5wxTqlOkVibkNQn0PKWCt1T47I?=
 =?us-ascii?Q?E5OxdVm5VfAV2Wst+ABed8ioNXvtEF4EpR5AbVIC4X65Skb9DgkK8UWhUr8c?=
 =?us-ascii?Q?dDjN0gmTxO5/WtB1rgnnZ7UAI7Y0wWSOlOoLtXv1nYpQ+DP/0spFneW4250m?=
 =?us-ascii?Q?E3SmyqjhI3Eg5R/Q83uCTfcpU0P44rlr2cOHhdM0PAOT//aJFPLDVd3+jil6?=
 =?us-ascii?Q?OSpXzgItdPoI7pnRehK4u6/Fqqn9/xWJ9rKAAelk6oRVJJ/N0mGu31VpQaun?=
 =?us-ascii?Q?RR43kGlSdXMxVNZw6EakIDbrBu1cgr9nQlLjP9kg1LdHQeHv8ysceZ1nNVG0?=
 =?us-ascii?Q?DVhoc0ZHtliA+c2k7Hzbv3K/xzPwHqPhJz0h1drfPVQY2fLwe8Rjsz1bxTdV?=
 =?us-ascii?Q?Wsuwh6qsnvAKDDuGeP2A60dyCL31+5/auaYTyeQV646KZWS/soXsA6p4BFZp?=
 =?us-ascii?Q?2WXIfbVx+dz2FmjbiWsWeZ5g3VAmpILkxzjirjJs382onJOWOQSn/v/gA7Tv?=
 =?us-ascii?Q?WGXpFB+h4ZtXuVwjd88+Kp/cYi0ZOf+0zLvYVgcWJIz7v5D2r7E1TNMTC8Qf?=
 =?us-ascii?Q?hoomnoKuxTRFBoqVj5nCp/Gf1Bb7U57SHhLE4WCCZZxZ5iPR6JyJGZHGT2hi?=
 =?us-ascii?Q?YkJFjfCcyaOp05MImfMOyzWlBPk7JnO7JmIZzjKM/0/kxF6Xkw/sf4SAMJ1N?=
 =?us-ascii?Q?yh21sgNQr0WjUUmbJbRK8dqjHkWe9bYVDPdSpUpp5OfCWa3raFxmbSPsohY/?=
 =?us-ascii?Q?MbsukHP4Qzmuhdf8qWX88X6vb2OyEV3jD5bsupSrtRAw2Fy8G2QzRTuQ+vzX?=
 =?us-ascii?Q?xRhkN+UwNj+ng0FHKORiAK/eraL1DTT5hdiPezzofUQy1Z7BRp6oIAfMJuq3?=
 =?us-ascii?Q?7XeUE/82V9ltM0PCKDEayITv7RymASkEnBe+3pEAenz6i5MlkcpI2iV5ORn9?=
 =?us-ascii?Q?kFzNKOfb+ijZduelEILwTF5FSn5ZvtLGR/M6Ugo9kROFRDC8+iacATz8X1N1?=
 =?us-ascii?Q?GCtlwB2wUtathD9DHm3NQPkV/KBnA6oMbphsSOsn1mmwxizeykSIEXXKPUDf?=
 =?us-ascii?Q?FMeSKc212zI3kHJSKXdCMbUBttzNmzRsaMZ8As1m1C5jfYVkxLbl6hMfQK+N?=
 =?us-ascii?Q?p4y0d/W8xN24Zh+529ZipnmwUPPD2ymyQNyLiZgyZYPgYL+n/6g+oRMpKTOd?=
 =?us-ascii?Q?qsUfF9Q9TTrShr4YAAO3jU7ecqxze1SJiMqf+N0CVArKdbUzh55oaF6y6EZD?=
 =?us-ascii?Q?9iwNxwpont6RbqHJpxmU81yX0ATeBog+WJ1T1dHue0fg4pL/ozaaffyU9bQD?=
 =?us-ascii?Q?++7+tWUJD1vpMT9XNjuz5wwkSSG7E87pJFObNZ2EFve/5mMk3U2wYBL1VSnJ?=
 =?us-ascii?Q?u71qAMGiKo8h6euLUmztn4iONLS3pKr5owNsn4sQzx/67sogw1nI0IBohQgn?=
 =?us-ascii?Q?z/Geh73f+rfZJplo++bLluRGtjKx0rsHO/RjPdwJVUrPSesq5yKuQtYyOksh?=
 =?us-ascii?Q?lVa7oHt1RI+IZwX22yETFAQCv0J9Vp3QJ/S6bxAJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9091ba3-c263-4747-bf70-08dd4509628d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 10:47:56.6454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xF27f5yXKB4NqMM8Erov/0XSlLjLnnD3A73ivO4hhNQbpJQX4ds97BEeIwk5Agmh03YtqCn4AyxYCD9FFk0myw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8732
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210764

Hi All,
=20
QA for yocto-5.2_M2.rc1 is completed. This is the full report for this rele=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Friday, January 24, 2025 7:59 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2_M2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/873
>=20
>     Build hash information:
>=20
>     bitbake: c83444d1210740e27b1744d3aa7c5cad4e28db2f
> meta-agl: 17fd501fae2361588f2af72c229d56612cdca40f
> meta-arm: db933d55b46683f6349b027d6483a3b99e1fec3f
> meta-aws: ecf4fc6000d0b21aa10c0fcf197001420be1a1bb
> meta-clang: 0ea2df0462edc0c01e787b6ee6c0e20cd6a42fc7
> meta-intel: c7c7dface32f187bb0ba724b8eb79152f7453f0c
> meta-mingw: d609536003715f61564c41e81bd04ca9113d968d
> meta-openembedded: 27ab1bbc95b27a72a6a8a750a7fd3e98526e2050
> meta-virtualization: b57f8a25a35a93b95e3baa950c2d359fffc13051
> oecore: 3ca9192cf16e15e95ba1c3db4ba28fc6130de8e0
> poky: 59db27de565fb33f9e4326e76ebd6fa3935557b9
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
> View/Reply Online (#501): https://lists.yoctoproject.org/g/qa-build-
> notification/message/501
> Mute This Topic: https://lists.yoctoproject.org/mt/110782371/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


