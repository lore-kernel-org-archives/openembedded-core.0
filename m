Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68196ECAA27
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 19:41:51 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.28570.1661456508051394589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 12:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UYILZQG8;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661456509;
  x=1692992509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z30WubSVvCgT04HSFi5UxWw9MzZeVHH8X7kQHHYcJvc=;
  b=UYILZQG8/hzOL4J6nAL2UEILQqm4exGPEyPxCvtWP2GwZp19U1isF3/t
   uZf/FrAsBDeUye/fbxeM4RxYCc/XoKWoiC22RBATgzbtlMnO/afKebnEr
   GrjQhKaDKvP+tFCD0vALESzy4dUYWI7n6MhKHx77rs1UjXxVIIT8tTTOc
   /CY9sAW6j88GFWkX8WNOmwcM2mss7ProXPxWSV96Al7DkfjlXBCY36IrW
   iZhhA54Bg+pqtYfNc/7V6CGbiII5xtFKuVQMnnC8jCsvfse2xbKUSZrMH
   nobKpjeqbAAHTAbJ/KSxfJA3bIuHUneY2s4QlALEtBzS9H7UuJgCfe/Dk
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Thread-Topic: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check
 that TEMPLATECONF is valid
Thread-Index: 
 AQHYt7cRSHWGrcP8wUm8EpgvpR7Rga2+D7iA///lUQCAACL9EP//6V2AgAEzI9CAAAIBAIAAp78w
Date: Thu, 25 Aug 2022 19:41:45 +0000
Message-ID: <93d7371f57bb44ae96a55d5349982bc6@axis.com>
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
 <aa755beb07f143619c3c7fec974ce2a3@axis.com>
 <CANNYZj-FYOOBqPBs3sZuXQqse1nrtRZXeKrKjMg=YZgt2neSKw@mail.gmail.com>
 <57b46d76a2174cc487c8a210c3539b03@axis.com>
 <CANNYZj94cymsa-TmkcMmHWm2FQ6CvRvKE3_eCy=t63x9NFZnhA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj94cymsa-TmkcMmHWm2FQ6CvRvKE3_eCy=t63x9NFZnhA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 19:41:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169886

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI1IGF1Z3VzdGkgMjAyMiAxMTox
OQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBBbGV4YW5k
ZXIgS2FuYXZpbg0KPiA8YWxleEBsaW51dHJvbml4LmRlPjsgUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIIDIvMl0gc2NyaXB0cy9vZS1zZXR1cC1idWlsZGRpcjogYWRkIGEgY2hlY2sNCj4gdGhh
dCBURU1QTEFURUNPTkYgaXMgdmFsaWQNCj4gDQo+IE9uIFRodSwgMjUgQXVnIDIwMjIgYXQgMDk6
MTksIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3
cm90ZToNCj4gID4NCj4gPiA+IFdlIGFyZSB0cnlpbmcgdG8gbW92ZSB0b3dhcmRzIHN0YW5kYXJk
aXppbmcgYnVpbGQgY29uZmlndXJhdGlvbg0KPiA+ID4gbWFuYWdlbWVudC4gT25lIHN0ZXAgdG93
YXJkcyB0aGF0IGdvYWwgaXMgdGhhdCBjb25maWcgdGVtcGxhdGVzIG11c3QNCj4gPiA+IGxpdmUg
aW4gbWV0YS1zb21lLWxheWVyL2NvbmYvdGVtcGxhdGVzLCBhbmQgYXJlbid0IHNjYXR0ZXJlZCBh
cm91bmQsDQo+ID4gPiBvciBnZW5lcmF0ZWQgb24gdGhlIGZseS4gVGhpcyBydWxlIG9ubHkgbWFr
ZXMgc2Vuc2UgaWYgdGhlcmUgaXMgc29tZQ0KPiA+ID4gd2F5IHRvIGVuZm9yY2UgaXQsIHdoaWNo
IGlzIHdoYXQgdGhpcyBjaGFuZ2UgZG9lcy4NCj4gPg0KPiA+IFdlbGwsIHdlIGdhdmUgdXAgb24g
dGhlIHN0YXRpYyB0ZW1wbGF0ZXMgYWxtb3N0IGltbWVkaWF0ZWx5IGFmdGVyIHdlDQo+ID4gc3Rh
cnRlZCB1c2luZyBZb2N0byB3aGVuIHdlIHJlYWxpemVkIHRoYXQgdGhleSBkaWQgbm90IGZpdCBp
bnRvIG91cg0KPiA+IGlkZWEgb2YgYmVpbmcgYWJsZSB0byBtaXggbGF5ZXJzIGluIGRpZmZlcmVu
dCBjb21iaW5hdGlvbnMgaW4gZGlmZmVyZW50DQo+ID4gYnVpbGRzLiBXZSByZWx5IG9uIHJlcG8g
ZmV0Y2hpbmcgdGhlIGxheWVycyB0aGF0IGFyZSBzdXBwb3NlZCB0byBiZSBwYXJ0DQo+ID4gb2Yg
dGhlIGJ1aWxkLCBhbmQgdGhlbiB3ZSBnZW5lcmF0ZSBhIGJibGF5ZXJzLmNvbmYuc2FtcGxlIHRo
YXQgbWF0Y2hlcw0KPiA+IHRoZSBmZXRjaGVkIGxheWVycy4NCj4gDQo+IFRoZSBzdGF0aWMgdGVt
cGxhdGVzIGlzIG9ubHkgYSBzdGFydGluZyBwb2ludC4gVGhlIG5leHQgc3RlcCB3b3VsZCBiZQ0K
PiB0byBzdXBwb3J0IHByZWZhYnJpY2F0ZWQgJ2NvbmZpZ3VyYXRpb24gZnJhZ21lbnRzJyBzdG9y
ZWQgaW5zaWRlDQo+IGxheWVycyB0aGF0IGNhbiBiZSBkeW5hbWljYWxseSBhZGRlZC9yZW1vdmVk
IGludG8gbG9jYWwuY29uZiBhbmQvb3IgYQ0KPiBkaXN0cm8gZGVmaW5pdGlvbiwgc28gaWRlYXMg
Zm9yIHRoZSBkZXNpZ24gYW5kIFVJIHdvdWxkIGJlIHdlbGNvbWUuDQoNCldlbGwsIHRoZSB3YXkg
d2UgaGF2ZSBzb2x2ZWQgdGhhdCBpcyB0byBhbGxvdyBhIGxheWVyIHRvIGNvbnRhaW4gDQpjb25m
L2xvY2FsLmNvbmYuc2FtcGxlLlhYIGZpbGVzIChhbmQgYWxzbyBjb25mL2NvbmYtbm90ZXMudHh0
LlhYIGZpbGVzKSANCndoZXJlIFhYIGlzIGFueSBudW1iZXIgYmV0d2VlbiAwMCBhbmQgOTkuIFdl
IGFsc28gYXNzdW1lIHRoZSBzYW1wbGUgDQpmaWxlcyBmcm9tIG1ldGEtcG9reSBoYXZlIFhYID09
IDUwLiBUaGVuIHdoZW4gd2UgZ2VuZXJhdGUgb3VyIA0KdGVtcGxhdGVjb25mIGRpcmVjdG9yeSwg
d2UgY29uY2F0ZW5hdGUgYWxsIHRoZXNlIGZpbGVzIG9yZGVyZWQgYnkgWFggDQoocmVnYXJkbGVz
cyBvZiB3aGljaCBsYXllciB0aGV5IGNvbWUgZnJvbSkuDQoNCj4gDQo+IEFsZXgNCg0KLy9QZXRl
cg0KDQo=

