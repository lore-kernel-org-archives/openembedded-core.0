Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.133])
 by mx.groups.io with SMTP id smtpd.web12.18625.1607626081440202188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 10:48:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=Pa95Oirk;
 spf=pass (domain: microsoft.com, ip: 40.107.8.133, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JG5LQfYQpFRbQGM1hQneb96f+kRG/c/mhAzyDHV196e1w64yaBqEgYmApEe91g6fTIKoUeFAtQ8p0TeNQAgONE2I97jdgSkj8gPlmIlyzV1x9t6U49y30e14sY0ccEVSs/FtEuQdnZcHl46lmcSC4WvrvY0Qkol1lolK87VJ/lNro4AgQMJ10Ywcjr42nSr6tCQUiv4rqS8G71awx9IvTnTaV+VGE4KeknhX8HNezgWU33nrDkzj1LL1zwgdnyGlmLM0I/E+3FJeqIMz4jzRT/BMAmQ0jBP0Py4uQUcFtbj1lbfSMuDOcONu7WGIW8lzmGJMX221YLmFu/z+78OiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT5PJCqn1X5Yyy2xe3Gr7AIianOwojVM/2xnPwCC3Ww=;
 b=Cme4OlHA6QQ5ogyQHyCHjwvxYBlIcFBTjSfUmnNkb59vVUtI/1EiyaTtJYXloHEz3jNBlJ6LjIfj5xV+CQxbLornl3G2Lkm5KOHD5XwgVlb0o76AJheoep7IYekWGZw83kIvSljsHPUhKHAzWeXFeOF4Qwf6kr8fg/gRwlfVmQ3DpiCskze1KygveDcvo2ifLu0Gh9qXf6wFa/Jo1vkeSsZrzIY/gobCKIeJn8uSEuHuVd6ku637nsl5n7iIgqhNdz3dsJR+IL572vOwkwI+VCRC2omvUdGOfKiAzoS7IQLK6cOSbk+Gpgzyj9i84Nhr9taPUPIlUU8KOqRSEOhfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jT5PJCqn1X5Yyy2xe3Gr7AIianOwojVM/2xnPwCC3Ww=;
 b=Pa95Oirk5g1fJDELZK/8/DvF/nxibXrxbMXnvAYW/v3Y26LI1QzPY4h9oGpOjfaAd0h6IoJRLAKPY128FfMNuo+3roItVNt1VO5N4ZCkon9lC2WJIKkKN2acxZ6/qcA1HM0tMOZXxEd5oGcXuU5HgNr2waHoioGBop1hFC41K7s=
Received: from (2603:10a6:206:25::31) by
 AM6PR83MB0294.EURPRD83.prod.outlook.com (2603:10a6:209:6f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.5; Thu, 10 Dec 2020 18:47:58 +0000
Received: from AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b]) by AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b%3]) with mapi id 15.20.3676.006; Thu, 10 Dec 2020
 18:47:58 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] util-linux: split uuid in separate recipe to allow bootstrapping
Thread-Topic: [OE-core] [PATCH v3] util-linux: split uuid in separate recipe
 to allow bootstrapping
Thread-Index: AQHWzyT66QyGOeGa10i6GYuxe6xioA==
Date: Thu, 10 Dec 2020 18:47:58 +0000
Message-ID: <f627105e5820b447a8fc4eac9afa980fb080ea4a.camel@microsoft.com>
References: <20191209162419.4343-1-luca.boccassi@gmail.com>
	 <20201123132823.3996355-1-luca.boccassi@gmail.com>
	 <2d012b8dcd17962239264152e6969edda609e16c.camel@linuxfoundation.org>
In-Reply-To: 
 <2d012b8dcd17962239264152e6969edda609e16c.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99a86f70-0e7c-4de9-bd55-08d89d3c1d29
