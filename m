Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB77C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:22:36 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.15314.1664306549714840409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DgmvHmnX;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664306550;
  x=1695842550;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QGNeu2Nw3fNTnMK7dSki3lj70gqAe0mClzfa6KAYF0c=;
  b=DgmvHmnXaX7vO346+wpyxq5u9r/Y3loDAhdFrgg1ENjSCHdk6KjABvyP
   e2kdYaY3lFEY7EbX1YRsTnvwGMEJboB1eVFu/anVhWFLrmfNsozvjvO57
   TOUtloP6EAdXuBwVp6rx8CZcA2tFkRPRbYMybjeWsf2jGp1LiVXxGLkDd
   +u2+XH9ILJ9g7mMNsRIIHg6X+PYS2gzdhbD/s2W4vEbhP2kAdMyhoMLhO
   6TXJ3nq87/6aTEnqlED84mV8i2+WuHfEbaAzElJen7ym/gBa+OjdHkrB5
   MlGsHVy9xX+xsVmjK+RbaD4aYD+9AUga1HalEcuV0Etq5/RhJwUSidJHi
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
 AQHYzoU23gOhP1a3LUCPmQBsEwAbcq3rbfEAgAAKPgCAAE42AIAHlUfggAAWuO2AAAKbsP//8vCAgABABiA=
