Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E771FEEEC0F
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 04:56:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web11.66692.1726203377162861053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 21:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HPi36UZP;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726203378; x=1757739378;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jAPy/PRI5Vlwei3EGPuvxUaCNvB/16ALOzl5gVq9g/Q=;
  b=HPi36UZPmDrq+Kiu2JopuBf2MSgpiMPUOuzlRe05L7mSPWOGyosKsisc
   ZnZRPVZxeGJdlgMeR8l8hGE8fJ1wGSnZdOlWBm/GFDR7U5yu0uYL4iwuA
   gNbhUo0JmP+O1eSo5+JSXH5ny0gm/kh7TryF/ciB5965l0MQHq6D1qSpW
   g0fktA8pm3Pn3+hWWNpsYlcdK+UF9A9eX+YfUIcj8+fyXoXpc2kc45IfE
   GXWwDxCwWo1mDLBsJr2WpjpT5o0uhY7N+8379ryzXJCoArxcl8yYoimFy
   471bcn12E0lDIlCMqM/ypWc4kY+/yWu1rKSSBU6SYzFzGDmUTU/O7OZho
   Q==;
X-CSE-ConnectionGUID: cvJtSMUjTgu2Qkjk5f24NA==
X-CSE-MsgGUID: 7N5dxnrxSiS433tm3X8TPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28833397"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="28833397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 21:56:17 -0700
X-CSE-ConnectionGUID: YyTkW9XLQ4ao/dLjHbJgwA==
X-CSE-MsgGUID: 0EcpZdrxTWuDf+6yCEWRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72741866"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Sep 2024 21:56:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 21:56:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 21:56:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 21:56:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0uB3X8F/F4ShQuwQROJH1FdPxF6NbiaQWXit4yMu+qmyuk+N4B/kyPmaHEDWWx2nIy+9dkcAgGnBJpW8hQ9xecnVORpPxkPNuLjSorlFxTAMPa6IE3Ey/cteibeC/aVDHeGZs6NWkTChq2GzHQSiuBdLITm2wcarff/Wqa0CSGhvlN9aCBQlVZxlKl/+kdykelxptqdsgHBgPxdscyruNrADwbSdvHc8uKXmpmCCznicBILCzzdcjMraqyb5l3Tl0jmU8vgyhd88vN1pOoIeDwZ7nK6j11BGECalOawri5QjtnsQSKb9egjcsB1Q11Ck3SLbsEHQpGsph/SbmGTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAPy/PRI5Vlwei3EGPuvxUaCNvB/16ALOzl5gVq9g/Q=;
 b=AhB/AsnZ1bqVwk5gG98nzc4Zf3w3wqX6P78ye67KVieAuj2Y2d2kCspVRNvtyfJD+sTMh4Hv8YvClrUkaECn/5J9eMh2T2pDeUpT6ysClnlG+EElR9xMyMWfcBtMT5OwgRWi4/5ToraqtGfD+4nkEcfiP8cacFGv7huIvv4wU76a8kHoRpIBJRpnnxd9nqGxTw2/9KJ4S0DH66nuB2S1QZFjaJ41JjLw+fidlumtM0C3fFaaGT13nlgh6dljm01awxNQXcC5J5o88n15k3hXrCT92RAh6Ze4nLNafwxp7lypYc3RCtHkyb+UDebHCh3Xzr0Q0Y64rjYcN8z+qCwtUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 04:56:12 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 04:56:12 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.21.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.21.rc1)
