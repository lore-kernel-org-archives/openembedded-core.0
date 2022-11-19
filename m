Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75592C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 01:57:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.11549.1668823045802777336
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 17:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YDCx3m2/;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668823046;
  x=1700359046;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YKOc0ECiaHPZsCgwcchf6TodGQIY1WA5OG0p/3OfzwE=;
  b=YDCx3m2/UJ3asdINfgl+kNJFFy+Gehbv/2LOdJgQty8VDeODXVZc0nUg
   F9PF14PoIsW3WxV6+wv4F2pfblaHteCYsfG/1ZnWaaP4RsXNtEh0PzMTv
   JHe5xKP1MYyONR0WA1Wx1xrp1GTN/SYR9J3lFM4oG7LdDj3l7zC0aZrta
   nfthImB7VIgpPTP4S5dmBQVCCXCFwTTtHR0UCHdYVhmLPcTrC4b1/A22f
   CBS7s7GK9S+OGa7kZDIL1Kj8HSG2t2afXWabDx1EItkwyNodmE+lX+jup
   krsf4H5JPGP1np1o/uoRPoKjL91LQyCck8Vw/7LnVcP2YtIUMszBBXUEy
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Anton Antonov
	<Anton.Antonov@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Topic: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Index: AQHY+1wWSmkxuptgUEuPavuSE3ZDSq5EuDAAgAAUFoCAAAPTgIAAq1Qw
Date: Sat, 19 Nov 2022 01:57:23 +0000
Message-ID: <4c2db9a4441a470fb1555b68b6bffb62@axis.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
	 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
	 <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
 <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
In-Reply-To: <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 01:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173510

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDE4IG5vdmVt
YmVyIDIwMjIgMTc6MzYNCj4gVG86IEFudG9uIEFudG9ub3YgPEFudG9uLkFudG9ub3ZAYXJtLmNv
bT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbbGFuZ2RhbGVdW21hc3Rlcl1bUEFUQ0hdIHJ1c3Q6IERvIG5vdCB1c2Ug
ZGVmYXVsdCBjb21waWxlciBmbGFncyBkZWZpbmVkIGluIENDIGNyYXRlDQo+IA0KPiBPbiBGcmks
IDIwMjItMTEtMTggYXQgMTY6MjEgKzAwMDAsIEFudG9uIEFudG9ub3Ygd3JvdGU6DQo+ID4gwqAg
SeKAmXZlIHRlc3RlZCB5b3VyIGFwcHJvYWNoLiBJdCBkb2VzbuKAmXQgd29yayBmb3Igd2hhdGV2
ZXIgcmVhc29uLg0KPiA+IENSQVRFX0NDX05PX0RFRkFVTFRTIGlzIGVtcHR5IGV4cG9ydGVkIGZv
ciBuYXRpdmUgcmVjaXBlczoNCj4gPg0KPiA+ICQgTUFDSElORT1xZW11YXJtIGJpdGJha2UgcnVz
dC1uYXRpdmUgLWUgfGdyZXAgQ1JBVEVfQ0NfTk9fREVGQVVMVFMNCj4gPiAjICRDUkFURV9DQ19O
T19ERUZBVUxUUyBbMyBvcGVyYXRpb25zXQ0KPiA+ICPCoMKgwqDCoCBbZXhwb3J0XSAiJHsnMScg
aWYgZC5nZXRWYXIoJ0NSQVRFX0NDX05PX0RFRkFVTFRTJykgPT0gJ3RydWUnIGVsc2UgJzAnfSIN
Cj4gPiBleHBvcnQgQ1JBVEVfQ0NfTk9fREVGQVVMVFM9IiINCj4gPiAjICRDUkFURV9DQ19OT19E
RUZBVUxUUzpjbGFzcy1uYXRpdmUNCj4gPiBDUkFURV9DQ19OT19ERUZBVUxUUzpjbGFzcy1uYXRp
dmU9IiINCj4gPg0KPiA+DQo+ID4gwqAgSSBhbHNvIHRyaWVkOg0KPiA+IENSQVRFX0NDX05PX0RF
RkFVTFRTW2V4cG9ydF0gPSAiJHtAb2UudXRpbHMuY29uZGl0aW9uYWwoJ0NSQVRFX0NDX05PX0RF
RkFVTFRTJywgJycsICcwJywgJzEnLCBkKX0iDQo+ID4gd2l0aCB0aGUgc2FtZSByZXN1bHQg4oCT
IGVtcHR5IGV4cG9ydC4NCj4gDQo+IEkgdGhpbmsgaXQgbWlnaHQgbmVlZCB0byBiZSAwIG9yICIi
IGluc3RlYWQgb2YgJzAnLiBJdCB3b3VsZCBiZSBuaWNlIGlmDQo+IHdlIGNvdWxkIG1ha2UgRmFs
c2Ugd29yayB0b28gYnV0IEkgd29ycnkgdGhhdCBtaWdodCBub3QuDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiBSaWNoYXJkDQoNCk5vbmUgb2YgdGhpcyB3aWxsIHdvcmsgdW5sZXNzIHlvdSBjaGFuZ2Ug
dGhlIGNvZGUgaW4gYml0YmFrZS9saWIvYmIvZGF0YS5weSANCnRvIHVzZSBkLmdldFZhckZsYWco
dmFyLCAiZXhwb3J0IikgaW5zdGVhZCBvZiBkLmdldFZhckZsYWcodmFyLCAiZXhwb3J0IiwgRmFs
c2UpLg0KSG93ZXZlciwgSSBhc3N1bWUgdGhhdCBpcyBub3Qgd2FudGVkIGdpdmVuIHRoYXQgc3Vw
cG9ydCBmb3IgZm9vW3VuZXhwb3J0XSA9ICIxIiANCndhcyBpbnRyb2R1Y2VkIHRvIGNvdW50ZXJh
Y3QgYSBmb29bZXhwb3J0XSA9ICIxIi4NCg0KLy9QZXRlcg0KDQo=

