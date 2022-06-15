Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786B7C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:11:26 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.4539.1655298683537634576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jR1sshDc;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655298684;
  x=1686834684;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LwRbaI9M4AXQ4GxtcsmKcldFPOgdiq7u2uWi4R6LXuw=;
  b=jR1sshDc5H0WkieyMhx/qYXk8gnjsq6j+kRQ4MUg9ztX3nYD4dTLZAGG
   wyQnRhnxDKdFXzqK892AZe9VBeQzyUTM4NGd2B0+AQq5PGzd7f7wwSeOr
   pDZDchmF4NxSDP4TEIWW/wqQcxUqNhuSu/YsI/FixceFyiMzjlbrhZ3hD
   PuxZfLGfY8BzqSMFlUCo6kJ+eGMyt7jtKHsRcy2/LakSHJfqWP1AqJ70E
   Nj5WWJazaREApnvktX45K+QLl/eAdBaUiOn/ZvYm1j7kF7Rtpn0rT5Q/V
   keiQ9Z/+ocJql/0rc6qItYkiLFhCbIqulJhN08Pou7eFFCLIPtboZ6f5B
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <ross.burton@arm.com>, "ptsneves@gmail.com"
	<ptsneves@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper util.
Thread-Topic: [OE-core] [PATCH v5 6/7] utils: Add cmdline_shebang_wrapper
 util.
Thread-Index: AQHYgAEgmvIMChnlb0K8t25B7RTSVK1QKloAgABBbOA=
Date: Wed, 15 Jun 2022 13:11:21 +0000
Message-ID: <a166fa72b7434e498cb4ef4f395045e1@axis.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
 <20220614151105.1890454-6-ptsneves@gmail.com>
 <282753D0-6BC9-4B2F-B73C-313D10232BF0@arm.com>
In-Reply-To: <282753D0-6BC9-4B2F-B73C-313D10232BF0@arm.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:11:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166985

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJvc3MgQnVydG9uDQo+IFNlbnQ6IGRlbiAxNSBqdW5p
IDIwMjIgMTI6NTINCj4gVG86IHB0c25ldmVzQGdtYWlsLmNvbQ0KPiBDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCB2NSA2LzddIHV0aWxzOiBBZGQgY21kbGluZV9zaGViYW5nX3dyYXBwZXINCj4gdXRpbC4N
Cj4gDQo+IE9uIDE0IEp1biAyMDIyLCBhdCAxNjoxMSwgUGF1bG8gTmV2ZXMgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPHB0c25ldmVzPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gPiArY3JlYXRlX2NtZGxpbmVfc2hlYmFuZ193cmFwcGVyICgpIHsNCj4g
DQo+IFRoZSBpbmRlbnRhdGlvbiBpbiB0aGlzIGZ1bmN0aW9uIGlzIGEgbWl4IG9mIHRhYnMgYW5k
IHNwYWNlcywgcGxlYXNlDQo+IHVuaWZ5Lg0KPiANCj4gPiArICBhcmd1bWVudD0iJChiYXNlbmFt
ZSAiJChoZWFkIC1uMSAkY21kIHwgc2VkIC1lICdzfCMhWyBdKnx8ZycgKeKAnSnigJ0NCj4gDQo+
IFsgXSogc2VlbXMgb3Zlcmx5LCBjb21wbGV4LCBubyBuZWVkIGZvciB0aGUgYnJhY2tldHMuIEni
gJlkIGFuY2hvciB0byB0aGUNCj4gYmVnaW5uaW5nIG9mIHRoZSBsaW5lLCBhbmQgcmVtb3ZlIHRo
ZSBnIGFzIHRoZXJl4oCZcyBvbmx5IG9uZSBleHBlY3RlZC4NCg0KVGhpcyBzaG91bGQgd29yazoN
Cg0KYXJndW1lbnQ9JChiYXNlbmFtZSAiJChzZWQgLW5lICdzL14jISAqLy9wO3EnKSIgJGNtZCkN
Cg0KSG93ZXZlciwgaWYgdGhlIGZpcnN0IGxpbmUgaXMgc29tZXRoaW5nIGxpa2UgIiMhL3Vzci9i
aW4vZW52IHB5dGhvbjMiLCB0aGVuIA0KJGFyZ3VtZW50IHdpbGwgYmUgImVudiBweXRob24zIiBh
bmQgc29tZWhvdyBJIGFzc3VtZSB0aGF0IGlzIG5vdCBleGFjdGx5IA0Kd2hhdCB0aGUgcmVzdCBv
ZiB0aGUgY29kZSBleHBlY3RzLg0KDQo+IA0KPiBNaWdodCBhbHNvIGJlIHdpc2UgdG8gYXNzZXJ0
IHRoYXQgeW91IGZvdW5kIHNvbWV0aGluZyBoZXJlLCBzbyBydW5uaW5nDQo+IHRoaXMgb24gYW4g
RUxGIGZhaWxzIHdpdGggYW4gb2J2aW91cyBlcnJvci4NCj4gDQo+IFJvc3MNCg0KLy9QZXRlcg0K
DQo=

