Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921CFC36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:48:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web10.7562.1743155323327543887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=K7HvXhUa;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743155323; x=1774691323;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q9ORKNPlN2CzIMdUC+2DpZ9jp8dRUB1IuATqyo+1Mkg=;
  b=K7HvXhUanoycF+DDx8+b/Kc2kDMyNLyokknly7BYApHtz9aD6SjRqDbu
   jagPBDIZ7jEbOTrwPkWuPgcsJkv3kWNul+S5EIwgb6bWslbo5K0l3JpA8
   DMW852X4gj4IBrOTX7rYcOtjErLUKjGJ679iuYwQBMaX+eo/swzA/10nW
   7znyJz6xkviLp/TcyaxaRiTNB4UsGSF5bzPvXy/jyusI5PpQUQ8C5nilg
   DmR+yOzhv2Tnvytep21kmdHn7ve8QLv1QzdUrka38MU1Sn5sA8lKijevA
   7bm6phOWJ6mNy/VFvfOQKJ5YDmgs/SW+3B0UkEOCiLwR0Lu5jWPQbkAIB
   Q==;
X-CSE-ConnectionGUID: Lcwg+kztTTKhY5JrXoveAw==
X-CSE-MsgGUID: +2derBaVRcyEonXWwzN4Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44675461"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44675461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:48:42 -0700
X-CSE-ConnectionGUID: DyrmQ/QAReW2T9t8BmRtEA==
X-CSE-MsgGUID: 7wQC4fDHQ8aXZ8jMBK7ydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125165624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Mar 2025 02:48:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 02:48:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 02:48:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 02:48:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weIYsHdU8gpSSBXTgepx2JHsay26PtSrA3SonbhLqqFH9+Ysrhwq5HOoObtS+uajv/fCf2+BMcOtfhAWbLxU8kxrovoGMZKctz+wGgWgG7P3so84RJHTuIOMo/sE6gtDwFaTOVs5K00yj1P7mqTXMdHUp2qbkhj2vKX1F1hyaBpDGMvKerS5xu1lJ2En9MGDnWt6R+LxQWRsz3nsGs+nSttsylWIChHBVJvzKLp2UtrcXGsPNgdSUVMvjC/f1nON1K6CyD/axZWg/Nlc/+hHTpLb5EGMeSsB3taJLHk87BAzBdXIfvWJI4OGHSueE5puqBf9YGxDe6shzWPs0SdVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ed3L5+mltkf40rSewds3eZKoWG2dEpzwwnvKliZKaxU=;
 b=tg+1ua7TKm+oqDO5CEzx4LDyidJ6AuSTCzGQzoEGhqrpIVRW75TN7Zqrc6KPjpOT4lsBPFIc6WLanrmYjSOU5IecFUdk22gh+9DB1l5PfW6YpklqrWNbtTCWTlRRX7By7/C+HDnEEzVdfpHNzYQ6wqpsZ60hlnDZP9KE8FxfnBJXbFBCGY/R0W8XiZTw3KC5QVUBVCOHYZ78a/OV/Ty29ohetbWEbTbZ6rZWzvqMWBI9E3320Ey9ABbv1//mLzZLUE69Xl2+hlzKCGiWOP+KvprBNEsrDS14uiLLol7CNXr9wrsR6U0BELm/Qjk3dw62iA7QiF5X8HSh6QhonrmT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:48:40 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:48:40 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.1.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1.4.rc1)
