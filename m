Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2767FC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 06:33:27 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.32921.1634538805860894437
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 23:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=av+HyJMh;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="291651013"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200";
   d="scan'208";a="291651013"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 23:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200";
   d="scan'208";a="530146619"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2021 23:33:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 23:33:23 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 23:33:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 17 Oct 2021 23:33:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 17 Oct 2021 23:33:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmeBGkz52QpkXVeVf50XHOU5lq1urm0XUr98PfFv4VxJYX07dM5YMeOxkYrqWVA9eZf4DZBKjemCBWeFI/xaRMPlCIr+elDmmJ7Dtd0C4S3Dm1Fq2jCkYpcCa4uozsbeE7WrTr4ak6exqGm3h6bFJrBA8AroJM0/GeEJZjF6tfMCn6GXbPd8LosE7wMVQ7Oq7cdcLMqN0lkMbdaR5Vy3smuPIylsxZN9R2PRbXw6Um5p5wnx2sGIL11m3w2xVJGBWng2xuSSCAr/kLWBjLLdmyrE1oX/sC2E8PSOHQKtDqODQksdozvmAX0BTsM8NpV4b3bbVC6NXfTIHiBXsTXT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC9WLhdX5n6dyH2++q0mTuKj7/CvLZ57vvOKxxMVshk=;
 b=gcPkZ5Nq4kYp8CFgLUpb39A1DB50lT289El6aFcm9aLpbTQyw73UniJx4zu/qKcClbJJomQjqjA/hO/Ut+zYY1RZxnocmxQqVo+x7vYNH1t+bQvMYL10y2TQPnruHEzpNu8r36EK1FHv+rK/Di3Ib1Iav67GQjpI2RBwL/9LkcYf/L2/cvuROQXy+Gd39x1NrbUWnzd62WCvZIZ+Jh3Ti0gIjZHdJ6fpDPZ09wbvA0E8Kj+v3QREaUNPjuZrbcvn/oF2eQXAUzcuHD5D5OhvQdEoK712PAbs0r36bzTaLD3cr6m2cs7h9gqcTJ+cfDeU2ZeV0OXYfKnO0oJAjkzRCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WC9WLhdX5n6dyH2++q0mTuKj7/CvLZ57vvOKxxMVshk=;
 b=av+HyJMhRX1ii2ElzUII1yNbtRd+cK/t+h4Rum/EUSarEy4u5LkejdVS+ogLNjbYoyZQj/5kGE5FjF9sDS5shVs0ZO2moq6vU6m1lXGNWnvzZJ1EHpuzsaAvJ137vXSG0ngUf6IShsbKb9WVUVQq5ASPAvwN/j414E05qSSo2xg=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN8PR11MB3571.namprd11.prod.outlook.com (2603:10b6:408:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 06:33:21 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::60bc:7c4f:4a45:d39a%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 06:33:21 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4.rc1)
Thread-Index: AQHXvsToIAiAE08XGEa0NbZmYdXFBKvYViuw
Date: Mon, 18 Oct 2021 06:33:21 +0000
Message-ID: 
 <BN9PR11MB53724C8C3BF8C79A548EF5D4BBBC9@BN9PR11MB5372.namprd11.prod.outlook.com>
References: 
 <4a91fd213b93c091a72f70e76ad1d3d6bc085a0c.camel@linuxfoundation.org>
In-Reply-To: 
 <4a91fd213b93c091a72f70e76ad1d3d6bc085a0c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e32aeb26-2960-4fbb-c3b2-08d992012e43
