Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30936C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 08:52:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web11.4039.1711443149540798943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 01:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=cVokcQAF;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711443149; x=1742979149;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=UcFMK9tSmeZx4B0/LWRrNhKaTSCCqWLxkNlb7hnNHAM=;
  b=cVokcQAFgjrIWlPHujvy9DLhtNKFzXfSSG/MCVQHmjgq/KAulb83k4jU
   KB7FJJvHDP1zpQ/DY/ny51w1LxjEcbYE4q+14U25BNrswhJexBEbi8Zgc
   YIHQ6zGykWTd6Ds2WzMk/KELX0oZQYKVXjLSegNu2564HnJJ0SrxyhJII
   UOZwbHtbe+IOWUjOkV+oCaLDUg27oeqEPTF4L+CwN48v00tkDFGuqwuxj
   Uz7viBMHdZWEgQQIySlAM9GeM5tqf4pLZsAohVfH8uRmfs9pS7q6I99Sm
   LT0IVtPUd10ZcyBL36Dp9fwKHUPuYt6wSgFaLfWpxLaVHo0h6tkM+ZGSc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6342026"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6342026"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 01:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="20612330"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Mar 2024 01:52:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 01:52:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 01:52:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 01:52:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 01:52:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwZnsKec13wBB/ycgMPLTR7dvSm7bYqE1dPJww3lpAB3n+lrzTPdPQ+A/IAQDojl8k9LnrmDWUd/7qq3i9/4AhgNRH6/0rJ5dUTw4J0XCgjcjSu2TOXZfmohCBduOFAHMIsnTMi1pUM//i5Sjn56xT7ZONuNhyyp0W8PL0I7cWWGRU0eQb8duJ5rbMPpS/Zn4s7JcsMq0TAl88BTLMvLE6ldJko1KjnfySWyTGwX4QHLqRs432dn3H3ElP20Kjq5LXdXiSzdIl3fNrEKY13toJHIJJA2J7cXB9YJfosJ6gBTwNgteHIF8zuoUJwsjh/NWHRbWXns2pNBiL9fgJTEdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcFMK9tSmeZx4B0/LWRrNhKaTSCCqWLxkNlb7hnNHAM=;
 b=B2/xzlbwe1PcSRypS5sdGdnKQLKiiS5EHO1x4eoZZWW/vD+B/UCHMrVy3vC61mEvDF9MTBxM7pqR6LPWSUsY8MsMFJsB30ru9qgPwmzBqtzfWaBP3pv/ERfxpFuju8i/olKJuGrvGbfkuQ2+QE2eTms7mdDMqg4U8IGa5gK3lqBIkTNZN/4KsRHlrbMWuRYwRCKlAB+f5FFnDNc9UA3Vc2MoN+t8VtJj3F5dTGRYm10MgA7zMzHV8KUNLfW8goJG9TtXtLHpfL0Q0y4oGstH70afiVWT/Y7DYxDHJLVjQU2ac+gGjPaPGRT+wGgoo1wgKNJRiUb78dZInv2dft9CYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 MW5PR11MB5785.namprd11.prod.outlook.com (2603:10b6:303:197::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 08:52:26 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::9378:e70c:77ca:d46f%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 08:52:26 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "vanusuri@mvista.com" <vanusuri@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell][PATCH] go: Fix for CVE-2023-45289
 CVE-2023-45290 & CVE-2024-24785
Thread-Topic: [OE-core][dunfell][PATCH] go: Fix for CVE-2023-45289
 CVE-2023-45290 & CVE-2024-24785
