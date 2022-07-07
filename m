Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36560C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 14:38:45 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6354.1657204714425306588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 07:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gntO/61o;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1657204715;
  x=1688740715;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SuyjPPSAjlcen3UWqF/zj8/5VZY/YV7TxZuKbAHCXt8=;
  b=gntO/61oaH2GSMlnmSh2SjLmxTzSVv5KkmK+CEQTBLLOCb/rRC+aqp/v
   0wivUs67fW3B/jhOuX85ax8KgVwfu0Yx9x0sIkiPrLr+MVqwFu+bu8rkt
   7Fxy45qD292IEYFv1307RWWL6N7L+dMFlg2E1QeQdaGeVDNAklYoTiRxa
   GcZKNbRumOdwNdMTWFm7OofnB9A6NoGlBYPdvOumg1qndC8EIzie8813X
   +ARsLEesB8guSkhvPagb8jX2ErpdPEJoy77gk1DSocWH5wd1pHSySkNSM
   LUjj8bT0UlsXImtrPxqIlHe/9XrVf/B49Kzd2iLsswFaVD4uC0kuWEVL5
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Topic: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Index: AQHYkWWsuIJ0GxnyT0ak+urHDmj9Y61y5WKA///jYACAACJjAP//4yuAgAAmQ6A=
Date: Thu, 7 Jul 2022 14:38:31 +0000
Message-ID: <9ae77d11ee2848b4992c5c104928664b@axis.com>
References: <20220706182329.3085564-1-alex@linutronix.de>
 <d04fa3ca7398489a99f8356b17f1174a@axis.com>
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
 <4573c371d989428899b884116c47fff3@axis.com>
 <CANNYZj8pEFcM1g_qOVbP1HDUE05yjQwyxsJpLM_em3NRPnM6kw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8pEFcM1g_qOVbP1HDUE05yjQwyxsJpLM_em3NRPnM6kw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 14:38:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167783

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluDQo+IFNlbnQ6IGRlbiA3
IGp1bGkgMjAyMiAxNTo1Ng0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnOyBBbGV4YW5kZXIgS2FuYXZpbg0KPiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6
IGNvcHkNCj4gc2l0ZS5jb25mLnNhbXBsZSBvdXQgb2YgdGVtcGxhdGUgZGlyZWN0b3JpZXMgKGlm
IGl0IGV4aXN0cykNCj4gDQo+IE9uIFRodSwgNyBKdWwgMjAyMiBhdCAxNTo0NSwgUGV0ZXIgS2pl
bGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiANCj4g
PiA+IFNldHRpbmcgdXAgYSBidWlsZCBkaXJlY3RvcnkgZnJvbSBzdGFuZGFyZCBwb2t5DQo+ID4g
PiBvciBvZS1jb3JlIHRlbXBsYXRlcyAod2hpY2ggSSBwcmVzdW1lIGlzIGhvdyB5b3Ugc2V0IHVw
IGJ1aWxkcykgZG9lcw0KPiA+ID4gbm90IGhvbGQgYSBwcm9taXNlIHRoYXQgd2hhdCBpcyBiZWlu
ZyBjb3BpZWQgd2lsbCBub3QgY2hhbmdlIGluDQo+ID4gPiBwb3RlbnRpYWxseSBicmVha2luZyB3
YXlzLg0KPiA+DQo+ID4gV2hpbGUgSSBtYXkgYmUgYWJsZSB0byBmaXggdGhlIGVudmlyb25tZW50
IGZvciBidWlsZHMgdGhhdCB1c2Ugc29tZSBvZg0KPiA+IG91ciBsYXllcnMsIHNldHRpbmcgdXAg
cHVyZSBwb2t5IGJ1aWxkcyB3aWxsIG5vIGxvbmdlciB3b3JrIHdpdGhvdXQNCj4gPiBtYW51YWwg
aW50ZXJ2ZW50aW9uLg0KPiANCj4gV2FpdC4gSG93IGFyZSB5b3Ugc2V0dGluZyB1cCBwdXJlIHBv
a3kgYnVpbGRzIHJpZ2h0IG5vdywgc28gdGhhdCB5b3VyDQo+IG1hZ2ljIHNpdGUuY29uZiBpcyBj
b3JyZWN0bHkgaW5zZXJ0ZWQgaW50byBidWlsZHM/DQo+IA0KPiBBbGV4DQoNCkFjdHVhbGx5LCB5
b3UgY2FuIGZvcmdldCB3aGF0IEkgc2FpZC4gSSBoYWQgYSBsb29rIGF0IG91ciB3cmFwcGVyIGZv
ciANCm9lLWluaXQtYnVpbGQtZW52LCB3aGljaCBpcyByZXNwb25zaWJsZSBmb3IgY3JlYXRpbmcg
b3VyIHRlbXBsYXRlY29uZiANCmRpcmVjdG9yeSwgYW5kIGl0IHdpbGwgb2YgY291cnNlIG5vdCBi
ZSBhZmZlY3RlZCBieSB5b3VyIGNoYW5nZS4gKEl0IHdhcyANCnNpeCB5ZWFycyBzaW5jZSBJIHdy
b3RlIHRoYXQgY29kZSwgc28gbXkgbWVtb3J5IHdhcyBvYnZpb3VzbHkgYSBiaXQgDQpmdXp6eS4p
DQoNCkFuZCBpbiBjYXNlIHlvdSB3b25kZXIgd2hhdCB0aGF0IHdyYXBwZXIgYWN0dWFsbHkgZG9l
cywgaXQgY3JlYXRlcyB0aGUgDQpiYmxheWVycy5jb25mLnNhbXBsZSBmaWxlIGJhc2VkIG9uIGFs
bCBsYXllcnMgdGhhdCBhcmUgZm91bmQgaW4gdGhlIHRvcCANCmRpcmVjdG9yeS4gSXQgYWxzbyBj
cmVhdGVzIGEgbG9jYWwuY29uZi5zYW1wbGUgZmlsZSBieSBjb21iaW5pbmcgZnJhZ21lbnQgDQpm
aWxlcyBpbiB0aGUgbGF5ZXJzIChpLmUuLCBsb2NhbC5jb25mLnNhbXBsZS5YWCB3aGVyZSBYWCBp
cyBhIG51bWJlciANCmJldHdlZW4gMDAgYW5kIDk5KS4gVGhlIGxvY2FsLmNvbmYuc2FtcGxlIGZy
b20gbWV0YS1wb2t5IGlzIGNvbnNpZGVyZWQgDQp0byBoYXZlIFhYID09IDUwLiBUaGUgcmVhc29u
IGZvciB0aGlzIGlzIHRoYXQgd2UgcXVpY2tseSByZWFsaXplZCB0aGF0IA0KdGhlIHN0YXRpYyB0
ZW1wbGF0ZWNvbmYgZGlyZWN0b3J5IHNldHVwIHdhcyB1bnVzYWJsZSBmb3IgdXMgd2hlbiB3ZSAN
CndhbnQgdG8gYmUgYWJsZSB0byB1c2UgbGF5ZXJzIGluIGRpZmZlcmVudCBjb21iaW5hdGlvbnMu
DQoNCi8vUGV0ZXINCg0K

