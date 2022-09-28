Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E6DC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 12:45:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7349.1664369148277220309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 05:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ImmbipcT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664369149;
  x=1695905149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2D08KTgZkxUL5o/TGzikrD4Q2Q6EeHFbg9eFuUhSHZY=;
  b=ImmbipcTY2z50qi21Xaycw8/bHVM1psyOcPndPg+J4lK9ZAB4YNSGKZ4
   UR19HLY6AzrOa1oXpylMXlFzUXXUchj9sxqbV3zGLG9kj3GG07RSZnvs3
   oUpSNCYRgnkdqogsrolFa6c+i3I4TqgdiDS2IM4MfbJcLcILoi3wU+QRl
   tte4gWsZ25CFSf1sbBIxTz/9TFA4ZqyoAj2Q2HKWk+u42IiaztnQIgDyT
   uDXXf5UvyX/+cZ41OeWrqK2vorctlwrydOuhtRVu0cjUIl/4hDgopR/tR
   5KdfG7gmbtkF9n9474VBPJR0kFHwxVyZZIoh3b2esM4Jg2FSIMHDC0BYl
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
Thread-Topic: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
Thread-Index: 
 AQHYzoU23gOhP1a3LUCPmQBsEwAbcq3rbfEAgAAKPgCAAE42AIAHlUfggAAWuO2AAAKbsP//5X+AgAApBUCAABTtgIAAKjuw///084CAAOGQgP//+ySAAAXQ9ZA=
