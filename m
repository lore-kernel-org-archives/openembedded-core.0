Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92BFCD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 06:44:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14506.1777531490706747884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 23:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NrHVVGma;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777531490; x=1809067490;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rc+Fi1EH+fX9JzIQX6oj3BgaOe9+5Tu36VU7SSkpWds=;
  b=NrHVVGmaTm7DzPqtK6TKWvsiL2bNSkgnAvNd3gBHCDGDxn85gmtCPBNj
   lbQvt0X3alKp7iBr9Tfx0P+USrFZtewWErOYL5IPfpE/CImFZozWs8Fv1
   dPyrj14aTRgAzIGqwZyNLwflnWhPqbzWbFGt/ZES347BYdmRs+zgyvXpX
   Su8KknYZJWEoXRcUnUUcpZWexwa6oz9z1r2ZVB2LTokMmEamYRWzAm4v/
   sdo1l1l3By/3WGnqEeLhHlhliwcswdUPmHe6Nfjz1PHQPTkq/I+fdXvZU
   XHD//OJJS8CyoL+uoEBlXieSMDKp3z3LXWaUiUcwkOdx+mIHnbFXYY3n+
   w==;
X-CSE-ConnectionGUID: NpT4/kEpQda/nQVC3VrudA==
X-CSE-MsgGUID: 2sHUNmZwQxee7ExhVWeJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="96037412"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="96037412"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:44:50 -0700
X-CSE-ConnectionGUID: Yp9fFzIhTd2eMGmGYaCkYg==
X-CSE-MsgGUID: smeXX+8hSmOxCidrk3osnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234765431"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:44:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 23:44:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 23:44:49 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 23:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmUueZMqrhH7ivVvdbCF7NvNvaEy6+Bt5R8wzGVqOqnyFlHHIpf3u+xh6NowLJmE69jkcXh6vZ0wsUWL405JCtZ45kR987MLWjdhJq+ugkhotX7Y3oONqSSQ6EY2qylR4qEbg/2CuTVHP/8bUwFDIm3E8C0U7s8s6RqSsahx6CZYXHFlVdp97/f+Eu9pbPleghOydc/LCrxTXclHyKuT6uP16/ah9zAsGhXYESIAcDjWaM76dkeJWoymr+IV1yoZHyStnRx/GRUEpibpJEPcniHy+l/keQmQ3GFsw3Cq4I82/kB6WjLGbyk/LKs5EP6o4abs3vrQTENBLlHUdTArbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDvE7I5i4QwrgGW5cnfd8/pE8/I7Xzj0feTHL6sfxwo=;
 b=aBDO19srn+/R1QRwNJBIkLbzLIFXQhVruqs5mgmQVWIZ54RjnQZcxrQ1pfjuwiIfsgkg/6xs5Q/z2cyKXXtWe0RbtHyvNTICz50HdqqSMliZyUWa1H/jJkZwaTi0ToThBtMI0i2G6RVBlo+6Y4clm4ddKu7wSWZis4u5lJsZhFjY7Ad9lkbwiJuuGushiJDQJCAjAV+8QZzyYvGnz+wlv8t62i0qvzLwt1Rt5HKosEDm2rSJL/hoBlT6r91GlxVheCyCrHJIwCtT4spvLX80mutVGeKqJwUv0we4SbuVN1DUXKA+mHzbGxEo/tvld7oofub4ZnjLImR3pzN84DU0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DM3PPFC3F0DB79B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:44:41 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 06:44:41 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.0.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.0.rc1)
