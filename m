Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E14C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:08:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.3559.1647907732664588836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Id7cuzMV;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647907732; x=1679443732;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=YfsUE8GdjMNDwC9OREF1gzjrfUyi58jL0de3cfcfeUE=;
  b=Id7cuzMVNlKLHkFaI9J5z66HSCiroKOt/8FAAhTDLwqUqXkJn1xN+7t2
   Bxd+vrPZGbNskMSR5QYkfSQxNlY6ClffU7b+srxu1qohbPnUzTbexDamp
   hUjyJJ7z7phzpna6xRw0WI2vVy4fODh6RQfrE4o+8j6ZAm7zB5fhdRuXD
   42CR7k/qZR5cfybMEYy1mSnal0og9s8KRBqrzQoO22I4VHtuVNY+MLCyd
   0lIIGsDsSAQFoCCFbRUkR/HmEJQNlHFROEjOMq7yDpDgDjnwWk4mq+fB3
   ktb3keXDmsMzoIevw7v3fC0RwLbHW+HNgILtykqGU1IYthJghUzjaB966
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237623058"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400";
   d="scan'208";a="237623058"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 17:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400";
   d="scan'208";a="543441362"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 21 Mar 2022 17:08:51 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 17:08:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 17:08:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 17:08:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnG5K4GsbtdmzDBBZXKexG6YHRbhLIbgbhawZc8gLAcBnCPauuaT+kfttH9geOqZAZB+lA+argiDcQcd4igWvjn+WLM6wOO1JwG6BTXg/wE9LpS63VUIF3f/JDZw3x5QFjnKwadYTvyFmhxla1YLzJmsmpR9OVCpkRgBJBO9B58YiUFf6jBjDOMkm9ymg1fYQNfdZhrkdX1fMD/aj1R1kcGMpOEqOYlYv35MWcWbiOXoUv4sh+UU6fe/eL4zqok31i5FqPK7AeYh5hR+4NC/J3xdeTa4ft9FpX/HaTaY5oUuuuAgO0/lbSgVqanBdpAlu8mWxfKwgCkJDEHMyJ7Djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfsUE8GdjMNDwC9OREF1gzjrfUyi58jL0de3cfcfeUE=;
 b=MVwQADqOcyBYyyz3TrskETB+6xa/imCkh95WpD+UySBapW4gTPgfXx4Psxe8xymi1KvjRFvg7/0uJlhiIk0yKqntHJH3Au0rTgp2W2/fjmb5a//Q0XzWeKCXWNmXwEaJfCI3oF6f0lpwzR2OhkRtdPiUgoPmM7sSen7NMgZmM738mTYwJOzDrmnrJ0qrdOFES0w9ZbZ2k/8UtdXCZiVFH0VpI4i2tQRAb91LA52/zGk6gAm0lrKQ5Gsy2HRU5/fvlNyiAE9MmTqR6lWlzlarMzhJUNHS4UchWHAzOxxKCZF7XCYc+kLENozesaunW+evEHjo/VMFFkBh8hXjcJH88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SN6PR11MB3485.namprd11.prod.outlook.com (2603:10b6:805:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Tue, 22 Mar
 2022 00:08:44 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::74c5:bbca:a53a:7ea5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::74c5:bbca:a53a:7ea5%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 00:08:44 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH 0/6] Pull request
