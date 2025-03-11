Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4ED8C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 02:09:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by mx.groups.io with SMTP id smtpd.web11.5212.1741658964829037524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 19:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JPpEkkvC;
 spf=pass (domain: intel.com, ip: 198.175.65.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741658965; x=1773194965;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=M50X2bLfjoMRUls3AWYX5XRnD/zO6vgY5bFQrKR2oS0=;
  b=JPpEkkvCT1YRVJVQY9g8/AR4LJH4skAm+Q3Dtn6pAZTPp/n6vVyzdLNq
   efUwCWjbvx+nRtoV2hiGHJzVOd8ErPlmIM6Sg8ERzzCaABa4PxkEEoFj3
   WfIMxf13EIjlyipQMLntDrEvdIY5vAZvoJj+z44gjebq/tMsa7/XUHOLx
   6otRCZzkiSgR7slAEju10z++BX0fNKS2o7QUmcdn0gu2mIVHntt6WVykD
   HdcHxaLq2oLirFH1axq/xuHzthFxpq2ajPBDUDhrYHb/o7QY2gpi5g1WU
   n/A1tvNiSriAZiBCLDAZksyim5wR/4/Ax/m3SQvBlasGob+Tp2SttKutc
   g==;
X-CSE-ConnectionGUID: +moX02MvS8Saf33VboJJrA==
X-CSE-MsgGUID: 6/40zhqJTiayv5hGlNXWkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42713514"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="42713514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 19:09:24 -0700
X-CSE-ConnectionGUID: tA0PH42JTyW0PzWS47/AUQ==
X-CSE-MsgGUID: +IsH6OV6RkuPEOqeuRRC8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; 
   d="scan'208";a="119897601"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 19:09:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 19:09:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 19:09:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 19:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2yEF02c3kXgBQLlmz8gAV1HT39dCKgVd5cvQYYPp9QNZa1kcwL1l+HbZrv/L1IjFl8nYMW7Ifp7Bir5xOiLg/3gk0iwkRrQToiJjdvBXk/GQ4AanbSXnp6ISg8Ve9OnmxW5KiLWt2eKMGFc3/chDkQvVb58tvyZ+chknYWak8zjo+KgICnU52cZCP3HLlNRawLkyclaL18FvuFtZe+vNblao0Sko7kINKNQDt2rguxJgZXQuWUZWFJaYcwEj7uzRHgP9c5biGTCSeHgz37i5WyseNsEN+mtnc7wuKd7dLMKiX4aI2jvhF2AELRATWC1YETeQBw3AA/23MSiQzil9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M50X2bLfjoMRUls3AWYX5XRnD/zO6vgY5bFQrKR2oS0=;
 b=IFCItigokeNebAABhra2/Jq+wzsmjzBpiyvYYNbS55V8BCTIX2jUnAL+tvKSHx/sHUqFsIM/H6pLo/j+0+OmQoeN/JCkXtcL+RsduNHYdhIal5q7kqKWbR3ZwTdOB9cIwj7BIasQ6NrVxEOl9tGQExfOPakCm3ic/xSiEVC0Y0l0McD288amS+6lf85Cs9K69kvcHrbhOiSFmgXzZM6mB5pi1UOATv5WeuICU70ZO8c9keeiUcTW6VHbp7cnsl4qDP55QXwg6gfLUzX2ADrYiuUyPhE6Vrl+Od1lFUZr25drb8vwZiWFcYKe4H8q87yoevkwD3BZPVk+b+8pkvFgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 02:08:41 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 02:08:40 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M3.rc1)
