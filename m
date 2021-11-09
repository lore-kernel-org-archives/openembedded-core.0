Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D10C43217
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:36:29 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.12876.1636468588980328864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=ONZWNYbb;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293285361"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="293285361"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="503524440"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2021 06:36:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 06:36:27 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 06:36:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 06:36:26 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 9 Nov 2021 06:36:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPxu3ZF/vU/jvWR43CeRpxzydMO97W+vIr8rlEiKZLe3/MTm/Ml/V1fXyewFUrRln0VvmXoRU+24CGcgjozXfQ7iURodwUZoNK47a1qWUPzqIG31P+OZRnhXS4DkfAMN89y+UJduB9W5PLm5tB1nsWdiFuaH5+v0qVjXSZ946r/h39h4NNBRt54g6P0dvx5aE6P5OqW+gqP4YPGZeY1Og92v9VlMnfsMMXuRXp/X+PT7vv+Vt3B96OYTc/KvnDvanhcszKL5QZslkxJ5fgidSpAXT0s36V4WSeaM0NVdqp0zMl8hQ0pBfQ7M7GHtgyU2P2SQzalnWHqsPsvQmJMOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVWWRWe9VJsgxE5jlCt5gvEyQyDT/2cdYqyqYCZzGBU=;
 b=a1WYy9hwM2NivSp+cR78BNXonNeiT5VipSYBxgZpp0x+alhMwvliPyTY/68zYFpIapVWJUF6wTsKJiaYAz70XcARGghHRiWH0cPCtNeS4keFf2KR9TbmclOxfUV7SRG3vH1nBWwA6njnS9MbZkj6pzq5co8SAr0U6AyFR9sfi+7kl/obnpwqjT/t5kAtsYlcXqhDAc0ioNDoKtYwp8Ew9KaXDd0vl7Pax67vd7piVgUQvmnlLIugwPJY40nIKfUWtAcw10KKvVH5NCm5MTS1c2aiES0ovrEelVNyXigb3Tn1jh/CkqbrxuqKYQdKQa3oj+dIkCNby2ISF7UKwqrcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVWWRWe9VJsgxE5jlCt5gvEyQyDT/2cdYqyqYCZzGBU=;
 b=ONZWNYbbHUCh2TkXqdnVa02sulxbSz0ztE2Isrf/Tu6ZU6QWeLgIE9iO/o6gF7mMJeKAdUIR6h8slb9PDAh5GJwyh6E0rV9aq53gT+dQqSVNgNbrSaPOvkwmFWF+QGogjOiXHjgcx1ESI6pxa1srIg7UK0eM4cwJBMm+Q9x5EfU=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 14:36:23 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 14:36:23 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
 directories that are expected to be empty
Thread-Topic: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
 directories that are expected to be empty
