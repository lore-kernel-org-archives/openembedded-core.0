Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF34CC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 07:19:47 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.21231.1661411979952768623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LaR8wr0D;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661411980;
  x=1692947980;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Knt5aWwdtiv/RvWc1luEaSOgjOaQUAuRa3fxVm6M5A0=;
  b=LaR8wr0DblIZ4hUtm7vWbZHbw93ZqvJbMbE0VKJta45ZzOSSNOwvX7xE
   Ocru7I+9BC0mP16F78DXWvcdBDtssxNxCXxZxOaNIPqmrfyfo07GzV+IN
   Aj97X8jPLWxOk18M/gH9uHCXlFUBswGsp5gTpCgmSfw6RRPamojzemkA/
   sNvJQqXP0OKyHgjI7/LfpHjciMeZyVP5B4dgauu5bQLhjJIy0NH2psQo7
   yUxsWmuvy/kK5x4EWzfuntGqbpGzh/UCr1zSl0QiTh/engwD5PsL37Pwq
   jlNk2Xtl7dnRVFp8crXyjWAY6TGZ9Sh6tr6LLffzLw7ERJrSq7YDdtO1f
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Thread-Topic: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check
 that TEMPLATECONF is valid
Thread-Index: AQHYt7cRSHWGrcP8wUm8EpgvpR7Rga2+D7iA///lUQCAACL9EP//6V2AgAEzI9A=
Date: Thu, 25 Aug 2022 07:19:37 +0000
Message-ID: <57b46d76a2174cc487c8a210c3539b03@axis.com>
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
 <aa755beb07f143619c3c7fec974ce2a3@axis.com>
 <CANNYZj-FYOOBqPBs3sZuXQqse1nrtRZXeKrKjMg=YZgt2neSKw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-FYOOBqPBs3sZuXQqse1nrtRZXeKrKjMg=YZgt2neSKw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 07:19:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169832

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDI0IGF1Z3VzdGkgMjAyMiAxNjo1
Mw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBBbGV4YW5k
ZXIgS2FuYXZpbg0KPiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCAyLzJdIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6IGFkZCBhIGNoZWNrDQo+
IHRoYXQgVEVNUExBVEVDT05GIGlzIHZhbGlkDQo+IA0KPiBPbiBXZWQsIDI0IEF1ZyAyMDIyIGF0
IDE2OjQzLCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4gd3JvdGU6DQo+ID4gV2UgY3JlYXRlIHRoZSBzYW1wbGUgZmlsZXMgaW4gYSBzbWFsbCB3cmFw
cGVyIGZvciBvZS1pbml0LWJ1aWxkLWVudg0KPiA+IHNvIHRoYXQgdG8gdGhlIHVzZXJzLCBldmVy
eXRoaW5nIHdvcmtzIGp1c3QgYXMgZGVzY3JpYmVkIGluIHRoZSBZb2N0bw0KPiA+IGRvY3VtZW50
YXRpb24uIEFuZCBzaW5jZSB0aGUgT0Ugc2NyaXB0cyBleHBlY3QgVEVNUExBVEVDT05GIHRvIGJl
IHNldA0KPiA+IGFuZCBjb250YWluIHNhbXBsZSBmaWxlcywgdGhhdCBpcyB3aGF0IHdlIGNyZWF0
ZS4NCj4gDQo+IEFjdHVhbGx5IHRoZXkgZG9uJ3QgZXhwZWN0IHRoYXQuIFlvdSBjYW4gc2ltcGx5
IGNyZWF0ZSB0aGUgY29uZmlncw0KPiBkaXJlY3RseSBpbnRvIHRoZSB0YXJnZXQgYnVpbGQgZGly
ZWN0b3J5IGluIHlvdXIgd3JhcHBlciwgYW5kIGRyb3ANCj4gVEVNUExBVEVDT05GIGFsdG9nZXRo
ZXIuIFRoZW4gdGhlIE9FIHNjcmlwdHMgd2lsbCBkZXRlY3QgdGhhdCB0aGUNCj4gY29uZmlncyBh
cmUgYWxyZWFkeSB0aGVyZSBhbmQgd2lsbCBza2lwIHRoZSBzdGVwIG9mIGNvcHlpbmcgdGhlDQo+
IHRlbXBsYXRlcy4NCg0KSG1tLCBvay4gSSB3aWxsIGhhdmUgdG8gbG9vayBpbnRvIHRoYXQuLi4N
Cg0KPiA+IFN1cmUsIHRoYXQgaXMgZmluZS4gQnV0IHRoZSBleHBlY3RhdGlvbiBJIGhhdmUgaXMg
dGhhdCBURU1QTEFURUNPTkYNCj4gPiByZWZlcnMgdG8gdGhlIGRpcmVjdG9yeSB0aGF0IGhhcyB0
aGUgc2FtcGxlIGZpbGVzIG5lZWRlZCB0byBzZXQgdXANCj4gPiB0aGUgYnVpbGQgZW52aXJvbm1l
bnQuIEFuZCB0aGF0IGlzIGl0LiBBcyBsb25nIGFzIHRoZSBzYW1wbGUgZmlsZXMNCj4gPiBleGlz
dCB3aGVyZSBpdCBzYXlzIHRoZXkgc2hvdWxkIGJlLCB3aHkgZG8geW91IG5lZWQgdGhlIHNjcmlw
dHMgdG8NCj4gPiBmYWlsIGJlY2F1c2UgdGhlIGVudmlyb25tZW50IGFyb3VuZCB0aGUgZGlyZWN0
b3J5IGRvZXMgbm90IGxvb2sNCj4gPiBsaWtlIHdoYXQgeW91IGhhcHBlbiB0byBleHBlY3Q/IEl0
IGlzIG9ubHkgdGhlIGNvbnRlbnRzIG9mIHRoZQ0KPiA+IGRpcmVjdG9yeSB0aGF0IG1hdHRlcnMu
IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+IA0KPiBXZSBhcmUgdHJ5aW5nIHRvIG1vdmUg
dG93YXJkcyBzdGFuZGFyZGl6aW5nIGJ1aWxkIGNvbmZpZ3VyYXRpb24NCj4gbWFuYWdlbWVudC4g
T25lIHN0ZXAgdG93YXJkcyB0aGF0IGdvYWwgaXMgdGhhdCBjb25maWcgdGVtcGxhdGVzIG11c3QN
Cj4gbGl2ZSBpbiBtZXRhLXNvbWUtbGF5ZXIvY29uZi90ZW1wbGF0ZXMsIGFuZCBhcmVuJ3Qgc2Nh
dHRlcmVkIGFyb3VuZCwNCj4gb3IgZ2VuZXJhdGVkIG9uIHRoZSBmbHkuIFRoaXMgcnVsZSBvbmx5
IG1ha2VzIHNlbnNlIGlmIHRoZXJlIGlzIHNvbWUNCj4gd2F5IHRvIGVuZm9yY2UgaXQsIHdoaWNo
IGlzIHdoYXQgdGhpcyBjaGFuZ2UgZG9lcy4NCg0KV2VsbCwgd2UgZ2F2ZSB1cCBvbiB0aGUgc3Rh
dGljIHRlbXBsYXRlcyBhbG1vc3QgaW1tZWRpYXRlbHkgYWZ0ZXIgd2UgDQpzdGFydGVkIHVzaW5n
IFlvY3RvIHdoZW4gd2UgcmVhbGl6ZWQgdGhhdCB0aGV5IGRpZCBub3QgZml0IGludG8gb3VyIA0K
aWRlYSBvZiBiZWluZyBhYmxlIHRvIG1peCBsYXllcnMgaW4gZGlmZmVyZW50IGNvbWJpbmF0aW9u
cyBpbiBkaWZmZXJlbnQgDQpidWlsZHMuIFdlIHJlbHkgb24gcmVwbyBmZXRjaGluZyB0aGUgbGF5
ZXJzIHRoYXQgYXJlIHN1cHBvc2VkIHRvIGJlIHBhcnQgDQpvZiB0aGUgYnVpbGQsIGFuZCB0aGVu
IHdlIGdlbmVyYXRlIGEgYmJsYXllcnMuY29uZi5zYW1wbGUgdGhhdCBtYXRjaGVzIA0KdGhlIGZl
dGNoZWQgbGF5ZXJzLg0KDQo+IEFsZXgNCg0KLy9QZXRlcg0KDQo=

