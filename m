Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3460C5ACB3
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 08:53:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.35460.1700556811996451163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 00:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bi/v86X6;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700556812; x=1732092812;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=tASsWkQIF6i76owXfuMrkMWyRJOq/xN8E7dnFPlzDLE=;
  b=bi/v86X6P1dcBZJwzLhFDcsPyIKH8F6+9iWpTJ6kbVGXMOtnMTu2AAAR
   e/g9trmA7wC63bre0m9oQ60o2JYfTotJGtTQ9HLXVSoyiXCr67u54ZohD
   ij7bfV2FdqTflh+0O20NTnQc2Q537saDCPRscYoKXD1lbwmcySo2yWIR/
   FQkcA45sXLACfGLSomu3u7e87qdukXITpR9LUsYd4HX+fC+zfPxouTVpD
   FJkigBvgBtrmZWWISlLJ3akID7Lgll87eygQpz7Y07vVZ3tROAMg0w4+P
   DriA85HCStDNIGn+lS783x7TAT3c+9cEX/w3suPeUDG50vE1rywUH1KSt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4922088"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4922088"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:53:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801459788"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="801459788"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 00:53:29 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 00:53:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 00:53:29 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 00:53:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/G7S3wbiHciT/ekYwGeJsme5B0e3kSJvk2cNjvEuBdreR5SOlXP25uXufUc6svgiYXbIvIj0+i8EGD5gIY2ATp3C1AxfCZZ1OGyl43C1rhobKLmcSa8pHzpxWehK9SGnusgDsxzk2UVTryspvEygCfjHXC9nIBV5BLj6Hvk3l5ziOROX7GSVPtraMv7QHLqzdRPbxPq6T41OESZTcvRpsCF4QYRbalXVTMQQtJfzOaR0UQdmrxb54F0N3rIElQjmsmycFRSi/4TuKxYbmQc7tcJUryZ+U91HXxjX1Ier49m0HHZLfB1VxkbIqxy2Hv60JAp8rWm3J8QKb91khQPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tASsWkQIF6i76owXfuMrkMWyRJOq/xN8E7dnFPlzDLE=;
 b=CX8dgWf3kqShRvVjmCAXoR0DOhe4oWe9Sm0A7DvAuv3tG0bHwy/TWcErY123VXTSmbSLz1KVLv0z0+b+8rZEVEco3XkUGPa3LxqlOW4jHHJRclPCkRk195zoEWt3+X4SrZpoV7bazAuKHTVqdl9MrbIAH4URsd8U8D5+/1hYVhE68fLYCcNtZ7kIcz4E7aDZxQD9cISEuYOqAQpPGTHQ4riXTzUXBP4xGoqHtKYxwxrbqk2fPpoNAC2EOjJN8h9ypWF1kBz7+6SwJs75UYMTI37L75simdDI3H7oSJM6PmJg1Ar8t15VYJY6CR4SR8iOpymc5cT6DUNMJ91CYBN6pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 08:53:27 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 08:53:27 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "stefan.ghinea@windriver.com"
	<stefan.ghinea@windriver.com>
Subject: Re: [OE-core] [hardknott] [PATCH 1/2] libtirpc: add support for
 configuring and building with --enable-gssapi
Thread-Topic: [OE-core] [hardknott] [PATCH 1/2] libtirpc: add support for
 configuring and building with --enable-gssapi
