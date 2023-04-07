Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB01FC77B6C
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 01:46:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.175333.1680831970526219391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 18:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=lERHDDQ1;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680831970; x=1712367970;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NbJtTkC+VGiQpkfr2TXxYEQZTB59/XwOhWcprw1ZrYU=;
  b=lERHDDQ1baj17xGoG9+xfKCfnuwujEKarvbhwCLqQFFTZUi5OhXD0Uu4
   2pzSuiU33WUegQTBBVCljkLvUMVIGA5n9nOW6tLwtkz2lnHOHIa1nTZl2
   ImYXLzPl5uQb0A9tbanqdcw0T2FUuNfCiW6ayz4/eNvxv1l+aefnka6n9
   q+fjenGCXUzJKm2Qu+9fRkNGu4Q1Xf3mtERkWJhoQglWsPzeqHoNtRb76
   tl39CsXfCz7p1fWY0YBiB9S8wO/UZp63jyVlBenXbjG+twzvnLHB1EJ/W
   Y8iTkdiNRoMWZRTjcFtOFsh/dvaFGZRK6y6s9yz3KWcCEFeAVxq9k6FnS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429181277"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="429181277"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751867744"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="751867744"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 18:46:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 18:46:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 18:45:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 18:45:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 18:45:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz7MmOojdPKQbi3LSU5m6VU/N76/Vpq/fyfw3VVi+0z8sIH4/LDD7v1O1P8/6EmRaJ/5qYt2zMLN80KDmVpcta3Ofux460Wr99WGX21OfKL3YFvp0mklMuAFS9M+pMwHk0o4f4q76jEEZ82Ut3u/yw3c4P/aiqeEz+FN1RN5T6eXytOYxYGC9cK3SCwObFhUweF+dgoT7dwBPpZAisakNJVsjJzioCBGlgt2BWR0kf1O3LKj9WdGZ1KZar2Lq3uvSQMjdiyKLAIns7DBvAvvGb3jZDdVNQnc7L9eXbyEVUrDTBuP+WJq0eK84JjMIkXxm7WkXeAHPMuQnbVU/rkLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbJtTkC+VGiQpkfr2TXxYEQZTB59/XwOhWcprw1ZrYU=;
 b=SKjyY+d3h5xyOyO2or0hec2+SuDe6B5qD1dXbuXNISFk52tP3VbNrS2dEJyePKEZCAmuPaYal0AU1/cpnN9W5qVCVI/1VjtkObImg1gIt7rqRLTw6+XiSOf0UkGSxGqSwERu7iD2K1Z6Eo4ZimQjhITh8l1vklkAOChsAsgTQHZwAXb1qr7oReQbixVG/nrrUMELTp7j+UywZK16gGi4NHWdUyk/ee+a24EaFssx6k+ljbVlbXWvBaQLH3aat6CKG74nY/pXp2X4IzFxbwKDSC7pOdxknY3h7Q/NYGd18A4t8DlvwWI+ikX0Jn+KEB+tfil+eC+9GXZsGIfy7KTKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.31; Fri, 7 Apr 2023 01:45:45 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67%5]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 01:45:45 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [OE-core] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.rc1)
Thread-Topic: [OE-core] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.rc1)
Thread-Index: AQHZaF1srQJDKyqaP0ialoLSGc/Sy68d/ILwgAAw1gCAAObLYA==
Date: Fri, 7 Apr 2023 01:45:45 +0000
Message-ID: <BY5PR11MB4152A24253030353ECFA45E7A1969@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <3f837f0f6dc5a6670ebb2d3a6e074fa614c387c3.camel@linuxfoundation.org>
	 <BN6PR11MB414551F130849522F32006C5A1919@BN6PR11MB4145.namprd11.prod.outlook.com>
 <b87018c33df6153d6ac0b13e5de8c93f9294be6d.camel@linuxfoundation.org>
