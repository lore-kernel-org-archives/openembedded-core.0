Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBF8F31E4E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:47:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131877.1775739668868546068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 06:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XhbsBszS;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775739669; x=1807275669;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=fs9HEsGmvhDuunnHvNTgdqNxFwJdh6QWDov54sFYjw0=;
  b=XhbsBszSc9Av3Zlv2v/quq8NxrUQl91NDX450pN30DkqhEfCrJwtqyQV
   6kZUd/L2D0JobA+qsEnRYwMv//Ig7Yp0M0C1ovVPTR7rQaiRFEekUwaWf
   LZU4XmKXn1i3HFrAZGQGaoJRqPKI7yzORf7/PRcJtQRpHATChfUgGTBmq
   DcbgEt3epXEeMwWbd+dwXO13xM/xl63v9F/f3o6KBDH+jsjqg62Se6oR8
   3q/s4uD2sYwk61s3cedHSYiPqA+iCUdOHqdv7vSLg2dUL1JFJKMmQd8ev
   im8T1hHSfXPNMLFi5G06n8MEgUgVcjplrYRsfKCcsc+wcwtN5zbicjHJP
   g==;
X-CSE-ConnectionGUID: uyGLmLh9RlqEz3GooGxxjQ==
X-CSE-MsgGUID: Kiamz9RvRpSVnt3AKhNlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94131679"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="94131679"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:01:08 -0700
X-CSE-ConnectionGUID: GOncrB6lQLG8i1MvkVvoNg==
X-CSE-MsgGUID: ISKtMxjVQmax/crbdLoa/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="222267399"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:01:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 06:01:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 06:01:07 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 06:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL13H2D8K/kcu/sm/Neip5wCVC0ZYIpqtvxpsOjeDCwoLcDXvW2xX+DqlVeTayXOJ94N7oAD3VWhGGFnFEuD4qYkgIpsPPtc3pYyE5clzNRKud74GKjZwyOc+w3rm9QAAPyPPZZPp8XpOzIRcc4fCYwZh70QyqNJ/vBwckVg9UP1maxj3Yd7gKzz7YBDw70ASPQ9au83U/F/ABqxLgtQNjGHs7ql7gItAQNNjPqSwNMrO+SHLPJS/DBa7weY/qgMDd/NzGIFyHMCDGu75JqwdjhcRFgPExmsaLR1AGAqkBQNdWZ9m/TJ767lwthbzsjTpuhTZih4iHXu03IPl+AznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B6PQzC/eH8MHocKeMeunj44FDD5+0UgUB3YJXkfVSA=;
 b=T8Q2Xq8Jb8FOnhDt3mdF+cXnPNYnk0hBH/YyrJ3IYN2HUFsd3evQLyqJ6Rt9Vpcl3phnvOSjCeu1Vt3HBv6D4Dp4Aw0+6KADuKirEthajdz1ByVwqrU9+zZHC68XPQWaZitiNFunVS0V0VXbvsOzrRbWWld6NyDYodrcm9UXfWVWGtj/FCngf16Mh7ZigwHmOlLp2i0825xRru3X6qObwQG54IbPXJ0fnJa5mMFvEIbuBjezKdm0wKYgiDec2585SfuHs1ZCkvtekfTDYl4oEMwlb2CYs40a23VQjqagc3Gcv6HHtXiKiDDFfCquZc7QO/v+kqBq3+/zcdpbic8SHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 13:01:03 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::bc48:bc16:39d:b43%6]) with mapi id 15.20.9769.015; Thu, 9 Apr 2026
 13:01:03 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.17.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.17.rc1)
Thread-Index: AQHcwr+Z1uFm7+dMSES/hscBpyn5r7XRpJXQgAUWXSA=
Date: Thu, 9 Apr 2026 13:01:03 +0000
Message-ID: <SN7PR11MB7018623F2F8B6E8FF3D356B2F4582@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019d4f125330-7e1f1d56-809f-4925-a977-4c36436ac0d5-000000@us-west-2.amazonses.com>
 <18A3B363E9A5FE35.777565@lists.yoctoproject.org>
