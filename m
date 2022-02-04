Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8018DC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 03:03:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.4722.1643943782615343202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 19:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=E7VpJnt+;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643943782; x=1675479782;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XgXLZ+4JK18KbbDLtff8XILgbJNBl7qejomxLuY8PzU=;
  b=E7VpJnt+mkMKUKKb2psLsCmDg3xJ8lsx/rMFEnpyztK4gxqlHmRMqbke
   /wDNrKFUpdu+Wy+ypVNuElNK3hHN5wdtxoYLenrPP/9pOGBHh4J0+gC3+
   4ch+nWKKjbQVV5JOBcLWuUI6Fh3ORSnxeiBv9/QXXVKWSc/HjU5KboTC0
   RQm+keq0fLWIfOQmxexcD/qaRyqU+vKC3vwzxjBpkgBY94/jKg/njoHjT
   SbQ8i4V155mx98u4YwqHZ1T3HSqTBnWu97hjJFQN/tbUtc9FIthtUSCrW
   Ty9CsEjrBs2dninTm3QhNost44lmtZcMg+DwtXro3Ok85jUXShLQ8dG19
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="272799804"
X-IronPort-AV: E=Sophos;i="5.88,341,1635231600";
   d="scan'208";a="272799804"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 19:03:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,341,1635231600";
   d="scan'208";a="483481425"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 03 Feb 2022 19:03:01 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 3 Feb 2022 19:03:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 3 Feb 2022 19:03:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 3 Feb 2022 19:03:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUwYJhhnHedwFwzox+ZGYUjt3TkXJbE5NsWtBDl0cKKCjyfJkC6zHvfpJudohPafb23iqypCEW4YenFFZKZTqN8hPx6Q1onZU9oKHacUY8zBv/aCxO0LaihmugDXv92wGj1C25TKWJ0m4ruc3ZcKor8YS8P7Vc9ffFgv+HQCHCh5A/3xxt04knIXbg8sOSdKIGhRoWBjoVjt8OU7wDF+dp4zxBIYXxR1+Uiu/8JUzmlREBXDVVu8de3wO4n0XEmJqmd//DDUefhk81UBUx+H964lmklvLelF2I9IIre/i4reTaAWbbtn3PDjQxhv7IYTtfVDFCtmun/neTc/NeJntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgXLZ+4JK18KbbDLtff8XILgbJNBl7qejomxLuY8PzU=;
 b=dUFkMbZFu3V0FRi5MwzbJpEGcJtvEm0JhuE3oM0ZLUF1avi+Ll0xcNeKuuOoxYqRHWO83Cpu8x0fICcoXImFrb3AOz2IMYTfib2NYEh+fQ04RwDfAEjOEWxkJ8VhRFChZMPhb1OZrWnAk9S7Z6PrexQdItCrOAjmdAROdmj4h9ByRila4zx8A/9zlixdbf/tRU+dS7E0Znb92ogsiyYbVu6fkA3J7PxFWmlJ4Z6/rYFpvf4wYQoDqjA0us6/Ns7t8IegOJ3jjkJbIy3S4okc3Sv+qa6pwfdh9K/1hEh3HARonvG3JssLnVmol6E/XaX3Ip500KuJ01sVxMjS8vp5Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 4 Feb
 2022 03:02:59 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4930.022; Fri, 4 Feb 2022
 03:02:59 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "paul.barker@sancloud.com"
	<paul.barker@sancloud.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [honister PATCH] kernel: introduce python3-dtschema-wrapper
Thread-Topic: [honister PATCH] kernel: introduce python3-dtschema-wrapper
Thread-Index: AQHYFpb5baYG4yLw70mDs4P6/2IvlqyCuj4A
Date: Fri, 4 Feb 2022 03:02:58 +0000
Message-ID: <44b3a7846aba52792811963540e3d5877bb7b25e.camel@intel.com>
References: <20220114132150.2604-1-paul.barker@sancloud.com>
	 <20df8397-23e1-cc7c-afa3-fee12998d6c7@sancloud.com>
