Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3ECC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 14:18:22 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.9805.1644934689095510543
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 06:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=R5sgcf15;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644934689;
  x=1676470689;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=armjRQFW1V8tFPczG5P/bN7K8cEAz0/b14T9MHvZZog=;
  b=R5sgcf154K14qC3eLb75O6nB+p/slkOgOt9SBgjDsi9R+lDnx/SSfXtt
   JwxyEfjJgJypyputmojq5MAre65D0cQA/5qPRssOFbSEgnMILGvR7/lav
   yquaASucvQ0VVqRui4Vvy95MMsxZiKY/f9J4Pgq/S9dDMjeGC1USun4Xc
   I2/R+PZzBo2ej8vv08VKx/rz+mvildIL7yYWDRwDDNDJQk/6YEMAj4YKr
   bgmZNA9TLa+WEGRYKwbwgyYKGfr5CjuBhWrfLlp9wzrAyHV2uZKPSQdTT
   6p9lMa/nPo2CMkUkNE6QbkSNQk4Ltbi9MmtAzy9f6nANu+klfqVlfPioj
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Beeger <martin.beeger@online.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] cmake: read asm flags correctly from
 environment in toolchain file
Thread-Topic: [OE-core] [PATCH] cmake: read asm flags correctly from
 environment in toolchain file
Thread-Index: AQHYIbjydqUdEGvbmEunD2GAql0exqyTHvkAgAANugCAAXzqEA==
Date: Tue, 15 Feb 2022 14:18:06 +0000
Message-ID: <ae91d8b8f6184e90b5dddda21ec7a815@axis.com>
References: <20220214153807.21216-1-martin.beeger@online.de>
 <ba611eefa813d1edeccea304b96937943113270e.camel@linuxfoundation.org>
 <61e8c8ee-5ddc-b3b7-44c2-30eb7546e3d0@online.de>