Thread-Index: AQHaf1DgqfUKJBv5DUOJCs5ZA8jau7FJtzUA
Date: Tue, 26 Mar 2024 08:52:26 +0000
Message-ID: <4fa447d6273c8e12c2a7695ac47564d897c19f1a.camel@intel.com>
References: <20240326073942.187926-1-vanusuri@mvista.com>
In-Reply-To: <20240326073942.187926-1-vanusuri@mvista.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 (3.50.4-1.fc39) 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|MW5PR11MB5785:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tEmNIpug4cnIvyjcsspm2XFZSBkhyLE6KdEeuFMf08pGNkjMwAvnz22v2pRGIk/09fYPgu54feRXYdikGG66vZU979dcobPnC8wgpjLZGtxNqB/pgT8ONvTOoPOVD7PRcmt0l7FtQwjSxrRJ7/RjtQaKZY6JflnpJfO830y+d4pHAF3g4K5dKjnj6xLNnZnjH+JzFLIqiXYeuGdqY6474BowwKPuuXVPJcpjFQsLwLtZXIa5mHJWQO+/KcOuQQjl8vobzk91cDP0QSdI2doU0I1trYcXwMZg87Fn6tJqXTWXgdSJlH7ap10lV4NmBQ0KuO/kCL4+T0Q8fKCdHFVmrF7s9Iy5/rKL+uEHZHzNfFf9VX9SFOaJ/fodJXlvU3K167Z4GJAnyILOlp4FWPra1yIa6nM9gPjFO3K6MGSOdu8T0HYvefK5hQNls6Hv9/orxFfyRr1ifVwu6Sj0/HV5OIngj76vQFA5CsQz0fVzDWGmWGCF+zncU2npG6kydW58CTziG/Hfv0KBfwmGjQy8Pg73Co9nUntgvU7eDsS+TRCOUc71UHLsL9rLUh2Vj15/0hcSbQX8yoyyXfdV+RBiN379u8cvY7xWFt47/gJ5AFw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHBGeWh0d2JTWEdiUUo2alNNSE41Z3RHd0NjMk1URUNRN1AwMkJOWWp5d1FG?=
 =?utf-8?B?ZE1LZkwva3dGcDUzYklXUHk0OUYwa3dLQm9nWENBdVBiVklJM09iQ01MRW5t?=
 =?utf-8?B?OXJVMVI1QStHMTdjU2lTdFYwaSsrOHZGbzY0RVdKZ1lEeDJEVG9qVEZ5bHdi?=
 =?utf-8?B?UTNwVnp0anF6QytMbm0zMVd3eUFCdnEwZllyTXBZMGxHNVcyZnBnMDFlbzlm?=
 =?utf-8?B?SFZOekVLK1RJTW1CaWNXQlZ5TUNFVnhCV1BBeW83WmhteVB4NzZNZDZOZjNL?=
 =?utf-8?B?dGV3NFZUczJUaENXV3RDQVo2ZTUzcjhUT2pCM1JtZjRwd3VpTk50bnRiMEhm?=
 =?utf-8?B?SDJRNVRVNEhpUWxaRk5taXQ3TmRqQ0RKWVh1SFRGdk5OR3FZMCtpWXpnSXFV?=
 =?utf-8?B?RStMcFVHM2dqejBQSmNqSkMwU3NqR2QzUlowSjRDMktUV1B0WjFwdnhmUEZT?=
 =?utf-8?B?NWo0eURnVXNDbk9NdEhsL21nT1AvSnFQbERTeFpHMytqWGFmbmJHdGF3ZnU5?=
 =?utf-8?B?VnRDbTJIaTRNdDBYaUpxK0pKZURDaTVCZjFBOVI5TWI2SittWmZ3UjRaR0VG?=
 =?utf-8?B?aHdxdjJvMkF6ZExEZ1lyTnRhZGJMMUp6NVZ5Sy9JQU1CUFo2a0tHZFlLSFBv?=
 =?utf-8?B?TDdXcThIZm52RThIaW5xUkluQ3MybjJmckVzYU9qMkVHSzN4RnZnQmJRaFhp?=
 =?utf-8?B?V2sweU8wY3hJZ284MVN4NnNNTE1ia3VpdkVTekpiUFZnaTM5UW9McE1lcmJ4?=
 =?utf-8?B?WEdqZVNaeGoxYkl5Y2xFUGxqK29JSHo5ZEhrRytLUFZIanE0aUk0RE1sU0ts?=
 =?utf-8?B?cHB2eE8yWkRKakZNbVlBeEFBb3BhMDlvaUlsRVZhOTY0M3hxc1dnVXRJcjFa?=
 =?utf-8?B?YmNkSE9wUFNYSWx3U3Uza1FrL3VrUE9JMzZ5c3hUL2pTUnVpcEw1TmRmdHhk?=
 =?utf-8?B?V3F3dUJTeUZYckQ0TExFc1M5NGIxWmZjeG9GYmdTMklTSjRNbzdCeUx0cDlF?=
 =?utf-8?B?eUthT0dxd0RsZTJGUStPRWV4NDhvRWMrekdZU0xZbUVXaEVCN296WWRmR2hS?=
 =?utf-8?B?TFJuLzYxL2xlZzdNVXo1K05iM2xPY2NHUTZJNzNwSzlOSmlYSGdNSkJBcjVG?=
 =?utf-8?B?MENBckdwOU0wME1HTE5RanJwbHdPbVlUb2dNRXlJeHFFTFJ2V2g1REhraTBq?=
 =?utf-8?B?d2d6cFhZNmJMQk1ycXVickdyVEl5OVk4bG9NVjhYTUhuZXN2UzNsT09EaFpz?=
 =?utf-8?B?VFl2dW5weS9JRkd3U1lnTlJndmNYa05abkhLM1Q3V2tKQ2JBVnhqRWpUZjFB?=
 =?utf-8?B?L2pHazBIWDdBMVNObVkvMTM0SlRzd2pYTld5ZUFnK2ExVWhGYWM4ZWVuNDdI?=
 =?utf-8?B?MnlabXhucDBJMm1QMnBmWk1NV3BNNEdxRThiWnBLeWo3OUJKQks3eXBhekJB?=
 =?utf-8?B?Lyt2RCtWWXlLZ1Q1L2RwUTFrdFo4MGlFaHJDNVl6WHdwZzhWQXZnQ0RhR1V6?=
 =?utf-8?B?WE5ad3JYYlYwODhuNjhpelNTRTltZEQ1K0RPR041SkFrVVV6VTN1K2ZRMnVH?=
 =?utf-8?B?cWIwUGlaMkVLSVdZMTJnM3FoVDRsU3J2VDdNWmtjMUxyRmpWMFNmT3U3UnlY?=
 =?utf-8?B?b1FSYzZNMmsvM0hjWCtjWVVEMEprMlByT1dZT3VCK3NPNWx5R0Rjak9NTUI2?=
 =?utf-8?B?Z3JMeHdlTWdLUmtRNmJZVXJONmNnYjdCaTJDV3hHZzloQlZrTkxKWHBpdXJI?=
 =?utf-8?B?Z21pTlhFUEZrQ0lOZHRzdTcyNjc5V3V3OGRMdUFoTSt2R2xNenphL3dBV1E0?=
 =?utf-8?B?dEVieVp5U0s5UlRPWFNPNTkrV3ZmNDErT09FbGd5aXA5SytUaVJIWjJIa25X?=
 =?utf-8?B?Mm55OTh4UVVkL0kyYXN6NVhWQ0FpUEwyOW8zWGFXc0krSG53bGNIdW9keFhq?=
 =?utf-8?B?U0dXUG5JOG0xKytScWV4UU5JYWFDazNva0Nja1A5SVpaUHpld2NQdzNMaVky?=
 =?utf-8?B?TzJWbGhsTlNQeXdTWm9xQ2RJbTNDbmptUlJXRzhkQzFSNS9UVytMT2wyL2Qy?=
 =?utf-8?B?cStEN0kvMXhDblFVOU05TGdVZGFsSGd0MUllUzJIRnhRK0dQZVVaSFZkMjhU?=
 =?utf-8?B?WkI5ZW5ET1M3dWt6bVpuRGx1aXNlVXZtRjBPdTY4WUR3OUswbmYvTjBDWDBh?=
 =?utf-8?B?VzFnWTlpb2ZjVFFJZ3djdnJWbCt2WnVUUnYrLzdha1VMV1VocGJydHZ1ZEVC?=
 =?utf-8?B?bDJDWmRKc1RtK0NhT0NmOHEvSTlRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7752F57432C34E4A9C039EA0DEAC625A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12ee6bd-57ba-457d-3533-08dc4d720fdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 08:52:26.7197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3+XydUp/XcmdU2Ry/expXcgOad1WzVxAHc/JiXSzeeXJE+7obgAd0TAaJkz2augtnpXJ27qGB/vQJYhC4Guy3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5785
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 08:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197531

