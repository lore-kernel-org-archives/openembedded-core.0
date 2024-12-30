Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FC2E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 08:30:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web10.59239.1735547418699384859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 00:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RP0hQv65;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735547419; x=1767083419;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=76THA+gV/PWHZzir7vnl++pjFguhpxIn4t+u2hTnXDs=;
  b=RP0hQv65HjeBAupKS1KwRmcDA/Gu9VIj4+ecykOlOZOBJn7av0k+CPRY
   kjenuVAV7w67zYIWM6BjUOv1sEcjRm1GBRAqc+nXReF9LlZYs8doFGmVZ
   atWLLeCcu0QH10IUX+9+K3db14nyyOnu5TVDnOej6tSPvIm3jASaDww6v
   dSK3ZXfK8bE8XgwYyiWQiu+TvQ/RifmCImqVaPNwdGDFOTO6Fdbdf+820
   gKzg1Pp7Ef35KNtMmG0iKRsK6j62HXaSMAr+9j62K9nLdW2bWi9PWg9Lt
   vdlkZaMA6UQCixkJcQX4IA+rzxUNZpF9RzfXqoLCPWV1r3/ifsXjooS5C
   w==;
X-CSE-ConnectionGUID: YlPc0vJ+SHG5Bi+7LIFIxg==
X-CSE-MsgGUID: C0dKWCZ4RP6IXL1ctqxjXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35139746"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="35139746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 00:30:18 -0800
X-CSE-ConnectionGUID: xBWpkY0bQ42jKIhpsSxF3w==
X-CSE-MsgGUID: MrIbramBSeuEOhRjHW++bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105729609"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Dec 2024 00:30:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 00:30:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 00:30:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 00:30:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9mQDD8yYJTFxkemMjb3qubjuWmDrttI1MPuHV5VoMaVc3tTlNHxfHrIJTjvTX+HHz1RI9VbnqgpoFXyXl7ccKk/BavE7J5uuX3A35nVMEWl4AlhFtYN4hkVWsh7ZEdj+F/ORNk38ftfwA1Gfi2F0FHfiQFgghuJTQAJIB8ha6wK2CerDEVvKaGtAQTO88qQ8X0rVx4VZv2jtvsvQ+Un9mNJlX+XzLP+LyFDdtdaVSq/tds0vts1Yj7C0UzSKu+23UIXnIC38YRglNSefIwaxEP/qej2XfAsT4LBnOXnwLKtGTQ1YtI7mYALwZ4tlpDh8koU+p3EWZYChp/Pbkmztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76THA+gV/PWHZzir7vnl++pjFguhpxIn4t+u2hTnXDs=;
 b=PKvtXkn4coxgMo/LaFdUjG6zzXuZ3Rce9QSWRvcvlrs9TvGFFM6toGL/c6rY3dIigzAmBzaSCcqqSUNbc2+SlffUglxAx4/vgVdbI642Wxh2NuHVhyc2y4iJ3zBfc7NZQJ93SdcjLEsV/djJ9NcRmDVaJyyb8prCnB2VuG79B4x9oN1QOECYMUqnOsMbEe7zDbKEYNoYsRcVh4y14hxb7MFX08WWEB2hJINqWGYtompla5GW18bIq36RJCcPucFy4co+JywHnP/Ab6Gu7g7fnrrypXQfagVcBRtTx3H+kuvSAKHmfhfFEi/dVqDmC9Y5Pgbb6ISxM2qdLlwTEJQ85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ0PR11MB4941.namprd11.prod.outlook.com (2603:10b6:a03:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 08:29:21 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 08:29:21 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Index: AQHbT0NtbQ5xLneIS0uQEydZyKHQMLL+ioCQ
Date: Mon, 30 Dec 2024 08:29:21 +0000
Message-ID: <DM4PR11MB7760887B44BA32770E5D63A6A1092@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
In-Reply-To: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ0PR11MB4941:EE_
x-ms-office365-filtering-correlation-id: bba0d6b9-f2e1-4652-7fed-08dd28ac0f95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MDdLWEdTZ0YvbkgvNiswRGhRc2tqYTVGK08yUHpKczhkTTVva3VaWGZyT25H?=
 =?utf-8?B?SmhJNmtDYWowSmd3Qk04OWtmY3RsT0FkNzI2anNtVG5TYURHSlE4Q24xbHpa?=
 =?utf-8?B?bkxSc0NFckVYRi8xbnoxTkJDL01TMlNkTnFBTjhYRVQvODVnK1lCclgrMUNk?=
 =?utf-8?B?U01Nd0dhbDRRL0gxc2hHVzVYZzhxVmlwR09SaVZCTXBVdDJZUUVlMXhxdEpX?=
 =?utf-8?B?dDcwRUlURCtnVnRHZGZTakJNcmRNamVmRDA2TTgwOTIxMDIzcnF1Y2RpcHRn?=
 =?utf-8?B?cGE0WFpjTGp3d3RUcmM2aXJaUDlWajFuZWtjdnNPKzJFUGwvSGd2bzI5UHY3?=
 =?utf-8?B?U0pKWHVlUkgxeHgrd2RhdmpncTRhKzFWZkdiR3NGeVE2M2ZpZjVTQVRtR1Fm?=
 =?utf-8?B?RXM5dHYzeGYxNE94SEtrUHd2by9qM2ppTW94Ymllc1VYY0k1RDFHWFFFT3lp?=
 =?utf-8?B?SkEwZXZhKzZQbUUwdjVYUk4vYUt5RWFEc21XanE0dEJPaitoYVArU3FTaEJn?=
 =?utf-8?B?RWtmblFYWEV6QmlyQ1ZzNW95aXVTcFRVZFRVbm8xS21LL3hGdkdidUxqeER6?=
 =?utf-8?B?SG5sNGpxNEVWeW8xdjdFcTJWcFRoWDY0c0E5bCs5bXpRKzFMOEJQT3I2cm5i?=
 =?utf-8?B?cW56cnEwb0loanBadnNjbE5pZTBSOGgzc1J3Skc3eWtidHgya2ZzOWNJZ0Va?=
 =?utf-8?B?UVlHQmZQMkt0OEJlczc1d0p5cnVEeGJ5VDdqRVYrQXBuTkhSMVc4ZDRPSHNu?=
 =?utf-8?B?a0gxVE9TcVBBVXZGQ2JvNmhXbkVKendBV0ZVYnl5dVhHWnJOb25UcTFYNjM1?=
 =?utf-8?B?eHJYMDdTeEduWjdMV2MyYjJwUEZrOVM4VWlHUkVzQ0NMQnpMcHRpSW9nWHR6?=
 =?utf-8?B?b3hjNUp0NlB5cU9XQWw1Y1BNUTNONUN6cVNDQnRqYzM0eFBDOVlocVlIREZa?=
 =?utf-8?B?Y1orVGlXa1RkT1hvSldmQlBBQWdTdDB6OHBNaFp3VU1pSzljanNQaTNFekRK?=
 =?utf-8?B?SzhKQURDRW91emN4bGFVMUJWd3Mvd1VBZGkyS25DNUZHRUxRUWo2NTNtS2Vt?=
 =?utf-8?B?bG9oSzVKSmpCdnNlSENoTlEvMmRvWlpHN1FDaDRKakgwRTc3REtidlBCMGZN?=
 =?utf-8?B?NkNMWDcwTEFJTEZjbTI4OVZTQ3d3WjlPaWJSclFWTzZvZTZPN2hYamJEa0lr?=
 =?utf-8?B?NnVibms4RUlkaUtaOVptTmFudHFpbFhNTWZQSGpkRFVaZVlzcXNhOWliWGlo?=
 =?utf-8?B?ZmN1aWhINjJaY2crSzd2Nm52S01scnFuWW12dkI0cFJLQmd4Q1BiMzhBWXVK?=
 =?utf-8?B?dzNPSThOZFJVK2JnNlI4ZlBEa1dMSGNBNU0vNVRaWWdSZnh5dkhia25NOG1l?=
 =?utf-8?B?QmlDU1BlQ0pmMzhjOEQ4UDJNdDF6VWhVamFYUjU3Vkx5WFNBOHpJZWRNMXRh?=
 =?utf-8?B?SGZLbnBKMWpQNld1NTNNSTJ1Q0tTUHJCclRuWmhiTFdxQmI5d3hnS3pQclRt?=
 =?utf-8?B?Y05CcGhvQjk5QXQ5aHJnZEVzQjUyV1VNbTJmVnVFNi9SR0h0N3FnMnVUZFJm?=
 =?utf-8?B?SFI3SC9OOFFEd1BpbW1YZ244cmI0MVQ2SVpLYklCYWYvUlZSUzhaN3NkRmxp?=
 =?utf-8?B?MTc0UVpWZmc0KzNTekYrNWlFVjJycC9CL1pFM1htTVljOXFxMmEzQ1VtbmVP?=
 =?utf-8?B?Vkc0aWRLVkpmSERLck1jM1I2VzNScFJHNkEzRU5OUmpacDhKM29rVHVBTHU5?=
 =?utf-8?B?RHpZd1diWjdFNnltRHpCdDZwaXhtczF3U2ZZSnJFQ0tEa29tT3ZNZ1M3SGkx?=
 =?utf-8?B?UUhRbTZYUVduTTRkdWlvNHBWL3FDL01FK1B4cWljME1YemZFMHRGbk9ETHVL?=
 =?utf-8?B?cmo3UVlZR3IwWlRMNTZxekdOT3cwQWNqUjJ6L2RZTjEwWFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0t5QTlVNHJMblRUQk10ZkNVaGgzaldwcUVWUVhzTHFVZlp0Z0NsbTlEWFMz?=
 =?utf-8?B?MkZSaGJiMWlKR1g1V241bU5Nbk5ZNkQydkhLa3VwSlk4RUpsWlBSd0FCem5W?=
 =?utf-8?B?RktDQTJzV2svR0w5TTdDOXk2VVo2R3VieDJadnliL0wrSEdHbXFpVnYvK3NW?=
 =?utf-8?B?N2pWQVloK2E0QmFwRnVvZmk5Vk5VM24vNkg3WElvenkyQjJVWWQrY1dPL2V1?=
 =?utf-8?B?QVlFQkZ5Rk5hSzdvYis1RjdmWU5UTUxaWjl0eTFLWm9xYkMraGJ0NnRxRXFG?=
 =?utf-8?B?dExMM0JUR0ZRRFJoT1RkVTFLbjhHRFg5N0YrZDZKSXo2bkZHSlBYdmh6MmFF?=
 =?utf-8?B?QndtUmwzRDdsUitkaEk1Rk9oZmpzbGVJMzlWcmtMendiZ3JYMFNxM2JUK0Yr?=
 =?utf-8?B?SGcrSU1SOEdJM1g3eGZ0YldUUDVUa1BCa0tLUkJvODJneHRFSTR1R1JsZW55?=
 =?utf-8?B?VUtPcTFnU0RqbnRydlhRYVBvSEhDd0g0a0NBWkloZXcyNkNrNUJCU3QxcVlV?=
 =?utf-8?B?alUrUDNaVWZYLzNkNmp2RlVKelhEeUxhT0VtSGRndWFCMTg5YVJoOE5mdkEz?=
 =?utf-8?B?bEpwRmkxNmlPTEFOcCtxK2VvL0lJZjB2L001TisvNEtxdnp3ZmtWTm1RQ05m?=
 =?utf-8?B?b3RLUE1vM29rakVCSDJsV2JDY3hSK2NqN090dmlWOFdWaGJkekp2SUIxaW5J?=
 =?utf-8?B?T25tSTZhVzd3d09CNjNVVW5FSHRteHI3czZNZ29CUzBhVDVMeEJmRDVOK0hT?=
 =?utf-8?B?L1AzdHZUd1JnbGl1emo4UmV4Vy9FUjg0NHBoU1dHMnVSZmF4VEppazI2bUhN?=
 =?utf-8?B?bHQyUEgrZmx1NXcvUjluOUJ0ZDlRVzVhOGdyWm4rZjBNaGNMTG0vMGpLL2tw?=
 =?utf-8?B?MGFiVVRxbWw0ZkRxN2dxWitqQ2V1M284dTNqVkpOZ25BQUFPcHo3Ylh6bjRP?=
 =?utf-8?B?ZE51ajBTSXB0UXZEeEpkMlE3S1dPaFRqVmxuZjNaM0FhbFdaRzFNOFJoVlMy?=
 =?utf-8?B?d2V2UUtyS3FYYkRKN2VmU2JXdFJPOHRHN29EV21MN1o1TmdvK1pKSGJ3cnJn?=
 =?utf-8?B?TTBBRldMb0JpdlNZMU9Jelo1V2p5YkFLYXYyeFZIeGVtZE50VmNocGJIb0hk?=
 =?utf-8?B?clVNSmlmRG9kR0UzNlBjQ00zQ2pGUmtHVTBESmFoY2hReG5hakZFWFE1Y3Q1?=
 =?utf-8?B?Y2ZseXJPRTNsUGdhcHFPNldGSWhPMXhPR2xGOEdwLzZMSHNCN09xVmRZRGJN?=
 =?utf-8?B?YlkvUzQwaGRHeThuOFBIWGdwOXZ6STJzMkhWUTZXbTU3MzlPTVIwY0dHdFhq?=
 =?utf-8?B?Ym9PVTBWMlUyYklxeWJKdzRSV2FoMHNUT0hlRm1ia0xmZndDbGRwWFlkcXZW?=
 =?utf-8?B?Z3hWb2hHQ3BpcjFuaFhJRnRaV3R2MHpVaDlueTVjMGQxMnoxbzFlR3RURWhS?=
 =?utf-8?B?RnVNVzV4TFFUMTVtbnNXSmZCUEtKNkZncFIrK1c0VVFFUXJqWEU5Z1RoS21q?=
 =?utf-8?B?c2pmZjZvK2VOUEorUW5Mb213KzRXd05KMjJya0NEdXFJZitGRkI5Y1B4MVBX?=
 =?utf-8?B?UjZLdlRKM1J3di9POFk2SDlseE9aK0QwQmcvVE42UHRqR2F5QUVrd0Q1YjZn?=
 =?utf-8?B?UnBDRFlCcWVaWkNBaERNMy8zVzlnamJuWXR0QnpjaVdSWVQyakdocXhaTmtK?=
 =?utf-8?B?d1BTWng4ZXU0bDJZcGw3UkVoVmJrdWl4UGxKY1c3d056RU4vTXpXenJzRzc5?=
 =?utf-8?B?ZTQzRmN0NnBCcWdUT1dIU2ZjRWtmS0RFcFdtM3JuUkNPa2VSaDlHbWlwNytq?=
 =?utf-8?B?aHVJOG5RK2dZM3RVWXBhNXVMMkErOVpFb2Izbmlia1BHU0U3dmx1SlZFY2Jy?=
 =?utf-8?B?eDYwQjFKRXhSL29DUEVGUWJsVmUxRzhCcDRJLy9HM3Z1TFphUWRoSzVUVlVT?=
 =?utf-8?B?NEExNCszR3dyYlBSL0VjSExET0Z5aHl0T1UzQks1YUE3WnhCNXNsRS9OUnhr?=
 =?utf-8?B?SjUyTkhsVkJrTWhCNmZaWmxVVjFCRmovc25mcE90NEZuTlEwQlVjOG1Rd2xT?=
 =?utf-8?B?QlB2NUE3SHFlNEQwaE1DakpEa0RWREc3Sk1KSEQvdzdycnNzMmo4SEE2RWd2?=
 =?utf-8?Q?UfMAttDXqR9BEvUV0wGriDH9q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba0d6b9-f2e1-4652-7fed-08dd28ac0f95
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 08:29:21.7317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4K3iAC5yZ+k/ZKtmfuZuz4EJkxy427Qjh5Gv9LJK51/nlCkO0cprnQ/moVIvwPqb87xPd1qfYILfD/ljNscNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4941
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209151

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTQuMS5yYzIgaXMgY29tcGxldGVkLiBUaGlzIGlzIHRo
ZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tNS4yX00xLnJjMjogIA0KaHR0cHM6Ly9naXQueW9jdG9w
cm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3RyZXN1bHRzLWNvbnRyaWIvdHJlZS8/
aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQoNCj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0K
Rm9yIEJlYWdsZWJvbmUsIHRoZXJlIGlzIGEgbmV3IGJ1ZyBmb3VuZDogQnVnIDE1NzAzIC0gWzUu
MiBNMSBSQzJdIEZhaWwgdG8gc3RhcnQgbWF0Y2hib3gtZGVza3RvcCBvbiBiZWFnbGVib25lOiAN
Cmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTU3MDMN
ClNpbmNlIHRoZXJlIGlzIG5vIGdyYXBoaWMgZGVza3RvcCwgYWxsIGdyYXBoaWNzLXJlbGF0ZWQg
dGVzdCBjYXNlcyBhcmUgc2tpcHBlZC4NCg0KRm9yIHRoZSBuZXcgQlNQIEJlYWdsZVBsYXksIHRo
ZSB0ZXN0IGZvciBnZW5lcmljYXJtNjQgaW1hZ2UgY291bGQgbm90IGJlIGNvbXBsZXRlZCBkdWUg
dG8gYnVnIDE1NzA0LiBTbyB0aGVyZSBhcmUgb25seSB0ZXN0IHJlc3VsdHMgZm9yIGdlbmVyaWNh
cm02NC1hbHQgaW1hZ2UgdGhpcyB0aW1lLg0KQnVnIDE1NzA0IC0gWzUuMiBNMSBSQzJdIEJlYWds
ZVBsYXk6IFN5c3RlbSBoYW5ncyByYW5kb21seSBhbmQga2VybmVsIGNhbGwgdHJhY2Ugd2l0aCA2
LjEyOiANCmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTU3MDQNCg0KDQpUaGFua3MsDQpKaW5nIEh1aQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgPHFhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24g
QmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTYsIDIwMjQgNjo0OCBBTQ0KPiBUbzogPHlvY3RvQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBD
YzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90
aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXINCj4gYnVpbGQgKHlvY3RvLTUuMl9N
MS5yYzIpDQo+IA0KPiAgICAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4yX00xLnJj
Mikgd2FzIGNvbXBsZXRlZCBvbiB0aGUNCj4gYXV0b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJsZSBh
dDoNCj4gDQo+IA0KPiAgICAgICAgIGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3JlbGVh
c2VzL3lvY3RvLTUuMl9NMS5yYzINCj4gDQo+IA0KPiAgICAgQnVpbGQgVVJMOg0KPiBodHRwczov
L3ZhbGt5cmllLnlvY3RvcHJvamVjdC5vcmcvIy9idWlsZGVycy8yOS9idWlsZHMvNjQ3DQo+IA0K
PiAgICAgQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+ICAgICBiaXRiYWtlOiBiYTkwZmU2
NzNhYTg3Y2IwY2RhOWIyZTQ2NWViZTIwNjM1NTFmNTI3DQo+IG1ldGEtYWdsOiBjMDM2YWE3YjAy
ZjhjZGYwZjkxOTAzNThiYjhkODEyOGM0N2M2ODliDQo+IG1ldGEtYXJtOiBiMmM0M2RiZjliNGU3
YzIyMDM4YmRkNWQwMTYzMzk2MmFmZThmMThmDQo+IG1ldGEtYXdzOiA3NGRjN2JjMjFhODFjODJm
YTk2NDA5OTdkYTIwNmVlMDk3NzA0MzQxDQo+IG1ldGEtY2xhbmc6IDE0NzM0OWI3MzM0YjhhMjVi
OTZiYjA4YzIzNjFhZTBhZTk1ZTdlYjYNCj4gbWV0YS1pbnRlbDogZDAxNTA5NjRjYTdjNmE4M2Qz
OGJhNTRjZGEzZTE5YjM0ZDI3NGY4MA0KPiBtZXRhLW1pbmd3OiAyMjBhOGFkNjA1ZDYwMjQ3ZGYy
N2QzYTY2ZmFjYzg5YzE4NTRlZDEwDQo+IG1ldGEtb3BlbmVtYmVkZGVkOiBkYTUxMDk2YmNmMjU3
NzIzYTkyOWM3OTliYzY5MzQ4NzdkZTgxZmE1DQo+IG1ldGEtdmlydHVhbGl6YXRpb246IGMxZjY2
OGMzMzdhNTY0NTdhY2FjYmJlZmU0ZDFmMTk4OTIwMmJhOTUNCj4gb2Vjb3JlOiBlMzQ1YjM0NzAz
ZDRmYTVlMGJjOWE4MmFjMzNiN2MxZmQ4NGY5OWZlDQo+IHBva3k6IGZhZmQxZGIzODJjYzI0YzUz
YzE3MTcwZGY4Mjc4MGY5ZDU5M2NhMWYNCj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0
ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0
Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMg
Z3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjNDg4KTogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9tZXNzYWdlLzQ4OA0KPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMTAxMzU5Njgv
NjQyNDA0NA0KPiBHcm91cCBPd25lcjogcWEtYnVpbGQtbm90aWZpY2F0aW9uK293bmVyQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb24vbGVhdmUvMTM1ODE4MDIvNjQyNDA0
NC8xNzQ2ODEzODk3L3h5enp5DQo+IFtqaW5nLmh1aS50aGFtQGludGVsLmNvbV0NCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

