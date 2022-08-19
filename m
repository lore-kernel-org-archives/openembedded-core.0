Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3641C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 09:57:29 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1230.1660903046900439216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aS9kDQyF;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1660903048;
  x=1692439048;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rPh+hsPC1ClUXw4CxOSDMD+6QJrOcBi+/0LTFPWWZG0=;
  b=aS9kDQyFw82Iz9VYE1vAefj6zut8r4irtNwN5uITDfeGwrGoCjlBYUoL
   1yzvYtajcr6tVBUcdmZk+SsiuAknbu678/JBEmyco592Smm/0KROXf/ML
   cgfVm4rbkSupdn6y/JAXqqNOXnznNB4sAkX2ZlWcWXxy373avCOkK0W9h
   OuOXA7JECDhM1ito+DPTsF7/GLj+5mWZl5hJN1chwYbCz3U5IxGRejhTi
   OBP1TCs03do3iCQSthlmfgSAnsenKtGG/MnV/beY0up02nzhCPBHaZ++i
   EVgRNMW3sQT3lZkVRFlIXWFjqdEi7fTyeJn5ZUlk9c2JvkuaXOJZUPqtE
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Jan Luebbe <jlu@pengutronix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] openssh: add support for config snippet
 includes to ssh and sshd
Thread-Topic: [OE-core][PATCH 2/2] openssh: add support for config snippet
 includes to ssh and sshd