x-ms-traffictypediagnostic: AM6PR83MB0294:
x-microsoft-antispam-prvs: 
 <AM6PR83MB0294C7696988FA05F4F1C274F1CB1@AM6PR83MB0294.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JQLfdiiqyw3EfgzlNSi+ofWd7Egd2Fl6PFgHGTCNQ74aKjQGog/pqGSxvom2oD1ahQbItNUUV0dYfTcAzMfpy+Wx1pAtip0Qgsk9S4PzEo4J1Yt8UINBzbjmDdLHYo6w0KZV1HmcWzdeHnLvlcae/Bchx0eMVVF/6lYtxoLxv8wo/eghg83LSOYGx022F5SLPhDKXotU/q+SORH0JMgIRVYDc4A1x5FrmJH2RcL8OXejhkWA1Wa8lm0mVRjUF+jF53zMObPCjRC5aZIfp4bePLc6SPzYvs0ua5CokLEGqv6tD7ICUcXFgdTGJmXrwniPTI0ULu2v7yq6/C/X8oqEgapqwc8kvb2V1CXIjdZtPuwhLTKVMSCjlTfafx0vxPC42L6tVmVguDL/U0JRWIupKN4CRCuSYXyCQLF85wtcRiPj9glfG7+4cG548C10eyJbFbMnvjknV7EVLoHaSupX2DR+faYkFXoJ4Tm/UcwM/0Us75D0LxTI/0IvPw832zLGhgOkF5AiHdINm1CH2wwFAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR83MB0178.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(5660300002)(4001150100001)(316002)(478600001)(76116006)(64756008)(8936002)(110136005)(71200400001)(36756003)(8676002)(82960400001)(66446008)(2616005)(66946007)(66556008)(186003)(82950400001)(86362001)(66476007)(10290500003)(26005)(6512007)(966005)(6506007)(6486002)(2906002)(83380400001)(20673002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?K3ljZDFoa0V0cE9GWW00Tjc2aHloczFiUkpjWkpydFdCV3NXbXQ3QURNVzJm?=
 =?utf-8?B?VjVyRFJzaWpwN0dNUHJrdWQ3Z3c0MnU4WDNHVmlKQnl2RDBhK1gyRVVwaFlZ?=
 =?utf-8?B?ZnBDYS9BbFFvVTZQZkFucm5zTVk2c0tWNnBEekRUdDlYMTBnRnNBV1FDUmxk?=
 =?utf-8?B?L2ZzMlo4M1lFdVlLMlZ6N1l6V3pGbzdTYUYzZW1RM3JnQmk0MUZQTkNQcFJI?=
 =?utf-8?B?VEMzQ1VGSDZxdVpmYVpvK1VpUTA2MzJjZlJUenhDb0RCL1ZreERYWm1YUUQx?=
 =?utf-8?B?dzVXdDd6WTBkT2RNa3FHbE1SSStHYkZicjNZQVYrWW91cUU2QWw0dTFKMncx?=
 =?utf-8?B?eUo0d2Z0c2xkOGpmMGhhVEdxNFpaZHpDU2tNMUtONUZnNmZRS0JzVC83bVll?=
 =?utf-8?B?U3VhekhpT0JQV3oxYUIrTElMV2ZMQ1l5QmZtTnMvdm9hMUYzZ2FiZTZubVFH?=
 =?utf-8?B?eUZUNlhGTE1SamdXZkFpOE1LSytISU9CNFlMeXIwZ2huZlp1SzZZRkx5QUZQ?=
 =?utf-8?B?NUpEdTNSNFg4S0VaQURFMjY1SEZtUUozbTh1ZmRGaVZkeGQ5NGNKNEZDMVhX?=
 =?utf-8?B?TjBsZ3N1aTJkdEI1V0RiK1hXWXdhblV3enVOTG9HR0U3YWhsYW82S1k1TjJn?=
 =?utf-8?B?c29PZTkxdElvczBvTmY4VjIvQmlWVmU3aVJrUzVNL2haOC8zRkwvWVJYRTlY?=
 =?utf-8?B?dXJGQkFMaFZlWEs4UWdxNG9zTUovU2xnREZRdUNKUlM1T1ovT3JCRkhpNExk?=
 =?utf-8?B?NWI2aWpsanJGdkprK0hkaXRCNFRObmlUYUJkSS8wRTVrMERxR0tSQUZTbjN4?=
 =?utf-8?B?eGlLZ2UvSTFjRy8yTWhUTHBRRFh4TENFSHhWWW05QWpKRXdob1lWZWNJZGNi?=
 =?utf-8?B?bkFWeUFoYURBU01KdUJpdDllK1lTdkRDYUV1dHJHd2xmUGMzcGxmQ1Q1anA0?=
 =?utf-8?B?RW03MlE2cVRkMy9vMnhhcVYwb1BxUURWaEFNZEdrc25OTkdyNi90Q2UraDZu?=
 =?utf-8?B?bEJWSUNQdmR5ZWZWU3AwRnRaN0RnMDM1aFNTVTF5cTZkNWZ3RnNZZDhseDFQ?=
 =?utf-8?B?aVFOTk04UzF4NGhubmw5dzlhTExUWDNQQ0xSaFg3NGZTa2tUQXVSendaTjNZ?=
 =?utf-8?B?bjJEL1d1czZCaHNIM3cxUWlFdCtidWxENTcvN2NTUzVpV2dzM0RFNmpDejhk?=
 =?utf-8?B?a1gyN2R6aWN2alNWTThNSEU5WHliRkFJc1g3VDhvYUtVdGx0VXlhQzg2MFlK?=
 =?utf-8?B?MExsQy9UdkFMYWNYUFVaSHA1VmdhSUgvZ2VZTlhISTRsYlo3c0t2RVRwbWxH?=
 =?utf-8?Q?uRxmjhh7iOD1quMLhr47UiFDMlkQULMNVJ?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR83MB0178.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a86f70-0e7c-4de9-bd55-08d89d3c1d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 18:47:58.4199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7c4+cSsGJDJse65xbbLeX3G4ecjzMgvTG5tPIMB/pBfkFANAXKN9LA5Fj+kwzuzECyLXLH0iday1LsULvX37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR83MB0294
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A13075B8383754DBC5D29B39FE67818@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDE1OjUyICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gTW9uLCAyMDIwLTExLTIzIGF0IDEzOjI4ICswMDAwLCBMdWNhIEJvY2Fzc2kgd3JvdGU6
DQo+ID4gRnJvbTogTHVjYSBCb2NjYXNzaSA8bHVjYS5ib2NjYXNzaUBtaWNyb3NvZnQuY29tPg0K
PiA+IA0KPiA+IEluIHYyLjM1IHV0aWwtbGludXggIGdhaW5lZCBhbiAob3B0aW9uYWwpIGJ1aWxk
DQo+ID4gZGVwZW5kZW5jeSBvbiBsaWJjcnlwdHNldHVwLiBCdXQgbGliY3J5cHRzZXR1cCBidWls
ZC1kZXBlbmRzIG9uDQo+ID4gdXRpbC1saW51eCBmb3IgYmxraWQgKG9wdGlvbmFsLCBjYW4gYmUg
ZGlzYWJsZWQpIGFuZCB1dWlkIChtYW5kYXRvcnkpLg0KPiA+IFNwbGl0IG91dCB1dGlsLWxpbnV4
LXV1aWQgaW4gYSBkaWZmZXJlbnQgcmVjaXBlIHRvIGJyZWFrIHRoZSBjeWNsZS4NCj4gPiANCj4g
PiBBZGQgYSBwYWNrYWdlY29uZmlnIHN3aXRjaCAoZGlzYWJsZWQgYnkgZGVmYXVsdCkgdG8gYWxs
b3cgdXNpbmcgdGhlDQo+ID4gbmV3IGRlcGVuZGVuY3kuDQo+ID4gDQo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL2thcmVsemFrL3V0aWwtbGludXgvcHVsbC84OTgNCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhIEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+DQo+ID4gLS0t
DQo+ID4gdjE6IHV0aWwtbGludXggMi4zNSBpcyBub3Qgb3V0IHlldCwgYnV0IEknZCBsaWtlIHRv
IGdldCB0aGUgcHJlcGFyYXRvcnkgd29yaw0KPiA+ICAgICB1bmRlcndheSBhcyBJJ20gbm90IHN1
cmUgaWYgdGhpcyBpcyB0aGUgYmVzdCBhcHByb2FjaCBvciBpZiB0aGVyZSBhcmUNCj4gPiAgICAg
YWx0ZXJuYXRpdmVzLiBTdWdnZXN0aW9ucyBhbmQgY29tbWVudHMgdmVyeSB3ZWxjb21lLiBUaGFu
a3MhDQo+ID4gdjI6IGNoYW5nZWQgcGFja2FnZXMgbmFtZXMgdG8gcmVmbGVjdCBvbGQgb25lcyAo
ZWc6IGxpYnV1aWQxIC0+IHV0aWwtbGludXgtbGlidXVpZCkNCj4gPiAgICAgYW5kIGxlYXZlIHV1
aWQgYnVpbGQgZW5hYmxlIGluIG1haW4gcmVjaXBlIHRvIGFsbG93IGZvciB1dWlkZ2VuIGJ1aWxk
IHRvIGhhcHBlbiwNCj4gPiAgICAgYXMgaXQgZG9lcyBub3QgaGF2ZSBpdHMgb3duIGF1dG9jb25m
IHN3aXRjaC4gRGVsZXRlIHRoZSBsaWJyYXJ5IG1hbnVhbHkgZnJvbQ0KPiA+ICAgICB0aGUgbWFp
biByZWNpcGUgYWZ0ZXIgYnVpbGQgaW5zdGVhZCwgYW5kIGFkZCBkZXBlbmRlbmN5Lg0KPiA+ICAg
ICBNaWdodCBoZWxwIHRvIGJyZWFrIGxvb3AgcHl0aG9uMyAtPiB1dGlsLWxpbnV4IC0+IGxpYnNl
bGludXggLT4gcHl0aG9uMywgYXMgaXQncw0KPiA+ICAgICBvbmx5IGxpYnV1aWQgdGhhdCBpcyBu
ZWVkZWQsIHNlZSBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy95b2N0by9tZXNzYWdl
LzQ3NTcwDQo+ID4gdjM6IHJlYmFzZWQgYW5kIHJlZmFjdG9yZWQgdG8gaGF2ZSBhIGNvbW1vbiB1
dGlsLWxpbnV4LmluYyBmaWxlDQo+ID4gDQo+IA0KPiBJJ20gYWZyYWlkIHRoaXMgY2F1c2VzIGRv
X3BhY2thZ2VfcWEgZXJyb3JzIGluIGJhc2ljIHRlc3Rpbmc6DQo+IA0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzgzL2J1aWxkcy8xNjY4
DQoNClRoYW5rcywgYWRkZWQgUkRFUEVORFMgaW4gdjQuIFN0cmFuZ2UgdGhhdCB0aG9zZSBkaWRu
J3QgcG9wIHVwIHdoZW4NCmJ1aWxkaW5nIHBva3kgbG9jYWxseSwgSSB1c3VhbGx5IGdldCBRQSB3
YXJuaW5ncyBhcyBleHBlY3RlZC4gQW55dGhpbmcNCmluIGxvY2FsLmNvbmYgdG8gZW5hYmxlIHRv
IGdldCB0aGVtPw0KDQo+IEkgYW0gd29ycmllZCBhYm91dCB0aGlzIGNoYW5nZSBhcyB3ZSdyZSBz
dGFydGluZyB0byBzZWUgYSBudW1iZXIgb2YNCj4gY2lyY3VsYXIgZGVwZW5kZW5jaWVzIGluIHV0
aWwtbGludXggKHRoZXJlIGlzIGEgbmV3IGJ1ZyBhYm91dCB0aGUNCj4gcHlsaWJtb3VudCBQQUNL
QUdFQ09ORklHIG9wdGlvbiB0b28pLCBtYXliZSB3ZSBzaG91bGQgZmxhZyB0aGlzDQo+IHVwc3Ry
ZWFtPw0KPiANCj4gTXVsdGlwbGUgcmVjaXBlcyBsaWtlIHRoaXMgdXN1YWxseSB0dXJuIGludG8g
YSBtYWludGVuYW5jZSBuaWdodG1hcmUNCj4gdW5mb3J0dW5hdGVseSB3aGljaCBpcyBwYXJ0IG9m
IG15IHJlbHVjdGFuY2UgdG8gZ28gaW4gdGhpcyBkaXJlY3Rpb24sDQo+IG5vdCBzdXJlIHdlIGhh
dmUgYW55IGNob2ljZSB0aG91Z2guDQoNCldlbGwgSSd2ZSBhZGRlZCB0aGUgZmVhdHVyZSwgYW5k
IGJvdGggdGhlIG1haW50YWluZXIgYW5kIG15c2VsZiB3ZXJlDQphd2FyZSBvZiB0aGUgaW1wbGlj
YXRpb25zLiBJdCdzIG9wdGlvbmFsLCBzbyBvbiBkaXN0cm9zIHdpdGggbXVsdGktDQpzdGFnZSBi
b290c3RyYXBwaW5nIGZ1bmN0aW9uYWxpdHkgbGlrZSBEZWJpYW4vVWJ1bnR1L1JIRUwvU3VzZS9l
dGMgaXQNCmNhbiBiZSBhdXRvbWF0aWNhbGx5IGRpc2FibGVkIGZvciB0aGUgZmlyc3Qgc3RhZ2Ug
YnVpbGQuIEF0IHJ1bnRpbWUgaXQNCmNhbiBhbHNvIGJlIG9wdGlvbmFsIHZpYSBkbG9wZW4sIGlm
IGRlc2lyZWQgKHZpYSAtLWNvbmZpZ3VyZSBmbGFnKS4NCg0KWW9jdG8gY291bGQgcmVhbGx5IHVz
ZSBtdWx0aSBzdGFnZSBzdXBwb3J0IC0gdGhpcyBpc24ndCB0aGUgZmlyc3QgYW5kDQp3b24ndCBi
ZSB0aGUgbGFzdCBvY2N1cnJlbmNlLiBKdXN0IG15IDJjLi4uDQoNCi0tIA0KS2luZCByZWdhcmRz
LA0KTHVjYSBCb2NjYXNzaQ0K
