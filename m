Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12D6C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 04:43:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.56584.1638161019747436127
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 20:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=uwooWC2n;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="235722833"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800";
   d="scan'208";a="235722833"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2021 20:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800";
   d="scan'208";a="600068997"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2021 20:43:38 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 28 Nov 2021 20:43:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 28 Nov 2021 20:43:37 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 28 Nov 2021 20:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bml3IhM7JsbsAhDXDL5H+oIEsC1pn0ZVFu8fKCBGoJ+pD6fk8xC3exHMNbu/6UWmLo3rnWr69JAwn5uy4+uOudKvjKbF8q4G9A9alNzNsWqqxUAUe3+NOWPK6e+1MjXeEY3JdGQkc3w6XcS3HytuBuH1Iq66Kk1VUGWvGGRsVesTzIUeS+44pty0XtEXpy77IYRreqphgLLEwAgSNEfDIXWW959r6cF4yEdqdBaY5F6qcC/Sl4znkrQJv+g8hrQWCB/h27wnM+hCcEFM5vsNsTxx5hba4J3Cp0Shk6DTpSjS7IoSqZwx6cvoI99eQmyq5l7+GbNOKivSfrrBtK7/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwO09FFKwFkg43F1VCt208+4llPGBwhiqHWh9FFIkjg=;
 b=QCy6yZlFMrFjgWcQLI+ZO0Nl7y8Q7ZCXc0nVz6QRpmrIml5ihIas84gBRqLukU2sm/nTpAE1ClcVvgK9caDh+rpbYSAPpxfT9OvN5+WsCT7feyA16KsB+SdDBSJBNp3EyXochA5Q1VqGVold8NczVx/61AusxHuyS0JUYh+7swk6BUzgZYg230Pd/x/bbfTj6WGI7lmPP8Lm9EGu0Dq0W7sfHE6zSq3oi+29sS2mtH8mmFKXfoVWcqalI79HABnTR5cVaizqLm3P8Gv+TRN80pjax8Id/yI29B2A7zzWxLpeU8GKyY7eNafNC9NnHPZ2gHPktPO+kKuIV9vBBq92Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwO09FFKwFkg43F1VCt208+4llPGBwhiqHWh9FFIkjg=;
 b=uwooWC2nvU48MWj9gdUHM4xzUZG3flrslXcUogYWvDreZRZghuMYFttVJVRl5zKSUpGhLTn+iIjVTXfOlFNV7JEfxEf9VC4UItSJ9Axnap7BmaUqju/XHCgg3RG+jPWuenwxR0/P2BtMIvkLxCGMh/KKMLdNN24tfB3PJeBfxgk=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2535.namprd11.prod.outlook.com (2603:10b6:a02:be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 04:43:36 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::fd59:4f6f:e6f3:86aa]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::fd59:4f6f:e6f3:86aa%7]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 04:43:36 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core][dunfell 36/42] dnf: Backport bugfix for upgrade
Thread-Topic: [OE-core][dunfell 36/42] dnf: Backport bugfix for upgrade
Thread-Index: AQHX5KNNCFnba7tOsUSooXjOpzkA1qwZ7g4A
Date: Mon, 29 Nov 2021 04:43:35 +0000
Message-ID: <b52dbaf4aff622f57855dbd73b034fe6258b9be1.camel@intel.com>
References: <cover.1638136329.git.steve@sakoman.com>
	 <bc0c1234b7ae48394af92a4d14c2b47f2e3b98a1.1638136329.git.steve@sakoman.com>
