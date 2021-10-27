Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4B7C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:09:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.13162.1635347374979515622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=MMCn+QTm;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="293643342"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="293643342"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="465761284"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga002.jf.intel.com with ESMTP; 27 Oct 2021 08:09:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 08:09:07 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 08:09:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 27 Oct 2021 08:09:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 27 Oct 2021 08:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdASUnA0kFX/1xC2l0pNM/gMBf5+txMn5qcyGJtOLb8lLsTYEwqZrCgL94DDqOreoWUZEdQgZt0x7K77iizWs7uPlvWtaQ6U1A7Rnrh7Eamk0llMClwhDkW7UhscnawNyu0bz9xuPzw8XNLYP2YfZ8nfsfTARI2jop5lEQz7C1NalVjgst+IFNvjtMswehnFZpn6l2nBXlIa27hos0rmldXvenxXp9y7qhi28GqqUoMPGpFqr+FrSnr1FQ60b8v/VVldwhiHW01EInuSuJkN9dhtrCDFayfWCiJdDuR4V9nTkvuXY5UzBQ65ud4rpsI0CU5mFTVNxmDujvC9lDoqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hnn9MXrvT+JXl9I+U7Yp9BE1KBwW80dd4NqBYfTLtEc=;
 b=JLBGU4ZfkJOtjfF/lGanx489d75G+nErzlOOdrq/503uPmbiz7oCR649LQzRq28YlFxhXcfIt5hrlk1AEu2NuAQVt4SymsabtTyJvTEY1VG75umeZA2yJpPcL5OAHd4sHUPnWNZioOqcogSbbqgycJoMJfQCbSe6w7RUeUigK/CZcmahrDJ/KB++HcDMCbaLChtbTPZ/5ixXeyp2hk3gRqxHBaodwoHBFbYi6EAA3hXm0+6kg3q6w827AqvBGTV5hb1z9v9nKOMDWG9JI1D0tNcfeR2xdoicajJBIn9VKprSHztFu2yCBpzQMuRxa//hcEnOIX2FEqKTaDRaIVtVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hnn9MXrvT+JXl9I+U7Yp9BE1KBwW80dd4NqBYfTLtEc=;
 b=MMCn+QTmZVqNpvRhQrrFmgCveU0bacO+6uFWli9ziDhhTLjXbFOFt+/JvGfdO6XPBoNUA9TOsCdkSeVKFbPjzfzewzQYyZX18qBxh4AwG04KSvSM72wyljjqPrhtxhRJz3UyYfvsTBJgsLAGtBdLq70O2XKb8EEmIykTTHjAru0=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 15:09:05 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 15:09:05 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pgowda.cve@gmail.com"
	<pgowda.cve@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [hardknott][PATCH] binutils: Fix CVE-2021-3530
