Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F08C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:08:35 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.96])
 by mx.groups.io with SMTP id smtpd.web10.12094.1707833314392011404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=I9tuq3x7;
 spf=pass (domain: infinera.com, ip: 40.107.223.96, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbW82JFLuTxXQZECmWkxmMfo3DMGkFR7jZV9bMJYO7ifa1kuVuyi4Eh7mZw9TxHQMdMgnu/7Mx+MzEby4A+m9MPn/A15xZixwu4Bpv+IW7QbJ06TNYxX2qOuzC3lPn0zJujzuedjYP0KHEqxMYlvnd1hvButjDzwFCiYjZPGgKKniTavffxRgcNT8H32UGKGVbukk3YQ/y5O+04X5GDGG5t/1eZoiTjkUP/LvqOwfcCNhTV6ukJp1gDoP+ckW8+Xs2zHPWbXDfgTbKDattpH1Py2oWqzlM9C5R1EO5RnQbs/WBW/1vY7qJkJs35SzKZWhHIkHyvJFGPOh8Y5eT7Rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGrY63OnMnZvsYL2WsMWxAlzYv9X2HdcK5K/A+vMYEU=;
 b=OIPbEkSHcrKPYRRwm2iihFQhLWWQk2A64+irrty/3nYIBVGnkDTpbZWGw74/dimei+Y+CS5lFS+/TAIY3TETUILlLIKz0w6mkRb8zWmQZQ04QQsjlmPQgETKoTjMYcEj4nE3kwcag1uiRX9Hkr6A4XNZjeYS4UBWeWx/jw0fPeFY/DfOvR1mcnc7c4Ipd6eRHkDbaERqp2nh3ZvUjjxWeJHsqEOLQWCyQ2ZVjslMVSdKQe5gJEMF+dfyQ9Y4vYap+ZH5I1ODTcJAsLaOKm6ssIvL+N0qWG048vHncXDDN4gPZP86GJ9fLmYghEuZZDO9HLu/jsNUZm+BjhxyfMJOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGrY63OnMnZvsYL2WsMWxAlzYv9X2HdcK5K/A+vMYEU=;
 b=I9tuq3x7i7NTMtNpZXHS4oa98XlzLP1o/klgISPtKK2sd8sNykYtGPGpt/BYnv3x5KBW6l1OSv8wFK1uKY3r83+xkeSH9MkLDLqDF4o6vg16xxFTB0sMh/LdcZzMYjdKhLWICzHyMook+0zReCWWPJbrygoJSxuVirv6n5p8ibINvBCoXMdKM8osFVQzTV/zE8UhjPjIB2lucCO9GPPb68VxeAK0oILRo3HWJ2mi5sPR7rkTf/vWPfmF78YUaLN/jE4M2kbQN3P9BfmKLy8s8nmqaX6eXQfCOZoGAXE47XUJThSPQhcJuhQUzkjPiL/eMz9IXNzfaP2JxjfP8UrUHA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by IA0PR10MB7304.namprd10.prod.outlook.com (2603:10b6:208:40e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 13 Feb
 2024 14:08:30 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 14:08:30 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Thread-Topic: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Thread-Index: AQHaW2H7nw8tDhqAGESfJbXCj/WL3LEIVXiA
Date: Tue, 13 Feb 2024 14:08:30 +0000
Message-ID: <5009ff89147eb81e88005c6b6f76d195bf010edb.camel@infinera.com>
References: <17B23A54B6BB5F11.15017@lists.openembedded.org>
In-Reply-To: <17B23A54B6BB5F11.15017@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|IA0PR10MB7304:EE_
x-ms-office365-filtering-correlation-id: 406dee7e-69bc-4a41-9a4e-08dc2c9d41cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZtefS3Ail7x+xIF0KSx3ITTMQkkjX7x5wguUTUu2zgk6t5RDeSMHbj6kaY75QEZXNsXFUfq+/biYJpG8AhytZjyr1WhsgPlFtch5LLo2qAFhO2wuprqi+6SN3fXbdlz3oc/7ewErbohfazvIlw1Xpji9vVx5/JJypqqLAA+P6BQbsT0cNjYbDEsFCbD0NQ8x510RaMmEkWT8c3m4P5llZ/cNMJGX8t9LUqTMQpQYVRKKlXrYGqmta/NkR+r33xqPvyccYo1TMyE+0OX+aoYYhgspv8MazRl+9Ci5lMCr7oT8UYfJKtsHXinON2WIl2UCDmkuRJJdJ/sJShw0BubxWbdmjv56GOvCl/NoPdLfWRoYRKKJDwrf+4sXp2tRCyfzB0noLStz18dIUATiUYHn5X7GvubmFQN0Hcnb9/1Aepcaockpjy1VluEIEbm38VyjAphhpffvnjV93MycnbUjf+2LebXdnNkfeXO8qKK72PkWW6tltg/rOsiEPWJK4z63DIb90uL9TPsMtnzEDaBCSGEtnGMaq6b4gLS7bcRGf+xbP8uDFn7To2X5///c3m25Ij5HRwLaNLHa0QOJKvKtzcxiefGUWLwXdhu6Kprz2wIu57Gs2cJEj1sltHTrpxeZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6512007)(478600001)(6486002)(71200400001)(41300700001)(8936002)(8676002)(5660300002)(2906002)(110136005)(6506007)(66446008)(64756008)(66556008)(316002)(76116006)(66476007)(66946007)(2616005)(83380400001)(86362001)(122000001)(38070700009)(36756003)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q1d6U0w0VUNnK1E5SUlRZGxXaVJUNWpwM1RzcFI5TXczZzZxWWY5R0FqWENr?=
 =?utf-8?B?L1dOc0p0OWhZeGo1SXJTODJmRGUvd1B5TWhKWTNOOTNFc2oxWDRySXZwV0Vh?=
 =?utf-8?B?UnJXOFdsRGRid1RTQkZQSlAzMmUwYjJ0WkVQTHNqVGRmUFhCNmxsQm5iSUl1?=
 =?utf-8?B?eGFxdFhubG5EWVJubUFQTGhLNWlmZFBZdkt0TVZkaU5TaFNCdGkxMGM1VmFZ?=
 =?utf-8?B?S1NTSHFmdHFlWHg4M2kxMFZRWlFqR1hDRHgyN2FzY3l2cHcxMTlzQ054QnZo?=
 =?utf-8?B?RHBIUGw5Sk1HTGVmYnN6US9Ca1RsMWs1OXZER040elE4UFlFYU5Eek0zVXhp?=
 =?utf-8?B?VXc5VTRIMGlTZ1dnOVVwWm5Rc2tabVVyRDNjUGt6V0ZnYWNnNG9MUFppQjZR?=
 =?utf-8?B?TTQ5NXJSWmNPYW1OTGxPUWtMczVSc3VLT3NJZUd5TTVaNExEK2lybDNNckkv?=
 =?utf-8?B?M3NURWlyUFVrTE5pRjNPNVZrRE1jR20wK1AxQURMT204aEt5azVWMnFEWC9B?=
 =?utf-8?B?WHhieHQ5cElBSXNzMkhJUHhzYzM3RTZQWmNISnJJNTJtTzBJNmZvMGI3cHgw?=
 =?utf-8?B?dDdoUlZSNTYzZ3E0WlE4d1V4bUw1ekhIUk9xNS8ySmQ4MEZ4ZytpUTJSUHhh?=
 =?utf-8?B?T2x2R3VyVml5bEgvdnB6OW5aNEtmaG5HQ3lqSjFlVnhGRU03QUdVUlI2MlJu?=
 =?utf-8?B?cUE1V2ZPOE5SUkwvdTQwNy85bTRUejdGVDRGWjVLRDlsTHRsTTg3RGVUZkU1?=
 =?utf-8?B?Tk5mbHM4WkRFclB2cC9CdWtMc2xrZGZ5SHpVS3JUcmEvZW5adldlMHVReHND?=
 =?utf-8?B?ZGdxZzhkWmN6eERiWHRrb010RkUzK2hTT1dBYzFDREI0SHA1RzdRcWkxbXhX?=
 =?utf-8?B?eHFlU2NLUFBNMjdTWCtoZ2R6NW9lVmJJZGtJTXUvNWZyelMvZkZ4S0JTUFBY?=
 =?utf-8?B?UHpBL1JlUVJON1RCNnNrbGc4UzFpemZmTkFLKzFQdXJVd0c2S3V2TXQwYUpD?=
 =?utf-8?B?Tlp6emNBRU9rQ294MTBDb1c3SjkwaW5rZWxYaVN3R2g3b0h5cHFhdnViRU9W?=
 =?utf-8?B?U3NoYUdSc3U1Qk83UXUrQXhBMnZlRWtkUW9uWG85MFVjNkl0dC9lQTZmVE1v?=
 =?utf-8?B?QUg3Rkwzais4YlIyZG1GTTNMMmNGSnVmdVgzakdQSExrS0E1aFdXM2hyODds?=
 =?utf-8?B?NXU3SThlQnpjY0t1QVNhcTdJR0hXN2YrTHN1WEVMR3N4UXdmWnYzS0pkMUlW?=
 =?utf-8?B?TXpDbGI2ZG5OQUozeGZ6WWxacHhnOEE1bTE4OWVtb3pNdmZhVjlDYmc5QkJ3?=
 =?utf-8?B?ZTRjT3IwekZNcXVSaCtyanhILzJLcnJxMVdoRGVncjhDc0l6bncwaFJhYmhv?=
 =?utf-8?B?VVl5Z1RzVVlQb0swQVdqcW9qL0czUmY1R0ZXa1dGajYzYkl5anhieGR4dGdr?=
 =?utf-8?B?bVp6WDVRSWdrTG5ldDhHa2phNFlOaDJ5UTE3M2pkUnZ1dFhqUWpSVFNiVk5a?=
 =?utf-8?B?UlVyOHY1dmhDQUVFZFhlYWcxV2crTzRLZkJwWHBDZm5ma0NVUWhYdi9KaFFp?=
 =?utf-8?B?dFpiQ2hKa3JYbVEwZkIxb1ZJVVFjK3NZRGFVWWR3dTNIZVhqWFhjRVgrN1lp?=
 =?utf-8?B?RnMwS2IwSllHQjhiVTdWSlJqQldnNDM4bkpTdVdReWZlSENjVVY5S256Nkc4?=
 =?utf-8?B?eGtybDVqTlZEM3E2QUtRcjRYL2lMSVJlVlhtTDdYc3g4QmhiS3pGZ3IrT2Zr?=
 =?utf-8?B?YWRrdUE5RXlSOXZiOUVNZk5sWXEyelVnMC9hNWxXY1ZZbFVhcnhvSTF3eXZx?=
 =?utf-8?B?Z2NOSmpQanE4SjhBNVRabC9IU1RvV2hSN2FZbGMwaXZuUGhMOVFzc093Q2JG?=
 =?utf-8?B?bWFEVFJLQTZMVWxiZGgxSEgxa1h0R0NoOVk1N0t2Q2JjK1hWU09PQVg3eGFZ?=
 =?utf-8?B?QzNmOXVpemxYaVFFcUh2d2VwNDRVNk1XUWNrTURLZS9oQm83UWdCMUhrdXJy?=
 =?utf-8?B?ditWeGFhUmFHYTdsRzhuL1FxTmdWV3R5Rll6QTdvRVZSN3NieXFudWtrNmxK?=
 =?utf-8?B?Y0ExS3pscS8rU0R1M08zcmY4Umsvci80QTY3VnVTNnVpWk5xRWN4cUNPTHFD?=
 =?utf-8?B?WDl3MkN1VmMrOXZ6aWFiL2pUZUVYOEVLNXNvOG15S1Nqeis1THhFSUtBMjI2?=
 =?utf-8?Q?BDVu/wwWphgljfDBkfTyjCivo94laTsEnCvYrYd1lbQW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E45D223E6544804C9BFC0784E43A7B70@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406dee7e-69bc-4a41-9a4e-08dc2c9d41cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 14:08:30.4973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGy5RrdiHgnOgGm1hmrJ+ZJB+iA/6w9K8NMGur/gTvh2kFG7dEI8PsYk9AVClAHeMrBKruffNBDFh6cNB9i7IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7304
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195402

T24gRnJpLCAyMDI0LTAyLTA5IGF0IDE1OjA5ICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBXaGF0ZXZlciBJIHRyeSBJIGFsd2F5cyBn
ZXQ6DQo+ID4gICBUaGUgaW1wb3J0ZWQgdGFyZ2V0ICJwcm90b2J1Zjo6cHJvdG9jIiByZWZlcmVu
Y2VzIHRoZSBmaWxlDQo+ID4gDQo+ID4gICAgICAiL2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQv
aW5mbi14ci9nbWN1L3RtcC93b3JrL3g4Nl82NC1uYXRpdmVzZGsteHJzZGstbGludXgvbmF0aXZl
c2RrLWdycGMvMS41Ni4yL3JlY2lwZS1zeXNyb290L29wdC9pbmZuLXhyLzEuMC9zeXNyb290cy94
ODZfNjQteHJzZGstbGludXgvdXNyL2Jpbi9wcm90b2MtMjMuNC4wIg0KPiA+IA0KPiA+ICAgYnV0
IHRoaXMgZmlsZSBkb2VzIG5vdCBleGlzdC4gIFBvc3NpYmxlIHJlYXNvbnMgaW5jbHVkZToNCj4g
PiANCj4gPiAgICogVGhlIGZpbGUgd2FzIGRlbGV0ZWQsIHJlbmFtZWQsIG9yIG1vdmVkIHRvIGFu
b3RoZXIgbG9jYXRpb24uDQo+ID4gDQo+ID4gICAqIEFuIGluc3RhbGwgb3IgdW5pbnN0YWxsIHBy
b2NlZHVyZSBkaWQgbm90IGNvbXBsZXRlIHN1Y2Nlc3NmdWxseS4NCj4gPiANCj4gPiAgICogVGhl
IGluc3RhbGxhdGlvbiBwYWNrYWdlIHdhcyBmYXVsdHkgYW5kIGNvbnRhaW5lZA0KPiA+IA0KPiA+
ICAgICAgIi9ob21lL2pvY2tlL3lvY3RvLXhyL2J1aWxkL2luZm4teHIvZ21jdS90bXAvd29yay94
ODZfNjQtbmF0aXZlc2RrLXhyc2RrLWxpbnV4L25hdGl2ZXNkay1ncnBjLzEuNTYuMi9yZWNpcGUt
c3lzcm9vdC9vcHQvaW5mbi14ci8xLjAvc3lzcm9vdHMveDg2XzY0LXhyc2RrLWxpbnV4L3Vzci9s
aWIvY21ha2UvcHJvdG9idWYvcHJvdG9idWYtdGFyZ2V0cy5jbWFrZSINCj4gPiANCj4gPiAgIGJ1
dCBub3QgYWxsIHRoZSBmaWxlcyBpdCByZWZlcmVuY2VzLg0KPiANCj4gTG9va2luZyBhdCBmYWls
aW5nIHBhdGg6DQo+IHMgL2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci9nbWN1L3Rt
cC93b3JrL3g4Nl82NC1uYXRpdmVzZGsteHJzZGstbGludXgvbmF0aXZlc2RrLWdycGMvMS41Ni4y
L3JlY2lwZS1zeXNyb290L29wdC9pbmZuLXhyLzEuMC9zeXNyb290cy94ODZfNjQteHJzZGstbGlu
dXgvdXNyLw0KPiAuLyAgLi4vICBpbmNsdWRlLyAgbGliLyAgc2hhcmUvDQo+IA0KPiBUaGVyZSBp
biBubyBiaW4gZGlyIGF0IGFsbC4gSW4gbGliIHRoZXJlIGFyZSBsb3RzIG9mIGxpYnMsIGluY2x1
ZGluZyBsaWJwcm90b2J1Zi1jLnNvDQo+IFRvIG1lIGl0IGZlZWxzIGxpa2UgYml0YmFrZSBzb21l
aG93IGZhaWxlZCB0byBpbnN0YWxsICByZXF1aXJlZCBiaW4vcHJvdG9jLTIzLjQuMCBmaWxlcw0K
PiBidXQgbWlzc2VzIHRoZSBiaW4gZmlsZXMgYXMgdGhlc2UgYXJlIG5vcm1hbGx5IG5vdCBuZWVk
ZWQgd2hlbiBidWlsZGluZy4NCj4gDQo+IG9yIHBlcmhhcHMgaXQgaXMgcmV3cml0aW5nICB0aGUg
cGFzc2VkIHBhdGg/IFdoYXQgaXMgcGFzc2VkIHRvIGNtYWtlIGlzOg0KPiAiL2hvbWUvam9ja2Uv
eW9jdG8teHIvYnVpbGQvaW5mbi14ci9nbWN1L3RtcC93b3JrL3g4Nl82NC1uYXRpdmVzZGsteHJz
ZGstbGludXgvbmF0aXZlc2RrLWdycGMvMS41Ni4yL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
YmluL3Byb3RvYyINCj4gDQo+IGJ1dCBiaXRiYWtlIHNvbWVob3cgcmV3cml0ZSB0aGlzIHRvOg0K
PiANCj4gIi9ob21lL2pvY2tlL3lvY3RvLXhyL2J1aWxkL2luZm4teHIvZ21jdS90bXAvd29yay94
ODZfNjQtbmF0aXZlc2RrLXhyc2RrLWxpbnV4L25hdGl2ZXNkay1ncnBjLzEuNTYuMi9yZWNpcGUt
c3lzcm9vdC9vcHQvaW5mbi14ci8xLjAvc3lzcm9vdHMveDg2XzY0LXhyc2RrLWxpbnV4L3Vzci9i
aW4vcHJvdG9jLTIzLjQuMCINCj4gDQo+IE5vdGljZSB0aGUgY2hhbmdlIHRvICJyZWNpcGUtc3lz
cm9vdC9vcHQvaW5mbi14ci8xLjAvc3lzcm9vdHMveDg2XzY0LXhyc2RrLWxpbnV4LyIgaW4gdGhl
IG1pZGRsZS4NCj4gDQo+ICBKb2FraW0NCg0KRllJLCB0aGlzIHdvcmtzIGFyb3VuZCB0aGUgcHJv
YmxlbToNCmNhdCAuL21ldGEteHIvcmVjaXBlcy1kZXZ0b29scy9ncnBjL2dycGNfJS5iYmFwcGVu
ZA0KI0hhY2sgdGhlIG5hdGl2ZXNkay1ncnBjLCBjb3B5IHByb3RvYnVmJ3MgcHJvdG9jKiBmcm9t
IHN5c3Jvb3QgdG8gJHtTREtQQVRITkFUSVZFfQ0KI0ZvciBzb21lIHJlYXNvbiBuYXRpdmVzZGst
Z3JwYyB3aWxsIG5vdCBmaW5kIGl0IGFuZCBidWlsZCBmYWlscyBvdGhlcndpc2UuDQojVW5jbGVh
ciB3aGF0IHRoZSBidWcgaXMgYnV0IHN1c3BlY3QgdXBzdHJlYW0gYnVnDQoNCmRvX2NvbmZpZ3Vy
ZTpwcmVwZW5kOmNsYXNzLW5hdGl2ZXNkayAoKSB7DQogICAgTVlfUFJFRklYPSIke1RPUERJUn0v
dG1wL3dvcmsveDg2XzY0LW5hdGl2ZXNkay14cnNkay1saW51eC9uYXRpdmVzZGstZ3JwYy8ke1BW
fSINCiAgICBNWV9GUk9NPSIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vIg0KICAgIE1Z
X1RPPSIvcmVjaXBlLXN5c3Jvb3QvJHtTREtQQVRITkFUSVZFfS91c3IvYmluLyINCiAgICBta2Rp
ciAtcCAiJHtNWV9QUkVGSVh9JHtNWV9UT30iICMgQ3JlYXRlIG1pc3NpbmcgREVTVCBkaXINCiAg
ICBjcCAtYXAgIiR7TVlfUFJFRklYfSR7TVlfRlJPTX0icHJvdG9jKiAiJHtNWV9QUkVGSVh9JHtN
WV9UT30iDQp9DQoNCkNDaW5nIHlvdSBTdGV2ZSBzaG91bGQgeW91IGhhdmUgbWlzc2VkIHRoaXMg
cmVwb3J0Lg0KDQogSm9ha2ltDQo=