In-Reply-To: <b87018c33df6153d6ac0b13e5de8c93f9294be6d.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DS7PR11MB6126:EE_
x-ms-office365-filtering-correlation-id: 7e8f0b4e-c09a-4a3f-821c-08db3709ce0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sJJX4DoshOS7RMZ1wl1RxTrkDdlXI1fNXJiYHdRZthMm67K+Mq5ygG/GgnM/pXSplGspELo/22wAAsLlsfNNHwAAvHrIvUj8dsnGcKLLtYr8tG73e/Pc45VqNepuDibwqwvG3cIoikwNmTox9U0EKWNmtQMn7ce/DVpzfCLDmut9PJt9Hw2lkblF/3ulAqc6S32nYFjMqrwkTqyhqKXZpqc9IHVocyNuCHU+vCC4JqGeXmkcVzkpvYGDak1Mn8rgQpVP/GgCMGgJ97KKMmkDLg5OXViXBvn/bptLJB7fp3rLn8nXHr5VwnXTFhY8feRgrlnt3ikqw2YJLKru54swP/TgK67olh8kmdEpp8Vgs+oKMQifiRQjM0/CoRunNkUEapukJ5Hy7+f4fDyVf3+5wL5S9Rfc9jYh2/4Ke12zfmuaIM2UGliaMr+2seVq1hdpSHEveW+RLAj6dRElpbF01cCsrNzSIr9uEHPM0qlGK+3sMWdgdCA15dz0UOzrIIy9p7tR7NMtLOB6rhpL1x1UXf2KmYzp6n2B+XZexM+2J6w2T/WFKP1rQegkedWTfgSPESp8sP65Gfbb+M0uLOxxFMrUKLWfSVCemrwgzJ+jNtXNzcPzJ+8T05IE/1oVKAyv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(8936002)(55016003)(66476007)(66946007)(64756008)(66446008)(66556008)(8676002)(76116006)(316002)(110136005)(478600001)(52536014)(41300700001)(38100700002)(82960400001)(5660300002)(122000001)(53546011)(186003)(83380400001)(7696005)(9686003)(71200400001)(26005)(966005)(6506007)(86362001)(38070700005)(33656002)(15650500001)(2906002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlpWSTRadVhCZ1N4d3NxWHZwTjhURUV2aVNvL1FNaVNGRDNiY1ozK0Q5UkMz?=
 =?utf-8?B?YVJJSlhaMHY4a0RPTGxpNVpLcmlCbEZOajFIbDFlS1VVNk9FWm1zcjdIaXRQ?=
 =?utf-8?B?QUxMZkdscnpTbW9FbWh6NWNJaW1mTjdTcDdEbllIZ09UWGFoM205ZEtKZEpI?=
 =?utf-8?B?YmEwZlF3ZUZ5SGM0VGNGVmRiQzZBbFNsRnl5Z3V6Qy83SnhiZnJQc1lZeGwy?=
 =?utf-8?B?V1NWT1VZSUQxSm5GV3V1ZHdWREIyQ0s2TWJRWWM1T3JDZExtanVoVmo4dCtJ?=
 =?utf-8?B?QmNiWGxsODNwT0RJcGswc1dqcVdQT21Ec21KYXlBNzFXWTlIK1RJc3M1Z1pQ?=
 =?utf-8?B?VTZSWjRrY0psMnhWWC9QMnR0cmh4eXhrT0Q2WERWVElBN3RqOGJ0WkwyQkUw?=
 =?utf-8?B?aCtmNVNNVjZ1dHoyMkdzc09PaHRaa1NwWmZTVHg5WEpPektOaHg5OWhkTXht?=
 =?utf-8?B?V3p4dGZvaFl4dG82RDBWSEhxTUpGaW42eFdEQmpoM1NTTzIwazJjOUVTYjl2?=
 =?utf-8?B?MGVmNFlTOVpEWmxSclNTaUxqd29jemdtb3l1WnB0bUlGRVVndDRraE5GVDd5?=
 =?utf-8?B?MXhkYVFuOGtUd0paK1UwT3Q1aUlybU9uMXM3a2E1K0Y3ZGEwVDVwYlZqdm16?=
 =?utf-8?B?WkdFc0NQK1BxUXZDWG14T3FKV0gweUErczl3eWtYMUhvdVRZVEM3QXhwQy9D?=
 =?utf-8?B?M01FQ0xMblVCUUxtb0pIWmNuUDVKZVdGMWlISzB0MDJzWHlld0FQMlhFUk51?=
 =?utf-8?B?QTJPSHdENGdtZTdqdFVrTUQ1bndUVFFPeTY5QTlRVE9QR0c3TXEyMVhaVzVP?=
 =?utf-8?B?VDU5VTE4K3QxR1Y3TXJDaXh2MzlFSFNpVk04c1ViTDRxQWpkSzBaeGJtWUI3?=
 =?utf-8?B?UW9tNWVFWkZ4NmNxVkpxQVpkUk5QSUp4YmV5NTlzVGpEbGkvUkN6c1F1MW5z?=
 =?utf-8?B?RHdVanFTVThoMHZUNHZ5QlNlU1NmYW1Icis3bk02cDJBOGlwaGRuWmcxRlhp?=
 =?utf-8?B?ZHY1OEUwS3hVQTNsWDFWOGh5UDJNVk1QdzJJUG1JaGw0VFhGTHplUEdyMlhG?=
 =?utf-8?B?VFhyRG9SYlhvZnp6WmthNDQ3ay9zY1dTOFZET1ZmQ04rWmxqaHFBaTBLdzJa?=
 =?utf-8?B?U0JhVWNOREJrQ2xPY0FUeTk0S0doeHBFZUVXa1hxV0VyamlxeWNRTHh3OGZp?=
 =?utf-8?B?aWFGMlJ6YkNnZlRwUW5yOFpxVjNKNTFQRlJxRFVoOFN4dm5VcnhDOU9mT0k1?=
 =?utf-8?B?VUZ6NEdYYTBBNnRPVkxlUTg0L2FNWG1RaU9ud1pNU3BOT0JTdDBUMDcwazh6?=
 =?utf-8?B?a1VTQkhLZ2xsQi9NL1k5ZllJdk55MkkwelVOL1ZRYm5xbkJOWlNlY2NZWTJE?=
 =?utf-8?B?bHc2TXN2YkJRNTlIZlRZWmJmV0hucEdXTmNDTDcvR3BFWmtySGhnVkN6d3Rr?=
 =?utf-8?B?cHVGbEZYeDJZeThEZ3ZOKzdlMjZjYzcrSG5MVHExcjlzaVRLZ1BkYXdhSHI1?=
 =?utf-8?B?OG45TElxckxFL2ZtMERIVUxNTVB3NXVCWjUwV2toclA4R0NrSjc3YUNDc2dW?=
 =?utf-8?B?RHdWaHBxOGx0eFo4MkhtYm91UnRjRWVrV0RuVVpNUENzNjVGYjFCdTk2d013?=
 =?utf-8?B?cjh2ZEFwRHlZSzNlYUpvNEZiYWZua3kwa0R1WU8zMHZrMjhuUzhQbHkreE4v?=
 =?utf-8?B?eUVrTXdLRXdHTWoveXRIeUliNjFOcjdsNEtSRm5FejZ5aC9QZUlVRjk5eTNI?=
 =?utf-8?B?dlVTRFpZTmNUVEZ5b0pxaFBiZmx0QnhEL3NLWVNURFpxOUxhUDI4STBoL2FN?=
 =?utf-8?B?cmtoTW9GaW5ubDUrUDJVMjVCb0YycldlcVlZTm4xeHFVWUxvcmd6QmdWb1dH?=
 =?utf-8?B?aDArMFN6cU1ZYncrZERmeGJZLzdmOFl5MmdjeGRiSmdTN01mNWFBL0tNTVNE?=
 =?utf-8?B?TTQ1UzUrVGJhbk1iQnpXSG5JaC9qZTQ4TDg2eGo5YkhiRjFpYVVqRXpWbTJZ?=
 =?utf-8?B?bmNCL1ZaZUg0bHBObVF3U1VXUFRPMWpYK202Ky9oT0Y4M1Axc21DWHJDMHp3?=
 =?utf-8?B?MndCc2xYc2RjRU9YTitBSEtuWC9TSWdXUGRwTG5VbERqREt4MHExU01hczFY?=
 =?utf-8?Q?gnja1YYzR+tphVfP3aPIkGn19?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8f0b4e-c09a-4a3f-821c-08db3709ce0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 01:45:45.3980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNLSNFs0pjm4JeNifmytwSvEM4ZWVLT4OMqvS7gmNLbTkmzEVTYpGNFCrGF5C11kPA6xbJs3EwvofXqr69dxuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 01:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179808

SGkgUmljaGFyZCwgDQoNCg0KTm90ZWQuIFdlIHdpbGwgcHJvY2VlZCB0byB0ZXN0IHRoZSByYzIg
YnVpbGQuIA0KDQoNCkJlc3QgcmVnYXJkcywNCkppbmcgSHVpDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJl
aGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgNiwgMjAyMyA3
OjU4IFBNDQo+IFRvOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
ZzsNCj4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3By
b2plY3Qub3JnPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsg
UG9reWJ1aWxkIFVzZXINCj4gPHBva3lidWlsZEB5b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBm
b3IgY29tcGxldGVkDQo+IGF1dG9idWlsZGVyIGJ1aWxkICh5b2N0by00LjIucmMxKQ0KPiANCj4g
SGkgSmluZyBIdWksDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzIGFuIGlzc3VlIHRoYXQg
aGFzIGNvbWUgdXAgcmVnYXJkaW5nIHRoZSByZWNlbnQgY3JhdGUNCj4gZmV0Y2hlciBjaGFuZ2Vz
LiBUaGlzIG1lYW5zIHdlJ3JlIGdvaW5nIHRvIG5lZWQgdG8gbW92ZSB0byBhbiByYzIgYnVpbGQg
c28NCj4gd2Ugc2hvdWxkIHByb2JhYmx5IHN0b3AgdGVzdGluZyByYzEuDQo+IA0KPiBJJ2xsIGhv
cGVmdWxseSBoYXZlIHRoYXQgcmVhZHkgc29vbi4gU29ycnkgYWJvdXQgdGhlIGNodXJuLg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQo+IE9uIFRodSwgMjAyMy0wNC0wNiBh
dCAwOTowNiArMDAwMCwgSmluZyBIdWkgVGhhbSB3cm90ZToNCj4gPiBIaSBhbGwsDQo+ID4NCj4g
PiBJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlvbiBmb3IgWVAg
YnVpbGQgeW9jdG8tNC4yLnJjMS4NCj4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1dGUgZm9sbG93
aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KPiA+DQo+ID4gT0VRQS1tYW51YWwgdGVzdHMgZm9y
IGZvbGxvd2luZyBtb2R1bGU6DQo+ID4gMS4gT0UtQ29yZQ0KPiA+IDIuIEJTUC1odw0KPiA+DQo+
ID4gUnVudGltZSBhdXRvIHRlc3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQo+ID4gMS4gTWlu
bm93VHVyYm90IDMyLWJpdA0KPiA+IDIuIE5VQyA3DQo+ID4gMy4gQURMDQo+ID4gNC4gVEdMIE5V
QyAxMQ0KPiA+IDUuIEVkZ2Vyb3V0ZXINCj4gPiA2LiBCZWFnbGVib25lDQo+ID4NCj4gPiBFVEEg
Zm9yIGNvbXBsZXRpb24gbmV4dCBUdWVzZGF5LCBBcHJpbCAxMS4NCj4gPg0KPiA+IEJlc3QgcmVn
YXJkcywNCj4gPiBKaW5nIEh1aQ0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxxYS1idWlsZC0NCj4gPiA+IG5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3By
b2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gPiA+IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCA2LCAyMDIzIDM6NTcgUE0NCj4gPiA+IFRvOiA8eW9jdG9AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+ID4gPiBDYzogcWEt
YnVpbGQtbm90aWZpY2F0aW9uDQo+ID4gPiA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmc+DQo+ID4gPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBR
QSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZA0KPiA+ID4gYXV0b2J1aWxkZXIgYnVpbGQgKHlv
Y3RvLTQuMi5yYzEpDQo+ID4gPg0KPiA+ID4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8t
NC4yLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUNCj4gPiA+IGF1dG9idWlsZGVyIGFuZCBpcyBh
dmFpbGFibGUgYXQ6DQo+ID4gPg0KPiA+ID4NCj4gPiA+ICAgICBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by00LjIucmMxDQo+ID4gPg0KPiA+ID4NCj4gPiA+
IEJ1aWxkIGhhc2ggaW5mb3JtYXRpb246DQo+ID4gPg0KPiA+ID4gYml0YmFrZTogNDZlMWVhMmU5
YTIwMzk5MmJiNGRlNDhlYTIxYThlNzM2NDE5YWRhMg0KPiA+ID4gbWV0YS1hZ2w6IDA5MTM1MTY0
YTIxYTIxNmM2ZTNlNzVkN2RlY2NlODk2YjkyOTYyZjANCj4gPiA+IG1ldGEtYXJtOiAzYjRhYjQz
ZDJmODJiOWRiNjgyYTg4ZGZmNDY2NTgwN2I2MmQxODcwDQo+ID4gPiBtZXRhLWF3czogZDI0M2Zj
MWFkNDVkZGU1N2I0Y2FhMTgyYTkyYjY4NTU0MDQ3NWNiMg0KPiA+ID4gbWV0YS1pbnRlbDogZWMz
MTQ3YWJkZDA3MjdmZWRjNzA3MzMwZDU4NTkzMDk3MzU3Zjk0NA0KPiA+ID4gbWV0YS1taW5ndzog
MjUwNjE3ZmZhNTI0YzA4MmI4NDg0ODczNTliOWQwNDU3MDNkNTljMg0KPiA+ID4gbWV0YS1vcGVu
ZW1iZWRkZWQ6IDYwYWZhNTc3ZTU2NTZhN2M4MmM5MDJkYTExYWRjMDMxZDcxZWY4ZGINCj4gPiA+
IG1ldGEtdmlydHVhbGl6YXRpb246IDQ4YzA3YTQ4YTBlN2Q1NjI2NmYyMGEwMWJiMGM4ZWJjMTA4
NTQ1M2INCj4gPiA+IG9lY29yZTogNWE5Njg0N2U3ZWYyZmY3Mjk1OGQ3MzlhOTFjOTBlMjA4NWMw
NGJjNg0KPiA+ID4gcG9reTogMDhkNTY0YmQ5MmZjNDc2ZDdmMGI0YTYyMDFiNzUyZTUxY2Y5Mzc3
Ng0KPiA+ID4NCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20g
dGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gPiA+IEdpdDogZ2l0Oi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+ID4gPiBFbWFpbDogcmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZw0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+
DQo+ID4gPg0KPiA+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KDQo=