Date: Tue, 27 Sep 2022 19:22:26 +0000
Message-ID: <6abf4530302c415fab1356d820757237@axis.com>
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
 <CANNYZj-c_z73wttGbAUv7FyKA5oGW6AaohuxMjoV6vEnmPg2wQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-c_z73wttGbAUv7FyKA5oGW6AaohuxMjoV6vEnmPg2wQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:22:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171127

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI3IHNlcHRlbWJlciAyMDIyIDE5
OjA1DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4NCj4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPjsgT0UtY29yZQ0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBvZS1zZXR1cC1idWlsZGRp
cjogRG8gbm90IGhhcmRjb2RlDQo+IGludmFsaWQgcGF0aHMgZm9yIHRlbXBsYXRlcw0KPiANCj4g
T24gVHVlLCAyNyBTZXB0IDIwMjIgYXQgMTg6MDYsIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPiBJIChhbmQgdGhlIHNtYWxsIHRl
YW0gSSBhbSBwYXJ0IG9mKSBpcyB0aGUgcHJveHkgYmV0d2VlbiB0aGVtIGFuZCBZb2N0by4NCj4g
PiBUaHVzIEkgdHJ5IHRvIGFkZHJlc3MgdGhlaXIgbmVlZHMgYnkgbWFraW5nIHN1cmUgbmV3IHZl
cnNpb25zIG9mIFlvY3RvDQo+ID4gY29udGludWVzIHRvIHdvcmsgZm9yIHRoZW0gd2l0aG91dCBo
YXZpbmcgNTAwKyBkZXZlbG9wZXJzIGZhY2luZyB0aGUNCj4gPiBzYW1lIHByb2JsZW1zLiBJLmUu
LCBpdCBpcyBteSBqb2IgdG8gd29yayB3aXRoIHVwc3RyZWFtLCB3aGljaCBpcyB3aGF0DQo+ID4g
SSBhbSB0cnlpbmcgdG8gZG8gaGVyZS4NCj4gDQo+IEV4Y3VzZSBtZSwgYnV0IHlvdXIgam9iIGlz
IG5vdCB0byAnd29yayB3aXRoIHVwc3RyZWFtJy4gWW91ciBqb2IgaXMgdG8NCj4gbWFrZSBkYW1u
IHN1cmUgJ3Vwc3RyZWFtJyBjb250aW51ZXMgdG8gZXhpc3QuIFdoaWNoIG1lYW5zOiBnbyB0byB5
b3VyDQo+IG1hbmFnZW1lbnQsIGRlc2NyaWJlIHRoZSBzaXR1YXRpb24gd2UncmUgaW4gKHlvdSBo
YXZlIHRoZSBudW1iZXJzKSwNCg0KV2hpY2ggaXMgZXhhY3RseSB3aHkgSSBoYXZlIHdvcmtlZCBv
biBhbmQgZmluYWxseSBjb252aW5jZWQgbXkgDQptYW5hZ2VtZW50IHRoYXQgaXQgaXMgaW1wb3J0
YW50IGZvciB1cyB0byBiZWNvbWUgYSBZb2N0byBtZW1iZXIsIA0Kd2hpY2ggd2Ugbm93IGFyZS4N
Cg0KPiBhbmQgYXNrIHRoYXQgdGhleSBhbGxvY2F0ZSBhdCBsZWFzdCBvbmUgZGV2ZWxvcGVyIHRv
IHdvcmsgaW4gdXBzdHJlYW0NCj4gZnVsbCB0aW1lLiANCg0KVGhhdCBpcyBoYXJkZXIuIFdlIGhh
dmUgYSBoYXJkIGVub3VnaCB0aW1lIHRvIHJlY3J1aXQgcGVvcGxlIHRvIA0Kb3VyIHRvb2xzIHRl
YW0gKHdoaWNoIGluY2x1ZGVzIHRoZSBidWlsZCB0ZWFtIHRoYXQgSSBhbSBwYXJ0IG9mKSANCmFz
IGl0IGlzLiBGb3Igc29tZSByZWFzb24sIHdvcmtpbmcgd2l0aCB0b29scyBhbmQgYnVpbGQgc3lz
dGVtcyANCmFwcGFyZW50bHkgaXMgbm90IGFzIHNleHkgYXMgd29ya2luZyB3aXRoIHdlYiBkZXZl
bG9wbWVudCBhbmQgQUkuDQoNCj4gTm90IGRyaXZlLWJ5IHBhdGNoZXMgdG8gZml4IHlvdXIgc3Bl
Y2lmaWMgcHJvZHVjdCBwcm9ibGVtcywNCg0KSSdtIHNvcnJ5IHRvIGhlYXIgdGhhdCB5b3UgdGhp
bmsgYWxsIEkgZG8gaXMgZHJpdmUtYnkgcGF0Y2hlcy4gDQpJIHRob3VnaHQgbXkgY29udHJpYnV0
aW9ucyB3ZXJlIGEgbGl0dGxlIGJpdCBtb3JlIGFwcHJlY2lhdGVkIA0KdGhhbiB0aGF0LiA6KA0K
DQo+IGJ1dCB1cHN0cmVhbSBwcm9wZXI6IHNvbWV0aGluZyB0aGF0IG1ha2VzIHRoZSBwcm9qZWN0
IHN1c3RhaW5hYmxlLA0KPiBlLmcuIGZpeGluZyBtZWRpdW0rL2hpZ2ggYnVncywgd29ya2luZyBv
biBuZXcgZmVhdHVyZXMsIHVwZ3JhZGluZw0KPiByZWNpcGVzLCBzZW5kaW5nIHBlbmRpbmcgcGF0
Y2hlcyB1cHN0cmVhbS4gVGhpcyB3b3JrcyBuZXZlciBlbmRzLCBhbmQNCj4gbm8gb25lIHdhbnRz
IHRvIGRvIGl0Lg0KDQpBbmQgSSBjYW4gYXNzdXJlIHlvdSB0aGF0IGV2ZXJ5b25lIGFwcHJlY2lh
dGUgdGhlIHVuZ3JhdGVmdWwgDQp3b3JrIHlvdSBhbmQgb3RoZXJzIGRvIHRvIGtlZXAgdGhpbmdz
IHJ1bm5pbmcuIFdlIHJlYWxseSBkby4NCiANCj4gSWYgeW91IGNhbiBkbyB0aGlzLCBJIHByb21p
c2UgdG8gYmUgbW9yZSBzeW1wYXRoZXRpYyB0byB5b3VyDQo+IHBhcnRpY3VsYXIgaXNzdWVzLCBi
dXQgYXMgdGhpbmdzIHN0YW5kLCBpdCdzIHJhdGhlciBkaWZmaWN1bHQuDQo+IA0KPiBBbGV4DQoN
Ci8vUGV0ZXINCg0K