Thread-Topic: [hardknott][PATCH] binutils: Fix CVE-2021-3530
Thread-Index: AQHXyyAR5byZae1BNkuAd4IBOCn5WKvm8ueA
Date: Wed, 27 Oct 2021 15:09:05 +0000
Message-ID: <3ecdc625beb6f5c01b49fb01965ba4917090fcfe.camel@intel.com>
References: <20211027104705.113970-1-pgowda.cve@gmail.com>
In-Reply-To: <20211027104705.113970-1-pgowda.cve@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12b848e2-1b96-4710-2754-08d9995bb7f6
x-ms-traffictypediagnostic: SJ0PR11MB4911:
x-microsoft-antispam-prvs: 
 <SJ0PR11MB4911B3B406B5D022DA4F3C3DF8859@SJ0PR11MB4911.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0LNyO3r3qSSOT95a8zlNCrKEqn2Fq8L9rdEUIGJXtaSGwBrTxdtC/ToVM4biRO1px08bIXtpH7+AjXRNSssjRb7UrDXQp0+goijVBIOwlwoOzMbvpt1rnjWpqckRKNfiXXWNSHfSRbd92gfFRtO5W3Z/sZ25q6UuD+R++12KiYqzgBYSFfvVRFcC7yBe/jlo7LPHHRn3KTZ71AJ/oIvMYLEQq+wznPZJlZW2h0Pnve3TAwZiSRPf45ARdfjVErpblNb2fJd8ATGKLNYV+t/YMYI7u/Av1fI8vK7RAVIZJNinbYMjHXAQfL2g04fK6+zaitNGk6wgmBVXdO/qavyn8YWwOUaqEg8nuIRxT/YFAGtf4VyDUiMYarhpof5o/9BcXk8DAccaR7kkJ0gIQQ0BFuOhtsI9dX8l34/1zzHd6xwX2s0nBUvQKYBnX+Za7/XBRjG6tXfA9gcYcxGYcNTyyaWYnGZgc4YwLWNp4mQmquBdDDdrbwr3UFaOtTxSNpR6gXcEJ1E82M9w5yYashLW7E3rEuDy1n0O/YNvO4vyBKG5njkIadUSQYNPCy0WzelscQgkxYnICM2plVUFq8P1oKshvRw4sTu+/AqroJMrfPoz/sI91eiEcaWuP6el91i8i2eJvli7009NiiatftJ00sCnWKkag+Hl0WyRV/ikLF3V8kjUWgQoOJlEcxgMi5+cy9cdODrx/0IkGYcYaClxB+rbpsFq88PWcwdxuJgklpQVfR8XDSF5qCRhhR+kzl/KYXH5rTgv1Ee4I1o5eGSmYWW+KuHKzmh2IJlBHA11b8U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(82960400001)(8936002)(8676002)(508600001)(4326008)(966005)(122000001)(6506007)(2616005)(4001150100001)(26005)(38070700005)(83380400001)(71200400001)(186003)(76116006)(6512007)(91956017)(6486002)(66446008)(64756008)(66476007)(5660300002)(66556008)(38100700002)(54906003)(316002)(110136005)(86362001)(66946007)(2906002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cUZWRjlJMVgrdGpaMDBGUHpoMHI3UE14Z3NodytRWHhNMVAwS2YxRGVVUDRZ?=
 =?utf-8?B?TFRmc1dvSlNBTTk4QlZ4VzV0Z3NOa0pGVFJRcFRUdXhuRUFieGJ3by9GUlMy?=
 =?utf-8?B?ZHhCQTJ2ZVZIZVJGZnBkOUhnQjYyQ3VpeDlCN0dxZnFOVWFZTUJjWXViWCtJ?=
 =?utf-8?B?d0t3RzBxNjhlZkpIbktzbDhyeDdnMCtnMy9RN2R0S2lIczlDdThoRVBqUW1Q?=
 =?utf-8?B?LzIxWUMzSDlFRkxDakh1Tzd5U0YzVEo2MDIwU0lZK25mUzQ3TmtxbFQyNVB5?=
 =?utf-8?B?dDZiaTQyN0ZJTkY0eVFHd0hNeTFqZnNYQjVxaDFEd21nR1N5QjJETkpzMUFQ?=
 =?utf-8?B?S0k2dU1RdVhLdXE0UHZrTVZvZk9uTjBWenJLMzlKNzRaa2ZiVVNxaytCT3pQ?=
 =?utf-8?B?cXBhNmxTWUZWRXhDNGVybDZ4cTlMK0ZtYkpzSnZsYVIwVG9XOW95dWlmby8x?=
 =?utf-8?B?cDRxNXpTVGZDZ2pYS0dOd2FXdFE3WWFwQ2U3eWtTOVMzbDNDNm5XU3ZiMm54?=
 =?utf-8?B?TnQyYWJYc3IyajB5STZGUEJFK3J2NFBVZ0RMVkZCNVhpak15ejlGTE9od1Zx?=
 =?utf-8?B?WWNVU1dpSDR1dGFWbHhWRmN0TkJWWUxoMjhFMlJqWlhmQlJ5K1RZT3BDbVho?=
 =?utf-8?B?dmEzZ0g3V3FpOG9MbERoMHVxODEra1BIeldVY1M4L3dEMzY4ZnVGZGxsbGIw?=
 =?utf-8?B?WmJBamtCZ3FLejhTMWZleHNmc1BkWjhZc1c4VTNueE0rUTJVSzd2TmpPaTQw?=
 =?utf-8?B?R3Z2VHd1NEp3ckt0cWwyUlp4dlpWNkV1Ryt4V01zMXI4V2dHRnVlTEZtTC83?=
 =?utf-8?B?WnE3TlpSeTZhNHBXcVZ4RjBsU2NPSUkrZW5xQk5xSWxWVGRJNkhKVXNkbkl5?=
 =?utf-8?B?Z0NEbE11YlBVUFY1aXFsclU5amdseThXQkxYbXR6by9xcFNrS2FKdXV0dmN2?=
 =?utf-8?B?cndtWnlBek4rL0loNHRsOVgvMUtiTU5lS0lud3k5dGtuTHFJeVIxaDh4RSs5?=
 =?utf-8?B?Yi9tb2lhTXdCU3lPb1VhRkhacElwWXJPMlUyUkhieWJ4a3d1OXJReFVvcEdK?=
 =?utf-8?B?Y0VsbCs3UUxoL2owcHZwMnVuVWpVRVVsc3o3dEFEMkMzeXgwMEZrRjZkZktV?=
 =?utf-8?B?c0s2bDN5SW5odHdlMTdBdFlWQ2RFSk90OTRmU1VydktlM1RHMGxhM0g4dDda?=
 =?utf-8?B?QVFxNVdtL0FGRFpoZHN0UXNib2dQYVhvK05XWmlXT01NL21xNVN2MFd6MXMv?=
 =?utf-8?B?ZmJpN2pnaTZWZjBXemNNa3crSVZETDRTVUJ0c1ZEQnNYbjJ4UW8yTnhvMWdR?=
 =?utf-8?B?YTcvNnBxcFVPR0l3ZTFjbkl1WXVrTms5VWdCcWdaTDIra2xmM2ZpeGFaT2dx?=
 =?utf-8?B?cnBCbDRsNU1UMWEvbUtLemt4WmhXa25vL3ZPTjJVM09sMlVkeWl5dGZJNjli?=
 =?utf-8?B?ckhsVHpUdmdSd0M1UWVQNXdoeUlxWEp1Mk9WZ0QwUWZCT1JFek4vcTNlNStR?=
 =?utf-8?B?WEl2ZHhEK3ZEeE0yeGdLbUVmVjRYMGJ4MmNSODF1ZGJKNjNQTkFFeWJ0ZmIz?=
 =?utf-8?B?Q3ovQWdJYXk2MFBmNlpkemRaWC8veDVhVW00UHltaStIeGNPRVR2MCtBMWRS?=
 =?utf-8?B?ZFhibVoyQUpzN2tUS0xvNExPWDVPU3IzTStBLy9jdE5jdStXWW9mQ2M5MnNF?=
 =?utf-8?B?UHRkeDVjVUx6VmJCaGVXQUVsR3VXOEFkcW1IL2dYR1dzUGEyem1mQ2o5d2Vl?=
 =?utf-8?B?K3g0L01ZK0hia3VpVnVzNUlrbjEvOWdKTmNsZGw3eFRJaTdPeStvdFFsRFZs?=
 =?utf-8?B?L2ovaENpMm1JaUtvOUsrQ0U3dDNMQllkUnJtbDNKR0ZObkdQUVhHamhKa2Vh?=
 =?utf-8?B?NnI1UkJwbk01MDIyT0RCZm1iSUtqMHdvUXdXY3VYWmNya2Z6VnAzNkFYTVBh?=
 =?utf-8?B?RUdGUFNtVEtyNVV1cTdmNzh6ak9JTFdRRUFtTjBvZTU3emg1ZXN2a1RJZTZn?=
 =?utf-8?B?UU5RSVVsS042cUpGbkhzcFhnRFkwMGZIL1JQQ3JVYi9hMURVWEtmenE2T1c0?=
 =?utf-8?B?THVWZGppRytPSlk3c0dUZUE2cGp4MlVQaUJlZXlEcjNoeWdXcG4zbUlrUkFX?=
 =?utf-8?B?RnFBZ0x6dWxYb3VuaVJqM0RxelYrZWVKTG83bHVYYm5JSDNSUDJjTmRjU0dC?=
 =?utf-8?Q?5Ye3KaxGKIZtNOsPVLeC6oQr9U7nqUAz1CaQJhrFTb59?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9650C61C5F5B8743A55BFD9216548963@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12b848e2-1b96-4710-2754-08d9995bb7f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 15:09:05.5976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 qEMAQ4TLFbx1rz55i+n2BzJlhjv3DGwfZM+CTrFZ2BGUWnau/xW4IKAhhUNOd53uJVoJx0daAHJlGU0wBZBmqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157515

T24gV2VkLCAyMDIxLTEwLTI3IGF0IDAzOjQ3IC0wNzAwLCBQZ293ZGEgd3JvdGU6DQo+IEJhY2tw
b3J0IGZyb20gYmludXRpbHMtMl8zNw0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGdvd2RhIDxwZ293
ZGEuY3ZlQGdtYWlsLmNvbT4NCj4gLS0tDQo+IMKgLi4uL2JpbnV0aWxzL2JpbnV0aWxzLTIuMzYu
aW5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gwqAuLi4vYmludXRp
bHMvMDAxNy1DVkUtMjAyMS0zNTMwLnBhdGNowqDCoMKgwqDCoMKgwqDCoCB8IDk3ICsrKysrKysr
KysrKysrKysrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKykNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxz
LzAwMTctQ1ZFLQ0KPiAyMDIxLTM1MzAucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMtMi4zNi5pbmMNCj4gYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMtMi4zNi5pbmMNCj4gaW5kZXggOWQ3NzBkYjVh
OC4uOTgxNjkyZTQ1NyAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0
aWxzL2JpbnV0aWxzLTIuMzYuaW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51
dGlscy9iaW51dGlscy0yLjM2LmluYw0KPiBAQCAtNDQsNSArNDQsNiBAQCBTUkNfVVJJID0gIlwN
Cj4gwqDCoMKgwqDCoCBmaWxlOi8vMDAwMS1DVkUtMjAyMS0yMDE5Ny5wYXRjaMKgXA0KPiDCoMKg
wqDCoMKgIGZpbGU6Ly8wMDAyLUNWRS0yMDIxLTIwMTk3LnBhdGNowqBcDQo+IMKgwqDCoMKgwqAg
ZmlsZTovLzAwMDMtQ1ZFLTIwMjEtMjAxOTcucGF0Y2jCoFwNCj4gK8KgwqDCoMKgIGZpbGU6Ly8w
MDE3LUNWRS0yMDIxLTM1MzAucGF0Y2jCoFwNCj4gwqAiDQo+IMKgU8KgID0gIiR7V09SS0RJUn0v
Z2l0Ig0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0
aWxzLzAwMTctQ1ZFLTIwMjEtDQo+IDM1MzAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YmludXRpbHMvYmludXRpbHMvMDAxNy1DVkUtMjAyMS0NCj4gMzUzMC5wYXRjaA0KPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5mMTkzNGFhNjAwDQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLzAw
MTctQ1ZFLTIwMjEtMzUzMC5wYXRjaA0KPiBAQCAtMCwwICsxLDk3IEBADQo+ICtGcm9tIDI1MTYy
Yzc5NWIxYTJiZWNmOTM2YmIzNTgxZDg2YTMwN2VhNDkxZWIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxDQo+ICtGcm9tOiBOaWNrIENsaWZ0b24gPG5pY2tjQHJlZGhhdC5jb20+DQo+ICtEYXRlOiBU
aHUsIDE1IEp1bCAyMDIxIDE2OjUxOjU2ICswMTAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBh
IHN0YWNrIGV4aGF1c3Rpb24gcHJvYmxlbSBpbiB0aGUgUnVzdCBkZW1hbmdsaW5nDQo+IGNvZGUg
aW4NCj4gKyB0aGUgbGliaWJlcnR5IGxpYnJhcnkuDQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgUFIg
OTk5MzUNCj4gK8KgwqDCoMKgwqDCoMKgKiBydXN0LWRlbWFuZ2xlLmM6IEFkZCByZWN1cnNpb24g
bGltaXQuDQoNClRoaXMgbmVlZHMgYSBDVkUgdGFnLCB5b3VyIFNpZ25lZC1vZmYtYnkgYW5kIFVw
c3RyZWFtLVN0YXR1cy4gUGxlYXNlDQpzZWU6DQoNCmh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qu
b3JnL3dpa2kvU2VjdXJpdHkjUGF0Y2hfbmFtZV9jb252ZW50aW9uX2FuZF9jb21taXRfbWVzc2Fn
ZQ0KDQpBbHNvLCBpdCBsb29rcyBsaWtlIHRoaXMgd2lsbCBicmVhayBNaW5HVyBidWlsZHMgYW5k
IHdvdWxkIGFsc28gbmVlZDoNCg0KaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9YmludXRp
bHMtZ2RiLmdpdDthPWNvbW1pdDtoPTk5OTU2NjQwMmUzDQoNClBsZWFzZSBjaGVjay4NCg0KVGhh
bmtzLA0KDQpBbnVqDQoNCj4gKy0tLQ0KPiArIGxpYmliZXJ0eS9DaGFuZ2VMb2fCoMKgwqDCoMKg
wqAgfMKgIDUgKysrKysNCj4gKyBsaWJpYmVydHkvcnVzdC1kZW1hbmdsZS5jIHwgMzEgKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiArIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gKw0KPiArZGlmZiAtLWdpdCBhL2xpYmliZXJ0eS9D
aGFuZ2VMb2cgYi9saWJpYmVydHkvQ2hhbmdlTG9nDQo+ICtpbmRleCBiYzFiMzViOTdjNC4uOGUz
OWZkMjhlYmEgMTAwNjQ0DQo+ICstLS0gYS9saWJpYmVydHkvQ2hhbmdlTG9nDQo+ICsrKysgYi9s
aWJpYmVydHkvQ2hhbmdlTG9nDQo+ICtAQCAtMSwzICsxLDggQEANCj4gKysyMDIxLTA3LTE1wqAg
TmljayBDbGlmdG9uwqAgPG5pY2tjQHJlZGhhdC5jb20+DQo+ICsrDQo+ICsrwqDCoMKgwqDCoMKg
UFIgOTk5MzUNCj4gKyvCoMKgwqDCoMKgwqAqIHJ1c3QtZGVtYW5nbGUuYzogQWRkIHJlY3Vyc2lv
biBsaW1pdC4NCj4gKysNCj4gKyAyMDIxLTAxLTA0wqAgTWFydGluIExpc2thwqAgPG1saXNrYUBz
dXNlLmN6Pg0KPiArIA0KPiArwqDCoMKgwqDCoMKgwqAqIHN0cnZlcnNjbXAuYzogQ29udmVydCB0
byB1dGY4IGZyb20gaXNvODg1OS4NCj4gK2RpZmYgLS1naXQgYS9saWJpYmVydHkvcnVzdC1kZW1h
bmdsZS5jIGIvbGliaWJlcnR5L3J1c3QtZGVtYW5nbGUuYw0KPiAraW5kZXggNDQ5OTQxYjU2ZGMu
LmRmMDliN2I4ZmRkIDEwMDY0NA0KPiArLS0tIGEvbGliaWJlcnR5L3J1c3QtZGVtYW5nbGUuYw0K
PiArKysrIGIvbGliaWJlcnR5L3J1c3QtZGVtYW5nbGUuYw0KPiArQEAgLTc0LDYgKzc0LDEyIEBA
IHN0cnVjdCBydXN0X2RlbWFuZ2xlcg0KPiArwqDCoCAvKiBSdXN0IG1hbmdsaW5nIHZlcnNpb24s
IHdpdGggbGVnYWN5IG1hbmdsaW5nIGJlaW5nIC0xLiAqLw0KPiArwqDCoCBpbnQgdmVyc2lvbjsN
Cj4gKyANCj4gKyvCoCAvKiBSZWN1cnNpb24gZGVwdGguwqAgKi8NCj4gKyvCoCB1aW50IHJlY3Vy
c2lvbjsNCj4gKyvCoCAvKiBNYXhpbXVtIG51bWJlciBvZiB0aW1lcyBkZW1hbmdsZV9wYXRoIG1h
eSBiZSBjYWxsZWQNCj4gcmVjdXJzaXZlbHkuwqAgKi8NCj4gKysjZGVmaW5lIFJVU1RfTUFYX1JF
Q1VSU0lPTl9DT1VOVMKgIDEwMjQNCj4gKysjZGVmaW5lIFJVU1RfTk9fUkVDVVJTSU9OX0xJTUlU
wqDCoCAoKHVpbnQpIC0xKQ0KPiArKw0KPiArwqDCoCB1aW50NjRfdCBib3VuZF9saWZldGltZV9k
ZXB0aDsNCj4gKyB9Ow0KPiArIA0KPiArQEAgLTY3MSw2ICs2NzcsMTUgQEAgZGVtYW5nbGVfcGF0
aCAoc3RydWN0IHJ1c3RfZGVtYW5nbGVyICpyZA0KPiArwqDCoCBpZiAocmRtLT5lcnJvcmVkKQ0K
PiArwqDCoMKgwqAgcmV0dXJuOw0KPiArIA0KPiArK8KgIGlmIChyZG0tPnJlY3Vyc2lvbiAhPSBS
VVNUX05PX1JFQ1VSU0lPTl9MSU1JVCkNCj4gKyvCoMKgwqAgew0KPiArK8KgwqDCoMKgwqAgKysg
cmRtLT5yZWN1cnNpb247DQo+ICsrwqDCoMKgwqDCoCBpZiAocmRtLT5yZWN1cnNpb24gPiBSVVNU
X01BWF9SRUNVUlNJT05fQ09VTlQpDQo+ICsrwqDCoMKgwqDCoMKgLyogRklYTUU6IFRoZXJlIG91
Z2h0IHRvIGJlIGEgd2F5IHRvIHJlcG9ydA0KPiArK8KgwqDCoMKgwqDCoMKgwqAgdGhhdCB0aGUg
cmVjdXJzaW9uIGxpbWl0IGhhcyBiZWVuIHJlYWNoZWQuwqAgKi8NCj4gKyvCoMKgwqDCoMKgwqBn
b3RvIGZhaWxfcmV0dXJuOw0KPiArK8KgwqDCoCB9DQo+ICsrDQo+ICvCoMKgIHN3aXRjaCAodGFn
ID0gbmV4dCAocmRtKSkNCj4gK8KgwqDCoMKgIHsNCj4gK8KgwqDCoMKgIGNhc2UgJ0MnOg0KPiAr
QEAgLTY4OCwxMCArNzAzLDcgQEAgZGVtYW5nbGVfcGF0aCAoc3RydWN0IHJ1c3RfZGVtYW5nbGVy
ICpyZA0KPiArwqDCoMKgwqAgY2FzZSAnTic6DQo+ICvCoMKgwqDCoMKgwqAgbnMgPSBuZXh0IChy
ZG0pOw0KPiArwqDCoMKgwqDCoMKgIGlmICghSVNMT1dFUiAobnMpICYmICFJU1VQUEVSIChucykp
DQo+ICstwqDCoMKgwqDCoMKgwqAgew0KPiArLcKgwqDCoMKgwqDCoMKgwqDCoCByZG0tPmVycm9y
ZWQgPSAxOw0KPiArLcKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+ICstwqDCoMKgwqDCoMKg
wqAgfQ0KPiArK8KgwqDCoMKgwqDCoGdvdG8gZmFpbF9yZXR1cm47DQo+ICsgDQo+ICvCoMKgwqDC
oMKgwqAgZGVtYW5nbGVfcGF0aCAocmRtLCBpbl92YWx1ZSk7DQo+ICsgDQo+ICtAQCAtNzc2LDkg
Kzc4OCwxNSBAQCBkZW1hbmdsZV9wYXRoIChzdHJ1Y3QgcnVzdF9kZW1hbmdsZXIgKnJkDQo+ICvC
oMKgwqDCoMKgwqDCoMKgIH0NCj4gK8KgwqDCoMKgwqDCoCBicmVhazsNCj4gK8KgwqDCoMKgIGRl
ZmF1bHQ6DQo+ICstwqDCoMKgwqDCoCByZG0tPmVycm9yZWQgPSAxOw0KPiArLcKgwqDCoMKgwqAg
cmV0dXJuOw0KPiArK8KgwqDCoMKgwqAgZ290byBmYWlsX3JldHVybjsNCj4gK8KgwqDCoMKgIH0N
Cj4gKyvCoCBnb3RvIHBhc3NfcmV0dXJuOw0KPiArKw0KPiArKyBmYWlsX3JldHVybjoNCj4gKyvC
oCByZG0tPmVycm9yZWQgPSAxOw0KPiArKyBwYXNzX3JldHVybjoNCj4gKyvCoCBpZiAocmRtLT5y
ZWN1cnNpb24gIT0gUlVTVF9OT19SRUNVUlNJT05fTElNSVQpDQo+ICsrwqDCoMKgIC0tIHJkbS0+
cmVjdXJzaW9uOw0KPiArIH0NCj4gKyANCj4gKyBzdGF0aWMgdm9pZA0KPiArQEAgLTEzMTcsNiAr
MTMzNSw3IEBAIHJ1c3RfZGVtYW5nbGVfY2FsbGJhY2sgKGNvbnN0IGNoYXIgKm1hbmcNCj4gK8Kg
wqAgcmRtLnNraXBwaW5nX3ByaW50aW5nID0gMDsNCj4gK8KgwqAgcmRtLnZlcmJvc2UgPSAob3B0
aW9ucyAmIERNR0xfVkVSQk9TRSkgIT0gMDsNCj4gK8KgwqAgcmRtLnZlcnNpb24gPSAwOw0KPiAr
K8KgIHJkbS5yZWN1cnNpb24gPSAob3B0aW9ucyAmIERNR0xfTk9fUkVDVVJTRV9MSU1JVCkgPw0K
PiBSVVNUX05PX1JFQ1VSU0lPTl9MSU1JVCA6IDA7DQo+ICvCoMKgIHJkbS5ib3VuZF9saWZldGlt
ZV9kZXB0aCA9IDA7DQo+ICsgDQo+ICvCoMKgIC8qIFJ1c3Qgc3ltYm9scyBhbHdheXMgc3RhcnQg
d2l0aCBfUiAodjApIG9yIF9aTiAobGVnYWN5KS4gKi8NCg0K