In-Reply-To: <20df8397-23e1-cc7c-afa3-fee12998d6c7@sancloud.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc46074a-5793-4660-585c-08d9e78ad97f
x-ms-traffictypediagnostic: BL0PR11MB3474:EE_
x-microsoft-antispam-prvs: 
 <BL0PR11MB347482A4F8375739F73E5437F8299@BL0PR11MB3474.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b6h07WIPrfLw7OlzuvW2hAlaR8nyED4HP7WDmkGoOXq1XKAKkn3zdAToLXT4/KYzr3zXO95xqZ5FIu/Cywmq7BBfv0Ppx8YCMdlvhILxlHEMDFpS7If+S6AkgnqWHN6tGRV9hCXy5qrUI3v5oeX4eT+rIp0lxvbvTXQo5QezPLq5xZ9UKtqwAve0jMfkxNcMZpZIbtlsrPzKi5u7XR9PxBB70DnxaHsF6OEAPiFWsDH66ODcIpl3cGimkHhd0OegMLWprA1As1BFb6XIxIpZUjxymxn8tdAIkftL3VcP4ItBmzQSnnMi/eU7h+plXGzHGdWa07EcIs7NbfPkP5xcfpv0rO7PoEmR2etK0NT3F0BXF7xWxlyawQTernmwTiHURYM9zJQBYZe8JLoQYBs7rPrONmz7PlO9En5h2oEadzf+qtfw2fVVsmlHVsY3EJdAipl+LMl8ncYUm5v0x/tH3WZ/C03Ksu7j+hJ2cg3cQySSGfypeDGJphHRgyTgzBVAwitiMtVocBMyOSm2vHmieojl4SQo6Bn2dfuuY795bGu3b6fCX+SLs0d0bx3WskZOr2VwHa4LDkEzoXxmejt+zEAle917kSJn3hxK649HMXZqai57CZ5v8AolQdRvDHEAmfQh7xiEkRPZxF8iH3zpbnVSTm1gVxJlB7YMPwibqsAYTbXFXo11tzNRcH4Yyg7O/dzzx6crogZCwdTXtd8Q9g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(64756008)(82960400001)(91956017)(66446008)(66946007)(66476007)(122000001)(8676002)(110136005)(54906003)(8936002)(6506007)(6512007)(76116006)(66556008)(86362001)(38070700005)(53546011)(186003)(71200400001)(38100700002)(5660300002)(2906002)(6486002)(316002)(26005)(36756003)(508600001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emtuWEZITUVnK0luME5TMDZCbktYTm16eTRPYStuU1BoZGp3Z1ZUdDdKWk5i?=
 =?utf-8?B?Z2RsVnNiRmFCMlZnZXB0RDRDd2NNZEQzSDRrMVJsMHhsYkJNRXZMNndpYzMr?=
 =?utf-8?B?N1RnN3hPdHFkZ3VSRXJlb2RsaXluUHl3UStTK0o3cng1V2dWelI4QlM3eEdk?=
 =?utf-8?B?TSsvalhheWllL0NrWFp0OVR0b1p6RE0yVVdMaEdyTDVVZnBNci9vU3d2Zk5N?=
 =?utf-8?B?QjR2YTcvYnpueVpwdzNndHkrcXRrYnJtb3JVL0QrR21ZU3RzRk1uWjhSZTl2?=
 =?utf-8?B?bmc1cGRLUlk2S2JTRW5nR21mSFQzS2hNZ1gwcXFVTGQ0VXUzQ3dRenN2WXRV?=
 =?utf-8?B?ZkFvWnZXU2ZsdTluMjB2T1NLcUZlZ0NGUzZYK0tzZHRKc0lOWXZNZnQwUnE0?=
 =?utf-8?B?YmdvM2FBcEw2aXRRUVZtWEZqTmZyQkN4NHpMZE1hd25OVTJvYmxSaVdkbmlP?=
 =?utf-8?B?M0w1VEJ4YXZqMjZQeUxzY09BNkNPQzhxdVFMZ1RhS1VBc2lHbWZ3VVZMT1ow?=
 =?utf-8?B?bElsWnNiUEFRRlFHTHJQdXo0VU83Y1RVTkd3NlZKR0d4dm9zMS9nemhha2Zl?=
 =?utf-8?B?SDZXdXByWmNyV3FaWTAydFd5bGJRMDRuOHlCcnVyclptOC90RkhMQ3dLU2NQ?=
 =?utf-8?B?U0VRUk16RkFUL0JPMkVZY0JlemY3dW5zSjdQZnlBZGVvUkg2aVJPYlB4S0o1?=
 =?utf-8?B?NmFNa3pIaVBHTmg5RUJ1WFI1Y2JaQTNYaFZHZUJhRm9qcnY1VDJpK3FTRWdQ?=
 =?utf-8?B?VHJYKzlzOHMwNmVtdlVCc3hldUgyRWRXeGxvdno2NFhhdnV3TUdtMEZKUXZM?=
 =?utf-8?B?WDNaRDVSZlMzQkNFNTFnZmUzYng2aVNxR2tKRWxyN3NaQms1VHpjZFlPL3lz?=
 =?utf-8?B?d21kbU1YVjV6UTUvUm1GNXpJSnhLV1FBZzQ0ZlNONzBhRzlxS2FXRnRBYUdR?=
 =?utf-8?B?cjdjZUpaT1Nxb0pOekRtaytvUkptbmw1YWc1cWxud1dybmVxOStiVGsyZENO?=
 =?utf-8?B?Zi8wUnVsWGk4L0s1VGIrbTNRbEVLVEoyQXFRWEFjZzJRNldkc3A3NkNqNnZL?=
 =?utf-8?B?R0ZjaTl0dzVwcENhOTd0ZzJCeElVYXQ2YXVOV3hWUGRZOGhqUGNVZzJvQlA0?=
 =?utf-8?B?L2Fob255bDZRcU82NUFXNU9SU0hsSGhNUytCclhNdGZjZnZVTTEzNjdyaS8r?=
 =?utf-8?B?OExaYkNPZkhkWjNXamRQYVZ4Yjk0UlNFcjQ3TFRQeExjRnkzdjZyVDRiYzAx?=
 =?utf-8?B?MWg4eVd1VTB1alc2bUYwVnlFTVlGTmdFRXh4MUdPajBEQjZUTnZ4c1pYRUFy?=
 =?utf-8?B?UG9acllGb0JjMUlaYUpWTmNsSHpPd2l1ci91NUFsRmhMM3RkNVl2eno3akRL?=
 =?utf-8?B?NDRsSHpvRlBQcGU4cjhZYXJ1Ymg4ekwreHBtMG8zcWQ2d3hVTzBOdEJ3a2h4?=
 =?utf-8?B?ekswQ2t5UmM2cEJ0Q0kxL01vTGIzaDZMMXdFNnBNUDB0bzU5NloxTHJHWEh5?=
 =?utf-8?B?SXI5T1RMUzREaDNwUjRnUTdjWkx3Z09ZOFF3bHhJV1pxVGVzdGJyZU80c0Yr?=
 =?utf-8?B?S3NqRmpycmRSMGR4Qk5QUGVUbVlLWFRvLzBoUlZYVDNtcVlqck5JZGZ6RjNZ?=
 =?utf-8?B?cmJuWlVLclFSWDRQNitoNXY0ZFlrSWtuQjZzNEJ6UUE5UkNUeDVpVkZyQmVR?=
 =?utf-8?B?SnRTaWh0dkNxM3BPSUh5eHFjOGo2OXRwVFA0enV6Nzk4a3U1WHVjUnVmeFFi?=
 =?utf-8?B?ZmZ5UFU4bHNsaXBCS29TSEJmWlNoc3ZXNGs0ZllpeE03Sm9qMFNGTmZtTktN?=
 =?utf-8?B?bFByTHEyOVNKVGlIYS8xeExReTZ2T25vMG1XVmRrTFlFb2tlTGEveVFmT1pF?=
 =?utf-8?B?aUJLNHdURzg3OXNHT2EzbSt2UXdQbXBCTzJxakVaSFJSamNxaXk2anpReUk2?=
 =?utf-8?B?VmoyTmM2bE1OWmdnYTNvNEVyRjZtUndvNDdzNDNOclBqSFM0SXVyMytIZzVm?=
 =?utf-8?B?d1lkS1RQeFpzY0VxK0tia0EyVW0ra2xQbkMrSnM5cXJMbkRyM1oydDhzaTMr?=
 =?utf-8?B?aDlXMzhLMUtZbXM0em51aVVrSnlvVlBMcldMUEh3bWd1RnJQNndMNXFqR1Fk?=
 =?utf-8?B?ZSt3SGxRWFJxSHM3Wkc4ZlhEalhSc2o3YmN4cUMvYjdDYWdmcEtJS21OZ2NQ?=
 =?utf-8?Q?s8T+z7RdX+YDdy2Z/va/iroL7cRZjYCEpPrCw2R27Fz6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9243023FF036D04C9CDEDCF30D997ECE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc46074a-5793-4660-585c-08d9e78ad97f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 03:02:58.9359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 mOgZpFHE7WKHm6idEElThyCOFSM4gqZTrXAIa+1v1hgphYP4gyM9ZcVNHP8QxEmC67dGqMddd2e+nQESWu49MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3474
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 03:03:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161331

T24gTW9uLCAyMDIyLTAxLTMxIGF0IDExOjM3ICswMDAwLCBQYXVsIEJhcmtlciB3cm90ZToNCj4g
T24gMTQvMDEvMjAyMiAxMzoyMSwgUGF1bCBCYXJrZXIgd3JvdGU6DQo+ID4gRnJvbTogQnJ1Y2Ug
QXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4NCj4gPiANCj4gPiBUaGUgNS4xNiBr
ZXJuZWwgaW50cm9kdWNlZCBtYW5kYXRvcnkgc2NoZW1hIGNoZWNraW5nIG9uIGFueSBkdGINCj4g
PiBmaWxlDQo+ID4gYnVpbHQgdGhyb3VnaCB0aGUga2VybmVsLg0KPiA+IA0KPiA+IFRoYXQgZnVu
Y2lvbmFsaXR5IGlzIHByb3ZpZGVkIHZpYSBweXRob24zLWR0LXNjaGVtYS4NCj4gPiANCj4gPiBU
aGUgZGVwZW5kZW5jaWVzIHRvIGVuYWJsZSB0aGF0IGZ1bmN0aW9uYWxpdHkgaXMgbm90IHNtYWxs
LCBhbmQgbWF5DQo+ID4gbm90IGFsd2F5cyBiZSBkZXNpcmVkIChpbiBwYXJ0aWN1bGFyIG9uIGFy
Y2hpdGVjdHVyZXMgdGhhdCBkbyBub3QNCj4gPiBzdXBwb3J0IGR0YnMsIG9yIGluIGRldmVsb3Bt
ZW50IGN5Y2xlcykuIEl0IG1heSBhbHNvIGJlIHVzZWZ1bCBmb3INCj4gPiBhbGxvd2luZyBhIG5v
bi1jb25mb3JtYW50IGR0cyB0byBiZSBjb21waWxlZC4NCj4gPiANCj4gPiBUaGlzIGNvbW1pdCBp
bnRyb2R1Y2VzIGEgc2V0IG9mIHdyYXBwZXIgc2NyaXB0cyB0aGF0IHdoZW4gYWRkZWQNCj4gPiBh
cyBhIGRlcGVuZW5jeSB0byB0aGUga2VybmVsLCBjYW4gcGFzcyBib3RoIHRoZSB2YWxpZGF0aW9u
IHRlc3RpbmcNCj4gPiBhbmQgdmFsaWRhdGlvbiBzdGVwcyBvZiBhIGR0cy4NCj4gPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiA+IA0KPiA+IEJhY2twb3J0ZWQgZnJvbSBvZS1jb3JlIGNvbW1pdCAy
NTY2NTYzYWQ0OWQuDQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBCYXJrZXIgPHBhdWwuYmFya2Vy
QHNhbmNsb3VkLmNvbT4NCj4gDQo+IEknbSBzZW5kaW5nIGEgZ2VudGxlIHBpbmcgb24gdGhpcyBh
cyBJIGhhdmVuJ3QgaGVhcmQgYW55IHJlcGx5IG9yDQo+IHNlZW4gDQo+IHRoaXMgbGFuZCBpbiBo
b25pc3RlciB5ZXQuIEFueSBmZWVkYmFjaz8NCg0KSSBzb21laG93IG1pc3NlZCBpdCBlYXJsaWVy
LiBJdCdzIGluIG15IHF1ZXVlIG5vdyBmb3IgdGVzdGluZy4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=

