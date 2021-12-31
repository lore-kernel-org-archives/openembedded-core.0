Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A3CC433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 01:51:55 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.6700.1640915514443673585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 17:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=glul7vPZ;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640915514; x=1672451514;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=dmuMCRqc5O6Eaxw7UjlSIxsZYuEXlbEOUusVqV4w9tk=;
  b=glul7vPZb9t6Rkgdmy82ykLbNH9ecilqIEocBUoVjgZa0C9P4gPZI7aV
   l2S2sUvh82NuRDQ62YotRjuDEzqe/dPI2ra+mvlaNceO7MdWgActKTf+J
   CCaHx9cDAwG+i+V0lvMUvdeYSXCTVIlEB1T+aCgp+IZ4mK1CAmj1BlEmG
   8+gEhDTILQAIukFnUzYPGe8WWzBZI4bdMuueO5Dr3PKSbKXu0rd+8oarn
   DFioFdZxDZqT35OzTTq5T0HckNRqrSvZmk2RCjNG3uJVl1REzKBOWbQpH
   15BQJFfY1+vJUjSz+jGX35f6Rh9swPdyWSnZq1srhS55nbPipAXcvWTAC
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="328090935"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600";
   d="scan'208";a="328090935"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 17:51:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600";
   d="scan'208";a="610050667"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2021 17:51:53 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 17:51:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 30 Dec 2021 17:51:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 30 Dec 2021 17:51:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeZOzmRMzBFsbhWbwu38NjGl8EOz+1VS1G5Z7Ys4qWk1aqCjNuNigbZVSqZwWjTjnH19PWcym7H0lyfmRDmMsnyxfcS2Z0AZTslnXZKhhb9q7bgEf2Uh+5pPY3UbmpFcNrZtmSwljTnR0xngW/GsWqed2pFDigqAmP/N/XXipl65McFWXW5+tThrTm5+gnef4oFv2twuv/yJ7gun6d5DfiC23+Md9hh74MenBnixINmcrwoRgoLiukuoAfRM/Z5oFHpou8pXZCvCsBA4MRSYgAa/ittkOlB7Gq6nGuKjXO0RqcaZU3IDFXBR5p8ME4XAUjmToNTYvZsMAqbtAOFOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmuMCRqc5O6Eaxw7UjlSIxsZYuEXlbEOUusVqV4w9tk=;
 b=NcooNxETKlnL0CvJEUAyJg2AA8PZcsdtYcn+nVEGhGUFjDNu2Ab6uAaDTsm9vsfqNnkAYGbydqx9FmNuwr7w1aZCnUrBDHzzZwwO/dcgBPkgTvIz3xVqb3SUzWC1KAmjYPed377wCDN4P1HAUcXJAoX9GLNc1sNE3snvHMfQu7ICBlwEFwmvdg1OmLDFUReHh7x4bG7E7nNSTEtEsCKCboK9v3vMOdxahdTBoKJ/EEWgWCPFvJ3z64Czy6ch2xQBOX92q/k1hrIgd3TcyLvmmdwgjHJxX7TcslGqO2T+fGp6NAnblzZfMaF3Yog3xJlkCFM3ME3++FSK5WNYZ9Hn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Fri, 31 Dec
 2021 01:51:50 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%6]) with mapi id 15.20.4823.024; Fri, 31 Dec 2021
 01:51:50 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [V2][PATCH] rpm: fix CVE-2021-3521
