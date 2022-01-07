Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A8AC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 07:51:34 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.3890.1641541892877064658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 23:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OiYY85eJ;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641541892; x=1673077892;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sIYVTUifpIE/76m8fJFalC5FVVwyRKhCRZ/U1mn2y5Y=;
  b=OiYY85eJ1J/d5G9ZRORhPtRpEtO1Kj/NUdtwWURW0W8gBsAMOnoFZEZz
   +4k+yLY0GAj3gqB00w8NchtGGicBjxddsGfVoK/JeQn+VtduvNGwUZBB3
   gYg/p/PSgzKGSaglFf7SX8N7gGC0rs9bwRPBYHzgrmDgxuFDUFLxCH1mj
   RhJJ7PgHPV9XufwE/hxZjKPGlaDq40Bc1ydanO/yDx6eMJE/mlA/2vCBm
   6aBc5x4VDq6ujVEn2rVcHPxGDkMEVF/r9IlKvQK8CXJjwn3/vy/nJSuD7
   nzcO/FIG9Z+tIqufFlYEEzaFiZuSLGwAqjOm3HQqWigDqq2c8FcLfp8qf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242778829"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600";
   d="scan'208";a="242778829"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 23:51:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600";
   d="scan'208";a="513707376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 06 Jan 2022 23:51:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 23:51:31 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 23:51:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 23:51:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 23:51:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asAAyAP//qL8yD6mqY19RqrWbRuD6YlCAtU39IMgoKsVU67hO5x1QVCTV7LtmNW5HuklZI7hePpF+FmuONnTxUzxUecjGrcrrUhzbG0DM6j40p0ZMOmz6EuME1tqcUR8LvN0HE3jnmqFui7MynW5AmZbfrsY0QFVwcKco1OiWWm4LXvs35P+cVNDP683dROsp7fmrxvrhc2+/mCZMA6/8wQ9g1bnDbzd9IQympnrdvhneaFPJVK0vdtQ0/RL4li/Xvc6hhh6wOSv0YSGUEHMvQuP5ZhnhNNIbmOXrPSJoq2e5slNNixA2P3ntvx1IXVHVmxn2ltG0/pqZBdwPf9JYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIYVTUifpIE/76m8fJFalC5FVVwyRKhCRZ/U1mn2y5Y=;
 b=aLqlVBwebE6rHaebW845gGba25XvPokLMuGPtY7gycE2rNQnUt+Lo9LnB9+UoYb7OuLToRCHHnfGsvmlgso3e0r8tdssEoPpi8uL8TkB3F7+8ZlyymvbTYmMDWrsPtX3dEhhRZb4pJu0CvLkLSXN7ZufOWAF9YAUN4u5PAFf0D83DzaivpbcTC5HEixvUmA1pKKHix3TPg2fvU7kGcZj33ErkH6h+jhSridRuMq8Jpe9oDQX20DD2b0EfwycEyyPNJolkjknDGPSudy919J7VtPr0NQ5d1Kb7pjL+AieBH9AB6N9rFv84o2M7miT00Gz09yBN2dcLTAxhiJeJZYFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 07:51:29 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%6]) with mapi id 15.20.4844.017; Fri, 7 Jan 2022
 07:51:29 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: Re: [OE-core] [hardknott][PATCH 1/4] xserver-xorg: fix CVE-2021-4008
Thread-Topic: [OE-core] [hardknott][PATCH 1/4] xserver-xorg: fix CVE-2021-4008
Thread-Index: AQHYA3IxRY6VVeFxjUqh24HRA0yfY6xXL9wA
Date: Fri, 7 Jan 2022 07:51:29 +0000
Message-ID: <b24158607b47366ba037eeb9a43865956ed9c6ed.camel@intel.com>
References: <20211229013051.36342-1-kai.kang@windriver.com>
	 <16C515AB4535CCA0.27787@lists.openembedded.org>
	 <46ba307e-dfba-4074-607f-a9b52bdeca06@windriver.com>
