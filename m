Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1C6E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:48:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web10.130422.1734619727481953513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=glFpm5xm;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734619729; x=1766155729;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Vre6drQKikOwO1XdGdPj0oaGIEPGMPNklDOcCv9OUUY=;
  b=glFpm5xmwPdfw55IHJIhYhWCPvn3DWmhbBVHu40cCjypR3cZvfOOjMCK
   ko9kLN4IbsDn3bqysS5DM9jM9CSy6BhWM39RQSZvGq5UT8IfIHBnNoCdW
   g7ofemA1Pm9CfE6S5z/nt6PGszdDp/E0IAyuuu0ZZMroHn+WvkT3hYUMk
   sGTDiw64VpRzYpO5XXj/0bnP8zcgee5QetsX8ReLGbzw/Q9BNjQN3gOM3
   UfMa0/VF8IWsjjysSnSYbJIXp2lABEHdMNTeXdOT9Hq62ZyI1OljhAf7P
   6p6TdXPhOy/9aefOYcRgP7E398wZfbtrGPsKBfi+gV0CHa3+B8lw3sWAS
   Q==;
X-CSE-ConnectionGUID: EFbehvB3R5uOWxVBWxnAlw==
X-CSE-MsgGUID: +EpaXCf1Rqeo2kbLDh44zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35029960"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="35029960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 06:48:46 -0800
X-CSE-ConnectionGUID: Xn++tAg7Q4SnNIP9/EUPdw==
X-CSE-MsgGUID: a15RQZ98TBODN6dKabtIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129180497"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 06:48:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 06:48:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 06:48:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 06:48:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ+K+jXY8wolv8lEJiQDXwn/JEbp01SLYHpw7wudi1OO8Ob1WfezFYyRmYle8rldfK/IPx2rw11SARKVrLYR19PFeugpnYloTLXwJkyBZTioLxzlFgCMZw6MDJM38tZ+qzYBBvOqOOLT5shdzmqzFZl55kQ2Rpslzdfy+8dWrWSxk0t052BrWKt7h/tzZklbNde8Sc3owL4QAhr3GA4rGIQgLrzDFNdXsqtDl0Bp5mMnJGrm53+C8FAkBXEkrTL6d5I3XbOTsdSM0qOmGN05tKlP7jdD8D/+eXfcCvU3aAZZNgu2DPQ0UG+a1YfVCS+hcyHHPnH2KlOPqxpwkVsZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vre6drQKikOwO1XdGdPj0oaGIEPGMPNklDOcCv9OUUY=;
 b=Q2pfLGc7u4xeKWO8eZaLAhKezHzxndVt11yF2LfqImQdnCnN5d4i8eayiQgV4huoDEQHEOmDp2IwqxdqjJ2n+MyWpQ8/nlXmCkshfPUKp5/u9o6PA26aHAVljQUrolAAGZUTybz14KvkGOmk3nKtg1YLuB2Z0LIbzZESTsY+VNulkowuU1Ynl7wpN1v9+9o9vJmSmVuupuNjQyvAXRy9BVbfMK2piYKOHGtkI4ErpHaqsLb1Y5HWlAlXVIB7YkwEOlEZbXfnSMPZvwZGRx6y0azHVYLqhPeR1cMYxXko2BesZwDRMkxSBVmhg7j3TdJ4ISgz3LFKw9gHjrWTFoBhxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Thu, 19 Dec
 2024 14:48:42 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:48:41 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, "Pokybuild
 User" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Index: AQHbT0NtbQ5xLneIS0uQEydZyKHQMLLtqyTg
