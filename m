Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2BFD12D60
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 02:16:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web11.49903.1731291362844965573
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 18:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VVxjRHcT;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731291363; x=1762827363;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vc4ISXHdAGzkgxnD3IMUD1vkPBJBmGtqBHkUmCjl4RM=;
  b=VVxjRHcTxcKOgWekBpqUFqBuG/H92Sqb23irDBpH4TYwGMqMiE99b4u6
   6opkemA4HobisQgl4LxBvD2e8GP6jF0y+titvaKAhUj7HOr1xds3jD/Oq
   aMoEUN5Xu9sQJ48uYQ95TYBwc7LA/CheIWew2335p29b9AZOt7598FSm5
   Ysj04tevOwIzZJw5SXBGa8vN8urNEsSYkhekeo7GIyqqVT+R0Slxacw9f
   kSEI90CRGXH2plo6EAdAgyVhgL5JubAIu6Do9b7IoNWBsGUn//tf/0Ybg
   Cf+Dyt6c4fT4eKFBJk1hxyPMTUQVdmK7K7tUsYgyR4i1nvpLPCl1rHVhl
   g==;
X-CSE-ConnectionGUID: 1RrvOZFOQ5y4RQX1n2wEpw==
X-CSE-MsgGUID: 3M7Z6gluQZOXX0XIxbgYWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53652273"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53652273"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 18:16:01 -0800
X-CSE-ConnectionGUID: envsyrrMSVeeaVCESwPU/g==
X-CSE-MsgGUID: 0VKJ83azTQ2jkbYhAGQojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87136248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Nov 2024 18:16:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 10 Nov 2024 18:16:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 10 Nov 2024 18:16:00 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 10 Nov 2024 18:15:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPBE1U6YMOrXdvo06tOBKs7BFM8l5cE3QqGfvgOwOqtNQQkEdVGb48MZzP2Ma4ZKIiN8ZaZi27cI9vR4AHWP57WlMZdZWH5+j188XNbgAZ8bBrb/w0eEQM7bQ8CDKpVt8t4p3zQiCjw6euvjQlalLn62Sw1RyJN0iclzSICJbigiazTeabx5WRMo3YIUqiRMhP3cz0f7BGlwAHjN2N76T9LNDDTY1InX/UxjdmYNsmlqmVJ/EVsfPP9Ba5xrq/nVEgzeMSRdlbY5pRMupQLDeZWbBv3AXvaJ2sB0V3By5rVmKfLSIByM025tnP0OD2Xm8vp4nqErgM7fZ/FYq6HsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vc4ISXHdAGzkgxnD3IMUD1vkPBJBmGtqBHkUmCjl4RM=;
 b=r6lpMttqt6KJiRrYEC8F4C4JnF4It/cr6BIrD7Rzu7AY4ln0q3LlwB1W5/JiwS77vPQstWw31j45fCkYSoDR7BD4dG2elxsvadWvuKTg5PuhQ4crYVjspJIUvS1dAazvHq1NQYOcXwLp5x/jyESJjzpFZg61OlcMNWDCAfScvsgEbk5/wyG+4sdAQmLW9N4mUhzm2Nt0gFY/B9j1krPBAVEDID6aJ+mlm4dr2N8sKISoJ6LStUFG9vB9ivWQwbWr2C01qHgT+jT8CUPpkDqsVmrySVvIaxMpRNm2DU43U9HcCwVbjVOyGp/dsl039EAN/mjJvGPUdpRYL3bBRv7jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Mon, 11 Nov
 2024 02:15:57 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 02:15:57 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.5.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.5.rc1)