In-Reply-To: <46ba307e-dfba-4074-607f-a9b52bdeca06@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6fbdf7f-6a2c-4481-57b9-08d9d1b283db
x-ms-traffictypediagnostic: BY5PR11MB4307:EE_
x-microsoft-antispam-prvs: 
 <BY5PR11MB43075F5CFE86EB05772DED5DF84D9@BY5PR11MB4307.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:240;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UGuNoH/ny6AkE5f01N8m8RZU+AGz5cOukltI8kgmqi6GqPMfalXx789G1ASGm+y+LOvJixBOSszYG4oQGAmLWb9BsOhhnpWGTLNoeiYpUEKjB1yFajUxVUDJsmBR0I2fTGFPIHGqhTuO0jnHgColxcyCsu+GbCrEwUch22l+0+itQhHSxwNGzFVgILW1x+4EYaJYcDWwmoPqRH/6mi9QBm1krH07wv8GY07iI2WY+3fi8ufFPrC7vK+Fk85RdHjGcx3K6ZRrEtdAH7MIdgiU1isO2D3bJdQssbtQmwYhsOguGZSLSroqqm/H60csJFW5WHVlZ1dMfNzX54kyv8TGIFqgznc9y44LK4Y1PlZ1QZb9HXypie+WG4/CKJJ4wm8Vd+LKSWr6mWSpK8MkRLcLKsdgj1dEXAIF5RGfdjvsgqKhv76mPCvv1HWi0OEsz2+zdkTCq7ecLvDgaBQBkiYaA8T5W+aEYbAtWyff9onW0jGXOGORLbG3/q030bCR2C/W2blvw8qfxd7eUPPlTKszkkTX3E4qKpo2Vn02ailShkb3fEm8a/CtiLvI9NBSZ5OL6WNdiXJWWs6IIWTLCxZ+i24Gf7fcoj6hGAaU/8LBoZLGpeQ+OCvM/OgWDeSSXLYTz0MxZMFGby3onkM+qU29ElMOz+UFVv1ekH8yroS65y4nsAUN8Jx1JZ0t96gLcZGN0p/QG+WZQnZaYBdOv/ueLktKajuhEpfbZH7vggvwDjg+h91Se6RXLdyeCjbbkp8ixcVvH9PBuCzcP2pIfBUkQR91/qs7YzrQpR/Hv82uzFmwQA9e8IpXtUlQn7OmdP6O4wHfn4skq/PtqBYMGc8cRQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(66946007)(4326008)(66446008)(6512007)(2906002)(66476007)(86362001)(8676002)(64756008)(91956017)(76116006)(36756003)(6486002)(110136005)(66556008)(5660300002)(38070700005)(2616005)(53546011)(186003)(122000001)(6506007)(26005)(71200400001)(966005)(83380400001)(38100700002)(316002)(82960400001)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VUhXbWQzUEJlQmVId3ZQenk0clVEUTF5K3VZWTlOOEo3NTYvaFc1TTJKZE9t?=
 =?utf-8?B?WENFZFJKS3ZKYVRSOUJvV0dSK0wrTVZxU1I0S2s3Rm4rYlFnSXlsdGtUOUpN?=
 =?utf-8?B?Yks2Rkxxd3NwbkRVdXpaYXdPZEJYdnZzeTlmY0p1a2wyZkkxVE16V0FxSEs4?=
 =?utf-8?B?Qk54dFNWRitZcjNLZ2VjNmpEc2szb04yQlhubjMzYlVwWDNxdDlkbXBmV3Fh?=
 =?utf-8?B?VTJvZjBTYmhIVTJERW1TNWVrZDZGUmJTMU41YnpDaURIendGR0ZSeUFHekhm?=
 =?utf-8?B?YjFzR3N0ZitqN2dvcVNPaGhrVVNkU1VPSFpJYTUwM3hVNW1sWk9RNnhhUmxp?=
 =?utf-8?B?Mmd2V0Y1ZURxZkZDb3hlUDV1ZnZtd2M1Ynl0THMyUjlQQXFFam5hNUlFZlNJ?=
 =?utf-8?B?eFZMNG9xblBSWnpHL2RWSzN3NElkZ1FPL2IweUdQRHBDVDJwREVlNG50dVZQ?=
 =?utf-8?B?TnFpaUw1WEVwTmp2bnNsMExoUllDMm1XOHdRSmtPamdTMVo5VjBSclNlK1Vx?=
 =?utf-8?B?MDZqa1prU2VIVERQNWtVZWw3c3ZuaSsvOWtjTzJocnB6cTFRbE9VSkVDRFNR?=
 =?utf-8?B?Y3dtMzlrY1A2VFk4ZkZldXMwWFNiT1JOalZnRk5yNFU5VVU4NWNJOVljVyty?=
 =?utf-8?B?bUpiSDU5a1RtSlhrRHdHRWhZUEdmb0Nibi9TK1BGNU9la2s4SE5SR3RmeXg0?=
 =?utf-8?B?TzFsa0VlNCtXN1E4SnNRVHQwVmRyV0tLQytXMVNUc2hpYndIMjVpR2xPK0pJ?=
 =?utf-8?B?WFNNc3lURWdoUlVsQThHYm9VVE03M3k1SW1TYnNqdEdXNnZHeVpNQ3daQXI2?=
 =?utf-8?B?Sjgwc2x4dldlZmZIaUZwZ0lLbXVSb2lzOUV0ek1vY29QM2ZvdDdRanBReDJs?=
 =?utf-8?B?Wkx2VnJNbGdaTGE1VE1SM2UxWmpza3hKR3ZPQVQzeDRJallUeWM3bzA5QjRa?=
 =?utf-8?B?R251ZWdMengxYmlhSDhIOEFpYkVxRGhyeWN2bzE4dS9mNXB0b1Z2T0xEZVZD?=
 =?utf-8?B?bUFzZXZGQ2NaVitkN252clJqZ1hMbWlQa1lvWVhZOWxTNTlOeGVLUlNBWnNL?=
 =?utf-8?B?NFF0Mi9IcmcyLzlYZnZnUStiOXI2Q1VPcGtTZ2V4ZHFhQ0ZlalNJbjE4MS95?=
 =?utf-8?B?ai9rWGxrcUJ3a1hoR0kxOTdma2J6WU91b0d1TXN3a0xCWnZiNTR6NzNHcVBZ?=
 =?utf-8?B?aDVOK3BSQWl2MldXYzRJR05wY1NGM2NPeHI0bWJTcDN4dkZGT3BjdWN1eHBt?=
 =?utf-8?B?ang0djZkbmt2cjBzaXdGY0ZKcHBidEwxL2hVQmRyNDJBSFd0L1hGczd2VXBB?=
 =?utf-8?B?NzJ0REJNZStqeGs0aHFRY3F2Q0NBalREWlNGMjFEWlRoeW96WTMxY0tGOU9q?=
 =?utf-8?B?dEJQVFdYUUJMSnF2TjR6dzBBWERtc2dhS0RPOHRqbzBHVUY4U3JOL2MvaXNN?=
 =?utf-8?B?bFpLQm9NSDNNM3Jic1g0cTNqSHhFMmJ1a1lRRThoZ0JKWmRYb056VWhUNWFO?=
 =?utf-8?B?N09yeGtVVjhTSmdzRVViWDQvNUZTNS9LRlJKeXR5R3NMamI5R3AyWTd5aUJW?=
 =?utf-8?B?TUdTd1d6UDlQZzFkL1BXamlrSmVuMEoxY2ZyRkVKaVRFa24vUTVRNXNicVpG?=
 =?utf-8?B?MGs0UHlnbzN0VmF2empZeHZub3gwaFVUUUZhWlZaVmNkbksxdG1BMjZpWXpz?=
 =?utf-8?B?Z0RaU2hFbktFelFlWG9QK0tTdkpqbEwzMUxIeXRCZjkxb05xNjBiV1hVU1Y0?=
 =?utf-8?B?Q29BTGk3SHd2eW5nWVVwcnEzV04raFhydkpJazBaWWg2T3RSSjh0d3ZCbUJJ?=
 =?utf-8?B?L1l4ZmR0NDNJc2sySmdEeDRSMzd5RldRNjNSTkdRTVh5T0k2Zm1HUElqTk1I?=
 =?utf-8?B?Yld4WTBsb29uYy8zRTliNFRjbXkvQU1TbG82bHRtZ1dldGVZekg0ZDh5TnRh?=
 =?utf-8?B?UUtBL1krRzMzSEZ5Zjg3d2hCMmVqbW9SUjg1QVR4akY1bXFvQk8yWUQzZXBZ?=
 =?utf-8?B?QTNENXdKYTJZWWNpOWtKRUxKK2pLaGJmQnRSbFA5b2UvOHBmK2YrR0NodUsy?=
 =?utf-8?B?Y1laUHJzbisxVWdPSEZkbHBBUEhyMDIreTRuWmxmTW91QkVzU1d2bHlNaUJu?=
 =?utf-8?B?Smh3WkN5TDUyTk9mTU0wRGxYYTRJWHBGQ0o0ek5MZFRBOWhBVmtYRTNCcDV0?=
 =?utf-8?Q?jDmd4ZGEcKzga1Oak6udM+LuFIp+pRuC8P7Rf8mN4/Nx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E73D45684C4084AA45EBA699F38BFBA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e6fbdf7f-6a2c-4481-57b9-08d9d1b283db
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2022 07:51:29.5116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 qHa+gTWhQtB6kdBiEPFQTR/4uLvmQ2wXBJWOw2arUCW3RcUnntxkrIwvxOBLxHv6hQB+YvbDvTbBTpveLYZ9Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 07:51:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160249

