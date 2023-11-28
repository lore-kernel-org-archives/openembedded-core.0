Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF233C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 14:32:06 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.51])
 by mx.groups.io with SMTP id smtpd.web10.33842.1701181925408519833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 06:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ykFWULWn;
 spf=pass (domain: siemens.com, ip: 40.107.247.51, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO5axZCTT2r2abcarrO35F6XO/X9c8TAAtpRjH/zNwguea62spFeyZQx09DDjImhZWH3y1yyh43pWfWpGweOLSPOJbgWLJEVqqhx7Lxh2tOb9CvWk0DKwwHqi3Z2WDGLKdtumQO6uOrAVXCvL4nh//ChaRbs4ZQWOoKc8zV/ZY5aHAvv77AdfxGGhNRpY9PTSytKaZP/Av2Q4kDWX/+Nmjt9hLupW1tQAVJ/Y4A7VBTBd2myZNaoTKQmKakJqVzZQxICsfbp72jFzDsKovcGRKQmIxQJWNlzNAmK7TNJNl1WwH/KdA35R//XCfZ+P2Il4Aqs5GLfOl+M3bydYJgJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUV6nq7gyww8OmusgW/2tewSQ7p51cC/x1fx21lzM48=;
 b=XTrZCJhpYbBqpBnsRt86CpW3+kLB6M0zjXp+ocf8KOFPJChvhdNT1HjWurOd7RmOD376I+V6Hvln8bMOH+iMbpIc3YK8QFQqz6zf2Wo9tWhUVcRrJ7CwQuk2fjdSiQEyuuvSPN9Bl+oyg11vXxPQQdwx1pkSXPxJT4kA9mYHxX19jW4NKyJigSuWA9sxefIwKWAZzhCOQz++oGcPA/TABHw9zKShfgQ4fJ3XLD0dGqJwpJwGla6NGB1XCr3kumWj0/7py35/ngtfNhXujDEwTj6Yr4nBG0bxPdnYIqsk7sQXGzkTQoPZaYjDsNTfWZJ73dw2S+Kl/wAqWkUd5liR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUV6nq7gyww8OmusgW/2tewSQ7p51cC/x1fx21lzM48=;
 b=ykFWULWnNNc+HtuEzu2jQQKnyonQKDUiht8KytO2PuWZdJDGNLLqNz5gpkvcVtwxmTVj3NnPT7D0hXuVrfuJcd7hQUEM3+HcBrWEQOMia3b1XjUiSA/XdivMS9pEcPRDId+mipBna2icBq4JP7NeK411a+o8ffJsXnK9ikmC2BVCCR/RXxwvmta/v527D1q+tKH5N4M863QmFPF/erBRKpr2c9kfTyk5vqo2535umlXkfL9RHP1EdppHhdQAtktMMSBg/L/I0OxAxBDkZ88BgMOsGT17VnpoIK8/gFmb208vs+v4ApE811OGLE50AHJ+lp1kyxT2ArIhZRWPglpczQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU2PR10MB7785.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:496::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 14:32:00 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 14:31:59 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>
Subject: Re: [PATCH] linux-firmware: use install-nodedup make target
Thread-Topic: [PATCH] linux-firmware: use install-nodedup make target
Thread-Index: AQHaIf2XfJbicLFP+kCeMjlzTNVne7CPumCAgAAFVoCAAALtgIAACKmA
Date: Tue, 28 Nov 2023 14:31:59 +0000
Message-ID: <cc6779d618a32fba9f9265f697aef7635a6da9e9.camel@siemens.com>
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
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU2PR10MB7785:EE_
x-ms-office365-filtering-correlation-id: 70efb98b-2512-4ba5-e4d0-08dbf01ec7ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v5UtaVUiBxwqdxDCbDLMJhNoulPKloYo/ZXB7E4RCyFHQdbpSs0bKEyvWN0trbX82eokNKJK+9mSrD7B1Z0euXTBsX8sdKf3qksoY/o9iA4abdgbGZiNLihs0Cmmrxt6jylI+540EpeR53AvwojHqG8UQ2+euKYgrtAfO0igpcUMEoq5Gf9hfrpz3s6oxJjaSGkKsjphp4cWfIFZd2od4p1csfwJdoL6LMUQX0oIa3sCHST/rG+762ZOMJy9XbaIKfKLCv0rDOc9aHK+JMHqcgXtThR0Oi7PyQak45itBAjwxtvZB0hW/t7K7tWPCwZhXK0M2Y59pZriKjgQUU/P/ZUuQuUzBE3clYK/djOUxdQPyUOenp2SgI/5h8lPurY6gLrFWTsj1reVh7NCM8mRNBuHYFu0uHSbhfipGideZ4kHFo6LFRW0vPo7EnP1cxpLV3M/FcjF4F2w4AVlTsjocktP7qKzkiynvr06Gpm5XksyLz6+LCYlzLsYBdD7KelbQZMFkPD/kevJVYVU3Y9q3jqbky27Rqtijjc35M4AjHneXIR1mDq/UBfu19T+Vucjx1p1JpXDT9rrKPZGa3B/dlLzARNhu8+gfRZEPOgtKSauIYmji3zALS8e3CDmI/I0LwlGX3IFUgNyMWm0TBf/fA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(107886003)(2616005)(26005)(6506007)(6512007)(71200400001)(86362001)(82960400001)(8676002)(8936002)(5660300002)(66556008)(4326008)(6486002)(76116006)(478600001)(91956017)(6916009)(316002)(66946007)(54906003)(66476007)(66446008)(64756008)(38100700002)(83380400001)(122000001)(38070700009)(55236004)(41300700001)(15974865002)(4001150100001)(36756003)(2906002)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RVErM3NGcUc3SXlKZGZQWjRQMTFHT0FWOWdiV1ZzbjBtTEJqcEtDQ04wcE5O?=
 =?utf-8?B?Z0tOR2lXMm5pNUEzUWhoQXNuQWR5M205YWI1cm4vSFo5OFo4b21FZThQOWZw?=
 =?utf-8?B?Y2NaNlNVdGxoOUs2aUhxMmlGS2psNnJDeURlQi9QYlVFdWtLdFJDb1ZGcUZy?=
 =?utf-8?B?SmJ4eXJsemE4Zkc4WkFqYjlLNlo5RzNMSm9SM016d2Y5LzN5YXd3NDVaUGVk?=
 =?utf-8?B?SG9rYWhjRnhwZXdxWnhSdU5BYTBCRkZ4U1QrZU5MYzFVeFBuS1BoQXN1RUNz?=
 =?utf-8?B?MGIxVkNRaU1jK1FXVEZQQ0xnUGl2cHI1eHJVOGlBYXpqTmdycUVEUzJBa1lC?=
 =?utf-8?B?MUU3Y0RRY2xaZFRXMzNYTjdGRWlVVmdUL1cybW8zRng4RXhsUS9rOFVSdkQ3?=
 =?utf-8?B?QXg2Y2E1SElwd0w0UzFCL09udkhGVCt3cVpJR0NtdlVrUXZLT004Y3RkRnpB?=
 =?utf-8?B?YmJaQTNPMkJnUVFURDRIQS9vSXMxMjdFZTA0a0VNbTZGeXFFYVQ2cGtTRDBT?=
 =?utf-8?B?UVVWTURnYUQzeXJXMVR2K2l4WFVhMzVMdWY2UzdDVUdlRFFsZm5QSDNrK1VU?=
 =?utf-8?B?aW1wS3ZycFdMblFpRGNiSzNJMjREb2RoRVZHbG5KK0l6QlNQUWFCU2cxckw1?=
 =?utf-8?B?OHNDTkVlNXc0ZEZ5WGtVZ3pSdmZMby9JTENramFnUGhuTDEwL3UwdjVKVjkz?=
 =?utf-8?B?YnF6cHQ3RWJyMytidUxtaWlpd3ZIS3ZKZHg4K3lQUkIxRHhTdmNSbCtKNjdt?=
 =?utf-8?B?NE9ZTE04Z1dQaTZFZSsyNXFKQ3F6Y3NKZ0t5MkdlN25oWTZnSzIwU25HS2FY?=
 =?utf-8?B?ZWVyeGZZaGMyZXpyRDJtbEhwdEs5ekJUOURud1pQYjQzWGdCeDNhbTFvVFY0?=
 =?utf-8?B?YWwrcWNERlhteTRlcUJRK29qSjJkRXRxUGhhNWNrMGpSVjB0RlBlWHBteU1u?=
 =?utf-8?B?WWRteHBPeFphTDVvZ3IvN3BxMmh4cUZHUHdyek1jdGdHS2RrMW81cGk2U0RB?=
 =?utf-8?B?NUtmQlljQnBPYi9lNWxvL0N0cDBueDJHWFVOS1NhS0tuMmRuNTJEYWdLUVpT?=
 =?utf-8?B?SjIvZ1FaUTI2N2d4dE1kTXRXSVoyazdhbjNWbjdxSGYxTjRZRmMyaTdaYUVt?=
 =?utf-8?B?SzJPODd4Sjhtcm5lQXhyd296UDlaR0owUG11TzdvSHBFOE93Y1FtUW53Y01L?=
 =?utf-8?B?WjFXcVRDY2VGV0NWbG80NTI5aXc3WUMwSmpmeTFRR2hCcUZiTVBzclRQYmJo?=
 =?utf-8?B?T1NMU3pwU2F3QmxGdlR0UU5FNEUrZHRHSmdCNjY0cTFXZFNYMnIyRjQweG0z?=
 =?utf-8?B?dnNsWTU3ekdUUlVPWXN1WTl4dWhYWGtFNkJnZFFIKzkvaXo2VTNuNTY1YVU4?=
 =?utf-8?B?NFhNanZXTDJldk9vM0drRWdSUVFGVVU4dWF0N2Z0UVBUa0pqUTdpWTdXOGhR?=
 =?utf-8?B?S05oNTBTeWk5WW4wdnRlYUNOREZURGw2VWs3Nkw3eWRKdlMvQjluRkFFbzBy?=
 =?utf-8?B?U3U4SlpjK1padWlFVmtEVUg3SWcvY1VGekJuRWtucWFtbGE2dVBmdERxdXNl?=
 =?utf-8?B?cnRRMFpOVERsRmNXNi9yTmdYWkNXRG5YZVF1TlZDUVhaY212QllCVG5SUEJq?=
 =?utf-8?B?NTlzVmo3NFhTZHVDcjJMWmJHc1BvS24yUWpYRzdvc3hRdnJzVDRIRkJ6eTdN?=
 =?utf-8?B?MUlHSkpNSUxjNXUrSzNJQVZVdDE5aTNvM1NSNm5ITnZXUi9qSStlU1NxVENM?=
 =?utf-8?B?ODNMbmVhek9Xd0lZL0pVdlY4QkIrQ1FYVDFNeHlKOGdsdzM2NDVuS2YvT1V5?=
 =?utf-8?B?OGVmM2lrcW1wTG8zMWFkOXNKWCs3b0ltbVcwZ0pSK09jRUZsYjZQZXJCUFVo?=
 =?utf-8?B?NlFnRDZYa1Zsam0rMTlLdTJEOG03UWdodmYwcmxWM3dWbkxlNDVsRE52UkhR?=
 =?utf-8?B?VVlHQXhZSWZCeHAvZnRXTVNJYkNUbzFEOHVkKzErUlMrZWVBUHlyT2h3aGIx?=
 =?utf-8?B?Um5wSHk1b0d0eXNWTVNJVzFIWmZ3Q0lDVGlDUVFBbFJjakhXSVVZeUdWZXZB?=
 =?utf-8?B?MkFJTWRveXpTRExXREY2N1M0NGVsUVVmcklUelIyT3VMeExNOFF0ZzJJakc0?=
 =?utf-8?B?aGxzMjJrR3I1VnBJZjZkMzNLbVF0dHlUWDhTM2sydjlSejhINHRQMjRnRy9N?=
 =?utf-8?Q?MO2Plr0bY/7zilVOSje9DbA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8545796D7EC4B84291BB6306F8B29725@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70efb98b-2512-4ba5-e4d0-08dbf01ec7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 14:31:59.2778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2HcY+ZaXx11wLMfjYx//m4HGq/2/Ufk1bQBRksio4anvaxxZN0cPKIjr8wURG8wkFLfQnevJrjFEswd0vq7f/ZBic+XNtF9mgyjlcygqjNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7785
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191376

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
ZSBkb25lPw0KDQpJdCB3b3VsZCBiZSB0aGUgY2FzZSBpZiB0aGlzIHBhcnRpY3VsYXIgcGF0Y2gg
Z2V0cyBhY2NlcHRlZC4NClRoYXQgaXMgdGhlIHdob2xlIHBvaW50LiBEaXN0cm9zIG5lZWQgYWRh
cHRhdGlvbiBmb3IgdGhlIG5ldyAic29sdXRpb24iIGluDQpsaW51eC1maXJtd2FyZSwgZGVmYXVs
dCBiZWhhdmlvdXIgaGFzIGJlZW4gY2hhbmdlZC4NCg0KPiBUaGUgcHJvYmxlbSB3aXRoIHx8IGlz
IHRoaXM6IGltYWdpbmUgdGhhdCB5b3UgaGF2ZSBzcGVjaWZpZWQgQSB8fCBCLA0KPiBhbmQgeW91
IGludHJvZHVjZWQgQSBpbiBhZGRpdGlvbiB0byBCLCBhc3N1bWluZyBzb21lIHNwZWNpZmljIHJl
YXNvbiBYDQo+IHRoYXQgQSBjYW4gZmFpbC4gV2hhdCBpZiBpdCBzdGFydHMgZmFpbGluZyBmb3Ig
c29tZSBvdGhlciByZWFzb24gWT8NCj4gVGhlbiB0aGUgZmFsbC10aHJvdWdoIHRvIEIgbWF5IGJl
IHZhbGlkLCBvciBpdCBtYXkgbm90LCBhbmQgd2hhdGV2ZXINCj4gaGFkIGNhdXNlZCBZIG5lZWRz
IHRvIGJlIGZpeGVkIHNvbWUgb3RoZXIgd2F5IHRoYW4gZXhlY3V0aW5nIEIuIFRoaXMNCj4gZmFs
bC10aHJvdWdoIHdpbGwgaGFwcGVuIHF1aWV0bHkgYW5kIG5vIG9uZSBpcyBnb2luZyB0byBub3Rp
Y2UgaXQsIGFuZA0KPiB0aGF0J3Mgd2hlcmUgdGhlIHJlZ3Jlc3Npb24gaXMuDQoNCkdlbmVyaWMg
Y2FzZSBpcyBjbGVhciwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgSSBiZWxpZXZlIGZhbGxpbmcg
YmFjayB0bw0KIm1ha2UgaW5zdGFsbCIgaXMgYWx3YXlzIHZhbGlkIGlmICJtYWtlIGluc3RhbGwt
bm9kZWR1cCIgZmFpbHMuDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3
d3cuc2llbWVucy5jb20NCg==