Date: Thu, 19 Dec 2024 14:48:41 +0000
Message-ID: <DM4PR11MB776047CE78255F5AB9651EC8A1062@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
In-Reply-To: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB6953:EE_
x-ms-office365-filtering-correlation-id: ba8c8ec0-62ec-4139-58c6-08dd203c3b2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0VoMjF2V1kzcHozWW5FL1VnRGlqbWcrL2VhUlZkQyswYUFGWkp5OFg3UXIx?=
 =?utf-8?B?ZVMwVE1lUWp3eVhJNExIZ1ZURDNQc2VhcHBlY0V1V0dPMVdKdDRqOWRHdER5?=
 =?utf-8?B?eHFMQ01DQlc0ODFrOE5mWXFTVmFIYTJZbStCUjUzUlZLdHJoMkNOYlliVGhQ?=
 =?utf-8?B?M3dGajdYVWdZdkczVzJzV3JvcjBYK1BuVm1aV2ZyQzZkQU0xcHJIUTVSOGVG?=
 =?utf-8?B?N0NjZmMrbHBibjUzZ0xqSTFQTGR0VEo2NUFpUVBFMS9FRWVISk85Y3VrVzB1?=
 =?utf-8?B?NGtzQXRUbThzQlAvRnBjWHVHSWM1U3VHNjF6SldoWUQ3NjMrQkNUMjlYaFdq?=
 =?utf-8?B?TFVGZkpYZXVhcDJzb2JHaEgvV1crY2NyWURzM3kzd0p4SnJ1bEpkbjNPSWlD?=
 =?utf-8?B?akU4VGJBTE5pSUI2NHhZYUVsa1Q1RHVhSmgvSFNvbFBmYTdLcm9EaDhqRzd4?=
 =?utf-8?B?Q0dGVTZuckVoVnRjNnJYb0VvWnB4TEJYKzA1b3c3bk5mWUFUWDNjNEhOTkZN?=
 =?utf-8?B?TEtpdHNMc1cyN2FQUGVNNE5BdXdtanVCSUJYWUplTWp1dXp0NUtrSWQ5T2Fi?=
 =?utf-8?B?MXlkbC9GL3YzRnRPUGFIclpvRG83WFo1NStTVHZiZm82bWNPWjRLZkZ0L1VE?=
 =?utf-8?B?dmJxUExsODZPcE5RRTI1UWM4eXg0UzZHT0dWRmtOVjJmYUt2eVR6QzRjTmhS?=
 =?utf-8?B?MmhGNHNPUmFrNHhJalFtd2tlK3JveUNSQWozOVpxV2FsZFdYcHJYN0ZVY3B1?=
 =?utf-8?B?TDNpZWYrU0pSU2tuUnR6UkwwMHVCNE1QZUNvMHZiK3JGVXd2bnd4ajh1STZL?=
 =?utf-8?B?K1puMlpFdGt4SGdZWEsrN2Q5VTJCOGF1N2FrZUVLbmY4bG8vOXhtK2hzQ3M2?=
 =?utf-8?B?TndldWF3SlNJR3dUd3NlYllqZ2RhODFPeHNsbmxBT3ZYV3ltU1FQUDBVdVNI?=
 =?utf-8?B?b2JROFRsc1IyZzdOVFFlcXNJUFUycFB6RndvWGpUVTRLTk5la1orOFlUdm1l?=
 =?utf-8?B?Yjg5WEgzUmxMYXlWbU8yWmNGVlplanFFaDNsenBHbS94MjUyNUxQSDRsVDZI?=
 =?utf-8?B?OW83ak53N1ZLeG4xbnE5SmM2Y1luUXZTNWFsbDNpN2puSkFOT0FRVFJPdXRt?=
 =?utf-8?B?Nzk3bzdtK2g0MXNsSEdGK2hXZ292amNGU2hTcWVZL3paYkk2czJoMzljL09k?=
 =?utf-8?B?TTd0UzBIc2lGanhTUHFreEdibGdWVk14ckt5bkxldG1zUjMvUGZaTHlvbVpO?=
 =?utf-8?B?NURQWFpSSFo0Y2tZMjk4UFZHRTJaK214Rk5STUNORFNuQlk4a0poNnVhREw0?=
 =?utf-8?B?NCs5aFpKNkxNUE5aclJxNW9sVElmSXhqNG81cmRiTXVHdkprS2huT2YwTWc2?=
 =?utf-8?B?c0VSaFMyTFFyRDVmOThrb01wa2ZYeU5TTGttbDdMMGo3YnJTZE9LY0l2U1ZE?=
 =?utf-8?B?NzU3emhVOGNxaG1TYWx0eUZrSkZ4VXVmYUcyOFh4TGYybmpMRitaZjJtc2lS?=
 =?utf-8?B?dU9RNEk2RytZM20vOVJDY1JzUTVIM0hTQVVQUnhsdmFIWFRoSGhjYk0vYWVI?=
 =?utf-8?B?aVdOcXlXMEJ4TElKUkIxVnZwZm1qQi9aVFZpdHZHbFEyQ045M01uaFh0V2hl?=
 =?utf-8?B?WDNDVHI1bER4cGVqbjk2QjhjZnUwbWozK0k4dCtIOFZPVSs0UXAxTTNud1Mx?=
 =?utf-8?B?Qm9FdGhBajhtdCttZjd2bDdOZFlLV0c0cUovRjg4RW1BVVh0QllmMjh0L1Iy?=
 =?utf-8?B?NXUzYU1wTGpidENlSWJmV3ZvODVUYjdUS3RlbHhqaUU5MVh0WkJuYUJjYk1s?=
 =?utf-8?B?eWxzNTd0Z09DQlZZa2o5cGdBdTk4eE5IUnc0UXl1S3ZXM2hqditKblcxZnJF?=
 =?utf-8?B?L0Zsa1dOZzZ3ZGVvQnhsU1dKSTRVTU1DMkJnQ1E5Q1VCY1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXg1YklwclpGdW5VRHUrQmNOL0plK1FGeDZwcEVGU3BkcXlGTTdud0krZVJE?=
 =?utf-8?B?U1RYTGs5OXNULzZBTVNBeUZmMFRsQ3VhTCs1RU1TeVVra3pjTGoyd0hvZFAz?=
 =?utf-8?B?ZllycEgxbk9keU1IRDhCV2thRzZLY0x4emE0RVhhQmQyblp5M0lRY0ZFRFR6?=
 =?utf-8?B?NnZNTEhOS2JqQzZzdm42MmRVWmpJS0M3R0o2dEJSVjY0WHc5UmhvalVmeGh6?=
 =?utf-8?B?Y1VnN0FVOGpNd3Z1dUJSbWhBQXpLdFZycHkrL3FOcG84M3ZPbXFSNHMxVWhy?=
 =?utf-8?B?eUx3LzZScGVTYk1SUDFvRmJ1UXArNm1seHpHcE5pQkFCbUNVcG4ySXlQN0tM?=
 =?utf-8?B?aW1EcnYzcW03SXZpaFAwYWhuVXJCWS9aNk1nZjFsOEU0dUFEcEYyNVhOT054?=
 =?utf-8?B?YmpUT0o1b2lpTnBrUWhuT3FJWGlnTDA4MXBCTlNLNjVnSDZ1ZVRkVVpXOHo2?=
 =?utf-8?B?YWZ6bWpUM2hwSERpdXZqalpacUVTbmZCYmR4cW5VcHVOaXZ2ZUhEOElIQllm?=
 =?utf-8?B?ajQ3ZGxjdUVQdjdTSWhEeUFhN1BaK1l6U3AybHp3MUlBSmxkMGdtczdoRlhr?=
 =?utf-8?B?UjJZQkpBMzRCN2xoSlh0YzAvd1RrVlJJMHh4TmtyRFBzYThEdDR6N2crOHNE?=
 =?utf-8?B?MFRvYlJiSUtOWjM0VU5hUjBDRUhxblVHRHZxdGlNZlVFdFVLbDdyQkpQVEpT?=
 =?utf-8?B?eGpQelhmY3RKR1Jzd0VZMnQwb1Y0MXJpMUZVS3ZveHkzRlhROTNiTzVVaGJU?=
 =?utf-8?B?REFEU0k3MEF6cnNZMkN0VS9zY3UxQ28zaGtZSmNCRlhxZXhpOXZMYUk4cGhM?=
 =?utf-8?B?ZndxbCs2cVFUYk9rendPYTZUN2lPRXNMeEVFTm01SzFWRzRFYTJvTkR3azRs?=
 =?utf-8?B?M2gxLzErcWZBUlJ5SFc3T015anpSVmR6OTUvUHRyZDRjczFLdnlNQ05TcXAx?=
 =?utf-8?B?Sk84VHFQb0VteXFUTXNHVE5kdmF2dnNONDhkbmpsakpSajcrUzVOamp6U1V2?=
 =?utf-8?B?dXozaUwrVWFybzN3Z3Y4dmxqQW9Dc2s0Q3hNZFJ5RWJ3MXBSZjRxaXpldUIv?=
 =?utf-8?B?bWlKSkRGUUFZdzk0ZHQ5dXV0MzVtdFBCUnlrdVJHY25XMm8xN3hMbkxQTVQ1?=
 =?utf-8?B?LzhmK0Foa3Z3VlFiQldEMXUxS0p6ekJYTDB0WEUvVHVKTGhoWlE4QnRaWmZo?=
 =?utf-8?B?cFk1WEI5NnJXdnNoTmN0em9tSnE5a29xVUd4VytpdjhZRVdtdFdFakdlSDZF?=
 =?utf-8?B?amZHSmlHMHozaE4rcWpJeU1kdDA2emIxaG1QbmRvK2wvUTl6eExFblFhSzRI?=
 =?utf-8?B?SkwyMEI5K3gzNXV3cUZmRStPSWdFcHduMlc5THpyMzUySUN5TTF0N2hRdXFr?=
 =?utf-8?B?d1Z6bmFFMUtsbEVKR1I0QWV4VHdLcmJmS2RFWlZZYmthSGZPQUUyRktyTnFo?=
 =?utf-8?B?WWhBMXR1enR0clgvYS9nQUViVG5GRk5qTWY1Qi9veXBxWjcybTcrS1BnYjhT?=
 =?utf-8?B?M3VEanErV1BBd2VzRVJXSlhaYnd1WVFnV2ttVGI5b1dzVkFvN3ovTFltUGdn?=
 =?utf-8?B?emtoOHMvdTZabTNoclBuOTdyZ1g4VlhDZDgyVkliaERHaGxNTjhQMG9XTkdI?=
 =?utf-8?B?ZTJCeWlPUThiZnRFd2NHeC95WTlURmNVQU1CYk5wd29HeDU3S2swWmhlM1Bt?=
 =?utf-8?B?ZU9IRHB1ZG5pWHF1WmFqUXlOTmR4Y1BpTHNhblVLUklDMThUbk9kcUx1ZlV4?=
 =?utf-8?B?a3EvZEFzWmZGM3RlUmZJWkZ0RG1VN3RSMUk1MXBaS3hjZUNPTW1KK0diRkdC?=
 =?utf-8?B?V2ZydWlkb1J3SkVObnNuc0FSL245TVJOSElqb2F2QWp5YzAyRWU0WGZLWlBj?=
 =?utf-8?B?WWp0VVUxSmFYTjBGUHczRzZ6Rnp2eG5XazhaR2xBc050YmkrUzlpcGptbEVm?=
 =?utf-8?B?VDhERUxSRHpmWlovTjg4aWhaZDNHWEREajBjR2J4SjFIeUhPUTZCMEk5ckd5?=
 =?utf-8?B?cFJpVkxtUU1EQitiVzlxS2JXOFlUMVBhZnE1blZqRWpJOXJKbTBXbXoyWXRE?=
 =?utf-8?B?blhtRmFCcFkwakJNVnNmdHFPNDd2ZGNlTi84Wnd4UGpKakY1d3g5SW5zUWNy?=
 =?utf-8?Q?Z7+mYcvvzqC7JP7Y925VHPcyD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8c8ec0-62ec-4139-58c6-08dd203c3b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 14:48:41.9349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01BLyOV0/WolLQUxt1gYtilgQeDrk+V5C79A9fKfsJ3lZGz3veKTkn0c6veachmb9hW7kK7P1O3NrR9TjxwMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208919

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTUuMl9NMS5yYzIuIFdlIGFyZSBwbGFubmluZyB0byBleGVj
dXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCiANCk9FUUEtbWFudWFsIHRlc3Rz
IGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQogDQpSdW50aW1l
IGF1dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCgkxLiBNaW5ub3dCb2FyZCBUdXJi
b3QgLSAzMmJpdA0KCTIuIEFsZGVyIExha2UtUyAoMTJ0aCBHZW5lcmF0aW9uIEludGVsKHIpIENv
cmUodG0pIFByb2Nlc3NvcnMpDQoJMy4gUmFwdG9yIExha2UtUCAoMTN0aCBHZW5lcmF0aW9uIElu
dGVsKHIpIENvcmUodG0pIFByb2Nlc3NvcnMpDQoJNC4gTWV0ZW9yIExha2UtUCAoMTR0aCBHZW5l
cmF0aW9uIEludGVsKHIpIENvcmUodG0pIFByb2Nlc3NvcnMpDQoJNS4gQmVhZ2xlYm9uZQ0KIA0K
IA0KRVRBIGZvciBjb21wbGV0aW9uOiBUaHVyc2RheSwgMjYgRGVjIDIwMjQuDQogDQpCZXN0IHJl
Z2FyZHMsDQpKaW5nIEh1aQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0N
Cj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNo
YXJkIFB1cmRpZSB2aWENCj4gbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBNb25kYXks
IERlY2VtYmVyIDE2LCAyMDI0IDY6NDggQU0NCj4gVG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnPiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5v
dGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
DQo+IFN1YmplY3Q6IFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3Ig
Y29tcGxldGVkIGF1dG9idWlsZGVyDQo+IGJ1aWxkICh5b2N0by01LjJfTTEucmMyKQ0KPiANCj4g
ICAgIEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTUuMl9NMS5yYzIpIHdhcyBjb21wbGV0
ZWQgb24gdGhlDQo+IGF1dG9idWlsZGVyIGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4g
ICAgICAgICBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by01LjJf
TTEucmMyDQo+IA0KPiANCj4gICAgIEJ1aWxkIFVSTDoNCj4gaHR0cHM6Ly92YWxreXJpZS55b2N0
b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzY0Nw0KPiANCj4gICAgIEJ1aWxkIGhh
c2ggaW5mb3JtYXRpb246DQo+IA0KPiAgICAgYml0YmFrZTogYmE5MGZlNjczYWE4N2NiMGNkYTli
MmU0NjVlYmUyMDYzNTUxZjUyNw0KPiBtZXRhLWFnbDogYzAzNmFhN2IwMmY4Y2RmMGY5MTkwMzU4
YmI4ZDgxMjhjNDdjNjg5Yg0KPiBtZXRhLWFybTogYjJjNDNkYmY5YjRlN2MyMjAzOGJkZDVkMDE2
MzM5NjJhZmU4ZjE4Zg0KPiBtZXRhLWF3czogNzRkYzdiYzIxYTgxYzgyZmE5NjQwOTk3ZGEyMDZl
ZTA5NzcwNDM0MQ0KPiBtZXRhLWNsYW5nOiAxNDczNDliNzMzNGI4YTI1Yjk2YmIwOGMyMzYxYWUw
YWU5NWU3ZWI2DQo+IG1ldGEtaW50ZWw6IGQwMTUwOTY0Y2E3YzZhODNkMzhiYTU0Y2RhM2UxOWIz
NGQyNzRmODANCj4gbWV0YS1taW5ndzogMjIwYThhZDYwNWQ2MDI0N2RmMjdkM2E2NmZhY2M4OWMx
ODU0ZWQxMA0KPiBtZXRhLW9wZW5lbWJlZGRlZDogZGE1MTA5NmJjZjI1NzcyM2E5MjljNzk5YmM2
OTM0ODc3ZGU4MWZhNQ0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiBjMWY2NjhjMzM3YTU2NDU3YWNh
Y2JiZWZlNGQxZjE5ODkyMDJiYTk1DQo+IG9lY29yZTogZTM0NWIzNDcwM2Q0ZmE1ZTBiYzlhODJh
YzMzYjdjMWZkODRmOTlmZQ0KPiBwb2t5OiBmYWZkMWRiMzgyY2MyNGM1M2MxNzE3MGRmODI3ODBm
OWQ1OTNjYTFmDQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJv
bSB0aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3By
b2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZw0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzQ4OCk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3Fh
LWJ1aWxkLQ0KPiBub3RpZmljYXRpb24vbWVzc2FnZS80ODgNCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTEwMTM1OTY4LzY0MjQwNDQNCj4gR3Jv
dXAgT3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1i
dWlsZC0NCj4gbm90aWZpY2F0aW9uL2xlYXZlLzEzNTgxODAyLzY0MjQwNDQvMTc0NjgxMzg5Ny94
eXp6eQ0KPiBbamluZy5odWkudGhhbUBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IA0KDQo=