T24gRnJpLCAyMDIyLTAxLTA3IGF0IDEwOjU2ICswODAwLCBrYWkgd3JvdGU6DQo+IE9uIDEyLzI5
LzIxIDk6MzAgQU0sIGthaSB3cm90ZToNCj4gwqANCj4gPiBGcm9tOiBLYWkgS2FuZyA8a2FpLmth
bmdAd2luZHJpdmVyLmNvbT4NCj4gPiANCj4gPiBCYWNrcG9ydCBwYXRjaCB0byBmaXggQ1ZFLTIw
MjEtNDAwOCBmb3IgeHNlcnZlci14b3JnLg0KPiA+IA0KPiA+IENWRTogQ1ZFLTIwMjEtNDAwOA0K
PiBQaW5nLg0KPiBLYWkNCj4gwqANCg0KVGhpcyBpcyBpbiB0aGlzIHdlZWsncyBwdWxsIHJlcXVl
c3QgYW5kIHNob3VsZCBnZXQgbWVyZ2VkIHNvb24uDQoNClRoYW5rcywNCg0KQW51ag0KDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQo+
ID4gLS0tDQo+ID4gwqAuLi4veHNlcnZlci14b3JnL0NWRS0yMDIxLTQwMDgucGF0Y2ggICAgICAg
ICAgfCA1OQ0KPiA+ICsrKysrKysrKysrKysrKysrKysNCj4gPiDCoC4uLi94b3JnLXhzZXJ2ZXIv
eHNlcnZlci14b3JnXzEuMjAuMTAuYmIgICAgICB8ICAxICsNCj4gPiDCoDIgZmlsZXMgY2hhbmdl
ZCwgNjAgaW5zZXJ0aW9ucygrKQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci0NCj4gPiB4b3JnL0NWRS0yMDIxLTQwMDgu
cGF0Y2gNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
eHNlcnZlci94c2VydmVyLXhvcmcvQ1ZFLQ0KPiA+IDIwMjEtNDAwOC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci0NCj4gPiB4b3JnL0NWRS0yMDIxLTQw
MDgucGF0Y2gNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAu
LjMyNzdiZTAxODUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvQ1ZFLTIwMjEtDQo+ID4gNDAwOC5wYXRj
aA0KPiA+IEBAIC0wLDAgKzEsNTkgQEANCj4gPiArQmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0y
MDIxLTQwMDguDQo+ID4gKw0KPiA+ICtDVkU6IENWRS0yMDIxLTQwMDgNCj4gPiArVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydA0KPiA+IFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9y
Zy94c2VydmVyLy0vY29tbWl0L2ViY2U3ZTJdDQo+ID4gKw0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBL
YWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4NCj4gPiArDQo+ID4gK0Zyb20gZWJjZTdl
MmQ4MGU3YzgwZTFkZGE2MGYyZjBiYzg4NmYxMTA2YmE2MCBNb24gU2VwIDE3IDAwOjAwOjAwDQo+
ID4gMjAwMQ0KPiA+ICtGcm9tOiBQb3ZpbGFzIEthbmFwaWNrYXMgPHBvdmlsYXNAcmFkaXgubHQ+
DQo+ID4gK0RhdGU6IFR1ZSwgMTQgRGVjIDIwMjEgMTU6MDA6MDMgKzAyMDANCj4gPiArU3ViamVj
dDogW1BBVENIXSByZW5kZXI6IEZpeCBvdXQgb2YgYm91bmRzIGFjY2VzcyBpbg0KPiA+ICsgU1By
b2NSZW5kZXJDb21wb3NpdGVHbHlwaHMoKQ0KPiA+ICsNCj4gPiArWkRJLUNBTi0xNDE5MiwgQ1ZF
LTIwMjEtNDAwOA0KPiA+ICsNCj4gPiArVGhpcyB2dWxuZXJhYmlsaXR5IHdhcyBkaXNjb3ZlcmVk
IGFuZCB0aGUgZml4IHdhcyBzdWdnZXN0ZWQgYnk6DQo+ID4gK0phbi1OaWtsYXMgU29obiB3b3Jr
aW5nIHdpdGggVHJlbmQgTWljcm8gWmVybyBEYXkgSW5pdGlhdGl2ZQ0KPiA+ICsNCj4gPiArU2ln
bmVkLW9mZi1ieTogUG92aWxhcyBLYW5hcGlja2FzIDxwb3ZpbGFzQHJhZGl4Lmx0Pg0KPiA+ICst
LS0NCj4gPiArIHJlbmRlci9yZW5kZXIuYyB8IDkgKysrKysrKysrDQo+ID4gKyAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspDQo+ID4gKw0KPiA+ICtkaWZmIC0tZ2l0IGEvcmVuZGVyL3Jl
bmRlci5jIGIvcmVuZGVyL3JlbmRlci5jDQo+ID4gK2luZGV4IGMzNzYwOTBjYS4uNDU2ZjE1NmQ0
IDEwMDY0NA0KPiA+ICstLS0gYS9yZW5kZXIvcmVuZGVyLmMNCj4gPiArKysrIGIvcmVuZGVyL3Jl
bmRlci5jDQo+ID4gK0BAIC0yMzA5LDYgKzIzMDksOSBAQCBTUHJvY1JlbmRlckNvbXBvc2l0ZUds
eXBocyhDbGllbnRQdHIgY2xpZW50KQ0KPiA+ICsgDQo+ID4gKyAgICAgICAgIGkgPSBlbHQtPmxl
bjsNCj4gPiArICAgICAgICAgaWYgKGkgPT0gMHhmZikgew0KPiA+ICsrICAgICAgICAgICAgaWYg
KGJ1ZmZlciArIDQgPiBlbmQpIHsNCj4gPiArKyAgICAgICAgICAgICAgICByZXR1cm4gQmFkTGVu
Z3RoOw0KPiA+ICsrICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAgc3dhcGwoKGludCAq
KSBidWZmZXIpOw0KPiA+ICsgICAgICAgICAgICAgYnVmZmVyICs9IDQ7DQo+ID4gKyAgICAgICAg
IH0NCj4gPiArQEAgLTIzMTksMTIgKzIzMjIsMTggQEAgU1Byb2NSZW5kZXJDb21wb3NpdGVHbHlw
aHMoQ2xpZW50UHRyDQo+ID4gY2xpZW50KQ0KPiA+ICsgICAgICAgICAgICAgICAgIGJ1ZmZlciAr
PSBpOw0KPiA+ICsgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgICAgICAgY2Fz
ZSAyOg0KPiA+ICsrICAgICAgICAgICAgICAgIGlmIChidWZmZXIgKyBpICogMiA+IGVuZCkgew0K
PiA+ICsrICAgICAgICAgICAgICAgICAgICByZXR1cm4gQmFkTGVuZ3RoOw0KPiA+ICsrICAgICAg
ICAgICAgICAgIH0NCj4gPiArICAgICAgICAgICAgICAgICB3aGlsZSAoaS0tKSB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIHN3YXBzKChzaG9ydCAqKSBidWZmZXIpOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBidWZmZXIgKz0gMjsNCj4gPiArICAgICAgICAgICAgICAgICB9DQo+ID4g
KyAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgICBjYXNlIDQ6DQo+ID4g
KysgICAgICAgICAgICAgICAgaWYgKGJ1ZmZlciArIGkgKiA0ID4gZW5kKSB7DQo+ID4gKysgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBCYWRMZW5ndGg7DQo+ID4gKysgICAgICAgICAgICAgICAg
fQ0KPiA+ICsgICAgICAgICAgICAgICAgIHdoaWxlIChpLS0pIHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgc3dhcGwoKGludCAqKSBidWZmZXIpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBidWZmZXIgKz0gNDsNCj4gPiArLS0gDQo+ID4gK0dpdExhYg0KPiA+ICsNCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLQ0KPiA+IHhv
cmdfMS4yMC4xMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZl
ci0NCj4gPiB4b3JnXzEuMjAuMTAuYmINCj4gPiBpbmRleCBlMDU1MWZhOTk5Li45YTdhYTFlZDlh
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnXzEuMjAuMTAuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZ18xLjIwLjEwLmJiDQo+ID4gQEAgLTksNiArOSw3IEBAIFNS
Q19VUkkgKz0NCj4gPiAiZmlsZTovLzAwMDEteGY4NnBjaUJ1cy5jLXVzZS1JbnRlbC1kZHgtb25s
eS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wDQo+ID4gYXQNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmaWxlOi8vMDAwMS1GaXgtc2VnZmF1bHQtb24tcHJvYmluZy1hLW5vbi1QQ0ktcGxhdGZv
cm0tDQo+ID4gZGV2aWNlLW9uLnBhdGNoIFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBm
aWxlOi8vQ1ZFLTIwMjEtMzQ3Mi5wYXRjaCBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
DQo+ID4gZmlsZTovLzAwMDEtaHcteHdheWxhbmQtTWFrZWZpbGUuYW0tZml4LWJ1aWxkLXdpdGhv
dXQtZ2x4LnBhdGNoIFwNCj4gPiArICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtNDAwOC5wYXRj
aCBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIg0KPiA+IMKgU1JDX1VSSVtzaGEyNTZz
dW1dID0NCj4gPiAiOTc3NDIwYzA4MjQ1MGRjODA4ZGUzMDFlZjU2YWY0ODU2ZDY1M2VlYTcxNTE5
YTk3M2MzNDkwYTc4MGNiN2M5OSINCj4gPiDCoA0KPiA+IMKgDQo+ID4gwqANCj4gPiANCj4gPiAN
Cj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUg
YWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMx
NjAyNDcpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzE2MDI0Nw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC84ODI1NDI3My8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1
YsKgWw0KPiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0t
DQo+IA0KDQo=