In-Reply-To: 
 <bc0c1234b7ae48394af92a4d14c2b47f2e3b98a1.1638136329.git.steve@sakoman.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (3.42.1-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 611fe465-636c-4813-7462-08d9b2f2ce26
x-ms-traffictypediagnostic: BYAPR11MB2535:
x-microsoft-antispam-prvs: 
 <BYAPR11MB25352CD2C8E199F7850C26E8F8669@BYAPR11MB2535.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Uk54okeujjo3G5+kygXzMchTuDRiNeMcY0nuszpQtF0/CaeXdMx6JRxwl4jcoGJawLSSIV3ktUAu7N5+m4YV2t40sAWOB2INGdsnMS362a5AbbrE7YBGYGMXD4rFHUNQ568uTGSTl7Xex8JBKMGGWh7QgTyOBeX9OfB2sXOhw8P2KXby7n1dk52ejJrdgtEbDhwOJ2z3BVPqw8ZodTpnpgAklS2WX2q2n1P8UlYfGcWsuNEWHFU3j2gbP9JTRXarIH+qmvg437I3P2AcSgzcnNFG+bybwGk3TRPzBiXzf/JjzGkhl38rH0gLczhl5FUI5fAqU1pNW0aRPr6LPeKDDEKVMA7ySChvyZ5y6NynZzoS4+jcBb2ZydRDGILDetGdlWIgt9RIh+EUoRMD7WUp7aEqy3+5qPTQTXF49GtJO5utvybldsLTTMTeL6RMOFeqCRueu0a3pEndOnUSLFTHVEzaFSWigpyRvXebpC8AIxvvV+WmXZBvkW822aSQ+wilzvlystH2vV1Zw1ooJS24ktxtpb0XX0m2j7YxQBSh83OOQTtPVa50Ip1pC84urLElvLvmPIApAVSLUiQzJWMUpVExxoXAER4udKVOKkY96rvS87R3TDdAf+Ml4120woxZbwZTpV9EsZ/YZzRYq1XPAY1Xqg1P7eWif3OoJEaubaEqJBdIBaJPVAojAkT0yTLmqcm1/uTRFZwNBPxGDRV1vwq5ruy0JCwzvPGovWixI0kl3h4Dj1a17ZQluyFND3POOlYz0GLNc/q6lZNfGxgbi9Cr2i3rUqMdrVETO1++EbYkes4it6CJz4TNqyxnmcXIlgxc4LXW72r0Pee2xePHcA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(26005)(122000001)(76116006)(110136005)(966005)(38100700002)(316002)(19627235002)(186003)(6486002)(2906002)(5660300002)(83380400001)(2616005)(66446008)(71200400001)(508600001)(4001150100001)(8676002)(36756003)(8936002)(6512007)(38070700005)(86362001)(82960400001)(64756008)(66556008)(66476007)(91956017)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cG9BN25QUkVGSWx3TlJLUkUzZlU2YVJCUkxQdFJwUjdFdFlCVnJ6bkIxeE5I?=
 =?utf-8?B?NUpoWUZXTThiQlhwRjAwYUVYdEFaMVlDM3p6R0ErcjIrTjZtQTZZSzN6V0p6?=
 =?utf-8?B?R1lFR0NNZEJvNGRNMmYxTHJuMWJ2MitrRHQwQTkvR010a20wam1TRThXa0E4?=
 =?utf-8?B?TkZIbmhHcVExbFExZkd1Tlh6VTFKc0dwYnF1T2F5eFBvUkJlOTVkZktaZW5x?=
 =?utf-8?B?amRlK0tIQWZvUVJzSGNQcC96ZFNwL2F5eEtCd3RVVjZhQUN4M3Nlc3g2YlVS?=
 =?utf-8?B?bVNLdzlRYmIvUlVnb2g4VFdySEY1Y2d6dWszOWt2R1ZwaWtaUUszczBFVS9j?=
 =?utf-8?B?bFRKTEd2M0hyWmpqaUJrNjlVQm8ycUhuVUlXL0FsSFF3d2NHVG5ZZHlOaXZm?=
 =?utf-8?B?a09yS2ZYSUlXTnJYL3ZBSEV4R0ZVdVJrQVJObW53WXJaT3JHUnIyYU1hd0hK?=
 =?utf-8?B?S2Fqd1U1bUVkaWFUZ2hpaTByWXl5VXM5dzJ6Rzh6NGlVc0VOSnVyYjRYV3lK?=
 =?utf-8?B?S3V2RThVNnQrdFdMMHV5bnl2d2RBak5nd3dnakd2QkhuREZJNWEySVZ3THRh?=
 =?utf-8?B?UkpWT3ZzTjAxam9OdTA4UmhJbExnLzZvMmlaOVU5MnVndFZreldyTWVzY0hu?=
 =?utf-8?B?QlZBdHUxM1Vkd1dqTk4rTm5DTGlTNVhFUk10MkJjYU44azN6MWpVVHlWMWRD?=
 =?utf-8?B?SXl5SldBdnNiTk9jRkxvUytaTDBqY3pZSTRWRC8zU3NXNHhZNjRhQ053RE45?=
 =?utf-8?B?djhldERqNldTdDNrNWJyd0FuR203akRRZEJMV0FmL3g0bGhEcmFkcEVkRXdW?=
 =?utf-8?B?MXNIQnZBYzk5WElvKzRnKzRtU2gzVkpYbXZuRElHL3AxWkRyRFF1MVd1ZGlQ?=
 =?utf-8?B?bU5RWEtxbnpxMmlqWkNuN1VNQW5rMDd1MXZqQlBrbkFIV0dGTFd5NUZ6aVdP?=
 =?utf-8?B?TmdGem5QUkdNTXRBYllyQlRiSklLV3Zhd1JjaHRHQW1RZnRSbzBQTkw4NEN1?=
 =?utf-8?B?NkZVUEFBU3hINDRhRW1uMGZXcU9kQVMrQjdlSk43UDREdWR0MFdzTEVSdFR6?=
 =?utf-8?B?NE5wU2hMTkowUTFVRGh5a295SlJJMUZzWngwZ3V0KzdpdjJqTzkvbXlJNnR4?=
 =?utf-8?B?ZFN2SU5UeTBuWURvT05mOEhSK3JJYlFndGpYYUxtbEp1RGtGZjlkSm9RMGFB?=
 =?utf-8?B?OVc4eWJnWFRBRkRpUDlqYlZiREljV0dzb21reCtrNlNOd3NZTDhDeTlJSHVD?=
 =?utf-8?B?YXovZ0NNc3hCUkdwQXVyTU95aXZWLzkyVnE5WXFYT2RrV2llM2IxZktiMnRs?=
 =?utf-8?B?amtKb0tLU2NzckFTNUZCbHFYa3JwdnpzUFpDcUxubEtHTnJYODdpNjUrK014?=
 =?utf-8?B?TVcyclBrbEdNd2N6VjMwTVpUaXR1Z3pNZTdUQTRxK3MrMjJ2SWN4TE16TU9D?=
 =?utf-8?B?azNZK2JBS2RnNnMrRDVUek5SUTJuemttOUZLaStCMDBUWW1GWGN6ZWs0UGJ5?=
 =?utf-8?B?NisrMXk0NVNmMzZibi9nd0RhNDFFTkhrZE9lYVJrY1hZN0Exa0VCRTVIS0ZV?=
 =?utf-8?B?SDJJbmtyMVFkcG5WZUJxaWt2TW1FUjY4RXA0OFFHZTVhSDhpR2dkMlhCdkJ0?=
 =?utf-8?B?Z3lvRXlnRThMVTBmYUtoYzlBczJtd0JJOFptcXZycUYxZVZYaEpacS9qblha?=
 =?utf-8?B?SURVMG1GL29RdnNSVHZ5c3luV1hKREpPZmloRWk1OWF3QjgzaGEyS1VUcllP?=
 =?utf-8?B?RW1rdWJXWGMrVDYvZzJmQ2NqSjBDM3h6amdMbUh1OU1GNjZYL2NEOXB0dnJj?=
 =?utf-8?B?L3hwOXZaTzF4OXRvOW4vcUI4ODduQnR4UlVwUkVJaHA0WHR6TVVyb1JHT25k?=
 =?utf-8?B?U1RyYndCOEhwVGxMbm9VV1RTRnRDbXRPR0g3c2tCcElZWTBMM1RNenFZdW4z?=
 =?utf-8?B?UWpBYkJnY1RONFhpSkFkVVJ2VlNWNnF0S3ZEMUU2QzJza28vY3ZqcFV3WEwr?=
 =?utf-8?B?K21GZ1diK2FtRXJ5WHZtNEVKTFlrMTlhNm41VzY4U01EK3dVQVJFZnlHdDZq?=
 =?utf-8?B?cWFKQi90T3VhRXAxRm5GVkdRdUVDeWxJK3RMdlh0bGNQWFlOVmFlS2V4SldB?=
 =?utf-8?B?a1F4b0JrMFlkT2Q0aFgvNmpIS2ZZQ2dIcWZmejBmaFZCT01aTWdWSU9tMGYw?=
 =?utf-8?Q?alRgRVbEuQ7YFOyiRTtmLXoQEuMyvxPinqGiM2L11oDr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8A3406D38F2F94A9B96B951F02670A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 611fe465-636c-4813-7462-08d9b2f2ce26
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 04:43:35.8558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 8zPLqjWsg2p0iaHZAI0Tdp7/ixwpletTRBvvr+MeL84DPr/dDeCxpI/53K2zTMKMQa4l2f+VznYw43aRbxgtCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2535
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 04:43:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158926

T24gU3VuLCAyMDIxLTExLTI4IGF0IDExOjU3IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0K
PiBGcm9tOiBKYXRlIFN1amphdmFuaWNoIDxqYXRlZGV2QGdtYWlsLmNvbT4NCj4gDQo+IEtlZXAg
aW5zdGFsbGVkIHBhY2thZ2VzIGluIHVwZ3JhZGUgam9iDQo+IA0KPiBUaGlzIHByZXZlbnRzIGR1
cGxpY2F0ZSBpZGVudGljYWwgcGFja2FnZXMgZnJvbSBiZWluZyByZWluc3RhbGxlZA0KPiB3aXRo
IGVhY2ggdXBncmFkZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmF0ZSBTdWpqYXZhbmljaCA8amF0
ZWRldkBnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNh
a29tYW4uY29tPg0KPiAtLS0NCj4gwqAuLi5hY2thZ2VzLWluLXVwZ3JhZGUtam9iLVJoQnVnLTE3
MjgyNTIucGF0Y2ggfCA2MA0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmZfNC4yLjIuYmJhcHBlbmTCoCB8wqAgMyArDQoNCldoeSBpcyB0aGlz
IGJlaW5nIGFkZGVkIHRvIGEgYmJhcHBlbmQgaW5zdGVhZCBvZiB0aGUgcmVjaXBlIGl0c2VsZj8N
Cg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMo
KykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYv
MDA0MC1LZWVwLQ0KPiBpbnN0YWxsZWQtcGFja2FnZXMtaW4tdXBncmFkZS1qb2ItUmhCdWctMTcy
ODI1Mi5wYXRjaA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZl80LjIuMi5iYmFwcGVuZA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbmYvZG5mLzAwNDAtS2VlcC1pbnN0YWxsZWQtDQo+IHBhY2thZ2VzLWluLXVwZ3Jh
ZGUtam9iLVJoQnVnLTE3MjgyNTIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtDQo+IGRldnRvb2xzL2Ru
Zi9kbmYvMDA0MC1LZWVwLWluc3RhbGxlZC1wYWNrYWdlcy1pbi11cGdyYWRlLWpvYi1SaEJ1Zy0N
Cj4gMTcyODI1Mi5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAw
MDAwLi41N2MyMzc1YTU0DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDA0MC1LZWVwLWluc3RhbGxlZC1wYWNrYWdlcy1pbi0NCj4gdXBncmFk
ZS1qb2ItUmhCdWctMTcyODI1Mi5wYXRjaA0KPiBAQCAtMCwwICsxLDYwIEBADQo+ICtGcm9tIGM4
OGE3NzE5OGMwMTU2ZTQyNWMyNzI1ZjMwZTQ4MTIwN2RlNTE2MmYgTW9uIFNlcCAxNyAwMDowMDow
MA0KPiAyMDAxDQo+ICtGcm9tOiBKYXJvc2xhdiBNcmFjZWsgPGptcmFjZWtAcmVkaGF0LmNvbT4N
Cj4gK0RhdGU6IFR1ZSwgMyBTZXAgMjAxOSAxMTowMTo1MSArMDIwMA0KPiArU3ViamVjdDogW1BB
VENIXSBLZWVwIGluc3RhbGxlZCBwYWNrYWdlcyBpbiB1cGdyYWRlIGpvYg0KPiArIChSaEJ1Zzox
NzI4MjUyLDE2NDQyNDEsMTc0MTM4MSkNCj4gKw0KPiArSW4gY29tYmluYXRpb24gd2l0aCBtYXJr
aW5nIG9mIGpvYiBhcyBUQVJHRVRFRCBpdCBwcmV2ZW50cyBmcm9tDQo+ICtyZWluc3RhbGxpbmcg
b2YgbW9kaWZpZWQgcGFja2FnZXMgd2l0aCBzYW1lIE5FVlJBLg0KPiArDQo+ICtodHRwczovL2J1
Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE3MjgyNTINCj4gK2h0dHBzOi8vYnVn
emlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTY0NDI0MQ0KPiAraHR0cHM6Ly9idWd6
aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNzQxMzgxDQo+ICsNCj4gK0Nsb3Nlczog
IzE0NzQNCj4gK0FwcHJvdmVkIGJ5OiBtLWJsYWhhDQo+ICsNCj4gKw0KPiArQmFja3BvcnQgdG8g
Zml4IGJ1ZyBpbiBkbmYgaW4gb2UtY29yZQ0KPiArZnJvbSBodHRwczovL2dpdGh1Yi5jb20vcnBt
LXNvZnR3YXJlLW1hbmFnZW1lbnQvZG5mDQo+ICsNCj4gK1JlbW92ZWQgc3BlYyBmaWxlIHBvcnRp
b24gb2YgcGF0Y2gNCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiArU2lnbmVk
LW9mZi1ieTogSmF0ZSBTdWpqYXZhbmljaCA8amF0ZWRldkBnbWFpbC5jb20+DQo+ICstLS0NCj4g
KyBkbmYuc3BlY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0ICsrLS0NCj4g
KyBkbmYvYmFzZS5wecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzIC0tLQ0KPiArIGRu
Zi9tb2R1bGUvbW9kdWxlX2Jhc2UucHkgfCAyICstDQo+ICsgMyBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9kbmYvYmFz
ZS5weSBiL2RuZi9iYXNlLnB5DQo+ICtpbmRleCBiMmNlZDYxLi42MjhjMTU0IDEwMDY0NA0KPiAr
LS0tIGEvZG5mL2Jhc2UucHkNCj4gKysrKyBiL2RuZi9iYXNlLnB5DQo+ICtAQCAtMTk2OCw5ICsx
OTY4LDYgQEAgY2xhc3MgQmFzZShvYmplY3QpOg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgb2Jzb2xldGVzPXEuaW5zdGFsbGVkKCkudW5pb24ocS51cGdyYWRlcygpKSkNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIGFkZCBvYnNvbGV0ZXMgaW50byB0cmFuc2FjdGlv
bg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHEgPSBxLnVuaW9uKG9ic29sZXRlcykNCj4g
Ky3CoMKgwqDCoMKgwqDCoCAjIHByb3ZpZGUgb25seSBhdmFpbGFibGUgcGFja2FnZXMgdG8gc29s
dmVyIG90aGVyd2lzZQ0KPiBzZWxlY3Rpb24gb2YgYXZhaWxhYmxlDQo+ICstwqDCoMKgwqDCoMKg
wqAgIyBwb3NzaWJpbGl0aWVzIHdpbGwgYmUgaWdub3JlZA0KPiArLcKgwqDCoMKgwqDCoMKgIHEg
PSBxLmF2YWlsYWJsZSgpDQo+ICvCoMKgwqDCoMKgwqDCoMKgIGlmIHJlcG9uYW1lIGlzIG5vdCBO
b25lOg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHEuZmlsdGVybShyZXBvbmFtZT1yZXBv
bmFtZSkNCj4gK8KgwqDCoMKgwqDCoMKgwqAgcSA9IHNlbGYuX21lcmdlX3VwZGF0ZV9maWx0ZXJz
KHEsIHBrZ19zcGVjPXBrZ19zcGVjKQ0KPiArZGlmZiAtLWdpdCBhL2RuZi9tb2R1bGUvbW9kdWxl
X2Jhc2UucHkgYi9kbmYvbW9kdWxlL21vZHVsZV9iYXNlLnB5DQo+ICtpbmRleCA5NzZkNzMwLi5j
ZTcwZjYzIDEwMDY0NA0KPiArLS0tIGEvZG5mL21vZHVsZS9tb2R1bGVfYmFzZS5weQ0KPiArKysr
IGIvZG5mL21vZHVsZS9tb2R1bGVfYmFzZS5weQ0KPiArQEAgLTIxNCw3ICsyMTQsNyBAQCBjbGFz
cyBNb2R1bGVCYXNlKG9iamVjdCk6DQo+ICsgDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgbm90IHVwZ3JhZGVfcGFja2FnZV9zZXQ6DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBsb2dnZXIuZXJyb3IoXygiVW5hYmxlIHRvIG1hdGNoIHByb2ZpbGUgaW4gYXJndW1l
bnQNCj4ge30iKS5mb3JtYXQoc3BlYykpDQo+ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxdWVy
eSA9DQo+IHNlbGYuYmFzZS5zYWNrLnF1ZXJ5KCkuYXZhaWxhYmxlKCkuZmlsdGVybShuYW1lPXVw
Z3JhZGVfcGFja2FnZV9zZXQpDQo+ICsrwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxdWVyeSA9DQo+
IHNlbGYuYmFzZS5zYWNrLnF1ZXJ5KCkuZmlsdGVybShuYW1lPXVwZ3JhZGVfcGFja2FnZV9zZXQp
DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgcXVlcnk6DQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzbHRyID0gZG5mLnNlbGVjdG9yLlNlbGVjdG9yKHNlbGYuYmFz
ZS5zYWNrKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2x0ci5zZXQocGtn
PXF1ZXJ5KQ0KPiArLS0gDQo+ICsyLjcuNA0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIuMi5iYmFwcGVuZA0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mXzQuMi4yLmJiYXBwZW5kDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjM4MTFkYjYwNGINCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIuMi5iYmFwcGVuZA0KPiBAQCAtMCwwICsxLDMg
QEANCj4gK0ZJTEVTRVhUUkFQQVRIU19wcmVwZW5kIDo9ICIke1RISVNESVJ9LyR7UE59OiINCj4g
Kw0KPiArU1JDX1VSSSArPQ0KPiAiZmlsZTovLzAwNDAtS2VlcC1pbnN0YWxsZWQtcGFja2FnZXMt
aW4tdXBncmFkZS1qb2ItUmhCdWctMTcyODI1Mi5wYXRjaA0KPiAiDQo+IA0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNTg5MTgpOg0KPiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE1ODkxOA0K
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC84NzM2
NTIwMi8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWw0KPiBhbnVqLm1pdHRhbEBp
bnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

