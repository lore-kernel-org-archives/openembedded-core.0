Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9D3C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 15:32:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.10])
 by mx.groups.io with SMTP id smtpd.web11.101147.1723649547018312150
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 08:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=VaQkyy1T;
 spf=pass (domain: axis.com, ip: 52.101.69.10, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imHl2SAQfcYXZ2gKQvduc7wVA77O0abLSPGrpKllLZtm4xZzsk/a8QwcuybY+O+aIU607XHVgutqzUQG+zUDuYKNuwNTQ2dyoNWgXwTjhPCSfIhUpHJD6xbvPhi6dC+wNaLYnY6FO71OSEob0uOyNTrATZyMaJwYWQwV4VAMEB6GlxJ9uuRuvma02P2bUpLoB8FSH9v0pf2qsbHsN8OGVOEwoKN6Y0dKbWN5YHzP/hAGjByAzK3GGHtFbPhbUBwA+qROfBuMlpWoI7Yomaln50UoSHqmeI91Qo9YLaugQreZKYtGeMDP+hxqTu2s5NnQev4T1kW9l4RNmmSf5dMA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn97azdex3eoTmYmtfyTOhQQtYhnaF19Gu3A2Aw9cS4=;
 b=ux2cyQ5cN6rlF31fBbjcQnPQ9NWYfcNdx9KiRvwJ2lwpxU0nKR/tEW2B2wGeGqsbd4n09K1n7xf/8Lat+lJhRDKVWHWS79hPE2dwUEVkEWBxw8H9hY89m+bP3YgyShB+RjkZ+VSr6N03IF1QohINOkp/hPhUUG8Ka+Y06FNuwj8RYZfk+flclFmEQVhfKhV0/k8yfh8AwbsZPK/A1e/qqZobBJg/xldJmoVSGYEbJOe8xE6UelK53GSVC7xkUf0OU6fINGE1aMhMkhjI31JwUv/WWmCG+0KtfRCESusMjxjNt4UaSZ2ZWEO4VDFRnFLEcgz+CmI942XPGai5sjshGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn97azdex3eoTmYmtfyTOhQQtYhnaF19Gu3A2Aw9cS4=;
 b=VaQkyy1TjA7l+TRux6YqVHMv0TPpkwjiIGO55xxCgC/E8N1YQ/kXq8m9bQUqMXOqdsizJXwYS9XM5Zno+PQwQBZk4WmERd2yUV5H5YGvj9dIJJVHGneEPe0anfFClj/S8jNGQBw6SQ50zUVq/M09Ddls87Psd5l01YAeSO7+LTM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9112.eurprd02.prod.outlook.com (2603:10a6:102:324::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 14 Aug
 2024 15:32:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 15:32:23 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>, Trevor Gamblin
	<tgamblin@baylibre.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: RE: [OE-core][PATCH v2] python3: skip readline limited history tests
Thread-Topic: [OE-core][PATCH v2] python3: skip readline limited history tests
Thread-Index: AQHa7Z+kRrEJtKEuDEydkfsMBDQ0y7ImD9iAgACp4wCAACC/AIAABL4w
Date: Wed, 14 Aug 2024 15:32:23 +0000
Message-ID: 
 <DB5PR02MB10213975EC7BD8B55D53B0D80EF872@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240813164101.3425564-1-tgamblin@baylibre.com>
 <7f6a3ca8-1eff-0288-d667-2824dbcfefc9@windriver.com>
 <00acffd5-d23e-4d6b-a653-d926f2eb417b@baylibre.com>
 <CO6PR11MB56029745F270021B2C2C81F4ED872@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: 
 <CO6PR11MB56029745F270021B2C2C81F4ED872@CO6PR11MB5602.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9112:EE_
x-ms-office365-filtering-correlation-id: 25eb6f7b-2f30-4eba-e114-08dcbc764b32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 UYdv1xEhyaBuO4wB+xV9FsqBuY5HAeI3oeVm2PXh+eH7w+N09p7KPN9RBPWsAgahKlZcIjPvzMNVA7Rgao9RNGxa1TGvXSR+M7thHql/bNguho1zU4ZR9zrWicR4VZpHgC84RF+MY4eU5p8X6de52B5Qh8K3Jw3jNVFWwZZJPR9t2reND64zv5tsWg8CXPrhRRK7imf0mYxx8pwQj0+v2BWf9sKs9euq2X7aEnqk8Uyg1Ei0m0L4uHUeTstF9vNm2A4F9UD19TAi44I4KAsn/0o7vQiAKULof2PYUndK23xfZjkjnmp5hStKJ9V+goKKKIEruKdB+idVNEk757Y6zaWlrNcUFZyfTUmnuSTtZi3RFukATQRo3ZsOJJ60tz0B+7ThzObvzgZ9m2p1fFhfrksldPmqfrAas8qSbfZlhAWho9eJ0xBWz/gy3cLwlkF46a51lP4/lLR0vdwiB4MoaqTajzzg0HmSEr5PKzHxqY1zPeeSD7SGQYSvdPDYye/gu3tRVBn5Y5rWroCAwlORb32r+j2z+BU+n63zdoVWSy/m760UdKKCKUykKQW8n47Ecb7/9F4hx13nYgXrSU6oYjjKOIhdC/qr0T0g4yno86tkCP9C5p0nzYR3nZrB0p7CA7mxInOQEvrrUaxJTot/3R/I0yNDqUBj6vXzjkBr53SvdklZZxB4AmRvYlK4zp/ejpSbQSe2piIkC+dxMCbtA/k5oj+1BFfNM7hNGrd5bag=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b24wNlA0ODZuRWZUaGYrU2NMdG42VWx5Y2JiZjhUU3FrVThXU3dLMkVkcEkw?=
 =?utf-8?B?T1JWcElLaFkvRjQ0QW9aay93WE1YeHNWd3FmeUtacGNNMnQ3bE5OMCs5SlBw?=
 =?utf-8?B?aTh5TXZVK3JHdFhiWW90NXlMcmJ2MVFwRnFaV1BWSENSekUwQTV1aEU0RDdF?=
 =?utf-8?B?VlR2YVZ5OWNGaDhzMlBhaVkzNW1LempqU1R5YTA2OHdPSGxJRitoVGszZFVX?=
 =?utf-8?B?QXNMMm5taU4rU21VMmt1bXV2UGpDNlRRMnRmRG1lYlUrZkh5TjBxUFF0RE5M?=
 =?utf-8?B?K1B0WVgxc1VzeUJrZ0dVUDBobUpJbTFEMllHWUJMYmRKR3dMSi9QeG9yT24v?=
 =?utf-8?B?dkxrUzdWd1FBU3kxYm5sdEoveExoNUg4N1NJZURuMWFocU02YXZqMzViSHJj?=
 =?utf-8?B?MHJyeW9rL0k0SmZHRDNPQWF0andGRGpFeDhqK0NORVBRNDZzQmlDc2trdmhG?=
 =?utf-8?B?ZkkrcWJTVDZ0cUtYTHkwK25EKys4YU9nNlZUZVR4cE9odHBacmk4blh2TDVx?=
 =?utf-8?B?Ym5YREt5ZkkzWWt4V1JJdWtXNFhaWXVvdCtmdldlLzBFaVhrWWIwejlaREtI?=
 =?utf-8?B?dkJNTEl6K1Y3L21aemdIK0lFZE1IZkFnVWFzSGEvN3VjTk42cGk3L3pvQXUw?=
 =?utf-8?B?Um9ydlV5ZFZmMmFpSHEyeEV3S3o4cE9kR2xSR3FET0lJV2t1MTlKV0xsSHNo?=
 =?utf-8?B?d0NTdjVTZzV5bm5uZ1JzWUJHdGllT0J1ak5nVFJkSnlYTG5DeFJuQ3JxU21J?=
 =?utf-8?B?eTk5N3lucHl6SVU3eHVjZy94NStWQStLaW1mNWZtRzcyZzd4SkxDeER3TUhM?=
 =?utf-8?B?dWJ1YU84QTN5WlN5dUp1VEIwWTJNcGRZR0ZyUGJiNGlDWUY2ZjdiTEJxQmpx?=
 =?utf-8?B?ZEx0UVdJbGg5cGF0MkJ1ZTl5RDJvaUdibmJYMDBjaHRUbXJaS3dVM2hlZFZk?=
 =?utf-8?B?SW5DdzRrOFFjTWc2cmljbDFoQ3c3R2JqRDE3NG0xbUVzSzhWMEhSaXd3bWdT?=
 =?utf-8?B?eVdzM0toNG8xOHlUOTdZYXhUSWQrNWc3OEZzT2ZrdTlsVkdCK3llNDl4YVF0?=
 =?utf-8?B?OTd1N2N4NEJGZmEzbjAzbjZneTJKWGxUaW1vZG9YaEpFSWlYY2JMZ0sxQ2x2?=
 =?utf-8?B?KzhiVEpOTHpnZDlOVThPalcrU0plV2xSRUYrTVFaYy9BdnFJQVpLTGkxdFBL?=
 =?utf-8?B?V1c1MEM3d29xOFIvbWtFQmw1WkJTNkZ1Rm9LUnBWMEtBOGR4NEZSb3NzdTRa?=
 =?utf-8?B?Y01tS2VEci90MjdJTjRZdjVNejhyUHQyL1BSNDl0YXRnZnFXRnZUdkdGT2Q5?=
 =?utf-8?B?N2xtQWVRQlV4Q1ZwODZUQVc4Qk1WMStkR2l3RmdIbHFFK2hTZXZOREVIYU1U?=
 =?utf-8?B?YlpSeWRMZzFES1pPUHFXbWdVeXZPOWM1STRxSHQ1WG5oZ3cwN2hXcEs2TjNO?=
 =?utf-8?B?Ym5WV3psUXpYSWFlZUg0V3EwWjBaaE9vN1hZa1ZISENQVEtqMnJsNkRsZGRZ?=
 =?utf-8?B?aWkvNzhkdmc4dk9jaVZ2dk1ra1hmWml2OWtaZ2ZoaHEyUFMzYkxudW5Yb0tw?=
 =?utf-8?B?YlJTWWF4N1BpajIxUWVsZlZNamhHNmxhOWx0REZqVzhBZWl4QTRhOFh4TUVm?=
 =?utf-8?B?UHV6c3FRQXkxY2xxajVUd2lUaG5GQXJOVG14eTdxclcrTWdobENVUGM1NzFZ?=
 =?utf-8?B?NytTQ2dRUUxlRlFJZ2xsL3ZsaDRkUlFPREJia3g1UHdXZm9CTlFMSzBWb0xi?=
 =?utf-8?B?U0lWZlVobW5aVFNQSjFta0JKcU5Uam5WQVhlU081VE9SVjNOSGFOT0F3U0Jy?=
 =?utf-8?B?Rk9EOFVCdWoyajM1VktjSWtOVFlKVVhDaTBZV3FxNm9aSml0THRnMmtpdGtm?=
 =?utf-8?B?eUlTUWhGMjZZa1VZU3BiUHRpSGptRy9VYUJMVVptbHhmcHpBTkxBb2pPY2k1?=
 =?utf-8?B?bnFzNEV1QXVhWmpmNHJrWXI4Y25KUVdPcm1Pck9lOU1RWUVlYmZOOWRnbm1l?=
 =?utf-8?B?akx0cWRPVnBLTXB2bmIwZkt4RkJINEZ2enY1QWwzYlE0dFdad1U3QUJVZnNq?=
 =?utf-8?B?V0JKOUdyWW9wTEFtQy8ycGhlU3ZKeXhzSFNyR3pxWGpZYkFXNVNvVVVkd254?=
 =?utf-8?Q?36C0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25eb6f7b-2f30-4eba-e114-08dcbc764b32
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 15:32:23.3432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCimt8HGe3HnYwT6wWa6WMgN81X89gr0Qs7kz3mob3pPFi7MDQVod8LjQ6+D0FGs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 15:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203325

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIENoZW4gUWkgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU2VudDogZGVuIDE0IGF1Z3VzdGkgMjAyNCAxNzowMg0KPiBUbzogVHJldm9yIEdh
bWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnOyBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBDYzog
YWxleC5rYW5hdmluQGdtYWlsLmNvbTsgYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207IEto
ZW0gUmFqDQo+IDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1b
UEFUQ0ggdjJdIHB5dGhvbjM6IHNraXAgcmVhZGxpbmUgbGltaXRlZCBoaXN0b3J5DQo+IHRlc3Rz
DQo+IA0KPiBIb3cgYWJvdXQgdXNpbmcgSU5DT01QSVRBQkxFX0xJQ0VOU0UgdG8gZGV0ZXJtaW5l
IHRoZSBkZWZhdWx0DQo+IFBBQ0FLR0VDT05GSUcsIHNvIHRoYXQgdGhlIGRlZmF1bHQgaXMgcmVh
ZGxpbmU/IE1heWJlIHRoaXMgd291bGQgYmUgcGFydA0KDQpOby4gSW4gbW9kZXJuIGNvbmZpZ3Vy
YXRpb25zLCBJTkNPTVBJVEFCTEVfTElDRU5TRSBzaG91bGQgb25seSBiZSBzZXQgZm9yIA0KaW1h
Z2UgcmVjaXBlcyB0byBhbGxvdywgZS5nLiwgR1BMLTMuMCBjb2RlIHRvIGJlIHVzZWQgaW4gb25l
IGltYWdlLCBidXQgbm90IA0KYW5vdGhlci4NCg0KPiBvZiB0aGUgbmV3IG1ldGEtZ3BsdjIgcmVw
bGFjZW1lbnQgd29yayAoQEtoZW0gUmFqKS4gSSdtIG5vdCB2ZXJ5IHN1cmUNCj4gYWJvdXQgaXQs
IHRob3VnaC4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgdmVyeSBmZXcgcGVvcGxlIGNhcmUgYWJvdXQg
dGhpcw0KPiBHUEx2MyBwcm9ibGVtLiBUaGUgZXZpZGVuY2UgaXMgdGhhdCBtZXRhLWdwbHYyIGlz
IE5PVCBzdXBwb3J0ZWQgZm9yIGEgbG9uZw0KDQpOb3RlIHRoYXQgcmVhZGxpbmUgaXMgR1BMLTMu
MCwgbm90IExHUEwtMy4wLCB3aGljaCBtZWFucyBsaW5raW5nIHdpdGggaXQgDQpkaXJlY3RseSBp
bXBhY3RzIHRoZSBsaWNlbnNpbmcgb2YgdGhlIGVudGlyZSBhcHBsaWNhdGlvbi4NCg0KQW5kIHdo
aWxlIEkgY2Fubm90IHNwZWFrIGZvciBvdGhlcnMsIChMKUdQTC0zLjAgYXJlIHByb2JsZW1hdGlj
IGFuZCBzaG91bGQgYmUgDQphdm9pZGVkIGlmIHBvc3NpYmxlLCBhbmQgYmUgb3B0aW9uYWwgb3Ro
ZXJ3aXNlLiBXaGljaCBpcyBleGFjdGx5IHdoYXQgUm9zcyANCmRpZCB3aGVuIGhlIGNoYW5nZWQg
dGhlIGRlZmF1bHQgZnJvbSByZWFkbGluZSB0byBlZGl0bGluZSBpbiB0aGUgcHl0aG9uMyANCnJl
Y2lwZS4gR29pbmcgYmFjayBvbiB0aGF0IGlzIGRlZmluaXRlbHkgdGhlIHdyb25nIHRoaW5nIHRv
IGRvLg0KDQo+IHRpbWUgYW5kIG5vYm9keSBldmVyIGRldm90ZXMgYW55IHJlYWwgZWZmb3J0IHRv
IGRldmVsb3AgYW4gYWx0ZXJuYXRpdmUuDQo+IA0KPiBJIGd1ZXNzIHdoZW4gdGhlIGNvbW1pdCB3
YXMgbWFkZSwgdGhlIHVuZGVybHlpbmcgQVBJIGluY29tcGF0aWJpbGl0eSB3YXMNCj4gTk9UIG1h
ZGUgY2xlYXIuDQoNCklmIHRoZSB0ZXN0IGZhaWxzIHdoZW4gcHl0aG9uMyBpcyBjb25maWd1cmVk
IHRvIHVzZSBlZGl0bGluZSwgdGhlbiBJIHdvdWxkIA0Kc2F5IHRoYXQgaXQgaXMgdGhlIHRlc3Qg
dGhhdCBpcyB3cm9uZyBhbmQgc2hvdWxkIGJlIGNvcnJlY3RlZC4NCg0KPiANCj4gSSdtIE9LIHdp
dGggYW55IGNob2ljZSwgYXMgbG9uZyBhcyBjbGVhciBzdGF0ZW1lbnRzIGFyZSB0aGVyZSB0byB0
ZWxsDQo+IHBlb3BsZSB3aHksIHRob3VnaCBJIHByZWZlciB0byB1c2UgcmVhZGxpbmUgYXMgdGhl
IGRlZmF1bHQsIGFzIGl0IHdvdWxkDQo+IHByb3ZpZGUgYmV0dGVyIHVzZXIgZXhwZXJpZW5jZS4N
Cj4gDQo+IFJlZ2FyZHMsDQo+IFFpDQoNCi8vUGV0ZXINCg0K

