Return-Path: <chuck.wolber@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCC8C678D8
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 01:55:11 +0000 (UTC)
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net [130.76.20.194])
 by mx.groups.io with SMTP id smtpd.web11.186783.1673920501858297461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 17:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=e4Ye1OQH;
 spf=pass (domain: boeing.com, ip: 130.76.20.194, mailfrom: chuck.wolber@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 30H1t0dk063425;
	Mon, 16 Jan 2023 17:55:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1673920500;
	bh=TFTdg+IFCSn/VwqvCj46C5rzpLUuvFAWGcUfurplsH4=;
	h=From:To:Subject:Date:From;
	b=e4Ye1OQHLwk1YX4jV8tPbNxc4ipRx6JF4+XSygid/igN7BQz46xhNhZb2dmQbeMNm
	 qLx/mQFPoAhW3iLn+Xih0zjzp21HJnFROZ1kX2oiOeOVR4/HoMY7LXRsTjE2HvC3ow
	 Us1vvIeaw0Jj3gD/TFmFv4VGV4BksUcPrbmtLHq4T1vMjBk9L0zy6ijKK+yW9nPl23
	 7Mq6gPX2I4buWTGW5eEq1wvIkdNLCqNH111hdJlLbPRRi91InYKZKgYBVi1rpO00Kn
	 fVJhO4LM3/lGuVTbsBnvlyhM6Lh8qO2CTwowRxhC0ta4zRT14rh2J0nxD8E8rx91dJ
	 8fMfD5a52xWBg==
Received: from XCH16-03-02.nos.boeing.com (xch16-03-02.nos.boeing.com [137.137.111.11])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 30H1spEJ063378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:54:52 -0800
Received: from XCH16-03-04.nos.boeing.com (137.137.111.13) by
 XCH16-03-02.nos.boeing.com (137.137.111.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 16 Jan 2023 17:54:50 -0800
Received: from XCH16-03-04.nos.boeing.com ([fe80::7809:c78b:36c8:935e]) by
 XCH16-03-04.nos.boeing.com ([fe80::7809:c78b:36c8:935e%12]) with mapi id
 15.01.2507.016; Mon, 16 Jan 2023 17:54:50 -0800
From: "Wolber (US), Chuck" <chuck.wolber@boeing.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] Make oe-setup-layers efficiently idempotent
Thread-Topic: [OE-core] [PATCH] Make oe-setup-layers efficiently idempotent
Thread-Index: AQHZKhavLvDblaUfBU+/zkZWt+rmBA==
Date: Tue, 17 Jan 2023 01:54:50 +0000
Message-ID: <4AD2AAE5-124F-482F-9C52-30F967E5E5C5@boeing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23010700
x-originating-ip: [137.137.12.6]
x-tm-snts-smtp: 6CA000E7E1DCB30D4A0AD4349D38C6BBA8B2F02A665086BC0979A441D2D817C42000:8
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0DF3D452D904640A0F354901A37C6BA@boeing.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 01:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176017

T24gMS8xNi8yMywgOTowMCBBTSwgIlJpY2hhcmQgUHVyZGllIiA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZyA8bWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+PiB3cm90ZToNCg0KJTwgU05JUCAlPCANCg0KPiBNYWtpbmcgdGhlIHNjcmlwdCByZXJ1biBz
dWNjZXNzZnVsbHkgc2VlbXMgc2Vuc2libGUgc28gdGhlIGNoYW5nZQ0KPiBpdHNlbGYgaXMgcmVh
c29uYWJsZS4gSSB3YXMgYSBsaXR0bGUgY29uZnVzZWQgYnkgc29tZSBvZiB0aGUgY29tbWVudHMN
Cj4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFzIG9lLXNldHVwLWxheWVycyBkb2Vzbid0IGFwcGx5
IHBhdGNoZXMgYXMgZmFyDQo+IGFzIEkga25vdy4gSXMgdGhhdCBzb21ldGhpbmcgeW91J3JlIHRo
aW5raW5nIG9mIGFkZGluZz8NCg0KSSBhbSBpbmRlZWQuIEJ1dCBJIHJlYWxpemUgdGhhdCBpdCBw
cm9iYWJseSBjb25mdXNlZCB0aGluZ3MgdG9vIG11Y2ggd2l0aCB0aGF0DQpjb21tZW50LCBzbyBJ
IHJlbW92ZWQgaXQuIFRoZSBwYXRjaCBhcHBsaWNhdGlvbiBmZWF0dXJlIEkgaGF2ZSBpbiBtaW5k
IG5lZWRzDQphIGxvdCBtb3JlIHdvcmssIGFuZCBwcm9iYWJseSBzb21lIGRpc2N1c3Npb24uIFdl
IHVzZSBpdCBpbnRlcm5hbGx5LCBidXQgZm9yDQpicm9hZGVyIHVzZSBpdCBjYW5ub3QgbWFrZSBj
ZXJ0YWluIGFzc3VtcHRpb25zLg0KDQoNCj4gT25lIHNtYWxsIGNvc21ldGljIGlzc3VlIGlzIHRo
YXQgdGhlIGFyZWEgb2YgY29kZSB0aGUgcGF0Y2ggY2hhbmdlcw0KPiBzaG91bGQgYmUgYXMgYSBw
cmVmaXggaW4gdGhlIHNob3J0bG9nLCBlLmcuICJzY3JpcHRzL29lLXNldHVwLWxheWVyczoiDQo+
IGluIHRoaXMgY2FzZS4gSXQgbWVhbnMgcGVvcGxlIGNhbiB1bmRlcnN0YW5kIHRoZSByb3VnaCBz
Y29wZSBvZiB0aGUNCj4gcGF0Y2ggZnJvbSBhIGdsYW5jZS4NCg0KU29ycnkgYWJvdXQgdGhhdC4g
Rml4ZWQgaW4gdjIuDQoNCg0KPiBXaGlsc3Qgbm90IGVzc2VudGlhbCwgSSBkbyBsaWtlIEFsZXgn
cyBzdWdnZXN0aW9uIGFib3V0IGltcHJvdmluZyB0aGUNCj4gdGVzdHMgdG9vLCBub3Qgc3VyZSBp
ZiB0aGF0IGlzIHBvc3NpYmxlLg0KDQpBZ3JlZWQuIEkgdG9vayBhIGxvb2sgYW5kIEkgZG8gbm90
IHNlZSBtdWNoIHRoYXQgSSB3b3VsZCBiZSBhYmxlIHRvIGNoYW5nZS4gTXkNCmNoYW5nZXMgZG8g
bm90IGFsdGVyIGFueSBleGlzdGluZyBiZWhhdmlvciwgbm9yIGRvIHRoZXkgcmVzb2x2ZSBhbnkg
YnVncy4gVGhleQ0Kc2ltcGx5IGxpbWl0IHRoZSBzY29wZSBvZiBjaGFuZ2UgaW4gc3Vic2VxdWVu
dCBydW5zIHRvIG9ubHkgd2hhdCBpcyBuZWVkZWQuDQoNCg0KPiBJIGFsc28gbm90aWNlZCB0aGUg
cGF0Y2ggaXMgYWdhaW5zdCBtYXN0ZXItbmV4dCwgd2hpY2ggdXN1YWxseSB3b3VsZCBiZQ0KPiBm
aW5lIGV4Y2VwdCBJIGRpZCBkcm9wIGEgcGF0Y2ggdGhlcmUgd2hpY2ggbWVhbnMgdGhpcyBvbmUg
bm8gbG9uZ2VyDQo+IGFwcGxpZXMuIElmIHlvdSBjb3VsZCByZWJhc2UgaXQgZm9yIHRoZSB2MiB3
aXRoIHRoZSBzaG9ydGxvZyBmaXggdGhhdA0KPiB3b3VsZCBiZSBtdWNoIGFwcHJlY2lhdGVkLg0K
DQpGaXhlZCBpbiB2Mi4gU2hvdWxkIGFycml2ZSBzaG9ydGx5Lg0KDQpUaGFuayB5b3UsDQoNCi4u
Q2g6Vy4uDQoNCg==

