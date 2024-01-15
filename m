Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F201C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:17:16 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.61])
 by mx.groups.io with SMTP id smtpd.web11.80864.1705328235922671038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=vgO0hr9e;
 spf=pass (domain: iris-sensing.com, ip: 40.107.127.61, mailfrom: jasper.orschulko@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfnCGE9iTTm+bhhRI4qHmIs84xWBNSUvXzNGdOEnOo1iwSUOaeWCarue3fEU0D+mkVOb2zwdYgx5kV3uLY5GRb3ACWIj7Xld/CJQNFbKvku3ZmZ52JEltJarD4STcxnkhPmIXIKiqSOovvArZtCNSzUv1o705c2okJGj6uvNiaIopZOB2t6OdZ6iWBaaxvqujo/6Zb5hYcxqti+VkxDatSEIPwd4sWACZk0y4fj5NtKE9jpZijuVUrpZ4j97dXcq2a9uMB62IWQmtjcYexj/7WzeFHdAw0E5eSDeWJ67Zn5sfoil1KZZ2sI3IUjqPSOfUdAY4t2vhAB+afH/JKmgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6Yk8bMkxaHaxmyvzbiOYkpBhMfer05AmFP+jdKyOtA=;
 b=IB367nmxoBtfqsV09Map5r5pWwWNtaDWfqkQq/EBv1PT3Nu5H7XG3xD5rRg07lm/9gok8ckWF7PqvF8Du79lxj4x8Hln3dBwWhzHY/F2TF8TxSl9j0dLup4UVuPGJBsfYFbWf50hjM+M/f5tXjCcqWkbaYhOq/dJhE7xg7niLNjalOB6gfCfhCERh6mBcCTt5RKeXWS9U879Eu+A2QA4jIt6n8CMLamZI1fQCZbeCVNvQGRbq06DNHpH9vH5L/FgODfYkDptj42ousKxWHmksa2MaEsqmCphK04K2H5DsBANqu6nf144S7gcjQPgU8bbLB5i9bO8kTdgeTj669V6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6Yk8bMkxaHaxmyvzbiOYkpBhMfer05AmFP+jdKyOtA=;
 b=vgO0hr9etmWg4wv4ZU9DSvKLnpxm0lPvMUZ16kHk75Ab+VCfHQrRQqjnGCoq10JVc9Bn1IKjIvx34Iim9sslDWskAaBvhRRqcfzDNeqYDlN6ELTC5cPJpJMhFM2E3FekmF+MUCuxrW9eVzEbBippBhoUTwj7g/7+8PVTRsDn9/Bp/w0iQaTG4v18KuqAYbJz0jRq/GlngQoSGIXX82Hl9aP8AktsKnNtOORK/RNBX5DlfmSLs7GRBrGrrnnz8/PZoQ+Bxtk5/x5pAP2783YlfeL/4h/KElEXw17F8Su7uWwXYPFjoxEpnScjzrC8/lo9Dvp2qCE2r7B6sOO1EUEqlw==
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:3d::14)
 by FR2P281MB3085.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:60::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.24; Mon, 15 Jan
 2024 14:17:11 +0000
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a]) by FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 14:17:11 +0000
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "alberto@pianon.eu"
	<alberto@pianon.eu>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Topic: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Index: 
 AQHaR01toZjDsnahoEKeitp4QsxNjbDabEdvgAArzoCAAE3pAIAAAVEAgAABU4CAAAKKCoAAAUiA
Date: Mon, 15 Jan 2024 14:17:11 +0000
Message-ID: <6514ea985fa4a0882142469baf10dd4e349f8b64.camel@iris-sensing.com>
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
	 <17AA7149AA53F0BC.13033@lists.openembedded.org>
	 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
	 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
	 <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
	 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
	 <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com>
	 <17AA8A5B1D8D95A7.13033@lists.openembedded.org>
	 <CANNYZj-LNrV6kJiyGLej+jy=7W-eoxUX9DX5wqf_jV2oJ2R7Jw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-LNrV6kJiyGLej+jy=7W-eoxUX9DX5wqf_jV2oJ2R7Jw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1963:EE_|FR2P281MB3085:EE_
