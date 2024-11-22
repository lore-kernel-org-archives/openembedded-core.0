Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD55FE65D10
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 01:23:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web10.14611.1732238621175929861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 17:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Z2aJKW4G;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732238621; x=1763774621;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6jBL6gPoi5bcPkBuqhDEUxB1ehO2nrKGHQ8k5RpxkIc=;
  b=Z2aJKW4GIw7PK/1w+PIA4iU7Se1TTvOyOoIaCplkbrbgVgPMHaMfzYqN
   nndQwdOgBv6dokhdOWqS2d1s1yTOQbxMYX1oik8pMfTHwBIqwx2vDCFDc
   fvQAq1k64tRwitzkG91gEwKHLAQjCXOzClFl7eDsinVEjhCdZqAcsdBLd
   u88x5ucJ48gSo/VVI3FrF/y+saj7cqwHSkty6ObZe2Cmq3nFMVByWvcUc
   cnQxgg80R5zh7lBoZa4YkL6dVWJ1pqtQcPMg5vF5xzx52Jc7/gMSXASfY
   gkTnsFknIfvATWuIrlTGXIZn84CTTQuG8Gm0TRo9KfB6MtaW6eZJCvVVN
   w==;
X-CSE-ConnectionGUID: TWV2TDfCTz2kLfUBiUKY0A==
X-CSE-MsgGUID: R0/+NRIETqeqcG2FLxGlnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="31738772"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="31738772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 17:23:40 -0800
X-CSE-ConnectionGUID: d/0CRbTpSgGCMLF2dAQc/A==
X-CSE-MsgGUID: QBTHtZZZSuijvRKpNAGKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="95374756"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2024 17:21:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 17:21:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 17:21:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 17:21:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE5sJw17k+f/k6MxRL1UcKE3fvqtGhoMiR70bHozgY41wUrNunwazxrrUtOKaBfI5sTjkvpqFuQKvHsKtbN8rU4NSPLAjHE+xsLYA65JnZQKCFKT7BS6lzUopybEEFZbbrMnpmRx/v/uAkfNg+Js9kzCaHTRgEWW4aknsNIKvwE2JBQRkFL1n8rAYepR615GNGCmIiu7xEZ8wpRHz2MCfjmaOKK8nqwhz+lcFA5hjG9G00EPbmRzwq6gR2fQK8zFxyHasC0ZSrOMNSCbFu9eAjTVf1T/61lG6wek0LRwr+HacXLvregYz49sgShmdx17jYKDdqsixDvd26vMGF0yZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jBL6gPoi5bcPkBuqhDEUxB1ehO2nrKGHQ8k5RpxkIc=;
 b=GMT1KfZWiIpW+d2rNacBfqLytIDNge0IkAbPMqT6rT7tOBnEDJSem7dSd9cWTihw+6SKHsomtHiqjyR7xhiFxC9siGiUZ5EE/fqXV0jgnPdmV5FyxiuJcr6X8sxu9ZVTjOzQVC1jzq0f+cg/NcP/HYXNJ4HiXm7kOEppjS6TH+nvtEuiLji5UbGce5fgzm9CsaqU/zwUpMvC4azOjAwEn7orDo0FgY2tArS9/1uk4ybdFMJSHsSnWw/7HAvuimVbpgitwyGHfS2OlT75Fr8kSAxJOApmU/B/VkA2AYOwx33NsbD/5yNb+w5DW3vOsQKRpxtxVjMkS6d+w38cPFcfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 01:21:29 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8158.021; Fri, 22 Nov 2024
 01:21:29 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.23.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.23.rc1)