Thread-Index: AQHbMwBrLX3vkgBix0O8hOZJx4Bx7bKxWPzQ
Date: Mon, 11 Nov 2024 02:15:57 +0000
Message-ID: <DM4PR11MB77605656B1B183CCC0C78608A1582@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdb36OYVZ=GYOAoXbEodDSgWfPHJjnJfA+DJR-jJWE-67w@mail.gmail.com>
In-Reply-To: <CAOSpxdb36OYVZ=GYOAoXbEodDSgWfPHJjnJfA+DJR-jJWE-67w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|MW4PR11MB5936:EE_
x-ms-office365-filtering-correlation-id: 80b78084-aff4-4f33-e5ba-08dd01f6c71e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?anJrdzRjenhlN1BRK1dVM1JBZ25lZG8xSHRIV1MyYmVjY2loeWNJY2dtalVM?=
 =?utf-8?B?QTVsbUpyeWVFWGVodTZjODFZOWVZTkdENDRORmw4SXowZGx2Wjl4dlZ5eHhp?=
 =?utf-8?B?N0VXVXhxOXhWNEJmejRMR3c1eDVBL3FYS2hoN2xyU1hBNVRoV1Bja3QvWXRO?=
 =?utf-8?B?Zm1nWGZvOTIxSkszdWxLNmlRWkR5YTEyVW9KdThZemIrR3JtNUhERlJ4c2NG?=
 =?utf-8?B?amkvbUFyOGl5M2NXK3ZEdEw1eW5BVDZwSXpDTkNPMDNidzZYdjdGSDcyczdI?=
 =?utf-8?B?VVF4SGFqTVZBVjNVbzlGOEd3R1FENmh2Yy9IVklxSXNSTUx1andGWTZ3RFky?=
 =?utf-8?B?Sks0c0JQWmZmRXloLzJkbG5QcG1Fci9yKzg5K29FRUdROGlqNlhaRDU2MWhG?=
 =?utf-8?B?TW1SYWZQNXBQT2FnSDQ4bDl1bUV4WTN4MTZaeENQWThNTFlOOTM4Mmd2REdq?=
 =?utf-8?B?ZkFKU081YzZIUXMyYWRZYzZ2L0F1YklIMUV1WStXcitnWkMySkdIQkttaWd6?=
 =?utf-8?B?UDkrK2tMS0REVkEyai9sOGVXWEFOSkZ5cytnOWEyc1VJMHZmQVlqVUd4b1JN?=
 =?utf-8?B?Tmk0SlVUN3FKc21WVlZHUEpoYzEzQ0dURmtGejRuYnJ2SWU4WGhUTjJ5TWtp?=
 =?utf-8?B?YjZteHk3Nm5UZVkxK0xDdU5Sck8zUGNIb3RIWHZNNzBTZmRBc29PN0dZanFm?=
 =?utf-8?B?Zzk3bVVYYWhWRlRDSmV4TzRGK2RtQ0NEYTF5S0RKcXphS3FsRTNjYUdFUTc0?=
 =?utf-8?B?eWtMcnp5TGhlTi9wVGExR0taMmljZlZxQUVaZTFFRVhZd1ZybVhhS1lxVVp6?=
 =?utf-8?B?aDVvMDg2b3RLcHhLR3RTWUNRRUlMQUF4MWp3MmF3REpUMGRWNDhsWjA5TjlX?=
 =?utf-8?B?cEY1dURycmNZMjRPL0NBbCtPbW9iOXpiR1ZxRVppRVNsS3lDaktWd1FOOTRa?=
 =?utf-8?B?Sjdna2N3Qk9WS0FZUitLNmpwVlFqUGVvK0dOTk1vSm41ZExibzVMUktmdE5l?=
 =?utf-8?B?VEJQY0pkc1UrcEk1VUVtYndZZG9WTmNOd09xR3REbHp1bGhMU3hDNTJ1ZHVi?=
 =?utf-8?B?dEtKRXFYOXpzRXZIYk4wT2tUUkFubkE0ZXEzYUtIcTNzY2ZVT29OZ2cyNTBQ?=
 =?utf-8?B?ZmNXL1pkaFRKZXU5M1RLQWp6ckhxNkxnYktvekdUZXA3NEw4OVcrZ2ExOVNM?=
 =?utf-8?B?N3ZVNjFmMXpnRFpzb1hTSlE4ZjYzUzdKQ3VhRmQrYlJZREw4eUQ1bVlkcmFR?=
 =?utf-8?B?NTViVHJ5ejZDT1ZTN3o3bmFtVGRtRnV4MS9VQlRUWmFON256YWRHSXg3azZ0?=
 =?utf-8?B?bmxSQ043NlRjZWszSzFtS080Z2k2QnZXWWRyNjZFUk42ajR2M2FnNVdJYyt3?=
 =?utf-8?B?Z0FQeTM1aW00Yi9aMC9MajBLVHlnSFdLTjJwVWNaN2lrK0REdHQ4T1J6ZnI4?=
 =?utf-8?B?amU5SGFmcFhDcGx2UzRCeUhxazJGUHd2RFRlQWs1SHl4alJmQ0NoemdGN2ZS?=
 =?utf-8?B?clo2RGJTYVB4MmhCUE1lakU2bWl0WksvdVh2VE4wSTl5T3NPaDNLSXczVjFO?=
 =?utf-8?B?TkE5TGhWTWk2bGRmUDlGQU5CQWxsM3h5VEhMeVI2anVxR043TWRJdW93MWl1?=
 =?utf-8?B?Z2dkUVBFbEFLMk5ha20xU2pHbWhLTXNxTXpicm5XU1VHTHpxL2hncnlocHFH?=
 =?utf-8?B?T2k0akN1UFFoTEt0WUt4Qlc4bGhtdzdHcnJlQUdzWjZSVjFGV3g5QUV6NTRJ?=
 =?utf-8?Q?ybBiEOy1m71ZvWn4DmxUtrCxHK+G9bat/A9ZFaZ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk1Ha3JLVDZiSFNNYS9yT0JUeS9STEdLNWNmL0h0YWpmb054T1JIVHYydVEr?=
 =?utf-8?B?QlBUelRZRzdkRUdaQzFYVFVJZ3ZXUGh6NzRRdUhBdTg1YklhdzhiQUVMMUwy?=
 =?utf-8?B?VUZBbWZJamtFSEZ2dmx4aW4wNXBZQW9IQlJhWk5TZ2RMenBQYitLQmhpUU85?=
 =?utf-8?B?TjlXMU5PVmxuSnZyMkJrZkpRdUtJSmFWcXhuMm9uMys4a0tPcWFNc09zK3Uy?=
 =?utf-8?B?ZVppNFJUSFFHWGdXbENvWkRlVHExSUdzQ1I2Q2Z6TGhsOWVZbWNKM0I5YlhX?=
 =?utf-8?B?T2pqaEV2NkpIZlRPNldKR3JEdVpZNlRCSWV0Yno4eXMrRExCTGtNNGdSemdv?=
 =?utf-8?B?alJueWxaRGxITHg1ZFRTT1A5enlieGNaWUNpVDBKWCtmU2YwaXlrRzRBYUpk?=
 =?utf-8?B?ZkZwTHdZeThPNTYxYWZidm9BTW5LTVpVQ3VnclRmSDFRSFQwY1FCcEFGYTNk?=
 =?utf-8?B?Tzc2cWkxSVpSWEE0Vml3ck5uL1F5TDJuTEVicUc3U2U0MFF5Y2MrbzFEWVY4?=
 =?utf-8?B?OVZ2RTlkTzZCeHpHTEp5ZjNmb1dOVHdxNVIwUzIxTlpRTE9CNVNlTzBsUHFa?=
 =?utf-8?B?d0dKaDRCWHZYSjJNUzN6WEh1bFljdFdWRE9xUDJRUEdKK1pUUHdCWExwd1RT?=
 =?utf-8?B?dXc0WVFyeGF5WnJNcjdpQ2VsTit3SDcxdEl2TjNIbzVCRUgvVEVxQmo2VEF4?=
 =?utf-8?B?dithUEh6UmxNdDd3bzAvTmtzcW1OWGR3S1Ava2d2dGlXTHV6eUYzOHpBb1Y0?=
 =?utf-8?B?UmhpTTFDVUNweHlCVXNVNzFVaUNveVdDbFd2QXZUOUM3UVczRDJEeUt6SnZ2?=
 =?utf-8?B?d0FSdVpLSXVlKzZkM01pVUVicG9la2hGd3FkWFZmTDM0d3MvTVZ4ZmdJRUhI?=
 =?utf-8?B?ZTlJeDBiTmxSNE90dk4yWUVURTBFM01rcXg0MEN5a1ZnSzBReVdGM1dvMjlS?=
 =?utf-8?B?TnBwVCsrSDdmS0JTWGlSS2YxaXNVc0RXUFcwVi9obnlSdXVOVWJsYkJaWDZi?=
 =?utf-8?B?ZU5NLzR1eTYzTzhPYXh1M0VwZW5MejdDMEpDdWZ5Z0JQeXJoTWEwNmRGZ1Ri?=
 =?utf-8?B?Vy84UTB3TzNOR0h0bE5wT0FHL1h1V2hOck5WbEgxSStzTGRrS3dieGtRQk9r?=
 =?utf-8?B?aU9hQW5wZ0pLdTBWZVBwYXB2WlFSQlFhalNhd21zMlJjbFNuMEVGSnpMR09w?=
 =?utf-8?B?c0lWVC9TM3FOR1pIa25NaVNmNmJCcmJEMXpPaVdjbWdOUXhsQi9iL25jVW4v?=
 =?utf-8?B?Q2xYeVlPU2crckRVQWlkc1I1ZUZWR0ZBVHd2T3kyMEtkN240Y0VpeEloZ3J1?=
 =?utf-8?B?R2U3QkUvL1pEY2M0MXArYUYzNTJLLzF4OHNaQ283OTlKanllNlB4cnhkbWZp?=
 =?utf-8?B?WGhhOHNFL1FoTXpVQzRVNGpHZXFhS0w5elBxSEtPMm5uRGU3MXBuY1o4OGlw?=
 =?utf-8?B?ZTJtWkdJM2ZXRGdpVU1zdmNOTm5BUjRmM3ZhV3ZFYXNCUEFzalcrT2k0aGwz?=
 =?utf-8?B?RGR2WGtybnZ4VTYvZkNiSkt3STY4TlJVSndZb1A4Mit4U1ZHSTJaN3BQV1VR?=
 =?utf-8?B?SVhlSUl6aXI5dElCMldGUXBySmhlVEZwcDVpcmtQMWk4MnFGdTBRS083bVVq?=
 =?utf-8?B?cngyTmxkb2pkc1FwYWJXV3VZaHcySk50S0ZIV0NhWTJiQk93QUZPMTA5b3Nn?=
 =?utf-8?B?S1VpRTl4S3VVZWc3azlHU0haNitONkgzNmFjUVFMdXpmZkU1NFlDT3ZnZ2w1?=
 =?utf-8?B?dGo4WHpFYlVMd1VIU2xjQ2VZSHhSUEZrNXpCRjBZSEFwYldYR2xWRDF3Q1dU?=
 =?utf-8?B?SiszcEVBaWVUVjJFcmpHQVBYOW1rYlNKMS9hL2RTa2R0cTZCVlNUS0FzRkJz?=
 =?utf-8?B?UDdRTWlRUGxOeXc0aFFMVTJtT01lblluaE1tMWd1NVI4SkM4Ym1ZbVVJMzlS?=
 =?utf-8?B?YXlSK0hxUGx3VW1lMlVCall3eHZYd2IrUGFCcitUeWs0angwZUZtL2tyTTA2?=
 =?utf-8?B?TWovUWdmbXN2cURtRTZpVHI0K0ZaOTNVWThEY1E4VkNBeUg5MmZMRTRuWXB0?=
 =?utf-8?B?U0pXQnJWZ1g3RFRpcXVWRmZ0V0tTSFZ2RXo5alI3RWwvUWs1VDNxNGIxdG5u?=
 =?utf-8?Q?F5oAHTgqWIryfO9rnvFmqHeCn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b78084-aff4-4f33-e5ba-08dd01f6c71e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 02:15:57.0270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gv1u38cor0dedgqTfs4IY6LUYL6gwTcbSwUaa3EV6FJoXDGh+bpuGvwflO7ltDnTAyHZkLFXRyuGIq1i/ZqFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 02:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206928

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTUuMC41LnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KIA0KT0VRQS1tYW51YWwgdGVzdHMg
Zm9yIGZvbGxvd2luZyBtb2R1bGU6DQoxLiBPRS1Db3JlDQoyLiBCU1AtaHcNCiANClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KCTEuIE1pbm5vd0JvYXJkIFR1cmJv
dCAtIDMyYml0DQoJMi4gQWxkZXIgTGFrZS1TICgxMnRoIEdlbmVyYXRpb24gSW50ZWwocikgQ29y
ZSh0bSkgUHJvY2Vzc29ycykNCgkzLiBSYXB0b3IgTGFrZS1QICgxM3RoIEdlbmVyYXRpb24gSW50
ZWwocikgQ29yZSh0bSkgUHJvY2Vzc29ycykNCgk0LiBNZXRlb3IgTGFrZS1QICgxNHRoIEdlbmVy
YXRpb24gSW50ZWwocikgQ29yZSh0bSkgUHJvY2Vzc29ycykNCgk1LiBCZWFnbGVib25lDQogDQog
DQpFVEEgZm9yIGNvbXBsZXRpb246IFRodXJzZGF5LCAxNCBOb3YgMjAyNC4NCiANCkJlc3QgcmVn
YXJkcywNCkppbmcgSHVpDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPiBPbiBCZWhhbGYNCj4gT2YgU3RldmUgU2Frb21hbg0KPiBTZW50OiBTdW5kYXksIE5vdmVt
YmVyIDEwLCAyMDI0IDc6MzcgQU0NCj4gVG86IFlvY3RvICh5b2N0b0BsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnKSA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5v
dGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFt5b2N0b10gUUEg
bm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLQ0KPiA1
LjAuNS5yYzEpDQo+IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0by01LjAuNS5yYzEp
IHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyDQo+IGFuZCBpcyBhdmFpbGFibGUgYXQ6
DQo+IA0KPiANCj4gICAgICAgICBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNl
cy95b2N0by01LjAuNS5yYzENCj4gDQo+IA0KPiBCdWlsZCBVUkw6IGh0dHBzOi8vdmFsa3lyaWUu
eW9jdG9wcm9qZWN0Lm9yZy8jL2J1aWxkZXJzLzI5L2J1aWxkcy80MTQNCj4gDQo+IEJ1aWxkIGhh
c2ggaW5mb3JtYXRpb246DQo+IA0KPiBiaXRiYWtlOiAzNzdlYmEyMzYxODUwYWRmYjhjZTdlNzYx
ZWY5Yzc2YmUyODdmODhjDQo+IG1ldGEtYWdsOiA5NjYyZWY2MDRjZDBjMTAzMzZjMmViMjBlNTdk
ODg2MjdlYzMwODExDQo+IG1ldGEtYXJtOiA3MDg4Mjc5YzBhYjAwYzdkYWJlZmRkNDU0NDk1MWI0
NzQ2YjQ4NDc2DQo+IG1ldGEtYXdzOiA2NzEzODJlYTgzZTJkYjAzOGJlNTBkNjI4YjY4OWM2NDYw
NWQ4YmU4DQo+IG1ldGEtY2xhbmc6IDlmYmZhOWRiMzMxMzFhYmRmMzg3MGE5NGYwMDE5OWViNTNl
Mjc2ZTUNCj4gbWV0YS1pbnRlbDogZGI0ZjQ0NjI4NjQyMjQ0Yzk4ODA3NzFkMjlmZTBjZTY1MzFh
NDA2Zg0KPiBtZXRhLW1pbmd3OiBhY2JiYTQ3Nzg5M2VmODczODhlZmZjNDY3OWI3ZjQwZWU0OWZj
ODUyDQo+IG1ldGEtb3BlbmVtYmVkZGVkOiAyZTMxMjZjOWMxNmJiM2RmMDU2MGY2YjM4OTZkMDE1
MzlhM2JmYWQ3DQo+IG1ldGEtdmlydHVhbGl6YXRpb246IGVlMjc5OTlhYTFlMGY4NjNmMTQwZDA3
OWMyNjU5ZWExNWM4OTVjZDUNCj4gb2Vjb3JlOiBhMDUxYTA2NmRhMjg3NGI5NTY4MGQwMzUzZGZh
MThjMWQ1NmIyNjcwDQo+IHBva3k6IGRjZTQxNjNkNDJmNzAzNmVhMjE2YjUyYjkxMzU5NjhkNTFi
ZWM0YzENCj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRo
ZSBZb2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnDQo=

