Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2D7C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 14:44:03 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.11730.1661352240635885211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 07:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Xf2wDzJ3;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661352241;
  x=1692888241;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VNIwrBAEZQ/LoOxl9hQo2dnuj/STY8jFKNqmm0yqLX4=;
  b=Xf2wDzJ32YyjYg4Ml4r1aOdlKfCRRN4iSkEvsoq13qjsxwQLFStjcksc
   1c9j5L9QJduRya1QrL6PusJd9EBrHEYcubEiwSBRBZwm6RWaK0GzM2h3s
   91XLpldnB6s1YRE/j4K5iSQzvvAc8cx0zcJ5Vk8FiT9GaNHydj3ADX8PC
   Uq3MrfW6Cal/l/viI7L+21XkccaI/idTZppSjNofDGunbbK/VtHWEDhrm
   qNStPNBUU5xDr8se0uZR7O+MHCZzZOTpXimPNnlrFmwelp9XLpe6ZOK0M
   ckrFrntmBS19hDWqoBuTUiYMk8nBCyi0kHetVuSSSqzWZ4LXYFIK+/1t6
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Thread-Topic: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check
 that TEMPLATECONF is valid
Thread-Index: AQHYt7cRSHWGrcP8wUm8EpgvpR7Rga2+D7iA///lUQCAACL9EA==
Date: Wed, 24 Aug 2022 14:43:57 +0000
Message-ID: <aa755beb07f143619c3c7fec974ce2a3@axis.com>
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 14:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169821

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI0IGF1Z3VzdGkgMjAyMiAxNjow
OQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBBbGV4YW5k
ZXIgS2FuYXZpbg0KPiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCAyLzJdIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6IGFkZCBhIGNoZWNrDQo+
IHRoYXQgVEVNUExBVEVDT05GIGlzIHZhbGlkDQo+IA0KPiBPbiBXZWQsIDI0IEF1ZyAyMDIyIGF0
IDE1OjU4LCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4gd3JvdGU6DQo+ID4gUGxlYXNlIG5vLiBUaGlzIGhhcHBlbnMgdG8gbWF0Y2ggeW91ciBleHBl
Y3RhdGlvbnMsIGJ1dCBkb2Vzbid0IGF0DQo+ID4gYWxsIG1hdGNoIG91ciB1c2Ugb2YgVEVNUExB
VEVDT05GLiBJbiBvdXIgLnRlbXBsYXRlY29uZiB3ZSBzZXQNCj4gPiBURU1QTEFURUNPTkY9JHtU
RU1QTEFURUNPTkY6LXRlbXBsYXRlY29uZn0gYW5kIGNyZWF0ZSB0aGUgdGVtcGxhdGVjb25mDQo+
ID4gZGlyZWN0b3J5IGluIHJ1bnRpbWUgd2hlcmUgd2UgZ2VuZXJhdGUgdGhlIHNhbXBsZSBmaWxl
cyB0aGF0IG1hdGNoIHRoZQ0KPiA+IGxheWVycyB0aGF0IHJlcG8gaGFzIGZldGNoZWQgZm9yIHRo
aXMgcGFydGljdWxhciBidWlsZC4gSXQgb2J2aW91c2x5DQo+ID4gaGFzIG5vIGxheWVyLmNvbmYg
ZmlsZSBhcyBpdCBpcyBpbiBubyBsYXllciwgYW5kIHRoZSBwYXRoIGRvZXNuJ3QNCj4gPiBjb250
YWluICJ0ZW1wbGF0ZXMvPHNvbWV0aGluZz4iLiBJIGNhbiBvZiBjb3Vyc2UgY2hhbmdlIG91ciB0
b29scyB0bw0KPiA+IGNyZWF0ZSBhIGNvdXBsZSBvZiBleHRyYSBkaXJlY3RvcmllcyB0byBtYXRj
aCB5b3VyIGV4cGVjdGF0aW9ucywgYnV0DQo+ID4gYXQgdGhlIHNhbWUgdGltZSBpdCBzZWVtcyB2
ZXJ5IHVubmVjZXNzYXJ5Lg0KPiANCj4gSWYgeW91IGNyZWF0ZSB0aGUgdGVtcGxhdGUgZmlsZXMg
b24gdGhlIGZseSwgdGhlbiB5b3UgbWlnaHQgYXMgd2VsbA0KPiBjcmVhdGUgdGhlIGFjdHVhbCBj
b25maWdzIGRpcmVjdGx5IGludG8gYnVpbGQvY29uZiBhbmQgc2tpcCB0aGUNCj4gdGVtcGxhdGUg
c3RlcC4gTm8/DQoNCldlIGNyZWF0ZSB0aGUgc2FtcGxlIGZpbGVzIGluIGEgc21hbGwgd3JhcHBl
ciBmb3Igb2UtaW5pdC1idWlsZC1lbnYgDQpzbyB0aGF0IHRvIHRoZSB1c2VycywgZXZlcnl0aGlu
ZyB3b3JrcyBqdXN0IGFzIGRlc2NyaWJlZCBpbiB0aGUgWW9jdG8gDQpkb2N1bWVudGF0aW9uLiBB
bmQgc2luY2UgdGhlIE9FIHNjcmlwdHMgZXhwZWN0IFRFTVBMQVRFQ09ORiB0byBiZSBzZXQgDQph
bmQgY29udGFpbiBzYW1wbGUgZmlsZXMsIHRoYXQgaXMgd2hhdCB3ZSBjcmVhdGUuDQoNCj4gV2Ug
ZG8gbmVlZCB0byBzdGFuZGFyZGl6ZSB0aGUgbG9jYXRpb24gZm9yIHRoZSB0ZW1wbGF0ZXMgZm9y
IHJlYXNvbnMNCj4gb2YgZGlzY292ZXJhYmlsaXR5IGFuZCBjb25zaXN0ZW5jeSB3aXRoIG1hY2hp
bmUgYW5kIGRpc3Rybw0KPiBkZWZpbml0aW9ucywgdGhpcyBoYXMgYmVlbiBkaXNjdXNzZWQuDQoN
ClN1cmUsIHRoYXQgaXMgZmluZS4gQnV0IHRoZSBleHBlY3RhdGlvbiBJIGhhdmUgaXMgdGhhdCBU
RU1QTEFURUNPTkYgDQpyZWZlcnMgdG8gdGhlIGRpcmVjdG9yeSB0aGF0IGhhcyB0aGUgc2FtcGxl
IGZpbGVzIG5lZWRlZCB0byBzZXQgdXAgDQp0aGUgYnVpbGQgZW52aXJvbm1lbnQuIEFuZCB0aGF0
IGlzIGl0LiBBcyBsb25nIGFzIHRoZSBzYW1wbGUgZmlsZXMgDQpleGlzdCB3aGVyZSBpdCBzYXlz
IHRoZXkgc2hvdWxkIGJlLCB3aHkgZG8geW91IG5lZWQgdGhlIHNjcmlwdHMgdG8gDQpmYWlsIGJl
Y2F1c2UgdGhlIGVudmlyb25tZW50IGFyb3VuZCB0aGUgZGlyZWN0b3J5IGRvZXMgbm90IGxvb2sg
DQpsaWtlIHdoYXQgeW91IGhhcHBlbiB0byBleHBlY3Q/IEl0IGlzIG9ubHkgdGhlIGNvbnRlbnRz
IG9mIHRoZSANCmRpcmVjdG9yeSB0aGF0IG1hdHRlcnMuIE9yIGFtIEkgbWlzc2luZyBzb21ldGhp
bmc/DQoNCj4gDQo+IEFsZXgNCg0KLy9QZXRlcg0KDQo=