In-Reply-To: <18A3B363E9A5FE35.777565@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|SA2PR11MB4796:EE_
x-ms-office365-filtering-correlation-id: de307ef3-7b9c-4a63-3a4e-08de96380e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: FhLIak4JDb9M6J5Y/M5zd39Jwah0k0kjFPiqOOSW+YIE/v87015igUl2E+qWqJT8wH0S31QJSkTJIsMoCvgzQPpuoGyWgo2sc2P/JNM+4mUiwTq22qmKbBdV2+0P/0e9PDPqf9qOUJ1/H0AA+hbRT0RGgVycqqkEduUkzjVlGvbDd+WwJKeX1vtCnfwCHp9GY9cMh318XsPL7eGHpKftu2cap/DhU6vYBET1lGyJxaNFyWPKeZibvU5llUzSBo2rMqJzH2oMSG3RrqasqUK4TzReiHj57iPA+ZECYbCXWv7lpXENxu4azSDV1PpAP0/W10BabfOvDOE94AnJeEoQBIv5rfAKrP+51VBmKnXUuw1BUwyURD59aSSHOFrCF1ueOB4IhZVIJbJg86aVkAArP7FTkJgUPklPUOR/DgXwRLgCSUacmOLfhrxMkPmRJOPyfOGY0uzg2trYt1SAh7OgJRl5t0AqH8+tI5QX9upQ9BIYPasT1niM9CIXSyTAudydB91suoZTfAydYCaat18gVlhCdnT3T7189N94dv1xM1d3dDBo7XhvUuMACNKuISZMn9eiZOeDAmtDCyUukLOg+fIt4ljGkeWjUKvqWEDWXgMYlG7rgUMTGF82PXlDwwq5LWMIBh2CFdU2vBURypXfpQINguGVh/f5WcXN4y4LpqEwWz02o1OA4BUHrJCybyGwOrYQkHLHnn13D6trhafksBQCBgYv8G4HrM08BQfrQCKT2uyJVcJof9HqdZJPPMIi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lUb1ubaETbdNPbvzYWBW4+UuFr3QxCleQ2YtW1KF1MtXiB/6StrU4aEyUYM7?=
 =?us-ascii?Q?+n6f+WSJ6FmZ4EGu2nEnraqyxoAHeJUc/CxTaZTkb1kYNwbSFaKZ4+QaR+00?=
 =?us-ascii?Q?4DJ2OMMOhT5Y2NpETQwu4h0gJxU41qb6TDC0iJI9TteWQBiCzz5EQMR7/6bJ?=
 =?us-ascii?Q?HxpT1k5WHhTgjAhsh/CUs4UPTPfERTkkgPmqQ7u0udR+rwuD54KYpPfv/N/f?=
 =?us-ascii?Q?9NCjgCAYdKIthZhTQ2GJ7UYwVStDMl/9sBr8yQ/4EKAfBuJLowttnthkVXGD?=
 =?us-ascii?Q?OjtiM4R1dR2hmhg7E2vnJrBAiRmcG+jtZtQkjo4JuoKfUvM8jFdkRS1j0fbQ?=
 =?us-ascii?Q?1DS2xh4e+jbfA9syv3U7fjVTWTeFgE+DE+M0MOq6SHv1pXzYj6U9sxEn//zb?=
 =?us-ascii?Q?FePzQAb1soF0XY+YlTNUh9RB8oOezRyRVjZCw+QitoWxpVAKUknAA5YxrJwN?=
 =?us-ascii?Q?MKduvD5umRESHmPNAwgWgVGuLCacftLu6ONMl0ufwvHvvdOihyzl3yA3bwZK?=
 =?us-ascii?Q?9EuRld5mJH2GsJPWOt54aCqFw0tnujCDm1/lIYWrS5XqpFpFaHIAjfVHehoi?=
 =?us-ascii?Q?iDX2fnoK7PRu93aMjrX2Q7CPVUa+XIuBloHHnqU7oNOVYDG667olPwiUOl5n?=
 =?us-ascii?Q?0oDcD1mgIu0kziVYivez068KAXM/jsUKU8FffW8hDLySHYPuN1IC7O1LOg1f?=
 =?us-ascii?Q?Ljaq3Viv1B/sWDtk7oHzFlj45Psm4DZAwKJqR5GQyuQDBMGvT616nSsD8zud?=
 =?us-ascii?Q?LwK9q4eBopX0pxhAwSUUWxL1CxcGHsGMScECNJPdRJojK9XHHfgshOAEKUy0?=
 =?us-ascii?Q?QalDsylRUb5Rf+MfU4Xi2fj9KGmnNOzQnmr6Bn1LX6IZ/VGjWga6hniFRpb0?=
 =?us-ascii?Q?dUTyZRNgORbPc+gsN7gVnHjmqiAFqS1Gfxa60nfyanLjm5PwNhnfQ627wkvz?=
 =?us-ascii?Q?/qde/E3wsowqLutKxiWIoaaI9DDegg7DG/W6jY9157R8yioH5cDO3ZiovSWd?=
 =?us-ascii?Q?pNprDwaUzsVOEx/ZzlS/ibLc8ylPUSONZCILOeB8r3oYXp3jntASdsMt+2EW?=
 =?us-ascii?Q?R6cyQ7aAt/prjt1vmB0DZYOke2n6SgAXCGmvVVHkrN3Xg4SNRYrAnNaP93fT?=
 =?us-ascii?Q?awJF5zt+n3g+MA7koKMQ+7yqTuJdQmtv7TMnbrKrV+hkuS6FzYqDVAGwdYnI?=
 =?us-ascii?Q?kScSNKA1DcD8T6u7Lwe+6epQib6md47dqKIyx6lpMw21+KGlP4iyOJvUrTtm?=
 =?us-ascii?Q?xdaDk5zfrmw0lxf5NnMDWBSlgV16kGQrMd8PsEHK1G/x+fD4ADn0A6kJ7sty?=
 =?us-ascii?Q?MwZiQ4K3E99YwMUOkUAkoAjeMhBRcBj7RYGGOiPBnycl7WEbY84K/ExImr5o?=
 =?us-ascii?Q?74bMOvg1ZKDLwsu4Q15obxREHrPvSFPFcs32T/LsoBmejnPPWR7Wba/GUDJh?=
 =?us-ascii?Q?owXBDjIODsIrYpYRIkJ1HbASMc8a3FUI7vxF7yLiNGevqQGnqFtq8vqGHGob?=
 =?us-ascii?Q?HNAvB8kEqnOT/hrLtWkD13ee6KpYLaueZgviL5TQ0SMnCZS2YPaHbijkSnRK?=
 =?us-ascii?Q?1c/TsI8Zt/7quVZfMHreP3T5nwgDU7r7VZDvjeck+kcZMV+H1gx7Q3ne76C5?=
 =?us-ascii?Q?x8RxgkVqRbfa6VWtAS43Br4utibfrJF+AjD8Nwff9NxT4vIGuurxwuSGDEWU?=
 =?us-ascii?Q?3MTqlX7mT04hxAttpXT53sox2dImjVej1Lud/EC/SXNaTxrWGZLQ0gptXwuV?=
 =?us-ascii?Q?S3LWomKk+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xuh0QVRNchBZpW2iNKDpQzsp/HElm+Pp9/LpF7U0OnyhA8D+vWkOngJNKLufP0NlnHYO2tncy489T1iiWS6oNkBQxIgJm0Z8mW4P1dqMjWRQrl14JvK7qpvW8ccZ10KtDAmnF+fOMya07tr93me+Top5XkKAzu5IQ+tjuiYRJ/ltW7Kj2uJs5HpzkUXiHlHCymOAJEqBgbA2KrWUoP2h/1XTOplXqqo5c2rLVZkZBrcf+4CfFsQm3xwJYR5ANPH4TGcKd0L2heCmql65UY4Ivjj5KyreaHi8M60OIBXnxqI4X3UinHFaMGauX6rGCrnK8cdX8xpUDq4JLxAE1TYAEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de307ef3-7b9c-4a63-3a4e-08de96380e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:01:03.1694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K67wjBnpt+t5E5VMBAmxXoxQeCg2cvnJrWuobMA6F8siCeLN3/+Zv2/Sh1c8b01pY7ruLMadrNT3Fcc1jJ6NRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234914

