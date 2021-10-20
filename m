Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF24C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 10:57:05 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.6318.1634727423545443708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 03:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=XPdHaZQr;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1634727423;
  x=1666263423;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1bfLgh2l6A0mQKtmbJRDdEtK9BepmCGIq9cFFRmQkv4=;
  b=XPdHaZQrqIM7yLXNAKfmP7N5c5U6QI8iwWQQ8hRL/yEzwfVFNs3HQ2mT
   prD8BKMpQzbmr6LVsI6hcXpoWquj2qJmZ5sQG1ep8ESqTIwtgAvC2Hrnw
   yar1h8w+8JIlDutMRoCiKUyyeXxpQ9TR/rDHXK+iGJ6xW0P1Osk4y4y4R
   n+3+6JjDXh8U0xyHVFE8+RkiPnua9kdFcrBeYU1Xk1c0SD5gNuJT0Pa8O
   XBiZxRXrk8ydS2/UTKv7YTPC5JzQ9bGfp62dFEWpMFlax71fZxYaeOai5
   cj3sGRZjXL62vBezZcP1cyPyPFiomEHGuuHhIkQhFTGdz3coPV3fE/PVv
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jose Quaresma
	<quaresma.jose@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to be
 extended with extra classes
Thread-Topic: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to be
 extended with extra classes
Thread-Index: AQHXxQzZRKrAp673MEiO4EVBwiPVW6va3kzwgACyhkD///WigIAALniQ
Date: Wed, 20 Oct 2021 10:57:00 +0000
Message-ID: <35229a81fcb740edb3d77e35c8ebc787@axis.com>
References: <20211019170321.18270-1-pkj@axis.com>
	 <CANPvuR=noMymOncORwNan6-D-DCkSKQDXYjjWR+8yhqx3JxY=Q@mail.gmail.com>
	 <16AF9916496D59D2.6466@lists.openembedded.org>
	 <0618e0381622433f86303a2d5d6968cd@axis.com>
 <86a6794721045c94bc4cd445a051ff1df40baa6e.camel@linuxfoundation.org>