T24gVHVlLCAyMDI0LTAzLTI2IGF0IDEzOjA5ICswNTMwLCBWaWpheSBBbnVzdXJpIHZpYQ0KbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2dvL2dvLTEuMTQvQ1ZFLTIwMjMtNDUyODkucGF0Y2gNCj4gQEAgLTAsMCArMSwxMjEgQEANCj4g
K0Zyb20gMjA1ODZjMGRiZTAzZDE0NGY5MTQxNTVmODc5ZmE1ZWUyODc1OTFhMSBNb24gU2VwIDE3
IDAwOjAwOjAwDQo+IDIwMDENCj4gK0Zyb206IERhbWllbiBOZWlsIDxkbmVpbEBnb29nbGUuY29t
Pg0KPiArRGF0ZTogVGh1LCAxMSBKYW4gMjAyNCAxMTozMTo1NyAtMDgwMA0KPiArU3ViamVjdDog
W1BBVENIXSBbcmVsZWFzZS1icmFuY2guZ28xLjIxXSBuZXQvaHR0cCwNCj4gbmV0L2h0dHAvY29v
a2llamFyOiBhdm9pZA0KPiArIHN1YmRvbWFpbiBtYXRjaGVzIG9uIElQdjYgem9uZXMNCj4gKw0K
PiArV2hlbiBkZWNpZGluZyB3aGV0aGVyIHRvIGZvcndhcmQgY29va2llcyBvciBzZW5zaXRpdmUg
aGVhZGVycw0KPiArYWNyb3NzIGEgcmVkaXJlY3QsIGRvIG5vdCBhdHRlbXB0IHRvIGludGVycHJl
dCBhbiBJUHY2IGFkZHJlc3MNCj4gK2FzIGEgZG9tYWluIG5hbWUuDQo+ICsNCj4gK0F2b2lkcyBh
IGNhc2Ugd2hlcmUgYSBtYWxpY2lvdXNseS1jcmFmdGVkIHJlZGlyZWN0IHRvIGFuDQo+ICtJUHY2
IGFkZHJlc3Mgd2l0aCBhIHNjb3BlZCBhZGRyZXNzaW5nIHpvbmUgY291bGQgYmUNCj4gK21pc2lu
dGVycHJldGVkIGFzIGEgd2l0aGluLWRvbWFpbiByZWRpcmVjdC4gRm9yIGV4YW1wbGUsDQo+ICt3
ZSBjb3VsZCBpbnRlcnByZXQgIjo6MSUud3d3LmV4YW1wbGUuY29tIiBhcyBhIHN1YmRvbWFpbg0K
PiArb2YgInd3dy5leGFtcGxlLmNvbSIuDQo+ICsNCj4gK1RoYW5rcyB0byBKdWhvIE51cm1pbmVu
IG9mIE1hdHRlcm1vc3QgZm9yIHJlcG9ydGluZyB0aGlzIGlzc3VlLg0KPiArDQo+ICtGaXhlcyBD
VkUtMjAyMy00NTI4OQ0KPiArRml4ZXMgIzY1Mzg1DQo+ICtGb3IgIzY1MDY1DQo+ICsNCj4gK0No
YW5nZS1JZDogSThmNDYzZjU5ZjBlNzAwYzhhMTg3MzNkMmIyNjRhOGJjYjNhMTk1OTkNCj4gK1Jl
dmlld2VkLW9uOg0KPiBodHRwczovL3RlYW0tcmV2aWV3LmdpdC5jb3JwLmdvb2dsZS5jb20vYy9n
b2xhbmcvZ28tcHJpdmF0ZS8rLzIxMzE5MzgNCj4gK1Jldmlld2VkLWJ5OiBUYXRpYW5hIEJyYWRs
ZXkgPHRhdGlhbmFicmFkbGV5QGdvb2dsZS5jb20+DQo+ICtSZXZpZXdlZC1ieTogUm9sYW5kIFNo
b2VtYWtlciA8YnJhY2V3ZWxsQGdvb2dsZS5jb20+DQo+ICtSZXZpZXdlZC1vbjoNCj4gaHR0cHM6
Ly90ZWFtLXJldmlldy5naXQuY29ycC5nb29nbGUuY29tL2MvZ29sYW5nL2dvLXByaXZhdGUvKy8y
MTczNzc1DQo+ICtSZXZpZXdlZC1ieTogQ2FybG9zIEFtZWRlZSA8YW1lZGVlQGdvb2dsZS5jb20+
DQo+ICtSZXZpZXdlZC1vbjogaHR0cHM6Ly9nby1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2dv
LysvNTY5MjM5DQo+ICtSZXZpZXdlZC1ieTogQ2FybG9zIEFtZWRlZSA8Y2FybG9zQGdvbGFuZy5v
cmc+DQo+ICtBdXRvLVN1Ym1pdDogTWljaGFlbCBLbnlzemVrIDxta255c3pla0Bnb29nbGUuY29t
Pg0KPiArVHJ5Qm90LUJ5cGFzczogTWljaGFlbCBLbnlzemVrIDxta255c3pla0Bnb29nbGUuY29t
Pg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+IFtodHRwczovL2dpdGh1Yi5j
b20vZ29sYW5nL2dvL2NvbW1pdC8yMDU4NmMwZGJlMDNkMTQ0ZjkxNDE1NWY4NzlmYTVlZQ0KPiAy
ODc1OTFhMV0NCj4gK0NWRTogQ1ZFLTQ1Mjg5DQoNCkluY29ycmVjdCBDVkUgbnVtYmVyIGhlcmUg
Li4uDQoNClRoYW5rcywNCg0KQW51ag0K

