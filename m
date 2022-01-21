Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1F4C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:52:05 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.60])
 by mx.groups.io with SMTP id smtpd.web11.10920.1642765922707437664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VjAlOOjf;
 spf=pass (domain: siemens.com, ip: 40.107.2.60,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ric7b3Xu2hOLbZwNHJ3mvLeZ7InYZ2GKuWN7gOjsBije6zLBhiLu8YPf8rI5ry0b5zbjMnrt0hPpBn3PTCHXIBFFjiIUHjF7Wc3/Iu7DqWMdUBhRrJ8ocr9W4nzlt1pQNDe+VGOMleBpo2eAA5nNwoCQUm1mgYoRU9lGdgd9xfqLCWjI96ZQfcgnK3ct34pLdcowdIXKC0tYQzxgJ4O695WCw6QpiQW19FjZMv+Dc6aVxcAclfKvMoTJ7Hqof4L8bZ9L0ZFXarqq3GBWhZgGwbPGd2qri82UYTkq8ygM45wDZpkadp7e73Mh/0loXKrmbYPhxq90XdyQ0ilMK1ugaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIxcGnHFWIg69irowSRAUwZ5m1qGkeuFSQR1XyPVEdI=;
 b=f0HKtFJsrN3Z/YYaWjnZhHNwb5j6kyc1FxhznYopWVzDd7Z/zlciA6snZBA0Dn+icZBFUvHzmIIlaOSey4yTa6cyDiNomQan5v4e2DuN3zUIBXyH3Tig5oN5RhYAspXd77XykrFNC4l7brG+UtffqrYCbEUK00xw2wjTX6X+7srTIJnCSBjS9zZVSYhTgBZ6OJ43yWX3Z/npGiM6O2c/7+uX3rIFE7xcgr92TXUDp+U4r/N8vLxevAq6VFXRqE1SEys4WHEI1VcYsomzYFih2KtgQUk1ScqEoSBJwbR7RhM86jTsRnpb1D+kH/Yc44Sp0SwtFsxs+9L4QLpyBKJ8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIxcGnHFWIg69irowSRAUwZ5m1qGkeuFSQR1XyPVEdI=;
 b=VjAlOOjffoLl+sO+iDcGn72sz05G2T3C9mNr17NEaDGUKEG1Yg8XI7zpsWYASvWlBg9EpEiQBbfI2EuqaRtNJAtk5M+gp/WJ/qCU0UdtuH9yLnSj9nIjzrI4vgcyQhMMukpqn0p8/KkUi20a+kjpLHk4jl0h/wWXtvoG7MY5HtJGNRaHEHSUdQp1MUDf2sZTYhYvqta4Bi/IIKLH9rTcIayPwmMe+lknS3oR9GgBQEitTQ9yotrb7DKzY9LesmllTccPzYkQIoYfafH8kS2Zg8ow3hQ5JjrYhexiRrQWdPlQrVzzfY8ZWind14+rgRGJwNfTcpaOA/ca3FwMsUL7Aw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB2125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 11:51:59 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::111a:bb31:64aa:3088]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::111a:bb31:64aa:3088%4]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 11:51:59 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: qemu tests
Thread-Topic: qemu tests
Thread-Index: AQHYDrqGmM/Pesb4FkOA9KopOwM1a6xtWMuAgAAEVgA=
Date: Fri, 21 Jan 2022 11:51:58 +0000
Message-ID: <ed8f1b5ea65a69ac0d720ab8d54ae095930f3b99.camel@siemens.com>
References: <af147eec110b7964f388fb5f0398042a7310cb90.camel@siemens.com>
	 <8f702dfd93898764fd8eae2e692fa0f5f79639bc.camel@linuxfoundation.org>
In-Reply-To: 
 <8f702dfd93898764fd8eae2e692fa0f5f79639bc.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcf41894-bef2-4ad8-b843-08d9dcd46e40