x-ms-office365-filtering-correlation-id: ce3106d1-bb38-4d8c-8cc3-08dc15d4aa80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JHKHBoqjlDlCS4h79USjOmSSXpr2fF6Md0AeKCeKZRY9wZinTC2xMC04+3rB6YPus9kJzjvZERGrOPSEaIc9p35dI33YtMwQvjAaQQj1iZkWkfahJ85TAgg4STdq4GyNHPIFi6QLpgC3A1dLlz9tJPVBm7sLroclJjMSK+kMQCgZpPgtunuDY3kp3l/HQS5RZLfPjaC1KDhIEo8S1nOzrd9LVM8+nPEZGRrJbURuBpfm7p/I0ADLpO+0q4l5UWkcOgkwBowCdmMQ9VaQZIKViBJnaPo7Qlzcq+9WTnUt1DFengkX4r0mV1tKR/6wPvkM6TmAhdDB+0wI+A2U4p6FkB/cwS6JRAtjzS0bGWeeCEyZu7Qg3h/RWPUOchhHWoLrWu8mLOsY79UNvVkjYJEeWsnnWJxD81PrZw6qx1/gPAUaqYA7HKBjD7UyJT8RDi+U5ONciDDBXcBKa68kIgG3jGNSGxt00w4tJSF3wEvz5Xu1/YB5+nlTG2MM8dGbbnkGZwV2BZl4hrKoEoS6VTzx/YQhXeU9YBY7deVzeqo6l3ttsY4dgVl/U9Kx3o1MHnV9XRyLkqhQLhQUHvjKwL1OfEtM5iQqwaoVgPwhx2Pg40E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39840400004)(366004)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(41300700001)(76116006)(36756003)(86362001)(38070700009)(91956017)(38100700002)(122000001)(26005)(2616005)(6512007)(55236004)(966005)(6486002)(478600001)(66476007)(2906002)(6506007)(66946007)(8936002)(66446008)(64756008)(110136005)(316002)(71200400001)(66556008)(5660300002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UHc4eEN4TmVCaFZqNDBXa3ZoREFDZGJzeHdNWjd3d2JoNGJ2Mi8zdGZ6Q3FU?=
 =?utf-8?B?bzhJQ2pBcmUzU2NrZ0NWVE1NMEtTczRDODF5RnRIY3h5a1NSdkhMdE13TmV4?=
 =?utf-8?B?Q2cvalI4UksyRHBpSXd1T0dCNVdzUldhSnpITlVRYW9sWEVpYW91UHh4dlFk?=
 =?utf-8?B?QVNqaElsYnlvZXlOK0cwS1B6OVJWVmxteW1lNzZmcHFjL3RucVpMNzhFdm5n?=
 =?utf-8?B?SDR4dEpuQkZvWjhZWUR2QzFXZElyZCtuZWxBWTFyN1RTUVE4UzhCcnZ2b3d4?=
 =?utf-8?B?eUcvV2FHMVJ2MFJEc01jMHhxYnZveGtmN0J1c1JhUXpkTUlXK2p3cEJuWTBr?=
 =?utf-8?B?ODhFNG96cW9nK0cxNlF6ZEUyclV2dnZpRytOb2RBK3F6U1VzMnBXYUwwUXVQ?=
 =?utf-8?B?U0tDand4Q1BXWDkyUUZEWXNReXNCOWEvQmh0Q0xEQjhrdEJ4RjlTcjdwcFR2?=
 =?utf-8?B?Wnk4U21ZTDFQQmova3VvT1I4K1dRc3pnY1BPQUJnc29NeER0Ui9WdmpzcUFI?=
 =?utf-8?B?S2FhMWVjdjNtSmNlVW9wWjVtbGIzSDhIdEdDRTRIUlFwNXZMSFBSMzBQaDZp?=
 =?utf-8?B?R0ZXSU1XZlNuUWprYi9QREpKMjNYdm4rZXVKS3NRY3ZaS0N6VUtuM3Y3QTc0?=
 =?utf-8?B?VVQwekFSVlNib25DbUNQaDRyV2hmalJEL1RLdGhYaDhmZ3JINFBHQk45eEFw?=
 =?utf-8?B?UmRzWFBlZDBZL1VlcksrMWczOUNuV1JkNWlSSVF4V3ZBblFOMm1ZWnl2Tncw?=
 =?utf-8?B?Z200c3RudE5MMjI0WWU2V0YyanZ6Tm9rdE1yNjJHcXRjMGRIZzZIcDZRK3JB?=
 =?utf-8?B?bC92dzMvMklGcTlESzc0azZBQWtvemMvbzRqRnBWcFM1QzBhZmJYanpBeFNJ?=
 =?utf-8?B?eldPaHArTFJnQ3YzS3pEWTk1K3BJOTI2bHhaSHN1VGpWKzQ1bzlrVUpPVlEw?=
 =?utf-8?B?UDVTalc2cG1ZWDA3RlE3bFZFWUsxTGFuV2poRXRScktsb25Ici9nNGZYSmN6?=
 =?utf-8?B?aVY1bzVhTHJxR1E2Q0hhckRCMzJYOXh3UktoVXJXcEFwY2VXQXBmSnREdVJL?=
 =?utf-8?B?ZFFRalhObVgrSjFCeXhUQXlyY3FUb1Bkbis0bjhOZ29mM0wxR055bzVudjBM?=
 =?utf-8?B?UUt4U0EwWDY4THRzUE9wVk9xL1RwWmttV1I2aFpmVTlHZVZ1R00zZVJIUVE0?=
 =?utf-8?B?a2ZkcmJTSUQ1N1dPOWlJM296Ym9tWDdkODVUMmpZUDFLQWltQmQvVlE4NW1R?=
 =?utf-8?B?Q1BPT04rUUJhNzVXVkhYU2xWdFdXS2VyMW84M21ZWFBNS0JyNUdDQk5ac0tO?=
 =?utf-8?B?d2N6Z3hTVXo5SlY3VUpwTHhtVUVZajdReDZmeUE4ODJZOE9hQ253T2tXMzl3?=
 =?utf-8?B?WWg4VDR4eTkvOWpteVJQRTZDcUdDalYweHdxbTliMEdiM3BSUEE3Njk1T3RE?=
 =?utf-8?B?Mmc2Ui9Yb2dNQ05zSmFIMFBseU9LdS9DMTBSaDdpYWhZeDhEdzhZRUNKRDAy?=
 =?utf-8?B?OGNlaTZaeGNLM1krS0pPZy9FNnM3Qk1NOUpPM2tsVW1iTW9helhJamU2SHVl?=
 =?utf-8?B?L3UvRGY0Q3MrNWFkelpFbmhReXdQc3RHdzl6eTROVjlVaUxNLzVmV2pNR05r?=
 =?utf-8?B?WTEvbHB1dklyWlFjWkdQTk5KTWtCWEw0R1E5a1dOcERRYjQzMDFVdmtQelZK?=
 =?utf-8?B?cVk1Zy9Za1RDWHNwcWtHUHQvL0tuSThxZzhqZWp3cGtBc1V1SUozWWtBUWdQ?=
 =?utf-8?B?K0VGaG5Peis5dk95NTBQdWVQRHc5aC9xcmJSK3hsb1UrS1JpWkFlOFJWQ25N?=
 =?utf-8?B?U2oxVnNLNG10RFBSMnMvczZDSlp6WHdDTm5hamZ1ZmltaWJCRy8wenAxdkFp?=
 =?utf-8?B?L3BUckNtVVBiZzcxVm1FREVmQkJJaGp4dkNxN0pDeUpFMzA5YzlTS0NHTWVz?=
 =?utf-8?B?aEdVbHBPUUxyZ0RMZzBoQjFXbHdTZmxTYWk2czJsQU9KWkdNN2JGUTNxcU9F?=
 =?utf-8?B?ZlJ2VG9uMU5ydWN1YjAyQmEvSFk5Qy9TSXV0N2E4czRreHd5TVNwbmswdGY0?=
 =?utf-8?B?OUg4MXoxWlJlUDRkRloyWm9QSEFrL29uaUtpYm1tTXFBV2d2cTQvR0VScXZH?=
 =?utf-8?B?T1NMNE03MjhPbkh4bmJmQTVMUU9yOUJFdzZmV1huY3RrNStnRmM4ZzBqaXpk?=
 =?utf-8?Q?BcE0nSoQvWLjJwyBbJVAFII=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D72B1D2F1C1C24A8C2B13E203DB207D@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3106d1-bb38-4d8c-8cc3-08dc15d4aa80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 14:17:11.6898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7W7WfjMYuNxo8Nz8drZ1uxrsTb9Kazl/LhBk49MZzmx7Nnjru+UgASgqn6m0JJb3J35/Qa42KCJLZT69Zl8kXzTNOnFNTgbmZW5pQGSvH5nXy+Nh38MmyvDxfTjhO0x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193684

QWggbmljZSwgdGhhdCBpcyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3ZSB3b3VsZCBiZSBpbnRlcmVz
dGVkIGluIQ0KQWxiZXJ0bywgd291bGQgeW91IGJlIHNvIGtpbmQgdG8gc2hhcmUgc29tZSBkZXRh
aWxzPw0KDQpPbiBNb24sIDIwMjQtMDEtMTUgYXQgMTU6MTIgKzAxMDAsIEFsZXhhbmRlciBLYW5h
dmluIHdyb3RlOg0KPiBPbiBNb24sIDE1IEphbiAyMDI0IGF0IDE1OjA1LCBBbGV4YW5kZXIgS2Fu
YXZpbiB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8YWxleC5rYW5hdmluPWdtYWls
LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiB3cm90ZToNCj4gPiANCj4gPiBPbiBNb24s
IDE1IEphbiAyMDI0IGF0IDE1OjAzLCBKYXNwZXIgT3JzY2h1bGtvDQo+ID4gPEphc3Blci5PcnNj
aHVsa29AaXJpcy1zZW5zaW5nLmNvbT4gd3JvdGU6DQo+ID4gPiANCj4gPiA+ID4gU2FkbHkgaXQg
d291bGRuJ3QuIEF1dG8tZ2VuZXJhdGVkIGdpdGh1YiBhcmNoaXZlcyBhcmUga25vd24gdG8NCj4g
PiA+ID4gYmUNCj4gPiA+ID4gbm9uLWRldGVybWluaXN0aWMsIGFuZCB3ZSBldmVuIGhhdmUgYSBx
YSBjaGVjayB0byBlbnN1cmUgbm8NCj4gPiA+ID4gcmVjaXBlIGlzDQo+ID4gPiA+IHVzaW5nIHRo
ZW0uIEkgZGlkbid0IHJhaXNlIHRoaXMgcG9pbnQgYmVjYXVzZSBteSBvYmplY3Rpb25zIGFyZQ0K
PiA+ID4gPiBvbg0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gcHJpbmNpcGxlIG9mIHVzaW5nIHJlbGVh
c2UgdGFyYmFsbHMsIG5vdCB0aGlzIHRlY2huaWNhbGl0eS4NCj4gPiA+IA0KPiA+ID4gQWggb2ss
IHRoYXQgaXMgaW50ZXJlc3RpbmcuIENvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRlIG9uIHRoZQ0K
PiA+ID4gbm9uLQ0KPiA+ID4gZGV0ZXJtaW5pc3RpYyBuYXR1cmUgb2YgdGhlIGdpdGh1YiBhcmNo
aXZlcz8gVGhpcyBpbmZvcm1hdGlvbg0KPiA+ID4gY291bGQgYmUNCj4gPiA+IHZpdGFsIGZvciB0
aGUgT3NzZWxvdCBwcm9qZWN0IGFzIHdlbGwsIGFzIHRoZXkgY3VycmVudGx5IHVzZSBzYWlkDQo+
ID4gPiBhcmNoaXZlcyBhcyB0aGUgZGF0YSBiYXNpcy4NCj4gPiANCj4gPiBodHRwczovL2x3bi5u
ZXQvQXJ0aWNsZXMvOTIxNzg3L8KgY292ZXJzIHRoZSBzdWJqZWN0IHdlbGwsIEkgdGhpbmsuDQo+
IA0KPiBPaCwgYW5kIGJlZm9yZSBJIGZvcmdldDogQWxiZXJ0byAoaW4gY2MpIGhhcyByZWNlbnRs
eSBkb25lIHNvbWUgd29yaw0KPiBpbiBiaXRiYWtlIHRvIGVuYWJsZSBmaWxlLWxldmVsIHNvdXJj
ZSB0cmFjaW5nLCBwcmVzdW1hYmx5IGZvciBleGFjdA0KPiBzYW1lIHB1cnBvc2UgYXMgeW91IGFy
ZSwgc28gSSdkIHN1Z2dlc3QgeW91IGRpc2N1c3Mgd2hhdCBraW5kIG9mDQo+IGFwcHJvYWNoIGhl
IGVudmlzaW9ucyAob3IgbWF5YmUgaGFzIGltcGxlbWVudGVkKS4NCj4gDQo+IEFsZXgNCg==

