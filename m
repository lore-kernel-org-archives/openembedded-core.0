Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05235C54EAA
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 12:46:43 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.17404.1674391599477054665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 04:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=R+B2HcPK;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674391600;
  x=1705927600;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qsmpPKK2SpUgHOgazRHcH1sxO9cNoGgJT1RsQL9D2Ow=;
  b=R+B2HcPKW8cugtbd9tOVPmh1RY3F1fhbd02Fpc4GP7V3xV+z7HI9Q0v/
   EIhzm+WXS9thxZcrTgKP2yYv7vVPmhXfck97ozmTdHNRuXD1XvD9VF/zK
   BgfAfnCaGg2cOCFJug693CGmlel/hCLMtFLxJ7yW7E8BI0cjDCmS1VdlL
   I0lBWl3vBNFIEb5Fu8IcrYh9yDu25xpqp3KqVfteG+XfhSwHjcOLBTZzP
   L9KmfsNwOmiyLzcOhkv84ZetWzUgpoeFQQMTNlQgQcQPV9r61TJS7WxLC
   xiOS0JEGPqdicBbq4gWVZu3exuK7HFI6z7IYnrz0me023zsjC1lpyUujV
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
Thread-Topic: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
Thread-Index: AQHZK0hZIUrez+jCqE2XC+/JMK19o66laE6AgAAJJYCAAEKNgIAAERyAgAGKBQCAAE8xAIAABW+AgAACi4CAADhkgIACh/Cg
Date: Sun, 22 Jan 2023 12:46:36 +0000
Message-ID: <b354270257b047d5bcfcc73a7ac13270@axis.com>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230119102423.3493565d@booty>
	 <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
	 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
	 <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
	 <CADkTA4OFa9oKKHUYNcpXY2Rfvs_kyJOCbiWMDMDb2Y=84KHPJQ@mail.gmail.com>
	 <CANNYZj_C7-U=a-TohJtcEVOYyaj0sYNnV_2EBnA55wT2QHT0Jw@mail.gmail.com>
	 <CADkTA4Nq=X6d9qz1a+Q0mEpb=ob0_+TsoHdkGn2nycd8+FOz=g@mail.gmail.com>
	 <CANNYZj9yXjUFiAkoGnefvoKzCTut8BMgR-y4y7zu+=0vom9TKA@mail.gmail.com>
 <3b311ccc982ae39cc72c428ddc97386fe8d653e7.camel@linuxfoundation.org>