Date: Wed, 28 Sep 2022 12:45:45 +0000
Message-ID: <49b80061523b44f0bad86d46dce28915@axis.com>
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
 <77825785242f4d99b336af0da596e286@axis.com>
 <CANNYZj81uAD1wMJyizCHTiwCnCnw_XMOLqPOzKGu0Og1sejauw@mail.gmail.com>
 <1568abaf9b604bfaae699a53c537d51b@axis.com>
 <CANNYZj_L2+OJE4TYt4A2QVXjsmSOVWKbWD4EPz=AkQj5snxXgA@mail.gmail.com>
 <b1adfa5db65d431a8959e07181bfffa2@axis.com>
 <CANNYZj_m0cD7zb6BZt4MjUimtU7KuEsSn2RWmbTYsL=Msgu2nw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_m0cD7zb6BZt4MjUimtU7KuEsSn2RWmbTYsL=Msgu2nw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 12:45:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171149

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI4IHNlcHRlbWJlciAyMDIyIDEz
OjAwDQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4NCj4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPjsgT0UtY29yZQ0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBvZS1zZXR1cC1idWlsZGRp
cjogRG8gbm90IGhhcmRjb2RlDQo+IGludmFsaWQgcGF0aHMgZm9yIHRlbXBsYXRlcw0KPiANCj4g
T24gV2VkLCAyOCBTZXB0IDIwMjIgYXQgMTE6NTQsIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPiBJZiBpdCBpcyB0aGUgbGF0dGVy
LCBpdCB3b3VsZG4ndCB3b3JrICh1bmxlc3MgSSB5ZXQgYWdhaW4gZHVwbGljYXRlIHRoZQ0KPiA+
IGNvZGUgdG8gZmlndXJlIG91dCB0aGUgYnVpbGQgZGlyZWN0b3J5IGJlZm9yZSBzb3VyY2luZyB0
aGUgcmVhbA0KPiA+IG9lLWluaXQtYnVpbGQtZW52KSBzaW5jZSBiZWZvcmUgc291cmNpbmcgdGhl
IHJlYWwgb2UtaW5pdC1idWlsZC1lbnYgSQ0KPiA+IGNhbm5vdCB0ZWxsIGlmIHRoZXJlIGFscmVh
ZHkgaXMgYSBiYmxheWVycy5jb25mIGZpbGUgaW4gd2hpY2ggY2FzZSB0aGUNCj4gPiB3cmFwcGVy
IHNob3VsZCBub3QgYWRkL3JlbW92ZSBhbnkgbGF5ZXJzLCBhbmQgYWZ0ZXIgc291cmNpbmcgdGhl
IHJlYWwNCj4gPiBvZS1pbml0LWJ1aWxkLWVudiBpdCBpcyB0b28gbGF0ZSBhcyBJIHRoZW4gY2Fu
bm90IGRpc3Rpbmd1aXNoIGJldHdlZW4NCj4gPiB0aGlzIGJlaW5nIHRoZSBmaXJzdCB0aW1lIG9l
LWluaXQtYnVpbGQtZW52IGlzIHNvdXJjZWQgb3IganVzdCBhDQo+ID4gcmVpbml0aWFsaXphdGlv
biBvZiBhbiBhbHJlYWR5IGV4aXN0aW5nIGVudmlyb25tZW50Lg0KPiANCj4gWWVzIHRoaXMgaXMg
dGhlIHNjZW5hcmlvIEkgd2FzIHRoaW5raW5nIG9mOiB3aGF0IHNob3VsZCBoYXBwZW4gaW5zaWRl
DQo+IHRoZSB3cmFwcGVyOg0KPiANCj4gLiBvZS1pbml0LWJ1aWxkLWVudiAodGhpcyB0YWtlcyB0
aGUgb3JpZ2luYWwgcG9reSB0ZW1wbGF0ZSkNCj4gYml0YmFrZS1sYXllcnMgYWRkLWxheWVyIG1l
dGEtYQ0KPiBiaXRiYWtlLWxheWVycyBhZGQtbGF5ZXIgbWV0YS1iDQo+IC4uLg0KPiANCj4gV2h5
IHdvdWxkIHlvdSB3YW50IHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gd2hldGhlciB0aGlzIGlzIGFn
YWluc3QgYQ0KPiBuZXdseSBtYWRlIGRpciBvciBhbiBvbGRlciBvbmU/IEkganVzdCBjaGVja2Vk
OiBhZGRpbmcgYSBsYXllciB0aGF0IA0KPiBpcyBhbHJlYWR5IGluIGJibGF5ZXJzLmNvbmYgZG9l
cyBub3RoaW5nLg0KDQpCZWNhdXNlLCB3aGlsZSB3ZSB3YW50IHRoZSBsYXllcnMgZmV0Y2hlZCB0
byBiZSBwcmVzZW50IGluIGJibGF5ZXJzLmNvbmYgDQpieSBkZWZhdWx0LCBpdCBpcyBzdGlsbCBl
eHBlY3RlZCB0aGF0IGRldmVsb3BlcnMgZHVyaW5nIGRldmVsb3BtZW50IGNhbiANCmFkZCBhbmQg
cmVtb3ZlIGxheWVycy4gQW5kIGlmIGEgZGV2ZWxvcGVyIGhhcywgZS5nLiwgcmVtb3ZlZCBhIGxh
eWVyLCBpdCANCmlzIG5vdCBleHBlY3RlZCB0aGF0IHNvdXJjaW5nIG9lLWluaXQtYnVpbGQtZW52
IGFnYWluIHNob3VsZCByZXN0b3JlIHRoZSANCnJlbW92ZWQgbGF5ZXIuDQoNCj4gDQo+IEknbSBh
bHNvIHVuc3VyZSB3aHkgYXJlIHlvdSBzbyBhZGFtYW50bHkgYWdhaW5zdCBjaGVja2luZyBpZiB0
aGUgYnVpbGQNCj4gZGlyIGFscmVhZHkgZXhpc3RzIGJlZm9yZSB0aGUgZmFjdC4gSXQncyBub3Qg
dGhhdCBkaWZmaWN1bHQgKGVpdGhlcg0KPiBpdCdzIHJlbGF0aXZlIHRvIGBwd2RgIG9yIGFuIGFi
c29sdXRlIHBhdGgpLCBhbmQgbm90IGxpa2VseSB0byBjaGFuZ2UNCj4gdXBzdHJlYW0uDQoNClNp
bmNlIG91ciB3cmFwcGVyIGlzIGV4cGVjdGVkIHRvIGJlaGF2ZSBhcyBvZS1pbml0LWJ1aWxkLWVu
diBpdCBtdXN0IA0KYWxzbyBjYWxjdWxhdGUgdGhlIGJ1aWxkIGRpcmVjdG9yeSBhcyBvZS1pbml0
LWJ1aWxkLWVudiB3b3VsZC4gQW5kIG5vLCANCml0IGlzIG5vdCBoYXJkIHRvIGRvLCBidXQgaXQg
bWVhbnMgY29kZSBkdXBsaWNhdGlvbiBhbmQgdGhhdCB3ZSBhcmUgDQpzdXNjZXB0aWJsZSB0byB1
cHN0cmVhbSBjaGFuZ2VzLiBJdCBpcyBub3QgYSBtYWpvciBwcm9ibGVtIGFuZCBpdCBpcyANCnRo
ZSB3YXkgSSB3aWxsIHNvbHZlIHRoaXMgaWYgSSBjYW5ub3QgZ2V0IGEgY2hhbmdlIGFjY2VwdGVk
IHVwc3RyZWFtLCANCmJ1dCBldmVyeSBzdWNoIHNtYWxsIGFkZGl0aW9uIGFkZHMgdG8gdGhlIG1h
aW50ZW5hbmNlIGJ1cmRlbi4NCg0KPiBBbGV4DQoNCi8vUGV0ZXINCg0K

