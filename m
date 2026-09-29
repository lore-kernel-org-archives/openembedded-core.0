Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35045CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2012.1790663794901288703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=Epr9cFMH;
 spf=pass (domain: ericsson.com, ip: 52.101.83.5, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbn8Mgd8jFSGsNrpC/h51ulSmmHUNpqV/1nZoDbxLgYGsGQfUes1vAtiV+kqhcY8XZ2EEp4tWeOhwbCXzXcgRm6gTpNmYEtSE9kkGl6l8hXzHNCy1FU3KZ1qeihmC6RHYwxol6i67czVznVw36yYWYoleuYxRriyZeqr+Kt3FHntC1VNkBgUf8IcuE4YDUPvvB3LRzBaa8whdttst4UBPA52wXqusobB4Y4qtFvVSOR8XR5o4kvs9C061ZxnAaihXrX5o8yTaf0yo4G9LBrfKezxf0E9PtG7exxkzBjbxWBILagP1m3BOErFmTaWGiQSVydhCQjq3QKHVuH4PspmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqnade3kEL69gATZZpiSefzEMbzkQOu7u/lSTWXboBE=;
 b=UBp/Kcr+W8VGlUiMpMF6iITv/06b6QSz0X4dYurYF3EzBMsd5je9BS5ddpYqBEmvcXD0Ga1kK0BQmy0cj/YDU4P+fCvAgpsHTMTtcoHjEDWP5PKU6Vt43HXNWqhr/XcQG3GDPtIjqFyBMgKkMrVYdnDio8z00+UnBq9Oi7g3n0MT1kH7lIY4O6g4Avz2RMPjnyS+YOYOm1wuNBI0sc/UcRZ+0/XmCEw0blDl4ySKvECcTDnw5ncbtllaaEj8g5VX0wL7DHxGJF8rJZzPkQlZU/fSED3UMQzL532KhyQWb6oKxn50koeqj/ziu32DrtPK+O5U5gqMgpyCyNb9U+K9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqnade3kEL69gATZZpiSefzEMbzkQOu7u/lSTWXboBE=;
 b=Epr9cFMHVBsFcv3mc5Yu+YGKbquuHqMd7wcxzSxywA8sivJMuFVdwHLFI32DKGVYo3qe0P8z0fEfT9wiHs2vJ+UlbVs5/csByRnBNNl4AY3WxhDn83cbgJohcrPfGvSskYD6/9KvGZErz/Ohfqee9Dea9PW2ah42/rjxpQcDNL7vLhAkR7ih2vSWbBg2qaCB49AKI02ifNpfuag4AW/Sp99KDj5zY5XcmM/+3GtiCz6yyRVS/srVVn7nG9vE2ePRfqLG0QaIyfPjlUhmHx+q8VmDEFkde3zYl4hU/cG0W+cXJ28ieyLZPJg/RbHslQI52O1LXaf3ZR7OTsBUqnLRtQ==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by DBAPR07MB6823.eurprd07.prod.outlook.com (2603:10a6:10:193::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 06:36:29 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 06:36:29 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 0/3] spdx: add support to include releaseTime
Thread-Topic: [OE-core] [PATCH v3 0/3] spdx: add support to include
 releaseTime
Thread-Index: AQHdT3wm7BMuD6y8Fk2fC+yOq8qgOrblFRQAgAAFqgA=
Date: Tue, 29 Sep 2026 06:36:29 +0000
Message-ID: <78a4f1dec2b36a9f7df7a81d1ddb8f1226624283.camel@ericsson.com>
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
	 <DLRKWLFNOLML.3NT9JU6NO87KG@smile.fr>
In-Reply-To: <DLRKWLFNOLML.3NT9JU6NO87KG@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|DBAPR07MB6823:EE_
x-ms-office365-filtering-correlation-id: 58f450eb-9036-4ed3-1828-08df1df3fea8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10070799003|38070700021|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|3023799007|4133799003;
x-microsoft-antispam-message-info: 
 PswzWy8ko4fU5wYhKgwWzqnObnwn8GUG8Jwk7JO/oL5VyexRkPKU+StdT6/+7CtprZExVvKBxTH7iSWu+/3H4/O3LgTo3PINCwXAGHGKvKSFbzeqdplxRHMZlzRlyOjIiKteli992hrlCHB5QBqNq8RdToBRMh44Tx38Se94RIaRU27IlaBFGUDObsiuLitxyqJWQtiiokpkgHfsg4KcYltaG4VaNt/HZuCjlqGoEoLoN0Et3aG2GB9hdoXq8xXf6GDZJQkJ3vZDw77uC9e9XWttP2hnnfpwvweZfHPILxZW6sPW+nq4OUuwosg0MYqeFb6+3mULoBUt4VIotprHNJARsXLF0TvDJOe1MsHmssfITc4kW3OlJdeZLa8MpyIvPz5iefQAzXtbZVc8Dq74UaRVE4isP/EqTWubtJWlfUKTMbwiA5wvHa+6vVSgkH/yiJxzQhktZHy6haVfMl13P6TcCAvsf8Mgu1u0UDUPq4AGypD1rd10s7Pfe6Lfm1sXVKAUKj6AlA/pC4UQMmFHyVFSzoQRPt8t478vKxTErY24wgOvXo19VyHpa52RcrmzBiYombpGI5NObTvAz+9gibPuVnAkgzD5+vTfjQENBax9RZ3yyaMfl0tosejdevcugWm+XE2kaE//UQpKMaIxaailuPuYFqn4Sky9X/NRD4M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10070799003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007)(4133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SlhRTFRvVzl2QzhqNTdMTEpYQVo5YVVzNG9qYUdqcUE4S3huT09XVVNMU1BO?=
 =?utf-8?B?MFNDNTM2VEkrYTYrTWpUallkME1rM2RMaEw3MTVZUVEwamxpOUZUSVdDTUlJ?=
 =?utf-8?B?UlBVb2Zxc05nSVVkaGZ2dWxhbitoNGJ3bzhuMHR2Y2lwMklMZk5jcStvQWlL?=
 =?utf-8?B?eGhwU2NZNXpVa3FYQngvTlJPMnd3YW84N0pHZzZGMzc1WTh5bFhwUkhuSXZj?=
 =?utf-8?B?bFVMS2tNMHNjOEQyUlJid3JRY000NkVRaHZVdnNJUnA5bXIvNzV6WFRJVTZu?=
 =?utf-8?B?Ym12VkEzOW11NHUrV0NodUN2ZjBtV1M3bFBuOUExb2RnNDFpOHpIWGRGejNF?=
 =?utf-8?B?cWRua1dacFZ6amo5ZlBjdzN6Ti9kQlF0WUgwbERjU2IvVkdkWVF2aVVNaXBC?=
 =?utf-8?B?MFZ0OWY5N2JvODR4ODRFTlR6WXJNM2JEaFUrQXM3YThyMk5ZOVIvMXB1cmkx?=
 =?utf-8?B?T1h3azdrR0JwSnV2WjVMVmF1UGJURTZwaVZ3WGx2OCtQZ1Q3MFptUjBYSlA3?=
 =?utf-8?B?bEFhSHpHbm1RUGxacCtLV2VKQ3M0TEZUNWFpRFF5V25tYmVvdkZzYklrb2di?=
 =?utf-8?B?Mnc3Q2xDWEVDaU5NNVF4dE8xOWxZNVlCQVpoOWVkclA4YXV6T21aMWJBVmV4?=
 =?utf-8?B?Tktpa0w3SVNRaEloYmVndXU3TjBWWGhwY2w1SC9hbjl2ait2SFpJeldZYWgz?=
 =?utf-8?B?STFXTDNYUlA4K2xmQlJUT3Vwa0tQa3FXZXNjVW9JTlUrc2xJc2hvN0hBNGRM?=
 =?utf-8?B?N20vNEVYOUFBd3dkVkdkK0oyODl6OUZRSm41TC9TNkFyL2lyaFIvNllCQWlJ?=
 =?utf-8?B?Z28zaGFtdjVmY0FOQ1RIS0F3emZobXBtR3pIbzEzZVRJQ09vb3hlSmJuMWlw?=
 =?utf-8?B?WnA0V1FQaHZMTGRUb3hlYjhzNS82K2MvRFZ0Qys4MTF6UHJ1Tkd3K1ZUR3hF?=
 =?utf-8?B?Y3JFMU1YVUcyVzNXT29mcjVXTDA1Yi9Zdlp2ZjhPOVpVQlRaT2FyMGxZWUhJ?=
 =?utf-8?B?aVJMeCsxMXkxUXlrOHltcFcvOSt6QS8yUU13TW5JZnpraXQ2Y253b3BoK3Vl?=
 =?utf-8?B?cC9TeHIzcVZXQTIreUVBUmtPc2U0bCtHNUdsMkg2TTl6Y2plUVFrR0JqczFG?=
 =?utf-8?B?ZEJBNGluNUtwQUVoS0FYSGlOVHhqR2RiMllONEJCbWduTTlBMGsvaTgvcjVR?=
 =?utf-8?B?WE45N2hlYktmczNSSkxKSTVwQ2hsQmZ1N0Q3ci84WC9HSGtybXpiWDU0dk45?=
 =?utf-8?B?MEZDWnArS0hpSEFGYlJsSUMwUnFEZ0JPTXJ4ZllBTHFPa0dETDNhNVkwLytB?=
 =?utf-8?B?MUxjN0VSMndUMlMvdnFNSE0vYXB0Nlk4YWxVWG5MZThsdVJkT3ZQV2NVcjZn?=
 =?utf-8?B?c203QVFFVnhrWGRubkZsb21FbW5LTDg0WUNVNjRsRmZLLytEZUY3WHBJUUdn?=
 =?utf-8?B?ZEorRmFnM2F5RzFCMHZkTklUSFNFRHFqMEFOazNRUlpHb3FqanV1UXVuUXpo?=
 =?utf-8?B?SFlTZm5USUhhdVpWRVhmcHVJVFRSckh2dDF2dHlwanYycVZueGtucVd2dUho?=
 =?utf-8?B?QzJGN3lVT3N1NWNKb2ZDTGROY0lGMzZBU3djL1dmU2U2R0pyQVdYSjdTbVI2?=
 =?utf-8?B?QWUyNUp3SUJTbHZ3ZE80MEdQL21sZCs3bk5yZGszdUNKM1NXVXFRcHZKejZG?=
 =?utf-8?B?ZHZLbjQ1R2hMakVBN1h6VngrdGk0RHJrRHNNQVBtaldMNHlRbjljYzJjOTla?=
 =?utf-8?B?VzZiY2hxVVlNUEovdkQ0ZWNiZTUxcWQvU1JpZWVWa09xcUNYQndINGxtbkdV?=
 =?utf-8?B?MWhlREM5VWhWc0JyeSsyL3E5aG1QMXcvZ1F4SXJFQTRJMHB3cTE5RHdqRlBQ?=
 =?utf-8?B?NUpVOFhUTUZpd0JGdmRQdEF4MWVhVnFLSnFTMDcvTFFySEp6cUc5QVdVU3NH?=
 =?utf-8?B?TWN0bFNZaEp3aHF0M0NGY1BMQ1Q5dFY5Sm42OHEwdnNRazJyajRCMGpMVE9W?=
 =?utf-8?B?T2MrZ1BYMTZzNmxrVW0vV0tkeXcxemF3eis4UGtyQ1kwOFVoUFlNU0JTRkIv?=
 =?utf-8?B?UTZnRDJrZ0JFODRvQnVxS1BrNW5vNG56VHgvUWNTbzdlejJqUEVhd2hyT0l3?=
 =?utf-8?B?WTVJUGF6ZlYrMUJNc25YUHdjYUFyemoycmEvZ1BTMlQ1akE3b2FEN3hSV2Ir?=
 =?utf-8?B?NmFKZzBmV1NMS0lsL29OMWg2SzN5R1FHTWR5R1U5cGxJSS9sVm5oaGpNdFhV?=
 =?utf-8?B?YzUyR21jSkxXNVRCbHk3R1p1WDAzVzNwaHg2NEtvcENYck5EQk95VWY1cGo2?=
 =?utf-8?B?Z0tHM3BTcGNlYjZOOXdDRVM0eGY3a2xPL0FobStFU2ZwWWlKQkNSbmxCNEhW?=
 =?utf-8?Q?Fmwo+rdilBobD1z+2KJff5b17+vFUZ1jx8XZClof9kYpU?=
x-ms-exchange-antispam-messagedata-1: AaSij4DV+rWBJFCI8uzkHHe5rqwX0oaT2lg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C84754AF7939443ABC955F879BF2D65@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f450eb-9036-4ed3-1828-08df1df3fea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 06:36:29.6026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ttLiX0yN/3liRP0Bk3Gtl/3bD0FIRCOCyC23LP0J6YGalAaUsxI6uPR3lbaLgdpIkquKmICjV6q5GYgpo1frdm42E32537yoOcmWv8/ASo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6823
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246844

T24gVHVlLCAyMDI2LTA5LTI5IGF0IDA4OjE2ICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IE9uIE1vbiBTZXAgMjgsIDIwMjYgYXQgOTowMyBQTSBDRVNULCBEYW5pZWwgVHVydWxsIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IERhbmllbCBUdXJ1bGwgPGRh
bmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+DQo+ID4gV2UgaGF2ZSBhIHJlcXVpcmVtZW50
cyB0byBpbmNsdWRlIHJlbGVhc2UgdGltZSBvZiBvcGVuIHNvdXJjZSBjb21wb25lbnRzDQo+ID4g
aW4gdGhlIFNCT00uIFRoZXJlIGlzIGEgZmllbGQgc3BlY2lmaWMgZm9yIHRoYXQgaW4gc3BkeCAz
IHNwZWMuDQo+ID4NCj4gPiBodHRwczovL3NwZHguZ2l0aHViLmlvL3NwZHgtc3BlYy92My4wLjEv
bW9kZWwvQ29yZS9Qcm9wZXJ0aWVzL3JlbGVhc2VUaW1lLw0KPiA+DQo+ID4gVGhpcyBjYW4gYWxz
byBiZSB1c2VkIHRvIGV2YWx1YXRlIGhvdyBvbGQgYXJlIHNvbWUgb2YgdGhlIGNvcmUNCj4gPiBj
b21wb25lbnRzIGFuZCBkZWNpZGUgaWYgdGhleSBuZWVkIHJlcGxhY2VtZW50Lg0KPiA+DQo+ID4g
VGhlIHByZXZpb3VzIDIgdmVyc2lvbnMgZGlkIG5vdCBoYXZlIGNvdmVyIGxldHRlci4NCj4gPg0K
PiA+IFRlc3RlZCB3aXRoIG9lLXNlbGZ0ZXN0IC1yIHNwZHgNCj4gPg0KPiA+IERhbmllbCBUdXJ1
bGwgKDMpOg0KPiA+ICAgY2xhc3Nlcy9iYXNlOiBleGNsdWRlIF9fQ0FDSEVEX1NPVVJDRV9EQVRF
X0VQT0NIIGZyb20gdGFzayBoYXNoDQo+ID4gICBjcmVhdGUtc3BkeC0zLjA6IHJlY29yZCBjb21w
b25lbnQgcmVsZWFzZSBkYXRlIGluIFNQRFggb3V0cHV0DQo+ID4gICBzY3JpcHRzL2NvbnRyaWI6
IGFkZCBzcGR4LXJlbGVhc2UtZGF0ZS1yZXBvcnQucHkNCj4gPg0KPiA+ICBtZXRhL2NsYXNzZXMt
Z2xvYmFsL2Jhc2UuYmJjbGFzcyAgICAgICAgICAgIHwgICA0ICsNCj4gPiAgbWV0YS9jbGFzc2Vz
L2NyZWF0ZS1zcGR4LTMuMC5iYmNsYXNzICAgICAgICB8ICAgMiArLQ0KPiA+ICBtZXRhL2xpYi9v
ZS9zcGR4MzBfdGFza3MucHkgICAgICAgICAgICAgICAgIHwgIDE5ICsrDQo+ID4gIG1ldGEvbGli
L29lcWEvc2VsZnRlc3QvY2FzZXMvc3BkeC5weSAgICAgICAgfCAgMzkgKysrKw0KPiA+ICBzY3Jp
cHRzL2NvbnRyaWIvc3BkeC1yZWxlYXNlLWRhdGUtcmVwb3J0LnB5IHwgMTkzICsrKysrKysrKysr
KysrKysrKysrDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMjU2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNzU1IHNjcmlwdHMvY29udHJpYi9zcGR4LXJl
bGVhc2UtZGF0ZS1yZXBvcnQucHkNCj4NCj4gSGVsbG8sDQo+DQo+IE5vdGU6IHdoaWxlIHRoaXMg
aXMgbm90IGEgZml4LCB0aGlzIGxvb2tzIHJlbGF0ZWQgdG8NCj4gaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNTUzMA0KPg0KPiBUaGFua3MhDQoNClRo
YW5rcyBmb3IgdGhlIHBvaW50ZXIgWW9hbm4uIEknbGwgdGFrZSBhIGxvb2sgaWYgSSBjYW4gZG8g
c29tZXRoaW5nIHdpdGggdGhlDQp0aWNrZXQgb25jZSBJIGhhdmUgdGhlIGN1cnJlbnQgc2VyaWVz
IHJpZ2h0Lg0KRGVmaW5pdGVseSB0aGUgdGlja2V0IGlzIGdvaW5nIGluIHRoYXQgZGlyZWN0aW9u
IHRoYXQgSSB3YXMgdGhpbmtpbmcuDQoNCkRhbmllbA0KDQo=