In-Reply-To: <3b311ccc982ae39cc72c428ddc97386fe8d653e7.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 12:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176260

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAyMSBq
YW51YXJpIDIwMjMgMDA6MDENCj4gVG86IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPjsgQnJ1Y2UgQXNoZmllbGQNCj4gPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4N
Cj4gQ2M6IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgT0UtY29yZSA8b3BlbmVt
YmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIDEvM10gaW5zYW5lOiBJbXByb3ZlIHBhdGNoIHdhcm5pbmcvZXJyb3IN
Cj4gaGFuZGxpbmcNCj4gDQo+IE9uIEZyaSwgMjAyMy0wMS0yMCBhdCAyMDozOCArMDEwMCwgQWxl
eGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+ID4gT24gRnJpLCAyMCBKYW4gMjAyMyBhdCAyMDoyOSwg
QnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiBC
ZWNhdXNlIEknbSBzaW1wbHkgbm90IGdvaW5nIHRvIGluc2lzdCBvbiBpdCBpbiBhbGwgdGhlIHBh
dGNoZXMuIEkNCj4gPiA+IG5lZWQgYWxsIHRoZSBjb250cmlidXRpb25zIEkgY2FuIGdldCwgYW5k
IEknbSBub3QgZ29pbmcgdG8NCj4gPiA+IHBlZGFudGljYWxseSBpbnNpc3Qgb24gdGhhdC4NCj4g
PiA+DQo+ID4gPiBtZXRhLXZpcnQgaXMgbm90IG9lLWNvcmUsIEkgZG8gdGhlIGxpZnRpbmcuIFRo
ZXJlZm9yZSwgaWYgYml0YmFrZQ0KPiA+ID4gZXJyb3JzLCBJIGhhdmUgdG8gZml4IGl0Lg0KPiA+
DQo+ID4gQnV0IHlvdSBkbyBub3QgbmVlZCB0byBpbnNpc3Qgb24gdGhlIG5lZWRlZCBtZXRhZGF0
YSBvciBmaXggaXQgYWZ0ZXINCj4gPiB0aGUgZmFjdC4gQml0YmFrZSB3aWxsIGRvIHRoZSBpbnNp
c3RpbmcgZm9yIHlvdSwgd2hlbiBjb250cmlidXRvcnMNCj4gPiB0ZXN0IHRoZSBjaGFuZ2UgbG9j
YWxseSAqYmVmb3JlKiB0aGV5IHNlbmQgaXQgdG8geW91LiBJZiBiaXRiYWtlDQo+ID4gZXJyb3Jz
IG9uIHlvdXIgc2lkZSwgdGhpcyBtZWFucyB0aGV5IG5ldmVyIGJ1aWx0IHRoZWlyIGNvbnRyaWJ1
dGlvbiwNCj4gPiBhbmQgeW91IHNob3VsZCByYWlzZSBhIGNvbmNlcm4gZm9yIHRoYXQgcmVhc29u
LCBhbmQgbm90IGZvciB0aGUNCj4gPiBtaXNzaW5nIG1ldGFkYXRhLg0KPiANCj4gSXQgaXNuJ3Qg
dGhhdCBzaW1wbGUgc2luY2UgdGhpcyBpcyBhIGNvbmZpZ3VyYWJsZSBRQSB3YXJuaW5nLCBhbGwg
aXQNCj4gdGFrZXMgaXMgb25lIGxheWVyL2Rpc3RybyB0byBkaXNhYmxlIGl0IGFuZCBpdCBpcyBk
aXNhYmxlZCBmb3IgYWxsDQo+IGxheWVycyB0aGF0IHVzZXIgd29ya3Mgb24uDQo+IA0KPiBUaGlz
IGlzIHdoeSAiY29yZSIgaXMgYSBzZXBhcmF0ZSBjb25maWcgdG8gIm5vbmNvcmUiIGJ1dCB3ZSBj
YW4ndCBoYXZlDQo+IGEgY29uZmlnIGZvciBldmVyeSBsYXllciBhbmQgZXZlbiBpZiB3ZSBkaWQs
IHBlb3BsZSB3b3VsZCBzdGlsbCB0dXJuIGl0DQo+IG9mZi4NCg0KUmF0aGVyIHRoYW4gaGF2aW5n
IHNlcGFyYXRlIFFBIHRlc3RzIGZvciAicGF0Y2gtc3RhdHVzLWNvcmUiIGFuZCANCiJwYXRjaC1z
dGF0dXMtbm9uY29yZSIsIGNvdWxkbid0IHdlIGhhdmUgYSBzaW5nbGUgInBhdGNoLXN0YXR1cyIg
YW5kIHRoZW4gDQpjb25maWd1cmUgaXQgdXNpbmcgYSBzZXBhcmF0ZSB2YXJpYWJsZSB0aGF0IHNw
ZWNpZmllcyB0aGUgbGF5ZXJzIHRoYXQgDQpyZXF1aXJlIHRoZSBVcHN0cmVhbS1TdGF0dXMgdHJh
aWxlcj8gVGhlbiBlYWNoIGxheWVyIHdpdGggdGhpcyByZXF1aXJlbWVudCANCmNhbiBhZGQgaXRz
ZWxmIGluIGl0cyBsYXllci5jb25mIGZpbGUgYW5kIHRodXMgaXQgaXMgdXAgdG8gdGhlIG1haW50
YWluZXIgDQp0byBkZWNpZGUgd2hldGhlciB0aGV5IHdhbnQgaXQgb3Igbm90Lg0KDQo+IElmIGl0
IGlzIHR1cm5lZCBvZmYsIGl0IG1lYW5zIHBlb3BsZSBzZW5kIHBhdGNoZXMgYW5kIEJydWNlIGhh
cyB0byBmaXgNCj4gdGhlbSwgb3IgYXNrIHRoZW0gdG8gcmVzdWJtaXQgd2hpY2ggaXMgZXh0cmEg
b3ZlcmhlYWQgdG8gdGhlDQo+IG1haW50YWluZXIuDQo+IA0KPiBJJ3ZlIGJlZW4gdGhpbmtpbmcg
YWJvdXQgdGhpcyBhbmQgaWYgSSBkbyBtYWtlIGl0IHRoZSBkZWZhdWx0LCBpdCB3aWxsDQo+IG1l
YW4gd2FybmluZ3Mgc2hvdyB1cCBvbiBvdGhlciBDSSBzeXN0ZW1zIGFuZCBsYXllciBtYWludGFp
bmVycyB3aWxsDQo+IGdldCBwYXRjaGVzIG9yIGNvbXBsYWludHMgYWJvdXQgdGhlIHdhcm5pbmdz
LiBJJ20gbm90IHN1cmUgSSByZWFsbHkNCj4gd2FudCB0byBnZXQgaW50byB0aGlzLg0KPiANCj4g
SSBkbyB0aGluayBpdCBpcyBzb21ldGhpbmcgdGhlIHByb2plY3Qgc2hvdWxkIGJlIGRvaW5nIGJ1
dCBJIGRvbid0IHdhbnQNCj4gdG8gYnVybiBvdXQgb3VyIGV4aXN0aW5nIG1haW50YWluZXJzLiBT
aW5jZSB0aGVyZSBpc24ndCB3aWRlIGNvbW11bml0eQ0KPiBidXkgaW4sIEkgc3VzcGVjdCBJIHNo
b3VsZCBqdXN0IGRyb3AgdGhlIGlkZWEuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoN
Ci8vUGV0ZXINCg0K