Thread-Index: AQHc08RnuT4XEGSIuU+Sb9Q1alIfHLX3MFmA
Date: Thu, 30 Apr 2026 06:44:41 +0000
Message-ID: <SN7PR11MB70182F82956C4909EE4928F7F4352@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019dbe9ab5c7-d6cb6dd9-d52a-4c28-8ce2-236bee8e31ae-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019dbe9ab5c7-d6cb6dd9-d52a-4c28-8ce2-236bee8e31ae-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DM3PPFC3F0DB79B:EE_
x-ms-office365-filtering-correlation-id: 379e7c0f-2a3f-44ed-54fa-08dea683f537
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: ftAunHJW27ziYEY099c0zTjXqSA6V19xUSghQwMDxKU04mHSAjNUjfOtxalG6/UG6s5fer24vxeGolEfDzjdZozk9NCPR4HScjyCHSb4onHeuX6vYHKa0ESxarRZQhxAN6gANTyE0+AWEBvKikjdF8i4bJHdt5Ct+QsKSaZlUS/1T6pzCsrttlSkt2duV/sI6fOcVXQoALZjhS0FpdyZI496y2MYkxVrqQq9MS1+gJIFuir27Y68cpKZeKescpoTIfRHhyV0Gc0Zk9GRv768i/R1lHiXvfX5bye6MxoTQLI54E0ZhxQmyPyQuLzIpTvAwpxTVULxc7GqE5L+VTECqxISHZ/kn0FR4QQmr3Suv7IGQTylubKCb50UtsVw1LJnZMU8inKnk5JzXNdnjBbFx1MdCuSmUI1D20krHhf2nU1ZieZyn/+PzTQHUSzIqCTu/5oxOkXmowg8Vcs7uu6uAG59sa3MvOtLPAld1Zrg3/Ky8xKhvgHJOE05QTel1JuNCUMFwyOnmZXeMe6MCNUHF5eFgMogaVH6iw1AsFLGTQS1qfosxvHnPpjtJ1cP9XRwHvKTGdTqwtgSFerjgA0m5kGUjNMyp50XLVnKWfMZA+DL9MZo41ZvfOaE20VjOjhKel2TRfG6UJkh79VV2VsL4pbu4IISE98wCTLnhXlkgTfrrwjpHKYAbfjA+S2DMtrFMRyFwa2mvnWNjoN0bZaJJ+Cmz3kdMmtvaoXVvPKpMrF2bBs7c1yzt2V0SxSgG2j9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+pWBWxkccjyf6zrFtfhWdJRCbq4WJljP5A/w/zRzILmAFUNTw2SKHElhs4o9?=
 =?us-ascii?Q?IwKQoY+dRzy/Y9Lrmw8ZMscTQm1ZGRbA77Es4QHhiuvTmlBjVdFGDLjE542A?=
 =?us-ascii?Q?Bum9BCGy56SKbdErL2UZsaxkLDF7C32Aw7UD3eetJAg1tfoI3HzIjJCSwsIG?=
 =?us-ascii?Q?bmjt9Z5ZKrtPN5RRPyfmYI07HwGhTkNdxuAV3JKoDw0CKq1fEirtjF8mUOpq?=
 =?us-ascii?Q?vv6Yh+Bk4immCvR4CnYcfC4RY/7VTUz9LxwWZr3tT48tLDgbcDadyoig+8jy?=
 =?us-ascii?Q?JLA91gcvAieQn9Ng8z6jrelkVPoJXipT49CjiHuG7v5Wuxb6cfrBYxO66S00?=
 =?us-ascii?Q?vFqRiLE1OTEanYv9sSK9umHuv91eoO7/nSXfpj4jmZhxUqXcPaMJxLtFF/Gr?=
 =?us-ascii?Q?/pXVxY0w93gY2xmZQHWf0GlsqPMb9Ijjh7asJdqAH/lsIhNwm0hg+WhQmUyQ?=
 =?us-ascii?Q?750YGVDsH00oJFrE8mJXOlgup44AnASDPU3MqP2ku0466xeZRvG4n6F1F6KX?=
 =?us-ascii?Q?7Sa0vQDfEe+kW6uxRtlUjdD5lZ624+oIRxYHKEwYWoDTzAq0+T9bGrnkysXW?=
 =?us-ascii?Q?7MqvqVamGmVbCDb9j7GzNrVj1FRyv7I9fsq8mM6vYFIFFwqyoRMoD64aD0ux?=
 =?us-ascii?Q?QwTSbOi4w2x8YV7Pp4928/XuuGhaTQ5VP3AJ0cdHCF9LxxZJqpGfD7A5BS2P?=
 =?us-ascii?Q?6nKu27J8V0LIU3uWKY70VrBM+8iEJA5droe6S/dWPEGkyboE4tGxa6tvS6rb?=
 =?us-ascii?Q?tepiWN1JxYWyo2VWwxh0DNyp9T2C/G/LIwQr9GvtzXu+443vGRUGWv1pM9s7?=
 =?us-ascii?Q?wnkQUcXY3/ScU9iu2ssU1Mz14q2OfO1b5HfnewAWSdXculGjTaELlEUlKtTa?=
 =?us-ascii?Q?ysPwos4+87k5JI9OCxb4l0vgIffJZMkQSiciRgbs8kwNj5psznadqeH1TBpp?=
 =?us-ascii?Q?Y4X4bJjcl3XqtAZiQVYPAdVOYvgXSVVU2JWau8jv1Xaly0u1/PrVEqmZxvGi?=
 =?us-ascii?Q?Yu5LlrFJhm+pKLQtqxMM21nifVHZSR17u9s/QrRsaqW8G2LVl/mgn8ciCPa5?=
 =?us-ascii?Q?yQ4iGEqbD0PJRtpmIHhDzqTo0hGKon2L8lHxhaABvmcs3A+6037KSQ+4jeaK?=
 =?us-ascii?Q?+rKlAVOoMLUGMZeYdI/HxdMYEj8KVs84mo2dJPZM1vnNqtl1NHaT2pdzPpqr?=
 =?us-ascii?Q?is0vTjoazFdM7pKrNeKoGFC1a7Y9Tzd9LFcRTypTV8YCx+Tw57yVbIo+Uxq0?=
 =?us-ascii?Q?eHSvUTKn8fzDJKyMMOH5To3hGCNHzLo2Er4VH8SdrbOjDb0Zzw2/C3k0V4yn?=
 =?us-ascii?Q?kg5t5WPkhq7Hhlw2JZ83IkE1qFrd403VIV87SS15q5agXYP7GPqmVy9i/MQa?=
 =?us-ascii?Q?3mZgTmH49ieFYIcBAB3CjP29mBHmJome4Ey4tprKH8jNmGRh9if9L07KD7N/?=
 =?us-ascii?Q?EqIGy4VCHMdVu5YNoClSnXrhigVvUVJLM39B05ubcfmeseB7T9uRzk2j4gzG?=
 =?us-ascii?Q?zRD+3RIYcT1YqurCoh9hDiOPe6oZtQmU0/5MtRlNpkiySJ8ke+ugr820NZYb?=
 =?us-ascii?Q?1hpwc+OS4DiJCZpLpHL2M7bjgARQhXj+Wb4ZIS3JEP5x9Zhkmix2pR5S0Azu?=
 =?us-ascii?Q?a0r6Wiz0IxoKFGcZACo1Jd/rztLxelbdEnnAp4WxFbLvKlCAaEHP7bYZrZ1w?=
 =?us-ascii?Q?oMm9O2s64LKPoN4dtSYIPFgLJM5g9fw5kTQKXZ06LKcvB4uI2ikbM87TI2nX?=
 =?us-ascii?Q?Dj/cQiE47A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rze/p27clx60/32ZKL9dY5+Tgeb+WF3G98zr/sWsHsWWsTo3HR9jhlJwUjpMye70QzZeQhMWupRg13fbZ+PSL6XLV9Z3xI42vLvgUYkWh1D+W8sBr4WHtEBTa2jBz2n7pmdU33T/UMZu5mFlf9GcWS3jE5xhQw6tJ+uhHv6CyZCaAbO2uFUtQbkFv0L78TcQaeUcu//16BR7yjCK+f35aFibij86yzeu2aM+VSnQMZvYYE9l9yOCAi9JNsTglLhxF8mtwVIlw6oewtBY4lcuZpRPgjiv8pt9kmpi3gOwbUnuwYlR6SgCgKghjNXyWGwDtPuCnpRF6uaErxvnhBkHow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379e7c0f-2a3f-44ed-54fa-08dea683f537
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:44:41.8116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzbDXltGkTLsjFIn5gFS5AWKx5QlfTGFeG+RHwrn4HQL03cjizqeozI6rTYcYPFbvAQDTBJY8Tvyl6ekJygYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3F0DB79B
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 06:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236140