Thread-Index: AQHaG/e0yt9wtMm4SUC1v4ooWSN1K7CEeHEA
Date: Tue, 21 Nov 2023 08:53:27 +0000
Message-ID: <230fcd2df1ddad26d11aec70abc2f873895ee5a1.camel@intel.com>
References: <20231120212436.27604-1-stefan.ghinea@windriver.com>
In-Reply-To: <20231120212436.27604-1-stefan.ghinea@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV2PR11MB5976:EE_
x-ms-office365-filtering-correlation-id: 15e25c2a-fa72-46c3-ba94-08dbea6f53dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ODkT/fFgreCvdd1G0IX3LSoSSULtCb/hu07SvPwbxFRJOCAMqSzOMLlpXpIovBwq2lsjT1i6wND/xzSpxnagiMbS021WYE6IqK9mtxnYZ2tu9hRWMpUCYoh5oXoViFq9dWRRyZrURn3BEreGIKasewxz7ZFBMqOhquoIq+PfID4TZ0FeYwydyzqhChjB8MAJms3TlvVuOcg0sqVY9O32lQZvXrZjkHxgcnSV3lQWPUePBnOdfv3ajQvh0voMGtaRMfw4mgClBhbNtJ+rfswNu5M3ZVntGWPnVx0IH8YO8yHg0/4HgU8tflbNJGz1lyJFB2jPa1xYWFffzzITir4afT4DPrheRoRexlUtkOdjvGp3/Hc2lylPaK2lknKK9OnQ1IIOWQMkWiML0vdkakS093fJikb1yZd//p8/eXrRw0a3BqscEnvWZ6m+8YIankmBGrBIrTjpYRLnw79gykVlpIBTCS+Jopl8YeJ4tyZA9BPcvUhV8Wz3onjqS6M7q9VywQrdBTA82baHqlscQH5+DfqpLlc/6coebQ3SfknODopXyw86QsjvabMWhO/Z0AHzA76AFVVXuBKIypFFrqiNn6CvyhZQePDEkWmQK8TXSgxTyVPiFeL/xq0WVwPT6FQpAXiYJUM4fe702DFiae+kBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38070700009)(82960400001)(86362001)(71200400001)(110136005)(91956017)(6486002)(966005)(6506007)(76116006)(66476007)(66446008)(64756008)(66556008)(66946007)(316002)(36756003)(122000001)(6512007)(2616005)(26005)(66899024)(83380400001)(2906002)(4001150100001)(5660300002)(478600001)(41300700001)(8676002)(38100700002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bURTbHpmaW5jVzJScTFIM3JBV0RQZXp6VzhhTkYyeDBhU1cwVC83S0Y1ZnJz?=
 =?utf-8?B?NisrRmZqT1k0NHJlWFpHRTMxMDdRZ3YwMG05UFVLcjhaa0h6VC9WRUdWbFUx?=
 =?utf-8?B?U3RKWkFIL2JPZTBsRW5pbWdUeFdTdGFhbEpSdzNteUowUEZka0o2VWtTZXNj?=
 =?utf-8?B?eDZrQWpOeGFQSWxQS0U0VWs2emkxM1M0dnRPYkFTNEdha0hvYWFVUG9DbjM5?=
 =?utf-8?B?U1RHMXpmVzVWWm1KOXNjblo5Z0lsQ1lJNDBwWjlUZjJaRW9HQjcxRTQ5b0w5?=
 =?utf-8?B?KzcwSlJDQ092ZzB6aVlDL2VmTVZLcFk1aFl0bmwyTDV5NTduMXNmSWFTSU1K?=
 =?utf-8?B?NHpNL2Y5OTNnaFZneTQ0d0tTNkZheVpRVDlSVmR0T1NXRDkxSG14SXN2bThk?=
 =?utf-8?B?Q2c0ZCtEeHBBeFNTdmtnb1ZDSHR0dzJrV21XVVZodzEvcmFEamFPZTBPV2lV?=
 =?utf-8?B?TzBnY2VENFo2ai8rZ0taNnY1dHFOYjR3U09LSWtYemE3aTFQVFFITThYNDZD?=
 =?utf-8?B?ZHhHRWJiRTBCM09HVTdXU3ErWHZDaHp6cEF3MU1NTC8xQlMwYk83ZlpiVnFP?=
 =?utf-8?B?UlZudW9Ic1c5L2V0ZGF2dXpLYWpqR3FrejcxQmpBQkswa1RPbkM2WkxvRnZ5?=
 =?utf-8?B?SUNCSDFITG83bFRZVkwyWWpYc3M3enE1cjFEeXh6TDB5aDlPVkpoTlJuY0o3?=
 =?utf-8?B?SGVtczVaRWs5RXVuN1c5Z215VU92VFBXL05JUHNiVUlHbkc0ZXZ4cit6N3ox?=
 =?utf-8?B?M0xMcUtVUklnOVNlNHcxSHRjSFA2RWx2TVlXUklKT1N1aHBjVzFac0dna0NV?=
 =?utf-8?B?bEF2RUFiNHdaaERQZmRORTAvNmZGc2d3aVlkZlF1M0MxczUyYVQ5Y3lIL3hC?=
 =?utf-8?B?V0hxMnBRLzNNM1pUQmRCT2R1RDJlbnVTQVgwODVNYklPOXZTTDZFbk5QWlB0?=
 =?utf-8?B?dFZOM2E0MUhqaWVlcTVFV2Rzd0dsZGExTEJRSDJmNnJ5YjQyT0h6cUdhd0Yv?=
 =?utf-8?B?dC9GVFdkckpYclV1Nnp5NGxOQjFITzR5cWEzWkczZk1Ea3Q0OVRlcmZFczF6?=
 =?utf-8?B?Vm4vZHJvNDVrMGQ3dlkvOERFZHBCcDJ4MFYrZExMSWprWFdGbGlHWFgydDEy?=
 =?utf-8?B?d05zb1M2dTRkVkRDOXpsTU5oT2xEWjlpeEgxUUw0d0gwTWFYbmxkTEVGa3VK?=
 =?utf-8?B?U0hobXV5YkVuMCtJd3NrQjNVdG03Z2t6NDlDRjRuYVBUZFpPN1Jra0NJQkpp?=
 =?utf-8?B?cHV6QWlYMXZpeitkSTdDWFhMdHZFMEMzd0xMcTZXSzZoK3ZnUkwyODMwTkQv?=
 =?utf-8?B?VnA2WFZyYTJ3RGxvb0NtbFBxT28ydHM4WVQvZ0pGRzJzK0JsbmNHT3ZnTzBq?=
 =?utf-8?B?enc3aDNlQlBBMmNmWGF2RFRNZFlMSnRxSXZod1VHZklWOWw2N0JnVUt6OUdy?=
 =?utf-8?B?S1Z3cldEMjZ1RVRMc2F4U1I3bGdwdzJmMTdBUVdoaGNQL3NCVWhoalBmSU1E?=
 =?utf-8?B?RHFtMlZTRzJKd3ZCQU5VdERXREx5UTRvbWcwSjN1WVpDTHU3emI0a3NhL0c4?=
 =?utf-8?B?Mlc3UFVtS0dmZ2pVRnd4SnkxREluOTJNTHFCemdGbUFyTTJoN2hDUGNVcFJE?=
 =?utf-8?B?amgxOGVBclR3YVZRZStvZ2ZEeVVvSTVCQjVFUE45bm9mZU5CZVY1b3U4dnlV?=
 =?utf-8?B?S0FHMVBEWE5qb1ovWUl1QjlkNjhYOWtKdkNoeTFCNnJKa0hxVGJvT1E4OThD?=
 =?utf-8?B?SHNTSmRBSlZyaHpuUkh6Mi83am00MVVsTHFuamxDdXo0ZXZzWWFqdlMwUFo4?=
 =?utf-8?B?TWxuK1J6bGE5c29FV3N1R3NkVUNLM1h3dUt1bHl4SU1TbG1QQmpwV1RONkZm?=
 =?utf-8?B?MnlXVmNvcTYzaFlQeXRyTUNSV3RjbHBpQ3BzVUtDaUtxTkk4UkwwOXpwN2Vi?=
 =?utf-8?B?Ti9lRXNxN3dRdGEzZ2xFN2l4bURqVjBlYVFlTUlBTkJPVzhWTkFDY0tNNXRL?=
 =?utf-8?B?NkNpSWRROWdXSFN0Z2o4TGc0V1o3Y09ncFIzcHVxTy9INGZSTGFiTUFpNkpE?=
 =?utf-8?B?bHZCcFNXNHJmVHdCZWw2WForS2hOSnNISGZkc3MycFpVcjYwd2ZldkIrN3BB?=
 =?utf-8?B?WXIva2hIU2IralZVVFlKeHcvZlpvQkcxbklraWIzUTVxWVByTTZhV1BBaTBB?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54093EEBB6A2E24EB306456AA767D962@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e25c2a-fa72-46c3-ba94-08dbea6f53dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 08:53:27.2124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qf8LDtcx1yipTFY3PSlT5T2lDbXU/c+/p83LKVeNEqMYBKPSoa9cErhvw1DpRDuABxtnaRcV5gefJ3d0iexIfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5976
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 08:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190958

