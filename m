Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800C7C77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:32:42 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web11.44847.1685345557628172782
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 00:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WOAOEbDQ;
 spf=pass (domain: siemens.com, ip: 40.107.13.59, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jizqpq1Hc4tFY5ocX0X83J81rtRLOU2eceuNrxISIhKl097NpYFLP4b43xoxoEgpBcoTo4XKFI50hfrZHfFd0g8BjMca6LXDsi09tmHPnG6MOzYWE7JqIyOFOzpAY45hEPQZepQ/We9HR+drnebVKJ5ZL0u8fazUhHUL8hfgnJmJafj9tjqb9yqU8G1MBj2DxvFhupJ8mnqGtGro5ETM9+X7AzxnEtLP1243+oJvztsB47V/vwP1mJbJSGzomBbWvLRtpSO8dEXy3CbpFi4fHRYy83iDpOgf/LTcgsAT6AozCSBxX7W1XUuoUPfu7Rxy7Px59gSCZKuwks6vG7rEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmC/qRNkEDVyDJRLhAFwa+KEkntL//Ybv3x8HVaaE1s=;
 b=jqrO1PZe2H+vNdIeao6YBZN7qIKU2Jwd375a16OMHN01j3xEZeSgIMUnapO5gynzKRT914IZutJrcI6Rn/6gFJtelzi2BnFkdodaNIUsVnzrdm3yiHzNBnCUef7Fn5bro0EebzfS8kGgrb9tUvCHXk/NKLfjORWHqrf9v0/WRDBnlXjpASqneR07HUh9j3D3Tv6+qJIrtBcYrba9DxBfBCX1PolmC/Bo/1tJbkvC+syOW2WPoiWFklDz3J6LANoXEzmyynu/s9gxa6nhrAeabWEU17Xob0O1KbzmpzjXJgs2PexlzGt7ID3tohVZ5Byrf7RYjD8sLjR4RCVC7z3Lqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmC/qRNkEDVyDJRLhAFwa+KEkntL//Ybv3x8HVaaE1s=;
 b=WOAOEbDQq7AnQpOO0z9TdEIkGEMs/L6qaNsUvMGQVzT9cf3RkVX2IvFg2j0iPJKk0iNgBe7gQansBEbU0LJYmdX3GcokMKjLd9BCy5A/BqoavJ/anrNnCOu8vPB9ml6KQW32AQm9NErLcZ1UKTHVeS8N0d8++xUVm0f004JRyCwZpsgGabCTQmZsG+mg3LDLNTmyuU/bI5lR3i3Ngy26K4D0f/sKiPcWDLHU3o8u/a3AmAUXVOp7tbA5sU3GqSBdELeTyFtPiGW29DJv762pRWdLjyBXXLccqWWp8RupnBHCbrcsZM8UsXtcHvnp647thSzYD8w7OzpT77745v4dsA==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB5979.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Mon, 29 May
 2023 07:32:34 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a%6]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 07:32:34 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	<mikko.rapeli@linaro.org>, "Marko, Peter" <Peter.Marko@siemens.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Topic: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Index: AQHZihqbG5G4I0dS2UWqCx2nZGAKF69hksWAgARfQ4CAAZ5wgIAJWsmA
Date: Mon, 29 May 2023 07:32:34 +0000
Message-ID: <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
	 <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