Hi all,


Intel and WR YP QA is planning for QA execution for YP build yocto-6.0.rc1.=
 We are planning to execute the following tests for this cycle:

OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

Alder Lake-S
Arrow lake
Bartlett lake-S
Amston Lake
Panther Lake
Twin lake
Beaglebone
BeaglePlay

ETA for completion: 4/05/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User
Sent: 24 April 2026 13:58
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-6.0.rc1)


    A build flagged for QA (yocto-6.0.rc1) was completed on the autobuilder=
 and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-6.0.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3727

    Build hash information:=20

    bitbake: 33581c84f3a85008239acbd940501a35de48dc91
meta-agl: 335bfb321925d37675d45f0f869c446ded8972ce
meta-arm: 8eb10af8092dc3fff86891339fd024d8583f457f
meta-aws: fefdcc67dc3a86752a98d19c96d64bcb31928002
meta-clang: 78c5e12f08198f4f257a9348516d2103cd617c1d
meta-intel: 511ddb7ea90499b2088248f59bab3e9d6f3c900c
meta-mingw: a4ba674d6a0a17e4c0bc4c11bbb9d0ea9de2b315
meta-openembedded: 76700b6eaf327bb30e2c47b78713e2e409cfab7c
meta-qcom: a9f20e62e569c232dc1aaf8a90a6343e504003ef
meta-virtualization: 2e0704ee9282e4e86c13180334cb7ce118e55dd9
meta-yocto: 904846ae078ee20de073040ebb77c86e19250f56
oecore: 42fa856a00ac16b2a7a83d7ecfa60a5be192b16c
yocto-docs: eb74fdfd9e5e579a65e8872d1a73b51e77b14f63


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#700): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/700
Mute This Topic: https://lists.yoctoproject.org/mt/118984556/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