Thread-Index: AQHbm1Y/M9BhAL4uvUKtgkuzeXL/ErOIVe1g
Date: Fri, 28 Mar 2025 09:48:39 +0000
Message-ID: <DM4PR11MB7760B402C44D1777B70A33ADA1A02@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010195bf101499-b217168c-175a-4107-a1d6-31b7a4428ba2-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195bf101499-b217168c-175a-4107-a1d6-31b7a4428ba2-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH0PR11MB4871:EE_
x-ms-office365-filtering-correlation-id: c784d5cb-5e6d-438d-2b56-08dd6dddb81c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0UOgoUVSKwzManfd3XVyuKkLY7fMAhBsR1HV4yKcowP10dpc63duOZ1Nok/e?=
 =?us-ascii?Q?wfjsFijTEVwOAFnj5BW8f8vWSKyF0qSUIEIQV1OkMWfX+33/3MZ6X0moPAQ5?=
 =?us-ascii?Q?3YErnZrDOv5yfREj3ZlvmziKGt8bhVJ3hIJa8WhqI1M62Zb5RV5JftFOyIfU?=
 =?us-ascii?Q?Dy3X2UxIejfWOWmNWRz7Z6ikwX2L9/AcIDaiqPxeU1eEWW4hgtat0pJyQjuv?=
 =?us-ascii?Q?Ddvf1BD8YVdzLpuFlGvGqkvUoXkt+s6fNFTzpTvUIxf8OPuIS0XBdNH3x/bR?=
 =?us-ascii?Q?TfLiymS9Y9SFXzJgOOalK4CdqSOdcAVPLIBzKD9AwERFdKaXrK+49vNuOV2i?=
 =?us-ascii?Q?Re0b6wPqzSC3T7ps34eA7S0W2I2sYemBb5x3gUOLPpaFisq280uQg722HfRS?=
 =?us-ascii?Q?phf2hVu4vJ96TukLKYcPNLz9r4vdrU1fTzachh83eT18wZTvk9sBn+vzV9EA?=
 =?us-ascii?Q?v92bXmW+BULVTacx4mM3uFcSFXFxIzx14esKkiIZqZR2zRZ2PXiyW9sHkClC?=
 =?us-ascii?Q?TuTcZoD30JfKFrhGIQvw1JI+qx1iTwa61Bdy6WlmuuqCGl2kq9J3UNegtawe?=
 =?us-ascii?Q?Zl1BZFjyHFkbhX/dKLB+FMjp2yWbgjXiS6LsuQTCO9+Sd6RJ9TTm7tpCL2Fn?=
 =?us-ascii?Q?IQbNkQG5HOcHocD6d4qNgSMgaobEG3kEwTz4lBPEUXSEKJCCfLw6B5tn+vra?=
 =?us-ascii?Q?sXQQsZTYqeiaeWOAzHciY5DNZJomdyuAG6YOWlRlN02vZ1CnTbAgSKqk0EiW?=
 =?us-ascii?Q?ZbIqp+1diyykSPFQm6ExmLwjWkbBUW/6uPjNtcwzqH3ejIfRPcwuYye9VVC8?=
 =?us-ascii?Q?eAsSOO/yYMUel6ZnsQqP5Dk1IJEQ3vGr8EKltJliQvWvt4l2kuqA/GbQo+dn?=
 =?us-ascii?Q?MiiqGA1+InA2EmFjV+FFYGCvwNk8Dkt5evQM9JZouJiKNeAHm2IpyVoNY5a6?=
 =?us-ascii?Q?e02jCIxWd4WgdL76MPDXMTbhRwksJbY5Vq2/dpf0N7PrICLQ95L4zmAl+ByP?=
 =?us-ascii?Q?p83Y5E0MiJmJeS2LHmrcbrL+TmMbv6+gXT4q6yoqPYgx/745kt9+Km+CQZcK?=
 =?us-ascii?Q?Peyab/Xzu/ccZcJEMxyaLJ/z+wh2TG+mTyO3WbAY3cFZP4Ypr5CH8vuDNzVK?=
 =?us-ascii?Q?48kbqXBGp1+IoLy8xej7LEDKk3JqEzouGlldL5Q64fj1N4+WbgN4zcFleNXV?=
 =?us-ascii?Q?QiS2f2MigFyfTWo2O3XbWcn4mlZjzn7mo0GcBAmY16sm5mRIBDl2PpuKVYCx?=
 =?us-ascii?Q?JhgWJaxaceVhdCezEQW5d1mSuO8lRFIYSzxal/yBhGSadB7a8ONhPs49MAMl?=
 =?us-ascii?Q?uMFanaldSyYneC7K8pJjfBFQKlW8iW3EHbpWPLn5nTDXrS8DsJw37SlDG8lE?=
 =?us-ascii?Q?fq26u3hZ+TZpTwZMKIPld45iqSPV?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I5DiTv8ZkO21zeUouP7Bu4e02eUC+HR4t4nkTT/FndTpLGL5jbj4fL7xoT3h?=
 =?us-ascii?Q?ZcFxB0cK3YsA/3m37jG/c3kYLjvi0JAzWeR1MvPOOkn5ENh8rLMcXcwaVCDW?=
 =?us-ascii?Q?y+1mBI0yEJkFdSfucKQiyLyuRQJXrrE2W5aNlxOIpniygBZZ018Hk7IDAZw8?=
 =?us-ascii?Q?lrwbmSzodF5SW2v+EiaMZQ7+hitiZV//8uhptAsSnVqFhPY+N+QvkxwHbz9H?=
 =?us-ascii?Q?eQyEJU50CpJePqhAxVMWgJ/DNLOnyQaHZ71qfor0IyREDZonLXjSUmqx9vs0?=
 =?us-ascii?Q?TZ2vDNXnUuVAX/WR9nmFkgQMWvkBvbF18DgtABhpIUP2a6cGvS4ga0Y6WN9k?=
 =?us-ascii?Q?f5DHTk/4j4fMwLtGcwhschZG7AC8Cp3KhgikqKme5cC2gX8Xvd3dccmWsisx?=
 =?us-ascii?Q?ebkSSXT22Ab+hEi3ZCpAcIiZl2xiMeoMzMcHzP+rvUXlJ4S2TCkB+yj4BDRN?=
 =?us-ascii?Q?ImU2ydCVLh9RRSWupElwLjnJAp3SY1LStb+QlicOk/vYpZen5EJPSt82qIz/?=
 =?us-ascii?Q?4i9xa4gByN70MIJ3b3LzesVTCyCSQjjTYMGfcTWskgw7I49EVxOVbAovnll4?=
 =?us-ascii?Q?iwEJ6VIMVzDQoG+4sySxbog4/bEotJ/h4My2ZXSA5sfbzDwk/o8W1pilW82o?=
 =?us-ascii?Q?mRBxydSLw7I/CnaFa0LTcfjH7d4tmkDjQ1RguNw9z3olQyasjlR9fZNlpLPT?=
 =?us-ascii?Q?Lq8biyIX8kBDh44Ow4Ahoy+vArSbgbamzCjazv+pRzM7Ow6CkMUB3USQ3vks?=
 =?us-ascii?Q?LQKbbAPBCvaPh5ijmc1XyCS/LWcopBKMB4V02qM5chBvMow8eSE/KJIFCNoN?=
 =?us-ascii?Q?5Acme0XCFAkMnzgPs+vHxjutsXYbhIfyMFKVQwJYxDUiEMMFlywxHEzARqK/?=
 =?us-ascii?Q?Hl/RdqvFH013FTlgoIFSWNlNMkzA4GybA7PxZrioFc0UQMe8hJtgjDM8ktC9?=
 =?us-ascii?Q?aNfTjs1rYXSMC1cFNzwUodXHo0WbT3vXPmLVpu2CfHJAwSrZKYOknib2njqG?=
 =?us-ascii?Q?WqAoa2mjyx/QiaRurKQHc+6kFzzZRJ5rUDWlMtTO9BXDChxxIuUmVCB/ngDt?=
 =?us-ascii?Q?3+hTSLpoQQuQqcAL76Vrp4HBeEschmGPyCgjQAiM+bwkYHIfbQNBjO/iwfXw?=
 =?us-ascii?Q?1hmWDzKy2KDlE9yKGqm9qVyDeB7FckZbBWzIGkT0EOrkKmQ52jUFcDBvlzu9?=
 =?us-ascii?Q?bxaH+lTtrGfB2AWCICQTtEIyalWaYscq5ms+nWlRB5+ZDDMhV93ziHO4S+IB?=
 =?us-ascii?Q?0K+hjXOXB1VRCx6vjyHoeH8jcBG0cFqvPBQQLHicfvc/viY4CR5XRZrMs8hk?=
 =?us-ascii?Q?qSIWMxwi0QYiC7IjbK5le5elW7SJ7QJ1Y0sXBBClAizbIBoihofvudNzWuPy?=
 =?us-ascii?Q?U6wNzw40x6CCpZTb+96SD8oHMPkD7blOPPvQIfBQfbwhQgXJP3eE6hV550ea?=
 =?us-ascii?Q?WhmdKA+g7sbyxPLDJ8rN9sCI+KXaEQjjzzie4CgreEM7j5I+7pgzAxL3Beoa?=
 =?us-ascii?Q?ycC2hjuj+oCQy9QW8K8dt4Ju0HXrZQ8VRuM8+sB+wPjuj75dg3HHX08+4ft4?=
 =?us-ascii?Q?S2oMj/DdEdcMBvMKJtkbuZTuI2dRQ9LMbZ8sXo+9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c784d5cb-5e6d-438d-2b56-08dd6dddb81c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 09:48:40.0030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u0VUZG1ZFA4aqrn6FvXeJvJ4PQrHclegnS5wTONnx3z/LnaiykHhmlREC7YJ6P7QKYP8CXZ9Kin3lVHmxHURKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213820

Hi All,
=20
QA for yocto-5.1.4.rc1 is completed. This is the full report for this relea=
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User via lists.yoctoproject.org
> Sent: Sunday, March 23, 2025 2:14 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.1.4.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.1.4.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.1.4.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1244
>=20
>     Build hash information:
>=20
>     bitbake: 82b9f42126983579da03bdbb4e3ebf07346118a7
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: e56a0cd6fe5e796aa59bd0d4bcbbb585ea626199
> meta-aws: f9dd433234fc42f1b4cd6d5f3dd2ac2e06ac9c02
> meta-clang: c709a5196f1e8654425b43b478064395386c36d4
> meta-intel: 0ee9e8454cd41dcb0f49df7dcf2182b4d5e7cc96
> meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
> meta-openembedded: c93994f1bb601c57548b588d4f77a044d90822cf
> meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
> oecore: 2d94f4b8a852dc761f89e5106347e239382df5fb
> poky: 70dc28ac287bf35541270cae1d99130a0f6b7b5f
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

