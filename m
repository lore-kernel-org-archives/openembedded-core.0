Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679C1C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:45:35 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.100])
 by mx.groups.io with SMTP id smtpd.web10.12932.1707835534120537043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=f7nFnlrZ;
 spf=pass (domain: infinera.com, ip: 40.107.223.100, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBp9VFRvDBhrd3zyLjadD5ubw9HsbomV4ZSpGHRHih94rvDyJLx6r13xJFXGiDrpa66xEiTzBLKm1/yb0AfJ/LFFhPriK72XTlAFR7oN38wHwbgYheu6wsgB+wr5TUkYwODh6bNcCu1fAhDhqAJE4X1qATJ8Sfyl1kQBmAl2QyCF4j2vPXeCMRFtGjUBv1KqqvlaCqn4I8j9BrIYwWGCPYb0B52kGDg79CP8QWZ1KZ/eMcFnmBTx/TJFp4/n++OOpl5/ZqChd4jW+ySRwgY3FUjL+c2mcuT3sZ4styPk2QnGiXluSCTSrw4WuR/HhexXjR/vGGO+fbT6a8Sv98yNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvDUYDmRQY5aq8HA7+ap7mPBr+z96xJvCTD4p+O3T2Q=;
 b=RbPDqmy9d5ks2HeefBoxIU/ZD9BJP+ybNy4pREMbga07sv8Qc7O3Gz8/F1bmh3cnC9Ir48oQu9+xpgEF8Ttc/k0hxK//8HSjnDID1mqLRLg+cSeNUJpZAramE44vngq6qrcNyZ8TvTfR7eWobrv+O78JECkwn79ZyJhygiJ4s3QEIdGZsfIpGAfyExK/r0BO2MK6bEvcpL7+pQoAa3xYuy3vcLxwpNk8mQL0bd6QicbK0qW+kvLyUnv3Vhset7HnE1udHjK1fyqSSI7vlLndPTIetDN5upwied/8wjpp0Q1+ER0SAkr2R8adZy/2Q9GVS+P4FRy6rq3XINnQDCbxnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvDUYDmRQY5aq8HA7+ap7mPBr+z96xJvCTD4p+O3T2Q=;
 b=f7nFnlrZKnel8xX7KM2p1TRuRuI8OncLhIYW+8JM3oXrs7V/9vUqQo7XKoOXUDb2VYKMJeOly9jEWb5ukg/XOOWjrDgeb4kGt29lWfpiZR4cBbKrfcmZzVSYsAoY95WAKXPUt689LKnjpNOlN3dHUkjaW3QP61H0sXrgtSOC8r1zzrNWVXMcliLnMX8/xhhZZpHz5E/ApfjJOaYiTRfLmTbPvaTCKYxSTCq2MayJXQ/+ejcDPI2oqYxUqdSBD1ZN4xAWi6Er/pobNSNXt5aFs5yu9AlrPc21e7d6UDhchBhEpVj261KzVrGmG9cSMo8pzt9o4YRkMw+yrlQjfk51uQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH7PR10MB7839.namprd10.prod.outlook.com (2603:10b6:510:2ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
 2024 14:45:30 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 14:45:30 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "steve@sakoman.com"
	<steve@sakoman.com>, "uvv.mail@gmail.com" <uvv.mail@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Thread-Topic: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Thread-Index: AQHaW2H7nw8tDhqAGESfJbXCj/WL3LEIVXiAgAABkgCAAAjEAA==
Date: Tue, 13 Feb 2024 14:45:30 +0000
Message-ID: <7b7a5dddfe76a38a74a2df0c441af7bfc4dd19af.camel@infinera.com>
References: <17B23A54B6BB5F11.15017@lists.openembedded.org>
	 <5009ff89147eb81e88005c6b6f76d195bf010edb.camel@infinera.com>
	 <12d6aaa8-1f7d-4da9-985a-8ebb2a51ebc0@gmail.com>
In-Reply-To: <12d6aaa8-1f7d-4da9-985a-8ebb2a51ebc0@gmail.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH7PR10MB7839:EE_
x-ms-office365-filtering-correlation-id: bfd3231b-7f48-437e-e8d0-08dc2ca26cca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IWQX88+y7k0DghREGtHVKk06ugVFZ85XQUCBZ0m10hB0HA35u/0S/48Tbig+5qFTBTaKmVOYBFa2rM09WHlLwhycaxSdsgzFxfESGE0hs96fSlLyiUmqSqrN7krzT1KALw6EiU8uPVM4eLDI8p637oANl7Be8d+1/mGg5Vin4J8ngrTFyOSuo+iBzPF34XVoYZOYuUsv08UodJaoHSv2A+8OewCzGplKp0pSCakNJRsHot4UmrKYzidRMb/itvECFa8dK3r6QW6Cd1t/3wMRksowA1DBNNnWvQZ2A6mz8QRiIudBarDRQ4xrYSUxo5CXO9SAxUhqEyU7MQQAaYGIBnXrCRBAKNV8jX0R/GEaroz1Y8gYraQ1eja9yO1plKd6ZO4ykaJb9uloAaTElEJSerBjNzRk9ekabxeSVFpbWk6/D1BI9On2UKn8P1cTCHwUhDs8QYa2KWvRAJyLmrqRx5lOoddF7YZqEq9b4JUNT+nwjBGynPIbLi3zuf/4+quGyD4vmEkzRJfyimWhZTiRrCv5vPhM52uGlkcvw33lSqyIlGZW7Bncf0MOKkDrGfbOncozgO55YbwWiOK2bVBGEbaupELbBuNgURlYN6q9nkA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(45080400002)(6512007)(6486002)(966005)(478600001)(41300700001)(8936002)(8676002)(2906002)(4326008)(5660300002)(110136005)(38070700009)(66946007)(6506007)(53546011)(64756008)(316002)(76116006)(71200400001)(66476007)(66556008)(66446008)(2616005)(122000001)(86362001)(83380400001)(36756003)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ajNvT3U0aXlIWm5uc0dyT0dndUFNY3dPMW03aHBHa3E2VnNjc1JiSHpQRHRp?=
 =?utf-8?B?T29oVGRyK1UwY1NnenpRUEx5S3pKRTlJQ2d5UFRtaDJSanU2UXdxem12N2F6?=
 =?utf-8?B?bGFJRlBORmJZM2crUkVNTHlTVEM3NUN4WlYwVFAwRnVpVS9TZFRTbUhiVFNU?=
 =?utf-8?B?VGFsY0o2eGcwTU5XdHd1M0JVQmhyQ05nQ0xLREFSOWZxRW40LzA4V1dWRllH?=
 =?utf-8?B?eVBkYnFDbUxYMUh3VmYzTGVQaHdFZ1VsL1JMVisweWZxZXByZVBQaDRPVG1M?=
 =?utf-8?B?N0pTY1NDbTFvaVFHQ1RsRk5CcEUzd1phU1U5RDJzR29ab0ZHbUl5TmNwT1Jv?=
 =?utf-8?B?aHNXUWpqKzIwaDNtYWoxYi8wSTRnREdtSkZoMHJpUlFQWVpTMDk2Q2VZbEZC?=
 =?utf-8?B?ZXQwRmFYNzdocnZrOWw2VFh1MVVXbkkxbVhSbVJOdjdhdXZDVSsvaC96dEI0?=
 =?utf-8?B?OVJhbHNwME0xbUUwNkExVE9WV3dFRnByREoxVVVjVncySURMazVFTmlxYjJ0?=
 =?utf-8?B?Y0JhOXpoQkJaSlloWWNtQTNEMlNPYWtncFVQZzVNMWxwZVpRbDhPTUxlZmo0?=
 =?utf-8?B?K3JzcE9oKzlWMjBjblN5QVcvT0o0K0UzdFdGMmtHME5QaGVyZXVnN0d2Wi9R?=
 =?utf-8?B?Mkl3Z0pseUdYVTZjZFN5dUVhUlpmQlc2dkluRHBjM0tpZ0NzYk9NblRqdnVt?=
 =?utf-8?B?dVVzeFhkVHZ0Tnh3M2JlSlFibWRackE4OGJYeWpDM3Bkd20wRjJrNnNnZzVx?=
 =?utf-8?B?MnZoMUVNNkhvNEdxTHZPRVhQQVRVZHZjTDRwMlh4bFliREhHRFV2Q043ZlU1?=
 =?utf-8?B?RVFQcWliOXZ5SUtTaFdUVXNSZUp0M2dlVlptZERDbkpIOXF0KzB3QXRSYlpo?=
 =?utf-8?B?dnBsZHVnbWlyMm93QzZmN0F0STI3bnU4eVUxb2dFR29DMkZqajFaRUpvNElq?=
 =?utf-8?B?SmRhQy9tSXhUQ3cyZzQ1ek5La0l3cmQ4cWpWY0FjbGxBdXRYZDJPZjl0cWRM?=
 =?utf-8?B?amhucTQvd3E2WWRZMHI0SVo1bmJqa29ZcnZHNFNublNrV1M2R0JVdmJyUlZi?=
 =?utf-8?B?aCtORFczNlF2TFJrZ3crS3ZDYTVWSkg1UXZaRXY2TkVTMDJ6OGlaQ042dlFB?=
 =?utf-8?B?RTFLYVlaWFJxeE9XcFlzNE9ycngzWll3S1ZrMmliN0ZSSFdxYmVpRkkwNlZH?=
 =?utf-8?B?THdRNmorazA5MG9WalFJbXlrVlBCUWQxTzdFU1lkSkhaeWhzZkd3RlRJaWgv?=
 =?utf-8?B?RWtXK2U0ZS9LaGx0WXZmeTdmWlhweldxdTB2VFVzVko3ZTBaRlJBTHlLTmk5?=
 =?utf-8?B?RWxDZVZwRFFKSkFVYW9FMWw0QXpqVkFIazhjaGlycjFjWUpDOWtBNTBRcFlZ?=
 =?utf-8?B?WVFLU1cydklxSXZOTXpGSzhINGk0M2lNc2JLSmJzME9xemlYOFhiNkNpcFlT?=
 =?utf-8?B?R3JLcHlHaitpZWNEU1JDUkFsNENxUlRIdEJWd29ONDZQV1FSWEMvRzRNUEUw?=
 =?utf-8?B?VXpUdkhPbDJRZTk0Skl4dEZYRDlPbWZwS20yekIrUng1MFdVVFVaMGlmcHhw?=
 =?utf-8?B?WVlUaTVQWkFabkM2dGo1UktWOGdRM2NSNDI0NUpERm9DMjJZWS9EcHZPM1lD?=
 =?utf-8?B?d0FXVG1IVFZPNmpYM0QvVzdZZWEvK3d2eTRmQXV3WmJ2MlpkOWFLWFF5dlFD?=
 =?utf-8?B?QmlPL3UwWU1xTW82S0pnaFozd2E0SVBoRWs1aUNvWUZGaWlGZWphazRwKzVZ?=
 =?utf-8?B?OVlVM2dROXgrQUptZzdTbzc4b0pSV1JDSFRBQVIzRDc1YWJiSEt0L09hYVZ0?=
 =?utf-8?B?aG0zYUV0Um82dmdnRlhjeTFBVE0yQ200VjhWdnhBMkdqS0VRMlZ2UTRrWGU2?=
 =?utf-8?B?MnZkYUlUMHF4MWczakRlYzcxc1R4WG5rYjYyb1hDWUNmMmd6NncxNVoyVHUy?=
 =?utf-8?B?OWl6clpWS25oMndzZElEdEwyS0c2aW16VWE3bThxM3l2c0FYdHZEVXZ1d0ll?=
 =?utf-8?B?dFBMTndGVVJIMklTYVFQbTdoVEhRWlFKclpnc0ZleEpaOWRsVS9PT2hPZUV0?=
 =?utf-8?B?Tnh0NXM5VUlvOVVnOGlGUU8xTG9qZU1zUHkzbmtLN1FSZE5wUnNqMUdHNlhh?=
 =?utf-8?B?by93RVA0RDY1N1RtL1d3b2l0UWpGUEtkRmw5VHhKVitmQ3hVdlVLckhqM1pU?=
 =?utf-8?Q?r+5BuXgLs1SlOTLj4sA36je9FctQLv/mf6jtxM0M1Qcl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75C7407567CFE64F998E793917BB71C4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd3231b-7f48-437e-e8d0-08dc2ca26cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 14:45:30.1150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CrCh+MHnodsEWpUozGwY3nqj9zB/Y0+YmztnbghkTy80XlBWreocdLPiiBmwSh5JBDgO2RTuqUraA6N+SV3p2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195406

T24gVHVlLCAyMDI0LTAyLTEzIGF0IDE1OjE0ICswMTAwLCBWeWFjaGVzbGF2IFl1cmtvdiB3cm90
ZToNCj4gSm9ha2ltLA0KPiBJIGFuc3dlcmVkIHlvdSBsYXN0IHdlZWsgb24gdGhlIHRoaXMgdG9w
aWMuIFF1b3RpbmcgaXQgYWdhaW46DQoNCmFoaCwgc29tZWhvdyBJIG1pc3NlZCB0aGF0LCBzb3Jy
eS4gSSB3aWxsIGNoZWNrIGFuZCByZXBvcnQNCg0KIEpvYWtpbQ0KDQo+DQo+IENvdWxkIHRoaXMN
Cj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQv
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmP2lkPWIxZGVlYzBkZTQ3NmQ4ZjBhMGM2
NDI3OTE5ZjU3ZWU1ZjY4MWVhMGUNCj4gZml4IHlvdXIgZmFpbHVyZT8NCj4NCj4gTm90ZSwgb2Ut
Y29yZSBpcyBhIHdyb25nIGxpc3QgZm9yIHRoaXMgZGlzY3Vzc2lvbiwgSSBjaGFuZ2VkIHRoZSBD
Qw0KPiBhY2NvcmRpbmdseS4NCj4NCj4gU2xhdmENCj4NCj4gT24gMTMuMDIuMjAyNCAxNTowOCwg
Sm9ha2ltIFRqZXJubHVuZCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBP
biBGcmksIDIwMjQtMDItMDkgYXQgMTU6MDkgKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBXaGF0ZXZlciBJIHRyeSBJIGFsd2F5
cyBnZXQ6DQo+ID4gPiA+ICAgIFRoZSBpbXBvcnRlZCB0YXJnZXQgInByb3RvYnVmOjpwcm90b2Mi
IHJlZmVyZW5jZXMgdGhlIGZpbGUNCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgIi9ob21lL2pvY2tl
L3lvY3RvLXhyL2J1aWxkL2luZm4teHIvZ21jdS90bXAvd29yay94ODZfNjQtbmF0aXZlc2RrLXhy
c2RrLWxpbnV4L25hdGl2ZXNkay1ncnBjLzEuNTYuMi9yZWNpcGUtc3lzcm9vdC9vcHQvaW5mbi14
ci8xLjAvc3lzcm9vdHMveDg2XzY0LXhyc2RrLWxpbnV4L3Vzci9iaW4vcHJvdG9jLTIzLjQuMCIN
Cj4gPiA+ID4NCj4gPiA+ID4gICAgYnV0IHRoaXMgZmlsZSBkb2VzIG5vdCBleGlzdC4gIFBvc3Np
YmxlIHJlYXNvbnMgaW5jbHVkZToNCj4gPiA+ID4NCj4gPiA+ID4gICAgKiBUaGUgZmlsZSB3YXMg
ZGVsZXRlZCwgcmVuYW1lZCwgb3IgbW92ZWQgdG8gYW5vdGhlciBsb2NhdGlvbi4NCj4gPiA+ID4N
Cj4gPiA+ID4gICAgKiBBbiBpbnN0YWxsIG9yIHVuaW5zdGFsbCBwcm9jZWR1cmUgZGlkIG5vdCBj
b21wbGV0ZSBzdWNjZXNzZnVsbHkuDQo+ID4gPiA+DQo+ID4gPiA+ICAgICogVGhlIGluc3RhbGxh
dGlvbiBwYWNrYWdlIHdhcyBmYXVsdHkgYW5kIGNvbnRhaW5lZA0KPiA+ID4gPg0KPiA+ID4gPiAg
ICAgICAiL2hvbWUvam9ja2UveW9jdG8teHIvYnVpbGQvaW5mbi14ci9nbWN1L3RtcC93b3JrL3g4
Nl82NC1uYXRpdmVzZGsteHJzZGstbGludXgvbmF0aXZlc2RrLWdycGMvMS41Ni4yL3JlY2lwZS1z
eXNyb290L29wdC9pbmZuLXhyLzEuMC9zeXNyb290cy94ODZfNjQteHJzZGstbGludXgvdXNyL2xp
Yi9jbWFrZS9wcm90b2J1Zi9wcm90b2J1Zi10YXJnZXRzLmNtYWtlIg0KPiA+ID4gPg0KPiA+ID4g
PiAgICBidXQgbm90IGFsbCB0aGUgZmlsZXMgaXQgcmVmZXJlbmNlcy4NCj4gPiA+IExvb2tpbmcg
YXQgZmFpbGluZyBwYXRoOg0KPiA+ID4gcyAvaG9tZS9qb2NrZS95b2N0by14ci9idWlsZC9pbmZu
LXhyL2dtY3UvdG1wL3dvcmsveDg2XzY0LW5hdGl2ZXNkay14cnNkay1saW51eC9uYXRpdmVzZGst
Z3JwYy8xLjU2LjIvcmVjaXBlLXN5c3Jvb3Qvb3B0L2luZm4teHIvMS4wL3N5c3Jvb3RzL3g4Nl82
NC14cnNkay1saW51eC91c3IvDQo+ID4gPiAuLyAgLi4vICBpbmNsdWRlLyAgbGliLyAgc2hhcmUv
DQo+ID4gPg0KPiA+ID4gVGhlcmUgaW4gbm8gYmluIGRpciBhdCBhbGwuIEluIGxpYiB0aGVyZSBh
cmUgbG90cyBvZiBsaWJzLCBpbmNsdWRpbmcgbGlicHJvdG9idWYtYy5zbw0KPiA+ID4gVG8gbWUg
aXQgZmVlbHMgbGlrZSBiaXRiYWtlIHNvbWVob3cgZmFpbGVkIHRvIGluc3RhbGwgIHJlcXVpcmVk
IGJpbi9wcm90b2MtMjMuNC4wIGZpbGVzDQo+ID4gPiBidXQgbWlzc2VzIHRoZSBiaW4gZmlsZXMg
YXMgdGhlc2UgYXJlIG5vcm1hbGx5IG5vdCBuZWVkZWQgd2hlbiBidWlsZGluZy4NCj4gPiA+DQo+
ID4gPiBvciBwZXJoYXBzIGl0IGlzIHJld3JpdGluZyAgdGhlIHBhc3NlZCBwYXRoPyBXaGF0IGlz
IHBhc3NlZCB0byBjbWFrZSBpczoNCj4gPiA+ICIvaG9tZS9qb2NrZS95b2N0by14ci9idWlsZC9p
bmZuLXhyL2dtY3UvdG1wL3dvcmsveDg2XzY0LW5hdGl2ZXNkay14cnNkay1saW51eC9uYXRpdmVz
ZGstZ3JwYy8xLjU2LjIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHJvdG9jIg0KPiA+
ID4NCj4gPiA+IGJ1dCBiaXRiYWtlIHNvbWVob3cgcmV3cml0ZSB0aGlzIHRvOg0KPiA+ID4NCj4g
PiA+ICIvaG9tZS9qb2NrZS95b2N0by14ci9idWlsZC9pbmZuLXhyL2dtY3UvdG1wL3dvcmsveDg2
XzY0LW5hdGl2ZXNkay14cnNkay1saW51eC9uYXRpdmVzZGstZ3JwYy8xLjU2LjIvcmVjaXBlLXN5
c3Jvb3Qvb3B0L2luZm4teHIvMS4wL3N5c3Jvb3RzL3g4Nl82NC14cnNkay1saW51eC91c3IvYmlu
L3Byb3RvYy0yMy40LjAiDQo+ID4gPg0KPiA+ID4gTm90aWNlIHRoZSBjaGFuZ2UgdG8gInJlY2lw
ZS1zeXNyb290L29wdC9pbmZuLXhyLzEuMC9zeXNyb290cy94ODZfNjQteHJzZGstbGludXgvIiBp
biB0aGUgbWlkZGxlLg0KPiA+ID4NCj4gPiA+ICAgSm9ha2ltDQo+ID4gRllJLCB0aGlzIHdvcmtz
IGFyb3VuZCB0aGUgcHJvYmxlbToNCj4gPiBjYXQgLi9tZXRhLXhyL3JlY2lwZXMtZGV2dG9vbHMv
Z3JwYy9ncnBjXyUuYmJhcHBlbmQNCj4gPiAjSGFjayB0aGUgbmF0aXZlc2RrLWdycGMsIGNvcHkg
cHJvdG9idWYncyBwcm90b2MqIGZyb20gc3lzcm9vdCB0byAke1NES1BBVEhOQVRJVkV9DQo+ID4g
I0ZvciBzb21lIHJlYXNvbiBuYXRpdmVzZGstZ3JwYyB3aWxsIG5vdCBmaW5kIGl0IGFuZCBidWls
ZCBmYWlscyBvdGhlcndpc2UuDQo+ID4gI1VuY2xlYXIgd2hhdCB0aGUgYnVnIGlzIGJ1dCBzdXNw
ZWN0IHVwc3RyZWFtIGJ1Zw0KPiA+DQo+ID4gZG9fY29uZmlndXJlOnByZXBlbmQ6Y2xhc3MtbmF0
aXZlc2RrICgpIHsNCj4gPiAgICAgIE1ZX1BSRUZJWD0iJHtUT1BESVJ9L3RtcC93b3JrL3g4Nl82
NC1uYXRpdmVzZGsteHJzZGstbGludXgvbmF0aXZlc2RrLWdycGMvJHtQVn0iDQo+ID4gICAgICBN
WV9GUk9NPSIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vIg0KPiA+ICAgICAgTVlfVE89
Ii9yZWNpcGUtc3lzcm9vdC8ke1NES1BBVEhOQVRJVkV9L3Vzci9iaW4vIg0KPiA+ICAgICAgbWtk
aXIgLXAgIiR7TVlfUFJFRklYfSR7TVlfVE99IiAjIENyZWF0ZSBtaXNzaW5nIERFU1QgZGlyDQo+
ID4gICAgICBjcCAtYXAgIiR7TVlfUFJFRklYfSR7TVlfRlJPTX0icHJvdG9jKiAiJHtNWV9QUkVG
SVh9JHtNWV9UT30iDQo+ID4gfQ0KPiA+DQo+ID4gQ0NpbmcgeW91IFN0ZXZlIHNob3VsZCB5b3Ug
aGF2ZSBtaXNzZWQgdGhpcyByZXBvcnQuDQo+ID4NCj4gPiAgIEpvYWtpbQ0KPg0KDQo=

