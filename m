Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3A8ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 14:47:50 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.7391.1662130062392301502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Mn9kDA6/;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662130062;
  x=1693666062;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q7wO+5eh24Zsn39TCACOjiwYAE8OAxKQTnCYIkrH8kc=;
  b=Mn9kDA6/0FXMiQbaRMsWQOYVtmIS7cYn0En6ksBC0jXjfNFOIkasfN8v
   PoQkT8ROR3oFTYq4Dk4D6VOEqSJrDBpM7vIcdG5szYAmK9hA6HCNJ89k+
   IDXdyOpnljktz2+tVn3ga+aqgXckF3bdHfL3XbDtzYqWweEgL4hspYYsn
   ZC6F1GW6hgj4Mwjpmih2tDgxMjz3nDa1PlpR0S24OYDX6KTqlutRRzzMT
   JyIgRVtKbwvYMqZtAUeY5KPL/swP+Nqa2/J/KWInL9cUFhu+Xu+y7B5tO
   GjLaG+Ow5Q1mMdRUxRMAVls3tqmAFjOGYzOVdX83LupZ5vPzX/kOdlNBM
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
Thread-Index: AQHYvg5w+gc06PVyMEyd9jx0rCMZKa3LPiMQgAAuDwCAAMn6sA==
Date: Fri, 2 Sep 2022 14:47:40 +0000
Message-ID: <813962d42b7c46c9a0a8565de787d981@axis.com>
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <CANNYZj9cXbFogXaJdTeb2r89-AaPyL3txoJ4xn3ER=Dq7jy0mA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9cXbFogXaJdTeb2r89-AaPyL3txoJ4xn3ER=Dq7jy0mA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 14:47:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170251

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDIgc2VwdGVtYmVyIDIwMjIgMDY6
MzINCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgQWxleGFu
ZGVyIEthbmF2aW4NCj4gPGFsZXhAbGludXRyb25peC5kZT4NCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6IG1pZ3JhdGUNCj4gYnVpbGQv
Y29uZi90ZW1wbGF0ZWNvbmYuY2ZnIHRvIG5ldyB0ZW1wbGF0ZSBsb2NhdGlvbnMNCj4gDQo+IE9u
IEZyaSwgMiBTZXB0IDIwMjIgYXQgMDI6MTIsIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPiBTaW5jZSB0aGUgdGVzdCB5b3UgYWRk
ZWQgcHJldmlvdXNseSBub3cgcmVxdWlyZXMgdGhhdCB0aGUgcGF0aCBjb250YWlucw0KPiA+ICIv
dGVtcGxhdGVzLyIsIHdlIG1pZ2h0IGFzIHdlbGwgZG8gdGhpcyBmb3IgYW55IGZhdWx0eSBjb25m
aWd1cmF0aW9uLg0KPiBJLmUuOg0KPiA+DQo+ID4gICAgICMgVGhlIHBhdGggaW4gJFRFTVBMQVRF
Q09ORiBtdXN0IGNvbnRhaW4gIi90ZW1wbGF0ZXMvIi4gSWYgaXQgZG9lc24ndCwNCj4gPiAgICAg
IyB1bnNldCBpdCB0byBoYXZlIGl0IHJlcGxhY2VkIGJ5IGEgKGhvcGVmdWxseSkgY29ycmVjdCBw
YXRoLg0KPiA+ICAgICBjYXNlICRURU1QTEFURUNPTkYgaW4NCj4gPiAgICAgICAgICovdGVtcGxh
dGVzLyopDQo+ID4gICAgICAgICAgICAgOzsNCj4gPiAgICAgICAgICopDQo+ID4gICAgICAgICAg
ICAgdW5zZXQgVEVNUExBVEVDT05GDQo+ID4gICAgICAgICAgICAgcm0gIiRCVUlMRERJUi9jb25m
L3RlbXBsYXRlY29uZi5jZmciDQo+ID4gICAgICAgICAgICAgOzsNCj4gPiAgICAgZXNhYw0KPiA+
DQo+ID4gSWYgLnRlbXBsYXRlY29uZiBoYXNuJ3QgYmVlbiB1cGRhdGVkIHRvIGNvbXBseSB3aXRo
IHRoZSBuZXcgcnVsZXMsIHRoZQ0KPiA+IHRlc3QgbGF0ZXIgd2lsbCBwb2ludCB0aGlzIG91dC4g
QnV0IGlmIGl0IGhhcyBiZWVuIHVwZGF0ZWQsIHRoZSBjYXNlDQo+ID4gc3RhdGVtZW50IGFib3Zl
IHdpbGwgYXZvaWQgdGhlIHByb2JsZW0gb2YgYW4gb2xkLCBub24tY29tcGx5aW5nDQo+ID4gY29u
ZmlndXJhdGlvbiByZWdhcmRsZXNzIG9mIHdoaWNoIGxheWVyIGl0IGNvbWVzIGZyb20uDQo+IA0K
PiAudGVtcGxhdGVjb25mIGlzIG5vdCBhIHVuaXZlcnNhbCBmaWxlIHRoYXQgY2FuIGJlIHBsYWNl
ZCBpbnRvIGFueQ0KPiBsYXllciwgaXQgaXMgc3BlY2lmaWMgdG8gcG9reS9vZS1jb3JlLCBhcyBp
dCBpcyByZWFkIGZyb20gJE9FUk9PVCwNCj4gd2hpY2ggaW4gdHVybiBpcyBkZWZpbmVkIGFzIGxv
Y2F0aW9uIG9mIG9lLWluaXQtYnVpbGQtZW52Lg0KDQpUaGF0IGFzc3VtcHRpb24gZG9lc24ndCBo
b2xkIHRydWUuIE91ciBlbnZpcm9ubWVudCBpcyBzZXQgdXAgdG8gbWltaWMgDQpQb2t5LCBidXQg
d2l0aCBleHRyYSBsYXllcnMgYW5kIG91ciBvd24gdmVyc2lvbiBvZiAiLnRlbXBsYXRlY29uZiIg
DQooaW5zdGFsbGVkIHZpYSBhIDxjb3B5ZmlsZT4gZWxlbWVudCBpbiB0aGUgcmVwbyBtYW5pZmVz
dCkuIFNvIA0KZXZlcnl0aGluZyB3b3JrcyBhbmQgbG9va3MgbGlrZSBQb2t5LCBleGNlcHQgdGhl
cmUgYXJlIG1vcmUgbGF5ZXJzIA0KYXZhaWxhYmxlLg0KDQpXaXRoIG15IHN1Z2dlc3RlZCBjaGFu
Z2UgYWJvdmUgdGhlIGNvZGUganVzdCB3b3Jrcywgd2l0aG91dCBhbnkgDQphcnRpZmljaWFsIGxp
bWl0cyBzdWNoIGFzIG9ubHkgd29ya2luZyBmb3IgcGxhaW4gT0UvUG9reS4NCg0KPiBTbyBpZiB0
aGUgZml4aW5nIHVwIGlzIG1hZGUgZ2VuZXJpYyBhcyBzdWdnZXN0ZWQsIGl0IHdpbGwgb25seSBy
ZXBsYWNlDQo+IGluY29ycmVjdCBidXQgYXQgbGVhc3QgaGVscGZ1bCB2YWx1ZSBvZiB0aGUgb3Jp
Z2luYWwgY3VzdG9tIHRlbXBsYXRlDQo+IGxvY2F0aW9uIHdpdGggdGhlIGdlbmVyaWMgZGVmYXVs
dCB0ZW1wbGF0ZSBsb2NhdGlvbiBpbiBwb2t5L2NvcmUuDQoNClRoZSBleHBlY3RhdGlvbiBpcyBv
ZiBjb3Vyc2UgdGhhdCBpZiBvbmUgaGFzIG9uZSdzIG93biAudGVtcGxhdGVjb25mIA0KZmlsZSwg
dGhlbiBpdCB3aWxsIG9mIGNvdXJzZSBoYXZlIHRvIGJlIHVwZGF0ZWQgdG8gbWF0Y2ggdGhlIGNo
YW5nZXMgDQppbiBPRS4gTm90aGluZyB1bnVzdWFsIHdpdGggdGhhdC4gQnV0IHRoYXQgaXMgc29t
ZXRoaW5nIEkgZG8gYXMgDQptYWludGFpbmVyIG9mIG91ciBlbnZpcm9ubWVudC4gRm9yIG91ciBk
ZXZlbG9wZXJzIGl0IHdpbGwgdGhlbiBqdXN0IA0Kd29yay4NCg0KPiANCj4gV2UgY2FuIGhvd2V2
ZXIgYWRkIGEgaGludCB0byBjaGVjayB3aGF0IGlzIGluDQo+IGJ1aWxkL2NvbmYvdGVtcGxhdGVj
b25mLmNmZyBpZiB0aGUgdGVzdCBmYWlscywgYXMgaXQgaXMgbm90IG9idmlvdXMNCj4gdGhhdCBU
RU1QTEFURUNPTkYgb2J0YWluZWQgZnJvbSB0aGVyZSB0YWtlcyBwcmlvcml0eSBvdmVyIG90aGVy
DQo+IHNvdXJjZXMgKHdoaWNoIGFyZSwgaW4gb3JkZXIsIFRFTVBMQVRFQ09ORiBwYXNzZWQgdmlh
IGVudmlyb25tZW50LA0KPiB0aGVuIC50ZW1wbGF0ZWNvbmYgbmV4dCB0byBvZS1pbml0LWJ1aWxk
LWVudikuDQo+IA0KPiBBbGV4DQoNCi8vUGV0ZXINCg0K