Thread-Topic: [OE-core] [hardknott][PATCH 0/6] Pull request
Thread-Index: AQHYOgleTE5+NJcGgE2/6WDxmq38fqzKjeiA
Date: Tue, 22 Mar 2022 00:08:44 +0000
Message-ID: <78dc448ea65c4f8f7e85432c8cf2ceef49cdd5a6.camel@intel.com>
References: <16DD309A1EC889D5.29979@lists.openembedded.org>
In-Reply-To: <16DD309A1EC889D5.29979@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9331305f-358d-40de-7b70-08da0b982122
x-ms-traffictypediagnostic: SN6PR11MB3485:EE_
x-microsoft-antispam-prvs: 
 <SN6PR11MB3485D0F3C813F100CC5D3FADF8179@SN6PR11MB3485.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7A0CAFNv5XLl3UX+fkmliZAlbXJ4VXAtR/RppHfS9JBxPvbGJaVcmrNaKw886ddXOjFWGRSrq6JJO5omb5pjEEb5CqonpiQUnBzwYfTeadzgtvPin88/2L/MnfqQyNKHFVZCutt+m/ZxzpejbgCWrjVeL6VR1l+m0VGMxYIIGayIcPCUfPbgGi8kRLzCc03L/LKUvTc14cKu/Npfs/kE090yM8Nb6dzZpfPzib2hPn+6fEpBmGhTgh+yFxMia+ADla6Xyo/yhAA7BlegY2WTBemjlEjrpdxjQVzYEw1j/lZcHdCybOoRiBmwRl6QfVVZ+hSKMFSrx9+ogdjv4HlWQCx5WGGGYf5sUXgslB4wDQ9sHCSvqp6yCFkxdqyz0kYLdSu7JxN3CrHctEK9vQwVAkGGdP7FHF6B7w8O4q+jyFUcBvnk/RAs0ZbSJWFVMUwbJPBqP23uP24Y1MuYh+zYjLG1f6u5ufA7zWzuOxHfd0QMGWNi52wNHACRoMOHSrkCMvXhs/Rf2Pe7VatKayp4eA6KUvOHtdln2W8OhR9OMuWJRGz5bNcKJYcyavXc+Xbw3BF6ErYV28DB+XPEOTMcGHu3xGDrWoFpe7lNRF3itDK2LRaZwCwV3GmtPot+oEd4B+Ii7FkwxEq5YHFiTBjdJeWDT9ep2jmcieco8Rzg2Gbz3fKTFDKKfRZ1cb3fx6fwlF/Il/lwhyAP8SI6B26dU5eF3UVkhKTocv8STfXieOT4elRyAMj2ph8iHJ454heRAEcFOckIwKYEdFvwJL/IeEJsB/mR70/0TVtOq81R/jfBrG8ejCjWqjS+Izg2lA+DC3NMmXX6QvFtMaz8pELPWw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(82960400001)(122000001)(86362001)(38070700005)(8936002)(5660300002)(2906002)(6512007)(316002)(6506007)(2616005)(186003)(26005)(508600001)(966005)(6916009)(6486002)(71200400001)(83380400001)(66946007)(76116006)(66446008)(64756008)(8676002)(66476007)(66556008)(91956017)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkRDRjROWDVIVmttK2lpNitYZldpVVFTSENXb0xPR253OWU4em9JTFpJY0VL?=
 =?utf-8?B?Tytya1ZHODdIN2Fldm80ZHZlVXIvQm82UFBNWThKQW14Vk1GOGRaMS9pSkdt?=
 =?utf-8?B?Vi9qdU14S3Z6NnFoWnZILzRKZ3NnNUFsRGQ5eW84K1Y4enhDeHZzdWppNG1p?=
 =?utf-8?B?WnVoOW1KTVkzNHhLZjBLRVFWK3EzN1NUWjljbUFsWjhLL0NmTzkrYWVhM3Bm?=
 =?utf-8?B?UjNsd3RMdGdBR25aYlVqWW9tc2pUdDZESmg5dmpQSzNTK1p4aVYxT0VIVFZ5?=
 =?utf-8?B?RytyRWt6WkRMZHlHMVNwcHMxbkhYZjNqUUw0REw1WGpvOVlzcVdtQ0FiTjRu?=
 =?utf-8?B?VWZkaU9CWnpUbXRyMnpSTmJvaUhOamx0VTBYNVlOd2R3bWxGVU5CMEhCRXVS?=
 =?utf-8?B?T05LVWl6SElLdzVURE1wSDEyWVgzNzlHdjVkRzcvMXdsdFNZbDBWTE1kRXFF?=
 =?utf-8?B?YW0zeWNhK3RrTU1xOXVVTXdhN1d1T0trbDVYNW44R0IybzNQdnlBemJpZW1V?=
 =?utf-8?B?bXZGcWIzQ2VITlRjdzBFOWowRWR2dW53Sm9zSUJXN1ZvMkR5R25JMmVDbEVh?=
 =?utf-8?B?bTFKVFdpWEU1UUVBNUZaL2NrUzRldWV2ODlVY1NxR0M4N0JMakZxbk14dysw?=
 =?utf-8?B?T2tuOTFXL3JONU5qRUkvN2JwVnF6UVQrNGtuVERPeTVKOVcvYzQ0WlVFQnVZ?=
 =?utf-8?B?d2JBSEJGMDN4c0YrQXROaTJQblFyaGJadVczT0dqSnJxWExPZGdyYk5Yc1RQ?=
 =?utf-8?B?cFlmUmdSSnkvVXJwR3VWd3AyUHZiSDAyc0NRY1UxZ3M2YzVBS2hIL2pCQm5D?=
 =?utf-8?B?bmpwNEUwY3dSVlVWMXpMbENaaW9Pby9JMlNoMzZNbVdxSkNKRjhVdllWUHlE?=
 =?utf-8?B?bkZmb04wMVl3YXFiTVdpY3o4bHp2M1lZK3ZlY0RxR3VNNjJqekVZa0JGeTk2?=
 =?utf-8?B?YjF0WFcwS005T1c3YU8wTmVkYjREcC94UDJBOWZ6dTdMWW5KOUFiNlZIYTli?=
 =?utf-8?B?aElqdVZUMTB1eVloOFdxc0hUNFZDeDdPc2VZVXhKUG5aTGlMcFdrajVSbjFi?=
 =?utf-8?B?S05VakozblZDellLM2wwdVpBRUdOdi9PVVA1d1NHMDVBTFhIWjN4RlNCSUJn?=
 =?utf-8?B?eEVBWUFKNVdGUVVUeXFpZ2gyVWttQ1JnNTF5SERjYjRvLzM5TE9PMU93dVpW?=
 =?utf-8?B?ZWdnZ2xlL0ZUSnAza0VKRjVhNHpVVFNGZ3FydDdyWENIbFArZHRHOUEvMXAr?=
 =?utf-8?B?d0pXdEFFTnA0RFJ3WmFVUXVON0cwRkl4eXV0bWZlMVpmbEwvd2lZRVdwL2Y0?=
 =?utf-8?B?RjIzQTJRZ2JpUXJLTndaWlVXUWhPUzZwVW9WSGJhR3BLeHFlTEY5dE1mRzBr?=
 =?utf-8?B?Y2g3YkhtQVNUSVcyWkk5aDVxK3lLdnFlbHZhdFZTcWR4YlJjNG5xKzMwVVlk?=
 =?utf-8?B?QzdpSUZzTUk2dEhQbmxGbFR3WTBaR1VOSFUwUitKZVpZSENML3NySllhRkxW?=
 =?utf-8?B?RktNNkt5dWpISWFzZ0RIcnRtY0cyVzBvZVVtVnhNL1lRUmNueXlzSzFKQ0pO?=
 =?utf-8?B?YXFURjdEY0tyVG1CbzI0ZlRFRDF5WDE4T1pkaVVDeUxsUy9SQmwyWU1lSVFK?=
 =?utf-8?B?elVtTFVUeFdWbk9zWUZ4OXhIK0R0ZmtMSC9URTFBQW1UU29nS2JvbVMyOWtJ?=
 =?utf-8?B?S2Z5Q2JpcDdNL2p3QVBDcENXajcvOWJEOFBNL2dBSWdoS0ZBWUpkMytzT1gz?=
 =?utf-8?B?NStlaTNJeXBEdk1rMkVDblBGRmtzQ01XOURGdjhXbzdmVUg0TjdoQkw1eGdD?=
 =?utf-8?B?SGhSc2FTL1VxVXdQSzlFb29zdkVWMVM3eVB3NkVGSDNwcEhzQzYvcVN3OFBI?=
 =?utf-8?B?U1lDMW9FZTV5SitRKy9pUzhXaFkvTXhXVUVYam1vaDNtQVFGMUJwdW94cVJz?=
 =?utf-8?B?QXFwT2dlbWFzQVBRTmJGVUJCeEdnVUhob2VOOHJaelZJaTRibWpqSUtrVmNx?=
 =?utf-8?B?Y05YV2l0aE1nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D80416D0912C3A4B8E71D7EBEBD0E02E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9331305f-358d-40de-7b70-08da0b982122
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 00:08:44.4564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 6IzppbEzonuUfbYGARFtGDTYx6QNhkIP2z4AHyaE9wMgVlUZFt4sR4V1PE7HKTiGpCbSLQSe8a4uoeYWcJ4P1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3485
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 00:08:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163528