In-Reply-To: <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DB9PR10MB5979:EE_
x-ms-office365-filtering-correlation-id: 0d981fcc-3da5-42f3-1a27-08db6016de7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Lu4vs3UmEtSDHY9VzJSEledQJRRa7WmkbjrkgADbdF7UErs3wzwE8xfs/9XlSD3jj/47AaIw0qU6gc62AcOZv272QrrZE515WAgMzZhLB5jwTM/ZgPgnlxHClXGW9mxZS2/I7/D3LnNptKDdwlHmvnzWpLUOfHHSog4YUY6Scy4AL0sLE8asgWtUscHI1eBWWPrRgLVBYw+j8awNfa2aBdBq00EbeSir4ICIQNj8I0z8xFLatiHzanBWrwvDf9j+fW85ZxHYcdTqZg1192ljwzQJI2kciaTccGPs206+X8U5fgU2lWPiXuA2Canm2FKVNZoLtlT50b1JFTBXilVJLqlWYopwIPpNmbH0N2cOWeur9lzf38nofNDQrHwYRYVz9jnGOZu9LOeHhf66D2CfseesMCwj1AFu/ssBKGQeYet9NfCg1YE8SewFJvL57A6+k3TIPKEEhKPz5kuha2tFYTgYbXbAZFCiFEdIxszEzo6elAiBR0MSje2BMBMILxcaXnQ98T8Ibfv+EkMw3VAPrXNHEkUfFOZb7rEsgDMtVkU947UolPwO9ntUp7gRF/eVX94VC+oEinauzEtk0YQ+NEvKBvEb7eyb2xs3nMs4Kmg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(54906003)(5660300002)(91956017)(76116006)(86362001)(66446008)(478600001)(6486002)(66476007)(66946007)(66556008)(8936002)(8676002)(966005)(6512007)(6506007)(66899021)(26005)(107886003)(71200400001)(316002)(41300700001)(64756008)(6916009)(4326008)(186003)(38070700005)(2616005)(83380400001)(2906002)(36756003)(122000001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q3J1anNKWEJpSHdJeHZkNHRiZlI4U2FUY2Y0cXE4N1orRW1EbWI5VVRTZHZm?=
 =?utf-8?B?L0NmdGpZNm85eVJpY1J0QmFMTGpQbGVnOXhSeXpBRkx4cktOUkgwYnZseE5t?=
 =?utf-8?B?SUlyOGVOMDZBRjdkMUxlS1hORVF5WTRHM2MwRVRuNVV0SVhRM2VJenFIRXpK?=
 =?utf-8?B?Z2NQUURwdVhzaGFNakxJTGlVaDFHc1FaUllxUjhjV3JBb3IrVE52SmtQeHFF?=
 =?utf-8?B?WjFoZnZ1WmNvVXZ6dktUSFp4cnY0Wk0rM3dKdzJKS1dJb09pOTJYT091OW1Z?=
 =?utf-8?B?Qml5RlNINk9HcCtSN0JsNDBIOU5KcVJpYklXYVp5eDRHbkhXRU0xZGd3aFJs?=
 =?utf-8?B?S2hOVE5Bb3RRaDVWMmRlUjBkYiszMXJYcVZ5MXFsbFBSWERObnpYMkVuMHZt?=
 =?utf-8?B?d3lRaEJDTTdkRllGclc2ZlNRWkdaYzBvRFdESmZuRlgxTU9qdGlKb0h0NlpV?=
 =?utf-8?B?T1JaY2xDamh5TlBvN2IvK1dZQVNPTHQ0L1JiQXlEd1BpZXFQRUFJWHl3Syti?=
 =?utf-8?B?VTM4VXdvRGZmTFNCYmdheE9DdTM1VzAwK0pIQTFDMDNDdVJiSWZkelZSaFkz?=
 =?utf-8?B?eXdQdFMrNnNPWEh2aVk5MkErUmR3eGpDa1h2dHVMZnlyUHZIS3g5N2p3eEpC?=
 =?utf-8?B?Z2FyQWdxcmJrQzd5QkNOQXBOWWZLUjVlYjZHOUt4ZSs2Y0JuUzdBTVdKZkM5?=
 =?utf-8?B?VDBmQ2RMc0hIZytweE5vYTgxVWszdzZCWUx1ZTY4MGZGYlZONkxEZm5OZXlP?=
 =?utf-8?B?Uk14NTNBY1F6ektscjJWYXJJbjhtT0xGQ3RmZEZjQysyUHI5ZlFRc1FUMzVl?=
 =?utf-8?B?NitCVG9zOE5JVmNxK3o4NDhGQ3RxNm51QkR0RDM3eWh0eXJEU3FEMFRTdWRG?=
 =?utf-8?B?SXg3c0tKbmZCZjJycTlFKy9telFxMUxqdHBMRDZHRWUvcE5pLzliWWJXblM5?=
 =?utf-8?B?UlNVU3JvNW9CYlQvNFkyUE9FUUREYmxreXdiZTdFTVZpNTlva1NidFJvM29R?=
 =?utf-8?B?dnd2dExoZkRZN3E3VXNJZ0cyOUVrVkcvSGdaallETE8rM05yeGpQWEFpalk3?=
 =?utf-8?B?aHNCRkt1OUFabW1RVVdFdnBTditMTlRBNnA5RWFlQzBPV3lueW9IVkZpR3VC?=
 =?utf-8?B?T1hGYXkrTndIZVllb0phUkFMOThWeWw3NFhYLzg2RDRmMFhydDFqSHdQK0pR?=
 =?utf-8?B?czFJcG1QU0hkWWs5SkVQaS9QWk9hb3lVRXc2Vm9yQ0ljUUhNTE5EcEdMN1li?=
 =?utf-8?B?QWJzU2dlTE5oWU1JM09neS9uazFpdVlmdTJ2MDdldzBlZW9hNE56Y2htVUgv?=
 =?utf-8?B?MUlsa0NyNDVRUHVEdVBrVG8wNmxnUHpBQXdibjFmejJzUkJnelpNa2g4SnBo?=
 =?utf-8?B?NmtLS01HWXBUN0VWQ1JNOVNKVW5TbFlTSllsZlpwcTh2c0dqcWF6QlRPWXEw?=
 =?utf-8?B?aGYrVmZxOHFGWG8vSDVLcnlZNGlVQ2p1V1h6TWF3M05VYjEwZUtpM1JsVm9W?=
 =?utf-8?B?VVhBZ0JCT1JFdDMrejFKaHcxS01EUzU5Qk5YOTFydXBSZHpnOFQ0VGhvMmJX?=
 =?utf-8?B?V0xqNmoyNll0NVFQYzNzOXo0b3ZiSFZVTHFTWWhsWU11TVJHcWIvNUpGUnMw?=
 =?utf-8?B?K0pkbkZSNzlCWmpyeFRLTW5wMlJoYWNlMDlZb0Q3K2lMTWVXRjR6a29nUEh5?=
 =?utf-8?B?ejZyOUdXenNxbXFNejQ5VDZmc05mQVlVTzUyd2ZMT3Z0SHB6cHBQSkxTcGRF?=
 =?utf-8?B?YXJGNzNjd01GRDFQcmZudTdUM241czR6TERJcEVXS3NzV3dWdzZmVnViRkgz?=
 =?utf-8?B?bjZFajRkbU01cnl2ZFlQZm05VDhlMkM5YUEwQTRMUWdMbjFYMzMrZXMrTkFv?=
 =?utf-8?B?Ty9lNWxmUUtOYjZxR0hHeDh2elJNeFc1YklpZmc4dVFDMFNSUmlmYURncVgw?=
 =?utf-8?B?Q1RDL3hNU3A1Unk3MW51a05RdVZmRTl3WGlkME1ySlpoQyt5Mm1COUZwU0JE?=
 =?utf-8?B?SkN2alcwS1FVeG5uYUJjbDNiVXQrcjNyWFdIWk4rMmUvM0hSWC9ySG1lcEdV?=
 =?utf-8?B?UG9jVDVGTTRkVXNjd3ZNRkxZOEV2L1BxZEt1WjV5ZWI1Q1JPS0ZBdjl4WW8z?=
 =?utf-8?B?emdDakNqQ21vQk1YZy9jTGVGbGpxNHpWc2RkbnZNNDF2bnFNajYyNjZkNUdS?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44A74BD80A098A4B860C5A021D3BC59E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d981fcc-3da5-42f3-1a27-08db6016de7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 07:32:34.0999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQWFmbJ681SB01fZUJwjUbgcAw0zi9Hx8ezP8i6luPFfLQgJETmMV1Kfab3umRoynfE34K0HglKRhMJw2/M0whDrYhq/34r7j497hIn7HKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 07:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181854

SGVsbG8gYWdhaW4gUmljaGFyZCwNCg0KTWF5YmUgdGhpcyBlbWFpbCB3YXMgbGl0dGxlIGJpdCB1
bmNsZWFyLi4uLCBzbyBJIHdpbGwgdHJ5IHRvIHJlY2FwIGl0IGhlcmUuDQpUaGVyZSBhcmUgMiBv
cGVuIHBvaW50cywgd2hlcmUgc29tZSBmaW5hbCBkZWNpc2lvbiBoYXMgdG8gYmUgbWFkZS4NCg0K
LSBDb3VsZCB3ZSByZW5hbWUgdGhlIENWRV9TVEFUVVNfUkVBU09OSU5HIC0+IENWRV9TVEFUVVNf
UkVBU09OPyBUaGUgZmlyc3QgaWRlYQ0KY2FtZSBmcm9tIHlvdS4NCi0gV2hhdCBpcyB0aGUgZmlu
YWwgZW51bSBmb3IgQ1ZFX1NUQVRVUz8gSSB3b3VsZCBzYXkgInBhdGNoZWQiIGFuZCAiaWdub3Jl
ZCIuDQpBZmFpaywgdGhlICJub3QgYXBwbGljYWJsZSIgc3RhdHVzIGNhbWUgYWxzbyBmcm9tIHlv
dS4gU2hvdWxkIHdlIGtlZXAgaXQsIG9yDQpyZW1vdmUgaXQ/IE9mIGNvdXJzZSBhbGwgb3RoZXJz
IGFyZSBqdXN0IGxpa2UgYW4gYWRkaXRpb25zIHdoaWNoIGNvdWxkIGJlDQppbXBsZW1lbnRlZCBs
YXRlciBvbiByZXF1ZXN0Lg0KDQpTbyBwbGVhc2UsIHRha2UgYSBsb29rIG9uIGl0IGFuZCBtYWRl
IGEgZmluYWwgZGVjaXNpb24uDQoNClRoYW5rIHlvdSwNCkFuZHJlag0KDQpPbiBUdWUsIDIwMjMt
MDUtMjMgYXQgMTA6NDEgKzAyMDAsIFZhbGVrIEFuZHJlaiB3cm90ZToNCj4gSGVsbG8gUmljaGFy
ZCwNCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2sgb24gdGhlIGxhdGVzdCByZXZp
c2lvbiBhIG1ha2UgYSBkZWNpc2lvbiB0aGVyZT8NCj4gVGhlcmUgYXJlIHN0aWxsIGJ1bmNoIG9m
IHVuY2xlYXIgc3RhdGVtZW50cy4gU28gcGxlYXNlIG1ha2UgYSBmaW5hbCBkZXNpZ24gYW5kDQo+
IHdlIHdpbGwgdHJ5IHRvIGltcGxlbWVudCBpdC4NCj4gDQo+IFRoYW5rIHlvdSwNCj4gQW5kcmVq
DQo+IA0KPiBPbiBNb24sIDIwMjMtMDUtMjIgYXQgMTA6NTcgKzAzMDAsIE1pa2tvIFJhcGVsaSB3
cm90ZToNCj4gPiBIaSwNCj4gPiANCj4gPiBPbiBGcmksIE1heSAxOSwgMjAyMyBhdCAwMzoxMTo1
N1BNICswMjAwLCBNYXJ0YSBSeWJjenluc2thIHdyb3RlOg0KPiA+ID4gSSdtIG1pc3NpbmcgYSBz
dGF0dXMgdG8gY292ZXIgdGhlIHNpdHVhdGlvbiB3aGVuIHRoZSBOVkQgKG9yIGFueSBvdGhlcg0K
PiA+ID4gZGF0YWJhc2UpIGhhcyBhbiBpbmNvcnJlY3QgZW50cnkuIFdlIGhhdmUgcXVpdGUgbWFu
eSBvZiB0aG9zZS4gVGhpcyBtaWdodA0KPiA+ID4gYmUgYSB0ZW1wb3Jhcnkgc2l0dWF0aW9uLCBi
dXQgbm90IGFsd2F5cy4NCj4gPiA+IA0KPiA+ID4gU1BEWCAodGhlIDMuMCBkcmFmdCkgaGFzIHNv
bWUgb3RoZXIgcG9zc2libGUgcmVhc29ucw0KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NwZHgv
c3BkeC1zcGVjL2Jsb2IvdnVsbmVyYWJpbGl0eS1wcm9maWxlL2NoYXB0ZXJzL3Byb2ZpbGUtdnVs
bmVyYWJpbGl0aWVzLm1kDQo+ID4gPiBXaGF0IGxvb2tzIGxpa2UgaW50ZXJlc3RpbmcgaWRlYXMg
YXJlOg0KPiA+ID4gKiAiQ2FuJ3QgZml4IiAvICJXaWxsIG5vdCBmaXgiDQo+ID4gPiAqICJOb3Qg
YXBwbGljYWJsZSIgKFNQRFggbGFuZ3VhZ2U6IEluZWZmZWN0aXZlKSB3aGVuIHRoZSBjb2RlIGlz
IG5vdCB1c2VkDQo+ID4gPiAqICJJbnZhbGlkIG1hdGNoIiAodGhpcyBpcyBvdXIgTlZEIG1pc21h
dGNoIGNhc2UpDQo+ID4gPiAqICJNaXRpZ2F0ZWQiIG1lYXN1cmVzIHRha2VuIHNvIHRoYXQgaXQg
Y2Fubm90IGJlIGV4cGxvaXRlZA0KPiA+ID4gKiAiV29ya2Fyb3VuZGVkIg0KPiA+IA0KPiA+IFRv
IG1lIHRoZSBTUERYIGRldGFpbHMgZG9uJ3Qgc2VlbSB2ZXJ5IHVzYWJsZSB3aGVuIGFjdHVhbGx5
IG1haW50YWluaW5nDQo+ID4gYSBsaW51eCBkaXN0cm8gZm9yIGEgbG9uZyB0aW1lLiBBbnlvbmUg
ZnJvbSBtYWpvciBMaW51eCBkaXN0cm8NCj4gPiBzdGFibGUvc2VjdXJpdHkgdGVhbXMgcGFydGlj
aXBhdGluZyBpbiB0aGUgd29yaz8NCj4gPiANCj4gPiBTbyBJJ2QgcmF0aGVyIGNvbXBhcmUgdG8g
RGViaWFuIHNlY3VyaXR5IHRyYWNrZXIgQ1ZFIHN0YXR1cyBkYXRhIGFuZCBhc2sNCj4gPiB3aGF0
IG91ciBMVFMgYW5kIG1hc3RlciBicmFuY2ggbWFpbnRhaW5lcnMgYW5kIHRob3NlIGluIHRoZSBj
b21tdW5pdHkNCj4gPiB3aG8gbWFpbnRhaW4geW9jdG8gYmFzZWQgU1cgc3RhY2tzIG5lZWQuIERv
IHRoZSBtYWludGFpbmVycyB3YW50IHRvIHJlYWQNCj4gPiBTUERYIG91dHB1dCwgZm9yIGV4YW1w
bGU/IFdoYXQgY29tbW9uIHN0YXR1c2VzIGRvIHRoZSBtYWludGFpbmVycyB3YW50IHRvDQo+ID4g
ZW5jb2RlIGZvciBlYWNoIENWRT8NCj4gPiANCj4gPiBEZWJpYW4gc2VjdXJpdHkgdHJhY2tlcg0K
PiA+IGh0dHBzOi8vc2VjdXJpdHktdGVhbS5kZWJpYW4ub3JnL3NlY3VyaXR5X3RyYWNrZXIuaHRt
bA0KPiA+IHNob3dzIHN0YXRlczoNCj4gPiANCj4gPiDCoCogdnVsbmVyYWJsZTogYmluYXJ5IHBh
Y2thZ2Ugd2l0aCBzcGVjaWZpZWQgdmVyc2lvbiBpbiB0aGVpciBkaXN0cm8NCj4gPiDCoMKgIHZl
cnNpb24gaXMgdnVsbmVyYWJsZSB0byB0aGUgaXNzdWUNCj4gPiANCj4gPiDCoCogZml4ZWQ6IGJp
bmFyeSBwYWNrYWdlIGluIHRoZWlyIGRpc3RybyB2ZXJzaW9uIGhhcyBmaXhlZCB0aGUgaXNzdWUN
Cj4gPiANCj4gPiDCoCogdW5kZXRlcm1pbmVkOiBpdCBpcyBub3QgeWV0IGNsZWFyIGlmIHRoZSBp
c3N1ZSBhZmZlY3RzIERlYmlhbiBhbmQNCj4gPiDCoMKgIHRoZWlyIHZlcnNpb24gb2YgdGhlIHBh
Y2thZ2VzDQo+ID4gDQo+ID4gQW5kICJ2dWxuZXJhYmxlIiBoYXMgc3ViIHN0YXRlczoNCj4gPiAN
Cj4gPiDCoCogaWdub3JlZDogdGhlIGlzc3VlIGRvZXMgbm90IGltcGFjdCBEZWJpYW4gcGFja2Fn
ZXMNCj4gPiANCj4gPiDCoCogcG9zdHBvbmVkOiBubyBzZWN1cml0eSBwYXRjaCB1cGRhdGVzIHdp
bGwgYmUgcHJvdmlkZWQsIGUuZy4gc3VjaCBhDQo+ID4gwqDCoCBtaW5vciBpc3N1ZSB0aGF0IHVw
ZGF0ZSB3aWxsIGhhcHBlbiBmb3IgZXhhbXBsZSB2aWEgbm9ybWFsIHBhY2thZ2UNCj4gPiDCoMKg
IHZlcnNpb24gdXBkYXRlcyB0byBuZXh0IHN0YWJsZSB2ZXJzaW9uDQo+ID4gDQo+ID4gVGhlcmUg
YXJlIGEgbG90IG9mIGFkZGl0aW9uYWwgInN0YW5kYXJkcyIgYW5kIHN1YiBzdGF0ZXMgd2hlbiBs
b29raW5nIGF0DQo+ID4gQ1ZFIGRhdGEgaW4gdGhlIHRyYWNrZXIgKGluZm8gbm90IHB1YmxpYywg
bm8gdXBzdHJlYW0gZml4IGF2YWlsYWJsZSwgbm90DQo+ID4gc3VwcG9ydGVkIGNvbmZpZ3VyYXRp
b24gZXRjKSwgYnV0IHRob3NlIG1ham9yIGhpZ2ggbGV2ZWwgc3RhdGVzIGFyZSBlbm91Z2guDQo+
ID4gQW5kIHRoZW4gdGhlcmUgYXJlIHNlY3VyaXR5IHJlbGV2YW50IGJ1Z3Mgd2l0aG91dCBDVkVz
Lg0KPiA+IA0KPiA+IEkndmUgYmVlbiBoYXBweSB3aXRoICJVbnBhdGNoZWQiLCAiUGF0Y2hlZCIg
YW5kICJJZ25vcmVkIiBzdGF0ZXMgZm9yDQo+ID4gZWFjaCBDVkUgZGV0ZWN0ZWQgYnkgY3ZlLWNo
ZWNrLmJiY2xhc3MuIFRoZXJlIGNvdWxkIGJlIGEgZmV3IG1vcmUgc3ViDQo+ID4gc3RhdGVkIHRv
ICJJZ25vcmVkIiBhbmQgdGhlICJQYXRjaGVkIiBzdGF0ZSBzaG91bGQgYmV0dGVyIHJlZmxlY3Qg
cmVhbGl0eSwNCj4gPiB3aGljaCB0aGlzIHBhdGNoIHNldCBoZWxwcy4gQnV0IEknbSBoYXBweSB3
aXRoIHRoYXQuDQo+ID4gDQo+ID4gSSdtIG5vdCBzbyBoYXBweSB3aXRoIHRoZSBTUERYIHN0YXRl
cyBuYW1lcyBhbmQgbWVhbmluZ3MuDQo+ID4gDQo+ID4gQ2hlZXJzLA0KPiA+IA0KPiA+IC1NaWtr
bw0KPiANCg0K