In-Reply-To: <61e8c8ee-5ddc-b3b7-44c2-30eb7546e3d0@online.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 14:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161749

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1hcnRpbiBCZWVnZXINCj4gU2VudDogZGVuIDE0IGZl
YnJ1YXJpIDIwMjIgMTc6MzINCj4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGNtYWtlOiByZWFkIGFz
bSBmbGFncyBjb3JyZWN0bHkgZnJvbQ0KPiBlbnZpcm9ubWVudCBpbiB0b29sY2hhaW4gZmlsZQ0K
PiANCj4gDQo+ID4gSSdtIGEgbGl0dGxlIG1vcmUgcHV6emxlZCBvbiB0aGlzIG9uZSBzaW5jZSB3
aGlsc3Qgd2Ugc2V0IENGTEFHUyBhbmQNCj4gQ1hYRkxBR1MgaW4NCj4gPiBiaXRiYWtlLmNvbmYs
IHdlIGRvbid0IHNldCBBU01GTEFHUyBhbmQgaXQgd291bGRuJ3QgYmUgcHJlc2VudCBpbiBvdXIN
Cj4gPiBlbnZpcm9ubWVudC4NCj4gPg0KPiA+IFBlcmhhcHMgdGhpcyBzaG91bGQgYmUgJEVOVntD
RkxBR1N9IGluc3RlYWQgb2YgJHtDTUFLRV9DX0ZMQUdTfT8gVGhlcmUNCj4gYXJlIGZsYWdzDQo+
ID4gaW4gb3VyIENGTEFHUyB3aGljaCBsaWtlIG5lZWQgdG8gYmUgcGFzc2VkIHRvIHRoZSBhc3Nl
bWJsZXIgdG9vPw0KPiANCj4gSSBhbSBhIGJpdCB1bnN1cmUgbm93IGFib3V0IHRoaXMuDQo+IEFz
IGZhciBhcyBJIHVuZGVyc3RhbmQgdGhlIGVudmlyb25tZW50LXNldHVwIHdpbGwgbm90IHNldCBB
U01GTEFHUywgdGhhdA0KPiBpcyBjb3JyZWN0LiBGb3IgYWxsIG5vbi1jbWFrZSByZWNpcGVzLCB0
aGUgY29tcGlsZXIgd2lsbCBub3QgcGljayB1cA0KPiBDRkxBR1MgaW5zdGVhZC4gSXQgd2lsbCBz
aW1wbHkgc3RpbGwgdXNlIG5vIGV4dHJhIHBhcmFtZXRlcnMgZm9yIHRoZQ0KPiBpbmxpbmUgYXNz
ZW1ibHkuDQo+IEluIGNtYWtlIGl0IHdpbGwgdXNlIHRoZSBDRkxBR1MgZm9yIHRoZSBBU00gdG9v
LCB5aWVsZGluZyBpbmNvbnNpc3RlbnQNCj4gYmVoYXZpb3VyIG92ZXIgYnVpbGQgc3lzdGVtcy4g
SXMgdGhhdCByZWFsbHkgYSBnb29kIHRoaW5nPw0KPiANCj4gQWxzbyB0aGUgQ0ZMQUdTIGFyZSB1
c3VhbGx5ICItTzIgLWciLiBBdCBsZWFzdCB0aGUgLWcgcGFyYW1ldGVyIHdpbGwNCj4gaGF2ZSBs
aW1pdGVkIGVmZmVjdCBmb3IgdGhlIGFzc2VtYmx5LCBhbmQgb3B0aW1pemF0aW9ucyBmb3IgaW5s
aW5lDQo+IGFzc2VtYmx5IGFyZSBhbHNvIGV4dHJlbWVseSBsaW1pdGVkLg0KPiBTbyB0aGUgcHJh
Y3RpY2FsIGRpZmZlcmVuY2UgYmV0d2VlbiBib3RoIG1vZGVzIGFuZCB3aGV0aGVyIHRoZSBmbGFn
cw0KPiBwcm9wYWdhdGUgdGhyb3VnaCBpcyBtaW5pbWFsLCBpZiBhdCBhbGwgZXhpc3RlbnQuDQo+
IA0KPiBBbGwgY3JpdGljYWwgY29tcGlsZXIgcGFyYW1ldGVycyBsaWtlIHRoZSAtLXN5c3Jvb3Qg
YW5kIG90aGVycyBhcmUgbm90DQo+IHN0b3JlZCBpbiBDRkxBR1MsIGJ1dCBhcmUgaW5zdGVhZCBk
aXJlY3RseSBhcHBlbmRlZCB0byB0aGUgY29tcGlsZXINCj4gZXhlY3V0YWJsZSBwYXRoIGZvciBD
QywgQ1hYIGFuZCBzbyBvbi4gVGhlc2UgYXJlIGFsd2F5cyBhcHBsaWVkIGFuZA0KPiBjbWFrZSBk
b2VzIHVuZGVyc3RhbmQgdGhlc2UsIHBhcnNlcyB0aGVtIG91dCwgZm9yY2VzIHRoZW0gdG8gYWx3
YXlzIGJlDQo+IHRoZXJlIGV0Yy4NCj4gVGhpcyBjb2RlIGhhcyBub3RoaW5nIHRvIGRvIHdpdGgg
dGhhdCwgaXQgb25seSBpbXBhY3RzIHRoZSBvcHRpbWl6YXRpb24NCj4gYW5kIGRlYnVnZ2luZyBm
bGFncy4NCj4gDQo+IFRoaXMgcGF0Y2ggbWFrZXMgdGhpcyBiZWhhdmlvdXIgY29uc2lzdGVudCBi
ZXR3ZWVuIGNtYWtlIGFuZCBub24tY21ha2UNCj4gcmVjaXBlcyBpbiB0aGF0IGlzIG5ldmVyIGFw
cGxpZXMgQVNNIGZsYWdzLCBpbnN0ZWFkIG9mIGluY29uc2lzdGVudGx5DQo+IGFwcGx5aW5nIHRo
ZW0uDQoNCkZvciB0aGUgcmVjb3JkLCB0aGUgdmFyaWFibGUgbmFtZSB0aGF0LCBlLmcuLCBtYWtl
IGV4cGVjdHMgZm9yIGFzc2VtYmxlciANCmZsYWdzIGluIGl0cyBkZWZhdWx0IHJ1bGVzIGlzICJB
U0ZMQUdTIiwgbm90ICJBU01GTEFHUyIuDQoNCi8vUGV0ZXINCg0K

