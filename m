Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CDFC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 15:44:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7225.1783784670935842911
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 08:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=JrwIO1TY;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783784671; x=1815320671;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=a7bwV+Hx0+tJvq+34p7a34BWP3MTZdUKRFJuuYVWTV8=;
  b=JrwIO1TYs7k+6E43FEDIc9mu2D9jyR8LZev0ehojPQj8k5pI2qTTuy3h
   yMrmV6ZnW5kLcgJqjDEWYi+uFtpcXm4o0tYz65LmqxowK0Mxls5C7n2HD
   9GR2vtT0p6x8WVsHXUv662Rs9YpLormxvQ5k8AVPyQXIxy532AXUG10D6
   WxmHQ3WZg8rPRQtH6bzciO9aXCWkPQlz8W9FasK7Lxwx6eQ9tQFiu9FPL
   KD8Gq+Vs+9F6rHai961LO0Tybjp3tc4XTa6TT3kLNmqD2OV8Wtly05X5e
   xRgYrdz/85/su/Sv++bPx0bWPxnx7DuQ5CKEqEPzmaB8NnH8XOwb2Qsmy
   w==;
X-CSE-ConnectionGUID: /Y5wQMmESe+HprOdxIPuXQ==
X-CSE-MsgGUID: JFmLvvZTSbi9O93RonEPtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107262009"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107262009"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 08:44:30 -0700
X-CSE-ConnectionGUID: T66R2YnETvOGa0qEvtzTkw==
X-CSE-MsgGUID: LzXBH5XQRNmXLeIAdxdBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248762305"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 08:44:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 11 Jul 2026 08:44:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sat, 11 Jul 2026 08:44:29 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 11 Jul 2026 08:44:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5zQkzROqzyYaATw8lK5t9ZOZhxi/1cYg22SvbAV3HOIMQScAuucHAd7M/5LyLJAmq8jsO2atJdHGI450RUwX0UoO+dUjj5yocuZvkd7Ad0L3931bk8rNrYqHEm8ugWVXgsPwhHUs5mAXJGK54xYa0KiOhgi4m6owCGJphMLmNT/oXqKGLY0rGlrqPb3UtdGf2lBPCtzyjNqIUg2eoRb13gqv06eyC40Yn5+bfk0Zc93wzUSM46YVonA7TwSTqhvc/+INs0owNJs8wGFLD/LN+uX8mPNfad+eT9fOTh5y61Jna6rOIcLYVajGU52NKqphjNqL9uYZEMQtz/9rpULGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7bwV+Hx0+tJvq+34p7a34BWP3MTZdUKRFJuuYVWTV8=;
 b=X/1Dm5dgLd5uEn/tWjGPA7/vIOwMxvlihbamP/vzU6i1SWXjnR1VXW13bMlj5yXvJwSbW3hgnBmVlbGfPO+hUUqruIT5VRIaFMxnMmQeh9i/Sw0a+kTAGEHtxmfSNk8FalwYu/40EXndIFB1UzPEqy+tbk6adJa9b+Zw5ybmQNFluX6OMq7E6D2m1Y/8Yk1dH4H1kcdiNU6dr3IO7IPmcTriIbyUVQHQSl88Y/5mUWI/2Nf/N7MMgjmjGf5ymwvrtHku5ktbc+jpoXgbDIEl42bja498xxpw30/QjS+/SXVHHBlMztVPvTqadamSYVLjyDSFO8W8h5upiRIJC8fcwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF807974CA6.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f33) by SA1PR11MB5876.namprd11.prod.outlook.com
 (2603:10b6:806:22a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Sat, 11 Jul
 2026 15:44:25 +0000
Received: from DM3PPF807974CA6.namprd11.prod.outlook.com
 ([fe80::178f:c528:9f84:e182]) by DM3PPF807974CA6.namprd11.prod.outlook.com
 ([fe80::178f:c528:9f84:e182%8]) with mapi id 15.21.0181.017; Sat, 11 Jul 2026
 15:44:24 +0000
From: "Tyagi, Yogesh" <yogesh.tyagi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper
 to native clang
Thread-Topic: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper
 to native clang
Thread-Index: AQHdDtcjFGJEHVa2GEiQ3lNKm86bs7ZoepoA
Date: Sat, 11 Jul 2026 15:44:24 +0000
Message-ID: <53769c211d718b4b4591c3ab2e310ac67da921fe.camel@intel.com>
References: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
	 <6a4e457c.dfaa6ae2.334193.82f9@mx.google.com>
In-Reply-To: <6a4e457c.dfaa6ae2.334193.82f9@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF807974CA6:EE_|SA1PR11MB5876:EE_
x-ms-office365-filtering-correlation-id: 76d86451-47e9-4da1-b702-08dedf6348bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: cPHhQLnYjh6OKmJ4Uc2hhhmygPP56zt8X0LhMbnTuXHXdkdGKHRwv7j7A6TKIydsPM55c+SDUAupHGY5UcPVYWeF35Jrt0auGXYq4ntOjXCzLKgUckVR2QcBGiQOYXLTL3Pr4nkydufG8fseS+/kTcnAG1B+RZn7GS43BGOAbyoovWXdj7N7vZHoij0wGkqorpICP6EG94Mq7OLnUxvEMm+n8fC8mMkAH7yt1labY4YE0QeJvcxlcXzdTmwGNQOJWWQgrg7+Y0pHIn2DwUAyt5d/VZKoqj0k7ELYRRgO8qUVEZiWIZdfplg7UY7964Iy7eccxihL5ySb5HZAGzjC3WdpvKSLLU1lO87cRjKRdX7jBHGkoTKVNZXwWhsVhGIqXz7aMGDXTuue3CauvLrXIjL3XzeYeu0R7pmnFp71UfM+lq/n/uYTRbP/v1KgEEOyaQTCYSQXX5B+oKtuCHHvoIJornNPTip/bH1FAgldssH0P6T0nLcMDffJ5Cm6IQLoW+w2UL9Q7D2ktRa87tOrUvSVbt0MbIP84rL4RmG8fAmFMQg7GrakROUJWNGlyzM6FLDkHjixLNT/m8bCn6TnBnGg/Q6FsH60OGRXzJ/k6bjNG8/4F139xA0rt1BXCXKNlztMPqzj3tEKYL9uBzE50wmMQNL6okuLPaiMYQUdqipRhhe5H2f6IuAP3VN50MGiwkcO6230zbC3JXl/8+656pq28l73+mEFIBbVh0ibMlI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF807974CA6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZlOWRmQVQ2T3JhNUtmNjhleitQangrclozc1U2K0lHWmJqSW45UkpiRWls?=
 =?utf-8?B?V21NVVppamlxcEJ1NVNoY0dveEpFakwxWmZZTHVVZjlOaHU2M1V4cHk5U3BJ?=
 =?utf-8?B?dzMydldIUy9NMW1BdzZkNXFaWDNYM0x1Rmk3aTRXazcxSUxZWmxsYi9tbzZU?=
 =?utf-8?B?d1loYXFoaFZTVk5IcmFoU0J5bUpnMGFjT0kxZnFpNFZobkV4Wkk3dVM1bzh3?=
 =?utf-8?B?RDJBbDhYLy9JdjcySUprSmNaVGFDRnhTR3RQZC8waVhZN3V2MXV1VVpzMXZI?=
 =?utf-8?B?MVdNeXc4SFlHYjI0bjNKMWI2U0RVa1pxTS9nYU1IMGpPUjBWZzNHMnZFb2ZC?=
 =?utf-8?B?RytVa3JWOUg5RW1jaXpjcVFvL3Z4aDgweHFsWGVNMUtNTWU5YlFwQnR6KzY1?=
 =?utf-8?B?b1BrTjZPaW5rWlJHUC91NndZeXFsbG81MVJzR0xxMHE3c2lLVDZxNm16OEhH?=
 =?utf-8?B?ODBQcFVGS3FUTzltK0F2dUhKRzB2VHVpZ3NDbGJ5OWEyWjFmeW4zQU0ycnBw?=
 =?utf-8?B?azNaN2NsbUZoaHU4ZlcrOTJTRU0yNStON1BOemRqL2NJQXppUVcyN2szcXZh?=
 =?utf-8?B?N1dZTlFVb2x5eHVnMU45NVJxVlFsbUNLWlByeVVEZE1pa0dxZldJS2dvOHhK?=
 =?utf-8?B?ck9Lei9tNW11N2dtV1JEUmNnaGVyWjhNTHdBU1c1dVdURzZQN2pZTEVTUGJS?=
 =?utf-8?B?aks0cnlpczBLU1hobUNRTEVRS1BCZWZDNVpOaGpYdUVkZTdUeXNzcWJxRzQ3?=
 =?utf-8?B?QVFQM2w5S1hlMllFVVg2OStFV2ZOb3hkbm5yR3dFZUdyZkFBc1hGcFJoL3dL?=
 =?utf-8?B?T29CcmVObm5MME5raVluS2tzOUttMjI3MTJrLzErSDc3RDVOaDVXa1luMXVj?=
 =?utf-8?B?c0F4ZSs0VDk5eUlNWHAxWXh6a254bTZ6eXAvTXdya2YvRExGaDN3MWhPSHlK?=
 =?utf-8?B?RVBwVEhMTitpalBnbGVkODNlK3ZyaUN6YnMvcFZScm5pYmtVTnpJazZBbml1?=
 =?utf-8?B?a0Z3ZndQdG5lWk5NRVhYTEZnQTJvenJVNGZvUnZvOFRIVTg5Y1Zra0VBSy9Q?=
 =?utf-8?B?QWxKSWZqMW1NR1NuUjYrdzgxbEVFakM0WUlGMUFPMFZSYkd0K1Z5SmZhQ2xW?=
 =?utf-8?B?UGluMlVITVlXdldSaHFqSjdUM0tnd1lPVTJ3dkxQYStpa2JjUjFGTFFoK0NX?=
 =?utf-8?B?MDFDMmIzcE1ab1MxSmxLTGFvMDRDWjdiWkhxN0wyNEt6YkFWRHZSV0I4SzB6?=
 =?utf-8?B?Slo3UUVHWWZlS29xTm5Xa0pPQnl2WWxoVVRvY2tqRXpmVW9VWUgyTE0rQnlS?=
 =?utf-8?B?QXdWZTBDQXIydDZoNVA4a2J0bEZ0RW5aSGxNUGltNVZ1WUNnYzVNOHdJelF5?=
 =?utf-8?B?aDA5SFJFRStlS3RQa1JxZjFrQ1ZCMGx0ei9PNEcvTjhpMHpxTGJaUEZQb1Ar?=
 =?utf-8?B?WTM1SitvQWxxeTJlbi9TMDdKQW12NTJJVEJabkxSN1RIeWQwRmVhN2V3dkRN?=
 =?utf-8?B?Ykd3Wkh6bG9JM0tLNFloYkZQSTlzb2hocnFQbGFodEdVRnVFWjFHWW5SQytk?=
 =?utf-8?B?Wm1sZ0l0WFZLcnc4bVhaUlpiVDJGY3BrckdLa2N6bDZBRXNLeXcvblJHckYz?=
 =?utf-8?B?WTJXY2ZTVHFhVENYWDZxOVR2OGdPRWppemxUc2xCTkpTNy9uR0MxL3p1WldR?=
 =?utf-8?B?SkgzZ0JTaTJpY0NacExmb254a3RVb1A5QU53QWVxckcrMFJVQUo5MUxJcldH?=
 =?utf-8?B?UkQ1Mmd0TFJ5VjBoY3E3ZDl5aUFlTC95VFVQUnJBRFRUUlRNczBEa21Lejcx?=
 =?utf-8?B?cVZKNGdoNFNXWnlRQm5uaS9yQkJhOTJxOTBzN2VOYWlqVXUyR1hiN3MwMkln?=
 =?utf-8?B?ZmdDVVcxOE8wMm1VSG1ET2V3VjVBeXZyT2dkYnBDWVMyb28zcVRkWk9WRVVh?=
 =?utf-8?B?QVIvdGVtYVZrSDF4ZUpYa1dJQWZWaW5Wa3NhUzdMQ20yT1dzWHozZ3ROK0Y3?=
 =?utf-8?B?VTNyaWZKSGhtMjNOa3RkUWtEL21IU1dqbkRUTUJmUm5KdEw3N2U4KzVoQlNa?=
 =?utf-8?B?WkpGYk5qQlNJeDBvVGREMDR0cGNvNFhJZ1NSUnNSaU0ybTZRNmRwaW9icDhh?=
 =?utf-8?B?VXU1ZDI0bk40YTN6UDZOZGtoRkJMbzAyNGJlK095cFFTU3RJVXFnd0Y0ODdo?=
 =?utf-8?B?R1VHNjZHN1ZrNkgwOCs4ZWFBYlZYcEpOaUR6RUJJU3BUMVM2WUlKQ1IrNjd2?=
 =?utf-8?B?L0tBOXNCdVdrSWdFdURDaExJZFpEazNDQ1Z2ZmVJb2ZZOEFsSXE1dlhqMmRK?=
 =?utf-8?B?TWJOS2U5S00wQ0RrZTMxK2xlSHpMbGVnNDgyZytDWlVPTzRYMkdzRnd0Zk9F?=
 =?utf-8?Q?baC8XX9bURT8SbaU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E402871344C02449986CA1953F1B897@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EPx8p0+E0mYgK/alC4/flaNZP7nBtFcjA6RyK1f4Xrc7bZF52Z6UJB03De0+8YfKlWUJ2LBShh/oPZXM+Z3obmuYlAG4iXkLkqBlWPcI71abC1fkBKo4Cir+ez4qhsytGaQkubqHnoEA9a5XjNAbE5mkld2361YIMnmwCJ00biSCBw3uRf0yZLtr8/M2rpHtckq/5EzFsoTAOUjmamKfi3x+qQ6DfoLjBoo46jwio8MP3yhT9++UsTrO5LD1GW9oPZI7hl9Gr8ASjcFIHg0TdcTuEgAn2sOFYWSN1f1voFv2uOs4UAJTxy+Pu2ap433yLFsMNIVZ6l2V8poa1weEsg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF807974CA6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d86451-47e9-4da1-b702-08dedf6348bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2026 15:44:24.7748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cE6+jYXIvGFfs+rYKe093uIdweaFOCrSZG/FS1ZC+KhgV9FUY4DSNbmI/6bQPR52ivqiveTPKd5qhO5S9FTq8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 15:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240718

T24gV2VkLCAyMDI2LTA3LTA4IGF0IDA1OjQxIC0wNzAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gT24gVHVlLCBKdWwgMSwgMjAyNiwgWW9nZXNoIFR5YWdpIHdyb3RlOg0KPiA+IFNldCBDTEFO
R19QQVRIIHRvIHRoZSBuYXRpdmUgY2xhbmcgaW4gdGhlIGJpbmRnZW4gd3JhcHBlciBzbyBjbGFu
Zy0NCj4gPiBzeXMNCj4gPiB1c2VzIHRoZSBydW5uYWJsZSBob3N0IGJpbmFyeSBmaXJzdCwgc2hv
cnQtY2lyY3VpdGluZyB0aGUgbGx2bS0NCj4gPiBjb25maWcNCj4gPiBsb29rdXAuIFRoZSBuYXRp
dmUgd3JhcHBlciBhbHJlYWR5IGV4cG9ydHMgTElCQ0xBTkdfUEFUSCB0aGUgc2FtZQ0KPiA+IHdh
eS4NCj4gDQo+IFRoZSByZWFzb25pbmcgaXMgc291bmQsIGFuZCBiZXlvbmQgdGhlIG1lc2EgcnVz
dGljbCBjYXNlIHRoaXMgYWxzbw0KPiBoZWxwcw0KPiB0aGUgcnVzdC1pbi1rZXJuZWwgYnVpbGQ6
IGtlcm5lbC15b2N0by1ydXN0LmJiY2xhc3MgcHVsbHMgaW4gYm90aA0KPiBjbGFuZy1uYXRpdmUg
YW5kIGJpbmRnZW4tY2xpLW5hdGl2ZSwgc28gbmF0aXZlIGJpbmRnZW4gY2FuIGhpdCB0aGUNCj4g
c2FtZQ0KPiB0YXJnZXQtY2xhbmctdmlhLWxsdm0tY29uZmlnIGxvb2t1cC4gUGlubmluZyBDTEFO
R19QQVRIIHRvIHRoZSBuYXRpdmUNCj4gY2xhbmcgdGhhdCBtYXRjaGVzIHRoZSBuYXRpdmUgbGli
Y2xhbmcgaXMgdGhlIGNvbnNpc3RlbnQgdGhpbmcgdG8gZG8NCj4gdGhlcmUgdG9vLCBzbzoNCj4g
DQo+IFJldmlld2VkLWJ5OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29t
Pg0KPiANCj4gT25lIHRoaW5nIHdoaWxlIHlvdSdyZSBoZXJlOiB0aGUgcmVjaXBlIGlzIEJCQ0xB
U1NFWFRFTkQgPSAibmF0aXZlDQo+IG5hdGl2ZXNkayIsIGJ1dCB0aGUgd3JhcHBlciBmaXggaXMg
ZG9faW5zdGFsbDphcHBlbmQ6Y2xhc3MtbmF0aXZlKCkNCj4gb25seS4NCj4gVW5sZXNzIEknbSBt
aXNyZWFkaW5nIGl0LCB0aGF0IGxlYXZlcyB0aGUgbmF0aXZlc2RrIGJpbmRnZW4gd3JhcHBlcg0K
PiB3aXRoDQo+IGp1c3QgTElCQ0xBTkdfUEFUSCBhbmQgbm8gQ0xBTkdfUEFUSCwgc28gYW4gU0RL
IHRoYXQgcnVucyBiaW5kZ2VuDQo+IChlLmcuDQo+IHJ1c3Qga2VybmVsLW1vZHVsZSBkZXZlbG9w
bWVudCBpbiB0aGUgU0RLLCB3aGljaCBpcyBiZWluZyB3aXJlZCB1cA0KPiBzZXBhcmF0ZWx5KSB3
b3VsZCBzdGlsbCBoaXQgdGhlIGlkZW50aWNhbCAiY291bGQgbm90IHJ1biBleGVjdXRhYmxlDQo+
IC4uLi9jbGFuZy1OTiIgZmFpbHVyZS4gSWYgdGhhdCdzIHJpZ2h0LCBjb3VsZCB5b3UgZXh0ZW5k
IHRoZQ0KPiBDTEFOR19QQVRIDQo+IGV4cG9ydCB0byB0aGUgbmF0aXZlc2RrIHdyYXBwZXIgYXMg
d2VsbD8gQSBzaGFyZWQgaGVscGVyIChvciBhDQo+IGNsYXNzLW5hdGl2ZS9jbGFzcy1uYXRpdmVz
ZGsgcGFpciBwb2ludGluZyBhdCB0aGUgcmVzcGVjdGl2ZQ0KPiBTVEFHSU5HX0JJTkRJUikgd291
bGQgY292ZXIgYm90aC4gSWYgbmF0aXZlc2RrIGlzIGFscmVhZHkgaGFuZGxlZA0KPiBzb21lDQo+
IG90aGVyIHdheSwgaWdub3JlIG1lLg0KDQoNClRoYW5rcyBCcnVjZSwgZ29vZCBjYXRjaCDigJQg
eW91J3JlIHJpZ2h0IHRoYXQgdGhlIFNESyBjYXNlIHdhcw0KdW5jb3ZlcmVkLg0KDQpPbmUgY2xh
cmlmaWNhdGlvbjogaW4gdjEgdGhlIHJlY2lwZSBvbmx5IGhhZCBkb19pbnN0YWxsOmFwcGVuZDpj
bGFzcy0NCm5hdGl2ZSgpLCBzbyB0aGUgbmF0aXZlc2RrIGJpbmRnZW4gaGFkIG5vIHdyYXBwZXIg
YXQgYWxsIOKAlCBub3QgZXZlbg0KTElCQ0xBTkdfUEFUSC4gU2FtZSBmYWlsdXJlIG1vZGUsIGp1
c3Qgd2l0aCBub3RoaW5nIHNldCByYXRoZXIgdGhhbg0Kb25seSBDTEFOR19QQVRIIG1pc3Npbmcu
DQoNCnYyIGFkZHMgYSBjbGFzcy1uYXRpdmVzZGsgd3JhcHBlci4gSSB3ZW50IHdpdGggYW4gZXhw
bGljaXQgY2xhc3MtDQpuYXRpdmUvY2xhc3MtbmF0aXZlc2RrIHBhaXIgcmF0aGVyIHRoYW4gYSBz
aGFyZWQgaGVscGVyLCBiZWNhdXNlIHRoZQ0Kc3RhZ2luZyBkaXJzIGFyZW4ndCBzeW1tZXRyaWMg
YmV0d2VlbiB0aGUgdHdvIGNsYXNzZXMgYW5kIGEgc2hhcmVkDQoicG9pbnQgYXQgdGhlIHJlc3Bl
Y3RpdmUgU1RBR0lOR19CSU5ESVIiIGhlbHBlciBhY3R1YWxseSBicmVha3M6DQoNCm5hdGl2ZSB1
c2VzIFNUQUdJTkdfKl9OQVRJVkUsIHdoaWNoIHNpdHMgZW50aXJlbHkgdW5kZXIgYmFzZV9wcmVm
aXgsIHNvDQpjcmVhdGVfd3JhcHBlcidzIHJlbG9jYXRpb24gcmV3cml0ZXMgaXQgY2xlYW5seS4N
Cm5hdGl2ZXNkaydzIFNUQUdJTkdfTElCRElSL1NUQUdJTkdfQklORElSIGFyZSBTVEFHSU5HX0RJ
Ul9IT1NUIChyZWNpcGUtDQpzeXNyb290LCBpLmUuIFRNUERJUikgKyB0aGUgU0RLIHBhdGguIGNy
ZWF0ZV93cmFwcGVyIG9ubHkgcmVsb2NhdGVzIHRoZQ0KYmFzZV9wcmVmaXggc3Vic3RyaW5nLCBz
byB0aGUgcmVjaXBlLXN5c3Jvb3QgcHJlZml4IHN0YXlzIGJha2VkIGludG8NCnRoZSBzaGlwcGVk
IHdyYXBwZXIuIEkgaGl0IGV4YWN0bHkgdGhhdDogZG9fcGFja2FnZV9xYSBmYWlsZWQgd2l0aA0K
Y29udGFpbnMgcmVmZXJlbmNlIHRvIFRNUERJUiBbYnVpbGRwYXRoc10uDQpTbyB0aGUgbmF0aXZl
c2RrIHdyYXBwZXIgdXNlcyB0aGUgcGxhaW4gb24tdGFyZ2V0ICR7bGliZGlyfS8ke2JpbmRpcn0N
Cmluc3RlYWQsIHdoaWNoIHJlbG9jYXRlIGZ1bGx5LiBWZXJpZmllZCBieSBidWlsZGluZyBib3Ro
IHZhcmlhbnRzOg0KYmluZGdlbi1jbGktbmF0aXZlIGFuZCBuYXRpdmVzZGstYmluZGdlbi1jbGkg
Ym90aCBidWlsZCBhbmQgcGFzcw0KcGFja2FnZSBRQSwgYW5kIGJvdGggZ2VuZXJhdGVkIHdyYXBw
ZXJzIGNvbWUgb3V0IHJlbG9jYXRhYmxlIGFzDQpDTEFOR19QQVRIPSRyZWFsZGlyLy4uLy4uL3Vz
ci9iaW4vY2xhbmcuDQoNClNpbmNlIHRoZSBwYXRjaCBncmV3IGEgbmV3IHRhc2ssIEkgZHJvcHBl
ZCB5b3VyIFJldmlld2VkLWJ5IGZyb20gdjIg4oCUDQpoYXBweSB0byBjYXJyeSBpdCBpZiB5b3Un
cmUgZ29vZCB3aXRoIHRoZSBuYXRpdmVzZGsgYWRkaXRpb24uDQoNCj4gDQo+IEJydWNlDQo=

