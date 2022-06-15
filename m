Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597A2C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 22:16:29 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.10965.1655331387307453880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 15:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=O1g7wclg;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655331387;
  x=1686867387;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6oNYaaDvQ6vIx1VnyUximyYkWbgUZI4cyJQjgHcuQXE=;
  b=O1g7wclgymeRWvwohMBRv1WIqWeDSJ8KosVgNRpZJGT3y+W+jVnHv+nf
   dtIHRARh+Fv06Xl7OvxlYvBf9kt//19hBQ2diR+s76TqJxmepD6QgWxya
   D5x4lgDSAFdIyTi8rNaeUJFJUCB29Bo8PmYZJ7XvY9s+axqiihogNVy9a
   Fo0k0ecoMXkPbaP6+u2OQwEWSMEa7KkOdDnBS1vzNLuQ0leHvUzTCZa91
   Q4AXpZ5iGYQZMNBc8XZcOHcgklPMXcU5NCxCC+LVup10wtlGLVuOBG/vX
   4LsJzXJDkqzVmC7Tu3z5O/Uy0BP9XvYju0Hrr5R8XnwgoExKCasPoTymL
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paulo Neves <ptsneves@gmail.com>, Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper util.
Thread-Topic: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper
 util.
Thread-Index: AQHYgAEgmvIMChnlb0K8t25B7RTSVK1QKloAgABBbOD///BwAIAArdzQ
Date: Wed, 15 Jun 2022 22:16:24 +0000
Message-ID: <56b00048627840569c7c5fc5ca567443@axis.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
 <20220614151105.1890454-6-ptsneves@gmail.com>
 <282753D0-6BC9-4B2F-B73C-313D10232BF0@arm.com>
 <a166fa72b7434e498cb4ef4f395045e1@axis.com>
 <635fe97c-6a4f-1e8c-35c8-337fbe8e7b38@gmail.com>
In-Reply-To: <635fe97c-6a4f-1e8c-35c8-337fbe8e7b38@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 22:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166995

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsbyBOZXZlcyA8cHRzbmV2
ZXNAZ21haWwuY29tPg0KPiBTZW50OiBkZW4gMTUganVuaSAyMDIyIDE1OjUxDQo+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IFJvc3MgQnVydG9u
DQo+IDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2NSA2Lzdd
IHV0aWxzOiBBZGQgY21kbGluZV9zaGViYW5nX3dyYXBwZXINCj4gdXRpbC4NCj4gDQo+IE9uIDYv
MTUvMjIgMTU6MTEsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiA+PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IE9uIEJlaGFsZiBPZiBSb3NzIEJ1cnRvbg0KPiA+PiBTZW50OiBkZW4gMTUganVuaSAyMDIy
IDEyOjUyDQo+ID4+IFRvOiBwdHNuZXZlc0BnbWFpbC5jb20NCj4gPj4gQ2M6IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggdjUgNi83XSB1dGlsczogQWRkDQo+IGNtZGxpbmVfc2hlYmFuZ193cmFwcGVyDQo+
ID4+IHV0aWwuDQo+ID4+DQo+ID4+IE9uIDE0IEp1biAyMDIyLCBhdCAxNjoxMSwgUGF1bG8gTmV2
ZXMgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gPHB0c25ldmVzPWdtYWlsLmNvbUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPj4+ICtjcmVhdGVfY21kbGluZV9zaGVi
YW5nX3dyYXBwZXIgKCkgew0KPiA+PiBUaGUgaW5kZW50YXRpb24gaW4gdGhpcyBmdW5jdGlvbiBp
cyBhIG1peCBvZiB0YWJzIGFuZCBzcGFjZXMsIHBsZWFzZQ0KPiA+PiB1bmlmeS4NCj4gPj4NCj4g
Pj4+ICsgIGFyZ3VtZW50PSIkKGJhc2VuYW1lICIkKGhlYWQgLW4xICRjbWQgfCBzZWQgLWUgJ3N8
IyFbIF0qfHxnJyAp4oCdKeKAnQ0KPiA+PiBbIF0qIHNlZW1zIG92ZXJseSwgY29tcGxleCwgbm8g
bmVlZCBmb3IgdGhlIGJyYWNrZXRzLiBJ4oCZZCBhbmNob3IgdG8gdGhlDQo+ID4+IGJlZ2lubmlu
ZyBvZiB0aGUgbGluZSwgYW5kIHJlbW92ZSB0aGUgZyBhcyB0aGVyZeKAmXMgb25seSBvbmUgZXhw
ZWN0ZWQuDQo+ID4gVGhpcyBzaG91bGQgd29yazoNCj4gPg0KPiA+IGFyZ3VtZW50PSQoYmFzZW5h
bWUgIiQoc2VkIC1uZSAncy9eIyEgKi8vcDtxJykiICRjbWQpDQo+ID4NCj4gPiBIb3dldmVyLCBp
ZiB0aGUgZmlyc3QgbGluZSBpcyBzb21ldGhpbmcgbGlrZSAiIyEvdXNyL2Jpbi9lbnYgcHl0aG9u
MyIsIHRoZW4NCj4gPiAkYXJndW1lbnQgd2lsbCBiZSAiZW52IHB5dGhvbjMiIGFuZCBzb21laG93
IEkgYXNzdW1lIHRoYXQgaXMgbm90IGV4YWN0bHkNCj4gPiB3aGF0IHRoZSByZXN0IG9mIHRoZSBj
b2RlIGV4cGVjdHMuDQo+IA0KPiBUaGUgdXNlIGNhc2UgaXMgdGhhdCB3aGF0ZXZlciBpcyBpbiBz
aGViYW5nIHNob3VsZCBiZSBleHRyYWN0ZWQgYW5kIHJhbg0KPiB2ZXJiYXRpbSwgc28gdHJ1bmNh
dGluZyBsaWtlIHlvdXIgc3VnZ2VzdGlvbiBjYW4gd29yayBidXQgaGFzIHNsaWdodGx5DQo+IGRp
ZmZlcmVudCBzZW1hbnRpYy4NCg0KVW1tLCBteSBzdWdnZXN0ZWQgbGluZSBhYm92ZSBzaG91bGQg
Z2l2ZSBleGFjdGx5IHRoZSBzYW1lIG91dHB1dCBhcyB5b3VycywgDQpvbmx5IHdpdGggZmV3ZXIg
Y29tbWFuZHMuLi4NCg0KPiA+PiBNaWdodCBhbHNvIGJlIHdpc2UgdG8gYXNzZXJ0IHRoYXQgeW91
IGZvdW5kIHNvbWV0aGluZyBoZXJlLCBzbyBydW5uaW5nDQo+ID4+IHRoaXMgb24gYW4gRUxGIGZh
aWxzIHdpdGggYW4gb2J2aW91cyBlcnJvci4NCj4gPj4NCj4gPj4gUm9zcw0KPiA+IC8vUGV0ZXIN
Cj4gPg0KPiBQYXVsbyBOZXZlcw0KDQovL1BldGVyDQoNCg==