Thread-Topic: [OE-core] [V2][PATCH] rpm: fix CVE-2021-3521
Thread-Index: AQHX98QegPkLGG0ojE29EnwvjzzfRaxL4mkA
Date: Fri, 31 Dec 2021 01:51:50 +0000
Message-ID: <e6d34fc6a7dd35b26b1d9396081f417ac439fa24.camel@intel.com>
References: <20211223061238.16986-1-changqing.li@windriver.com>
In-Reply-To: <20211223061238.16986-1-changqing.li@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e94b00a8-0160-4ddf-ab48-08d9cc001cb4
x-ms-traffictypediagnostic: BY5PR11MB3974:EE_
x-microsoft-antispam-prvs: 
 <BY5PR11MB397439F6F22A1A0881F6D154F8469@BY5PR11MB3974.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ni+k7MfrgtgPPfF8ap46701jLvJJNXYTCNCJawPV7F3dcePlpebrSQwvZHG0vLf1cmqWe4mb3nA9v6GBCBtQnizMV6Yz2+8QYKmvJobS/LXIdL0pXByqP66vg3ohpmE3YntNJ47tOUgTTZG94M9d8Z0rDcyDyqh9vKhEyig9X383xcOR5OoKu4saWAMLZkuvgVDuOTTqvwg+QS2r5YsN0hRLrWnFZrWed1cPOSRznvmwdTFpXFYvoOmxazMYen3AQa74SWTu5xSopDoYzz+hc9f6TMG9q8IwNjWLgK6TqXKUzo6eeZZH6GqeHeLKkK4YbTuLcJh+lFHx/raqQFM0wcxcHq9CAxKBTw4yCPdToQ96E+aL/ucWfRan55WA4L+SzEBltFQYIIQoqiCof01RsL2C0zNwSxQ2X//2mGVNszMEEwiFSZu1OFK2Gis3EvD0eO4TCrZINbTS3ScVt4pmLRosTHoOYKHENYYZD1/6Xqgic6hv9pJucKXrr47MGp7jcInm8JaR0QA5FI4KipdqY6dQCMmSyebYA7qMZs+g9+X3Y65jqar4WXOY3KfJlDz5YNsB/BpFp9noc4nFgAlEdYSlYuGhn1yLHXfRf5eb6oo1/A54DtjlLX89bz8tXdnctq57WrStacNcl5sqY/R6pYf2iYUdWzaobtIB8M0DxBMpc8yRF8byODufj2QTQ1zgF/zYSfCMJHR33tv7Gx6rDg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(110136005)(38070700005)(26005)(4001150100001)(38100700002)(71200400001)(66946007)(6506007)(186003)(2906002)(66476007)(6486002)(86362001)(8676002)(64756008)(36756003)(66556008)(76116006)(91956017)(66446008)(122000001)(82960400001)(5660300002)(316002)(508600001)(6512007)(83380400001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qzg5VVk5ejIzVVFXSmUzVU8zZkpxcTNkUGJKNnAwelhIdjJzYXdHZjQ0djJo?=
 =?utf-8?B?RG5UVEY5TGtyMUtHVWZvNW5wSzJuUHRzRWYzVkVuaEhoYXR5Zk8zQXFaNkho?=
 =?utf-8?B?cHhIY1o0ejVKUktOb2tEZjRiWm5VNGUzRExaeDRSYUMrMVZxTUM2WktJeDl5?=
 =?utf-8?B?ZzFiTm0vSkRKUENIUjUraWFiL2NyZ1p2TUZvV0dYbHRpQjE1T1FwU1JGTFgw?=
 =?utf-8?B?UEN6T2hxc2hORDZSaVJmSkdQVGhreTgxNHhHK0VzV2k1WjNJT0o2SEh2S0p5?=
 =?utf-8?B?QmhnNGwzRVNKclQ1bkYvYlRGRW9HZ2VlV0xPM0lteTZYTk9WRnN0dTZDOVoz?=
 =?utf-8?B?WndnNWdjdzlJdE1IS0xybnp0TWcxZ24rK1loUkVwKzNBdDRHMFk1MXB0RlFC?=
 =?utf-8?B?b3FiTVRTWGJKNG9yWjIxTTlzV3BYaHp2OGJ6L2ZUblBMNk5KaWoya1o4WjZ2?=
 =?utf-8?B?ZkVPSU9QRDFwZ3UydS9EaXFVYWxOTFhTSk9yZUtsQjBvdXIrcWpYYjlLckZy?=
 =?utf-8?B?YjUzUTlQSW5nSlpYRmNaWXVlcnFyMFVXenpoWnFNN3FYcGhDYnk2Q0ZwOVYy?=
 =?utf-8?B?WncrNVZSY2NCeW9JeDA0b3Y1cENKQU5ITmppajd3U2RUNTZjQUlmeWM5Q3dS?=
 =?utf-8?B?YmRGSE9rdUxhQU9pWVB6ZmNSME1hRkhtSWRZN2g5V2dzOGNpVm9uUWhxSFhW?=
 =?utf-8?B?QUZHY0NxUk56bnJ6TWM2aXUrVE9qRENmdXhkY0FLa1ByelE2ZTVsRFhMb0lt?=
 =?utf-8?B?Skk3YjBJSEllTjAzU1RpV0tZWjZuUjJKdVZRbHNlQ0JmV0dBTEFjMTEzRFU5?=
 =?utf-8?B?bzBGOUVXbDFWRGpGRCtVQjZyTVFnUDRPcDY1WFpmNi8ydDE2eXlqNHhTa3p0?=
 =?utf-8?B?NG9aaS93aDlnVDdscVZTWVp3ZHVvTUVPOFJpY1JHYTdyRDNxRG5OUGZwQWpa?=
 =?utf-8?B?VUY1RXdCenBRRFpWWFVMT3FpOXRwTnRUZ2NReG4yWDY0NnFGQzAwakJRUmZD?=
 =?utf-8?B?U3AwMmxkQ2ZxNUtZY3Y1VlVab0E4bWIrcmlqVzE3M2dxSUk2QjJKME9yQ3RI?=
 =?utf-8?B?WnczZEpGSmpIS2NZM0tuQVBsU3NEdFFFTWRveWpVTjI1OHl3Q0NheGJjbFlt?=
 =?utf-8?B?ZkxTZU1CamVpUXc5RnUyT0tabk9EVGRjYzl1cHQzUjc4aDRkOVE4RDA3elJa?=
 =?utf-8?B?UHlnZUYrVDlkVjlsbkh3OVpMY1lhc0ljem41RVVTamVickVZSy8xN2hFSWVl?=
 =?utf-8?B?U0VEYlBUa0I0M1RsOVR4OW0zcmJqekNzMWJ6L0FvamlYbGw2eTlkSDE3VlBC?=
 =?utf-8?B?anNrWmRlamtEcmNuYmdvMlFVakpWdHJEd2VsQzkvNSt1TndkZVk2WTZSd2h6?=
 =?utf-8?B?eS90WjZVdGloaHVsV05ZTElUVDVOWHExZ0NOUWx3M1ZtWE9WRkh1OUxGTnpo?=
 =?utf-8?B?V05iaTN1OGxoTTZzUnJDbC9wYzJMc3U4bzJjOTZFK3BrWElCM0QyNVZMVlVP?=
 =?utf-8?B?VFNrWnh0RlhsUGlxajduMGF1eFBzUVM2UncyYnNueEtYYXdNY0JpazRTcUF4?=
 =?utf-8?B?TGVQalcwLzF6YW1nTHE0b1NsWTdCdTR3MXJpVjZHVy9wVGJrTTFEcVBjSEI5?=
 =?utf-8?B?MldQL1Y1SHJPMzN2TmJ3cENoUWFNY0JLWnlaTHp1N05rZFpkUlRwbjl2MmE3?=
 =?utf-8?B?NGk1T3EyNFdhb1ZObExrcmk2OE9KMGhFbmRweGxHQndNLzJDS0wyMExoV2ww?=
 =?utf-8?B?UFdGQWtxNC9FUHArVmR6UUJ6UnFnM0lLRlg3ZUhkQ09KcWdUVEZSMlV4bmxB?=
 =?utf-8?B?RFFEQW1pZFg5aXhQUUEvVE9EamFKdkVyQnpmKy9ZZTdkRE5XTzJuQkV6N1VX?=
 =?utf-8?B?aTZ1VVRKRkE2c0dBY2JVT3U1WTNySlQ2dTVEeFo3d2tOaXNOTk00MysvV3RI?=
 =?utf-8?B?YkEyd0VXN2FDTjJaSHREYmJ4QUhPVyt0UkZlVmhWVDBrRXlDWjNoTnpzVEhX?=
 =?utf-8?B?Y2gzblRaaWhRLzNqWWZnRmhMT2ZoR1dabU9pY09tWXFDZ0ZhdEN6V2ZUQ3pX?=
 =?utf-8?B?VEpISUxIZloySnZySHpBTUt2VHRCSGIwZmtsZ0FNd2o3TTYxUENJT1RDTHhR?=
 =?utf-8?B?VDdDeFRsSzY1bWJta1V2bUYvdmJZRFF4YVh2TlV5L0ludzZEZEdxVldDeUZz?=
 =?utf-8?Q?bAWF0ffTvu+jfhu0IGzFBcM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85569EC84E533A4E8935F27B96EAAB8E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e94b00a8-0160-4ddf-ab48-08d9cc001cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2021 01:51:50.2211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 W0d6TAUR0rTUdpDw3tMUqIAviHn9svuhgO9efUQIyn/A7wBbZasi2p+WvuRn70mjdsG3sRO9AHIbzdV564KL8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 01:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160082

