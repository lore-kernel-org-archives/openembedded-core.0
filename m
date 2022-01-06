Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D127C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 14:27:29 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.9144.1641479248069119961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 06:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=I2/lnemr;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641479248; x=1673015248;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eM7cEANKIlpN9WF0cmYVlCutCslopzpo+Dom+aJFB0Y=;
  b=I2/lnemrQxvykitTEraFDXJuq71WyGOK2ApeAO/68uphwcLO0ounvf7G
   g4opoEknoqOy301Q7025Jsw8s/iTMZhEtnd9zgD26hQ+DpNCly2R4cImt
   ccvsCGVigD3QCyx+RjEuHsbivufJfHUPWxROy3GjBAYePDccI1L5StGSb
   1j7JorcNYJ0yPXlU40LktQRUU6WDj7PErJ6Xr7jjkaaG2+u2KOCJeM/c9
   6n7LplqCd5KDvoFWwGfOtOQV0Qt2Y/FyS/HN4E0+Vf8ZLE6JUnSJP0Vy2
   5aEhc0bNYQeUUTJ9+9T5t5kY+G7dJfxIHGtccoumCksmA6e9hy5wj5DAL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303411711"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600";
   d="scan'208";a="303411711"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 06:27:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600";
   d="scan'208";a="470958778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 06 Jan 2022 06:27:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 06:27:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 06:27:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 06:27:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 06:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1YtKagXBkQJ9I5jtEPEL6MBDQ3cI2OtO3eThwWPe93cuGrIiwQOVsAs1HMlZwYLYHTyWRMnI+KXATqYFqayf3al4fENE5WLoTGWPOlHblVPTbkr4NHP0+0c1bLgD5CFcc2LEEkQMw77dcwofGzSeKry5EMgDvPki89IhtkMb8QzQeO78QovfcWQ+LdYHQuNkFihf7IM5GoMOinOaGWigfl9se8tHUbF5duz/617w/cgJdtu0T6Jip0T8ZRRWFjOC0tCd29AL07eUFC99gHagC4MwYeLWQ7CQB7ldOry889EgGs2ROcEI1RMbVBGuDIaL7+0q3zUYFXCQjN3XnoLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM7cEANKIlpN9WF0cmYVlCutCslopzpo+Dom+aJFB0Y=;
 b=GQ9jui9OPYpiXYBQH1ntKT1iqXU49mxoo5R1Jmn45H7zW50WEri0/oa+UVkvwqou10GbAa23JwifcUDOvO9oWAcyQatA7+H3qdU1N3P4SQt+uHHnOFuNX4zSY9vGNAPO/hWQqkKUA+T5whC1SoG7+p+tXXi/HMOuljPptBqFWq1UTOoLAKzjsxB42ubkGybM7c6CqvendlrfSTQJnZp+iSdXDz55T2eHdsUG1xqIgLOuGtndaV/hkOEiWCQ/4p1fUv+UtQnNUGt8xfQWjpKeioAD7fz9PniZ2+BA5ltVMP56iHZcB0f1Chf9Q8gCiQ2oGKtayE2RWN5JJFGAK4d+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Thu, 6 Jan
 2022 14:27:23 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%6]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 14:27:22 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pgowda.cve@gmail.com"
	<pgowda.cve@gmail.com>
CC: "rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [hardknott][PATCH] AArch64 support for Arm's Neoverse N2 CPU
Thread-Topic: [hardknott][PATCH] AArch64 support for Arm's Neoverse N2 CPU
Thread-Index: AQHX9ldcOlkSJNd72EOagOgDQxKu1qxV5zwAgAA/HYA=
Date: Thu, 6 Jan 2022 14:27:22 +0000
Message-ID: <c20b76295b096cfbb1c0cd38f0721e59935c241f.camel@intel.com>
References: <20211221104136.191831-1-pgowda.cve@gmail.com>
	 <CALY49869bb2zvqnNNJVbLi-5BbOYnE_Dt1xsc5khv3H8GBre4g@mail.gmail.com>
In-Reply-To: 
 <CALY49869bb2zvqnNNJVbLi-5BbOYnE_Dt1xsc5khv3H8GBre4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bea944d8-28c4-4e7d-0b28-08d9d120a789
