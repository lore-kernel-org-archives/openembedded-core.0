Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06DCC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 14:44:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web11.34496.1701182684830552517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 06:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iHtDhreg;
 spf=pass (domain: siemens.com, ip: 40.107.6.56, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmk9eYcb5Zx/qzdcEOI8YoIF7AvSR/1tNywAYbau19tGUbBLqTuerxWEqF4fG61gXzT1joXu0azUx85gRrITu5QFNWSV3GGfmYve4HaB1WcdiorC7C87ozTLqa3DZo7n4xuvwfbe3TsYoAu809iOHPg1QzJZzx1dE5Cy98yJB6ocj1vLbdFIoQ3rcAqDr+QJzx3JVcY0iu3khGu2I/sNbk456xabnpzrDlDdJto8PA5QBA2b/NfcChmeymxe5jsbfIz/JQFqknpQs53OC98Z9RbwBgK3VOhkgNjxC+yfPQczxyVrub4RBoE8pP9NEy1MFWUgctU+CR4njg7opJ9zYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkSdbXvrqY9FBU2RpeODfOzKvT5FGoYzob39nd142BE=;
 b=fMfVCLqitrFj9ETDnxHjSRks27JcODcskfcGA+3m8pfSQ4cUigx/WiPcoweDdMb9eArIZzZT+ToYMF+nfqkL8xOS7yd08BfwBT8r5OXiKy66aHrq14DKsetwWaTNQOiADx9twl0PwvNoeZZeUc4ZeRO1ETic0oQOygthdo+5PIlxZOrMCgCJIH5IroMxX7brx6r1g+fFt2cBJtTMcCd7s1JJiIM9aTqlxR7HrfrrBa8HLxwPGupMgg6QbDgOj7HYGzw42C3Hb2S9CYSqu0f4ynmOwsgTrSU/nlCZ9XSnKCRvJPT/qXHUUEcffXB5X7TbbLkJF5nii7QRPI5oyvJYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkSdbXvrqY9FBU2RpeODfOzKvT5FGoYzob39nd142BE=;
 b=iHtDhreg3bwMj6+k+/c60ecLfnAo71MAQJQhDyl+IDScFe42XKXdTBQSvCueRoOdbVCrwzJJhFPImO1yYKaHpQJSvDNS7zeBi36CdcgZVqe1EDrhL1cEskiRXcSvQ6modD2y6/R2oRryDxrAOP39IUq47d8rPF0UnJbF9BWm7dGrSvYCEOPAO081XUz+CL7mTvYoqecu1pgiYmTKG3WzaoqxXenC8JkIQ9b82ks6L6HBsMP4ZAyGQLtYTqojyordDnqWw/Q07VowJN4m5HO65nFHHPJ4ep+UHI1T4Rba8PIn2RV57bZQyZfmsAPJrHG34gvc0BHmQw4F2Yh7uAdZhQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB8095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 14:44:41 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 14:44:41 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>
Subject: Re: [PATCH] linux-firmware: use install-nodedup make target
Thread-Topic: [PATCH] linux-firmware: use install-nodedup make target
Thread-Index: AQHaIf2XfJbicLFP+kCeMjlzTNVne7CPumCAgAAFVoCAAALtgIAADDQA
Date: Tue, 28 Nov 2023 14:44:41 +0000
Message-ID: <1a267f3066cbec03e094a0366171c126cf5e5db3.camel@siemens.com>
References: <20231128131954.337015-1-alexander.sverdlin@siemens.com>
	 <CANNYZj92XtmcpJpyo1eo04X1dpqPmU6cCKVhpP7aJnMK6RWPTQ@mail.gmail.com>
	 <e0c37461b71d6159a2867726388fbc052bb4f624.camel@siemens.com>
	 <CANNYZj9PeVWsM9SFoTG_F7rPjB5dhq8ZN0uGMP9hqU0XumCDpg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9PeVWsM9SFoTG_F7rPjB5dhq8ZN0uGMP9hqU0XumCDpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB8095:EE_
x-ms-office365-filtering-correlation-id: 09448ed8-4087-4906-7250-08dbf0208e23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nk9Mrp64nqmq9+tFev1Zy8O0wh3ctEOaZwZyr76b2pBznQeHpiYxbcYsw0weV71s4xLGkY3Suea5Vcw7soNPn578IDyz8rOqMMIn6PZ3nCX2+ydpa6cW3UdCUhzlGDyrdxSsRJmaiGSi6ERGy8cxpD0fSqAiu8agbLpzRApyV8tosCghUmNf1C5uULdcDqqXF2WymOuP7FeaYYPEobjs62DrrRpIeXrpu9GsWJv7vS/WxpCFEFJpSOxGI+QcP08Z3ZVEoYwu9seOuTG72uXxT8Du6aIKQOKoVfP75hZk3f0wz/oL9d67gsGj1fjCpju85PNyUqEkt3yKDy0QqBadlXcMYTdf6QwokSx+3LofvIbTsio11X7e2cHFS1mAJDzIVKpKMjNjRvnrR7/vGZfoInjQO8cNkZXLVF4tW5rHjRKumUxQvxGQ46FOTlArZC1UbhaI/zkuU9yPYyApB/N6xiTpXx9UAKNyIjzXjSI+w3+8cXoxd2aHCUDlCwz1j9/yQymQY/PK0GQPGCSDb9Mz+RwzKtA+MVp/5j6WhnUhs5uWf/It9CwypepS4j6GGaYpG7hMFQLZOaEOFfWeDt7GpzYudijXHLJ6Ey2uIAq8+wm3dJCrhKA8mO5So/SD8oNqUOeBAuj6on3EC+NkuVdcXw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(4001150100001)(38070700009)(15974865002)(83380400001)(5660300002)(82960400001)(26005)(86362001)(107886003)(2616005)(2906002)(122000001)(6512007)(55236004)(6506007)(478600001)(4326008)(71200400001)(8676002)(8936002)(6486002)(66946007)(64756008)(91956017)(76116006)(66446008)(316002)(54906003)(66476007)(66556008)(6916009)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d0VIY3VhditqOU96bC9nRmVORG03emdwS0JGRG1LMXhJQ3l0YWlrZ1kwczNm?=
 =?utf-8?B?eFlXVWFvY0FMWkdzRXJlYWFGMkdBOUJ0MVkvckpqc1d2d2k0YjZNd3pISEI4?=
 =?utf-8?B?YnRCaXRNWnRYeDVwdytTZzl4OUlQOHdJbmdUY0t4V1ViN1ljeDRlb3Rtb3hj?=
 =?utf-8?B?TkQvWlM3ZHpmYnc0K0FvMHVKNW5uZzEwbENxb2FxZGIwYUM4R044TXF3MHIv?=
 =?utf-8?B?bmNTOHNKV3pqQVlLRGR3NDdQZGEyb3MyeXFobEVWVFhXQWJKOFRvYitCOW1B?=
 =?utf-8?B?dTF3eVVGZ2h1c2ROOWE5dGQ1Tm0wMWhpTXFqcG9MVTJlYWgzcFNpbTVIaDNv?=
 =?utf-8?B?eXBpOVJkSDhsVHlYMFBPelpaZ05lYzBiQ3VWN1l6RzVRQkwyRUN3TFkwVVpm?=
 =?utf-8?B?T0t4d3E1UklmNlc4MkZmOGhqNU1GcnNmWHhBbEdQdlJRdnc0dS9CWmFlN1k4?=
 =?utf-8?B?VGZxbC9MOFdPS1FlaVlsVXBNSE1EVEdxQm9ieThvN2VBT0VGb2owSTdVRkE4?=
 =?utf-8?B?L1VlejJ6clpVQTFmMU9EN016U1NUSTA0bDZsVGhDTEZwMEozNFNmMkt0eUZi?=
 =?utf-8?B?OVZKbVZQbitVMllIVHhkajRET0xxSnNsaU9YY1NvSnZVc0krTHBjNlJjRmds?=
 =?utf-8?B?QTdlcStCK3RHUnVmZG1USXBIU2hjTGRGNkFYemJqZ2FrNlFMNGhBM1JJYlZ6?=
 =?utf-8?B?R2lER2htS2RzZHVQMVo5NlcvbmRiN2ZHOXhYTzk2MGJFaVdpQnV6ejdwQXRo?=
 =?utf-8?B?UWd3ZVMra1ZFM1BJWGo5ekl2LzgweHpHQXcrTk5qbjBmeW5CNndmU3ZEM1Yr?=
 =?utf-8?B?bVpPeUlBek9vcnJ5WTVTNEVMSmN6bDU2UzRYNXhTM1VvVGpmUXRRSkY1Z0lV?=
 =?utf-8?B?RkpIT1VsdEx4UXROWFZWWnBOUXBYWElzVm9GTjk3MnAzcnE3c2hPR3I0WkI0?=
 =?utf-8?B?cG9kOU4rYXQxZ0JMVnRSWGlVZFIvc0txeGI0Z2NHd1NrK0VTR0k3bnc4djNi?=
 =?utf-8?B?YnRyb1JtbE04aWZyVDN6MTJBOHBFNEhkUmh6ODBOcG5PMURlLzAyQkE2K04x?=
 =?utf-8?B?c0JBUmd2Q2NTODZHck1rTVBkUlNpWk5Kb1E0SGhtc3k0dDFiRGY3MVNndWZm?=
 =?utf-8?B?VyttcE1GNlpJRUFkUksrMjBmc3djQno3TGlMU2g4UllsYnd2RjdEdlhDazJ0?=
 =?utf-8?B?VVpCcXU3Nld4OW5tUU9wZkFjTFBka2RFTzU2eXJZYk1ZaTlqQ2EySDQyUDZ1?=
 =?utf-8?B?OTRWTzExYXl0cU9tYXA2REtkMlpVcGpjSlBQbXBuTVhIemVHODNtcUVRSVJt?=
 =?utf-8?B?T3NPVnRsT3prbG5HcmRVK3lIT2U1VnEzVmQvbk10dStGWmxRangza3RZZGRh?=
 =?utf-8?B?MzZnbEs2VzdnYlA1RU9GTkRTRUhsTnFZLzFRajJmUFFSTjBySDJYSWZONC9P?=
 =?utf-8?B?a3ZIT2hXWURxRm1ENSsrMGxNSUd4UGt6UXdiUmR3UWZUaVZ2dHFqS2pxSCtH?=
 =?utf-8?B?NmdGZWJrZXYvdUpmSlR0a3hIdUNJbi9DZzVadlJrcUs0UktUMUVZMjVLWkZJ?=
 =?utf-8?B?bWZkM0JINmR4aHlCTXZDUGQyTTBvZUxhb2J1NFk5M21CUmxCUFVNRDBvOHlt?=
 =?utf-8?B?OXE1YThlVXc1cnJ6d1prRm95aDIrS1lZa0lwMTVoUjBDaUJhMmZJU3IwR0VZ?=
 =?utf-8?B?VmZ1TEEycUVIZkZ1d1dOWnVmOHpuRVh1L1Y1NElkazVkRWpFWVdnTUVZTEhF?=
 =?utf-8?B?MStUa1Fkd05lZ3czTjBrN2VnUVZyalYwekM3WGoxZ2RhMU1vcHR6czFSako0?=
 =?utf-8?B?QXpNTUlpMlgrdUs2NWcyYUFpTkdDbTNnNE92cG0vdVFrMUVjaU5mbHN2OEs1?=
 =?utf-8?B?bkhJV0pQcCtaRmpPQ043STliTHp5UmhkS09rMjhwWHBzeTEyZlRpMEtTQ29H?=
 =?utf-8?B?Vkk5MDhKRDRLNjZGSEo5TE1idXJpblRZclpzTGVCZGxaK2o3K096Rmtja2Jy?=
 =?utf-8?B?dXFiY2JlVkFIWklmbFJNYnpZazgvWVVhZTlwd1RhRFkzOEYwZkY0TDZzajQ1?=
 =?utf-8?B?Qm9pNSt2Ynl5YnEwdVgySWxjKytoeTM3enJwSTNjZ2EzblByUnJ3eVllMVdX?=
 =?utf-8?B?NUNuMkRObUlGNmluMkNUK2pPZGJWMWFRd05CYjVnTTZaRWltUS9NZUZQb2tE?=
 =?utf-8?Q?E0IQMJKN2fueAiYHlLhqRzI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4F45EBF9CE2BF4BBB9C6CCB55B6A4AD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09448ed8-4087-4906-7250-08dbf0208e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 14:44:41.7170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zp3YvpPPkqaCq9vyFNQGy+//TtEqpLYiuBd6AJ3mzdqvL3Fjufsz7d8sPZ2L58v1ju/c8gzSdPP9VV8wZd07xhHdSkAY8jCwvl97Y2TEEY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191378

SGkgQWxleCENCg0KT24gVHVlLCAyMDIzLTExLTI4IGF0IDE1OjAwICswMTAwLCBBbGV4YW5kZXIg
S2FuYXZpbiB3cm90ZToNCj4gT24gVHVlLCAyOCBOb3YgMjAyMyBhdCAxNDo1MCwgU3ZlcmRsaW4s
IEFsZXhhbmRlcg0KPiA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPiB3cm90ZToNCj4g
PiA+IEluIGdlbmVyYWwsIHx8IGluIHNoZWxsIHNjcmlwdHMgc2hvdWxkIGJlIGF2b2lkZWQgYmVj
YXVzZSBpdCBpZ25vcmVzDQo+ID4gPiB0aGUgcmVhc29uIGZvciB0aGUgZmFpbHVyZSAoaWdub3Jp
bmcgc29tZSBmYWlscyBtYXkgYmUgb2ssIGlnbm9yaW5nDQo+ID4gPiBhbGwgZmFpbHMgaXMgbm90
IG9rLCBhcyBpdCB3aWxsIGNhdXNlIHNpbGVudCByZWdyZXNzaW9ucykuDQo+ID4gDQo+ID4gMjAy
MzExMTEgd2lsbCBiZSBwcm9ibGVtYXRpYyBiZWNhdXNlIHJkZmluZCB3aWxsIGJlIHJlcXVpcmVk
LCBidXQgdGhlcmUgaXMNCj4gPiBubyBtYWtlIHRhcmdldCB5ZXQuIE15IHBhdGNoIGlzIGF0IGxl
YXN0IGZhbGxpbmcgYmFjayB0byAibWFrZSBpbnN0YWxsIiwNCj4gPiBzbyBpdCBzdXBwb3J0cyBi
b3RoIDIwMjMxMDMwIGFuZCB2ZXJzaW9ucyBhZnRlciAyMDIzMTExMS4gSXQncyBub3QgaWdub3Jp
bmcNCj4gPiB0aGUgZXJyb3JzLCBmYWxsaW5nIGJhY2sgdG8gInx8IG1ha2UgaW5zdGFsbCIgd2ls
bCBldmVudHVhbGx5IGZhaWwgdGhlIHdob2xlDQo+ID4gYnVpbGQuDQo+IA0KPiBTbyBvbmNlIHNv
bWVvbmUgc2VuZHMgYW4gdXBkYXRlIHRvIDIwMjMxMTExLCB0aGV5IHNob3VsZCBhbHNvIGJhY2tw
b3J0DQo+IHRoZSBwYXRjaCB0aGF0IGludHJvZHVjZXMgdGhlIG5ldyBtYWtlIHRhcmdldCwgYW5k
IHVzZSB0aGF0IHRhcmdldC4NCj4gQW5kIGlmIHRoZXJlJ3MgYW4gdXBkYXRlIHRvIGFuIGV2ZW4g
bmV3ZXIgdmVyc2lvbiwgdGhlbiB0aGUgbmV3IHRhcmdldA0KPiBjYW4gYmUgdXNlZCB3aXRob3V0
IGFueSBwYXRjaGluZy4gQnV0IGZvciBub3csIEkgdGhpbmsgbm90aGluZyBuZWVkcw0KPiB0byBi
ZSBkb25lPw0KPiANCj4gVGhlIHByb2JsZW0gd2l0aCB8fCBpcyB0aGlzOiBpbWFnaW5lIHRoYXQg
eW91IGhhdmUgc3BlY2lmaWVkIEEgfHwgQiwNCj4gYW5kIHlvdSBpbnRyb2R1Y2VkIEEgaW4gYWRk
aXRpb24gdG8gQiwgYXNzdW1pbmcgc29tZSBzcGVjaWZpYyByZWFzb24gWA0KPiB0aGF0IEEgY2Fu
IGZhaWwuIFdoYXQgaWYgaXQgc3RhcnRzIGZhaWxpbmcgZm9yIHNvbWUgb3RoZXIgcmVhc29uIFk/
DQo+IFRoZW4gdGhlIGZhbGwtdGhyb3VnaCB0byBCIG1heSBiZSB2YWxpZCwgb3IgaXQgbWF5IG5v
dCwgYW5kIHdoYXRldmVyDQo+IGhhZCBjYXVzZWQgWSBuZWVkcyB0byBiZSBmaXhlZCBzb21lIG90
aGVyIHdheSB0aGFuIGV4ZWN1dGluZyBCLiBUaGlzDQo+IGZhbGwtdGhyb3VnaCB3aWxsIGhhcHBl
biBxdWlldGx5IGFuZCBubyBvbmUgaXMgZ29pbmcgdG8gbm90aWNlIGl0LCBhbmQNCj4gdGhhdCdz
IHdoZXJlIHRoZSByZWdyZXNzaW9uIGlzLg0KDQpMZXQncyBpZ25vcmUgdGhlIHBhdGNoIGZvciB0
aGUgbW9tZW50LiBZb3UgYXJlIHJpZ2h0LCAyMDIzMTAzMCB1cGRhdGUgaXMNCk9LLCBuZXh0IHVw
ZGF0ZXMgY2FuIGludHJvZHVjZSBuZXcgbWFrZSB0YXJnZXQgd2l0aG91dCBmYWxsYmFjayBhbmQg
YXZvaWQNCnRoZSB8fCBvcGVyYXRvci4NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1l
bnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

