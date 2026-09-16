Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2423EC88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 11:40:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12901.1789558798945454797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 04:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MN10ddJa;
 spf=pass (domain: siemens.com, ip: 52.101.66.2, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCdxhmJWSWgZDBttZSNNMnXMIIH4kdsP48at788NaiV43XbbbDXAaj6nff4p4pYtp5HzdAbDxcVz2oRjBoTxHOMioA59Tm4q0pHnKoVIoVooIGro6VaytAktpUy5bA1gOL9+92MuhFpZ2TUSzvvnV0lwItV4nZC5NJJ+n6PGSS7SitDNtc2uFyxj+oniJJNX1Huv7yNqQpgBAOotYrqQEpb7UQxvg8rOOdp7DuY3WmR17JccjEllbY7AfjY7pXCeXj5bBT2gohpBOuOaSXjo0c4AWW/S/ego7qA88uKXTaTViVooN7yflYZOzcnp+IPbeVByQx8iIUj9GvMJFh6oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrFIYC896JjipyzHh+8FBvw56YPTlUyBBNRBXxvMNAc=;
 b=hvXoA+9cEAfy9+01G+JjiRuAa2zgF8+jAtw9LAqys63BtrYLAGcWQ+GIoTvnohX4hMtDQAPfSREW94qFQRgIC/YcOLkEOYpCG0nIajK7WdEmQyG39NomuczTZxCk+/DHl2/Nntw87Oq6ay/uDWkfuWhWKvbvc6N+ZdqRZkcrY3z5RF7UKnIS5Wgctvwv24wTl6ghL8CrjyV1IwnIZLZkMGE8dN79u3XoZa3p+YnyjUy3zVu1EKYxnCDGnPF6d1Ri8yHqn5rDNTgrZdJDc0vpjeKMoQP9VDjMgv+3AvX8Xl/pcpLGziry6sqfRBnHIo5SwzQv+CcSEuyV6U1kOp3pOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrFIYC896JjipyzHh+8FBvw56YPTlUyBBNRBXxvMNAc=;
 b=MN10ddJacd4dK0l2caVitLYvBhijXycqExNd65tEtcfTJoFBWa7YBJ7EkFX3OetxvOq0qzzOc08FUKhul2Jn/1h1O9ViyTVDUXdbvafMPYo8JYIQDkNwjzk7yOob8K+pr0tMa/MhiF/4/9PUEtvdPzj2MeM+gqRoqVZBsfVFuNcOjRNu244hTSEl8iuxhdCdtfsiXaokpzpnOHQOD2TozCE0gF5gJaRaAWYnQUTo4Ry2DQZBw8PJa8Mh0mPoyviACe7Rbv7o0FU8Z8VDFMZcYPH3id9Gkp+KcfJqlCf+i20wRRZfIqRkI1lf5i96gw4emTk+LxUe2lRZHysSRw9wSg==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by AM8PR10MB4002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:39:53 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:39:53 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Haener, Michael"
	<michael.haener@siemens.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "zhanxusheng@xiaomi.com" <zhanxusheng@xiaomi.com>, "Marko, Peter"
	<Peter.Marko@siemens.com>
Subject: Re: [OE-core] [PATCH v3] sstate: fix access to a cached object
 rewriting its modification time
Thread-Topic: [OE-core] [PATCH v3] sstate: fix access to a cached object
 rewriting its modification time
Thread-Index: AQHdQb3eqqO9HCnFbEeDbRRoxfx4MLbQ4MwAgAAH8ICAADP0AA==
Date: Wed, 16 Sep 2026 11:39:53 +0000
Message-ID: <e524024743400d16118921d688ad46c4204d3e60.camel@siemens.com>
References: <20260910211821.48424-1-michael.haener@siemens.com>
			 <20260911070121.39436-1-michael.haener@siemens.com>
		 <14700b98da9c582f0c74951364179b091cb911df.camel@siemens.com>
	 <233a6dcc8a610dd6e09031e619a2437c43b3dfb1.camel@linuxfoundation.org>
In-Reply-To: 
 <233a6dcc8a610dd6e09031e619a2437c43b3dfb1.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|AM8PR10MB4002:EE_
x-ms-office365-filtering-correlation-id: 028b89e2-5791-4516-41ce-08df13e73990
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|55112099003|3023799007;
x-microsoft-antispam-message-info: 
 eyurCdAIjG3mLKB6oC0S0L20+rdnAbbXRPA2YUrRBlj5s6gGIbstfPQITcr/GDdFDnjIQsZIQmBH5NN8R2G1FcqDbd7Ss+hewBazvbslzZOnMHej+aFaMtJJwK/4s4r9cT6kg6ShFaKiWvfAihioBBpS5JEsICD8gOy674z0Ve/AQOL+ZAlq1KtXO4pSpNoK6Yf16Q0gvxToPtj86nOMvxP3OnaqSmBv+UHBagmUMMeuUx2eQDO5ivsWSD7njVawEaPohRgBgWzC7xpvrv+hD+OMWk2Avg6EO1MrNqFa0DyeKuF0bevSpkhsTAuT+Z8R29mAP8GW8WvQQKtrfPObO4WqckZ5mZwaVmYWitAvem1j0I4oe8Fp55h0pZOyiszdHDplKhjjDjap1bQ50Ey9hViKStT9AY79wqivpLX4KjQq7ta6NC5xts96sKYByMXhbEpmh3gNQw8uf2LqvsR2FHDzotzo+IgirNq379bZXZY7V2nBn02JVNfAh21sjc2qHRTyAiMikgF1VF4L+Y0uyiqbMmESR66sAlrOILtVJ1kjtU7t+wehvE5LGp8/5CkycpA9O67P2O70Y0abs9Lhw6j7tUQ+amg+U46INEbFhhfdYtqBcl5Kmm0yzHmdj2hXhD28msYiPD2Fp0bNnHFpbk9bxY8FMoCCnaYIp1mU98rgvmX1Jxguik1NegSzKT4mA2HK+wZM9bxBfTULQtkrt7SwP79kmTUfIkk2REPmea4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(55112099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SXIvcUYybHZQblZnNE9wVTBFNzVsQ3RkcUlYRDUwTHpCZmpjRUNjUllnbHg5?=
 =?utf-8?B?TjhSbndXKzFSZkkvMEd6Rk9zQWNEVjJyOFpqUWpFc3JiOWhQUXVFRzJvaVBC?=
 =?utf-8?B?eHltazZRaTA0Vk9CWWJ3WWwxMm0ycWw2bEE4bmpmcm4xcW1Gbzc3OXFyUkNw?=
 =?utf-8?B?UDc1UEtHK0xsN3JIQzlzWjRoZkIxc3d0dFMrRG5SNlNGSHNNVFlHRFcwY283?=
 =?utf-8?B?TkpHdHFRVHY5bVBSc1lxSStIWitZQzZoM1Q3VXJWb1VJdXkySm1Ec3NNMmh2?=
 =?utf-8?B?VjNnYW9wbUYzcEtDNk9VZkY5VW53alZKSzRXdUprNHBrbEFhb0hhdXpMdjNW?=
 =?utf-8?B?b1pYMm1jcHBuOHFFVXowa2h4aEx1cVJjMEducHVzNGJIc0xNN2ZzREE4cndJ?=
 =?utf-8?B?YnZubmoycnYvMXIzVTRUclhWY3RWVUx0ak5kTWQrVGJNK2lPR1ZXWDNPM2ZI?=
 =?utf-8?B?RWpDTHJ3NzZFb1B0WmFwdU5Zc0Z4QjR5QjliSzhUM2psKzI4QlMxN1dTbjNR?=
 =?utf-8?B?dVBzM0pRQ1EvZGtWY3JaRUpNQklYbUsyUURBWG1IRzFFTmhNZVhMOFE0VlBV?=
 =?utf-8?B?ZE5LblVZcjN3cWhvMlViUnE2OXhhVFFqQ0FVQlVzRGtqWEJGd0kyTTc2ZlVY?=
 =?utf-8?B?dVl6dFY2TVRpSk44dUt6c2hKQ0Q3eXVGSFZ4YS8xenRlaXJsY1pLbEFIVEs1?=
 =?utf-8?B?eFVaZzdBRVp1NTM0YW1lT2NGTHZIb045TXVWeWNYQmxZaXRaWXFiQU9xbkQ5?=
 =?utf-8?B?V3FaMTNtNnVTb0w5YzhUKzhqWWZqNG9udjExSlU0eWVMQ1c3Y3ZFY0JnWjdl?=
 =?utf-8?B?MjBNNG4xR0wzMEgrQy9aK2NySHAyVG5odFJub2VGbDNaKy9LZndwU0NXRHlV?=
 =?utf-8?B?YmQ1Myt1VXliRktHVEJ4a3BIV0xHYjJhUjZrZi9ZR3FIUTZWTUVnS0p0ZlBi?=
 =?utf-8?B?YjhIeXhGTStJQUdKN3A2OUdXa29VSkxXVjU5RWV4U1BJaEN5ejNrOHlLUkZH?=
 =?utf-8?B?TUhiQ0t5eEh5a3hkTC9yWUhUUUhGWjBiaEFBTitQc3grbFd4cXNzVlRFK1Bj?=
 =?utf-8?B?RDRUUVlUWkp4YnFqQ1E0bGk1MGNTN3JkMFcyWng5S0o2NXUycktUZnZpTzhV?=
 =?utf-8?B?M05HYlp6V3VxeFF6cGQ5UDlkOHBCLzdIOVJHUU9VdUtQSjJERTVLb0NwL3RU?=
 =?utf-8?B?bUgzczhxR0YwWlJ2ZFA4ZXNGbjFBUU9VNTFOZ1M4RCsrV3pjaDRCcThDUVF3?=
 =?utf-8?B?NmdPUExRV3NyOUpYRE1zeUJ6N3UvOElLbVNPWlM0Ymp1TUllRlJLeVYxWExu?=
 =?utf-8?B?SERRRCtLdkJveDUydVlmUjM0RENmcEhRNGpGODY0dmg0SzVUMHo3S2ZYRStF?=
 =?utf-8?B?VG5VVHgyTDZ0VTIvWlRYdDNlYjVmZGRNQ2hyaVRaSUt2UGpYUklJZ2FrZElh?=
 =?utf-8?B?VVBrQ2hlb1RITjBweFBxOEYxczNBaTR5QmZQL0lUMDVUM1ZXS3pFbUoyaVpv?=
 =?utf-8?B?emYrY1NRRGpCbkRjMEVTQXIydUxJcEp6bzV5Y0VEVy9LaEhDVUpFelpHSXd1?=
 =?utf-8?B?MUFPSHhkeXh3NVBIVEpRSnBrZWxGSERZZ0pDZ2NlZ2JzaFh5azRRWHFrVkx4?=
 =?utf-8?B?azlsakNoSVRPNHNCQlR5aDYyZzJxTDd5eHp0VlEwUDJaVkNyWGhSNkx1TnRk?=
 =?utf-8?B?TUFUMFhuaGw5NFhkdlArb2JET3RhWW1LTHplZTBkYUxzNVRtMWlxNVNNN25E?=
 =?utf-8?B?T3VrU0NONVJuVWdPVUNvQ1pMa2d0WUJ2QzYwWUY4K1l3MHRuOXdzR056MmdW?=
 =?utf-8?B?K0N0L29jSTVEM1JsVDY4dGtQWmxoTmxsUVhOWHJHdnd0M2svV3dtRUE5MVFx?=
 =?utf-8?B?VWl2VmtrZHF0d3loNmlQckh0aFR5TzFBOS9CN2JzbVVaeWl1RjVxTWNXbWI2?=
 =?utf-8?B?MGpRZndNUlBNYmd0ckNjeFlFbXZZQVdLcmZ6azNRSEtBdnFKcDVTZXVHZDRm?=
 =?utf-8?B?MmZnRXBNME5IVEZKWmNCOFd4bjRGdGtBU2Q1djR5ZTJnb3lYZ3dEbDZua0RY?=
 =?utf-8?B?cFJydWd6aWxJWlFMRjZTbzVqVzZ1V3lnVnQvQTFzTDJtWFhwajYvUlc4ZHIv?=
 =?utf-8?B?amY4WUI3VnZaTXBIZll6MVNCN253c1J3OTVGbW94bXRzQkZSUmdXamZHS1VC?=
 =?utf-8?B?eGh3d2tWSU82K3VsMkNDOVNvai93ckhFckN5QWZ6TzRhZVBTMUtBZlRUbHB1?=
 =?utf-8?B?WW50ek9ENFBsa3o5ZGh0ZG5XZ0haRndTeXFKK1A4d2FrUXIzZ05wVExSb0dn?=
 =?utf-8?B?N1JrdXAvNlZUalFyeC9kdUtsajhZdklkekdqYVBKcUZrMklOTElFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E1926F61CBDD84D8B791B102FBDFD0A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 028b89e2-5791-4516-41ce-08df13e73990
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 11:39:53.3407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4uVi5GqKfuIeRGQP3DxRmd0wne0mlrpdfXqwB3vhnOY9nk9Stx19Sn44VHBOJMmQ1kuRih0+64sZ4BcGtkICv6wvFjfoWg/UOO2D1/8B2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 11:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245952

SGkgUmljaGFyZAoKT24gV2VkLCAyMDI2LTA5LTE2IGF0IDA5OjMzICswMTAwLCBSaWNoYXJkIFB1
cmRpZSB3cm90ZToKPiBPbiBXZWQsIDIwMjYtMDktMTYgYXQgMDg6MDUgKzAwMDAsIEFkcmlhbiBG
cmVpaG9mZXIgdmlhCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiA+IEhpIGV2ZXJ5
b25lLAo+ID4gCj4gPiBUaGFuayB5b3UgZm9yIHRoZSBkaXNjdXNzaW9uIGluIHRoZSBwYXRjaCBy
ZXZpZXcgbWVldGluZy4gQWZ0ZXIKPiA+IGRpc2N1c3NpbmcgdGhpcyBmdXJ0aGVyIHdpdGggTWlj
aGFlbCwgSeKAmW0gcHJvdmlkaW5nIGEgc3VtbWFyeSBvZgo+ID4gdGhlCj4gPiB0ZWNobmljYWwg
ZGV0YWlscyBhbmQgdGhlIHZhcmlvdXMgcGVyc3BlY3RpdmVzIHNoYXJlZDoKPiA+IAo+ID4gwqAq
IFJlbGVhc2UgVGltaW5nOiBHaXZlbiBob3cgY2xvc2Ugd2UgYXJlIHRvIHRoZSBuZXh0IHJlbGVh
c2UsIHdlCj4gPiBoYXZlCj4gPiDCoMKgIGRlY2lkZWQgdG8gcHV0IHRoaXMgcGF0Y2ggc2VyaWVz
IG9uIGhvbGQuIE1vZGlmeWluZyB0aGVzZQo+ID4gY3J1Y2lhbAo+ID4gwqDCoCBsaW5lcyBvZiBj
b2RlIGNhcnJpZXMgYSByaXNrIHRoYXQgaXMgbm90IGZlYXNpYmxlIGF0IHRoaXMgc3RhZ2UuCj4g
PiBXZQo+ID4gwqDCoCB3aWxsIHJldmlzaXQgdGhlIGltcGxlbWVudGF0aW9uIGFuZCB0aW1pbmcg
aW1tZWRpYXRlbHkgYWZ0ZXIgdGhlCj4gPiDCoMKgIHJlbGVhc2UuCj4gPiDCoCogQXJjaGl0ZWN0
dXJhbCBHb2FsICYgQ2FjaGUgTWFuYWdlbWVudDogT3VyIHByaW1hcnkgb2JqZWN0aXZlIGlzCj4g
PiB0bwo+ID4gwqDCoCBtb3ZlIHRvd2FyZCBzdGFuZGFyZCBtdGltZSBhbmQgYXRpbWUgYmVoYXZp
b3IuIEN1cnJlbnRseSwgbm9uLQo+ID4gwqDCoCBzdGFuZGFyZCB1c2FnZSBtYWtlcyBpdCBkaWZm
aWN1bHQgZm9yIGRpZmZlcmVudCBlbnZpcm9ubWVudHMgdG8KPiA+IMKgwqAgaW50ZXJhY3Qgd2l0
aCB0aGUgY2FjaGUgYXMgZXhwZWN0ZWQuIEFkaGVyaW5nIHRvIHN0YW5kYXJkCj4gPiBiZWhhdmlv
cgo+ID4gwqDCoCBhbGxvd3MgZm9yIGJldHRlciBjYWNoZSBtYW5hZ2VtZW50LCBhcyBpdCBmb3Ig
ZXhhbXBsZSBwcm92aWRlcwo+ID4gdGhlCj4gPiDCoMKgIG5lY2Vzc2FyeSB0ZWxlbWV0cnkgdG8g
aWRlbnRpZnkgb2JqZWN0cyB0aGF0IGFyZSAib2xkIiBidXQgc3RpbGwKPiA+IMKgwqAgYWN0aXZl
bHkgImluIHVzZS4iCj4gPiDCoCogV2Ugd2lsbCBoYXZlIGEgbG9vayBhIHRoZSBzc3RhdGUtY2Fj
aGUtbWFuYWdlbWVudC5weSBzY3JpcHQgYW5kCj4gPiDCoMKgIGNoZWNrIGlmIHRoZSBzY3JpcHQg
Y2FuIGJlIGV4dGVuZGVkIHdpdGggc29tZSBwcnVuZSBmZWF0dXJlcwo+ID4gd2hpY2gKPiA+IMKg
wqAgd2UgbmVlZCBvbiBvdXIgaW5mcmFzdHJ1Y3R1cmUuCj4gPiAKPiA+IEZvbGxvdy11cCBEaXNj
dXNzaW9uOiBXZSBhbHNvIHJlY29nbml6ZSB0aGUgc3BlY2lmaWMgcGVyZm9ybWFuY2UKPiA+IGNo
YWxsZW5nZXMgd2l0aCBLdWJlcm5ldGVzIENlcGhGUyAocGFydGljdWxhcmx5IHRoZSBzZXJ2ZXIt
c2lkZQo+ID4gcHJvcGFnYXRpb24gb2YgYXRpbWUgY2hhbmdlcykuIFdoaWxlIHRoaXMgaXMgYSBr
ZXkgZHJpdmVyIGZvciB0aGVzZQo+ID4gaW1wcm92ZW1lbnRzLCB3ZSB3aWxsIGFkZHJlc3MgdGhl
IHNwZWNpZmljIENlcGhGUyBvcHRpbWl6YXRpb25zIGFuZAo+ID4gcmVsYXRlZCBwZXJmb3JtYW5j
ZSBpbXBhY3RzIGluIGEgZm9sbG93LXVwIGRpc2N1c3Npb24gYW5kIGRlZGljYXRlZAo+ID4gZGlz
Y3Vzc2lvbiB0byBrZWVwIHRoZSBjdXJyZW50IGFyY2hpdGVjdHVyYWwgY2hhbmdlcyBmb2N1c2Vk
Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIHN1bW1hcnkgQWRyaWFuLgo+IAo+IEp1c3QgdG8gZXhwYW5k
IG9uIGEgY291cGxlIG9mIGRldGFpbHM6Cj4gCj4gKiBJIGRpZCByZWNlbnRseSBjaGFuZ2Ugc29t
ZSBvZiB0aGlzIGNvZGUgd2l0aCB0aGUgaW50ZW50aW9uIG9mCj4gwqAgbWFraW5nwqBpdCBjb25z
aXN0ZW50IHdpdGggYXRpbWUsIG10aW1lLCBmaWxlIGV4dGVuc2lvbnMgYW5kwqAKPiDCoCBzeW1s
aW5rcy7CoFRoZSBwcmV2aW91cyB2ZXJzaW9uIHdhcyBhIGhvcnJpYmxlIG1peCBvZsKgCj4gwqAg
ZGlmZmVyZW50wqBiZWhhdmlvdXJzIGFuZCBzc3RhdGXCoGNhY2hlwqBtYW5hZ2VtZW50IHdhcyBz
dHJ1Z2dsaW5nIGFzwqAKPiDCoCBhwqByZXN1bHQuIFRoaXMgd2FzIGxpa2VseSBhwqBjYXVzZcKg
b2Ygc29tZSBpbnRlcm1pdHRlbnQgQUIgZmFpbHVyZXMuCgpTb21lIHRpbWUgYWdvLCBNaWNoYWVs
IGNhbWUgdG8gdGhlIGV4YWN0IHNhbWUgY29uY2x1c2lvbiBhcyB5b3UKcmVnYXJkaW5nIHRoaXMg
cGF0Y2gsIGJ1dCB5b3Ugd2VyZSBxdWlja2VyIHRvIHRoZQpsaXN0IcKgaHR0cHM6Ly9naXQub3Bl
bmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQvP2lkPWNjMDc4OTVmOTUxMTQw
ZGJiZmZjZjMyZDNlYWJmNjU3ODhjYzRkMDAKVG8gbWUsIHRoaXMgaXMgYSBncmVhdCBzaWduIHRo
YXQgd2XigJlyZSB3b3JraW5nIHRvd2FyZCB0aGUgc2FtZSBnb2FsIGFuZApzaGFyZSBhIGNvbW1v
biB1bmRlcnN0YW5kaW5nLiA6LSkKCk9uZSBwb2ludCB3ZSBhcmUgc3RpbGwgbG9va2luZyB0byBj
bGFyaWZ5LCBob3dldmVyLCBpcyB0aGUgcmVhc29uaW5nCmJlaGluZCB3cml0aW5nIHRvIG10aW1l
IHdoZW4gYSByZWFkIGFjY2VzcyBvY2N1cnMuIEFjY29yZGluZyB0bwpzdGFuZGFyZHMsIHRoaXMg
c2hvdWxkIGJlIGhhbmRsZWQgdmlhIGF0aW1lIChwcm92aWRlZCB0aGUgc3N0YXRlCmRpcmVjdG9y
eSBpcyBtb3VudGVkIHdpdGggLW8gYXRpbWUpLiBJbiBtb3N0IGNhc2VzLCAtbyByZWxhdGltZSBp
cyBldmVuCnN1ZmZpY2llbnQgYW5kIGxlc3MgY29zdGx5LiBXZeKAmWQgYXJndWUgdGhhdCBhbiBO
RlMrWkZTIHNlcnZlciBzZXR1cApzaG91bGQgd29yayBwZXJmZWN0bHkgZmluZSB3aXRoIHN0YW5k
YXJkIGF0aW1lIGFuZCBtdGltZSB1cGRhdGVzIG9uIHRoZQpZb2N0byBzaWRlLgoKPiAqIFdoaWxz
dCB0aGlzIG1heSBpbXByb3ZlIGNlcGhmcywgd2UncmUgd29ycmllZCBhYm91dCBob3cgdGhpc8Kg
Cj4gwqAgbWF5wqBpbnRlcmFjdCB3aXRoIHpmcytORlMgb3IgZXh0KitORlMgYW5kIHRoZSBwb3Nz
aWJpbGl0eSBvZgo+IMKgIG5vYXRpbWUsIGxpbWl0ZWQgKHJlKXdyaXRlIGFjY2Vzc8KgYW5kIG90
aGVyIG1vdW50IG9wdGlvbnMuCj4gCldlIGNhbiBsZWF2ZSBDZXBoIGFuZCBvdGhlciBjbHVzdGVy
IGZpbGVzeXN0ZW1zIGZvciBhIHNlcGFyYXRlIGZvbGxvdy0KdXAgZGlzY3Vzc2lvbi4gT3VyIGlt
bWVkaWF0ZSBnb2FsIGlzIHRvIGltcHJvdmUgc3N0YXRlLmJiY2xhc3MgaW4KZ2VuZXJhbDsgbW92
aW5nIHRvd2FyZCBzdGFuZGFyZC1jb21wbGlhbnQgYmVoYXZpb3Igc2hvdWxkIG5hdHVyYWxseQpi
ZW5lZml0IE5GUywgYnV0IGFsc28gQ2VwaCBpbiB0aGUgbG9uZyBydW4uCgpIb3dldmVyLCBjbHVz
dGVyIGZpbGVzeXN0ZW1zIGludHJvZHVjZSB1bmlxdWUgY2hhbGxlbmdlczogYXRpbWUgbXVzdCBi
ZQpoYW5kbGVkIGNhcmVmdWxseSBvbiB0aGUgY2xpZW50IHNpZGUgdG8gYXZvaWQgdGhlIG1hc3Np
dmUgb3ZlcmhlYWQgb2YKc3luY2hyb25pemluZyBtZXRhZGF0YSBhY3Jvc3MgYWxsIG5vZGVzLiBJ
biBjb250cmFzdCwgYSBzaW1wbGUgc2luZ2xlLQpub2RlIGZpbGVzeXN0ZW0gY2FuIGFmZm9yZCB0
byBiZSBtb3JlICJyZWxheGVkLCIgcG90ZW50aWFsbHkgZHJvcHBpbmcKb3IgZGVmZXJyaW5nIG1l
dGFkYXRhIHVwZGF0ZXMgYXQgdmFyaW91cyBwb2ludHMgaW4gdGhlIGNoYWluIGZyb20gdGhlCmFw
cGxpY2F0aW9uIHRvIHRoZSBwaHlzaWNhbCBtZWRpdW0uCgpEbyB5b3UgdGhpbmsgc3N0YXRlLmJi
Y2xhc3Mgc2hvdWxkIHN0aWNrIHRvIHRvdWNoaW5nIGJvdGggbXRpbWUgYW5kCmF0aW1lLCBvciBk
byB5b3UgYWdyZWUgdGhhdCBtb3ZpbmcgdG93YXJkIGF0aW1lIG9ubHkgZm9yIGNhY2hlCm1hbmFn
ZW1lbnQgd291bGQgYmUgdGhlIHJpZ2h0IG5leHQgc3RlcCBmb3IgYmFyZS1tZXRhbCBhbmQgTkZT
CmZpbGVzeXN0ZW1zPwoKVGhhbmsgeW91LgpBZHJpYW4KCj4gV2UgZG8gbGltaXQgdGhlIGFyZWFz
IHdlIGludGVyYWN0IHdpdGggc2hhcmVkIGRhdGEgdXNhZ2UgYnV0IHRoaXMgaXMKPiBvbmUgb2Yg
dGhlIGFyZWFzIHdlIGRvIGFuZCB3ZSBuZWVkIHRvIGJlIGNhcmVmdWwgYWJvdXQgY2hhbmdlcyBo
ZXJlCj4gYXMKPiBhIHJlc3VsdC4KPiAKPiBDaGVlcnMsCj4gCj4gUmljaGFyZAo+IAo=