Thread-Index: AQHYsvS7ieZC72YE+0qK29R/VVDedq20yWaAgAEypoA=
Date: Fri, 19 Aug 2022 09:57:24 +0000
Message-ID: <fbcb8ef91eb74bcc883dc6e5d4924251@axis.com>
References: <20220818111703.1858-1-jlu@pengutronix.de>
 <20220818111703.1858-2-jlu@pengutronix.de>
 <CAMKF1spo5nbjvHpxsyff3_dv7Da7a0YP-vkSLXg16D1jHmS78w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spo5nbjvHpxsyff3_dv7Da7a0YP-vkSLXg16D1jHmS78w@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 09:57:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169621

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogZGVuIDE4IGF1Z3VzdGkgMjAy
MiAxOTozMg0KPiBUbzogSmFuIEx1ZWJiZSA8amx1QHBlbmd1dHJvbml4LmRlPg0KPiBDYzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdW1BBVENIIDIvMl0gb3BlbnNzaDogYWRkIHN1cHBvcnQgZm9yIGNvbmZpZyBzbmlwcGV0
IGluY2x1ZGVzIHRvIHNzaCBhbmQgc3NoZA0KPiANCj4gT24gVGh1LCBBdWcgMTgsIDIwMjIgYXQg
NDoyMSBBTSBKYW4gTHVlYmJlIDxqbHVAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOg0KPiA+DQo+ID4g
VGhpcyBtYWtlcyBpdCBzaW1wbGVyIHRvIHNldCBzcGVjaWZpYyBzc2gvc3NoZCBjb25maWcgb3B0
aW9ucyBieSBhZGRpbmcNCj4gPiBzbmlwcGV0IGZpbGVzIHRvIC9ldGMvc3NoL3NzaF9jb25maWcu
ZC8gb3IgL2V0Yy9zc2gvc3NoZF9jb25maWcuZC8NCj4gPiBpbnN0ZWFkIG9mIG1vZGlmeWluZyBh
IGNvcHkgb2YgdGhlIGZ1bGwgY29uZmlndXJhdGlvbiBmaWxlLiBBcyBuZXcNCj4gPiBzbmlwcGV0
cyBjYW4gYmUgYWRkZWQgZnJvbSBzZXBhcmF0ZSByZWNpcGVzLCB0YXJnZXRlZCBjaGFuZ2VzIGNh
biBiZQ0KPiA+IGRvbmUgaW4gbXVsdGlwbGUgbGF5ZXJzLg0KPiA+DQo+ID4gVGhlc2Ugc3BlY2lm
aWMgZGlyZWN0b3JpZXMgYXJlIGFsc28gdXNlZCBpbiBEZWJpYW4ncyBkZWZhdWx0DQo+ID4gY29u
ZmlndXJhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBMdWViYmUgPGpsdUBwZW5n
dXRyb25peC5kZT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NoL29wZW5zc2gvc3NoX2NvbmZpZyAgfCAyICsrDQo+ID4gIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaGRfY29uZmlnIHwgMiArKw0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaF9jb25maWcgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC9zc2hfY29uZmlnDQo+ID4gaW5kZXggMDVlZWNi
NDY1ZmYwLi5jYTcwZjM3Mzc1OTYgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NoL29wZW5zc2gvc3NoX2NvbmZpZw0KPiA+ICsrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoL3NzaF9jb25maWcNCj4gPiBAQCAtMTcsNiAr
MTcsOCBAQA0KPiA+ICAjIGxpc3Qgb2YgYXZhaWxhYmxlIG9wdGlvbnMsIHRoZWlyIG1lYW5pbmdz
IGFuZCBkZWZhdWx0cywgcGxlYXNlIHNlZSB0aGUNCj4gPiAgIyBzc2hfY29uZmlnKDUpIG1hbiBw
YWdlLg0KPiA+DQo+ID4gK0luY2x1ZGUgL2V0Yy9zc2gvc3NoX2NvbmZpZy5kLyouY29uZg0KPiA+
ICsNCj4gR2VuZXJhbGx5IGxvb2tzIG9rLg0KPiBJIHdvbmRlciBpZiB0aGlzIGluY3JlYXNlcyBz
ZWN1cml0eSBjb25jZXJucyB3aXRoIHN1Y2ggYmxhbmtldCBpbmNsdWRlcy4NCg0KSWYgeW91IGhh
dmUgdGhlIHBlcm1pc3Npb25zIHRvIGFkZCBhIGZpbGUgdG8gL2V0Yy9zc2gvc3NoX2NvbmZpZy5k
IG9yIA0KL2V0Yy9zc2gvc3NoZF9jb25maWcuZCwgeW91IGNvdWxkIGp1c3QgYXMgd2VsbCBtb2Rp
ZnkgL2V0Yy9zc2gvc3NoX2NvbmZpZyANCm9yIC9ldGMvc3NoL3NzaGRfY29uZmlnIGRpcmVjdGx5
Lg0KDQo+ID4gIEhvc3QgKg0KPiA+ICAgIEZvcndhcmRBZ2VudCB5ZXMNCj4gPiAgICBGb3J3YXJk
WDExIHllcw0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5z
c2gvb3BlbnNzaC9zc2hkX2NvbmZpZyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNz
aC9vcGVuc3NoL3NzaGRfY29uZmlnDQo+ID4gaW5kZXggOWM1MzgwNTg5MDEzLi5lOWVhZjkzMTU3
NzUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29w
ZW5zc2gvc3NoZF9jb25maWcNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29w
ZW5zc2gvb3BlbnNzaC9zc2hkX2NvbmZpZw0KPiA+IEBAIC0xMCw2ICsxMCw4IEBADQo+ID4gICMg
cG9zc2libGUsIGJ1dCBsZWF2ZSB0aGVtIGNvbW1lbnRlZC4gIFVuY29tbWVudGVkIG9wdGlvbnMg
b3ZlcnJpZGUgdGhlDQo+ID4gICMgZGVmYXVsdCB2YWx1ZS4NCj4gPg0KPiA+ICtJbmNsdWRlIC9l
dGMvc3NoL3NzaGRfY29uZmlnLmQvKi5jb25mDQo+ID4gKw0KPiA+ICAjUG9ydCAyMg0KPiA+ICAj
QWRkcmVzc0ZhbWlseSBhbnkNCj4gPiAgI0xpc3RlbkFkZHJlc3MgMC4wLjAuMA0KPiA+IC0tDQo+
ID4gMi4yMC4xDQoNCi8vUGV0ZXINCg0K

