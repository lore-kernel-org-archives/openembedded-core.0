Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9F0ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 12:26:05 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.3379.1662467151959927435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 05:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hothgm2+;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662467152;
  x=1694003152;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZNoc750K/Py2kBxRFoZMmhxLYk8sSYjZcKCxhsQu2ow=;
  b=hothgm2+cc+YvNaM4WmYaGLd1MXLjaNLbFVKOfCohPth3VWQHkM+b7nJ
   +a1tZXrqxSf9NLf6uXiZ6wfR6ydk+LQUSj26wADSZtm72CRLQLEehdoyB
   tcAfCUadvByn4lktOlEgN6n+JefRgWvlB8qRgY44o9DYlZUtcb3cw5wea
   xFDjmBv8T3WLIwfVhBGVfhpHV5+oi9AsQhyLSlEUb5l1ub60bUo8j0uVG
   u26kbeQMqFUFmUpU0hriUK8VGRZpOUUN/gviDbHsKVssA5wpQBAEly2CO
   +aP51Y/ZJJxlAa4nc8pA0Y6CCFJHSW9j/gEWV5GONtbqnL2nKAs9Z/XUG
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: John Ogness <john.ogness@linutronix.de>, OE-core
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
Thread-Topic: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
Thread-Index: AQHYwVRmx5KgU9a2CEexyd7HzhdFD63SEEgAgAA1plyAAA2N8A==
Date: Tue, 6 Sep 2022 12:25:48 +0000
Message-ID: <6632fb17a872496ea3b7a61a42f2ae06@axis.com>
References: <20220905182141.1091053-1-alex@linutronix.de>
 <87leqwztwp.fsf@jogness.linutronix.de>
 <171241B5563541EC.6347@lists.openembedded.org>
 <CANNYZj_sTxPuZtdVk68A8AGqwnT6=RNXmJ6u1LVuc6BQiHRvkw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_sTxPuZtdVk68A8AGqwnT6=RNXmJ6u1LVuc6BQiHRvkw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 12:26:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170350

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluDQo+IFNlbnQ6IGRlbiA2
IHNlcHRlbWJlciAyMDIyIDEzOjMyDQo+IFRvOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4NCj4gQ2M6IEpvaG4gT2duZXNzIDxqb2huLm9nbmVzc0BsaW51dHJvbml4
LmRlPjsgT0UtY29yZSA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+OyBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIG9lLXNldHVwLWJ1aWxkOiBhZGQgYSB0b29sIGZvcg0K
PiBkaXNjb3ZlcmluZyBjb25maWcgdGVtcGxhdGVzIGFuZCBzZXR0aW5nIHVwIGJ1aWxkcw0KPiAN
Cj4gT24gVHVlLCA2IFNlcHQgMjAyMiBhdCAxMzoyNCwgQWxleGFuZGVyIEthbmF2aW4gdmlhDQo+
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGFsZXgua2FuYXZpbj1nbWFpbC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gd3JvdGU6DQo+ID4gPiA0LiBMaXN0aW5nIGF2YWlsYWJsZSB0ZW1w
bGF0ZXMgaXMgYSBuaWNlIGZlYXR1cmUsIGJ1dCB0aGlzIGFsdGVybmF0ZQ0KPiA+ID4gbW9kZSBv
ZiBvcGVyYXRpb24gc2hvdWxkIGhhdmUgaXRzIG93biBhcmd1bWVudC4gU29tZXRoaW5nIGxpa2UN
Cj4gPiA+DQo+ID4gPiAgIC1sICAgICAgICAgICAgICAgIExpc3QgYXZhaWxhYmxlIGJ1aWxkIGNv
bmZpZ3VyYXRpb24gdGVtcGxhdGVzLg0KPiA+DQo+ID4gU2VlIGFib3ZlIHBsZWFzZS4NCj4gDQo+
IE9uIHNlY29uZCB0aG91Z2h0Li4uIHRoZSB0d28gbW9kZXMgb2Ygb3BlcmF0aW9uIHNob3VsZCBi
ZSBtb3JlIGNsZWFybHkNCj4gc2VwYXJhdGVkLCBwZXJoYXBzIHdpdGggZ2l0LXN0eWxlIHN1YmNv
bW1hbmRzLiBBcyBsb25nIGFzIHRoZSBkZWZhdWx0DQo+IHdpdGhvdXQgYXJndW1lbnRzIHJlbWFp
bnMgZGlzY292ZXJ5IDopDQo+IA0KPiBBbGV4DQoNCkdpdmVuIHRoYXQgdGhlIHRvb2wgaXMgY2Fs
bGVkIG9lLXNldHVwLWJ1aWxkIGFuZCBub3Qgb2UtZGlzY292ZXItYnVpbGQsIA0KbWFraW5nIHRo
ZSBkaXNjb3ZlcnkgbW9kZSB0aGUgZGVmYXVsdCBpcyBhY3R1YWxseSBhIGJpdCB3ZWlyZC4gDQpT
dWJjb21tYW5kcyBzb3VuZHMgZmluZSB0byBtZSB0aG91Z2guIE1heWJlIHlvdSBzaG91bGQgY2Fs
bCBpdCANCm9lLWJ1aWxkLWVudiBpbnN0ZWFkLCBzaW5jZSBpdCBoYXMgbXVsdGlwbGUgbW9kZXM/
DQoNCi8vUGV0ZXINCg0K