Thread-Index: AQHX1MXXPdu1Ad1JoU6Ewruq/uhJcqv7RMeA
Date: Tue, 9 Nov 2021 14:36:22 +0000
Message-ID: <a5024677e6141ec6c93bda07a2d77c6b0a9a5110.camel@intel.com>
References: <20211108171057.23971-1-pkj@axis.com>
In-Reply-To: <20211108171057.23971-1-pkj@axis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfeabeb1-356c-44bf-5dc5-08d9a38e4d9a
x-ms-traffictypediagnostic: BY5PR11MB4008:
x-microsoft-antispam-prvs: 
 <BY5PR11MB4008CE85BCB6AA364AE65F3FF8929@BY5PR11MB4008.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J4SX0IZunY6tbn98yMO3vB7j2ideANRZbJBnyg7EeGx0GVO/ZZSBF0AVS0gql6S12lXNIigN9wfhCKO52QbP0lO2qi0i1UntHUhR7hdZy2MnjedwCWFvrXO9H35xRsFV5uNVV3kYh3YrLcsC5rF+bNv+9Y+zsuaUxG6CyR1UBodWPx18Q4pvNwWd+rsrZCj4bVglMV7oKAgKeil3NiriPjn5HTw/MpDGmqtL5YZRvc513E2pvIFSVsNNgRjyqr4/XEBLgQ0RK7cdH26S+Zl+pDu0u2RGgqCtS0cGhEy5KtDcTMXzDtwaKKrLZRmBNkZ7fyvbk2gYFcFAU1sQu+sfmIDIQkFdIxawkH1b0MD2p0G3rsfw5vkOiM6vB70iUQpjHHaQBE5hEaNVzMiKuV9jiMSHOt8x8nKztHxEOKrhJRyrddwRWFdCNP1vEOLJFZffm6u3/5n9cRQYqe4qO+2BMlzrsaK/o/K5GjXbUIgn5V6tTFoMNUDsRL2jsj0niY7QZU9gf6VhEu6ntn3L9+9E/OD+CV33nnk2qUwDjBTXPG1twPEWGcupTpkzIFeEp9OSQdVxLaI/ja9jZ33TP+4Gh222Qh900I8seAINJ2fnZhq/KTK6/Ck6dU3YA8mTUkG5WTWCpZKbCZm88AaPsOUitZn7GL9tkxbgPRu6aE2sVWX8ERrr2eLtKlt/ourqa1YavYqANfZmL3+kUKFfZciEufx+FaCuTL/62nR6oU0OQEgzOw1z/2J+FWPY0z0fi+33AN9ByMHRTKw62FTWsbJcdM/Snd4zLwRPNlOLSmsWX3Ea9CkKz3epQKT4p8Sei8jw6J2GKxMDly/dVV5974GQQg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(110136005)(26005)(5660300002)(316002)(64756008)(76116006)(82960400001)(66446008)(966005)(38100700002)(6512007)(2906002)(6506007)(6486002)(38070700005)(508600001)(8676002)(122000001)(186003)(83380400001)(2616005)(66476007)(66556008)(71200400001)(8936002)(91956017)(36756003)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bVNZUnRjRSsyODgwTUdMdHZrYXVuNnZ0NkxBTHdFYmRTbzRDZytaTFU1aHBi?=
 =?utf-8?B?TlZmTURHdDQ3OXpid3FaOFBJN3dDeGc1ZGZ1eEFlU05IZFlpL2tCUzYvTFR6?=
 =?utf-8?B?WmZ1K1EwbzJoVnh2blN1aDJOOGZTL0hLWFltT0RQTUhaTG9uMW9aSkk2ZnU1?=
 =?utf-8?B?Vm9NTS9JUWFmUnZhOFVsTnZVOXZrRkZXUVl6QUl0Z1UzWUFnckxFaHdweUFw?=
 =?utf-8?B?VDhSNkNqS3h3d3l0NVhlcStKVGlwZFkzNTI5NWtTRFplaXR1bmNTNFJUbkEv?=
 =?utf-8?B?THBZd1NOQ3gyN29Ua0lqY1pmNlJoSExGL0NpSlJtUjBTNjA2ZVJuWkRHRUxX?=
 =?utf-8?B?bENwYXN5QnFBSnVXZDFsKy9ZR2Q3d2pDYXh4d1UweTlJRTZyTlR6T1U3SEdT?=
 =?utf-8?B?UjZSZ0N5aGVCalJWRUNCUVZPZTlWWnh5SFlVWmdXRUgzL3N3ek5KSnkrUlNk?=
 =?utf-8?B?Q1dvZk1oZ1MzbUQ1bFVFbVlHcWVvd2dOenV5M3h4WWlnU1dRNXZCazU2NU9z?=
 =?utf-8?B?QU1TcTJXQXk0VStXNTk2Rm5jNEl0d2hOV1hCQkMwMXNoWk4zMEhzemxIRmRT?=
 =?utf-8?B?V1psL0dDVzQ2akQ3RmtEWXJ4bTZjTW5EYTJiK25lSitHVlN1bCtVcEVmc2Y5?=
 =?utf-8?B?UUc2bUNmUEJPWmNiRE1aTHRlVERMbGlMOG9Ic3NDSSt0TFVvQUNLSCtINWJt?=
 =?utf-8?B?NUNGY1h3MENGSzhWVU5jTzFGcWpWYWhlcjZyRnhnNXl6anFFVGhyTlBzN0RX?=
 =?utf-8?B?ZmxjRWZWa01HcnMzaEkzTHpWcC9Dd2txKzV5RWpYODBiUGtIRUNKSHRpK0Fq?=
 =?utf-8?B?Mk14dUlVanVUaFBhaFFUelRqbmRZQThsdzk3aTlLWXJibkxMdk1QMytFQ2Rs?=
 =?utf-8?B?UlhLN0lFWDZ3OXgrMnZyRHJXWXBjYjJ3VzZDL2JwQVRvSmtmQW1GUWlzemY0?=
 =?utf-8?B?eGNLVEJwS0N5S3RiMlB2K0o2THEzMkNvbGxyenlwWTEweDVLK2ZqRTJWYWNO?=
 =?utf-8?B?b09MUDAwdm9RY1Fld2xmSVJGNHluK2FEbm55azh1WmV6TWNqYTB1N2hUVkJz?=
 =?utf-8?B?aytLVGUzUmJWZUM3TERaY0xUUGhuQ1hoYzBQYnExQjNsTWoyWEFwR1l5b1Nk?=
 =?utf-8?B?WFRMZ0Y3WEVWUXNFZ2FFVitiR1FBRGVSdTc2NUZScC9yRDZWazFRa3FueFli?=
 =?utf-8?B?WFdTN2NDUmtVTldQUGRkT2FGdnpURkxNN2JyUjBxemlUUXJEeGcrWkVDUHhY?=
 =?utf-8?B?Uk1ERUJlY0hLQ3hCblhqUDNLbnhEeHR3a2xsNnpCOW5FcitaUk5aZHhnTkox?=
 =?utf-8?B?a0NiV21nU1l6R05KQ24rTW1iTXpxNW92SGVuNkpMMmRDclRienBYc3d3dEhC?=
 =?utf-8?B?V1FzU3dRR1UwQmo5YnFCMGdIdWgxZm5RT1JZK3lxbFhBci82M2dISjZNK2lk?=
 =?utf-8?B?T1RIdmZvMzU5cG4xdGlJQ1U2L2ZNYzBqZkhsQVFuL3JIYXlHNjlrcXNTUlRR?=
 =?utf-8?B?NTdnMCtIMnV6NTVlQ3hINFVLTUpFOW9wdU50QVR6VWo5Tmw2TUZUYjdhWjRo?=
 =?utf-8?B?UjRKOERYT1JBTGNIQTEzUWEzMkZTdWNsVjhKZkU4VGVmeWF1SDl0TUR2SEdl?=
 =?utf-8?B?WXNBRkRZRlpHSFhOMFdlOTVxZWthSDE3Z1ZKQXZqa3phengwRGV3SmNQdVBW?=
 =?utf-8?B?djNOdG1IZkZFNHRlUThmNnBOVjY2M3ZtL1ZFLzlhRzlpM3c5L01hV0g1c0V1?=
 =?utf-8?B?RTFxcHRBNGVRcFBBNURBVnBkQnV4eTczd1cyRWtjMUN0RWRQOFQ0bjN4WHVx?=
 =?utf-8?B?UVBIVXJmTmxIRXJtU0tWSnZ1ZEd2bVhIS1lzQmRxNkF3aHQrR3hwSUFlWXhh?=
 =?utf-8?B?NXp5Qlp1ZnVqcmJTdkFBcTJTOEM5ek96TlBOQTNHSWZBeCtFSlBZMnpMSFFI?=
 =?utf-8?B?NVlCZUJzdWpoQ0NRRHMzdXpUcE1TTmxyUWlpQ25sTkdNcXZ2ZkNhbm5CSjQv?=
 =?utf-8?B?ZDBMbDJNWjQ5RGo0VE5mYStZV1ZERmJkRDlwNWQ0TU45Ym1QODBFNWo2QjVF?=
 =?utf-8?B?V1Q1OStMKzVjbjNOZno1SlRoeDNxTG83R2ZQUGd4b0lNd3I4TWRxVHVxK0F0?=
 =?utf-8?B?UVBHQjNNL09XSG0vWm1qY3lCSDU1Ry9Va3h3UGV6bHJ5MDhtcFc5ckZ6VmI3?=
 =?utf-8?Q?qmk8sP9lJDHd7F/E5Z/YJCOCEqxvwhTsGy58XiCgpPuk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <466B4EF46F0B9B40A7B9D8856EAF765E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfeabeb1-356c-44bf-5dc5-08d9a38e4d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 14:36:23.0290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 0aoLl5ePD/3d7rsIv6MT0Uy0rDzTEzFlgNLrxB0THWct2Rv0eLbv8NC4loSR2axq8h+Q9sMbUplqDn5aFdrnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158020