Thread-Index: AQHbAV10Yo8u/CVS6U6tx9Qu2HOooLJVL5GA
Date: Fri, 13 Sep 2024 04:56:12 +0000
Message-ID: <DM4PR11MB77605B8BC7B4A1CFD1F09C0BA1652@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdacOpY9zesTGSJTkCqxdjH4sCEpcQjphTQeGR-7nXPNAQ@mail.gmail.com>
In-Reply-To: <CAOSpxdacOpY9zesTGSJTkCqxdjH4sCEpcQjphTQeGR-7nXPNAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB8123:EE_
x-ms-office365-filtering-correlation-id: c88f40ea-a54f-4150-5f57-08dcd3b06417
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dktFUjdGOG4rRlhUeHhEWVJYRnpXTXZmRG9Da1VDc0NZREF0VUJJN09UVndX?=
 =?utf-8?B?d1pQSWc1NGxpbUxISGVLMkxmZ09BSmY0MnBLMi9OcU5VQXVUUy9iQkttQ084?=
 =?utf-8?B?YTQ3UzcwSFQzdnpPclNUeTRtMmpLVEJEbXpGaEZIL0JyYWQxaEZrcEtKU04w?=
 =?utf-8?B?em9kR2FpNi9EQ1dGV25JdkxvWXp5ak5EVWJPUmRXY05mWWJlMTJmS3NsR2RP?=
 =?utf-8?B?d2dRNU5xQlJZYVB4b0ZTZkJrUCs5Wm15M1BTQ2wvS2M4Zm1iSUxCQ05sajFk?=
 =?utf-8?B?NnMzWktpZXJJek54RThKaFdBczA2UWxmbnRDU28wa0hRYmtFaDVhNHdYSE1w?=
 =?utf-8?B?UmNnNkVXU3lXYkFFU29FQVFIQjNONzJCbERFY3ZjaFc4U1haNHNmdkRiaTlk?=
 =?utf-8?B?Z3ArQ2tVaDRmK2o1LzdKamtkblpHQmpzbERLQmsrTWhIYWpQc0MweXRlRU9C?=
 =?utf-8?B?REhueGZOa0tVWlZ3Lzh6TXplTk14ays5RGFZU2xOazFMV1pDc1Q0OEJObmpy?=
 =?utf-8?B?Tm9kNVNydnp0WUxJZkJFbFUyak1aSEFUQnNQSHk3MjhNYit5VU10NHpBMVdl?=
 =?utf-8?B?RU4wTzNPQ0VCVWp4ZGtTSjdRaEp0ZUYrMm4vVkVnM3dDeDBqdXlZWXpteXFz?=
 =?utf-8?B?ZEVOdmt6YnJMUkE2QXRpU0lEOWZQdERxQmozM0R1cjc3cU91YVdTWkJ2WnJH?=
 =?utf-8?B?alpkdS85QkNBTEFVTUhtVVhkdDg2aUxDQlBzcUM5aWhqMXRpbVFZVHBKY0No?=
 =?utf-8?B?NWNJcEE3a2drTExlMTYrakZxRDFjSWx4Znh6QkRIeUxEVHFVQXZ0K1poRmZM?=
 =?utf-8?B?U2NjSjFvZlEzVWZFbVd5VmJVOEFVdGpmTS9ieSs0SGlPN0M2eGRiYzBqa3Bz?=
 =?utf-8?B?NUR5TFlFcytSYjZFVjRaek5MY0dCYmRYMUVydW9mSGgrZFRLVG5KRkhJV3A0?=
 =?utf-8?B?L3NBV1M3K1hyQU1CSHZjN0N4TUx6Q0ZJamFJWkhUdWFDcS9ubVZ1aEtyNGY1?=
 =?utf-8?B?L290c0RUVE9CeVlTeVNMYjRjY21DRlhiekxBdWxuNUQrb0wyL29qNS92MU8x?=
 =?utf-8?B?VVRwNkZnN3hxamxzdWpKS1F6ZXFIOS9EMk1FN0xXbGp0RHNoU3FqODlVNkVN?=
 =?utf-8?B?Mkw5MHg5czhqbWYreTNCZ25sTXB2T0VhYTMxOTNZVXc0Wjl5QlA3MW9GTGcv?=
 =?utf-8?B?VmV0clc4Zm44NW84T0FnNFJVWGV4QTd3c3NMd0RuV0VFUStlK3BtdENNa0Q2?=
 =?utf-8?B?SEZCTVdKRnAxQzRSUm5uK1dKK0V4S0NMdWVZcWg1V1I1bklFUGg4eS9HK3cy?=
 =?utf-8?B?RWlxeWZCN1dCc1Z6TFM3VHNtZEFSWVIwYjRkU244WXd2UnlOWjRLMXZJcisv?=
 =?utf-8?B?Q0RHL3pkSU0xS1FBTDFHNXFobXNIYzhoUGxhU1g5QlJMUitjS3o5MkE3L3U0?=
 =?utf-8?B?KzQ0dWw4RU43VEIzdS81aFZETFUvYWMvZG1SSGRNSW9ycUlYMU42QitoZkRl?=
 =?utf-8?B?d0ZhNkV5eU9mNW1QdmZkMmo3NkQvRGN4cDh1UkVUVTk1eUFoVWEyZTBUeUVV?=
 =?utf-8?B?MTZHcEhBNngycmxvaTZKNmkzVmpHVzJCbHdVNlQ4U2xNUzF2dkRVbTBkb0VW?=
 =?utf-8?B?RDdDUkE1ZUFlLytWQytvM09LdUNCRGUyK0ZSYmt4ZXJFNHRCd0Z1NTRnWDgr?=
 =?utf-8?B?NHA0OWY4QktZNUN1NDRqQkVIT2lMU3ZJMG5YbmZabGg1NDkvMlZod2JKTkE3?=
 =?utf-8?B?VERKR3RhTnVsUDNaVEFEYnFBVHBCYnZGNWlxRkV1WlFtVDNCR0NERHlRaCti?=
 =?utf-8?Q?cpGitUznDEb7TMX7qCJMdjbY/yYf3QupFCLtY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUszSVRlQkNCZyttWjVpRUVpUkZYR0NzNC9YZTBqSUVZV3dab1lLQ2F2SGdl?=
 =?utf-8?B?QTFBRHQvSVNpN2ZXcDdvTiswMXVZT2NnaTFSM2paaU5IeFpCL3FEWW9acU0v?=
 =?utf-8?B?UFhiQ3NTNmZwZEpsUUI1NTRkK2E5THNEOTQ3bzZtU3VCdDJLOXk0eTBoMmlJ?=
 =?utf-8?B?d2pFRFoxcjdpdkFncjE5VHdIOGR6SWExMFh0Q2g4SXdRTFdMNzNpalQ0MnJr?=
 =?utf-8?B?c01UWTRyZlQrVkFVZVlBUTJJTjZOYXBpQ3F6V0hBcXRvZUxNQWZzMEF6d2J2?=
 =?utf-8?B?MmVWQnFXMEVpUFBrL0MrdWVpQkFXSUtMUnNKSUJrT1BtME44Ynp3RVQrK011?=
 =?utf-8?B?T3U4UUJudHlIV1VINFViWTgrRTdBN3g2cFJRMHpnOFRPRWFRdEFBMTlPMjBO?=
 =?utf-8?B?R09PUXVSWlpuTmNuYXBHMDQrbG1WdTFSWVlBOEttOUM4YmMyLzMvZC9MdHJh?=
 =?utf-8?B?UVgyLzR0cHgwVXc1MXdLWkNSUnFvZGN5WWx0bm8ySmc0aC9GYlF6eWdNUk5X?=
 =?utf-8?B?Uk4rTksraEdLNzRqN20ycyt6NWFjUG51RDBEd1FMQXVZVVlMeHpyRFlIMzhv?=
 =?utf-8?B?TlB6eENOU3YzaE1kdkxJSmMrY3Jad0RCdG9pVTJTOE5iYlpkVkRoYzFqVEk0?=
 =?utf-8?B?S01YRkU1eXdkWDJhZjJvcmRsZ3I2Sk9HMUhoUXh1Sm13cW9vcDBSSlkrTVlp?=
 =?utf-8?B?QjRBcXRIQzUrVVlpczVkNHRFZVpnSnV4b2wvR2haaXdTU2h3TEF4SUFhQkts?=
 =?utf-8?B?YTRuVFVVMVE2bUM5YXBOUjc3RVAxS1BhejhJbTdESnhlaldMNnFiVHVRN29i?=
 =?utf-8?B?b1lseGI0dkNFZWN6Rk1RTVNxdmQ5Y2dRVE8rWmdham4rQ3h1TmNXZzc3ZmdK?=
 =?utf-8?B?dFJEc3o5OVljNEphb0taakU3UzJpNHFRQXBzL0F2WkxTS0tmUjNXSFVUVmJN?=
 =?utf-8?B?Qlp4L1lyU284NnJGY0pkS3VDL2R1VG92NXRNYUsxN3BGWC95WVlMQUxlN0JM?=
 =?utf-8?B?bUl0UncxR1h2NXhYcHl2NzJnc3V3ZllaOFRZR3NhVTJtTGp3SFQ3R2NTT21j?=
 =?utf-8?B?d1RYZFBsS2pOTnBldW1aVzV1dzIrM3UvNmpkOGc5UHNTa0g3dHE5cjFTS2NK?=
 =?utf-8?B?Nmh3R3lzeHdXcld1b0hxZ1N3UE92ZWcyNGF2MnlhUlFCeXVaemxXd1BpamVR?=
 =?utf-8?B?L2VPazB3eS83N2RCMTJXVHR4c1FqK3BFdWgwdHphOXQvekNQanJYZWRmbEEr?=
 =?utf-8?B?REI5bTZiakVObkgvdFptZVIyMGorVk1xa0hlYzRQakh1cEdkanlFekZCd210?=
 =?utf-8?B?MFVUK2pZcUlXd2RUWXFaaSs0QnBwa2RHOFZpb1BXNWt4QUVlWTBoOUdreUVv?=
 =?utf-8?B?eHN4YTNwZUo5Vlo5RFc3akpXRTNMOC9KQlIwajFtT2tFdThKMXF3UWJzdFhn?=
 =?utf-8?B?cjlFK1JvOGo5aEswUFVhSjE4MTI4OGVwVFI4R0ZveEYrT0FaNm15SGwwVDBW?=
 =?utf-8?B?ekoyRzZsYjJqVWtDNWE0cnFFOHIvUnVtd09UcW9xWmh0SFRGQjE4ZzFXdENC?=
 =?utf-8?B?ckU1bHNhTG5KSCsvZWVXeHdLWDhYQ0ZMWGZWZUppdjVmMmxoaE11QmtlK1Fr?=
 =?utf-8?B?bFRnMnB3OUhLQS96RTJvKytZYk1teHhXYjBXbG83ZW5DLy9kY3dPZ3FLRTR6?=
 =?utf-8?B?MUl4NU5EUmx1MzVDY29yWTRoaUYybHdlTTVMc1QrYzRRdXBoSVowblBxY0VR?=
 =?utf-8?B?TCtOQjFHbEExaHB1bXhGSVYxZkx3b0xFWjRaR0ZYTVM4Z1BQcll0blUrYUFK?=
 =?utf-8?B?OGRjQXlvRHE0ci80aFEyWCs1Z25ob25xQ3JVRXJIUXFaWmFEMGJvYVo3MEdS?=
 =?utf-8?B?YXk3WTg1Z2p1U2JQUC9CN2ZOQXpUd3hINGpPTjR0NTlFRWlXNC9HNDg5QkN4?=
 =?utf-8?B?dDVjcXBxTkswYlVEOFVKN28yNVE4THB6RjJFZTcvVTdVN0Zqc2pwN3lNMHNr?=
 =?utf-8?B?WWpjR2NoWkVwblJodktuNTFMVWhUa0NySTl0eFh2NVYzaFh0YjRoMXprTi9D?=
 =?utf-8?B?Tm9iTmRtVDFGZ1hGKzVtNjREWjU4U1VlUUsrc3VVOEFHRUovZGc2bDAxak1z?=
 =?utf-8?Q?8QbpCaKc+XiHQZLyjpDEODDWm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88f40ea-a54f-4150-5f57-08dcd3b06417
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 04:56:12.6311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NEgIQkZgyq2KA0B91cTk2WdZVhDz4F3U8x3tQPT04t8itGwc+rLV78WrFA06W4zwW43Oxt7Xe5zmSP+YaMc/UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 04:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204468

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTQuMC4yMS5yYzEgaXMgY29tcGxldGVkLiBUaGlzIGlz
IHRoZSBmdWxsIHJlcG9ydCBmb3IgdGhpcyByZWxlYXNlOiAgDQpodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9o
PWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQogDQo9PT09PT09IFN1bW1hcnkgPT09PT09PT0NCk5v
IGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQogDQpObyBuZXcgaXNzdWUgZm91bmQuIA0KIA0KVGhh
bmtzLA0KSmluZyBIdWkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBx
YS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtDQo+
IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgU3RldmUg
U2Frb21hbg0KPiBTZW50OiBTdW5kYXksIFNlcHRlbWJlciA4LCAyMDI0IDM6MzggQU0NCj4gVG86
IFlvY3RvICh5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnKSA8eW9jdG9AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlv
biBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyDQo+IGJ1aWxkICh5b2N0by00LjAuMjEucmMxKQ0K
PiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNC4wLjIxLnJjMSkgd2FzIGNvbXBs
ZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXINCj4gYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0K
PiAgICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tNC4w
LjIxLnJjMQ0KPiANCj4gDQo+IEJ1aWxkIFVSTDoNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84My9idWlsZHMvNzMxNw0KPiANCj4gQnVp
bGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IGVjMmE5OWEwNzdkYTlhYTBlOTll
OGIwNWUwYzY1ZGNiZDQ1ODY0YjENCj4gbWV0YS1hZ2w6IDdhZjNjNGFkYTI2ZGNkYjkzNDk2OTYy
YjcxODlhNmQ3MmUxNGE4MjQNCj4gbWV0YS1hcm06IDI2MGUzYWRjMmJmMzIyZjUyZDgxYzA2NDJj
ODI1MDg4YTg4YmIwNTENCj4gbWV0YS1hd3M6IGM1ZjU1ZGZjZmRhY2RjODg0MjhlODQ4OTAwZGRj
NjRkOGIwNTEyYzgNCj4gbWV0YS1jbGFuZzogOGJjODkzZDczNWU1Zjc3OWEyZGNkYzM5OTI2MjFk
NWFiMzcxODAwZA0KPiBtZXRhLWdwbHYyOiBkMmY4YjVjZGIyODViNzJhNGVkOTM0NTBmNjcwM2Nh
MjdhYTQyZThhDQo+IG1ldGEtaW50ZWw6IDNjYmZkZGY4ODE5YmRmNmMxMDM0M2M4MWRlNDE5YTBl
MDVhY2EwNzQNCj4gbWV0YS1taW5ndzogZjZiMzhjZTNjOTBlMTYwMGQ0MWMyZWJiNDFlMTUyOTM2
YTAzNTdkNw0KPiBtZXRhLW9wZW5lbWJlZGRlZDogNTJlY2Q2NjgzNWRjZmQ4YjRlNTVjOWNiNjMy
NTkwOGNjZWE2YTRlNw0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiBlMGNkMDllM2I4MzY3ZTI3NDVh
MjdkYjJlN2ZmMWY4NDUyYzhjZjQxDQo+IG9lY29yZTogYzQwYTNmZWM0OTk0MmFjNmQyNWJhMzNl
NTdlODAxYTU1MGUyNTJjOQ0KPiBwb2t5OiA0Y2RjNTUzODE0NjQwODUxY2NlODVmODRlZTljMGI1
ODY0NmNkMzNiDQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJv
bSB0aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3By
b2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZw0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzQ2MSk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3Fh
LWJ1aWxkLQ0KPiBub3RpZmljYXRpb24vbWVzc2FnZS80NjENCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTA4MzI3MjAzLzY0MjQwNDQNCj4gR3Jv
dXAgT3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1i
dWlsZC0NCj4gbm90aWZpY2F0aW9uL2xlYXZlLzEzNTgxODAyLzY0MjQwNDQvMTc0NjgxMzg5Ny94
eXp6eQ0KPiBbamluZy5odWkudGhhbUBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IA0KDQo=