x-ms-traffictypediagnostic: VI1PR10MB2125:EE_
x-microsoft-antispam-prvs: 
 <VI1PR10MB2125C4FEC05B70235307234F925B9@VI1PR10MB2125.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1btygCkJ+W6oGHBcLGKT8Gkg29Nr2uoNzJrDV6tt45ahM7LhW8XA+BFkwFoSOnIJ2nx7JyLgVUaAY85pqhAEfARlB+4DuacXLIARQDZLEQ8fGf6qCmQExAMX03h5I4IVPGx2PBM7MFSxNb6Y0FuTxQfvqfSouA8Rx8zFhSqd+C+SjLITzV+l9+iUoo0yVBCuL0sQ1XCSu/vNa/dbPpd+e4AL8M8OssBS2j3QSk/H+jhA7+KC/CSfwaRRkDMBAtEmg67NG2YbWCW4Mj1KhT/UGK93JbqqOfMGwA/Pmbd+AY3GLThb+Y0jO1LckVWdWIiPSBW9zsdX756TQk8XdKdwWgk2J+fx1rvLgiSKST+u1nsCMa5DOXW0LkQT9z60zzcPvzFCABhoCx21vdxPCJfOz+QHtcSSI5f+g07O2f2zLUE9kJRzQtWGWVu859NlvYe0UUEgbw4wYlMJNa3cIHYd52nIM+e0WAgU9bzCemqkzJ2Ik8PL2J/F121RK0c4V7B6/TPpSLtS4HGIneVR3Ej5yyELpEQ4UaIr4G4cG1IJDFHiULkVd+sR5QRekzTcNBnif3E0RfRo555mjmNsxcuAMYG4LzK4PXb1SXontpmRXbgrBIdUCFnhk35WAUI3LpsZojJnUGNTLEzj4f/sg3/Byv1v49PZ6ZMOb2hJPJskRejA9FKIvtAjWKCSgS/guqZburAhMOy70RTzHWONxlGG4Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(2906002)(122000001)(38100700002)(3480700007)(66946007)(6486002)(71200400001)(8676002)(66476007)(86362001)(508600001)(2616005)(66446008)(64756008)(91956017)(8936002)(186003)(110136005)(4326008)(26005)(6506007)(7116003)(107886003)(82960400001)(316002)(36756003)(5660300002)(66556008)(6512007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eStEUENDdkxkV29vbWRDT2NKb0RBL1dUOWxWQk85bUxuTWIrMForbms4dUZy?=
 =?utf-8?B?bUY4d1NlcmpoY0hrVVVLUkV3ZzZhSVZjTHVWV1B6dC91aWpCSmNOQ21ETnNX?=
 =?utf-8?B?QWhwb3AxRm1SZC9obkVuTmhuc0grcUNYMFk3ck9pWWUvOGkxK2xuTVhTckxR?=
 =?utf-8?B?RkNuSENlZDB0KzRhNGlrWi9SZmFDWEVsMXRKWFNwd0ZML3NnOGdPRjVNWnZY?=
 =?utf-8?B?RFpEUXJ4S09CWHFqcEdzVmtiZ3hLOCtYQWVIa3hsRmxNcUVrZURIUHlQeFZk?=
 =?utf-8?B?WkJZamZzSTFkYmRRYnpnM05YcGY4QXY5Ny9wandWTVh3aVBTSU15TU0xaS9N?=
 =?utf-8?B?b0VZbmoyRjZjU2hpQ1lMc0JIR25jUGZDeG5WdGdia2FZaDZ0amszaWNKSFNh?=
 =?utf-8?B?VGg2Z1FBbk94UFN1UE1HSTBLb3JOR1NPdkh0R0YzbDVvMFA1TW85QmNIRjV1?=
 =?utf-8?B?K0t2YVA0YmVqMUQwMlJvZlZnQVJjK0x3c3h4UU52R05JSW4vb1c2aWxTVkZO?=
 =?utf-8?B?WjlZdWJZYkpTK3hBUGlUM2g0a0VqZTlxMk1JSmFGcU9zdlIya0hPd29Ra3gx?=
 =?utf-8?B?dlFDQ3JlOC92VXcxQ2hlSmQ5MFdsMnBoem01dEhMMGdDL3Ntc216TWg1b0Zz?=
 =?utf-8?B?SEQ4THIrNWhNYWFURUZoOHYzVXVid1lPdU94K0dNRytkSXZFdlRLUURueFFz?=
 =?utf-8?B?NStmNUVyV3RBck92Nnc2MFpscUdDbmswYUFUa3pXa1VGWkFBa0wxUVVTbElu?=
 =?utf-8?B?ZlVkOHN2ZzIvZEw4dEh0akNmbFZ5NkZ0OC95QTVKS21nUG5CbFh0b1hmREw5?=
 =?utf-8?B?YzkzWkJWczFVV3kzSlBscGkrL0Z0TUU2RWtVZytiOXdpTnl4Ty81N1NwajJ0?=
 =?utf-8?B?cnZhNytOcTY0dEIyQmJra0tYM21jaHJnUjVXb1hhNzNSNVhYSG5vS0l2V3dy?=
 =?utf-8?B?UWx6aEY1aThFQTMzb3VrandIWnRJVnZCQnEwOHdXR25oaG9hUEd0K2NCOFNB?=
 =?utf-8?B?MkN6d0VoMVVLVUtXWHV2azkzTzJZS3AvZElJdTRKcGtTZXB3emtTR3QzeDNP?=
 =?utf-8?B?ZjlTZWt2bWxDekVTb2VMOGIvUHN1a0o5U3ZXb05GVmZSdE1NaUtvMUlVMm5x?=
 =?utf-8?B?UC9OMXRWTWVoa2QzdlltTWhXY0craUszQmRkdUJLWm50MzBZazVUaERSQkRZ?=
 =?utf-8?B?REJmNDlCU3NVTExwb1ZIcHhUTmtjSWpGaDd2ZmsyY0FRVC91eVhMaFZtUE9i?=
 =?utf-8?B?dVVELzFycjk5V2E2Um5IRnB5cXhDNGI4UWR0M1JaQmRqMW9YQ3A1cnFTRmVR?=
 =?utf-8?B?QmZlYk5hNi9rc1FxU1MxaDhQMlhaNHVjenEyQjQ4NmViLzRLWEI3djViejBh?=
 =?utf-8?B?ekJIQllPYmxRSmhlSll6UWdxM0RHeTJNYnVVTU5PK3ZaS0I4OWpvYUxxOThv?=
 =?utf-8?B?dU1sM01WdUs5MXJGTTVraEMwWlk0bGZRUW1MOE5lYXZmRjRFbjJDRDVjZFJv?=
 =?utf-8?B?UTFFU3JNemJReDZJc2txYXA2QStHWm9NM1JKUlFqc0R1QXpmaElrTzVKdDEv?=
 =?utf-8?B?RTI4RDNLbmVGK3VrMXVYSkdOMkdoTnkyRXJ6QndHSWNnVkU0cEFwVk1nTzNq?=
 =?utf-8?B?akN5RlJ0MW43dUtwL1pZOWx5NFI0Rm9xam1DTXlaQmt3RVNBMFdmR1dGUnRt?=
 =?utf-8?B?bHpFU1NHMTI1MSswekprSC9sb1dqZnFoVXAvNEliZ0ZVSVZlanFpVFUwL3VD?=
 =?utf-8?B?aHRLUjY5SENMK1VRVVJBNDJDU28rT2Q3MzZXR1Vvcm9DOC9kMm95MmZYdWto?=
 =?utf-8?B?eEZZb2NJbGZmNTIzNWRQRnpNSkRGS0JvQ2dQdC9oR28zRWNLclFSZHh6eXd6?=
 =?utf-8?B?Vm5VaUdPQjdseFJVUDNvSkhuajVoamlZUlVtMHRxejlrQ25LYThKTEZaSXc1?=
 =?utf-8?B?NFJZYnlFL3NLQkhvNkMrWU1ueDNXMmhtNG1rWXNyZy85NWxHZ2c4aTdHRVg4?=
 =?utf-8?B?c0IvZWxOK2FYUmp4WWdGazBrVUJxTWE5UnllaHlxRTJoL05tbWhYRE5aaC9v?=
 =?utf-8?B?SDZYY1U2dTQ2Yzl3Mm43VXRtUklKRUZZQWJuOVpOYUpLMkRMWVNzaUdGV3dj?=
 =?utf-8?B?ejFPU05zTWpGSU9JQzFLWmhvOGl6UnQraEpsdmRsS2FpQ0I5SEZ6Wm5nMlBn?=
 =?utf-8?B?TSthcENGQWg3bjQ1anFOYmV3WEJCUE9zY2IvR2FrNzNhbGxvOTlXZS95SlI2?=
 =?utf-8?Q?LFp2MRB0trcNMGp2J4RPnGfSF/uodUAwMR1Hp4MbSg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56A2ABFC176A804ABFB5C20BE9DDF3C8@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcf41894-bef2-4ad8-b843-08d9dcd46e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 11:51:58.8673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ikEY+hweQzgVgkY7UCUgRM7tThD7LwvbGluyQf1vWAL6fr1cdFHlE1aWzHZKdKk+CLETSTj4GYLFZ8p9lV+gaCjer+aC2wwpNBOpS2WIhyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 11:52:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160820

SGVsbG8gUmljaGFyZCwNCg0KVGhhbmtzIGZvciB0aGUgcmVzcG9uc2UuIEluIG90aGVyIHdvcmRz
LCB0YWtlIGEgY2FyZSBhYm91dCB5b3VyIG1hY2hpbmUNCmJ5IHlvdXJzZWxmID0+IG5vIG90aGVy
IHBlbmRpbmcgcXVlc3Rpb25zLi4uIDspIC4NCg0KUmVnYXJkcw0KQW5kcmVqDQoNCk9uIEZyaSwg
MjAyMi0wMS0yMSBhdCAxMTozNiArMDAwMCwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+IE9uIEZy
aSwgMjAyMi0wMS0yMSBhdCAxMTozMiArMDAwMCwgVmFsZWssIEFuZHJlaiB3cm90ZToNCj4gPiBI
aSBhbGwsDQo+ID4gDQo+ID4gSSBoYXZlIGEgZ2VuZXJpYyBxdWVzdGlvbiBhYm91dCB0ZXN0aW1h
Z2UgdGFzay4gQ3VycmVudGx5DQo+ID4gJ1RFU1RJTUFHRURFUEVORFM6YXBwZW5kOnFlbXVhbGwg
PSAiIHFlbXUtDQo+ID4gbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QNCj4gPiBxZW11LWhlbHBl
ci1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdCBxZW11LWhlbHBlci0NCj4gPiBuYXRpdmU6ZG9f
YWRkdG9fcmVjaXBlX3N5c3Jvb3QiJyBtZWFucyB0aGF0IG5vIG90aGVyIG1hY2hpbmUgdGhlbg0K
PiA+IHFlbXUqDQo+ID4gaGFzIHRoZSBmZWF0dXJlIGF2YWlsYWJsZS4gU28gd2hlbiAicm1fd29y
ayIgaXMgZW5hYmxlZCBhbmQgJy1jDQo+ID4gdGVzdGltYWdlJyBpcyBnb2luZyB0byBiZSBydW4s
IHRpIGZhaWwsIGJlY2F1c2Ugc3lzcm9vdC1uYXRpdmUNCj4gPiBzdHVmZiBpcw0KPiA+IG5vdCBh
dmFpbGFibGUuIERvZXMgaXQgbWVhbnMsIHRoYXQgSSBoYXZlIHRvIGFkZCB0aGUgdGhvc2UgY29u
dGVudA0KPiA+IHRvDQo+ID4gbXkgbm90LXFlbXUgbWFjaGluZSwgb3IgaXQncyBhIGZlYXR1cmU/
DQo+ID4gDQo+ID4gTWF5YmUgaXQgY291bGQgYmUgdHJhbnNmZXJyZWQgaW50byB2YXJpYWJsZSBs
aWtlOg0KPiA+ICJURVNUSU1BR0VERVBFTkRTX3FlbXUiIGFuZCB0aGVuIEkgY2FuIGl0IGFzc2ln
biB0byBteSBtYWNoaW5lIGFzDQo+ID4gd2VsbC4NCj4gPiANCj4gPiBIb3cgdG8gZGVhbCB3aXRo
IHRoYXQ/DQo+IA0KPiBUaGUgcWVtdSBtYWNoaW5lcyBhcmUgYnkgZGVmaW5pdGlvbiBhYmxlIHRv
IHJ1biB1bmRlciBxZW11IGJ1dCB3ZQ0KPiBoYXZlIG5vIHN1Y2gNCj4gZ3VhcmFudGVlcyBhYm91
dCBhbnkgb3RoZXIgbWFjaGluZS4gSWYgdGhleSBhcmUgYWJsZSB0bywgZXZlbiB0aGVuIHdlDQo+
IGRvbid0IGtub3cNCj4gd2hhdCBkZXBlbmRlbmNpZXMgdGhleSBtaWdodCBoYXZlIGFuZCBpZiB0
aGUgb25lcyBhYm92ZSBhcmUgY29ycmVjdA0KPiBvciBub3QuIA0KPiANCj4gSSBndWVzcyBpdCBj
b3VsZCBiZSBhYnN0cmFjdGVkIGJ1dCBJJ20gbm90IHRocmlsbGVkIGF0IHRoZSBpZGVhLiBUaGUN
Cj4gc3VnZ2VzdGVkDQo+IG5hbWUgYWJvdmUgaXMgY2VydGFpbmx5IGRvZXNuJ3QgbG9vayByaWdo
dCB0byBtZS4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQoNCg==