T24gVGh1LCAyMDIxLTEyLTIzIGF0IDE0OjEyICswODAwLCBDaGFuZ3FpbmcgTGkgd3JvdGU6DQo+
IEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+DQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0K
PiAtLS0NCj4gwqAuLi4vcnBtL2ZpbGVzLzAwMDEtQ1ZFLTIwMjEtMzUyMS5wYXRjaMKgwqDCoMKg
wqDCoMKgIHzCoCA1NyArKysNCj4gwqAuLi4vcnBtL2ZpbGVzLzAwMDItQ1ZFLTIwMjEtMzUyMS5w
YXRjaMKgwqDCoMKgwqDCoMKgIHzCoCA2NCArKysrDQo+IMKgLi4uL3JwbS9maWxlcy8wMDAzLUNW
RS0yMDIxLTM1MjEucGF0Y2jCoMKgwqDCoMKgwqDCoCB8IDMyOQ0KPiArKysrKysrKysrKysrKysr
KysNCj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE3LjAuYmLCoMKgwqDCoMKg
wqAgfMKgwqAgMyArDQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA0NTMgaW5zZXJ0aW9ucygrKQ0KPiDC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL2ZpbGVzLzAwMDEt
Q1ZFLTIwMjEtDQo+IDM1MjEucGF0Y2gNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3JwbS9maWxlcy8wMDAyLUNWRS0yMDIxLQ0KPiAzNTIxLnBhdGNoDQo+IMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vZmlsZXMvMDAwMy1D
VkUtMjAyMS0NCj4gMzUyMS5wYXRjaA0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ycG0vZmlsZXMvMDAwMS1DVkUtMjAyMS0zNTIxLnBhdGNoDQo+IGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3JwbS9maWxlcy8wMDAxLUNWRS0yMDIxLTM1MjEucGF0Y2gNCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uYjM3NDU4MzAxNw0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0vZmlsZXMvMDAwMS1DVkUt
MjAyMS0zNTIxLnBhdGNoDQo+IEBAIC0wLDAgKzEsNTcgQEANCj4gK0Zyb20gOWE2ODcxMTI2ZjQ3
MmZlZWEwNTdkNWY4MDM1MDVlYzhjYzc4ZjA4MyBNb24gU2VwIDE3IDAwOjAwOjAwDQo+IDIwMDEN
Cj4gK0Zyb206IFBhbnUgTWF0aWxhaW5lbiA8cG1hdGlsYWlAcmVkaGF0LmNvbT4NCj4gK0RhdGU6
IFRodSwgMzAgU2VwIDIwMjEgMDk6NTY6MjAgKzAzMDANCj4gK1N1YmplY3Q6IFtQQVRDSCAxLzNd
IFJlZmFjdG9yIHBncERpZ1BhcmFtcyBjb25zdHJ1Y3Rpb24gdG8gaGVscGVyDQo+IGZ1bmN0aW9u
DQo+ICsNCj4gK05vIGZ1bmN0aW9uYWwgY2hhbmdlcywganVzdCB0byByZWR1Y2UgY29kZSBkdXBs
aWNhdGlvbiBhbmQgbmVlZGVkIGJ5DQo+ICt0aGUgZm9sbG93aW5nIGNvbW1pdHMuDQo+ICsNCj4g
K0NWRTogQ1ZFLTIwMjEtMzUyMQ0KPiArVXBzdHJlYW0tU3RhdXM6DQoNClNob3VsZCBiZSBVcHN0
cmVhbS1TdGF0dXMuIFRoaXMgaXMgdHJpZ2dlcmluZyBidWlsZCBmYWlsdXJlcyBmb3INCm1hc3Rl
ci1uZXh0Lg0KDQpUaGFua3MsDQoNCkFudWoNCg==

