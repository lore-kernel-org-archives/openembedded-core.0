Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7F3C04A68
	for <webhook@archiver.kernel.org>; Sat, 30 Jul 2022 09:55:13 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.1662.1659174903062497981
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jul 2022 02:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=NeZJHOfK;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1659174904;
  x=1690710904;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=f7wqyh969PXEVuc1qBxPBffzDOKQfDQlvdQh81zhQv4=;
  b=NeZJHOfKzgyJ4x7noc8SsougGGIuUikR2IG/asidFoMqhcSRJV1RzHXP
   l+cbj4Yi7nPvfiefHBUpYUySacyeqrDva4/LCvY7OXMi6T76arjO+1DtF
   JWC5oa4k0iCO1psJkE9VSvOzX1Z5tz67BvO7kXtdoH1ZVVJ0JCq4ugA21
   fTETvEsnA6DRE6L3YB6tEdgPvefl7uHEEBftuTsZ8rlbbg3qUOYVsH5iA
   JRfINoPMepOUi0U/R2FrpX2oNdlN0SBA+SQpJStUc1thdxwtlDxyOHeBX
   pj2oetIzwOviI8zfaI3/vt8gn2ejfRc3rLJeftNg5boml3XySn2KimkB0
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
Thread-Topic: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
Thread-Index: AQHYo1UKfJ7Ym5nsbk6mb2lrYFGOz62VwDsQ///mbYCAAQH2cA==
Date: Sat, 30 Jul 2022 09:54:59 +0000
Message-ID: <33ed623c9f5147fea346548754ec498c@axis.com>
References: <20220729141049.835733-1-alex@linutronix.de>
 <57a6142f5c2f444288e16632839dc647@axis.com>
 <CANNYZj9xE8EUR385HAy5BPcsiL8G_LPwaY9Q3GAXBp7sv45t4g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9xE8EUR385HAy5BPcsiL8G_LPwaY9Q3GAXBp7sv45t4g@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 30 Jul 2022 09:55:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168680

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI5IGp1bGkgMjAyMiAyMjoxMg0K
PiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+
IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBBbGV4YW5kZXIg
S2FuYXZpbg0KPiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCAxLzZdIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6IG1ha2UgaXQNCj4ga25vd24g
d2hlcmUgY29uZmlndXJhdGlvbnMgY29tZSBmcm9tDQo+IA0KPiBPbiBGcmksIDI5IEp1bCAyMDIy
IGF0IDIxOjU1LCBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4gd3JvdGU6DQo+ID4gUGxlYXNlIGNvbnRpbnVlIHRvIGxpbWl0IHRoZSB0ZXh0IHRvIHdpdGhp
biA4MCBjaGFyYWN0ZXJzIChhcyBpdCB3YXMpOg0KPiA+DQo+ID4gWW91IG1heSB3aXNoIHRvIGVk
aXQgaXQgdG8sIGZvciBleGFtcGxlLCBzZWxlY3QgYSBkaWZmZXJlbnQgTUFDSElORSAodGFyZ2V0
DQo+ID4gaGFyZHdhcmUpLiBTZWUgY29uZi9sb2NhbC5jb25mIGZvciBtb3JlIGluZm9ybWF0aW9u
IGFzIGNvbW1vbiBjb25maWd1cmF0aW9uDQo+ID4gb3B0aW9ucyBhcmUgY29tbWVudGVkLg0KPiA+
DQo+ID4gb3I6DQo+ID4NCj4gPiBZb3UgbWF5IHdpc2ggdG8gZWRpdCBpdCB0bywgZS5nLiwgc2Vs
ZWN0IGEgZGlmZmVyZW50IE1BQ0hJTkUgKHRhcmdldCBoYXJkd2FyZSkuDQo+ID4gU2VlIGNvbmYv
bG9jYWwuY29uZiBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhcyBjb21tb24gY29uZmlndXJhdGlvbiBv
cHRpb25zIGFyZQ0KPiA+IGNvbW1lbnRlZC4NCj4gDQo+IEkgY2FuIGRvIHRoYXQsIGJ1dCBJJ20g
Y3VyaW91cyBhYm91dCB0aGlzIDgwIGNoYXJhY3RlciBsaW1pdC4gV2hvDQo+IGNhcmVzLCBpbiAy
MDIyLCBhbmQgd2h5Pw0KPiANCj4gQWxleA0KDQpXZWxsLCBJIGNhcmUgc2luY2UgYWxsIG15IHdp
bmRvd3MgaGFwcGVuIHRvIGJlIDgwIGNoYXJhY3RlcnMgd2lkZSAoYW5kIEkgaGF2ZSANCmEgbG90
IG9mIHRoZW0gb24gbXkgNEsgbW9uaXRvcikuIEFuZCBzaW5jZSBJIGNhcmUgYW5kIG1vc3QgZG9u
J3QsIGtlZXBpbmcgdGhlIA0KODAgY2hhcmFjdGVyIHdpZHRoIHNob3VsZCBob3BlZnVsbHkgbm90
IGJlIHRvbyBtdWNoIG9mIGEgcHJvYmxlbS4gOykNCg0KLy9QZXRlcg0KDQoNCg==

