Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33DCC001B5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 15:41:46 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.161.1662133295791283340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Pbu00XpP;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662133296;
  x=1693669296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h4Wt0v9ISnXCkO4JhTiNRQ2iTTsNrjZ8wfbeE8WwX08=;
  b=Pbu00XpPwT5qgBzCsAIXwTQjN348xRrSd8V/niFqdCUMnKLtqjL11gJd
   zpULSmoJYSSypEioqJifoH3y6yXohnf52D2aVra8Vf2SbgXlPaW9peIdU
   VK96+67krHiLY2MRIee6Z2AiMcMURoLTxJBEh2Q6/s9a5S+ohnrTBZWQa
   TcNiR+ZzlaYdb0Q/OAuWRULDYleZ3UvZvI5fTpKwy7V/0F3TTDQhQtJPM
   afQTxsmXQJF2Yx7xnErrFlN4LNT0pEbMkkKkPWbx32vm8uLfjYJTRLHbz
   5gx2dMnlhkRnNQPxDdFOnn3jlJSRVOcboYVbPoXogdr+36ebzuITu8k5j
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
Thread-Topic: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
Thread-Index: AQHYvg5w+gc06PVyMEyd9jx0rCMZKa3LPiMQgAAuDwCAAMn6sP//6AkAgAAk5zA=
Date: Fri, 2 Sep 2022 15:41:33 +0000
Message-ID: <67b62aafd6e543138160018db7334da3@axis.com>
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <CANNYZj9cXbFogXaJdTeb2r89-AaPyL3txoJ4xn3ER=Dq7jy0mA@mail.gmail.com>
 <813962d42b7c46c9a0a8565de787d981@axis.com>
 <CANNYZj-rx80UFnEAEiVux7Wysvvj2PK05CC6hbosm5=6ymr=xQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-rx80UFnEAEiVux7Wysvvj2PK05CC6hbosm5=6ymr=xQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 15:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170256

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDIgc2VwdGVtYmVyIDIwMjIgMTc6
MDkNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgQWxleGFu
ZGVyIEthbmF2aW4NCj4gPGFsZXhAbGludXRyb25peC5kZT4NCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6IG1pZ3JhdGUNCj4gYnVpbGQv
Y29uZi90ZW1wbGF0ZWNvbmYuY2ZnIHRvIG5ldyB0ZW1wbGF0ZSBsb2NhdGlvbnMNCj4gDQo+IE9u
IEZyaSwgMiBTZXB0IDIwMjIgYXQgMTY6NDcsIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gDQo+ID4gVGhlIGV4cGVjdGF0aW9uIGlz
IG9mIGNvdXJzZSB0aGF0IGlmIG9uZSBoYXMgb25lJ3Mgb3duIC50ZW1wbGF0ZWNvbmYNCj4gPiBm
aWxlLCB0aGVuIGl0IHdpbGwgb2YgY291cnNlIGhhdmUgdG8gYmUgdXBkYXRlZCB0byBtYXRjaCB0
aGUgY2hhbmdlcw0KPiA+IGluIE9FLiBOb3RoaW5nIHVudXN1YWwgd2l0aCB0aGF0LiBCdXQgdGhh
dCBpcyBzb21ldGhpbmcgSSBkbyBhcw0KPiA+IG1haW50YWluZXIgb2Ygb3VyIGVudmlyb25tZW50
LiBGb3Igb3VyIGRldmVsb3BlcnMgaXQgd2lsbCB0aGVuIGp1c3QNCj4gPiB3b3JrLg0KPiANCj4g
UGxlYXNlIGNvbnNpZGVyIHRoYXQgdGhlcmUgYXJlIHRocmVlIGRpZmZlcmVudCB3YXlzIHRvIG9i
dGFpbiB0aGUNCj4gbG9jYXRpb24gb2YgdGhlIHRlbXBsYXRlLCBhbmQgdGhleSBtdXN0IGFsbCB3
b3JrLiBGb3IgdGhvc2Ugd2hvIGhhdmUNCj4gY3JlYXRlZCBhIGJ1aWxkL2NvbmYgYnkgc3VwcGx5
aW5nIFRFTVBMQVRFQ09ORiBvbiB0aGUgY29tbWFuZCBsaW5lIG9yDQo+IHRlbXBsYXRlY29uZi5j
ZmcgKHdoaWNoIEkgd291bGQgc2F5IGlzIGV2ZXJ5b25lLCBleGNlcHQgeW91KSB0aGUNCj4gc3Vn
Z2VzdGVkIGNvZGUgd2lsbCBvbmx5IG1ha2UgdGhpbmdzIHdvcnNlLCBub3QgYmV0dGVyLiBJdCB3
b3VsZCB0YWtlDQo+IHdyb25nIGJ1dCBoZWxwZnVsIHZhbHVlIGluIHRlbXBsYXRlY29uZi5jZmcg
dGhhdCBwb2ludHMgdG8gYSBjdXN0b20NCj4gdGVtcGxhdGUsIGFuZCByZXBsYWNlIGl0IHdpdGgg
bWV0YS9jb25mL3RlbXBsYXRlcy9kZWZhdWx0LCBiZWNhdXNlDQo+IHRoYXQgaXMgd2hhdCB0aGV5
IGhhdmUgaW4gLnRlbXBsYXRlY29uZi4gVGhlbiBhbGwgdHJhY2Ugb2Ygd2hlcmUgdGhlDQo+IHRl
bXBsYXRlIGNhbWUgZnJvbSBpcyBsb3N0Lg0KDQpBY3R1YWxseSwgdGhhdCBkb2VzIG5vdCBjb3Jy
ZXNwb25kIHRvIHdoYXQgdGhlIGRvY3VtZW50YXRpb24gc2F5cy4gDQpUaGUgd2F5IHdlIGRvIHRo
aW5ncyAoaS5lLiwgbW9kaWZ5IC50ZW1wbGF0ZWNvbmYgdG8gZGVmaW5lIGEgZGVmYXVsdCANClRF
TVBMQVRFQ09ORikgX2lzXyB3aGF0IHRoZSBkb2N1bWVudGF0aW9uIHNheXMgb25lIHNob3VsZCBk
by4gU2VlOg0KaHR0cHM6Ly9kb2NzLnlvY3RvcHJvamVjdC5vcmcvZGV2L3NpbmdsZWluZGV4Lmh0
bWwjY3JlYXRpbmctYS1jdXN0b20tdGVtcGxhdGUtY29uZmlndXJhdGlvbi1kaXJlY3RvcnkNCg0K
QWxzbyBub3RlIHRoYXQgdGVtcGxhdGVjb25mLmNmZyBpcyBub3QgZG9jdW1lbnRlZCBhdCBhbGwu
IE15IGd1ZXNzIA0KKGJhc2VkIG9uIHRoZSBjdXJyZW50IGNvZGUpIGlzIHRoYXQgaXQgaXMgb25s
eSBzdXBwb3NlZCB0byBiZSB1c2VkIA0KaW50ZXJuYWxseSBhcyBhIHdheSB0byBzdG9yZSB0aGUg
dmFsdWUgb2YgYSBwcmV2aW91cyBidWlsZCB3aGVyZSANClRFTVBMQVRFQ09ORiB3YXMgZXhwbGlj
aXRseSBzZXQuDQoNClNvIGJhc2VkIG9uIHRoZSBkb2N1bWVudGF0aW9uLCB0aGUgb2ZmaWNpYWxs
eSBzdXBwb3J0ZWQgd2F5cyB0byANCmNvbmZpZ3VyZSB0aGUgdGVtcGxhdGUgZGlyZWN0b3J5IGlz
IHRvIGVpdGhlciBzcGVjaWZ5IFRFTVBMQVRFQ09ORiANCmV4cGxpY2l0bHkgb3IgYnkgbW9kaWZ5
aW5nIC50ZW1wbGF0ZWNvbmYgdG8gc2V0IGEgZGVmYXVsdCB2YWx1ZS4NCg0KVGhhdCBzYWlkLCBJ
IGRvIGFncmVlIHdpdGggeW91ciBzdWdnZXN0ZWQgY2hhbmdlIHRvIHByZWZlciBhbiANCmV4cGxp
Y2l0bHkgc2V0IFRFTVBMQVRFQ09ORiBiZWZvcmUgYSB2YWx1ZSBmcm9tIHRlbXBsYXRlY29uZi5j
ZmcsIA0Kd2hpY2ggYWxzbyBhZ3JlZXMgd2l0aCB0aGUgaWRlYSB0aGF0IHRlbXBsYXRlY29uZi5j
ZmcgaXMgb25seSBhbiANCmludGVybmFsIHdheSBvZiBzdG9yaW5nIHRoZSBsYXN0IFRFTVBMQVRF
Q09ORiB1c2VkLg0KDQo+IA0KPiBBbmQgYXMgZGlzY3Vzc2VkIHByZXZpb3VzbHksIHlvdSBkb24n
dCBldmVuIG5lZWQgdG8ganVtcCB0aHJvdWdoIHRoZQ0KPiBleHRyYSBob29wcyB3aXRoIGdlbmVy
YXRlZCB0ZW1wbGF0ZSBjb25maWd1cmF0aW9ucyB0byBiZWdpbiB3aXRoLCBhbmQNCj4gY2FuIHdy
aXRlIHRoZSBkeW5hbWljYWxseSBnZW5lcmF0ZWQgY29uZmlncyBkaXJlY3RseSBpbnRvIGJ1aWxk
L2NvbmYuDQo+IA0KPiBBbGV4DQoNCi8vUGV0ZXINCg0K