Thread-Index: AQHbOCxXsjr6K4OdCE65KOhZlJS39rLCiFCw
Date: Fri, 22 Nov 2024 01:21:29 +0000
Message-ID: <DM4PR11MB776007E6DAF575D69DF41FD1A1232@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdbKwz6Og979Mj0XUbxvrXtih5g-EY-prd4sypzLw-g8rQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbKwz6Og979Mj0XUbxvrXtih5g-EY-prd4sypzLw-g8rQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA0PR11MB4637:EE_
x-ms-office365-filtering-correlation-id: 8e3597ec-48e7-4d43-d659-08dd0a93fddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OWxrUEpLOGFXTmRnNUgzd3ZyUGxmd0N2MFpUSVVhVjVmL25QZitCU0VWZ1VP?=
 =?utf-8?B?Z3ZSUURwZEJWTG5McWZ0RUt3NE1nK0JyYXhKOUNMUzc3ZGRZdUxsYVJoYzh4?=
 =?utf-8?B?NHUrTklEODFSTkRSMjkrQmJQTHVjMEFrN3pJb21LYUZMSWhlVUliMFAyR0JM?=
 =?utf-8?B?RXhBVzFLc0g3U3hHUGh6aDhZb2NLWk5SMWFIa0x5dUVxYi9UYTNNWVJ3Rkt1?=
 =?utf-8?B?MG5pblFid0p0QTdobG41L0tGYVdCelBYaUt6c1Z4MU1WS1NjTm1OL2FacUp1?=
 =?utf-8?B?M3hqQXdCTnRRK0piMU1Qa3d1NkR0bk55TzdMSWY0UFNHMzNlTXd3bzdvZUhW?=
 =?utf-8?B?OURKTjVFU2x3NEIyRGVaWVgvSC94M0YzVHBaeFdwUUxiN2F6V0luKzZQdnN0?=
 =?utf-8?B?Ykxkb1oraDNUanhKem9hcS9pQkZrM1Ivb0dQOEd5cHlmbGIzM2hvczZ0M0VD?=
 =?utf-8?B?RlRqQWdKOWxwN0FyVmpQVVgzZWQxbHBvS0o2blRWL1JuRkVmcmhzRWRTRjZB?=
 =?utf-8?B?OWUwWXFUSHlTdWhmdnIvRDBiNDI2WUFFaVcyOU14U045dk1oanRKUm1tb0lS?=
 =?utf-8?B?Zmh5VFZZNEJ0aE4zdWgwdURtbm1sQlNEKzF4RDgvTzNPeXU3SkpvOEwyaDFy?=
 =?utf-8?B?OFZTekRIK2FtcXlWL0xyamhrbGVxb1BrVDlSMFcvV3Z0cllSR2NhZXUweDVG?=
 =?utf-8?B?V0ZKZW9DSkxHcWFqUUszZnFkQ0hBR2VBVkFjVFNyTTE1aGU0Rm5HNUcrdUFY?=
 =?utf-8?B?cXZMNjlydWwzblVhU1pqQndVZ0pTN1RKRGI1OTd5dnhiSWJqajFRSG9SaDd1?=
 =?utf-8?B?RTdkdlI0N3NVRWdoZkRYSXRsUDBYZGNVK1BkL3UydTlnd24zdHAzT3JrRG91?=
 =?utf-8?B?R3owSGhOa1NHWklWVjVkZXQvanZsYjhSSVRrNGx4aDk0NHRPTW9EMVkxT2hN?=
 =?utf-8?B?S2RjRE43VTV6U05PaGwwVnNBb29RTndmWUE5a1BLMGx4eFhPVzZ4TzBCZGFm?=
 =?utf-8?B?akNCalArUS9aVUpBQ0h4UmNibFk5L2xHS1c3K0NPcXc3OWZ5bFJFY213OUJi?=
 =?utf-8?B?NENtZmVab3RkTm5lUFU1Mkx3c2ZsSHlLMTdOQWZsdDVqVkJaUXdDT2FsOFZY?=
 =?utf-8?B?OWh1TWVEZ1JFa3FBbnFPWWdwS1JGOWhaT0NvaE1NZ0h4eHM3OEdnbUZLa2E2?=
 =?utf-8?B?V1BSQWgzZjVCQXJUdnNaZVJ6REI3b3dxR0pGc1ROTnlRY1FYL3BkUUgyN1E1?=
 =?utf-8?B?eURWMFR3d3NrckF3RWt5U0h3Q0RVbHRXK3pEYkRvNi9aaGNGNzZyNDdNZzIx?=
 =?utf-8?B?SWNpNnJNWWNJZ2lmUWJiVWxJbld5QWQvL01KU1hKbEJQZzAyb3NEdmE4VHVt?=
 =?utf-8?B?S0lLeGVNazNwUEZ5Q2RmdVh5VXhWSjJycG1rQjhRVDFrS1JWSWlNYTg4ZU5m?=
 =?utf-8?B?SGlYMlkxY1BWQkJLWXNkeVpNRm9URmFnNXZXV2w3RjdFbTJrNk95VzF1Unkz?=
 =?utf-8?B?WCttVkNzVFlmdjV2MWYvdFN5NnR6OEZuSEtlMzBhNlNHWDFlOXAxeEFhUkt4?=
 =?utf-8?B?NHpaTVlaakt2NHJMdmc5amdYY0hwTlFvUHpMYjZxVk9vbGROLzRySUhadVA3?=
 =?utf-8?B?QTFRbG1YTUxpMFd0SFJqbmV2ZFc5a0ZCWFJqQUR2eWxJcEZsQWhGMUZMOVVm?=
 =?utf-8?B?bUJKNFc0b2thRDY1VU9xMGc0RHhHRmJmMjV1ZHk1RUJkQjMrS0drOU93SXJy?=
 =?utf-8?Q?ASI6cAmvybwGCVH1C4wChq4E8BhtkYY34vjtB8S?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d3huMnNEbVJsVzQvZ3dhdUVBOG1vTmFINDFxSUo2czl6LzZmVmNSWGdKRlJx?=
 =?utf-8?B?UnBXUEkxeFE1RHNYbnNYMmNSdTMrRURUR3VldXpMeFludGNmUkl3YyswT1R0?=
 =?utf-8?B?NFkvQ0FVQjZ6TnBjbk4wUHBTNHArT0xXTldUTlNoWUxNQ1N0UE9NaFdSL2ND?=
 =?utf-8?B?bjh1bkJqNVRhVjBPVWJUaloxS3hPRWN4UjZGQk9HTTJZbnY0cTh5cW94V21J?=
 =?utf-8?B?OVFUeWovQUhDZXNxVEIvakwzQ1hVUnpQSWRObGVnMUljQ2xCRmtpSldYakxR?=
 =?utf-8?B?V1poWEloU3I0cEpnTXJCTGVkTWpGclVQWjJNUzRtWDYrdndxeDhJRVN1WVNW?=
 =?utf-8?B?WmNsQzlldjFLbmdHT3N5TkNISXd5YkxqdkVxYkNobnNOQU1KRE96cmtaK0J1?=
 =?utf-8?B?cUYybm16U1dDUUNoVVlKaHRmVmJldXNoUkZRcE44VUtmM00zcUFSMnJIRUFT?=
 =?utf-8?B?bk5XZFY2eUVtU2Jjb0tJTnpwUWpLWEs4UWpuT3VwWm8yaUUvYkYzN2tkVktM?=
 =?utf-8?B?QURTOS9CRmF4aGlZVGVuM0xubWh6Uk90em00V3pHUjJLM29MMXU5NGVrWHZo?=
 =?utf-8?B?dE9HYUJXMzJHc1F0QTRqeEpzVStidFVYT3JZRzVGbCtMSUJVZWN4cnhyZDZz?=
 =?utf-8?B?NlBrVmVZNFRtMHFVYmFQcXpJUUNaTENnMU40MGY4OWJDRHZPOVdhbXZSeHpX?=
 =?utf-8?B?d0xHbm5xY2ZQN3VoaHZGWFV6Mm9Idi9UUUVaQmNRMTRuYUV0Nmhnc05ZTmF4?=
 =?utf-8?B?QXFuZlNodUtnN2lmV3doS0EvVVg1S0JKazQ3OG5rM0h4c29aMnRhbGFybHRE?=
 =?utf-8?B?V2hVWHd4RVhrNFBKaVVMZ2t3MDFiWEZqWlFoamdSdnVKNE9tM2JYc055Q05k?=
 =?utf-8?B?ZG8rSkVPV0htdFJuVi9qbHo0cUlFNjZuSnZhSHNUOHlkTkZVUk5mUWwveFl2?=
 =?utf-8?B?MEpNYzQvK0hFaTAwSmJGNVU4TXZZNmNOemNQRkUxb0crVHVWc1diOUtsZkl2?=
 =?utf-8?B?SWpLTDNqc3gyMzBicC85c25WMXhoVU5vbVA4VC9pbXZST2dVeDhjUDRSM2ZP?=
 =?utf-8?B?eDdxY1g2eWNKVkhYdXZWY1ZWQlFreEc0bVVOQkdpeTBUOGNCUDNZM2lEWkYv?=
 =?utf-8?B?SnE4bnNFY3hrdUNZdG5vUlVXOHgrT2pJYk50ZEtwL1ZPVFQvK29qWWFrNlF0?=
 =?utf-8?B?bEQ5OFovVzhLNEdPTHZQU3hZbkdKVEFySGRkWWEzSHM5QmhiOGljTlkydmQ0?=
 =?utf-8?B?ampHUWt2U2IvdnJTcmh5Wm1SM1BkSHduVTJ3VHRtbHozWmFZelJDcGgzdngw?=
 =?utf-8?B?SkhzZEZ2ZExzVmRUZncxVEhsOXdPTUhSVEZhM3dtcUhmMEFubC9qSW01Nm9I?=
 =?utf-8?B?TXViSjBJaDdsSCtIMkg0Nzdsb0hZNG00T2JGVFZpb0RZVjVUTUMxa3JhYUQ1?=
 =?utf-8?B?OGM2UjRFTEdZNEFVU3BPajlOaDdZQ2JPYi9HSTNmSy9CTVlVN014WlZVUHpQ?=
 =?utf-8?B?TzVwd3A3Qk9kbi93YzY4VGY2MVBJczlKSmFxM3RXcEVnaVVFN0thNEFISkRo?=
 =?utf-8?B?N2FQcWR4ZEk0Qnp0bUZyNzZLVTFRdWNqbWQzSGlxZ2w0cjN3bVRnczZiMkpk?=
 =?utf-8?B?MkJEUTJaSi9HZWR6aEcyUkI5Y2dpd3ZiTml3TDZaaEJVb3E4UzAvZmxRK0Vr?=
 =?utf-8?B?MGN2YWhrQlhJTE5QTXV1QWwwTkV0UDhJL01xUXRBZS9LTVlib3pRNjdhRS9i?=
 =?utf-8?B?RVhoUUE4UmNJZ1Z6THUxOVIvNHNtZlc2R1BMdklZMTFWdDdNOG15aGIxM3FS?=
 =?utf-8?B?VUJUMDJ6c1QzaEJTU1ZkUEhOWVlCQmUyQm1GS1F1d0tNVk9EUkx2cm1BSjJV?=
 =?utf-8?B?SER6d2laK2tXWmRySHh0TmFUbjd2Yjk3bEZ4WjV2ckljRzVvNWg4azJyTUdN?=
 =?utf-8?B?ZkxLczgyK1YyRFRwWnZGbTF4YS9SemlFaVNYbGhOc3hVQTlVa1FMbmMrOVVm?=
 =?utf-8?B?WDBmL2MzRHg3T1BLYmFpQWVRVk8xaWJqa2NTRDZqdXlmRkJ4RTNKYmgvVy9Y?=
 =?utf-8?B?ckZtekVpODY1eGFMa29Bb0dxdk9RbkVyaE1Oc1ZhaTB4LzB1RjY2QzlnNDFZ?=
 =?utf-8?Q?ecsIf9z6wm5FX6IOVlXQK4ivy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3597ec-48e7-4d43-d659-08dd0a93fddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 01:21:29.2178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAzBt4MgaU54mL536mnOSFLO4ARDwXXP/q2DImTdJZbnJOFqIi5zp+nTj+Ii5dzwE5dVSz2eZ4GMBjGPbLoBgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 01:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207583

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTQuMC4yMy5yYzEgaXMgY29tcGxldGVkLiBUaGlzIGlz
IHRoZSBmdWxsIHJlcG9ydCBmb3IgdGhpcyByZWxlYXNlOiAgDQpodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9o
PWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQogDQo9PT09PT09IFN1bW1hcnkgPT09PT09PT0NCk5v
IGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQogDQpObyBuZXcgaXNzdWUgZm91bmQuIA0KIA0KVGhh
bmtzLA0KSmluZyBIdWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0N
Cj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBTdGV2
ZSBTYWtvbWFuDQo+IFNlbnQ6IFNhdHVyZGF5LCBOb3ZlbWJlciAxNiwgMjAyNCA5OjM1IFBNDQo+
IFRvOiBZb2N0byAoeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZykgPHlvY3RvQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmlj
YXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlcg0KPiBidWlsZCAoeW9jdG8tNC4wLjIzLnJj
MSkNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTQuMC4yMy5yYzEpIHdhcyBj
b21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyDQo+IGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+IA0K
PiANCj4gICAgIGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTQu
MC4yMy5yYzENCj4gDQo+IA0KPiBCdWlsZCBVUkw6IGh0dHBzOi8vdmFsa3lyaWUueW9jdG9wcm9q
ZWN0Lm9yZy8jL2J1aWxkZXJzLzI5L2J1aWxkcy80NDcNCj4gDQo+IEJ1aWxkIGhhc2ggaW5mb3Jt
YXRpb246DQo+IA0KPiBiaXRiYWtlOiBmYjczYzQ5NWM0NWQxZDQxMDdjZmQ2MGI2N2E1YjRmMTFh
OTk2NDdiDQo+IG1ldGEtYWdsOiA1MTBhNzNkOGViY2M1ODM5YzNhOTQxYzY4NjE3NWNiODM5MjJj
MGYzDQo+IG1ldGEtYXJtOiA5MzZjMDJlYzEzNjYxYmQ4NmEwNWY3ZjkwZTFiOTIwZDUwOTJkNjcw
DQo+IG1ldGEtYXdzOiA1N2U0YzFjYjQ1MDc4ZWVlZTI5NTc1NDIyNmViOGU1OTgwMmExMzdjDQo+
IG1ldGEtY2xhbmc6IDhiYzg5M2Q3MzVlNWY3NzlhMmRjZGMzOTkyNjIxZDVhYjM3MTgwMGQNCj4g
bWV0YS1ncGx2MjogZDJmOGI1Y2RiMjg1YjcyYTRlZDkzNDUwZjY3MDNjYTI3YWE0MmU4YQ0KPiBt
ZXRhLWludGVsOiA4NTE0YzYwYWMxYTlhMTdiYTIwYjE3ZmExNzYxMTk3MjhhOTFkY2Y5DQo+IG1l
dGEtbWluZ3c6IDg3YzIyYWJiMWYxMWJlNDMwY2FmNDM3MmU2YjgzM2RjN2Q3NzU2NGUNCj4gbWV0
YS1vcGVuZW1iZWRkZWQ6IDRhZDQxYmFlZDYyMzZkNDk5ODA0Y2JmYzRmMTc0MDQyZDg0ZmNlOTcN
Cj4gbWV0YS12aXJ0dWFsaXphdGlvbjogYzk5NmRmMzM3NjNmMjkyZGE1ZTc1MTNjNTc0MjcyZDdk
ZTIzZWFmYw0KPiBvZWNvcmU6IGZiNDVjNWNmOGMyYjY2M2FmMjkzYWNiMDY5ZDQ0NjYxMGY3N2Zm
MWENCj4gcG9reTogOGUwOTI4NTJiNjNlOTk4ZDk5MGI4ZjhlMWFhOTEyOTdkZWM0NDMwZg0KPiAN
Cj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFBy
b2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0
by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmcNCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCM0ODApOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0NCj4gbm90
aWZpY2F0aW9uL21lc3NhZ2UvNDgwDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55
b2N0b3Byb2plY3Qub3JnL210LzEwOTYxMDI5Mi82NDI0MDQ0DQo+IEdyb3VwIE93bmVyOiBxYS1i
dWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNj
cmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlm
aWNhdGlvbi9sZWF2ZS8xMzU4MTgwMi82NDI0MDQ0LzE3NDY4MTM4OTcveHl6enkNCj4gW2ppbmcu
aHVpLnRoYW1AaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