x-ms-traffictypediagnostic: BYAPR11MB3480:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB34808D0033295B83CFC75864F84C9@BYAPR11MB3480.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LkgVA4xuJ3uK3VWIEf71RED6lQLw3sqb6ZmzFB7daS0PiniGKy+OpRxmdEg7EFzCpd0DbDQe++x4l7VRlFPSPazAjsmxAp8v5A2P2MIvmgbiez4hwC0hczSZ/S75mgh7//OxHUEqYeVwaGWIBZDUVr/Z98Y5AgJaHdsKc28mcMRbzuNQlOCov47B+WSEfFouu8UflFPKupmZF5OG6+15grSOrt0S+gIizRk3377MBXz/TmoEaDX7EbHKQRKgfWlrnXOd3XLyvylq4Q+btM//TW70s9siVaVf/pdnKmGWKFD7sTc9YyrabJ7MSXpdpN21k8SGphOw20HRG1Mivwjtphr8zeVYC3i4Xj6fGEXumRhmoWunl2MurD+I6yIsmROrxyGMnmAHVcqC+pLo132CmngcCQb1tDW27+lD4adyp6WR6WQPGH2elRommUXjwSLrrmQ/csvoymInjRw365zGje5k4guwubntaQ5m0ml3ZpUPJNKW1zIHvN/jVZ8VNNAVoQnPUPBdDAtjefLMMWEcWf3wfVU3ps0WDQ5XmcpH9dK9fJaD6gHr6496ZFKtJZl71Qg1m6hSo+a0Qo5C+TA0P6qCAAxNstMhYKKbL21sENM2UaziTb83byQUDRQO66UcutgJY4zi4FDXdlXy0tF+V6Sa501tBBkO4lX5cHsgrBtm12k+6KNyV04RfudTSkdTTSXi08oZIuEypYkuJesoDZKa1V0QA9cmwSMqBZP0Al3ydRP+6hTE2sXhSUj3sj29ttJXr4J+Q9Qk2HJY3+z3Cij/VLau0sDLbFqRckAcPTA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(316002)(38100700002)(4001150100001)(8676002)(186003)(54906003)(76116006)(36756003)(66556008)(71200400001)(86362001)(53546011)(2616005)(122000001)(8936002)(38070700005)(6506007)(66446008)(6486002)(64756008)(82960400001)(6512007)(26005)(2906002)(91956017)(66946007)(66476007)(4326008)(5660300002)(83380400001)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUhRek9oeXkrNS93LzZLTmVJbFBPUU85RDZaczNjYTNlZUh1QTErUTcyZTVQ?=
 =?utf-8?B?dW9vbm45RFBEU3dmdjBiN0V1c2VPTjBTWTFlTWlIMTNrbjBsT0JLVzlkTE5J?=
 =?utf-8?B?NlE5RWU3NjU4Tkhac3Ruc3kvSTZTN29YcEp1S3crMndIcCtzOThWclBNM2pW?=
 =?utf-8?B?Q2ZIaytsUzltWnJaRDV1amNINk8xZEZxeUZDR1ltNlBMQ3FBWjlVWHVncXRD?=
 =?utf-8?B?QWxWbDlTZ2Y1dXkxSXpmSURJNFQyWFNRTDJab0t4YVRsMlhqNVlQWGRUb05G?=
 =?utf-8?B?Y09zVE8vM0NyZmdmS0hZN1ZkOGo5STBabUJMMHBOdS8vcTFGWC9FN0pEMzVT?=
 =?utf-8?B?QmNGZFFGTmJWOHg5eGoxYlRHbzNLek90VjdCRHN0dEM1NTUzenZ2YlFqYmJr?=
 =?utf-8?B?bW8yS3RZOVJKY1BPMjRmcVRlWGZRTisrNFNxWlFXbjdiOHRwd0Rza01mVFdY?=
 =?utf-8?B?QVVyMzl4dnd6b2ZVWlBnbWZHZzgwYTVEdldIOGN1ZkhsSGVrQkdyRUw0QUs3?=
 =?utf-8?B?UnlEYTRNcTdFMUNURTg4K1A5SWw4MFJFcDFOWllvMGtwdDdyK0RUd3FQZ2Zm?=
 =?utf-8?B?MzdnQ01hQVVPRnNrTGVsM2VVOUh2b21STFNpU3AyL3NMZ1ZqdlJFYVpvTWJK?=
 =?utf-8?B?dkp1L25ZMTIzVFFEMnVQTnV5YU1pdGdVS090NUNHVW45TVF0K0FjNGtnMldI?=
 =?utf-8?B?WnlEVmc4U0puc1BGb2l5dVZrL1FyalFUVUIxOVlicG55WVdvN1ZqQnFnTmVU?=
 =?utf-8?B?V2VoWU9NSWpzSi8wY3ozV3YwZXo0dXFGbHZ3NGJnSUtpcjJOK04wU3Awb1Rx?=
 =?utf-8?B?bFd5cHdGSEk0SkUzK2t4ZHJUNWZlQmMzL3doSk5kdTFXMGlUMWVGbzNxbklD?=
 =?utf-8?B?a3FEWTlSaTdiVzRHaU16N1VPSXdFNGtadDJnOEd1R2FqRGZTTFhpc2NHby9k?=
 =?utf-8?B?NTNvM2U1MmlqNzJIT1lSZnR3SU1KODRpTkhHZkxvbmJ3SGxHSU8ra3VtMjFD?=
 =?utf-8?B?UWRzdkVncVlHSmdKUkVkcVVDQ1RuL2VwRzZUcEQ4d3JpcDZKazJkYk9ndmIx?=
 =?utf-8?B?bGlPS0IzYnYzdCtWSU1HVWNBeFlhaFZtd1JPT2g1aU9DTktHekRBcC9LU0lN?=
 =?utf-8?B?UHd6NnlNN3g1Q2JZU2tGT0w2R0ZKZU9Sa2VtY0VwR1dSckk4Y2FoemM3K1ZJ?=
 =?utf-8?B?WS82MXN6NnBGbnNTL0t3eUp5ejZralZPS1lrczJwemFVL016dlR4aWJ1bnZy?=
 =?utf-8?B?dGlwZklHaXU3WXZYRWxPUk91TU1PVVVFVm42dHBGU2xsRk5hdG0zeFhlWVdZ?=
 =?utf-8?B?SGF0SjhtaFFMYkFjNDlGQW9FQ0hoclRlcGF2UnBuSm1ZUXU2YTNCRHh5UUZX?=
 =?utf-8?B?Y0VpZ3VUUEVNZC9WeXlpTXJBZ1M3UlVaaDlqeS9FVmNXckExTVRJTDRwU1Mz?=
 =?utf-8?B?OSs5WWFVVXgvaGlpeStKcFRoQ3RDbjMyUHRwSk5Rb29JZFRzVzRORFVDd0Ir?=
 =?utf-8?B?UXZHL1JSSS8yYjNLSVlGb0d4N1NBVFFrNkM5bk9xZlBMSk9OQ2VuR2w1eTF1?=
 =?utf-8?B?UjBwVklyYXpjWDZrbitUeVgyZmhBR3VnY0tqMkxmM0Ywbk9YZk10ZE1TUU1I?=
 =?utf-8?B?d0NvdUJiVTRUODJhZGp0dkFhb0FxZ1kwRHBCTTQ4OTdKNXdjTVJlWFNTb2RZ?=
 =?utf-8?B?RDRtUS9DejR1ejlPNFFHckpQSzRkRHZhdklSb2FOaEgvb2FLTGRVYXRiZ0ZK?=
 =?utf-8?B?SVNMeUlwaXViOWJCd09aZXIxWU1EQjd1OHBVMEt6SEZ6VjlwSEFRVC9vdmE1?=
 =?utf-8?B?aFVHWDZsb3NTcGxJVWFrRUlMY1Y3RFQwQy9mUThFemQrNSsySkdHZmZqTVZY?=
 =?utf-8?B?SXcrSGpaTTIwNDdSTlora1EwS2hzbFBCNjRFQjZSZGh5MjFrTUtzWUdLSXdV?=
 =?utf-8?B?TVB3cTQ1V3A1aG9iVDlDTzBHdmVzV2IvT3BTdWUxSE93K21YaS9hTi85N0l4?=
 =?utf-8?B?OHphclVhSDBBVmZsTFpkdDEzZ0xFSHhXMHRxOTFuZlpBVXJ5MDd3Zy9Pb1Vh?=
 =?utf-8?B?NU4yQ3N0Y0hWTHdBbmpMOWZ5Ym9DOXJpVjRRRHJnOVVRSEQyMW54RUtCNW1r?=
 =?utf-8?B?cmxDWUw0cGRFUkxmcWQzT01JUlVxY2ZhOFYrZ0tUWXZva0tKYmhrQ0d1T081?=
 =?utf-8?Q?XQSHZCf4y7r5Q5w2fjZ+5oYhyia9n7y/qIwpPlOZpT62?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E073ED5AF293FC4F8F28F86676314EE3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bea944d8-28c4-4e7d-0b28-08d9d120a789
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 14:27:22.8633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 /aWR9KzIxEvufuZBeQOKPvgoWMXea8W0hwl9CzaEbc0gVq8meoqwiuEV59wYWkoqSeE1AsZtE9aQbJ9qzhUCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3480
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 14:27:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160233