UGluZw0KDQpPbiBUaHUsIDIwMjItMDMtMTcgYXQgMjI6MTQgKzA4MDAsIEFudWogTWl0dGFsIHdy
b3RlOg0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+IGQwYjE4MDdlZGMx
MDgzNWJlZmY5YTU1YTEwNWFjMTkxYjZhYzJmZTc6DQo+IA0KPiDCoCB1bmZzMzogY29ycmVjdCBj
b25maWd1cmUgb3B0aW9uICgyMDIyLTAzLTA3IDIyOjE5OjAxICswODAwKQ0KPiANCj4gYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQo+IA0KPiDCoCBnaXQ6Ly9wdXNoLm9w
ZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUtY29udHJpYg0KPiBzdGFibGUvaGFyZGtu
b3R0LW5leHQNCj4gDQo+IEJpbGwgUGl0dG1hbiAoMSk6DQo+IMKgIHdpYzogVXNlIGN1c3RvbSBr
ZXJuZWwgcGF0aCBpZiBwcm92aWRlZA0KPiANCj4gSm9zZSBRdWFyZXNtYSAoMSk6DQo+IMKgIHNz
dGF0ZTogaW5zaWRlIHRoZSB0aHJlYWRlZHBvb2wgZG9uJ3Qgd3JpdGUgdG8gdGhlIHNoYXJlZCBs
b2NhbGRhdGENCj4gDQo+IEthaSBLYW5nICgyKToNCj4gwqAgZXhwYXQ6IGZpeCBDVkUtMjAyMi0y
NTIzNQ0KPiDCoCBleHBhdDogZml4IENWRS0yMDIyLTI1MjM2DQo+IA0KPiBQYXZlbCBaaHVrb3Yg
KDEpOg0KPiDCoCBwYXRjaC5weTogUHJldmVudCBnaXQgcmVwbyByZWluaXRpYWxpemF0aW9uDQo+
IA0KPiBSaWNoYXJkIFB1cmRpZSAoMSk6DQo+IMKgIHZpbTogVXBkYXRlIHRvIDguMi40NTI0IGZv
ciBmdXJ0aGVyIENWRSBmaXhlcw0KPiANCj4gwqAuLi4vcmVjaXBlcy10ZXN0L2dpdHJlcG90ZXN0
L2dpdHJlcG90ZXN0LmJiwqDCoCB8wqAgMTYgKysNCj4gwqAuLi4vZ2l0cmVwb3Rlc3QvMDAwMS10
ZXN0cGF0Y2gucGF0Y2jCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArDQo+IMKgbWV0YS9jbGFz
c2VzL3NzdGF0ZS5iYmNsYXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDIgKy0NCj4gwqBtZXRhL2xpYi9vZS9wYXRjaC5wecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMSArLQ0KPiDCoG1ldGEvbGliL29lcWEv
c2VsZnRlc3QvY2FzZXMvYmJ0ZXN0cy5wecKgwqDCoMKgwqDCoCB8wqAgMTggKy0NCj4gwqAuLi4v
ZXhwYXQvZXhwYXQvQ1ZFLTIwMjItMjUyMzUucGF0Y2jCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNjEN
Cj4gKysrKysrKysrKysrKysrKysrDQo+IMKgLi4uL2V4cGF0L2V4cGF0L0NWRS0yMDIyLTI1MjM2
LTEucGF0Y2jCoMKgwqDCoMKgwqDCoCB8IDExNiArKysrKysrKw0KPiDCoC4uLi9leHBhdC9leHBh
dC9DVkUtMjAyMi0yNTIzNi0yLnBhdGNowqDCoMKgwqDCoMKgwqAgfCAyMzIgKysrKysrKysrKysr
KysrKw0KPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuMi4xMC5iYsKgwqDCoMKg
wqDCoCB8wqDCoCAzICsNCj4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLmluY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0NCj4gwqBzY3JpcHRzL3dpY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDMgKw0KPiDCoDExIGZpbGVzIGNoYW5nZWQsIDY2NyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXNlbGZ0ZXN0L3JlY2lw
ZXMtDQo+IHRlc3QvZ2l0cmVwb3Rlc3QvZ2l0cmVwb3Rlc3QuYmINCj4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgbWV0YS1zZWxmdGVzdC9yZWNpcGVzLQ0KPiB0ZXN0L2dpdHJlcG90ZXN0L2dpdHJlcG90
ZXN0LzAwMDEtdGVzdHBhdGNoLnBhdGNoDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1jb3JlL2V4cGF0L2V4cGF0L0NWRS0yMDIyLQ0KPiAyNTIzNS5wYXRjaA0KPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyMi0yNTIz
Ni0NCj4gMS5wYXRjaA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9l
eHBhdC9leHBhdC9DVkUtMjAyMi0yNTIzNi0NCj4gMi5wYXRjaA0KPiANCj4gDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE2MzQxOCk6DQo+IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTYzNDE4
DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzg5
ODQ2MDEwLzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFs
QGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