x-ms-traffictypediagnostic: BN8PR11MB3571:
x-microsoft-antispam-prvs: 
 <BN8PR11MB35712EE023C12DD66448E676BBBC9@BN8PR11MB3571.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TOjgLc/IPaFTb9AzXlQ+96/lDU7ilCbw/VZmbJN9+TUWmkTFpxqsAB9zmm9KaF/Oc6q9I5sr+IGepkdZM5ti/7z+IP2i4ShIESLSGRFt5Q6m3RQc2lY0xi4Dhe672x43QrKbYud66FhdvRTjxSkaRJdwHcIr86f6Ye2n82dTj4xC/nxjAhZ1zLnEzIKV8MeKgsWjkq/Pw+yQW0SQYqHB6tsZ1uV+5Slo+cyOsUP/vaE7IkXDGDau1Gl55cpHjKJR2kFHyUycrupQr7FW1cmq8DFYnzFcZA2bFVa/e3RdZMOnkK/bvYKItK9pS5+WRcNwN9dtBCqIltYp4R8RZ4BTNyT17q8wGOhXAiHKsqZxXcVpCKZrYG0NnC7aATT4yowjMD/BsQu+/OaaD2roMyccYAz26GkHP8CPDjxms+Ms+Tzqz6qivx75cu/BrDU0txIkixFUNpGTxIil50GiU9yud/dHbnYJOwpM5UgHeuRFjehr6PqpyMyph4EvJX5r6Gq7alqWE8RvEo2BYn99xu0TvysGgwCHt7qn71VaNWw2oyTd9IE+SSOtfM+L93XYJ9mt8fdr8jj0b4IPDGiqG/gphAXzRX6kyw8bF4hE+M9C4KagWdIRso7tiZl7E9XqYaizyoYNyxc9cAPAXI4HUmixvt9xWmY3rTtxBhPnWg3entO/OVZMx+Tk9B3xsJA3MebYvSskywSJglvD++zOprP/cL6n8Or7a1K5kGTKT417aMLUOYMkmCVWj6zyL9EoBQrpBoQgwMCvljqhruSGzK7ytgMdGm4Oz0jPTGr/bGj4wyyHia6daKydoZBGhbC6Ps/WqiwqqJO0j82I2r01+0sxXA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(53546011)(122000001)(66946007)(33656002)(38100700002)(66556008)(186003)(6506007)(508600001)(15650500001)(316002)(26005)(86362001)(5660300002)(110136005)(55016002)(7696005)(71200400001)(38070700005)(9686003)(966005)(82960400001)(83380400001)(8936002)(52536014)(64756008)(8676002)(66476007)(76116006)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UERIWktrYUxTSHZLeFJyK20xVUtMUUdjWk51UFpPcTU0YWRMZWZ0bTlSaFU5?=
 =?utf-8?B?OEtFdzlYRDJOT2l4ZW5KYTRWaEdqZnF3YURKUFBZZWJjcE10dmYrYmUwSjJs?=
 =?utf-8?B?TUdXQWFZcllpZzZPZ3hFWXV0b0xoVTJxbkxpZHBsS2NiUFQrZE1xbzVjam5I?=
 =?utf-8?B?RUl4YnVKSCtCU2ZHcVRneEsxbzZWaEUydmprcWpJWnM2dDZRQmxGWW1Ea1Vr?=
 =?utf-8?B?SnAzQ3BYTmlhOVAyTWNMQXZVNmdaZmRqdGZGQXU0b1BUU1NOS3RmempJck1i?=
 =?utf-8?B?RmUycDI2YkpvRXNlemgwVWlpUHdHeXpNekx4Nzc0RmlKSDNBTlRRTlNDaXF2?=
 =?utf-8?B?RWRpa2xCSFovbDU3VFM0KzJYNGJ3R29UYWVoY0hWSytyekoxZUZWS05Idzhi?=
 =?utf-8?B?NUdHZk5RYTRvdGZnREtEbklHSkV5aUJQSzFWWkFLaDF2YjBmMjlkc1JUMldQ?=
 =?utf-8?B?dDVUYVRMN2dNdG4rckNIQXZ1YU1HUE1MbDM5L1ZMVXdMYWZuL3JQZFpmN09v?=
 =?utf-8?B?MC8vWEhQQlBoVzNVOTZFQS9JN2krYTRlOW9tcnh6T3VTRmVRNG5ubXZWSzFk?=
 =?utf-8?B?TnV6SmlMczhna2gxaEtocUMvb3V6UDNlYld4QkU1RjRycTJtdGxTRHJwRncv?=
 =?utf-8?B?OTl3VVlFS3pRZDJDSlpVdHBJTU5qZWZ2RUZGU3NZWVI0Y0FweEFDVVZDdGlE?=
 =?utf-8?B?UmxyQ2R0dlVlR1FzTG9VdHFPeFRvdjdDQ2lPOFFLMFRaR21ZckVWZEcrTWVl?=
 =?utf-8?B?WnJISkhSYTZJcjhaNnEwN1dackdaQXhyUDdxTzhudXdtM0JIYUhOVTRNSzNr?=
 =?utf-8?B?VFM4Z2U5ZEFNUC9QNSszVDFoZTZBOXlGUEtJRC90T1JXNUxlWjdSRkIzaVBz?=
 =?utf-8?B?OTVlMW0xZ1J3OGRIaDZ5R25GcmJhdTYvb0RreXpKR0U4dnJ6MDZLdFVtamxF?=
 =?utf-8?B?Ny9tN2tCTmY2WGdqajlKOE43REYvc1BXS2Z6UDBUZEdqNGEyUUJFdVJpQmUr?=
 =?utf-8?B?VWVraVZFVHRDNWJiMkd3cThMMEYxL0k5bGRwdWdkYm1XdGhwVW02dVl3MkJU?=
 =?utf-8?B?Z1BzamZYdXJjaWpmOFJ0eXlkRUR6UVlJcVZUcEdUZ1VhM2w1Z2crT2IrbXhp?=
 =?utf-8?B?cTFGQlRnT1ZPMllDNUcxWXZQZnM1d1d4bmJhQWFuWU9zajMraUZiMy9BY2ht?=
 =?utf-8?B?eE1PeDEwSmhSSXo4Q0pUVk5BckVDR3hnM1BqTTl5MXpNM2IraVBZMzdOWldy?=
 =?utf-8?B?RzFnUDdZVmp5TU9aOXVOTXJOWTRRVGgwUjNXaittSEp4bDY0bE5vMEl3eEwx?=
 =?utf-8?B?MytmRFRQYldKTlJZT2xIK2lUUUdWem9pUS9zbXh3czY4bTJwUzdSSnF4T3Y4?=
 =?utf-8?B?SktvRnZCTWtBRGxQTWJZY3hocUZxSG42N0t4d25VK3FHTXpNL3diN2hFaGZI?=
 =?utf-8?B?MFRpNmFvZytlWEF3cWR4M3YrelJVUnNyYW1PMFRBM3lkbTM2UjkrWHQrS2Nv?=
 =?utf-8?B?NERYTlFyN0twWHlEdmNMVG5pTXVpMGtGTERmMkhpSXM5TXVFSG43Rm5BK0h3?=
 =?utf-8?B?KzVUektra1pDZFpqYXRYTHdkdUtKdWxXUFkzQ1V2c2FXR1VjdlFQUGlPNzQy?=
 =?utf-8?B?UTZYb3dyUkU1UlNHTnhKNHFJQy9lYXFtVkhJTXFyVnMzSFFEVlFFRC83cGJF?=
 =?utf-8?B?SkRVSUxidDZUNFpWVUhKRmxrVHdmMkF1RkliUDFnb1ZCaTFxU3ZqbTNZNnNi?=
 =?utf-8?Q?oBImMvSJWeHqNuWzRjKRtBfPH+q8VHPYxdVkZZ1?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e32aeb26-2960-4fbb-c3b2-08d992012e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 06:33:21.8112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 TD/RWTUGUOT424qv7q6qcwMRtb+SLxyPUcnE66ydxks/G1aa+rwMYVIK+ZELRIak1v0yWF2GyqZcjE7h2MpXmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3571
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 06:33:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157048

SGkgQWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy40LnJjMTogIA0K
aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3RyZXN1
bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09IFN1
bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQoNCk5vIG5ldyBpc3N1
ZSBmb3VuZC4NCg0KDQpUaGFua3MsDQpKYXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8
cWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhh
bGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogVHVlc2RheSwgMTIgT2N0b2JlciwgMjAyMSAx
OjI1IEFNDQo+IFRvOiB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IENjOiBxYS1idWls
ZC1ub3RpZmljYXRpb24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPg0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24g
Zm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZA0KPiAoeW9jdG8tMy40LnJjMSkNCj4gDQo+
IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTMuNC5yYzEpIHdhcyBjb21wbGV0ZWQgb24g
dGhlIGF1dG9idWlsZGVyIGFuZCBpcw0KPiBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4gICAgIGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuNC5yYzENCj4g
DQo+IA0KPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogYzc4ZWJhYzcx
ZWM5NzZmZGYyN2VhMjQ3NjcwNTc4ODI4NzBmNWM2MA0KPiBtZXRhLWFnbDogMjI4ZWNjMWRlYzM5
MDEzOGM0NDI5OWQxYzI0NGFjZGE5YWQ3NWNlMQ0KPiBtZXRhLWFybTogOTgxOTNmM2I2MTY3ZTA3
Y2JiNzk0ZTk2YjgwZDc4Y2ExNzc5ZWE0Zg0KPiBtZXRhLWF3czogMjdiY2E4MWM0ZDNmMDEzOGZk
YTU4M2Y5ZWE5OGRmNjE1MjMzMjMzMw0KPiBtZXRhLWdwbHYyOiBmMDRlNDM2OWJmOWRkMzM4NTE2
NTI4MWI5ZmEyZWQxMDQzYjBlNDAwDQo+IG1ldGEtaW50ZWw6IDkwMTcwY2Y4NWZlMzViNGU4ZGMw
MGVlZTUwMDUzYzAyMDUyNzZiNjMNCj4gbWV0YS1taW5ndzogZjVkNzYxY2JkNWM5NTdlNDQwNWM1
ZDQwYjBjMjM2ZDI2M2M5MTZhOA0KPiBtZXRhLW9wZW5lbWJlZGRlZDogZjIxNTJkNzkwNDM2MDFl
YWNiNzBkYTFhM2FiMzZmNWFjNTZmM2UyOA0KPiBvZWNvcmU6IGJiMWRlYTY4MDZmMDg0MzY0YjYw
MTdkYjI1NjdmNDM4ZTgwNWFlZjANCj4gcG9reTogZjZkMTEyNmZmZjIxMzQ2MGRjNjk1NGE1ZDVm
YzE2ODYwNmQ3NmI2Ng0KPiANCj4gDQo+IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdl
IGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9j
dG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM2Nik6IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb24vbWVzc2FnZS82Ng0KPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC84NjI0MjgyMi80
ODk5NDYzDQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9sZWF2ZS8xMDQwNjgwNS80ODk5NDYz
LzcxNTM4OTk5NS94eXp6eQ0KPiBbamF5LnNoZW4udGVvaEBpbnRlbC5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