T24gTW9uLCAyMDIxLTExLTA4IGF0IDE4OjEwICswMTAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3Jv
dGU6DQo+IEZyb206IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMu
Y29tPg0KPiANCj4gVGhlIGVtcHR5LWRpcnMgUUEgY2hlY2sgdmVyaWZpZXMgdGhhdCBhbGwgZGly
ZWN0b3JpZXMgc3BlY2lmaWVkIGluDQo+IFFBX0VNUFRZX0RJUlMgYXJlIGVtcHR5LiBJdCBpcyBw
b3NzaWJsZSB0byBzcGVjaWZ5IHdoeSBhIGRpcmVjdG9yeSBpcw0KPiBleHBlY3RlZCB0byBiZSBl
bXB0eSBieSBkZWZpbmluZyBRQV9FTVBUWV9ESVJTX1JFQ09NTUVOREFUSU9OOjxwYXRoPiwNCj4g
d2hpY2ggd2lsbCB0aGVuIGJlIGluY2x1ZGVkIGluIHRoZSBlcnJvciBtZXNzYWdlIGlmIHRoZSBk
aXJlY3RvcnkgaXMNCj4gbm90IGVtcHR5LiBJZiBpdCBpcyBub3Qgc3BlY2lmaWVkIGZvciBhIGRp
cmVjdG9yeSwgdGhlbiAiYnV0IGl0IGlzDQo+IGV4cGVjdGVkIHRvIGJlIGVtcHR5IiB3aWxsIGJl
IHVzZWQuDQo+IA0KPiBDaGFuZ2UtSWQ6IEljNjEwMTk1MjhmNGIyMmYyNmU0MmU3ODEyNWE5OTY2
NmFlMjdjN2Y1DQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2pl
bGxlcnN0ZWR0QGF4aXMuY29tPg0KPiAtLS0NCj4gDQo+IENvbXBhcmVkIHRvIHRoZSBjb3JyZXNw
b25kaW5nIHBhdGNoIGZvciBtYXN0ZXIsIHRoZXJlIGFyZSB0d28NCj4gZGlmZmVyZW5jZXM6DQo+
IA0KPiAqICIvdmFyL3ZvbGF0aWxlIiBpcyBub3QgYWRkZWQgdG8gUUFfRU1QVFlfRElSUyBieSBk
ZWZhdWx0Lg0KPiAqICJlbXB0eS1kaXJzIiBpcyBhZGRlZCB0byBXQVJOX1FBIGluc3RlYWQgb2Yg
RVJST1JfUUEuDQo+IA0KPiBUaGlzIHNob3VsZCBtYWtlIGl0IHNhZmUgdG8gYWRkIHRoaXMgUUEg
dGVzdCB0byBIb25pc3RlciB3aXRob3V0DQo+IGludHJvZHVzaW5nIGFueSBuZXcgUUEgZXJyb3Jz
LCB3aGlsZSBzdGlsbCBhbGxvd2luZyB0aGUgUUEgdGVzdCB0byBiZQ0KPiBhY3RpdmF0ZWQgZm9y
IHRob3NlIHdobyB3YW50cyB0byB1c2UgaXQuDQoNCkRvZXMgaXQgaGF2ZSB0byBiZSBlbmFibGVk
IGJ5IGRlZmF1bHQ/DQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiDCoG1ldGEvY2xhc3Nlcy9p
bnNhbmUuYmJjbGFzc8KgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4g
wqBtZXRhL2NvbmYvZG9jdW1lbnRhdGlvbi5jb25mIHzCoCAyICsrDQo+IMKgMiBmaWxlcyBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9jbGFzc2VzL2luc2FuZS5iYmNsYXNzDQo+IGIvbWV0YS9jbGFzc2VzL2luc2FuZS5iYmNs
YXNzDQo+IGluZGV4IGYyZDJjYTM2ODkuLjdkNGJhMjhlNDAgMTAwNjQ0DQo+IC0tLSBhL21ldGEv
Y2xhc3Nlcy9pbnNhbmUuYmJjbGFzcw0KPiArKysgYi9tZXRhL2NsYXNzZXMvaW5zYW5lLmJiY2xh
c3MNCj4gQEAgLTI3LDcgKzI3LDcgQEAgV0FSTl9RQSA/PSAiIGxpYmRpciB4b3JnLWRyaXZlci1h
YmkgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5mb2RpciBidWlsZC1kZXBzIHNyYy11
cmktYmFkIHN5bWxpbmstdG8tc3lzcm9vdA0KPiBtdWx0aWxpYiBcDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnZhbGlkLXBhY2thZ2Vjb25maWcgaG9zdC11c2VyLWNvbnRhbWluYXRlZCB1
cHBlcmNhc2UtDQo+IHBuIHBhdGNoLWZ1enogXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bWltZSBtaW1lLXhkZyB1bmxpc3RlZC1wa2ctbGljcyB1bmhhbmRsZWQtZmVhdHVyZXMtY2hlY2sN
Cj4gXA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaXNzaW5nLXVwZGF0ZS1hbHRlcm5hdGl2
ZXMgbmF0aXZlLWxhc3QgbWlzc2luZy1wdGVzdCBcDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG1pc3NpbmctdXBkYXRlLWFsdGVybmF0aXZlcyBuYXRpdmUtbGFzdCBtaXNzaW5nLXB0ZXN0DQo+
IGVtcHR5LWRpcnMgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoEVSUk9SX1FB
ID89ICJkZXYtc28gZGVidWctZGVwcyBkZXYtZGVwcyBkZWJ1Zy1maWxlcyBhcmNoIHBrZ2NvbmZp
Zw0KPiBsYSBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZXJtcyBkZXAtY21wIHBrZ3Zh
cmNoZWNrIHBlcm0tY29uZmlnIHBlcm0tbGluZSBwZXJtLQ0KPiBsaW5rIFwNCj4gQEAgLTUwLDYg
KzUwLDIwIEBAIEFMTF9RQSA9ICIke1dBUk5fUUF9ICR7RVJST1JfUUF9Ig0KPiDCoA0KPiDCoFVO
S05PV05fQ09ORklHVVJFX1dISVRFTElTVCA/PSAiLS1lbmFibGUtbmxzIC0tZGlzYWJsZS1ubHMg
LS0NCj4gZGlzYWJsZS1zaWxlbnQtcnVsZXMgLS1kaXNhYmxlLWRlcGVuZGVuY3ktdHJhY2tpbmcg
LS13aXRoLWxpYnRvb2wtDQo+IHN5c3Jvb3QgLS1kaXNhYmxlLXN0YXRpYyINCj4gwqANCj4gKyMg
VGhpcyBpcyBhIGxpc3Qgb2YgZGlyZWN0b3JpZXMgdGhhdCBhcmUgZXhwZWN0ZWQgdG8gYmUgZW1w
dHkuDQo+ICtRQV9FTVBUWV9ESVJTID89ICIgXA0KPiArwqDCoMKgIC9kZXYvcHRzIFwNCj4gK8Kg
wqDCoCAvbWVkaWEgXA0KPiArwqDCoMKgIC9wcm9jIFwNCj4gK8KgwqDCoCAvcnVuIFwNCj4gK8Kg
wqDCoCAvdG1wIFwNCj4gK8KgwqDCoCAke2xvY2Fsc3RhdGVkaXJ9L3J1biBcDQo+ICsiDQo+ICsj
IEl0IGlzIHBvc3NpYmxlIHRvIHNwZWNpZnkgd2h5IGEgZGlyZWN0b3J5IGlzIGV4cGVjdGVkIHRv
IGJlIGVtcHR5DQo+IGJ5IGRlZmluaW5nDQo+ICsjIFFBX0VNUFRZX0RJUlNfUkVDT01NRU5EQVRJ
T046PHBhdGg+LCB3aGljaCB3aWxsIHRoZW4gYmUgaW5jbHVkZWQNCj4gaW4gdGhlIGVycm9yDQo+
ICsjIG1lc3NhZ2UgaWYgdGhlIGRpcmVjdG9yeSBpcyBub3QgZW1wdHkuIElmIGl0IGlzIG5vdCBz
cGVjaWZpZWQgZm9yDQo+IGEgZGlyZWN0b3J5LA0KPiArIyB0aGVuICJidXQgaXQgaXMgZXhwZWN0
ZWQgdG8gYmUgZW1wdHkiIHdpbGwgYmUgdXNlZC4NCj4gKw0KPiDCoGRlZiBwYWNrYWdlX3FhX2Ns
ZWFuX3BhdGgocGF0aCwgZCwgcGtnPU5vbmUpOg0KPiDCoMKgwqDCoCAiIiINCj4gwqDCoMKgwqAg
UmVtb3ZlIHJlZHVuZGFudCBwYXRocyBmcm9tIHRoZSBwYXRoIGZvciBkaXNwbGF5LsKgIElmIHBr
ZyBpc24ndA0KPiBzZXQgdGhlbg0KPiBAQCAtOTE3LDYgKzkzMSwyMiBAQCBkZWYgcGFja2FnZV9x
YV9jaGVja191bmxpc3RlZF9wa2dfbGljcyhwYWNrYWdlLA0KPiBkLCBtZXNzYWdlcyk6DQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibGlz
dGVkIGluIExJQ0VOU0UiICUgKHBhY2thZ2UsICcNCj4gJy5qb2luKHVubGlzdGVkKSkpDQo+IMKg
wqDCoMKgIHJldHVybiBGYWxzZQ0KPiDCoA0KPiArUUFQS0dURVNUW2VtcHR5LWRpcnNdID0gInBh
Y2thZ2VfcWFfY2hlY2tfZW1wdHlfZGlycyINCj4gK2RlZiBwYWNrYWdlX3FhX2NoZWNrX2VtcHR5
X2RpcnMocGtnLCBkLCBtZXNzYWdlcyk6DQo+ICvCoMKgwqAgIiIiDQo+ICvCoMKgwqAgQ2hlY2sg
Zm9yIHRoZSBleGlzdGVuY2Ugb2YgZmlsZXMgaW4gZGlyZWN0b3JpZXMgdGhhdCBhcmUNCj4gZXhw
ZWN0ZWQgdG8gYmUNCj4gK8KgwqDCoCBlbXB0eS4NCj4gK8KgwqDCoCAiIiINCj4gKw0KPiArwqDC
oMKgIHBrZ2QgPSBvZS5wYXRoLmpvaW4oZC5nZXRWYXIoJ1BLR0RFU1QnKSwgcGtnKQ0KPiArwqDC
oMKgIGZvciBkaXIgaW4gKGQuZ2V0VmFyKCdRQV9FTVBUWV9ESVJTJykgb3IgIiIpLnNwbGl0KCk6
DQo+ICvCoMKgwqDCoMKgwqDCoCBlbXB0eV9kaXIgPSBvZS5wYXRoLmpvaW4ocGtnZCwgZGlyKQ0K
PiArwqDCoMKgwqDCoMKgwqAgaWYgb3MucGF0aC5leGlzdHMoZW1wdHlfZGlyKSBhbmQgb3MubGlz
dGRpcihlbXB0eV9kaXIpOg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWNvbW1lbmRhdGlv
biA9DQo+IChkLmdldFZhcignUUFfRU1QVFlfRElSU19SRUNPTU1FTkRBVElPTjonICsgZGlyKSBv
cg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiYnV0IGl0IGlzIGV4cGVjdGVkIHRvIGJlIGVtcHR5IikNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbXNnID0gIiVzIGluc3RhbGxzIGZpbGVzIGluICVzLCAlcyIgJSAocGtnLCBk
aXIsDQo+IHJlY29tbWVuZGF0aW9uKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZS5xYS5h
ZGRfbWVzc2FnZShtZXNzYWdlcywgImVtcHR5LWRpcnMiLCBtc2cpDQo+ICsNCj4gwqBkZWYgcGFj
a2FnZV9xYV9jaGVja19lbmNvZGluZyhrZXlzLCBlbmNvZGUsIGQpOg0KPiDCoMKgwqDCoCBkZWYg
Y2hlY2tfZW5jb2Rpbmcoa2V5LCBlbmMpOg0KPiDCoMKgwqDCoMKgwqDCoMKgIHNhbmUgPSBUcnVl
DQo+IGRpZmYgLS1naXQgYS9tZXRhL2NvbmYvZG9jdW1lbnRhdGlvbi5jb25mDQo+IGIvbWV0YS9j
b25mL2RvY3VtZW50YXRpb24uY29uZg0KPiBpbmRleCBjNWEzOGIwNzY0Li5kMzhhODhmYjQ5IDEw
MDY0NA0KPiAtLS0gYS9tZXRhL2NvbmYvZG9jdW1lbnRhdGlvbi5jb25mDQo+ICsrKyBiL21ldGEv
Y29uZi9kb2N1bWVudGF0aW9uLmNvbmYNCj4gQEAgLTM0NSw2ICszNDUsOCBAQCBQWVBJX1NSQ19V
UklbZG9jXSA9ICJUaGUgVVJJIHRvIHVzZSB0byBmZXRjaCBmcm9tDQo+IHB5cGksIGRlZmF1bHQg
dXNlcyBweXRob25ob3N0ZQ0KPiDCoA0KPiDCoCNRDQo+IMKgDQo+ICtRQV9FTVBUWV9ESVJTW2Rv
Y10gPSAiQSBsaXN0IG9mIGRpcmVjdG9yaWVzIHRoYXQgYXJlIGV4cGVjdGVkIHRvIGJlDQo+IGVt
cHR5LiINCj4gK1FBX0VNUFRZX0RJUlNfUkVDT01NRU5EQVRJT05bZG9jXSA9ICJUaGlzIHNwZWNp
ZmllcyBhIHJlY29tbWVuZGF0aW9uDQo+IGZvciBhIGRpcmVjdG9yeSB3aHkgaXQgbXVzdCBiZSBl
bXB0eSwgd2hpY2ggd2lsbCBiZSBpbmNsdWRlZCBpbiB0aGUNCj4gZXJyb3IgbWVzc2FnZSBpZiB0
aGUgZGlyZWN0b3J5IGlzIG5vdCBlbXB0eS4iDQo+IMKgUU1BS0VfUFJPRklMRVNbZG9jXSA9ICJT
cGVjaWZpZXMgeW91ciBvd24gc3Vic2V0IG9mIC5wcm8gZmlsZXMgdG8gYmUNCj4gYnVpbHQgZm9y
IHVzZSB3aXRoIHFtYWtlLiINCj4gwqANCj4gwqAjUg0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTU3OTg2KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNTc5ODYNCj4gTXV0ZSBU
aGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvODY5MTA5MTEvMzYx
NjcwMg0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29t
XQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