SXMgdGhpcyBmb3IgaGFyZGtub3R0PyBUaGF0IHJlbGVhc2UgaXNuJ3QgbWFpbnRhaW5lZCBhbnlt
b3JlLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KT24gTW9uLCAyMDIzLTExLTIwIGF0IDIzOjI0ICsw
MjAwLCBTdGVmYW4gR2hpbmVhIHZpYQ0KbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4g
bmZzLXV0aWxzIHdpdGggZ3NzIGFuZCBzdmNnc3MgaGFzIGxpYnRpcnBjIGNvbmZpZ3VyZWQgd2l0
aCBnc3NhcGkNCj4gb3B0aW9uDQo+IGFzIGEgZGVwZW5kZW5jeS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBHaGluZWEgPHN0ZWZhbi5naGluZWFAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+
IMKgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy4xLmJiIHwgNiAr
KysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRp
cnBjXzEuMy4xLmJiDQo+IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnRpcnBjL2xpYnRpcnBj
XzEuMy4xLmJiDQo+IGluZGV4IDMyZmI2NTExMzAuLjVhZTkxYjZkZjMgMTAwNjQ0DQo+IC0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJ0aXJwYy9saWJ0aXJwY18xLjMuMS5iYg0KPiArKysg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlidGlycGMvbGlidGlycGNfMS4zLjEuYmINCj4gQEAg
LTE4LDcgKzE4LDExIEBAIFNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICIyNDU4OTVjYWYwNjZiZWM1
ZTNkNDM3NTk0MmM4Y2I0MzY2YWRhZDE4NGMyOWM2MThkOTdmNzI0ZWEzDQo+IMKgDQo+IMKgaW5o
ZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+IMKgDQo+IC1FWFRSQV9PRUNPTkYgPSAiLS1kaXNh
YmxlLWdzc2FwaSINCj4gK1BBQ0tBR0VDT05GSUcgPz89ICJcDQo+ICvCoMKgwqAgJHtAYmIudXRp
bHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAna3JiNScsIGQpfSBcDQo+ICsiDQo+ICsjIGty
YjUgaXMgYXZhaWxhYmxlIGluIG1ldGEtb2UNCj4gK1BBQ0tBR0VDT05GSUdba3JiNV0gPSAiLS1l
bmFibGUtZ3NzYXBpLC0tZGlzYWJsZS1nc3NhcGksa3JiNSINCj4gwqANCj4gwqBkb19pbnN0YWxs
X2FwcGVuZCgpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoGNob3duIHJvb3Q6cm9vdCAke0R9JHtzeXNj
b25mZGlyfS9uZXRjb25maWcNCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzE5MDkzMSk6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTkwOTMxDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMjcxNjE4NS8zNjE2NzAyDQo+IEdyb3Vw
IE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IFVuc3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1YsKgWw0KPiBhbnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