Hi All,

QA for yocto-5.0.17.rc1 is completed.=20
We're still in the process of configuring the MinnowBoard Turbot - 32bit ha=
rdware which was in transit from MY to IND.
Instead, we ran this QA-cycle on additional x86 platforms [Bartlett lake-S,=
 Arrow lake, AmstonLake]

This is the full report for this release:=20

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
Sent: 06 April 2026 12:49
To: qa-build-notification@lists.yoctoproject.org; yocto@lists.yoctoproject.=
org; openembedded-core <openembedded-core@lists.openembedded.org>; Pokybuil=
d User <pokybuild@yoctoproject.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuil=
der build (yocto-5.0.17.rc1)

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.17.r=
c1. We are planning to execute the following tests for this cycle:


OEQA-manual tests for following module:

OE-Core
BSP-hw


Runtime auto test for following platforms:

MinnowBoard Turbot - 32bit
Meteor Lake-P
Alder Lake-S
Raptor Lake-P
Beaglebone


ETA for completion: 9/04/2026.

Best regards,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 02 April 2026 22:12
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.17.rc1)


    A build flagged for QA (yocto-5.0.17.rc1) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.17.rc1


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3577

    Build hash information:=20

    bitbake: d3b4c352dd33fca90cd31649eda054b884478739
meta-agl: 6937866399dfbf3f37764522545426fde3f9f97a
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 78fc3cf6eb3c8f7501d1ddf05d1787c43526b11b
meta-clang: 5bce7e26a38a58bb52242494e54ab2af40009574
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: 06f846a325fde423bb0a6d49d771d8c1e144d7eb
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 3dd635f613f7299d986a8ab6bc9f584370f8ed1d
meta-yocto: c7c38663a1cafb1fa8593c0b246811e51d3bbe20
oecore: 52380df998b3a8fe6a091f8547434a3231320a8e
poky: 1e8099846661571ede077f533eb1b6c86818ddce
yocto-docs: aa7226705451e6c1ef964d49963bbed29b267c27


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20







-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#680): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/680
Mute This Topic: https://lists.yoctoproject.org/mt/118636557/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