In-Reply-To: 
 <86a6794721045c94bc4cd445a051ff1df40baa6e.camel@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 10:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157257

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDIwIG9rdG9iZXIg
MjAyMSAxMTo1OQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBKb3NlIFF1YXJlc21hDQo+IDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4NCj4g
Q2M6IE9FLWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBleHRlcm5hbHNyYy5iYmNsYXNzOiBBbGxv
dyBleHRlcm5hbHNyYyB0bw0KPiBiZSBleHRlbmRlZCB3aXRoIGV4dHJhIGNsYXNzZXMNCj4gDQo+
IE9uIFdlZCwgMjAyMS0xMC0yMCBhdCAwOTowOSArMDAwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdy
b3RlOg0KPiA+IEkgdGhvdWdodCBvZiBhbm90aGVyIHByb2JsZW0gd2l0aCB0aGUgd3JhcHBlciBj
bGFzcyBzb2x1dGlvbjogaWYgd2UgDQo+ID4gbmVlZHRvIGFjdHVhbGx5IGJhY2twb3J0IGEgbmV3
ZXIgdmVyc2lvbiBvZiB0aGUgY2xhc3MgZnJvbSwgZS5nLiwgDQo+ID4gUG9reSBtYXN0ZXIsIHRo
ZW4gdGhlcmUgaXMgbm93IG5vIG5hdHVyYWwgcGxhY2UgZm9yIGl0IHNpbmNlIGl0IGlzIA0KPiA+
IG9jY3VwaWVkIGJ5IHRoZSB3cmFwcGVyIGNsYXNzLiBUaGF0IG1lYW5zIHdlIHdvdWxkIGVpdGhl
ciBoYXZlIHRvIA0KPiA+IHJlbmFtZSB0aGUgYmFja3BvcnRlZCBjbGFzcywgb3IgcHV0IGl0IHNv
bWV3aGVyZSBlbHNlIHRoYW4gaW4gDQo+ID4gImNsYXNzZXMiLiBJdCBhbHNvIG1lYW5zIGJhY2tw
b3J0aW5nIGEgY2xhc3MgcmVxdWlyZXMgdGhlIHdyYXBwZXIgDQo+ID4gY2xhc3MgdG8gYmUgbW9k
aWZpZWQuDQo+ID4NCj4gPiBIZXJlIGlzIGEgcXVlc3Rpb24gZm9yIFJpY2hhcmQ6IHdoYXQgZG8g
eW91IHRoaW5rIG9mIGFuIGlkZWEgSSBoYWQgdG8NCj4gPiBhZGQgc3VwcG9ydCBpbiBiaXRiYWtl
IGZvciBleHRlbmRpbmcgY2xhc3Nlcz8gSSBkbyBub3QgbWVhbiB0byBhZGQgDQo+ID4gc29tZXRo
aW5nIGxpa2UgYmJjbGFzc2FwcGVuZCwgYXMgSSBrbm93IHRoYXQgaXMgdHJvdWJsZXNvbWUuIE15
IGlkZWEgDQo+ID4gaW5zdGVhZCBpcyBzb21ldGhpbmcgbGlrZSB0aGUgcHJlZnVuY3MvcG9zdGZ1
bmNzIHRoYXQgd2UgaGF2ZSBmb3IgDQo+ID4gZnVuY3Rpb25zLiBJLmUuLCBiZWZvcmUgYWN0dWFs
bHkgZG9pbmcgdGhlIGluaGVyaXQgb2YgYSBjbGFzc2ZvbywgDQo+ID4gYml0YmFrZSB3b3VsZCBp
bmhlcml0IGFueXRoaW5nIHNwZWNpZmllZCBpbiBCQkNMQVNTX1BSRV9JTkhFUklUOmZvbywgDQo+
ID4gYW5kIGFmdGVyIGluaGVyaXRpbmcgdGhlIGNsYXNzIGl0IHdvdWxkIGF1dG9tYXRpY2FsbHkg
aW5oZXJpdCANCj4gPiBhbnl0aGluZyBpbiBCQkNMQVNTX1BPU1RfSU5IRVJJVDpmb28uIMKgVGhh
dCB3YXkgb25lIGNhbiBzaW1wbHkgZXh0ZW5kIA0KPiA+IGEgY2xhc3MgdGhyb3VnaCBub3JtYWwg
dmFyaWFibGUgb3BlcmF0aW9ucywgbWFraW5nIGl0IGVhc3kgdG8gZG8sIA0KPiA+IGUuZy4sIGlu
IHRoZSBkaXN0cm8gY29uZmlndXJhdGlvbi4NCj4gDQo+IFRoYXQgc291bmRzIHZlcnkgbGlrZSBh
IGJiY2xhc3NhcHBlbmQgdW5kZXIgYSBkaWZmZXJlbnQgbmFtZT8NCj4gDQo+IENoZWVycywNCj4g
DQo+IFJpY2hhcmQNCg0KV2VsbCwgSSBndWVzcyBpdCBpcyBzaW1pbGFyIHRvIHdoYXQgYSBiYmNs
YXNzYXBwZW5kIGZpbGUgc3VmZml4IHdvdWxkIA0KZW50YWlsLCBidXQgbW9yZSBmbGV4aWJsZSBh
bmQgY29udHJvbGxlZC4gRG8geW91IHRoaW5rIHNvbWV0aGluZyBsaWtlIA0KdGhpcyB3b3VsZCB3
b3JrLCBvciBoYXZlIEkgbWlzc2VkIHNvbWUgdGVjaG5pY2FsIHByb2JsZW1zIHRoYXQgd291bGQg
DQpwcmV2ZW50IGl0PyBBbmQgaWYgeW91IHRoaW5rIGl0IGlzIHRlY2huaWNhbGx5IHBvc3NpYmxl
LCB3b3VsZCB5b3UgYmUgDQp3aWxsaW5nIHRvIGFjY2VwdCBhIHBhdGNoIHRoYXQgaW1wbGVtZW50
cyBpdD8NCg0KLy9QZXRlcg0KDQo=