Thread-Index: AQHbkZwwuZ+WnD+AVEirYU3TLENCHrNtMNDQ
Date: Tue, 11 Mar 2025 02:08:40 +0000
Message-ID: <DM4PR11MB7760923FDAC75B2B8E092FB7A1D12@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <c4b1b122b424616df3cd7de3dd91131c01ffeda4.camel@linuxfoundation.org>
In-Reply-To: <c4b1b122b424616df3cd7de3dd91131c01ffeda4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM4PR11MB5327:EE_
x-ms-office365-filtering-correlation-id: 3b1c0a61-7696-4f6c-3d23-08dd6041a446
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?Y0Jnd0EvWmZaNDJLRElGaWxaTnMrTHNMREh2eFNrcmVEd1dxaFJiY0dpYVBj?=
 =?utf-8?B?RWhZV0M3aWRYN0xPZyt6OHpBYWxhNjJncTcweHZiRnMvTThyRkQreGRsNmNH?=
 =?utf-8?B?Tjk0cVZBYkVCSVZ1WEMvY3R3a2RsSm9ta1lTYnZDM2Noc0FrR3o1WXdDSnpP?=
 =?utf-8?B?Ym5yRmpCdHV4VFg0ZmNMaHIzZHByZEx2WFdsSmZyZitoMzlzeEhjS0lqSkg3?=
 =?utf-8?B?VTl0SDB1cVBCbnBGRCtLQWVFOVQ2d3lJMThmTjlaOHBNR2FTZ3pVUmcwd2VL?=
 =?utf-8?B?SXhab1RYYStqb0hLengwckxjc1RRQTJIQ1gzeVVDNWVlSFprUXAwdlpXY3or?=
 =?utf-8?B?cWJNajJvR0tqZkhIbEVrQTJ3MVFyMEY1bjlTSzNla3dSVWZmT2dkTnIyT00y?=
 =?utf-8?B?Y3VXQmtGc3Ztd1ZVM0J3bGZOeXBBV2E3aTBROGQvQlZ0MHRCQkxnSXFhcTI5?=
 =?utf-8?B?QmRtMU9IakhHcmRhTXUxM1ZMMmhCK05icGtzazhCUi9Lblh2SGJxOUNoc0tJ?=
 =?utf-8?B?eGwvb0ZwTzlSZ3F2ZXh5d0FHVjlwVWlQcUxpbkI0c2FHYW5GbHAvUUQzVzUz?=
 =?utf-8?B?SkVzQ0Fyd0F2OW5jblFjSTBtOEVHWnhVNmgxcHNiWXgxSDJkeVN0L0hXc0lr?=
 =?utf-8?B?QWxmUHY4Rk5IL2tsY0RITmFYVjE1SHpGb1FSS21COEd0K0JqbE1oZzR6NFdw?=
 =?utf-8?B?V0NjaHFOMG9UVS9tQmd4WHNzMmtFWGhCdjJMMlRKRkkrUksvS1BocDQ5V0F6?=
 =?utf-8?B?NVFJVllIY1MyMVg3cCtqci8wQVk2b0c4dXZDcGpQSGtkRjlQUGVRNVFQMUJR?=
 =?utf-8?B?QVdUMlhKeVVyNm1pU3JtbVhsZHJiVWk1V24wcDRvc2FaOHM5eklYRjBuVS9k?=
 =?utf-8?B?VkpJUnpwUVdNM1RzbEdUVW1uRjFRYTY3bEtEMEFLN2NLZ3BBQzkzWlgrQ0pn?=
 =?utf-8?B?MGt5Wm1kLzQ4QnVSdUx0bzNpemdjQkFpMFJGQjZCMWtUNGRZbURkQWRWSUNM?=
 =?utf-8?B?V1Uxa05CZXk1OHdzZHNkb1lYMzdrWUtzSytoTHYrSkFJMGJSRTNNYjc4Rkw4?=
 =?utf-8?B?RWxENDl6M1JtRVFZWWp2VlNNQ0tOclFFcE5pdENYMmIvQThMVlV0OGMxUWlv?=
 =?utf-8?B?QUwrNWh1STRzckVDT05YK2RQZVRTd1czaVZtVjFZci9BWitZK0VTUUhvRHlC?=
 =?utf-8?B?SmxRK0RxTHBDeUFuclZxSS9wMGRWL2R2YWlpTEsrSTNsYmdiN3dDODlTWlJj?=
 =?utf-8?B?N1V0S0oyTy9kbGl0S21zRUVJVXcyUEo0SXk2YWR1TlpsUlRNOU9lVzA0eDU1?=
 =?utf-8?B?eUxyOVE3Z2Y2ZlcrNmEvUlRaVGM2WlkxaUFzSWNXcXhxL0VNTXZjWTFYUklq?=
 =?utf-8?B?U0tDRTI4Q215VHZoaFdEZEJ4WjZaTEdSdXFtODVjNU85MEhMVnRWdXlEcWd2?=
 =?utf-8?B?cXB6RkJtNzhSNU9YUVFVeHpiSUFGRWVKeVZSTDUxR29wbXZJU0J5b0VabTdk?=
 =?utf-8?B?c0RNbXhEK0w0MnpQVkJtemxIT2FvSWkrYi9FVDZnemwrZG1MazRtcGZ6bGJZ?=
 =?utf-8?B?a2dLMnlqTFFuWUkzdzE1QUR1WTVaQkprb2dzK2ZhdlhRZnVqNHdiYjFIZG9W?=
 =?utf-8?B?Q2xWazZNZ3NGYjFEWi9HZVJGSDgycEtrcStvNUkwMEppS3NsNk1iQk05OEJL?=
 =?utf-8?B?UmFmY1NMMXBGaGxrb0owUE1rWVFJOW5HOTNBY05UWExibEwvVjZCN1NBSVNG?=
 =?utf-8?B?ZnZwbjVHdlltTVkyOEdVbTduSXd0QTdsK05sN2dub0FSS0x2b0c1dFdHL3pT?=
 =?utf-8?B?bzRoYUdUY0hwNjdJbWtXSU5xbVFlSjZyWHIzRGxrK3A2TThYQzB3bldpemwv?=
 =?utf-8?Q?dwF4niDnjKgvi?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVZJUldHV2lCMEtnNTNGWFI3RWh1SFRKN0E5Y2NxdjEvTU1RdTI3cFYyTCs3?=
 =?utf-8?B?R0hZbGFqRkwvTDVQSm9wYlBsNmVLbTNWc2tXbGlYYnljM0NjUTJXQWYrUzY4?=
 =?utf-8?B?YVUwZjJZMTEzNjEraDRENy9qS2FOMm91cHUwekpGZGRlVDVQZnA1ajNEb2ZM?=
 =?utf-8?B?eVBSNTNoUGgvREwxNXMvVUpyT3ZlbEZ1dUpMR0JDcXJaeURyeFY4V1IvNDRi?=
 =?utf-8?B?VG5RUktMNi9aeDN0Y2dlQlVkZTdXcHJrN2k5cUhQM0NuWmdZaEMxZzZ0MWVm?=
 =?utf-8?B?ZHJPTXlBTzV5ZGE5d1lXTFI1UXlyZ0VhWXJxZXN6T1JWY3U3TnRIRWVRUTNO?=
 =?utf-8?B?cUg0MElUbHdwQmxDYmRqcUhGbmFiUjF5aFZiZE1iWmtuTGpac1h5WmIvMitK?=
 =?utf-8?B?dkZXNm56UDBXR0dQT2ZjaERCNEpHMmd6U1pDeXBKR2hWcW9VcFdzbHpIOE5H?=
 =?utf-8?B?NWR4cC9HMzdyT2NObE1kbG1FOWRKTU8vTHdCU0J4MTRaZERhVUFIY1N2ZGV1?=
 =?utf-8?B?cVNPOE5VSjZpdm01MjkzVmtnVnQ2QUU5TW5KZ2R1c3VHTGpha1hzVEJkQXFW?=
 =?utf-8?B?VHFYb0lWSEpLVEtHVWFOUkQrK3RWVnBuRXcrekdidWNVT3ViU1ZNS0ovWC84?=
 =?utf-8?B?d3E0Q2JHaTV5aU5KVE9CY3NiOUx4eXZUTWpaeFYyYVd5MWt1aU1uU3Ftenc3?=
 =?utf-8?B?Z2MwUnI5M3hoWUlBRUVhZy9JcFpQTm1RY1c2U3JtSFNPdW1zQ2lXbGx3cm9x?=
 =?utf-8?B?TWExMmpoSlZwL2VBbi82cUlzdVdkaG9BeUIrWWxROXVZS2FuVDJBQkJiQWh3?=
 =?utf-8?B?SVB5MzFXaW1RajFqNDV1Vy9CQlI1L0NVemZ2QW5yTE9EMzhDZGtUMW50cGZ0?=
 =?utf-8?B?ZVFJVVM4eHVKV09FUWFNMGVXek1xSFpCdG8rQW5kaWF3SUxWUlMxcDFyUWNT?=
 =?utf-8?B?QkNCNnQ0a1YwRmhBOTlRbWlFS1pFMUFUVk15Q0xLVWVyWk1maXZvb2NsWXJm?=
 =?utf-8?B?SmxPMW9wMjN1ZzhzMVZOR3pKc3NuQlR5Qmw1Q2xFZzNyZzVUWVk2TjRlRU5U?=
 =?utf-8?B?b2FCZW5MVmhnb2I1VHRNVnMrUDBpT296OFpKT1poZExQYWFzeU1YNXZ4MVdK?=
 =?utf-8?B?eDJ3NlJucXF0QnZLOUdUeDlaNFFYMDYwL2d6ZmRnemxRbzI5aTBPOGd2cXpC?=
 =?utf-8?B?R2Q5Sy8vc0VRL20rK2RpT0huOVRVVElzQWFoNjlJVXpwV2k0U3NVb1h2QWJv?=
 =?utf-8?B?ZSthZTJYRHFTZW5VdDlyQkxoa3hScmw0RmRMMUdGUEJnMnpYblpOaHZHc01v?=
 =?utf-8?B?Tm9XT0xWb1prUHNIdjQvckFWQ212WndOK0ozVHFpdXl3elFubmVEWEZtaW5j?=
 =?utf-8?B?MisrNlo0QTZaa3hnSlVzNzMrOWFjdVpOM0hmaGxzZm1jSzFDZDVDQlFuS045?=
 =?utf-8?B?bXFvNGU4Ymo0cHdYNTJZN2F0cm1oQ1B3dklSMENhY0JvVzduTTB0VWJYRFpN?=
 =?utf-8?B?R0RHaGpvak5RZy91TWdmMVVWMVljSUhJMlRTUUlkc0xaN1JhS3loenU4OUto?=
 =?utf-8?B?NnhMMU16UEVQNDg5ekwrcHNQSWpRWnFtNGVEWjE5VFlHUkR6KytVYXd0MzhD?=
 =?utf-8?B?TWFHOGtNbFErMkl0RWIvdFRLeU5XTUN4MnVOOEZkRGl1d2NzWjRsQytIekRO?=
 =?utf-8?B?TmFsUUU0ZTVDZ0QrODAzNGEvcWY4V3k0bitoU29qZ0hBTm1ZUEpXL0QrZXV5?=
 =?utf-8?B?NFk0QnQxbVJGcFVwc1dESnpYQ0VuWHM0ZjM1aFlEWVhweVRzT1Z2aG8xa3kv?=
 =?utf-8?B?TGowYTQwQ1FXTnJhRktMRmh3alBrSEhPM0gzQ2h4aVdKdFFaQWp4dVhmN1p1?=
 =?utf-8?B?d3VTOHRIQkd6enlIM2xtR0piTk5idkdiaTlzeDdLc004SmUvZXdsVkNDSXJa?=
 =?utf-8?B?UnpCTmxCQmNER0FwZUNhT1pjc1pJS0t3RnRVYUhqQnNkcFRyaDZ2dGlHQUhy?=
 =?utf-8?B?c3BtYkxhcGJNaFo5V2NMVmVJb1ZRVUtxSGw2a2grNnBTdzRLZUJyak90NGQw?=
 =?utf-8?B?eVVSSmNWb01GOTNiWkxuZDFqUFdUeENnd3dPdjNocGhFRXYzeGJBSTlEYzhj?=
 =?utf-8?Q?JpA3EZv4OQMM76XYCB/qJEkg5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1c0a61-7696-4f6c-3d23-08dd6041a446
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 02:08:40.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JA5KDG/eE6wEMEA5ZXDyl4dGYeVOF0qBiX0jjlQJ85DyB/Kr4TcY/26zkz6XPQ9/dts6AeF7s5RCEIFfZfisSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 02:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212538

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTUuMl9NMy5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVj
dXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCiANCk9FUUEtbWFudWFsIHRlc3Rz
IGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQogDQpSdW50aW1l
IGF1dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCgkxLiBNaW5ub3dCb2FyZCBUdXJi
b3QgLSAzMmJpdA0KCTIuIEFsZGVyIExha2UtUyANCgkzLiBBcnJvdyBMYWtlIA0KCTQuIE1ldGVv
ciBMYWtlLVAgDQoJNS4gQW1zdG9uIExha2UNCgk2LiBCYXJ0bGV0dCBsYWtlLVMNCgk3LiBCZWFn
bGVib25lDQoJOC4gQmVhZ2xlUGxheQ0KIA0KIA0KRVRBIGZvciBjb21wbGV0aW9uOiBGcmlkYXks
IDE0IE1hcmNoIDIwMjUuDQogDQpCZXN0IHJlZ2FyZHMsDQpKaW5nIEh1aQ0KDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcgPHFhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiBsaXN0cy55b2N0
b3Byb2plY3Qub3JnDQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTAsIDIwMjUgNToxMCBQTQ0KPiBU
bzogPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnPg0KPiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRp
b25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNh
dGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXINCj4gYnVpbGQg
KHlvY3RvLTUuMl9NMy5yYzEpDQo+IA0KPiAgICAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9j
dG8tNS4yX00zLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUNCj4gYXV0b2J1aWxkZXIgYW5kIGlz
IGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgICAgIGh0dHBzOi8vdmFsa3lyaWUueW9jdG8u
aW8vcHViL3JlbGVhc2VzL3lvY3RvLTUuMl9NMy5yYzENCj4gDQo+IA0KPiAgICAgQnVpbGQgVVJM
Og0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWls
ZGVycy8yOS9idWlsZHMvMTE1NA0KPiANCj4gICAgIEJ1aWxkIGhhc2ggaW5mb3JtYXRpb246DQo+
IA0KPiAgICAgYml0YmFrZTogZDU1NjJlMDA3YzdjNjRlODYxM2ExMThhYjlhNmM3M2VkMjA2MzI2
Mw0KPiBtZXRhLWFnbDogMTdmZDUwMWZhZTIzNjE1ODhmMmFmNzJjMjI5ZDU2NjEyY2RjYTQwZg0K
PiBtZXRhLWFybTogYjYyMjdlMjk2MjVjMjUwOWIwODMwOTJlNWUxMDk3NWMzYjJkMDM3Yg0KPiBt
ZXRhLWF3czogODg2ZGVhODVhMzA0YjVkYjAzNDY0OTRiMmU5NWU3YzU5Y2FiMTRkYQ0KPiBtZXRh
LWNsYW5nOiAzNjY5YzI4ZTkwYWQ3MTBlMzhhZDIzODFlZjAyOTJkNzA2ZmE5ZmZkDQo+IG1ldGEt
aW50ZWw6IDgxYjExMGU0ZmFlM2M0N2Q2NTg3MmZmYzYwYmRhNmU5MjI3MWIzZjUNCj4gbWV0YS1t
aW5ndzogZWRjZTY5M2UxYjhmYWJkODQ2NTFhYTZjMDg4OGFhZmJjZjIzODU3Nw0KPiBtZXRhLW9w
ZW5lbWJlZGRlZDogNzQxMTA4NjlhOGMxYzU0MjcwYzNhOTE5ZWY3ZTg0YmVkODk2ZTE2Ng0KPiBt
ZXRhLXZpcnR1YWxpemF0aW9uOiAyYjBlMTE5ZDVjZTQxMDZlNzhjMjE0YmFiZmMxYzZmZTAyZjYz
NmIyDQo+IG9lY29yZTogNjAyN2E2YzZjZjI4M2JmYjYzOWJiNmMzYmMyZjM1YjNkYTIyNTM1Mg0K
PiBwb2t5OiAwNDZhOTJkMzUxZTIwMjVlMGRhZGVhZDlmNzBmODVlZmY4ZjVhZjcwDQo+IA0KPiAN
Cj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVj
dCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1
dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0K
PiANCj4gDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzUyMik6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxk
LQ0KPiBub3RpZmljYXRpb24vbWVzc2FnZS81MjINCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTExNjE1NTI0LzY0MjQwNDQNCj4gR3JvdXAgT3du
ZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0N
Cj4gbm90aWZpY2F0aW9uL2xlYXZlLzEzNTgxODAyLzY0MjQwNDQvMTc0NjgxMzg5Ny94eXp6eQ0K
PiBbamluZy5odWkudGhhbUBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IA0KDQo=