T24gVGh1LCAyMDIyLTAxLTA2IGF0IDE2OjExICswNTMwLCBwZ293ZGEgY3ZlIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IEdlbnRsZSBwaW5nIG9uIHRoaXMgcGF0Y2guDQo+IA0KDQpJIHdpbGwgdGFrZSB0
aGlzIGFuZCByZXN0IG9mIGdjYyBwYXRjaGVzIGluIG5leHQgd2VlaydzIG1lcmdlIHJlcXVlc3Qu
DQoNClRoYW5rcywNCg0KQW51ag0KDQo+IFRoYW5rcywNCj4gUGdvd2RhDQo+IA0KPiBPbiBUdWUs
IERlYyAyMSwgMjAyMSBhdCA0OjExIFBNIHBnb3dkYSA8cGdvd2RhLmN2ZUBnbWFpbC5jb20+IHdy
b3RlOg0KPiA+IA0KPiA+IFRoZSBwYXRjaCBiYWNrcG9ydHMgdGhlIEFBcmNoNjQgc3VwcG9ydCBm
b3IgQXJtJ3MgTmVvdmVyc2UgTjIgQ1BVDQo+ID4gVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0K
PiA+IFtodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0ZGlmZjtoPTk0
MjhlOTI2NzQzNWE2MmYNCj4gPiA2NzJlMmJhNDJkZjQ2NDMyYzAyMWE5Y2ZdDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogcGdvd2RhIDxwZ293ZGEuY3ZlQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4g
PiDCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjIuaW5jwqDCoMKgwqDCoMKgwqAg
fMKgIDEgKw0KPiA+IMKgLi4uL2djYy8wMDM5LWFybTY0LW5lb3ZlcnNlLW4yLXN1cHBvcnQucGF0
Y2jCoCB8IDYwDQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCA2MSBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MvMDAzOS1hcm02NC0NCj4gPiBuZW92ZXJzZS1uMi1zdXBwb3J0LnBh
dGNoDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2Nj
LTEwLjIuaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiA+IGRldnRvb2xzL2djYy9nY2MtMTAuMi5pbmMN
Cj4gPiBpbmRleCA1NjI2YmYyMGYwLi44OTE1ODI1OGQ3IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTEwLjIuaW5jDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2djYy9nY2MtMTAuMi5pbmMNCj4gPiBAQCAtNzQsNiArNzQsNyBAQCBTUkNfVVJJ
ID0gIlwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly8wMDAyLUNWRS0yMDIxLTM1
NDY1LnBhdGNowqBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMy1DVkUt
MjAyMS0zNTQ2NS5wYXRjaMKgXA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovLzAw
MDQtQ1ZFLTIwMjEtMzU0NjUucGF0Y2jCoFwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmls
ZTovLzAwMzktYXJtNjQtbmVvdmVyc2UtbjItc3VwcG9ydC5wYXRjaMKgXA0KPiA+IMKgIg0KPiA+
IMKgU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gPiAiYjhkZDQzNjhiYjljN2YwYjk4MTg4MzE3ZWUw
MjU0ZGQ4Y2M5OWQxZTNhMThkMGZmMTQ2Yzg1NWZlMTZjMWQ4YyINCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MvMDAzOS1hcm02NC1uZW92ZXJzZS1u
Mi0NCj4gPiBzdXBwb3J0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MvMDAz
OS1hcm02NC1uZW92ZXJzZS0NCj4gPiBuMi1zdXBwb3J0LnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi5iM2UwZjM5NmJkDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLzAwMzktYXJtNjQt
bmVvdmVyc2UtbjItDQo+ID4gc3VwcG9ydC5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsNjAgQEANCj4g
PiArRnJvbSA5NDI4ZTkyNjc0MzVhNjJmNjcyZTJiYTQyZGY0NjQzMmMwMjFhOWNmIE1vbiBTZXAg
MTcgMDA6MDA6MDANCj4gPiAyMDAxDQo+ID4gK0Zyb206IEFsZXggQ29wbGFuIDxhbGV4LmNvcGxh
bkBhcm0uY29tPg0KPiA+ICtEYXRlOiBUdWUsIDI5IFNlcCAyMDIwIDE3OjA5OjA5ICswMTAwDQo+
ID4gK1N1YmplY3Q6IFtQQVRDSF0gYWFyY2g2NDogQWRkIHN1cHBvcnQgZm9yIE5lb3ZlcnNlIE4y
IENQVQ0KPiA+ICsNCj4gPiArVGhpcyBwYXRjaCBiYWNrcG9ydHMgdGhlIEFBcmNoNjQgc3VwcG9y
dCBmb3IgQXJtJ3MgTmVvdmVyc2UgTjIgQ1BVDQo+ID4gdG8NCj4gPiArR0NDIDEwLg0KPiA+ICsN
Cj4gPiArZ2NjL0NoYW5nZUxvZzoNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoCAqIGNvbmZpZy9h
YXJjaDY0L2FhcmNoNjQtY29yZXMuZGVmOiBBZGQgTmVvdmVyc2UgTjIuDQo+ID4gK8KgwqDCoMKg
wqDCoCAqIGNvbmZpZy9hYXJjaDY0L2FhcmNoNjQtdHVuZS5tZDogUmVnZW5lcmF0ZS4NCj4gPiAr
wqDCoMKgwqDCoMKgICogZG9jL2ludm9rZS50ZXhpOiBEb2N1bWVudCBBQXJjaDY0IHN1cHBvcnQg
Zm9yIE5lb3ZlcnNlDQo+ID4gTjIuDQo+ID4gKw0KPiA+ICtVcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0DQo+ID4gW2h0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXRkaWZm
O2g9OTQyOGU5MjY3NDM1YTYyZg0KPiA+IDY3MmUyYmE0MmRmNDY0MzJjMDIxYTljZl0NCj4gPiAr
DQo+ID4gK1NpZ25lZC1vZmYtYnk6IHBnb3dkYSA8cGdvd2RhLmN2ZUBnbWFpbC5jb20+DQo+ID4g
Ky0tLQ0KPiA+ICsgZ2NjL2NvbmZpZy9hYXJjaDY0L2FhcmNoNjQtY29yZXMuZGVmIHwgMyArKysN
Cj4gPiArIGdjYy9jb25maWcvYWFyY2g2NC9hYXJjaDY0LXR1bmUubWTCoMKgIHwgMiArLQ0KPiA+
ICsgZ2NjL2RvYy9pbnZva2UudGV4acKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA0ICsrLS0NCj4gPiArIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiA+ICsNCj4gPiArZGlmZiAtLWdpdCBhL2djYy9jb25maWcvYWFyY2g2NC9hYXJj
aDY0LWNvcmVzLmRlZg0KPiA+IGIvZ2NjL2NvbmZpZy9hYXJjaDY0L2FhcmNoNjQtY29yZXMuZGVm
DQo+ID4gKy0tLSBhL2djYy9jb25maWcvYWFyY2g2NC9hYXJjaDY0LWNvcmVzLmRlZsKgwqDCoMKg
IDIwMjAtMDctMjINCj4gPiAyMzozNToxNy4zMjAzODQyODkgLTA3MDANCj4gPiArKysrIGIvZ2Nj
L2NvbmZpZy9hYXJjaDY0L2FhcmNoNjQtY29yZXMuZGVmwqDCoMKgwqAgMjAyMS0xMi0yMQ0KPiA+
IDAxOjA4OjQ1LjUxODQ3MjM0MiAtMDgwMA0KPiA+ICtAQCAtMTM1LDYgKzEzNSw5IEBAIEFBUkNI
NjRfQ09SRSgiemV1cyIsIHpldXMsIGNvcnRleGE1NywgOF8NCj4gPiArIC8qIFF1YWxjb21tICgn
UScpIGNvcmVzLiAqLw0KPiA+ICsgQUFSQ0g2NF9DT1JFKCJzYXBoaXJhIizCoMKgwqDCoCBzYXBo
aXJhLMKgwqDCoCBzYXBoaXJhLMKgwqDCoCA4XzRBLMKgDQo+ID4gQUFSQ0g2NF9GTF9GT1JfQVJD
SDhfNCB8IEFBUkNINjRfRkxfQ1JZUFRPIHwgQUFSQ0g2NF9GTF9SQ1BDLA0KPiA+IHNhcGhpcmEs
wqDCoCAweDUxLCAweEMwMSwgLTEpDQo+ID4gKw0KPiA+ICsrLyogQXJtdjguNS1BIEFyY2hpdGVj
dHVyZSBQcm9jZXNzb3JzLsKgICovDQo+ID4gKytBQVJDSDY0X0NPUkUoIm5lb3ZlcnNlLW4yIiwg
bmVvdmVyc2VuMiwgY29ydGV4YTU3LCA4XzVBLA0KPiA+IEFBUkNINjRfRkxfRk9SX0FSQ0g4XzUg
fCBBQVJDSDY0X0ZMX0k4TU0gfCBBQVJDSDY0X0ZMX0JGMTYgfA0KPiA+IEFBUkNINjRfRkxfRjE2
IHwgQUFSQ0g2NF9GTF9TVkUgfCBBQVJDSDY0X0ZMX1NWRTIgfA0KPiA+IEFBUkNINjRfRkxfU1ZF
Ml9CSVRQRVJNIHwgQUFSQ0g2NF9GTF9STkcgfCBBQVJDSDY0X0ZMX01FTVRBRywNCj4gPiBuZW92
ZXJzZW4xLCAweDQxLCAweGQ0OSwgLTEpDQo+ID4gKysNCj4gPiArIC8qIEFSTXY4LUEgYmlnLkxJ
VFRMRSBpbXBsZW1lbnRhdGlvbnMuwqAgKi8NCj4gPiArDQo+ID4gKyBBQVJDSDY0X0NPUkUoImNv
cnRleC1hNTcuY29ydGV4LWE1MyIswqAgY29ydGV4YTU3Y29ydGV4YTUzLA0KPiA+IGNvcnRleGE1
MywgOEEswqAgQUFSQ0g2NF9GTF9GT1JfQVJDSDggfCBBQVJDSDY0X0ZMX0NSQywgY29ydGV4YTU3
LA0KPiA+IDB4NDEsIEFBUkNINjRfQklHX0xJVFRMRSAoMHhkMDcsIDB4ZDAzKSwgLTEpDQo+ID4g
K2RpZmYgLS1naXQgYS9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC10dW5lLm1kDQo+ID4gYi9n
Y2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2NC10dW5lLm1kDQo+ID4gKy0tLSBhL2djYy9jb25maWcv
YWFyY2g2NC9hYXJjaDY0LXR1bmUubWTCoMKgwqDCoMKgwqAgMjAyMC0wNy0yMg0KPiA+IDIzOjM1
OjU0LjY4NDc5NTkxMyAtMDcwMA0KPiA+ICsrKysgYi9nY2MvY29uZmlnL2FhcmNoNjQvYWFyY2g2
NC10dW5lLm1kwqDCoMKgwqDCoMKgIDIwMjEtMTItMjENCj4gPiAwMTowOTo1Ni44MjkyNTIwNTAg
LTA4MDANCj4gPiArQEAgLTEsNSArMSw1IEBADQo+ID4gKyA7OyAtKi0gYnVmZmVyLXJlYWQtb25s
eTogdCAtKi0NCj4gPiArIDs7IEdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IGdlbnR1bmUuc2gg
ZnJvbSBhYXJjaDY0LWNvcmVzLmRlZg0KPiA+ICsgKGRlZmluZV9hdHRyICJ0dW5lIg0KPiA+ICst
wqDCoMKgwqDCoA0KPiA+ICJjb3J0ZXhhMzQsY29ydGV4YTM1LGNvcnRleGE1Myxjb3J0ZXhhNTcs
Y29ydGV4YTcyLGNvcnRleGE3Myx0aHVuZGUNCj4gPiByeCx0aHVuZGVyeHQ4OHAxLHRodW5kZXJ4
dDg4LG9jdGVvbnR4LG9jdGVvbnR4dDgxLG9jdGVvbnR4dDgzLHRodW5kDQo+ID4gZXJ4dDgxLHRo
dW5kZXJ4dDgzLGVtYWcseGdlbmUxLGZhbGtvcixxZGYyNHh4LGV4eW5vc20xLHBoZWNkYSx0aHVu
ZA0KPiA+IGVyeDJ0OTlwMSx2dWxjYW4sdGh1bmRlcngydDk5LGNvcnRleGE1NSxjb3J0ZXhhNzUs
Y29ydGV4YTc2LGNvcnRleGENCj4gPiA3NmFlLGNvcnRleGE3Nyxjb3J0ZXhhNjUsY29ydGV4YTY1
YWUsYXJlcyxuZW92ZXJzZW4xLG5lb3ZlcnNlZTEsb2N0DQo+ID4gZW9udHgyLG9jdGVvbnR4MnQ5
OCxvY3Rlb250eDJ0OTYsb2N0ZW9udHgydDkzLG9jdGVvbnR4MmY5NSxvY3Rlb250eA0KPiA+IDJm
OTVuLG9jdGVvbnR4MmY5NW1tLHRzdjExMCx0aHVuZGVyeDN0MTEwLHpldXMsc2FwaGlyYSxjb3J0
ZXhhNTdjb3INCj4gPiB0ZXhhNTMsY29ydGV4YTcyY29ydGV4YTUzLGNvcnRleGE3M2NvcnRleGEz
NSxjb3J0ZXhhNzNjb3J0ZXhhNTMsY29yDQo+ID4gdGV4YTc1Y29ydGV4YTU1LGNvcnRleGE3NmNv
cnRleGE1NSINCj4gPiArK8KgwqDCoMKgwqANCj4gPiAiY29ydGV4YTM0LGNvcnRleGEzNSxjb3J0
ZXhhNTMsY29ydGV4YTU3LGNvcnRleGE3Mixjb3J0ZXhhNzMsdGh1bmRlDQo+ID4gcngsdGh1bmRl
cnh0ODhwMSx0aHVuZGVyeHQ4OCxvY3Rlb250eCxvY3Rlb250eHQ4MSxvY3Rlb250eHQ4Myx0aHVu
ZA0KPiA+IGVyeHQ4MSx0aHVuZGVyeHQ4MyxlbWFnLHhnZW5lMSxmYWxrb3IscWRmMjR4eCxleHlu
b3NtMSxwaGVjZGEsdGh1bmQNCj4gPiBlcngydDk5cDEsdnVsY2FuLHRodW5kZXJ4MnQ5OSxjb3J0
ZXhhNTUsY29ydGV4YTc1LGNvcnRleGE3Nixjb3J0ZXhhDQo+ID4gNzZhZSxjb3J0ZXhhNzcsY29y
dGV4YTY1LGNvcnRleGE2NWFlLGFyZXMsbmVvdmVyc2VuMSxuZW92ZXJzZWUxLG9jdA0KPiA+IGVv
bnR4MixvY3Rlb250eDJ0OTgsb2N0ZW9udHgydDk2LG9jdGVvbnR4MnQ5MyxvY3Rlb250eDJmOTUs
b2N0ZW9udHgNCj4gPiAyZjk1bixvY3Rlb250eDJmOTVtbSx0c3YxMTAsdGh1bmRlcngzdDExMCx6
ZXVzLG5lb3ZlcnNlbjIsc2FwaGlyYSxjDQo+ID4gb3J0ZXhhNTdjb3J0ZXhhNTMsY29ydGV4YTcy
Y29ydGV4YTUzLGNvcnRleGE3M2NvcnRleGEzNSxjb3J0ZXhhNzNjbw0KPiA+IHJ0ZXhhNTMsY29y
dGV4YTc1Y29ydGV4YTU1LGNvcnRleGE3NmNvcnRleGE1NSINCj4gPiArwqDCoMKgwqDCoMKgIChj
b25zdCAoc3ltYm9sX3JlZiAiKChlbnVtIGF0dHJfdHVuZSkgYWFyY2g2NF90dW5lKSIpKSkNCj4g
PiArZGlmZiAtLWdpdCBhL2djYy9kb2MvaW52b2tlLnRleGkgYi9nY2MvZG9jL2ludm9rZS50ZXhp
DQo+ID4gKy0tLSBhL2djYy9kb2MvaW52b2tlLnRleGnCoMKgwqDCoMKgIDIwMjEtMTItMjEgMDA6
NTA6MTguMzQ1NDI2NDQ3IC0wODAwDQo+ID4gKysrKyBiL2djYy9kb2MvaW52b2tlLnRleGnCoMKg
wqDCoMKgIDIwMjEtMTItMjEgMDE6MTE6MTguNTQ3ODUzNjg2IC0wODAwDQo+ID4gK0BAIC0xNzAx
MCw4ICsxNzAxMCw4IEBAIHBlcmZvcm1hbmNlIG9mIHRoZSBjb2RlLsKgIFBlcm1pc3NpYmxlIHZh
DQo+ID4gKyBAc2FtcHtjb3J0ZXgtYTU3fSwgQHNhbXB7Y29ydGV4LWE3Mn0sIEBzYW1we2NvcnRl
eC1hNzN9LA0KPiA+IEBzYW1we2NvcnRleC1hNzV9LA0KPiA+ICsgQHNhbXB7Y29ydGV4LWE3Nn0s
IEBzYW1we2NvcnRleC1hNzZhZX0sIEBzYW1we2NvcnRleC1hNzd9LA0KPiA+ICsgQHNhbXB7Y29y
dGV4LWE2NX0sIEBzYW1we2NvcnRleC1hNjVhZX0sIEBzYW1we2NvcnRleC1hMzR9LA0KPiA+ICst
QHNhbXB7YXJlc30sIEBzYW1we2V4eW5vcy1tMX0sIEBzYW1we2VtYWd9LCBAc2FtcHtmYWxrb3J9
LA0KPiA+ICstQHNhbXB7bmVvdmVyc2UtZTF9LEBzYW1we25lb3ZlcnNlLW4xfSxAc2FtcHtxZGYy
NHh4fSwNCj4gPiBAc2FtcHtzYXBoaXJhfSwNCj4gPiArK0BzYW1we2FyZXN9LCBAc2FtcHtleHlu
b3MtbTF9LCBAc2FtcHtlbWFnfSwgQHNhbXB7ZmFsa29yfSwNCj4gPiBAc2FtcHtuZW92ZXJzZS1l
MX0sDQo+ID4gKytAc2FtcHtuZW92ZXJzZS1uMX0sIEBzYW1we25lb3ZlcnNlLW4yfSwgQHNhbXB7
cWRmMjR4eH0sDQo+ID4gQHNhbXB7c2FwaGlyYX0sDQo+ID4gKyBAc2FtcHtwaGVjZGF9LCBAc2Ft
cHt4Z2VuZTF9LCBAc2FtcHt2dWxjYW59LCBAc2FtcHtvY3Rlb250eH0sDQo+ID4gKyBAc2FtcHtv
Y3Rlb250eDgxfSzCoCBAc2FtcHtvY3Rlb250eDgzfSwNCj4gPiArIEBzYW1we29jdGVvbnR4Mn0s
IEBzYW1we29jdGVvbnR4MnQ5OH0sIEBzYW1we29jdGVvbnR4MnQ5Nn0NCj4gPiAtLQ0KPiA+IDIu
MzEuMQ0KPiA+IA0KDQo=

